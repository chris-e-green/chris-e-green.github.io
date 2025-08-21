import Foundation

do {
    let fileURL = URL(fileURLWithPath: "/Users/chris/Documents/Legacy OS and Programming Languages/Apple/Pascal_PCode_Interpreters/SYSTEM.PASCAL-04-00.bin")
    let binaryData = try Data(contentsOf: fileURL)
    let diskInfo = binaryData.subdata(in: 0..<64)
    let segName = binaryData.subdata(in: 64..<192)
    let segKind = binaryData.subdata(in: 192..<224)
    let textAddr = binaryData.subdata(in: 224..<256)
    let segInfo = binaryData.subdata(in: 256..<288)
    let intrinsSegs = binaryData.subdata(in: 288..<296)
    let comment = binaryData.subdata(in: 433..<512)
    
    func getBlocks(from:Int, to:Int) -> Data {
        return binaryData.subdata(in: from*512..<to*512)
    }
    
    func getCodeBlock(at blockNum:UInt16, length:UInt16) -> Data {
        return binaryData.subdata(in: Int(blockNum)*512..<(Int(blockNum)*512)+Int(length))
    }
    
    enum SegmentKind: UInt8 {
        case linked,hostseg,segproc,unitseg,seprtseg,unlinked_intrins,linked_intrins,dataseg
    }
    struct Segment: CustomStringConvertible {
        var codeaddr: UInt16
        var codeleng: UInt16
        var name: String = ""
        var segkind:SegmentKind = .dataseg
        var textaddr: UInt16 = 0
        var segNum: UInt8 = 0
        var mType: UInt8 = 0
        var version: UInt8 = 0
        var description: String {
            return "segNum \(segNum), name: \(name): addr \(String(format:"%04X",codeaddr)), length \(codeleng), kind \(segkind), textAddr \(String(format:"%04X",textaddr)), mType \(mType), version \(version)"
        }
    }
    
    var segTable : [Int: Segment] = [:]
    
    struct segDictionary: CustomStringConvertible {
        var description: String {
            var s = "segTable:\n"
            for (_,v) in segTable {
                s.append("\(v)\n")
            }
            s.append("intrinsics: \(intrinsics)\n")
            s.append("comment: \(comment)\n")
            return s
        }
        
        var segTable : [Int: Segment]
        var intrinsics: Set<UInt8>
        var comment: String
        
        init(segTable: [Int: Segment], intrinsics: Set<UInt8>, comment: String) {
            self.segTable = segTable
            self.intrinsics = intrinsics
            self.comment = comment
        }
    }
    
    struct Procedure {
        var lexicalLevel: Int = 0
        var procedureNumber: Int = 0
        var enterIC: Int = 0
        var exitIC: Int = 0
        var parameterSize: Int = 0
        var dataSize: Int = 0
        var jumpTable: [Int] = []
        var code: [Int] = []
    }
    
    struct ProcedureDictionary{
        var segmentNumber: Int
        var procedureCount: Int
        var procedurePointers: [Int]
    }
    
    struct CodeSegment {
        var procedureDictionary: ProcedureDictionary
        var procedures: [Procedure]
    }
    
    func readBig(data: Data, index: Int) -> (Int, Int) {
        var retval: Int = 0
        var indexInc = 0
        if data[index] <= 127 {
            retval = Int(data[index])
            indexInc = 1
        } else {
            retval = Int(data[index] - 128) << 8 | Int(data[index+1])
            indexInc = 2
        }
        return (retval, indexInc)
    }
    
    func readWord(data: Data, index: Int) -> Int {
        return Int(data[index]) | Int(data[index+1]) << 8
    }
    
    // decode Segment Dictionary
    for i in 0...15 {
        let addr = UInt16(diskInfo[i*4+1]) << 8 | UInt16(diskInfo[i*4])
        let leng = UInt16(diskInfo[i*4+3]) << 8 | UInt16(diskInfo[i*4+2])
        var name = ""
        for j in 0...7 {
            name.append(String(UnicodeScalar(Int(segName[i*8+j]))!))
        }
        let kind = SegmentKind(rawValue: segKind[i*2+1] << 8 | segKind[i*2])
        let segNum = UInt8(segInfo[i*2])
        let mType = UInt8((segInfo[i*2+1] & 0x0F))
        let version = UInt8((segInfo[i*2+1] & 0xE0)>>5)
        let text = UInt16(textAddr[i*2+1]) << 8 | UInt16(textAddr[i*2])
        if leng > 0 {
            segTable[i] = Segment(codeaddr: addr, codeleng: leng, name: name, segkind: kind ?? .dataseg, textaddr: text, segNum: segNum, mType: mType, version: version)
        }
    }
    
    var intrinsicSet: Set<UInt8> = []
    var commentStr: String = ""
    for i in 0..<comment.count {
        if comment[i] > 0 {
            commentStr += String(UnicodeScalar(Int(comment[i]))!)
        }
    }
    
    var i = intrinsSegs.count - 1
    repeat {
        var j = 0
        var t = intrinsSegs[i]
        repeat {
            if (t & 1) == 1 {
                intrinsicSet.insert(UInt8(i*8+j))
            }
            t = t >> 1
            j += 1
        } while (j < 8)
        i -= 1
    } while i >= 0
    let segDict = segDictionary(segTable: segTable, intrinsics: intrinsicSet, comment: commentStr)
    
    print(segDict)
    
    for seg in segDict.segTable.values.sorted(by: {$0.segNum < $1.segNum}) {
        let code = getCodeBlock(at: seg.codeaddr, length: seg.codeleng)
        var extraCode: Data?
        if seg.segNum == 0 {
            if seg.name == "PASCALSY" {
                if let extraSeg = segDict.segTable[15] {
                    extraCode = getCodeBlock(at: extraSeg.codeaddr, length: extraSeg.codeleng)
                }
            } else if seg.name == "        " {
                continue
            }
        }
        
        var procDict: ProcedureDictionary = ProcedureDictionary(segmentNumber: 0, procedureCount: 0, procedurePointers: [])
        var codeSeg: CodeSegment = CodeSegment(procedureDictionary: procDict, procedures: [])
        
        let segnum = code[code.endIndex - 2]
        if segnum == seg.segNum {
            procDict.segmentNumber = Int(segnum)
            procDict.procedureCount = Int(code[code.endIndex - 1])
            
            print(seg.segNum, seg.name, segnum, procDict.procedureCount)
            var curProcStart:UInt16 = 0
            var curProcEnd:UInt16 = 0
            for i in 1...procDict.procedureCount {
                let procPtr = code.endIndex - i * 2 - 2
                let relAddr = Int(code[procPtr + 1]) << 8 | Int(code[procPtr])
                var addr = procPtr - relAddr // the actual address in the file where the proc header is
                procDict.procedurePointers.append(addr)
            }
            codeSeg.procedureDictionary = procDict
        }
        for p in procDict.procedurePointers {
            var proc: Procedure = Procedure()
            var inCode: Data
            var addr = p
            if addr < 0 // contained in the hidden segment
            {
                inCode = extraCode!
                addr = addr + 0x422a
            } else {
                inCode = code
            }
            proc.procedureNumber = Int(inCode[addr])
            proc.lexicalLevel = Int(inCode[Int(addr) + 1])
            if proc.lexicalLevel > 127 { proc.lexicalLevel = proc.lexicalLevel - 256 }
            let entryPtr = addr - 2
            proc.enterIC = entryPtr - (Int(inCode[entryPtr + 1]) << 8 | Int(inCode[entryPtr]))
            let exitPtr = addr - 4
            proc.exitIC = exitPtr - (Int(inCode[exitPtr + 1]) << 8 | Int(inCode[exitPtr]))
            let parmPtr = addr - 6
            proc.parameterSize = (Int(inCode[parmPtr + 1]) << 8 | Int(inCode[parmPtr])) >> 1
            let dataPtr = addr - 8
            proc.dataSize = (Int(inCode[dataPtr + 1]) << 8 | Int(inCode[dataPtr])) >> 1
            let exitByte1 = inCode[proc.exitIC]
            let exitByte2 = inCode[proc.exitIC+1]
            var exitInstr = ""
            switch exitByte1 {
            case 0xad: exitInstr = "RNP";break
            case 0xc1: exitInstr = "RBP";break
            default:
                exitInstr = String(format:"%02x", exitByte1)
            }
            var procType: String = "";
            if proc.lexicalLevel >= 0 { procType += String(repeating:" ", count:Int(proc.lexicalLevel)*2) }
            if exitByte1 == 0xad || exitByte1 == 0xc1 {
                if exitByte2 > 0 { procType += "FUNCTION FUNC" } else { procType += "PROCEDURE PROC" }
                procType += String(format:"%d",proc.procedureNumber)
                if proc.parameterSize > 0 {
                    procType += "("
                    for parmnum in 1...proc.parameterSize {
                        if parmnum > 1 /*&& parmnum < parms*/ { procType += "; "}
                        procType += "PARM"+String(format:"%d",parmnum)
                    }
                    procType += ")"
                }
                if exitByte2 > 0 { procType += ": RETVAL" }
            }
            //                    print(exitInstr, String(format:"%02x", exitByte2))
            print(procType)
            print (String(format:"LL %d entry %04x exit %04x parms=%d words data=%d words", proc.lexicalLevel, proc.enterIC, proc.exitIC, proc.parameterSize, proc.dataSize))
            var ic = proc.enterIC
            var done: Bool = false
            while ic < addr && !done {
                if ic == proc.enterIC { print("->", terminator: "") }
                else if ic == proc.exitIC { print("->", terminator: "") }
                else {print("  ", terminator: "")}
                print(String(format:"%04x:",ic), terminator: " ")
                switch inCode[ic] {
                case 0x00..<0x80:print(String(format:"SLDC %02x", inCode[ic])); ic+=1; break;
                case 0x80: print("ABI"); ic+=1; break;
                case 0x81: print("ABR"); ic+=1; break;
                case 0x82: print("ADI"); ic+=1; break;
                case 0x83: print("ADR"); ic+=1; break;
                case 0x84: print("LAND"); ic+=1; break;
                case 0x85: print("DIFF"); ic+=1; break;
                case 0x86: print("DVI"); ic+=1; break;
                case 0x87: print("DVR"); ic+=1; break;
                case 0x88: print("CHK"); ic+=1; break;
                case 0x89: print("FLO"); ic+=1; break;
                case 0x8A: print("FLT"); ic+=1; break;
                case 0x8B: print("INN"); ic+=1; break;
                case 0x8C: print("INT"); ic+=1; break;
                case 0x8D: print("LOR"); ic+=1; break;
                case 0x8E: print("MODI"); ic+=1; break;
                case 0x8F: print("MPI"); ic+=1; break;
                case 0x90: print("MPR"); ic+=1; break;
                case 0x91: print("NGI"); ic+=1; break;
                case 0x92: print("NGR"); ic+=1; break;
                case 0x93: print("LNOT"); ic+=1; break;
                case 0x94: print("SRS"); ic+=1; break;
                case 0x95: print("SBI"); ic+=1; break;
                case 0x96: print("SBR"); ic+=1; break;
                case 0x97: print("SGS"); ic+=1; break;
                case 0x98: print("SQI"); ic+=1; break;
                case 0x99: print("SQR"); ic+=1; break;
                case 0x9A: print("STO"); ic+=1; break;
                case 0x9B: print("IXS"); ic+=1; break;
                case 0x9C: print("UNI"); ic+=1; break;
                case 0x9D:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    print(String(format:"LDE  %02x %04x",inCode[ic+1],val))
                    ic+=(2+inc)
                    break;
                case 0x9E: print(String(format:"CSP  %02x", inCode[ic+1])); ic+=2; break;
                case 0x9F: print("LDCN"); ic+=1; break;
                case 0xA0: print(String(format:"ADJ  %02x", inCode[ic+1])); ic+=2; break;
                case 0xA1:
                    var dest: Int = 0
                    let offset = Int(inCode[ic+1])
                    if offset > 0x7f {
                        let jte = addr + offset - 256
                        dest = jte - readWord(data: inCode, index: jte)// find entry in jump table
                    } else {
                        dest = ic + offset + 2
                    }
                    print(String(format:"FJP  %02x (%04x)", inCode[ic+1], dest)); ic+=2; break;
                case 0xA2: print(String(format:"INCP %02x", inCode[ic+1])); ic+=2; break;
                case 0xA3: print(String(format:"IND  %02x", inCode[ic+1])); ic+=2; break;
                case 0xA4: print(String(format:"IXA  %02x", inCode[ic+1])); ic+=2; break;
                case 0xA5: print(String(format:"LAO  %02x", inCode[ic+1])); ic+=2; break;
                case 0xA6:
                    print(String(format:"LSA  %02x", inCode[ic+1]), terminator: " ")
                    print("'",terminator:"")
                    if inCode[ic+1] > 0 {
                        for i in 1...inCode[ic+1] {
                            print(String(format:"%c", inCode[ic+1+Int(i)]),terminator: "") }
                    }
                    print("'")
                    ic+=2 + Int(inCode[ic+1])
                    break;
                case 0xA7:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    print(String(format:"LAE  %02x %04x",inCode[ic+1],val))
                    ic+=(2+inc)
                    break;
                case 0xA8: print(String(format:"MOV  %02x", inCode[ic+1])); ic+=2; break;
                case 0xA9: print(String(format:"LDO  %02x", inCode[ic+1])); ic+=2; break;
                case 0xAA: print(String(format:"SAS  %02x", inCode[ic+1])); ic+=2; break;
                case 0xAB: print(String(format:"SRO  %02x", inCode[ic+1])); ic+=2; break;
                case 0xAC:
                    let first = readWord(data: inCode, index: ic+1)
                    let last = readWord(data: inCode, index: ic+3)
                    let retOffset = inCode[ic+6]
                    print(String(format:"XJP  %04x %04x %02x", first, last, retOffset))
                    ic += (7 + last - first + 1)
                case 0xad: print(String(format:"RNP  %02x", inCode[ic+1])); ic+=2; done = true; break
                case 0xAE: print(String(format:"CIP  %02x", inCode[ic+1])); ic+=2; break;
                case 0xAF: print(String(format:"CEQL %02x", inCode[ic+1])); ic+=2; break;
                case 0xB0: print(String(format:"CGEQ %02x", inCode[ic+1])); ic+=2; break;
                case 0xB1: print(String(format:"CGTR %02x", inCode[ic+1])); ic+=2; break;
                case 0xB2:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    print(String(format:"LDAP %02x %04x",inCode[ic+1],val))
                    ic+=(2+inc)
                    break;
                case 0xB3:
                    let count = Int(inCode[ic+1])
                    print(String(format:"LDC  %02x", inCode[ic+1]), terminator: " ");
                    ic += 2
                    if ic % 2 != 0 { ic += 1 } // word aligned data
                    for i in 0..<count {
                        print(String(format:"%04x", readWord(data: inCode,index: ic+i*2)), terminator: " ")
                    }
                    print()
                    ic += count*2; break;
                case 0xB4: print(String(format:"CLEQ %02x", inCode[ic+1])); ic+=2; break;
                case 0xB5: print(String(format:"CLSS %02x", inCode[ic+1])); ic+=2; break;
                case 0xB6:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    print(String(format:"LOD  %02x %04x",inCode[ic+1],val))
                    ic+=(2+inc)
                    break;
                case 0xB7: print(String(format:"CNEQ %02x", inCode[ic+1])); ic+=2; break;
                case 0xB8:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    print(String(format:"STR  %02x %04x",inCode[ic+1],val))
                    ic+=(2+inc)
                    break;
                case 0xB9:
                    var dest: Int = 0
                    let offset = Int(inCode[ic+1])
                    if offset > 0x7f {
                        let jte = addr + offset - 256
                        dest = jte - readWord(data: inCode, index: jte)// find entry in jump table
                    } else {
                        dest = ic + offset + 2
                    }
                    print(String(format:"UJP  %02x (%04x)", inCode[ic+1], dest)); ic+=2; break;
                case 0xBA: print("LDP"); ic+=1; break;
                case 0xBB: print("STP"); ic+=1; break;
                case 0xBC: print(String(format:"LDM  %02x", inCode[ic+1])); ic+=2; break;
                case 0xBD: print(String(format:"STM  %02x", inCode[ic+1])); ic+=2; break;
                case 0xBE: print("LDB"); ic+=1; break;
                case 0xBF: print("STB"); ic+=1; break;
                case 0xC0: print(String(format:"IXP  %02x %02x", inCode[ic+1], inCode[ic+2])); ic+=3; break;
                case 0xc1: print(String(format:"RBP  %02x", inCode[ic+1])); ic+=2; done = true; break
                case 0xC2: print(String(format:"CBP  %02x", inCode[ic+1])); ic+=2; break;
                case 0xC3: print("EQUI"); ic+=1; break;
                case 0xC4: print("GEQI"); ic+=1; break;
                case 0xC5: print("GRTI"); ic+=1; break;
                case 0xC6:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    print(String(format:"LLA  %04x",val))
                    ic+=(1+inc)
                    break;
                case 0xC7:
                    let val = readWord(data: inCode, index: ic+1)
                    print(String(format:"LDCI  %04x",val))
                    ic+=3; break;
                case 0xC8: print("LEQI"); ic+=1; break;
                case 0xC9: print("LESI"); ic+=1; break;
                case 0xCA:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    print(String(format:"LDL  %04x",val))
                    ic+=(1+inc)
                    break;
                case 0xCB: print("NEQI"); ic+=1; break;
                case 0xCC:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    print(String(format:"STL  %04x",val))
                    ic+=(1+inc)
                    break;
                case 0xCD:print(String(format:"CXP  %02x %02x", inCode[ic+1], inCode[ic+2])); ic+=3; break;
                case 0xCE: print(String(format:"CLP  %02x", inCode[ic+1])); ic+=2; break;
                case 0xCF: print(String(format:"CGP  %02x", inCode[ic+1])); ic+=2; break;
                case 0xD0:
                    let count = Int(inCode[ic+1])
                    print(String(format:"LPA  %02x", inCode[ic+1]), terminator: " ");
                    for i in 1...count {
                        print(String(format:"%02x", inCode[ic+1+i]), terminator: " ")
                    }
                    print()
                    ic+=(2+count); break;
                case 0xD1:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    print(String(format:"STE  %02x %04x",inCode[ic+1],val))
                    ic+=(2+inc)
                    break;
                case 0xD2: print("NOP"); ic+=1;break
                case 0xD3: print(String(format:"---  %02x", inCode[ic+1])); ic+=2; break;
                case 0xD4: print(String(format:"---  %02x", inCode[ic+1])); ic+=2; break;
                case 0xd5:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    print(String(format:"BPT  %04x",val))
                    ic+=(1+inc)
                    break;
                case 0xd6: print("XIT"); ic+=1;done=true; break
                case 0xd7: print("NOP"); ic+=1;break
                case 0xd8...0xe7: print(String(format:"SLDL %02x", inCode[ic]-0xd7)); ic+=1; break;
                case 0xe8...0xf7: print(String(format:"SLDO %02x", inCode[ic]-0xe7)); ic+=1; break
                case 0xf8...0xff: print(String(format:"SIND %02x", inCode[ic]-0xf8)); ic+=1; break;
                default:print(String(format:"%02x", inCode[ic])); ic+=1; break
                }
                
            }
        }
        
    }
    
} catch {
    print("Error reading binary file: \(error.localizedDescription)")
}

