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
            28:"FBLOCKIO", 29: "FGOTOXY"//, 30:"VOLSEARCH", 31:"WRITEDIR",
//            32:"DIRSEARCH", 33:"SCANTITLE", 34:"DELENTRY", 35:"INSENTRY",
//            36:"HOMECURSOR", 37:"CLEARSCREEN", 38:"CLEARLINE", 39:"PROMPT",
//            40:"SPACEWAIT", 41:"GETCHAR", 42:"FETCHDIR", 43:"PARSECMD",
//            48:"COMMAND", 49:"CANTSTRETCH", 50:"WAITSYSVOL", 51:"PRINTLOCS",
//            52:"PRINTEXECERR", 53:"PUTPREFIXED", 54:"CHECKDEL", 55:"DOBLOCKIO"
        ]),
    1:Name(
        segName: "USERPROG",
        procNames: [
            1:"USERPROGRAM"]),
//    2:Name(
//        segName: "FIOPRIMS",
//        procNames: [
//            1:"PROC1", 2:"FGETSOFTBUF", 3:"PROCESSDLE", 4:"DOENDOFPAGE", 5:"FPUTSOFTBUF"]),
    3:Name(
        segName: "PRINTERR",
        procNames: [1:"PRINTERROR"]),
    4:Name(
        segName: "INITIALI",
        procNames:[
            1:"INITIALIZE", 2:"INITSYSCOM", 3:"INIT_FILLER",
            4:"SETPREFIXEDCRTCTL", 5:"SETPREFIXEDCRTINFO", 6:"INITUNITABLE",
//            7:"INIT_ENTRY", 8:"INITHEAP", 9:"INITWORKFILE", 10:"TRY_OPEN",
//            11:"INITFILES"
        ]),
//    5:Name(
//        segName: "GETCMD",
//        procNames: [
//            1:"GETCMD", 2:"RUNWORKFILE", 3:"SYS_ASSOCIATE", 4:"YESORNO",
//            5:"GETSEGNUM", 6:"MISSINGFILE", 7:"FUNC7", 8:"PROC8",9:"PROC9",
//            10:"LOADUSERSEGS", 11:"FINDSEGSOFKIND", 12:"LOADINTRINSICS",
//            13:"ASSOCIATE", 14:"STARTCOMPILE", 15:"DELETELEADINGSPACES",
//            16:"FINISHCOMPILE", 17:"EXECERROR", 18: "PROC18", 19:"EXECUTE",
//            20:"SWAPPING", 21:"MAKEEXEC"]),
//    6:Name(
//        segName: "FILEPROC",
//        procNames: [
//            1:"PROC1", 2:"RESETER", 3:"FRESET", 4:"FOPEN", 5:"ENTERTEMP",
//            6:"PROC6", 7:"FCLOSE", 8:"PARSECMD"]),
]
let cspNames: [Int:String] = [
    0:"IOC", 1:"NEW", 2:"MOVL", 3:"MOVR", 4:"EXIT", 5:"UNITREAD", 6:"UNITWRITE",
    7:"IDS", 8:"TRS", 9:"TIME", 10:"FLCH", 11:"SCAN", 12:"UNITSTATUS",
    21:"LOADSEGMENT", 22:"UNLOADSEGMENT", 23:"TRUNC",24:"ROUND", 32:"MARK",
    33:"RELEASE", 34:"IORESULT", 35:"UNITBUSY", 36:"POT", 37:"UNITWAIT",
    38:"UNITCLEAR", 39:"HALT", 40:"MEMAVAIL"]

let globalLocations: [Int:String] = [
    1:"SYSCOM", 2:"INPUT", 3:"OUTPUT", 4:"SYSTERM",
//    8:"USERINFO.CODEFIBP",
//    9: "USERINFO.SYMFIB", 10:"USERINFO.ERRNUM", 11:"USERINFO.ERRBLK",
//    12:"USERINFO.ERRSYM", 13:"USERINFO.STUPID", 14:"USERINFO.SLOWTERM",
//    15:"USERINFO.ALTMODE", 16:"USERINFO.GOTCODE", 17:"USERINFO.GOTSYM",
//    18:"USERINFO.CODEVID", 22:"USERINFO.SYMVID", 26:"USERINFO.WORKVID",
//    30:"USERINFO.CODETID", 38:"USERINFO.SYMTID", 46:"USERINFO.WORKTID",
//    54:"EMPTYHEAP", 55:"SWAPFIB", 56:"SYSTERM", 57:"OUTPUTFIB", 58:"INPUTFIB",
//    59:"DKVID", 63:"SYVID", 67:"THEDATE", 68:"DEBUGINFO", 69:"STATE",
//    70:"PL", 111:"IPOT", 116:"FILLER", 122:"DIGITS", 126:"UNITABLE"
]

