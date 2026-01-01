import Foundation

let cspProcs: [Int: (String, [Identifier], String)] = [
    0: ("IOC", [], ""),
    1: (
        "NEW",
        [
            Identifier(name: "PTR", type: "POINTER"),
            Identifier(name: "SIZE", type: "INTEGER"),
        ], ""
    ),
    2: (
        "MOVL",
        [
            Identifier(name: "SRCADDR", type: "POINTER"),
            Identifier(name: "SRCOFFS", type: "INTEGER"),
            Identifier(name: "DESTADDR", type: "POINTER"),
            Identifier(name: "DESTOFFS", type: "INTEGER"),
            Identifier(name: "COUNT", type: "INTEGER"),
        ], ""
    ),
    3: (
        "MOVR",
        [
            Identifier(name: "SRCADDR", type: "POINTER"),
            Identifier(name: "SRCOFFS", type: "INTEGER"),
            Identifier(name: "DESTADDR", type: "POINTER"),
            Identifier(name: "DESTOFFS", type: "INTEGER"),
            Identifier(name: "COUNT", type: "INTEGER"),
        ], ""
    ),
    4: (
        "EXIT",
        [
            Identifier(name: "SEGMENT", type: "INTEGER"),
            Identifier(name: "PROCEDURE", type: "INTEGER"),
        ], ""
    ),
    5: (
        "UNITREAD",
        [
            Identifier(name: "MODE", type: "INTEGER"),
            Identifier(name: "BLOCKNUM", type: "INTEGER"),
            Identifier(name: "BYTCOUNT", type: "INTEGER"),
            Identifier(name: "BUFFADDR", type: "POINTER"),
            Identifier(name: "BUFFOFFS", type: "INTEGER"),
            Identifier(name: "UNIT", type: "INTEGER"),
        ], ""
    ),
    6: (
        "UNITWRITE",
        [
            Identifier(name: "MODE", type: "INTEGER"),
            Identifier(name: "BLOCKNUM", type: "INTEGER"),
            Identifier(name: "BYTCOUNT", type: "INTEGER"),
            Identifier(name: "BUFFADDR", type: "POINTER"),
            Identifier(name: "BUFFOFFS", type: "INTEGER"),
            Identifier(name: "UNIT", type: "INTEGER"),
        ], ""
    ),
    7: (
        "IDSEARCH",
        [
            Identifier(name: "SYMCURSOR", type: "0..1023"),
            Identifier(name: "SYMBUF", type: "PACKED ARRAY[0..1023] OF CHAR"),
        ], ""
    ),
    8: (
        "TREESEARCH",
        [
            Identifier(name: "ROOTP", type: "^NODE"),
            Identifier(name: "FOUNDP", type: "^NODE"),
            Identifier(name: "TARGET", type: "PACKED ARRAY [1..8] OF CHAR"),
        ], "INTEGER"
    ),
    9: (
        "TIME",
        [
            Identifier(name: "TIME1", type: "INTEGER"),
            Identifier(name: "TIME2", type: "INTEGER"),
        ], ""
    ),
    10: (
        "FLCH",
        [
            Identifier(name: "DESTADDR", type: "POINTER"),
            Identifier(name: "DESTOFFS", type: "INTEGER"),
            Identifier(name: "COUNT", type: "INTEGER"),
            Identifier(name: "SRC", type: "CHAR"),
        ], ""
    ),
    11: (
        "SCAN",
        [
            Identifier(name: "JUNK", type: "INTEGER"),
            Identifier(name: "DESTADDR", type: "POINTER"),
            Identifier(name: "DESTOFFS", type: "INTEGER"),
            Identifier(name: "CH", type: "CHAR"),
            Identifier(name: "CHECK", type: "INTEGER"),
            Identifier(name: "COUNT", type: "INTEGER"),
        ], "INTEGER"
    ),
    12: (
        "UNITSTATUS",
        [
            Identifier(name: "CTRLWORD", type: "INTEGER"),
            Identifier(name: "STATADDR", type: "POINTER"),
            Identifier(name: "STATOFFS", type: "INTEGER"),
            Identifier(name: "UNIT", type: "INTEGER"),
        ], ""
    ),
    // skipping 13-20 (reserved)
    21: ("LOADSEGMENT", [Identifier(name: "SEGMENT", type: "INTEGER")], ""),
    22: ("UNLOADSEGMENT", [Identifier(name: "SEGMENT", type: "INTEGER")], ""),
    23: ("TRUNC", [Identifier(name: "NUM", type: "REAL")], "INTEGER"),
    24: ("ROUND", [Identifier(name: "NUM", type: "REAL")], "INTEGER"),
    25: ("SIN", [], ""),  // not implemented
    26: ("COS", [], ""),  // not implemented
    27: ("LOG", [], ""),  // not implemented
    28: ("ATAN", [], ""),  // not implemented
    29: ("LN", [], ""),  // not implemented
    30: ("EXP", [], ""),  // not implemented
    31: ("SQRT", [], ""),  // not implemented
    32: ("MARK", [Identifier(name: "NP", type: "POINTER")], ""),
    33: ("RELEASE", [Identifier(name: "NP", type: "POINTER")], ""),
    34: ("IORESULT", [], "INTEGER"),
    35: ("UNITBUSY", [Identifier(name: "UNIT", type: "INTEGER")], "BOOLEAN"),
    36: ("POT", [Identifier(name: "NUM", type: "INTEGER")], "REAL"),
    37: ("UNITWAIT", [Identifier(name: "UNIT", type: "INTEGER")], ""),
    38: ("UNITCLEAR", [Identifier(name: "UNIT", type: "INTEGER")], ""),
    39: ("HALT", [], ""),
    40: ("MEMAVAIL", [], "INTEGER"),
]

