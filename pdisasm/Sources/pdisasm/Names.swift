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
let cspProcs: [Int: (String, [LocInfo], String)] = [
    0: ("IOC", [], ""),
    1: ("NEW", [LocInfo(name:"PTR", type:"POINTER"), LocInfo(name:"SIZE", type:"INTEGER")], ""), 
    2: ("MOVL",[LocInfo(name:"SRCADDR", type:"POINTER"), LocInfo(name:"SRCOFFS", type:"INTEGER"), LocInfo(name:"DESTADDR", type:"POINTER"), LocInfo(name:"DESTOFFS", type:"INTEGER"), LocInfo(name:"COUNT", type:"INTEGER")], ""),
    3: ("MOVR", [LocInfo(name:"SRCADDR", type:"POINTER"), LocInfo(name:"SRCOFFS", type:"INTEGER"), LocInfo(name:"DESTADDR", type:"POINTER"), LocInfo(name:"DESTOFFS", type:"INTEGER"), LocInfo(name:"COUNT", type:"INTEGER")], ""),
    4: ("EXIT", [LocInfo(name:"SEGMENT", type:"INTEGER"), LocInfo(name:"PROCEDURE", type:"INTEGER")], ""),
    5: ("UNITREAD",[LocInfo(name:"MODE", type:"INTEGER"), LocInfo(name:"BLOCKNUM", type:"INTEGER"), LocInfo(name:"BYTCOUNT", type:"INTEGER"), LocInfo(name:"BUFFADDR", type:"POINTER"), LocInfo(name:"BUFFOFFS", type:"INTEGER"), LocInfo(name:"UNIT", type:"INTEGER")], ""),
    6: ("UNITWRITE", [LocInfo(name:"MODE", type:"INTEGER"), LocInfo(name:"BLOCKNUM", type:"INTEGER"), LocInfo(name:"BYTCOUNT", type:"INTEGER"), LocInfo(name:"BUFFADDR", type:"POINTER"), LocInfo(name:"BUFFOFFS", type:"INTEGER"), LocInfo(name:"UNIT", type:"INTEGER")], ""),
    7: ("IDSEARCH", [LocInfo(name:"SYMCURSOR", type: "0..1023"), LocInfo(name:"SYMBUF", type:"PACKED ARRAY[0..1023] OF CHAR")], ""),
    8: ("TREESEARCH", [LocInfo(name:"ROOTP", type: "^NODE"), LocInfo(name:"FOUNDP", type:"^NODE"), LocInfo(name:"TARGET", type:"PACKED ARRAY [1..8] OF CHAR")], "INTEGER"),
    9: ("TIME", [LocInfo(name: "TIME1", type: "INTEGER"), LocInfo(name: "TIME2", type: "INTEGER")], ""),
    10: ("FLCH", [LocInfo(name:"DESTADDR", type:"POINTER"), LocInfo(name:"DESTOFFS", type:"INTEGER"), LocInfo(name:"COUNT", type:"INTEGER"), LocInfo(name:"SRC", type:"CHAR")], ""),
    11: ("SCAN", [
        LocInfo(name:"JUNK", type:"INTEGER"), 
        LocInfo(name:"DESTADDR", type:"POINTER"), 
        LocInfo(name:"DESTOFFS", type:"INTEGER"), 
        LocInfo(name:"CH", type:"CHAR"), 
        LocInfo(name:"CHECK", type:"INTEGER"), 
        LocInfo(name:"COUNT", type:"INTEGER")], "INTEGER"),
    12: ("UNITSTATUS", [LocInfo(name: "CTRLWORD", type: "INTEGER"), LocInfo(name: "STATADDR", type: "POINTER"),LocInfo(name: "STATOFFS", type: "INTEGER"), LocInfo(name: "UNIT", type: "INTEGER")], ""),
    21: ("LOADSEGMENT", [LocInfo(name:"SEGMENT", type:"INTEGER")], ""),
    22: ("UNLOADSEGMENT", [LocInfo(name:"SEGMENT", type:"INTEGER")], ""),
    23: ("TRUNC", [LocInfo(name: "NUM", type: "REAL")], "INTEGER"), // TODO when reals are implemented
    24: ("ROUND", [LocInfo(name: "NUM", type: "REAL")], "INTEGER"), // TODO when reals are implemented
    32: ("MARK", [LocInfo(name: "NP", type: "POINTER")], ""),
    33: ("RELEASE", [LocInfo(name: "NP", type: "POINTER")], ""),
    34: ("IORESULT", [], "INTEGER"),
    35: ("UNITBUSY", [LocInfo(name:"UNIT", type:"INTEGER")], "BOOLEAN"),
    36: ("POT", [LocInfo(name:"NUM", type:"INTEGER")], "REAL"),  // TODO when reals are implemented
    37: ("UNITWAIT", [LocInfo(name:"UNIT", type:"INTEGER")], ""),
    38: ("UNITCLEAR", [LocInfo(name:"UNIT", type:"INTEGER")], ""),
    39: ("HALT", [], ""),
    40: ("MEMAVAIL", [], "INTEGER"),
]