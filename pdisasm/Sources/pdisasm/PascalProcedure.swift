import Foundation

let cspProcs: [Int: (String, [Identifier], String)] = [
    0: ("IOC", [], ""),
    1: ("NEW", [
        Identifier(name:"PTR", type:"POINTER"), 
        Identifier(name:"SIZE", type:"INTEGER")], ""), 
    2: ("MOVL",[
        Identifier(name:"SRCADDR", type:"POINTER"), 
        Identifier(name:"SRCOFFS", type:"INTEGER"), 
        Identifier(name:"DESTADDR", type:"POINTER"), 
        Identifier(name:"DESTOFFS", type:"INTEGER"), 
        Identifier(name:"COUNT", type:"INTEGER")], ""),
    3: ("MOVR", [
        Identifier(name:"SRCADDR", type:"POINTER"), 
        Identifier(name:"SRCOFFS", type:"INTEGER"), 
        Identifier(name:"DESTADDR", type:"POINTER"), 
        Identifier(name:"DESTOFFS", type:"INTEGER"), 
        Identifier(name:"COUNT", type:"INTEGER")], ""),
    4: ("EXIT", [
        Identifier(name:"SEGMENT", type:"INTEGER"), 
        Identifier(name:"PROCEDURE", type:"INTEGER")], ""),
    5: ("UNITREAD",[
        Identifier(name:"MODE", type:"INTEGER"), 
        Identifier(name:"BLOCKNUM", type:"INTEGER"), 
        Identifier(name:"BYTCOUNT", type:"INTEGER"), 
        Identifier(name:"BUFFADDR", type:"POINTER"), 
        Identifier(name:"BUFFOFFS", type:"INTEGER"), 
        Identifier(name:"UNIT", type:"INTEGER")], ""),
    6: ("UNITWRITE", [
        Identifier(name:"MODE", type:"INTEGER"), 
        Identifier(name:"BLOCKNUM", type:"INTEGER"), 
        Identifier(name:"BYTCOUNT", type:"INTEGER"), 
        Identifier(name:"BUFFADDR", type:"POINTER"), 
        Identifier(name:"BUFFOFFS", type:"INTEGER"), 
        Identifier(name:"UNIT", type:"INTEGER")], ""),
    7: ("IDSEARCH", [
        Identifier(name:"SYMCURSOR", type: "0..1023"), 
        Identifier(name:"SYMBUF", type:"PACKED ARRAY[0..1023] OF CHAR")], ""),
    8: ("TREESEARCH", [
        Identifier(name:"ROOTP", type: "^NODE"), 
        Identifier(name:"FOUNDP", type:"^NODE"), 
        Identifier(name:"TARGET", type:"PACKED ARRAY [1..8] OF CHAR")], "INTEGER"),
    9: ("TIME", [
        Identifier(name: "TIME1", type: "INTEGER"), 
        Identifier(name: "TIME2", type: "INTEGER")], ""),
    10: ("FLCH", [
        Identifier(name:"DESTADDR", type:"POINTER"), 
        Identifier(name:"DESTOFFS", type:"INTEGER"), 
        Identifier(name:"COUNT", type:"INTEGER"), 
        Identifier(name:"SRC", type:"CHAR")], ""),
    11: ("SCAN", [
        Identifier(name:"JUNK", type:"INTEGER"), 
        Identifier(name:"DESTADDR", type:"POINTER"), 
        Identifier(name:"DESTOFFS", type:"INTEGER"), 
        Identifier(name:"CH", type:"CHAR"), 
        Identifier(name:"CHECK", type:"INTEGER"), 
        Identifier(name:"COUNT", type:"INTEGER")], "INTEGER"),
    12: ("UNITSTATUS", [
        Identifier(name: "CTRLWORD", type: "INTEGER"), 
        Identifier(name: "STATADDR", type: "POINTER"),
        Identifier(name: "STATOFFS", type: "INTEGER"), 
        Identifier(name: "UNIT", type: "INTEGER")], ""),
    // skipping 13-20 (reserved)
    21: ("LOADSEGMENT", [Identifier(name:"SEGMENT", type:"INTEGER")], ""),
    22: ("UNLOADSEGMENT", [Identifier(name:"SEGMENT", type:"INTEGER")], ""),
    23: ("TRUNC", [Identifier(name: "NUM", type: "REAL")], "INTEGER"), 
    24: ("ROUND", [Identifier(name: "NUM", type: "REAL")], "INTEGER"), 
    25: ("SIN", [], ""), // not implemented
    26: ("COS", [], ""), // not implemented
    27: ("LOG", [], ""), // not implemented
    28: ("ATAN", [], ""), // not implemented
    29: ("LN", [], ""), // not implemented
    30: ("EXP", [], ""), // not implemented
    31: ("SQRT", [], ""), // not implemented
    32: ("MARK", [Identifier(name: "NP", type: "POINTER")], ""),
    33: ("RELEASE", [Identifier(name: "NP", type: "POINTER")], ""),
    34: ("IORESULT", [], "INTEGER"),
    35: ("UNITBUSY", [Identifier(name:"UNIT", type:"INTEGER")], "BOOLEAN"),
    36: ("POT", [Identifier(name:"NUM", type:"INTEGER")], "REAL"),  
    37: ("UNITWAIT", [Identifier(name:"UNIT", type:"INTEGER")], ""),
    38: ("UNITCLEAR", [Identifier(name:"UNIT", type:"INTEGER")], ""),
    39: ("HALT", [], ""),
    40: ("MEMAVAIL", [], "INTEGER"),
]

// MARK: - Opcode Decoder

/// Handles decoding of P-code opcodes and extracting instruction parameters
struct OpcodeDecoder {
    let cd: CodeData

    struct DecodedInstruction {
        let mnemonic: String
        let params: [Int]
        let bytesConsumed: Int
        let comment: String?
        let memLocation: Location?
        let destination: Location?
        let requiresComparator: Bool
        let comparatorOffset: Int

        init(
            mnemonic: String, params: [Int] = [], bytesConsumed: Int, comment: String? = nil,
            memLocation: Location? = nil, destination: Location? = nil,
            requiresComparator: Bool = false, comparatorOffset: Int = 0
        ) {
            self.mnemonic = mnemonic
            self.params = params
            self.bytesConsumed = bytesConsumed
            self.comment = comment
            self.memLocation = memLocation
            self.destination = destination
            self.requiresComparator = requiresComparator
            self.comparatorOffset = comparatorOffset
        }
    }

