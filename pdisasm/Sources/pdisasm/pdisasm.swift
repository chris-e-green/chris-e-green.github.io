import ArgumentParser
import Foundation

@main
struct pdisasm: ParsableCommand {
    @Argument(help: "The file to decompile.")
    var filename: String =
        "/Users/chris/Documents/Legacy OS and Programming Languages/Apple/Pascal_PCode_Interpreters/SYSTEM.COMPILER-04-00.bin"
    @Option(help: "Run with verbose output.")
    var verbose: Bool = false
    mutating func run() throws {
        var names: [Int: Name] = [
            0: Name(
                segName: "PASCALSY",
                procNames: [
                    1: "PASCALSYSTEM", 2: "EXECERROR", 3: "FINIT", 4: "FRESET",
                    5: "FOPEN",
                    6: "FCLOSE", 7: "FGET", 8: "FPUT", 9: "XSEEK", 10: "FEOF",
                    11: "FEOLN",
                    12: "FREADINT", 13: "FWRITEINT", 14: "XREADREAL", 15: "XWRITEREAL",
                    16: "FREADCHAR", 17: "FWRITECHAR", 18: "FREADSTRING",
                    19: "FWRITESTRING", 20: "FWRITEBYTES", 21: "FREADLN",
                    22: "FWRITELN",
                    23: "SCONCAT", 24: "SINSERT", 25: "SCOPY", 26: "SDELETE",
                    27: "SPOS",
                    28: "FBLOCKIO", 29: "FGOTOXY",
                        /* These vary from version to version...
                                    30:"VOLSEARCH", 31:"WRITEDIR",
                                    32:"DIRSEARCH", 33:"SCANTITLE", 34:"DELENTRY", 35:"INSENTRY",
                                    36:"HOMECURSOR", 37:"CLEARSCREEN", 38:"CLEARLINE", 39:"PROMPT",
                                    40:"SPACEWAIT", 41:"GETCHAR", 42:"FETCHDIR", 43:"PARSECMD",
                                    48:"COMMAND", 49:"CANTSTRETCH", 50:"WAITSYSVOL", 51:"PRINTLOCS",
                                    52:"PRINTEXECERR", 53:"PUTPREFIXED", 54:"CHECKDEL", 55:"DOBLOCKIO"
                         */
                ]
            ),
            1: Name(
                segName: "USERPROG",
                procNames: [
                    1: "USERPROGRAM"
                ]
            ),
            /* segment 2 changes from version to version...
                2:Name(
                    segName: "FIOPRIMS",
                    procNames: [
                        1:"PROC1", 2:"FGETSOFTBUF", 3:"PROCESSDLE", 4:"DOENDOFPAGE", 5:"FPUTSOFTBUF"]),
             */
            3: Name(
                segName: "PRINTERR",
                procNames: [1: "PRINTERROR"]
            ),
            /* remaining segments change from version to version as well....
                4:Name(
                    segName: "INITIALI",
                    procNames:[
                        1:"INITIALIZE",
                        2:"INITSYSCOM", 3:"INIT_FILLER",
                        4:"SETPREFIXEDCRTCTL", 5:"SETPREFIXEDCRTINFO", 6:"INITUNITABLE",
                        7:"INIT_ENTRY", 8:"INITHEAP", 9:"INITWORKFILE", 10:"TRY_OPEN",
                        11:"INITFILES"
                    ]),
                5:Name(
                    segName: "GETCMD",
                    procNames: [
                        1:"GETCMD",
                        2:"RUNWORKFILE", 3:"SYS_ASSOCIATE", 4:"YESORNO",
                        5:"GETSEGNUM", 6:"MISSINGFILE", 7:"FUNC7", 8:"PROC8",9:"PROC9",
                        10:"LOADUSERSEGS", 11:"FINDSEGSOFKIND", 12:"LOADINTRINSICS",
                        13:"ASSOCIATE", 14:"STARTCOMPILE", 15:"DELETELEADINGSPACES",
                        16:"FINISHCOMPILE", 17:"EXECERROR", 18: "PROC18", 19:"EXECUTE",
                        20:"SWAPPING", 21:"MAKEEXEC"
                    ]),
                6:Name(
                    segName: "FILEPROC",
                    procNames: [
                        1:"FILEPROC",
                        2:"RESETER", 3:"FRESET", 4:"FOPEN", 5:"ENTERTEMP",
                        6:"PROC6", 7:"FCLOSE", 8:"PARSECMD"
                    ]),
             */
        ]
        var fileURL: URL
        var binaryData: Data
        var diskInfo: Data
        var segName: Data
        var segKind: Data
        var textAddr: Data
        var segInfo: Data
        var intrinsSegs: Data
        var comment: Data
        do {
            fileURL = URL(fileURLWithPath: filename)
            binaryData = try Data(contentsOf: fileURL)
            diskInfo = binaryData.subdata(in: 0..<64)
            segName = binaryData.subdata(in: 64..<192)
            segKind = binaryData.subdata(in: 192..<224)
            textAddr = binaryData.subdata(in: 224..<256)
            segInfo = binaryData.subdata(in: 256..<288)
            intrinsSegs = binaryData.subdata(in: 288..<296)
            comment = binaryData.subdata(in: 433..<512)
        } catch {
            fatalError("Error reading binary file: \(error.localizedDescription)")
        }

        var segTable: [Int: Segment] = [:]

        // decode Segment Dictionary
        // first, decode the per-segment parts
        for i in 0...15 {
            let codeaddr = diskInfo.readWord(at: i * 4)
            let codeleng = diskInfo.readWord(at: i * 4 + 2)
            var name = ""
            for j in 0...7 {
                name.append(String(UnicodeScalar(Int(segName[i * 8 + j]))!))
            }
            name = name.trimmingCharacters(in: [" "])
            let kind = SegmentKind(rawValue: segKind.readWord(at: i * 2))
            var segNum = Int(segInfo[i * 2])
            if segNum == 0 { segNum = i }  // early versions didn't have a segnum in the seg dictionary
            let mType = Int(segInfo[i * 2 + 1] & 0x0F)
            let version = Int((segInfo[i * 2 + 1] & 0xE0) >> 5)
            let text = textAddr.readWord(at: i * 2)
            if codeleng > 0 {
                segTable[i] = Segment(
                    codeaddr: codeaddr,
                    codeleng: codeleng,
                    name: name,
                    segkind: kind ?? .dataseg,
                    textaddr: text,
                    segNum: segNum,
                    mType: mType,
                    version: version
                )
                if names.contains(where: { $0.key == segNum }) {
                    names[segNum]?.segName = name
                } else {
                    names[segNum] = Name(segName: name, procNames: [:])
                }
            }
        }

        // then decode the per-dictionary parts - the intrinsic set...
        var intrinsicSet = Set<UInt8>()
        for (i, value) in intrinsSegs.enumerated().reversed() {
            for j in 0..<8 {
                if (value >> j) & 1 == 1 {
                    intrinsicSet.insert(UInt8(i * 8 + j))
                }
            }
        }

        // ... and the comment string.
        let commentStr =
            comment
            .filter { $0 > 0 }
            .compactMap { UnicodeScalar($0) }
            .map(String.init)
            .joined()

        // ... and put it all together into a segDict object.
        let segDict = SegDictionary(
            segTable: segTable,
            intrinsics: intrinsicSet,
            comment: commentStr
        )

        // var allBaseLocs: Set<Int> = []

        // var allGlobalLocs: Set<Int> = []

        var allCodeSegs: [Int: CodeSegment] = [:]

        var allLocations: Set<Location> = []

        var allProcedures: [ProcIdentifier] = []

        var allLabels: [Location: LocInfo] = [:]

        // maps a destination location to a set of caller locations 
        var allCallers: Set<Call> = []

        // for each segment (sorted by segment number), extract the code block from the file
        // if it's the PASCALSYSTEM segment, load the hidden half of the segment too.

        for segment in segDict.segTable.sorted(by: { $0.key < $1.key }) {
            let seg = segment.value
            var offset = 0
            let code = binaryData.getCodeBlock(
                at: seg.codeaddr,
                length: seg.codeleng
            )

            var extraCode: Data = Data()
            if seg.segNum == 0 || seg.segNum == 15 {
                if verbose { print("checking segNum 0 or segNum 15") }
                if seg.name == "PASCALSY" {
                    if verbose { print("found PASCALSYS") }
                    if let extraSeg = segDict.segTable[15] {
                        if verbose { print("found extra segment at 15") }
                        extraCode = binaryData.getCodeBlock(
                            at: extraSeg.codeaddr,
                            length: extraSeg.codeleng
                        )
                        // all procedures are listed in the segment dictionary at the end of
                        // the primary (block 1) segment. The last byte is the number of
                        // procedures in PASCALSYS altogether.
                        let pascalProcCount = Int(code[code.endIndex - 1])  // how many procedures in total

                        // code.endIndex -2 is the '0'th procedure entry in the table
                        // subtracting 2 * pascalProcCount gets us to the entry for the last procedure
                        let lastProcHdrLoc = code.endIndex - 2 - pascalProcCount * 2

                        // now we get the relative address from that location
                        let lastProcRelativeAddr = code.readWord(at: lastProcHdrLoc)

                        // and subtract the header location from the relative address
                        let lastProcAbsAddr = lastProcRelativeAddr - lastProcHdrLoc

                        // that address + the 0'th procedure entry location is what we will
                        // need to add to the negative address stored for the procedures in the hidden
                        // segment to get them to match the physical address in the hidden segment
                        // which is NOT the same address that they'll be loaded in memory by the
                        // runtime but that doesn't actually matter because the procedures themselves
                        // are relative-addressed.
                        offset = lastProcAbsAddr + extraCode.endIndex - 2
                    }
                } else if seg.name == "         " && seg.segNum == 15 {
                    if verbose { print("found hidden segment at 15, skipping") }
                    // we have processed the hidden segment already so we don't need to do
                    // anything else with it.
                    continue
                }
            }

            var codeSeg: CodeSegment = CodeSegment(
                procedureDictionary: ProcedureDictionary(
                    segmentNumber: Int(code[code.endIndex - 2]),
                    procedureCount: Int(code[code.endIndex - 1]),
                    procedurePointers: []),
                procedures: []
            )

            for i in 1...codeSeg.procedureDictionary.procedureCount {
                codeSeg.procedureDictionary.procedurePointers.append(
                    code.getSelfRefPointer(at: code.endIndex - i * 2 - 2)
                )
            }
            if verbose {
                print(
                    "found \(codeSeg.procedureDictionary.procedureCount) procedures, segment \(codeSeg.procedureDictionary.segmentNumber)"
                )
                print(codeSeg.procedureDictionary.procedurePointers)
            }

            var segGlobalLocs: Set<Int> = []

            var segBaseLocs: Set<Int> = []

            // var tempCallers: [Location: Set<Location>] = [:]
            var tempCallers: Set <Call> = []

            if verbose { print("processing P-code segment \(seg.segNum)") }

            for (procIdx, procPtr) in codeSeg.procedureDictionary.procedurePointers.enumerated() {
                var proc: Procedure = Procedure()
                var procGlobalLocs: Set<Int> = []
                var procBaseLocs: Set<Int> = []
                var inCode: Data
                var addr = procPtr
                if addr < 0  // contained in the hidden segment
                {
                    inCode = extraCode
                    addr = addr + offset
                } else {
                    inCode = code
                }

                // Validate that the procedure header and surrounding bytes are present
                // decodePascalProcedure reads bytes at addr+1 and at addr-2..addr-8, so ensure
                // those indexes are within bounds for the chosen code block. If not, skip
                // this procedure pointer to avoid crashes on malformed binaries.
                let minNeededIndex = addr - 8
                let maxNeededIndex = addr + 1
                if minNeededIndex < 0 || maxNeededIndex >= inCode.count {
                    if verbose {
                        print("Skipping procedure at index \(procIdx + 1): pointer out of range (addr=\(addr), code.len=\(inCode.count), minNeeded=\(minNeededIndex), maxNeeded=\(maxNeededIndex))")
                    }
                    continue
                }
                // Safely read the procedure number from inCode at addr. If the pointer is
                // out-of-bounds, log and fall back to 0 rather than crashing.
                var procNumber = 0
                if addr >= 0 && addr < inCode.count {
                    procNumber = Int(inCode[addr])
                } else {
                    if verbose {
                        print("Warning: procedure pointer out of bounds: seg=\(seg.segNum) ptr=\(procPtr) addr=\(addr) code.len=\(inCode.count) offset=\(offset)")
                    }
                    procNumber = 0
                }

                proc.procType = ProcIdentifier(
                    isFunction: false,
                    segmentNumber: seg.segNum,
                    segmentName: seg.name,
                    procNumber: procNumber
                )
                // proc.procType?.procNumber = Int(inCode[addr])
                if proc.procType?.procNumber == 0 && seg.mType == 7 {
                    if verbose { print("Found assembler procedure \(procIdx + 1)") }
                    decodeAssemblerProcedure(
                        segmentNumber: seg.segNum, procedureNumber: procIdx + 1, proc: &proc, code: inCode, addr: addr)
                } else {
                    if verbose { print("Found Pascal procedure \(procIdx + 1)") }
                    decodePascalProcedure(
                        currSeg: seg, proc: &proc, knownNames: &names, code: inCode, addr: addr,
                        callers: &tempCallers, globals: &procGlobalLocs, baseLocs: &procBaseLocs,
                        allLocations: &allLocations, allProcedures: &allProcedures)
                }
                // print("Procedure \(procIdx + 1) processed.")
                // print(tempCallers.sorted(by: { $0.from < $1.from }))

                codeSeg.procedures.append(proc)

                segGlobalLocs.formUnion(procGlobalLocs)
                segBaseLocs.formUnion(procBaseLocs)
            }
            // print("Segment \(seg.segNum) processed.")
            // print(tempCallers.sorted(by: {$0.from < $1.from }))

            allCallers.formUnion(tempCallers)

            // allCallers.merge(tempCallers, uniquingKeysWith: { $0.union($1) })
            // for (dest, callers) in tempCallers {
            //     callers.forEach({ caller in 
            //       let c = allProcedures.first(where: { $0.segmentNumber == caller.segment && $0.procNumber == caller.procedure! })
            //       allCodeSegs[Int(caller.segment)]?.procedures[caller.procedure! - 1].callers.insert(c!)
            //      })
            //     // if allProcedures.contains(where: { $0.procNumber == p.first?.procNumber }) {
            //     //     let procIndex = allProcedures.firstIndex(where: { $0.procNumber == p.first?.procNumber })!
            //     //     allCodeSegs[Int(seg.segNum)]?.procedures[procIndex].callers.formUnion(p)
            //     // }
            // }
            
            // for c in tempCallers {
            //     codeSeg.procedures[c.key - 1].callers = c.value
            // }

            allCodeSegs[Int(seg.segNum)] = codeSeg

            // allBaseLocs.formUnion(segBaseLocs)

            // allGlobalLocs.formUnion(segGlobalLocs)
        }
        // retrieve any pre-configured location names
        let version = segTable[1]?.version ?? 0 
        
        let decoder = JSONDecoder()
        var globalNames: [Int: LocInfo] = [:]
        var globalData: Data
        do {
            globalData = try Data(contentsOf: URL(fileURLWithPath: "globals\(version).json"))
            globalNames = try decoder.decode([Int: LocInfo].self, from: globalData)
        } catch {
            print("Problem reading globals\(version).json, \(error.localizedDescription)")
        }
        // print(globalNames)

        var pascalNames: [Int: LocInfo] = [:]
        var pascalData: Data
        do {
            pascalData = try Data(contentsOf: URL(fileURLWithPath: "pascal\(version).json"))
            pascalNames = try decoder.decode([Int: LocInfo].self, from: pascalData)
        } catch {
            print("Problem reading pascal(version).json, \(error.localizedDescription)")
        }

        var procedureData: Data
        do { 
            procedureData = try Data(contentsOf: URL(fileURLWithPath: "procedures\(version).json"))
            allProcedures = try decoder.decode([ProcIdentifier].self, from: procedureData)
        }
        catch {
            print("Problem reading procedures\(version).json, \(error.localizedDescription)")
        }           

        // ok, we've processed all the segments.
        // we need to post-process the locations we have stored to assign names to them
        allLocations.filter({ $0.segment == 0 && $0.lexLevel == -1 }).forEach({ loc in
            if let addr = loc.addr {
                allLabels[loc] = globalNames[addr]
            }   
        })
        allLocations.filter({ $0.segment == 0 && $0.procedure != nil && $0.addr == nil }).forEach({ loc in
            // a global/pascal procedure
            allLabels[loc] = pascalNames[loc.procedure!]
        })
        pascalNames.forEach({ (key: Int, value: LocInfo) in 
            allProcedures.append(ProcIdentifier(isFunction: false, segmentNumber: 0, segmentName: "PASCALSY", procNumber: key, procName: value.name))
         })

        // allProcedures.filter({ $0.segmentNumber == 0 })
        // .forEach({ proc in
        //     if let pName = pascalNames[proc.procNumber] {
        //         proc.procName = pName.name
        //     }
        // })  

        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        globalData = try encoder.encode(globalNames)
        try globalData.write(to: URL(fileURLWithPath: "globals\(version).json"))
        // print(String(data: globalData, encoding: .utf8)!)
        // pascalData = try encoder.encode(pascalNames)
        // try pascalData.write(to: URL(fileURLWithPath: "pascal\(version).json"))

        procedureData = try encoder.encode(allProcedures)
        try procedureData.write(to: URL(fileURLWithPath: "procedures\(version).json"))

        // now output the results.
        outputResults(
            sourceFilename: fileURL.lastPathComponent, segDictionary: segDict,
            // globals: allGlobalLocs, 
            knownNames: names, codeSegs: allCodeSegs,
            allLocations: allLocations, allLabels: allLabels, allProcedures: allProcedures, allCallers: allCallers)
    }
}
