func outputResults(sourceFilename: String, segDictionary: SegDictionary, globals: Set<Int>, knownNames: [Int: Name], codeSegs: [Int: CodeSegment]) {
    print("# ", sourceFilename, "\n")

    // for the moment, print it out to validate it.
    print(segDictionary)

    print("## Globals\n")

    for g in globals.sorted() {
        var gDetails: String?
        if let gn = globalNames[g] {
            gDetails = "\(gn.name):\(gn.type)"
        }
        print("G\(g)=\(gDetails ?? "")")
    }
    print()

    for (s, codeSeg) in codeSegs.sorted(by: { $0.key < $1.key }) {
        print("## Segment \(knownNames[Int(s)]?.segName ?? "Unknown") (\(s))\n")
        if codeSeg.procedures.count > 0 {
            for proc in codeSeg.procedures {
                var relDictionary: [String: String] = [:]
                // print header and procedure annotations
                print(
                    "### " + (proc.header ?? "")
                        + " (* P=\(proc.procedureNumber), LL=\(proc.lexicalLevel), D=\(proc.dataSize)",
                    terminator: ""
                )
                if !proc.callers.isEmpty {
                    var callerNames: [String] = []
                    for procNum in proc.callers {
                        callerNames.append(
                            "\(codeSeg.procedures.first(where: { $0.procedureNumber == procNum })?.name ?? "unknown2")"
                        )
                    }
                    print(", Callers: \(callerNames.joined(separator: ", "))", terminator: "")
                }
                print(" *)")

                // print variables, amending if was a relative procedural reference
                for varName in proc.variables {
                    if varName.hasPrefix("L") {
                        let level = varName.split(separator: "_")[0].split(separator: "L")[0]
                        let memLocation = Int(varName.split(separator: "_")[1])
                        var done = false
                        var callingProcNum = proc.callers.first(where: { $0 != proc.procedureNumber })
                        var callingProc: Procedure?
                        var checked: Set<Int> = []
                        while !done {
                            // look for a procedure that is ...
                            callingProc = codeSeg.procedures.first(where: { 
                                $0.lexicalLevel == Int(level) // in the desired lex level
                                    && $0.procedureNumber == callingProcNum // with a proc# matching the caller's
                                    && $0.procedureNumber != proc.procedureNumber // and where it's not a recursion
                                    && $0.lexicalLevel <= proc.lexicalLevel // and where it's not at a higher lex level
                            })
                            if callingProc != nil {  // if we found a match, stop searching
                                done = true
                            } else {
                                // try to get the parent's caller
                                callingProcNum =
                                    codeSeg.procedures.first(where: {
                                        $0.procedureNumber == callingProcNum
                                            && $0.procedureNumber != proc.procedureNumber
                                            && $0.lexicalLevel <= proc.lexicalLevel
                                            && !checked.contains(callingProcNum!) // don't check it if we've already seen this
                                    })?.callers.first(where: { $0 != proc.procedureNumber })
                                if callingProcNum == nil {  // if we couldn't find a parent, bail
                                    done = true
                                } else {
                                    checked.insert(callingProcNum!)
                                }
                            }
                        }

                        let refStr = "\(callingProc?.name ?? "????????"):MP\(memLocation, default: "???")"
                        relDictionary[varName] = refStr // populate reference dictionary for later use
                        print("  \(refStr)")
                    } else {
                        print("  \(varName)")
                    }
                }

                print("BEGIN")
                for (address, description) in proc.instructions.sorted(by: { $0.key < $1.key }) {
                    if proc.entryPoints.contains(address) {
                        print("->", terminator: " ")
                    } else {
                        print("  ", terminator: " ")
                    }
                    if address == 0x12d0 {
                        print("here")
                    }
                    print(String(format: "%04x:", address), terminator: " ")
                    if description.hasPrefix("CLP ") || description.hasPrefix("CGP ") {
                        if let n = Int(description.split(separator: ".")[1]) {
                            let c = codeSeg.procedures.first(where: { $0.procedureNumber == n })
                            print("\(description.split(separator: ".")[0]).\(c?.name ?? "unknown3")")
                        } else {
                            print(description)
                        }
                        
                    } else if description.hasPrefix("LOD ") || description.hasPrefix("STR ")
                        || description.hasPrefix("LDA ")
                    {
                        let search = #"(L[0-9]_[0-9]{4})"#
                        if let result = description.range(
                            of: search, options: .regularExpression)
                        {
                            let rStr = description[result]
                            print(
                                description.replacingOccurrences(
                                    of: rStr, with: relDictionary[String(rStr)]!))
                        } else {
                            print(description)
                        }
                    } else {
                        print(description)
                    }
                }
                print("END")
                print()
            }
        }
    }
}
