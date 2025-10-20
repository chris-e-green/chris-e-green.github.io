import Foundation

func decodePascalProcedure(
    currSeg: Segment, proc: inout Procedure, knownNames: inout [Int: Name], code: Data, addr: Int,
    callers: inout Set<Call>, globals: inout Set<Int>, baseLocs: inout Set<Int>,
    allLocations: inout Set<Location>, allProcedures: inout [ProcIdentifier]
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

    func decodeComparator(index: Int) -> (mnemonicSuffix: String, commentPrefix: String, ICIncrement: Int) {
        switch (try? cd.readByte(at: index)) ?? 0 {
        case 2: return ("REAL", "Real", 1)
        case 4: return ("STR", "String", 1)
        case 6: return ("BOOL","Boolean", 1)
        case 8: return ("SET","Set", 1)
        case 10:
            if let (val, inc) = try? cd.readBig(at: index + 1) {
                return ("BYTE","Byte array (\(val) long)", inc + 1)
            }
            return ("BYTE","Byte array (0 long)", 1)
        case 12:
            if let (val, inc) = try? cd.readBig(at: index + 1) {
                return ("WORD","Word array (\(val) long)", inc + 1)
            }
            return ("WORD","Word array (0 long)", 1)
        default: return ("","", 1)
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
    if proc.enterIC < 0 || proc.exitIC < 0 || proc.enterIC >= addr || proc.exitIC >= addr || proc.enterIC >= code.count || proc.exitIC >= code.count {
        return
    }

    var ic = proc.enterIC
    var done: Bool = false
    proc.entryPoints.insert(proc.enterIC)
    proc.entryPoints.insert(proc.exitIC)
    let myLoc = Location(segment: currSeg.segNum, procedure: proc.procType?.procNumber)

    // Decode loop: perform all CodeData reads inside a single do/catch so any
    // bounds/EOF error will abort decoding cleanly rather than crashing.
    while ic < addr && !done {
        do {
            let opcode = try cd.readByte(at: ic)
            switch opcode {
            case 0x00..<0x80:
                proc.instructions[ic] = Instruction(mnemonic: "SLDC", params: [Int(opcode)], comment: "Short load constant \(opcode)")
                ic += 1
            case 0x80:
                proc.instructions[ic] = Instruction(mnemonic: "ABI", comment: "Absolute value of integer (TOS)")
                ic += 1
            case 0x81:
                proc.instructions[ic] = Instruction(mnemonic: "ABR", comment: "Absolute value of real (TOS)")
                ic += 1
            case 0x82:
                proc.instructions[ic] = Instruction(mnemonic: "ADI", comment: "Add integers (TOS + TOS-1)")
                ic += 1
            case 0x83:
                proc.instructions[ic] = Instruction(mnemonic: "ADR", comment: "Add reals (TOS + TOS-1)")
                ic += 1
            case 0x84:
                proc.instructions[ic] = Instruction(mnemonic: "LAND", comment: "Logical AND (TOS & TOS-1)")
                ic += 1
            case 0x85:
                proc.instructions[ic] = Instruction(mnemonic: "DIF", comment: "Set difference (TOS-1 AND NOT TOS)")
                ic += 1
            case 0x86:
                proc.instructions[ic] = Instruction(mnemonic: "DVI", comment: "Divide integers (TOS-1 / TOS)")
                ic += 1
            case 0x87:
                proc.instructions[ic] = Instruction(mnemonic: "DVR", comment: "Divide reals (TOS-1 / TOS)")
                ic += 1
            case 0x88:
                proc.instructions[ic] = Instruction(mnemonic: "CHK", comment: "Check subrange (TOS-1 <= TOS-2 <= TOS)")
                ic += 1
            case 0x89:
                proc.instructions[ic] = Instruction(mnemonic: "FLO", comment: "Float next to TOS (int TOS-1 to real TOS)")
                ic += 1
            case 0x8A:
                proc.instructions[ic] = Instruction(mnemonic: "FLT", comment: "Float TOS (int TOS to real TOS)")
                ic += 1
            case 0x8B:
                proc.instructions[ic] = Instruction(mnemonic: "INN", comment: "Set membership (TOS-1 in set TOS)")
                ic += 1
            case 0x8C:
                proc.instructions[ic] = Instruction(mnemonic: "INT", comment: "Set intersection (TOS AND TOS-1)")
                ic += 1
            case 0x8D:
                proc.instructions[ic] = Instruction(mnemonic: "LOR", comment: "Logical OR (TOS | TOS-1)")
                ic += 1
            case 0x8E:
                proc.instructions[ic] = Instruction(mnemonic: "MODI", comment: "Modulo integers (TOS-1 % TOS)")
                ic += 1
            case 0x8F:
                proc.instructions[ic] = Instruction(mnemonic: "MPI", comment: "Multiply integers (TOS * TOS-1)")
                ic += 1
            case 0x90:
                proc.instructions[ic] = Instruction(mnemonic: "MPR", comment: "Multiply reals (TOS * TOS-1)")
                ic += 1
            case 0x91:
                proc.instructions[ic] = Instruction(mnemonic: "NGI", comment: "Negate integer")
                ic += 1
            case 0x92:
                proc.instructions[ic] = Instruction(mnemonic: "NGR", comment: "Negate real")
                ic += 1
            case 0x93:
                proc.instructions[ic] = Instruction(mnemonic: "LNOT", comment: "Logical NOT (~TOS)")
                ic += 1
            case 0x94:
                proc.instructions[ic] = Instruction(mnemonic: "SRS", comment: "Subrange set [TOS-1..TOS]")
                ic += 1
            case 0x95:
                proc.instructions[ic] = Instruction(mnemonic: "SBI", comment: "Subtract integers (TOS-1 - TOS)")
                ic += 1
            case 0x96:
                proc.instructions[ic] = Instruction(mnemonic: "SBR", comment: "Subtract reals (TOS-1 - TOS)")
                ic += 1
            case 0x97:
                proc.instructions[ic] = Instruction(mnemonic: "SGS", comment: "Build singleton set [TOS]")
                ic += 1
            case 0x98:
                proc.instructions[ic] = Instruction(mnemonic: "SQI", comment: "Square integer (TOS * TOS)")
                ic += 1
            case 0x99:
                proc.instructions[ic] = Instruction(mnemonic: "SQR", comment: "Square real (TOS * TOS)")
                ic += 1
            case 0x9A:
                proc.instructions[ic] = Instruction(mnemonic: "STO", comment: "Store indirect (TOS into TOS-1)")
                ic += 1
            case 0x9B:
                proc.instructions[ic] = Instruction(mnemonic: "IXS", comment: "Index string array (check 1<=TOS<=len of str TOS-1)")
                ic += 1
            case 0x9C:
                proc.instructions[ic] = Instruction(mnemonic: "UNI", comment: "Set union (TOS OR TOS-1)")
                ic += 1
            case 0x9D:
                let seg = Int(try cd.readByte(at: ic + 1))
                let (val, inc) = try cd.readBig(at: ic + 2)
                proc.instructions[ic] = Instruction(mnemonic: "LDE", params: [seg, val], comment: "Load extended word (word offset \(val) in data seg \(seg))")
                ic += (2 + inc)
            case 0x9E:
                let procNum = Int(try cd.readByte(at: ic + 1))
                proc.instructions[ic] = Instruction(mnemonic: "CSP", params: [procNum], comment: "Call standard procedure \(cspNames[procNum] ?? String(procNum))")
                ic += 2
            case 0xA0:
                let count = Int(try cd.readByte(at: ic + 1))
                proc.instructions[ic] = Instruction(mnemonic: "ADJ", params: [count], comment: "Adjust set to \(count) words")
                ic += 2
            case 0xA1:
                var dest: Int = 0
                let offset = Int(try cd.readByte(at: ic + 1))
                if offset > 0x7f {
                    let jte = addr + offset - 256
                    dest = jte - Int(try cd.readWord(at: jte))
                } else {
                    dest = ic + offset + 2
                }
                proc.entryPoints.insert(dest)
                proc.instructions[ic] = Instruction(mnemonic: "FJP", params: [dest], comment: "Jump if TOS false to \(String(format: "%04x", dest))")
                ic += 2
            case 0xA2:
                let (val, inc) = code.readBig(at: ic + 1)
                proc.instructions[ic] = Instruction(mnemonic: "INC", params: [val], comment: "Inc field ptr (TOS+\(val))")
                ic += (1 + inc)
            case 0xA3:
                let (val, inc) = code.readBig(at: ic + 1)
                proc.instructions[ic] = Instruction(mnemonic: "IND", params: [val], comment: "Static index and load word (TOS+\(val))")
                ic += (1 + inc)
            case 0xA4:
                let (val, inc) = code.readBig(at: ic + 1)
                proc.instructions[ic] = Instruction(mnemonic: "IXA", params: [val], comment: "Index array (TOS-1 + TOS * \(val))")
                ic += (1 + inc)
            case 0xA5:
                let (val, inc) = code.readBig(at: ic + 1)
                let loc = Location(segment:1, procedure: 1, lexLevel: 0, addr: val)
                proc.instructions[ic] = Instruction(mnemonic: "LAO", params: [val], memLocation: loc, comment: "Load global")
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
                proc.instructions[ic] = Instruction(mnemonic: "LSA", params: [strLen], comment: "Load string address: '" + s + "'")
                ic += 2 + strLen
            case 0xA7:
                let seg = Int(try cd.readByte(at: ic + 1))
                let (val, inc) = code.readBig(at: ic + 2)
                let loc = Location(segment:seg, procedure: 0, lexLevel: 0, addr: val)
                proc.instructions[ic] = Instruction(mnemonic: "LAE", params: [seg, val], memLocation: loc, comment: "Load extended address")
                allLocations.insert(loc)
                ic += (2 + inc)
            case 0xA8:
                let (val, inc) = code.readBig(at: ic + 1)
                proc.instructions[ic] = Instruction(mnemonic: "MOV", params: [val], comment: "Move \(val) words (TOS to TOS-1)")
                ic += (1 + inc)
            case 0xA9:
                let (val, inc) = code.readBig(at: ic + 1)
                let loc = Location(segment:1, procedure: 1, lexLevel: 0, addr: val)
                proc.instructions[ic] = Instruction(mnemonic: "LDO", params: [val], memLocation: loc, comment: "Load global word")
                allLocations.insert(loc)
                ic += (1 + inc)
            case 0xAA:
                let sasCount = Int(try cd.readByte(at: ic + 1))
                proc.instructions[ic] = Instruction(mnemonic: "SAS", params: [sasCount], comment: "String assign (TOS to TOS-1, \(sasCount) chars)")
                ic += 2
            case 0xAB:
                let (val, inc) = code.readBig(at: ic + 1)
                let loc = Location(segment:1, procedure: 1, lexLevel: 0, addr: val)
                proc.instructions[ic] = Instruction(mnemonic: "SRO", params: [val], memLocation: loc, comment: "Store global word")
                allLocations.insert(loc)
                ic += (1 + inc)
            case 0xAC:
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
                var s = Instruction(mnemonic: "XJP", params: [first, last, dest], comment: "Case jump\n")
                ic += 2
                var c1 = 0
                for c in first...last {
                    if c1 == 0 { s.comment! += String(repeating: " ", count: 11) }
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
                s.comment! += String(repeating: " ", count: 14)
                s.comment! += String(format: "dflt -> %04x", dest)
                proc.instructions[startIC] = s
            case 0xAD:
                let retCount = Int(try cd.readByte(at: ic + 1))
                proc.instructions[ic] = Instruction(mnemonic: "RNP", params: [retCount], comment: "Return from nonbase procedure")
                proc.procType?.isFunction = (retCount > 0)
                ic += 2
                done = true
            case 0xAE:
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc = Location(segment: currSeg.segNum, procedure: procNum)
                if procNum != proc.procType?.procNumber {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                proc.instructions[ic] = Instruction(mnemonic: "CIP", params: [procNum], destination: loc, comment: "Call intermediate procedure")
                allLocations.insert(loc)
                ic += 2
            case 0xAF:
                let (opSfx, commentPfx, inc) = decodeComparator(index: ic + 1)
                proc.instructions[ic] = Instruction(mnemonic: "EQL" + opSfx, comment: commentPfx + " TOS-1 = TOS")
                ic += inc + 1
            case 0xB0:
                let (opSfx, commentPfx, inc) = decodeComparator(index: ic + 1)
                proc.instructions[ic] = Instruction(mnemonic: "GEQ" + opSfx, comment: commentPfx + " TOS-1 >= TOS")
                ic += inc + 1
            case 0xB1:
                let (opSfx, commentPfx, inc) = decodeComparator(index: ic + 1)
                proc.instructions[ic] = Instruction(mnemonic: "GRT" + opSfx, comment: commentPfx + " TOS-1 > TOS")
                ic += inc + 1
            case 0xB2:
                let (val, inc) = code.readBig(at: ic + 2)
                let refLexLevel = proc.lexicalLevel - Int(code[ic + 1])
                let loc = Location(segment:refLexLevel < 0 ? 0 : currSeg.segNum, lexLevel: refLexLevel, addr: val)
                proc.instructions[ic] = Instruction(mnemonic: "LDA", params: [Int(code[ic + 1]), val], memLocation: loc, comment: "Load addr")
                allLocations.insert(loc)
                ic += (2 + inc)
            case 0xB3:
                let startIC = ic
                let count = Int(code[ic + 1])
                var s = Instruction(mnemonic: "LDC", params: [count], comment: "Load multiple-word constant\n")
                ic += 2
                if ic % 2 != 0 { ic += 1 }  // word aligned data
                for i in (0..<count).reversed() {  // words are in reverse order
                    s.comment! += String(
                        format: "%04x ",
                        code.readWord(at: ic + i * 2)
                    )
                }
                proc.instructions[startIC] = s
                ic += count * 2
            case 0xB4:
                let (opSfx, commentPfx, inc) = decodeComparator(index: ic + 1)
                proc.instructions[ic] = Instruction(mnemonic: "LEQ" + opSfx, comment: commentPfx + " TOS-1 <= TOS")
                ic += inc + 1
            case 0xB5:
                let (opSfx, commentPfx, inc) = decodeComparator(index: ic + 1)
                proc.instructions[ic] = Instruction(mnemonic: "LES" + opSfx, comment: commentPfx + " TOS-1 < TOS")
                ic += inc + 1
            case 0xB6:
                let (val, inc) = code.readBig(at: ic + 2)
                let refLexLevel = proc.lexicalLevel - Int(code[ic + 1])
                let loc = Location(segment: refLexLevel < 0 ? 0 : currSeg.segNum, lexLevel: refLexLevel, addr: val)
                proc.instructions[ic] = Instruction(mnemonic: "LOD", params: [Int(code[ic + 1]), val], memLocation: loc, comment: "Load word at")
                allLocations.insert(loc)
                ic += (2 + inc)
            case 0xB7:
                let (opSfx, commentPfx, inc) = decodeComparator(index: ic + 1)
                proc.instructions[ic] = Instruction(mnemonic: "NEQ" + opSfx, comment: commentPfx + " TOS-1 <> TOS")
                ic += inc + 1
            case 0xB8:
                let (val, inc) = code.readBig(at: ic + 2)
                let refLexLevel = proc.lexicalLevel - Int(code[ic + 1])
                let loc = Location(segment: refLexLevel < 0 ? 0 : currSeg.segNum, lexLevel: refLexLevel, addr: val)
                proc.instructions[ic] = Instruction(mnemonic: "STR", params: [Int(code[ic + 1]), val], memLocation: loc, comment: "Store TOS to")
                allLocations.insert(loc)
                ic += (2 + inc)
            case 0xB9:
                var dest: Int = 0
                let offset = Int(code[ic + 1])
                if offset > 0x7f {
                    let jte = addr + offset - 256
                    dest = jte - code.readWord(at: jte)  // find entry in jump table
                } else {
                    dest = ic + offset + 2
                }
                proc.entryPoints.insert(dest)
                proc.instructions[ic] = Instruction(mnemonic: "UJP", params: [dest], comment: "Unconditional jump to \(String(format: "%04x", dest))")
                ic += 2
            case 0xBA:
                proc.instructions[ic] = Instruction(mnemonic: "LDP", comment: "Load packed field (TOS)")
                ic += 1
            case 0xBB:
                proc.instructions[ic] = Instruction(mnemonic: "STP", comment: "Store packed field (TOS into TOS-1)")
                ic += 1
            case 0xBC:
                proc.instructions[ic] = Instruction(mnemonic: "LDM", params: [Int(code[ic + 1])], comment: "Load \(code[ic + 1]) words from (TOS)")
                ic += 2
            case 0xBD:
                proc.instructions[ic] = Instruction(mnemonic: "STM", params: [Int(code[ic + 1])], comment: "Store \(code[ic + 1]) words at TOS to TOS-1")
                ic += 2
            case 0xBE:
                proc.instructions[ic] = Instruction(mnemonic: "LDB", comment: "Load byte at byte ptr TOS-1 + TOS")
                ic += 1
            case 0xBF:
                proc.instructions[ic] = Instruction(mnemonic: "STB", comment: "Store byte at TOS to byte ptr TOS-2 + TOS-1")
                ic += 1
            case 0xC0:
                let elementsPerWord = Int(code[ic + 1])
                let fieldWidth = Int(code[ic + 2])
                proc.instructions[ic] = Instruction(mnemonic: "IXP", params: [elementsPerWord, fieldWidth], comment: "Index packed array TOS-1[TOS], \(elementsPerWord) elts/word, \(fieldWidth) field width")
                ic += 3
            case 0xC1:
                let retCount = Int(code[ic + 1])
                proc.instructions[ic] = Instruction(mnemonic: "RBP", params: [retCount], comment: "Return from base procedure")
                proc.procType?.isFunction = (retCount > 0)
                ic += 2
                done = true
            case 0xC2:
                let procNum = Int(code[ic + 1])
                let loc = Location(segment: currSeg.segNum, procedure: procNum)
                proc.instructions[ic] = Instruction(mnemonic: "CBP", params: [procNum], destination: loc, comment: "Call base procedure")
                allLocations.insert(loc)
                if procNum != proc.procType?.procNumber {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                ic += 2
            case 0xC3:
                proc.instructions[ic] = Instruction(mnemonic: "EQUI", comment: "Integer TOS-1 = TOS")
                ic += 1
            case 0xC4:
                proc.instructions[ic] = Instruction(mnemonic: "GEQI", comment: "Integer TOS-1 >= TOS")
                ic += 1
            case 0xC5:
                proc.instructions[ic] = Instruction(mnemonic: "GRTI", comment: "Integer TOS-1 > TOS")
                ic += 1
            case 0xC6:
                let (val, inc) = code.readBig(at: ic + 1)
                let loc = Location(segment: currSeg.segNum, procedure: proc.procType?.procNumber, lexLevel: proc.lexicalLevel, addr: val)
                proc.instructions[ic] = Instruction(mnemonic: "LLA", params: [val], memLocation: loc, comment: "Load local address")
                allLocations.insert(loc)
                ic += (1 + inc)
            case 0xC7:
                let val = code.readWord(at: ic + 1)
                proc.instructions[ic] = Instruction(mnemonic: "LDCI", params: [val], comment: "Load word \(val)")
                ic += 3
            case 0xC8:
                proc.instructions[ic] = Instruction(mnemonic: "LEQI", comment: "Integer TOS-1 <= TOS")
                ic += 1
            case 0xC9:
                proc.instructions[ic] = Instruction(mnemonic: "LESI", comment: "Integer TOS-1 < TOS")
                ic += 1
            case 0xCA:
                let (val, inc) = code.readBig(at: ic + 1)
                let loc = Location(segment: currSeg.segNum, procedure: proc.procType?.procNumber, lexLevel: proc.lexicalLevel, addr: val)
                proc.instructions[ic] = Instruction(mnemonic: "LDL", params: [val], memLocation: loc, comment: "Load local word")
                allLocations.insert(loc)
                ic += (1 + inc)
            case 0xCB:
                proc.instructions[ic] = Instruction(mnemonic: "NEQI", comment: "Integer TOS-1 <> TOS")
                ic += 1
            case 0xCC:
                let (val, inc) = code.readBig(at: ic + 1)
                let loc = Location(segment: currSeg.segNum, procedure: proc.procType?.procNumber, lexLevel: proc.lexicalLevel, addr: val)
                proc.instructions[ic] = Instruction(mnemonic: "STL", params: [val], memLocation: loc, comment: "Store TOS into")
                allLocations.insert(loc)
                ic += (1 + inc)
            case 0xCD:
                let seg = Int(code[ic + 1])
                let procNum = Int(code[ic + 2])
                let loc = Location(segment: seg, procedure: procNum)
                if procNum != proc.procType?.procNumber || seg != currSeg.segNum {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                proc.instructions[ic] = Instruction(mnemonic: "CXP", params: [seg, procNum], destination: loc, comment: "Call external procedure")
                allLocations.insert(loc)
                ic += 3
            case 0xCE:
                let procNum = Int(code[ic + 1])
                let loc: Location = Location(segment: currSeg.segNum, procedure: procNum)
                if procNum != proc.procType?.procNumber {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                proc.instructions[ic] = Instruction(mnemonic: "CLP", params: [procNum], destination: loc, comment: "Call local procedure")
                allLocations.insert(loc)
                ic += 2
            case 0xCF:
                let procNum = Int(code[ic + 1])
                let loc = Location(segment: currSeg.segNum, procedure: procNum)
                if procNum != proc.procType?.procNumber {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                proc.instructions[ic] = Instruction(mnemonic: "CGP", params: [procNum], destination: loc, comment: "Call global procedure")
                allLocations.insert(loc)
                ic += 2
            case 0xD0:
                let count = Int(code[ic + 1])
                var s = Instruction(mnemonic: "LPA", params: [count], comment: "Load packed array")
                s.comment! += "\n                            "
                var s1 = " | "
                for i in 1...count {
                    let c = code[ic + 1 + i]
                    s.comment! += String(format: "%02x ", c)
                    if c >= 0x20 && c <= 0x7e {
                        s1.append(Character(UnicodeScalar(c)))
                    } else {
                        s1.append(".")
                    }
                }
                s.comment! += s1
                proc.instructions[ic] = s
                ic += (2 + count)
            case 0xD1:
                let seg = Int(code[ic + 1])
                let (val, inc) = code.readBig(at: ic + 2)
                let loc = Location(segment:seg, procedure: 0, lexLevel: 0, addr: val)
                proc.instructions[ic] = Instruction(mnemonic: "STE", params: [seg, val], memLocation: loc, comment: "Store extended word TOS into")
                allLocations.insert(loc)
                ic += (2 + inc)
            case 0xD2:
                proc.instructions[ic] = Instruction(mnemonic: "NOP", comment: "No operation")
                ic += 1
            case 0xD3:
                proc.instructions[ic] = Instruction(mnemonic: "---", params: [Int(code[ic + 1])])
                ic += 2
            case 0xD4:
                proc.instructions[ic] = Instruction(mnemonic: "---", params: [Int(code[ic + 1])])
                ic += 2
            case 0xD5:
                let (val, inc) = code.readBig(at: ic + 1)
                proc.instructions[ic] = Instruction(mnemonic: "BPT", params: [val], comment: "Breakpoint")
                ic += (1 + inc)
            case 0xD6:
                proc.instructions[ic] = Instruction(mnemonic: "XIT", comment: "Exit the operating system")
                ic += 1
                done = true
                proc.procType?.isFunction = false  // AFAIK only the PASCALSYSTEM.PASCALSYSTEM procedure ever calls this
            case 0xD7:
                proc.instructions[ic] = Instruction(mnemonic: "NOP", comment: "No operation")
                ic += 1
            case 0xD8...0xE7:
                let val = Int(code[ic]) - 0xd7
                let loc = Location(segment: currSeg.segNum, procedure:0, lexLevel: proc.lexicalLevel, addr: val)
                proc.instructions[ic] = Instruction(mnemonic: "SLDL", params: [val], memLocation: loc, comment: "Short load local")
                allLocations.insert(loc)
                ic += 1
            case 0xE8...0xF7:
                let val = Int(code[ic] - 0xe7)
                let loc = Location(segment:1, procedure: 1, lexLevel: 0, addr: val)
                proc.instructions[ic] = Instruction(mnemonic: "SLDO", params: [val], memLocation: loc, comment: "Short load global")
                allLocations.insert(loc)
                ic += 1
            case 0xF8...0xFF:
                let offs = Int(code[ic]) - 0xf8
                proc.instructions[ic] = Instruction(mnemonic: "SIND", params: [offs], comment: "Short index load *TOS+\(offs)")
                ic += 1
            default:
                // Unexpected opcode — stop decoding this procedure to avoid crashes.
                return
            }
        } catch {
            // Any read error (out of range, EOF) aborts decoding this procedure.
            return
        }
    }

    if proc.parameterSize > 0 {
        // procType += "("
        for parmnum in 1...proc.parameterSize {
            // if parmnum > 1 { procType += "; " }
            proc.procType?.parameters.append(LocInfo(name:"PARAM\(parmnum)", type: "UNKNOWN"))
            // += "PARAM\(parmnum)"
            // allLocations.insert(Location(segment: currSeg.segNum, procedure: proc.procedureNumber, lexLevel: proc.lexicalLevel, addr: parmnum, label: "PARAM\(parmnum)"))
        }
        // procType += ")"
    }
    if let p = proc.procType {
        allProcedures.append(p)
    }
    // Legacy: older code previously generated string-based proc headers and populated
    // `proc.variables`. That logic has been replaced by `ProcIdentifier`, `allLocations`
    // and `allProcedures`. If you need variable summaries re-introduced, prefer
    // constructing them from `allLocations` so they remain consistent across output.
}