// enum Op {
let sldc0: UInt8 = 0x00
let sldc127: UInt8 = 0x7f
let abi: UInt8 = 0x80
let abr: UInt8 = 0x81
let adi: UInt8 = 0x82
let adr: UInt8 = 0x83
let land: UInt8 = 0x84
let dif: UInt8 = 0x85
let dvi: UInt8 = 0x86
let dvr: UInt8 = 0x87
let chk: UInt8 = 0x88
let flo: UInt8 = 0x89
let flt: UInt8 = 0x8a
let inn: UInt8 = 0x8b
let int: UInt8 = 0x8c
let lor: UInt8 = 0x8d
let modi: UInt8 = 0x8e
let mpi: UInt8 = 0x8f
let mpr: UInt8 = 0x90
let ngi: UInt8 = 0x91
let ngr: UInt8 = 0x92
let lnot: UInt8 = 0x93
let srs: UInt8 = 0x94
let sbi: UInt8 = 0x95
let sbr: UInt8 = 0x96
let sgs: UInt8 = 0x97
let sqi: UInt8 = 0x98
let sqr: UInt8 = 0x99
let sto: UInt8 = 0x9a
let ixs: UInt8 = 0x9b
let uni: UInt8 = 0x9c
let lde: UInt8 = 0x9d
let csp: UInt8 = 0x9e
let ldcn: UInt8 = 0x9f
let adj: UInt8 = 0xa0
let fjp: UInt8 = 0xa1
let inc: UInt8 = 0xa2
let ind: UInt8 = 0xa3
let ixa: UInt8 = 0xa4
let lao: UInt8 = 0xa5
let lsa: UInt8 = 0xa6
let lae: UInt8 = 0xa7
let mov: UInt8 = 0xa8
let ldo: UInt8 = 0xa9
let sas: UInt8 = 0xaa
let sro: UInt8 = 0xab
let xjp: UInt8 = 0xac
let rnp: UInt8 = 0xad
let cip: UInt8 = 0xae
let eql: UInt8 = 0xaf
let geq: UInt8 = 0xb0
let grt: UInt8 = 0xb1
let lda: UInt8 = 0xb2
let ldc: UInt8 = 0xb3
let leq: UInt8 = 0xb4
let les: UInt8 = 0xb5
let lod: UInt8 = 0xb6
let neq: UInt8 = 0xb7
let str: UInt8 = 0xb8
let ujp: UInt8 = 0xb9
let ldp: UInt8 = 0xba
let stp: UInt8 = 0xbb
let ldm: UInt8 = 0xbc
let stm: UInt8 = 0xbd
let ldb: UInt8 = 0xbe
let stb: UInt8 = 0xbf
let ixp: UInt8 = 0xc0
let rbp: UInt8 = 0xc1
let cbp: UInt8 = 0xc2
let equi: UInt8 = 0xc3
let geqi: UInt8 = 0xc4
let grti: UInt8 = 0xc5
let lla: UInt8 = 0xc6
let ldci: UInt8 = 0xc7
let leqi: UInt8 = 0xc8
let lesi: UInt8 = 0xc9
let ldl: UInt8 = 0xca
let neqi: UInt8 = 0xcb
let stl: UInt8 = 0xcc
let cxp: UInt8 = 0xcd
let clp: UInt8 = 0xce
let cgp: UInt8 = 0xcf
let lpa: UInt8 = 0xd0
let ste: UInt8 = 0xd1
let nop: UInt8 = 0xd2
let unk1: UInt8 = 0xd3
let unk2: UInt8 = 0xd4
let bpt: UInt8 = 0xd5
let xit: UInt8 = 0xd6
let nop2: UInt8 = 0xd7
let sldl1: UInt8 = 0xd8
let sldl16: UInt8 = 0xe7
let sldo1: UInt8 = 0xe8
let sldo16: UInt8 = 0xf7
let sind0: UInt8 = 0xf8
let sind7: UInt8 = 0xff

