import Foundation

func prettyStack(_ s: [String]) -> String { "[" + s.joined(separator: ", ") + "]" }

func outputResults(
    sourceFilename: String,
    segDictionary: SegDictionary,
    codeSegs: [Int: CodeSegment],
    allLocations: Set<Location>,
    // allLabels: Set<Location>,
    allProcedures: [ProcIdentifier],
    allCallers: Set<Call>
) {
    print("# ", sourceFilename, "\n")

    // for the moment, print it out to validate it.
    print(segDictionary)

    print("## Globals\n")

    allLocations.filter({ $0.lexLevel == -1 && $0.segment == 0 }).sorted().forEach({ loc in
        print("G\(loc.addr ?? -1)=\(loc.description)")
        // if let gName = allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr }) {
        //     print("G\(loc.addr ?? -1)=\(gName)")
        // } else {
        //     print("G\(loc.addr ?? -1)=\(loc.description)")
        // }
    })
    print()

    for (s, codeSeg) in codeSegs.sorted(by: { $0.key < $1.key }) {
        segDictionary.segTable.first(where: { $0.value.segNum == s }).map { print($0.value) }
        let segName = segDictionary.segTable.first(where: { $0.value.segNum == s })?.value.name ?? "Unknown"
        print("## Segment \(segName) (\(s))\n")
        if codeSeg.procedures.count > 0 {
            for proc in codeSeg.procedures {
                // print proc/func header and procedure attributes
                let procDesc = allProcedures.first(where: {
                    $0.segment == s && $0.procedure == proc.procType?.procedure
                })
                print(
                    "### " + (procDesc?.description ?? proc.procType?.description ?? "")
                        + " (* P=\(proc.procType?.procedure ?? -99), LL=\(proc.lexicalLevel), D=\(proc.dataSize) *)"
                )

                // print callers
                var callerNames: [String] = []
                allCallers.filter(
                    { $0.target.procedure == proc.procType?.procedure && $0.target.segment == s }
                ).forEach(
                    { callerEntry in
                        if let callerName = allProcedures.first(where: {
                            $0.segment == callerEntry.origin.segment
                                && $0.procedure == callerEntry.origin.procedure
                        }) {
                            callerNames.append(callerName.shortDescription)
                        }
                    }
                )
                if !callerNames.isEmpty {
                    print("Callers: \(callerNames.joined(separator: ", "))")
                }

                print("```")

                // print variables declared in this procedure
                allLocations.filter({
                    $0.procedure == proc.procType?.procedure && $0.segment == s && $0.addr != nil
                }).sorted().forEach({ loc in
                    // if let pName: Location = allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr }) {
                        print("L\(loc.addr ?? -1)=\(loc.description)")
                    // } else {
                        // print("L\(loc.addr ?? -1)=\(loc.description)")
                    }
                )
                print("```")

                // Variable listing is generated from `allLocations` and `allLabels`.
                if proc.procType?.isAssembly == false {
                    print("```pascal")
                    print("BEGIN")
                } else {
                    print("```assembly")
                    print("; ASSEMBLER PROCEDURE")
                }

                var indentLevel: Int = 1

                for (address, inst) in proc.instructions.sorted(by: { $0.key < $1.key }) {
                    // if let pseudo = inst.prePseudoCode {
                    //     print("\n  \(pseudo)\n")
                    // }
                    for pseudo in inst.prePseudoCode {
                        if pseudo.code.starts(with: "END") || pseudo.code.starts(with: "UNTIL") {
                            indentLevel -= 1
                        }
                        let indent = String(repeating: " ", count: indentLevel * 2)
                        print("\(indent)\(pseudo.code)")
                        if pseudo.code.hasSuffix("BEGIN") || pseudo.code.starts(with: "REPEAT") {
                            indentLevel += 1
                        }
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
                            // if let label = allLocations.first(where: { $0.segment == n.segment && $0.procedure == n.procedure && $0.addr == n.addr }) {
                                print(" \(n.name)", terminator: "")
                            // } else {
                            //     print(" \(n.description)", terminator: "")
                            // }
                        }
                        if let d = inst.destination {
                            if let dest = allProcedures.first(where: {
                                $0.segment == d.segment && $0.procedure == d.procedure
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
                        if pseudo.code.starts(with: "END") || pseudo.code.starts(with: "UNTIL") {
                            indentLevel -= 1
                        }
                        print()
                        print(String(repeating: " ", count: indentLevel * 2) + pseudo.code)
                        print()
                        if pseudo.code.hasSuffix("BEGIN") || pseudo.code.starts(with: "REPEAT") {
                            indentLevel += 1
                        }

                    }
                }
                print("END")
                print("```")
                print()

            }
        }
    }
}