    func decode(opcode: UInt8, at ic: Int, currSeg: Segment, proc: Procedure, addr: Int) throws
        -> DecodedInstruction
    {
        switch opcode {
        case 0x00..<0x80:
            return DecodedInstruction(
                mnemonic: "SLDC",
                params: [Int(opcode)],
                bytesConsumed: 1,
                comment: "Short load one-word constant \(opcode)")
        case 0x80:
            return DecodedInstruction(
                mnemonic: "ABI", bytesConsumed: 1, comment: "Absolute value of integer (TOS)")
        case 0x81:
            return DecodedInstruction(
                mnemonic: "ABR", bytesConsumed: 1, comment: "Absolute value of real (TOS)")
        case 0x82:
            return DecodedInstruction(
                mnemonic: "ADI", bytesConsumed: 1, comment: "Add integers (TOS + TOS-1)")
        case 0x83:
            return DecodedInstruction(
                mnemonic: "ADR", bytesConsumed: 1, comment: "Add reals (TOS + TOS-1)")
        case 0x84:
            return DecodedInstruction(
                mnemonic: "LAND", bytesConsumed: 1, comment: "Logical AND (TOS & TOS-1)")
        case 0x85:
            return DecodedInstruction(
                mnemonic: "DIF", bytesConsumed: 1, comment: "Set difference (TOS-1 AND NOT TOS)")
        case 0x86:
            return DecodedInstruction(
                mnemonic: "DVI", bytesConsumed: 1, comment: "Divide integers (TOS-1 / TOS)")
        case 0x87:
            return DecodedInstruction(
                mnemonic: "DVR", bytesConsumed: 1, comment: "Divide reals (TOS-1 / TOS)")
        case 0x88:
            return DecodedInstruction(
                mnemonic: "CHK", bytesConsumed: 1, comment: "Check subrange (TOS-1 <= TOS-2 <= TOS)"
            )
        case 0x89:
            return DecodedInstruction(
                mnemonic: "FLO", bytesConsumed: 1,
                comment: "Float next to TOS (int TOS-1 to real TOS)")
        case 0x8A:
            return DecodedInstruction(
                mnemonic: "FLT", bytesConsumed: 1, comment: "Float TOS (int TOS to real TOS)")
        case 0x8B:
            return DecodedInstruction(
                mnemonic: "INN", bytesConsumed: 1, comment: "Set membership (TOS-1 in set TOS)")
        case 0x8C:
            return DecodedInstruction(
                mnemonic: "INT", bytesConsumed: 1, comment: "Set intersection (TOS AND TOS-1)")
        case 0x8D:
            return DecodedInstruction(
                mnemonic: "LOR", bytesConsumed: 1, comment: "Logical OR (TOS | TOS-1)")
        case 0x8E:
            return DecodedInstruction(
                mnemonic: "MODI", bytesConsumed: 1, comment: "Modulo integers (TOS-1 % TOS)")
        case 0x8F:
            return DecodedInstruction(
                mnemonic: "MPI", bytesConsumed: 1, comment: "Multiply integers (TOS * TOS-1)")
        case 0x90:
            return DecodedInstruction(
                mnemonic: "MPR", bytesConsumed: 1, comment: "Multiply reals (TOS * TOS-1)")
        case 0x91:
            return DecodedInstruction(mnemonic: "NGI", bytesConsumed: 1, comment: "Negate integer")
        case 0x92:
            return DecodedInstruction(mnemonic: "NGR", bytesConsumed: 1, comment: "Negate real")
        case 0x93:
            return DecodedInstruction(
                mnemonic: "LNOT", bytesConsumed: 1, comment: "Logical NOT (~TOS)")
        case 0x94:
            return DecodedInstruction(
                mnemonic: "SRS", bytesConsumed: 1, comment: "Subrange set [TOS-1..TOS]")
        case 0x95:
            return DecodedInstruction(
                mnemonic: "SBI", bytesConsumed: 1, comment: "Subtract integers (TOS-1 - TOS)")
        case 0x96:
            return DecodedInstruction(
                mnemonic: "SBR", bytesConsumed: 1, comment: "Subtract reals (TOS-1 - TOS)")
        case 0x97:
            return DecodedInstruction(
                mnemonic: "SGS", bytesConsumed: 1, comment: "Build singleton set [TOS]")
        case 0x98:
            return DecodedInstruction(
                mnemonic: "SQI", bytesConsumed: 1, comment: "Square integer (TOS * TOS)")
        case 0x99:
            return DecodedInstruction(
                mnemonic: "SQR", bytesConsumed: 1, comment: "Square real (TOS * TOS)")
        case 0x9A:
            return DecodedInstruction(
                mnemonic: "STO", bytesConsumed: 1, comment: "Store indirect word (TOS into TOS-1)")
        case 0x9B:
            return DecodedInstruction(
                mnemonic: "IXS", bytesConsumed: 1,
                comment: "Index string array (check 1<=TOS<=len of str TOS-1)")
        case 0x9C:
            return DecodedInstruction(
                mnemonic: "UNI", bytesConsumed: 1, comment: "Set union (TOS OR TOS-1)")
        case 0x9D:
            let seg = Int(try cd.readByte(at: ic + 1))
            let (val, inc) = try cd.readBig(at: ic + 2)
            return DecodedInstruction(
                mnemonic: "LDE",
                params: [seg, val],
                bytesConsumed: 2 + inc,
                comment: "Load extended word (word offset \(val) in data seg \(seg))")
        case 0x9E:
            let procNum = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "CSP",
                params: [procNum],
                bytesConsumed: 2,
                comment: "Call standard procedure \(cspProcs[procNum]?.0 ?? String(procNum))")
        case 0x9F:
            return DecodedInstruction(
                mnemonic: "LDCN", bytesConsumed: 1, comment: "Load constant NIL")
        case 0xA0:
            let count = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "ADJ", params: [count], bytesConsumed: 2,
                comment: "Adjust set to \(count) words")
        case 0xA1:
            let offset = Int(try cd.readByte(at: ic + 1))
            var dest: Int = 0
            if offset > 0x7f {
                let jte = addr + offset - 256
                dest = jte - Int(try cd.readWord(at: jte))
            } else {
                dest = ic + offset + 2
            }
            return DecodedInstruction(
                mnemonic: "FJP",
                params: [dest],
                bytesConsumed: 2,
                comment: "Jump if TOS false to \(String(format: "%04x", dest))")
        case 0xA2:
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                mnemonic: "INC", params: [val], bytesConsumed: 1 + inc,
                comment: "Inc field ptr (TOS+\(val))")
        case 0xA3:
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                mnemonic: "IND", params: [val], bytesConsumed: 1 + inc,
                comment: "Static index and load word (TOS+\(val))")
        case 0xA4:
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                mnemonic: "IXA", params: [val], bytesConsumed: 1 + inc,
                comment: "Index array (TOS-1 + TOS * \(val))")
        case 0xA5:
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc = Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
            return DecodedInstruction(
                mnemonic: "LAO", params: [val], bytesConsumed: 1 + inc,
                comment: "Load global address", memLocation: loc)
        case 0xA6:
            let strLen = Int(try cd.readByte(at: ic + 1))
            var s: String = ""
            if strLen > 0 {
                for i in 1...strLen {
                    let ch = try cd.readByte(at: ic + 1 + Int(i))
                    s += String(format: "%c", ch)
                }
            }
            return DecodedInstruction(
                mnemonic: "LSA", params: [strLen], bytesConsumed: 2 + strLen,
                comment: "Load string address: '" + s + "'")
        case 0xA7:
            let seg = Int(try cd.readByte(at: ic + 1))
            let (val, inc) = try cd.readBig(at: ic + 2)
            let loc = Location(segment: seg, procedure: 0, lexLevel: 0, addr: val)
            return DecodedInstruction(
                mnemonic: "LAE", params: [seg, val], bytesConsumed: 2 + inc,
                comment: "Load extended address", memLocation: loc)
        case 0xA8:
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                mnemonic: "MOV", params: [val], bytesConsumed: 1 + inc,
                comment: "Move \(val) words (TOS to TOS-1)")
        case 0xA9:
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc = Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
            return DecodedInstruction(
                mnemonic: "LDO", params: [val], bytesConsumed: 1 + inc, comment: "Load global word",
                memLocation: loc)
        case 0xAA:
            let sasCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "SAS", params: [sasCount], bytesConsumed: 2,
                comment: "String assign (TOS to TOS-1, \(sasCount) chars)")
        case 0xAB:
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc = Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
            return DecodedInstruction(
                mnemonic: "SRO", params: [val], bytesConsumed: 1 + inc,
                comment: "Store global word", memLocation: loc)
        case 0xAC:
            // XJP has variable-length jump table - size calculated in switch
            return DecodedInstruction(
                mnemonic: "XJP", params: [], bytesConsumed: 0, comment: "Case jump")
        case 0xAD:
            let retCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "RNP", params: [retCount], bytesConsumed: 2,
                comment: "Return from nonbase procedure")
        case 0xAE:
            let procNum = Int(try cd.readByte(at: ic + 1))
            let loc = Location(segment: currSeg.segNum, procedure: procNum)
            return DecodedInstruction(
                mnemonic: "CIP", params: [procNum], bytesConsumed: 2,
                comment: "Call intermediate procedure", destination: loc)
        case 0xAF:
            return DecodedInstruction(
                mnemonic: "EQL", bytesConsumed: 0, requiresComparator: true,
                comparatorOffset: ic + 1)
        case 0xB0:
            return DecodedInstruction(
                mnemonic: "GEQ", bytesConsumed: 0, requiresComparator: true,
                comparatorOffset: ic + 1)
        case 0xB1:
            return DecodedInstruction(
                mnemonic: "GRT", bytesConsumed: 0, requiresComparator: true,
                comparatorOffset: ic + 1)
        case 0xB2:
            let (val, inc) = try cd.readBig(at: ic + 2)
            let byte1 = try cd.readByte(at: ic + 1)
            let refLexLevel = proc.lexicalLevel - Int(byte1)
            let loc = Location(
                segment: refLexLevel < 0 ? 0 : currSeg.segNum, lexLevel: refLexLevel, addr: val)
            return DecodedInstruction(
                mnemonic: "LDA", params: [Int(byte1), val], bytesConsumed: 2 + inc,
                comment: "Load intermediate address", memLocation: loc)
        case 0xB3:
            // LDC has variable-length data - just return count, actual size calculated in switch
            let count = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "LDC", params: [count], bytesConsumed: 0,
                comment: "Load multiple-word constant")
        case 0xB4:
            return DecodedInstruction(
                mnemonic: "LEQ", bytesConsumed: 0, requiresComparator: true,
                comparatorOffset: ic + 1)
        case 0xB5:
            return DecodedInstruction(
                mnemonic: "LES", bytesConsumed: 0, requiresComparator: true,
                comparatorOffset: ic + 1)
        case 0xB6:
            let (val, inc) = try cd.readBig(at: ic + 2)
            let byte1 = try cd.readByte(at: ic + 1)
            let refLexLevel = proc.lexicalLevel - Int(byte1)
            let loc = Location(
                segment: refLexLevel < 0 ? 0 : currSeg.segNum, lexLevel: refLexLevel, addr: val)
            return DecodedInstruction(
                mnemonic: "LOD", params: [Int(byte1), val], bytesConsumed: 2 + inc,
                comment: "Load intermediate word", memLocation: loc)
        case 0xB7:
            return DecodedInstruction(
                mnemonic: "NEQ", bytesConsumed: 0, requiresComparator: true,
                comparatorOffset: ic + 1)
        case 0xB8:
            let (val, inc) = try cd.readBig(at: ic + 2)
            let byte1 = try cd.readByte(at: ic + 1)
            let refLexLevel = proc.lexicalLevel - Int(byte1)
            let loc = Location(
                segment: refLexLevel < 0 ? 0 : currSeg.segNum, lexLevel: refLexLevel, addr: val)
            return DecodedInstruction(
                mnemonic: "STR", params: [Int(byte1), val], bytesConsumed: 2 + inc,
                comment: "Store intermediate word", memLocation: loc)
        case 0xB9:
            let offset = Int(try cd.readByte(at: ic + 1))
            var dest: Int = 0
            if offset > 0x7f {
                let jte = addr + offset - 256
                dest = jte - Int(try cd.readWord(at: jte))
            } else {
                dest = ic + offset + 2
            }
            return DecodedInstruction(
                mnemonic: "UJP",
                params: [dest],
                bytesConsumed: 2,
                comment: "Unconditional jump to \(String(format: "%04x", dest))")
        case 0xBA:
            return DecodedInstruction(
                mnemonic: "LDP", bytesConsumed: 1, comment: "Load packed field (TOS)")
        case 0xBB:
            return DecodedInstruction(
                mnemonic: "STP", bytesConsumed: 1, comment: "Store packed field (TOS into TOS-1)")
        case 0xBC:
            let ldmCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "LDM", params: [ldmCount], bytesConsumed: 2,
                comment: "Load \(ldmCount) words from (TOS)")
        case 0xBD:
            let stmCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "STM", params: [stmCount], bytesConsumed: 2,
                comment: "Store \(stmCount) words at TOS to TOS-1")
        case 0xBE:
            return DecodedInstruction(
                mnemonic: "LDB", bytesConsumed: 1, comment: "Load byte at byte ptr TOS-1 + TOS")
        case 0xBF:
            return DecodedInstruction(
                mnemonic: "STB", bytesConsumed: 1,
                comment: "Store byte at TOS to byte ptr TOS-2 + TOS-1")
        case 0xC0:
            let elementsPerWord = Int(try cd.readByte(at: ic + 1))
            let fieldWidth = Int(try cd.readByte(at: ic + 2))
            return DecodedInstruction(
                mnemonic: "IXP",
                params: [elementsPerWord, fieldWidth],
                bytesConsumed: 3,
                comment:
                    "Index packed array TOS-1[TOS], \(elementsPerWord) elts/word, \(fieldWidth) field width"
            )
        case 0xC1:
            let retCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "RBP", params: [retCount], bytesConsumed: 2,
                comment: "Return from base procedure")
        case 0xC2:
            let procNum = Int(try cd.readByte(at: ic + 1))
            let loc = Location(segment: currSeg.segNum, procedure: procNum)
            return DecodedInstruction(
                mnemonic: "CBP", params: [procNum], bytesConsumed: 2,
                comment: "Call base procedure", destination: loc)
        case 0xC3:
            return DecodedInstruction(
                mnemonic: "EQUI", bytesConsumed: 1, comment: "Integer TOS-1 = TOS")
        case 0xC4:
            return DecodedInstruction(
                mnemonic: "GEQI", bytesConsumed: 1, comment: "Integer TOS-1 >= TOS")
        case 0xC5:
            return DecodedInstruction(
                mnemonic: "GRTI", bytesConsumed: 1, comment: "Integer TOS-1 > TOS")
        case 0xC6:
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc = Location(
                segment: currSeg.segNum, procedure: proc.procType?.procedure,
                lexLevel: proc.lexicalLevel, addr: val)
            return DecodedInstruction(
                mnemonic: "LLA", params: [val], bytesConsumed: 1 + inc,
                comment: "Load local address", memLocation: loc)
        case 0xC7:
            let val = Int(try cd.readWord(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "LDCI", params: [val], bytesConsumed: 3,
                comment: "Load one-word constant \(val)")
        case 0xC8:
            return DecodedInstruction(
                mnemonic: "LEQI", bytesConsumed: 1, comment: "Integer TOS-1 <= TOS")
        case 0xC9:
            return DecodedInstruction(
                mnemonic: "LESI", bytesConsumed: 1, comment: "Integer TOS-1 < TOS")
        case 0xCA:
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc = Location(
                segment: currSeg.segNum, procedure: proc.procType?.procedure,
                lexLevel: proc.lexicalLevel, addr: val)
            return DecodedInstruction(
                mnemonic: "LDL", params: [val], bytesConsumed: 1 + inc, comment: "Load local word",
                memLocation: loc)
        case 0xCB:
            return DecodedInstruction(
                mnemonic: "NEQI", bytesConsumed: 1, comment: "Integer TOS-1 <> TOS")
        case 0xCC:
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc = Location(
                segment: currSeg.segNum, procedure: proc.procType?.procedure,
                lexLevel: proc.lexicalLevel, addr: val)
            return DecodedInstruction(
                mnemonic: "STL", params: [val], bytesConsumed: 1 + inc, comment: "Store local word",
                memLocation: loc)
        case 0xCD:
            let seg = Int(try cd.readByte(at: ic + 1))
            let procNum = Int(try cd.readByte(at: ic + 2))
            let loc = Location(segment: seg, procedure: procNum)
            return DecodedInstruction(
                mnemonic: "CXP", params: [seg, procNum], bytesConsumed: 3,
                comment: "Call external procedure", destination: loc)
        case 0xCE:
            let procNum = Int(try cd.readByte(at: ic + 1))
            let loc = Location(segment: currSeg.segNum, procedure: procNum)
            return DecodedInstruction(
                mnemonic: "CLP", params: [procNum], bytesConsumed: 2,
                comment: "Call local procedure", destination: loc)
        case 0xCF:
            let procNum = Int(try cd.readByte(at: ic + 1))
            let loc = Location(segment: currSeg.segNum, procedure: procNum)
            return DecodedInstruction(
                mnemonic: "CGP", params: [procNum], bytesConsumed: 2,
                comment: "Call global procedure", destination: loc)
        case 0xD0:
            let count = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "LPA", params: [count], bytesConsumed: 2 + count,
                comment: "Load packed array")
        case 0xD1:
            let seg = Int(try cd.readByte(at: ic + 1))
            let (val, inc) = try cd.readBig(at: ic + 2)
            let loc = Location(segment: seg, procedure: 0, lexLevel: 0, addr: val)
            return DecodedInstruction(
                mnemonic: "STE", params: [seg, val], bytesConsumed: 2 + inc,
                comment: "Store extended word TOS into", memLocation: loc)
        case 0xD2:
            return DecodedInstruction(mnemonic: "NOP", bytesConsumed: 1, comment: "No operation")
        case 0xD5:
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                mnemonic: "BPT", params: [val], bytesConsumed: 1 + inc, comment: "Breakpoint")
        case 0xD6:
            return DecodedInstruction(
                mnemonic: "XIT", bytesConsumed: 1, comment: "Exit the operating system")
        case 0xD7:
            return DecodedInstruction(mnemonic: "NOP", bytesConsumed: 1, comment: "No operation")
        case 0xD8...0xE7:
            let b = Int(opcode)
            let val = b - 0xd7
            let loc = Location(
                segment: currSeg.segNum, procedure: proc.procType?.procedure,
                lexLevel: proc.lexicalLevel, addr: val)
            return DecodedInstruction(
                mnemonic: "SLDL", params: [val], bytesConsumed: 1, comment: "Short load local word",
                memLocation: loc)
        case 0xE8...0xF7:
            let b2 = Int(opcode)
            let val = b2 - 0xe7
            let loc = Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
            return DecodedInstruction(
                mnemonic: "SLDO", params: [val], bytesConsumed: 1,
                comment: "Short load global word", memLocation: loc)
        case 0xF8...0xFF:
            let b3 = Int(opcode)
            let offs = b3 - 0xf8
            return DecodedInstruction(
                mnemonic: "SIND", params: [offs], bytesConsumed: 1,
                comment: "Short index and load word *TOS+\(offs)")
        default:
            throw CodeDataError.unexpectedEndOfData
        }
    }

    func decodeComparator(at index: Int) -> (suffix: String, prefix: String, increment: Int) {
        guard let b = try? cd.readByte(at: index) else {
            return ("", "", 1)
        }
        switch b {
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
        default:
            return ("", "", 1)
        }
    }
}

