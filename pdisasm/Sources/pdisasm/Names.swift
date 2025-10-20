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
