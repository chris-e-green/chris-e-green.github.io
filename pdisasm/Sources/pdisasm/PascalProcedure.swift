import Foundation

// MARK: - Pascal Procedure Decoder
private func handleComparison(
    _ dataType: String,
    _ simulator: inout StackSimulator,
    _ opString: String
) {
    if dataType == "SET" {
        let (_, a) = simulator.popSet()
        let (_, b) = simulator.popSet()
        simulator.push(("\(b) \(opString) \(a)", "BOOLEAN"))
    } else {
        let (a, ta) = simulator.pop()
        if ta != dataType {
            _ = 0
        }
        let (b, tb) = simulator.pop()
        if tb != dataType {
            _ = 0
        }
        simulator.push(("\(b) \(opString) \(a)", "BOOLEAN"))
    }
}

func decodePascalProcedure(
    currSeg: Segment,
    procedureNumber: Int,
    proc: inout Procedure,
    code: Data,
    addr: Int,
    callers: inout Set<Call>,
    allLocations: inout Set<Location>,
    allProcedures: inout [ProcIdentifier],
    verbose: Bool = false
) {
    // Early validation: ensure addr and the procedure header bytes are present
    // Many subsequent reads assume bytes at addr+1 and at addr-2..addr-8. If
    // the buffer is too small or addr is invalid, bail out silently to avoid
    // crashing on malformed data.
    if addr < 0 { return }
    if addr + 1 >= code.count { return }
    if addr - 8 < 0 { return }

    // Create a CodeData view for bounds-checked reads.
    let cd = CodeData(data: code, ipc: 0, header: 0)

    // Read header fields with bounds-checked reads.
    do {
        let lexical = try cd.readByte(at: addr + 1)
        proc.lexicalLevel = Int(lexical)
        if proc.lexicalLevel > 127 { proc.lexicalLevel -= 256 }

        proc.enterIC = try cd.getSelfRefPointer(at: addr - 2)
        proc.exitIC = try cd.getSelfRefPointer(at: addr - 4)
        proc.parameterSize = Int(try cd.readWord(at: addr - 6)) >> 1
        proc.dataSize = Int(try cd.readWord(at: addr - 8)) >> 1
    } catch {
        return
    }

    // Validate computed entry/exit ICs
    if proc.enterIC < 0 || proc.exitIC < 0 || proc.enterIC >= addr
        || proc.exitIC >= addr
        || proc.enterIC >= code.count || proc.exitIC >= code.count
    {
        return
    }

    let segment = currSeg.segNum
    let procedure = procedureNumber
    var isFunction = false

    // by using strings, we can store and manipulate symbolic data rather than just locations/ints
    var ic = proc.enterIC

    var done: Bool = false
    proc.entryPoints.insert(proc.enterIC)
    proc.entryPoints.insert(proc.exitIC)
    let myLoc = Location(
        segment: segment,
        procedure: procedure,
        lexLevel: proc.lexicalLevel
    )

    // Initialize components for clean separation of concerns
    let decoder = OpcodeDecoder(cd: cd)

    // Decode loop: uses new architecture for clean separation of decoding, simulation, and generation
    while ic < addr && !done {
        do {
            let opcode = try cd.readByte(at: ic)

            // Decode the instruction using the new architecture
            var decoded: OpcodeDecoder.DecodedInstruction
            if let cachedDecoded = try? decoder.decode(
                opcode: opcode,
                at: ic,
                currSeg: currSeg,
                segment: segment,
                procedure: procedure,
                proc: proc,
                addr: addr
            ) {
                decoded = cachedDecoded
            } else {
                // Fallback for any decode errors
                if verbose {
                    print(
                        "Decode error at IC \(String(format: "%04x", ic)) in segment \(segment) proc \(procedure)"
                    )
                }
                return
            }

            // Handle comparator opcodes specially
            var finalMnemonic = decoded.mnemonic
            var finalComment = decoded.comment
            var bytesConsumed = decoded.bytesConsumed
            var comparatorDataType: String = ""

            if decoded.requiresComparator {
                let (suffix, prefix, inc, dataType) = decoder.decodeComparator(
                    at: decoded.comparatorOffset
                )
                finalMnemonic += suffix
                comparatorDataType = dataType
                finalComment =
                    prefix
                    + " TOS-1 \(decoded.mnemonic == "EQL" ? "=" : decoded.mnemonic == "GEQ" ? ">=" : decoded.mnemonic == "GRT" ? ">" : decoded.mnemonic == "LEQ" ? "<=" : decoded.mnemonic == "LES" ? "<" : "<>") TOS"
                bytesConsumed = inc + 1
            }

            let memLoc = decoded.memLocation
            let dest = decoded.destination

            switch opcode {
            case sldc0...sldc127:
                ic += bytesConsumed
            case abi:
                ic += bytesConsumed
            case abr:
                ic += bytesConsumed
            case adi:
                ic += bytesConsumed
            case adr:
                ic += bytesConsumed
            case land:
                ic += bytesConsumed
            case dif:
                ic += bytesConsumed
            case dvi:
                ic += bytesConsumed
            case dvr:
                ic += bytesConsumed
            case chk:
                ic += bytesConsumed
            case flo:
                ic += bytesConsumed
            case flt:
                ic += bytesConsumed
            case inn:
                ic += bytesConsumed
            case int:
                ic += bytesConsumed
            case lor:
                ic += bytesConsumed
            case modi:
                ic += bytesConsumed
            case mpi:
                ic += bytesConsumed
            case mpr:
                ic += bytesConsumed
            case ngi:
                ic += bytesConsumed
            case ngr:
                ic += bytesConsumed
            case lnot:
                ic += bytesConsumed
            case srs:
                ic += bytesConsumed
            case sbi:
                ic += bytesConsumed
            case sbr:
                ic += bytesConsumed
            case sgs:
                ic += bytesConsumed
            case sqi:
                ic += bytesConsumed
            case sqr:
                ic += bytesConsumed
            case sto:
                ic += bytesConsumed
            case ixs:
                ic += bytesConsumed
            case uni:
                ic += bytesConsumed
            case lde:
                ic += bytesConsumed
            case csp:
                ic += 2
            case ldcn:
                ic += bytesConsumed
            case adj:
                ic += bytesConsumed
            case fjp:
                ic += bytesConsumed
            case inc:
                ic += bytesConsumed
            case ind:
                ic += bytesConsumed
            case ixa:
                ic += bytesConsumed
            case lao:
                ic += bytesConsumed
            case lsa:
                ic += bytesConsumed
            case lae:
                ic += bytesConsumed
            case mov:
                ic += bytesConsumed
            case ldo:
                ic += bytesConsumed
            case sas:
                ic += bytesConsumed
            case sro:
                ic += bytesConsumed
            case xjp:
                // Case jump
                ic += bytesConsumed
            case rnp:
                // Return from non-base procedure
                let retCount = decoded.params[0]
                isFunction = (retCount > 0)
                ic += bytesConsumed
                done = true
            case cip:
                // Call intermediate procedure
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc =
                    allLocations.first(where: {
                        $0.segment == segment && $0.procedure == procNum
                            && $0.addr == nil
                    })
                    ?? Location(segment: segment, procedure: procNum, addr: nil)
                if procNum != procedure {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                ic += 2
            case eql:
                ic += bytesConsumed
            case geq:
                ic += bytesConsumed
            case grt:
                ic += bytesConsumed
            case lda:
                ic += bytesConsumed
            case ldc:
                // Load multiple-word constant
                // LDC is special: needs manual size calculation due to variable-length word-aligned data
                let count = decoded.params[0]
                var tempIC = ic + 2
                if tempIC % 2 != 0 { tempIC += 1 }  // word aligned data
                // Calculate actual bytes consumed including alignment
                bytesConsumed = 2 + (ic % 2 == 0 ? 0 : 1) + count * 2
                ic += bytesConsumed
            case leq:
                ic += bytesConsumed
            case les:
                ic += bytesConsumed
            case lod:
                ic += bytesConsumed
            case neq:
                ic += bytesConsumed
            case str:
                ic += bytesConsumed
            case ujp:
                ic += bytesConsumed
            case ldp:
                ic += bytesConsumed
            case stp:
                ic += bytesConsumed
            case ldm:
                ic += bytesConsumed
            case stm:
                ic += bytesConsumed
            case ldb:
                ic += bytesConsumed
            case stb:
                ic += bytesConsumed
            case ixp:
                ic += bytesConsumed
            case rbp:
                // Return from base procedure
                let retCount = decoded.params[0]
                isFunction = (retCount > 0)
                ic += bytesConsumed
                done = true
            case cbp:
                // Call base procedure
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc =
                    allLocations.first(where: {
                        $0.segment == segment && $0.procedure == procNum
                            && $0.addr == nil
                    })
                    ?? Location(segment: segment, procedure: procNum, addr: nil)
                if procNum != procedure {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                ic += 2
            case equi:
                ic += bytesConsumed
            case geqi:
                ic += bytesConsumed
            case grti:
                ic += 1
            case lla:
                ic += bytesConsumed
            case ldci:
                ic += bytesConsumed
            case leqi:
                ic += bytesConsumed
            case lesi:
                ic += bytesConsumed
            case ldl:
                ic += bytesConsumed
            case neqi:
                ic += bytesConsumed
            case stl:
                ic += bytesConsumed
            case cxp:
                // Call external procedure
                let seg = Int(try cd.readByte(at: ic + 1))
                let procNum = Int(try cd.readByte(at: ic + 2))
                let loc =
                    allLocations.first(where: {
                        $0.segment == seg && $0.procedure == procNum
                            && $0.addr == nil
                    })
                    ?? Location(segment: seg, procedure: procNum, addr: nil)
                if procNum != procedure || seg != segment {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                ic += 3
            case clp:
                // Call local procedure
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc: Location =
                    allLocations.first(where: {
                        $0.segment == segment && $0.procedure == procNum
                            && $0.addr == nil
                    })
                    ?? Location(segment: segment, procedure: procNum, addr: nil)
                if procNum != procedure {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                ic += 2
            case cgp:
                // Call global procedure
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc =
                    allLocations.first(where: {
                        $0.segment == segment && $0.procedure == procNum
                            && $0.addr == nil
                    })
                    ?? Location(segment: segment, procedure: procNum, addr: nil)
                if procNum != procedure {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                ic += 2
            case lpa:
                ic += bytesConsumed
            case ste:
                ic += bytesConsumed
            case nop:
                ic += bytesConsumed
            case unk1:
                ic += bytesConsumed
            case unk2:
                ic += bytesConsumed
            case bpt:
                ic += bytesConsumed
            case xit:
                isFunction = false  // AFAIK only the PASCALSYSTEM.PASCALSYSTEM procedure ever calls this
                ic += bytesConsumed
                done = true
            case nop2:
                ic += bytesConsumed
            case sldl1...sldl16:
                ic += bytesConsumed
            case sldo1...sldo16:
                ic += bytesConsumed
            case sind0...sind7:
                ic += bytesConsumed
            default:
                // Unexpected opcode — stop decoding
                if decoded.mnemonic.isEmpty {
                    return
                }
                ic += bytesConsumed
            }

            // Build instruction from decoded data (after switch, before applying markers)
            if proc.instructions[ic - bytesConsumed] == nil {
                proc.instructions[ic - bytesConsumed] = Instruction(
                    opcode: opcode,
                    mnemonic: finalMnemonic,
                    params: decoded.params,
                    stringParameter: decoded.stringParameter,
                    comparatorDataType: comparatorDataType,
                    memLocation: memLoc,
                    destination: dest,
                    comment: finalComment
                )
            }
        } catch {
            // Any read error (out of range, EOF) aborts decoding this procedure.
            return
        }
    }

    if proc.procType == nil {
        proc.procType = ProcIdentifier(
            isFunction: isFunction,
            isAssembly: false,
            segment: segment,
            segmentName: currSeg.name,
            procedure: procedure
        )
        if proc.parameterSize > 0 {
            var paramCount = proc.parameterSize
            if proc.procType?.isFunction == true {
                // functions have an extra two words for the return value
                paramCount -= 2
            }
            if paramCount > 0 {
                for parmnum in 1...paramCount {
                    proc.procType?.parameters.append(
                        Identifier(name: "PARAM\(parmnum)", type: "UNKNOWN")
                    )
                }
            }
        }
    }

//    // go through the parameters/function return and update the
//    // labels for locations after processing the procedure.
//    if let pt = proc.procType {
//        // if it's a function, set locations 1 (and 2 for reals) to retval
//        if pt.isFunction == true {
//            if let ret = allLocations.first(where: {
//                $0.segment == segment && $0.procedure == procedure
//                    && $0.addr == 1
//            }) {
//                ret.name = pt.procName ?? pt.shortDescription
//                ret.type = pt.returnType ?? "UNKNOWN"
//                allLocations.update(with: ret)
//            }
//            if proc.procType?.returnType == "REAL" {
//                if let ret = allLocations.first(where: {
//                    $0.segment == segment && $0.procedure == procedure
//                        && $0.addr == 2
//                }) {
//                    ret.name = pt.procName ?? pt.shortDescription
//                    ret.type = pt.returnType ?? "REAL"
//                    allLocations.update(with: ret)
//                }
//            }
//        }
//    }

    if let p = proc.procType {
        if !allProcedures.contains(where: {
            $0.procedure == p.procedure && $0.segment == p.segment
        }) {
            allProcedures.append(p)
        }
    }
}

// MARK: - Stack Simulation and Pseudo-Code Generation
func simulateStackandGeneratePseudocodeForProcedure(
    proc: Procedure,
    allProcedures: inout [ProcIdentifier],
    allLocations: inout Set<Location>
) {
    // by using strings, we can store and manipulate symbolic data rather than just locations/ints
    var flagForEnd: [(Int, Int)] = []
    let indentLevel = 1
    var ujpToSkipSet: Set<Int> = Set<Int>()
    var ujpCaseDest: Set<Int> = Set<Int>()
    var ujpCaseDefaultDest: Set<Int> = Set<Int>()

    proc.entryPoints.insert(proc.enterIC)
    proc.entryPoints.insert(proc.exitIC)

    // Build lookup dictionaries for O(1) access instead of O(n) linear searches
    var procLookup: [String: ProcIdentifier] = [:]
    for p in allProcedures {
        let key = "\(p.segment):\(p.procedure)"
        procLookup[key] = p
    }

    var labelLookup: [String: Location] = [:]
    for label in allLocations {
        let key =
            "\(label.segment):\(label.procedure ?? -1):\(label.addr ?? -1)"
        labelLookup[key] = label
    }

    // Initialize components for clean separation of concerns
    var simulator = StackSimulator()
    let pseudoGen = PseudoCodeGenerator(
        procLookup: procLookup,
        labelLookup: labelLookup
    )

    // Alias for backward compatibility during refactoring
    var currentStack: [String] {
        get { simulator.stack }
        set { simulator.stack = newValue }
    }

    func locStringToKey(_ locString: String) -> Location {
        if locString.contains("_") {
            let sa = locString.split(separator: "_")
            var proc: Int?
            var seg: Int?
            var addr: Int?
            for sai in sa {
                if sai.starts(with: "P") {
                    proc = Int(sai.dropFirst())
                } else if sai.starts(with: "S") {
                    seg = Int(sai.dropFirst())
                } else if sai.starts(with: "A") {
                    addr = Int(sai.dropFirst())
                }
            }
            return Location(segment: seg ?? -1, procedure: proc, addr: addr)
        }
        return Location(segment: -1)
    }

    // Helper to lookup label by Location
    func findLabel(_ loc: Location) -> (String?, String?) {
        let key = "\(loc.segment):\(loc.procedure ?? -1):\(loc.addr ?? -1)"
        if let ll = labelLookup[key] {
            return (ll.dispName, ll.dispType)
        } else {
            return (nil, nil)
        }
    }

    // Helper to lookup label by Location
    func findStackLabel(_ loc: Location) -> (String, String?) {
        let key = "\(loc.segment):\(loc.procedure ?? -1):\(loc.addr ?? -1)"
        if let ll = labelLookup[key] {
            return (ll.dispName, ll.dispType)
        } else {
            return (loc.dispName, loc.dispType)
        }
    }

    let sortedInstructions = proc.instructions.sorted(by: { $0.key < $1.key })
    var flagForLabel: Set<Int> = Set<Int>()

    for idx in sortedInstructions.indices {
        let (address, inst) = sortedInstructions[idx]
        // Process stack effects and build instruction using decoded information
        var pseudoCode: String? = nil  // Set by specific opcodes that generate assignments/control flow

        // Apply stack operations and generate pseudo-code based on mnemonic
        switch inst.opcode {
        case sldc0...sldc127:
            simulator.push((String(inst.opcode), "INTEGER"))
        case abi:
            // Absolute value of integer (TOS)
            let (a, t) = simulator.pop("INTEGER")
            if t != "INTEGER" {
                _ = 0
            }
            simulator.push(("ABI(\(a))", "INTEGER"))
        case abr:
            // Absolute value of real (TOS)
            let (a, _) = simulator.popReal()
            simulator.pushReal("ABR(\(a))")
        case adi:
            // Add integers (TOS + TOS-1)
            let (a, _) = simulator.pop("INTEGER")
            let (b, _) = simulator.pop("INTEGER")
            simulator.push(("\(b) + \(a)", "INTEGER"))
        case adr:
            // Add reals (TOS + TOS-1)
            let (a, _) = simulator.popReal()
            let (b, _) = simulator.popReal()
            simulator.pushReal("\(a) + \(b)")
        case land:
            // Logical AND (TOS & TOS-1)
            let (a, _) = simulator.pop("BOOLEAN")
            let (b, _) = simulator.pop("BOOLEAN")
            simulator.push(("\(b) AND \(a)", "BOOLEAN"))
        case dif:
            // Set difference (TOS-1 AND NOT TOS)
            let (set1Len, set1) = simulator.popSet()
            let (set2Len, set2) = simulator.popSet()
            let maxLen = max(set1Len, set2Len)
            for i in 0..<maxLen {
                simulator.push(("(\(set2) AND NOT \(set1)){\(i)}", "SET"))
            }
            simulator.push(("\(maxLen)", "INTEGER"))
        case dvi:
            // Divide integers (TOS-1 / TOS)
            let (a, _) = simulator.pop("INTEGER")
            let (b, _) = simulator.pop("INTEGER")
            simulator.push(("\(b) / \(a)", "INTEGER"))
        case dvr:
            // Divide reals (TOS-1 / TOS)
            let (a, _) = simulator.popReal()
            let (b, _) = simulator.popReal()
            simulator.pushReal("\(b) / \(a)")
        case chk:
            // Check subrange (TOS-1 <= TOS-2 <= TOS)
            let _ = simulator.pop()
            let _ = simulator.pop()
            let c = simulator.pop()
            simulator.push(c)
        case flo:
            // Float next to TOS (int TOS-1 to real TOS)
            let a = simulator.pop()  // TOS
            let (b, _) = simulator.pop()  // TOS-1
            simulator.push(a)  // put previous TOS back
            simulator.pushReal(b)  // real(TOS-1)->TOS
        case flt:
            // Float TOS (int TOS to real TOS)
            let (a, _) = simulator.pop("INTEGER")
            simulator.pushReal(a)
        case inn:
            // Set membership (TOS-1 in set TOS)
            let (_, set) = simulator.popSet()
            let (chk, _) = simulator.pop()
            simulator.push(("\(chk) IN \(set)", "BOOLEAN"))
        case int:
            // Set intersection (TOS AND TOS-1)
            let (set1Len, set1) = simulator.popSet()
            let (set2Len, set2) = simulator.popSet()
            let maxLen = max(set1Len, set2Len)
            for i in 0..<maxLen {
                simulator.push(("(\(set1) AND \(set2)){\(i)}", "SET"))
            }
            simulator.push(("\(maxLen)", "INTEGER"))
        case lor:
            // Logical OR (TOS | TOS-1)
            let (a, _) = simulator.pop("BOOLEAN")
            let (b, _) = simulator.pop("BOOLEAN")
            simulator.push(("\(b) OR \(a)", "BOOLEAN"))
        case modi:
            // Modulo integers (TOS-1 % TOS)
            let (a, _) = simulator.pop("INTEGER")
            let (b, _) = simulator.pop("INTEGER")
            simulator.push(("\(b) % \(a)", "INTEGER"))
        case mpi:
            // Multiply integers (TOS * TOS-1)
            let (a, _) = simulator.pop("INTEGER")
            let (b, _) = simulator.pop("INTEGER")
            simulator.push(("\(b) * \(a)", "INTEGER"))
        case mpr:
            // Multiply reals (TOS * TOS-1)
            let (a, _) = simulator.popReal()
            let (b, _) = simulator.popReal()
            simulator.pushReal("\(b) * \(a)")
        case ngi:
            // Negate integer
            let (a, _) = simulator.pop("INTEGER")
            simulator.push(("-\(a)", "INTEGER"))
        case ngr:
            // Negate real
            let (a, _) = simulator.popReal()
            simulator.pushReal("-\(a)")
        case lnot:
            // Logical NOT (~TOS)
            let (a, _) = simulator.pop("BOOLEAN")
            simulator.push(("NOT \(a)", "BOOLEAN"))
        case srs:
            // Subrange set [TOS-1..TOS] (creates set on stack)
            let (a, _) = simulator.pop()
            let (b, _) = simulator.pop()
            if let av = Int(a) {
                let wordsRequired = (av + 1) % 16
                for i in 0..<wordsRequired {
                    simulator.push(("(\(b)..\(a)){\(i)}", "SET"))
                }
                simulator.push(("\(wordsRequired)", "INTEGER"))
            } else {
                // fudge... no way to know how big it will be!
                simulator.push(("\(b)..\(a)", "SET"))
                simulator.push(("1", "INTEGER"))
            }
        case sbi:
            // Subtract integers (TOS-1 - TOS)
            let (a, _) = simulator.pop("INTEGER")
            let (b, _) = simulator.pop("INTEGER")
            simulator.push(("\(b) - \(a)", "INTEGER"))
        case sbr:
            // Subtract reals (TOS-1 - TOS)
            let (a, _) = simulator.popReal()
            let (b, _) = simulator.popReal()
            simulator.pushReal("\(b) - \(a)")
        case sgs:
            // Build singleton set [TOS]
            let (a, _) = simulator.pop("INTEGER")
            if let av = Int(a) {
                let wordsRequired = (av + 1) % 16
                for i in 0..<wordsRequired {
                    simulator.push(("(\(a)){\(i)}", "SET"))
                }
                simulator.push(("\(wordsRequired)", "INTEGER"))
            } else {
                simulator.push(("[\(a)]", "SET"))
                simulator.push(("1", "INTEGER"))
            }
        case sqi:
            // Square integer (TOS * TOS)
            let (a, _) = simulator.pop("INTEGER")
            simulator.push(("\(a) * \(a)", "INTEGER"))
        case sqr:
            // Square real (TOS * TOS)
            let (a, _) = simulator.popReal()
            simulator.pushReal("\(a) * \(a)")
        case sto:
            // Store indirect word (TOS into TOS-1)
            pseudoCode = pseudoGen.generateForInstruction(
                inst,
                stack: &simulator,
                loc: nil
            )
        case ixs:
            // Index string array (check 1 <= TOS <= len of str byte ptr TOS-1)
            //
            // The instruction doesn't store anything on the stack.
            // The actual instruction would throw exec error if IXS failed
            _ = simulator.pop()  // discard index
            _ = simulator.pop()  // discard byte ptr offset
            _ = simulator.pop()  // discard byte ptr base
        case uni:
            // Set union (TOS OR TOS-1)
            let (set1Len, set1) = simulator.popSet()
            let (set2Len, set2) = simulator.popSet()
            let maxLen = max(set1Len, set2Len)
            for i in 0..<maxLen {
                simulator.push(("(\(set1) OR \(set2)){\(i)}", "SET"))
            }
            simulator.push(("\(maxLen)", "INTEGER"))
        case lde:
            // Load extended word (pushes value onto stack)
            let seg = inst.params[0]
            let val = inst.params[1]
            simulator.push(("LDE[\(seg):\(val)]", "INTEGER"))
        case csp:
            // Call standard procedure
            let procNum = inst.params[0]
            if let (cspName, parms, ret) = cspProcs[procNum] {
                var callParms: [String] = []
                for p in parms {
                    var parm: String = ""
                    if p.type == "REAL" {
                        (parm, _) = simulator.popReal()
                    } else {
                        (parm, _) = simulator.pop()
                    }
                    callParms.append(parm)
                }
                // If there is a return value, push it onto the stack because it will be used
                // by subsequent instructions.
                if !ret.isEmpty {
                    if ret == "REAL" {
                        simulator.pushReal(
                            "\(cspName)(\(callParms.reversed().joined(separator:", ")))"
                        )
                    } else {
                        simulator.push(
                            (
                                "\(cspName)(\(callParms.reversed().joined(separator:", ")))",
                                ret
                            )
                        )
                    }
                } else {
                    // no return value so just generate pseudo-code
                    pseudoCode =
                        "\(cspName)(\(callParms.reversed().joined(separator:", ")))"

                }
            }
        case ldcn:
            simulator.push(("NIL", "POINTER"))
        case adj:
            // Adjust set to count words (expanding or compressing), discard length and push set data
            let count = inst.params[0]
            let (_, set) = simulator.popSet()
            for i in 0..<count {
                simulator.push(("\(set){\(i)}", "INTEGER"))
            }
            simulator.push(("\(count)", "INTEGER"))
        case fjp:
            // False jump to addr (implements IF, WHILE and the UNTIL part of REPEAT/UNTIL)
            let dest = inst.params[0]
            var (cond, condType) = simulator.pop("BOOLEAN", true)
            if condType != "BOOLEAN" {
                // if it wasn't a boolean, most likely to actually to have been a call to ODD()
                cond = "ODD(\(cond))"
            }
            if dest > address {  // jumping forward so an IF
                if let targetIdx = sortedInstructions.firstIndex(where: {
                    $0.key == dest
                }) {
                    let prevIdx = sortedInstructions.index(before: targetIdx)
                    if prevIdx >= sortedInstructions.startIndex {
                        let prev = sortedInstructions[prevIdx]
                        // check if the previous instruction is an unconditional jump,
                        if prev.value.opcode == ujp {
                            // if it's forward it's likely an IF/ELSE
                            if prev.value.params[0] > prev.key {
                                let elseDest = prev.value.params[0]
                                if let elseEndIdx =
                                    sortedInstructions.firstIndex(where: {
                                        $0.key == elseDest
                                    })
                                {
                                    sortedInstructions[elseEndIdx].value
                                        .prePseudoCode.append(
                                            "END (* ELSE \(cond) *)"
                                        )
                                }
                                pseudoCode = "IF \(cond) THEN BEGIN"
                                sortedInstructions[targetIdx].value
                                    .prePseudoCode.append(
                                        "END ELSE BEGIN"
                                    )
                                ujpToSkipSet.insert(prevIdx)
                            } else {
                                // WHILE
                                pseudoCode = "WHILE \(cond) DO BEGIN"
                                sortedInstructions[targetIdx].value
                                    .prePseudoCode.append(
                                        "END (* WHILE \(cond) *)"
                                    )
                                ujpToSkipSet.insert(prevIdx)
                            }

                        } else {
                            // likely an IF without ELSE
                            sortedInstructions[targetIdx].value.prePseudoCode
                                .append("END (* IF \(cond) *)")
                            flagForEnd.append((dest, indentLevel))
                            pseudoCode = "IF \(cond) THEN BEGIN"
                        }
                    }
                    // } else {
                    //     // likely a WHILE loop
                    //     flagForEnd.append((dest, indentLevel))
                    //     pseudoCode = "IF \(cond) THEN BEGIN"
                }
            } else {  // jumping backwards so a REPEAT/UNTIL
                if let targetIdx = sortedInstructions.firstIndex(where: {
                    $0.key == dest
                }) {
                    sortedInstructions[targetIdx].value.prePseudoCode.append(
                        "REPEAT"
                    )
                    pseudoCode = "UNTIL \(cond)"
                }
            }
            proc.entryPoints.insert(dest)
        case inc:
            // Inc field ptr (TOS+val)
            let val = inst.params[0]
            let (a, _) = simulator.pop()
            simulator.push(("\(a) + \(val)", "POINTER"))
        case ind:
            // Static index and load word (TOS+val)
            let val = inst.params[0]
            let (a, _) = simulator.pop()
            simulator.push(("\(a) + \(val)", "INTEGER"))
        case ixa:
            // Index array (TOS * element size + TOS-1)
            let _ = inst.params[0]  // Element size, used for address calculation but not in pseudo-code
            let (eltIndex, _) = simulator.pop()
            let (arrayBase, _) = simulator.pop()
            simulator.push(("\(arrayBase)[\(eltIndex)]", "POINTER"))
        case lao:
            // Load global address
            if let loc = inst.memLocation {
                simulator.push(findStackLabel(loc))
                allLocations.insert(loc)
            }
        case lsa:
            // Load string address
            // let strLen = inst.params[0]
            let s = inst.stringParameter ?? ""
            simulator.push(("\'\(s)\'", "STRING"))
        case lae:
            // Load extended address
            if let loc = inst.memLocation {
                simulator.push(findStackLabel(loc))
                allLocations.insert(loc)
            }
        case mov:
            // Move words from TOS to TOS-1
            pseudoCode = pseudoGen.generateForInstruction(
                inst,
                stack: &simulator,
                loc: nil
            )
        case ldo:
            // Load global word
            if let loc = inst.memLocation {
                simulator.push(findStackLabel(loc))
                allLocations.insert(loc)
            }
        case sas:
            // String assign
            pseudoCode = pseudoGen.generateForInstruction(
                inst,
                stack: &simulator,
                loc: nil
            )
        case sro:
            // Store global word
            if let loc = inst.memLocation {
                allLocations.insert(loc)
                pseudoCode = pseudoGen.generateForInstruction(
                    inst,
                    stack: &simulator,
                    loc: loc
                )
            }
        // case xjp:
        //     // Case jump
        //     _ = 0
        // case rnp:
        // Return from non-base procedure
        // let retCount = inst.params[0]
        case cip:
            // Call intermediate procedure
            if let loc = inst.destination {
                pseudoCode = pseudoGen.handleCallProcedure(
                    loc,
                    stack: &simulator
                )
            }
        case eql:
            // Equal (TOS-1 = TOS)
            handleComparison(inst.comparatorDataType, &simulator, "=")
        case geq:
            // Greater than or equal (TOS-1 >= TOS)
            handleComparison(inst.comparatorDataType, &simulator, ">=")
        case grt:
            // Greater than (TOS-1 > TOS)
            handleComparison(inst.comparatorDataType, &simulator, ">")
        case lda:
            // Load address
            if let loc = inst.memLocation {
                simulator.push(findStackLabel(loc))
            }
        case ldc:
            // Load multiple-word constant
            // LDC is special: needs manual size calculation due to variable-length word-aligned data
            let count = inst.params[0]
            for i in (0..<count).reversed() {  // words are in reverse order
                let val = inst.params[1 + i]
                simulator.push(("\(val)", "INTEGER"))
            }
        case leq:
            // Less than or equal (TOS-1 <= TOS)
            handleComparison(inst.comparatorDataType, &simulator, "<=")
        case les:
            // Less than (TOS-1 < TOS)
            handleComparison(inst.comparatorDataType, &simulator, "<")
        case lod:
            // Load intermediate word
            if let loc = inst.memLocation {
                simulator.push(findStackLabel(loc))
            }
        case neq:
            // Not equal (TOS-1 <> TOS)
            handleComparison(inst.comparatorDataType, &simulator, "<>")
        case str:
            // Store TOS
            if let loc = inst.memLocation {
                pseudoCode = pseudoGen.generateForInstruction(
                    inst,
                    stack: &simulator,
                    loc: loc
                )
            }
        case ujp:
            if ujpToSkipSet.contains(idx) {
                // This UJP was already handled as part of an IF/ELSE structure
                break
            }
            if ujpCaseDest.contains(inst.params[0])
                || ujpCaseDefaultDest.contains(inst.params[0])
            {
                // This UJP is part of a CASE structure
                pseudoCode = "END (* CASE *)"
                break
            }
            // Unconditional jump
            let dest = inst.params[0]
            // check the destination to see if it's forward, and pointing to an XJP (a CASE)
            if dest > address,
                let targetIdx = sortedInstructions.firstIndex(where: {
                    $0.key == dest
                })
            {
                let target = sortedInstructions[targetIdx]
                if target.value.opcode == xjp {
                    let (index, _) = simulator.pop()  // get the case index value
                    pseudoCode = "CASE \(index) OF"
                    // TODO: need to add the 'END' for the end of the case!
                    // TODO: and also need to increase indent after CASE statement
                    _ = 0
                    // it's a case.
                    let low = target.value.params[0]
                    let high = target.value.params[1]
                    let defLoc = target.value.params[2]
                    ujpCaseDefaultDest.insert(defLoc)
                    let defAddr = target.value.params[3]
                    ujpCaseDest.insert(defAddr)
                    var addrToCaseValue: [Int: [Int]] = [:]
                    // go through them once to group by destination
                    for caseValue in low...high {
                        // get the destination for this case
                        let cDestAddr = target.value.params[
                            4 + (caseValue - low)
                        ]
                        if addrToCaseValue[cDestAddr] == nil {
                            addrToCaseValue[cDestAddr] = []
                        }
                        addrToCaseValue[cDestAddr]?.append(caseValue)
                    }
                    for (cDestAddr, caseValues) in addrToCaseValue {
                        var caseLabel: [String] = []
                        var caseValues = caseValues.sorted()
                        while !caseValues.isEmpty {
                            let first = caseValues.first!  // we can force unwrap as we checked above
                            // group consecutive values
                            let group = caseValues.prefix(while: {
                                $0 == caseValues.first!
                                    + (caseValues.firstIndex(of: $0)!)
                                    - (caseValues.firstIndex(of: first)!)
                            })
                            // if the group has only one value, add it as is
                            if group.count == 1 {
                                caseLabel.append("\(group[0])")
                            } else {
                                // otherwise, add it as a range
                                caseLabel.append(
                                    "\(group.first!)...\(group.last!)"
                                )
                            }
                            // remove the processed values from the caseValues
                            caseValues = Array(
                                caseValues.dropFirst(group.count)
                            )
                        }
                        if let cDest = sortedInstructions.firstIndex(where: {
                            $0.key == cDestAddr
                        }) {
                            sortedInstructions[cDest].value.prePseudoCode
                                .append(
                                    "\(caseLabel.joined(separator: ", ")): BEGIN"
                                )
                        }

                    }

                    break
                }
            }
            if dest > address {  // jumping forward so an IF
                pseudoCode = "GOTO LAB\(dest)"
            } else {
                // jumping backwards, likely a loop - probably a while.
                pseudoCode = "GOTO LAB\(dest)"
            }
            flagForLabel.insert(dest)
            proc.entryPoints.insert(dest)
        case ldp:
            // Load packed field (TOS)
            let (abit, _) = simulator.pop()
            let (awid, _) = simulator.pop()
            let (a, _) = simulator.pop()
            simulator.push(("\(a):\(awid):\(abit)", "INTEGER"))
        case stp:
            // Store packed field (TOS into TOS-1)
            pseudoCode = pseudoGen.generateForInstruction(
                inst,
                stack: &simulator,
                loc: nil
            )
        case ldm:
            // Load multiple words (pushes onto stack)
            let ldmCount = inst.params[0]
            let (wdOrigin, _) = simulator.pop()
            for i in 0..<ldmCount {
                simulator.push(("\(wdOrigin){\(i)}", "INTEGER"))
            }
        case stm:
            // Store multiple words (pops from stack)
            pseudoCode = pseudoGen.generateForInstruction(
                inst,
                stack: &simulator,
                loc: nil
            )
        case ldb:
            // Load byte at byte ptr TOS-1 + TOS
            let (a, _) = simulator.pop()
            let (b, _) = simulator.pop()
            simulator.push(("\(b)[\(a)]", "BYTE"))
        case stb:
            // Store byte at byte ptr TOS-1 + TOS
            pseudoCode = pseudoGen.generateForInstruction(
                inst,
                stack: &simulator,
                loc: nil
            )
        case ixp:
            // Index packed array TOS-1[TOS]
            let elementsPerWord = inst.params[0]
            let fieldWidth = inst.params[1]
            let (idx, _) = simulator.pop()
            let basePtr = simulator.pop()
            simulator.push(basePtr)
            simulator.push(("\(fieldWidth)", "INTEGER"))
            simulator.push(("\(idx)*\(elementsPerWord)", "INTEGER"))
        case cbp:
            // Call base procedure
            if let loc = inst.destination {
                pseudoCode = pseudoGen.handleCallProcedure(
                    loc,
                    stack: &simulator
                )
            }
        case equi:
            // Integer TOS-1 = TOS
            var (a, ta) = simulator.pop()
            var (b, tb) = simulator.pop()
            if ta == "CHAR" {
                if let ch = Int(b), ch >= 0x20 && ch <= 0x7E {
                    b = String(format: "'%c'", ch)
                }
            }
            if tb == "CHAR" {
                if let ch = Int(a), ch >= 0x20 && ch <= 0x7E {
                    a = String(format: "'%c'", ch)
                }
            }
            simulator.push(("\(b) = \(a)", "BOOLEAN"))
        case geqi:
            // Integer TOS-1 >= TOS
            let (a, _) = simulator.pop()
            let (b, _) = simulator.pop()
            simulator.push(("\(b) >= \(a)", "BOOLEAN"))
        case grti:
            // Integer TOS-1 > TOS
            let (a, _) = simulator.pop()
            let (b, _) = simulator.pop()
            simulator.push(("\(b) > \(a)", "BOOLEAN"))
        case lla:
            // Load local address
            if let loc = inst.memLocation {
                simulator.push(findStackLabel(loc))
            }
        case ldci:
            // Load one-word constant
            let val = inst.params[0]
            simulator.push(("\(val)", "INTEGER"))
        case leqi:
            // Integer TOS-1 <= TOS
            let (a, _) = simulator.pop()
            let (b, _) = simulator.pop()
            simulator.push(("\(b) <= \(a)", "BOOLEAN"))
        case lesi:
            // Integer TOS-1 < TOS
            let (a, _) = simulator.pop()
            let (b, _) = simulator.pop()
            simulator.push(("\(b) < \(a)", "BOOLEAN"))
        case ldl:
            // Load local word
            if let loc = inst.memLocation {
                simulator.push(findStackLabel(loc))
            }
        case neqi:
            // Integer TOS-1 <> TOS
            let (a, _) = simulator.pop()
            let (b, _) = simulator.pop()
            simulator.push(("\(b) <> \(a)", "BOOLEAN"))
        case stl:
            // Store TOS into local address
            if let loc = inst.memLocation {
                allLocations.insert(loc)
                pseudoCode = pseudoGen.generateForInstruction(
                    inst,
                    stack: &simulator,
                    loc: loc
                )
            }
        case cxp:
            // Call external procedure
            if let loc = inst.destination {
                pseudoCode = pseudoGen.handleCallProcedure(
                    loc,
                    stack: &simulator
                )
            }
        case clp:
            // Call local procedure
            if let loc = inst.destination {
                pseudoCode = pseudoGen.handleCallProcedure(
                    loc,
                    stack: &simulator
                )
            }
        case cgp:
            // Call global procedure
            if let loc = inst.destination {
                pseudoCode = pseudoGen.handleCallProcedure(
                    loc,
                    stack: &simulator
                )
            }
        case lpa:
            // Load packed array
            let txtRep = inst.stringParameter ?? ""
            simulator.push(("'\(txtRep)'", "PACKED ARRAY"))
        case ste:
            // Store extended word (TOS into word at address)
            if let loc = inst.memLocation {
                allLocations.insert(loc)
                pseudoCode = pseudoGen.generateForInstruction(
                    inst,
                    stack: &simulator,
                    loc: loc
                )
            }
        case sldl1...sldl16:
            // Short load local word
            if let loc = inst.memLocation {
                simulator.push(findStackLabel(loc))
                allLocations.insert(loc)
            }
        case sldo1...sldo16:
            // Short load global word
            if let loc = inst.memLocation {
                simulator.push(findStackLabel(loc))
                allLocations.insert(loc)
            }
        case sind0...sind7:
            // Short index load (word *TOS+offset)
            let offs = inst.params[0]
            let (a, _) = simulator.pop()
            simulator.push(("*(\(a) + \(offs))", "POINTER"))
        default:
            _ = 0  // nothing to do here really
        }

        inst.pseudoCode = pseudoCode
        inst.stackState = currentStack
    }

    flagForLabel.forEach {
        proc.instructions[$0]?.prePseudoCode.append(
            "LAB\($0):"
        )
    }
}