// }
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

    func decode(
        opcode: UInt8, at ic: Int, currSeg: Segment, segment: Int, procedure: Int, proc: Procedure,
        addr: Int, allLocations: inout Set<Location>
    ) throws
        -> DecodedInstruction
    {
        switch opcode {
        case sldc0...sldc127:
            return DecodedInstruction(
                mnemonic: "SLDC",
                params: [Int(opcode)],
                bytesConsumed: 1,
                comment: "Short load one-word constant \(opcode)")
        case abi:
            return DecodedInstruction(
                mnemonic: "ABI", bytesConsumed: 1, comment: "Absolute value of integer (TOS)")
        case abr:
            return DecodedInstruction(
                mnemonic: "ABR", bytesConsumed: 1, comment: "Absolute value of real (TOS)")
        case adi:
            return DecodedInstruction(
                mnemonic: "ADI", bytesConsumed: 1, comment: "Add integers (TOS + TOS-1)")
        case adr:
            return DecodedInstruction(
                mnemonic: "ADR", bytesConsumed: 1, comment: "Add reals (TOS + TOS-1)")
        case land:
            return DecodedInstruction(
                mnemonic: "LAND", bytesConsumed: 1, comment: "Logical AND (TOS & TOS-1)")
        case dif:
            return DecodedInstruction(
                mnemonic: "DIF", bytesConsumed: 1, comment: "Set difference (TOS-1 AND NOT TOS)")
        case dvi:
            return DecodedInstruction(
                mnemonic: "DVI", bytesConsumed: 1, comment: "Divide integers (TOS-1 / TOS)")
        case dvr:
            return DecodedInstruction(
                mnemonic: "DVR", bytesConsumed: 1, comment: "Divide reals (TOS-1 / TOS)")
        case chk:
            return DecodedInstruction(
                mnemonic: "CHK", bytesConsumed: 1, comment: "Check subrange (TOS-1 <= TOS-2 <= TOS)"
            )
        case flo:
            return DecodedInstruction(
                mnemonic: "FLO", bytesConsumed: 1,
                comment: "Float next to TOS (int TOS-1 to real TOS)")
        case flt:
            return DecodedInstruction(
                mnemonic: "FLT", bytesConsumed: 1, comment: "Float TOS (int TOS to real TOS)")
        case inn:
            return DecodedInstruction(
                mnemonic: "INN", bytesConsumed: 1, comment: "Set membership (TOS-1 in set TOS)")
        case int:
            return DecodedInstruction(
                mnemonic: "INT", bytesConsumed: 1, comment: "Set intersection (TOS AND TOS-1)")
        case lor:
            return DecodedInstruction(
                mnemonic: "LOR", bytesConsumed: 1, comment: "Logical OR (TOS | TOS-1)")
        case modi:
            return DecodedInstruction(
                mnemonic: "MODI", bytesConsumed: 1, comment: "Modulo integers (TOS-1 % TOS)")
        case mpi:
            return DecodedInstruction(
                mnemonic: "MPI", bytesConsumed: 1, comment: "Multiply integers (TOS * TOS-1)")
        case mpr:
            return DecodedInstruction(
                mnemonic: "MPR", bytesConsumed: 1, comment: "Multiply reals (TOS * TOS-1)")
        case ngi:
            return DecodedInstruction(mnemonic: "NGI", bytesConsumed: 1, comment: "Negate integer")
        case ngr:
            return DecodedInstruction(mnemonic: "NGR", bytesConsumed: 1, comment: "Negate real")
        case lnot:
            return DecodedInstruction(
                mnemonic: "LNOT", bytesConsumed: 1, comment: "Logical NOT (~TOS)")
        case srs:
            return DecodedInstruction(
                mnemonic: "SRS", bytesConsumed: 1, comment: "Subrange set [TOS-1..TOS]")
        case sbi:
            return DecodedInstruction(
                mnemonic: "SBI", bytesConsumed: 1, comment: "Subtract integers (TOS-1 - TOS)")
        case sbr:
            return DecodedInstruction(
                mnemonic: "SBR", bytesConsumed: 1, comment: "Subtract reals (TOS-1 - TOS)")
        case sgs:
            return DecodedInstruction(
                mnemonic: "SGS", bytesConsumed: 1, comment: "Build singleton set [TOS]")
        case sqi:
            return DecodedInstruction(
                mnemonic: "SQI", bytesConsumed: 1, comment: "Square integer (TOS * TOS)")
        case sqr:
            return DecodedInstruction(
                mnemonic: "SQR", bytesConsumed: 1, comment: "Square real (TOS * TOS)")
        case sto:
            return DecodedInstruction(
                mnemonic: "STO", bytesConsumed: 1, comment: "Store indirect word (TOS into TOS-1)")
        case ixs:
            return DecodedInstruction(
                mnemonic: "IXS", bytesConsumed: 1,
                comment: "Index string array (check 1<=TOS<=len of str TOS-1)")
        case uni:
            return DecodedInstruction(
                mnemonic: "UNI", bytesConsumed: 1, comment: "Set union (TOS OR TOS-1)")
        case lde:
            let seg = Int(try cd.readByte(at: ic + 1))
            let (val, inc) = try cd.readBig(at: ic + 2)
            return DecodedInstruction(
                mnemonic: "LDE",
                params: [seg, val],
                bytesConsumed: 2 + inc,
                comment: "Load extended word (word offset \(val) in data seg \(seg))")
        case csp:
            let procNum = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "CSP",
                params: [procNum],
                bytesConsumed: 2,
                comment: "Call standard procedure \(cspProcs[procNum]?.0 ?? String(procNum))")
        case ldcn:
            return DecodedInstruction(
                mnemonic: "LDCN", bytesConsumed: 1, comment: "Load constant NIL")
        case adj:
            let count = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "ADJ", params: [count], bytesConsumed: 2,
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
                mnemonic: "FJP",
                params: [dest],
                bytesConsumed: 2,
                comment: "Jump if TOS false to \(String(format: "%04x", dest))")
        case inc:
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                mnemonic: "INC", params: [val], bytesConsumed: 1 + inc,
                comment: "Inc field ptr (TOS+\(val))")
        case ind:
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                mnemonic: "IND", params: [val], bytesConsumed: 1 + inc,
                comment: "Static index and load word (TOS+\(val))")
        case ixa:
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                mnemonic: "IXA", params: [val], bytesConsumed: 1 + inc,
                comment: "Index array (TOS-1 + TOS * \(val))")
        case lao:
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc =
                allLocations.first(where: { $0.segment == 1 && $0.procedure == 1 && $0.addr == val }
                ) ?? Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
            return DecodedInstruction(
                mnemonic: "LAO", params: [val], bytesConsumed: 1 + inc,
                comment: "Load global address", memLocation: loc)
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
                mnemonic: "LSA", params: [strLen], bytesConsumed: 2 + strLen,
                comment: "Load string address: '" + s + "'")
        case lae:
            let seg = Int(try cd.readByte(at: ic + 1))
            let (val, inc) = try cd.readBig(at: ic + 2)
            let loc =
                allLocations.first(where: {
                    $0.segment == seg && $0.procedure == 0 && $0.addr == val
                }) ?? Location(segment: seg, procedure: 0, lexLevel: 0, addr: val)
            return DecodedInstruction(
                mnemonic: "LAE", params: [seg, val], bytesConsumed: 2 + inc,
                comment: "Load extended address", memLocation: loc)
        case mov:
            // MOV
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                mnemonic: "MOV", params: [val], bytesConsumed: 1 + inc,
                comment: "Move \(val) words (TOS to TOS-1)")
        case ldo:
            // LDO
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc =
                allLocations.first(where: { $0.segment == 1 && $0.procedure == 1 && $0.addr == val }
                ) ?? Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
            return DecodedInstruction(
                mnemonic: "LDO", params: [val], bytesConsumed: 1 + inc, comment: "Load global word",
                memLocation: loc)
        case sas:
            // SAS
            let sasCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "SAS", params: [sasCount], bytesConsumed: 2,
                comment: "String assign (TOS to TOS-1, \(sasCount) chars)")
        case sro:
            // SRO
            let (val, inc) = try cd.readBig(at: ic + 1)
            let loc =
                allLocations.first(where: { $0.segment == 1 && $0.procedure == 1 && $0.addr == val }
                ) ?? Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
            return DecodedInstruction(
                mnemonic: "SRO", params: [val], bytesConsumed: 1 + inc,
                comment: "Store global word", memLocation: loc)
        case xjp:
            // XJP has variable-length jump table - size calculated in switch
            return DecodedInstruction(
                mnemonic: "XJP", params: [], bytesConsumed: 0, comment: "Case jump")
        case rnp:
            // RNP
            let retCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "RNP", params: [retCount], bytesConsumed: 2,
                comment: "Return from nonbase procedure")
        case cip:
            // CIP
            let procNum = Int(try cd.readByte(at: ic + 1))
            let loc =
                allLocations.first(where: {
                    $0.segment == currSeg.segNum && $0.procedure == procNum
                }) ?? Location(segment: currSeg.segNum, procedure: procNum)
            return DecodedInstruction(
                mnemonic: "CIP", params: [procNum], bytesConsumed: 2,
                comment: "Call intermediate procedure", destination: loc)
        case eql:
            // EQL
            return DecodedInstruction(
                mnemonic: "EQL", bytesConsumed: 0, requiresComparator: true,
                comparatorOffset: ic + 1)
        case geq:
            // GEQ
            return DecodedInstruction(
                mnemonic: "GEQ", bytesConsumed: 0, requiresComparator: true,
                comparatorOffset: ic + 1)
        case grt:
            // GRT
            return DecodedInstruction(
                mnemonic: "GRT", bytesConsumed: 0, requiresComparator: true,
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
                mnemonic: "LDA", params: [Int(byte1), val], bytesConsumed: 2 + inc,
                comment: "Load intermediate address", memLocation: loc)
        case ldc:
            // LDC has variable-length data - just return count, actual size calculated in switch
            let count = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "LDC", params: [count], bytesConsumed: 0,
                comment: "Load multiple-word constant")
        case leq:
            // LEQ
            return DecodedInstruction(
                mnemonic: "LEQ", bytesConsumed: 0, requiresComparator: true,
                comparatorOffset: ic + 1)
        case les:
            // LES
            return DecodedInstruction(
                mnemonic: "LES", bytesConsumed: 0, requiresComparator: true,
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
                mnemonic: "LOD", params: [Int(byte1), val], bytesConsumed: 2 + inc,
                comment: "Load intermediate word", memLocation: loc)
        case neq:
            // NEQ
            return DecodedInstruction(
                mnemonic: "NEQ", bytesConsumed: 0, requiresComparator: true,
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
                mnemonic: "STR", params: [Int(byte1), val], bytesConsumed: 2 + inc,
                comment: "Store intermediate word", memLocation: loc)
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
                mnemonic: "UJP",
                params: [dest],
                bytesConsumed: 2,
                comment: "Unconditional jump to \(String(format: "%04x", dest))")
        case ldp:
            return DecodedInstruction(
                mnemonic: "LDP", bytesConsumed: 1, comment: "Load packed field (TOS)")
        case stp:
            return DecodedInstruction(
                mnemonic: "STP", bytesConsumed: 1, comment: "Store packed field (TOS into TOS-1)")
        case ldm:
            let ldmCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "LDM", params: [ldmCount], bytesConsumed: 2,
                comment: "Load \(ldmCount) words from (TOS)")
        case stm:
            let stmCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "STM", params: [stmCount], bytesConsumed: 2,
                comment: "Store \(stmCount) words at TOS to TOS-1")
        case ldb:
            return DecodedInstruction(
                mnemonic: "LDB", bytesConsumed: 1, comment: "Load byte at byte ptr TOS-1 + TOS")
        case stb:
            return DecodedInstruction(
                mnemonic: "STB", bytesConsumed: 1,
                comment: "Store byte at TOS to byte ptr TOS-2 + TOS-1")
        case ixp:
            let elementsPerWord = Int(try cd.readByte(at: ic + 1))
            let fieldWidth = Int(try cd.readByte(at: ic + 2))
            return DecodedInstruction(
                mnemonic: "IXP",
                params: [elementsPerWord, fieldWidth],
                bytesConsumed: 3,
                comment:
                    "Index packed array TOS-1[TOS], \(elementsPerWord) elts/word, \(fieldWidth) field width"
            )
        case rbp:
            let retCount = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "RBP", params: [retCount], bytesConsumed: 2,
                comment: "Return from base procedure")
        case cbp:
            let procNum = Int(try cd.readByte(at: ic + 1))
            let loc =
                allLocations.first(where: {
                    $0.segment == currSeg.segNum && $0.procedure == procNum
                }) ?? Location(segment: currSeg.segNum, procedure: procNum)
            return DecodedInstruction(
                mnemonic: "CBP", params: [procNum], bytesConsumed: 2,
                comment: "Call base procedure", destination: loc)
        case equi:
            return DecodedInstruction(
                mnemonic: "EQUI", bytesConsumed: 1, comment: "Integer TOS-1 = TOS")
        case geqi:
            return DecodedInstruction(
                mnemonic: "GEQI", bytesConsumed: 1, comment: "Integer TOS-1 >= TOS")
        case grti:
            return DecodedInstruction(
                mnemonic: "GRTI", bytesConsumed: 1, comment: "Integer TOS-1 > TOS")
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
                mnemonic: "LLA", params: [val], bytesConsumed: 1 + inc,
                comment: "Load local address", memLocation: loc)
        case ldci:
            let val = Int(try cd.readWord(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "LDCI", params: [val], bytesConsumed: 3,
                comment: "Load one-word constant \(val)")
        case leqi:
            return DecodedInstruction(
                mnemonic: "LEQI", bytesConsumed: 1, comment: "Integer TOS-1 <= TOS")
        case lesi:
            return DecodedInstruction(
                mnemonic: "LESI", bytesConsumed: 1, comment: "Integer TOS-1 < TOS")
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
                mnemonic: "LDL", params: [val], bytesConsumed: 1 + inc, comment: "Load local word",
                memLocation: loc)
        case neqi:
            return DecodedInstruction(
                mnemonic: "NEQI", bytesConsumed: 1, comment: "Integer TOS-1 <> TOS")
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
                mnemonic: "STL", params: [val], bytesConsumed: 1 + inc, comment: "Store local word",
                memLocation: loc)
        case cxp:
            let seg = Int(try cd.readByte(at: ic + 1))
            let procNum = Int(try cd.readByte(at: ic + 2))
            let loc =
                allLocations.first(where: { $0.segment == seg && $0.procedure == procNum })
                ?? Location(segment: seg, procedure: procNum)
            return DecodedInstruction(
                mnemonic: "CXP", params: [seg, procNum], bytesConsumed: 3,
                comment: "Call external procedure", destination: loc)
        case clp:
            let procNum = Int(try cd.readByte(at: ic + 1))
            let loc =
                allLocations.first(where: {
                    $0.segment == currSeg.segNum && $0.procedure == procNum
                }) ?? Location(segment: currSeg.segNum, procedure: procNum)
            return DecodedInstruction(
                mnemonic: "CLP", params: [procNum], bytesConsumed: 2,
                comment: "Call local procedure", destination: loc)
        case cgp:
            let procNum = Int(try cd.readByte(at: ic + 1))
            let loc =
                allLocations.first(where: {
                    $0.segment == currSeg.segNum && $0.procedure == procNum
                }) ?? Location(segment: currSeg.segNum, procedure: procNum)
            return DecodedInstruction(
                mnemonic: "CGP", params: [procNum], bytesConsumed: 2,
                comment: "Call global procedure", destination: loc)
        case lpa:
            let count = Int(try cd.readByte(at: ic + 1))
            return DecodedInstruction(
                mnemonic: "LPA", params: [count], bytesConsumed: 2 + count,
                comment: "Load packed array")
        case ste:
            let seg = Int(try cd.readByte(at: ic + 1))
            let (val, inc) = try cd.readBig(at: ic + 2)
            let loc =
                allLocations.first(where: {
                    $0.segment == seg && $0.procedure == 0 && $0.lexLevel == 0 && $0.addr == val
                }) ?? Location(segment: seg, procedure: 0, lexLevel: 0, addr: val)
            return DecodedInstruction(
                mnemonic: "STE", params: [seg, val], bytesConsumed: 2 + inc,
                comment: "Store extended word TOS into", memLocation: loc)
        case nop:
            return DecodedInstruction(mnemonic: "NOP", bytesConsumed: 1, comment: "No operation")
        case bpt:
            let (val, inc) = try cd.readBig(at: ic + 1)
            return DecodedInstruction(
                mnemonic: "BPT", params: [val], bytesConsumed: 1 + inc, comment: "Breakpoint")
        case xit:
            return DecodedInstruction(
                mnemonic: "XIT", bytesConsumed: 1, comment: "Exit the operating system")
        case nop2:
            return DecodedInstruction(mnemonic: "NOP", bytesConsumed: 1, comment: "No operation")
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
                mnemonic: "SLDL", params: [val], bytesConsumed: 1, comment: "Short load local word",
                memLocation: loc)
        case sldo1...sldo16:
            let b2 = Int(opcode)
            let val = b2 - Int(sldo1) + 1
            let loc =
                allLocations.first(where: {
                    $0.segment == 1 && $0.procedure == 1 && $0.lexLevel == 0 && $0.addr == val
                }) ?? Location(segment: 1, procedure: 1, lexLevel: 0, addr: val)
            return DecodedInstruction(
                mnemonic: "SLDO", params: [val], bytesConsumed: 1,
                comment: "Short load global word", memLocation: loc)
        case sind0...sind7:
            let b3 = Int(opcode)
            let offs = b3 - Int(sind0)
            return DecodedInstruction(
                mnemonic: "SIND", params: [offs], bytesConsumed: 1,
                comment: "Short index and load word *TOS+\(offs)")
        default:
            throw CodeDataError.unexpectedEndOfData
        }
    }

    func decodeComparator(at index: Int) -> (suffix: String, prefix: String, increment: Int, dataType: String) {
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

// MARK: - Stack Simulator

/// Manages the symbolic execution stack during P-code decoding
struct StackSimulator {
    let sep:Character = "~"
    var stack: [String] = []

    mutating func push(_ value: (String, String?)) {
        if let type = value.1 {
            stack.append("\(value.0)\(sep)\(type)")
        } else {
            stack.append("\(value.0)\(sep)UNKNOWN")
        }
    }

    mutating func pushReal(_ value: String) {
        stack.append("\(value)\(sep)REAL")
    }

    @discardableResult
    // pops the top of the stack and any datatype. If the type
    // of the popped value is not defined, it uses the provided type
    // and (if it refers to a memory location) corrects the type of
    // the variable at that location.
    mutating func pop(_ type: String, _ withoutParentheses: Bool = false) -> (String, String?) {
        let a = stack.popLast() ?? "underflow!"
        var parenthesized: String
        var locType: String
        if a.contains(sep) {  // typed value
            let parts = a.split(separator: sep, maxSplits: 1)
            let locName = String(parts[0])
            locType = String(parts[1])
            if locType == "UNKNOWN" {
                locType = type
            }
            if withoutParentheses {
                parenthesized = locName
            } else {
                parenthesized = (locName.contains(" ") && locType != "STRING") ? "(\(locName))" : locName
            }
        } else {
            if withoutParentheses {
                parenthesized = a
            } else {
                parenthesized = a.contains(" ") ? "(\(a))" : a
            }
            locType = type
        }
        return (parenthesized, locType)
    }

    @discardableResult
    // pops the top of the stack and any datatype
    mutating func pop(_ withoutParentheses: Bool = false) -> (String, String?) {
        let a = stack.popLast() ?? "underflow!"
        if a.contains(sep) {  // typed value
            let parts = a.split(separator: sep, maxSplits: 1)
            if withoutParentheses {
                return (String(parts[0]), String(parts[1]))
            } else {
                let parenthesized = (String(parts[0]).contains(" ") && parts[1] != "STRING") ? "(\(parts[0]))" : String(parts[0])
                return (parenthesized, String(parts[1]))
            }
        } else {
            if withoutParentheses {
                return (a, nil)
            } else {
                let parenthesized = a.contains(" ") ? "(\(a))" : a
                return (parenthesized, nil)
            }
        }
    }

    @discardableResult
    mutating func popReal() -> (String, String?) {
        let a = stack.popLast() ?? "underflow!"
        if a.contains(sep) {
            let parts = a.split(separator: sep, maxSplits: 1)
            return (String(parts[0]), String(parts[1]))
        } else {
            let b = stack.popLast() ?? "underflow!"
            if let val1 = UInt16(a), let val2 = UInt16(b) {
                let fraction: UInt32 = UInt32(val1) | (UInt32(val2) & 0x007f) << 16
                let exponent = (val2 & 0x7f80) < 7
                let sign = (val2 & 0x8000) == 0x8000
                return ("\(sign == true  ? "-" : "")\(fraction)e\(exponent)", "REAL")
            } else {
                return ("\(a).\(b)", "REAL")
            }
        }
    }

    @discardableResult
    mutating func popSet() -> (Int, String) {
        let (setLen, _) = self.pop()
        var setData: [String] = []
        var setVals: [Int] = []
        var prevElement: String = ""
        if let len = Int(setLen) {
            for i in 0..<len {
                let (element, _) = self.pop()
                if element.contains("{") == false {
                    if let value = UInt64(element) {
                        for j in 0..<16 {
                            if (value >> j) & 1 == 1 {
                                setVals.append(i * 16 + j)
                                // setData.append("\(i * 16 + j)")
                            }
                        }
                    } else {
                        setData.append(element)
                    }
                } else {
                    let elementParts = element.split(separator: "{")
                    if String(elementParts[0]) != prevElement {
                        prevElement = String(elementParts[0])
                        setData.append(String(elementParts[0]))
                    }
                }
            }
            if !setVals.isEmpty {
                while !setVals.isEmpty {
                    let first = setVals.first!
                    let group = setVals.prefix(while: {
                        $0 == setVals.first! + (setVals.firstIndex(of: $0)!)
                            - (setVals.firstIndex(of: first)!)
                    })
                    if group.count == 1 {
                        setData.append("\(group[0])")
                    } else {
                        setData.append("\(group.first!)...\(group.last!)")
                    }
                    setVals = Array(setVals.dropFirst(group.count))
                }
            }
            return (len, "[" + setData.joined(separator: ", ") + "]")
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

    // Helper to lookup label by Location
    func findLabel(_ loc: Location) -> (String?, String?) {
        let key = "\(loc.segment):\(loc.procedure ?? -1):\(loc.addr ?? -1)"
        if let ll = labelLookup[key] {
            return (ll.dispName, ll.dispType)
        } else {
            return (nil, nil)
        }
    }

    func generateForInstruction(
        _ inst: OpcodeDecoder.DecodedInstruction,
        stack: inout StackSimulator,
        loc: Location?
    ) -> String? {
        switch inst.mnemonic {
        case "STO", "SAS":
            let (src, _) = stack.pop()
            let (dest, _) = stack.pop()
            return "\(dest) := \(src)"
        case "MOV":
            let (src, _) = stack.pop()
            let (dst, _) = stack.pop()
            return "\(dst) := \(src)"
        case "STP":
            let (a, _) = stack.pop()
            let (bbit, _) = stack.pop()
            let (bwid, _) = stack.pop()
            let (b, _) = stack.pop()
            return "\(b):\(bwid):\(bbit) := \(a)"
        case "STB":
            let (src, _) = stack.pop()
            let (dstoffs, _) = stack.pop()
            let (dstaddr, _) = stack.pop()
            return "\(dstaddr)[\(dstoffs)] := \(src)"
        case "SRO", "STR", "STL", "STE":
            let (src, srcType) = stack.pop()
            if srcType == "UNKNOWN" {
                _ = 0
            }
            if let destLoc = inst.memLocation {
                let (destName, destType) = findLabel(destLoc)
                if let destType = destType {
                    switch destType {
                    case "CHAR":
                        if let ch = Int(src), ch >= 0x20 && ch <= 0x7E {
                            return
                                "\(destName ?? destLoc.dispName) := '\(String(format: "%c", ch))'"
                        }
                    case "BOOLEAN":
                        if src == "0" {
                            return "\(destName ?? destLoc.dispName) := FALSE"
                        } else if src == "1" {
                            return "\(destName ?? destLoc.dispName) := TRUE"
                        }
                    default:
                        _ = 0
                        break
                    }
                } else {
                    // destType is unknown.
                    _ = 0
                }
                if destType != srcType {
                    _ = 0
                }
                return "\(destName ?? destLoc.dispName) := \(src)"
            }
            return "\(inst.memLocation?.dispName ?? "unknown") := \(src)"
        case "CIP", "CBP", "CXP", "CLP", "CGP":
            if let dest = inst.destination {
                return handleCallProcedure(dest, stack: &stack)
            }
            return "missing destination!"
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
        for i in 0..<parmCount {
            let (a, _) = stack.pop()
            switch called.parameters[i].type {
            case "CHAR":
                if let ch = Int(a), ch >= 0x20 && ch <= 0x7E {
                    aParams.append("'\(String(format: "%c", ch))'")
                } else {
                    aParams.append(a)
                }
            case "BOOLEAN":
                if a == "0" {
                    aParams.append("FALSE")
                } else if a == "1" {
                    aParams.append("TRUE")
                }
            default:
                aParams.append(a)
            }
        }

        let callSignature =
            "\(called.shortDescription)(\(aParams.reversed().joined(separator:", ")))"

        if called.isFunction {
            stack.push((callSignature, called.returnType))
            return nil
        } else {
            return callSignature
        }
    }

    // func generateControlFlow(
    //     _ inst: OpcodeDecoder.DecodedInstruction, ic: Int, stack: inout StackSimulator
    // ) -> String? {
    //     switch inst.mnemonic {
    //     case "FJP":
    //         guard let dest = inst.params.first else { return nil }
    //         let (cond, _) = stack.pop(true)
    //         if dest > ic {
    //             return "IF \(cond) THEN BEGIN"
    //         } else {
    //             return "UNTIL \(cond)"
    //         }
    //     case "UJP":
    //         guard let dest = inst.params.first else { return nil }
    //         return "GOTO LAB\(dest)"
    //     default:
    //         return nil
    //     }
    // }
}

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
    // allLabels: inout Set<Location>,
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
    let decoder = OpcodeDecoder(cd: cd)  // TODO: Use decoder.decode() in refactored loop
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
        if ic == 0x924 {
            // Debug breakpoint
            let _ = 0
        }
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
                let (suffix, prefix, inc, dataType) = decoder.decodeComparator(at: decoded.comparatorOffset)
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
                // ABI: Absolute value of integer (TOS)
                let (a, t) = simulator.pop("INTEGER")
                if t != "INTEGER" {
                    _ = 0
                }
                simulator.push(("ABI(\(a))", "INTEGER"))
                ic += bytesConsumed
            case abr:
                // ABR: Absolute value of real (TOS)
                let (a, _) = simulator.popReal()
                simulator.pushReal("ABR(\(a))")
                ic += bytesConsumed
            case adi:
                // ADI: Add integers (TOS + TOS-1)
                let (a, _) = simulator.pop("INTEGER")
                let (b, _) = simulator.pop("INTEGER")
                simulator.push(("\(b) + \(a)", "INTEGER"))
                ic += bytesConsumed
            case adr:
                // ADR: Add reals (TOS + TOS-1)
                let (a, _) = simulator.popReal()
                let (b, _) = simulator.popReal()
                simulator.pushReal("\(a) + \(b)")
                ic += bytesConsumed
            case land:
                // LAND: Logical AND (TOS & TOS-1)
                let (a, _) = simulator.pop("BOOLEAN")
                let (b, _) = simulator.pop("BOOLEAN")
                simulator.push(("\(b) AND \(a)", "BOOLEAN"))
                ic += bytesConsumed
            case dif:
                // DIF: Set difference (TOS-1 AND NOT TOS)
                let (set1Len, set1) = simulator.popSet()
                let (set2Len, set2) = simulator.popSet()
                let maxLen = max(set1Len, set2Len)
                for i in 0..<maxLen {
                    simulator.push(("(\(set2) AND NOT \(set1)){\(i)}", "SET"))
                    // simulator.push(("\(set2) AND NOT \(set1)", "SET"))
                }
                simulator.push(("\(maxLen)", "INTEGER"))
                ic += bytesConsumed
            case dvi:
                // DVI: Divide integers (TOS-1 / TOS)
                let (a, _) = simulator.pop("INTEGER")
                let (b, _) = simulator.pop("INTEGER")
                simulator.push(("\(b) / \(a)", "INTEGER"))
                ic += bytesConsumed
            case dvr:
                // DVR: Divide reals (TOS-1 / TOS)
                let (a, _) = simulator.popReal()
                let (b, _) = simulator.popReal()
                simulator.pushReal("\(b) / \(a)")
                ic += bytesConsumed
            case chk:
                // CHK: Check subrange (TOS-1 <= TOS-2 <= TOS)
                let _ = simulator.pop()
                let _ = simulator.pop()
                let c = simulator.pop()
                simulator.push(c)
                ic += bytesConsumed
            case flo:
                // FLO: Float next to TOS (int TOS-1 to real TOS)
                let a = simulator.pop()  // TOS
                let (b, _) = simulator.pop()  // TOS-1
                simulator.push(a)  // put previous TOS back
                simulator.pushReal(b)  // real(TOS-1)->TOS
                ic += bytesConsumed
            case flt:
                // FLT: Float TOS (int TOS to real TOS)
                let (a, _) = simulator.pop("INTEGER")
                simulator.pushReal(a)
                ic += bytesConsumed
            case inn:
                // INN: Set membership (TOS-1 in set TOS)
                let (_, set) = simulator.popSet()
                let (chk, _) = simulator.pop()
                simulator.push(("\(chk) IN \(set)", "BOOLEAN"))
                ic += bytesConsumed
            case int:
                // INT: Set intersection (TOS AND TOS-1)
                let (set1Len, set1) = simulator.popSet()
                let (set2Len, set2) = simulator.popSet()
                let maxLen = max(set1Len, set2Len)
                for i in 0..<maxLen {
                    simulator.push(("(\(set1) AND \(set2)){\(i)}", "SET"))
                }
                simulator.push(("\(maxLen)", "INTEGER"))
                ic += bytesConsumed
            case lor:
                // LOR: Logical OR (TOS | TOS-1)
                let (a, _) = simulator.pop("BOOLEAN")
                let (b, _) = simulator.pop("BOOLEAN")
                simulator.push(("\(b) OR \(a)", "BOOLEAN"))
                ic += bytesConsumed
            case modi:
                // MODI: Modulo integers (TOS-1 % TOS)
                let (a, _) = simulator.pop("INTEGER")
                let (b, _) = simulator.pop("INTEGER")
                simulator.push(("\(b) % \(a)", "INTEGER"))
                ic += bytesConsumed
            case mpi:
                // MPI: Multiply integers (TOS * TOS-1)
                let (a, _) = simulator.pop("INTEGER")
                let (b, _) = simulator.pop("INTEGER")
                simulator.push(("\(b) * \(a)", "INTEGER"))
                ic += bytesConsumed
            case mpr:
                // MPR: Multiply reals (TOS * TOS-1)
                let (a, _) = simulator.popReal()
                let (b, _) = simulator.popReal()
                simulator.pushReal("\(b) * \(a)")
                ic += bytesConsumed
            case ngi:
                // NGI: Negate integer
                let (a, _) = simulator.pop("INTEGER")
                simulator.push(("-\(a)", "INTEGER"))
                ic += bytesConsumed
            case ngr:
                // NGR: Negate real
                let (a, _) = simulator.popReal()
                simulator.pushReal("-\(a)")
                ic += bytesConsumed
            case lnot:
                // LNOT: Logical NOT (~TOS)
                let (a, _) = simulator.pop("BOOLEAN")
                simulator.push(("NOT \(a)", "BOOLEAN"))
                ic += bytesConsumed
            case srs:
                // SRS: Subrange set [TOS-1..TOS] (creates set on stack)
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
                // SBI: Subtract integers (TOS-1 - TOS)
                let (a, _) = simulator.pop("INTEGER")
                let (b, _) = simulator.pop("INTEGER")
                simulator.push(("\(b) - \(a)", "INTEGER"))
                ic += bytesConsumed
            case sbr:
                // SBR: Subtract reals (TOS-1 - TOS)
                let (a, _) = simulator.popReal()
                let (b, _) = simulator.popReal()
                simulator.pushReal("\(b) - \(a)")
                ic += bytesConsumed
            case sgs:
                // SGS: Build singleton set [TOS]
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
                // SQI: Square integer (TOS * TOS)
                let (a, _) = simulator.pop("INTEGER")
                simulator.push(("\(a) * \(a)", "INTEGER"))
                ic += bytesConsumed
            case sqr:
                // SQR: Square real (TOS * TOS)
                let (a, _) = simulator.popReal()
                simulator.pushReal("\(a) * \(a)")
                ic += bytesConsumed
            case sto:
                // STO: Store indirect word (TOS into TOS-1)
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case ixs:
                // IXS: Index string array (check 1 <= TOS <= len of str byte ptr TOS-1)
                // doesn't store anything on the stack - it would throw exec error if it fails
                _ = simulator.pop()  // discard index
                _ = simulator.pop()  // discard byte ptr offset
                _ = simulator.pop()  // discard byte ptr base
                ic += bytesConsumed
            case uni:
                // UNI: Set union (TOS OR TOS-1)
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
                // LDE: Load extended word (pushes value onto stack)
                let seg = decoded.params[0]
                let val = decoded.params[1]
                simulator.push(("LDE[\(seg):\(val)]", "INTEGER"))
                ic += bytesConsumed
            case csp:
                // CSP: Call standard procedure
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
                    if !ret.isEmpty {
                        if ret == "REAL" {
                            simulator.pushReal(
                                "\(cspName)(\(callParms.reversed().joined(separator:", ")))")
                        } else {
                            simulator.push(
                                ("\(cspName)(\(callParms.reversed().joined(separator:", ")))", ret))
                        }
                    } else {
                        // no return value
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
                // ADJ: Adjust set to count words
                let count = decoded.params[0]
                let (_, set) = simulator.popSet()
                for i in 0..<count {
                    simulator.push(("\(set){\(i)}", "SET"))
                }
                simulator.push(("\(count)", "INTEGER"))
                ic += bytesConsumed
            case fjp:
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
                // indentLevel += 1
                ic += bytesConsumed
            case inc:
                // INC: Inc field ptr (TOS+val)
                let val = decoded.params[0]
                let (a, _) = simulator.pop()
                simulator.push(("\(a) + \(val)", "POINTER"))
                ic += bytesConsumed
            case ind:
                // IND: Static index and load word (TOS+val)
                let val = decoded.params[0]
                let (a, _) = simulator.pop()
                simulator.push(("\(a) + \(val)", "INTEGER"))
                ic += bytesConsumed
            case ixa:
                let _ = decoded.params[0]  // Element size, used for address calculation but not in pseudo-code
                let (a, _) = simulator.pop()
                let (b, _) = simulator.pop()
                simulator.push(("\(b)[\(a)]", "POINTER"))
                ic += bytesConsumed
            case lao:
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case lsa:
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
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case mov:
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case ldo:
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case sas:
                // SAS: String assign
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case sro:
                if let loc = decoded.memLocation {
                    allLocations.insert(loc)
                    pseudoCode = pseudoGen.generateForInstruction(
                        decoded, stack: &simulator, loc: loc)
                }
                ic += bytesConsumed
            case xjp:
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
                let retCount = decoded.params[0]
                isFunction = (retCount > 0)
                ic += bytesConsumed
                done = true
            case cip:
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
                // EQL
                handleComparison(comparatorDataType, &simulator, "=")
                ic += bytesConsumed
            case geq:
                handleComparison(comparatorDataType, &simulator, ">=")
                ic += bytesConsumed
            case grt:
                handleComparison(comparatorDataType, &simulator, ">")
                ic += bytesConsumed
            case lda:
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case ldc:
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
                // LEQ: Less than or equal (TOS-1 <= TOS)
                handleComparison(comparatorDataType, &simulator, "<=")
                ic += bytesConsumed
            case les:
                // LES: Less than (TOS-1 < TOS)
                handleComparison(comparatorDataType, &simulator, "<")
                ic += bytesConsumed
            case lod:
                // LOD: Load intermediate word
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case neq:
                // NEQ: Not equal (TOS-1 <> TOS)
                handleComparison(comparatorDataType, &simulator, "<>")
                ic += bytesConsumed
            case str:
                if let loc = decoded.memLocation {
                    allLocations.insert(loc)
                    pseudoCode = pseudoGen.generateForInstruction(
                        decoded, stack: &simulator, loc: loc)
                }
                ic += bytesConsumed
            case ujp:
                // UJP
                let dest = decoded.params[0]
                if dest > ic {  // jumping forward so an IF
                    flagForLabel.append((dest, indentLevel))
                    pseudoCode = "GOTO LAB\(dest)"
                } else {
                    // jumping backwards, likely a loop - probably a while.
                    // TODO, handle that
                    flagForLabel.append((dest, indentLevel))
                    pseudoCode = "GOTO LAB\(dest)"
                }
                proc.entryPoints.insert(dest)
                ic += bytesConsumed
            case ldp:
                // LDP: Load packed field (TOS)
                let (abit, _) = simulator.pop()
                let (awid, _) = simulator.pop()
                let (a, _) = simulator.pop()
                simulator.push(("\(a):\(awid):\(abit)", "INTEGER"))
                ic += bytesConsumed
            case stp:
                // STP
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case ldm:
                // LDM: Load multiple words (pushes onto stack)
                let ldmCount = decoded.params[0]
                let (wdOrigin, _) = simulator.pop()
                for i in 0..<ldmCount {
                    simulator.push(("\(wdOrigin){\(i)}", "INTEGER"))
                }
                ic += bytesConsumed
            case stm:
                // STM: Store multiple words (pops from stack)
                let stmCount = decoded.params[0]
                for _ in 0..<stmCount {
                    _ = simulator.pop()
                }
                _ = simulator.pop()  // destination address
                ic += bytesConsumed
            case ldb:
                // LDB: Load byte at byte ptr TOS-1 + TOS
                let (a, _) = simulator.pop()
                let (b, _) = simulator.pop()
                simulator.push(("\(b)[\(a)]", "BYTE"))
                ic += bytesConsumed
            case stb:
                // STB
                pseudoCode = pseudoGen.generateForInstruction(decoded, stack: &simulator, loc: nil)
                ic += bytesConsumed
            case ixp:
                // IXP
                let elementsPerWord = decoded.params[0]
                let fieldWidth = decoded.params[1]
                let (idx, _) = simulator.pop()
                let basePtr = simulator.pop()
                simulator.push(basePtr)
                simulator.push(("\(fieldWidth)", "INTEGER"))
                simulator.push(("\(idx)*\(elementsPerWord)", "INTEGER"))
                ic += bytesConsumed
            case rbp:
                // RBP
                let retCount = decoded.params[0]
                isFunction = (retCount > 0)
                ic += bytesConsumed
                done = true
            case cbp:
                // CBP
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
                // EQUI
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
                // GEQI
                let (a, _) = simulator.pop()
                let (b, _) = simulator.pop()
                simulator.push(("\(b) >= \(a)", "BOOLEAN"))
                ic += bytesConsumed
            case grti:
                // GRTI
                let (a, _) = simulator.pop()
                let (b, _) = simulator.pop()
                simulator.push(("\(b) > \(a)", "BOOLEAN"))
                proc.instructions[ic] = Instruction(
                    mnemonic: "GRTI", comment: "Integer TOS-1 > TOS", stackState: currentStack)
                ic += 1
            case lla:
                // LLA
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
                // LDCI: Load one-word constant
                let val = decoded.params[0]
                simulator.push(("\(val)", "INTEGER"))
                ic += bytesConsumed
            case leqi:
                let (a, _) = simulator.pop()
                let (b, _) = simulator.pop()
                simulator.push(("\(b) <= \(a)", "BOOLEAN"))
                ic += bytesConsumed
            case lesi:
                let (a, _) = simulator.pop()
                let (b, _) = simulator.pop()
                simulator.push(("\(b) < \(a)", "BOOLEAN"))
                ic += bytesConsumed
            case ldl:
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case neqi:
                // NEQI: Integer TOS-1 <> TOS
                let (a, _) = simulator.pop()
                let (b, _) = simulator.pop()
                simulator.push(("\(b) <> \(a)", "BOOLEAN"))
                ic += bytesConsumed
            case stl:
                if let loc = decoded.memLocation {
                    allLocations.insert(loc)
                    pseudoCode = pseudoGen.generateForInstruction(
                        decoded, stack: &simulator, loc: loc)
                }
                ic += bytesConsumed
            case cxp:
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
                // LPA: Load packed array
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
                if let loc = decoded.memLocation {
                    allLocations.insert(loc)
                    pseudoCode = pseudoGen.generateForInstruction(
                        decoded, stack: &simulator, loc: loc)
                }
                ic += bytesConsumed
            case nop:
                // NOP: No operation
                ic += bytesConsumed
            case unk1:
                // Unknown opcode
                ic += bytesConsumed
            case unk2:
                // Unknown opcode
                ic += bytesConsumed
            case bpt:
                // BPT: Breakpoint
                ic += bytesConsumed
            case xit:
                // XIT: Exit the operating system
                isFunction = false  // AFAIK only the PASCALSYSTEM.PASCALSYSTEM procedure ever calls this
                ic += bytesConsumed
                done = true
            case nop2:
                // NOP: No operation
                ic += bytesConsumed
            case sldl1...sldl16:
                // SLDL: Short load local word
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case sldo1...sldo16:
                // SLDO: Short load global word
                if let loc = decoded.memLocation {
                    simulator.push(findStackLabel(loc))
                    allLocations.insert(loc)
                }
                ic += bytesConsumed
            case sind0...sind7:
                // SIND: Short index and load word *TOS+offset
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
