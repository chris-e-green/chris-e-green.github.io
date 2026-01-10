import Foundation

// MARK: - Pascal Procedure Decoder
private func handleComparison(
    _ dataType: String, _ simulator: inout StackSimulator, _ opString: String
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
    if proc.enterIC < 0 || proc.exitIC < 0 || proc.enterIC >= addr || proc.exitIC >= addr
        || proc.enterIC >= code.count || proc.exitIC >= code.count
    {
        return
    }

    let segment = currSeg.segNum
    let procedure = procedureNumber
    var isFunction = false

    // by using strings, we can store and manipulate symbolic data rather than just locations/ints
    var flagForEnd: [(Int, Int)] = []
    var flagForLabel: [(Int, Int)] = []
    var ic = proc.enterIC
    let indentLevel = 1

    var done: Bool = false
    proc.entryPoints.insert(proc.enterIC)
    proc.entryPoints.insert(proc.exitIC)
    let myLoc =
        allLocations.first(where: {
            $0.segment == segment && $0.procedure == procedure && $0.addr == nil
        }) ?? Location(segment: segment, procedure: procedure)

    // Build lookup dictionaries for O(1) access instead of O(n) linear searches
    var procLookup: [String: ProcIdentifier] = [:]
    for p in allProcedures {
        let key = "\(p.segment):\(p.procedure)"
        procLookup[key] = p
    }

    var labelLookup: [String: Location] = [:]
    for label in allLocations {
        let key = "\(label.segment):\(label.procedure ?? -1):\(label.addr ?? -1)"
        labelLookup[key] = label
    }

    // Initialize components for clean separation of concerns
    let decoder = OpcodeDecoder(cd: cd)
    var simulator = StackSimulator()
    let pseudoGen = PseudoCodeGenerator(procLookup: procLookup, labelLookup: labelLookup)

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

    // Decode loop: uses new architecture for clean separation of decoding, simulation, and generation
    while ic < addr && !done {
        let currentIC = ic
        do {
            let opcode = try cd.readByte(at: ic)

            // Decode the instruction using the new architecture
            var decoded: OpcodeDecoder.DecodedInstruction
            if let cachedDecoded = try? decoder.decode(
                opcode: opcode, at: ic, currSeg: currSeg, segment: segment, procedure: procedure,
                proc: proc, addr: addr, allLocations: &allLocations)
            {
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
                    at: decoded.comparatorOffset)
                finalMnemonic += suffix
                comparatorDataType = dataType
                finalComment =
                    prefix
                    + " TOS-1 \(decoded.mnemonic == "EQL" ? "=" : decoded.mnemonic == "GEQ" ? ">=" : decoded.mnemonic == "GRT" ? ">" : decoded.mnemonic == "LEQ" ? "<=" : decoded.mnemonic == "LES" ? "<" : "<>") TOS"
                bytesConsumed = inc + 1
            }

            // Process stack effects and build instruction using decoded information
            let memLoc = decoded.memLocation
            let dest = decoded.destination
            var pseudoCode: String? = nil  // Set by specific opcodes that generate assignments/control flow

            // Apply stack operations and generate pseudo-code based on mnemonic
            switch opcode {
            case sldc0...sldc127:
                simulator.push((String(opcode), "INTEGER"))
                ic += bytesConsumed
            case abi:
                // Absolute value of integer (TOS)
                let (a, t) = simulator.pop("INTEGER")
                if t != "INTEGER" {
                    _ = 0
                }
                simulator.push(("ABI(\(a))", "INTEGER"))
                ic += bytesConsumed
            case abr:
                // Absolute value of real (TOS)
                let (a, _) = simulator.popReal()
                simulator.pushReal("ABR(\(a))")
                ic += bytesConsumed
            case adi:
                // Add integers (TOS + TOS-1)
                let (a, _) = simulator.pop("INTEGER")
                let (b, _) = simulator.pop("INTEGER")
                simulator.push(("\(b) + \(a)", "INTEGER"))
                ic += bytesConsumed
            case adr:
                // Add reals (TOS + TOS-1)
                let (a, _) = simulator.popReal()
                let (b, _) = simulator.popReal()
                simulator.pushReal("\(a) + \(b)")
                ic += bytesConsumed
            case land:
                // Logical AND (TOS & TOS-1)
                let (a, _) = simulator.pop("BOOLEAN")
                let (b, _) = simulator.pop("BOOLEAN")
                simulator.push(("\(b) AND \(a)", "BOOLEAN"))
                ic += bytesConsumed
            case dif:
                // Set difference (TOS-1 AND NOT TOS)
                let (set1Len, set1) = simulator.popSet()
                let (set2Len, set2) = simulator.popSet()
                let maxLen = max(set1Len, set2Len)
                for i in 0..<maxLen {
                    simulator.push(("(\(set2) AND NOT \(set1)){\(i)}", "SET"))
                }
                simulator.push(("\(maxLen)", "INTEGER"))
                ic += bytesConsumed
            case dvi:
                // Divide integers (TOS-1 / TOS)
                let (a, _) = simulator.pop("INTEGER")
                let (b, _) = simulator.pop("INTEGER")
                simulator.push(("\(b) / \(a)", "INTEGER"))
                ic += bytesConsumed
            case dvr:
                // Divide reals (TOS-1 / TOS)
                let (a, _) = simulator.popReal()
                let (b, _) = simulator.popReal()
                simulator.pushReal("\(b) / \(a)")
                ic += bytesConsumed
            case chk:
                // Check subrange (TOS-1 <= TOS-2 <= TOS)
                let _ = simulator.pop()
                let _ = simulator.pop()
                let c = simulator.pop()
                simulator.push(c)
                ic += bytesConsumed
            case flo:
                // Float next to TOS (int TOS-1 to real TOS)
                let a = simulator.pop()  // TOS
                let (b, _) = simulator.pop()  // TOS-1
                simulator.push(a)  // put previous TOS back
                simulator.pushReal(b)  // real(TOS-1)->TOS
                ic += bytesConsumed
            case flt:
                // Float TOS (int TOS to real TOS)
                let (a, _) = simulator.pop("INTEGER")
                simulator.pushReal(a)
                ic += bytesConsumed
            case inn:
                // Set membership (TOS-1 in set TOS)
                let (_, set) = simulator.popSet()
                let (chk, _) = simulator.pop()
                simulator.push(("\(chk) IN \(set)", "BOOLEAN"))
                ic += bytesConsumed
            case int:
                // Set intersection (TOS AND TOS-1)
                let (set1Len, set1) = simulator.popSet()
                let (set2Len, set2) = simulator.popSet()
                let maxLen = max(set1Len, set2Len)
                for i in 0..<maxLen {
                    simulator.push(("(\(set1) AND \(set2)){\(i)}", "SET"))
                }
                simulator.push(("\(maxLen)", "INTEGER"))
                ic += bytesConsumed
            case lor:
                // Logical OR (TOS | TOS-1)
                let (a, _) = simulator.pop("BOOLEAN")
                let (b, _) = simulator.pop("BOOLEAN")
                simulator.push(("\(b) OR \(a)", "BOOLEAN"))
                ic += bytesConsumed
            case modi:
                // Modulo integers (TOS-1 % TOS)
                let (a, _) = simulator.pop("INTEGER")
                let (b, _) = simulator.pop("INTEGER")
                simulator.push(("\(b) % \(a)", "INTEGER"))
                ic += bytesConsumed
            case mpi:
                // Multiply integers (TOS * TOS-1)
                let (a, _) = simulator.pop("INTEGER")
                let (b, _) = simulator.pop("INTEGER")
                simulator.push(("\(b) * \(a)", "INTEGER"))
                ic += bytesConsumed
            case mpr:
                // Multiply reals (TOS * TOS-1)
                let (a, _) = simulator.popReal()
                let (b, _) = simulator.popReal()
                simulator.pushReal("\(b) * \(a)")
                ic += bytesConsumed
            case ngi:
                // Negate integer
                let (a, _) = simulator.pop("INTEGER")
                simulator.push(("-\(a)", "INTEGER"))
                ic += bytesConsumed
            case ngr:
                // Negate real
                let (a, _) = simulator.popReal()
                simulator.pushReal("-\(a)")
                ic += bytesConsumed
            case lnot:
                // Logical NOT (~TOS)
                let (a, _) = simulator.pop("BOOLEAN")
                simulator.push(("NOT \(a)", "BOOLEAN"))
                ic += bytesConsumed
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
                ic += bytesConsumed
            case sbi:
                // Subtract integers (TOS-1 - TOS)
                let (a, _) = simulator.pop("INTEGER")
                let (b, _) = simulator.pop("INTEGER")
                simulator.push(("\(b) - \(a)", "INTEGER"))
                ic += bytesConsumed
            case sbr:
                // Subtract reals (TOS-1 - TOS)
                let (a, _) = simulator.popReal()
                let (b, _) = simulator.popReal()
                simulator.pushReal("\(b) - \(a)")
                ic += bytesConsumed
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
                ic += bytesConsumed
            case sqi:
                // Square integer (TOS * TOS)
                let (a, _) = simulator.pop("INTEGER")
                simulator.push(("\(a) * \(a)", "INTEGER"))
                ic += bytesConsumed
            case sqr:
                // Square real (TOS * TOS)
                let (a, _) = simulator.popReal()
                simulator.pushReal("\(a) * \(a)")
                ic += bytesConsumed
            case sto:
                // Store indirect word (TOS into TOS-1)
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case ixs:
                // Index string array (check 1 <= TOS <= len of str byte ptr TOS-1)
                //
                // The instruction doesn't store anything on the stack.
                // The actual instruction would throw exec error if IXS failed
                _ = simulator.pop()  // discard index
                _ = simulator.pop()  // discard byte ptr offset
                _ = simulator.pop()  // discard byte ptr base
                ic += bytesConsumed
            case uni:
                // Set union (TOS OR TOS-1)
                let (set1Len, set1) = simulator.popSet()
                let (set2Len, set2) = simulator.popSet()
                let maxLen = max(set1Len, set2Len)
                for i in 0..<maxLen {
                    simulator.push(("(\(set1) OR \(set2)){\(i)}", "SET"))
                }
                simulator.push(("\(maxLen)", "INTEGER"))
                proc.instructions[ic] = Instruction(
                    mnemonic: "UNI", comment: "Set union (TOS OR TOS-1)", stackState: currentStack)
                ic += bytesConsumed
            case lde:
                // Load extended word (pushes value onto stack)
                let seg = decoded.params[0]
                let val = decoded.params[1]
                simulator.push(("LDE[\(seg):\(val)]", "INTEGER"))
                ic += bytesConsumed
            case csp:
                // Call standard procedure
                let procNum = Int(try cd.readByte(at: ic + 1))
                var pseudoCode: String? = nil
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
                                "\(cspName)(\(callParms.reversed().joined(separator:", ")))")
                        } else {
                            simulator.push(
                                ("\(cspName)(\(callParms.reversed().joined(separator:", ")))", ret))
                        }
                    } else {
                        // no return value so just generate pseudo-code
                        pseudoCode = "\(cspName)(\(callParms.reversed().joined(separator:", ")))"

                    }
                }
                var pseudo: PseudoCode? = nil
                if let pc = pseudoCode {
                    pseudo = PseudoCode(code: pc, indentLevel: indentLevel)
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "CSP", params: [procNum],
                    comment: "Call standard procedure \(cspProcs[procNum]?.0 ?? String(procNum))",
                    stackState: currentStack, pseudoCode: pseudo)
                ic += 2
            case ldcn:
                simulator.push(("NIL", "POINTER"))
                ic += bytesConsumed
            case adj:
                // Adjust set to count words
                let count = decoded.params[0]
                let (_, set) = simulator.popSet()
                for i in 0..<count {
                    simulator.push(("\(set){\(i)}", "SET"))
                }
                simulator.push(("\(count)", "INTEGER"))
                ic += bytesConsumed
            case fjp:
                // False jump to addr (implements IF, WHILE and the UNTIL part of REPEAT/UNTIL)
                let dest = decoded.params[0]
                let (cond, _) = simulator.pop("BOOLEAN", true)
                if dest > ic {  // jumping forward so an IF
                    flagForEnd.append((dest, indentLevel))
                    pseudoCode = "IF \(cond) THEN BEGIN"
                } else {  // jumping backwards so a REPEAT/UNTIL
                    proc.instructions[dest]?.prePseudoCode.append(
                        PseudoCode(code: "REPEAT", indentLevel: indentLevel))
                    pseudoCode = "UNTIL \(cond)"
                }
                proc.entryPoints.insert(dest)
                ic += bytesConsumed
            case inc:
                // Inc field ptr (TOS+val)
                let val = decoded.params[0]
                let (a, _) = simulator.pop()
                simulator.push(("\(a) + \(val)", "POINTER"))
                ic += bytesConsumed
            case ind:
                // Static index and load word (TOS+val)
                let val = decoded.params[0]
                let (a, _) = simulator.pop()
                simulator.push(("\(a) + \(val)", "INTEGER"))
                ic += bytesConsumed
            case ixa:
                // Index array (TOS * element size + TOS-1)
                let _ = decoded.params[0]  // Element size, used for address calculation but not in pseudo-code
                let (eltIndex, _) = simulator.pop()
                let (arrayBase, _) = simulator.pop()
                simulator.push(("\(arrayBase)[\(eltIndex)]", "POINTER"))
                ic += bytesConsumed
            case lao:
                // Load global address
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case lsa:
                // Load string address
                let strLen = decoded.params[0]
                var s: String = ""
                if strLen > 0 {
                    for i in 1...strLen {
                        if let ch = try? cd.readByte(at: ic + 1 + Int(i)) {
                            s += String(format: "%c", ch)
                        }
                    }
                }
                simulator.push(("\'\(s)\'", "STRING"))
                ic += bytesConsumed
            case lae:
                // Load extended address
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case mov:
                // Move words from TOS to TOS-1
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case ldo:
                // Load global word
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case sas:
                // String assign
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case sro:
                // Store global word
                if let loc = decoded.memLocation {
                    allLocations.insert(loc)
                    pseudoCode = pseudoGen.generateForInstruction(
                        decoded, stack: &simulator, loc: loc)
                }
                ic += bytesConsumed
            case xjp:
                // Case jump
                _ = simulator.pop()  // remove the case index value
                var tempIC = ic + 1
                if tempIC % 2 != 0 { tempIC += 1 }
                let first = Int(try cd.readWord(at: tempIC))
                tempIC += 2
                let last = Int(try cd.readWord(at: tempIC))
                tempIC += 2
                var dest: Int = 0
                let offset = Int(try cd.readByte(at: tempIC + 1))
                if offset > 0x7f {
                    let jte = addr + offset - 256
                    dest = jte - Int(try cd.readWord(at: jte))
                } else {
                    dest = tempIC + offset + 2
                }
                proc.entryPoints.insert(dest)
                var extraComment = "Case jump\n"
                tempIC += 2
                var c1 = 0
                for c in first...last {
                    if c1 == 0 { extraComment += String(repeating: " ", count: 14) }
                    let caseDest = try cd.getSelfRefPointer(at: tempIC)
                    extraComment += String(format: "   %04x -> %04x", c, caseDest)
                    proc.entryPoints.insert(caseDest)
                    tempIC += 2
                    c1 += 1
                    if c1 == 4 {
                        c1 = 0
                        extraComment += "\n"
                    }
                }
                if c1 != 0 { extraComment += "\n" }
                extraComment += String(repeating: " ", count: 17)
                extraComment += String(format: "dflt -> %04x", dest)
                finalComment = extraComment
                bytesConsumed = tempIC - ic
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
                    allLocations.first(where: { $0.segment == segment && $0.procedure == procNum })
                    ?? Location(segment: segment, procedure: procNum)
                if procNum != procedure {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                var pseudo: PseudoCode? = nil
                let pseudoCode = pseudoGen.handleCallProcedure(loc, stack: &simulator)
                if let pc = pseudoCode {
                    pseudo = PseudoCode(code: pc, indentLevel: indentLevel)
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "CIP", params: [procNum], destination: loc,
                    comment: "Call intermediate procedure", stackState: currentStack,
                    pseudoCode: pseudo)
                allLocations.insert(loc)
                ic += 2
            case eql:
                // Equal (TOS-1 = TOS)
                handleComparison(comparatorDataType, &simulator, "=")
                ic += bytesConsumed
            case geq:
                // Greater than or equal (TOS-1 >= TOS)
                handleComparison(comparatorDataType, &simulator, ">=")
                ic += bytesConsumed
            case grt:
                // Greater than (TOS-1 > TOS)
                handleComparison(comparatorDataType, &simulator, ">")
                ic += bytesConsumed
            case lda:
                // Load address
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case ldc:
                // Load multiple-word constant
                // LDC is special: needs manual size calculation due to variable-length word-aligned data
                let count = decoded.params[0]
                var tempIC = ic + 2
                if tempIC % 2 != 0 { tempIC += 1 }  // word aligned data
                var extraComment = String(repeating: " ", count: 17)
                for i in (0..<count).reversed() {  // words are in reverse order
                    let val = Int(try cd.readWord(at: tempIC + i * 2))
                    simulator.push(("\(val)", "INTEGER"))
                    extraComment += String(format: "%04x ", val)
                }
                // Override comment with word data
                finalComment = "Load multiple-word constant\n" + extraComment
                // Calculate actual bytes consumed including alignment
                bytesConsumed = 2 + (ic % 2 == 0 ? 0 : 1) + count * 2
                ic += bytesConsumed
            case leq:
                // Less than or equal (TOS-1 <= TOS)
                handleComparison(comparatorDataType, &simulator, "<=")
                ic += bytesConsumed
            case les:
                // Less than (TOS-1 < TOS)
                handleComparison(comparatorDataType, &simulator, "<")
                ic += bytesConsumed
            case lod:
                // Load intermediate word
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case neq:
                // Not equal (TOS-1 <> TOS)
                handleComparison(comparatorDataType, &simulator, "<>")
                ic += bytesConsumed
            case str:
                // Store TOS
                if let loc = decoded.memLocation {
                    allLocations.insert(loc)
                    pseudoCode = pseudoGen.generateForInstruction(
                        decoded, stack: &simulator, loc: loc)
                }
                ic += bytesConsumed
            case ujp:
                // Unconditional jump
                let dest = decoded.params[0]
                if dest > ic {  // jumping forward so an IF
                    flagForLabel.append((dest, indentLevel))
                    pseudoCode = "GOTO LAB\(dest)"
                } else {
                    // jumping backwards, likely a loop - probably a while.
                    flagForLabel.append((dest, indentLevel))
                    pseudoCode = "GOTO LAB\(dest)"
                }
                proc.entryPoints.insert(dest)
                ic += bytesConsumed
            case ldp:
                // Load packed field (TOS)
                let (abit, _) = simulator.pop()
                let (awid, _) = simulator.pop()
                let (a, _) = simulator.pop()
                simulator.push(("\(a):\(awid):\(abit)", "INTEGER"))
                ic += bytesConsumed
            case stp:
                // Store packed field (TOS into TOS-1)
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case ldm:
                // Load multiple words (pushes onto stack)
                let ldmCount = decoded.params[0]
                let (wdOrigin, _) = simulator.pop()
                for i in 0..<ldmCount {
                    simulator.push(("\(wdOrigin){\(i)}", "INTEGER"))
                }
                ic += bytesConsumed
            case stm:
                // Store multiple words (pops from stack)
                let stmCount = decoded.params[0]
                for _ in 0..<stmCount {
                    _ = simulator.pop()
                }
                _ = simulator.pop()  // destination address
                ic += bytesConsumed
            case ldb:
                // Load byte at byte ptr TOS-1 + TOS
                let (a, _) = simulator.pop()
                let (b, _) = simulator.pop()
                simulator.push(("\(b)[\(a)]", "BYTE"))
                ic += bytesConsumed
            case stb:
                // Store byte at byte ptr TOS-1 + TOS
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case ixp:
                // Index packed array TOS-1[TOS]
                let elementsPerWord = decoded.params[0]
                let fieldWidth = decoded.params[1]
                let (idx, _) = simulator.pop()
                let basePtr = simulator.pop()
                simulator.push(basePtr)
                simulator.push(("\(fieldWidth)", "INTEGER"))
                simulator.push(("\(idx)*\(elementsPerWord)", "INTEGER"))
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
                    allLocations.first(where: { $0.segment == segment && $0.procedure == procNum })
                    ?? Location(segment: segment, procedure: procNum)
                if procNum != procedure {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                let pseudoCode = pseudoGen.handleCallProcedure(loc, stack: &simulator)
                var pseudo: PseudoCode? = nil
                if let pc = pseudoCode {
                    pseudo = PseudoCode(code: pc, indentLevel: indentLevel)
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "CBP", params: [procNum], destination: loc,
                    comment: "Call base procedure", stackState: currentStack, pseudoCode: pseudo)

                allLocations.insert(loc)
                ic += 2
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
                ic += bytesConsumed
            case geqi:
                // Integer TOS-1 >= TOS
                let (a, _) = simulator.pop()
                let (b, _) = simulator.pop()
                simulator.push(("\(b) >= \(a)", "BOOLEAN"))
                ic += bytesConsumed
            case grti:
                // Integer TOS-1 > TOS
                let (a, _) = simulator.pop()
                let (b, _) = simulator.pop()
                simulator.push(("\(b) > \(a)", "BOOLEAN"))
                proc.instructions[ic] = Instruction(
                    mnemonic: "GRTI", comment: "Integer TOS-1 > TOS", stackState: currentStack)
                ic += 1
            case lla:
                // Load local address
                let (val, inc) = try cd.readBig(at: ic + 1)
                let loc =
                    allLocations.first(where: {
                        $0.segment == segment && $0.procedure == procedure && $0.addr == val
                    })
                    ?? Location(
                        segment: segment, procedure: procedure,
                        lexLevel: proc.lexicalLevel, addr: val)
                simulator.push(findStackLabel(loc))
                proc.instructions[ic] = Instruction(
                    mnemonic: "LLA", params: [val], memLocation: loc, comment: "Load local address",
                    stackState: currentStack)
                allLocations.insert(loc)
                ic += (1 + inc)
            case ldci:
                // Load one-word constant
                let val = decoded.params[0]
                simulator.push(("\(val)", "INTEGER"))
                ic += bytesConsumed
            case leqi:
                // Integer TOS-1 <= TOS
                let (a, _) = simulator.pop()
                let (b, _) = simulator.pop()
                simulator.push(("\(b) <= \(a)", "BOOLEAN"))
                ic += bytesConsumed
            case lesi:
                // Integer TOS-1 < TOS
                let (a, _) = simulator.pop()
                let (b, _) = simulator.pop()
                simulator.push(("\(b) < \(a)", "BOOLEAN"))
                ic += bytesConsumed
            case ldl:
                // Load local word
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case neqi:
                // Integer TOS-1 <> TOS
                let (a, _) = simulator.pop()
                let (b, _) = simulator.pop()
                simulator.push(("\(b) <> \(a)", "BOOLEAN"))
                ic += bytesConsumed
            case stl:
                // Store TOS into local address
                if let loc = decoded.memLocation {
                    allLocations.insert(loc)
                    pseudoCode = pseudoGen.generateForInstruction(
                        decoded, stack: &simulator, loc: loc)
                }
                ic += bytesConsumed
            case cxp:
                // Call external procedure
                let seg = Int(try cd.readByte(at: ic + 1))
                let procNum = Int(try cd.readByte(at: ic + 2))
                let loc =
                    allLocations.first(where: { $0.segment == seg && $0.procedure == procNum })
                    ?? Location(segment: seg, procedure: procNum)
                if procNum != procedure || seg != segment {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                let pseudoCode = pseudoGen.handleCallProcedure(loc, stack: &simulator)
                var pseudo: PseudoCode? = nil
                if let pc = pseudoCode {
                    pseudo = PseudoCode(code: pc, indentLevel: indentLevel)
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "CXP", params: [seg, procNum], destination: loc,
                    comment: "Call external procedure", stackState: currentStack,
                    pseudoCode: pseudo)
                allLocations.insert(loc)
                ic += 3
            case clp:
                // Call local procedure
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc: Location =
                    allLocations.first(where: { $0.segment == segment && $0.procedure == procNum })
                    ?? Location(segment: segment, procedure: procNum)
                if procNum != procedure {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                let pseudoCode = pseudoGen.handleCallProcedure(loc, stack: &simulator)
                var pseudo: PseudoCode? = nil
                if let pc = pseudoCode {
                    pseudo = PseudoCode(code: pc, indentLevel: indentLevel)
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "CLP", params: [procNum], destination: loc,
                    comment: "Call local procedure", stackState: currentStack,
                    pseudoCode: pseudo)
                allLocations.insert(loc)
                ic += 2
            case cgp:
                // Call global procedure
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc =
                    allLocations.first(where: { $0.segment == segment && $0.procedure == procNum })
                    ?? Location(segment: segment, procedure: procNum)
                if procNum != procedure {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                let pseudoCode = pseudoGen.handleCallProcedure(loc, stack: &simulator)
                var pseudo: PseudoCode? = nil
                if let pc = pseudoCode {
                    pseudo = PseudoCode(code: pc, indentLevel: indentLevel)
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "CGP", params: [procNum], destination: loc,
                    comment: "Call global procedure", stackState: currentStack,
                    pseudoCode: pseudo)
                allLocations.insert(loc)
                ic += 2
            case lpa:
                // Load packed array
                let count = decoded.params[0]
                var txtRep = ""
                for i in 1...count {
                    if let c = try? cd.readByte(at: ic + 1 + i) {
                        if c >= 0x20 && c <= 0x7e {
                            txtRep.append(Character(UnicodeScalar(Int(c))!))
                        } else {
                            txtRep.append(".")
                        }
                    }
                }
                simulator.push(("'\(txtRep)'", "PACKED ARRAY"))
                ic += bytesConsumed
            case ste:
                // Store extended word (TOS into word at address)
                if let loc = decoded.memLocation {
                    allLocations.insert(loc)
                    pseudoCode = pseudoGen.generateForInstruction(
                        decoded, stack: &simulator, loc: loc)
                }
                ic += bytesConsumed
            case nop:
                // No operation
                ic += bytesConsumed
            case unk1:
                // Unknown opcode
                ic += bytesConsumed
            case unk2:
                // Unknown opcode
                ic += bytesConsumed
            case bpt:
                // Breakpoint
                ic += bytesConsumed
            case xit:
                // Exit the operating system
                isFunction = false  // AFAIK only the PASCALSYSTEM.PASCALSYSTEM procedure ever calls this
                ic += bytesConsumed
                done = true
            case nop2:
                // No operation
                ic += bytesConsumed
            case sldl1...sldl16:
                // Short load local word
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case sldo1...sldo16:
                // Short load global word
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case sind0...sind7:
                // Short index load (word *TOS+offset)
                let offs = decoded.params[0]
                let (a, _) = simulator.pop()
                simulator.push(("*(\(a) + \(offs))", "POINTER"))
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
                var pseudo: PseudoCode? = nil
                if let pc = pseudoCode {
                    pseudo = PseudoCode(code: pc, indentLevel: indentLevel)
                }
                proc.instructions[ic - bytesConsumed] = Instruction(
                    mnemonic: finalMnemonic,
                    params: decoded.params,
                    memLocation: memLoc,
                    destination: dest,
                    comment: finalComment,
                    stackState: currentStack,
                    pseudoCode: pseudo)
            }

            // Apply control flow markers

            flagForEnd.filter({ $0.0 == currentIC }).forEach { (_, indent) in
                proc.instructions[currentIC]?.prePseudoCode.append(
                    PseudoCode(code: "END", indentLevel: indent))
            }
            flagForLabel.filter({ $0.0 == currentIC }).forEach { _ in
                proc.instructions[currentIC]?.prePseudoCode.append(
                    PseudoCode(code: "LAB\(currentIC):", indentLevel: indentLevel))
            }
        } catch {
            // Any read error (out of range, EOF) aborts decoding this procedure.
            return
        }
    }

    if proc.procType == nil {
        proc.procType = ProcIdentifier(
            isFunction: isFunction, isAssembly: false, segment: segment, segmentName: currSeg.name,
            procedure: procedure)
        if proc.parameterSize > 0 {
            var paramCount = proc.parameterSize
            if proc.procType?.isFunction == true {
                // functions have an extra two words for the return value
                paramCount -= 2
            }
            if paramCount > 0 {
                for parmnum in 1...paramCount {
                    proc.procType?.parameters.append(
                        Identifier(name: "PARAM\(parmnum)", type: "UNKNOWN"))
                }
            }
        }
    }

    // go through the parameters/function return and update the
    // allLabels data after processing the procedure.
    if let pt = proc.procType {
        // if it's a function, set locations 1 (and 2 for reals) to retval
        if pt.isFunction == true {
            if let ret = allLocations.first(where: {
                $0.segment == segment && $0.procedure == procedure && $0.addr == 1
            }) {
                ret.name = pt.procName ?? pt.shortDescription
                ret.type = pt.returnType ?? "UNKNOWN"
                allLocations.update(with: ret)
            }
            if proc.procType?.returnType == "REAL" {
                if let ret = allLocations.first(where: {
                    $0.segment == segment && $0.procedure == procedure && $0.addr == 2
                }) {
                    ret.name = pt.procName ?? pt.shortDescription
                    ret.type = pt.returnType ?? "REAL"
                    allLocations.update(with: ret)
                }
            }
        }
    }

    if let p = proc.procType {
        if !allProcedures.contains(where: {
            $0.procedure == p.procedure && $0.segment == p.segment
        }) {
            allProcedures.append(p)
        }
    }
}