do {
    var filename = ""
    if CommandLine.arguments.count < 2 {
        filename = "/Users/chris/Documents/Legacy OS and Programming Languages/Apple/Pascal_PCode_Interpreters/SYSTEM.PASCAL-02-0A.bin"
    } else {
        filename = CommandLine.arguments[1]
    }
    let fileURL = URL(fileURLWithPath: filename)
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
    
    // retrieves a Data object of length blocks from binaryData starting at block blockNum
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
            return "| \(segNum) | \(name) | \(String(format:"%04X",codeaddr)) | \(codeleng) | \(segkind) | \(String(format:"%04X",textaddr)) | \(mType) | \(version) |"
        }
    }
    
    var segTable : [Int: Segment] = [:]
    
    struct segDictionary: CustomStringConvertible {
        var description: String {
            var s = "## Segment Table\n"
            s.append("| slot |segNum | name | block | length | kind | textAddr | mType | version |\n")
            s.append("|-----:|------:|------|------:|-------:|------|---------:|-------|--------:|\n")
            for (slot,v) in segTable.sorted(by: {$0.value.codeaddr < $1.value.codeaddr}) {
                s.append("| \(slot) \(v)\n")
            }
            s.append("\n")
            s.append("intrinsics: \(intrinsics)\n\n")
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
        var header: String = ""
        var variables: [String] = []
        var instructions: [Int:String] = [:]
        var entryPoints: Set<Int> = []
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
    
    // read and decode a 'BIG' value from Data at index, returning a tuple
    // containing the decoded value and the # of bytes that contained the value
    // (needed so that the IPC can be incremented correctly)
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
    
    // return a word from Data at index
    func readWord(data: Data, index: Int) -> Int {
        return Int(data[index]) | Int(data[index+1]) << 8
    }
    
    func decodeComparator(data: Data, index:Int)->(String, Int) {
        
        switch data[index] {
        case 2: return ("REAL          Real ",1)
        case 4: return ("STR           String ",1)
        case 6: return ("BOOL          Boolean ",1)
        case 8: return ("SET           Set ",1)
        case 10:
            let (val, inc) = readBig(data: data, index: index+1)
            return ("BYTE          Byte array (\(val) long) ", inc+1)
        case 12:
            let (val, inc) = readBig(data: data, index: index+1)
            return ("WORD          Word array (\(val) long) ", inc+1)
        default : return ("",1)
        }
    }
    
    // decode Segment Dictionary
    // first, decode the per-segment parts
    for i in 0...15 {
        let codeaddr = UInt16(diskInfo[i*4+1]) << 8 | UInt16(diskInfo[i*4])
        let codeleng = UInt16(diskInfo[i*4+3]) << 8 | UInt16(diskInfo[i*4+2])
        var name = ""
        for j in 0...7 {
            name.append(String(UnicodeScalar(Int(segName[i*8+j]))!))
        }
        name = name.trimmingCharacters(in: [" "])
        let kind = SegmentKind(rawValue: segKind[i*2+1] << 8 | segKind[i*2])
        var segNum = UInt8(segInfo[i*2])
        if segNum == 0 { segNum = UInt8(i) } // early versions didn't have a segnum in the seg dictionary
        let mType = UInt8((segInfo[i*2+1] & 0x0F))
        let version = UInt8((segInfo[i*2+1] & 0xE0)>>5)
        let text = UInt16(textAddr[i*2+1]) << 8 | UInt16(textAddr[i*2])
        if codeleng > 0 {
            segTable[i] = Segment(codeaddr: codeaddr, codeleng: codeleng, name: name, segkind: kind ?? .dataseg, textaddr: text, segNum: segNum, mType: mType, version: version)
        }
    }
    
    // then decode the per-dictionary parts - the intrinsic set...
   
    var intrinsicSet: Set<UInt8> = []
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
    
    // ... and the comment string.
    var commentStr: String = ""
    for i in 0..<comment.count {
        if comment[i] > 0 {
            commentStr += String(UnicodeScalar(Int(comment[i]))!)
        }
    }
    // ... and put it all together into a segDict object.
    let segDict = segDictionary(segTable: segTable, intrinsics: intrinsicSet, comment: commentStr)
    
    var allGlobalLocs: Set<Int> = []

    var allCodeSegs: [Int:CodeSegment] = [:]
    // for each segment (sorted by segment number), extract the code block from the file
    // if it's the PASCALSYSTEM segment, load the hidden half of the segment too.
    
    for segment in segDict.segTable.sorted(by: {$0.key < $1.key}) {
        let seg = segment.value
        var offset = 0
        let code = getCodeBlock(at: seg.codeaddr, length: seg.codeleng)
        var extraCode: Data = Data()
        if seg.segNum == 0  || seg.segNum == 15 {
            if seg.name == "PASCALSY" {
                if let extraSeg = segDict.segTable[15] {
                    extraCode = getCodeBlock(at: extraSeg.codeaddr, length: extraSeg.codeleng)
                    // all procedures are listed in the segment dictionary at the end of
                    // the primary (block 1) segment. The last byte is the number of
                    // procedures in PASCALSYS altogether.
                    let pascalProcCount = Int(code[code.endIndex - 1]) // how many procedures in total
                    // code.endIndex -2 is the '0'th procedure entry in the table
                    // subtracting 2 * pascalProcCount gets us to the entry for the last procedure
                    let lastProcHdrLoc = code.endIndex - 2 - pascalProcCount * 2
                    // now we get the relative address from that location
                    let lastProcRelativeAddr = readWord(data: code, index: lastProcHdrLoc)
                    // and subtract the header location from the relative address
                    let lastProcAbsAddr = lastProcRelativeAddr - lastProcHdrLoc
                    // that address + the 0'th procedure entry location is what we will
                    // need to add to the negative address stored for the procedures in the hidden
                    // segment to get them to match the physical address in the hidden segment
                    // which is NOT the same address that they'll be loaded in memory by the
                    // runtime but that doesn't actually matter because the procedures themselves
                    // are relative-addressed.
                    offset = lastProcAbsAddr + extraCode.endIndex - 2
                }
            } else if seg.name == "         " || seg.segNum == 15 {
                // we have processed the hidden segment already so we don't need to do
                // anything else with it.
                continue
            }
        }

        var procDict: ProcedureDictionary = ProcedureDictionary(segmentNumber: 0, procedureCount: 0, procedurePointers: [])
        
        var codeSeg: CodeSegment = CodeSegment(procedureDictionary: procDict, procedures: [])
        
        let segnum = code[code.endIndex - 2]

        procDict.segmentNumber = Int(segnum)
        procDict.procedureCount = Int(code[code.endIndex - 1])
                
        for i in 1...procDict.procedureCount {
            let procPtr = code.endIndex - i * 2 - 2
            let relAddr = Int(code[procPtr + 1]) << 8 | Int(code[procPtr])
            let addr = procPtr - relAddr // the actual address in the file where the proc header is
            procDict.procedurePointers.append(addr)
        }
        codeSeg.procedureDictionary = procDict
        var segGlobalLocs: Set<Int> = []
        
        for p in procDict.procedurePointers {
            var proc: Procedure = Procedure()
            var inCode: Data
            var addr = p
            if addr < 0 // contained in the hidden segment
            {
                inCode = extraCode
                addr = addr + offset
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
            var procType: String = "";
            var isFunc: Bool = false
            var ic = proc.enterIC
            var done: Bool = false
            proc.entryPoints.insert(proc.enterIC)
            proc.entryPoints.insert(proc.exitIC)
            var procGlobalLocs: Set<Int> = []
            var baseLocs: Set<Int> = []
            var localLocs: Set<Int> = []
            
            while ic < addr && !done {
                switch inCode[ic] {
                case 0x00..<0x80:
                    proc.instructions[ic] = String(format:"SLDC %02x          Short load constant %d", inCode[ic], inCode[ic])
                    ic+=1; break;
                case 0x80:
                    proc.instructions[ic] = "ABI              Absolute value of integer (TOS)"
                    ic += 1; break;
                case 0x81:
                    proc.instructions[ic] = "ABR              Absolute value of real (TOS)"
                    ic+=1; break;
                case 0x82:
                    proc.instructions[ic] = "ADI              Add integers (TOS + TOS-1)"
                    ic+=1; break;
                case 0x83:
                    proc.instructions[ic] = "ADR              Add reals (TOS + TOS-1)"
                    ic+=1; break;
                case 0x84:
                    proc.instructions[ic] = "LAND             Logical AND (TOS & TOS-1)"
                    ic+=1; break;
                case 0x85:
                    proc.instructions[ic] = "DIF              Set difference (TOS-1 AND NOT TOS)"
                    ic+=1; break;
                case 0x86:
                    proc.instructions[ic] = "DVI              Divide integers (TOS-1 / TOS)"
                    ic+=1; break;
                case 0x87:
                    proc.instructions[ic] = "DVR              Divide reals (TOS-1 / TOS)"
                    ic+=1; break;
                case 0x88:
                    proc.instructions[ic] = "CHK              Check subrange (TOS-1 <= TOS-2 <= TOS"
                    ic+=1; break;
                case 0x89:
                    proc.instructions[ic] = "FLO              Float next to TOS (int TOS-1 to real TOS)"
                    ic+=1; break;
                case 0x8A:
                    proc.instructions[ic] = "FLT              Float TOS (int TOS to real TOS)"
                    ic+=1; break;
                case 0x8B:
                    proc.instructions[ic] = "INN              Set membership (TOS-1 in set TOS)"
                    ic+=1; break;
                case 0x8C:
                    proc.instructions[ic] = "INT              Set intersection (TOS AND TOS-1)"
                    ic+=1; break;
                case 0x8D:
                    proc.instructions[ic] = "LOR              Logical OR (TOS | TOS-1)"
                    ic+=1; break;
                case 0x8E:
                    proc.instructions[ic] = "MODI             Modulo integers (TOS-1 % TOS)"
                    ic+=1; break;
                case 0x8F:
                    proc.instructions[ic] = "MPI              Multiply integers (TOS * TOS-1)"
                    ic+=1; break;
                case 0x90:
                    proc.instructions[ic] = "MPR              Multiply reals (TOS * TOS-1)"
                    ic+=1; break;
                case 0x91:
                    proc.instructions[ic] = "NGI              Negate integer"
                    ic+=1; break;
                case 0x92:
                    proc.instructions[ic] = "NGR              Negate real"
                    ic+=1; break;
                case 0x93:
                    proc.instructions[ic] = "LNOT             Logical NOT (~TOS)"
                    ic+=1; break;
                case 0x94:
                    proc.instructions[ic] = "SRS              Subrange set [TOS-1..TOS]"
                    ic+=1; break;
                case 0x95:
                    proc.instructions[ic] = "SBI              Subtract integers (TOS-1 - TOS)"
                    ic+=1; break;
                case 0x96:
                    proc.instructions[ic] = "SBR              Subtract reals (TOS-1 - TOS)"
                    ic+=1; break;
                case 0x97:
                    proc.instructions[ic] = "SGS              Build singleton set [TOS]"
                    ic+=1; break;
                case 0x98:
                    proc.instructions[ic] = "SQI              Square integer (TOS * TOS)"
                    ic+=1; break;
                case 0x99:
                    proc.instructions[ic] = "SQR              Square real (TOS * TOS)"
                    ic+=1; break;
                case 0x9A:
                    proc.instructions[ic] = "STO              Store indirect (TOS into TOS-1)"
                    ic+=1; break;
                case 0x9B:
                    proc.instructions[ic] = "IXS              Index string array (check 1<=TOS<=len of str TOS-1)"
                    ic+=1; break;
                case 0x9C:
                    proc.instructions[ic] = "UNI              Set union (TOS OR TOS-1)"
                    ic+=1; break;
                case 0x9D:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    proc.instructions[ic] = String(format:"LDE  %02x %04x      Load extended word (word offset %d in data seg %d)",inCode[ic+1],val, val,inCode[ic+1])
                    ic+=(2+inc)
                    break;
                case 0x9E:
                    proc.instructions[ic] = String(format:"CSP  %02x          Call standard procedure ", inCode[ic+1]) + (cspNames[Int(inCode[ic+1])] ?? "\(inCode[ic+1])")
                    ic+=2; break;
                case 0x9F:
                    proc.instructions[ic] = "LDCN             Load constant NIL"
                    ic+=1; break;
                case 0xA0:
                    proc.instructions[ic] = String(format:"ADJ  %02x          Adjust set to %d words", inCode[ic+1], inCode[ic+1])
                    ic+=2; break;
                case 0xA1:
                    var dest: Int = 0
                    let offset = Int(inCode[ic+1])
                    if offset > 0x7f {
                        let jte = addr + offset - 256
                        dest = jte - readWord(data: inCode, index: jte)// find entry in jump table
                    } else {
                        dest = ic + offset + 2
                    }
                    proc.entryPoints.insert(dest)
                    proc.instructions[ic] = String(format:"FJP  $%04x       Jump if TOS false", dest)
                    ic+=2; break;
                case 0xA2:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    proc.instructions[ic] = String(format:"INC  %04x          Inc field ptr (TOS+%d)", val, val)
                    ic+=(1+inc); break;
                case 0xA3:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    proc.instructions[ic] = String(format:"IND  %04x          Static index and load word (TOS+%d)", val, val)
                    ic+=(1+inc); break;
                case 0xA4:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    proc.instructions[ic] = String(format:"IXA  %04x          Index array (TOS-1 + TOS * %d)", val, val)
                    ic+=(1+inc); break;
                case 0xA5:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    proc.instructions[ic] = String(format:"LAO  %04x          Load global BASE%d", val, val)
                    baseLocs.insert(val)
                    ic+=(1+inc); break;
                case 0xA6:
                    var s = String(format:"LSA  %02x          Load string address:", inCode[ic+1]) +
                    " '"
                    if inCode[ic+1] > 0 {
                        for i in 1...inCode[ic+1] {
                            s += String(format:"%c", inCode[ic+1+Int(i)])
                        }
                    }
                    s += "'"
                    proc.instructions[ic] = s
                    ic+=2 + Int(inCode[ic+1])
                    break;
                case 0xA7:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    proc.instructions[ic] = String(format:"LAE  %02x %04x      Load extended address (address offset %d in data seg %d)",inCode[ic+1],val,val,inCode[ic+1])
                    ic+=(2+inc)
                    break;
                case 0xA8:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    proc.instructions[ic] = String(format:"MOV  %04x          Move %d words (TOS to TOS-1)", val, val)
                    ic+=(1+inc); break;
                case 0xA9:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    proc.instructions[ic] = String(format:"LDO  %04x          Load global word BASE%d", val,val)
                    baseLocs.insert(val)
                    ic+=(1+inc); break;
                case 0xAA:
                    proc.instructions[ic] = String(format:"SAS  %02x          String assign (TOS to TOS-1, %d chars)", inCode[ic+1], inCode[ic+1])
                    ic+=2; break;
                case 0xAB:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    proc.instructions[ic] = String(format:"SRO  %04x          Store global word BASE%d", val, val)
                    baseLocs.insert(val)
                    ic+=(1+inc); break;
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
                    proc.entryPoints.insert(dest)
                    var s = String(format:"XJP  %04x %04x %04x Case jump\n", first, last, dest)
                    ic += 2
                    var c1 = 0
                    for c in first...last {
                        if c1 == 0 {
                            s += String(repeating: " ", count: 8)
                        }
                        s += String(format:"   %04x -> %04x", c, ic - readWord(data:inCode, index: ic))
                        ic += 2
                        c1 += 1
                        if c1 == 4 {
                            c1 = 0
                            s += "\n"
                        }
                    }
                    if c1 != 0 { s += "\n" }
                    s += String(repeating: " ", count: 7)
                    s += String(format:"default -> %04x", dest)
                    proc.instructions[ic] = s
                case 0xad:
                    proc.instructions[ic] = String(format:"RNP  %02x          Return from nonbase procedure", inCode[ic+1])
                    if inCode[ic+1] > 0 { isFunc = true } else { isFunc = false }
                    ic+=2
                    done = true
                    break
                case 0xAE:
                    var s = String(format:"CIP  %02x          Call intermediate procedure %d ", inCode[ic+1], inCode[ic+1])
                    s += "\(seg.name)."
                    if let n = names[Int(seg.segNum)] { s += "\(n.procNames[Int(inCode[ic+1])] ?? "\(inCode[ic+1])")" } else { s += "\(inCode[ic+1])" }
                    proc.instructions[ic] = s
                    ic+=2; break;
                case 0xAF:
                    let (comp, inc) = decodeComparator(data: inCode, index: ic+1)
                    proc.instructions[ic] = "EQL" + comp + "TOS-1 = TOS"
                    ic+=inc+1; break;
                case 0xB0:
                    let (comp, inc) = decodeComparator(data: inCode, index: ic+1)
                    proc.instructions[ic] = "GEQ" + comp + "TOS-1 >= TOS"
                    ic+=inc+1; break;
                case 0xB1:
                    let (comp, inc) = decodeComparator(data: inCode, index: ic+1)
                    proc.instructions[ic] = "GRT" + comp + "TOS-1 > TOS"
                    ic+=inc+1; break;
                case 0xB2:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    let refLexLevel = proc.lexicalLevel - Int(inCode[ic+1])
                    var label = refLexLevel < 0 ? "G\(val)" : "L\(refLexLevel)\(val)"
                    if refLexLevel < 0 {
                        procGlobalLocs.insert(Int(val))
                    }
                    if refLexLevel < 0 && globalLocations.contains(where: { $0.key == Int(val) }) {
                        label += (" (" + (globalLocations[Int(val)] ?? "") + ")")
                    }
                    proc.instructions[ic] = String(format:"LDA  %02x %04x     Load addr \(label)",inCode[ic+1],val)
                    ic+=(2+inc)
                    break;
                case 0xB3:
                    let count = Int(inCode[ic+1])
                    var s = String(format:"LDC  %02x          Load multiple-word constant", inCode[ic+1]) +
                    "\n                         "
                    ic += 2
                    if ic % 2 != 0 { ic += 1 } // word aligned data
                    for i in 0..<count {
                        s += String(format:"%04x", readWord(data: inCode,index: ic+i*2))
                    }
                    proc.instructions[ic] = s
                    ic += count*2; break;
                case 0xB4:
                    let (comp, inc) = decodeComparator(data: inCode, index: ic+1)
                    proc.instructions[ic] = "LEQ" + comp + "TOS-1 <= TOS"
                    ic+=inc+1; break;
                case 0xB5:
                    let (comp, inc) = decodeComparator(data: inCode, index: ic+1)
                    proc.instructions[ic] = "LES" + comp + "TOS-1 < TOS"
                    ic+=inc+1; break;
                case 0xB6:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    let refLexLevel = proc.lexicalLevel - Int(inCode[ic+1])
                    var label = refLexLevel < 0 ? "G\(val)" : "L\(refLexLevel)_\(val)"
                    if refLexLevel < 0 {
                        procGlobalLocs.insert(Int(val))
                    }
                    if refLexLevel < 0 && globalLocations.contains(where: { $0.key == Int(val) }) {
                        label += (" (" + (globalLocations[Int(val)] ?? "") + ")")
                    }
                    proc.instructions[ic] = String(format:"LOD  %02x %04x     Load word at \(label)",inCode[ic+1],val)
                    ic+=(2+inc)
                    break;
                case 0xB7:
                    let (comp, inc) = decodeComparator(data: inCode, index: ic+1)
                    proc.instructions[ic] = "NEQ" + comp + "TOS-1 <> TOS"
                    ic+=inc+1; break;
                case 0xB8:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    let refLexLevel = proc.lexicalLevel - Int(inCode[ic+1])
                    var label = refLexLevel < 0 ? "G\(val)" : "L\(refLexLevel)\(val)"
                    if refLexLevel < 0 {
                        procGlobalLocs.insert(Int(val))
                    }
                    if refLexLevel < 0 && globalLocations.contains(where: { $0.key == Int(val) }) {
                        label += (" (" + (globalLocations[Int(val)] ?? "") + ")")
                    }
                    proc.instructions[ic] = String(format:"STR  %02x %04x     Store TOS to \(label)",inCode[ic+1],val)
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
                    proc.entryPoints.insert(dest)
                    proc.instructions[ic] = String(format:"UJP  $%04x       Unconditional jump", dest)
                    ic+=2; break;
                case 0xBA:
                    proc.instructions[ic] = "LDP              Load packed field (TOS)"
                    ic+=1; break;
                case 0xBB:
                    proc.instructions[ic] = "STP              Store packed field (TOS into TOS-1)"
                    ic+=1; break;
                case 0xBC:
                    proc.instructions[ic] = String(format:"LDM  %02x          Load %d words from (TOS)", inCode[ic+1], inCode[ic+1])
                    ic+=2; break;
                case 0xBD:
                    proc.instructions[ic] = String(format:"STM  %02x          Store %d words at TOS to TOS-1", inCode[ic+1], inCode[ic+1])
                    ic+=2; break;
                case 0xBE:
                    proc.instructions[ic] = "LDB              Load byte at byte ptr TOS-1 + TOS"
                    ic+=1; break;
                case 0xBF:
                    proc.instructions[ic] = "STB              Store byte at TOS to byte ptr TOS-2 + TOS-1"
                    ic+=1; break;
                case 0xC0:
                    proc.instructions[ic] = String(format:"IXP  %02x %02x       Index packed array TOS-1[TOS], %d elts/word, %d field width", inCode[ic+1], inCode[ic+2], inCode[ic+1], inCode[ic+2])
                    ic+=3; break;
                case 0xc1:
                    proc.instructions[ic] = String(format:"RBP  %02x          Return from base procedure", inCode[ic+1])
                    if inCode[ic+1] > 0 { isFunc = true } else { isFunc = false }
                    ic+=2
                    done = true
                    break
                case 0xC2:
                    var s = String(format:"CBP  %02x          Call base procedure ", inCode[ic+1], inCode[ic+1])
                    s += "\(seg.name)."
                    if let n = names[Int(seg.segNum)] { s += "\(n.procNames[Int(inCode[ic+1])] ?? "\(inCode[ic+1])")" } else { s += "\(inCode[ic+1])" }
                    proc.instructions[ic] = s
                    ic+=2; break;
                case 0xC3:
                    proc.instructions[ic] = "EQUI             Integer TOS-1 = TOS"
                    ic+=1; break;
                case 0xC4:
                    proc.instructions[ic] = "GEQI             Integer TOS-1 >= TOS"
                    ic+=1; break;
                case 0xC5:
                    proc.instructions[ic] = "GRTI             Integer TOS-1 > TOS"
                    ic+=1; break;
                case 0xC6:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    proc.instructions[ic] = String(format:"LLA  %04x        Load local address MP%d",val, val)
                    localLocs.insert(val)
                    ic+=(1+inc)
                    break;
                case 0xC7:
                    let val = readWord(data: inCode, index: ic+1)
                    proc.instructions[ic] = String(format:"LDCI %04x        Load word %d",val,val)
                    ic+=3; break;
                case 0xC8:
                    proc.instructions[ic] = "LEQI             Integer TOS-1 <= TOS"
                    ic+=1; break;
                case 0xC9:
                    proc.instructions[ic] = "LESI             Integer TOS-1 < TOS"
                    ic+=1; break;
                case 0xCA:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    proc.instructions[ic] = String(format:"LDL  %04x        Load local word MP%d",val,val)
                    localLocs.insert(val)
                    ic+=(1+inc)
                    break;
                case 0xCB:
                    proc.instructions[ic] = "NEQI             Integer TOS-1 <> TOS"
                    ic+=1; break;
                case 0xCC:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    proc.instructions[ic] = String(format:"STL  %04x        Store TOS into MP%d",val,val)
                    localLocs.insert(val)
                    ic+=(1+inc)
                    break;
                case 0xCD:
                    var s = String(format:"CXP  %02x %02x       Call external procedure ", inCode[ic+1], inCode[ic+2])
                    s += "\(segDict.segTable[Int(inCode[ic+1])]?.name ?? "unknown!")."
                    if let n = names[Int(inCode[ic+1])] { s += "\(n.procNames[Int(inCode[ic+2])] ?? "\(inCode[ic+2])")" } else { s += "\(inCode[ic+2])" }
                    proc.instructions[ic] = s
                    ic+=3; break;
                case 0xCE:
                    var s = String(format:"CLP  %02x          Call local procedure ",inCode[ic+1])
                    s += "\(seg.name)."
                    if let n = names[Int(seg.segNum)] { s += "\(n.procNames[Int(inCode[ic+1])] ?? "\(inCode[ic+1])")" } else { s += "\(inCode[ic+1])" }
                    proc.instructions[ic] = s
                    ic+=2; break;
                case 0xCF:
                    var s = String(format:"CGP  %02x          Call global procedure ", inCode[ic+1])
                    s += "\(seg.name)."
                    if let n = names[Int(seg.segNum)] { s += "\(n.procNames[Int(inCode[ic+1])] ?? "\(inCode[ic+1])")" } else { s += "\(inCode[ic+1])" }
                    proc.instructions[ic] = s
                    ic+=2; break;
                case 0xD0:
                    let count = Int(inCode[ic+1])
                    var s = String(format:"LPA  %02x          Load packed array", inCode[ic+1])
                    s += "\n                         "
                    for i in 1...count {
                        s += String(format:"%02x", inCode[ic+1+i])
                    }
                    proc.instructions[ic] = s
                    ic+=(2+count); break;
                case 0xD1:
                    let (val, inc) = readBig(data: inCode, index: ic+2)
                    proc.instructions[ic] = String(format:"STE  %02x %04x      Store extended word (TOS into word offset %d in data seg %d)",inCode[ic+1],val,val,inCode[ic+1])
                    ic+=(2+inc)
                    break;
                case 0xD2: 
                    proc.instructions[ic] = "NOP              No operation"
                    ic+=1;break
                case 0xD3:
                    proc.instructions[ic] = String(format:"---  %02x", inCode[ic+1])
                    ic+=2; break;
                case 0xD4:
                    proc.instructions[ic] = String(format:"---  %02x", inCode[ic+1])
                    ic+=2; break;
                case 0xd5:
                    let (val, inc) = readBig(data: inCode, index: ic+1)
                    proc.instructions[ic] = String(format:"BPT  %04x      Breakpoint",val)
                    ic+=(1+inc)
                    break;
                case 0xd6:
                    proc.instructions[ic] = "XIT              Exit the operating system"
                    ic+=1
                    done=true
                    isFunc = false // AFAIK only the PASCALSYSTEM.PASCALSYSTEM procedure ever calls this
                    break
                case 0xd7:
                    proc.instructions[ic] = "NOP              No operation"
                    ic+=1;break
                case 0xd8...0xe7:
                    proc.instructions[ic] = String(format:"SLDL %02x          Short load local MP%d", inCode[ic]-0xd7, inCode[ic]-0xd7)
                    localLocs.insert(Int(inCode[ic])-0xd7)
                    ic+=1; break;
                case 0xe8...0xf7:
                    proc.instructions[ic] = String(format:"SLDO %02x          Short load global BASE%d", inCode[ic]-0xe7, inCode[ic]-0xe7)
                    baseLocs.insert(Int(inCode[ic])-0xe7)
                    ic+=1; break
                case 0xf8...0xff:
                    proc.instructions[ic] = String(format:"SIND %02x          Short index load *TOS+%d", inCode[ic]-0xf8, inCode[ic]-0xf8)
                    ic+=1; break;
                default:
                    proc.instructions[ic] = String(format:"%02x", inCode[ic])
                    ic+=1; break
                }
            }
            
            var actualParams = proc.parameterSize // how many words of params, minus function
            
            if isFunc {
                procType += "FUNCTION \(seg.name)."
                actualParams -= 2 // two words of param are the function return
            } else {
                procType += "PROCEDURE \(seg.name)."
            }
            
            if proc.procedureNumber == 1 {
                procType += "\(seg.name)"
            } else {
                if let n = names[Int(seg.segNum)], let pn = n.procNames[Int(proc.procedureNumber)] { procType += pn } else {
                    if isFunc {
                        procType += "FUNC\(proc.procedureNumber)"
                    } else {
                        procType += "PROC\(proc.procedureNumber)"
                    }
                }

            }
            
            if actualParams > 0 {
                procType += "("
                for parmnum in 1...actualParams {
                    if parmnum > 1 { procType += "; "}
                    procType += "PARAM\(parmnum)"
                }
                procType += ")"
            }
            if isFunc { procType += ": RETVAL" }
            
            proc.header = procType
            
//            for g in procGlobalLocs.sorted() {
//                print(prefix + "  G\(g)")
//            }
            if proc.lexicalLevel == 0 {
                var done = (actualParams == 0)
                for ll in baseLocs.sorted() {
                    if isFunc {
                        if ll == 1 || ll == 2 {
                            proc.variables.append("  BASE\(ll)=RETVAL\(ll)")
                        } else {
                            if !done {
                                let paramNum = proc.parameterSize - ll + 1
                                proc.variables.append("  BASE\(ll)=PARAM\(paramNum)")
                                if paramNum <= 1 {
                                    done = true
                                }
                            } else {
                                proc.variables.append("  BASE\(ll)")
                            }
                        }
                    } else {
                        if !done {
                            let paramNum = proc.parameterSize - ll + 1
                            proc.variables.append("  BASE\(ll)=PARAM\(paramNum)")
                            if paramNum <= 1 {
                                done = true
                            }
                        } else {
                            proc.variables.append("  BASE\(ll)")
                        }
                    }
                }
            } else if proc.lexicalLevel >= 1 {
                for bl in baseLocs.sorted() { proc.variables.append("  BASE\(bl)") }
                var done = (actualParams == 0)
                for ll in localLocs.sorted() {
                    if isFunc {
                        if ll == 1 || ll == 2 {
                            proc.variables.append("  MP\(ll)=RETVAL\(ll)")
                        } else {
                            if !done {
                                let paramNum = proc.parameterSize - ll + 1
                                proc.variables.append("  MP\(ll)=PARAM\(paramNum)")
                                if paramNum <= 1 {
                                    done = true
                                }
                            } else {
                                proc.variables.append("  MP\(ll)")
                            }
                        }
                    } else {
                        if !done {
                            let paramNum = proc.parameterSize - ll + 1
                            proc.variables.append("  MP\(ll)=PARAM\(paramNum)")
                            if paramNum <= 1 {
                                done = true
                            }
                        } else {
                            proc.variables.append("  MP\(ll)")
                        }
                    }
                }
            } else if proc.lexicalLevel == -1 { // only one of these and it's a procedure
                var done = (actualParams == 0)
                for ll in localLocs.sorted() {
                    if !done {
                        let paramNum = proc.parameterSize - ll + 1
                        proc.variables.append("  G\(ll)=PARAM\(paramNum)")
                        if paramNum <= 1 {
                            done = true
                        }
                    } else {
                        proc.variables.append("  G\(ll)")
                    }
                }
            }
            codeSeg.procedures.append(proc)
//            print(prefix + "BEGIN")



//            print(prefix + "END")
//            print(prefix)
            segGlobalLocs.formUnion(procGlobalLocs)
        }
        allCodeSegs[Int(seg.segNum)] = codeSeg
        
//        print("Segment globals:")
//        for g in segGlobalLocs.sorted() { print("G\(g)") }
//        print()
        allGlobalLocs.formUnion(segGlobalLocs)
    }
    print("# ", fileURL.lastPathComponent,"\n")

    // for the moment, print it out to validate it.
    print(segDict)
    
    print("## Globals\n")
    for g in allGlobalLocs.sorted() { print("G\(g)") }
    print()
    
    for (s,v) in allCodeSegs.sorted(by: {$0.key < $1.key}) {
        print("## Segment \(segDict.segTable[s]?.name ?? "Unknown") (\(s))\n")
        if v.procedures.count > 0 {
            for p in v.procedures {
                print("### " + p.header + " (* P=\(p.procedureNumber) LL=\(p.lexicalLevel) *)")
                for i in p.variables { print(i) }
                print("BEGIN")
                for i in p.instructions.sorted(by: {$0.key < $1.key}) {
                    if p.entryPoints.contains(i.key) { print("->", terminator: " ") }
                    else { print("  ", terminator: " ") }
                    print(String(format:"%04x:",i.key), terminator: " ")
                    print(i.value)
                }
                print("END")
                print()
            }
        }
    }
} catch {
    print("Error reading binary file: \(error.localizedDescription)")
}

