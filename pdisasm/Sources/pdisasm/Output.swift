func outputResults(
    sourceFilename: String,
    segDictionary: SegDictionary,
    // globals: Set<Int>,
    knownNames: [Int: Name],
    codeSegs: [Int: CodeSegment],
    allLocations: Set<Location>,
    allLabels: [Location: LocInfo],
    allProcedures: [ProcIdentifier],
    allCallers: Set<Call>
) {
    print("# ", sourceFilename, "\n")

    // for the moment, print it out to validate it.
    print(segDictionary)

    print("## Globals\n")

    allLocations.filter({ $0.lexLevel == -1 && $0.segment == 0 }).sorted().forEach({ loc in
        if let gName = allLabels[loc] {
            print("G\(loc.addr ?? -1)=\(gName)")
        } else {
            print("G\(loc.addr ?? -1)=\(loc.description)")
        }
    })
    print()

    for (s, codeSeg) in codeSegs.sorted(by: { $0.key < $1.key }) {
        print("## Segment \(knownNames[Int(s)]?.segName ?? "Unknown") (\(s))\n")
        if codeSeg.procedures.count > 0 {
            for proc in codeSeg.procedures {
                // print proc/func header and procedure attributes
                print(
                    "### " + (proc.procType?.description ?? "")
                        + " (* P=\(proc.procType?.procNumber ?? -99), LL=\(proc.lexicalLevel), D=\(proc.dataSize) *)"
                )

                // print callers
                var callerNames: [String] = []
                allCallers.filter(
                    { $0.to.procedure == proc.procType?.procNumber && $0.to.segment == s }
                ).forEach(
                    { callerEntry in
                        if let callerName = allProcedures.first(where: {
                            $0.segmentNumber == callerEntry.from.segment 
                            && $0.procNumber == callerEntry.from.procedure 
                        }) {
                            callerNames.append(callerName.shortDescription)
                        }
                    }
                )
                if !callerNames.isEmpty {
                    print("Callers: \(callerNames.joined(separator: ", "))")
                }

                print("```")
                allLocations.filter({ $0.procedure == proc.procType?.procNumber && $0.segment == s && $0.addr != nil }).sorted().forEach({ loc in
                    if let pName = allLabels[loc] {
                        print("L\(loc.addr ?? -1)=\(pName)")
                    } else {
                        print("L\(loc.addr ?? -1)=\(loc.description)")
                    }
                })
                print("```")
                if proc.lexicalLevel == -1 {  // PASCALSYS main procedure
                } else if proc.lexicalLevel == 0 {  // top-level procedure
                } else if proc.lexicalLevel > 0 {
                }

                // Variable listing is generated from `allLocations` and `allLabels`.
                if proc.procType?.isAssembly == false {
                    print("```pascal")
                    print("BEGIN")
                } else {
                    print("```assembly")
                    print("; ASSEMBLER PROCEDURE")
                }

                for (address, inst) in proc.instructions.sorted(by: { $0.key < $1.key }) {
                    if proc.entryPoints.contains(address) {
                        print("->", terminator: " ")
                    } else {
                        print("  ", terminator: " ")
                    }
                    print(String(format: "%04x:", address), terminator: " ")
                    if inst.isPascal {
                        print(
                            inst.mnemonic.padding(toLength: 8, withPad: " ", startingAt: 0),
                            terminator: "")
                        var ps = ""
                        for p in inst.params {
                            if p > 0xff {
                                ps += String(format: "%04x ", p)
                            } else {
                                ps += String(format: "%02x ", p)
                            }
                        }
                        print(ps.padding(toLength: 15, withPad: " ", startingAt: 0), terminator: "")
                        if let c = inst.comment {
                            print(" ; \(c)", terminator: "")
                        }
                        if let n = inst.memLocation {
                            print(" \(allLabels[n]?.name ?? n.description)", terminator: "")
                        }
                        if let d = inst.destination {
                            if let dest = allProcedures.first(where: {
                                $0.segmentNumber == d.segment && $0.procNumber == d.procedure
                            }) {
                            print(" \(dest.shortDescription)", terminator: "")
                            } else {
                                print(" \(d.description)", terminator: "")
                            }
                        }
                        print()
                    } else {
                        print(inst.mnemonic)
                    }
                }
                print("END")
                print("```")
                print()
            }
        }
    }
}
