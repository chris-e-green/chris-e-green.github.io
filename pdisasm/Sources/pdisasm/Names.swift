//
//  Names.swift
//  PascalDisassembler
//
//  Created by Christopher Green on 25/9/2025.
//

struct Name {
    var segName: String
    var procNames: [Int: String]
}

let cspNames: [Int: String] = [
    0: "IOC", 1: "NEW", 2: "MOVL", 3: "MOVR", 4: "EXIT", 5: "UNITREAD",
    6: "UNITWRITE",
    7: "IDS", 8: "TRS", 9: "TIME", 10: "FLCH", 11: "SCAN", 12: "UNITSTATUS",
    21: "LOADSEGMENT", 22: "UNLOADSEGMENT", 23: "TRUNC", 24: "ROUND",
    32: "MARK",
    33: "RELEASE", 34: "IORESULT", 35: "UNITBUSY", 36: "POT", 37: "UNITWAIT",
    38: "UNITCLEAR", 39: "HALT", 40: "MEMAVAIL",
]

let globalNames: [Int: (name: String, type: String)] = [
    1: ("SYSCOM", "^SYSCOMREC"), 2: ("INPUT", "FIB"), 3: ("OUTPUT", "FIB"),
    4: ("SYSTERM", "FIB"),
    /* All of the other global locations differ, specifically between runtime and developer flavours
        8:"USERINFO.CODEFIBP",
        9: "USERINFO.SYMFIB", 10:"USERINFO.ERRNUM", 11:"USERINFO.ERRBLK",
        12:"USERINFO.ERRSYM", 13:"USERINFO.STUPID", 14:"USERINFO.SLOWTERM",
        15:"USERINFO.ALTMODE", 16:"USERINFO.GOTCODE", 17:"USERINFO.GOTSYM",
        18:"USERINFO.CODEVID", 22:"USERINFO.SYMVID", 26:"USERINFO.WORKVID",
        30:"USERINFO.CODETID", 38:"USERINFO.SYMTID", 46:"USERINFO.WORKTID",
        54:"EMPTYHEAP", 55:"SWAPFIB", 56:"SYSTERM", 57:"OUTPUTFIB", 58:"INPUTFIB",
        59:"DKVID", 63:"SYVID", 67:"THEDATE", 68:"DEBUGINFO", 69:"STATE",
        70:"PL", 111:"IPOT", 116:"FILLER", 122:"DIGITS", 126:"UNITABLE"
     */
]
