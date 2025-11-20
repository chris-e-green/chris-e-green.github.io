import CodableCSV
import Foundation

/// Public entrypoint for the library to run the decompiler.
/// This mirrors the original CLI behaviour but is exposed as a callable function
/// so the `pdisasm-cli` executable can delegate to it.
public func runPdisasm(filename: String, verbose: Bool = false) throws {
    var names: [Int: Name] = [:]

    var fileURL: URL
    var binaryData: CodeData
    do {
        fileURL = URL(fileURLWithPath: filename)
        binaryData = try CodeData(data: Data(contentsOf: fileURL))
    } catch {
        throw error
    }

    // Read header pieces (first 512 bytes assumed)
    let diskInfo = CodeData(data: binaryData.data.subdata(in: 0..<64))
    let segName = CodeData(data: binaryData.data.subdata(in: 64..<192))
    let segKind = CodeData(data: binaryData.data.subdata(in: 192..<224))
    let textAddr = CodeData(data: binaryData.data.subdata(in: 224..<256))
    let segInfo = CodeData(data: binaryData.data.subdata(in: 256..<288))
    let intrinsSegs = CodeData(data: binaryData.data.subdata(in: 288..<296))
    let comment = CodeData(data: binaryData.data.subdata(in: 433..<512))

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
            if names.contains(where: { $0.key == segNum }) {
                names[segNum]?.segName = name
            } else {
                names[segNum] = Name(segName: name, procNames: [:])
            }
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

    let segDict = SegDictionary(segTable: segTable, intrinsics: intrinsicSet, comment: commentStr)

    var allCodeSegs: [Int: CodeSegment] = [:]
    var allLocations: Set<Location> = []
    var allProcedures: [ProcIdentifier] = []
    var sysProcedures: [ProcIdentifier] = []
    // var sysProceduresOld: [ProcIdentifier] = []
    // var allLabels: [Location: LocInfo] = [:]
    var allLabels: Set<LocationTwo> = []
    var sysLabels: Set<LocationTwo> = []
    var allCallers: Set<Call> = []

    // Try loading name maps (optional files in repo)
    let decoder = JSONDecoder()
    var globalNames: [Int: LocInfo] = [:]
    // var pascalNames: [Int: LocInfo] = [:]
    // var procedureData: Data
    let version = segTable[1]?.version ?? 0
    let fileIdentifier = fileURL.deletingPathExtension().lastPathComponent
    // let allLabelsFile = "allLabels_\(fileIdentifier).json"
    let allLabelsCSVFile = "allLabels_\(fileIdentifier).csv"
    let sysLabelsCSVFile = "sysLabels_\(version).csv"
    // let allProceduresFile = "allProcedures_\(fileIdentifier).json"
    let allProceduresCSVFile = "allProcedures_\(fileIdentifier).csv"
    // let sysProceduresFile = "allProcedures_\(version).json"
    let sysProceduresCSVFile = "sysProcedures_\(version).csv"
    let globalsFile = "globals_\(version).json"

    // if FileManager.default.fileExists(atPath: allLabelsFile) {
    //     if let labelsData = try? Data(contentsOf: URL(fileURLWithPath: allLabelsFile)) {
    //         allLabels = (try? decoder.decode(Set<LocationTwo>.self, from: labelsData)) ?? []
    //     }
    // }

    if #available(macOS 10.15, *) {
        do {
            if FileManager.default.fileExists(atPath: allLabelsCSVFile) {
                let dec = CSVDecoder()
                dec.headerStrategy = .firstLine
                if let labelsData = try? Data(contentsOf: URL(fileURLWithPath: allLabelsCSVFile)) {
                    allLabels = try dec.decode(Set<LocationTwo>.self, from: labelsData)
                }
            }
        } catch {
            print("Error reading \(allLabelsCSVFile): \(error)")
        }

        do {
            if FileManager.default.fileExists(atPath: sysLabelsCSVFile) {
                let dec = CSVDecoder()
                dec.headerStrategy = .firstLine
                if let labelsData = try? Data(contentsOf: URL(fileURLWithPath: sysLabelsCSVFile)) {
                    sysLabels = try dec.decode(Set<LocationTwo>.self, from: labelsData)
                }
            }
        } catch {
            print("Error reading \(sysLabelsCSVFile): \(error)")
        }

        if verbose {
            print(
                "Adding \(sysLabels.count) system labels to label list (current count = \(allLabels.count))"
            )
        }
        allLabels.formUnion(sysLabels)
        if verbose {
            print("Total label count is now \(allLabels.count)")
        }

        do {
            if verbose {
                print(
                    "Reading procedures from \(allProceduresCSVFile) (current count = \(allProcedures.count))"
                )
            }
            if FileManager.default.fileExists(atPath: allProceduresCSVFile) {
                let dec = CSVDecoder()
                dec.headerStrategy = .firstLine
                if let procData = try? Data(contentsOf: URL(fileURLWithPath: allProceduresCSVFile))
                {
                    allProcedures = try dec.decode([ProcIdentifier].self, from: procData)
                }
            }
            if verbose {
                print("Loaded \(allProcedures.count) procedures from \(allProceduresCSVFile)")
            }
        } catch {
            print("Error reading \(allProceduresCSVFile): \(error)")
        }
    }
    // if FileManager.default.fileExists(atPath: allProceduresFile) {
    //     if let procData = try? Data(contentsOf: URL(fileURLWithPath: allProceduresFile)) {
    //         allProcedures = (try? decoder.decode([ProcIdentifier].self, from: procData)) ?? allProcedures
    //     }
    // }

    if FileManager.default.fileExists(atPath: globalsFile) {
        if verbose {
            print("Reading globals from \(globalsFile)")
        }
        if let globalData = try? Data(contentsOf: URL(fileURLWithPath: globalsFile)) {
            globalNames = (try? decoder.decode([Int: LocInfo].self, from: globalData)) ?? [:]
        }
        if verbose {
            print("Loaded \(globalNames.count) global names from \(globalsFile)")
        }
    }

    if FileManager.default.fileExists(atPath: sysProceduresCSVFile) {
        if verbose {
            print("Reading system procedures from \(sysProceduresCSVFile)")
        }
        do {
            let dec = CSVDecoder()
            dec.headerStrategy = .firstLine

            if let procData = try? Data(contentsOf: URL(fileURLWithPath: sysProceduresCSVFile)) {
                sysProcedures = try dec.decode([ProcIdentifier].self, from: procData)
            }
        } catch {
            print("Error reading \(sysProceduresCSVFile): \(error)")
        }
        if verbose {
            print("Loaded \(sysProcedures.count) system procedures from \(sysProceduresCSVFile)")
        }
    }

    if verbose {
        print(
            "Adding \(sysProcedures.count) system procedures to procedure list (current count = \(allProcedures.count))"
        )
    }
    allProcedures.append(contentsOf: sysProcedures)
    if verbose {
        print("Total procedure count is now \(allProcedures.count)")
    }

    // if FileManager.default.fileExists(atPath: "pascal\(fileIdentifier).json") {
    //     if let pascalData = try? Data(contentsOf: URL(fileURLWithPath: "pascal\(fileIdentifier).json")) {
    //         pascalNames = (try? decoder.decode([Int: LocInfo].self, from: pascalData)) ?? [:]
    //     }
    // }
    // if FileManager.default.fileExists(atPath: "procedures\(fileIdentifier).json") {
    //     if let procData = try? Data(contentsOf: URL(fileURLWithPath: "procedures\(fileIdentifier).json")) {
    //         allProcedures = (try? decoder.decode([ProcIdentifier].self, from: procData)) ?? allProcedures
    //     }
    // }

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

        var extraCode: Data = Data()
        if seg.segNum == 0 || seg.segNum == 15 {
            if seg.name == "PASCALSY" {
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
            } else if seg.name == "         " && seg.segNum == 15 {
                continue
            }
        }

        var codeSeg: CodeSegment = CodeSegment(
            procedureDictionary: ProcedureDictionary(
                segmentNumber: Int(code[code.endIndex - 2]),
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
            var procGlobalLocs: Set<Int> = []
            var procBaseLocs: Set<Int> = []
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
            if addr >= 0 && addr < inCode.count { procNumber = Int(inCode[addr]) }

            proc.procType = ProcIdentifier(
                isFunction: false, segmentNumber: seg.segNum, segmentName: seg.name,
                procNumber: procNumber)

            if proc.procType?.procNumber == 0 && seg.mType == 7 {
                try? decodeAssemblerProcedure(
                    segmentNumber: seg.segNum, procedureNumber: procIdx + 1, proc: &proc,
                    code: inCode, addr: addr)
            } else {
                decodePascalProcedure(
                    currSeg: seg, proc: &proc, knownNames: &names, code: inCode, addr: addr,
                    callers: &tempCallers, globals: &procGlobalLocs, baseLocs: &procBaseLocs,
                    allLocations: &allLocations, allProcedures: &allProcedures,
                    allLabels: &allLabels)
            }

            codeSeg.procedures.append(proc)
            allCallers.formUnion(tempCallers)
        }

        allCodeSegs[Int(seg.segNum)] = codeSeg
    }

    // build allLabels from global names
    allLocations.filter({ $0.segment == 0 && $0.lexLevel == -1 }).forEach({ loc in
        if let addr = loc.addr {
            allLabels.insert(
                LocationTwo(
                    segment: 0, lexLevel: -1, addr: addr, name: globalNames[addr]?.name ?? "",
                    type: globalNames[addr]?.type ?? ""))
        }
    })

    // Output results using the existing helper
    outputResults(
        sourceFilename: fileIdentifier, segDictionary: segDict, knownNames: names,
        codeSegs: allCodeSegs, allLocations: allLocations, allLabels: allLabels,
        allProcedures: allProcedures, allCallers: allCallers)

    // write out allLabels and allProcedures
    // do {
    //     // create backup first
    //     let backupURL = URL(fileURLWithPath: allLabelsFile + ".bak")
    //     if FileManager.default.fileExists(atPath: backupURL.path) {
    //         try? FileManager.default.removeItem(at: backupURL)
    //     }
    //     if FileManager.default.fileExists(atPath: allLabelsFile) {
    //         try FileManager.default.copyItem(at: URL(fileURLWithPath: allLabelsFile), to: backupURL)
    //     }
    //     let enc = JSONEncoder()
    //     enc.outputFormatting = .prettyPrinted
    //     let data = try enc.encode(allLabels)
    //     let url = URL(fileURLWithPath: allLabelsFile)
    //     try data.write(to: url)
    // } catch {
    //     print("Error writing \(allLabelsFile): \(error)")
    // }
    if #available(macOS 10.15, *) {
        do {
            // create backup first
            let backupURL = URL(fileURLWithPath: allLabelsCSVFile + ".bak")
            if FileManager.default.fileExists(atPath: backupURL.path) {
                try? FileManager.default.removeItem(at: backupURL)
            }
            if FileManager.default.fileExists(atPath: allLabelsCSVFile) {
                try FileManager.default.copyItem(
                    at: URL(fileURLWithPath: allLabelsCSVFile), to: backupURL)
            }
            let url = URL(fileURLWithPath: allLabelsCSVFile)
            let enc = CSVEncoder {
                $0.headers = ["segment", "procedure", "lexLevel", "addr", "name", "type"]
                $0.bufferingStrategy = .sequential
            }
            try enc.encode(allLabels.filter{ $0.segment != 0 }.sorted { $0 < $1 }, into: url)
        } catch {
            print("Error writing \(allLabelsCSVFile): \(error)")
        }

        do {
            // create backup first
            let backupURL = URL(fileURLWithPath: sysLabelsCSVFile + ".bak")
            if FileManager.default.fileExists(atPath: backupURL.path) {
                try? FileManager.default.removeItem(at: backupURL)
            }
            if FileManager.default.fileExists(atPath: sysLabelsCSVFile) {
                try FileManager.default.copyItem(
                    at: URL(fileURLWithPath: sysLabelsCSVFile), to: backupURL)
            }
            let url = URL(fileURLWithPath: sysLabelsCSVFile)
            let enc = CSVEncoder {
                $0.headers = ["segment", "procedure", "lexLevel", "addr", "name", "type"]
                $0.bufferingStrategy = .sequential
            }
            try enc.encode(allLabels.filter{ $0.segment == 0 }.sorted { $0 < $1 }, into: url)
        } catch {
            print("Error writing \(sysLabelsCSVFile): \(error)")
        }

        do {
            let backupURL = URL(fileURLWithPath: allProceduresCSVFile + ".bak")
            if FileManager.default.fileExists(atPath: backupURL.path) {
                try? FileManager.default.removeItem(at: backupURL)
            }
            if FileManager.default.fileExists(atPath: allProceduresCSVFile) {
                try FileManager.default.copyItem(
                    at: URL(fileURLWithPath: allProceduresCSVFile), to: backupURL)
            }
            let url = URL(fileURLWithPath: allProceduresCSVFile)
            let enc = CSVEncoder { configuration in
                configuration.headers = [
                    "segmentNumber", "segmentName", "procNumber", "procName", "isFunction",
                    "isAssembly", "parameters", "returnType",
                ]
            }
            // only write non-system procedures
            try enc.encode(allProcedures.filter { $0.segmentNumber != 0 }, into: url)
        } catch {
            print("Error writing \(allProceduresCSVFile): \(error)")
        }
    }

    do {
        let backupURL = URL(fileURLWithPath: sysProceduresCSVFile + ".bak")
        if FileManager.default.fileExists(atPath: backupURL.path) {
            try? FileManager.default.removeItem(at: backupURL)
        }
        if FileManager.default.fileExists(atPath: sysProceduresCSVFile) {
            try FileManager.default.copyItem(
                at: URL(fileURLWithPath: sysProceduresCSVFile), to: backupURL)
        }
        let url = URL(fileURLWithPath: sysProceduresCSVFile)
        let enc = CSVEncoder { configuration in
            configuration.headers = [
                "segmentNumber", "segmentName", "procNumber", "procName", "isFunction",
                "isAssembly", "parameters", "returnType",
            ]

        }
        // only write system procedures
        try enc.encode(allProcedures.filter { $0.segmentNumber == 0 }, into: url)
    } catch {
        print("Error writing \(sysProceduresCSVFile): \(error)")
    }

    // do {
    //     // create backup first
    //     let backupURL = URL(fileURLWithPath: allProceduresFile + ".bak")
    //     if FileManager.default.fileExists(atPath: allProceduresFile) {
    //         try? FileManager.default.removeItem(at: backupURL)
    //     }
    //     if FileManager.default.fileExists(atPath: allProceduresFile) {
    //         try FileManager.default.copyItem(at: URL(fileURLWithPath: allProceduresFile), to: backupURL)
    //     }
    //     let enc = JSONEncoder()
    //     enc.outputFormatting = [.prettyPrinted, .sortedKeys]

    //     let data = try enc.encode(allProcedures.filter { $0.segmentNumber != 0 })
    //     let url = URL(fileURLWithPath: allProceduresFile)
    //     try data.write(to: url)
    // } catch {
    //     print("Error writing \(allProceduresFile): \(error)")
    // }
}