// MARK: - Stack Simulator

/// Manages the symbolic execution stack during P-code decoding
struct StackSimulator {
    var stack: [String] = []

    mutating func push(_ value: String) {
        stack.append(value)
    }

    mutating func pushReal(_ value: String) {
        stack.append("REAL(\(value))")
    }

    @discardableResult
    mutating func pop() -> String {
        return stack.popLast() ?? "underflow!"
    }

    @discardableResult
    mutating func popReal() -> String {
        let a = stack.popLast() ?? "underflow!"
        if a.starts(with: "REAL(") {
            return a
        } else {
            let b = stack.popLast() ?? "underflow!"
            if let val1 = UInt16(a), let val2 = UInt16(b) {
                let fraction: UInt32 = UInt32(val1) | (UInt32(val2) & 0x007f) << 16
                let exponent = (val2 & 0x7f80) < 7
                let sign = (val2 & 0x8000) == 0x8000
                return "\(sign == true  ? "-" : "")\(fraction)e\(exponent)"
            } else {
                return "\(a).\(b)"
            }
        }
    }

    @discardableResult
    mutating func popSet() -> (Int, String) {
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

    func snapshot() -> [String] {
        return stack
    }
}

// MARK: - Pseudo-code Generator

/// Generates high-level pseudo-code from decoded instructions and stack states
struct PseudoCodeGenerator {
    let procLookup: [String: ProcIdentifier]
    let labelLookup: [String: Location]

