import Foundation

func popSet(stack: inout [String]) -> (Int, String) {
    let setLen = stack.popLast() ?? "underflow!"
    var setData: [String] = []
    var prevElement: String = ""
    if let len = Int(setLen) {
        for i in 0..<len {
            let element = stack.popLast() ?? "underflow!"
            if element.contains("[") == false {
                if let value = UInt64(element) {
                    for j in 0..<16 {
                        if (value >> j) & 1 == 1 {
                            setData.append("\(i * 16 + j)")
                        }
                    }
                } else {
                    setData.append(element)
                }
            } else {
                let elementParts = element.split(separator: "[")
                if String(elementParts[0]) != prevElement {
                    prevElement = String(elementParts[0])
                    setData.append(String(elementParts[0]))
                }
            }
        }
        return (len, "{" + setData.reversed().joined(separator: ", ") + "}")
    }
    return (0, "malformed set!")
}

func decodePascalProcedure(
    currSeg: Segment, proc: inout Procedure, knownNames: inout [Int: Name], code: Data, addr: Int,
    callers: inout Set<Call>,
    globals: inout Set<Int>,
    baseLocs: inout Set<Int>,
    allLocations: inout Set<Location>, allProcedures: inout [ProcIdentifier],
    allLabels: inout Set<LocationTwo>
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

    func decodeComparator(index: Int) -> (
        mnemonicSuffix: String, commentPrefix: String, ICIncrement: Int
    ) {
        switch (try? cd.readByte(at: index)) ?? 0 {
        case 2: return ("REAL", "Real", 1)
        case 4: return ("STR", "String", 1)
        case 6: return ("BOOL", "Boolean", 1)
        case 8: return ("SET", "Set", 1)
        case 10:
            if let (val, inc) = try? cd.readBig(at: index + 1) {
                return ("BYTE", "Byte array (\(val) long)", inc + 1)
            }
            return ("BYTE", "Byte array (0 long)", 1)
        case 12:
            if let (val, inc) = try? cd.readBig(at: index + 1) {
                return ("WORD", "Word array (\(val) long)", inc + 1)
            }
            return ("WORD", "Word array (0 long)", 1)
        default: return ("", "", 1)
        }
    }

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

    // by using strings, we can store and manipulate symbolic data rather than just locations/ints
    var currentStack: [String] = []
    var flagForEnd: Set<Int> = []
    var flagForLabel: Set<Int> = []
    var ic = proc.enterIC
    var done: Bool = false
    proc.entryPoints.insert(proc.enterIC)
    proc.entryPoints.insert(proc.exitIC)
    let myLoc = Location(segment: currSeg.segNum, procedure: proc.procType?.procNumber)

    // Decode loop: perform all CodeData reads inside a single do/catch so any
    // bounds/EOF error will abort decoding cleanly rather than crashing.
    while ic < addr && !done {
        let currentIC = ic
        do {
            let opcode = try cd.readByte(at: ic)
            switch opcode {
            case 0x00..<0x80:
                currentStack.append(String(opcode))
                proc.instructions[ic] = Instruction(
                    mnemonic: "SLDC", params: [Int(opcode)],
                    comment: "Short load one-word constant \(opcode)", stackState: currentStack)
                ic += 1
            case 0x80:
                currentStack.append("ABI(\(currentStack.popLast() ?? "underflow!"))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "ABI", comment: "Absolute value of integer (TOS)",
                    stackState: currentStack)
                ic += 1
            case 0x81:
                proc.instructions[ic] = Instruction(
                    mnemonic: "ABR", comment: "Absolute value of real (TOS)",
                    stackState: currentStack)
                ic += 1
            case 0x82:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) + \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "ADI", comment: "Add integers (TOS + TOS-1)", stackState: currentStack
                )
                ic += 1
            case 0x83:
                proc.instructions[ic] = Instruction(
                    mnemonic: "ADR", comment: "Add reals (TOS + TOS-1)", stackState: currentStack)
                ic += 1
            case 0x84:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) AND \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "LAND", comment: "Logical AND (TOS & TOS-1)", stackState: currentStack
                )
                ic += 1
            case 0x85:
                let (set1Len, set1) = popSet(stack: &currentStack)
                let (set2Len, set2) = popSet(stack: &currentStack)
                let maxLen = max(set1Len, set2Len)
                for i in 0..<maxLen {
                    currentStack.append("(\(set2) AND NOT \(set1))[\(i)]")
                }
                currentStack.append("\(maxLen)")
                proc.instructions[ic] = Instruction(
                    mnemonic: "DIF", comment: "Set difference (TOS-1 AND NOT TOS)",
                    stackState: currentStack)
                ic += 1
            case 0x86:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) / \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "DVI", comment: "Divide integers (TOS-1 / TOS)",
                    stackState: currentStack)
                ic += 1
            case 0x87:
                proc.instructions[ic] = Instruction(
                    mnemonic: "DVR", comment: "Divide reals (TOS-1 / TOS)", stackState: currentStack
                )
                ic += 1
            case 0x88:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                let c = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) <= \(c) <= \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "CHK", comment: "Check subrange (TOS-1 <= TOS-2 <= TOS)",
                    stackState: currentStack)
                ic += 1
            case 0x89:
                proc.instructions[ic] = Instruction(
                    mnemonic: "FLO", comment: "Float next to TOS (int TOS-1 to real TOS)",
                    stackState: currentStack)
                ic += 1
            case 0x8A:
                proc.instructions[ic] = Instruction(
                    mnemonic: "FLT", comment: "Float TOS (int TOS to real TOS)",
                    stackState: currentStack)
                ic += 1
            case 0x8B:
                let (_, set) = popSet(stack: &currentStack)
                let chk = currentStack.popLast() ?? "underflow!"
                currentStack.append("\(chk) IN \(set)")
                proc.instructions[ic] = Instruction(
                    mnemonic: "INN", comment: "Set membership (TOS-1 in set TOS)",
                    stackState: currentStack)
                ic += 1
            case 0x8C:
                let (set1Len, set1) = popSet(stack: &currentStack)
                let (set2Len, set2) = popSet(stack: &currentStack)
                let maxLen = max(set1Len, set2Len)
                for i in 0..<maxLen {
                    currentStack.append("(\(set1) AND \(set2))[\(i)]")
                }
                currentStack.append("\(maxLen)")
                proc.instructions[ic] = Instruction(
                    mnemonic: "INT", comment: "Set intersection (TOS AND TOS-1)",
                    stackState: currentStack)
                ic += 1
            case 0x8D:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("\(b) OR \(a)")
                proc.instructions[ic] = Instruction(
                    mnemonic: "LOR", comment: "Logical OR (TOS | TOS-1)", stackState: currentStack)
                ic += 1
            case 0x8E:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) % \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "MODI", comment: "Modulo integers (TOS-1 % TOS)",
                    stackState: currentStack)
                ic += 1
            case 0x8F:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) * \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "MPI", comment: "Multiply integers (TOS * TOS-1)",
                    stackState: currentStack)
                ic += 1
            case 0x90:
                proc.instructions[ic] = Instruction(
                    mnemonic: "MPR", comment: "Multiply reals (TOS * TOS-1)",
                    stackState: currentStack)
                ic += 1
            case 0x91:
                currentStack.append("-\(currentStack.popLast() ?? "underflow!")")
                proc.instructions[ic] = Instruction(
                    mnemonic: "NGI", comment: "Negate integer", stackState: currentStack)
                ic += 1
            case 0x92:
                currentStack.append("-\(currentStack.popLast() ?? "underflow!")")
                proc.instructions[ic] = Instruction(
                    mnemonic: "NGR", comment: "Negate real", stackState: currentStack)
                ic += 1
            case 0x93:
                currentStack.append("NOT (\(currentStack.popLast() ?? "underflow!"))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "LNOT", comment: "Logical NOT (~TOS)", stackState: currentStack)
                ic += 1
            case 0x94:
                proc.instructions[ic] = Instruction(
                    mnemonic: "SRS", comment: "Subrange set [TOS-1..TOS]", stackState: currentStack)
                ic += 1
            case 0x95:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) - \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "SBI", comment: "Subtract integers (TOS-1 - TOS)",
                    stackState: currentStack)
                ic += 1
            case 0x96:
                proc.instructions[ic] = Instruction(
                    mnemonic: "SBR", comment: "Subtract reals (TOS-1 - TOS)",
                    stackState: currentStack)
                ic += 1
            case 0x97:
                currentStack.append("[\(currentStack.popLast() ?? "underflow!")]")
                currentStack.append("1")
                proc.instructions[ic] = Instruction(
                    mnemonic: "SGS", comment: "Build singleton set [TOS]", stackState: currentStack)
                ic += 1
            case 0x98:
                let a = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(a) * \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "SQI", comment: "Square integer (TOS * TOS)", stackState: currentStack
                )
                ic += 1
            case 0x99:
                proc.instructions[ic] = Instruction(
                    mnemonic: "SQR", comment: "Square real (TOS * TOS)", stackState: currentStack)
                ic += 1
            case 0x9A:
                let src = currentStack.popLast() ?? "underflow!"
                let dest = currentStack.popLast() ?? "underflow!"
                let pseudoCode = "\(dest) := \(src)"
                proc.instructions[ic] = Instruction(
                    mnemonic: "STO", comment: "Store indirect word (TOS into TOS-1)",
                    stackState: currentStack, pseudoCode: pseudoCode)
                ic += 1
            case 0x9B:
                proc.instructions[ic] = Instruction(
                    mnemonic: "IXS", comment: "Index string array (check 1<=TOS<=len of str TOS-1)",
                    stackState: currentStack)
                ic += 1
            case 0x9C:
                let (set1Len, set1) = popSet(stack: &currentStack)
                let (set2Len, set2) = popSet(stack: &currentStack)
                let maxLen = max(set1Len, set2Len)
                for i in 0..<maxLen {
                    currentStack.append("(\(set1) OR \(set2))[\(i)]")
                }
                currentStack.append("\(maxLen)")
                proc.instructions[ic] = Instruction(
                    mnemonic: "UNI", comment: "Set union (TOS OR TOS-1)", stackState: currentStack)
                ic += 1
            case 0x9D:
                let seg = Int(try cd.readByte(at: ic + 1))
                let (val, inc) = try cd.readBig(at: ic + 2)
                proc.instructions[ic] = Instruction(
                    mnemonic: "LDE", params: [seg, val],
                    comment: "Load extended word (word offset \(val) in data seg \(seg))",
                    stackState: currentStack)
                ic += (2 + inc)
            case 0x9E:
                let procNum = Int(try cd.readByte(at: ic + 1))
                var pseudoCode: String? = nil
                if let (cspName, parms, ret) = cspProcs[procNum] {
                    var callParms: [String] = []
                    for p in parms {
                        if p.type == "REAL" {
                            var rParm: [String] = []
                            for _ in 1..<4 {
                                rParm.append(currentStack.popLast() ?? "underflow!")
                            }
                            callParms.append("R\(rParm.joined(separator:":"))")
                        } else {
                            callParms.append(currentStack.popLast() ?? "underflow!")
                        }
                    }
                    if !ret.isEmpty {
                        if ret == "REAL" {
                            for i in 1..<4 {
                                currentStack.append(
                                    "\(cspName)(\(callParms.reversed().joined(separator:", ")))_R\(i)"
                                )
                            }
                        } else {
                            currentStack.append(
                                "\(cspName)(\(callParms.reversed().joined(separator:", ")))")
                        }
                    } else {
                        // no return value
                        pseudoCode = "\(cspName)(\(callParms.reversed().joined(separator:", ")))"

                    }
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "CSP", params: [procNum],
                    comment: "Call standard procedure \(cspNames[procNum] ?? String(procNum))",
                    stackState: currentStack, pseudoCode: pseudoCode)
                ic += 2
            case 0x9F:
                currentStack.append("NIL")
                proc.instructions[ic] = Instruction(
                    mnemonic: "LDCN", comment: "Load constant NIL", stackState: currentStack)
                ic += 1
            case 0xA0:
                let count = Int(try cd.readByte(at: ic + 1))
                let (_, set) = popSet(stack: &currentStack)
                for i in 0..<count {
                    currentStack.append("\(set)[\(i)]")
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "ADJ", params: [count], comment: "Adjust set to \(count) words",
                    stackState: currentStack)
                ic += 2
            case 0xA1:
                var dest: Int = 0
                let offset = Int(try cd.readByte(at: ic + 1))
                var pseudoCode = ""
                if offset > 0x7f {
                    let jte = addr + offset - 256
                    dest = jte - Int(try cd.readWord(at: jte))
                } else {
                    dest = ic + offset + 2
                }
                if dest > ic {  // jumping forward so an IF
                    flagForEnd.insert(dest)
                    pseudoCode = "IF \(currentStack.popLast() ?? "underflow!") THEN BEGIN"
                } else {  // jumping backwards so a REPEAT/UNTIL
                    proc.instructions[dest]?.prePseudoCode = "REPEAT"
                    pseudoCode = "UNTIL \(currentStack.popLast() ?? "underflow!")"
                }
                proc.entryPoints.insert(dest)
                proc.instructions[ic] = Instruction(
                    mnemonic: "FJP", params: [dest],
                    comment: "Jump if TOS false to \(String(format: "%04x", dest))",
                    stackState: currentStack, pseudoCode: pseudoCode)
                ic += 2
            case 0xA2:
                let (val, inc) = try cd.readBig(at: ic + 1)
                currentStack.append("(\(currentStack.popLast() ?? "underflow!") + \(val))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "INC", params: [val], comment: "Inc field ptr (TOS+\(val))",
                    stackState: currentStack)
                ic += (1 + inc)
            case 0xA3:
                let (val, inc) = try cd.readBig(at: ic + 1)
                currentStack.append("(\(currentStack.popLast() ?? "underflow!") + \(val))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "IND", params: [val],
                    comment: "Static index and load word (TOS+\(val))", stackState: currentStack)
                ic += (1 + inc)
            case 0xA4:
                let (val, inc) = try cd.readBig(at: ic + 1)
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("\(b)[\(a)]")
                proc.instructions[ic] = Instruction(
                    mnemonic: "IXA", params: [val], comment: "Index array (TOS-1 + TOS * \(val))",
                    stackState: currentStack)
                ic += (1 + inc)
            case 0xA5:
                let (val, inc) = try cd.readBig(at: ic + 1)
                let loc = Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
                currentStack.append(
                    "^\(allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr })?.name ?? loc.description)"
                )
                proc.instructions[ic] = Instruction(
                    mnemonic: "LAO", params: [val], memLocation: loc,
                    comment: "Load global address", stackState: currentStack)
                allLocations.insert(loc)
                ic += (1 + inc)
            case 0xA6:
                let strLen = Int(try cd.readByte(at: ic + 1))
                var s: String = ""
                if strLen > 0 {
                    for i in 1...strLen {
                        let ch = try cd.readByte(at: ic + 1 + Int(i))
                        s += String(format: "%c", ch)
                    }
                }
                currentStack.append("^(\"\(s)\")")
                proc.instructions[ic] = Instruction(
                    mnemonic: "LSA", params: [strLen], comment: "Load string address: '" + s + "'",
                    stackState: currentStack)
                ic += 2 + strLen
            case 0xA7:
                let seg = Int(try cd.readByte(at: ic + 1))
                let (val, inc) = try cd.readBig(at: ic + 2)
                let loc = Location(segment: seg, procedure: 0, lexLevel: 0, addr: val)
                currentStack.append(
                    "^\(allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr })?.name ?? loc.description)"
                )
                proc.instructions[ic] = Instruction(
                    mnemonic: "LAE", params: [seg, val], memLocation: loc,
                    comment: "Load extended address", stackState: currentStack)
                allLocations.insert(loc)
                ic += (2 + inc)
            case 0xA8:
                let (val, inc) = try cd.readBig(at: ic + 1)
                let src = currentStack.popLast() ?? "underflow!"
                let dst = currentStack.popLast() ?? "underflow!"
                let pseudoCode = "\(dst) := \(src)"
                proc.instructions[ic] = Instruction(
                    mnemonic: "MOV", params: [val], comment: "Move \(val) words (TOS to TOS-1)",
                    stackState: currentStack, pseudoCode: pseudoCode)
                ic += (1 + inc)
            case 0xA9:
                let (val, inc) = try cd.readBig(at: ic + 1)
                let loc = Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
                currentStack.append(
                    "\(allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr })?.name ?? loc.description)"
                )
                proc.instructions[ic] = Instruction(
                    mnemonic: "LDO", params: [val], memLocation: loc, comment: "Load global word",
                    stackState: currentStack)
                allLocations.insert(loc)
                ic += (1 + inc)
            case 0xAA:
                let sasCount = Int(try cd.readByte(at: ic + 1))
                proc.instructions[ic] = Instruction(
                    mnemonic: "SAS", params: [sasCount],
                    comment: "String assign (TOS to TOS-1, \(sasCount) chars)",
                    stackState: currentStack)
                ic += 2
            case 0xAB:
                let (val, inc) = try cd.readBig(at: ic + 1)
                let loc = Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
                let src = currentStack.popLast() ?? "underflow!"
                let pseudoCode =
                    "\(allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr })?.name ?? loc.description) := \(src)"
                proc.instructions[ic] = Instruction(
                    mnemonic: "SRO", params: [val], memLocation: loc, comment: "Store global word",
                    stackState: currentStack, pseudoCode: pseudoCode)
                allLocations.insert(loc)
                ic += (1 + inc)
            case 0xAC:
                let _ = currentStack.popLast()  // remove the case index value
                let startIC = ic
                ic += 1
                if ic % 2 != 0 { ic += 1 }
                let first = Int(try cd.readWord(at: ic))
                ic += 2
                let last = Int(try cd.readWord(at: ic))
                ic += 2
                var dest: Int = 0
                let offset = Int(try cd.readByte(at: ic + 1))
                if offset > 0x7f {
                    let jte = addr + offset - 256
                    dest = jte - Int(try cd.readWord(at: jte))
                } else {
                    dest = ic + offset + 2
                }
                proc.entryPoints.insert(dest)
                var s = Instruction(
                    mnemonic: "XJP", params: [first, last, dest], comment: "Case jump\n",
                    stackState: currentStack)
                ic += 2
                var c1 = 0
                for c in first...last {
                    if c1 == 0 { s.comment! += String(repeating: " ", count: 14) }
                    let caseDest = try cd.getSelfRefPointer(at: ic)
                    s.comment! += String(format: "   %04x -> %04x", c, caseDest)
                    proc.entryPoints.insert(caseDest)
                    ic += 2
                    c1 += 1
                    if c1 == 4 {
                        c1 = 0
                        s.comment! += "\n"
                    }
                }
                if c1 != 0 { s.comment! += "\n" }
                s.comment! += String(repeating: " ", count: 17)
                s.comment! += String(format: "dflt -> %04x", dest)
                proc.instructions[startIC] = s
            case 0xAD:
                let retCount = Int(try cd.readByte(at: ic + 1))
                proc.instructions[ic] = Instruction(
                    mnemonic: "RNP", params: [retCount], comment: "Return from nonbase procedure",
                    stackState: currentStack)
                proc.procType?.isFunction = (retCount > 0)
                ic += 2
                done = true
            case 0xAE:
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc = Location(segment: currSeg.segNum, procedure: procNum)
                if procNum != proc.procType?.procNumber {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }

                var pseudoCode: String? = nil
                if let called = allProcedures.first(where: {
                    $0.procNumber == loc.procedure && $0.segmentNumber == loc.segment
                }) {
                    // found called procedure, remove its parameters from stack
                    let parmCount = called.parameters.count
                    var aParams: [String] = []
                    if called.isFunction {
                        // pop the extra two return words off the stack
                        _ = currentStack.popLast()
                        _ = currentStack.popLast()
                    }
                    for _ in 0..<parmCount {
                        aParams.append(currentStack.popLast() ?? "underflow!")
                    }
                    if called.isFunction {
                        // if function, push return value onto stack
                        currentStack.append(
                            "\(called.shortDescription)(\(aParams.reversed().joined(separator:", ")))"
                        )
                    } else {
                        pseudoCode =
                            "\(called.shortDescription)(\(aParams.reversed().joined(separator:", ")))"
                    }
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "CIP", params: [procNum], destination: loc,
                    comment: "Call intermediate procedure", stackState: currentStack,
                    pseudoCode: pseudoCode)
                allLocations.insert(loc)
                ic += 2
            case 0xAF:
                let (opSfx, commentPfx, inc) = decodeComparator(index: ic + 1)
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) = \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "EQL" + opSfx, comment: commentPfx + " TOS-1 = TOS",
                    stackState: currentStack)
                ic += inc + 1
            case 0xB0:
                let (opSfx, commentPfx, inc) = decodeComparator(index: ic + 1)
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) >= \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "GEQ" + opSfx, comment: commentPfx + " TOS-1 >= TOS",
                    stackState: currentStack)
                ic += inc + 1
            case 0xB1:
                let (opSfx, commentPfx, inc) = decodeComparator(index: ic + 1)
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) > \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "GRT" + opSfx, comment: commentPfx + " TOS-1 > TOS",
                    stackState: currentStack)
                ic += inc + 1
            case 0xB2:
                let (val, inc) = try cd.readBig(at: ic + 2)
                let byte1 = try cd.readByte(at: ic + 1)
                let refLexLevel = proc.lexicalLevel - Int(byte1)
                let loc = Location(
                    segment: refLexLevel < 0 ? 0 : currSeg.segNum, lexLevel: refLexLevel, addr: val)
                currentStack.append(
                    "^\(allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr })?.name ?? loc.description)"
                )
                proc.instructions[ic] = Instruction(
                    mnemonic: "LDA", params: [Int(byte1), val], memLocation: loc,
                    comment: "Load intermediate address", stackState: currentStack)
                allLocations.insert(loc)
                ic += (2 + inc)
            case 0xB3:
                let startIC = ic
                let count = Int(try cd.readByte(at: ic + 1))
                ic += 2
                if ic % 2 != 0 { ic += 1 }  // word aligned data
                var comment = String(repeating: " ", count: 17)
                for i in (0..<count).reversed() {  // words are in reverse order
                    let val = Int(try cd.readWord(at: ic + i * 2))
                    currentStack.append("\(val)")
                    comment += String(format: "%04x ", val)
                }
                proc.instructions[startIC] = Instruction(
                    mnemonic: "LDC", params: [count], comment: "Load multiple-word constant\n" + comment,
                    stackState: currentStack)
                ic += count * 2
            case 0xB4:
                let (opSfx, commentPfx, inc) = decodeComparator(index: ic + 1)
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) <= \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "LEQ" + opSfx, comment: commentPfx + " TOS-1 <= TOS",
                    stackState: currentStack)
                ic += inc + 1
            case 0xB5:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) < \(a))")
                let (opSfx, commentPfx, inc) = decodeComparator(index: ic + 1)
                proc.instructions[ic] = Instruction(
                    mnemonic: "LES" + opSfx, comment: commentPfx + " TOS-1 < TOS",
                    stackState: currentStack)
                ic += inc + 1
            case 0xB6:
                let (val, inc) = try cd.readBig(at: ic + 2)
                let byte1 = try cd.readByte(at: ic + 1)
                let refLexLevel = proc.lexicalLevel - Int(byte1)
                let loc = Location(
                    segment: refLexLevel < 0 ? 0 : currSeg.segNum, lexLevel: refLexLevel, addr: val)
                currentStack.append(
                    "\(allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr })?.name ?? loc.description)"
                )
                proc.instructions[ic] = Instruction(
                    mnemonic: "LOD", params: [Int(byte1), val], memLocation: loc,
                    comment: "Load intermediate word", stackState: currentStack)
                allLocations.insert(loc)
                ic += (2 + inc)
            case 0xB7:
                let (opSfx, commentPfx, inc) = decodeComparator(index: ic + 1)
                if opSfx != "SET" {
                    let a = currentStack.popLast() ?? "underflow!"
                    let b = currentStack.popLast() ?? "underflow!"
                    currentStack.append("(\(b) <> \(a))")

                } else {
                    let (_, a) = popSet(stack: &currentStack)
                    let (_, b) = popSet(stack: &currentStack)
                    currentStack.append("(\(b) <> \(a))")
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "NEQ" + opSfx, comment: commentPfx + " TOS-1 <> TOS",
                    stackState: currentStack)
                ic += inc + 1
            case 0xB8:
                let (val, inc) = try cd.readBig(at: ic + 2)
                let byte1 = try cd.readByte(at: ic + 1)
                let refLexLevel = proc.lexicalLevel - Int(byte1)
                let loc = Location(
                    segment: refLexLevel < 0 ? 0 : currSeg.segNum, lexLevel: refLexLevel, addr: val)
                let src = currentStack.popLast() ?? "underflow!"
                let pseudoCode =
                    "\(allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr })?.name ?? loc.description) := \(src)"
                proc.instructions[ic] = Instruction(
                    mnemonic: "STR", params: [Int(byte1), val], memLocation: loc,
                    comment: "Store intermediate word", stackState: currentStack,
                    pseudoCode: pseudoCode)
                allLocations.insert(loc)
                ic += (2 + inc)
            case 0xB9:
                var dest: Int = 0
                let offset = Int(try cd.readByte(at: ic + 1))
                var pseudoCode = ""
                if offset > 0x7f {
                    let jte = addr + offset - 256
                    dest = jte - Int(try cd.readWord(at: jte))  // find entry in jump table
                } else {
                    dest = ic + offset + 2
                }
                if dest > ic {  // jumping forward so an IF
                    flagForLabel.insert(dest)
                    pseudoCode = "GOTO LAB\(dest)"
                } else {
                    // jumping backwards, likely a loop - probably a while. TODO, handle that
                    flagForLabel.insert(dest)
                    pseudoCode = "GOTO LAB\(dest)"
                }
                proc.entryPoints.insert(dest)
                proc.instructions[ic] = Instruction(
                    mnemonic: "UJP", params: [dest],
                    comment: "Unconditional jump to \(String(format: "%04x", dest))",
                    stackState: currentStack, pseudoCode: pseudoCode)
                ic += 2
            case 0xBA:
                let abit = currentStack.popLast() ?? "underflow!"
                let awid = currentStack.popLast() ?? "underflow!"
                let a = currentStack.popLast() ?? "underflow!"
                currentStack.append("\(a):\(awid):\(abit)")
                proc.instructions[ic] = Instruction(
                    mnemonic: "LDP", comment: "Load packed field (TOS)", stackState: currentStack)
                ic += 1
            case 0xBB:
                let a = currentStack.popLast() ?? "underflow!"
                let bbit = currentStack.popLast() ?? "underflow!"
                let bwid = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                let pseudoCode = "\(b):\(bwid):\(bbit) := \(a)"
                proc.instructions[ic] = Instruction(
                    mnemonic: "STP", comment: "Store packed field (TOS into TOS-1)",
                    stackState: currentStack, pseudoCode: pseudoCode)
                ic += 1
            case 0xBC:
                let ldmCount = Int(try cd.readByte(at: ic + 1))
                let wdOrigin = currentStack.popLast() ?? "underflow!"
                for i in 0..<ldmCount {
                    currentStack.append("\(wdOrigin)[\(i)]")
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "LDM", params: [ldmCount],
                    comment: "Load \(ldmCount) words from (TOS)", stackState: currentStack)
                ic += 2
            case 0xBD:
                let stmCount = Int(try cd.readByte(at: ic + 1))
                proc.instructions[ic] = Instruction(
                    mnemonic: "STM", params: [stmCount],
                    comment: "Store \(stmCount) words at TOS to TOS-1", stackState: currentStack)
                ic += 2
            case 0xBE:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("byteptr(\(b) + \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "LDB", comment: "Load byte at byte ptr TOS-1 + TOS",
                    stackState: currentStack)
                ic += 1
            case 0xBF:
                let src = currentStack.popLast() ?? "underflow!"
                let dstoffs = currentStack.popLast() ?? "underflow!"
                let dstaddr = currentStack.popLast() ?? "underflow!"
                let pseudoCode = "byteptr(\(dstaddr) + \(dstoffs)) := \(src)"
                proc.instructions[ic] = Instruction(
                    mnemonic: "STB", comment: "Store byte at TOS to byte ptr TOS-2 + TOS-1",
                    stackState: currentStack, pseudoCode: pseudoCode)
                ic += 1
            case 0xC0:
                let elementsPerWord = Int(try cd.readByte(at: ic + 1))
                let fieldWidth = Int(try cd.readByte(at: ic + 2))
                let idx = currentStack.popLast() ?? "underflow!"
                let basePtr = currentStack.popLast() ?? "underflow!"
                currentStack.append(basePtr)
                currentStack.append("\(fieldWidth)")
                currentStack.append("\(idx)*\(elementsPerWord)")
                proc.instructions[ic] = Instruction(
                    mnemonic: "IXP", params: [elementsPerWord, fieldWidth],
                    comment:
                        "Index packed array TOS-1[TOS], \(elementsPerWord) elts/word, \(fieldWidth) field width",
                    stackState: currentStack)
                ic += 3
            case 0xC1:
                let retCount = Int(try cd.readByte(at: ic + 1))
                proc.instructions[ic] = Instruction(
                    mnemonic: "RBP", params: [retCount], comment: "Return from base procedure",
                    stackState: currentStack)
                proc.procType?.isFunction = (retCount > 0)
                ic += 2
                done = true
            case 0xC2:
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc = Location(segment: currSeg.segNum, procedure: procNum)
                if procNum != proc.procType?.procNumber {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                var pseudoCode: String? = nil
                if let called = allProcedures.first(where: {
                    $0.procNumber == loc.procedure && $0.segmentNumber == loc.segment
                }) {
                    // found called procedure, remove its parameters from stack
                    let parmCount = called.parameters.count
                    var aParams: [String] = []
                    if called.isFunction {
                        // pop the extra two return words off the stack
                        _ = currentStack.popLast()
                        _ = currentStack.popLast()
                    }
                    for _ in 0..<parmCount {
                        aParams.append(currentStack.popLast() ?? "underflow!")
                    }
                    if called.isFunction {
                        // if function, push return value onto stack
                        currentStack.append(
                            "\(called.shortDescription)(\(aParams.reversed().joined(separator:", ")))"
                        )
                    } else {
                        pseudoCode =
                            "\(called.shortDescription)(\(aParams.reversed().joined(separator:", ")))"
                    }
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "CBP", params: [procNum], destination: loc,
                    comment: "Call base procedure", stackState: currentStack, pseudoCode: pseudoCode
                )
                allLocations.insert(loc)
                if procNum != proc.procType?.procNumber {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                ic += 2
            case 0xC3:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) = \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "EQUI", comment: "Integer TOS-1 = TOS", stackState: currentStack)
                ic += 1
            case 0xC4:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) >= \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "GEQI", comment: "Integer TOS-1 >= TOS", stackState: currentStack)
                ic += 1
            case 0xC5:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) > \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "GRTI", comment: "Integer TOS-1 > TOS", stackState: currentStack)
                ic += 1
            case 0xC6:
                let (val, inc) = try cd.readBig(at: ic + 1)
                let loc = Location(
                    segment: currSeg.segNum, procedure: proc.procType?.procNumber,
                    lexLevel: proc.lexicalLevel, addr: val)
                currentStack.append(
                    "^\(allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr })?.name ?? loc.description)"
                )
                proc.instructions[ic] = Instruction(
                    mnemonic: "LLA", params: [val], memLocation: loc, comment: "Load local address",
                    stackState: currentStack)
                allLocations.insert(loc)
                ic += (1 + inc)
            case 0xC7:
                let val = Int(try cd.readWord(at: ic + 1))
                currentStack.append(String(val))
                proc.instructions[ic] = Instruction(
                    mnemonic: "LDCI", params: [val], comment: "Load one-word constant \(val)",
                    stackState: currentStack)
                ic += 3
            case 0xC8:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) <= \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "LEQI", comment: "Integer TOS-1 <= TOS", stackState: currentStack)
                ic += 1
            case 0xC9:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) < \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "LESI", comment: "Integer TOS-1 < TOS", stackState: currentStack)
                ic += 1
            case 0xCA:
                let (val, inc) = try cd.readBig(at: ic + 1)
                let loc = Location(
                    segment: currSeg.segNum, procedure: proc.procType?.procNumber,
                    lexLevel: proc.lexicalLevel, addr: val)
                currentStack.append(
                    "\(allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr })?.name ?? loc.description)"
                )
                proc.instructions[ic] = Instruction(
                    mnemonic: "LDL", params: [val], memLocation: loc, comment: "Load local word",
                    stackState: currentStack)
                allLocations.insert(loc)
                ic += (1 + inc)
            case 0xCB:
                let a = currentStack.popLast() ?? "underflow!"
                let b = currentStack.popLast() ?? "underflow!"
                currentStack.append("(\(b) <> \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "NEQI", comment: "Integer TOS-1 <> TOS", stackState: currentStack)
                ic += 1
            case 0xCC:
                let (val, inc) = try cd.readBig(at: ic + 1)
                let loc = Location(
                    segment: currSeg.segNum, procedure: proc.procType?.procNumber,
                    lexLevel: proc.lexicalLevel, addr: val)
                let pseudoCode =
                    "\(allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr })?.name ?? loc.description) := \(currentStack.popLast() ?? "underflow!")"
                proc.instructions[ic] = Instruction(
                    mnemonic: "STL", params: [val], memLocation: loc, comment: "Store local word",
                    stackState: currentStack, pseudoCode: pseudoCode)
                allLocations.insert(loc)
                ic += (1 + inc)
            case 0xCD:
                let seg = Int(try cd.readByte(at: ic + 1))
                let procNum = Int(try cd.readByte(at: ic + 2))
                let loc = Location(segment: seg, procedure: procNum)
                if procNum != proc.procType?.procNumber || seg != currSeg.segNum {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                var pseudoCode: String? = nil
                if let called = allProcedures.first(where: {
                    $0.procNumber == loc.procedure && $0.segmentNumber == loc.segment
                }) {
                    // found called procedure, remove its parameters from stack
                    let parmCount = called.parameters.count
                    var aParams: [String] = []
                    if called.isFunction {
                        // pop the extra two return words off the stack
                        _ = currentStack.popLast()
                        _ = currentStack.popLast()
                    }
                    for _ in 0..<parmCount {
                        aParams.append(currentStack.popLast() ?? "underflow!")
                    }
                    if called.isFunction {
                        // if function, push return value onto stack
                        currentStack.append(
                            "\(called.shortDescription)(\(aParams.reversed().joined(separator:", ")))"
                        )
                    } else {
                        pseudoCode =
                            "\(called.shortDescription)(\(aParams.reversed().joined(separator:", ")))"
                    }
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "CXP", params: [seg, procNum], destination: loc,
                    comment: "Call external procedure", stackState: currentStack,
                    pseudoCode: pseudoCode)
                allLocations.insert(loc)
                ic += 3
            case 0xCE:
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc: Location = Location(segment: currSeg.segNum, procedure: procNum)
                if procNum != proc.procType?.procNumber {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }

                var pseudoCode: String? = nil
                if let called = allProcedures.first(where: {
                    $0.procNumber == loc.procedure && $0.segmentNumber == loc.segment
                }) {
                    // found called procedure, remove its parameters from stack
                    let parmCount = called.parameters.count
                    var aParams: [String] = []
                    if called.isFunction {
                        // pop the extra two return words off the stack
                        _ = currentStack.popLast()
                        _ = currentStack.popLast()
                    }
                    for _ in 0..<parmCount {
                        aParams.append(currentStack.popLast() ?? "underflow!")
                    }
                    if called.isFunction {
                        // if function, push return value onto stack
                        currentStack.append(
                            "\(called.shortDescription)(\(aParams.reversed().joined(separator:", ")))"
                        )
                    } else {
                        pseudoCode =
                            "\(called.shortDescription)(\(aParams.reversed().joined(separator:", ")))"
                    }
                }

                proc.instructions[ic] = Instruction(
                    mnemonic: "CLP", params: [procNum], destination: loc,
                    comment: "Call local procedure", stackState: currentStack,
                    pseudoCode: pseudoCode)
                allLocations.insert(loc)
                ic += 2
            case 0xCF:
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc = Location(segment: currSeg.segNum, procedure: procNum)
                if procNum != proc.procType?.procNumber {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }

                var pseudoCode: String? = nil
                if let called = allProcedures.first(where: {
                    $0.procNumber == loc.procedure && $0.segmentNumber == loc.segment
                }) {
                    // found called procedure, remove its parameters from stack
                    let parmCount = called.parameters.count
                    var aParams: [String] = []
                    if called.isFunction {
                        // pop the extra two return words off the stack
                        _ = currentStack.popLast()
                        _ = currentStack.popLast()
                    }
                    for _ in 0..<parmCount {
                        aParams.append(currentStack.popLast() ?? "underflow!")
                    }
                    if called.isFunction {
                        // if function, push return value onto stack
                        currentStack.append(
                            "\(called.shortDescription)(\(aParams.reversed().joined(separator:", ")))"
                        )
                    } else {
                        pseudoCode =
                            "\(called.shortDescription)(\(aParams.reversed().joined(separator:", ")))"
                    }
                }

                proc.instructions[ic] = Instruction(
                    mnemonic: "CGP", params: [procNum], destination: loc,
                    comment: "Call global procedure", stackState: currentStack,
                    pseudoCode: pseudoCode)
                allLocations.insert(loc)
                ic += 2
            case 0xD0:
                let count = Int(try cd.readByte(at: ic + 1))
                var comment = "Load packed array\n"
                comment += String(repeating: " ", count: 17)
                var txtRep = ""
                for i in 1...count {
                    let c = Int(try cd.readByte(at: ic + 1 + i))
                    comment += String(format: "%02x ", c)
                    if c >= 0x20 && c <= 0x7e {
                        txtRep.append(Character(UnicodeScalar(c)!))
                    } else {
                        txtRep.append(".")
                    }
                }
                comment += (" | " + txtRep)
                currentStack.append("'\(txtRep)'")
                proc.instructions[ic] = Instruction(
                    mnemonic: "LPA", params: [count], comment: comment, stackState: currentStack)
                ic += (2 + count)
            case 0xD1:
                let seg = Int(try cd.readByte(at: ic + 1))
                let (val, inc) = try cd.readBig(at: ic + 2)
                let loc = Location(segment: seg, procedure: 0, lexLevel: 0, addr: val)
                let pseudoCode =
                    "\(allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr })?.name ?? loc.description) := \(currentStack.popLast() ?? "underflow!")"
                proc.instructions[ic] = Instruction(
                    mnemonic: "STE", params: [seg, val], memLocation: loc,
                    comment: "Store extended word TOS into", stackState: currentStack,
                    pseudoCode: pseudoCode)
                allLocations.insert(loc)
                ic += (2 + inc)
            case 0xD2:
                proc.instructions[ic] = Instruction(
                    mnemonic: "NOP", comment: "No operation", stackState: currentStack)
                ic += 1
            case 0xD3:
                let p = Int(try cd.readByte(at: ic + 1))
                proc.instructions[ic] = Instruction(
                    mnemonic: "---", params: [p], stackState: currentStack)
                ic += 2
            case 0xD4:
                let p2 = Int(try cd.readByte(at: ic + 1))
                proc.instructions[ic] = Instruction(
                    mnemonic: "---", params: [p2], stackState: currentStack)
                ic += 2
            case 0xD5:
                let (val, inc) = try cd.readBig(at: ic + 1)
                proc.instructions[ic] = Instruction(
                    mnemonic: "BPT", params: [val], comment: "Breakpoint", stackState: currentStack)
                ic += (1 + inc)
            case 0xD6:
                proc.instructions[ic] = Instruction(
                    mnemonic: "XIT", comment: "Exit the operating system", stackState: currentStack)
                ic += 1
                done = true
                proc.procType?.isFunction = false  // AFAIK only the PASCALSYSTEM.PASCALSYSTEM procedure ever calls this
            case 0xD7:
                proc.instructions[ic] = Instruction(
                    mnemonic: "NOP", comment: "No operation", stackState: currentStack)
                ic += 1
            case 0xD8...0xE7:
                let b = Int(try cd.readByte(at: ic))
                let val = b - 0xd7
                let loc = Location(
                    segment: currSeg.segNum, procedure: proc.procType?.procNumber,
                    lexLevel: proc.lexicalLevel, addr: val)
                currentStack.append(
                    "\(allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr })?.name ?? loc.description)"
                )
                proc.instructions[ic] = Instruction(
                    mnemonic: "SLDL", params: [val], memLocation: loc,
                    comment: "Short load local word", stackState: currentStack)
                allLocations.insert(loc)
                ic += 1
            case 0xE8...0xF7:
                let b2 = Int(try cd.readByte(at: ic))
                let val = b2 - 0xe7
                let loc = Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
                currentStack.append(
                    "\(allLabels.first(where: { $0.segment == loc.segment && $0.procedure == loc.procedure && $0.addr == loc.addr })?.name ?? loc.description)"
                )
                proc.instructions[ic] = Instruction(
                    mnemonic: "SLDO", params: [val], memLocation: loc,
                    comment: "Short load global word", stackState: currentStack)
                allLocations.insert(loc)
                ic += 1
            case 0xF8...0xFF:
                let b3 = Int(try cd.readByte(at: ic))
                let offs = b3 - 0xf8
                let a = currentStack.popLast() ?? "underflow!"
                currentStack.append("*(\(a) + \(offs))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "SIND", params: [offs],
                    comment: "Short index and load word *TOS+\(offs)", stackState: currentStack)
                ic += 1
            default:
                // Unexpected opcode — stop decoding this procedure to avoid crashes.
                return
            }
            if flagForEnd.contains(currentIC) {
                if proc.instructions[currentIC]?.prePseudoCode == nil {
                    proc.instructions[currentIC]?.prePseudoCode = "END"
                } else {
                    proc.instructions[currentIC]?.prePseudoCode!.append("\nEND")
                }
            }
            if flagForLabel.contains(currentIC) {
                if proc.instructions[currentIC]?.prePseudoCode == nil {
                    proc.instructions[currentIC]?.prePseudoCode = "LAB\(currentIC):"
                } else {
                    proc.instructions[currentIC]?.prePseudoCode!.append("\nLAB\(currentIC):")
                }
            }
        } catch {
            // Any read error (out of range, EOF) aborts decoding this procedure.
            return
        }
    }

    if proc.parameterSize > 0 {
        var paramCount = proc.parameterSize
        if proc.procType?.isFunction == true {
            // functions have an extra two words for the return value
            paramCount -= 2
        }
        if paramCount > 0 {
            for parmnum in 1...paramCount {
                proc.procType?.parameters.append(LocInfo(name: "PARAM\(parmnum)", type: "UNKNOWN"))
            }
        }
    }

    if let p = proc.procType {
        if allProcedures.contains(where: {
            $0.procNumber == p.procNumber && $0.segmentNumber == p.segmentNumber
        }) {
            print("Procedure already exists")
            print("New version: \(p.description)")
            let original = allProcedures.first(where: {
                $0.procNumber == p.procNumber && $0.segmentNumber == p.segmentNumber
            })!
            print("Original: \(original.description)")
            if original.procName == nil || original.procName!.isEmpty {
                print("Original has no name.")
            }
            if p.procName == nil || p.procName!.isEmpty {
                print("New version has no name.")
            }
        } else {  
            print("Adding procedure: \(p.shortDescription)")
            allProcedures.append(p)
        }
    }
    // Legacy: older code previously generated string-based proc headers and populated
    // `proc.variables`. That logic has been replaced by `ProcIdentifier`, `allLocations`
    // and `allProcedures`. If you need variable summaries re-introduced, prefer
    // constructing them from `allLocations` so they remain consistent across output.
}
