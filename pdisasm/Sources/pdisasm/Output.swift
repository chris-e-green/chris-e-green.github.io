import Foundation

func prettyStack(_ s: [String]) -> String { "[" + s.joined(separator: ", ") + "]" }

func outputResults(
    sourceFilename: String,
    segDictionary: SegDictionary,
    // globals: Set<Int>,
    knownNames: [Int: Name],
    codeSegs: [Int: CodeSegment],
    allLocations: Set<Location>,
    // allLabels: [Location: LocInfo],
    allLabels: Set<LocationTwo>,
    allProcedures: [ProcIdentifier],
    allCallers: Set<Call>
) {
    print("# ", sourceFilename, "\n")

    // for the moment, print it out to validate it.
    print(segDictionary)

    print("## Globals\n")

    allLocations.filter({ $0.lexLevel == -1 && $0.segment == 0 }).sorted().forEach({ loc in
        if let gName = allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr }) {
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
                let procDesc = allProcedures.first(where: {
                    $0.segmentNumber == s && $0.procNumber == proc.procType?.procNumber
                })
                print(
                    "### " + (procDesc?.description ?? proc.procType?.description ?? "")
                        + " (* P=\(proc.procType?.procNumber ?? -99), LL=\(proc.lexicalLevel), D=\(proc.dataSize) *)"
                )

                // print callers
                var callerNames: [String] = []
                allCallers.filter(
                    { $0.target.procedure == proc.procType?.procNumber && $0.target.segment == s }
                ).forEach(
                    { callerEntry in
                        if let callerName = allProcedures.first(where: {
                            $0.segmentNumber == callerEntry.origin.segment
                                && $0.procNumber == callerEntry.origin.procedure
                        }) {
                            callerNames.append(callerName.shortDescription)
                        }
                    }
                )
                if !callerNames.isEmpty {
                    print("Callers: \(callerNames.joined(separator: ", "))")
                }

                print("```")
                allLocations.filter({
                    $0.procedure == proc.procType?.procNumber && $0.segment == s && $0.addr != nil
                }).sorted().forEach({ loc in
                    if let pName = allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr }) {
                        print("L\(loc.addr ?? -1)=\(pName.name)")
                    } else {
                        print("L\(loc.addr ?? -1)=\(loc.description)")
                    }
                })
                print("```")

                // Variable listing is generated from `allLocations` and `allLabels`.
                if proc.procType?.isAssembly == false {
                    print("```pascal")
                    print("BEGIN")
                } else {
                    print("```assembly")
                    print("; ASSEMBLER PROCEDURE")
                }

                for (address, inst) in proc.instructions.sorted(by: { $0.key < $1.key }) {
                    if let pseudo = inst.prePseudoCode {
                        print("\n  \(pseudo)\n")
                    }

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
                            if let label = allLabels.first(where: { $0.segment == n.segment && $0.procedure == n.procedure && $0.addr == n.addr }) {
                                print(" \(label.name)", terminator: "")
                            } else {
                                print(" \(n.description)", terminator: "")
                            }
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
                        print(" " + prettyStack(inst.stackState))
                    } else {
                        print(inst.mnemonic)
                    }
                    if let pseudo = inst.pseudoCode {
                        print("\n  \(pseudo)\n")
                    }
                }
                print("END")
                print("```")
                print()

            }
        }
    }
}