    func findLabel(_ loc: Location) -> String? {
        let key = "\(loc.segment):\(loc.procedure ?? -1):\(loc.addr ?? -1)"
        return labelLookup[key]?.name
    }

    func generateForInstruction(
        _ inst: OpcodeDecoder.DecodedInstruction,
        stack: inout StackSimulator,
        loc: Location?
    ) -> String? {
        switch inst.mnemonic {
        case "STO", "SAS":
            let src = stack.pop()
            let dest = stack.pop()
            return "\(dest) := \(src)"
        case "MOV":
            let src = stack.pop()
            let dst = stack.pop()
            return "\(dst) := \(src)"
        case "STP":
            let a = stack.pop()
            let bbit = stack.pop()
            let bwid = stack.pop()
            let b = stack.pop()
            return "\(b):\(bwid):\(bbit) := \(a)"
        case "STB":
            let src = stack.pop()
            let dstoffs = stack.pop()
            let dstaddr = stack.pop()
            return "byteptr(\(dstaddr) + \(dstoffs)) := \(src)"
        case "SRO", "STR", "STL", "STE":
            let src = stack.pop()
            if let memLoc = inst.memLocation {
                return "\(findLabel(memLoc) ?? memLoc.description) := \(src)"
            }
            return nil
        case "CIP", "CBP", "CXP", "CLP", "CGP":
            if let dest = inst.destination {
                return handleCallProcedure(dest, stack: &stack)
            }
            return nil
        default:
            return nil
        }
    }

