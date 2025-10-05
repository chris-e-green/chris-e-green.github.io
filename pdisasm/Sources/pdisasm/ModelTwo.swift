//
//  ModelTwo.swift
//  PascalDisassembler
//
//  Created by Christopher Green on 17/9/2025.
//
import Foundation

class ModelTwo {
    
    enum ParamType {
        case Byte
        case Big
        case Word
        case Address
        case String
        case ByteArray
        case WordArray
        case Constant
        case DataLength
        case ComparisonDataType
        case CaseMinimum
        case CaseMaximum
        case CSPOpCode
        case Segment
        case Offset
    }
    struct OpInfo {
        var mnemonic: String
        var parameters: [ParamType]
        var constant: Int?
        var dataLength: Int?
        var comparisonDataType: Int?
        var cspOpCode: Int?
        var caseMinimum: Int?
        var caseMaximum: Int?
        var comment: String
        var segment: Int?
        var offset: Int?
    }
    
    var opTable: [Int:OpInfo] = [
        0x80:OpInfo(mnemonic:"ABI",parameters:[],comment:"Absolute value of integer (TOS)"),
        0x81:OpInfo(mnemonic:"ABR",parameters:[],comment:"Absolute value of real (TOS)"),
        0x82:OpInfo(mnemonic:"ADI",parameters:[],comment:"Add integers (TOS + TOS-1)"),
        0x83:OpInfo(mnemonic:"ADR",parameters:[],comment:"Add reals (TOS + TOS-1)"),
        0x84:OpInfo(mnemonic:"LAND",parameters:[],comment:"Logical AND (TOS & TOS-1)"),
        0x85:OpInfo(mnemonic:"DIF",parameters:[],comment:"Set difference (TOS-1 AND NOT TOS)"),
        0x86:OpInfo(mnemonic:"DVI",parameters:[],comment:"Divide integers (TOS-1 / TOS)"),
        0x87:OpInfo(mnemonic:"DVR",parameters:[],comment:"Divide reals (TOS-1 / TOS)"),
        0x88:OpInfo(mnemonic:"CHK",parameters:[],comment:"Check subrange (TOS-1 <= TOS-2 <= TOS"),
        0x89:OpInfo(mnemonic:"FLO",parameters:[],comment:"Float next to TOS (int TOS-1 to real TOS)"),
        0x8A:OpInfo(mnemonic:"FLT",parameters:[],comment:"Float TOS (int TOS to real TOS)"),
        0x8B:OpInfo(mnemonic:"INN",parameters:[],comment:"Set membership (TOS-1 in set TOS)"),
        0x8C:OpInfo(mnemonic:"INT",parameters:[],comment:"Set intersection (TOS AND TOS-1)"),
        0x8D:OpInfo(mnemonic:"LOR",parameters:[],comment:"Logical OR (TOS | TOS-1)"),
        0x8E:OpInfo(mnemonic:"MODI",parameters:[],comment:"Modulo integers (TOS-1 % TOS)"),
        0x8F:OpInfo(mnemonic:"MPI",parameters:[],comment:"Multiply integers (TOS * TOS-1)"),
        0x90:OpInfo(mnemonic:"MPR",parameters:[],comment:"Multiply reals (TOS * TOS-1)"),
        0x91:OpInfo(mnemonic:"NGI",parameters:[],comment:"Negate integer"),
        0x92:OpInfo(mnemonic:"NGR",parameters:[],comment:"Negate real"),
        0x93:OpInfo(mnemonic:"LNOT",parameters:[],comment:"Logical NOT (~TOS)"),
        0x94:OpInfo(mnemonic:"SRS",parameters:[],comment:"Subrange set [TOS-1..TOS]"),
        0x95:OpInfo(mnemonic:"SBI",parameters:[],comment:"Subtract integers (TOS-1 - TOS)"),
        0x96:OpInfo(mnemonic:"SBR",parameters:[],comment:"Subtract reals (TOS-1 - TOS)"),
        0x97:OpInfo(mnemonic:"SGS",parameters:[],comment:"Build singleton set [TOS]"),
        0x98:OpInfo(mnemonic:"SQI",parameters:[],comment:"Square integer (TOS * TOS)"),
        0x99:OpInfo(mnemonic:"SQR",parameters:[],comment:"Square real (TOS * TOS)"),
        0x9A:OpInfo(mnemonic:"STO",parameters:[],comment:"Store indirect (TOS into TOS-1)"),
        0x9B:OpInfo(mnemonic:"IXS",parameters:[],comment:"Index string array (check 1<=TOS<=len of str TOS-1)"),
        0x9C:OpInfo(mnemonic:"UNI",parameters:[],comment:"Set union (TOS OR TOS-1)"),
        0x9D:OpInfo(mnemonic:"LDE",parameters:[ParamType.Segment,ParamType.Offset],comment:"Load extended word"),
        0x9E:OpInfo(mnemonic:"CSP",parameters:[ParamType.Byte],comment:"Call standard procedure"),
        0x9F:OpInfo(mnemonic:"LDCN",parameters:[],comment:"Load constant NIL"),
        0xA0:OpInfo(mnemonic:"ADJ",parameters:[ParamType.Byte],comment:"Adjust set to n words"),
        0xA1:OpInfo(mnemonic:"FJP",parameters:[ParamType.Address],comment:"Jump if TOS false"),
        0xA2:OpInfo(mnemonic:"INC",parameters:[ParamType.Big],comment:"Inc field ptr"),
        0xA3:OpInfo(mnemonic:"IND",parameters:[ParamType.Big],comment:"Static index and load word"),
        0xA4:OpInfo(mnemonic:"IXA",parameters:[ParamType.Big],comment:"Index array"),
        0xA5:OpInfo(mnemonic:"LAO",parameters:[ParamType.Big],comment:"Load global"),
        0xA6:OpInfo(mnemonic:"LSA",parameters:[ParamType.String],comment:"Load string address"),
        0xA7:OpInfo(mnemonic:"LAE",parameters:[ParamType.Byte,ParamType.Big],comment:"Load extended address"),
        0xA8:OpInfo(mnemonic:"MOV",parameters:[ParamType.Big],comment:"Move words (TOS to TOS-1)"),
        0xA9:OpInfo(mnemonic:"LDO",parameters:[ParamType.Big],comment:"Load global word"),
        0xAA:OpInfo(mnemonic:"SAS",parameters:[ParamType.Byte],comment:"String assign (TOS to TOS-1)"),
        0xAB:OpInfo(mnemonic:"SRO",parameters:[ParamType.Big],comment:"Store global word"),
        0xAD:OpInfo(mnemonic:"RNP",parameters:[ParamType.Byte],comment:"Return from nonbase procedure"),
        0xAE:OpInfo(mnemonic:"CIP",parameters:[ParamType.Byte],comment:"Call intermediate procedure"),
        0xB2:OpInfo(mnemonic:"LDA",parameters:[ParamType.Byte,ParamType.Big],comment:"Load addr"),
        0xB6:OpInfo(mnemonic:"LOD",parameters:[ParamType.Byte,ParamType.Big],comment:"Load word"),
        0xB8:OpInfo(mnemonic:"STR",parameters:[ParamType.Byte,ParamType.Big],comment:"Store TOS"),
        0xB9:OpInfo(mnemonic:"UJP",parameters:[ParamType.Address],comment:"Unconditional jump"),
        0xBA:OpInfo(mnemonic:"LDP",parameters:[],comment:"Load packed field (TOS)"),
        0xBB:OpInfo(mnemonic:"STP",parameters:[],comment:"Store packed field (TOS into TOS-1)"),
        0xBC:OpInfo(mnemonic:"LDM",parameters:[ParamType.Byte],comment:"Load words from (TOS)"),
        0xBD:OpInfo(mnemonic:"STM",parameters:[ParamType.Byte],comment:"Store words at TOS to TOS-1"),
        0xBE:OpInfo(mnemonic:"LDB",parameters:[],comment:"Load byte at byte ptr TOS-1 + TOS"),
        0xBF:OpInfo(mnemonic:"STB",parameters:[],comment:"Store byte at TOS to byte ptr TOS-2 + TOS-1"),
        0xC0:OpInfo(mnemonic:"IXP",parameters:[ParamType.Byte,ParamType.Byte],comment:"Index packed array TOS-1[TOS]"),
        0xc1:OpInfo(mnemonic:"RBP",parameters:[ParamType.Byte],comment:"Return from base procedure"),
        0xC2:OpInfo(mnemonic:"CBP",parameters:[ParamType.Byte],comment:"Call base procedure"),
        0xC3:OpInfo(mnemonic:"EQUI",parameters:[],comment:"Integer TOS-1 = TOS"),
        0xC4:OpInfo(mnemonic:"GEQI",parameters:[],comment:"Integer TOS-1 >= TOS"),
        0xC5:OpInfo(mnemonic:"GRTI",parameters:[],comment:"Integer TOS-1 > TOS"),
        0xC6:OpInfo(mnemonic:"LLA",parameters:[ParamType.Big],comment:"Load local address"),
        0xC7:OpInfo(mnemonic:"LDCI",parameters:[ParamType.Word],comment:"Load word"),
        0xC8:OpInfo(mnemonic:"LEQI",parameters:[],comment:"Integer TOS-1 <= TOS"),
        0xC9:OpInfo(mnemonic:"LESI",parameters:[],comment:"Integer TOS-1 < TOS"),
        0xCA:OpInfo(mnemonic:"LDL",parameters:[ParamType.Big],comment:"Load local word"),
        0xCB:OpInfo(mnemonic:"NEQI",parameters:[],comment:"Integer TOS-1 <> TOS"),
        0xCC:OpInfo(mnemonic:"STL",parameters:[ParamType.Big],comment:"Store TOS into local addr"),
        0xCD:OpInfo(mnemonic:"CXP",parameters:[ParamType.Byte,ParamType.Byte],comment:"Call external procedure"),
        0xCE:OpInfo(mnemonic:"CLP",parameters:[ParamType.Byte],comment:"Call local procedure"),
        0xCF:OpInfo(mnemonic:"CGP",parameters:[ParamType.Byte],comment:"Call global procedure"),
        0xD0:OpInfo(mnemonic:"LPA",parameters:[ParamType.ByteArray],comment:"Load packed array"),
        0xD1:OpInfo(mnemonic:"STE",parameters:[ParamType.Byte,ParamType.Big],comment:"Store extended word (TOS into word mem)"),
        0xD2:OpInfo(mnemonic:"NOP",parameters:[],comment:"No operation"),
        0xD3:OpInfo(mnemonic:"---",parameters:[ParamType.Byte],comment:"Undocumented"),
        0xD4:OpInfo(mnemonic:"---",parameters:[ParamType.Byte],comment:"Undocumented"),
        0xD5:OpInfo(mnemonic:"BPT",parameters:[ParamType.Big],comment:"Breakpoint"),
        0xD6:OpInfo(mnemonic:"XIT",parameters:[],comment:"Exit the operating system"),
        0xD7:OpInfo(mnemonic:"NOP",parameters:[],comment:"No operation"),
        
    ]
    func process(inCode: Data, enterIC: Int, addr: Int) {
        var code = CodeData(data: inCode, ipc: enterIC, header:addr)
        var done: Bool = false
        while code.ipc < addr && !done {
            let ic = code.ipc // save current IPC so we can sequence instructions
            let opcode = code.readByte()
            var instrDetail = opTable[opcode]
            if instrDetail == nil {
                if opcode <= 0x7F {
                    instrDetail = OpInfo(mnemonic: "SLDC", parameters:[ParamType.Constant], constant: opcode, comment:"Short load constant")
                } else if opcode == 0xac {
                    instrDetail = OpInfo(mnemonic: "XJP", parameters:[ParamType.CaseMinimum, ParamType.CaseMaximum, ParamType.Byte, ParamType.Address, ParamType.WordArray], comment:"Case jump")
                } else if opcode == 0xaf {
                    instrDetail = OpInfo(mnemonic:"EQL", parameters: [ParamType.ComparisonDataType], comment:"TOS-1 = TOS")
                } else if opcode == 0xb0 {
                    instrDetail = OpInfo(mnemonic:"GEQ", parameters: [ParamType.ComparisonDataType], comment:"TOS-1 >= TOS")
                } else if opcode == 0xb1 {
                    instrDetail = OpInfo(mnemonic:"GRT", parameters: [ParamType.ComparisonDataType], comment:"TOS-1 > TOS")
                } else if opcode == 0xb3 {
                    instrDetail = OpInfo(mnemonic:"LDC", parameters: [ParamType.DataLength, ParamType.WordArray], comment:"Load multiple-word constant")
                } else if opcode == 0xb4 {
                    instrDetail = OpInfo(mnemonic:"LEQ", parameters: [ParamType.ComparisonDataType], comment:"TOS-1 <= TOS")
                } else if opcode == 0xb5 {
                    instrDetail = OpInfo(mnemonic:"LES", parameters: [ParamType.ComparisonDataType], comment:"TOS-1 < TOS")
                } else if opcode == 0xb7 {
                    instrDetail = OpInfo(mnemonic:"NEQ", parameters: [ParamType.ComparisonDataType], comment:"TOS-1 <> TOS")
                } else if 0xd8...0xe7 ~= opcode {
                    instrDetail = OpInfo(mnemonic: "SLDL", parameters:[ParamType.Constant], constant: opcode - 0xd7, comment:"Short load local")
                } else if 0xe8...0xf7 ~= opcode {
                    instrDetail = OpInfo(mnemonic: "SLDO", parameters:[ParamType.Constant], constant: opcode - 0xe7, comment:"Short load global")
                } else if 0xf8...0xff ~= opcode {
                    instrDetail = OpInfo(mnemonic: "SIND", parameters:[ParamType.Constant], constant: opcode - 0xf8, comment:"Short index load")
                }
            }
            
            var ps = ""
            for pt in instrDetail?.parameters ?? [] {
                switch pt {
                case .Byte:
                    ps = ps.appendingFormat("%d ", code.readByte())
                case .Big:
                    ps = ps.appendingFormat("%d ", code.readBig())
                case .Word:
                    ps = ps.appendingFormat("%d ", code.readWord())
                case .Address:
                    ps = ps.appendingFormat("%04x ", code.readAddress())
                case .String:
                    ps = ps.appendingFormat("'%@' ", code.readString())
                case .ByteArray:
                    ps = ps.appendingFormat("%@ ", code.readByteArray())
                case .WordArray:
                    var len: Int?
                    if let dl = instrDetail?.dataLength {
                        len = dl
                    } else if let mx = instrDetail?.caseMaximum, let mn = instrDetail?.caseMinimum {
                        len = mx - mn + 1
                    }
                    
                    ps = ps.appendingFormat("%@ ", code.readWordArray(count: len ?? 0))
                case .Constant:
                    ps = ps.appendingFormat("%d ", instrDetail?.constant ?? 0)
                case .DataLength:
                    instrDetail?.dataLength = code.readByte()
                case .ComparisonDataType:
                    instrDetail?.comparisonDataType = code.readByte()
                case .CaseMinimum:
                    instrDetail?.caseMinimum = code.readWord()
                case .CaseMaximum:
                    instrDetail?.caseMaximum = code.readWord()
                case .CSPOpCode:
                    instrDetail?.cspOpCode = code.readByte()
                case .Segment:
                    instrDetail?.segment = code.readByte()
                case .Offset:
                    instrDetail?.offset = code.readBig()
                }
            }

            if instrDetail?.mnemonic == "RNP" || instrDetail?.mnemonic == "RBP" || instrDetail?.mnemonic == "XIT" {
                done = true
            }
            
            var ps2 = ""
            if ps.count > 15 { ps2 = ps ; ps = "" }
            print(String(format: "%04x: %4@ %15@ %@", ic, instrDetail?.mnemonic.padding(toLength: 5, withPad: " ", startingAt: 0) ?? "???", (ps.isEmpty ? "" : ps).padding(toLength: 15, withPad: " ", startingAt: 0), instrDetail?.comment ?? "???"))
            if ps2.isEmpty == false { print(String(format: "            %@", ps2)) }
        }
    }
}
