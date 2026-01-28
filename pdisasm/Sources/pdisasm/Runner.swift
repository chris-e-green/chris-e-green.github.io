import CodableCSV
import Foundation

private func importLabels(
    fromCSV CSVFile: String, to labels: inout Set<Location>, metadataPrefix: String
) {
    do {
        if let fileURL = URL(string: metadataPrefix)?.appendingPathComponent(CSVFile) {
            if FileManager.default.fileExists(atPath: fileURL.path) {
                let dec = CSVDecoder()
                dec.headerStrategy = .firstLine
                if let labelsData = try? Data(contentsOf: URL(fileURLWithPath: fileURL.path)) {
                    labels = try dec.decode(Set<Location>.self, from: labelsData)
                }
            }
        }
    } catch {
        print("Error reading \(CSVFile): \(error)")
    }
}

private func exportLabels(
    toCSV CSVfile: String, from labels: [Location], overwrite: Bool = false, metadataPrefix: String
) {
    do {
        if let fileURL = URL(string: metadataPrefix)?.appendingPathComponent(CSVfile) {

            // check if file exists and overwrite is false
            if !overwrite && FileManager.default.fileExists(atPath: fileURL.path) {
                return
            }
            // create backup first
            let backupURL = fileURL.appendingPathExtension("bak")
            if FileManager.default.fileExists(atPath: backupURL.path) {
                try? FileManager.default.removeItem(at: backupURL)
            }
            if FileManager.default.fileExists(atPath: fileURL.path) {
                try FileManager.default.copyItem(
                    at: fileURL, to: backupURL)
            }
            let url = fileURL
            let enc = CSVEncoder {
                $0.headers = ["segment", "procedure", "lexLevel", "addr", "name", "type"]
                $0.bufferingStrategy = .sequential
            }
            try enc.encode(labels, into: url)
        }
    } catch {
        print("Error writing \(CSVfile): \(error)")
    }
}

private func importProcedures(
    fromCSV CSVFile: String, to allProcedures: inout [ProcIdentifier],
    metadataPrefix: String
) {
    do {
        if let fileURL = URL(string: metadataPrefix)?.appendingPathComponent(CSVFile) {

            if FileManager.default.fileExists(atPath: fileURL.path) {
                let dec = CSVDecoder()
                dec.headerStrategy = .firstLine
                if let procData = try? Data(contentsOf: URL(fileURLWithPath: fileURL.path)) {
                    allProcedures = try dec.decode([ProcIdentifier].self, from: procData)
                }
            }
        }
    } catch {
        print("Error reading \(CSVFile): \(error)")
    }
}

private func exportProcedures(
    toCSV CSVfile: String, from procedures: [ProcIdentifier], overwrite: Bool = false,
    metadataPrefix: String
) {
    do {
        if let fileURL = URL(string: metadataPrefix)?.appendingPathComponent(CSVfile) {

            // check if file exists and overwrite is false
            if !overwrite && FileManager.default.fileExists(atPath: fileURL.path) {
                return
            }

            let backupURL = fileURL.appendingPathExtension("bak")
            if FileManager.default.fileExists(atPath: backupURL.path) {
                try? FileManager.default.removeItem(at: backupURL)
            }
            if FileManager.default.fileExists(atPath: fileURL.path) {
                try FileManager.default.copyItem(at: fileURL, to: backupURL)
            }
            let enc = CSVEncoder { configuration in
                configuration.headers = [
                    "segmentNumber", "segmentName", "procNumber", "procName", "isFunction",
                    "isAssembly", "parameters", "returnType",
                ]
            }
            try enc.encode(procedures, into: fileURL)
        }
    } catch {
        print("Error writing \(CSVfile): \(error)")
    }
}

private func importGlobalLabels(
    fromJson globalsFile: String, to globalNames: inout [Int: Identifier], metadataPrefix: String
) {
    if let fileURL = URL(string: metadataPrefix)?.appendingPathComponent(globalsFile) {

        if FileManager.default.fileExists(atPath: fileURL.path) {

            let decoder = JSONDecoder()

            if let globalData = try? Data(contentsOf: fileURL) {
                globalNames = (try? decoder.decode([Int: Identifier].self, from: globalData)) ?? [:]
            }
        }
    }
}