    func handleCallProcedure(_ loc: Location, stack: inout StackSimulator) -> String? {
        let lookupKey = "\(loc.segment):\(loc.procedure ?? -1)"
        guard let called = procLookup[lookupKey] else {
            return nil
        }

        let parmCount = called.parameters.count
        var aParams: [String] = []
        if called.isFunction {
            _ = stack.pop()
            _ = stack.pop()
        }
        for _ in 0..<parmCount {
            aParams.append(stack.pop())
        }

        let callSignature =
            "\(called.shortDescription)(\(aParams.reversed().joined(separator:", ")))"

        if called.isFunction {
            stack.push(callSignature)
            return nil
        } else {
            return callSignature
        }
    }

    func generateControlFlow(
        _ inst: OpcodeDecoder.DecodedInstruction, ic: Int, stack: inout StackSimulator
    ) -> String? {
        switch inst.mnemonic {
        case "FJP":
            guard let dest = inst.params.first else { return nil }
            if dest > ic {
                return "IF \(stack.pop()) THEN BEGIN"
            } else {
                return "UNTIL \(stack.pop())"
            }
        case "UJP":
            guard let dest = inst.params.first else { return nil }
            return "GOTO LAB\(dest)"
        default:
            return nil
        }
    }
}

// MARK: - Pascal Procedure Decoder
func decodePascalProcedure(
    currSeg: Segment, 
    proc: inout Procedure, 
    code: Data, 
    addr: Int,
    callers: inout Set<Call>,
    allLocations: inout Set<Location>, 
    allProcedures: inout [ProcIdentifier],
    allLabels: inout Set<Location>,
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
    var flagForEnd: Set<Int> = []
    var flagForLabel: Set<Int> = []
    var ic = proc.enterIC
    var done: Bool = false
    proc.entryPoints.insert(proc.enterIC)
    proc.entryPoints.insert(proc.exitIC)
    let myLoc = Location(segment: currSeg.segNum, procedure: proc.procType?.procedure)

    // Build lookup dictionaries for O(1) access instead of O(n) linear searches
    var procLookup: [String: ProcIdentifier] = [:]
    for p in allProcedures {
        let key = "\(p.segment):\(p.procedure)"
        procLookup[key] = p
    }

    var labelLookup: [String: Location] = [:]
    for label in allLabels {
        let key = "\(label.segment):\(label.procedure ?? -1):\(label.addr ?? -1)"
        labelLookup[key] = label
    }

    // Initialize components for clean separation of concerns
    let decoder = OpcodeDecoder(cd: cd)  // TODO: Use decoder.decode() in refactored loop
    var simulator = StackSimulator()
    let pseudoGen = PseudoCodeGenerator(procLookup: procLookup, labelLookup: labelLookup)

    // Alias for backward compatibility during refactoring
    var currentStack: [String] {
        get { simulator.stack }
        set { simulator.stack = newValue }
    }

    // Helper to lookup label by Location
    func findLabel(_ loc: Location) -> String? {
        let key = "\(loc.segment):\(loc.procedure ?? -1):\(loc.addr ?? -1)"
        return labelLookup[key]?.name
    }

    // Decode loop: uses new architecture for clean separation of decoding, simulation, and generation
    while ic < addr && !done {
        let currentIC = ic
        do {
            let opcode = try cd.readByte(at: ic)

            // Decode the instruction using the new architecture
            var decoded: OpcodeDecoder.DecodedInstruction
            if let cachedDecoded = try? decoder.decode(
                opcode: opcode, at: ic, currSeg: currSeg, proc: proc, addr: addr)
            {
                decoded = cachedDecoded
            } else {
                // Fallback for any decode errors
                if verbose {
                    print("Decode error at IC \(String(format: "%04x", ic)) in proc \(proc.procType?.shortDescription ?? "unknown")")
                }
                return
            }

            // Handle comparator opcodes specially
            var finalMnemonic = decoded.mnemonic
            var finalComment = decoded.comment
            var bytesConsumed = decoded.bytesConsumed

            if decoded.requiresComparator {
                let (suffix, prefix, inc) = decoder.decodeComparator(at: decoded.comparatorOffset)
                finalMnemonic += suffix
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
            case 0x00..<0x80:
                simulator.push(String(opcode))
                ic += bytesConsumed
            case 0x80:
                // ABI: Absolute value of integer (TOS)
                let a = simulator.pop()
                simulator.push("ABI(\(a))")
                ic += bytesConsumed
            case 0x81:
                // ABR: Absolute value of real (TOS)
                let a = simulator.popReal()
                simulator.pushReal("ABR(\(a))")
                ic += bytesConsumed
            case 0x82:
                // ADI: Add integers (TOS + TOS-1)
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) + \(a))")
                ic += bytesConsumed
            case 0x83:
                // ADR: Add reals (TOS + TOS-1)
                let a = simulator.popReal()
                let b = simulator.popReal()
                simulator.pushReal("(\(a) + \(b))")
                ic += bytesConsumed
            case 0x84:
                // LAND: Logical AND (TOS & TOS-1)
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) AND \(a))")
                ic += bytesConsumed
            case 0x85:
                // DIF: Set difference (TOS-1 AND NOT TOS)
                let (set1Len, set1) = simulator.popSet()
                let (set2Len, set2) = simulator.popSet()
                let maxLen = max(set1Len, set2Len)
                for i in 0..<maxLen {
                    simulator.push("(\(set2) AND NOT \(set1))[\(i)]")
                }
                simulator.push("\(maxLen)")
                ic += bytesConsumed
            case 0x86:
                // DVI: Divide integers (TOS-1 / TOS)
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) / \(a))")
                ic += bytesConsumed
            case 0x87:
                // DVR: Divide reals (TOS-1 / TOS)
                let a = simulator.popReal()
                let b = simulator.popReal()
                simulator.pushReal("\(b) / \(a)")
                ic += bytesConsumed
            case 0x88:
                // CHK: Check subrange (TOS-1 <= TOS-2 <= TOS)
                let _ = simulator.pop()
                let _ = simulator.pop()
                let c = simulator.pop()
                simulator.push(c)
                ic += bytesConsumed
            case 0x89:
                // FLO: Float next to TOS (int TOS-1 to real TOS)
                let a = simulator.pop()  // TOS
                let b = simulator.pop()  // TOS-1
                simulator.push(a)  // put previous TOS back
                simulator.pushReal(b)  // real(TOS-1)->TOS
                ic += bytesConsumed
            case 0x8A:
                // FLT: Float TOS (int TOS to real TOS)
                let a = simulator.pop()
                simulator.pushReal(a)
                ic += bytesConsumed
            case 0x8B:
                // INN: Set membership (TOS-1 in set TOS)
                let (_, set) = simulator.popSet()
                let chk = simulator.pop()
                simulator.push("\(chk) IN \(set)")
                ic += bytesConsumed
            case 0x8C:
                // INT: Set intersection (TOS AND TOS-1)
                let (set1Len, set1) = simulator.popSet()
                let (set2Len, set2) = simulator.popSet()
                let maxLen = max(set1Len, set2Len)
                for i in 0..<maxLen {
                    simulator.push("(\(set1) AND \(set2))[\(i)]")
                }
                simulator.push("\(maxLen)")
                ic += bytesConsumed
            case 0x8D:
                // LOR: Logical OR (TOS | TOS-1)
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("\(b) OR \(a)")
                ic += bytesConsumed
            case 0x8E:
                // MODI: Modulo integers (TOS-1 % TOS)
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) % \(a))")
                ic += bytesConsumed
            case 0x8F:
                // MPI: Multiply integers (TOS * TOS-1)
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) * \(a))")
                ic += bytesConsumed
            case 0x90:
                // MPR: Multiply reals (TOS * TOS-1)
                let a = simulator.popReal()
                let b = simulator.popReal()
                simulator.pushReal("\(b) * \(a)")
                ic += bytesConsumed
            case 0x91:
                // NGI: Negate integer
                let a = simulator.pop()
                simulator.push("-\(a)")
                ic += bytesConsumed
            case 0x92:
                // NGR: Negate real
                let a = simulator.popReal()
                simulator.pushReal("-\(a)")
                ic += bytesConsumed
            case 0x93:
                // LNOT: Logical NOT (~TOS)
                let a = simulator.pop()
                simulator.push("NOT (\(a))")
                ic += bytesConsumed
            case 0x94:
                // SRS: Subrange set [TOS-1..TOS] (creates set on stack)
                let a = simulator.pop()
                let b = simulator.pop()
                if let av = Int(a) {
                    let wordsRequired = (av + 1) % 16
                    for i in 0..<wordsRequired {
                        simulator.push("(\(b)..\(a))[\(i)]")
                    }
                    simulator.push("\(wordsRequired)")
                } else {
                    // fudge... no way to know how big it will be!
                    simulator.push("\(b)..\(a)")
                    simulator.push("1")
                }
                ic += bytesConsumed
            case 0x95:
                // SBI: Subtract integers (TOS-1 - TOS)
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) - \(a))")
                ic += bytesConsumed
            case 0x96:
                // SBR: Subtract reals (TOS-1 - TOS)
                let a = simulator.popReal()
                let b = simulator.popReal()
                simulator.pushReal("(\(b) - \(a))")
                ic += bytesConsumed
            case 0x97:
                // SGS: Build singleton set [TOS]
                let a = simulator.pop()
                if let av = Int(a) {
                    let wordsRequired = (av + 1) % 16
                    for i in 0..<wordsRequired {
                        simulator.push("(\(a))[\(i)]")
                    }
                    simulator.push("\(wordsRequired)")
                } else {
                    simulator.push("[\(a)]")
                    simulator.push("1")
                }
                ic += bytesConsumed
            case 0x98:
                // SQI: Square integer (TOS * TOS)
                let a = simulator.pop()
                simulator.push("(\(a) * \(a))")
                ic += bytesConsumed
            case 0x99:
                // SQR: Square real (TOS * TOS)
                let a = simulator.popReal()
                simulator.pushReal("(\(a) * \(a))")
                ic += bytesConsumed
            case 0x9A:
                // STO: Store indirect word (TOS into TOS-1)
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case 0x9B:
                // IXS: Index string array (check 1 <= TOS <= len of str byte ptr TOS-1)
                // doesn't store anything on the stack - it would throw exec error if it fails
                _ = simulator.pop()  // discard index
                _ = simulator.pop()  // discard byte ptr offset
                _ = simulator.pop()  // discard byte ptr base
                ic += bytesConsumed
            case 0x9C:
                // UNI: Set union (TOS OR TOS-1)
                let (set1Len, set1) = simulator.popSet()
                let (set2Len, set2) = simulator.popSet()
                let maxLen = max(set1Len, set2Len)
                for i in 0..<maxLen {
                    simulator.push("(\(set1) OR \(set2))[\(i)]")
                }
                simulator.push("\(maxLen)")
                proc.instructions[ic] = Instruction(
                    mnemonic: "UNI", comment: "Set union (TOS OR TOS-1)", stackState: currentStack)
                ic += bytesConsumed
            case 0x9D:
                // LDE: Load extended word (pushes value onto stack)
                let seg = decoded.params[0]
                let val = decoded.params[1]
                simulator.push("LDE[\(seg):\(val)]")
                ic += bytesConsumed
            case 0x9E:
                // CSP: Call standard procedure
                let procNum = Int(try cd.readByte(at: ic + 1))
                var pseudoCode: String? = nil
                if let (cspName, parms, ret) = cspProcs[procNum] {
                    var callParms: [String] = []
                    for p in parms {
                        if p.type == "REAL" {
                            callParms.append("\(simulator.popReal())")
                        } else {
                            callParms.append("\(simulator.pop())")
                        }
                    }
                    if !ret.isEmpty {
                        if ret == "REAL" {
                            simulator.pushReal(
                                "\(cspName)(\(callParms.reversed().joined(separator:", ")))")
                        } else {
                            simulator.push(
                                "\(cspName)(\(callParms.reversed().joined(separator:", ")))")
                        }
                    } else {
                        // no return value
                        pseudoCode = "\(cspName)(\(callParms.reversed().joined(separator:", ")))"

                    }
                }
                proc.instructions[ic] = Instruction(
                    mnemonic: "CSP", params: [procNum],
                    comment: "Call standard procedure \(cspProcs[procNum]?.0 ?? String(procNum))",
                    stackState: currentStack, pseudoCode: pseudoCode)
                ic += 2
            case 0x9F:
                simulator.push("NIL")
                ic += bytesConsumed
            case 0xA0:
                let count = decoded.params[0]
                let (_, set) = simulator.popSet()
                for i in 0..<count {
                    simulator.push("\(set)[\(i)]")
                }
                ic += bytesConsumed
            case 0xA1:
                let dest = decoded.params[0]
                if dest > ic {  // jumping forward so an IF
                    flagForEnd.insert(dest)
                    pseudoCode = "IF \(simulator.pop()) THEN BEGIN"
                } else {  // jumping backwards so a REPEAT/UNTIL
                    proc.instructions[dest]?.prePseudoCode = "REPEAT"
                    pseudoCode = "UNTIL \(simulator.pop())"
                }
                proc.entryPoints.insert(dest)
                ic += bytesConsumed
            case 0xA2:
                let val = decoded.params[0]
                let a = simulator.pop()
                simulator.push("(\(a) + \(val))")
                ic += bytesConsumed
            case 0xA3:
                let val = decoded.params[0]
                let a = simulator.pop()
                simulator.push("(\(a) + \(val))")
                ic += bytesConsumed
            case 0xA4:
                let _ = decoded.params[0]  // Element size, used for address calculation but not in pseudo-code
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("\(b)[\(a)]")
                ic += bytesConsumed
            case 0xA5:
                if let loc = decoded.memLocation {
                    simulator.push("\(findLabel(loc) ?? loc.description)")
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case 0xA6:
                let strLen = decoded.params[0]
                var s: String = ""
                if strLen > 0 {
                    for i in 1...strLen {
                        if let ch = try? cd.readByte(at: ic + 1 + Int(i)) {
                            s += String(format: "%c", ch)
                        }
                    }
                }
                simulator.push("\"\(s)\"")
                ic += bytesConsumed
            case 0xA7:
                if let loc = decoded.memLocation {
                    simulator.push("\(findLabel(loc) ?? loc.description)")
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case 0xA8:
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case 0xA9:
                if let loc = decoded.memLocation {
                    simulator.push("\(findLabel(loc) ?? loc.description)")
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case 0xAA:
                // SAS: String assign
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case 0xAB:
                if let loc = decoded.memLocation {
                    allLocations.insert(loc)
                    pseudoCode = pseudoGen.generateForInstruction(
                        decoded, stack: &simulator, loc: loc)
                }
                ic += bytesConsumed
            case 0xAC:
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
            case 0xAD:
                let retCount = decoded.params[0]
                proc.procType?.isFunction = (retCount > 0)
                ic += bytesConsumed
                done = true
            case 0xAE:
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc = Location(segment: currSeg.segNum, procedure: procNum)
                if procNum != proc.procType?.procedure {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                let pseudoCode = pseudoGen.handleCallProcedure(loc, stack: &simulator)
                proc.instructions[ic] = Instruction(
                    mnemonic: "CIP", params: [procNum], destination: loc,
                    comment: "Call intermediate procedure", stackState: currentStack,
                    pseudoCode: pseudoCode)
                allLocations.insert(loc)
                ic += 2
            case 0xAF:
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) = \(a))")
                ic += bytesConsumed
            case 0xB0:
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) >= \(a))")
                ic += bytesConsumed
            case 0xB1:
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) > \(a))")
                ic += bytesConsumed
            case 0xB2:
                if let loc = decoded.memLocation {
                    simulator.push("\(findLabel(loc) ?? loc.description)")
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case 0xB3:
                // LDC is special: needs manual size calculation due to variable-length word-aligned data
                let count = decoded.params[0]
                var tempIC = ic + 2
                if tempIC % 2 != 0 { tempIC += 1 }  // word aligned data
                var extraComment = String(repeating: " ", count: 17)
                for i in (0..<count).reversed() {  // words are in reverse order
                    let val = Int(try cd.readWord(at: tempIC + i * 2))
                    simulator.push("\(val)")
                    extraComment += String(format: "%04x ", val)
                }
                // Override comment with word data
                finalComment = "Load multiple-word constant\n" + extraComment
                // Calculate actual bytes consumed including alignment
                bytesConsumed = 2 + (ic % 2 == 0 ? 0 : 1) + count * 2
                ic += bytesConsumed
            case 0xB4:
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) <= \(a))")
                ic += bytesConsumed
            case 0xB5:
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) < \(a))")
                ic += bytesConsumed
            case 0xB6:
                if let loc = decoded.memLocation {
                    simulator.push("\(findLabel(loc) ?? loc.description)")
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case 0xB7:
                if finalMnemonic.hasSuffix("SET") {
                    let (_, a) = simulator.popSet()
                    let (_, b) = simulator.popSet()
                    simulator.push("(\(b) <> \(a))")
                } else {
                    let a = simulator.pop()
                    let b = simulator.pop()
                    simulator.push("(\(b) <> \(a))")
                }
                ic += bytesConsumed
            case 0xB8:
                if let loc = decoded.memLocation {
                    allLocations.insert(loc)
                    pseudoCode = pseudoGen.generateForInstruction(
                        decoded, stack: &simulator, loc: loc)
                }
                ic += bytesConsumed
            case 0xB9:
                let dest = decoded.params[0]
                if dest > ic {  // jumping forward so an IF
                    flagForLabel.insert(dest)
                    pseudoCode = "GOTO LAB\(dest)"
                } else {
                    // jumping backwards, likely a loop - probably a while.
                    // TODO, handle that
                    flagForLabel.insert(dest)
                    pseudoCode = "GOTO LAB\(dest)"
                }
                proc.entryPoints.insert(dest)
                ic += bytesConsumed
            case 0xBA:
                let abit = simulator.pop()
                let awid = simulator.pop()
                let a = simulator.pop()
                simulator.push("\(a):\(awid):\(abit)")
                ic += bytesConsumed
            case 0xBB:
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case 0xBC:
                let ldmCount = decoded.params[0]
                let wdOrigin = simulator.pop()
                for i in 0..<ldmCount {
                    simulator.push("\(wdOrigin)[\(i)]")
                }
                ic += bytesConsumed
            case 0xBD:
                // STM: Store multiple words (pops from stack)
                let stmCount = decoded.params[0]
                for _ in 0..<stmCount {
                    _ = simulator.pop()
                }
                _ = simulator.pop()  // destination address
                ic += bytesConsumed
            case 0xBE:
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("byteptr(\(b) + \(a))")
                ic += bytesConsumed
            case 0xBF:
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case 0xC0:
                let elementsPerWord = decoded.params[0]
                let fieldWidth = decoded.params[1]
                let idx = simulator.pop()
                let basePtr = simulator.pop()
                simulator.push(basePtr)
                simulator.push("\(fieldWidth)")
                simulator.push("\(idx)*\(elementsPerWord)")
                ic += bytesConsumed
            case 0xC1:
                let retCount = decoded.params[0]
                proc.procType?.isFunction = (retCount > 0)
                ic += bytesConsumed
                done = true
            case 0xC2:
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc = Location(segment: currSeg.segNum, procedure: procNum)
                if procNum != proc.procType?.procedure {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                let pseudoCode = pseudoGen.handleCallProcedure(loc, stack: &simulator)
                proc.instructions[ic] = Instruction(
                    mnemonic: "CBP", params: [procNum], destination: loc,
                    comment: "Call base procedure", stackState: currentStack, pseudoCode: pseudoCode
                )
                allLocations.insert(loc)
                ic += 2
            case 0xC3:
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) = \(a))")
                ic += bytesConsumed
            case 0xC4:
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) >= \(a))")
                ic += bytesConsumed
            case 0xC5:
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) > \(a))")
                proc.instructions[ic] = Instruction(
                    mnemonic: "GRTI", comment: "Integer TOS-1 > TOS", stackState: currentStack)
                ic += 1
            case 0xC6:
                let (val, inc) = try cd.readBig(at: ic + 1)
                let loc = Location(
                    segment: currSeg.segNum, procedure: proc.procType?.procedure,
                    lexLevel: proc.lexicalLevel, addr: val)
                currentStack.append(
                    "\(findLabel(loc) ?? loc.description)"
                )
                proc.instructions[ic] = Instruction(
                    mnemonic: "LLA", params: [val], memLocation: loc, comment: "Load local address",
                    stackState: currentStack)
                allLocations.insert(loc)
                ic += (1 + inc)
            case 0xC7:
                let val = decoded.params[0]
                simulator.push(String(val))
                ic += bytesConsumed
            case 0xC8:
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) <= \(a))")
                ic += bytesConsumed
            case 0xC9:
                let a = simulator.pop()
                if a.contains("_") {
                    let sa = a.split(separator: "_")
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
                    if let l = allLabels.first(where: {
                        $0.addr == addr && $0.segment == seg && $0.procedure == proc
                    }) {
                        allLabels.remove(l)
                        l.type = "INTEGER"
                        allLabels.insert(l)
                    }
                }
                let b = simulator.pop()
                simulator.push("(\(b) < \(a))")
                ic += bytesConsumed
            case 0xCA:
                if let loc = decoded.memLocation {
                    simulator.push("\(findLabel(loc) ?? loc.description)")
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case 0xCB:
                let a = simulator.pop()
                let b = simulator.pop()
                simulator.push("(\(b) <> \(a))")
                ic += bytesConsumed
            case 0xCC:
                if let loc = decoded.memLocation {
                    allLocations.insert(loc)
                    pseudoCode = pseudoGen.generateForInstruction(
                        decoded, stack: &simulator, loc: loc)
                }
                ic += bytesConsumed
            case 0xCD:
                let seg = Int(try cd.readByte(at: ic + 1))
                let procNum = Int(try cd.readByte(at: ic + 2))
                let loc = Location(segment: seg, procedure: procNum)
                if procNum != proc.procType?.procedure || seg != currSeg.segNum {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                let pseudoCode = pseudoGen.handleCallProcedure(loc, stack: &simulator)
                proc.instructions[ic] = Instruction(
                    mnemonic: "CXP", params: [seg, procNum], destination: loc,
                    comment: "Call external procedure", stackState: currentStack,
                    pseudoCode: pseudoCode)
                allLocations.insert(loc)
                ic += 3
            case 0xCE:
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc: Location = Location(segment: currSeg.segNum, procedure: procNum)
                if procNum != proc.procType?.procedure {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                let pseudoCode = pseudoGen.handleCallProcedure(loc, stack: &simulator)
                proc.instructions[ic] = Instruction(
                    mnemonic: "CLP", params: [procNum], destination: loc,
                    comment: "Call local procedure", stackState: currentStack,
                    pseudoCode: pseudoCode)
                allLocations.insert(loc)
                ic += 2
            case 0xCF:
                let procNum = Int(try cd.readByte(at: ic + 1))
                let loc = Location(segment: currSeg.segNum, procedure: procNum)
                if procNum != proc.procType?.procedure {  // don't add if recursive
                    callers.insert(Call(from: myLoc, to: loc))
                }
                let pseudoCode = pseudoGen.handleCallProcedure(loc, stack: &simulator)
                proc.instructions[ic] = Instruction(
                    mnemonic: "CGP", params: [procNum], destination: loc,
                    comment: "Call global procedure", stackState: currentStack,
                    pseudoCode: pseudoCode)
                allLocations.insert(loc)
                ic += 2
            case 0xD0:
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
                simulator.push("'\(txtRep)'")
                ic += bytesConsumed
            case 0xD1:
                if let loc = decoded.memLocation {
                    allLocations.insert(loc)
                    pseudoCode = pseudoGen.generateForInstruction(
                        decoded, stack: &simulator, loc: loc)
                }
                ic += bytesConsumed
            case 0xD2:
                // NOP: No operation
                ic += bytesConsumed
            case 0xD3:
                // Unknown opcode
                ic += bytesConsumed
            case 0xD4:
                // Unknown opcode
                ic += bytesConsumed
            case 0xD5:
                // BPT: Breakpoint
                ic += bytesConsumed
            case 0xD6:
                // XIT: Exit the operating system
                proc.procType?.isFunction = false  // AFAIK only the PASCALSYSTEM.PASCALSYSTEM procedure ever calls this
                ic += bytesConsumed
                done = true
            case 0xD7:
                // NOP: No operation
                ic += bytesConsumed
            case 0xD8...0xE7:
                if let loc = decoded.memLocation {
                    simulator.push("\(findLabel(loc) ?? loc.description)")
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case 0xE8...0xF7:
                if let loc = decoded.memLocation {
                    simulator.push("\(findLabel(loc) ?? loc.description)")
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case 0xF8...0xFF:
                let offs = decoded.params[0]
                let a = simulator.pop()
                simulator.push("*(\(a) + \(offs))")
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
                    mnemonic: finalMnemonic,
                    params: decoded.params,
                    memLocation: memLoc,
                    destination: dest,
                    comment: finalComment,
                    stackState: currentStack,
                    pseudoCode: pseudoCode)
            }

            // Apply control flow markers
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
                proc.procType?.parameters.append(Identifier(name: "PARAM\(parmnum)", type: "UNKNOWN"))
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
