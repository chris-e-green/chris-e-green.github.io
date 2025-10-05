import Foundation

func decodePascalProcedure(
    currSeg: Segment, proc: inout Procedure, knownNames: inout [Int: Name], code: Data, addr: Int,
    callers: inout [Int: Set<Int>], globals: inout Set<Int>, baseLocs: inout Set<Int>
) {
    func decodeComparator(data: Data, index: Int) -> (String, Int) {

        switch data[index] {
        case 2: return ("REAL          Real ", 1)
        case 4: return ("STR           String ", 1)
        case 6: return ("BOOL          Boolean ", 1)
        case 8: return ("SET           Set ", 1)
        case 10:
            let (val, inc) = data.readBig(at: index + 1)
            return ("BYTE          Byte array (\(val) long) ", inc + 1)
        case 12:
            let (val, inc) = data.readBig(at: index + 1)
            return ("WORD          Word array (\(val) long) ", inc + 1)
        default: return ("", 1)
        }
    }

    proc.lexicalLevel = Int(code[Int(addr) + 1])
    if proc.lexicalLevel > 127 {
        proc.lexicalLevel = proc.lexicalLevel - 256  // fixup for negative lex-level
    }
    proc.enterIC = code.getSelfRefPointer(at: addr - 2)
    proc.exitIC = code.getSelfRefPointer(at: addr - 4)
    proc.parameterSize = code.readWord(at: addr - 6) >> 1
    proc.dataSize = code.readWord(at: addr - 8) >> 1
    var procType: String = ""
    var isFunc: Bool = false
    var ic = proc.enterIC
    var done: Bool = false
    proc.entryPoints.insert(proc.enterIC)
    proc.entryPoints.insert(proc.exitIC)
    // var baseLocs: Set<Int> = []
    var localLocs: Set<Int> = []
    var intermediateLocs: Set<String> = []

    while ic < addr && !done {

        switch code[ic] {
        case 0x00..<0x80:
            proc.instructions[ic] = String(
                format: "SLDC %02x          Short load constant %d",
                code[ic],
                code[ic]
            )
            ic += 1
            break
        case 0x80:
            proc.instructions[ic] =
                "ABI              Absolute value of integer (TOS)"
            ic += 1
            break
        case 0x81:
            proc.instructions[ic] =
                "ABR              Absolute value of real (TOS)"
            ic += 1
            break
        case 0x82:
            proc.instructions[ic] =
                "ADI              Add integers (TOS + TOS-1)"
            ic += 1
            break
        case 0x83:
            proc.instructions[ic] =
                "ADR              Add reals (TOS + TOS-1)"
            ic += 1
            break
        case 0x84:
            proc.instructions[ic] =
                "LAND             Logical AND (TOS & TOS-1)"
            ic += 1
            break
        case 0x85:
            proc.instructions[ic] =
                "DIF              Set difference (TOS-1 AND NOT TOS)"
            ic += 1
            break
        case 0x86:
            proc.instructions[ic] =
                "DVI              Divide integers (TOS-1 / TOS)"
            ic += 1
            break
        case 0x87:
            proc.instructions[ic] =
                "DVR              Divide reals (TOS-1 / TOS)"
            ic += 1
            break
        case 0x88:
            proc.instructions[ic] =
                "CHK              Check subrange (TOS-1 <= TOS-2 <= TOS"
            ic += 1
            break
        case 0x89:
            proc.instructions[ic] =
                "FLO              Float next to TOS (int TOS-1 to real TOS)"
            ic += 1
            break
        case 0x8A:
            proc.instructions[ic] =
                "FLT              Float TOS (int TOS to real TOS)"
            ic += 1
            break
        case 0x8B:
            proc.instructions[ic] =
                "INN              Set membership (TOS-1 in set TOS)"
            ic += 1
            break
        case 0x8C:
            proc.instructions[ic] =
                "INT              Set intersection (TOS AND TOS-1)"
            ic += 1
            break
        case 0x8D:
            proc.instructions[ic] =
                "LOR              Logical OR (TOS | TOS-1)"
            ic += 1
            break
        case 0x8E:
            proc.instructions[ic] =
                "MODI             Modulo integers (TOS-1 % TOS)"
            ic += 1
            break
        case 0x8F:
            proc.instructions[ic] =
                "MPI              Multiply integers (TOS * TOS-1)"
            ic += 1
            break
        case 0x90:
            proc.instructions[ic] =
                "MPR              Multiply reals (TOS * TOS-1)"
            ic += 1
            break
        case 0x91:
            proc.instructions[ic] = "NGI              Negate integer"
            ic += 1
            break
        case 0x92:
            proc.instructions[ic] = "NGR              Negate real"
            ic += 1
            break
        case 0x93:
            proc.instructions[ic] =
                "LNOT             Logical NOT (~TOS)"
            ic += 1
            break
        case 0x94:
            proc.instructions[ic] =
                "SRS              Subrange set [TOS-1..TOS]"
            ic += 1
            break
        case 0x95:
            proc.instructions[ic] =
                "SBI              Subtract integers (TOS-1 - TOS)"
            ic += 1
            break
        case 0x96:
            proc.instructions[ic] =
                "SBR              Subtract reals (TOS-1 - TOS)"
            ic += 1
            break
        case 0x97:
            proc.instructions[ic] =
                "SGS              Build singleton set [TOS]"
            ic += 1
            break
        case 0x98:
            proc.instructions[ic] =
                "SQI              Square integer (TOS * TOS)"
            ic += 1
            break
        case 0x99:
            proc.instructions[ic] =
                "SQR              Square real (TOS * TOS)"
            ic += 1
            break
        case 0x9A:
            proc.instructions[ic] =
                "STO              Store indirect (TOS into TOS-1)"
            ic += 1
            break
        case 0x9B:
            proc.instructions[ic] =
                "IXS              Index string array (check 1<=TOS<=len of str TOS-1)"
            ic += 1
            break
        case 0x9C:
            proc.instructions[ic] =
                "UNI              Set union (TOS OR TOS-1)"
            ic += 1
            break
        case 0x9D:
            let seg = code[ic + 1]
            let (val, inc) = code.readBig(at: ic + 2)
            proc.instructions[ic] = String(
                format:
                    "LDE  %02x %04x      Load extended word (word offset %d in data seg %d)",
                seg,
                val,
                val,
                seg
            )
            ic += (2 + inc)
            break
        case 0x9E:
            let procNum = Int(code[ic + 1])
            proc.instructions[ic] =
                String(
                    format:
                        "CSP  %02x          Call standard procedure ",
                    procNum
                ) + (cspNames[procNum] ?? "\(procNum)")
            ic += 2
            break
        case 0x9F:
            proc.instructions[ic] = "LDCN             Load constant NIL"
            ic += 1
            break
        case 0xA0:
            let count = Int(code[ic + 1])
            proc.instructions[ic] = String(
                format: "ADJ  %02x          Adjust set to %d words",
                count,
                count
            )
            ic += 2
            break
        case 0xA1:
            var dest: Int = 0
            let offset = Int(code[ic + 1])
            if offset > 0x7f {
                let jte = addr + offset - 256
                dest = jte - code.readWord(at: jte)  // find entry in jump table
            } else {
                dest = ic + offset + 2
            }
            proc.entryPoints.insert(dest)
            proc.instructions[ic] = String(
                format: "FJP  $%04x       Jump if TOS false",
                dest
            )
            ic += 2
            break
        case 0xA2:
            let (val, inc) = code.readBig(at: ic + 1)
            proc.instructions[ic] = String(
                format: "INC  %04x        Inc field ptr (TOS+%d)",
                val,
                val
            )
            ic += (1 + inc)
            break
        case 0xA3:
            let (val, inc) = code.readBig(at: ic + 1)
            proc.instructions[ic] = String(
                format:
                    "IND  %04x        Static index and load word (TOS+%d)",
                val,
                val
            )
            ic += (1 + inc)
            break
        case 0xA4:
            let (val, inc) = code.readBig(at: ic + 1)
            proc.instructions[ic] = String(
                format:
                    "IXA  %04x        Index array (TOS-1 + TOS * %d)",
                val,
                val
            )
            ic += (1 + inc)
            break
        case 0xA5:
            let (val, inc) = code.readBig(at: ic + 1)
            proc.instructions[ic] = String(
                format: "LAO  %04x        Load global BASE%d",
                val,
                val
            )
            baseLocs.insert(val)
            ic += (1 + inc)
            break
        case 0xA6:
            let strLen = Int(code[ic + 1])
            var s =
                String(
                    format: "LSA  %02x          Load string address:",
                    strLen
                ) + " '"
            if strLen > 0 {
                for i in 1...strLen {
                    s += String(format: "%c", code[ic + 1 + Int(i)])
                }
            }
            s += "'"
            proc.instructions[ic] = s
            ic += 2 + strLen
            break
        case 0xA7:
            let seg = Int(code[ic + 1])
            let (val, inc) = code.readBig(at: ic + 2)
            proc.instructions[ic] = String(
                format:
                    "LAE  %02x %04x      Load extended address (address offset %d in data seg %d)",
                seg,
                val,
                val,
                seg
            )
            ic += (2 + inc)
            break
        case 0xA8:
            let (val, inc) = code.readBig(at: ic + 1)
            proc.instructions[ic] = String(
                format: "MOV  %04x        Move %d words (TOS to TOS-1)",
                val,
                val
            )
            ic += (1 + inc)
            break
        case 0xA9:
            let (val, inc) = code.readBig(at: ic + 1)
            proc.instructions[ic] = String(
                format: "LDO  %04x        Load global word BASE%d",
                val,
                val
            )
            baseLocs.insert(val)
            ic += (1 + inc)
            break
        case 0xAA:
            proc.instructions[ic] = String(
                format:
                    "SAS  %02x          String assign (TOS to TOS-1, %d chars)",
                code[ic + 1],
                code[ic + 1]
            )
            ic += 2
            break
        case 0xAB:
            let (val, inc) = code.readBig(at: ic + 1)
            proc.instructions[ic] = String(
                format: "SRO  %04x        Store global word BASE%d",
                val,
                val
            )
            baseLocs.insert(val)
            ic += (1 + inc)
            break
        case 0xAC:
            ic += 1  // move to possible start of params
            if ic % 2 != 0 { ic += 1 }  // word align, if not already
            let first = code.readWord(at: ic)
            ic += 2
            let last = code.readWord(at: ic)
            ic += 2
            var dest: Int = 0
            let offset = Int(code[ic + 1])
            if offset > 0x7f {
                let jte = addr + offset - 256
                dest = jte - code.readWord(at: jte)  // find entry in jump table
            } else {
                dest = ic + offset + 2
            }
            proc.entryPoints.insert(dest)
            var s = String(
                format: "XJP  %04x %04x %04x Case jump\n",
                first,
                last,
                dest
            )
            ic += 2
            var c1 = 0
            for c in first...last {
                if c1 == 0 {
                    s += String(repeating: " ", count: 8)
                }
                s += String(
                    format: "   %04x -> %04x",
                    c,
                    ic - code.readWord(at: ic)
                )
                ic += 2
                c1 += 1
                if c1 == 4 {
                    c1 = 0
                    s += "\n"
                }
            }
            if c1 != 0 { s += "\n" }
            s += String(repeating: " ", count: 7)
            s += String(format: "default -> %04x", dest)
            proc.instructions[ic] = s
        case 0xad:
            let retCount = Int(code[ic + 1])
            proc.instructions[ic] = String(
                format:
                    "RNP  %02x          Return from nonbase procedure",
                retCount
            )
            if retCount > 0 {
                isFunc = true
            } else {
                isFunc = false
            }
            ic += 2
            done = true
            break
        case 0xAE:
            let procNum = Int(code[ic + 1])
            var s = String(
                format:
                    "CIP  %02x          Call intermediate procedure %d ",
                procNum,
                procNum
            )
            s += "\(currSeg.name)."
            if let n = knownNames[Int(currSeg.segNum)] {
                s +=
                    "\(n.procNames[procNum] ?? "\(procNum)")"
            } else {
                s += "\(procNum)"
            }
            if procNum != proc.procedureNumber {  // don't add if recursive
                if callers.contains(where: { $0.key == procNum }) {
                    callers[procNum]?.insert(proc.procedureNumber)
                } else {
                    callers[procNum] = [proc.procedureNumber]
                }
            }
            proc.instructions[ic] = s
            ic += 2
            break
        case 0xAF:
            let (comp, inc) = decodeComparator(
                data: code,
                index: ic + 1
            )
            proc.instructions[ic] = "EQL" + comp + "TOS-1 = TOS"
            ic += inc + 1
            break
        case 0xB0:
            let (comp, inc) = decodeComparator(
                data: code,
                index: ic + 1
            )
            proc.instructions[ic] = "GEQ" + comp + "TOS-1 >= TOS"
            ic += inc + 1
            break
        case 0xB1:
            let (comp, inc) = decodeComparator(
                data: code,
                index: ic + 1
            )
            proc.instructions[ic] = "GRT" + comp + "TOS-1 > TOS"
            ic += inc + 1
            break
        case 0xB2:
            let (val, inc) = code.readBig(at: ic + 2)
            let refLexLevel = proc.lexicalLevel - Int(code[ic + 1])
            var label =
                refLexLevel < 0
                ? "G\(val)"
                : "L\(refLexLevel)_\(String(format:"%04d",val))"
            if refLexLevel < 0 {
                globals.insert(Int(val))
            } else {
                intermediateLocs.insert(label)
            }
            if refLexLevel < 0
                && globalNames.contains(where: { $0.key == Int(val) })
            {
                label +=
                    (" (" + (globalNames[Int(val)]?.name ?? "") + ")")
            }
            proc.instructions[ic] = String(
                format: "LDA  %02x %04x     Load addr \(label)",
                code[ic + 1],
                val
            )
            ic += (2 + inc)
            break
        case 0xB3:
            let count = Int(code[ic + 1])
            var s =
                String(
                    format:
                        "LDC  %02x          Load multiple-word constant",
                    code[ic + 1]
                ) + "\n                            "
            ic += 2
            if ic % 2 != 0 { ic += 1 }  // word aligned data
            for i in (0..<count).reversed() {  // words are in reverse order
                s += String(
                    format: "%04x ",
                    code.readWord(at: ic + i * 2)
                )
            }
            proc.instructions[ic] = s
            ic += count * 2
            break
        case 0xB4:
            let (comp, inc) = decodeComparator(
                data: code,
                index: ic + 1
            )
            proc.instructions[ic] = "LEQ" + comp + "TOS-1 <= TOS"
            ic += inc + 1
            break
        case 0xB5:
            let (comp, inc) = decodeComparator(
                data: code,
                index: ic + 1
            )
            proc.instructions[ic] = "LES" + comp + "TOS-1 < TOS"
            ic += inc + 1
            break
        case 0xB6:
            let (val, inc) = code.readBig(at: ic + 2)
            let refLexLevel = proc.lexicalLevel - Int(code[ic + 1])
            var label =
                refLexLevel < 0
                ? "G\(val)"
                : "L\(refLexLevel)_\(String(format:"%04d",val))"
            if refLexLevel < 0 {
                globals.insert(Int(val))
            } else {
                intermediateLocs.insert(label)
            }
            if refLexLevel < 0
                && globalNames.contains(where: { $0.key == Int(val) })
            {
                label +=
                    (" (" + (globalNames[Int(val)]?.name ?? "") + ")")
            }
            proc.instructions[ic] = String(
                format: "LOD  %02x %04x     Load word at \(label)",
                code[ic + 1],
                val
            )
            ic += (2 + inc)
            break
        case 0xB7:
            let (comp, inc) = decodeComparator(
                data: code,
                index: ic + 1
            )
            proc.instructions[ic] = "NEQ" + comp + "TOS-1 <> TOS"
            ic += inc + 1
            break
        case 0xB8:
            let (val, inc) = code.readBig(at: ic + 2)
            let refLexLevel = proc.lexicalLevel - Int(code[ic + 1])
            var label =
                refLexLevel < 0
                ? "G\(val)"
                : "L\(refLexLevel)_\(String(format:"%04d",val))"
            if refLexLevel < 0 {
                globals.insert(Int(val))
            } else {
                intermediateLocs.insert(label)
            }
            if refLexLevel < 0
                && globalNames.contains(where: { $0.key == Int(val) })
            {
                label +=
                    (" (" + (globalNames[Int(val)]?.name ?? "") + ")")
            }
            proc.instructions[ic] = String(
                format: "STR  %02x %04x     Store TOS to \(label)",
                code[ic + 1],
                val
            )
            ic += (2 + inc)
            break
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
            proc.instructions[ic] = String(
                format: "UJP  $%04x       Unconditional jump",
                dest
            )
            ic += 2
            break
        case 0xBA:
            proc.instructions[ic] =
                "LDP              Load packed field (TOS)"
            ic += 1
            break
        case 0xBB:
            proc.instructions[ic] =
                "STP              Store packed field (TOS into TOS-1)"
            ic += 1
            break
        case 0xBC:
            proc.instructions[ic] = String(
                format: "LDM  %02x          Load %d words from (TOS)",
                code[ic + 1],
                code[ic + 1]
            )
            ic += 2
            break
        case 0xBD:
            proc.instructions[ic] = String(
                format:
                    "STM  %02x          Store %d words at TOS to TOS-1",
                code[ic + 1],
                code[ic + 1]
            )
            ic += 2
            break
        case 0xBE:
            proc.instructions[ic] =
                "LDB              Load byte at byte ptr TOS-1 + TOS"
            ic += 1
            break
        case 0xBF:
            proc.instructions[ic] =
                "STB              Store byte at TOS to byte ptr TOS-2 + TOS-1"
            ic += 1
            break
        case 0xC0:
            let elementsPerWord = Int(code[ic + 1])
            let fieldWidth = Int(code[ic + 2])
            proc.instructions[ic] = String(
                format:
                    "IXP  %02x %02x       Index packed array TOS-1[TOS], %d elts/word, %d field width",
                elementsPerWord,
                fieldWidth,
                elementsPerWord,
                fieldWidth
            )
            ic += 3
            break
        case 0xc1:
            let retCount = Int(code[ic + 1])
            proc.instructions[ic] = String(
                format: "RBP  %02x          Return from base procedure",
                retCount
            )
            if retCount > 0 {
                isFunc = true
            } else {
                isFunc = false
            }
            ic += 2
            done = true
            break
        case 0xC2:
            let procNum = Int(code[ic + 1])
            var s = String(
                format: "CBP  %02x          Call base procedure ",
                procNum,
                procNum
            )
            s += "\(currSeg.name)."
            if let n = knownNames[Int(currSeg.segNum)] {
                s += "\(n.procNames[procNum] ?? "\(procNum)")"
            } else {
                s += "\(procNum)"
            }
            proc.instructions[ic] = s
            if procNum != proc.procedureNumber {  // don't add if recursive
                if callers.contains(where: { $0.key == procNum }) {
                    callers[procNum]?.insert(proc.procedureNumber)
                } else {
                    callers[procNum] = [proc.procedureNumber]
                }
            }
            ic += 2
            break
        case 0xC3:
            proc.instructions[ic] =
                "EQUI             Integer TOS-1 = TOS"
            ic += 1
            break
        case 0xC4:
            proc.instructions[ic] =
                "GEQI             Integer TOS-1 >= TOS"
            ic += 1
            break
        case 0xC5:
            proc.instructions[ic] =
                "GRTI             Integer TOS-1 > TOS"
            ic += 1
            break
        case 0xC6:
            let (val, inc) = code.readBig(at: ic + 1)
            proc.instructions[ic] = String(
                format: "LLA  %04x        Load local address MP%d",
                val,
                val
            )
            localLocs.insert(val)
            ic += (1 + inc)
            break
        case 0xC7:
            let val = code.readWord(at: ic + 1)
            proc.instructions[ic] = String(
                format: "LDCI %04x        Load word %d",
                val,
                val
            )
            ic += 3
            break
        case 0xC8:
            proc.instructions[ic] =
                "LEQI             Integer TOS-1 <= TOS"
            ic += 1
            break
        case 0xC9:
            proc.instructions[ic] =
                "LESI             Integer TOS-1 < TOS"
            ic += 1
            break
        case 0xCA:
            let (val, inc) = code.readBig(at: ic + 1)
            proc.instructions[ic] = String(
                format: "LDL  %04x        Load local word MP%d",
                val,
                val
            )
            localLocs.insert(val)
            ic += (1 + inc)
            break
        case 0xCB:
            proc.instructions[ic] =
                "NEQI             Integer TOS-1 <> TOS"
            ic += 1
            break
        case 0xCC:
            let (val, inc) = code.readBig(at: ic + 1)
            proc.instructions[ic] = String(
                format: "STL  %04x        Store TOS into MP%d",
                val,
                val
            )
            localLocs.insert(val)
            ic += (1 + inc)
            break
        case 0xCD:
            let seg = Int(code[ic + 1])
            let procNum = Int(code[ic + 2])

            var s = String(
                format: "CXP  %02x %02x       Call external procedure ",
                seg,
                procNum
            )
            s += "\(knownNames[seg]?.segName ?? "unknown!")."
            if let n = knownNames[seg] {
                s += "\(n.procNames[procNum] ?? "\(procNum)")"
            } else {
                s += "\(procNum)"
            }
            proc.instructions[ic] = s
            ic += 3
            break
        case 0xCE:
            let procNum = Int(code[ic + 1])
            var s = String(
                format: "CLP  %02x          Call local procedure ",
                procNum
            )
            s += "\(currSeg.name)."
            if let n = knownNames[Int(currSeg.segNum)] {
                s += "\(n.procNames[procNum] ?? "\(procNum)")"
            } else {
                s += "\(procNum)"
            }
            if procNum != proc.procedureNumber {  // don't add if recursive
                if callers.contains(where: { $0.key == procNum }) {
                    callers[procNum]?.insert(proc.procedureNumber)
                } else {
                    callers[procNum] = [proc.procedureNumber]
                }
            }
            proc.instructions[ic] = s
            ic += 2
            break
        case 0xCF:
            let procNum = Int(code[ic + 1])
            var s = String(
                format: "CGP  %02x          Call global procedure ",
                procNum
            )
            s += "\(currSeg.name)."
            if let n = knownNames[Int(currSeg.segNum)] {
                s += "\(n.procNames[procNum] ?? "\(procNum)")"
            } else {
                s += "\(procNum)"
            }
            if procNum != proc.procedureNumber {  // don't add if recursive
                if callers.contains(where: { $0.key == procNum }) {
                    callers[procNum]?.insert(proc.procedureNumber)
                } else {
                    callers[procNum] = [proc.procedureNumber]
                }
            }
            proc.instructions[ic] = s
            ic += 2
            break
        case 0xD0:
            let count = Int(code[ic + 1])
            var s = String(
                format: "LPA  %02x          Load packed array",
                count
            )
            s += "\n                            "
            var s1 = " | "
            for i in 1...count {
                let c = code[ic + 1 + i]
                s += String(format: "%02x ", c)
                if c >= 0x20 && c <= 0x7e {
                    s1.append(Character(UnicodeScalar(c)))
                } else {
                    s1.append(".")
                }
            }
            proc.instructions[ic] = s + s1
            ic += (2 + count)
            break
        case 0xD1:
            let seg = Int(code[ic + 1])
            let (val, inc) = code.readBig(at: ic + 2)
            proc.instructions[ic] = String(
                format:
                    "STE  %02x %04x      Store extended word (TOS into word offset %d in data seg %d)",
                seg,
                val,
                val,
                seg
            )
            ic += (2 + inc)
            break
        case 0xD2:
            proc.instructions[ic] = "NOP              No operation"
            ic += 1
            break
        case 0xD3:
            proc.instructions[ic] = String(
                format: "---  %02x",
                code[ic + 1]
            )
            ic += 2
            break
        case 0xD4:
            proc.instructions[ic] = String(
                format: "---  %02x",
                code[ic + 1]
            )
            ic += 2
            break
        case 0xd5:
            let (val, inc) = code.readBig(at: ic + 1)
            proc.instructions[ic] = String(
                format: "BPT  %04x      Breakpoint",
                val
            )
            ic += (1 + inc)
            break
        case 0xd6:
            proc.instructions[ic] =
                "XIT              Exit the operating system"
            ic += 1
            done = true
            isFunc = false  // AFAIK only the PASCALSYSTEM.PASCALSYSTEM procedure ever calls this
            break
        case 0xd7:
            proc.instructions[ic] = "NOP              No operation"
            ic += 1
            break
        case 0xd8...0xe7:
            let loc = Int(code[ic]) - 0xd7
            proc.instructions[ic] = String(
                format: "SLDL %02x          Short load local MP%d",
                loc,
                loc
            )
            localLocs.insert(loc)
            ic += 1
            break
        case 0xe8...0xf7:
            let loc = Int(code[ic] - 0xe7)
            proc.instructions[ic] = String(
                format: "SLDO %02x          Short load global BASE%d",
                loc,
                loc
            )
            baseLocs.insert(loc)
            ic += 1
            break
        case 0xf8...0xff:
            let offs = Int(code[ic]) - 0xf8
            proc.instructions[ic] = String(
                format: "SIND %02x          Short index load *TOS+%d",
                offs,
                offs
            )
            ic += 1
            break
        default:
            fatalError(
                String(format: "Unexpected opcode %02x at %04x", code[ic], ic))
            break
        }
    }

    var actualParams = proc.parameterSize  // how many words of params, minus function

    if isFunc {
        procType += "FUNCTION \(currSeg.name)."
        actualParams -= 2  // two words of param are the function return
    } else {
        procType += "PROCEDURE \(currSeg.name)."
    }

    if proc.procedureNumber == 1 {
        proc.name = "\(currSeg.name)"
    } else {
        if let n = knownNames[Int(currSeg.segNum)],
            let pn = n.procNames[Int(proc.procedureNumber)]
        {
            proc.name = pn
        } else {
            if isFunc {
                proc.name = "FUNC\(proc.procedureNumber)"
            } else {
                proc.name = "PROC\(proc.procedureNumber)"
            }
            knownNames[Int(currSeg.segNum)]?.procNames[Int(proc.procedureNumber)] = proc.name
        }

    }
    procType += proc.name ?? "unknown1"

    if actualParams > 0 {
        procType += "("
        for parmnum in 1...actualParams {
            if parmnum > 1 { procType += "; " }
            procType += "PARAM\(parmnum)"
            switch proc.lexicalLevel {
            case 0: baseLocs.insert(parmnum)
            default: localLocs.insert(parmnum)
            }
        }
        procType += ")"
    }
    proc.dataSize += proc.parameterSize  // add param count to data size

    if isFunc {
        procType += ": RETVAL"
        switch proc.lexicalLevel {
        case 0:
            baseLocs.insert(1)
            baseLocs.insert(2)
        default:
            localLocs.insert(1)
            localLocs.insert(2)
        }
        proc.dataSize += 2  // add 2 words to data for the return value
    }

    // If there is data, add the last data location for the procedure, if it's not already there, so that it's clear where the data ends
    if proc.dataSize > 0 {
        switch proc.lexicalLevel {
        case 0:
            baseLocs.insert(proc.dataSize)
        default:
            localLocs.insert(proc.dataSize)
        }
    }

    proc.header = procType
// TODO: move this handling, as much as feasible, into the Output routine.
// This most likely requires a rethink of how variable references are stored - perhaps 
// store them as lex-level/memory address tuples? LL=-1 -> global; LL=0 -> base; LL=1+ -> MP
    if proc.lexicalLevel == 0 {
        var done = (actualParams == 0)
        for ll in baseLocs.sorted() {
            if isFunc {
                if ll == 1 || ll == 2 {
                    proc.variables.append("BASE\(ll)=RETVAL\(ll)")
                } else {
                    if !done {
                        let paramNum = proc.parameterSize - ll + 1
                        proc.variables.append(
                            "BASE\(ll)=PARAM\(paramNum)"
                        )
                        if paramNum <= 1 {
                            done = true
                        }
                    } else {
                        proc.variables.append("BASE\(ll)")
                    }
                }
            } else {
                if !done {
                    let paramNum = proc.parameterSize - ll + 1
                    proc.variables.append(
                        "BASE\(ll)=PARAM\(paramNum)"
                    )
                    if paramNum <= 1 {
                        done = true
                    }
                } else {
                    proc.variables.append("BASE\(ll)")
                }
            }
        }
    } else if proc.lexicalLevel >= 1 {
        // for bl in baseLocs.sorted() {
        //     proc.variables.append("BASE\(bl)")
        // }
        // couldn't really have references to intermediate locations if this proc
        // is at level 0 or 1!
        for il in intermediateLocs.sorted() {
            proc.variables.append("\(il)")
        }
        var done = (actualParams == 0)
        for ll in localLocs.sorted() {
            if isFunc {
                if ll == 1 || ll == 2 {
                    proc.variables.append("MP\(ll)=RETVAL\(ll)")
                } else {
                    if !done {
                        let paramNum = proc.parameterSize - ll + 1
                        proc.variables.append(
                            "MP\(ll)=PARAM\(paramNum)"
                        )
                        if paramNum <= 1 {
                            done = true
                        }
                    } else {
                        proc.variables.append("MP\(ll)")
                    }
                }
            } else {
                if !done {
                    let paramNum = proc.parameterSize - ll + 1
                    proc.variables.append("MP\(ll)=PARAM\(paramNum)")
                    if paramNum <= 1 {
                        done = true
                    }
                } else {
                    proc.variables.append("MP\(ll)")
                }
            }
        }
    } else if proc.lexicalLevel == -1 {  // only one of these and it's a procedure
        var done = (actualParams == 0)
        for ll in localLocs.sorted() {
            if !done {
                let paramNum = proc.parameterSize - ll + 1
                proc.variables.append("G\(ll)=PARAM\(paramNum)")
                if paramNum <= 1 {
                    done = true
                }
            } else {
                proc.variables.append("G\(ll)")
            }
        }
    }
}