private func readCodeFileStructure(codeData: CodeData) throws -> SegDictionary {
    // Read header pieces (first 512 bytes assumed)
    let diskInfo = CodeData(data: codeData.data.subdata(in: 0..<64))
    let segName = CodeData(data: codeData.data.subdata(in: 64..<192))
    let segKind = CodeData(data: codeData.data.subdata(in: 192..<224))
    let textAddr = CodeData(data: codeData.data.subdata(in: 224..<256))
    let segInfo = CodeData(data: codeData.data.subdata(in: 256..<288))
    let intrinsSegs = CodeData(data: codeData.data.subdata(in: 288..<296))
    let comment = CodeData(data: codeData.data.subdata(in: 433..<512))

    var segTable: [Int: Segment] = [:]

    // decode Segment Dictionary (per-segment parts)
    for segIdx in 0...15 {
        let codeaddr = Int(try diskInfo.readWord(at: segIdx * 4))
        let codeleng = Int(try diskInfo.readWord(at: segIdx * 4 + 2))
        var name = ""
        for j in 0...7 {
            name.append(String(UnicodeScalar(Int(try segName.readByte(at: segIdx * 8 + j)))!))
        }
        name = name.trimmingCharacters(in: [" "])
        let kind = SegmentKind(rawValue: Int(try segKind.readWord(at: segIdx * 2)))
        var segNum = Int(try segInfo.readByte(at: segIdx * 2))
        if segNum == 0 { segNum = segIdx }
        let mType = Int(try segInfo.readByte(at: segIdx * 2 + 1) & 0x0F)
        let version = Int((try segInfo.readByte(at: segIdx * 2 + 1) & 0xE0) >> 5)
        let text = try textAddr.readWord(at: segIdx * 2)
        if codeleng > 0 {
            segTable[segIdx] = Segment(
                codeaddr: codeaddr, codeleng: codeleng, name: name, segkind: kind ?? .dataseg,
                textaddr: Int(text), segNum: segNum, mType: mType, version: version)
        }
    }

    // intrinsic set
    var intrinsicSet = Set<UInt8>()
    for (i, value) in intrinsSegs.data.enumerated().reversed() {
        for j in 0..<8 {
            if (value >> j) & 1 == 1 {
                intrinsicSet.insert(UInt8(i * 8 + j))
            }
        }
    }

    let commentStr = comment.data.filter { $0 > 0 }.compactMap { UnicodeScalar($0) }.map(
        String.init
    ).joined()

    return SegDictionary(segTable: segTable, intrinsics: intrinsicSet, comment: commentStr)
}

fileprivate func normaliseMemoryLocations(_ proc: Procedure, _ allCallers: Set<Call>) {
proc.instructions.forEach { (_, inst) in
                if let loc = inst.memLocation {
                    // if no procedure is set, but lex level is set to non-system level...
                    if loc.procedure == nil && loc.lexLevel != -1 {  
                        // then we need to find procedure for this location

                        // We want to find the procedure number for the location with
                        // a matching lex level, segment, and address that is in the
                        // calling hierarchy of this procedure, and update the memLocation
                        // to have that procedure number.
                        for caller in allCallers {
                            if caller.target.segment == loc.segment
                                && caller.target.lexLevel == loc.lexLevel
                            {
                                // procForLoc = ProcIdentifier(
                                //     isFunction: false, segmentNumber: caller.target.segment,
                                //     procNumber: caller.target.procedure)
                                inst.memLocation?.procedure = caller.target.procedure
                                break
                            }

                        }
                    }
                }
            }
}

