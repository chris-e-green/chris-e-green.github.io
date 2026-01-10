import Foundation

// MARK: - Opcode Decoder

/// Handles decoding of P-code opcodes and extracting instruction parameters
struct OpcodeDecoder {
    let cd: CodeData

    struct DecodedInstruction {
        let opcode: UInt8
        let mnemonic: String
        let params: [Int]
        let bytesConsumed: Int
        let comment: String?
        let memLocation: Location?
        let destination: Location?
        let requiresComparator: Bool
        let comparatorOffset: Int

        init(
            opcode: UInt8, mnemonic: String, params: [Int] = [], bytesConsumed: Int,
            comment: String? = nil,
            memLocation: Location? = nil, destination: Location? = nil,
            requiresComparator: Bool = false, comparatorOffset: Int = 0
        ) {
            self.opcode = opcode
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

    func decode(
        opcode: UInt8,
        at ic: Int,
        currSeg: Segment,
        segment: Int,
        procedure: Int,
        proc: Procedure,
        addr: Int,
        allLocations: inout Set<Location>
    ) throws
        -> DecodedInstruction
    {
        switch opcode {
        case sldc0...sldc127:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "SLDC",
                params: [Int(opcode)],
                bytesConsumed: 1,
                comment: "Short load one-word constant \(opcode)")
        case abi:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "ABI",
                bytesConsumed: 1,
                comment: "Absolute value of integer (TOS)")
        case abr:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "ABR",
                bytesConsumed: 1,
                comment: "Absolute value of real (TOS)")
        case adi:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "ADI",
                bytesConsumed: 1,
                comment: "Add integers (TOS + TOS-1)")
        case adr:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "ADR",
                bytesConsumed: 1,
                comment: "Add reals (TOS + TOS-1)")
        case land:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LAND", 
                bytesConsumed: 1, 
                comment: "Logical AND (TOS & TOS-1)")
        case dif:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "DIF", 
                bytesConsumed: 1, 
                comment: "Set difference (TOS-1 AND NOT TOS)")
        case dvi:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "DVI", 
                bytesConsumed: 1, 
                comment: "Divide integers (TOS-1 / TOS)")
        case dvr:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "DVR", 
                bytesConsumed: 1, 
                comment: "Divide reals (TOS-1 / TOS)")
        case chk:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "CHK", 
                bytesConsumed: 1, 
                comment: "Check subrange (TOS-1 <= TOS-2 <= TOS)")
        case flo:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "FLO", 
                bytesConsumed: 1,
                comment: "Float next to TOS (int TOS-1 to real TOS)")
        case flt:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "FLT", 
                bytesConsumed: 1, 
                comment: "Float TOS (int TOS to real TOS)")
        case inn:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "INN", 
                bytesConsumed: 1, 
                comment: "Set membership (TOS-1 in set TOS)")
        case int:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "INT", 
                bytesConsumed: 1, 
                comment: "Set intersection (TOS AND TOS-1)")
        case lor:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LOR", 
                bytesConsumed: 1, 
                comment: "Logical OR (TOS | TOS-1)")
        case modi:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "MODI", 
                bytesConsumed: 1, 
                comment: "Modulo integers (TOS-1 % TOS)")
        case mpi:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "MPI", 
                bytesConsumed: 1, 
                comment: "Multiply integers (TOS * TOS-1)")
        case mpr:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "MPR", 
                bytesConsumed: 1, 
                comment: "Multiply reals (TOS * TOS-1)")
        case ngi:
            return DecodedInstruction(
                opcode: opcode, 
                mnemonic: "NGI", 
                bytesConsumed: 1, 
                comment: "Negate integer")
        case ngr:
            return DecodedInstruction(
                opcode: opcode, 
                mnemonic: "NGR", 
                bytesConsumed: 1, 
                comment: "Negate real")
        case lnot:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LNOT", 
                bytesConsumed: 1, 
                comment: "Logical NOT (~TOS)")
        case srs:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "SRS", 
                bytesConsumed: 1, 
                comment: "Subrange set [TOS-1..TOS]")
        case sbi:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "SBI", 
                bytesConsumed: 1, 
                comment: "Subtract integers (TOS-1 - TOS)")
        case sbr:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "SBR", 
                bytesConsumed: 1, 
                comment: "Subtract reals (TOS-1 - TOS)")
        case sgs:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "SGS", 
                bytesConsumed: 1, 
                comment: "Build singleton set [TOS]")
        case sqi:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "SQI", 
                bytesConsumed: 1, 
                comment: "Square integer (TOS * TOS)")
        case sqr:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "SQR", 
                bytesConsumed: 1, 
                comment: "Square real (TOS * TOS)")
        case sto:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "STO", 
                bytesConsumed: 1, 
                comment: "Store indirect word (TOS into TOS-1)")
        case ixs:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "IXS", 
                bytesConsumed: 1,
                comment: "Index string array (check 1<=TOS<=len of str TOS-1)")
        case uni:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "UNI", 
                bytesConsumed: 1, 
                comment: "Set union (TOS OR TOS-1)")
        case lde:
            let seg = Int(try cd.readByte(at: ic + 1))
            let (val, inc) = try cd.readBig(at: ic + 2)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LDE",
                params: [seg, val],
                bytesConsumed: 2 + inc,
                comment: "Load extended word (word offset \(val) in data seg \(seg))")
        case csp:
            let procNum = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "CSP",
                params: [procNum],
                bytesConsumed: 2,
                comment: "Call standard procedure \(cspProcs[procNum]?.0 ?? String(procNum))")
        case ldcn:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LDCN", 
                bytesConsumed: 1, 
                comment: "Load constant NIL")
        case adj:
            let count = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "ADJ", 
                params: [count], 
                bytesConsumed: 2,
                comment: "Adjust set to \(count) words")
        case fjp:
            let offset = Int(try cd.readByte(at: ic + 1))
            var dest: Int = 0
            if offset > 0x7f {
                let jte = addr + offset - 256
                dest = jte - Int(try cd.readWord(at: jte))
            } else {
                dest = ic + offset + 2
            }
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "FJP",
                params: [dest],
                bytesConsumed: 2,
                comment: "Jump if TOS false to \(String(format: "%04x", dest))")
        case inc:
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "INC", 
                params: [val], 
                bytesConsumed: 1 + inc,
                comment: "Inc field ptr (TOS+\(val))")
        case ind:
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "IND", 
                params: [val], 
                bytesConsumed: 1 + inc,
                comment: "Static index and load word (TOS+\(val))")
        case ixa:
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "IXA", 
                params: [val], 
                bytesConsumed: 1 + inc,
                comment: "Index array (TOS-1 + TOS * \(val))")
        case lao:
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc =
                allLocations.first(where: { $0.segment == 1 && $0.procedure == 1 && $0.addr == val }
                ) ?? Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LAO", 
                params: [val], 
                bytesConsumed: 1 + inc,
                comment: "Load global address", 
                memLocation: loc)
        case lsa:
            let strLen = Int(try cd.readByte(at: ic + 1))
            var s: String = ""
            if strLen > 0 {
                for i in 1...strLen {
                    let ch = try cd.readByte(at: ic + 1 + Int(i))
                    s += String(format: "%c", ch)
                }
            }
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LSA", 
                params: [strLen], 
                bytesConsumed: 2 + strLen,
                comment: "Load string address: '" + s + "'")
        case lae:
            let seg = Int(try cd.readByte(at: ic + 1))
            let (val, inc) = try cd.readBig(at: ic + 2)
            let loc =
                allLocations.first(where: {
                    $0.segment == seg && $0.procedure == 0 && $0.addr == val
                }) ?? Location(segment: seg, procedure: 0, lexLevel: 0, addr: val)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LAE", 
                params: [seg, val], 
                bytesConsumed: 2 + inc,
                comment: "Load extended address", 
                memLocation: loc)
        case mov:
            // MOV
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "MOV", 
                params: [val], 
                bytesConsumed: 1 + inc,
                comment: "Move \(val) words (TOS to TOS-1)")
        case ldo:
            // LDO
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc =
                allLocations.first(where: { $0.segment == 1 && $0.procedure == 1 && $0.addr == val }
                ) ?? Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LDO", 
                params: [val], 
                bytesConsumed: 1 + inc, 
                comment: "Load global word",
                memLocation: loc)
        case sas:
            // SAS
            let sasCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "SAS", 
                params: [sasCount], 
                bytesConsumed: 2,
                comment: "String assign (TOS to TOS-1, \(sasCount) chars)")
        case sro:
            // SRO
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc =
                allLocations.first(where: { $0.segment == 1 && $0.procedure == 1 && $0.addr == val }
                ) ?? Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "SRO", 
                params: [val], 
                bytesConsumed: 1 + inc,
                comment: "Store global word", 
                memLocation: loc)
        case xjp:
            // XJP has variable-length jump table - size calculated in switch
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "XJP", 
                params: [], 
                bytesConsumed: 0, 
                comment: "Case jump")
        case rnp:
            // RNP
            let retCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "RNP", 
                params: [retCount], 
                bytesConsumed: 2,
                comment: "Return from nonbase procedure")
        case cip:
            // CIP
            let procNum = Int(try cd.readByte(at: ic + 1))
            let loc =
                allLocations.first(where: {
                    $0.segment == currSeg.segNum && $0.procedure == procNum
                }) ?? Location(segment: currSeg.segNum, procedure: procNum)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "CIP", 
                params: [procNum], 
                bytesConsumed: 2,
                comment: "Call intermediate procedure", 
                destination: loc)
        case eql:
            // EQL
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "EQL", 
                bytesConsumed: 0, 
                requiresComparator: true,
                comparatorOffset: ic + 1)
        case geq:
            // GEQ
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "GEQ", 
                bytesConsumed: 0, 
                requiresComparator: true,
                comparatorOffset: ic + 1)
        case grt:
            // GRT
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "GRT", 
                bytesConsumed: 0, 
                requiresComparator: true,
                comparatorOffset: ic + 1)
        case lda:
            // LDA
            let (val, inc) = try cd.readBig(at: ic + 2)
            let byte1 = try cd.readByte(at: ic + 1)
            let refLexLevel = proc.lexicalLevel - Int(byte1)
            let loc =
                allLocations.first(where: {
                    $0.segment == (refLexLevel < 0 ? 0 : currSeg.segNum)
                        && $0.lexLevel == refLexLevel && $0.addr == val
                })
                ?? Location(
                    segment: refLexLevel < 0 ? 0 : currSeg.segNum, lexLevel: refLexLevel, addr: val)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LDA", 
                params: [Int(byte1), val], 
                bytesConsumed: 2 + inc,
                comment: "Load intermediate address", 
                memLocation: loc)
        case ldc:
            // LDC has variable-length data - just return count, actual size calculated in switch
            let count = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LDC", 
                params: [count], 
                bytesConsumed: 0,
                comment: "Load multiple-word constant")
        case leq:
            // LEQ
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LEQ", 
                bytesConsumed: 0, 
                requiresComparator: true,
                comparatorOffset: ic + 1)
        case les:
            // LES
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LES", 
                bytesConsumed: 0, 
                requiresComparator: true,
                comparatorOffset: ic + 1)
        case lod:
            // LOD
            let (val, inc) = try cd.readBig(at: ic + 2)
            let byte1 = try cd.readByte(at: ic + 1)
            let refLexLevel = proc.lexicalLevel - Int(byte1)
            let loc =
                allLocations.first(where: {
                    $0.segment == (refLexLevel < 0 ? 0 : currSeg.segNum)
                        && $0.lexLevel == refLexLevel && $0.addr == val
                })
                ?? Location(
                    segment: refLexLevel < 0 ? 0 : currSeg.segNum, lexLevel: refLexLevel, addr: val)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LOD", 
                params: [Int(byte1), val], 
                bytesConsumed: 2 + inc,
                comment: "Load intermediate word", 
                memLocation: loc)
        case neq:
            // NEQ
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "NEQ", 
                bytesConsumed: 0, 
                requiresComparator: true,
                comparatorOffset: ic + 1)
        case str:
            // STR
            let (val, inc) = try cd.readBig(at: ic + 2)
            let byte1 = try cd.readByte(at: ic + 1)
            let refLexLevel = proc.lexicalLevel - Int(byte1)
            let loc =
                allLocations.first(where: {
                    $0.segment == (refLexLevel < 0 ? 0 : currSeg.segNum)
                        && $0.lexLevel == refLexLevel && $0.addr == val
                })
                ?? Location(
                    segment: refLexLevel < 0 ? 0 : currSeg.segNum, lexLevel: refLexLevel, addr: val)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "STR", 
                params: [Int(byte1), val], 
                bytesConsumed: 2 + inc,
                comment: "Store intermediate word", 
                memLocation: loc)
        case ujp:
            let offset = Int(try cd.readByte(at: ic + 1))
            var dest: Int = 0
            if offset > 0x7f {
                let jte = addr + offset - 256
                dest = jte - Int(try cd.readWord(at: jte))
            } else {
                dest = ic + offset + 2
            }
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "UJP",
                params: [dest],
                bytesConsumed: 2,
                comment: "Unconditional jump to \(String(format: "%04x", dest))")
        case ldp:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LDP", 
                bytesConsumed: 1, 
                comment: "Load packed field (TOS)")
        case stp:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "STP", 
                bytesConsumed: 1, 
                comment: "Store packed field (TOS into TOS-1)")
        case ldm:
            let ldmCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LDM", 
                params: [ldmCount], 
                bytesConsumed: 2,
                comment: "Load \(ldmCount) words from (TOS)")
        case stm:
            let stmCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "STM", 
                params: [stmCount], 
                bytesConsumed: 2,
                comment: "Store \(stmCount) words at TOS to TOS-1")
        case ldb:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LDB", 
                bytesConsumed: 1, 
                comment: "Load byte at byte ptr TOS-1 + TOS")
        case stb:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "STB", 
                bytesConsumed: 1,
                comment: "Store byte at TOS to byte ptr TOS-2 + TOS-1")
        case ixp:
            let elementsPerWord = Int(try cd.readByte(at: ic + 1))
            let fieldWidth = Int(try cd.readByte(at: ic + 2))
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "IXP",
                params: [elementsPerWord, fieldWidth],
                bytesConsumed: 3,
                comment:
                    "Index packed array TOS-1[TOS], \(elementsPerWord) elts/word, \(fieldWidth) field width"
            )
        case rbp:
            let retCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "RBP", 
                params: [retCount], 
                bytesConsumed: 2,
                comment: "Return from base procedure")
        case cbp:
            let procNum = Int(try cd.readByte(at: ic + 1))
            let loc =
                allLocations.first(where: {
                    $0.segment == currSeg.segNum && $0.procedure == procNum
                }) ?? Location(segment: currSeg.segNum, procedure: procNum)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "CBP", 
                params: [procNum], 
                bytesConsumed: 2,
                comment: "Call base procedure", 
                destination: loc)
        case equi:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "EQUI", 
                bytesConsumed: 1, 
                comment: "Integer TOS-1 = TOS")
        case geqi:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "GEQI", 
                bytesConsumed: 1, 
                comment: "Integer TOS-1 >= TOS")
        case grti:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "GRTI", 
                bytesConsumed: 1, 
                comment: "Integer TOS-1 > TOS")
        case lla:
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc =
                allLocations.first(where: {
                    $0.segment == currSeg.segNum && $0.procedure == procedure
                        && $0.lexLevel == proc.lexicalLevel && $0.addr == val
                })
                ?? Location(
                    segment: currSeg.segNum, procedure: procedure,
                    lexLevel: proc.lexicalLevel, addr: val)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LLA", 
                params: [val], 
                bytesConsumed: 1 + inc,
                comment: "Load local address", 
                memLocation: loc)
        case ldci:
            let val = Int(try cd.readWord(at: ic + 1))
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LDCI", 
                params: [val], 
                bytesConsumed: 3,
                comment: "Load one-word constant \(val)")
        case leqi:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LEQI", 
                bytesConsumed: 1, 
                comment: "Integer TOS-1 <= TOS")
        case lesi:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LESI", 
                bytesConsumed: 1, 
                comment: "Integer TOS-1 < TOS")
        case ldl:
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc =
                allLocations.first(where: {
                    $0.segment == segment && $0.procedure == procedure
                        && $0.lexLevel == proc.lexicalLevel && $0.addr == val
                })
                ?? Location(
                    segment: segment, procedure: procedure,
                    lexLevel: proc.lexicalLevel, addr: val)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LDL", 
                params: [val], 
                bytesConsumed: 1 + inc, 
                comment: "Load local word",
                memLocation: loc)
        case neqi:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "NEQI", 
                bytesConsumed: 1, 
                comment: "Integer TOS-1 <> TOS")
        case stl:
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc =
                allLocations.first(where: {
                    $0.segment == segment && $0.procedure == procedure
                        && $0.lexLevel == proc.lexicalLevel && $0.addr == val
                })
                ?? Location(
                    segment: segment, procedure: procedure,
                    lexLevel: proc.lexicalLevel, addr: val)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "STL", 
                params: [val], 
                bytesConsumed: 1 + inc, 
                comment: "Store local word",
                memLocation: loc)
        case cxp:
            let seg = Int(try cd.readByte(at: ic + 1))
            let procNum = Int(try cd.readByte(at: ic + 2))
            let loc =
                allLocations.first(where: { $0.segment == seg && $0.procedure == procNum })
                ?? Location(segment: seg, procedure: procNum)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "CXP", 
                params: [seg, procNum], 
                bytesConsumed: 3,
                comment: "Call external procedure", 
                destination: loc)
        case clp:
            let procNum = Int(try cd.readByte(at: ic + 1))
            let loc =
                allLocations.first(where: {
                    $0.segment == currSeg.segNum && $0.procedure == procNum
                }) ?? Location(segment: currSeg.segNum, procedure: procNum)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "CLP", 
                params: [procNum], 
                bytesConsumed: 2,
                comment: "Call local procedure", 
                destination: loc)
        case cgp:
            let procNum = Int(try cd.readByte(at: ic + 1))
            let loc =
                allLocations.first(where: {
                    $0.segment == currSeg.segNum && $0.procedure == procNum
                }) ?? Location(segment: currSeg.segNum, procedure: procNum)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "CGP", 
                params: [procNum], 
                bytesConsumed: 2,
                comment: "Call global procedure", 
                destination: loc)
        case lpa:
            let count = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "LPA", 
                params: [count], 
                bytesConsumed: 2 + count,
                comment: "Load packed array")
        case ste:
            let seg = Int(try cd.readByte(at: ic + 1))
            let (val, inc) = try cd.readBig(at: ic + 2)
            let loc =
                allLocations.first(where: {
                    $0.segment == seg && $0.procedure == 0 && $0.lexLevel == 0 && $0.addr == val
                }) ?? Location(segment: seg, procedure: 0, lexLevel: 0, addr: val)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "STE", 
                params: [seg, val], 
                bytesConsumed: 2 + inc,
                comment: "Store extended word TOS into", 
                memLocation: loc)
        case nop:
            return DecodedInstruction(
                opcode: opcode, 
                mnemonic: "NOP", 
                bytesConsumed: 1, 
                comment: "No operation")
        case bpt:
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "BPT", 
                params: [val], 
                bytesConsumed: 1 + inc, 
                comment: "Breakpoint")
        case xit:
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "XIT", 
                bytesConsumed: 1, 
                comment: "Exit the operating system")
        case nop2:
            return DecodedInstruction(
                opcode: opcode, 
                mnemonic: "NOP", 
                bytesConsumed: 1, 
                comment: "No operation")
        case sldl1...sldl16:
            let b = Int(opcode)
            let val = b - Int(sldl1) + 1
            let loc =
                allLocations.first(where: {
                    $0.segment == segment && $0.procedure == procedure
                        && $0.lexLevel == proc.lexicalLevel && $0.addr == val
                })
                ?? Location(
                    segment: segment, procedure: procedure,
                    lexLevel: proc.lexicalLevel, addr: val)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "SLDL", 
                params: [val], 
                bytesConsumed: 1, 
                comment: "Short load local word",
                memLocation: loc)
        case sldo1...sldo16:
            let b2 = Int(opcode)
            let val = b2 - Int(sldo1) + 1
            let loc =
                allLocations.first(where: {
                    $0.segment == 1 && $0.procedure == 1 && $0.lexLevel == 0 && $0.addr == val
                }) ?? Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "SLDO", 
                params: [val], 
                bytesConsumed: 1,
                comment: "Short load global word", 
                memLocation: loc)
        case sind0...sind7:
            let b3 = Int(opcode)
            let offs = b3 - Int(sind0)
            return DecodedInstruction(
                opcode: opcode,
                mnemonic: "SIND", 
                params: [offs], 
                bytesConsumed: 1,
                comment: "Short index and load word *TOS+\(offs)")
        default:
            throw CodeDataError.unexpectedEndOfData
        }
    }

    func decodeComparator(at index: Int) -> (
        suffix: String, prefix: String, increment: Int, dataType: String
    ) {
        guard let b = try? cd.readByte(at: index) else {
            return ("", "", 1, "")
        }
        switch b {
        case 2: return ("REAL", "Real", 1, "REAL")
        case 4: return ("STR", "String", 1, "STRING")
        case 6: return ("BOOL", "Boolean", 1, "BOOLEAN")
        case 8: return ("SET", "Set", 1, "SET")
        case 10:
            if let (val, inc) = try? cd.readBig(at: index + 1) {
                return ("BYTE", "Byte array (\(val) long)", inc + 1, "ARRAY[1..\(val)] OF BYTE")
            }
            return ("BYTE", "Byte array (0 long)", 1, "ARRAY OF BYTE")
        case 12:
            if let (val, inc) = try? cd.readBig(at: index + 1) {
                return ("WORD", "Word array (\(val) long)", inc + 1, "ARRAY[1..\(val)] OF WORD")
            }
            return ("WORD", "Word array (0 long)", 1, "ARRAY OF WORD")
        default:
            return ("", "", 1, "")
        }
    }
}
