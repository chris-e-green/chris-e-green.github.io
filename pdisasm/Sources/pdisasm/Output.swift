import Foundation

func prettyStack(_ s: [String]) -> String { "[" + s.joined(separator: ", ") + "]" }

func outputResults(
    sourceFilename: String,
    segDictionary: SegDictionary,
    codeSegs: [Int: CodeSegment],
    allLocations: Set<Location>,
    allProcedures: [ProcIdentifier],
    allCallers: Set<Call>,
    verbose: Bool = false,
    showMarkup: Bool = true,
    showPCode: Bool = true,
    showPseudoCode: Bool = true
) {
    if showMarkup {
        print("# ", sourceFilename, "\n")
        print(segDictionary)

        print("## Globals\n")
    }


    allLocations.filter({ $0.lexLevel == -1 && $0.segment == 0 }).sorted().forEach({ loc in
        print("G\(loc.addr ?? -1)=\(loc.description)")
    })
    print()

    for (s, codeSeg) in codeSegs.sorted(by: { $0.key < $1.key }) {
        if verbose {
            segDictionary.segTable.first(where: { $0.value.segNum == s }).map { print($0.value) }
        }
        if showMarkup {
            let segName = segDictionary.segTable.first(where: { $0.value.segNum == s })?.value.name ?? "Unknown"
            print("## Segment \(segName) (\(s))\n")
        }
        
        if codeSeg.procedures.count > 0 {
            for proc in codeSeg.procedures {
                // print proc/func header and procedure attributes
                let procDesc = allProcedures.first(where: {
                    $0.segment == s && $0.procedure == proc.procType?.procedure
                })
                print(
                    "### " + (procDesc?.description ?? proc.procType?.description ?? "")
                    + " (* P=\(proc.procType?.procedure ?? -99), LL=\(proc.lexicalLevel), D=\(proc.dataSize) PAR=\(proc.parameterSize) *)"
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

                if showMarkup {
                    print("```")
                }

                // print variables declared in this procedure
                allLocations.filter({
                    $0.procedure == proc.procType?.procedure && $0.segment == s && $0.addr != nil
                }).sorted().forEach({ loc in
                    print("L\(loc.addr ?? -1)=\(loc.description)")
                })
                
                if showMarkup {
                    print("```")
                }

                // Variable listing is generated from `allLocations` and `allLabels`.
                if proc.procType?.isAssembly == false {
                    if showMarkup {
                        print("```pascal")
                    }
                    if showPseudoCode {
                        print("BEGIN")
                    }
                } else {
                    if showMarkup {
                        print("```assembly")
                    }
                    print("; ASSEMBLER PROCEDURE")
                }

                var indentLevel: Int = 1

                for (address, inst) in proc.instructions.sorted(by: { $0.key < $1.key }) {
                    if showPseudoCode {
                        for pseudo in inst.prePseudoCode.reversed() {
                            if pseudo.starts(with: "END") || pseudo.starts(with: "UNTIL") {
                                indentLevel -= 1
                            }
                            let indent = String(repeating: " ", count: indentLevel * 2)
                            print("\(indent)\(pseudo)")
                            if pseudo.hasSuffix("BEGIN") || pseudo.starts(with: "REPEAT") {
                                indentLevel += 1
                            }
                        }
                    }

                    
                    if showPCode || proc.procType?.isAssembly == true {
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
                            // TODO: need to deal with long parameter lists so that they wrap
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
                                print(" \(n.name)", terminator: "")
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
                            print(" " + prettyStack(inst.stackState ?? []))
                        } else {
                            print(inst.mnemonic)
                        }
                    }
                    if showPseudoCode {
                        if let pseudo = inst.pseudoCode {
                            if pseudo.starts(with: "END") || pseudo.starts(with: "UNTIL") {
                                indentLevel -= 1
                            }
//                            print()
                            print(String(repeating: " ", count: indentLevel * 2) + pseudo)
//                            print()
                            if pseudo.hasSuffix("BEGIN") || pseudo.starts(with: "REPEAT") {
                                indentLevel += 1
                            }
                        }
                    }
                }
                
                if showPseudoCode {
                    print("END")
                }
                if showMarkup {
                    print("```")
                    print()
                }
            }
        }
    }
}