/// Public entrypoint for the library to run the decompiler.
/// This mirrors the original CLI behaviour but is exposed as a callable function
/// so the `pdisasm-cli` executable can delegate to it.
public func runPdisasm(
    filename: String, verbose: Bool = false, rewrite: Bool = false,
    metadataPrefix: String = "/Users/chris/Repos/chris-e-green.github.io/pdisasm/metadata"
)
    throws
{

    var fileURL: URL
    var binaryData: CodeData
    do {
        fileURL = URL(fileURLWithPath: filename)
        binaryData = try CodeData(data: Data(contentsOf: fileURL))
    } catch {
        throw error
    }

    let segDict = try readCodeFileStructure(codeData: binaryData)

    var allCodeSegs: [Int: CodeSegment] = [:]
    var allLocations: Set<Location> = []
    var sysLocations: Set<Location> = []
    var allProcedures: [ProcIdentifier] = []
    var sysProcedures: [ProcIdentifier] = []
    var allCallers: Set<Call> = []

    // Try loading name maps (optional files in repo)
    var globalNames: [Int: Identifier] = [:]
    let version = segDict.segTable[1]?.version ?? 0
    let fileIdentifier = fileURL.deletingPathExtension().lastPathComponent
    let allLabelsCSVFile = "labels_\(fileIdentifier).csv"
    let sysLabelsCSVFile = "labels_ver_\(version).csv"
    let allProceduresCSVFile = "procedures_\(fileIdentifier).csv"
    let sysProceduresCSVFile = "procedures_ver_\(version).csv"
    let globalsFile = "globals_ver_\(version).json"

    importLabels(fromCSV: allLabelsCSVFile, to: &allLocations, metadataPrefix: metadataPrefix)
    importLabels(fromCSV: sysLabelsCSVFile, to: &sysLocations, metadataPrefix: metadataPrefix)

    allLocations.formUnion(sysLocations)

    importGlobalLabels(fromJson: globalsFile, to: &globalNames, metadataPrefix: metadataPrefix)

    importProcedures(
        fromCSV: allProceduresCSVFile, to: &allProcedures, metadataPrefix: metadataPrefix)
    importProcedures(
        fromCSV: sysProceduresCSVFile, to: &sysProcedures, metadataPrefix: metadataPrefix)

    allProcedures.append(contentsOf: sysProcedures)

    // For each segment, extract code blocks and decode procedures
    for segment in segDict.segTable.sorted(by: { $0.key < $1.key }) {
        let seg = segment.value
        var offset = 0
        let code = binaryData.getCodeBlock(at: seg.codeaddr, length: seg.codeleng)

        // If the extracted code block is missing or too small to contain the
        // expected trailer bytes, skip this segment to avoid out-of-bounds
        // subscripting on `Data` (which can crash at runtime on some platforms).
        if code.count < 2 {
            if verbose {
                print(
                    "Skipping segment \(seg.name) (segNum=\(seg.segNum)): code block too small (len=\(code.count))"
                )
            }
            continue
        }

        // This applies to the core pascal operating system file (SYSTEM.PASCAL).
        // Segment 0 (the PASCALSYSTEM segment) is actually split between
        // slots 0 and 15 in the segment table. The part that's in slot 15
        // has a name that is eight spaces - so more or less hidden.
        // The runtime loads these parts into memory locations that vary
        // from version to version.
        // The procedure table in slot 0's part contains references to
        // procedures contained in slot 15, stored as negative addresses.
        // (On a 6502, the negative addresses just wrap around to where
        // the runtime has loaded the second part.)
        // We deal with this in our code by determining an offset that we can
        // add to any negative address in the procedure table to turn it
        // into a positive address within the slot 15 part.

        var extraCode: Data = Data()
        // if seg.segNum == 0 || seg.segNum == 15 {
        // slots 0 and 15 may need to be handled differently - IF they are
        // part of the PASCALSY segment.
        if seg.segNum == 0 && seg.name == "PASCALSY" {
            if let extraSeg = segDict.segTable[15] {
                extraCode = binaryData.getCodeBlock(
                    at: extraSeg.codeaddr, length: extraSeg.codeleng)
                let pascalProcCount = Int(code[code.endIndex - 1])
                let lastProcHdrLoc = code.endIndex - 2 - pascalProcCount * 2
                let cdForLast = CodeData(data: code, ipc: 0, header: 0)
                let lastProcRelativeAddr = Int(try cdForLast.readWord(at: lastProcHdrLoc))
                let lastProcAbsAddr = lastProcRelativeAddr - lastProcHdrLoc
                offset = lastProcAbsAddr + extraCode.endIndex - 2
            }
        }
        if seg.segNum == 15 && seg.name == "         " {
            // if we are processing the 'hidden' part of PASCALSY from
            // slot 15, skip it, because we will have processed all of
            // its procedures when we dealt with slot 0.
            continue
        }

        let codeSeg: CodeSegment = CodeSegment(
            procedureDictionary: ProcedureDictionary(
                segment: Int(code[code.endIndex - 2]),
                procedureCount: Int(code[code.endIndex - 1]), procedurePointers: []), procedures: []
        )

        let cdForPtrs = CodeData(data: code, ipc: 0, header: 0)
        for i in 1...codeSeg.procedureDictionary.procedureCount {
            let ptrLoc = code.endIndex - i * 2 - 2
            if let ptr = try? cdForPtrs.getSelfRefPointer(at: ptrLoc) {
                codeSeg.procedureDictionary.procedurePointers.append(ptr)
            } else {
                codeSeg.procedureDictionary.procedurePointers.append(0)
            }
        }

        var tempCallers: Set<Call> = []

        for (procIdx, procPtr) in codeSeg.procedureDictionary.procedurePointers.enumerated() {
            var proc = Procedure()
            var inCode: Data
            var addr = procPtr
            if addr < 0 {
                inCode = extraCode
                addr = addr + offset
            } else {
                inCode = code
            }

            // Basic validation
            let minNeededIndex = addr - 8
            let maxNeededIndex = addr + 1
            if minNeededIndex < 0 || maxNeededIndex >= inCode.count {
                if verbose {
                    print(
                        "Skipping procedure at index \(procIdx + 1): pointer out of range (addr=\(addr), code.len=\(inCode.count))"
                    )
                }
                continue
            }

            var procNumber = 0
            var isAssembler = false
            if addr >= 0 && addr < inCode.count { procNumber = Int(inCode[addr]) }

            // if it's assembler, proc# is based on the index alone.
            if procNumber == 0 && seg.mType == 7 {
                procNumber = procIdx + 1
                isAssembler = true
            }

            // set proc headers for any procedures we already know about
            // this will make it easier to assign their memory locations.
            if let predefinedProc = allProcedures.first(where: {
                $0.segment == seg.segNum && $0.procedure == procNumber
            }) {
                proc.procType = predefinedProc
            }

            // go through the parameters/function return and set the
            // allLabels data for predeclared procedures.
            if let pt = proc.procType {
                // if it's a function, set locations 1 (and 2 for reals) to retval
                if pt.isFunction == true {
                    if let ret = allLocations.first(where: {
                        $0.segment == seg.segNum && $0.procedure == procNumber && $0.addr == 1
                    }) {
                        ret.name = pt.procName ?? pt.shortDescription
                        ret.type = pt.returnType ?? "UNKNOWN"
                        allLocations.update(with: ret)
                    } else {
                        allLocations.insert(
                            Location(
                                segment: seg.segNum, procedure: procNumber, addr: 1,
                                name: pt.procName ?? pt.shortDescription,
                                type: pt.returnType ?? "UNKNOWN"))
                    }
                    if proc.procType?.returnType == "REAL" {
                        if let ret = allLocations.first(where: {
                            $0.segment == seg.segNum && $0.procedure == procNumber && $0.addr == 2
                        }) {
                            ret.name = pt.procName ?? pt.shortDescription
                            ret.type = pt.returnType ?? "REAL"
                            allLocations.update(with: ret)
                        } else {
                            allLocations.insert(
                                Location(
                                    segment: seg.segNum, procedure: procNumber, addr: 2,
                                    name: pt.procName ?? pt.shortDescription,
                                    type: pt.returnType ?? "REAL"))
                        }
                    }
                }
            }

            if isAssembler && seg.mType == 7 {
                try? decodeAssemblerProcedure(
                    segmentNumber: seg.segNum,
                    procedureNumber: procNumber,
                    proc: &proc,
                    code: inCode,
                    addr: addr)
            } else {
                decodePascalProcedure(
                    currSeg: seg,
                    procedureNumber: procNumber,
                    proc: &proc,
                    code: inCode,
                    addr: addr,
                    callers: &tempCallers,
                    allLocations: &allLocations,
                    allProcedures: &allProcedures
                )
            }

            codeSeg.procedures.append(proc)
            allCallers.formUnion(tempCallers)
        }

        allCodeSegs[Int(seg.segNum)] = codeSeg
    }

    // Amend relative memory locations in instructions by lex level (which we 
    // can't do until all procedures are decoded and we know the procedure calling hierarchy)
    for (_, codeSeg) in allCodeSegs {
        for proc in codeSeg.procedures {
            normaliseMemoryLocations(proc, allCallers)
        }
    }

    // Do stack simulation and pseudocode generation 
    // once we have all procedures decoded.
    // This will allow us to have full knowledge of the procedure calling
    // hierarchy before we try to resolve memory locations.
    // As the stack plays a role in control flow, we need to handle them at the same time.
    for (_, codeSeg) in allCodeSegs {
        for proc in codeSeg.procedures {
            if proc.procType?.isAssembly == true {
                // skip assembly procedures
                continue
            }
            simulateStackandGeneratePseudocodeForProcedure(
                proc: proc, allProcedures: &allProcedures, allLocations: &allLocations)
        }
    }

    // Output results using the existing helper
    outputResults(
        sourceFilename: fileIdentifier, segDictionary: segDict,
        codeSegs: allCodeSegs, allLocations: allLocations,  // allLabels: allLabels,
        allProcedures: allProcedures, allCallers: allCallers)

    exportLabels(
        toCSV: allLabelsCSVFile, from: allLocations.filter { $0.segment != 0 }.sorted { $0 < $1 },
        overwrite: rewrite, metadataPrefix: metadataPrefix)
    exportLabels(
        toCSV: sysLabelsCSVFile, from: allLocations.filter { $0.segment == 0 }.sorted { $0 < $1 },
        overwrite: rewrite, metadataPrefix: metadataPrefix)

    exportProcedures(
        toCSV: allProceduresCSVFile, from: allProcedures.filter { $0.segment != 0 },
        overwrite: rewrite, metadataPrefix: metadataPrefix)
    exportProcedures(
        toCSV: sysProceduresCSVFile, from: allProcedures.filter { $0.segment == 0 },
        overwrite: rewrite, metadataPrefix: metadataPrefix)
}
