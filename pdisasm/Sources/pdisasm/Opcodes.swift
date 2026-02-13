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
        "MOVELEFT",
        [
            Identifier(name: "SRCADDR", type: "POINTER"),
            Identifier(name: "SRCOFFS", type: "INTEGER"),
            Identifier(name: "DESTADDR", type: "POINTER"),
            Identifier(name: "DESTOFFS", type: "INTEGER"),
            Identifier(name: "COUNT", type: "INTEGER"),
        ], ""
    ),
    3: (
        "MOVERIGHT",
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
        "FILLCHAR",
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
    36: ("PWROFTEN", [Identifier(name: "NUM", type: "INTEGER")], "REAL"),
    37: ("UNITWAIT", [Identifier(name: "UNIT", type: "INTEGER")], ""),
    38: ("UNITCLEAR", [Identifier(name: "UNIT", type: "INTEGER")], ""),
    39: ("HALT", [], ""),
    40: ("MEMAVAIL", [], "INTEGER"),
]

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
