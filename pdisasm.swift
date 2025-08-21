import Foundation



struct Name {
    var segName:String
    var procNames: [Int:String]
}
let names:[Int:Name] = [
    0:Name(
        segName: "PASCALSY",
        procNames: [
            1:"PASCALSYSTEM", 2:"EXECERROR", 3:"FINIT", 4:"FRESET", 5:"FOPEN",
            6:"FCLOSE", 7:"FGET", 8:"FPUT", 9:"XSEEK", 10:"FEOF", 11:"FEOLN",
            12:"FREADINT", 13:"FWRITEINT", 14:"XREADREAL", 15:"XWRITEREAL",
            16:"FREADCHAR", 17:"FWRITECHAR", 18:"FREADSTRING",
            19:"FWRITESTRING", 20:"FWRITEBYTES", 21:"FREADLN", 22:"FWRITELN",
            23:"SCONCAT", 24:"SINSERT", 25:"SCOPY", 26:"SDELETE", 27:"SPOS",
            28:"FBLOCKIO", 29: "FGOTOXY", 30:"VOLSEARCH", 31:"WRITEDIR",
            32:"DIRSEARCH", 33:"SCANTITLE", 34:"DELENTRY", 35:"INSENTRY",
            36:"HOMECURSOR", 37:"CLEARSCREEN", 38:"CLEARLINE", 39:"PROMPT",
            40:"SPACEWAIT", 41:"GETCHAR", 42:"FETCHDIR", 43:"PARSECMD",
            48:"COMMAND", 49:"CANTSTRETCH", 50:"WAITSYSVOL", 51:"PRINTLOCS",
            52:"PRINTEXECERR", 53:"PUTPREFIXED", 54:"CHECKDEL", 55:"DOBLOCKIO"]),
    1:Name(
        segName: "USERPROG",
        procNames: [
            1:"USERPROGRAM"]),
    2:Name(
        segName: "FIOPRIMS",
        procNames: [
            1:"PROC1", 2:"FGETSOFTBUF", 3:"PROCESSDLE", 4:"DOENDOFPAGE", 5:"FPUTSOFTBUF"]),
    3:Name(
        segName: "PRINTERR",
        procNames: [1:"PRINTERROR"]),
    4:Name(
        segName: "INITIALI",
        procNames:[
            1:"INITIALIZE", 2:"INITSYSCOM", 3:"INIT_FILLER",
            4:"SETPREFIXEDCRTCTL", 5:"SETPREFIXEDCRTINFO", 6:"INITUNITABLE",
            7:"INIT_ENTRY", 8:"INITHEAP", 9:"INITWORKFILE", 10:"TRY_OPEN",
            11:"INITFILES"]),
    5:Name(
        segName: "GETCMD",
        procNames: [
            1:"GETCMD", 2:"RUNWORKFILE", 3:"SYS_ASSOCIATE", 4:"YESORNO",
            5:"GETSEGNUM", 6:"MISSINGFILE", 7:"FUNC7", 8:"PROC8",9:"PROC9",
            10:"LOADUSERSEGS", 11:"FINDSEGSOFKIND", 12:"LOADINTRINSICS",
            13:"ASSOCIATE", 14:"STARTCOMPILE", 15:"DELETELEADINGSPACES",
            16:"FINISHCOMPILE", 17:"EXECERROR", 18: "PROC18", 19:"EXECUTE",
            20:"SWAPPING", 21:"MAKEEXEC"]),
    6:Name(
        segName: "FILEPROC",
        procNames: [
            1:"PROC1", 2:"RESETER", 3:"FRESET", 4:"FOPEN", 5:"ENTERTEMP",
            6:"PROC6", 7:"FCLOSE", 8:"PARSECMD"]),
]
let cspNames: [Int:String] = [
    0:"IOC", 1:"NEW", 2:"MOVL", 3:"MOVR", 4:"EXIT", 5:"UNITREAD", 6:"UNITWRITE",
    7:"IDS", 8:"TRS", 9:"TIME", 10:"FLCH", 11:"SCAN", 12:"UNITSTATUS",
    21:"LOADSEGMENT", 22:"UNLOADSEGMENT", 23:"TRUNC",24:"ROUND", 32:"MARK",
    33:"RELEASE", 34:"IORESULT", 35:"UNITBUSY", 36:"POT", 37:"UNITWAIT",
    38:"UNITCLEAR", 39:"HALT", 40:"MEMAVAIL"]

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
    
    func decodeComparator(idx:Int)->String{
        switch idx {
        case 2: return "REAL          Real "
        case 4: return "STR           String "
        case 6: return "BOOL          Boolean "
        case 8: return "SET           Set "
        case 10:return "BYTE          Byte array "
        case 12:return "WORD          Word array "
        default : return ""
        }
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
            var procType: String = "";
            var isFunc: Bool = false
            if proc.lexicalLevel >= 0 { procType += String(repeating:" ", count:Int(proc.lexicalLevel)*2) }
            if (exitByte1 == 0xad || exitByte1 == 0xc1) && exitByte2 > 0 {
                isFunc = true
            } else {
                if proc.parameterSize > 2 { isFunc = true }
            }
            if isFunc { procType += "FUNCTION FUNC" } else { procType += "PROCEDURE PROC" }
            procType += String(format:"%d",proc.procedureNumber)
            if proc.parameterSize > 0 {
                procType += "("
                for parmnum in 1...proc.parameterSize {
                    if parmnum > 1 /*&& parmnum < parms*/ { procType += "; "}
                    procType += "PARM"+String(format:"%d",parmnum)
                }
                procType += ")"
            }
            if isFunc { procType += ": RETVAL" }
            
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
                case 0x00..<0x80:print(String(format:"SLDC %02x          Short load constant %d", inCode[ic], inCode[ic])); ic+=1; break;
                case 0x80: print("ABI              Absolute value of integer (TOS)"); ic+=1; break;
                case 0x81: print("ABR              Absolute value of real (TOS)"); ic+=1; break;
                case 0x82: print("ADI              Add integers (TOS + TOS-1)"); ic+=1; break;
                case 0x83: print("ADR              Add reals (TOS + TOS-1)"); ic+=1; break;
                case 0x84: print("LAND             Logical AND (TOS & TOS-1)"); ic+=1; break;
                case 0x85: print("DIF              Set difference (TOS-1 AND NOT TOS)"); ic+=1; break;
                case 0x86: print("DVI              Divide integers (TOS-1 / TOS)"); ic+=1; break;
                case 0x87: print("DVR              Divide reals (TOS-1 / TOS)"); ic+=1; break;
                case 0x88: print("CHK              Check subrange (TOS-1 <= TOS-2 <= TOS"); ic+=1; break;
                case 0x89: print("FLO              Float next to TOS (int TOS-1 to real TOS)"); ic+=1; break;
                case 0x8A: print("FLT              Float TOS (int TOS to real TOS)"); ic+=1; break;
                case 0x8B: print("INN              Set membership (TOS-1 in set TOS)"); ic+=1; break;
                case 0x8C: print("INT              Set intersection (TOS AND TOS-1)"); ic+=1; break;
                case 0x8D: print("LOR              Logical OR (TOS | TOS-1)"); ic+=1; break;
                case 0x8E: print("MODI             Modulo integers (TOS-1 % TOS)"); ic+=1; break;
                case 0x8F: print("MPI              Multiply integers (TOS * TOS-1)"); ic+=1; break;
                case 0x90: print("MPR              Multiply reals (TOS * TOS-1)"); ic+=1; break;
                case 0x91: print("NGI              Negate integer"); ic+=1; break;
                case 0x92: print("NGR              Negate real"); ic+=1; break;
                case 0x93: print("LNOT             Logical NOT (~TOS)"); ic+=1; break;
                case 0x94: print("SRS              Subrange set [TOS-1..TOS]"); ic+=1; break;
                case 0x95: print("SBI              Subtract integers (TOS-1 - TOS)"); ic+=1; break;
                case 0x96: print("SBR              Subtract reals (TOS-1 - TOS)"); ic+=1; break;
                case 0x97: print("SGS              Build singleton set [TOS]"); ic+=1; break;
                case 0x98: print("SQI              Square integer (TOS * TOS)"); ic+=1; break;
                case 0x99: print("SQR              Square real (TOS * TOS)"); ic+=1; break;
                case 0x9A: print("STO              Store indirect (TOS into TOS-1)"); ic+=1; break;
                case 0x9B: print("IXS              Index string array (check 1<=TOS<=len of str TOS-1)"); ic+=1; break;
                case 0x9C: print("UNI              Set union (TOS OR TOS-1"); ic+=1; break;
                case 0x9D:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    print(String(format:"LDE  %02x %04x      Load extended word (word offset %d in data seg %d)",inCode[ic+1],val, val,inCode[ic+1]))
                    ic+=(2+inc)
                    break;
                case 0x9E: print(String(format:"CSP  %02x          Call standard procedure %d ", inCode[ic+1], inCode[ic+1]), cspNames[Int(inCode[ic+1])] ?? ""); ic+=2; break;
                case 0x9F: print("LDCN             Load constant NIL"); ic+=1; break;
                case 0xA0: print(String(format:"ADJ  %02x          Adjust set to %d words", inCode[ic+1], inCode[ic+1])); ic+=2; break;
                case 0xA1:
                    var dest: Int = 0
                    let offset = Int(inCode[ic+1])
                    if offset > 0x7f {
                        let jte = addr + offset - 256
                        dest = jte - readWord(data: inCode, index: jte)// find entry in jump table
                    } else {
                        dest = ic + offset + 2
                    }
                    print(String(format:"FJP  %02x (%04x)   Jump if TOS false", inCode[ic+1], dest)); ic+=2; break;
                case 0xA2: print(String(format:"INCP %02x          Inc field ptr (TOS+%d)", inCode[ic+1], inCode[ic+1])); ic+=2; break;
                case 0xA3: print(String(format:"IND  %02x          Static index and load word (TOS+%d)", inCode[ic+1], inCode[ic+1])); ic+=2; break;
                case 0xA4: print(String(format:"IXA  %02x          Index array (TOS-1 + TOS * %d)", inCode[ic+1], inCode[ic+1])); ic+=2; break;
                case 0xA5: print(String(format:"LAO  %02x          Load global (BASE%d)", inCode[ic+1], inCode[ic+1])); ic+=2; break;
                case 0xA6:
                    print(String(format:"LSA  %02x          Load string address", inCode[ic+1]))
                    print("                         '",terminator:"")
                    if inCode[ic+1] > 0 {
                        for i in 1...inCode[ic+1] {
                            print(String(format:"%c", inCode[ic+1+Int(i)]),terminator: "") }
                    }
                    print("'")
                    ic+=2 + Int(inCode[ic+1])
                    break;
                case 0xA7:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    print(String(format:"LAE  %02x %04x      Load extended address (address offset %d in data seg %d)",inCode[ic+1],val,val,inCode[ic+1]))
                    ic+=(2+inc)
                    break;
                case 0xA8: print(String(format:"MOV  %02x          Move %d words (TOS to TOS-1)", inCode[ic+1], inCode[ic+1])); ic+=2; break;
                case 0xA9: print(String(format:"LDO  %02x          Load global word (BASE%d)", inCode[ic+1], inCode[ic+1])); ic+=2; break;
                case 0xAA: print(String(format:"SAS  %02x          String assign (TOS to TOS-1, %d chars)", inCode[ic+1], inCode[ic+1])); ic+=2; break;
                case 0xAB: print(String(format:"SRO  %02x          Store global word (BASE%d)", inCode[ic+1], inCode[ic+1])); ic+=2; break;
                case 0xAC:
                    ic += 1
                    if ic % 2 != 0 { ic += 1 } // word align
                    let first = readWord(data: inCode, index: ic)
                    ic += 2
                    let last = readWord(data: inCode, index: ic)
                    ic += 2
                    var dest: Int = 0
                    let offset = Int(inCode[ic+1])
                    if offset > 0x7f {
                        let jte = addr + offset - 256
                        dest = jte - readWord(data: inCode, index: jte)// find entry in jump table
                    } else {
                        dest = ic + offset + 2
                    }
                    print(String(format:"XJP  %04x %04x %04x Case jump", first, last, dest))
                    ic += 2
                    var c1 = 0
                    for c in first...last {
                        if c1 == 0 {
                            print(String(repeating: " ", count: 8), terminator: "")
                        }
                        print(String(format:"   %04x -> %04x", c, ic - readWord(data:inCode, index: ic)), terminator: " ")
                        ic += 2
                        c1 += 1
                        if c1 == 4 {
                            c1 = 0
                            print()
                        }
                    }
                    if c1 != 0 { print() }
                    print(String(repeating: " ", count: 7), String(format:"default -> %04x", dest))
                case 0xad: print(String(format:"RNP  %02x          Return from nonbase procedure", inCode[ic+1])); ic+=2; done = true; break
                case 0xAE:
                    print(String(format:"CIP  %02x          Call intermediate procedure %d ", inCode[ic+1], inCode[ic+1]), terminator: "")
                    if let n = names[Int(seg.segNum)] { print(n.procNames[Int(inCode[ic+1])] ?? "") } else { print() }
                    ic+=2; break;
                case 0xAF: print("EQL", decodeComparator(idx: Int(inCode[ic+1])),"TOS-1 = TOS", separator: ""); ic+=2; break;
                case 0xB0: print("GEQ", decodeComparator(idx: Int(inCode[ic+1])),"TOS-1 >= TOS", separator: ""); ic+=2; break;
                case 0xB1: print("GRT", decodeComparator(idx: Int(inCode[ic+1])),"TOS-1 > TOS", separator: ""); ic+=2; break;
                case 0xB2:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    print(String(format:"LDA %02x %04x      Load intermediate addr (%d in AR-%d)",inCode[ic+1],val,val,inCode[ic+1]))
                    ic+=(2+inc)
                    break;
                case 0xB3:
                    let count = Int(inCode[ic+1])
                    print(String(format:"LDC  %02x          Load multiple-word constant", inCode[ic+1]));
                    print("                         ", terminator: "")
                    ic += 2
                    if ic % 2 != 0 { ic += 1 } // word aligned data
                    for i in 0..<count {
                        print(String(format:"%04x", readWord(data: inCode,index: ic+i*2)), terminator: " ")
                    }
                    print()
                    ic += count*2; break;
                case 0xB4: print("LEQ", decodeComparator(idx: Int(inCode[ic+1])),"TOS-1 <= TOS", separator: ""); ic+=2; break;
                case 0xB5: print("LES", decodeComparator(idx: Int(inCode[ic+1])),"TOS-1 < TOS", separator: ""); ic+=2; break;
                case 0xB6:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    print(String(format:"LOD  %02x %04x     Load intermediate word (%d in AR-%d)",inCode[ic+1],val,val,inCode[ic+1]))
                    ic+=(2+inc)
                    break;
                case 0xB7: print("NEQ", decodeComparator(idx: Int(inCode[ic+1])),"TOS-1 <> TOS", separator: ""); ic+=2; break;
                case 0xB8:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    print(String(format:"STR  %02x %04x     Store intermediate word (TOS to %04x in AR-%d)",inCode[ic+1],val,val,inCode[ic+1]))
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
                    print(String(format:"UJP  %02x (%04x)   Unconditional jump", inCode[ic+1], dest)); ic+=2; break;
                case 0xBA: print("LDP              Load packed field (TOS)"); ic+=1; break;
                case 0xBB: print("STP              Store packed field (TOS into TOS-1)"); ic+=1; break;
                case 0xBC: print(String(format:"LDM  %02x          Load %d words from (TOS)", inCode[ic+1], inCode[ic+1])); ic+=2; break;
                case 0xBD: print(String(format:"STM  %02x          Store %d words at TOS to TOS-1", inCode[ic+1], inCode[ic+1])); ic+=2; break;
                case 0xBE: print("LDB              Load byte at byte ptr TOS-1 + TOS"); ic+=1; break;
                case 0xBF: print("STB              Store byte at TOS to byte ptr TOS-2 + TOS-1"); ic+=1; break;
                case 0xC0: print(String(format:"IXP  %02x %02x       Index packed array TOS-1[TOS], %d elts/word, %d field width", inCode[ic+1], inCode[ic+2], inCode[ic+1], inCode[ic+2])); ic+=3; break;
                case 0xc1: print(String(format:"RBP  %02x          Return from base procedure", inCode[ic+1])); ic+=2; done = true; break
                case 0xC2: print(String(format:"CBP  %02x          Call base procedure %d ", inCode[ic+1], inCode[ic+1]), terminator: "")
                    if let n = names[Int(seg.segNum)] { print(n.procNames[Int(inCode[ic+1])] ?? "")} else { print("") }
                    ic+=2; break;
                case 0xC3: print("EQUI             Integer TOS-1 = TOS"); ic+=1; break;
                case 0xC4: print("GEQI             Integer TOS-1 >= TOS"); ic+=1; break;
                case 0xC5: print("GRTI             Integer TOS-1 > TOS"); ic+=1; break;
                case 0xC6:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    print(String(format:"LLA  %04x        Load local address MP%d",val, val))
                    ic+=(1+inc)
                    break;
                case 0xC7:
                    let val = readWord(data: inCode, index: ic+1)
                    print(String(format:"LDCI %04x        Load word %d",val,val))
                    ic+=3; break;
                case 0xC8: print("LEQI             Integer TOS-1 <= TOS"); ic+=1; break;
                case 0xC9: print("LESI             Integer TOS-1 < TOS"); ic+=1; break;
                case 0xCA:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    print(String(format:"LDL  %04x        Load local word MP%d",val,val))
                    ic+=(1+inc)
                    break;
                case 0xCB: print("NEQI             Integer TOS-1 <> TOS"); ic+=1; break;
                case 0xCC:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    print(String(format:"STL  %04x        Store TOS into MP%d",val,val))
                    ic+=(1+inc)
                    break;
                case 0xCD:print(String(format:"CXP  %02x %02x       Call external procedure %d in seg %d ", inCode[ic+1], inCode[ic+2],inCode[ic+2],inCode[ic+1]), terminator: "");
                    if let n = names[Int(inCode[ic+1])] { print(n.procNames[Int(inCode[ic+2])] ?? "")} else { print() }
                    ic+=3; break;
                case 0xCE: print(String(format:"CLP  %02x          Call local procedure %d (immediate child)",inCode[ic+1], inCode[ic+1]), terminator: "")
                    if let n = names[Int(seg.segNum)] { print(n.procNames[Int(inCode[ic+1])] ?? "")} else { print() }
                    ic+=2; break;
                case 0xCF: print(String(format:"CGP  %02x          Call global procedure %d (lexLevel 1, curr seg)", inCode[ic+1], inCode[ic+1]), terminator:"" )
                    if let n = names[Int(seg.segNum)] { print(n.procNames[Int(inCode[ic+1])] ?? "")} else { print() }
                    ic+=2; break;
                case 0xD0:
                    let count = Int(inCode[ic+1])
                    print(String(format:"LPA  %02x          Load packed array", inCode[ic+1]));
                    print("                         ", terminator: "")
                    for i in 1...count {
                        print(String(format:"%02x", inCode[ic+1+i]), terminator: " ")
                    }
                    print()
                    ic+=(2+count); break;
                case 0xD1:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    print(String(format:"STE  %02x %04x      Store extended word (TOS into word offset %d in data seg %d)",inCode[ic+1],val,val,inCode[ic+1]))
                    ic+=(2+inc)
                    break;
                case 0xD2: print("NOP              No operation"); ic+=1;break
                case 0xD3: print(String(format:"---  %02x", inCode[ic+1])); ic+=2; break;
                case 0xD4: print(String(format:"---  %02x", inCode[ic+1])); ic+=2; break;
                case 0xd5:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    print(String(format:"BPT  %04x      Breakpoint",val))
                    ic+=(1+inc)
                    break;
                case 0xd6: print("XIT            Exit the operating system"); ic+=1;done=true; break
                case 0xd7: print("NOP              No operation"); ic+=1;break
                case 0xd8...0xe7: print(String(format:"SLDL %02x          Short load local MP%d", inCode[ic]-0xd7, inCode[ic]-0xd7)); ic+=1; break;
                case 0xe8...0xf7: print(String(format:"SLDO %02x          Short load global BASE%d", inCode[ic]-0xe7, inCode[ic]-0xe7)); ic+=1; break
                case 0xf8...0xff: print(String(format:"SIND %02x          Short index load *TOS+%d", inCode[ic]-0xf8, inCode[ic]-0xf8)); ic+=1; break;
                default:print(String(format:"%02x", inCode[ic])); ic+=1; break
                }
                
            }
        }
        
    }
    
} catch {
    print("Error reading binary file: \(error.localizedDescription)")
}

