#  SYSTEM.PASCAL-02-0A.bin 

## Segment Table

| slot |segNum | name     | block | length | kind   | textAddr | mType | version |
|-----:|------:|----------|------:|-------:|--------|---------:|-------|--------:|
| 0    | 0     | PASCALSY | 0001  | 3212   | linked | 0000     | 0     | 0       |
| 15   | 15    |          | 0008  | 312    | linked | 0000     | 0     | 0       |
| 1    | 1     | USERPROG | 0009  | 20     | linked | 0000     | 2     | 2       |
| 2    | 2     | SYSIO    | 000A  | 3600   | linked | 0000     | 2     | 2       |
| 3    | 3     | PRINTERR | 0012  | 20     | linked | 0000     | 2     | 2       |
| 4    | 4     | INITIALI | 0013  | 1342   | linked | 0000     | 2     | 2       |
| 5    | 5     | GETCMD   | 0016  | 1230   | linked | 0000     | 2     | 2       |
| 6    | 6     | FIOPRIMS | 0019  | 634    | linked | 0000     | 2     | 2       |

intrinsics: []

comment: 

## Globals
G1   SYSCOM:^SYSCOMREC
G2   GFILES[0]=INPUT:FIBP
G3   GFILES[1]=OUTPUT:FIBP
G4   GFILES[2]=SYSTERM:FIBP
G5   EMPTYHEAP:^INTEGER
G6   SWAPFIB
G7   SYSTERMFIB
G8   OUTPUTFIB
G9   INPUTFIB
G10  DKVID
G14  SYVID:STRING
G18  THEDATE
G19  STATE:INTEGER
G20-G24  IPOT:ARRAY[0..4] OF INTEGER
G25  FILLER
G31  UNITABLE:ARRAY[0..12] OF RECORD UVID:VID, UISBLKD:BOOLEAN, UEOVBLK:INTEGER END 
G109 DATASEGS:PACKED ARRAY[0..31] OF BOOLEAN {true if this seg has no code(??)}
G111 NONPRINTCHARS:SET [0..255]
G127 GLOBALTITLE:STRING[23]
G139 :STRING[80]
G180 FILEHANDLEROVERLAY:BOOLEAN {true if bit 0 of reserved 'year' field in vol record is set}
G181 JUSTBOOTED
G182 :FIB
G472 SINGLEDRIVESYSTEM:BOOLEAN {true if bit 1 of reserved 'year' field in vol record is set}

## PASCALSY (0) segment

Processing segment 0 named 'PASCALSY' containing 37 procedures/functions...
{
  PASCALSY procedures:
  PROCEDURE PASCALSY #1
  PROCEDURE EXECERROR(ERRNUM:INTEGER) #2
  PROCEDURE FINIT(VAR F:FIB; WINDOW:WINDOWP; RECWORDS:INTEGER) #3
  PROCEDURE FRESET(VAR F:FIB) #4
  PROCEDURE FOPEN(VAR F:FIB; VAR FTITLE:STRING; FOPENOLD:BOOLEAN; JUNK:FIBP) #5
  PROCEDURE FCLOSE(VAR F:FIB; FTYPE:CLOSETYPE) #6
  PROCEDURE FGET(VAR F:FIB) #7
  PROCEDURE FPUT(VAR F:FIB) #8
  PROCEDURE XSEEK #9
  FUNCTION FEOF(VAR F:FIB): BOOLEAN #10
  FUNCTION FEOLN(VAR F:FIB): BOOLEAN #11
  PROCEDURE FREADINT(VAR F:FIB; VAR I:INTEGER) #12
  PROCEDURE FWRITEINT(VAR F:FIB; VAR I:INTEGER;VAR RLENG:INTEGER) #13
  PROCEDURE XREADREAL #14
  PROCEDURE XWRITEREAL #15
  PROCEDURE FREADCHAR(VAR F:FIB; VAR CH:CHAR) #16
  PROCEDURE FWRITECHAR(VAR F:FIB; CH:CHAR; RLENG:INTEGER) #17
  PROCEDURE FREADSTRING(VAR F:FIB; VAR S:STRING; SLENG:INTEGER) #18
  PROCEDURE FWRITESTRING(VAR F:FIB; VAR S:STRING; RLENG:INTEGER) #19
  PROCEDURE FWRITEBYTES(VAR F:FIB; VAR A:WINDOW; RLENG:INTEGER; ALENG:INTEGER) #20
  PROCEDURE FREADLN(VAR F:FIB) #21
  PROCEDURE FWRITELN(VAR F:FIB) #22
  PROCEDURE SCONCAT(VAR DEST:STRING;SRC: STRING; DESTLENG: INTEGER) #23
  PROCEDURE SINSERT(VAR SRC:STRING;DEST:STRING;DESTLENG:INTEGER;INSINX:INTEGER) #24
  PROCEDURE SCOPY(VAR SRC:STRING;DEST:STRING;SRCINX:INTEGER;COPYLENG:INTEGER) #25
  PROCEDURE SDELETE(VAR DEST:STRING;DELINX:INTEGER;DELLENG:INTEGER) #26
  FUNCTION SPOS(VAR TARGET:STRING;SRC: STRING):INTEGER #27
  FUNCTION FBLOCKIO(VAR F:FIB;VAR A:WINDOW;I:INTEGER;NBLOCKS,RBLOCK:INTEGER;DOREAD:BOOLEAN):INTEGER #28
  PROCEDURE FGOTOXY(X,Y:INTEGER) #29
  PROCEDURE HOMECURSOR #30
  PROCEDURE CLEARSCREEN #31
  PROCEDURE COMMAND #32
  PROCEDURE PUTPREFIXED(WHICH:INTEGER;COMMANDCHAR:CHAR) #33
  FUNCTION CHECKDEL(CH:CHAR; SINX:INTEGER; PARAM3:STRING): BOOLEAN #34
  FUNCTION CANTSTRETCH(VAR F:FIB):BOOLEAN #35
    PROCEDURE BLOCKIOREADWRITE(UNIT:UNITNUM;A:WINDOW;I,NBLOCKS,RBLOCK:INTEGER;DOREAD:BOOLEAN)
    PROCEDURE PROC37
}

### PROCEDURE PASCALSY.PASCALSY (1)
BEGIN
  GOTO 1
-> 0000: UJP  $001d       Unconditional jump
  2:
  MP5 := NIL
-> 0002: LDCN             Load constant NIL
   0003: STL  0005        Store TOS into MP5
  UNITCLEAR(1)
   0005: SLDC 01          Short load constant 1
   0006: CSP  26          Call standard procedure 38 UNITCLEAR
  INITIALIZE
   0008: CXP  04 01       Call external procedure 1 in seg 4 INITIALIZE
  COMMAND
-> 000b: CBP  20          Call base procedure 32  (COMMAND)
   000d: SLDL 05          Short load local MP5
   000e: LDCN             Load constant NIL
   000f: NEQI             Integer TOS-1 <> TOS
   0010: FJP  $0015       Jump if TOS false
   0012: CXP  04 01       Call external procedure 1 in seg 4 INITIALIZE
-> 0015: SLDC 00          Short load constant 0
   0016: FJP  $000b       Jump if TOS false
  UNLOADSEGMENT(6)
-> 0018: SLDC 06          Short load constant 6
   0019: CSP  16          Call standard procedure 22 UNLOADSEGMENT
   001b: UJP  $0022       Unconditional jump
  1:
  LOADSEGMENT(6)
-> 001d: SLDC 06          Short load constant 6
   001e: CSP  15          Call standard procedure 21 LOADSEGMENT
  GOTO 2
   0020: UJP  $0002       Unconditional jump
-> 0022: XIT              Exit the operating system
END

LL 0 entry 0032 exit 00ad parms=1 words data=0 words
### PROCEDURE PASCALSY.EXECERROR(ERRNUM:INTEGER) (2)
  BASE1=ERRNUM:INTEGER
  {
   01 Unable to load specified program
   02 SPecified program file not available
   03 Specified program file is not code file
   04 Unable to read block zero of specified file
   05 Specified code file is un-linked
   06 Conflict between user and intrinsic segments
   07 UNASSIGNED ERROR CODE
   08 Required intrinsics not available
   09 System internal inconsistency
   10 Can't load required intrinsics/Can't open library file
   11 Specified code file must be run under the 128K system
   12 Original disk not in boot drive
  }
BEGIN
  FGOTOXY(3,10)
-> 0032: SLDC 03          Short load constant 3
   0033: SLDC 0a          Short load constant 10
   0034: CXP  00 1d       Call external procedure 29 in seg 0 FGOTOXY
  FWRITESTRING(OUTPUT,'SYSTEM FAILURE NUMBER ',0
   0037: LOD  01 0003     Load word at G3 (OUTPUT)
   003a: NOP              No operation
   003b: LSA  16          Load string address: 'SYSTEM FAILURE NUMBER '
   0053: SLDC 00          Short load constant 0
   0054: CXP  00 13       Call external procedure 19 in seg 0 FWRITESTRING
  FWRITEINT(OUTPUT,ERRNUM,0)
   0057: LOD  01 0003     Load word at G3 (OUTPUT)
   005a: SLDO 01          Short load global BASE1
   005b: SLDC 00          Short load constant 0
   005c: CXP  00 0d       Call external procedure 13 in seg 0 FWRITEINT
  FWRITESTRING(OUTPUT,'. PLEASE REFER',0)
   005f: LOD  01 0003     Load word at G3 (OUTPUT)
   0062: NOP              No operation
   0063: LSA  0e          Load string address: '. PLEASE REFER'
   0073: SLDC 00          Short load constant 0
   0074: CXP  00 13       Call external procedure 19 in seg 0 FWRITESTRING
  FGOTOXY(3,11)
   0077: SLDC 03          Short load constant 3
   0078: SLDC 0b          Short load constant 11
   0079: CXP  00 1d       Call external procedure 29 in seg 0 FGOTOXY
  FWRITESTRING(OUTPUT,'TO PRODUCT MANUAL FOR EXPLANATION.',0)
   007c: LOD  01 0003     Load word at G3 (OUTPUT)
   007f: LSA  22          Load string address: 'TO PRODUCT MANUAL FOR EXPLANATION.'
   00a3: NOP              No operation
   00a4: SLDC 00          Short load constant 0
   00a5: CXP  00 13       Call external procedure 19 in seg 0 FWRITESTRING
  REPEAT
-> 00a8: SLDC 01          Short load constant 1
   00a9: FJP  $00ad       Jump if TOS false
   00ab: UJP  $00a8       Unconditional jump
  UNTIL FALSE
-> 00ad: RBP  00          Return from base procedure
END

LL 0 entry 00bc exit 00c2 parms=3 words data=0 words

### PROCEDURE PASCALSY.FINIT(VAR F:FIB; WINDOW:WINDOWP; RECWORDS:INTEGER) (3)
  BASE1=RECWORDS:INTEGER
  BASE2=WINDOW:WINDOWP
  BASE3=F:FIB
BEGIN
  SYSIO.FINIT(F,WINDOW,RECWORDS)
-> 00bc: SLDO 03          Short load global BASE3 (F)
   00bd: SLDO 02          Short load global BASE2 (WINDOW)
   00be: SLDO 01          Short load global BASE1 (RECWORDS)
   00bf: CXP  02 02       Call external procedure 2 in seg 2 (SYSIO) (FINIT)
-> 00c2: RBP  00          Return from base procedure
END

LL 0 entry 00ce exit 00d2 parms=1 words data=0 words
### PROCEDURE PASCALSY.FRESET(VAR F:FIB) (4)
  BASE1=F:FIB
BEGIN
  SYSIO.FRESET(F)
-> 00ce: SLDO 01          Short load global BASE1
   00cf: CXP  02 03       Call external procedure 3 in seg 2 (SYSIO) (FRESET)
-> 00d2: RBP  00          Return from base procedure
END

LL 0 entry 00de exit 00e5 parms=4 words data=0 words
### PROCEDURE PASCALSY.FOPEN(VAR F:FIB; VAR FTITLE:STRING; FOPENOLD:BOOLEAN; JUNK:FIBP) (5)
  BASE1=JUNK:FIBP
  BASE2=FOPENOLD:BOOLEAN
  BASE3=FTITLE:STRING
  BASE4=F:FIB
BEGIN
  SYSIO.FOPEN(F,FTITLE,FOPENOLD,JUNK)
-> 00de: SLDO 04          Short load global BASE4 (F)
   00df: SLDO 03          Short load global BASE3 (FTITLE)
   00e0: SLDO 02          Short load global BASE2 (FOPENOLD)
   00e1: SLDO 01          Short load global BASE1 (JUNK)
   00e2: CXP  02 04       Call external procedure 4 in seg 2 (SYSIO) (FOPEN)
-> 00e5: RBP  00          Return from base procedure
END

LL 0 entry 00f2 exit 00f7 parms=2 words data=0 words
### PROCEDURE PASCALSY.FCLOSE(VAR F:FIB; FTYPE:CLOSETYPE) (6)
  BASE1=FTYPE:CLOSETYPE
  BASE2=F:FIB
BEGIN
  SYSIO.FCLOSE(F,FTYPE)
-> 00f2: SLDO 02          Short load global BASE2 (F)
   00f3: SLDO 01          Short load global BASE1 (FTYPE)
   00f4: CXP  02 05       Call external procedure 5 in seg 2 (SYSIO) (FCLOSE)
-> 00f7: RBP  00          Return from base procedure
END

LL 0 entry 0104 exit 0108 parms=1 words data=0 words
### PROCEDURE PASCALSY.FGET(VAR F:FIB) (7)
  BASE1=F:FIB
BEGIN
  FIOPRIMS.FGET(F)
-> 0104: SLDO 01          Short load global BASE1 (F)
   0105: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
-> 0108: RBP  00          Return from base procedure
END

LL 0 entry 0114 exit 027d parms=1 words data=7 words
### PROCEDURE PASCALSY.FPUT(VAR F:FIB) (8)
  BASE1=F:FIB
  BASE2
  BASE3
  BASE4
  BASE5
  BASE6
  BASE7:F_C:FIB
  BASE8
BEGIN
  SYSCOM.IORESULT := 0 { 'No error' }
-> 0114: LOD  01 0001     Load word at G1 (SYSCOM)
   0117: SLDC 00          Short load constant 0
   0118: STO              Store indirect (TOS into TOS-1)

   0119: SLDO 01          Short load global BASE1 (F)
   011a: SRO  07          Store global word BASE7 (F_C)
   011c: SLDO 07          Short load global BASE7 (F_C)
   011d: SIND 05          Short index load *TOS+5
   011e: FJP  $026e       Jump if TOS false
   0120: SLDO 07          Short load global BASE7 (F_C)
   0121: IND  1d          Static index and load word (TOS+29)
   0123: FJP  $0259       Jump if TOS false
   0125: SLDO 07          Short load global BASE7 (F_C)
   0126: INCP 10          Inc field ptr (TOS+16)
   0128: SRO  08          Store global word BASE8
   012a: SLDO 07          Short load global BASE7 (F_C)
   012b: SIND 04          Short index load *TOS+4
   012c: SRO  05          Store global word BASE5
   012e: SLDC 00          Short load constant 0
   012f: SRO  04          Store global word BASE4
-> 0131: SLDO 08          Short load global BASE8
   0132: SIND 00          Short index load *TOS+0
   0133: SLDO 07          Short load global BASE7 (F_C)
   0134: IND  0d          Static index and load word (TOS+13)
   0136: ADI              Add integers (TOS + TOS-1)
   0137: SLDO 08          Short load global BASE8
   0138: SIND 01          Short index load *TOS+1
   0139: EQUI             Integer TOS-1 = TOS
   013a: FJP  $016d       Jump if TOS false
   013c: SLDO 07          Short load global BASE7 (F_C)
   013d: IND  1f          Static index and load word (TOS+31)
   013f: SLDO 05          Short load global BASE5
   0140: ADI              Add integers (TOS + TOS-1)
   0141: SLDO 08          Short load global BASE8
   0142: IND  0b          Static index and load word (TOS+11)
   0144: GRTI             Integer TOS-1 > TOS
   0145: FJP  $0162       Jump if TOS false
   0147: SLDO 01          Short load global BASE1 (F)
   0148: SLDC 00          Short load constant 0
   0149: SLDC 00          Short load constant 0
   014a: CBP  23          Call base procedure 35 (CANTSTRETCH)
   014c: FJP  $0157       Jump if TOS false
   SYSCOM.IORESULT := 8 { 'No room on volume' }
   014e: LOD  01 0001     Load word at G1 (SYSCOM)
   0151: SLDC 08          Short load constant 8
   0152: STO              Store indirect (TOS into TOS-1)

   0153: UJP  $0273       Unconditional jump
   0155: UJP  $0160       Unconditional jump
-> 0157: LDCI 0200        Load word 512
   015a: SLDO 07          Short load global BASE7 (F_C)
   015b: IND  1f          Static index and load word (TOS+31)
   015d: SBI              Subtract integers (TOS-1 - TOS)
   015e: SRO  03          Store global word BASE3
-> 0160: UJP  $016b       Unconditional jump
-> 0162: SLDO 08          Short load global BASE8
   0163: IND  0b          Static index and load word (TOS+11)
   0165: SLDO 07          Short load global BASE7 (F_C)
   0166: IND  1f          Static index and load word (TOS+31)
   0168: SBI              Subtract integers (TOS-1 - TOS)
   0169: SRO  03          Store global word BASE3
-> 016b: UJP  $0176       Unconditional jump
-> 016d: LDCI 0200        Load word 512
   0170: SLDO 07          Short load global BASE7 (F_C)
   0171: IND  1f          Static index and load word (TOS+31)
   0173: SBI              Subtract integers (TOS-1 - TOS)
   0174: SRO  03          Store global word BASE3
-> 0176: SLDO 05          Short load global BASE5
   0177: SRO  02          Store global word BASE2
   0179: SLDO 02          Short load global BASE2
   017a: SLDO 03          Short load global BASE3
   017b: GRTI             Integer TOS-1 > TOS
   017c: FJP  $0181       Jump if TOS false
   017e: SLDO 03          Short load global BASE3
   017f: SRO  02          Store global word BASE2
-> 0181: SLDO 02          Short load global BASE2
   0182: SLDC 00          Short load constant 0
   0183: GRTI             Integer TOS-1 > TOS
   0184: FJP  $01aa       Jump if TOS false
   0186: SLDO 07          Short load global BASE7 (F_C)
   0187: INCP 20          Inc field ptr (TOS+32)
   0189: SLDC 01          Short load constant 1
   018a: STO              Store indirect (TOS into TOS-1)
   018b: SLDO 07          Short load global BASE7 (F_C)
   018c: SIND 00          Short index load *TOS+0
   018d: SLDO 04          Short load global BASE4
   018e: SLDO 07          Short load global BASE7 (F_C)
   018f: INCP 21          Inc field ptr (TOS+33)
   0191: SLDO 07          Short load global BASE7 (F_C)
   0192: IND  1f          Static index and load word (TOS+31)
   0194: SLDO 02          Short load global BASE2
   0195: CSP  02          Call standard procedure 2 MOVL
   0197: SLDO 07          Short load global BASE7 (F_C)
   0198: INCP 1f          Inc field ptr (TOS+31)
   019a: SLDO 07          Short load global BASE7 (F_C)
   019b: IND  1f          Static index and load word (TOS+31)
   019d: SLDO 02          Short load global BASE2
   019e: ADI              Add integers (TOS + TOS-1)
   019f: STO              Store indirect (TOS into TOS-1)
   01a0: SLDO 04          Short load global BASE4
   01a1: SLDO 02          Short load global BASE2
   01a2: ADI              Add integers (TOS + TOS-1)
   01a3: SRO  04          Store global word BASE4
   01a5: SLDO 05          Short load global BASE5
   01a6: SLDO 02          Short load global BASE2
   01a7: SBI              Subtract integers (TOS-1 - TOS)
   01a8: SRO  05          Store global word BASE5
-> 01aa: SLDO 05          Short load global BASE5
   01ab: SLDC 00          Short load constant 0
   01ac: EQUI             Integer TOS-1 = TOS
   01ad: SRO  06          Store global word BASE6
   01af: SLDO 06          Short load global BASE6
   01b0: LNOT             Logical NOT (~TOS)
   01b1: FJP  $021b       Jump if TOS false
   01b3: SLDO 07          Short load global BASE7 (F_C)
   01b4: IND  20          Static index and load word (TOS+32)
   01b6: FJP  $01d6       Jump if TOS false
   01b8: SLDO 07          Short load global BASE7 (F_C)
   01b9: INCP 20          Inc field ptr (TOS+32)
   01bb: SLDC 00          Short load constant 0
   01bc: STO              Store indirect (TOS into TOS-1)
   01bd: SLDO 07          Short load global BASE7 (F_C)
   01be: INCP 0f          Inc field ptr (TOS+15)
   01c0: SLDC 01          Short load constant 1
   01c1: STO              Store indirect (TOS into TOS-1)
   01c2: SLDO 07          Short load global BASE7 (F_C)
   01c3: SIND 07          Short index load *TOS+7
   01c4: SLDO 07          Short load global BASE7 (F_C)
   01c5: INCP 21          Inc field ptr (TOS+33)
   01c7: SLDC 00          Short load constant 0
   01c8: LDCI 0200        Load word 512
   01cb: SLDO 08          Short load global BASE8
   01cc: SIND 00          Short index load *TOS+0
   01cd: SLDO 07          Short load global BASE7 (F_C)
   01ce: IND  0d          Static index and load word (TOS+13)
   01d0: ADI              Add integers (TOS + TOS-1)
   01d1: SLDC 01          Short load constant 1
   01d2: SBI              Subtract integers (TOS-1 - TOS)
   01d3: SLDC 00          Short load constant 0
   01d4: CSP  06          Call standard procedure 6 UNITWRITE
-> 01d6: CSP  22          Call standard procedure 34 IORESULT
   01d8: SLDC 00          Short load constant 0
   01d9: NEQI             Integer TOS-1 <> TOS
   01da: FJP  $01de       Jump if TOS false
   01dc: UJP  $0273       Unconditional jump
-> 01de: SLDO 07          Short load global BASE7 (F_C)
   01df: IND  0d          Static index and load word (TOS+13)
   01e1: SLDO 07          Short load global BASE7 (F_C)
   01e2: IND  0c          Static index and load word (TOS+12)
   01e4: LESI             Integer TOS-1 < TOS
   01e5: FJP  $01fb       Jump if TOS false
   01e7: SLDO 07          Short load global BASE7 (F_C)
   01e8: SIND 07          Short index load *TOS+7
   01e9: SLDO 07          Short load global BASE7 (F_C)
   01ea: INCP 21          Inc field ptr (TOS+33)
   01ec: SLDC 00          Short load constant 0
   01ed: LDCI 0200        Load word 512
   01f0: SLDO 08          Short load global BASE8
   01f1: SIND 00          Short index load *TOS+0
   01f2: SLDO 07          Short load global BASE7 (F_C)
   01f3: IND  0d          Static index and load word (TOS+13)
   01f5: ADI              Add integers (TOS + TOS-1)
   01f6: SLDC 00          Short load constant 0
   01f7: CSP  05          Call standard procedure 5 UNITREAD
   01f9: UJP  $0205       Unconditional jump
-> 01fb: SLDO 07          Short load global BASE7 (F_C)
   01fc: INCP 21          Inc field ptr (TOS+33)
   01fe: SLDC 00          Short load constant 0
   01ff: LDCI 0200        Load word 512
   0202: SLDC 00          Short load constant 0
   0203: CSP  0a          Call standard procedure 10 FLCH
-> 0205: CSP  22          Call standard procedure 34 IORESULT
   0207: SLDC 00          Short load constant 0
   0208: NEQI             Integer TOS-1 <> TOS
   0209: FJP  $020d       Jump if TOS false
   020b: UJP  $0273       Unconditional jump
-> 020d: SLDO 07          Short load global BASE7 (F_C)
   020e: INCP 0d          Inc field ptr (TOS+13)
   0210: SLDO 07          Short load global BASE7 (F_C)
   0211: IND  0d          Static index and load word (TOS+13)
   0213: SLDC 01          Short load constant 1
   0214: ADI              Add integers (TOS + TOS-1)
   0215: STO              Store indirect (TOS into TOS-1)
   0216: SLDO 07          Short load global BASE7 (F_C)
   0217: INCP 1f          Inc field ptr (TOS+31)
   0219: SLDC 00          Short load constant 0
   021a: STO              Store indirect (TOS into TOS-1)
-> 021b: SLDO 06          Short load global BASE6
   021c: FJP  $0131       Jump if TOS false
   021e: SLDO 07          Short load global BASE7 (F_C)
   021f: SIND 04          Short index load *TOS+4
   0220: SLDC 01          Short load constant 1
   0221: EQUI             Integer TOS-1 = TOS
   0222: FJP  $0257       Jump if TOS false
   0224: SLDO 07          Short load global BASE7 (F_C)
   0225: SIND 00          Short index load *TOS+0
   0226: SLDC 00          Short load constant 0
   0227: LDB              Load byte at byte ptr TOS-1 + TOS
   0228: SLDC 0d          Short load constant 13
   0229: EQUI             Integer TOS-1 = TOS
   022a: FJP  $0257       Jump if TOS false
   022c: SLDO 08          Short load global BASE8
   022d: INCP 02          Inc field ptr (TOS+2)
   022f: SLDC 04          Short load constant 4
   0230: SLDC 00          Short load constant 0
   0231: LDP              Load packed field (TOS)
   0232: SLDC 03          Short load constant 3
   0233: EQUI             Integer TOS-1 = TOS
   0234: FJP  $0257       Jump if TOS false
   0236: SLDO 07          Short load global BASE7 (F_C)
   0237: IND  1f          Static index and load word (TOS+31)
   0239: LDCI 0200        Load word 512
   023c: SLDC 7f          Short load constant 127
   023d: SBI              Subtract integers (TOS-1 - TOS)
   023e: GEQI             Integer TOS-1 >= TOS
   023f: SLDO 07          Short load global BASE7 (F_C)
   0240: IND  0d          Static index and load word (TOS+13)
   0242: LNOT             Logical NOT (~TOS)
   0243: LAND             Logical AND (TOS & TOS-1)
   0244: FJP  $0257       Jump if TOS false
   0246: SLDO 07          Short load global BASE7 (F_C)
   0247: INCP 1f          Inc field ptr (TOS+31)
   0249: LDCI 0200        Load word 512
   024c: SLDC 01          Short load constant 1
   024d: SBI              Subtract integers (TOS-1 - TOS)
   024e: STO              Store indirect (TOS into TOS-1)
   024f: SLDO 07          Short load global BASE7 (F_C)
   0250: SIND 00          Short index load *TOS+0
   0251: SLDC 00          Short load constant 0
   0252: SLDC 00          Short load constant 0
   0253: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0254: SLDO 01          Short load global BASE1 (F)
   0255: CBP  08          Call base procedure 8 (FPUT)
-> 0257: UJP  $026c       Unconditional jump
-> 0259: SLDO 07          Short load global BASE7 (F_C)
   025a: SIND 07          Short index load *TOS+7
   025b: SLDO 07          Short load global BASE7 (F_C)
   025c: SIND 00          Short index load *TOS+0
   025d: SLDC 00          Short load constant 0
   025e: SLDO 07          Short load global BASE7 (F_C)
   025f: SIND 04          Short index load *TOS+4
   0260: SLDC 00          Short load constant 0
   0261: SLDC 00          Short load constant 0
   0262: CSP  06          Call standard procedure 6 UNITWRITE
   0264: CSP  22          Call standard procedure 34 IORESULT
   0266: SLDC 00          Short load constant 0
   0267: NEQI             Integer TOS-1 <> TOS
   0268: FJP  $026c       Jump if TOS false
   026a: UJP  $0273       Unconditional jump
-> 026c: UJP  $027d       Unconditional jump
    SYSCOM.IORESULT := 13 { 'File not open' }
-> 026e: LOD  01 0001     Load word at G1 (SYSCOM)
   0271: SLDC 0d          Short load constant 13
   0272: STO              Store indirect (TOS into TOS-1)

-> 0273: SLDO 07          Short load global BASE7 (F_C)
   0274: INCP 02          Inc field ptr (TOS+2)
   0276: SLDC 01          Short load constant 1
   0277: STO              Store indirect (TOS into TOS-1)
   0278: SLDO 07          Short load global BASE7 (F_C)
   0279: INCP 01          Inc field ptr (TOS+1)
   027b: SLDC 01          Short load constant 1
   027c: STO              Store indirect (TOS into TOS-1)
-> 027d: RBP  00          Return from base procedure
END

LL 0 entry 0292 exit 0292 parms=0 words data=0 words
### PROCEDURE PASCALSY.XSEEK (9)
BEGIN
-> 0292: RBP  00          Return from base procedure
END

LL 0 entry 029e exit 02a2 parms=3 words data=0 words
### FUNCTION PASCALSY.FEOF(VAR F:FIB): BOOLEAN (10)
  BASE1=RETVAL1
  BASE3=F:FIB
BEGIN
  FEOF := F.FEOF
-> 029e: SLDO 03          Short load global BASE3 (F)
   029f: SIND 02          Short index load *TOS+2 (FEOF)
   02a0: SRO  01          Store global word BASE1
-> 02a2: RBP  01          Return from base procedure
END

LL 0 entry 02ae exit 02b2 parms=3 words data=0 words
### FUNCTION PASCALSY.FEOLN(VAR F:FIB): BOOLEAN (11)
  BASE1=RETVAL1
  BASE3=F:FIB
BEGIN
  FEOLN := F.FEOLN
-> 02ae: SLDO 03          Short load global BASE3 (F)
   02af: SIND 01          Short index load *TOS+1 (FEOLN)
   02b0: SRO  01          Store global word BASE1
-> 02b2: RBP  01          Return from base procedure
END

LL 0 entry 02be exit 03a1 parms=2 words data=46 words
### PROCEDURE PASCALSY.FREADINT(VAR F:FIB; VAR I:INTEGER) (12)
  BASE1=I:INTEGER
  BASE2=F:FIB
  BASE3
  BASE4
  BASE5
  BASE6
  BASE7
  BASE48
BEGIN
-> 02be: SLDO 02          Short load global BASE2
   02bf: SRO  30          Store global word BASE48
   02c1: LDO  30          Load global word BASE48
   02c3: SIND 07          Short index load *TOS+7
   02c4: SLDC 01          Short load constant 1
   02c5: EQUI             Integer TOS-1 = TOS
   02c6: FJP  $02cf       Jump if TOS false
   02c8: LAO  07          Load global BASE7
   02ca: SLDC 00          Short load constant 0
   02cb: SLDC 51          Short load constant 81
   02cc: SLDC 50          Short load constant 80
   02cd: CSP  0a          Call standard procedure 10 FLCH
-> 02cf: SLDO 01          Short load global BASE1
   02d0: SLDC 00          Short load constant 0
   02d1: STO              Store indirect (TOS into TOS-1)
   02d2: SLDC 00          Short load constant 0
   02d3: SRO  05          Store global word BASE5
   02d5: SLDC 00          Short load constant 0
   02d6: SRO  04          Store global word BASE4
   02d8: LDO  30          Load global word BASE48
   02da: SIND 03          Short index load *TOS+3
   02db: SLDC 01          Short load constant 1
   02dc: EQUI             Integer TOS-1 = TOS
   02dd: FJP  $02e3       Jump if TOS false
   02df: SLDO 02          Short load global BASE2
   02e0: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
-> 02e3: LDO  30          Load global word BASE48
   02e5: SIND 00          Short index load *TOS+0
   02e6: SLDC 00          Short load constant 0
   02e7: LDB              Load byte at byte ptr TOS-1 + TOS
   02e8: SLDC 20          Short load constant 32
   02e9: EQUI             Integer TOS-1 = TOS
   02ea: LDO  30          Load global word BASE48
   02ec: SIND 02          Short index load *TOS+2
   02ed: LNOT             Logical NOT (~TOS)
   02ee: LAND             Logical AND (TOS & TOS-1)
   02ef: FJP  $02f7       Jump if TOS false
   02f1: SLDO 02          Short load global BASE2
   02f2: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
   02f5: UJP  $02e3       Unconditional jump
-> 02f7: LDO  30          Load global word BASE48
   02f9: SIND 02          Short index load *TOS+2
   02fa: FJP  $02fe       Jump if TOS false
   02fc: UJP  $03a1       Unconditional jump
-> 02fe: LDO  30          Load global word BASE48
   0300: SIND 00          Short index load *TOS+0
   0301: SLDC 00          Short load constant 0
   0302: LDB              Load byte at byte ptr TOS-1 + TOS
   0303: SRO  03          Store global word BASE3
   0305: SLDO 03          Short load global BASE3
   0306: SLDC 2b          Short load constant 43
   0307: EQUI             Integer TOS-1 = TOS
   0308: SLDO 03          Short load global BASE3
   0309: SLDC 2d          Short load constant 45
   030a: EQUI             Integer TOS-1 = TOS
   030b: LOR              Logical OR (TOS | TOS-1)
   030c: FJP  $0323       Jump if TOS false
   030e: SLDC 02          Short load constant 2
   030f: SRO  06          Store global word BASE6
   0311: SLDO 03          Short load global BASE3
   0312: SLDC 2d          Short load constant 45
   0313: EQUI             Integer TOS-1 = TOS
   0314: SRO  05          Store global word BASE5
   0316: SLDO 02          Short load global BASE2
   0317: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
   031a: LDO  30          Load global word BASE48
   031c: SIND 00          Short index load *TOS+0
   031d: SLDC 00          Short load constant 0
   031e: LDB              Load byte at byte ptr TOS-1 + TOS
   031f: SRO  03          Store global word BASE3
   0321: UJP  $0326       Unconditional jump
-> 0323: SLDC 01          Short load constant 1
   0324: SRO  06          Store global word BASE6
-> 0326: SLDO 03          Short load global BASE3
   0327: SLDC 30          Short load constant 48
   0328: GEQI             Integer TOS-1 >= TOS
   0329: SLDO 03          Short load global BASE3
   032a: SLDC 39          Short load constant 57
   032b: LEQI             Integer TOS-1 <= TOS
   032c: LAND             Logical AND (TOS & TOS-1)
   032d: FJP  $0389       Jump if TOS false
   032f: SLDC 01          Short load constant 1
   0330: SRO  04          Store global word BASE4
-> 0332: SLDO 01          Short load global BASE1
   0333: SLDO 01          Short load global BASE1
   0334: SIND 00          Short index load *TOS+0
   0335: SLDC 0a          Short load constant 10
   0336: MPI              Multiply integers (TOS * TOS-1)
   0337: SLDO 03          Short load global BASE3
   0338: ADI              Add integers (TOS + TOS-1)
   0339: SLDC 30          Short load constant 48
   033a: SBI              Subtract integers (TOS-1 - TOS)
   033b: STO              Store indirect (TOS into TOS-1)
   033c: SLDO 02          Short load global BASE2
   033d: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
   0340: LDO  30          Load global word BASE48
   0342: SIND 00          Short index load *TOS+0
   0343: SLDC 00          Short load constant 0
   0344: LDB              Load byte at byte ptr TOS-1 + TOS
   0345: SRO  03          Store global word BASE3
   0347: SLDO 06          Short load global BASE6
   0348: SLDC 01          Short load constant 1
   0349: ADI              Add integers (TOS + TOS-1)
   034a: SRO  06          Store global word BASE6
   034c: LDO  30          Load global word BASE48
   034e: SIND 07          Short index load *TOS+7
   034f: SLDC 01          Short load constant 1
   0350: EQUI             Integer TOS-1 = TOS
   0351: FJP  $037b       Jump if TOS false
-> 0353: SLDO 03          Short load global BASE3
   0354: LAO  06          Load global BASE6
   0356: LAO  07          Load global BASE7
   0358: SLDC 00          Short load constant 0
   0359: SLDC 00          Short load constant 0
   035a: CBP  22          Call base procedure 34 (CHECKDEL)
   035c: FJP  $037b       Jump if TOS false
   035e: SLDO 06          Short load global BASE6
   035f: SLDC 01          Short load constant 1
   0360: EQUI             Integer TOS-1 = TOS
   0361: FJP  $0368       Jump if TOS false
   0363: SLDO 01          Short load global BASE1
   0364: SLDC 00          Short load constant 0
   0365: STO              Store indirect (TOS into TOS-1)
   0366: UJP  $036e       Unconditional jump
-> 0368: SLDO 01          Short load global BASE1
   0369: SLDO 01          Short load global BASE1
   036a: SIND 00          Short index load *TOS+0
   036b: SLDC 0a          Short load constant 10
   036c: DVI              Divide integers (TOS-1 / TOS)
   036d: STO              Store indirect (TOS into TOS-1)
-> 036e: SLDO 02          Short load global BASE2
   036f: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
   0372: LDO  30          Load global word BASE48
   0374: SIND 00          Short index load *TOS+0
   0375: SLDC 00          Short load constant 0
   0376: LDB              Load byte at byte ptr TOS-1 + TOS
   0377: SRO  03          Store global word BASE3
   0379: UJP  $0353       Unconditional jump
-> 037b: SLDO 03          Short load global BASE3
   037c: SLDC 30          Short load constant 48
   037d: GEQI             Integer TOS-1 >= TOS
   037e: SLDO 03          Short load global BASE3
   037f: SLDC 39          Short load constant 57
   0380: LEQI             Integer TOS-1 <= TOS
   0381: LAND             Logical AND (TOS & TOS-1)
   0382: LNOT             Logical NOT (~TOS)
   0383: LDO  30          Load global word BASE48
   0385: SIND 01          Short index load *TOS+1
   0386: LOR              Logical OR (TOS | TOS-1)
   0387: FJP  $0332       Jump if TOS false
-> 0389: SLDO 04          Short load global BASE4
   038a: LDO  30          Load global word BASE48
   038c: SIND 02          Short index load *TOS+2
   038d: LOR              Logical OR (TOS | TOS-1)
   038e: FJP  $039c       Jump if TOS false
   0390: SLDO 05          Short load global BASE5
   0391: FJP  $039a       Jump if TOS false
   0393: SLDO 01          Short load global BASE1
   0394: SLDO 01          Short load global BASE1
   0395: SIND 00          Short index load *TOS+0
   0396: NGI              Negate integer
   0397: STO              Store indirect (TOS into TOS-1)
   0398: UJP  $039a       Unconditional jump
-> 039a: UJP  $03a1       Unconditional jump
  SYSCOM.IORESULT := 14 { 'Bad input format' }
-> 039c: LOD  01 0001     Load word at G1 (SYSCOM)
   039f: SLDC 0e          Short load constant 14
   03a0: STO              Store indirect (TOS into TOS-1)
-> 03a1: RBP  00          Return from base procedure
END

LL 0 entry 03b6 exit 0451 parms=3 words data=11 words
### PROCEDURE PASCALSY.FWRITEINT(VAR F:FIB; VAR I:INTEGER;VAR RLENG:INTEGER) (13)
  BASE1=RLENG:INTEGER
  BASE2=I:INTEGER
  BASE3=F:FIB
  BASE4
  BASE5
  BASE6
  BASE7
  BASE8
  BASE14
BEGIN
-> 03b6: SLDC 01          Short load constant 1
   03b7: SRO  04          Store global word BASE4
   03b9: LAO  08          Load global BASE8
   03bb: SLDC 00          Short load constant 0
   03bc: SLDC 0a          Short load constant 10
   03bd: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   03be: SLDC 01          Short load constant 1
   03bf: SRO  07          Store global word BASE7
   03c1: SLDO 02          Short load global BASE2
   03c2: SLDC 00          Short load constant 0
   03c3: LESI             Integer TOS-1 < TOS
   03c4: FJP  $03ed       Jump if TOS false
   03c6: SLDO 02          Short load global BASE2
   03c7: LDCI 7fff        Load word 32767
   03ca: NGI              Negate integer
   03cb: SLDC 01          Short load constant 1
   03cc: SBI              Subtract integers (TOS-1 - TOS)
   03cd: EQUI             Integer TOS-1 = TOS
   03ce: FJP  $03e1       Jump if TOS false
   03d0: LAO  08          Load global BASE8
   03d2: NOP              No operation
   03d3: LSA  06          Load string address: '-32768'
   03db: SAS  0a          String assign (TOS to TOS-1, 10 chars)
   03dd: UJP  $043d       Unconditional jump
   03df: UJP  $03ed       Unconditional jump
-> 03e1: SLDO 02          Short load global BASE2
   03e2: ABI              Absolute value of integer (TOS)
   03e3: SRO  02          Store global word BASE2
   03e5: LAO  08          Load global BASE8
   03e7: SLDC 01          Short load constant 1
   03e8: SLDC 2d          Short load constant 45
   03e9: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   03ea: SLDC 02          Short load constant 2
   03eb: SRO  04          Store global word BASE4
-> 03ed: SLDC 04          Short load constant 4
   03ee: SRO  05          Store global word BASE5
   03f0: SLDC 00          Short load constant 0
   03f1: SRO  0e          Store global word BASE14
-> 03f3: SLDO 05          Short load global BASE5
   03f4: SLDO 0e          Short load global BASE14
   03f5: GEQI             Integer TOS-1 >= TOS
   03f6: FJP  $0436       Jump if TOS false
   03f8: SLDO 02          Short load global BASE2
   03f9: LDA  01 0014     Load addr G20 (IPOT)
   03fc: SLDO 05          Short load global BASE5
   03fd: IXA  01          Index array (TOS-1 + TOS * 1)
   03ff: SIND 00          Short index load *TOS+0
   0400: DVI              Divide integers (TOS-1 / TOS)
   0401: SLDC 30          Short load constant 48
   0402: ADI              Add integers (TOS + TOS-1)
   0403: SRO  06          Store global word BASE6
   0405: SLDO 06          Short load global BASE6
   0406: SLDC 30          Short load constant 48
   0407: EQUI             Integer TOS-1 = TOS
   0408: SLDO 05          Short load global BASE5
   0409: SLDC 00          Short load constant 0
   040a: GRTI             Integer TOS-1 > TOS
   040b: LAND             Logical AND (TOS & TOS-1)
   040c: SLDO 07          Short load global BASE7
   040d: LAND             Logical AND (TOS & TOS-1)
   040e: FJP  $0412       Jump if TOS false
   0410: UJP  $042f       Unconditional jump
-> 0412: SLDC 00          Short load constant 0
   0413: SRO  07          Store global word BASE7
   0415: LAO  08          Load global BASE8
   0417: SLDO 04          Short load global BASE4
   0418: SLDO 06          Short load global BASE6
   0419: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   041a: SLDO 04          Short load global BASE4
   041b: SLDC 01          Short load constant 1
   041c: ADI              Add integers (TOS + TOS-1)
   041d: SRO  04          Store global word BASE4
   041f: SLDO 06          Short load global BASE6
   0420: SLDC 30          Short load constant 48
   0421: NEQI             Integer TOS-1 <> TOS
   0422: FJP  $042f       Jump if TOS false
   0424: SLDO 02          Short load global BASE2
   0425: LDA  01 0014     Load addr G20 (IPOT)
   0428: SLDO 05          Short load global BASE5
   0429: IXA  01          Index array (TOS-1 + TOS * 1)
   042b: SIND 00          Short index load *TOS+0
   042c: MODI             Modulo integers (TOS-1 % TOS)
   042d: SRO  02          Store global word BASE2
-> 042f: SLDO 05          Short load global BASE5
   0430: SLDC 01          Short load constant 1
   0431: SBI              Subtract integers (TOS-1 - TOS)
   0432: SRO  05          Store global word BASE5
   0434: UJP  $03f3       Unconditional jump
-> 0436: LAO  08          Load global BASE8
   0438: SLDC 00          Short load constant 0
   0439: SLDO 04          Short load global BASE4
   043a: SLDC 01          Short load constant 1
   043b: SBI              Subtract integers (TOS-1 - TOS)
   043c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 043d: SLDO 01          Short load global BASE1
   043e: LAO  08          Load global BASE8
   0440: SLDC 00          Short load constant 0
   0441: LDB              Load byte at byte ptr TOS-1 + TOS
   0442: LESI             Integer TOS-1 < TOS
   0443: FJP  $044b       Jump if TOS false
   0445: LAO  08          Load global BASE8
   0447: SLDC 00          Short load constant 0
   0448: LDB              Load byte at byte ptr TOS-1 + TOS
   0449: SRO  01          Store global word BASE1
-> 044b: SLDO 03          Short load global BASE3
   044c: LAO  08          Load global BASE8
   044e: SLDO 01          Short load global BASE1
   044f: CBP  13          Call base procedure 19 FWRITESTRING
-> 0451: RBP  00          Return from base procedure
END

LL 0 entry 0460 exit 0460 parms=0 words data=0 words
### PROCEDURE PASCALSY.XREADREAL (14)
BEGIN
-> 0460: RBP  00          Return from base procedure
END

LL 0 entry 046c exit 046c parms=0 words data=0 words
### PROCEDURE PASCALSY.XWRITEREAL (15)
BEGIN
-> 046c: RBP  00          Return from base procedure
END

LL 0 entry 0478 exit 04a1 parms=2 words data=1 words
### PROCEDURE PASCALSY.FREADCHAR(VAR F:FIB; VAR CH:CHAR) (16)
  BASE1=CH:CHAR
  BASE2=F:FIB
  BASE3
BEGIN
-> 0478: SLDO 02          Short load global BASE2
   0479: SRO  03          Store global word BASE3
  SYSCOM.IORESULT := 0 { 'No error' }
   047b: LOD  01 0001     Load word at G1 (SYSCOM)
   047e: SLDC 00          Short load constant 0
   047f: STO              Store indirect (TOS into TOS-1)

   0480: SLDO 03          Short load global BASE3
   0481: SIND 03          Short index load *TOS+3
   0482: SLDC 01          Short load constant 1
   0483: EQUI             Integer TOS-1 = TOS
   0484: FJP  $048a       Jump if TOS false
   0486: SLDO 02          Short load global BASE2
   0487: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
-> 048a: SLDO 01          Short load global BASE1
   048b: SLDO 03          Short load global BASE3
   048c: SIND 00          Short index load *TOS+0
   048d: SLDC 00          Short load constant 0
   048e: LDB              Load byte at byte ptr TOS-1 + TOS
   048f: STO              Store indirect (TOS into TOS-1)
   0490: SLDO 03          Short load global BASE3
   0491: SIND 03          Short index load *TOS+3
   0492: SLDC 00          Short load constant 0
   0493: EQUI             Integer TOS-1 = TOS
   0494: FJP  $049c       Jump if TOS false
   0496: SLDO 02          Short load global BASE2
   0497: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
   049a: UJP  $04a1       Unconditional jump
-> 049c: SLDO 03          Short load global BASE3
   049d: INCP 03          Inc field ptr (TOS+3)
   049f: SLDC 01          Short load constant 1
   04a0: STO              Store indirect (TOS into TOS-1)
-> 04a1: RBP  00          Return from base procedure
END

LL 0 entry 04ae exit 0509 parms=3 words data=1 words
### PROCEDURE PASCALSY.FWRITECHAR(VAR F:FIB; CH:CHAR; RLENG:INTEGER) (17)
  BASE1=RLENG:INTEGER
  BASE2=CH:CHAR
  BASE3=F:FIB
  BASE4
BEGIN
-> 04ae: SLDO 03          Short load global BASE3
   04af: SRO  04          Store global word BASE4
   04b1: SLDO 04          Short load global BASE4
   04b2: SIND 05          Short index load *TOS+5
   04b3: FJP  $0504       Jump if TOS false
   04b5: SLDO 04          Short load global BASE4
   04b6: IND  1d          Static index and load word (TOS+29)
   04b8: FJP  $04d8       Jump if TOS false
-> 04ba: SLDO 01          Short load global BASE1
   04bb: SLDC 01          Short load constant 1
   04bc: GRTI             Integer TOS-1 > TOS
   04bd: FJP  $04ce       Jump if TOS false
   04bf: SLDO 04          Short load global BASE4
   04c0: SIND 00          Short index load *TOS+0
   04c1: SLDC 00          Short load constant 0
   04c2: SLDC 20          Short load constant 32
   04c3: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   04c4: SLDO 03          Short load global BASE3
   04c5: CBP  08          Call base procedure 8 FPUT
   04c7: SLDO 01          Short load global BASE1
   04c8: SLDC 01          Short load constant 1
   04c9: SBI              Subtract integers (TOS-1 - TOS)
   04ca: SRO  01          Store global word BASE1
   04cc: UJP  $04ba       Unconditional jump
-> 04ce: SLDO 04          Short load global BASE4
   04cf: SIND 00          Short index load *TOS+0
   04d0: SLDC 00          Short load constant 0
   04d1: SLDO 02          Short load global BASE2
   04d2: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   04d3: SLDO 03          Short load global BASE3
   04d4: CBP  08          Call base procedure 8 FPUT
   04d6: UJP  $0502       Unconditional jump
-> 04d8: SLDO 01          Short load global BASE1
   04d9: SLDC 01          Short load constant 1
   04da: GRTI             Integer TOS-1 > TOS
   04db: FJP  $04f3       Jump if TOS false
   04dd: SLDO 04          Short load global BASE4
   04de: SIND 00          Short index load *TOS+0
   04df: SLDC 00          Short load constant 0
   04e0: SLDC 20          Short load constant 32
   04e1: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   04e2: SLDO 04          Short load global BASE4
   04e3: SIND 07          Short index load *TOS+7
   04e4: SLDO 04          Short load global BASE4
   04e5: SIND 00          Short index load *TOS+0
   04e6: SLDC 00          Short load constant 0
   04e7: SLDC 01          Short load constant 1
   04e8: SLDC 00          Short load constant 0
   04e9: SLDC 00          Short load constant 0
   04ea: CSP  06          Call standard procedure 6 UNITWRITE
   04ec: SLDO 01          Short load global BASE1
   04ed: SLDC 01          Short load constant 1
   04ee: SBI              Subtract integers (TOS-1 - TOS)
   04ef: SRO  01          Store global word BASE1
   04f1: UJP  $04d8       Unconditional jump
-> 04f3: SLDO 04          Short load global BASE4
   04f4: SIND 00          Short index load *TOS+0
   04f5: SLDC 00          Short load constant 0
   04f6: SLDO 02          Short load global BASE2
   04f7: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   04f8: SLDO 04          Short load global BASE4
   04f9: SIND 07          Short index load *TOS+7
   04fa: SLDO 04          Short load global BASE4
   04fb: SIND 00          Short index load *TOS+0
   04fc: SLDC 00          Short load constant 0
   04fd: SLDC 01          Short load constant 1
   04fe: SLDC 00          Short load constant 0
   04ff: SLDC 00          Short load constant 0
   0500: CSP  06          Call standard procedure 6 UNITWRITE
-> 0502: UJP  $0509       Unconditional jump
  SYSCOM.IORESULT := 13 { 'File not open' }
-> 0504: LOD  01 0001     Load word at G1 (SYSCOM)
   0507: SLDC 0d          Short load constant 13
   0508: STO              Store indirect (TOS into TOS-1)
-> 0509: RBP  00          Return from base procedure
END

LL 0 entry 051a exit 057d parms=3 words data=3 words
### PROCEDURE PASCALSY.FREADSTRING(VAR F:FIB; VAR S:STRING; SLENG:INTEGER) (18)
  BASE1=SLENG:INTEGER
  BASE2=S:STRING
  BASE3=F:FIB
  BASE4
  BASE5
  BASE6
BEGIN
-> 051a: SLDO 03          Short load global BASE3
   051b: SRO  06          Store global word BASE6
   051d: SLDC 01          Short load constant 1
   051e: SRO  04          Store global word BASE4
   0520: SLDO 06          Short load global BASE6
   0521: SIND 03          Short index load *TOS+3
   0522: SLDC 01          Short load constant 1
   0523: EQUI             Integer TOS-1 = TOS
   0524: FJP  $052a       Jump if TOS false
   0526: SLDO 03          Short load global BASE3
   0527: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
-> 052a: SLDO 02          Short load global BASE2
   052b: SLDC 00          Short load constant 0
   052c: SLDO 01          Short load global BASE1
   052d: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 052e: SLDO 04          Short load global BASE4
   052f: SLDO 01          Short load global BASE1
   0530: LEQI             Integer TOS-1 <= TOS
   0531: SLDO 06          Short load global BASE6
   0532: SIND 01          Short index load *TOS+1
   0533: SLDO 06          Short load global BASE6
   0534: SIND 02          Short index load *TOS+2
   0535: LOR              Logical OR (TOS | TOS-1)
   0536: LNOT             Logical NOT (~TOS)
   0537: LAND             Logical AND (TOS & TOS-1)
   0538: FJP  $056c       Jump if TOS false
   053a: SLDO 06          Short load global BASE6
   053b: SIND 00          Short index load *TOS+0
   053c: SLDC 00          Short load constant 0
   053d: LDB              Load byte at byte ptr TOS-1 + TOS
   053e: SRO  05          Store global word BASE5
   0540: SLDO 06          Short load global BASE6
   0541: SIND 07          Short index load *TOS+7
   0542: SLDC 01          Short load constant 1
   0543: EQUI             Integer TOS-1 = TOS
   0544: FJP  $055d       Jump if TOS false
   0546: SLDO 05          Short load global BASE5
   0547: LAO  04          Load global BASE4
   0549: SLDO 02          Short load global BASE2
   054a: SLDC 00          Short load constant 0
   054b: SLDC 00          Short load constant 0
   054c: CBP  22          Call base procedure 34 (CHECKDEL)
   054e: FJP  $0552       Jump if TOS false
   0550: UJP  $055b       Unconditional jump
-> 0552: SLDO 02          Short load global BASE2
   0553: SLDO 04          Short load global BASE4
   0554: SLDO 05          Short load global BASE5
   0555: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0556: SLDO 04          Short load global BASE4
   0557: SLDC 01          Short load constant 1
   0558: ADI              Add integers (TOS + TOS-1)
   0559: SRO  04          Store global word BASE4
-> 055b: UJP  $0566       Unconditional jump
-> 055d: SLDO 02          Short load global BASE2
   055e: SLDO 04          Short load global BASE4
   055f: SLDO 05          Short load global BASE5
   0560: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0561: SLDO 04          Short load global BASE4
   0562: SLDC 01          Short load constant 1
   0563: ADI              Add integers (TOS + TOS-1)
   0564: SRO  04          Store global word BASE4
-> 0566: SLDO 03          Short load global BASE3
   0567: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
   056a: UJP  $052e       Unconditional jump
-> 056c: SLDO 02          Short load global BASE2
   056d: SLDC 00          Short load constant 0
   056e: SLDO 04          Short load global BASE4
   056f: SLDC 01          Short load constant 1
   0570: SBI              Subtract integers (TOS-1 - TOS)
   0571: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0572: SLDO 06          Short load global BASE6
   0573: SIND 01          Short index load *TOS+1
   0574: LNOT             Logical NOT (~TOS)
   0575: FJP  $057d       Jump if TOS false
   0577: SLDO 03          Short load global BASE3
   0578: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
   057b: UJP  $0572       Unconditional jump
-> 057d: RBP  00          Return from base procedure
END

LL 0 entry 058e exit 05e7 parms=3 words data=3 words
### PROCEDURE PASCALSY.FWRITESTRING(VAR F:FIB; VAR S:STRING; RLENG:INTEGER) (19)
  BASE1=RLENG:INTEGER
  BASE2=S:STRING
  BASE3=F:FIB
  BASE4
  BASE5
  BASE6
BEGIN
-> 058e: SLDO 03          Short load global BASE3
   058f: SRO  05          Store global word BASE5
   0591: SLDO 05          Short load global BASE5
   0592: SIND 05          Short index load *TOS+5
   0593: FJP  $05e2       Jump if TOS false
   0595: SLDO 01          Short load global BASE1
   0596: SLDC 00          Short load constant 0
   0597: LEQI             Integer TOS-1 <= TOS
   0598: FJP  $059f       Jump if TOS false
   059a: SLDO 02          Short load global BASE2
   059b: SLDC 00          Short load constant 0
   059c: LDB              Load byte at byte ptr TOS-1 + TOS
   059d: SRO  01          Store global word BASE1
-> 059f: SLDO 01          Short load global BASE1
   05a0: SLDO 02          Short load global BASE2
   05a1: SLDC 00          Short load constant 0
   05a2: LDB              Load byte at byte ptr TOS-1 + TOS
   05a3: GRTI             Integer TOS-1 > TOS
   05a4: FJP  $05b4       Jump if TOS false
   05a6: SLDO 03          Short load global BASE3
   05a7: SLDC 20          Short load constant 32
   05a8: SLDO 01          Short load global BASE1
   05a9: SLDO 02          Short load global BASE2
   05aa: SLDC 00          Short load constant 0
   05ab: LDB              Load byte at byte ptr TOS-1 + TOS
   05ac: SBI              Subtract integers (TOS-1 - TOS)
   05ad: CBP  11          Call base procedure 17 FWRITECHAR
   05af: SLDO 02          Short load global BASE2
   05b0: SLDC 00          Short load constant 0
   05b1: LDB              Load byte at byte ptr TOS-1 + TOS
   05b2: SRO  01          Store global word BASE1
-> 05b4: SLDO 05          Short load global BASE5
   05b5: IND  1d          Static index and load word (TOS+29)
   05b7: FJP  $05d7       Jump if TOS false
   05b9: SLDC 01          Short load constant 1
   05ba: SRO  04          Store global word BASE4
   05bc: SLDO 01          Short load global BASE1
   05bd: SRO  06          Store global word BASE6
-> 05bf: SLDO 04          Short load global BASE4
   05c0: SLDO 06          Short load global BASE6
   05c1: LEQI             Integer TOS-1 <= TOS
   05c2: FJP  $05d5       Jump if TOS false
   05c4: SLDO 05          Short load global BASE5
   05c5: SIND 00          Short index load *TOS+0
   05c6: SLDC 00          Short load constant 0
   05c7: SLDO 02          Short load global BASE2
   05c8: SLDO 04          Short load global BASE4
   05c9: LDB              Load byte at byte ptr TOS-1 + TOS
   05ca: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   05cb: SLDO 03          Short load global BASE3
   05cc: CBP  08          Call base procedure 8 FPUT
   05ce: SLDO 04          Short load global BASE4
   05cf: SLDC 01          Short load constant 1
   05d0: ADI              Add integers (TOS + TOS-1)
   05d1: SRO  04          Store global word BASE4
   05d3: UJP  $05bf       Unconditional jump
-> 05d5: UJP  $05e0       Unconditional jump
-> 05d7: SLDO 05          Short load global BASE5
   05d8: SIND 07          Short index load *TOS+7
   05d9: SLDO 02          Short load global BASE2
   05da: SLDC 01          Short load constant 1
   05db: SLDO 01          Short load global BASE1
   05dc: SLDC 00          Short load constant 0
   05dd: SLDC 00          Short load constant 0
   05de: CSP  06          Call standard procedure 6 UNITWRITE
-> 05e0: UJP  $05e7       Unconditional jump
  SYSCOM.IORESULT := 13 { 'File not open' }
-> 05e2: LOD  01 0001     Load word at G1 (SYSCOM)
   05e5: SLDC 0d          Short load constant 13
   05e6: STO              Store indirect (TOS into TOS-1)
-> 05e7: RBP  00          Return from base procedure
END

LL 0 entry 05f6 exit 0640 parms=4 words data=2 words
### PROCEDURE PASCALSY.FWRITEBYTES(VAR F:FIB; VAR A:WINDOW; RLENG:INTEGER; ALENG:INTEGER) (20)
  BASE1=ALENG:INTEGER
  BASE2=RLENG:INTEGER
  BASE3=A:WINDOW
  BASE4=F:FIB
  BASE5
  BASE6=F_C:FIB
BEGIN
  F_C := F
-> 05f6: SLDO 04          Short load global BASE4 (F)
   05f7: SRO  06          Store global word BASE6 (F_C)
  IF F_C.FISOPEN THEN
   05f9: SLDO 06          Short load global BASE6 (F_C)
   05fa: SIND 05          Short index load *TOS+5
   05fb: FJP  $063b       Jump if TOS false
  BEGIN
    IF RLENG > ALENG THEN 
   05fd: SLDO 02          Short load global BASE2 (RLENG)
   05fe: SLDO 01          Short load global BASE1 (ALENG)
   05ff: GRTI             Integer TOS-1 > TOS
   0600: FJP  $060c       Jump if TOS false
    BEGIN
      FWRITECHAR(F,' ',RLENG - ALENG)
   0602: SLDO 04          Short load global BASE4 (F)
   0603: SLDC 20          Short load constant 32
   0604: SLDO 02          Short load global BASE2 (RLENG)
   0605: SLDO 01          Short load global BASE1 (ALENG)
   0606: SBI              Subtract integers (TOS-1 - TOS)
   0607: CBP  11          Call base procedure 17 FWRITECHAR
      RLENG := ALENG
   0609: SLDO 01          Short load global BASE1 (ALENG)
   060a: SRO  02          Store global word BASE2 (RLENG)
    END
    IF F_C.FSOFTBUF THEN
-> 060c: SLDO 06          Short load global BASE6 (F_C)
   060d: IND  1d          Static index and load word (TOS+29)
   060f: FJP  $0630       Jump if TOS false
    BEGIN
      BASE5 := 0
   0611: SLDC 00          Short load constant 0
   0612: SRO  05          Store global word BASE5
      WHILE BASE5 < RLENG AND NOT F_C.FEOF DO
-> 0614: SLDO 05          Short load global BASE5
   0615: SLDO 02          Short load global BASE2 (RLENG)
   0616: LESI             Integer TOS-1 < TOS
   0617: SLDO 06          Short load global BASE6 (F_C)
   0618: SIND 02          Short index load *TOS+2
   0619: LNOT             Logical NOT (~TOS)
   061a: LAND             Logical AND (TOS & TOS-1)
   061b: FJP  $062e       Jump if TOS false
      BEGIN
        F_C.FWINDOW[0] := A + BASE5
   061d: SLDO 06          Short load global BASE6 (F_C)
   061e: SIND 00          Short index load *TOS+0
   061f: SLDC 00          Short load constant 0
   0620: SLDO 03          Short load global BASE3 (A)
   0621: SLDO 05          Short load global BASE5
   0622: LDB              Load byte at byte ptr TOS-1 + TOS
   0623: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
        FPUT(F)
   0624: SLDO 04          Short load global BASE4 (F)
   0625: CBP  08          Call base procedure 8 FPUT
        BASE5 := BASE5 + 1
   0627: SLDO 05          Short load global BASE5
   0628: SLDC 01          Short load constant 1
   0629: ADI              Add integers (TOS + TOS-1)
   062a: SRO  05          Store global word BASE5
   062c: UJP  $0614       Unconditional jump
      END
-> 062e: UJP  $0639       Unconditional jump
    END ELSE BEGIN
      UNITWRITE(F_C.FUNIT,A,0,RLENG,0,0)
-> 0630: SLDO 06          Short load global BASE6 (F_C)
   0631: SIND 07          Short index load *TOS+7
   0632: SLDO 03          Short load global BASE3 (A)
   0633: SLDC 00          Short load constant 0
   0634: SLDO 02          Short load global BASE2 (RLENG)
   0635: SLDC 00          Short load constant 0
   0636: SLDC 00          Short load constant 0
   0637: CSP  06          Call standard procedure 6 UNITWRITE
    END
-> 0639: UJP  $0640       Unconditional jump
  END ELSE BEGIN
    SYSCOM.IORESULT := 13 { 'File not open' }
-> 063b: LOD  01 0001     Load word at G1 (SYSCOM)
   063e: SLDC 0d          Short load constant 13
   063f: STO              Store indirect (TOS into TOS-1)
  END
-> 0640: RBP  00          Return from base procedure
END

LL 0 entry 064e exit 066f parms=1 words data=0 words
### PROCEDURE PASCALSY.FREADLN(VAR F:FIB) (21)
  BASE1=F:FIB
BEGIN
  WHILE NOT F.FEOLN DO
-> 064e: SLDO 01          Short load global BASE1 (F)
   064f: SIND 01          Short index load *TOS+1
   0650: LNOT             Logical NOT (~TOS)
   0651: FJP  $0659       Jump if TOS false
    FGET(F)
   0653: SLDO 01          Short load global BASE1 (F)
   0654: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
   0657: UJP  $064e       Unconditional jump
  IF F.FSTATE = FJANDW THEN
-> 0659: SLDO 01          Short load global BASE1 (F)
   065a: SIND 03          Short index load *TOS+3
   065b: SLDC 00          Short load constant 0
   065c: EQUI             Integer TOS-1 = TOS
   065d: FJP  $0665       Jump if TOS false
    FGET(F)
   065f: SLDO 01          Short load global BASE1 (F)
   0660: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
   0663: UJP  $066f       Unconditional jump
  ELSE BEGIN
    F.FSTATE = FNEEDCHAR
-> 0665: SLDO 01          Short load global BASE1 (F)
   0666: INCP 03          Inc field ptr (TOS+3)
   0668: SLDC 01          Short load constant 1
   0669: STO              Store indirect (TOS into TOS-1)
    F.FEOLN := FALSE
   066a: SLDO 01          Short load global BASE1 (F)
   066b: INCP 01          Inc field ptr (TOS+1)
   066d: SLDC 00          Short load constant 0
   066e: STO              Store indirect (TOS into TOS-1)
  END
-> 066f: RBP  00          Return from base procedure
END

LL 0 entry 067e exit 0686 parms=1 words data=0 words
### PROCEDURE PASCALSY.FWRITELN(VAR F:FIB) (22)
  BASE1=F:FIB
BEGIN
-> 067e: SLDO 01          Short load global BASE1
   067f: SIND 00          Short index load *TOS+0
   0680: SLDC 00          Short load constant 0
   0681: SLDC 0d          Short load constant 13
   0682: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0683: SLDO 01          Short load global BASE1
   0684: CBP  08          Call base procedure 8 FPUT
-> 0686: RBP  00          Return from base procedure
END

LL 0 entry 0692 exit 06b4 parms=3 words data=0 words
### PROCEDURE PASCALSY.SCONCAT(VAR DEST:STRING;SRC: STRING; DESTLENG: INTEGER) (23)
  BASE1=DESTLENG:INTEGER
  BASE2=SRC:STRING
  BASE3=DEST:STRING
BEGIN
-> 0692: SLDO 02          Short load global BASE2
   0693: SLDC 00          Short load constant 0
   0694: LDB              Load byte at byte ptr TOS-1 + TOS
   0695: SLDO 03          Short load global BASE3
   0696: SLDC 00          Short load constant 0
   0697: LDB              Load byte at byte ptr TOS-1 + TOS
   0698: ADI              Add integers (TOS + TOS-1)
   0699: SLDO 01          Short load global BASE1
   069a: LEQI             Integer TOS-1 <= TOS
   069b: FJP  $06b4       Jump if TOS false
   069d: SLDO 02          Short load global BASE2
   069e: SLDC 01          Short load constant 1
   069f: SLDO 03          Short load global BASE3
   06a0: SLDO 03          Short load global BASE3
   06a1: SLDC 00          Short load constant 0
   06a2: LDB              Load byte at byte ptr TOS-1 + TOS
   06a3: SLDC 01          Short load constant 1
   06a4: ADI              Add integers (TOS + TOS-1)
   06a5: SLDO 02          Short load global BASE2
   06a6: SLDC 00          Short load constant 0
   06a7: LDB              Load byte at byte ptr TOS-1 + TOS
   06a8: CSP  02          Call standard procedure 2 MOVL
   06aa: SLDO 03          Short load global BASE3
   06ab: SLDC 00          Short load constant 0
   06ac: SLDO 02          Short load global BASE2
   06ad: SLDC 00          Short load constant 0
   06ae: LDB              Load byte at byte ptr TOS-1 + TOS
   06af: SLDO 03          Short load global BASE3
   06b0: SLDC 00          Short load constant 0
   06b1: LDB              Load byte at byte ptr TOS-1 + TOS
   06b2: ADI              Add integers (TOS + TOS-1)
   06b3: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 06b4: RBP  00          Return from base procedure
END

LL 0 entry 06c0 exit 0709 parms=4 words data=1 words
### PROCEDURE PASCALSY.SINSERT(VAR SRC:STRING;DEST:STRING;DESTLENG:INTEGER;INSINX:INTEGER) (24)
  BASE1=INSINX:INTEGER
  BASE2=DESTLENG:INTEGER
  BASE3=DEST:STRING
  BASE4=SRC:STRING
  BASE5
BEGIN
-> 06c0: SLDO 01          Short load global BASE1
   06c1: SLDC 00          Short load constant 0
   06c2: GRTI             Integer TOS-1 > TOS
   06c3: SLDO 04          Short load global BASE4
   06c4: SLDC 00          Short load constant 0
   06c5: LDB              Load byte at byte ptr TOS-1 + TOS
   06c6: SLDC 00          Short load constant 0
   06c7: GRTI             Integer TOS-1 > TOS
   06c8: LAND             Logical AND (TOS & TOS-1)
   06c9: SLDO 04          Short load global BASE4
   06ca: SLDC 00          Short load constant 0
   06cb: LDB              Load byte at byte ptr TOS-1 + TOS
   06cc: SLDO 03          Short load global BASE3
   06cd: SLDC 00          Short load constant 0
   06ce: LDB              Load byte at byte ptr TOS-1 + TOS
   06cf: ADI              Add integers (TOS + TOS-1)
   06d0: SLDO 02          Short load global BASE2
   06d1: LEQI             Integer TOS-1 <= TOS
   06d2: LAND             Logical AND (TOS & TOS-1)
   06d3: FJP  $0709       Jump if TOS false
   06d5: SLDO 03          Short load global BASE3
   06d6: SLDC 00          Short load constant 0
   06d7: LDB              Load byte at byte ptr TOS-1 + TOS
   06d8: SLDO 01          Short load global BASE1
   06d9: SBI              Subtract integers (TOS-1 - TOS)
   06da: SLDC 01          Short load constant 1
   06db: ADI              Add integers (TOS + TOS-1)
   06dc: SRO  05          Store global word BASE5
   06de: SLDO 05          Short load global BASE5
   06df: SLDC 00          Short load constant 0
   06e0: GRTI             Integer TOS-1 > TOS
   06e1: FJP  $06f1       Jump if TOS false
   06e3: SLDO 03          Short load global BASE3
   06e4: SLDO 01          Short load global BASE1
   06e5: SLDO 03          Short load global BASE3
   06e6: SLDO 01          Short load global BASE1
   06e7: SLDO 04          Short load global BASE4
   06e8: SLDC 00          Short load constant 0
   06e9: LDB              Load byte at byte ptr TOS-1 + TOS
   06ea: ADI              Add integers (TOS + TOS-1)
   06eb: SLDO 05          Short load global BASE5
   06ec: CSP  03          Call standard procedure 3 MOVR
   06ee: SLDC 00          Short load constant 0
   06ef: SRO  05          Store global word BASE5
-> 06f1: SLDO 05          Short load global BASE5
   06f2: SLDC 00          Short load constant 0
   06f3: EQUI             Integer TOS-1 = TOS
   06f4: FJP  $0709       Jump if TOS false
   06f6: SLDO 04          Short load global BASE4
   06f7: SLDC 01          Short load constant 1
   06f8: SLDO 03          Short load global BASE3
   06f9: SLDO 01          Short load global BASE1
   06fa: SLDO 04          Short load global BASE4
   06fb: SLDC 00          Short load constant 0
   06fc: LDB              Load byte at byte ptr TOS-1 + TOS
   06fd: CSP  02          Call standard procedure 2 MOVL
   06ff: SLDO 03          Short load global BASE3
   0700: SLDC 00          Short load constant 0
   0701: SLDO 03          Short load global BASE3
   0702: SLDC 00          Short load constant 0
   0703: LDB              Load byte at byte ptr TOS-1 + TOS
   0704: SLDO 04          Short load global BASE4
   0705: SLDC 00          Short load constant 0
   0706: LDB              Load byte at byte ptr TOS-1 + TOS
   0707: ADI              Add integers (TOS + TOS-1)
   0708: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0709: RBP  00          Return from base procedure
END

LL 0 entry 0716 exit 073a parms=4 words data=0 words
### PROCEDURE PASCALSY.SCOPY(VAR SRC:STRING;DEST:STRING;SRCINX:INTEGER;COPYLENG:INTEGER) (25)
  BASE1=COPYLENG:INTEGER
  BASE2=SRCINX:INTEGER
  BASE3=DEST:STRING
  BASE4=SRC:STRING
BEGIN
-> 0716: SLDO 03          Short load global BASE3
   0717: LSA  00          Load string address: ''
   0719: NOP              No operation
   071a: SAS  50          String assign (TOS to TOS-1, 80 chars)
   071c: SLDO 02          Short load global BASE2
   071d: SLDC 00          Short load constant 0
   071e: GRTI             Integer TOS-1 > TOS
   071f: SLDO 01          Short load global BASE1
   0720: SLDC 00          Short load constant 0
   0721: GRTI             Integer TOS-1 > TOS
   0722: LAND             Logical AND (TOS & TOS-1)
   0723: SLDO 02          Short load global BASE2
   0724: SLDO 01          Short load global BASE1
   0725: ADI              Add integers (TOS + TOS-1)
   0726: SLDC 01          Short load constant 1
   0727: SBI              Subtract integers (TOS-1 - TOS)
   0728: SLDO 04          Short load global BASE4
   0729: SLDC 00          Short load constant 0
   072a: LDB              Load byte at byte ptr TOS-1 + TOS
   072b: LEQI             Integer TOS-1 <= TOS
   072c: LAND             Logical AND (TOS & TOS-1)
   072d: FJP  $073a       Jump if TOS false
   072f: SLDO 04          Short load global BASE4
   0730: SLDO 02          Short load global BASE2
   0731: SLDO 03          Short load global BASE3
   0732: SLDC 01          Short load constant 1
   0733: SLDO 01          Short load global BASE1
   0734: CSP  02          Call standard procedure 2 MOVL
   0736: SLDO 03          Short load global BASE3
   0737: SLDC 00          Short load constant 0
   0738: SLDO 01          Short load global BASE1
   0739: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 073a: RBP  00          Return from base procedure
END

LL 0 entry 0746 exit 077d parms=3 words data=1 words
### PROCEDURE PASCALSY.SDELETE(VAR DEST:STRING;DELINX:INTEGER;DELLENG:INTEGER) (26)
  BASE1=DELLENG:INTEGER
  BASE2=DELINX:INTEGER
  BASE3=DEST:STRING
  BASE4
BEGIN
  IF DELINX > 0 AND DELLENG > 0 THEN 
-> 0746: SLDO 02          Short load global BASE2 (DELINX)
   0747: SLDC 00          Short load constant 0
   0748: GRTI             Integer TOS-1 > TOS
   0749: SLDO 01          Short load global BASE1 (DELLENG)
   074a: SLDC 00          Short load constant 0
   074b: GRTI             Integer TOS-1 > TOS
   074c: LAND             Logical AND (TOS & TOS-1)
   074d: FJP  $077d       Jump if TOS false
  BEGIN
    BASE4 := DEST[0] - DELINX - DELLENG + 1
   074f: SLDO 03          Short load global BASE3 (DEST)
   0750: SLDC 00          Short load constant 0
   0751: LDB              Load byte at byte ptr TOS-1 + TOS
   0752: SLDO 02          Short load global BASE2 (DELINX)
   0753: SBI              Subtract integers (TOS-1 - TOS)
   0754: SLDO 01          Short load global BASE1 (DELLENG)
   0755: SBI              Subtract integers (TOS-1 - TOS)
   0756: SLDC 01          Short load constant 1
   0757: ADI              Add integers (TOS + TOS-1)
   0758: SRO  04          Store global word BASE4
    IF BASE4 = 0 THEN
   075a: SLDO 04          Short load global BASE4
   075b: SLDC 00          Short load constant 0
   075c: EQUI             Integer TOS-1 = TOS
   075d: FJP  $0767       Jump if TOS false
    BEGIN
      DEST[0] := DELINX - 1
   075f: SLDO 03          Short load global BASE3 (DEST)
   0760: SLDC 00          Short load constant 0
   0761: SLDO 02          Short load global BASE2 (DELINX)
   0762: SLDC 01          Short load constant 1
   0763: SBI              Subtract integers (TOS-1 - TOS)
   0764: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0765: UJP  $077d       Unconditional jump
    END ELSE BEGIN
      IF BASE4 > 0 THEN
-> 0767: SLDO 04          Short load global BASE4
   0768: SLDC 00          Short load constant 0
   0769: GRTI             Integer TOS-1 > TOS
   076a: FJP  $077d       Jump if TOS false
      BEGIN
        MOVELEFT(DEST, DELINX + DELLENG, DEST, DELINX, BASE4)
   076c: SLDO 03          Short load global BASE3 (DEST)
   076d: SLDO 02          Short load global BASE2 (DELINX)
   076e: SLDO 01          Short load global BASE1 (DELLENG)
   076f: ADI              Add integers (TOS + TOS-1)
   0770: SLDO 03          Short load global BASE3 (DEST)
   0771: SLDO 02          Short load global BASE2 (DELINX)
   0772: SLDO 04          Short load global BASE4
   0773: CSP  02          Call standard procedure 2 MOVL
        DEST[0] := DEST[0] - DELLENG
   0775: SLDO 03          Short load global BASE3 (DEST)
   0776: SLDC 00          Short load constant 0
   0777: SLDO 03          Short load global BASE3 (DEST)
   0778: SLDC 00          Short load constant 0
   0779: LDB              Load byte at byte ptr TOS-1 + TOS
   077a: SLDO 01          Short load global BASE1 (DELLENG)
   077b: SBI              Subtract integers (TOS-1 - TOS)
   077c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
      END
    END
  END
-> 077d: RBP  00          Return from base procedure
END

LL 0 entry 078a exit 07e5 parms=4 words data=44 words
### FUNCTION PASCALSY.SPOS(VAR TARGET:STRING;SRC:STRING):INTEGER (27)
  BASE1=RETVAL1:INTEGER
  BASE3=SRC:STRING
  BASE4=TARGET:STRING
  BASE5
  BASE6
  BASE7
  BASE8
BEGIN
-> 078a: SLDC 00          Short load constant 0
   078b: SRO  01          Store global word BASE1
   078d: SLDO 04          Short load global BASE4
   078e: SLDC 00          Short load constant 0
   078f: LDB              Load byte at byte ptr TOS-1 + TOS
   0790: SLDC 00          Short load constant 0
   0791: GRTI             Integer TOS-1 > TOS
   0792: FJP  $07e5       Jump if TOS false
   0794: SLDO 04          Short load global BASE4
   0795: SLDC 01          Short load constant 1
   0796: LDB              Load byte at byte ptr TOS-1 + TOS
   0797: SRO  07          Store global word BASE7
   0799: SLDC 01          Short load constant 1
   079a: SRO  06          Store global word BASE6
   079c: SLDO 03          Short load global BASE3
   079d: SLDC 00          Short load constant 0
   079e: LDB              Load byte at byte ptr TOS-1 + TOS
   079f: SLDO 04          Short load global BASE4
   07a0: SLDC 00          Short load constant 0
   07a1: LDB              Load byte at byte ptr TOS-1 + TOS
   07a2: SBI              Subtract integers (TOS-1 - TOS)
   07a3: SLDC 01          Short load constant 1
   07a4: ADI              Add integers (TOS + TOS-1)
   07a5: SRO  05          Store global word BASE5
   07a7: LAO  08          Load global BASE8
   07a9: SLDC 00          Short load constant 0
   07aa: SLDO 04          Short load global BASE4
   07ab: SLDC 00          Short load constant 0
   07ac: LDB              Load byte at byte ptr TOS-1 + TOS
   07ad: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 07ae: SLDO 06          Short load global BASE6
   07af: SLDO 05          Short load global BASE5
   07b0: LEQI             Integer TOS-1 <= TOS
   07b1: FJP  $07e5       Jump if TOS false
   07b3: SLDO 06          Short load global BASE6
   07b4: SLDO 05          Short load global BASE5
   07b5: SLDO 06          Short load global BASE6
   07b6: SBI              Subtract integers (TOS-1 - TOS)
   07b7: SLDC 00          Short load constant 0
   07b8: SLDO 07          Short load global BASE7
   07b9: SLDO 03          Short load global BASE3
   07ba: SLDO 06          Short load global BASE6
   07bb: SLDC 00          Short load constant 0
   07bc: CSP  0b          Call standard procedure 11 SCAN
   07be: ADI              Add integers (TOS + TOS-1)
   07bf: SRO  06          Store global word BASE6
   07c1: SLDO 06          Short load global BASE6
   07c2: SLDO 05          Short load global BASE5
   07c3: GRTI             Integer TOS-1 > TOS
   07c4: FJP  $07c8       Jump if TOS false
   07c6: UJP  $07e5       Unconditional jump
-> 07c8: SLDO 03          Short load global BASE3
   07c9: SLDO 06          Short load global BASE6
   07ca: LAO  08          Load global BASE8
   07cc: SLDC 01          Short load constant 1
   07cd: SLDO 04          Short load global BASE4
   07ce: SLDC 00          Short load constant 0
   07cf: LDB              Load byte at byte ptr TOS-1 + TOS
   07d0: CSP  02          Call standard procedure 2 MOVL
   07d2: LAO  08          Load global BASE8
   07d4: SLDO 04          Short load global BASE4
   07d5: EQLSTR           String TOS-1 = TOS
   07d7: FJP  $07de       Jump if TOS false
   07d9: SLDO 06          Short load global BASE6
   07da: SRO  01          Store global word BASE1
   07dc: UJP  $07e5       Unconditional jump
-> 07de: SLDO 06          Short load global BASE6
   07df: SLDC 01          Short load constant 1
   07e0: ADI              Add integers (TOS + TOS-1)
   07e1: SRO  06          Store global word BASE6
   07e3: UJP  $07ae       Unconditional jump
-> 07e5: RBP  01          Return from base procedure
END

LL 0 entry 07f4 exit 08e2 parms=8 words data=2 words
### FUNCTION PASCALSY.FBLOCKIO(VAR F:FIB;VAR A:WINDOW;I:INTEGER;NBLOCKS,RBLOCK:INTEGER;DOREAD:BOOLEAN):INTEGER (28)
  BASE1=RETVAL:INTEGER
  BASE3=DOREAD:BOOLEAN
  BASE4=RBLOCK:INTEGER
  BASE5=NBLOCKS:INTEGER
  BASE6=I:INTEGER
  BASE7=A:WINDOW
  BASE8=F:FIB
  BASE9=F_C:FIB
  BASE10=HEADER:DIRENTRY
BEGIN
  CANTSTRETCH := FALSE
-> 07f4: SLDC 00          Short load constant 0
   07f5: SRO  01          Store global word BASE1 (RETVAL)
  SYSCOM.IORESULT := INOERROR { 'No error' }
   07f7: LOD  01 0001     Load word at G1 (SYSCOM)
   07fa: SLDC 00          Short load constant 0 (INOERROR)
   07fb: STO              Store indirect (TOS into TOS-1)
  F_C := F
   07fc: SLDO 08          Short load global BASE8 (F)
   07fd: SRO  09          Store global word BASE9 (F_C)
  IF F_C.FISOPEN AND NBLOCKS >= 0 THEN
   07ff: SLDO 09          Short load global BASE9 (F_C)
   0800: SIND 05          Short index load *TOS+5 (FISOPEN)
   0801: SLDO 05          Short load global BASE5 (NBLOCKS)
   0802: SLDC 00          Short load constant 0
   0803: GEQI             Integer TOS-1 >= TOS
   0804: LAND             Logical AND (TOS & TOS-1)
   0805: FJP  $08dd       Jump if TOS false
  BEGIN
    IF F_C.ISBLKD THEN
   0807: SLDO 09          Short load global BASE9 (F_C)
   0808: SIND 06          Short index load *TOS+6
   0809: FJP  $0890       Jump if TOS false
    BEGIN
      HEADER := F_C.FHEADER
   080b: SLDO 09          Short load global BASE9 (F_C)
   080c: INCP 10          Inc field ptr (TOS+16)
   080e: SRO  0a          Store global word BASE10 (HEADER)
      IF RBLOCK < 0 THEN
   0810: SLDO 04          Short load global BASE4 (RBLOCK)
   0811: SLDC 00          Short load constant 0
   0812: LESI             Integer TOS-1 < TOS
   0813: FJP  $081a       Jump if TOS false
      BEGIN
        RBLOCK := F_C.FNXTBLK
   0815: SLDO 09          Short load global BASE9 (F_C)
   0816: IND  0d          Static index and load word (TOS+13)
   0818: SRO  04          Store global word BASE4 (RBLOCK)
      END
      RBLOCK := HEADER.DFIRSTBLK + RBLOCK
-> 081a: SLDO 0a          Short load global BASE10 (HEADER)
   081b: SIND 00          Short index load *TOS+0
   081c: SLDO 04          Short load global BASE4 (RBLOCK)
   081d: ADI              Add integers (TOS + TOS-1)
   081e: SRO  04          Store global word BASE4 (RBLOCK)
      IF RBLOCK + NBLOCKS > HEADER.DLASTBLK THEN
   0820: SLDO 04          Short load global BASE4 (RBLOCK)
   0821: SLDO 05          Short load global BASE5 (NBLOCKS)
   0822: ADI              Add integers (TOS + TOS-1)
   0823: SLDO 0a          Short load global BASE10 (HEADER)
   0824: SIND 01          Short index load *TOS+1
   0825: GRTI             Integer TOS-1 > TOS
   0826: FJP  $0833       Jump if TOS false
      BEGIN
        IF NOT DOREAD THEN
   0828: SLDO 03          Short load global BASE3 (DOREAD)
   0829: LNOT             Logical NOT (~TOS)
   082a: FJP  $0833       Jump if TOS false
        BEGIN
          IF CANTSTRETCH(F) THEN;
   082c: SLDO 08          Short load global BASE8 (F)
   082d: SLDC 00          Short load constant 0
   082e: SLDC 00          Short load constant 0
   082f: CBP  23          Call base procedure 35 (CANTSTRETCH)
   0831: FJP  $0833       Jump if TOS false
        END
      END
      IF RBLOCK + NBLOCKS > HEADER.DLASTBLK THEN
-> 0833: SLDO 04          Short load global BASE4 (RBLOCK)
   0834: SLDO 05          Short load global BASE5 (NBLOCKS)
   0835: ADI              Add integers (TOS + TOS-1)
   0836: SLDO 0a          Short load global BASE10 (HEADER)
   0837: SIND 01          Short index load *TOS+1
   0838: GRTI             Integer TOS-1 > TOS
   0839: FJP  $0841       Jump if TOS false
      BEGIN
        NBLOCKS := HEADER.DLASTBLK - RBLOCK
   083b: SLDO 0a          Short load global BASE10 (HEADER)
   083c: SIND 01          Short index load *TOS+1
   083d: SLDO 04          Short load global BASE4 (RBLOCK)
   083e: SBI              Subtract integers (TOS-1 - TOS)
   083f: SRO  05          Store global word BASE5 (NBLOCKS)
      END
      F_C.FEOF := RBLOCK >= HEADER.DLASTBLK
-> 0841: SLDO 09          Short load global BASE9 (F_C)
   0842: INCP 02          Inc field ptr (TOS+2)
   0844: SLDO 04          Short load global BASE4 (RBLOCK)
   0845: SLDO 0a          Short load global BASE10 (HEADER)
   0846: SIND 01          Short index load *TOS+1
   0847: GEQI             Integer TOS-1 >= TOS
   0848: STO              Store indirect (TOS into TOS-1)
      IF NOT F_C.FEOF THEN
   0849: SLDO 09          Short load global BASE9 (F_C)
   084a: SIND 02          Short index load *TOS+2
   084b: LNOT             Logical NOT (~TOS)
   084c: FJP  $088e       Jump if TOS false
      BEGIN
        BLOCKIOREADWRITE(F_C.FUNIT,A,I,NBLOCKS,RBLOCK,DOREAD)
   084e: SLDO 09          Short load global BASE9 (F_C)
   084f: SIND 07          Short index load *TOS+7 (FUNIT)
   0850: SLDO 07          Short load global BASE7 (A)
   0851: SLDO 06          Short load global BASE6 (I)
   0852: SLDO 05          Short load global BASE5 (NBLOCKS)
   0853: SLDO 04          Short load global BASE4 (RBLOCK)
   0854: SLDO 03          Short load global BASE3 (DOREAD)
   0855: CLP  24          Call local procedure 36 (child) BLOCKIOREADWRITE
        IF IORESULT = 0 THEN
   0857: CSP  22          Call standard procedure 34 IORESULT
   0859: SLDC 00          Short load constant 0
   085a: EQUI             Integer TOS-1 = TOS
   085b: FJP  $088e       Jump if TOS false
        BEGIN
          IF NOT DOREAD THEN
   085d: SLDO 03          Short load global BASE3 (DOREAD)
   085e: LNOT             Logical NOT (~TOS)
   085f: FJP  $0866       Jump if TOS false
          BEGIN
            F_C.FMODIFIED := TRUE
   0861: SLDO 09          Short load global BASE9 (F_C)
   0862: INCP 0f          Inc field ptr (TOS+15) (FMODIFIED)
   0864: SLDC 01          Short load constant 1
   0865: STO              Store indirect (TOS into TOS-1)
          END
          FBLOCKIO := NBLOCKS
-> 0866: SLDO 05          Short load global BASE5 (NBLOCKS)
   0867: SRO  01          Store global word BASE1 (RETVAL)
          RBLOCK := RBLOCK + NBLOCKS
   0869: SLDO 04          Short load global BASE4 (RBLOCK)
   086a: SLDO 05          Short load global BASE5 (NBLOCKS)
   086b: ADI              Add integers (TOS + TOS-1)
   086c: SRO  04          Store global word BASE4 (RBLOCK)
          F_C.FEOF := RBLOCK = HEADER.DLASTBLK
   086e: SLDO 09          Short load global BASE9 (F_C)
   086f: INCP 02          Inc field ptr (TOS+2) (FEOF)
   0871: SLDO 04          Short load global BASE4 (RBLOCK)
   0872: SLDO 0a          Short load global BASE10 (HEADER)
   0873: SIND 01          Short index load *TOS+1
   0874: EQUI             Integer TOS-1 = TOS
   0875: STO              Store indirect (TOS into TOS-1)
          F_C.FNXTBLK := RBLOCK - HEADER.DFIRSTBLK
   0876: SLDO 09          Short load global BASE9 (F_C)
   0877: INCP 0d          Inc field ptr (TOS+13) (FNXTBLK)
   0879: SLDO 04          Short load global BASE4 (RBLOCK)
   087a: SLDO 0a          Short load global BASE10 (HEADER)
   087b: SIND 00          Short index load *TOS+0
   087c: SBI              Subtract integers (TOS-1 - TOS)
   087d: STO              Store indirect (TOS into TOS-1)
          IF F_C.FNXTBLK > F_C.FMAXBLK THEN
   087e: SLDO 09          Short load global BASE9 (F_C)
   087f: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   0881: SLDO 09          Short load global BASE9 (F_C)
   0882: IND  0c          Static index and load word (TOS+12) (FMAXBLK)
   0884: GRTI             Integer TOS-1 > TOS
   0885: FJP  $088e       Jump if TOS false
          BEGIN
            F_C.FMAXBLK := F_C.FNXTBLK
   0887: SLDO 09          Short load global BASE9 (F_C)
   0888: INCP 0c          Inc field ptr (TOS+12) (FMAXBLK)
   088a: SLDO 09          Short load global BASE9 (F_C)
   088b: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   088d: STO              Store indirect (TOS into TOS-1)
          END
        END
      END
-> 088e: UJP  $08db       Unconditional jump
    END ELSE BEGIN
      FBLOCKIO := NBLOCKS
-> 0890: SLDO 05          Short load global BASE5 (NBLOCKS)
   0891: SRO  01          Store global word BASE1 (RETVAL)
      BLOCKIOREADWRITE(F_C.FUNIT,A,I,NBLOCKS,RBLOCK,DOREAD)
   0893: SLDO 09          Short load global BASE9 (F_C)
   0894: SIND 07          Short index load *TOS+7 (FUNIT)
   0895: SLDO 07          Short load global BASE7 (A)
   0896: SLDO 06          Short load global BASE6 (I)
   0897: SLDO 05          Short load global BASE5 (NBLOCKS)
   0898: SLDO 04          Short load global BASE4 (RBLOCK)
   0899: SLDO 03          Short load global BASE3 (DOREAD)
   089a: CLP  24          Call local procedure 36 (child)(BLOCKIOREADWRITE)
      IF IORESULT = 0 THEN
   089c: CSP  22          Call standard procedure 34 IORESULT
   089e: SLDC 00          Short load constant 0
   089f: EQUI             Integer TOS-1 = TOS
   08a0: FJP  $08d8       Jump if TOS false
      BEGIN
        IF DOREAD THEN
   08a2: SLDO 03          Short load global BASE3 (DOREAD)
   08a3: FJP  $08d6       Jump if TOS false
        BEGIN
          RBLOCK := NBLOCKS * 512
   08a5: SLDO 05          Short load global BASE5 (NBLOCKS)
   08a6: LDCI 0200        Load word 512
   08a9: MPI              Multiply integers (TOS * TOS-1)
   08aa: SRO  04          Store global word BASE4 (RBLOCK)
          RBLOCK -RBLOCK := SCAN(-RBLOCK,1,0,A,RBLOCK+I-1,0) + RBLOCK
   08ac: SLDO 04          Short load global BASE4 (RBLOCK) [RBLOCK]
   08ad: SLDO 04          Short load global BASE4 (RBLOCK) [RBLOCK,RBLOCK]
   08ae: NGI              Negate integer [-RBLOCK,RBLOCK]
   08af: SLDC 01          Short load constant 1 [1,-RBLOCK,RBLOCK]
   08b0: SLDC 00          Short load constant 0 [0,1,-RBLOCK,RBLOCK]
   08b1: SLDO 07          Short load global BASE7 (A) [A,0,1,-RBLOCK,RBLOCK]
   08b2: SLDO 06          Short load global BASE6 (I) [I,A,0,1,-RBLOCK,RBLOCK]
   08b3: SLDO 04          Short load global BASE4 (RBLOCK) [RBLOCK,I,A,0,1,-RBLOCK,RBLOCK]
   08b4: ADI              Add integers (TOS + TOS-1) [RBLOCK+I,A,0,1,-RBLOCK,RBLOCK]
   08b5: SLDC 01          Short load constant 1 [1,RBLOCK+I,A,0,1,-RBLOCK,RBLOCK]
   08b6: SBI              Subtract integers (TOS-1 - TOS) [RBLOCK+I-1,A,0,1,-RBLOCK,RBLOCK]
   08b7: SLDC 00          Short load constant 0 [0,RBLOCK+I-1,A,0,1,-RBLOCK,RBLOCK]
   08b8: CSP  0b          Call standard procedure 11 SCAN
   08ba: ADI              Add integers (TOS + TOS-1)
   08bb: SRO  04          Store global word BASE4 (RBLOCK)
          RBLOCK := (RBLOCK + 512 - 1) DIV 512
   08bd: SLDO 04          Short load global BASE4 (RBLOCK)
   08be: LDCI 0200        Load word 512
   08c1: ADI              Add integers (TOS + TOS-1)
   08c2: SLDC 01          Short load constant 1
   08c3: SBI              Subtract integers (TOS-1 - TOS)
   08c4: LDCI 0200        Load word 512
   08c7: DVI              Divide integers (TOS-1 / TOS)
   08c8: SRO  04          Store global word BASE4 (RBLOCK)
          FBLOCKIO := RBLOCK
   08ca: SLDO 04          Short load global BASE4 (RBLOCK)
   08cb: SRO  01          Store global word BASE1 (RETVAL)
          F_C.FEOF := RBLOCK < NBLOCKS
   08cd: SLDO 09          Short load global BASE9 (F_C)
   08ce: INCP 02          Inc field ptr (TOS+2) (FEOF)
   08d0: SLDO 04          Short load global BASE4 (RBLOCK)
   08d1: SLDO 05          Short load global BASE5 (NBLOCKS)
   08d2: LESI             Integer TOS-1 < TOS
   08d3: STO              Store indirect (TOS into TOS-1)
   08d4: UJP  $08d6       Unconditional jump
        END
-> 08d6: UJP  $08db       Unconditional jump
      END ELSE BEGIN
        FBLOCKIO := 0
-> 08d8: SLDC 00          Short load constant 0
   08d9: SRO  01          Store global word BASE1 (RETVAL)
-> 08db: UJP  $08e2       Unconditional jump
      END
    END
  END ELSE BEGIN
    SYSCOM.IORESULT := 13 { 'File not open' }
-> 08dd: LOD  01 0001     Load word at G1 (SYSCOM)
   08e0: SLDC 0d          Short load constant 13
   08e1: STO              Store indirect (TOS into TOS-1)
  END
-> 08e2: RBP  01          Return from base procedure
END

LL 0 entry 08f2 exit 0939 parms=2 words data=1 words
### PROCEDURE PASCALSY.FGOTOXY(X,Y:INTEGER) (29)
  BASE1=Y:INTEGER
  BASE2=X:INTEGER
  BASE3=CRTINFO
BEGIN
  CRTINFO := SYSCOM.CRTNFO
-> 08f2: LOD  01 0001     Load word at G1 (SYSCOM)
   08f5: INCP 25          Inc field ptr (TOS+37) (CRTNFO)
   08f7: SRO  03          Store global word BASE3 (CRTINFO)
  IF X < 0 THEN
   08f9: SLDO 02          Short load global BASE2 (X)
   08fa: SLDC 00          Short load constant 0
   08fb: LESI             Integer TOS-1 < TOS
   08fc: FJP  $0901       Jump if TOS false
    X := 0
   08fe: SLDC 00          Short load constant 0
   08ff: SRO  02          Store global word BASE2 (X)
  IF X > CRTINFO.WIDTH THEN
-> 0901: SLDO 02          Short load global BASE2 (X)
   0902: SLDO 03          Short load global BASE3 (CRTINFO)
   0903: SIND 01          Short index load *TOS+1 (WIDTH)
   0904: GRTI             Integer TOS-1 > TOS
   0905: FJP  $090b       Jump if TOS false
    X := CRTINFO.WIDTH
   0907: SLDO 03          Short load global BASE3 (CRTINFO)
   0908: SIND 01          Short index load *TOS+1 (WIDTH)
   0909: SRO  02          Store global word BASE2 (X)
  IF Y < 0 THEN
-> 090b: SLDO 01          Short load global BASE1 (Y)
   090c: SLDC 00          Short load constant 0
   090d: LESI             Integer TOS-1 < TOS
   090e: FJP  $0913       Jump if TOS false
    Y := 0
   0910: SLDC 00          Short load constant 0
   0911: SRO  01          Store global word BASE1 (Y)
  IF Y > CRTINFO.HEIGHT THEN
-> 0913: SLDO 01          Short load global BASE1 (Y)
   0914: SLDO 03          Short load global BASE3 (CRTINFO)
   0915: SIND 00          Short index load *TOS+0 (HEIGHT)
   0916: GRTI             Integer TOS-1 > TOS
   0917: FJP  $091d       Jump if TOS false
    Y := CRTINFO.HEIGHT
   0919: SLDO 03          Short load global BASE3 (CRTINFO)
   091a: SIND 00          Short index load *TOS+0 (HEIGHT)
   091b: SRO  01          Store global word BASE1 (Y)
  FWRITECHAR(OUTPUT,30,0)
-> 091d: LOD  01 0003     Load word at G3 (OUTPUT)
   0920: SLDC 1e          Short load constant 30 
   0921: SLDC 00          Short load constant 0
   0922: CXP  00 11       Call external procedure 17 in seg 0 FWRITECHAR
  FWRITECHAR(OUTPUT,X+32,0)
   0925: LOD  01 0003     Load word at G3 (OUTPUT)
   0928: SLDO 02          Short load global BASE2 (X)
   0929: SLDC 20          Short load constant 32 (' ')
   092a: ADI              Add integers (TOS + TOS-1)
   092b: SLDC 00          Short load constant 0
   092c: CXP  00 11       Call external procedure 17 in seg 0 FWRITECHAR
  FWRITECHAR(OUTPUT,Y+32,0)
   092f: LOD  01 0003     Load word at G3 (OUTPUT)
   0932: SLDO 01          Short load global BASE1 (Y)
   0933: SLDC 20          Short load constant 32 (' ')
   0934: ADI              Add integers (TOS + TOS-1)
   0935: SLDC 00          Short load constant 0
   0936: CXP  00 11       Call external procedure 17 in seg 0 FWRITECHAR
-> 0939: RBP  00          Return from base procedure
END

LL 0 entry 0946 exit 0951 parms=0 words data=0 words
### PROCEDURE PASCALSY.HOMECURSOR (30)
BEGIN
  PUTPREFIXED(4,SYSCOM.HOME)
-> 0946: SLDC 04          Short load constant 4
   0947: LOD  01 0001     Load word at G1 (SYSCOM)
   094a: INCP 1f          Inc field ptr (TOS+31)
   094c: SLDC 08          Short load constant 8
   094d: SLDC 08          Short load constant 8
   094e: LDP              Load packed field (TOS)
   094f: CBP  21          Call base procedure 33 (PUTPREFIXED)
-> 0951: RBP  00          Return from base procedure
END

LL 0 entry 095e exit 098b parms=0 words data=2 words
### PROCEDURE PASCALSY.CLEARSCREEN (31)
  BASE1=SYSCOM_C
  BASE2=CRTCTL_C
BEGIN
  HOMECURSOR
-> 095e: CBP  1e          Call base procedure 30 (HOMECURSOR)
  SYSCOM_C := SYSCOM
   0960: LOD  01 0001     Load word at G1 (SYSCOM)
   0963: SRO  01          Store global word BASE1 (SYSCOM_C)
  CRTCTL_C := SYSCOM_C.CRTCTL
   0965: SLDO 01          Short load global BASE1 (SYSCOM_C)
   0966: INCP 1f          Inc field ptr (TOS+31) (CRTCTL)
   0968: SRO  02          Store global word BASE2 (CRTCTL_C)
  UNITCLEAR(3)
   096a: SLDC 03          Short load constant 3
   096b: CSP  26          Call standard procedure 38 UNITCLEAR
  IF CRTCTL_C.ERASEEOS <> 0 THEN
   096d: SLDO 02          Short load global BASE2 (CRTCTL_C)
   096e: INCP 01          Inc field ptr (TOS+1)
   0970: SLDC 08          Short load constant 8
   0971: SLDC 00          Short load constant 0
   0972: LDP              Load packed field (TOS)
   0973: SLDC 00          Short load constant 0
   0974: NEQI             Integer TOS-1 <> TOS
   0975: FJP  $0982       Jump if TOS false
  BEGIN 
    PUTPREFIXED(3,CRTCTL_C.ERASEEOS)
   0977: SLDC 03          Short load constant 3
   0978: SLDO 02          Short load global BASE2 (CRTCTL_C)
   0979: INCP 01          Inc field ptr (TOS+1)
   097b: SLDC 08          Short load constant 8
   097c: SLDC 00          Short load constant 0
   097d: LDP              Load packed field (TOS)
   097e: CBP  21          Call base procedure 33
   0980: UJP  $098b       Unconditional jump
  END ELSE BEGIN
    PUTPREFIXED(6,CRTCTL_C.CLEARSCREEN)
-> 0982: SLDC 06          Short load constant 6
   0983: SLDO 02          Short load global BASE2 (CRTCTL_C)
   0984: INCP 04          Inc field ptr (TOS+4)
   0986: SLDC 08          Short load constant 8
   0987: SLDC 08          Short load constant 8
   0988: LDP              Load packed field (TOS)
   0989: CBP  21          Call base procedure 33
  END
-> 098b: RBP  00          Return from base procedure
END

LL 0 entry 0998 exit 09b0 parms=0 words data=2 words
### PROCEDURE PASCALSY.COMMAND (32)
  BASE2:BOOLEAN
BEGIN
  STATE := HALTINIT
-> 0998: SLDC 00          Short load constant 0
   0999: STR  01 0013     Store TOS to G19 (STATE)
  BASE2 := FALSE
   099c: SLDC 00          Short load constant 0
   099d: SRO  02          Store global word BASE2
  REPEAT
    PROC37
-> 099f: CLP  25          Call local procedure 37 (child)
    IF BASE2 THEN
   09a1: SLDO 02          Short load global BASE2
   09a2: FJP  $09a9       Jump if TOS false
    BEGIN
      USERPROGRAM(NIL,NIL)
   09a4: LDCN             Load constant NIL
   09a5: LDCN             Load constant NIL
   09a6: CXP  01 01       Call external procedure 1 in seg 1 USERPROGRAM
    END
  UNTIL STATE = HALTINIT
-> 09a9: LOD  01 0013     Load word at G19 (STATE)
   09ac: SLDC 00          Short load constant 0
   09ad: EQUI             Integer TOS-1 = TOS
   09ae: FJP  $099f       Jump if TOS false
-> 09b0: RBP  00          Return from base procedure
END

LL 0 entry 09be exit 09f6 parms=2 words data=1 words
### PROCEDURE PASCALSY.PUTPREFIXED(WHICH:INTEGER;COMMANDCHAR:CHAR) (33)
  BASE1=COMMANDCHAR:CHAR
  BASE2=WHICH:INTEGER
  BASE3=SYSCOM_C
BEGIN
  SYSCOM_C := SYSCOM
-> 09be: LOD  01 0001     Load word at G1 (SYSCOM)
   09c1: SRO  03          Store global word BASE3 (SYSCOM_C)
  IF COMMANDCHAR <> 0 THEN  
   09c3: SLDO 01          Short load global BASE1 (COMMANDCHAR)
   09c4: SLDC 00          Short load constant 0
   09c5: NEQI             Integer TOS-1 <> TOS
   09c6: FJP  $09f6       Jump if TOS false
  BEGIN
    IF SYSCOM_C.PREFIXED1[WHICH] THEN
   09c8: SLDO 03          Short load global BASE3 (SYSCOM_C)
   09c9: INCP 24          Inc field ptr (TOS+36) (PREFIXED1)
   09cb: SLDO 02          Short load global BASE2 (WHICH)
   09cc: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   09cf: LDP              Load packed field (TOS)
   09d0: FJP  $09df       Jump if TOS false
    BEGIN
      FWRITECHAR(OUTPUT,SYSCOM_C.ESCAPE,0)
   09d2: LOD  01 0003     Load word at G3 (OUTPUT)
   09d5: SLDO 03          Short load global BASE3 (SYSCOM_C)
   09d6: INCP 1f          Inc field ptr (TOS+31) (ESCAPE)
   09d8: SLDC 08          Short load constant 8
   09d9: SLDC 00          Short load constant 0
   09da: LDP              Load packed field (TOS)
   09db: SLDC 00          Short load constant 0
   09dc: CXP  00 11       Call external procedure 17 in seg 0 FWRITECHAR
    END
    FWRITECHAR(OUTPUT,COMMANDCHAR,0)
-> 09df: LOD  01 0003     Load word at G3 (OUTPUT)
   09e2: SLDO 01          Short load global BASE1 (COMMANDCHAR)
   09e3: SLDC 00          Short load constant 0
   09e4: CXP  00 11       Call external procedure 17 in seg 0 FWRITECHAR
    IF 11 > 0 THEN
   09e7: SLDC 0b          Short load constant 11
   09e8: SLDC 00          Short load constant 0
   09e9: GRTI             Integer TOS-1 > TOS
   09ea: FJP  $09f6       Jump if TOS false
      FWRITESTRING(OUTPUT,FILLER,0)
   09ec: LOD  01 0003     Load word at G3 (OUTPUT)
   09ef: LDA  01 0019     Load addr G25 (FILLER)
   09f2: SLDC 00          Short load constant 0
   09f3: CXP  00 13       Call external procedure 19 in seg 0 FWRITESTRING
  END 
-> 09f6: RBP  00          Return from base procedure
END

LL 0 entry 0a02 exit 0b2f parms=5 words data=13 words
### FUNCTION PASCALSY.CHECKDEL(CH:CHAR; SINX:INTEGER; PARAM3:STRING): BOOLEAN (34)
  BASE1=RETVAL
  BASE3=PARAM3:STRING
  BASE4=SINX:INTEGER
  BASE5=CH:CHAR
  BASE6:STRING[6]
  BASE10=SYSCOM_C
  BASE11=CRTCTL_C
  BASE12
BEGIN
  RETVAL := FALSE
-> 0a02: SLDC 00          Short load constant 0
   0a03: SRO  01          Store global word BASE1 (RETVAL)
  SYSCOM_C := SYSCOM
   0a05: LOD  01 0001     Load word at G1 (SYSCOM)
   0a08: SRO  0a          Store global word BASE10 (SYSCOM_C)
  CRTCTL_C := SYSCOM_C.CRTCTL
   0a0a: SLDO 0a          Short load global BASE10 (SYSCOM_C)
   0a0b: INCP 1f          Inc field ptr (TOS+31) (CRTCTL)
   0a0d: SRO  0b          Store global word BASE11 (CRTCTL_C)
  IF CH = SYSCOM.LINEDEL THEN
   0a0f: SLDO 05          Short load global BASE5 (CH)
   0a10: SLDO 0a          Short load global BASE10 (SYSCOM_C)
   0a11: INCP 2c          Inc field ptr (TOS+44) (LINEDEL)
   0a13: SLDC 08          Short load constant 8
   0a14: SLDC 00          Short load constant 0
   0a15: LDP              Load packed field (TOS)
   0a16: EQUI             Integer TOS-1 = TOS
   0a17: FJP  $0acc       Jump if TOS false
  BEGIN
    RETVAL := TRUE
   0a19: SLDC 01          Short load constant 1
   0a1a: SRO  01          Store global word BASE1 (RETVAL)
    IF CRTCTL_C.BACKSPACE = 0 OR SYSCOM_C.SLOWTERM THEN
   0a1c: SLDO 0b          Short load global BASE11 (CRTCTL_C)
   0a1d: INCP 03          Inc field ptr (TOS+3) (BACKSPACE)
   0a1f: SLDC 08          Short load constant 8
   0a20: SLDC 00          Short load constant 0
   0a21: LDP              Load packed field (TOS)
   0a22: SLDC 00          Short load constant 0
   0a23: EQUI             Integer TOS-1 = TOS
   0a24: SLDO 0a          Short load global BASE10 (SYSCOM_C)
   0a25: INCP 1d          Inc field ptr (TOS+29)
   0a27: SLDC 01          Short load constant 1
   0a28: SLDC 04          Short load constant 4
   0a29: LDP              Load packed field (TOS)
   0a2a: LOR              Logical OR (TOS | TOS-1)
   0a2b: FJP  $0a46       Jump if TOS false
    BEGIN
      SINX := 1
   0a2d: SLDO 04          Short load global BASE4 (SINX)
   0a2e: SLDC 01          Short load constant 1
   0a2f: STO              Store indirect (TOS into TOS-1)
      FWRITESTRING(OUTPUT,'<DEL',0)
   0a30: LOD  01 0003     Load word at G3 (OUTPUT)
   0a33: LSA  04          Load string address: '<DEL'
   0a39: NOP              No operation
   0a3a: SLDC 00          Short load constant 0
   0a3b: CXP  00 13       Call external procedure 19 in seg 0 FWRITESTRING
      FWRITELN(OUTPUT)
   0a3e: LOD  01 0003     Load word at G3 (OUTPUT)
   0a41: CXP  00 16       Call external procedure 22 in seg 0 FWRITELN
   0a44: UJP  $0aca       Unconditional jump
    END ELSE BEGIN
      BASE6 := '   '
-> 0a46: LAO  06          Load global BASE6
   0a48: NOP              No operation
   0a49: LSA  03          Load string address: '   '
   0a4e: SAS  06          String assign (TOS to TOS-1, 6 chars)
      IF CRTCTL_C.PREFIXED[5] THEN
   0a50: SLDO 0b          Short load global BASE11 (CRTCTL_C)
   0a51: INCP 05          Inc field ptr (TOS+5) (PREFIXED)
   0a53: SLDC 05          Short load constant 5
   0a54: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0a57: LDP              Load packed field (TOS)
   0a58: FJP  $0a64       Jump if TOS false
        BASE6[1] := CRTCTL.ESCAPE
   0a5a: LAO  06          Load global BASE6
   0a5c: SLDC 01          Short load constant 1
   0a5d: SLDO 0b          Short load global BASE11 (CRTCTL_C)
   0a5e: SLDC 08          Short load constant 8
   0a5f: SLDC 00          Short load constant 0
   0a60: LDP              Load packed field (TOS)
   0a61: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0a62: UJP  $0a69       Unconditional jump
      ELSE
        BASE6[1] := 0
-> 0a64: LAO  06          Load global BASE6
   0a66: SLDC 01          Short load constant 1
   0a67: SLDC 00          Short load constant 0
   0a68: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
      BASE6[2] := CRTCTL_C.BACKSPACE
-> 0a69: LAO  06          Load global BASE6
   0a6b: SLDC 02          Short load constant 2
   0a6c: SLDO 0b          Short load global BASE11 (CRTCTL_C)
   0a6d: INCP 03          Inc field ptr (TOS+3)
   0a6f: SLDC 08          Short load constant 8
   0a70: SLDC 00          Short load constant 0
   0a71: LDP              Load packed field (TOS)
   0a72: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
      
   0a73: LAO  06          Load global BASE6
      BASE12 := 0
   0a75: SLDC 00          Short load constant 0
   0a76: SRO  0c          Store global word BASE12
      SCONCAT(BASE12,BASE6,6)
   0a78: LAO  0c          Load global BASE12
   0a7a: LAO  06          Load global BASE6
   0a7c: SLDC 06          Short load constant 6
   0a7d: CXP  00 17       Call external procedure 23 in seg 0 SCONCAT
      SCONCAT(BASE12,BASE6,12)
   0a80: LAO  0c          Load global BASE12
   0a82: LAO  06          Load global BASE6
   0a84: SLDC 0c          Short load constant 12
   0a85: CXP  00 17       Call external procedure 23 in seg 0 SCONCAT
      BASE6 := BASE12
   0a88: LAO  0c          Load global BASE12
   0a8a: SAS  06          String assign (TOS to TOS-1, 6 chars)
      IF CRTCTL_C.ERASEEOL = 0 THEN
   0a8c: SLDO 0b          Short load global BASE11 (CRTCTL_C)
   0a8d: INCP 01          Inc field ptr (TOS+1)
   0a8f: SLDC 08          Short load constant 8
   0a90: SLDC 08          Short load constant 8
   0a91: LDP              Load packed field (TOS)
   0a92: SLDC 00          Short load constant 0
   0a93: EQUI             Integer TOS-1 = TOS
   0a94: FJP  $0a9d       Jump if TOS false
        BASE6[0] := 5
   0a96: LAO  06          Load global BASE6
   0a98: SLDC 00          Short load constant 0
   0a99: SLDC 05          Short load constant 5
   0a9a: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0a9b: UJP  $0aa2       Unconditional jump
      ELSE
        BASE6[0] := 2
-> 0a9d: LAO  06          Load global BASE6
   0a9f: SLDC 00          Short load constant 0
   0aa0: SLDC 02          Short load constant 2
   0aa1: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
      WHILE SINX > 1 DO
-> 0aa2: SLDO 04          Short load global BASE4 (SINX)
   0aa3: SIND 00          Short index load *TOS+0
   0aa4: SLDC 01          Short load constant 1
   0aa5: GRTI             Integer TOS-1 > TOS
   0aa6: FJP  $0ac1       Jump if TOS false
      BEGIN
        SINX := SINX - 1
   0aa8: SLDO 04          Short load global BASE4 (SINX)
   0aa9: SLDO 04          Short load global BASE4 (SINX)
   0aaa: SIND 00          Short index load *TOS+0
   0aab: SLDC 01          Short load constant 1
   0aac: SBI              Subtract integers (TOS-1 - TOS)
   0aad: STO              Store indirect (TOS into TOS-1)
        IF BASE3[SINX] >= ' ' THEN
   0aae: SLDO 03          Short load global BASE3
   0aaf: SLDO 04          Short load global BASE4 (SINX)
   0ab0: SIND 00          Short index load *TOS+0
   0ab1: LDB              Load byte at byte ptr TOS-1 + TOS
   0ab2: SLDC 20          Short load constant 32 (' ')
   0ab3: GEQI             Integer TOS-1 >= TOS
   0ab4: FJP  $0abf       Jump if TOS false
          FWRITESTRING(OUTPUT,BASE6,0)
   0ab6: LOD  01 0003     Load word at G3 (OUTPUT)
   0ab9: LAO  06          Load global BASE6
   0abb: SLDC 00          Short load constant 0
   0abc: CXP  00 13       Call external procedure 19 in seg 0 FWRITESTRING
-> 0abf: UJP  $0aa2       Unconditional jump
      END
      PUTPREFIXED(2,CRTCTL_C.ERASEEOL)
-> 0ac1: SLDC 02          Short load constant 2
   0ac2: SLDO 0b          Short load global BASE11 (CRTCTL_C)
   0ac3: INCP 01          Inc field ptr (TOS+1)
   0ac5: SLDC 08          Short load constant 8
   0ac6: SLDC 08          Short load constant 8
   0ac7: LDP              Load packed field (TOS)
   0ac8: CBP  21          Call base procedure 33  (PUTPREFIXED)
    END
-> 0aca: UJP  $0b2f       Unconditional jump
  END ELSE BEGIN
    IF CH = SYSCOM_C.CHARDEL THEN
-> 0acc: SLDO 05          Short load global BASE5 (CH)
   0acd: SLDO 0a          Short load global BASE10 (SYSCOM_C)
   0ace: INCP 2b          Inc field ptr (TOS+43)
   0ad0: SLDC 08          Short load constant 8
   0ad1: SLDC 00          Short load constant 0
   0ad2: LDP              Load packed field (TOS)
   0ad3: EQUI             Integer TOS-1 = TOS
   0ad4: FJP  $0b2f       Jump if TOS false
    BEGIN
      RETVAL := TRUE
   0ad6: SLDC 01          Short load constant 1
   0ad7: SRO  01          Store global word BASE1 (RETVAL)
      IF SINX > 1 THEN
   0ad9: SLDO 04          Short load global BASE4 (SINX)
   0ada: SIND 00          Short index load *TOS+0
   0adb: SLDC 01          Short load constant 1
   0adc: GRTI             Integer TOS-1 > TOS
   0add: FJP  $0b2f       Jump if TOS false
      BEGIN
        SINX := SINX - 1
   0adf: SLDO 04          Short load global BASE4 (SINX)
   0ae0: SLDO 04          Short load global BASE4 (SINX)
   0ae1: SIND 00          Short index load *TOS+0
   0ae2: SLDC 01          Short load constant 1
   0ae3: SBI              Subtract integers (TOS-1 - TOS)
   0ae4: STO              Store indirect (TOS into TOS-1)
        IF CRTCTL_C.BACKSPACE = 0 THEN
   0ae5: SLDO 0b          Short load global BASE11 (CRTCTL_C)
   0ae6: INCP 03          Inc field ptr (TOS+3)
   0ae8: SLDC 08          Short load constant 8
   0ae9: SLDC 00          Short load constant 0
   0aea: LDP              Load packed field (TOS)
   0aeb: SLDC 00          Short load constant 0
   0aec: EQUI             Integer TOS-1 = TOS
   0aed: FJP  $0b0d       Jump if TOS false
        BEGIN
          IF SYSCOM_C.CHARDEL < 32 THEN
   0aef: SLDO 0a          Short load global BASE10 (SYSCOM_C)
   0af0: INCP 2b          Inc field ptr (TOS+43)
   0af2: SLDC 08          Short load constant 8
   0af3: SLDC 00          Short load constant 0
   0af4: LDP              Load packed field (TOS)
   0af5: SLDC 20          Short load constant 32
   0af6: LESI             Integer TOS-1 < TOS
   0af7: FJP  $0b03       Jump if TOS false
            FWRITECHAR(OUTPUT,'_',0)
   0af9: LOD  01 0003     Load word at G3 (OUTPUT)
   0afc: SLDC 5f          Short load constant 95
   0afd: SLDC 00          Short load constant 0
   0afe: CXP  00 11       Call external procedure 17 in seg 0 FWRITECHAR
   0b01: UJP  $0b0b       Unconditional jump
          ELSE
            FWRITECHAR(OUTPUT,CH,0)
-> 0b03: LOD  01 0003     Load word at G3 (OUTPUT)
   0b06: SLDO 05          Short load global BASE5 (CH)
   0b07: SLDC 00          Short load constant 0
   0b08: CXP  00 11       Call external procedure 17 in seg 0 FWRITECHAR
-> 0b0b: UJP  $0b2f       Unconditional jump
        END ELSE BEGIN
          IF BASE3[SINX] >= 32 THEN
-> 0b0d: SLDO 03          Short load global BASE3
   0b0e: SLDO 04          Short load global BASE4 (SINX)
   0b0f: SIND 00          Short index load *TOS+0
   0b10: LDB              Load byte at byte ptr TOS-1 + TOS
   0b11: SLDC 20          Short load constant 32
   0b12: GEQI             Integer TOS-1 >= TOS
   0b13: FJP  $0b2f       Jump if TOS false
          BEGIN
            PUTPREFIXED(5,CRTCTL_C.BACKSPACE)
   0b15: SLDC 05          Short load constant 5
   0b16: SLDO 0b          Short load global BASE11 (CRTCTL_C)
   0b17: INCP 03          Inc field ptr (TOS+3)
   0b19: SLDC 08          Short load constant 8
   0b1a: SLDC 00          Short load constant 0
   0b1b: LDP              Load packed field (TOS)
   0b1c: CBP  21          Call base procedure 33  (PUTPREFIXED)
            FWRITECHAR(OUTPUT,' ',0)
   0b1e: LOD  01 0003     Load word at G3 (OUTPUT)
   0b21: SLDC 20          Short load constant 32
   0b22: SLDC 00          Short load constant 0
   0b23: CXP  00 11       Call external procedure 17 in seg 0 FWRITECHAR
            PUTPREFIXED(5,CRTCTL_C.BACKSPACE)
   0b26: SLDC 05          Short load constant 5
   0b27: SLDO 0b          Short load global BASE11 (CRTCTL_C)
   0b28: INCP 03          Inc field ptr (TOS+3)
   0b2a: SLDC 08          Short load constant 8
   0b2b: SLDC 00          Short load constant 0
   0b2c: LDP              Load packed field (TOS)
   0b2d: CBP  21          Call base procedure 33 (PUTPREFIXED)
          END
        END
      END
    END
  END
-> 0b2f: RBP  01          Return from base procedure
END

LL 0 entry 0b42 exit 0c2e parms=3 words data=8 words
### FUNCTION PASCALSY.CANTSTRETCH(VAR F:FIB):BOOLEAN (35)
  BASE1=RETVAL:BOOLEAN
  BASE3=F:FIB
  BASE4=I:INTEGER
  BASE5=OK:BOOLEAN
  BASE6=FOUND:BOOLEAN
  BASE7=LAVAILBLK:INTEGER
  BASE8=LDIR:DIRP
  BASE9=F_C:FIB
  BASE10=HEADER:DIRENTRY
  BASE11
BEGIN
  CANTSTRETCH := TRUE
-> 0b42: SLDC 01          Short load constant 1
   0b43: SRO  01          Store global word BASE1 (RETVAL)
  OK := FALSE
   0b45: SLDC 00          Short load constant 0
   0b46: SRO  05          Store global word BASE5 (OK)
  F_C := F
   0b48: SLDO 03          Short load global BASE3 (F)
   0b49: SRO  09          Store global word BASE9 (F_C)
  HEADER := F_C.FHEADER
   0b4b: SLDO 09          Short load global BASE9 (F_C)
   0b4c: INCP 10          Inc field ptr (TOS+16) (FHEADER)
   0b4e: SRO  0a          Store global word BASE10 (HEADER)
  IF HEADER.DTID[0] > 0 THEN
   0b50: SLDO 0a          Short load global BASE10 (HEADER)
   0b51: INCP 03          Inc field ptr (TOS+3)
   0b53: SLDC 00          Short load constant 0
   0b54: LDB              Load byte at byte ptr TOS-1 + TOS
   0b55: SLDC 00          Short load constant 0
   0b56: GRTI             Integer TOS-1 > TOS
   0b57: FJP  $0c20       Jump if TOS false
  BEGIN
    IF F_C.FUNIT <> VOLSEARCH(F_C.FVID,FALSE,LDIR) THEN BEGIN
   0b59: SLDO 09          Short load global BASE9 (F_C)
   0b5a: SIND 07          Short index load *TOS+7
   0b5b: SLDO 09          Short load global BASE9 (F_C)
   0b5c: INCP 08          Inc field ptr (TOS+8)
   0b5e: SLDC 00          Short load constant 0
   0b5f: LAO  08          Load global BASE8 (LDIR)
   0b61: SLDC 00          Short load constant 0
   0b62: SLDC 00          Short load constant 0
   0b63: CXP  02 06       Call external procedure 6 in seg 2 (SYSIO)(VOLSEARCH)
   0b66: NEQI             Integer TOS-1 <> TOS
   0b67: FJP  $0b70       Jump if TOS false
      SYSCOM.IORESULT := 5 { 'Volume went off-line' }
   0b69: LOD  01 0001     Load word at G1 (SYSCOM)
   0b6c: SLDC 05          Short load constant 5
   0b6d: STO              Store indirect (TOS into TOS-1)
      GOTO 1
   0b6e: UJP  $0c20       Unconditional jump
    END
    FOUND := FALSE
-> 0b70: SLDC 00          Short load constant 0
   0b71: SRO  06          Store global word BASE6 (FOUND)
    I := 1
   0b73: SLDC 01          Short load constant 1
   0b74: SRO  04          Store global word BASE4 (I)
    WHILE I <= LDIR[0].DNUMFILES AND NOT FOUND DO
-> 0b76: SLDO 04          Short load global BASE4 (I)
   0b77: SLDO 08          Short load global BASE8 (LDIR)
   0b78: SLDC 00          Short load constant 0
   0b79: IXA  0d          Index array (TOS-1 + TOS * 13)
   0b7b: IND  08          Static index and load word (TOS+8)
   0b7d: LEQI             Integer TOS-1 <= TOS
   0b7e: SLDO 06          Short load global BASE6 (FOUND)
   0b7f: LNOT             Logical NOT (~TOS)
   0b80: LAND             Logical AND (TOS & TOS-1)
   0b81: FJP  $0b9d       Jump if TOS false
    BEGIN
      FOUND := (LDIR[I].DFIRSTBLK = HEADER.DFIRSTBLK) AND (LDIR[I].DLASTBLK = HEADER.DLASTBLK)
   0b83: SLDO 08          Short load global BASE8 (LDIR)
   0b84: SLDO 04          Short load global BASE4 (I)
   0b85: IXA  0d          Index array (TOS-1 + TOS * 13)
   0b87: SIND 00          Short index load *TOS+0
   0b88: SLDO 0a          Short load global BASE10 (HEADER)
   0b89: SIND 00          Short index load *TOS+0
   0b8a: EQUI             Integer TOS-1 = TOS
   0b8b: SLDO 08          Short load global BASE8 (LDIR)
   0b8c: SLDO 04          Short load global BASE4 (I)
   0b8d: IXA  0d          Index array (TOS-1 + TOS * 13)
   0b8f: SIND 01          Short index load *TOS+1
   0b90: SLDO 0a          Short load global BASE10 (HEADER)
   0b91: SIND 01          Short index load *TOS+1
   0b92: EQUI             Integer TOS-1 = TOS
   0b93: LAND             Logical AND (TOS & TOS-1)
   0b94: SRO  06          Store global word BASE6 (FOUND)
      I := I + 1
   0b96: SLDO 04          Short load global BASE4 (I)
   0b97: SLDC 01          Short load constant 1
   0b98: ADI              Add integers (TOS + TOS-1)
   0b99: SRO  04          Store global word BASE4 (I)
   0b9b: UJP  $0b76       Unconditional jump
    END
    IF NOT FOUND THEN BEGIN
-> 0b9d: SLDO 06          Short load global BASE6 (FOUND)
   0b9e: LNOT             Logical NOT (~TOS)
   0b9f: FJP  $0ba8       Jump if TOS false
      SYSCOM.IORESULT := 6 { 'File lost in directory' }
   0ba1: LOD  01 0001     Load word at G1 (SYSCOM)
   0ba4: SLDC 06          Short load constant 6
   0ba5: STO              Store indirect (TOS into TOS-1)
      GOTO 1
   0ba6: UJP  $0c20       Unconditional jump
    END
    IF I > LDIR[0].DNUMFILES THE
-> 0ba8: SLDO 04          Short load global BASE4 (I)
   0ba9: SLDO 08          Short load global BASE8 (LDIR)
   0baa: SLDC 00          Short load constant 0
   0bab: IXA  0d          Index array (TOS-1 + TOS * 13)
   0bad: IND  08          Static index and load word (TOS+8)
   0baf: GRTI             Integer TOS-1 > TOS
   0bb0: FJP  $0bbb       Jump if TOS false
    BEGIN
      LAVAILBLK := LDIR[0].DEOVBLK
   0bb2: SLDO 08          Short load global BASE8 (LDIR)
   0bb3: SLDC 00          Short load constant 0
   0bb4: IXA  0d          Index array (TOS-1 + TOS * 13)
   0bb6: SIND 07          Short index load *TOS+7
   0bb7: SRO  07          Store global word BASE7 (LAVAILBLK)
   0bb9: UJP  $0bc2       Unconditional jump
    END ELSE BEGIN
      LAVAILBLK := LDIR[I].DFIRSTBLK
-> 0bbb: SLDO 08          Short load global BASE8 (LDIR)
   0bbc: SLDO 04          Short load global BASE4 (I)
   0bbd: IXA  0d          Index array (TOS-1 + TOS * 13)
   0bbf: SIND 00          Short index load *TOS+0
   0bc0: SRO  07          Store global word BASE7 (LAVAILBLK)
    END
    IF HEADER.DLASTBLK < LAVAILBLK OR HEADER.DLASTBYTE < 512 THEN
-> 0bc2: SLDO 0a          Short load global BASE10 (HEADER)
   0bc3: SIND 01          Short index load *TOS+1
   0bc4: SLDO 07          Short load global BASE7 (LAVAILBLK)
   0bc5: LESI             Integer TOS-1 < TOS
   0bc6: SLDO 0a          Short load global BASE10 (HEADER)
   0bc7: IND  0b          Static index and load word (TOS+11)
   0bc9: LDCI 0200        Load word 512
   0bcc: LESI             Integer TOS-1 < TOS
   0bcd: LOR              Logical OR (TOS | TOS-1)
   0bce: FJP  $0c1d       Jump if TOS false
    BEGIN
      BASE11 := LDIR[I-1]
   0bd0: SLDO 08          Short load global BASE8 (LDIR)
   0bd1: SLDO 04          Short load global BASE4 (I)
   0bd2: SLDC 01          Short load constant 1
   0bd3: SBI              Subtract integers (TOS-1 - TOS)
   0bd4: IXA  0d          Index array (TOS-1 + TOS * 13)
   0bd6: SRO  0b          Store global word BASE11
      BASE11.DLASTBLK := LAVAILBLK
   0bd8: SLDO 0b          Short load global BASE11
   0bd9: INCP 01          Inc field ptr (TOS+1)
   0bdb: SLDO 07          Short load global BASE7 (LAVAILBLK)
   0bdc: STO              Store indirect (TOS into TOS-1)
      BASE11.DLASTBYTE := 512
   0bdd: SLDO 0b          Short load global BASE11
   0bde: INCP 0b          Inc field ptr (TOS+11)
   0be0: LDCI 0200        Load word 512
   0be3: STO              Store indirect (TOS into TOS-1)
      WRITEDIR(F_C.FUNIT,LDIR)
   0be4: SLDO 09          Short load global BASE9 (F_C)
   0be5: SIND 07          Short index load *TOS+7
   0be6: SLDO 08          Short load global BASE8 (LDIR)
   0be7: CXP  02 0a       Call external procedure 10 in seg 2 (SYSIO) (WRITEDIR)
      IF IORESULT <> 0 THEN
   0bea: CSP  22          Call standard procedure 34 IORESULT
   0bec: SLDC 00          Short load constant 0
   0bed: NEQI             Integer TOS-1 <> TOS
   0bee: FJP  $0bf2       Jump if TOS false
        GOTO 1
   0bf0: UJP  $0c20       Unconditional jump
      F_C.FEOF := FALSE
-> 0bf2: SLDO 09          Short load global BASE9 (F_C)
   0bf3: INCP 02          Inc field ptr (TOS+2)
   0bf5: SLDC 00          Short load constant 0
   0bf6: STO              Store indirect (TOS into TOS-1)
      F_C.FEOLN := FALSE
   0bf7: SLDO 09          Short load global BASE9 (F_C)
   0bf8: INCP 01          Inc field ptr (TOS+1)
   0bfa: SLDC 00          Short load constant 0
   0bfb: STO              Store indirect (TOS into TOS-1)
      IF F_C.STATE <> FJANDW THEN
   0bfc: SLDO 09          Short load global BASE9 (F_C)
   0bfd: SIND 03          Short index load *TOS+3
   0bfe: SLDC 00          Short load constant 0
   0bff: NEQI             Integer TOS-1 <> TOS
   0c00: FJP  $0c07       Jump if TOS false
        F_C.STATE := FNEEDCHAR
   0c02: SLDO 09          Short load global BASE9 (F_C)
   0c03: INCP 03          Inc field ptr (TOS+3)
   0c05: SLDC 01          Short load constant 1
   0c06: STO              Store indirect (TOS into TOS-1)
      HEADER.DLASTBLK := LAVAILBLK
-> 0c07: SLDO 0a          Short load global BASE10 (HEADER)
   0c08: INCP 01          Inc field ptr (TOS+1)
   0c0a: SLDO 07          Short load global BASE7 (LAVAILBLK)
   0c0b: STO              Store indirect (TOS into TOS-1)
      HEADER.DLASTBYTE := 512
   0c0c: SLDO 0a          Short load global BASE10 (HEADER)
   0c0d: INCP 0b          Inc field ptr (TOS+11)
   0c0f: LDCI 0200        Load word 512
   0c12: STO              Store indirect (TOS into TOS-1)
      HEADER.DACCESS.YEAR := 100
   0c13: SLDO 0a          Short load global BASE10 (HEADER)
   0c14: INCP 0c          Inc field ptr (TOS+12)
   0c16: SLDC 07          Short load constant 7
   0c17: SLDC 09          Short load constant 9
   0c18: SLDC 64          Short load constant 100
   0c19: STP              Store packed field (TOS into TOS-1)
      CANTSTRETCH := FALSE
   0c1a: SLDC 00          Short load constant 0
   0c1b: SRO  01          Store global word BASE1 (RETVAL)
    END
    OK := TRUE
-> 0c1d: SLDC 01          Short load constant 1
   0c1e: SRO  05          Store global word BASE5 (OK)
  END
  1:
  IF NOT OK THEN
-> 0c20: SLDO 05          Short load global BASE5 (OK)
   0c21: LNOT             Logical NOT (~TOS)
   0c22: FJP  $0c2e       Jump if TOS false
  BEGIN
    F.FEOF := TRUE
   0c24: SLDO 03          Short load global BASE3 (F)
   0c25: INCP 02          Inc field ptr (TOS+2)
   0c27: SLDC 01          Short load constant 1
   0c28: STO              Store indirect (TOS into TOS-1)
    F.FEOLN := TRUE
   0c29: SLDO 03          Short load global BASE3 (F)
   0c2a: INCP 01          Inc field ptr (TOS+1)
   0c2c: SLDC 01          Short load constant 1
   0c2d: STO              Store indirect (TOS into TOS-1)
  END
-> 0c2e: RBP  01          Return from base procedure
END

LL 1 entry 0000 exit 0058 parms=6 words data=2 words
###  PROCEDURE PASCALSY.BLOCKIOREADWRITE(UNIT:UNITNUM;A:WINDOW;I,NBLOCKS,RBLOCK:INTEGER;DOREAD:BOOLEAN) (36)
    MP1=DOREAD:BOOLEAN
    MP2=RBLOCK:INTEGER
    MP3=NBLOCKS:INTEGER
    MP4=I:INTEGER
    MP5=A:WINDOW
    MP6=UNIT:UNITNUM
    MP7=BYTES:INTEGER
    MP8=BLOCKSDOING:INTEGER
  BEGIN
    IF NBLOCKS > 63 THEN
-> 0000: SLDL 03          Short load local MP3 (NBLOCKS)
   0001: SLDC 3f          Short load constant 63
   0002: GRTI             Integer TOS-1 > TOS
   0003: FJP  $000a       Jump if TOS false
      BLOCKSDOING := 63
   0005: SLDC 3f          Short load constant 63
   0006: STL  0008        Store TOS into MP8 (BLOCKSDOING)
   0008: UJP  $000d       Unconditional jump
    ELSE
      BLOCKSDOING := NBLOCKS
-> 000a: SLDL 03          Short load local MP3 (NBLOCKS)
   000b: STL  0008        Store TOS into MP8 (BLOCKSDOING)
    BYTES := BLOCKSDOING * 512
-> 000d: SLDL 08          Short load local MP8 (BLOCKSDOING)
   000e: LDCI 0200        Load word 512
   0011: MPI              Multiply integers (TOS * TOS-1)
   0012: STL  0007        Store TOS into MP7 (BYTES)
    WHILE NBLOCKS <> 0 DO
-> 0014: SLDL 03          Short load local MP3 (NBLOCKS)
   0015: SLDC 00          Short load constant 0
   0016: NEQI             Integer TOS-1 <> TOS
   0017: FJP  $0058       Jump if TOS false
    BEGIN
      IF DOREAD THEN
   0019: SLDL 01          Short load local MP1 (DOREAD)
   001a: FJP  $0026       Jump if TOS false
        UNITREAD(UNIT,A,I,BYTES,RBLOCK,FALSE)
   001c: SLDL 06          Short load local MP6 (UNIT)
   001d: SLDL 05          Short load local MP5 (A)
   001e: SLDL 04          Short load local MP4 (I)
   001f: SLDL 07          Short load local MP7 (BYTES)
   0020: SLDL 02          Short load local MP2 (RBLOCK)
   0021: SLDC 00          Short load constant 0
   0022: CSP  05          Call standard procedure 5 UNITREAD
   0024: UJP  $002e       Unconditional jump
      ELSE
        UNITWRITE(UNIT,A,I,BYTES,RBLOCK,FALSE)
-> 0026: SLDL 06          Short load local MP6 (UNIT)
   0027: SLDL 05          Short load local MP5 (A)
   0028: SLDL 04          Short load local MP4 (I)
   0029: SLDL 07          Short load local MP7 (BYTES)
   002a: SLDL 02          Short load local MP2 (RBLOCK)
   002b: SLDC 00          Short load constant 0
   002c: CSP  06          Call standard procedure 6 UNITWRITE
      IF IORESULT <> 0 THEN
-> 002e: CSP  22          Call standard procedure 34 IORESULT
   0030: SLDC 00          Short load constant 0
   0031: NEQI             Integer TOS-1 <> TOS
   0032: FJP  $0038       Jump if TOS false
        EXIT(PASCALSY,BLOCKIOREADWRITE)
   0034: SLDC 00          Short load constant 0
   0035: SLDC 24          Short load constant 36
   0036: CSP  04          Call standard procedure 4 EXIT
      NBLOCKS := NBLOCKS - BLOCKSDOING
-> 0038: SLDL 03          Short load local MP3 (NBLOCKS)
   0039: SLDL 08          Short load local MP8 (BLOCKSDOING)
   003a: SBI              Subtract integers (TOS-1 - TOS)
   003b: STL  0003        Store TOS into MP3 (NBLOCKS)
      I := I + BYTES
   003d: SLDL 04          Short load local MP4 (I)
   003e: SLDL 07          Short load local MP7 (BYTES)
   003f: ADI              Add integers (TOS + TOS-1)
   0040: STL  0004        Store TOS into MP4 (I)
      RBLOCK := RBLOCK + BLOCKSDOING
   0042: SLDL 02          Short load local MP2 (RBLOCK)
   0043: SLDL 08          Short load local MP8 (BLOCKSDOING)
   0044: ADI              Add integers (TOS + TOS-1)
   0045: STL  0002        Store TOS into MP2 (RBLOCK)
      IF NBLOCKS < BLOCKSDOING THEN
   0047: SLDL 03          Short load local MP3 (NBLOCKS)
   0048: SLDL 08          Short load local MP8 (BLOCKSDOING)
   0049: LESI             Integer TOS-1 < TOS
   004a: FJP  $0056       Jump if TOS false
      BEGIN
        BLOCKSDOING := NBLOCKS
   004c: SLDL 03          Short load local MP3 (NBLOCKS)
   004d: STL  0008        Store TOS into MP8 (BLOCKSDOING)
        BYTES := BLOCKSDOING * 512
   004f: SLDL 08          Short load local MP8 (BLOCKSDOING)
   0050: LDCI 0200        Load word 512
   0053: MPI              Multiply integers (TOS * TOS-1)
   0054: STL  0007        Store TOS into MP7 (BYTES)
      END
-> 0056: UJP  $0014       Unconditional jump
    END
-> 0058: RNP  00          Return from nonbase procedure
  END

LL 1 entry 0066 exit 011c parms=0 words data=0 words
###  PROCEDURE PASCALSY.PROC37 (37)
    BASE2{from COMMAND}
  BEGIN
    GOTO 1
-> 0066: UJP  $0121       Unconditional jump
    2:
    REPEAT
      IF NOT COMMAND.BASE2 THEN
-> 0068: SLDO 02          Short load global BASE2
   0069: LNOT             Logical NOT (~TOS)
   006a: FJP  $00ce       Jump if TOS false
      BEGIN
        RELEASE(EMPTYHEAP)
   006c: LDA  02 0005     Load addr G5 (EMPTYHEAP)
   006f: CSP  21          Call standard procedure 33 RELEASE
        IF UNITABLE[SYSCOM.SYSUNIT] <> SYVID THEN
   0071: LDA  02 001f     Load addr G31 (UNITABLE)
   0074: LOD  02 0001     Load word at G1 (SYSCOM)
   0077: SIND 02          Short index load *TOS+2
   0078: IXA  06          Index array (TOS-1 + TOS * 6)
   007a: LDA  02 000e     Load addr G14 (SYVID)
   007d: NEQSTR           String TOS-1 <> TOS
   007f: FJP  $008c       Jump if TOS false
        BEGIN
          IF SYSIO.FETCHDIR(SYSCOM.SYSUNIT) THEN ;
   0081: LOD  02 0001     Load word at G1 (SYSCOM)
   0084: SIND 02          Short index load *TOS+2
   0085: SLDC 00          Short load constant 0
   0086: SLDC 00          Short load constant 0
   0087: CXP  02 09       Call external procedure 9 in seg 2 (SYSIO) (FETCHDIR)
   008a: FJP  $008c       Jump if TOS false
        END
        IF UNITABLE[SYSCOM.SYSUNIT] <> SYVID THEN
-> 008c: LDA  02 001f     Load addr G31 (UNITABLE)
   008f: LOD  02 0001     Load word at G1 (SYSCOM)
   0092: SIND 02          Short index load *TOS+2
   0093: IXA  06          Index array (TOS-1 + TOS * 6)
   0095: LDA  02 000e     Load addr G14 (SYVID)
   0098: NEQSTR           String TOS-1 <> TOS
   009a: FJP  $009f       Jump if TOS false
        BEGIN
          EXECERROR(12) { 'original disk not in boot drive' }
   009c: SLDC 0c          Short load constant 12
   009d: CBP  02          Call base procedure 2 EXECERROR
        END
        STATE := GETCMD(STATE)
-> 009f: LOD  02 0013     Load word at G19 (STATE)
   00a2: SLDC 00          Short load constant 0
   00a3: SLDC 00          Short load constant 0
   00a4: CXP  05 01       Call external procedure 1 in seg 5 GETCMD
   00a7: STR  02 0013     Store TOS to G19 (STATE)
        GLOBALTITLE := ''
   00aa: LDA  02 007f     Load addr G127 (GLOBALTITLE)
   00ad: LSA  00          Load string address: ''
   00af: NOP              No operation
   00b0: SAS  17          String assign (TOS to TOS-1, 23 chars)
        IF STATE <> HALTINIT THEN
   00b2: LOD  02 0013     Load word at G19 (STATE)
   00b5: SLDC 00          Short load constant 0
   00b6: NEQI             Integer TOS-1 <> TOS
   00b7: FJP  $00ce       Jump if TOS false
        BEGIN
          IF NOT FILEHANDLEROVERLAY THEN
   00b9: LOD  02 00b4     Load word at G180 (FILEHANDLEROVERLAY)
   00bd: LNOT             Logical NOT (~TOS)
   00be: FJP  $00c7       Jump if TOS false
          BEGIN
            USERPROGRAM(NIL,NIL)
   00c0: LDCN             Load constant NIL
   00c1: LDCN             Load constant NIL
   00c2: CXP  01 01       Call external procedure 1 in seg 1 USERPROGRAM
   00c5: UJP  $00ce       Unconditional jump
          END ELSE BEGIN
            COMMAND.BASE2 := TRUE
-> 00c7: SLDC 01          Short load constant 1
   00c8: SRO  02          Store global word BASE2
            EXIT(PASCALSY,PROC37)
   00ca: SLDC 00          Short load constant 0
   00cb: SLDC 25          Short load constant 37
   00cc: CSP  04          Call standard procedure 4 EXIT
          END
        END
      END
      IF STATE <> HALTINIT THEN
-> 00ce: LOD  02 0013     Load word at G19 (STATE)
   00d1: SLDC 00          Short load constant 0
   00d2: NEQI             Integer TOS-1 <> TOS
   00d3: FJP  $00e6       Jump if TOS false
      BEGIN
        COMMAND.BASE2 := FALSE
   00d5: SLDC 00          Short load constant 0
   00d6: SRO  02          Store global word BASE2
        UNITCLEAR(3)
   00d8: SLDC 03          Short load constant 3
   00d9: CSP  26          Call standard procedure 38 UNITCLEAR
        SYSIO.FETCHDIR(SYSCOM.SYSUNIT)
   00db: LOD  02 0001     Load word at G1 (SYSCOM)
   00de: SIND 02          Short index load *TOS+2 (SYSUNIT)
   00df: SLDC 00          Short load constant 0
   00e0: SLDC 00          Short load constant 0
   00e1: CXP  02 09       Call external procedure 9 in seg 2 (SYSIO) (FETCHDIR)
   00e4: FJP  $00e6       Jump if TOS false
      END
      IF STATE = 1 OR STATE = 2 THEN
-> 00e6: LOD  02 0013     Load word at G19 (STATE)
   00e9: SLDC 01          Short load constant 1
   00ea: EQUI             Integer TOS-1 = TOS
   00eb: LOD  02 0013     Load word at G19 (STATE)
   00ee: SLDC 02          Short load constant 2
   00ef: EQUI             Integer TOS-1 = TOS
   00f0: LOR              Logical OR (TOS | TOS-1)
   00f1: FJP  $0109       Jump if TOS false
      BEGIN
        SYSIO.FCLOSE(GFILES[0],0)
   00f3: LDA  02 0002     Load addr G2 (GFILES)
   00f6: SLDC 00          Short load constant 0
   00f7: IXA  01          Index array (TOS-1 + TOS * 1)
   00f9: SIND 00          Short index load *TOS+0
   00fa: SLDC 00          Short load constant 0
   00fb: CXP  02 05       Call external procedure 5 in seg 2 (SYSIO) (FCLOSE)
        SYSIO.FCLOSE(GFILES[1],1)
   00fe: LDA  02 0002     Load addr G2 (GFILES)
   0101: SLDC 01          Short load constant 1
   0102: IXA  01          Index array (TOS-1 + TOS * 1)
   0104: SIND 00          Short index load *TOS+0
   0105: SLDC 01          Short load constant 1
   0106: CXP  02 05       Call external procedure 5 in seg 2 (SYSIO) (FCLOSE)
      END
      IF UNITBUSY(1) OR UNITBUSY(2) THEN
-> 0109: SLDC 01          Short load constant 1
   010a: CSP  23          Call standard procedure 35 UNITBUSY
   010c: SLDC 02          Short load constant 2
   010d: CSP  23          Call standard procedure 35 UNITBUSY
   010f: LOR              Logical OR (TOS | TOS-1)
   0110: FJP  $0115       Jump if TOS false
      BEGIN
        UNITCLEAR(1)
   0112: SLDC 01          Short load constant 1
   0113: CSP  26          Call standard procedure 38 UNITCLEAR
      END
    UNTIL STATE = HALTINIT 
-> 0115: LOD  02 0013     Load word at G19 (STATE)
   0118: SLDC 00          Short load constant 0
   0119: EQUI             Integer TOS-1 = TOS
   011a: FJP  $0068       Jump if TOS false
    UNLOADSEGMENT(2)
-> 011c: SLDC 02          Short load constant 2
   011d: CSP  16          Call standard procedure 22 UNLOADSEGMENT
    GOTO 3
   011f: UJP  $0126       Unconditional jump
  1:
  LOADSEGMENT(2)
-> 0121: SLDC 02          Short load constant 2
   0122: CSP  15          Call standard procedure 21 LOADSEGMENT
  GOTO 2
   0124: UJP  $0068       Unconditional jump
  3:
-> 0126: RNP  00          Return from nonbase procedure
  END

## USERPROG (1) segment
Processing segment 1 named 'USERPROG' containing 1 procedures/functions...

LL 0 entry 0000 exit 0004 parms=2 words data=0 words
### PROCEDURE USERPROG.USERPROG(PARAM1; PARAM2) (1)
BEGIN
  EXECERROR(9) { 'system internal inconsistency' }
-> 0000: SLDC 09          Short load constant 9
   0001: CXP  00 02       Call external procedure 2 in seg 0 EXECERROR
-> 0004: RBP  00          Return from base procedure
END

## SYSIO (2) segment
Processing segment 2 named 'SYSIO' containing 15 procedures/functions...

{ 
  SYSIO procedures:
  PROCEDURE SYSIO #1
  PROCEDURE FINIT(VAR F: FIB; WINDOW: WINDOWP; RECWORDS: INTEGER) #2
  PROCEDURE FRESET(VAR F:FIB) #3
  PROCEDURE FOPEN(VAR F: FIB; VAR FTITLE: STRING; FOPENOLD: BOOLEAN; JUNK: FIBP) #4
  PROCEDURE FCLOSE(VAR F: FIB; FTYPE: CLOSETYPE) #5
  FUNCTION VOLSEARCH(VAR FVID:VID;LOOKHARD:BOOLEAN;VAR FDIR:DIRP):BOOLEAN #6
  PROCEDURE INSENTRY(VAR FENTRY:DIRENTRY; FINX:DIRRANGE; FDIR:DIRP) #7
  PROCEDURE DELENTRY(FINX:DIRRANGE;FDIR:DIRP) #8
  FUNCTION FETCHDIR(UNIT:UNITNUM): BOOLEAN #9
  PROCEDURE WRITEDIR(FUNIT:UNITNUM;FDIR:DIRP) #10
  FUNCTION SCANTITLE(FTITLE:STRING;VAR FVID:VID;VAR FTID:TID;VAR FSEGS:INTEGER;VAR FKIND:FILEKIND):BOOLEAN #11
  FUNCTION DIRSEARCH(VAR FTID:TID;FINDPERM:BOOLEAN;FDIR:DIRP):DIRRANGE #12
  PROCEDURE RESETER(VAR F:FIB) #13
    FUNCTION ENTERTEMP(VAR FTID:TID;FSEGS:INTEGER;FKIND:FILEKIND;FDIR:DIRP):DIRRANGE #14
      PROCEDURE FINDMAX(CURINX:DIRRANGE;FIRSTOPEN,NEXTUSED:INTEGER) #15

LL 1 entry 0de4 exit 0de4 parms=0 words data=0 words
###  PROCEDURE SYSIO.SYSIO (1)
  BEGIN
-> 0de4: RNP  00          Return from nonbase procedure
  END

LL 1 entry 06a0 exit 06f0 parms=3 words data=1 words
###  PROCEDURE SYSIO.FINIT(VAR F: FIB; WINDOW: WINDOWP; RECWORDS: INTEGER) (2)
    MP1=RECWORDS:INTEGER
    MP2=WINDOW:WINDOWP
    MP3=F:FIB
    MP4
  BEGIN
-> 06a0: SLDL 03          Short load local MP3
   06a1: STL  0004        Store TOS into MP4
   06a3: SLDL 04          Short load local MP4
   06a4: INCP 03          Inc field ptr (TOS+3)
   06a6: SLDC 00          Short load constant 0
   06a7: STO              Store indirect (TOS into TOS-1)
   06a8: SLDL 04          Short load local MP4
   06a9: INCP 05          Inc field ptr (TOS+5)
   06ab: SLDC 00          Short load constant 0
   06ac: STO              Store indirect (TOS into TOS-1)
   06ad: SLDL 04          Short load local MP4
   06ae: INCP 02          Inc field ptr (TOS+2)
   06b0: SLDC 01          Short load constant 1
   06b1: STO              Store indirect (TOS into TOS-1)
   06b2: SLDL 04          Short load local MP4
   06b3: INCP 01          Inc field ptr (TOS+1)
   06b5: SLDC 01          Short load constant 1
   06b6: STO              Store indirect (TOS into TOS-1)
   06b7: SLDL 04          Short load local MP4
   06b8: SLDL 02          Short load local MP2
   06b9: STO              Store indirect (TOS into TOS-1)
   06ba: SLDL 01          Short load local MP1 (RECWORDS)
   06bb: SLDC 00          Short load constant 0
   06bc: EQUI             Integer TOS-1 = TOS
   06bd: SLDL 01          Short load local MP1 (RECWORDS)
   06be: SLDC 02          Short load constant 2
   06bf: NGI              Negate integer
   06c0: EQUI             Integer TOS-1 = TOS
   06c1: LOR              Logical OR (TOS | TOS-1)
   06c2: FJP  $06da       Jump if TOS false
   06c4: SLDL 04          Short load local MP4
   06c5: SIND 00          Short index load *TOS+0
   06c6: SLDC 01          Short load constant 1
   06c7: SLDC 00          Short load constant 0
   06c8: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   06c9: SLDL 04          Short load local MP4
   06ca: INCP 04          Inc field ptr (TOS+4)
   06cc: SLDC 01          Short load constant 1
   06cd: STO              Store indirect (TOS into TOS-1)
   06ce: SLDL 01          Short load local MP1 (RECWORDS)
   06cf: SLDC 00          Short load constant 0
   06d0: EQUI             Integer TOS-1 = TOS
   06d1: FJP  $06d8       Jump if TOS false
   06d3: SLDL 04          Short load local MP4
   06d4: INCP 03          Inc field ptr (TOS+3)
   06d6: SLDC 01          Short load constant 1
   06d7: STO              Store indirect (TOS into TOS-1)
-> 06d8: UJP  $06f0       Unconditional jump
-> 06da: SLDL 01          Short load local MP1 (RECWORDS)
   06db: SLDC 00          Short load constant 0
   06dc: LESI             Integer TOS-1 < TOS
   06dd: FJP  $06e9       Jump if TOS false
   06df: SLDL 04          Short load local MP4
   06e0: LDCN             Load constant NIL
   06e1: STO              Store indirect (TOS into TOS-1)
   06e2: SLDL 04          Short load local MP4
   06e3: INCP 04          Inc field ptr (TOS+4)
   06e5: SLDC 00          Short load constant 0
   06e6: STO              Store indirect (TOS into TOS-1)
   06e7: UJP  $06f0       Unconditional jump
-> 06e9: SLDL 04          Short load local MP4
   06ea: INCP 04          Inc field ptr (TOS+4)
   06ec: SLDL 01          Short load local MP1 (RECWORDS)
   06ed: SLDL 01          Short load local MP1 (RECWORDS)
   06ee: ADI              Add integers (TOS + TOS-1)
   06ef: STO              Store indirect (TOS into TOS-1)
-> 06f0: RNP  00          Return from nonbase procedure
  END

LL 1 entry 07ee exit 0814 parms=1 words data=1 words
###  PROCEDURE SYSIO.FRESET(VAR F:FIB) (3)
    MP1=F:FIB
    MP2=F_C:FIB
  BEGIN
-> 07ee: LOD  02 0001     Load word at G1 (SYSCOM)
   07f1: SLDC 00          Short load constant 0
   07f2: STO              Store indirect (TOS into TOS-1)
   07f3: SLDL 01          Short load local MP1 (F)
   07f4: STL  0002        Store TOS into MP2 (F_C)
   07f6: SLDL 02          Short load local MP2 (F_C)
   07f7: SIND 05          Short index load *TOS+5
   07f8: FJP  $0814       Jump if TOS false
   07fa: SLDL 01          Short load local MP1 (F)
   07fb: CGP  0d          Call global procedure 13 (lexLevel 1, curr seg) (RESETER)
   07fd: SLDL 02          Short load local MP2 (F_C)
   07fe: SIND 04          Short index load *TOS+4
   07ff: SLDC 00          Short load constant 0
   0800: GRTI             Integer TOS-1 > TOS
   0801: FJP  $0814       Jump if TOS false
   0803: SLDL 02          Short load local MP2 (F_C)
   0804: SIND 03          Short index load *TOS+3
   0805: SLDC 00          Short load constant 0
   0806: EQUI             Integer TOS-1 = TOS
   0807: FJP  $080f       Jump if TOS false
   0809: SLDL 01          Short load local MP1 (F)
   080a: CXP  06 02       Call external procedure 2 in seg 6 (FIOPRIMS) FGET
   080d: UJP  $0814       Unconditional jump
-> 080f: SLDL 02          Short load local MP2 (F_C)
   0810: INCP 03          Inc field ptr (TOS+3)
   0812: SLDC 01          Short load constant 1
   0813: STO              Store indirect (TOS into TOS-1)
-> 0814: RNP  00          Return from nonbase procedure
  END

LL 1 entry 095a exit 0c28 parms=4 words data=25 words
###  PROCEDURE SYSIO.FOPEN(VAR F: FIB; VAR FTITLE: STRING; FOPENOLD: BOOLEAN; JUNK: FIBP) (4)
    MP1=JUNK:FIBP
    MP2=FOPENOLD:BOOLEAN
    MP3=FTITLE:STRING
    MP4=F:FIB
    MP5=
    MP6
    MP7
    MP8
    MP9
    MP10
    MP11
    MP12
    MP13
    MP14
    MP18
    MP26
    MP27
    MP28
    MP29
  BEGIN
-> 095a: LOD  02 0001     Load word at G1 (SYSCOM)
   095d: SLDC 00          Short load constant 0
   095e: STO              Store indirect (TOS into TOS-1)
   095f: SLDL 04          Short load local MP4
   0960: STL  001a        Store TOS into MP26
   0962: LDL  001a        Load local word MP26
   0964: SIND 05          Short index load *TOS+5
   0965: FJP  $096e       Jump if TOS false
   0967: LOD  02 0001     Load word at G1 (SYSCOM)
   096a: SLDC 0c          Short load constant 12
   096b: STO              Store indirect (TOS into TOS-1)
   096c: UJP  $0c28       Unconditional jump
-> 096e: SLDL 03          Short load local MP3
   096f: LLA  000e        Load local address MP14
   0971: LLA  0012        Load local address MP18
   0973: LLA  0009        Load local address MP9
   0975: LLA  000a        Load local address MP10
   0977: SLDC 00          Short load constant 0
   0978: SLDC 00          Short load constant 0
   0979: CGP  0b          Call global procedure 11 (lexLevel 1, curr seg) (SCANTITLE)
   097b: FJP  $0c23       Jump if TOS false
   097d: SLDL 02          Short load local MP2
   097e: SLDC 01          Short load constant 1
   097f: GRTI             Integer TOS-1 > TOS
   0980: FJP  $098b       Jump if TOS false
   0982: SLDL 02          Short load local MP2
   0983: SLDC 02          Short load constant 2
   0984: EQUI             Integer TOS-1 = TOS
   0985: SLDL 02          Short load local MP2
   0986: SLDC 04          Short load constant 4
   0987: EQUI             Integer TOS-1 = TOS
   0988: LOR              Logical OR (TOS | TOS-1)
   0989: STL  0002        Store TOS into MP2
-> 098b: SLDC 00          Short load constant 0
   098c: STL  000c        Store TOS into MP12
   098e: LOD  02 0006     Load word at G6 (SWAPFIB)
   0991: STL  001b        Store TOS into MP27
   0993: LDL  001b        Load local word MP27
   0995: SIND 05          Short index load *TOS+5
   0996: LOD  02 0001     Load word at G1 (SYSCOM)
   0999: SIND 04          Short index load *TOS+4
   099a: LDCN             Load constant NIL
   099b: EQUI             Integer TOS-1 = TOS
   099c: LAND             Logical AND (TOS & TOS-1)
   099d: FJP  $09f4       Jump if TOS false
   099f: LLA  000b        Load local address MP11
   09a1: CSP  20          Call standard procedure 32 MARK
   09a3: LOD  02 0001     Load word at G1 (SYSCOM)
   09a6: SIND 07          Short index load *TOS+7
   09a7: SLDL 0b          Short load local MP11
   09a8: SBI              Subtract integers (TOS-1 - TOS)
   09a9: STL  0008        Store TOS into MP8
   09ab: SLDL 08          Short load local MP8
   09ac: SLDC 00          Short load constant 0
   09ad: GRTI             Integer TOS-1 > TOS
   09ae: SLDL 08          Short load local MP8
   09af: LDCI 07ec        Load word 2028
   09b2: LDCI 0190        Load word 400
   09b5: ADI              Add integers (TOS + TOS-1)
   09b6: LESI             Integer TOS-1 < TOS
   09b7: LAND             Logical AND (TOS & TOS-1)
   09b8: FJP  $09f4       Jump if TOS false
   09ba: SLDL 0b          Short load local MP11
   09bb: LOD  02 0005     Load word at G5 (EMPTYHEAP)
   09be: SBI              Subtract integers (TOS-1 - TOS)
   09bf: STL  0008        Store TOS into MP8
   09c1: SLDL 08          Short load local MP8
   09c2: SLDC 00          Short load constant 0
   09c3: GRTI             Integer TOS-1 > TOS
   09c4: SLDL 08          Short load local MP8
   09c5: LDCI 07ec        Load word 2028
   09c8: GRTI             Integer TOS-1 > TOS
   09c9: LAND             Logical AND (TOS & TOS-1)
   09ca: LDA  02 001f     Load addr G31 (UNITABLE)
   09cd: LDL  001b        Load local word MP27
   09cf: SIND 07          Short index load *TOS+7
   09d0: IXA  06          Index array (TOS-1 + TOS * 6)
   09d2: LDL  001b        Load local word MP27
   09d4: INCP 08          Inc field ptr (TOS+8)
   09d6: EQLSTR           String TOS-1 = TOS
   09d8: LAND             Logical AND (TOS & TOS-1)
   09d9: FJP  $09f4       Jump if TOS false
   09db: LDL  001b        Load local word MP27
   09dd: SIND 07          Short index load *TOS+7
   09de: LOD  02 0005     Load word at G5 (EMPTYHEAP)
   09e1: SLDC 00          Short load constant 0
   09e2: LDCI 07ec        Load word 2028
   09e5: LDL  001b        Load local word MP27
   09e7: IND  10          Static index and load word (TOS+16)
   09e9: SLDC 00          Short load constant 0
   09ea: CSP  06          Call standard procedure 6 UNITWRITE
   09ec: LDA  02 0005     Load addr G5 (EMPTYHEAP)
   09ef: CSP  21          Call standard procedure 33 RELEASE
   09f1: SLDC 01          Short load constant 1
   09f2: STL  000c        Store TOS into MP12
-> 09f4: LLA  000e        Load local address MP14
   09f6: SLDC 01          Short load constant 1
   09f7: LLA  0005        Load local address MP5
   09f9: SLDC 00          Short load constant 0
   09fa: SLDC 00          Short load constant 0
   09fb: CGP  06          Call global procedure 6 (lexLevel 1, curr seg) (VOLSEARCH)
   09fd: STL  0006        Store TOS into MP6
   09ff: SLDL 06          Short load local MP6
   0a00: SLDC 00          Short load constant 0
   0a01: EQUI             Integer TOS-1 = TOS
   0a02: FJP  $0a0b       Jump if TOS false
   0a04: LOD  02 0001     Load word at G1 (SYSCOM)
   0a07: SLDC 09          Short load constant 9
   0a08: STO              Store indirect (TOS into TOS-1)
   0a09: UJP  $0bf5       Unconditional jump
-> 0a0b: LDA  02 001f     Load addr G31 (UNITABLE)
   0a0e: SLDL 06          Short load local MP6
   0a0f: IXA  06          Index array (TOS-1 + TOS * 6)
   0a11: STL  001b        Store TOS into MP27
   0a13: LDL  001a        Load local word MP26
   0a15: INCP 05          Inc field ptr (TOS+5)
   0a17: SLDC 01          Short load constant 1
   0a18: STO              Store indirect (TOS into TOS-1)
   0a19: LDL  001a        Load local word MP26
   0a1b: INCP 0f          Inc field ptr (TOS+15)
   0a1d: SLDC 00          Short load constant 0
   0a1e: STO              Store indirect (TOS into TOS-1)
   0a1f: LDL  001a        Load local word MP26
   0a21: INCP 07          Inc field ptr (TOS+7)
   0a23: SLDL 06          Short load local MP6
   0a24: STO              Store indirect (TOS into TOS-1)
   0a25: LDL  001a        Load local word MP26
   0a27: INCP 08          Inc field ptr (TOS+8)
   0a29: LLA  000e        Load local address MP14
   0a2b: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0a2d: LDL  001a        Load local word MP26
   0a2f: INCP 0d          Inc field ptr (TOS+13)
   0a31: SLDC 00          Short load constant 0
   0a32: STO              Store indirect (TOS into TOS-1)
   0a33: LDL  001a        Load local word MP26
   0a35: INCP 06          Inc field ptr (TOS+6)
   0a37: LDL  001b        Load local word MP27
   0a39: SIND 04          Short index load *TOS+4
   0a3a: STO              Store indirect (TOS into TOS-1)
   0a3b: LDL  001a        Load local word MP26
   0a3d: INCP 1d          Inc field ptr (TOS+29)
   0a3f: LDL  001b        Load local word MP27
   0a41: SIND 04          Short index load *TOS+4
   0a42: LDL  001a        Load local word MP26
   0a44: SIND 04          Short index load *TOS+4
   0a45: SLDC 00          Short load constant 0
   0a46: NEQI             Integer TOS-1 <> TOS
   0a47: LAND             Logical AND (TOS & TOS-1)
   0a48: STO              Store indirect (TOS into TOS-1)
   0a49: SLDL 05          Short load local MP5
   0a4a: LDCN             Load constant NIL
   0a4b: NEQI             Integer TOS-1 <> TOS
   0a4c: LLA  0012        Load local address MP18
   0a4e: SLDC 00          Short load constant 0
   0a4f: LDB              Load byte at byte ptr TOS-1 + TOS
   0a50: SLDC 00          Short load constant 0
   0a51: GRTI             Integer TOS-1 > TOS
   0a52: LAND             Logical AND (TOS & TOS-1)
   0a53: FJP  $0af3       Jump if TOS false
   0a55: LLA  0012        Load local address MP18
   0a57: SLDL 02          Short load local MP2
   0a58: SLDL 05          Short load local MP5
   0a59: SLDC 00          Short load constant 0
   0a5a: SLDC 00          Short load constant 0
   0a5b: CGP  0c          Call global procedure 12 (lexLevel 1, curr seg) (DIRSEARCH)
   0a5d: STL  0007        Store TOS into MP7
   0a5f: SLDL 02          Short load local MP2
   0a60: FJP  $0a7c       Jump if TOS false
   0a62: SLDL 07          Short load local MP7
   0a63: SLDC 00          Short load constant 0
   0a64: EQUI             Integer TOS-1 = TOS
   0a65: FJP  $0a70       Jump if TOS false
   0a67: LOD  02 0001     Load word at G1 (SYSCOM)
   0a6a: SLDC 0a          Short load constant 10
   0a6b: STO              Store indirect (TOS into TOS-1)
   0a6c: UJP  $0bdb       Unconditional jump
   0a6e: UJP  $0a7a       Unconditional jump
-> 0a70: LDL  001a        Load local word MP26
   0a72: INCP 10          Inc field ptr (TOS+16)
   0a74: SLDL 05          Short load local MP5
   0a75: SLDL 07          Short load local MP7
   0a76: IXA  0d          Index array (TOS-1 + TOS * 13)
   0a78: MOV  0d          Move 13 words (TOS to TOS-1)
-> 0a7a: UJP  $0af1       Unconditional jump
-> 0a7c: SLDL 07          Short load local MP7
   0a7d: SLDC 00          Short load constant 0
   0a7e: GRTI             Integer TOS-1 > TOS
   0a7f: FJP  $0a8a       Jump if TOS false
   0a81: LOD  02 0001     Load word at G1 (SYSCOM)
   0a84: SLDC 0b          Short load constant 11
   0a85: STO              Store indirect (TOS into TOS-1)
   0a86: UJP  $0bdb       Unconditional jump
   0a88: UJP  $0af1       Unconditional jump
-> 0a8a: SLDL 0a          Short load local MP10
   0a8b: SLDC 00          Short load constant 0
   0a8c: EQUI             Integer TOS-1 = TOS
   0a8d: FJP  $0a92       Jump if TOS false
   0a8f: SLDC 05          Short load constant 5
   0a90: STL  000a        Store TOS into MP10
-> 0a92: LLA  0012        Load local address MP18
   0a94: SLDL 09          Short load local MP9
   0a95: SLDL 0a          Short load local MP10
   0a96: SLDL 05          Short load local MP5
   0a97: SLDC 00          Short load constant 0
   0a98: SLDC 00          Short load constant 0
   0a99: CLP  0e          Call local procedure 14 (child) (ENTERTEMP)
   0a9b: STL  0007        Store TOS into MP7
   0a9d: SLDL 07          Short load local MP7
   0a9e: SLDC 00          Short load constant 0
   0a9f: GRTI             Integer TOS-1 > TOS
   0aa0: SLDL 0a          Short load local MP10
   0aa1: SLDC 03          Short load constant 3
   0aa2: EQUI             Integer TOS-1 = TOS
   0aa3: LAND             Logical AND (TOS & TOS-1)
   0aa4: FJP  $0ad1       Jump if TOS false
   0aa6: SLDL 05          Short load local MP5
   0aa7: SLDL 07          Short load local MP7
   0aa8: IXA  0d          Index array (TOS-1 + TOS * 13)
   0aaa: STL  001c        Store TOS into MP28
   0aac: LDL  001c        Load local word MP28
   0aae: SIND 01          Short index load *TOS+1
   0aaf: LDL  001c        Load local word MP28
   0ab1: SIND 00          Short index load *TOS+0
   0ab2: SBI              Subtract integers (TOS-1 - TOS)
   0ab3: FJP  $0abf       Jump if TOS false
   0ab5: LDL  001c        Load local word MP28
   0ab7: INCP 01          Inc field ptr (TOS+1)
   0ab9: LDL  001c        Load local word MP28
   0abb: SIND 01          Short index load *TOS+1
   0abc: SLDC 01          Short load constant 1
   0abd: SBI              Subtract integers (TOS-1 - TOS)
   0abe: STO              Store indirect (TOS into TOS-1)
-> 0abf: LDL  001c        Load local word MP28
   0ac1: SIND 01          Short index load *TOS+1
   0ac2: LDL  001c        Load local word MP28
   0ac4: SIND 00          Short index load *TOS+0
   0ac5: SBI              Subtract integers (TOS-1 - TOS)
   0ac6: SLDC 04          Short load constant 4
   0ac7: LESI             Integer TOS-1 < TOS
   0ac8: FJP  $0ad1       Jump if TOS false
   0aca: SLDL 07          Short load local MP7
   0acb: SLDL 05          Short load local MP5
   0acc: CGP  08          Call global procedure 8 (lexLevel 1, curr seg) DELENTRY
   0ace: SLDC 00          Short load constant 0
   0acf: STL  0007        Store TOS into MP7
-> 0ad1: SLDL 07          Short load local MP7
   0ad2: SLDC 00          Short load constant 0
   0ad3: EQUI             Integer TOS-1 = TOS
   0ad4: FJP  $0add       Jump if TOS false
   0ad6: LOD  02 0001     Load word at G1 (SYSCOM)
   0ad9: SLDC 08          Short load constant 8
   0ada: STO              Store indirect (TOS into TOS-1)
   0adb: UJP  $0bdb       Unconditional jump
-> 0add: LDL  001a        Load local word MP26
   0adf: INCP 10          Inc field ptr (TOS+16)
   0ae1: SLDL 05          Short load local MP5
   0ae2: SLDL 07          Short load local MP7
   0ae3: IXA  0d          Index array (TOS-1 + TOS * 13)
   0ae5: MOV  0d          Move 13 words (TOS to TOS-1)
   0ae7: LDL  001a        Load local word MP26
   0ae9: INCP 0f          Inc field ptr (TOS+15)
   0aeb: SLDC 01          Short load constant 1
   0aec: STO              Store indirect (TOS into TOS-1)
   0aed: SLDL 06          Short load local MP6
   0aee: SLDL 05          Short load local MP5
   0aef: CGP  0a          Call global procedure 10 (lexLevel 1, curr seg) WRITEDIR
-> 0af1: UJP  $0b43       Unconditional jump
-> 0af3: LDL  001a        Load local word MP26
   0af5: INCP 10          Inc field ptr (TOS+16)
   0af7: STL  001c        Store TOS into MP28
   0af9: LDL  001c        Load local word MP28
   0afb: SLDC 00          Short load constant 0
   0afc: STO              Store indirect (TOS into TOS-1)
   0afd: LDL  001c        Load local word MP28
   0aff: INCP 01          Inc field ptr (TOS+1)
   0b01: LDCI 7fff        Load word 32767
   0b04: STO              Store indirect (TOS into TOS-1)
   0b05: LDL  001b        Load local word MP27
   0b07: SIND 04          Short index load *TOS+4
   0b08: FJP  $0b12       Jump if TOS false
   0b0a: LDL  001c        Load local word MP28
   0b0c: INCP 01          Inc field ptr (TOS+1)
   0b0e: LDL  001b        Load local word MP27
   0b10: SIND 05          Short index load *TOS+5
   0b11: STO              Store indirect (TOS into TOS-1)
-> 0b12: LDL  001c        Load local word MP28
   0b14: INCP 02          Inc field ptr (TOS+2)
   0b16: SLDC 04          Short load constant 4
   0b17: SLDC 00          Short load constant 0
   0b18: SLDL 0a          Short load local MP10
   0b19: STP              Store packed field (TOS into TOS-1)
   0b1a: LDL  001c        Load local word MP28
   0b1c: INCP 03          Inc field ptr (TOS+3)
   0b1e: NOP              No operation
   0b1f: LSA  00          Load string address: ''
   0b21: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0b23: LDL  001c        Load local word MP28
   0b25: INCP 0b          Inc field ptr (TOS+11)
   0b27: LDCI 0200        Load word 512
   0b2a: STO              Store indirect (TOS into TOS-1)
   0b2b: LDL  001c        Load local word MP28
   0b2d: INCP 0c          Inc field ptr (TOS+12)
   0b2f: STL  001d        Store TOS into MP29
   0b31: LDL  001d        Load local word MP29
   0b33: SLDC 04          Short load constant 4
   0b34: SLDC 00          Short load constant 0
   0b35: SLDC 00          Short load constant 0
   0b36: STP              Store packed field (TOS into TOS-1)
   0b37: LDL  001d        Load local word MP29
   0b39: SLDC 05          Short load constant 5
   0b3a: SLDC 04          Short load constant 4
   0b3b: SLDC 00          Short load constant 0
   0b3c: STP              Store packed field (TOS into TOS-1)
   0b3d: LDL  001d        Load local word MP29
   0b3f: SLDC 07          Short load constant 7
   0b40: SLDC 09          Short load constant 9
   0b41: SLDC 00          Short load constant 0
   0b42: STP              Store packed field (TOS into TOS-1)
-> 0b43: SLDL 02          Short load local MP2
   0b44: FJP  $0b56       Jump if TOS false
   0b46: LDL  001a        Load local word MP26
   0b48: INCP 0c          Inc field ptr (TOS+12)
   0b4a: LDL  001a        Load local word MP26
   0b4c: IND  11          Static index and load word (TOS+17)
   0b4e: LDL  001a        Load local word MP26
   0b50: IND  10          Static index and load word (TOS+16)
   0b52: SBI              Subtract integers (TOS-1 - TOS)
   0b53: STO              Store indirect (TOS into TOS-1)
   0b54: UJP  $0b5c       Unconditional jump
-> 0b56: LDL  001a        Load local word MP26
   0b58: INCP 0c          Inc field ptr (TOS+12)
   0b5a: SLDC 00          Short load constant 0
   0b5b: STO              Store indirect (TOS into TOS-1)
-> 0b5c: LDL  001a        Load local word MP26
   0b5e: IND  1d          Static index and load word (TOS+29)
   0b60: FJP  $0bd0       Jump if TOS false
   0b62: LDL  001a        Load local word MP26
   0b64: INCP 1f          Inc field ptr (TOS+31)
   0b66: LDCI 0200        Load word 512
   0b69: STO              Store indirect (TOS into TOS-1)
   0b6a: LDL  001a        Load local word MP26
   0b6c: INCP 20          Inc field ptr (TOS+32)
   0b6e: SLDC 00          Short load constant 0
   0b6f: STO              Store indirect (TOS into TOS-1)
   0b70: SLDL 02          Short load local MP2
   0b71: FJP  $0b7e       Jump if TOS false
   0b73: LDL  001a        Load local word MP26
   0b75: INCP 1e          Inc field ptr (TOS+30)
   0b77: LDL  001a        Load local word MP26
   0b79: IND  1b          Static index and load word (TOS+27)
   0b7b: STO              Store indirect (TOS into TOS-1)
   0b7c: UJP  $0b86       Unconditional jump
-> 0b7e: LDL  001a        Load local word MP26
   0b80: INCP 1e          Inc field ptr (TOS+30)
   0b82: LDCI 0200        Load word 512
   0b85: STO              Store indirect (TOS into TOS-1)
-> 0b86: LDL  001a        Load local word MP26
   0b88: INCP 10          Inc field ptr (TOS+16)
   0b8a: STL  001c        Store TOS into MP28
   0b8c: LDL  001c        Load local word MP28
   0b8e: INCP 02          Inc field ptr (TOS+2)
   0b90: SLDC 04          Short load constant 4
   0b91: SLDC 00          Short load constant 0
   0b92: LDP              Load packed field (TOS)
   0b93: SLDC 03          Short load constant 3
   0b94: EQUI             Integer TOS-1 = TOS
   0b95: FJP  $0bd0       Jump if TOS false
   0b97: LDL  001a        Load local word MP26
   0b99: INCP 0d          Inc field ptr (TOS+13)
   0b9b: SLDC 02          Short load constant 2
   0b9c: STO              Store indirect (TOS into TOS-1)
   0b9d: SLDL 02          Short load local MP2
   0b9e: LNOT             Logical NOT (~TOS)
   0b9f: FJP  $0bd0       Jump if TOS false
   0ba1: LDL  001a        Load local word MP26
   0ba3: INCP 21          Inc field ptr (TOS+33)
   0ba5: SLDC 00          Short load constant 0
   0ba6: LDCI 0202        Load word 514
   0ba9: SLDC 00          Short load constant 0
   0baa: CSP  0a          Call standard procedure 10 FLCH
   0bac: LDL  001a        Load local word MP26
   0bae: SIND 07          Short index load *TOS+7
   0baf: LDL  001a        Load local word MP26
   0bb1: INCP 21          Inc field ptr (TOS+33)
   0bb3: SLDC 00          Short load constant 0
   0bb4: LDCI 0200        Load word 512
   0bb7: LDL  001c        Load local word MP28
   0bb9: SIND 00          Short index load *TOS+0
   0bba: SLDC 00          Short load constant 0
   0bbb: CSP  06          Call standard procedure 6 UNITWRITE
   0bbd: LDL  001a        Load local word MP26
   0bbf: SIND 07          Short index load *TOS+7
   0bc0: LDL  001a        Load local word MP26
   0bc2: INCP 21          Inc field ptr (TOS+33)
   0bc4: SLDC 00          Short load constant 0
   0bc5: LDCI 0200        Load word 512
   0bc8: LDL  001c        Load local word MP28
   0bca: SIND 00          Short index load *TOS+0
   0bcb: SLDC 01          Short load constant 1
   0bcc: ADI              Add integers (TOS + TOS-1)
   0bcd: SLDC 00          Short load constant 0
   0bce: CSP  06          Call standard procedure 6 UNITWRITE
-> 0bd0: SLDL 02          Short load local MP2
   0bd1: FJP  $0bd8       Jump if TOS false
   0bd3: SLDL 04          Short load local MP4
   0bd4: CGP  03          Call global procedure 3 (lexLevel 1, curr seg) (FRESET)
   0bd6: UJP  $0bdb       Unconditional jump
-> 0bd8: SLDL 04          Short load local MP4
   0bd9: CGP  0d          Call global procedure 13 (lexLevel 1, curr seg) (RESETER)
-> 0bdb: LOD  02 0001     Load word at G1 (SYSCOM)
   0bde: SIND 00          Short index load *TOS+0
   0bdf: SLDC 00          Short load constant 0
   0be0: NEQI             Integer TOS-1 <> TOS
   0be1: FJP  $0bf5       Jump if TOS false
   0be3: LDL  001a        Load local word MP26
   0be5: INCP 05          Inc field ptr (TOS+5)
   0be7: SLDC 00          Short load constant 0
   0be8: STO              Store indirect (TOS into TOS-1)
   0be9: LDL  001a        Load local word MP26
   0beb: INCP 02          Inc field ptr (TOS+2)
   0bed: SLDC 01          Short load constant 1
   0bee: STO              Store indirect (TOS into TOS-1)
   0bef: LDL  001a        Load local word MP26
   0bf1: INCP 01          Inc field ptr (TOS+1)
   0bf3: SLDC 01          Short load constant 1
   0bf4: STO              Store indirect (TOS into TOS-1)
-> 0bf5: SLDL 0c          Short load local MP12
   0bf6: FJP  $0c21       Jump if TOS false
   0bf8: LLA  000b        Load local address MP11
   0bfa: CSP  21          Call standard procedure 33 RELEASE
   0bfc: LOD  02 0001     Load word at G1 (SYSCOM)
   0bff: INCP 04          Inc field ptr (TOS+4)
   0c01: LDCN             Load constant NIL
   0c02: STO              Store indirect (TOS into TOS-1)
   0c03: LOD  02 0001     Load word at G1 (SYSCOM)
   0c06: SIND 00          Short index load *TOS+0
   0c07: STL  000d        Store TOS into MP13
   0c09: LOD  02 0006     Load word at G6 (SWAPFIB)
   0c0c: SIND 07          Short index load *TOS+7
   0c0d: LOD  02 0005     Load word at G5 (EMPTYHEAP)
   0c10: SLDC 00          Short load constant 0
   0c11: LDCI 07ec        Load word 2028
   0c14: LOD  02 0006     Load word at G6 (SWAPFIB)
   0c17: IND  10          Static index and load word (TOS+16)
   0c19: SLDC 00          Short load constant 0
   0c1a: CSP  05          Call standard procedure 5 UNITREAD
   0c1c: LOD  02 0001     Load word at G1 (SYSCOM)
   0c1f: SLDL 0d          Short load local MP13
   0c20: STO              Store indirect (TOS into TOS-1)
-> 0c21: UJP  $0c28       Unconditional jump
-> 0c23: LOD  02 0001     Load word at G1 (SYSCOM)
   0c26: SLDC 07          Short load constant 7
   0c27: STO              Store indirect (TOS into TOS-1)
-> 0c28: RNP  00          Return from nonbase procedure
  END

LL 1 entry 0c3e exit 0dca parms=2 words data=6 words
###  PROCEDURE SYSIO.FCLOSE(VAR F: FIB; FTYPE: CLOSETYPE) (5)
    MP1=FTYPE:CLOSETYPE
    MP2=F:FIB
    MP3
    MP4
    MP5
    MP6
    MP7
    MP8
  BEGIN
-> 0c3e: LOD  02 0001     Load word at G1 (SYSCOM)
   0c41: SLDC 00          Short load constant 0
   0c42: STO              Store indirect (TOS into TOS-1)
   0c43: SLDL 02          Short load local MP2
   0c44: STL  0007        Store TOS into MP7
   0c46: SLDL 07          Short load local MP7
   0c47: SIND 05          Short index load *TOS+5
   0c48: SLDL 07          Short load local MP7
   0c49: SIND 00          Short index load *TOS+0
   0c4a: LOD  02 0007     Load word at G7 (SYSTERMFIB)
   0c4d: SIND 00          Short index load *TOS+0
   0c4e: NEQI             Integer TOS-1 <> TOS
   0c4f: LAND             Logical AND (TOS & TOS-1)
   0c50: FJP  $0dca       Jump if TOS false
   0c52: SLDL 07          Short load local MP7
   0c53: SIND 06          Short index load *TOS+6
   0c54: FJP  $0da1       Jump if TOS false
   0c56: SLDL 07          Short load local MP7
   0c57: INCP 10          Inc field ptr (TOS+16)
   0c59: STL  0008        Store TOS into MP8
   0c5b: SLDL 08          Short load local MP8
   0c5c: INCP 03          Inc field ptr (TOS+3)
   0c5e: SLDC 00          Short load constant 0
   0c5f: LDB              Load byte at byte ptr TOS-1 + TOS
   0c60: SLDC 00          Short load constant 0
   0c61: GRTI             Integer TOS-1 > TOS
   0c62: FJP  $0da1       Jump if TOS false
   0c64: SLDL 01          Short load local MP1
   0c65: SLDC 03          Short load constant 3
   0c66: EQUI             Integer TOS-1 = TOS
   0c67: FJP  $0c86       Jump if TOS false
   0c69: SLDL 07          Short load local MP7
   0c6a: INCP 0c          Inc field ptr (TOS+12)
   0c6c: SLDL 07          Short load local MP7
   0c6d: IND  0d          Static index and load word (TOS+13)
   0c6f: STO              Store indirect (TOS into TOS-1)
   0c70: SLDL 08          Short load local MP8
   0c71: INCP 0c          Inc field ptr (TOS+12)
   0c73: SLDC 07          Short load constant 7
   0c74: SLDC 09          Short load constant 9
   0c75: SLDC 64          Short load constant 100
   0c76: STP              Store packed field (TOS into TOS-1)
   0c77: SLDC 01          Short load constant 1
   0c78: STL  0001        Store TOS into MP1
   0c7a: SLDL 07          Short load local MP7
   0c7b: IND  1d          Static index and load word (TOS+29)
   0c7d: FJP  $0c86       Jump if TOS false
   0c7f: SLDL 07          Short load local MP7
   0c80: INCP 1e          Inc field ptr (TOS+30)
   0c82: SLDL 07          Short load local MP7
   0c83: IND  1f          Static index and load word (TOS+31)
   0c85: STO              Store indirect (TOS into TOS-1)
-> 0c86: SLDL 02          Short load local MP2
   0c87: CGP  0d          Call global procedure 13 (lexLevel 1, curr seg) 
   0c89: SLDL 07          Short load local MP7
   0c8a: IND  0f          Static index and load word (TOS+15)
   0c8c: SLDL 08          Short load local MP8
   0c8d: INCP 0c          Inc field ptr (TOS+12)
   0c8f: SLDC 07          Short load constant 7
   0c90: SLDC 09          Short load constant 9
   0c91: LDP              Load packed field (TOS)
   0c92: SLDC 64          Short load constant 100
   0c93: EQUI             Integer TOS-1 = TOS
   0c94: LOR              Logical OR (TOS | TOS-1)
   0c95: SLDL 01          Short load local MP1
   0c96: SLDC 02          Short load constant 2
   0c97: EQUI             Integer TOS-1 = TOS
   0c98: LOR              Logical OR (TOS | TOS-1)
   0c99: FJP  $0da1       Jump if TOS false
   0c9b: SLDL 07          Short load local MP7
   0c9c: SIND 07          Short index load *TOS+7
   0c9d: SLDL 07          Short load local MP7
   0c9e: INCP 08          Inc field ptr (TOS+8)
   0ca0: SLDC 00          Short load constant 0
   0ca1: LLA  0005        Load local address MP5
   0ca3: SLDC 00          Short load constant 0
   0ca4: SLDC 00          Short load constant 0
   0ca5: CGP  06          Call global procedure 6 (lexLevel 1, curr seg) 
   0ca7: NEQI             Integer TOS-1 <> TOS
   0ca8: FJP  $0cb1       Jump if TOS false
   0caa: LOD  02 0001     Load word at G1 (SYSCOM)
   0cad: SLDC 05          Short load constant 5
   0cae: STO              Store indirect (TOS into TOS-1)
   0caf: UJP  $0dbb       Unconditional jump
-> 0cb1: SLDC 01          Short load constant 1
   0cb2: STL  0004        Store TOS into MP4
   0cb4: SLDC 00          Short load constant 0
   0cb5: STL  0006        Store TOS into MP6
-> 0cb7: SLDL 04          Short load local MP4
   0cb8: SLDL 05          Short load local MP5
   0cb9: SLDC 00          Short load constant 0
   0cba: IXA  0d          Index array (TOS-1 + TOS * 13)
   0cbc: IND  08          Static index and load word (TOS+8)
   0cbe: LEQI             Integer TOS-1 <= TOS
   0cbf: SLDL 06          Short load local MP6
   0cc0: LNOT             Logical NOT (~TOS)
   0cc1: LAND             Logical AND (TOS & TOS-1)
   0cc2: FJP  $0cde       Jump if TOS false
   0cc4: SLDL 05          Short load local MP5
   0cc5: SLDL 04          Short load local MP4
   0cc6: IXA  0d          Index array (TOS-1 + TOS * 13)
   0cc8: SIND 00          Short index load *TOS+0
   0cc9: SLDL 08          Short load local MP8
   0cca: SIND 00          Short index load *TOS+0
   0ccb: EQUI             Integer TOS-1 = TOS
   0ccc: SLDL 05          Short load local MP5
   0ccd: SLDL 04          Short load local MP4
   0cce: IXA  0d          Index array (TOS-1 + TOS * 13)
   0cd0: SIND 01          Short index load *TOS+1
   0cd1: SLDL 08          Short load local MP8
   0cd2: SIND 01          Short index load *TOS+1
   0cd3: EQUI             Integer TOS-1 = TOS
   0cd4: LAND             Logical AND (TOS & TOS-1)
   0cd5: STL  0006        Store TOS into MP6
   0cd7: SLDL 04          Short load local MP4
   0cd8: SLDC 01          Short load constant 1
   0cd9: ADI              Add integers (TOS + TOS-1)
   0cda: STL  0004        Store TOS into MP4
   0cdc: UJP  $0cb7       Unconditional jump
-> 0cde: SLDL 06          Short load local MP6
   0cdf: LNOT             Logical NOT (~TOS)
   0ce0: FJP  $0ce9       Jump if TOS false
   0ce2: LOD  02 0001     Load word at G1 (SYSCOM)
   0ce5: SLDC 06          Short load constant 6
   0ce6: STO              Store indirect (TOS into TOS-1)
   0ce7: UJP  $0dbb       Unconditional jump
-> 0ce9: SLDL 04          Short load local MP4
   0cea: SLDC 01          Short load constant 1
   0ceb: SBI              Subtract integers (TOS-1 - TOS)
   0cec: STL  0004        Store TOS into MP4
   0cee: SLDL 01          Short load local MP1
   0cef: SLDC 00          Short load constant 0
   0cf0: EQUI             Integer TOS-1 = TOS
   0cf1: SLDL 05          Short load local MP5
   0cf2: SLDL 04          Short load local MP4
   0cf3: IXA  0d          Index array (TOS-1 + TOS * 13)
   0cf5: INCP 0c          Inc field ptr (TOS+12)
   0cf7: SLDC 07          Short load constant 7
   0cf8: SLDC 09          Short load constant 9
   0cf9: LDP              Load packed field (TOS)
   0cfa: SLDC 64          Short load constant 100
   0cfb: EQUI             Integer TOS-1 = TOS
   0cfc: LAND             Logical AND (TOS & TOS-1)
   0cfd: SLDL 01          Short load local MP1
   0cfe: SLDC 02          Short load constant 2
   0cff: EQUI             Integer TOS-1 = TOS
   0d00: LOR              Logical OR (TOS | TOS-1)
   0d01: FJP  $0d09       Jump if TOS false
   0d03: SLDL 04          Short load local MP4
   0d04: SLDL 05          Short load local MP5
   0d05: CGP  08          Call global procedure 8 (lexLevel 1, curr seg) DELENTRY
   0d07: UJP  $0d9c       Unconditional jump
-> 0d09: SLDL 08          Short load local MP8
   0d0a: INCP 03          Inc field ptr (TOS+3)
   0d0c: SLDC 01          Short load constant 1
   0d0d: SLDL 05          Short load local MP5
   0d0e: SLDC 00          Short load constant 0
   0d0f: SLDC 00          Short load constant 0
   0d10: CGP  0c          Call global procedure 12 (lexLevel 1, curr seg) (FUNC12)
   0d12: STL  0003        Store TOS into MP3
   0d14: SLDL 03          Short load local MP3
   0d15: SLDC 00          Short load constant 0
   0d16: NEQI             Integer TOS-1 <> TOS
   0d17: SLDL 03          Short load local MP3
   0d18: SLDL 04          Short load local MP4
   0d19: NEQI             Integer TOS-1 <> TOS
   0d1a: LAND             Logical AND (TOS & TOS-1)
   0d1b: FJP  $0d2b       Jump if TOS false
   0d1d: SLDL 03          Short load local MP3
   0d1e: SLDL 05          Short load local MP5
   0d1f: CGP  08          Call global procedure 8 (lexLevel 1, curr seg) DELENTRY
   0d21: SLDL 03          Short load local MP3
   0d22: SLDL 04          Short load local MP4
   0d23: LESI             Integer TOS-1 < TOS
   0d24: FJP  $0d2b       Jump if TOS false
   0d26: SLDL 04          Short load local MP4
   0d27: SLDC 01          Short load constant 1
   0d28: SBI              Subtract integers (TOS-1 - TOS)
   0d29: STL  0004        Store TOS into MP4
-> 0d2b: SLDL 05          Short load local MP5
   0d2c: SLDL 04          Short load local MP4
   0d2d: IXA  0d          Index array (TOS-1 + TOS * 13)
   0d2f: INCP 0c          Inc field ptr (TOS+12)
   0d31: SLDC 07          Short load constant 7
   0d32: SLDC 09          Short load constant 9
   0d33: LDP              Load packed field (TOS)
   0d34: SLDC 64          Short load constant 100
   0d35: EQUI             Integer TOS-1 = TOS
   0d36: FJP  $0d4e       Jump if TOS false
   0d38: SLDL 08          Short load local MP8
   0d39: INCP 0c          Inc field ptr (TOS+12)
   0d3b: SLDC 07          Short load constant 7
   0d3c: SLDC 09          Short load constant 9
   0d3d: LDP              Load packed field (TOS)
   0d3e: SLDC 64          Short load constant 100
   0d3f: EQUI             Integer TOS-1 = TOS
   0d40: FJP  $0d4c       Jump if TOS false
   0d42: SLDL 08          Short load local MP8
   0d43: INCP 0c          Inc field ptr (TOS+12)
   0d45: LDA  02 0012     Load addr G18 (THEDATE)
   0d48: MOV  01          Move 1 words (TOS to TOS-1)
   0d4a: UJP  $0d4c       Unconditional jump
-> 0d4c: UJP  $0d71       Unconditional jump
-> 0d4e: SLDL 07          Short load local MP7
   0d4f: IND  0f          Static index and load word (TOS+15)
   0d51: LDA  02 0012     Load addr G18 (THEDATE)
   0d54: SLDC 04          Short load constant 4
   0d55: SLDC 00          Short load constant 0
   0d56: LDP              Load packed field (TOS)
   0d57: SLDC 00          Short load constant 0
   0d58: NEQI             Integer TOS-1 <> TOS
   0d59: LAND             Logical AND (TOS & TOS-1)
   0d5a: FJP  $0d66       Jump if TOS false
   0d5c: SLDL 08          Short load local MP8
   0d5d: INCP 0c          Inc field ptr (TOS+12)
   0d5f: LDA  02 0012     Load addr G18 (THEDATE)
   0d62: MOV  01          Move 1 words (TOS to TOS-1)
   0d64: UJP  $0d71       Unconditional jump
-> 0d66: SLDL 08          Short load local MP8
   0d67: INCP 0c          Inc field ptr (TOS+12)
   0d69: SLDL 05          Short load local MP5
   0d6a: SLDL 04          Short load local MP4
   0d6b: IXA  0d          Index array (TOS-1 + TOS * 13)
   0d6d: INCP 0c          Inc field ptr (TOS+12)
   0d6f: MOV  01          Move 1 words (TOS to TOS-1)
-> 0d71: SLDL 08          Short load local MP8
   0d72: INCP 01          Inc field ptr (TOS+1)
   0d74: SLDL 08          Short load local MP8
   0d75: SIND 00          Short index load *TOS+0
   0d76: SLDL 07          Short load local MP7
   0d77: IND  0c          Static index and load word (TOS+12)
   0d79: ADI              Add integers (TOS + TOS-1)
   0d7a: STO              Store indirect (TOS into TOS-1)
   0d7b: SLDL 07          Short load local MP7
   0d7c: IND  1d          Static index and load word (TOS+29)
   0d7e: FJP  $0d87       Jump if TOS false
   0d80: SLDL 08          Short load local MP8
   0d81: INCP 0b          Inc field ptr (TOS+11)
   0d83: SLDL 07          Short load local MP7
   0d84: IND  1e          Static index and load word (TOS+30)
   0d86: STO              Store indirect (TOS into TOS-1)
-> 0d87: SLDL 07          Short load local MP7
   0d88: INCP 12          Inc field ptr (TOS+18)
   0d8a: SLDC 0c          Short load constant 12
   0d8b: SLDC 04          Short load constant 4
   0d8c: SLDC 00          Short load constant 0
   0d8d: STP              Store packed field (TOS into TOS-1)
   0d8e: SLDL 07          Short load local MP7
   0d8f: INCP 0f          Inc field ptr (TOS+15)
   0d91: SLDC 00          Short load constant 0
   0d92: STO              Store indirect (TOS into TOS-1)
   0d93: SLDL 05          Short load local MP5
   0d94: SLDL 04          Short load local MP4
   0d95: IXA  0d          Index array (TOS-1 + TOS * 13)
   0d97: SLDL 07          Short load local MP7
   0d98: INCP 10          Inc field ptr (TOS+16)
   0d9a: MOV  0d          Move 13 words (TOS to TOS-1)
-> 0d9c: SLDL 07          Short load local MP7
   0d9d: SIND 07          Short index load *TOS+7
   0d9e: SLDL 05          Short load local MP5
   0d9f: CGP  0a          Call global procedure 10 (lexLevel 1, curr seg) WRITEDIR
-> 0da1: SLDL 01          Short load local MP1
   0da2: SLDC 02          Short load constant 2
   0da3: EQUI             Integer TOS-1 = TOS
   0da4: FJP  $0dbb       Jump if TOS false
   0da6: SLDL 07          Short load local MP7
   0da7: INCP 13          Inc field ptr (TOS+19)
   0da9: SLDC 00          Short load constant 0
   0daa: LDB              Load byte at byte ptr TOS-1 + TOS
   0dab: SLDC 00          Short load constant 0
   0dac: EQUI             Integer TOS-1 = TOS
   0dad: FJP  $0dbb       Jump if TOS false
   0daf: LDA  02 001f     Load addr G31 (UNITABLE)
   0db2: SLDL 07          Short load local MP7
   0db3: SIND 07          Short index load *TOS+7
   0db4: IXA  06          Index array (TOS-1 + TOS * 6)
   0db6: NOP              No operation
   0db7: LSA  00          Load string address: ''
   0db9: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0dbb: SLDL 07          Short load local MP7
   0dbc: INCP 02          Inc field ptr (TOS+2)
   0dbe: SLDC 01          Short load constant 1
   0dbf: STO              Store indirect (TOS into TOS-1)
   0dc0: SLDL 07          Short load local MP7
   0dc1: INCP 01          Inc field ptr (TOS+1)
   0dc3: SLDC 01          Short load constant 1
   0dc4: STO              Store indirect (TOS into TOS-1)
   0dc5: SLDL 07          Short load local MP7
   0dc6: INCP 05          Inc field ptr (TOS+5)
   0dc8: SLDC 00          Short load constant 0
   0dc9: STO              Store indirect (TOS into TOS-1)
-> 0dca: RNP  00          Return from nonbase procedure
  END

LL 1 entry 045c exit 05b1 parms=5 words data=6 words
###  FUNCTION SYSIO.VOLSEARCH(VAR FVID:VID;LOOKHARD:BOOLEAN;VAR FDIR:DIRP):BOOLEAN (6)
    MP1=RETVAL1
    MP3=PARAM3
    MP4=PARAM2
    MP5=PARAM1
    MP6
    MP7
    MP8
    MP9
    MP10
    MP11
  BEGIN
-> 045c: SLDC 00          Short load constant 0
   045d: STL  0001        Store TOS into MP1
   045f: SLDL 03          Short load local MP3
   0460: LDCN             Load constant NIL
   0461: STO              Store indirect (TOS into TOS-1)
   0462: SLDC 00          Short load constant 0
   0463: STL  0008        Store TOS into MP8
   0465: SLDC 00          Short load constant 0
   0466: STL  0007        Store TOS into MP7
   0468: SLDL 05          Short load local MP5
   0469: SLDC 00          Short load constant 0
   046a: LDB              Load byte at byte ptr TOS-1 + TOS
   046b: SLDC 00          Short load constant 0
   046c: GRTI             Integer TOS-1 > TOS
   046d: FJP  $04e7       Jump if TOS false
   046f: SLDL 05          Short load local MP5
   0470: SLDC 01          Short load constant 1
   0471: LDB              Load byte at byte ptr TOS-1 + TOS
   0472: SLDC 23          Short load constant 35
   0473: EQUI             Integer TOS-1 = TOS
   0474: SLDL 05          Short load local MP5
   0475: SLDC 00          Short load constant 0
   0476: LDB              Load byte at byte ptr TOS-1 + TOS
   0477: SLDC 01          Short load constant 1
   0478: GRTI             Integer TOS-1 > TOS
   0479: LAND             Logical AND (TOS & TOS-1)
   047a: FJP  $04c2       Jump if TOS false
   047c: SLDC 01          Short load constant 1
   047d: STL  0008        Store TOS into MP8
   047f: SLDC 00          Short load constant 0
   0480: STL  0006        Store TOS into MP6
   0482: SLDC 02          Short load constant 2
   0483: STL  000a        Store TOS into MP10
-> 0485: SLDL 05          Short load local MP5
   0486: SLDL 0a          Short load local MP10
   0487: LDB              Load byte at byte ptr TOS-1 + TOS
   0488: SLDC 30          Short load constant 48
   0489: GEQI             Integer TOS-1 >= TOS
   048a: SLDL 05          Short load local MP5
   048b: SLDL 0a          Short load local MP10
   048c: LDB              Load byte at byte ptr TOS-1 + TOS
   048d: SLDC 39          Short load constant 57
   048e: LEQI             Integer TOS-1 <= TOS
   048f: LAND             Logical AND (TOS & TOS-1)
   0490: FJP  $049f       Jump if TOS false
   0492: SLDL 06          Short load local MP6
   0493: SLDC 0a          Short load constant 10
   0494: MPI              Multiply integers (TOS * TOS-1)
   0495: SLDL 05          Short load local MP5
   0496: SLDL 0a          Short load local MP10
   0497: LDB              Load byte at byte ptr TOS-1 + TOS
   0498: ADI              Add integers (TOS + TOS-1)
   0499: SLDC 30          Short load constant 48
   049a: SBI              Subtract integers (TOS-1 - TOS)
   049b: STL  0006        Store TOS into MP6
   049d: UJP  $04a2       Unconditional jump
-> 049f: SLDC 00          Short load constant 0
   04a0: STL  0008        Store TOS into MP8
-> 04a2: SLDL 0a          Short load local MP10
   04a3: SLDC 01          Short load constant 1
   04a4: ADI              Add integers (TOS + TOS-1)
   04a5: STL  000a        Store TOS into MP10
   04a7: SLDL 0a          Short load local MP10
   04a8: SLDL 05          Short load local MP5
   04a9: SLDC 00          Short load constant 0
   04aa: LDB              Load byte at byte ptr TOS-1 + TOS
   04ab: GRTI             Integer TOS-1 > TOS
   04ac: SLDL 08          Short load local MP8
   04ad: LNOT             Logical NOT (~TOS)
   04ae: LOR              Logical OR (TOS | TOS-1)
   04af: FJP  $0485       Jump if TOS false
   04b1: SLDL 08          Short load local MP8
   04b2: SLDL 06          Short load local MP6
   04b3: SLDC 00          Short load constant 0
   04b4: GRTI             Integer TOS-1 > TOS
   04b5: LAND             Logical AND (TOS & TOS-1)
   04b6: SLDL 06          Short load local MP6
   04b7: SLDC 0c          Short load constant 12
   04b8: LEQI             Integer TOS-1 <= TOS
   04b9: LAND             Logical AND (TOS & TOS-1)
   04ba: STL  0007        Store TOS into MP7
   04bc: SLDL 04          Short load local MP4
   04bd: SLDL 07          Short load local MP7
   04be: LNOT             Logical NOT (~TOS)
   04bf: LAND             Logical AND (TOS & TOS-1)
   04c0: STL  0004        Store TOS into MP4
-> 04c2: SLDL 07          Short load local MP7
   04c3: LNOT             Logical NOT (~TOS)
   04c4: FJP  $04e7       Jump if TOS false
   04c6: SLDC 00          Short load constant 0
   04c7: STL  0008        Store TOS into MP8
   04c9: SLDC 0c          Short load constant 12
   04ca: STL  0006        Store TOS into MP6
-> 04cc: SLDL 05          Short load local MP5
   04cd: LDA  02 001f     Load addr G31 (UNITABLE)
   04d0: SLDL 06          Short load local MP6
   04d1: IXA  06          Index array (TOS-1 + TOS * 6)
   04d3: EQLSTR           String TOS-1 = TOS
   04d5: STL  0008        Store TOS into MP8
   04d7: SLDL 08          Short load local MP8
   04d8: LNOT             Logical NOT (~TOS)
   04d9: FJP  $04e0       Jump if TOS false
   04db: SLDL 06          Short load local MP6
   04dc: SLDC 01          Short load constant 1
   04dd: SBI              Subtract integers (TOS-1 - TOS)
   04de: STL  0006        Store TOS into MP6
-> 04e0: SLDL 08          Short load local MP8
   04e1: SLDL 06          Short load local MP6
   04e2: SLDC 00          Short load constant 0
   04e3: EQUI             Integer TOS-1 = TOS
   04e4: LOR              Logical OR (TOS | TOS-1)
   04e5: FJP  $04cc       Jump if TOS false
-> 04e7: SLDL 08          Short load local MP8
   04e8: FJP  $054a       Jump if TOS false
   04ea: LDA  02 001f     Load addr G31 (UNITABLE)
   04ed: SLDL 06          Short load local MP6
   04ee: IXA  06          Index array (TOS-1 + TOS * 6)
   04f0: SIND 04          Short index load *TOS+4
   04f1: FJP  $054a       Jump if TOS false
   04f3: LOD  02 0001     Load word at G1 (SYSCOM)
   04f6: STL  000b        Store TOS into MP11
   04f8: SLDC 00          Short load constant 0
   04f9: STL  0008        Store TOS into MP8
   04fb: SLDL 0b          Short load local MP11
   04fc: SIND 04          Short index load *TOS+4
   04fd: LDCN             Load constant NIL
   04fe: NEQI             Integer TOS-1 <> TOS
   04ff: FJP  $0522       Jump if TOS false
   0501: SLDL 05          Short load local MP5
   0502: SLDL 0b          Short load local MP11
   0503: SIND 04          Short index load *TOS+4
   0504: SLDC 00          Short load constant 0
   0505: IXA  0d          Index array (TOS-1 + TOS * 13)
   0507: INCP 03          Inc field ptr (TOS+3)
   0509: EQLSTR           String TOS-1 = TOS
   050b: FJP  $0522       Jump if TOS false
   050d: LLA  000a        Load local address MP10
   050f: LLA  0009        Load local address MP9
   0511: CSP  09          Call standard procedure 9 TIME
   0513: SLDL 09          Short load local MP9
   0514: SLDL 0b          Short load local MP11
   0515: SIND 04          Short index load *TOS+4
   0516: SLDC 00          Short load constant 0
   0517: IXA  0d          Index array (TOS-1 + TOS * 13)
   0519: IND  09          Static index and load word (TOS+9)
   051b: SBI              Subtract integers (TOS-1 - TOS)
   051c: LDCI 012c        Load word 300
   051f: LEQI             Integer TOS-1 <= TOS
   0520: STL  0008        Store TOS into MP8
-> 0522: SLDL 08          Short load local MP8
   0523: LNOT             Logical NOT (~TOS)
   0524: FJP  $054a       Jump if TOS false
   0526: SLDL 07          Short load local MP7
   0527: STL  0008        Store TOS into MP8
   0529: SLDL 06          Short load local MP6
   052a: SLDC 00          Short load constant 0
   052b: SLDC 00          Short load constant 0
   052c: CGP  09          Call global procedure 9 (lexLevel 1, curr seg) (FETCHDIR)
   052e: FJP  $0544       Jump if TOS false
   0530: SLDL 07          Short load local MP7
   0531: LNOT             Logical NOT (~TOS)
   0532: FJP  $0542       Jump if TOS false
   0534: SLDL 05          Short load local MP5
   0535: SLDL 0b          Short load local MP11
   0536: SIND 04          Short index load *TOS+4
   0537: SLDC 00          Short load constant 0
   0538: IXA  0d          Index array (TOS-1 + TOS * 13)
   053a: INCP 03          Inc field ptr (TOS+3)
   053c: EQLSTR           String TOS-1 = TOS
   053e: STL  0008        Store TOS into MP8
   0540: UJP  $0542       Unconditional jump
-> 0542: UJP  $054a       Unconditional jump
-> 0544: CSP  22          Call standard procedure 34 IORESULT
   0546: SLDC 00          Short load constant 0
   0547: EQUI             Integer TOS-1 = TOS
   0548: STL  0008        Store TOS into MP8
-> 054a: SLDL 08          Short load local MP8
   054b: LNOT             Logical NOT (~TOS)
   054c: SLDL 04          Short load local MP4
   054d: LAND             Logical AND (TOS & TOS-1)
   054e: FJP  $057c       Jump if TOS false
   0550: SLDC 0c          Short load constant 12
   0551: STL  0006        Store TOS into MP6
-> 0553: LDA  02 001f     Load addr G31 (UNITABLE)
   0556: SLDL 06          Short load local MP6
   0557: IXA  06          Index array (TOS-1 + TOS * 6)
   0559: STL  000b        Store TOS into MP11
   055b: SLDL 0b          Short load local MP11
   055c: SIND 04          Short index load *TOS+4
   055d: FJP  $056c       Jump if TOS false
   055f: SLDL 06          Short load local MP6
   0560: SLDC 00          Short load constant 0
   0561: SLDC 00          Short load constant 0
   0562: CGP  09          Call global procedure 9 (lexLevel 1, curr seg) (FETCHDIR)
   0564: FJP  $056c       Jump if TOS false
   0566: SLDL 05          Short load local MP5
   0567: SLDL 0b          Short load local MP11
   0568: EQLSTR           String TOS-1 = TOS
   056a: STL  0008        Store TOS into MP8
-> 056c: SLDL 08          Short load local MP8
   056d: LNOT             Logical NOT (~TOS)
   056e: FJP  $0575       Jump if TOS false
   0570: SLDL 06          Short load local MP6
   0571: SLDC 01          Short load constant 1
   0572: SBI              Subtract integers (TOS-1 - TOS)
   0573: STL  0006        Store TOS into MP6
-> 0575: SLDL 08          Short load local MP8
   0576: SLDL 06          Short load local MP6
   0577: SLDC 00          Short load constant 0
   0578: EQUI             Integer TOS-1 = TOS
   0579: LOR              Logical OR (TOS | TOS-1)
   057a: FJP  $0553       Jump if TOS false
-> 057c: SLDL 08          Short load local MP8
   057d: FJP  $05b1       Jump if TOS false
   057f: LDA  02 001f     Load addr G31 (UNITABLE)
   0582: SLDL 06          Short load local MP6
   0583: IXA  06          Index array (TOS-1 + TOS * 6)
   0585: STL  000b        Store TOS into MP11
   0587: SLDL 06          Short load local MP6
   0588: STL  0001        Store TOS into MP1
   058a: SLDL 0b          Short load local MP11
   058b: SLDC 00          Short load constant 0
   058c: LDB              Load byte at byte ptr TOS-1 + TOS
   058d: SLDC 00          Short load constant 0
   058e: GRTI             Integer TOS-1 > TOS
   058f: FJP  $0595       Jump if TOS false
   0591: SLDL 05          Short load local MP5
   0592: SLDL 0b          Short load local MP11
   0593: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0595: SLDL 0b          Short load local MP11
   0596: SIND 04          Short index load *TOS+4
   0597: LOD  02 0001     Load word at G1 (SYSCOM)
   059a: SIND 04          Short index load *TOS+4
   059b: LDCN             Load constant NIL
   059c: NEQI             Integer TOS-1 <> TOS
   059d: LAND             Logical AND (TOS & TOS-1)
   059e: FJP  $05b1       Jump if TOS false
   05a0: SLDL 03          Short load local MP3
   05a1: LOD  02 0001     Load word at G1 (SYSCOM)
   05a4: SIND 04          Short index load *TOS+4
   05a5: STO              Store indirect (TOS into TOS-1)
   05a6: LLA  000a        Load local address MP10
   05a8: SLDL 03          Short load local MP3
   05a9: SIND 00          Short index load *TOS+0
   05aa: SLDC 00          Short load constant 0
   05ab: IXA  0d          Index array (TOS-1 + TOS * 13)
   05ad: INCP 09          Inc field ptr (TOS+9)
   05af: CSP  09          Call standard procedure 9 TIME
-> 05b1: RNP  01          Return from nonbase procedure
  END

LL 1 entry 065c exit 0692 parms=3 words data=3 words
###  PROCEDURE SYSIO.INSENTRY(VAR FENTRY:DIRENTRY; FINX:DIRRANGE; FDIR:DIRP) (7)
    MP1=FDIR:DIRP
    MP2=FINX:DIRRANGE
    MP3=FENTRY:DIRENTRY
    MP4=I:DIRRANGE
    MP5=VOLINFO
    MP6
  BEGIN
    VOLINFO := FDIR[0]
-> 065c: SLDL 01          Short load local MP1 (FDIR)
   065d: SLDC 00          Short load constant 0
   065e: IXA  0d          Index array (TOS-1 + TOS * 13)
   0660: STL  0005        Store TOS into MP5 (VOLINFO)
    I := VOLINFO.DNUMFILES
   0662: SLDL 05          Short load local MP5 (VOLINFO)
   0663: IND  08          Static index and load word (TOS+8)
   0665: STL  0004        Store TOS into MP4 (I)
    MP6 := FINX
   0667: SLDL 02          Short load local MP2 (FINX)
   0668: STL  0006        Store TOS into MP6
    WHILE I >= MP6 DO
-> 066a: SLDL 04          Short load local MP4 (I)
   066b: SLDL 06          Short load local MP6
   066c: GEQI             Integer TOS-1 >= TOS
   066d: FJP  $0682       Jump if TOS false
    BEGIN
      FDIR[I+1] := FDIR[I]
   066f: SLDL 01          Short load local MP1 (FDIR)
   0670: SLDL 04          Short load local MP4 (I)
   0671: SLDC 01          Short load constant 1
   0672: ADI              Add integers (TOS + TOS-1)
   0673: IXA  0d          Index array (TOS-1 + TOS * 13)
   0675: SLDL 01          Short load local MP1 (FDIR)
   0676: SLDL 04          Short load local MP4 (I)
   0677: IXA  0d          Index array (TOS-1 + TOS * 13)
   0679: MOV  0d          Move 13 words (TOS to TOS-1)
      I := I - 1
   067b: SLDL 04          Short load local MP4 (I)
   067c: SLDC 01          Short load constant 1
   067d: SBI              Subtract integers (TOS-1 - TOS)
   067e: STL  0004        Store TOS into MP4 (I)
   0680: UJP  $066a       Unconditional jump
    END
    FDIR[FINX] := FENTRY
-> 0682: SLDL 01          Short load local MP1 (FDIR)
   0683: SLDL 02          Short load local MP2 (FINX)
   0684: IXA  0d          Index array (TOS-1 + TOS * 13)
   0686: SLDL 03          Short load local MP3 (FENTRY)
   0687: MOV  0d          Move 13 words (TOS to TOS-1)
    VOLINFO.DNUMFILES := VOLINFO.DNUMFILES + 1
   0689: SLDL 05          Short load local MP5 (VOLINFO)
   068a: INCP 08          Inc field ptr (TOS+8)
   068c: SLDL 05          Short load local MP5 (VOLINFO)
   068d: IND  08          Static index and load word (TOS+8)
   068f: SLDC 01          Short load constant 1
   0690: ADI              Add integers (TOS + TOS-1)
   0691: STO              Store indirect (TOS into TOS-1)
-> 0692: RNP  00          Return from nonbase procedure
  END

LL 1 entry 0610 exit 064e parms=2 words data=3 words
###  PROCEDURE SYSIO.DELENTRY(FINX:DIRRANGE;FDIR:DIRP) (8)
    MP1=FDIR:DIRP
    MP2=FINX:DIRRANGE
    MP3
    MP4
    MP5
  BEGIN
-> 0610: SLDL 01          Short load local MP1
   0611: SLDC 00          Short load constant 0
   0612: IXA  0d          Index array (TOS-1 + TOS * 13)
   0614: STL  0004        Store TOS into MP4
   0616: SLDL 02          Short load local MP2
   0617: STL  0003        Store TOS into MP3
   0619: SLDL 04          Short load local MP4
   061a: IND  08          Static index and load word (TOS+8)
   061c: SLDC 01          Short load constant 1
   061d: SBI              Subtract integers (TOS-1 - TOS)
   061e: STL  0005        Store TOS into MP5
-> 0620: SLDL 03          Short load local MP3
   0621: SLDL 05          Short load local MP5
   0622: LEQI             Integer TOS-1 <= TOS
   0623: FJP  $0638       Jump if TOS false
   0625: SLDL 01          Short load local MP1
   0626: SLDL 03          Short load local MP3
   0627: IXA  0d          Index array (TOS-1 + TOS * 13)
   0629: SLDL 01          Short load local MP1
   062a: SLDL 03          Short load local MP3
   062b: SLDC 01          Short load constant 1
   062c: ADI              Add integers (TOS + TOS-1)
   062d: IXA  0d          Index array (TOS-1 + TOS * 13)
   062f: MOV  0d          Move 13 words (TOS to TOS-1)
   0631: SLDL 03          Short load local MP3
   0632: SLDC 01          Short load constant 1
   0633: ADI              Add integers (TOS + TOS-1)
   0634: STL  0003        Store TOS into MP3
   0636: UJP  $0620       Unconditional jump
-> 0638: SLDL 01          Short load local MP1
   0639: SLDL 04          Short load local MP4
   063a: IND  08          Static index and load word (TOS+8)
   063c: IXA  0d          Index array (TOS-1 + TOS * 13)
   063e: INCP 03          Inc field ptr (TOS+3)
   0640: NOP              No operation
   0641: LSA  00          Load string address: ''
   0643: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0645: SLDL 04          Short load local MP4
   0646: INCP 08          Inc field ptr (TOS+8)
   0648: SLDL 04          Short load local MP4
   0649: IND  08          Static index and load word (TOS+8)
   064b: SLDC 01          Short load constant 1
   064c: SBI              Subtract integers (TOS-1 - TOS)
   064d: STO              Store indirect (TOS into TOS-1)
-> 064e: RNP  00          Return from nonbase procedure
  END

LL 1 entry 0240 exit 037d parms=3 words data=7 words
###  FUNCTION SYSIO.FETCHDIR(UNIT:UNITNUM): BOOLEAN (9)
    MP1=RETVAL1
    MP3=PARAM1
    MP4
    MP5
    MP6
    MP7
    MP8
    MP9
    MP10
  BEGIN
-> 0240: SLDC 00          Short load constant 0
   0241: STL  0001        Store TOS into MP1
   0243: LOD  02 0001     Load word at G1 (SYSCOM)
   0246: STL  0007        Store TOS into MP7
   0248: LDA  02 001f     Load addr G31 (UNITABLE)
   024b: SLDL 03          Short load local MP3
   024c: IXA  06          Index array (TOS-1 + TOS * 6)
   024e: STL  0008        Store TOS into MP8
   0250: SLDL 07          Short load local MP7
   0251: SIND 04          Short index load *TOS+4
   0252: LDCN             Load constant NIL
   0253: EQUI             Integer TOS-1 = TOS
   0254: FJP  $025e       Jump if TOS false
   0256: SLDL 07          Short load local MP7
   0257: INCP 04          Inc field ptr (TOS+4)
   0259: LDCI 03f6        Load word 1014
   025c: CSP  01          Call standard procedure 1 NEW
-> 025e: SLDL 03          Short load local MP3
   025f: SLDL 07          Short load local MP7
   0260: SIND 04          Short index load *TOS+4
   0261: SLDC 00          Short load constant 0
   0262: LDCI 07ec        Load word 2028
   0265: SLDC 02          Short load constant 2
   0266: SLDC 00          Short load constant 0
   0267: CSP  05          Call standard procedure 5 UNITREAD
   0269: SLDL 07          Short load local MP7
   026a: SIND 00          Short index load *TOS+0
   026b: SLDC 00          Short load constant 0
   026c: EQUI             Integer TOS-1 = TOS
   026d: STL  0005        Store TOS into MP5
   026f: SLDL 05          Short load local MP5
   0270: FJP  $035f       Jump if TOS false
   0272: SLDL 07          Short load local MP7
   0273: SIND 04          Short index load *TOS+4
   0274: SLDC 00          Short load constant 0
   0275: IXA  0d          Index array (TOS-1 + TOS * 13)
   0277: STL  0009        Store TOS into MP9
   0279: SLDC 00          Short load constant 0
   027a: STL  0005        Store TOS into MP5
   027c: SLDL 09          Short load local MP9
   027d: SIND 00          Short index load *TOS+0
   027e: SLDC 00          Short load constant 0
   027f: EQUI             Integer TOS-1 = TOS
   0280: SLDL 07          Short load local MP7
   0281: INCP 1d          Inc field ptr (TOS+29)
   0283: SLDC 02          Short load constant 2
   0284: SLDC 07          Short load constant 7
   0285: LDP              Load packed field (TOS)
   0286: SLDC 02          Short load constant 2
   0287: EQUI             Integer TOS-1 = TOS
   0288: SLDL 07          Short load local MP7
   0289: INCP 1d          Inc field ptr (TOS+29)
   028b: SLDC 02          Short load constant 2
   028c: SLDC 07          Short load constant 7
   028d: LDP              Load packed field (TOS)
   028e: SLDC 01          Short load constant 1
   028f: EQUI             Integer TOS-1 = TOS
   0290: SLDL 07          Short load local MP7
   0291: INCP 1d          Inc field ptr (TOS+29)
   0293: SLDC 02          Short load constant 2
   0294: SLDC 07          Short load constant 7
   0295: LDP              Load packed field (TOS)
   0296: SLDC 03          Short load constant 3
   0297: EQUI             Integer TOS-1 = TOS
   0298: LOR              Logical OR (TOS | TOS-1)
   0299: SLDL 09          Short load local MP9
   029a: INCP 02          Inc field ptr (TOS+2)
   029c: SLDC 04          Short load constant 4
   029d: SLDC 00          Short load constant 0
   029e: LDP              Load packed field (TOS)
   029f: SLDC 08          Short load constant 8
   02a0: EQUI             Integer TOS-1 = TOS
   02a1: LAND             Logical AND (TOS & TOS-1)
   02a2: LOR              Logical OR (TOS | TOS-1)
   02a3: SLDL 07          Short load local MP7
   02a4: INCP 1d          Inc field ptr (TOS+29)
   02a6: SLDC 02          Short load constant 2
   02a7: SLDC 07          Short load constant 7
   02a8: LDP              Load packed field (TOS)
   02a9: SLDC 00          Short load constant 0
   02aa: EQUI             Integer TOS-1 = TOS
   02ab: SLDL 09          Short load local MP9
   02ac: INCP 02          Inc field ptr (TOS+2)
   02ae: SLDC 04          Short load constant 4
   02af: SLDC 00          Short load constant 0
   02b0: LDP              Load packed field (TOS)
   02b1: SLDC 00          Short load constant 0
   02b2: EQUI             Integer TOS-1 = TOS
   02b3: LAND             Logical AND (TOS & TOS-1)
   02b4: LOR              Logical OR (TOS | TOS-1)
   02b5: LAND             Logical AND (TOS & TOS-1)
   02b6: FJP  $0349       Jump if TOS false
   02b8: SLDL 09          Short load local MP9
   02b9: INCP 03          Inc field ptr (TOS+3)
   02bb: SLDC 00          Short load constant 0
   02bc: LDB              Load byte at byte ptr TOS-1 + TOS
   02bd: SLDC 00          Short load constant 0
   02be: GRTI             Integer TOS-1 > TOS
   02bf: SLDL 09          Short load local MP9
   02c0: INCP 03          Inc field ptr (TOS+3)
   02c2: SLDC 00          Short load constant 0
   02c3: LDB              Load byte at byte ptr TOS-1 + TOS
   02c4: SLDC 07          Short load constant 7
   02c5: LEQI             Integer TOS-1 <= TOS
   02c6: LAND             Logical AND (TOS & TOS-1)
   02c7: SLDL 09          Short load local MP9
   02c8: IND  08          Static index and load word (TOS+8)
   02ca: SLDC 00          Short load constant 0
   02cb: GEQI             Integer TOS-1 >= TOS
   02cc: LAND             Logical AND (TOS & TOS-1)
   02cd: SLDL 09          Short load local MP9
   02ce: IND  08          Static index and load word (TOS+8)
   02d0: SLDC 4d          Short load constant 77
   02d1: LEQI             Integer TOS-1 <= TOS
   02d2: LAND             Logical AND (TOS & TOS-1)
   02d3: FJP  $0349       Jump if TOS false
   02d5: SLDC 01          Short load constant 1
   02d6: STL  0005        Store TOS into MP5
   02d8: SLDL 09          Short load local MP9
   02d9: INCP 03          Inc field ptr (TOS+3)
   02db: SLDL 08          Short load local MP8
   02dc: NEQSTR           String TOS-1 <> TOS
   02de: FJP  $0349       Jump if TOS false
   02e0: SLDC 01          Short load constant 1
   02e1: STL  0004        Store TOS into MP4
-> 02e3: SLDL 04          Short load local MP4
   02e4: SLDL 09          Short load local MP9
   02e5: IND  08          Static index and load word (TOS+8)
   02e7: LEQI             Integer TOS-1 <= TOS
   02e8: FJP  $0330       Jump if TOS false
   02ea: SLDL 07          Short load local MP7
   02eb: SIND 04          Short index load *TOS+4
   02ec: SLDL 04          Short load local MP4
   02ed: IXA  0d          Index array (TOS-1 + TOS * 13)
   02ef: STL  000a        Store TOS into MP10
   02f1: SLDL 0a          Short load local MP10
   02f2: INCP 03          Inc field ptr (TOS+3)
   02f4: SLDC 00          Short load constant 0
   02f5: LDB              Load byte at byte ptr TOS-1 + TOS
   02f6: SLDC 00          Short load constant 0
   02f7: LEQI             Integer TOS-1 <= TOS
   02f8: SLDL 0a          Short load local MP10
   02f9: INCP 03          Inc field ptr (TOS+3)
   02fb: SLDC 00          Short load constant 0
   02fc: LDB              Load byte at byte ptr TOS-1 + TOS
   02fd: SLDC 0f          Short load constant 15
   02fe: GRTI             Integer TOS-1 > TOS
   02ff: LOR              Logical OR (TOS | TOS-1)
   0300: SLDL 0a          Short load local MP10
   0301: SIND 01          Short index load *TOS+1
   0302: SLDL 0a          Short load local MP10
   0303: SIND 00          Short index load *TOS+0
   0304: LESI             Integer TOS-1 < TOS
   0305: LOR              Logical OR (TOS | TOS-1)
   0306: SLDL 0a          Short load local MP10
   0307: IND  0b          Static index and load word (TOS+11)
   0309: LDCI 0200        Load word 512
   030c: GRTI             Integer TOS-1 > TOS
   030d: LOR              Logical OR (TOS | TOS-1)
   030e: SLDL 0a          Short load local MP10
   030f: IND  0b          Static index and load word (TOS+11)
   0311: SLDC 00          Short load constant 0
   0312: LEQI             Integer TOS-1 <= TOS
   0313: LOR              Logical OR (TOS | TOS-1)
   0314: SLDL 0a          Short load local MP10
   0315: INCP 0c          Inc field ptr (TOS+12)
   0317: SLDC 07          Short load constant 7
   0318: SLDC 09          Short load constant 9
   0319: LDP              Load packed field (TOS)
   031a: SLDC 64          Short load constant 100
   031b: GEQI             Integer TOS-1 >= TOS
   031c: LOR              Logical OR (TOS | TOS-1)
   031d: FJP  $0329       Jump if TOS false
   031f: SLDC 00          Short load constant 0
   0320: STL  0005        Store TOS into MP5
   0322: SLDL 04          Short load local MP4
   0323: SLDL 07          Short load local MP7
   0324: SIND 04          Short index load *TOS+4
   0325: CGP  08          Call global procedure 8 (lexLevel 1, curr seg) (DELENTRY)
   0327: UJP  $032e       Unconditional jump
-> 0329: SLDL 04          Short load local MP4
   032a: SLDC 01          Short load constant 1
   032b: ADI              Add integers (TOS + TOS-1)
   032c: STL  0004        Store TOS into MP4
-> 032e: UJP  $02e3       Unconditional jump
-> 0330: SLDL 05          Short load local MP5
   0331: LNOT             Logical NOT (~TOS)
   0332: FJP  $0349       Jump if TOS false
   0334: SLDL 03          Short load local MP3
   0335: SLDL 07          Short load local MP7
   0336: SIND 04          Short index load *TOS+4
   0337: SLDC 00          Short load constant 0
   0338: SLDL 09          Short load local MP9
   0339: IND  08          Static index and load word (TOS+8)
   033b: SLDC 01          Short load constant 1
   033c: ADI              Add integers (TOS + TOS-1)
   033d: SLDC 1a          Short load constant 26
   033e: MPI              Multiply integers (TOS * TOS-1)
   033f: SLDC 02          Short load constant 2
   0340: SLDC 00          Short load constant 0
   0341: CSP  06          Call standard procedure 6 UNITWRITE
   0343: SLDL 07          Short load local MP7
   0344: SIND 00          Short index load *TOS+0
   0345: SLDC 00          Short load constant 0
   0346: EQUI             Integer TOS-1 = TOS
   0347: STL  0005        Store TOS into MP5
-> 0349: SLDL 05          Short load local MP5
   034a: FJP  $035f       Jump if TOS false
   034c: SLDL 08          Short load local MP8
   034d: SLDL 09          Short load local MP9
   034e: INCP 03          Inc field ptr (TOS+3)
   0350: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0352: SLDL 08          Short load local MP8
   0353: INCP 05          Inc field ptr (TOS+5)
   0355: SLDL 09          Short load local MP9
   0356: SIND 07          Short index load *TOS+7
   0357: STO              Store indirect (TOS into TOS-1)
   0358: LLA  0006        Load local address MP6
   035a: SLDL 09          Short load local MP9
   035b: INCP 09          Inc field ptr (TOS+9)
   035d: CSP  09          Call standard procedure 9 TIME
-> 035f: SLDL 05          Short load local MP5
   0360: STL  0001        Store TOS into MP1
   0362: SLDL 05          Short load local MP5
   0363: LNOT             Logical NOT (~TOS)
   0364: FJP  $037d       Jump if TOS false
   0366: SLDL 08          Short load local MP8
   0367: LSA  00          Load string address: ''
   0369: NOP              No operation
   036a: SAS  07          String assign (TOS to TOS-1, 7 chars)
   036c: SLDL 08          Short load local MP8
   036d: INCP 05          Inc field ptr (TOS+5)
   036f: LDCI 7fff        Load word 32767
   0372: STO              Store indirect (TOS into TOS-1)
   0373: SLDL 07          Short load local MP7
   0374: INCP 04          Inc field ptr (TOS+4)
   0376: CSP  21          Call standard procedure 33 RELEASE
   0378: SLDL 07          Short load local MP7
   0379: INCP 04          Inc field ptr (TOS+4)
   037b: LDCN             Load constant NIL
   037c: STO              Store indirect (TOS into TOS-1)
-> 037d: RNP  01          Return from nonbase procedure
  END

LL 1 entry 0390 exit 0450 parms=2 words data=18 words
###  PROCEDURE SYSIO.WRITEDIR(FUNIT:UNITNUM;FDIR:DIRP) (10)
    MP1=FDIR:DIRP
    MP2=FUNIT:UNITNUM
    MP3
    MP4
    MP5
    MP6
    MP9
    MP19
    MP20
  BEGIN
-> 0390: LDA  02 001f     Load addr G31 (UNITABLE)
   0393: SLDL 02          Short load local MP2
   0394: IXA  06          Index array (TOS-1 + TOS * 6)
   0396: STL  0013        Store TOS into MP19
   0398: SLDL 01          Short load local MP1
   0399: SLDC 00          Short load constant 0
   039a: IXA  0d          Index array (TOS-1 + TOS * 13)
   039c: STL  0014        Store TOS into MP20
   039e: LDL  0013        Load local word MP19
   03a0: LDL  0014        Load local word MP20
   03a2: INCP 03          Inc field ptr (TOS+3)
   03a4: EQLSTR           String TOS-1 = TOS
   03a6: LDL  0014        Load local word MP20
   03a8: INCP 02          Inc field ptr (TOS+2)
   03aa: SLDC 04          Short load constant 4
   03ab: SLDC 00          Short load constant 0
   03ac: LDP              Load packed field (TOS)
   03ad: SLDC 00          Short load constant 0
   03ae: EQUI             Integer TOS-1 = TOS
   03af: LDL  0014        Load local word MP20
   03b1: INCP 02          Inc field ptr (TOS+2)
   03b3: SLDC 04          Short load constant 4
   03b4: SLDC 00          Short load constant 0
   03b5: LDP              Load packed field (TOS)
   03b6: SLDC 08          Short load constant 8
   03b7: EQUI             Integer TOS-1 = TOS
   03b8: LOR              Logical OR (TOS | TOS-1)
   03b9: LAND             Logical AND (TOS & TOS-1)
   03ba: STL  0005        Store TOS into MP5
   03bc: SLDL 05          Short load local MP5
   03bd: FJP  $043d       Jump if TOS false
   03bf: LLA  0004        Load local address MP4
   03c1: LLA  0003        Load local address MP3
   03c3: CSP  09          Call standard procedure 9 TIME
   03c5: SLDL 03          Short load local MP3
   03c6: LDL  0014        Load local word MP20
   03c8: IND  09          Static index and load word (TOS+9)
   03ca: SBI              Subtract integers (TOS-1 - TOS)
   03cb: LDCI 012c        Load word 300
   03ce: LEQI             Integer TOS-1 <= TOS
   03cf: SLDL 03          Short load local MP3
   03d0: LDL  0014        Load local word MP20
   03d2: IND  09          Static index and load word (TOS+9)
   03d4: SBI              Subtract integers (TOS-1 - TOS)
   03d5: SLDC 00          Short load constant 0
   03d6: GEQI             Integer TOS-1 >= TOS
   03d7: LAND             Logical AND (TOS & TOS-1)
   03d8: LOD  02 0001     Load word at G1 (SYSCOM)
   03db: INCP 1d          Inc field ptr (TOS+29)
   03dd: SLDC 01          Short load constant 1
   03de: SLDC 00          Short load constant 0
   03df: LDP              Load packed field (TOS)
   03e0: LAND             Logical AND (TOS & TOS-1)
   03e1: STL  0005        Store TOS into MP5
   03e3: SLDL 05          Short load local MP5
   03e4: LNOT             Logical NOT (~TOS)
   03e5: FJP  $0400       Jump if TOS false
   03e7: SLDL 02          Short load local MP2
   03e8: LLA  0006        Load local address MP6
   03ea: SLDC 00          Short load constant 0
   03eb: SLDC 1a          Short load constant 26
   03ec: SLDC 02          Short load constant 2
   03ed: SLDC 00          Short load constant 0
   03ee: CSP  05          Call standard procedure 5 UNITREAD
   03f0: CSP  22          Call standard procedure 34 IORESULT
   03f2: SLDC 00          Short load constant 0
   03f3: EQUI             Integer TOS-1 = TOS
   03f4: FJP  $0400       Jump if TOS false
   03f6: LDL  0014        Load local word MP20
   03f8: INCP 03          Inc field ptr (TOS+3)
   03fa: LLA  0009        Load local address MP9
   03fc: EQLSTR           String TOS-1 = TOS
   03fe: STL  0005        Store TOS into MP5
-> 0400: SLDL 05          Short load local MP5
   0401: FJP  $043d       Jump if TOS false
   0403: LDL  0014        Load local word MP20
   0405: SLDC 00          Short load constant 0
   0406: STO              Store indirect (TOS into TOS-1)
   0407: SLDL 02          Short load local MP2
   0408: SLDL 01          Short load local MP1
   0409: SLDC 00          Short load constant 0
   040a: LDL  0014        Load local word MP20
   040c: IND  08          Static index and load word (TOS+8)
   040e: SLDC 01          Short load constant 1
   040f: ADI              Add integers (TOS + TOS-1)
   0410: SLDC 1a          Short load constant 26
   0411: MPI              Multiply integers (TOS * TOS-1)
   0412: SLDC 02          Short load constant 2
   0413: SLDC 00          Short load constant 0
   0414: CSP  06          Call standard procedure 6 UNITWRITE
   0416: CSP  22          Call standard procedure 34 IORESULT
   0418: SLDC 00          Short load constant 0
   0419: EQUI             Integer TOS-1 = TOS
   041a: STL  0005        Store TOS into MP5
   041c: LDL  0014        Load local word MP20
   041e: SIND 01          Short index load *TOS+1
   041f: SLDC 0a          Short load constant 10
   0420: EQUI             Integer TOS-1 = TOS
   0421: FJP  $0432       Jump if TOS false
   0423: SLDL 02          Short load local MP2
   0424: SLDL 01          Short load local MP1
   0425: SLDC 00          Short load constant 0
   0426: LDL  0014        Load local word MP20
   0428: IND  08          Static index and load word (TOS+8)
   042a: SLDC 01          Short load constant 1
   042b: ADI              Add integers (TOS + TOS-1)
   042c: SLDC 1a          Short load constant 26
   042d: MPI              Multiply integers (TOS * TOS-1)
   042e: SLDC 06          Short load constant 6
   042f: SLDC 00          Short load constant 0
   0430: CSP  06          Call standard procedure 6 UNITWRITE
-> 0432: SLDL 05          Short load local MP5
   0433: FJP  $043d       Jump if TOS false
   0435: LLA  0004        Load local address MP4
   0437: LDL  0014        Load local word MP20
   0439: INCP 09          Inc field ptr (TOS+9)
   043b: CSP  09          Call standard procedure 9 TIME
-> 043d: SLDL 05          Short load local MP5
   043e: LNOT             Logical NOT (~TOS)
   043f: FJP  $0450       Jump if TOS false
   0441: LDL  0013        Load local word MP19
   0443: LSA  00          Load string address: ''
   0445: NOP              No operation
   0446: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0448: LDL  0013        Load local word MP19
   044a: INCP 05          Inc field ptr (TOS+5)
   044c: LDCI 7fff        Load word 32767
   044f: STO              Store indirect (TOS into TOS-1)
-> 0450: RNP  00          Return from nonbase procedure
  END

LL 1 entry 0000 exit 0227 parms=7 words data=86 words
###  FUNCTION SYSIO.SCANTITLE(FTITLE:STRING;VAR FVID:VID;VAR FTID:TID;VAR FSEGS:INTEGER;VAR FKIND:FILEKIND):BOOLEAN (11)
    MP1=RETVAL1:BOOLEAN
    MP3=FKIND:FILEKIND
    MP4=FSEGS:INTEGER
    MP5=FTID:TID
    MP6=FVID:VID
    MP7=FTITLE:STRING
    MP8
    MP49
    MP50
    MP51
    MP52
    MP53
  BEGIN
-> 0000: LLA  0008        Load local address MP8
   0002: SLDL 07          Short load local MP7
   0003: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0005: SLDL 06          Short load local MP6
   0006: NOP              No operation
   0007: LSA  00          Load string address: ''
   0009: SAS  07          String assign (TOS to TOS-1, 7 chars)
   000b: SLDL 05          Short load local MP5
   000c: NOP              No operation
   000d: LSA  00          Load string address: ''
   000f: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0011: SLDL 04          Short load local MP4
   0012: SLDC 00          Short load constant 0
   0013: STO              Store indirect (TOS into TOS-1)
   0014: SLDL 03          Short load local MP3
   0015: SLDC 00          Short load constant 0
   0016: STO              Store indirect (TOS into TOS-1)
   0017: SLDC 00          Short load constant 0
   0018: STL  0001        Store TOS into MP1
   001a: SLDC 01          Short load constant 1
   001b: STL  0032        Store TOS into MP50
-> 001d: LDL  0032        Load local word MP50
   001f: LLA  0008        Load local address MP8
   0021: SLDC 00          Short load constant 0
   0022: LDB              Load byte at byte ptr TOS-1 + TOS
   0023: LEQI             Integer TOS-1 <= TOS
   0024: FJP  $005b       Jump if TOS false
   0026: LLA  0008        Load local address MP8
   0028: LDL  0032        Load local word MP50
   002a: LDB              Load byte at byte ptr TOS-1 + TOS
   002b: STL  0033        Store TOS into MP51
   002d: LDL  0033        Load local word MP51
   002f: SLDC 20          Short load constant 32
   0030: LEQI             Integer TOS-1 <= TOS
   0031: FJP  $003d       Jump if TOS false
   0033: LLA  0008        Load local address MP8
   0035: LDL  0032        Load local word MP50
   0037: SLDC 01          Short load constant 1
   0038: CXP  00 1a       Call external procedure 26 in seg 0 SDELETE
   003b: UJP  $0059       Unconditional jump
-> 003d: LDL  0033        Load local word MP51
   003f: SLDC 61          Short load constant 97
   0040: GEQI             Integer TOS-1 >= TOS
   0041: LDL  0033        Load local word MP51
   0043: SLDC 7a          Short load constant 122
   0044: LEQI             Integer TOS-1 <= TOS
   0045: LAND             Logical AND (TOS & TOS-1)
   0046: FJP  $0053       Jump if TOS false
   0048: LLA  0008        Load local address MP8
   004a: LDL  0032        Load local word MP50
   004c: LDL  0033        Load local word MP51
   004e: SLDC 61          Short load constant 97
   004f: SBI              Subtract integers (TOS-1 - TOS)
   0050: SLDC 41          Short load constant 65
   0051: ADI              Add integers (TOS + TOS-1)
   0052: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0053: LDL  0032        Load local word MP50
   0055: SLDC 01          Short load constant 1
   0056: ADI              Add integers (TOS + TOS-1)
   0057: STL  0032        Store TOS into MP50
-> 0059: UJP  $001d       Unconditional jump
-> 005b: LLA  0008        Load local address MP8
   005d: SLDC 00          Short load constant 0
   005e: LDB              Load byte at byte ptr TOS-1 + TOS
   005f: SLDC 00          Short load constant 0
   0060: GRTI             Integer TOS-1 > TOS
   0061: FJP  $0227       Jump if TOS false
   0063: LLA  0008        Load local address MP8
   0065: SLDC 01          Short load constant 1
   0066: LDB              Load byte at byte ptr TOS-1 + TOS
   0067: SLDC 2a          Short load constant 42
   0068: EQUI             Integer TOS-1 = TOS
   0069: FJP  $0078       Jump if TOS false
   006b: SLDL 06          Short load local MP6
   006c: LDA  02 000e     Load addr G14 (SYVID)
   006f: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0071: LLA  0008        Load local address MP8
   0073: SLDC 01          Short load constant 1
   0074: SLDC 01          Short load constant 1
   0075: CXP  00 1a       Call external procedure 26 in seg 0 SDELETE
-> 0078: NOP              No operation
   0079: LSA  01          Load string address: ':'
   007c: LLA  0008        Load local address MP8
   007e: SLDC 00          Short load constant 0
   007f: SLDC 00          Short load constant 0
   0080: CXP  00 1b       Call external procedure 27 in seg 0 SPOS
   0083: STL  0032        Store TOS into MP50
   0085: LDL  0032        Load local word MP50
   0087: SLDC 01          Short load constant 1
   0088: LEQI             Integer TOS-1 <= TOS
   0089: FJP  $00a7       Jump if TOS false
   008b: SLDL 06          Short load local MP6
   008c: SLDC 00          Short load constant 0
   008d: LDB              Load byte at byte ptr TOS-1 + TOS
   008e: SLDC 00          Short load constant 0
   008f: EQUI             Integer TOS-1 = TOS
   0090: FJP  $0098       Jump if TOS false
   0092: SLDL 06          Short load local MP6
   0093: LDA  02 000a     Load addr G10 (DKVID)
   0096: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0098: LDL  0032        Load local word MP50
   009a: SLDC 01          Short load constant 1
   009b: EQUI             Integer TOS-1 = TOS
   009c: FJP  $00a5       Jump if TOS false
   009e: LLA  0008        Load local address MP8
   00a0: SLDC 01          Short load constant 1
   00a1: SLDC 01          Short load constant 1
   00a2: CXP  00 1a       Call external procedure 26 in seg 0 SDELETE
-> 00a5: UJP  $00c8       Unconditional jump
-> 00a7: LDL  0032        Load local word MP50
   00a9: SLDC 01          Short load constant 1
   00aa: SBI              Subtract integers (TOS-1 - TOS)
   00ab: SLDC 07          Short load constant 7
   00ac: LEQI             Integer TOS-1 <= TOS
   00ad: FJP  $00c8       Jump if TOS false
   00af: SLDL 06          Short load local MP6
   00b0: LLA  0008        Load local address MP8
   00b2: LLA  0035        Load local address MP53
   00b4: SLDC 01          Short load constant 1
   00b5: LDL  0032        Load local word MP50
   00b7: SLDC 01          Short load constant 1
   00b8: SBI              Subtract integers (TOS-1 - TOS)
   00b9: CXP  00 19       Call external procedure 25 in seg 0 SCOPY
   00bc: LLA  0035        Load local address MP53
   00be: SAS  07          String assign (TOS to TOS-1, 7 chars)
   00c0: LLA  0008        Load local address MP8
   00c2: SLDC 01          Short load constant 1
   00c3: LDL  0032        Load local word MP50
   00c5: CXP  00 1a       Call external procedure 26 in seg 0 SDELETE
-> 00c8: SLDL 06          Short load local MP6
   00c9: SLDC 00          Short load constant 0
   00ca: LDB              Load byte at byte ptr TOS-1 + TOS
   00cb: SLDC 00          Short load constant 0
   00cc: GRTI             Integer TOS-1 > TOS
   00cd: FJP  $0227       Jump if TOS false
   00cf: LSA  01          Load string address: '['
   00d2: NOP              No operation
   00d3: LLA  0008        Load local address MP8
   00d5: SLDC 00          Short load constant 0
   00d6: SLDC 00          Short load constant 0
   00d7: CXP  00 1b       Call external procedure 27 in seg 0 SPOS
   00da: STL  0032        Store TOS into MP50
   00dc: LDL  0032        Load local word MP50
   00de: SLDC 00          Short load constant 0
   00df: GRTI             Integer TOS-1 > TOS
   00e0: FJP  $00ea       Jump if TOS false
   00e2: LDL  0032        Load local word MP50
   00e4: SLDC 01          Short load constant 1
   00e5: SBI              Subtract integers (TOS-1 - TOS)
   00e6: STL  0032        Store TOS into MP50
   00e8: UJP  $00f0       Unconditional jump
-> 00ea: LLA  0008        Load local address MP8
   00ec: SLDC 00          Short load constant 0
   00ed: LDB              Load byte at byte ptr TOS-1 + TOS
   00ee: STL  0032        Store TOS into MP50
-> 00f0: LDL  0032        Load local word MP50
   00f2: SLDC 0f          Short load constant 15
   00f3: LEQI             Integer TOS-1 <= TOS
   00f4: FJP  $0227       Jump if TOS false
   00f6: LDL  0032        Load local word MP50
   00f8: SLDC 00          Short load constant 0
   00f9: GRTI             Integer TOS-1 > TOS
   00fa: FJP  $0113       Jump if TOS false
   00fc: SLDL 05          Short load local MP5
   00fd: LLA  0008        Load local address MP8
   00ff: LLA  0035        Load local address MP53
   0101: SLDC 01          Short load constant 1
   0102: LDL  0032        Load local word MP50
   0104: CXP  00 19       Call external procedure 25 in seg 0 SCOPY
   0107: LLA  0035        Load local address MP53
   0109: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   010b: LLA  0008        Load local address MP8
   010d: SLDC 01          Short load constant 1
   010e: LDL  0032        Load local word MP50
   0110: CXP  00 1a       Call external procedure 26 in seg 0 SDELETE
-> 0113: LLA  0008        Load local address MP8
   0115: SLDC 00          Short load constant 0
   0116: LDB              Load byte at byte ptr TOS-1 + TOS
   0117: SLDC 00          Short load constant 0
   0118: EQUI             Integer TOS-1 = TOS
   0119: FJP  $0120       Jump if TOS false
   011b: SLDC 01          Short load constant 1
   011c: STL  0034        Store TOS into MP52
   011e: UJP  $0197       Unconditional jump
-> 0120: SLDC 00          Short load constant 0
   0121: STL  0034        Store TOS into MP52
   0123: LSA  01          Load string address: ']'
   0126: NOP              No operation
   0127: LLA  0008        Load local address MP8
   0129: SLDC 00          Short load constant 0
   012a: SLDC 00          Short load constant 0
   012b: CXP  00 1b       Call external procedure 27 in seg 0 SPOS
   012e: STL  0031        Store TOS into MP49
   0130: LDL  0031        Load local word MP49
   0132: SLDC 02          Short load constant 2
   0133: EQUI             Integer TOS-1 = TOS
   0134: FJP  $013b       Jump if TOS false
   0136: SLDC 01          Short load constant 1
   0137: STL  0034        Store TOS into MP52
   0139: UJP  $0197       Unconditional jump
-> 013b: LDL  0031        Load local word MP49
   013d: SLDC 02          Short load constant 2
   013e: GRTI             Integer TOS-1 > TOS
   013f: FJP  $0197       Jump if TOS false
   0141: SLDC 01          Short load constant 1
   0142: STL  0034        Store TOS into MP52
   0144: SLDC 02          Short load constant 2
   0145: STL  0032        Store TOS into MP50
-> 0147: LLA  0008        Load local address MP8
   0149: LDL  0032        Load local word MP50
   014b: LDB              Load byte at byte ptr TOS-1 + TOS
   014c: STL  0033        Store TOS into MP51
   014e: LDL  0033        Load local word MP51
   0150: SLDC 30          Short load constant 48
   0151: GEQI             Integer TOS-1 >= TOS
   0152: LDL  0033        Load local word MP51
   0154: SLDC 39          Short load constant 57
   0155: LEQI             Integer TOS-1 <= TOS
   0156: LAND             Logical AND (TOS & TOS-1)
   0157: FJP  $0166       Jump if TOS false
   0159: SLDL 04          Short load local MP4
   015a: SLDL 04          Short load local MP4
   015b: SIND 00          Short index load *TOS+0
   015c: SLDC 0a          Short load constant 10
   015d: MPI              Multiply integers (TOS * TOS-1)
   015e: LDL  0033        Load local word MP51
   0160: SLDC 30          Short load constant 48
   0161: SBI              Subtract integers (TOS-1 - TOS)
   0162: ADI              Add integers (TOS + TOS-1)
   0163: STO              Store indirect (TOS into TOS-1)
   0164: UJP  $0169       Unconditional jump
-> 0166: SLDC 00          Short load constant 0
   0167: STL  0034        Store TOS into MP52
-> 0169: LDL  0032        Load local word MP50
   016b: SLDC 01          Short load constant 1
   016c: ADI              Add integers (TOS + TOS-1)
   016d: STL  0032        Store TOS into MP50
   016f: LDL  0032        Load local word MP50
   0171: LDL  0031        Load local word MP49
   0173: EQUI             Integer TOS-1 = TOS
   0174: LDL  0034        Load local word MP52
   0176: LNOT             Logical NOT (~TOS)
   0177: LOR              Logical OR (TOS | TOS-1)
   0178: FJP  $0147       Jump if TOS false
   017a: LDL  0032        Load local word MP50
   017c: SLDC 03          Short load constant 3
   017d: EQUI             Integer TOS-1 = TOS
   017e: LDL  0031        Load local word MP49
   0180: SLDC 03          Short load constant 3
   0181: EQUI             Integer TOS-1 = TOS
   0182: LAND             Logical AND (TOS & TOS-1)
   0183: FJP  $0197       Jump if TOS false
   0185: LLA  0008        Load local address MP8
   0187: LDL  0032        Load local word MP50
   0189: SLDC 01          Short load constant 1
   018a: SBI              Subtract integers (TOS-1 - TOS)
   018b: LDB              Load byte at byte ptr TOS-1 + TOS
   018c: SLDC 2a          Short load constant 42
   018d: EQUI             Integer TOS-1 = TOS
   018e: FJP  $0197       Jump if TOS false
   0190: SLDL 04          Short load local MP4
   0191: SLDC 01          Short load constant 1
   0192: NGI              Negate integer
   0193: STO              Store indirect (TOS into TOS-1)
   0194: SLDC 01          Short load constant 1
   0195: STL  0034        Store TOS into MP52
-> 0197: LDL  0034        Load local word MP52
   0199: STL  0001        Store TOS into MP1
   019b: LDL  0034        Load local word MP52
   019d: SLDL 05          Short load local MP5
   019e: SLDC 00          Short load constant 0
   019f: LDB              Load byte at byte ptr TOS-1 + TOS
   01a0: SLDC 05          Short load constant 5
   01a1: GRTI             Integer TOS-1 > TOS
   01a2: LAND             Logical AND (TOS & TOS-1)
   01a3: FJP  $0227       Jump if TOS false
   01a5: LLA  0008        Load local address MP8
   01a7: SLDL 05          Short load local MP5
   01a8: LLA  0035        Load local address MP53
   01aa: SLDL 05          Short load local MP5
   01ab: SLDC 00          Short load constant 0
   01ac: LDB              Load byte at byte ptr TOS-1 + TOS
   01ad: SLDC 04          Short load constant 4
   01ae: SBI              Subtract integers (TOS-1 - TOS)
   01af: SLDC 05          Short load constant 5
   01b0: CXP  00 19       Call external procedure 25 in seg 0 SCOPY
   01b3: LLA  0035        Load local address MP53
   01b5: SAS  50          String assign (TOS to TOS-1, 80 chars)
   01b7: LLA  0008        Load local address MP8
   01b9: LSA  05          Load string address: '.TEXT'
   01c0: NOP              No operation
   01c1: EQLSTR           String TOS-1 = TOS
   01c3: FJP  $01ca       Jump if TOS false
   01c5: SLDL 03          Short load local MP3
   01c6: SLDC 03          Short load constant 3
   01c7: STO              Store indirect (TOS into TOS-1)
   01c8: UJP  $0227       Unconditional jump
-> 01ca: LLA  0008        Load local address MP8
   01cc: NOP              No operation
   01cd: LSA  05          Load string address: '.CODE'
   01d4: EQLSTR           String TOS-1 = TOS
   01d6: FJP  $01dd       Jump if TOS false
   01d8: SLDL 03          Short load local MP3
   01d9: SLDC 02          Short load constant 2
   01da: STO              Store indirect (TOS into TOS-1)
   01db: UJP  $0227       Unconditional jump
-> 01dd: LLA  0008        Load local address MP8
   01df: LSA  05          Load string address: '.BACK'
   01e6: NOP              No operation
   01e7: EQLSTR           String TOS-1 = TOS
   01e9: FJP  $01f0       Jump if TOS false
   01eb: SLDL 03          Short load local MP3
   01ec: SLDC 03          Short load constant 3
   01ed: STO              Store indirect (TOS into TOS-1)
   01ee: UJP  $0227       Unconditional jump
-> 01f0: LLA  0008        Load local address MP8
   01f2: NOP              No operation
   01f3: LSA  05          Load string address: '.INFO'
   01fa: EQLSTR           String TOS-1 = TOS
   01fc: FJP  $0203       Jump if TOS false
   01fe: SLDL 03          Short load local MP3
   01ff: SLDC 04          Short load constant 4
   0200: STO              Store indirect (TOS into TOS-1)
   0201: UJP  $0227       Unconditional jump
-> 0203: LLA  0008        Load local address MP8
   0205: LSA  05          Load string address: '.GRAF'
   020c: NOP              No operation
   020d: EQLSTR           String TOS-1 = TOS
   020f: FJP  $0216       Jump if TOS false
   0211: SLDL 03          Short load local MP3
   0212: SLDC 06          Short load constant 6
   0213: STO              Store indirect (TOS into TOS-1)
   0214: UJP  $0227       Unconditional jump
-> 0216: LLA  0008        Load local address MP8
   0218: NOP              No operation
   0219: LSA  05          Load string address: '.FOTO'
   0220: EQLSTR           String TOS-1 = TOS
   0222: FJP  $0227       Jump if TOS false
   0224: SLDL 03          Short load local MP3
   0225: SLDC 07          Short load constant 7
   0226: STO              Store indirect (TOS into TOS-1)
-> 0227: RNP  01          Return from nonbase procedure
  END

LL 1 entry 05c4 exit 0602 parms=5 words data=3 words
###  FUNCTION SYSIO.DIRSEARCH(VAR FTID:TID;FINDPERM:BOOLEAN;FDIR:DIRP):DIRRANGE (12)
    MP1=DIRSEARCH:DIRRANGE
    MP3=FDIR:DIRP
    MP4=FINDPERM:BOOLEAN
    MP5=FTID:TID
    MP6=I:INTEGER
    MP7=FOUND:BOOLEAN
    MP8=THISDIR
  BEGIN
    DIRSEARCH := 0
-> 05c4: SLDC 00          Short load constant 0
   05c5: STL  0001        Store TOS into MP1 (DIRSEARCH)
    FOUND := FALSE
   05c7: SLDC 00          Short load constant 0
   05c8: STL  0007        Store TOS into MP7 (FOUND)
    I := 1
   05ca: SLDC 01          Short load constant 1
   05cb: STL  0006        Store TOS into MP6 (I)
    WHILE I <= FDIR[0].DNUMFILES AND NOT FOUND DO
-> 05cd: SLDL 06          Short load local MP6 (I)
   05ce: SLDL 03          Short load local MP3 (FDIR)
   05cf: SLDC 00          Short load constant 0
   05d0: IXA  0d          Index array (TOS-1 + TOS * 13)
   05d2: IND  08          Static index and load word (TOS+8) (DNUMFILES)
   05d4: LEQI             Integer TOS-1 <= TOS
   05d5: SLDL 07          Short load local MP7 (FOUND)
   05d6: LNOT             Logical NOT (~TOS)
   05d7: LAND             Logical AND (TOS & TOS-1)
   05d8: FJP  $0602       Jump if TOS false
    BEGIN
      THISDIR := FDIR[I]
   05da: SLDL 03          Short load local MP3 (FDIR)
   05db: SLDL 06          Short load local MP6 (I)
   05dc: IXA  0d          Index array (TOS-1 + TOS * 13)
   05de: STL  0008        Store TOS into MP8 (THISDIR)
      IF THISDIR.DTID = FTID THEN
   05e0: SLDL 08          Short load local MP8 (THISDIR)
   05e1: INCP 03          Inc field ptr (TOS+3) (DTID)
   05e3: SLDL 05          Short load local MP5 (FTID)
   05e4: EQLSTR           String TOS-1 = TOS
   05e6: FJP  $05fb       Jump if TOS false
      BEGIN
        IF FINDPERM = (THISDIR.DACCESS.YEAR <> 100) THEN
   05e8: SLDL 04          Short load local MP4 (FINDPERM)
   05e9: SLDL 08          Short load local MP8 (THISDIR)
   05ea: INCP 0c          Inc field ptr (TOS+12) (DACCESS)
   05ec: SLDC 07          Short load constant 7
   05ed: SLDC 09          Short load constant 9
   05ee: LDP              Load packed field (TOS) (YEAR)
   05ef: SLDC 64          Short load constant 100
   05f0: NEQI             Integer TOS-1 <> TOS
   05f1: EQLBOOL          Boolean TOS-1 = TOS
   05f3: FJP  $05fb       Jump if TOS false
        BEGIN
          DIRSEARCH := I
   05f5: SLDL 06          Short load local MP6 (I)
   05f6: STL  0001        Store TOS into MP1 (DIRSEARCH)
          FOUND := TRUE
   05f8: SLDC 01          Short load constant 1
   05f9: STL  0007        Store TOS into MP7 (FOUND)
        END
      END
      I := I + 1
-> 05fb: SLDL 06          Short load local MP6 (I)
   05fc: SLDC 01          Short load constant 1
   05fd: ADI              Add integers (TOS + TOS-1)
   05fe: STL  0006        Store TOS into MP6 (I)
   0600: UJP  $05cd       Unconditional jump
    END
-> 0602: RNP  01          Return from nonbase procedure
  END

LL 1 entry 06fc exit 07de parms=1 words data=2 words
###  PROCEDURE SYSIO.RESETER(VAR F:FIB) (13)
    MP1=PARAM1
    MP2
    MP3
  BEGIN
-> 06fc: SLDL 01          Short load local MP1
   06fd: STL  0003        Store TOS into MP3
   06ff: SLDL 03          Short load local MP3
   0700: INCP 0e          Inc field ptr (TOS+14)
   0702: SLDC 00          Short load constant 0
   0703: STO              Store indirect (TOS into TOS-1)
   0704: SLDL 03          Short load local MP3
   0705: INCP 01          Inc field ptr (TOS+1)
   0707: SLDC 00          Short load constant 0
   0708: STO              Store indirect (TOS into TOS-1)
   0709: SLDL 03          Short load local MP3
   070a: INCP 02          Inc field ptr (TOS+2)
   070c: SLDC 00          Short load constant 0
   070d: STO              Store indirect (TOS into TOS-1)
   070e: SLDL 03          Short load local MP3
   070f: SIND 06          Short index load *TOS+6
   0710: FJP  $07de       Jump if TOS false
   0712: SLDL 03          Short load local MP3
   0713: IND  0d          Static index and load word (TOS+13)
   0715: SLDL 03          Short load local MP3
   0716: IND  0c          Static index and load word (TOS+12)
   0718: GRTI             Integer TOS-1 > TOS
   0719: STL  0002        Store TOS into MP2
   071b: SLDL 02          Short load local MP2
   071c: FJP  $0725       Jump if TOS false
   071e: SLDL 03          Short load local MP3
   071f: INCP 0c          Inc field ptr (TOS+12)
   0721: SLDL 03          Short load local MP3
   0722: IND  0d          Static index and load word (TOS+13)
   0724: STO              Store indirect (TOS into TOS-1)
-> 0725: SLDL 03          Short load local MP3
   0726: IND  1d          Static index and load word (TOS+29)
   0728: FJP  $07c6       Jump if TOS false
   072a: SLDL 02          Short load local MP2
   072b: FJP  $0736       Jump if TOS false
   072d: SLDL 03          Short load local MP3
   072e: INCP 1e          Inc field ptr (TOS+30)
   0730: SLDL 03          Short load local MP3
   0731: IND  1f          Static index and load word (TOS+31)
   0733: STO              Store indirect (TOS into TOS-1)
   0734: UJP  $0752       Unconditional jump
-> 0736: SLDL 03          Short load local MP3
   0737: IND  0d          Static index and load word (TOS+13)
   0739: SLDL 03          Short load local MP3
   073a: IND  0c          Static index and load word (TOS+12)
   073c: EQUI             Integer TOS-1 = TOS
   073d: FJP  $0752       Jump if TOS false
   073f: SLDL 03          Short load local MP3
   0740: IND  1f          Static index and load word (TOS+31)
   0742: SLDL 03          Short load local MP3
   0743: IND  1e          Static index and load word (TOS+30)
   0745: GRTI             Integer TOS-1 > TOS
   0746: FJP  $0752       Jump if TOS false
   0748: SLDC 01          Short load constant 1
   0749: STL  0002        Store TOS into MP2
   074b: SLDL 03          Short load local MP3
   074c: INCP 1e          Inc field ptr (TOS+30)
   074e: SLDL 03          Short load local MP3
   074f: IND  1f          Static index and load word (TOS+31)
   0751: STO              Store indirect (TOS into TOS-1)
-> 0752: SLDL 03          Short load local MP3
   0753: IND  20          Static index and load word (TOS+32)
   0755: FJP  $07bf       Jump if TOS false
   0757: SLDL 03          Short load local MP3
   0758: INCP 20          Inc field ptr (TOS+32)
   075a: SLDC 00          Short load constant 0
   075b: STO              Store indirect (TOS into TOS-1)
   075c: SLDL 03          Short load local MP3
   075d: INCP 0f          Inc field ptr (TOS+15)
   075f: SLDC 01          Short load constant 1
   0760: STO              Store indirect (TOS into TOS-1)
   0761: SLDL 02          Short load local MP2
   0762: FJP  $0774       Jump if TOS false
   0764: SLDL 03          Short load local MP3
   0765: INCP 21          Inc field ptr (TOS+33)
   0767: SLDL 03          Short load local MP3
   0768: IND  1f          Static index and load word (TOS+31)
   076a: LDCI 0200        Load word 512
   076d: SLDL 03          Short load local MP3
   076e: IND  1f          Static index and load word (TOS+31)
   0770: SBI              Subtract integers (TOS-1 - TOS)
   0771: SLDC 00          Short load constant 0
   0772: CSP  0a          Call standard procedure 10 FLCH
-> 0774: SLDL 03          Short load local MP3
   0775: SIND 07          Short index load *TOS+7
   0776: SLDL 03          Short load local MP3
   0777: INCP 21          Inc field ptr (TOS+33)
   0779: SLDC 00          Short load constant 0
   077a: LDCI 0200        Load word 512
   077d: SLDL 03          Short load local MP3
   077e: IND  10          Static index and load word (TOS+16)
   0780: SLDL 03          Short load local MP3
   0781: IND  0d          Static index and load word (TOS+13)
   0783: ADI              Add integers (TOS + TOS-1)
   0784: SLDC 01          Short load constant 1
   0785: SBI              Subtract integers (TOS-1 - TOS)
   0786: SLDC 00          Short load constant 0
   0787: CSP  06          Call standard procedure 6 UNITWRITE
   0789: SLDL 02          Short load local MP2
   078a: SLDL 03          Short load local MP3
   078b: INCP 12          Inc field ptr (TOS+18)
   078d: SLDC 04          Short load constant 4
   078e: SLDC 00          Short load constant 0
   078f: LDP              Load packed field (TOS)
   0790: SLDC 03          Short load constant 3
   0791: EQUI             Integer TOS-1 = TOS
   0792: LAND             Logical AND (TOS & TOS-1)
   0793: SLDL 03          Short load local MP3
   0794: IND  0d          Static index and load word (TOS+13)
   0796: LAND             Logical AND (TOS & TOS-1)
   0797: FJP  $07bf       Jump if TOS false
   0799: SLDL 03          Short load local MP3
   079a: INCP 0c          Inc field ptr (TOS+12)
   079c: SLDL 03          Short load local MP3
   079d: IND  0c          Static index and load word (TOS+12)
   079f: SLDC 01          Short load constant 1
   07a0: ADI              Add integers (TOS + TOS-1)
   07a1: STO              Store indirect (TOS into TOS-1)
   07a2: SLDL 03          Short load local MP3
   07a3: INCP 21          Inc field ptr (TOS+33)
   07a5: SLDC 00          Short load constant 0
   07a6: LDCI 0200        Load word 512
   07a9: SLDC 00          Short load constant 0
   07aa: CSP  0a          Call standard procedure 10 FLCH
   07ac: SLDL 03          Short load local MP3
   07ad: SIND 07          Short index load *TOS+7
   07ae: SLDL 03          Short load local MP3
   07af: INCP 21          Inc field ptr (TOS+33)
   07b1: SLDC 00          Short load constant 0
   07b2: LDCI 0200        Load word 512
   07b5: SLDL 03          Short load local MP3
   07b6: IND  10          Static index and load word (TOS+16)
   07b8: SLDL 03          Short load local MP3
   07b9: IND  0d          Static index and load word (TOS+13)
   07bb: ADI              Add integers (TOS + TOS-1)
   07bc: SLDC 00          Short load constant 0
   07bd: CSP  06          Call standard procedure 6 UNITWRITE
-> 07bf: SLDL 03          Short load local MP3
   07c0: INCP 1f          Inc field ptr (TOS+31)
   07c2: LDCI 0200        Load word 512
   07c5: STO              Store indirect (TOS into TOS-1)
-> 07c6: SLDL 03          Short load local MP3
   07c7: INCP 0d          Inc field ptr (TOS+13)
   07c9: SLDC 00          Short load constant 0
   07ca: STO              Store indirect (TOS into TOS-1)
   07cb: SLDL 03          Short load local MP3
   07cc: IND  1d          Static index and load word (TOS+29)
   07ce: SLDL 03          Short load local MP3
   07cf: INCP 12          Inc field ptr (TOS+18)
   07d1: SLDC 04          Short load constant 4
   07d2: SLDC 00          Short load constant 0
   07d3: LDP              Load packed field (TOS)
   07d4: SLDC 03          Short load constant 3
   07d5: EQUI             Integer TOS-1 = TOS
   07d6: LAND             Logical AND (TOS & TOS-1)
   07d7: FJP  $07de       Jump if TOS false
   07d9: SLDL 03          Short load local MP3
   07da: INCP 0d          Inc field ptr (TOS+13)
   07dc: SLDC 02          Short load constant 2
   07dd: STO              Store indirect (TOS into TOS-1)
-> 07de: RNP  00          Return from nonbase procedure
  END

LL 2 entry 085e exit 094a parms=6 words data=20 words
###    FUNCTION SYSIO.ENTERTEMP(VAR FTID:TID;FSEGS:INTEGER;FKIND:FILEKIND;FDIR:DIRP):DIRRANGE (14)
      MP1=ENTERTEMP:DIRRANGE
      MP3=FDIR:DIRP
      MP4=FKIND:FILEKIND
      MP5=FSEGS:INTEGER
      MP6=FTID:TID
      MP7=SINX:DIRRANGE
      MP8=DINX:DIRRANGE
      MP9=LASTI:DIRRANGE
      MP10=I:INTEGER
      MP11=RT11ISH:BOOLEAN
      MP12=SSEGS:INTEGER
      MP13=:DIRENTRY
      MP14
      MP15
      MP16
      MP24
      MP25
      MP26
    BEGIN
      DINX := 0
-> 085e: SLDC 00          Short load constant 0
   085f: STL  0008        Store TOS into MP8 (DINX)
      LASTI := FDIR[0].DNUMFILES
   0861: SLDL 03          Short load local MP3 (FDIR)
   0862: SLDC 00          Short load constant 0
   0863: IXA  0d          Index array (TOS-1 + TOS * 13)
   0865: IND  08          Static index and load word (TOS+8)
   0867: STL  0009        Store TOS into MP9 (LASTI)
      SINX := 0
   0869: SLDC 00          Short load constant 0
   086a: STL  0007        Store TOS into MP7 (SINX)
      SSEGS := 0
   086c: SLDC 00          Short load constant 0
   086d: STL  000c        Store TOS into MP12 (SSEGS)
      IF FSEGS <= 0 THEN
   086f: SLDL 05          Short load local MP5 (FSEGS)
   0870: SLDC 00          Short load constant 0
   0871: LEQI             Integer TOS-1 <= TOS
   0872: FJP  $08c5       Jump if TOS false
      BEGIN
        RT11ISH := FSEGS < 0
   0874: SLDL 05          Short load local MP5 (FSEGS)
   0875: SLDC 00          Short load constant 0
   0876: LESI             Integer TOS-1 < TOS
   0877: STL  000b        Store TOS into MP11 (RT11ISH)
        FOR I := 1 TO LASTI DO
   0879: SLDC 01          Short load constant 1
   087a: STL  000a        Store TOS into MP10 (I)
   087c: SLDL 09          Short load local MP9 (LASTI)
   087d: STL  001a        Store TOS into MP26
-> 087f: SLDL 0a          Short load local MP10 (I)
   0880: LDL  001a        Load local word MP26
   0882: LEQI             Integer TOS-1 <= TOS
   0883: FJP  $089b       Jump if TOS false
        BEGIN
   0885: SLDL 0a          Short load local MP10 (I)
   0886: SLDL 03          Short load local MP3 (FDIR)
   0887: SLDL 0a          Short load local MP10 (I)
   0888: SLDC 01          Short load constant 1
   0889: SBI              Subtract integers (TOS-1 - TOS)
   088a: IXA  0d          Index array (TOS-1 + TOS * 13)
   088c: SIND 01          Short index load *TOS+1 (DLASTBLK)
   088d: SLDL 03          Short load local MP3 (FDIR)
   088e: SLDL 0a          Short load local MP10 (I)
   088f: IXA  0d          Index array (TOS-1 + TOS * 13)
   0891: SIND 00          Short index load *TOS+0 (DFIRSTBLK)
   0892: CLP  0f          Call local procedure 15 (child) (FINDMAX)
   0894: SLDL 0a          Short load local MP10 (I)
   0895: SLDC 01          Short load constant 1
   0896: ADI              Add integers (TOS + TOS-1)
   0897: STL  000a        Store TOS into MP10 (I)
   0899: UJP  $087f       Unconditional jump
        END
-> 089b: SLDL 09          Short load local MP9 (LASTI)
   089c: SLDC 01          Short load constant 1
   089d: ADI              Add integers (TOS + TOS-1)
   089e: SLDL 03          Short load local MP3 (FDIR)
   089f: SLDL 09          Short load local MP9 (LASTI)
   08a0: IXA  0d          Index array (TOS-1 + TOS * 13)
   08a2: SIND 01          Short index load *TOS+1 (DLASTBLK)
   08a3: SLDL 03          Short load local MP3 (FDIR)
   08a4: SLDC 00          Short load constant 0
   08a5: IXA  0d          Index array (TOS-1 + TOS * 13)
   08a7: SIND 07          Short index load *TOS+7(DEOVBLK)
   08a8: CLP  0f          Call local procedure 15 (child) (FINDMAX)
   08aa: SLDL 0b          Short load local MP11 (RT11ISH)
   08ab: FJP  $08c3       Jump if TOS false
   08ad: SLDL 05          Short load local MP5 (FSEGS)
   08ae: SLDC 02          Short load constant 2
   08af: DVI              Divide integers (TOS-1 / TOS)
   08b0: SLDL 0c          Short load local MP12 (SSEGS)
   08b1: LEQI             Integer TOS-1 <= TOS
   08b2: FJP  $08bc       Jump if TOS false
   08b4: SLDL 0c          Short load local MP12 (SSEGS)
   08b5: STL  0005        Store TOS into MP5 (FSEGS)
   08b7: SLDL 07          Short load local MP7 (SINX)
   08b8: STL  0008        Store TOS into MP8 (DINX)
   08ba: UJP  $08c3       Unconditional jump
-> 08bc: SLDL 05          Short load local MP5 (FSEGS)
   08bd: SLDC 01          Short load constant 1
   08be: ADI              Add integers (TOS + TOS-1)
   08bf: SLDC 02          Short load constant 2
   08c0: DVI              Divide integers (TOS-1 / TOS)
   08c1: STL  0005        Store TOS into MP5 (FSEGS)
-> 08c3: UJP  $0904       Unconditional jump
      END ELSE BEGIN
-> 08c5: SLDC 01          Short load constant 1
   08c6: STL  000a        Store TOS into MP10 (I)
-> 08c8: SLDL 0a          Short load local MP10 (I)
   08c9: SLDL 09          Short load local MP9 (LASTI)
   08ca: LEQI             Integer TOS-1 <= TOS
   08cb: FJP  $08eb       Jump if TOS false
   08cd: SLDL 03          Short load local MP3 (FDIR)
   08ce: SLDL 0a          Short load local MP10 (I)
   08cf: IXA  0d          Index array (TOS-1 + TOS * 13)
   08d1: SIND 00          Short index load *TOS+0 (DFIRSTBLK)
   08d2: SLDL 03          Short load local MP3 (FDIR)
   08d3: SLDL 0a          Short load local MP10 (I)
   08d4: SLDC 01          Short load constant 1
   08d5: SBI              Subtract integers (TOS-1 - TOS)
   08d6: IXA  0d          Index array (TOS-1 + TOS * 13)
   08d8: SIND 01          Short index load *TOS+1 (DLASTBLK)
   08d9: SBI              Subtract integers (TOS-1 - TOS)
   08da: SLDL 05          Short load local MP5 (FSEGS)
   08db: GEQI             Integer TOS-1 >= TOS
   08dc: FJP  $08e4       Jump if TOS false
   08de: SLDL 0a          Short load local MP10 (I)
   08df: STL  0008        Store TOS into MP8 (DINX)
   08e1: SLDL 09          Short load local MP9 (LASTI)
   08e2: STL  000a        Store TOS into MP10 (I)
-> 08e4: SLDL 0a          Short load local MP10 (I)
   08e5: SLDC 01          Short load constant 1
   08e6: ADI              Add integers (TOS + TOS-1)
   08e7: STL  000a        Store TOS into MP10 (I)
   08e9: UJP  $08c8       Unconditional jump
-> 08eb: SLDL 08          Short load local MP8 (DINX)
   08ec: SLDC 00          Short load constant 0
   08ed: EQUI             Integer TOS-1 = TOS
   08ee: FJP  $0904       Jump if TOS false
   08f0: SLDL 03          Short load local MP3 (FDIR)
   08f1: SLDC 00          Short load constant 0
   08f2: IXA  0d          Index array (TOS-1 + TOS * 13)
   08f4: SIND 07          Short index load *TOS+7 (DEOVBLK)
   08f5: SLDL 03          Short load local MP3 (FDIR)
   08f6: SLDL 09          Short load local MP9 (LASTI)
   08f7: IXA  0d          Index array (TOS-1 + TOS * 13)
   08f9: SIND 01          Short index load *TOS+1 (DLASTBLK)
   08fa: SBI              Subtract integers (TOS-1 - TOS)
   08fb: SLDL 05          Short load local MP5 (FSEGS)
   08fc: GEQI             Integer TOS-1 >= TOS
   08fd: FJP  $0904       Jump if TOS false
   08ff: SLDL 09          Short load local MP9 (LASTI)
   0900: SLDC 01          Short load constant 1
   0901: ADI              Add integers (TOS + TOS-1)
   0902: STL  0008        Store TOS into MP8 (DINX)
      END
-> 0904: SLDL 09          Short load local MP9 (LASTI)
   0905: SLDC 4d          Short load constant 77
   0906: EQUI             Integer TOS-1 = TOS
   0907: FJP  $090c       Jump if TOS false
   0909: SLDC 00          Short load constant 0
   090a: STL  0008        Store TOS into MP8 (DINX)
-> 090c: SLDL 08          Short load local MP8 (DINX)
   090d: SLDC 00          Short load constant 0
   090e: GRTI             Integer TOS-1 > TOS
   090f: FJP  $0947       Jump if TOS false
   0911: SLDL 03          Short load local MP3 (FDIR)
   0912: SLDL 08          Short load local MP8 (DINX)
   0913: SLDC 01          Short load constant 1
   0914: SBI              Subtract integers (TOS-1 - TOS)
   0915: IXA  0d          Index array (TOS-1 + TOS * 13)
   0917: SIND 01          Short index load *TOS+1 (DLASTBLK)
   0918: STL  000d        Store TOS into MP13
   091a: SLDL 0d          Short load local MP13
   091b: SLDL 05          Short load local MP5 (FSEGS)
   091c: ADI              Add integers (TOS + TOS-1)
   091d: STL  000e        Store TOS into MP14
   091f: LLA  000f        Load local address MP15
   0921: SLDC 04          Short load constant 4
   0922: SLDC 00          Short load constant 0
   0923: SLDL 04          Short load local MP4 (FKIND)
   0924: STP              Store packed field (TOS into TOS-1)
   0925: LLA  0010        Load local address MP16
   0927: SLDL 06          Short load local MP6 (FTID)
   0928: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   092a: LDCI 0200        Load word 512
   092d: STL  0018        Store TOS into MP24
   092f: LLA  0019        Load local address MP25
   0931: SLDC 04          Short load constant 4
   0932: SLDC 00          Short load constant 0
   0933: SLDC 00          Short load constant 0
   0934: STP              Store packed field (TOS into TOS-1)
   0935: LLA  0019        Load local address MP25
   0937: SLDC 05          Short load constant 5
   0938: SLDC 04          Short load constant 4
   0939: SLDC 00          Short load constant 0
   093a: STP              Store packed field (TOS into TOS-1)
   093b: LLA  0019        Load local address MP25
   093d: SLDC 07          Short load constant 7
   093e: SLDC 09          Short load constant 9
   093f: SLDC 64          Short load constant 100
   0940: STP              Store packed field (TOS into TOS-1)
   0941: LLA  000d        Load local address MP13 (:DIRENTRY)
   0943: SLDL 08          Short load local MP8 (DINX)
   0944: SLDL 03          Short load local MP3 (FDIR)
   0945: CGP  07          Call global procedure 7 (lexLevel 1, curr seg) (INSENTRY)
-> 0947: SLDL 08          Short load local MP8 (DINX)
   0948: STL  0001        Store TOS into MP1 (ENTERTEMP)
-> 094a: RNP  01          Return from nonbase procedure
    END

LL 3 entry 0820 exit 0851 parms=3 words data=1 words
###      PROCEDURE SYSIO.FINDMAX(CURINX:DIRRANGE;FIRSTOPEN,NEXTUSED:INTEGER) (15)
        MP1=NEXTUSED:INTEGER
        MP2=FIRSTOPEN:INTEGER
        MP3=CURINX:DIRRANGE
        MP4=FREEAREA:INTEGER
      BEGIN
-> 0820: SLDL 01          Short load local MP1
   0821: SLDL 02          Short load local MP2
   0822: SBI              Subtract integers (TOS-1 - TOS)
   0823: STL  0004        Store TOS into MP4
   0825: SLDL 04          Short load local MP4
   0826: LOD  01 0005     Load word at L2_5
   0829: GRTI             Integer TOS-1 > TOS
   082a: FJP  $0842       Jump if TOS false
   082c: LOD  01 0008     Load word at L2_8
   082f: STR  01 0007     Store TOS to L27
   0832: LOD  01 0005     Load word at L2_5
   0835: STR  01 000c     Store TOS to L212
   0838: SLDL 03          Short load local MP3
   0839: STR  01 0008     Store TOS to L28
   083c: SLDL 04          Short load local MP4
   083d: STR  01 0005     Store TOS to L25
   0840: UJP  $0851       Unconditional jump
-> 0842: SLDL 04          Short load local MP4
   0843: LOD  01 000c     Load word at L2_12
   0846: GRTI             Integer TOS-1 > TOS
   0847: FJP  $0851       Jump if TOS false
   0849: SLDL 04          Short load local MP4
   084a: STR  01 000c     Store TOS to L212
   084d: SLDL 03          Short load local MP3
   084e: STR  01 0007     Store TOS to L27
-> 0851: RNP  00          Return from nonbase procedure
      END

## PRINTERR (3) segment
Processing segment 3 named 'PRINTERR' containing 1 procedures/functions...
{ 
  PRINTERR procedures:
  PROCEDURE PRINTERR #1
}

LL 0 entry 0000 exit 0004 parms=0 words data=0 words
### PROCEDURE PRINTERR.PRINTERR (1)
BEGIN
  EXECERROR(9) { 'system internal inconsistency' }
-> 0000: SLDC 09          Short load constant 9
   0001: CXP  00 02       Call external procedure 2 in seg 0 EXECERROR
-> 0004: RBP  00          Return from base procedure
END

## INITIALI (4) segment

{
   INITIALI procedures:
   PROCEDURE INITIALI #1
     PROCEDURE INITSYSCOM #2
       PROCEDURE INIT_FILLER(FILLER:STRING) #3
       PROCEDURE SETPREFIXEDCRTCTL(WHICH:INTEGER;COMMANDCHAR:CHAR) #4
       PROCEDURE SETPREFIXEDCRTINFO(WHICH:INTEGER;COMMANDCHAR:CHAR) #5
     PROCEDURE INITUNITABLE #6
       PROCEDURE DISABLE80COL #7
       PROCEDURE INIT_ENTRY(LUNIT:UNITNUM; UNIT_NAME:VID) #8
     PROCEDURE INITHEAP #9
     PROCEDURE INITFILES #10
}
Processing segment 4 named 'INITIALI' containing 10 procedures/functions...

LL 0 entry 04ce exit 050f parms=0 words data=304 words
### PROCEDURE INITIALI.INITIALI (1)
BEGIN
  GOTO 1
-> 04ce: UJP  $0514       Unconditional jump
  2:
  JUSTBOOTED := EMPTYHEAP = NIL
-> 04d0: LOD  01 0005     Load word at G5 (EMPTYHEAP)
   04d3: LDCN             Load constant NIL
   04d4: EQUI             Integer TOS-1 = TOS
   04d5: STR  01 00b5     Store TOS to G181 (JUSTBOOTED)
  IF JUSTBOOTED THEN
   04d9: LOD  01 00b5     Load word at G181 (JUSTBOOTED)
   04dd: FJP  $04e3       Jump if TOS false
  BEGIN
    INITHEAP
   04df: CLP  09          Call local procedure 9 (child) (INITHEAP)
   04e1: UJP  $04e8       Unconditional jump
  END ELSE BEGIN
    RELEASE(EMPTYHEAP)
-> 04e3: LDA  01 0005     Load addr G5 (EMPTYHEAP)
   04e6: CSP  21          Call standard procedure 33 RELEASE
  END
  SINGLEDRIVESYSTEM := FALSE
-> 04e8: SLDC 00          Short load constant 0
   04e9: STR  01 01d8     Store TOS to G472 (SINGLEDRIVESYSTEM)
  INITIALI.INITUNITABLE
   04ed: CLP  06          Call local procedure 6 (child) (INITUNITABLE)
  FILLCHAR(DATASEGS,0,4,0)
   04ef: LDA  01 006d     Load addr G109 (DATASEGS)
   04f2: SLDC 00          Short load constant 0
   04f3: SLDC 04          Short load constant 4
   04f4: SLDC 00          Short load constant 0
   04f5: CSP  0a          Call standard procedure 10 FLCH
  INITFILES
   04f7: CLP  0a          Call local procedure 10 (child) INITFILES
  INITSYSCOM
   04f9: CLP  02          Call local procedure 2 (child) (INITSYSCOM)
  GLOBALTITLE := ''
   04fb: LDA  01 007f     Load addr G127 (GLOBALTITLE)
   04fe: NOP              No operation
   04ff: LSA  00          Load string address: ''
   0501: SAS  17          String assign (TOS to TOS-1, 23 chars)
  G139 := ''
   0503: LDA  01 008b     Load addr G139
   0507: LSA  00          Load string address: ''
   0509: NOP              No operation
   050a: SAS  50          String assign (TOS to TOS-1, 80 chars)
  CLEARSCREEN
   050c: CXP  00 1f       Call external procedure 31 in seg 0 (CLEARSCREEN)
  UNLOADSEGMENT(SYSIO)
-> 050f: SLDC 02          Short load constant 2
   0510: CSP  16          Call standard procedure 22 UNLOADSEGMENT
  GOTO 3
   0512: UJP  $0519       Unconditional jump
  1:
  LOADSEGMENT(SYSIO)
-> 0514: SLDC 02          Short load constant 2
   0515: CSP  15          Call standard procedure 21 LOADSEGMENT
  GOTO 2
   0517: UJP  $04d0       Unconditional jump
  3:
-> 0519: RBP  00          Return from base procedure
END

LL 1 entry 007c exit 0237 parms=0 words data=158 words
###  PROCEDURE INITIALI.INITSYSCOM (2)
    BASE15=FILEMISCINFO:FIB,FILEMISCINFO.FWINDOW:WINDOWP
    BASE20=FILEMISCINFO.FISOPEN:BOOLEAN
    BASE22=FILEMISCINFO.FUNIT:UNITNUM
    BASE31=FILEMISCINFO.FHEADER.DFIRSTBLK:INTEGER
    MP1=TITLE:STRING
    MP13
    MP42
    MP43
    MP44
    MP50
    MP157:SYSCOM_C:^SYSCOMREC
    MP158:CRTINFO
  BEGIN
    INITIALI.INIT_FILLER(FILLER)
-> 007c: LDA  02 0019     Load addr G25 (FILLER)
   007f: CLP  03          Call local procedure 3 (child)
    IPOT[0] := 1
   0081: LDA  02 0014     Load addr G20 (IPOT)
   0084: SLDC 00          Short load constant 0
   0085: IXA  01          Index array (TOS-1 + TOS * 1)
   0087: SLDC 01          Short load constant 1
   0088: STO              Store indirect (TOS into TOS-1)
    IPOT[1] := 10
   0089: LDA  02 0014     Load addr G20 (IPOT)
   008c: SLDC 01          Short load constant 1
   008d: IXA  01          Index array (TOS-1 + TOS * 1)
   008f: SLDC 0a          Short load constant 10
   0090: STO              Store indirect (TOS into TOS-1)
    IPOT[2] := 100
   0091: LDA  02 0014     Load addr G20 (IPOT)
   0094: SLDC 02          Short load constant 2
   0095: IXA  01          Index array (TOS-1 + TOS * 1)
   0097: SLDC 64          Short load constant 100
   0098: STO              Store indirect (TOS into TOS-1)
    IPOT[3] := 1000
   0099: LDA  02 0014     Load addr G20 (IPOT)
   009c: SLDC 03          Short load constant 3
   009d: IXA  01          Index array (TOS-1 + TOS * 1)
   009f: LDCI 03e8        Load word 1000
   00a2: STO              Store indirect (TOS into TOS-1)
    IPOT[4] := 10000
   00a3: LDA  02 0014     Load addr G20 (IPOT)
   00a6: SLDC 04          Short load constant 4
   00a7: IXA  01          Index array (TOS-1 + TOS * 1)
   00a9: LDCI 2710        Load word 10000
   00ac: STO              Store indirect (TOS into TOS-1)
    TITLE := '*SYSTEM.MISCINFO'
   00ad: LLA  0001        Load local address MP1 (TITLE)
   00af: LSA  10          Load string address: '*SYSTEM.MISCINFO'
   00c1: NOP              No operation
   00c2: SAS  17          String assign (TOS to TOS-1, 23 chars)
    SYSIO.FINIT(FILEMISCINFO,NIL,-1)
   00c4: LAO  0f          Load global BASE15 (FILEMISCINFO)
   00c6: LDCN             Load constant NIL
   00c7: SLDC 01          Short load constant 1
   00c8: NGI              Negate integer
   00c9: CXP  02 02       Call external procedure 2 in seg 2 (SYSIO) (FINIT)
    SYSIO.FOPEN(FILEMISCINFO,TITLE,1,NIL)
   00cc: LAO  0f          Load global BASE15 (FILEMISCINFO)
   00ce: LLA  0001        Load local address MP1 (TITLE)
   00d0: SLDC 01          Short load constant 1
   00d1: LDCN             Load constant NIL
   00d2: CXP  02 04       Call external procedure 4 in seg 2 (SYSIO) (FOPEN)
    IF FILEMISCINFO.FISOPEN THEN
   00d5: LDO  14          Load global word BASE20 (FILEMISCINFO.FISOPEN)
   00d7: FJP  $0114       Jump if TOS false
    BEGIN
      UNITREAD(FILEMISCINFO.FUNIT,MP13,0,288,FILEMISCINFO.FHEADER.DFIRSTBLK,0)
   00d9: LDO  16          Load global word BASE22 (FILEMISCINFO.FUNIT)
   00db: LLA  000d        Load local address MP13
   00dd: SLDC 00          Short load constant 0
   00de: LDCI 0120        Load word 288
   00e1: LDO  1f          Load global word BASE31 (FILEMISCINFO.FHEADER.DFIRSTBLK)
   00e3: SLDC 00          Short load constant 0
   00e4: CSP  05          Call standard procedure 5 UNITREAD
      SYSCOM_C := SYSCOM
   00e6: LOD  02 0001     Load word at G1 (SYSCOM)
   00e9: STL  009d        Store TOS into MP157 (SYSCOM_C)
      SYSCOM_C.MISCINFO := MP42
   00ec: LDL  009d        Load local word MP157 (SYSCOM_C)
   00ef: INCP 1d          Inc field ptr (TOS+29) (MISCINFO)
   00f1: LLA  002a        Load local address MP42
   00f3: MOV  01          Move 1 words (TOS to TOS-1)
      SYSCOM_C.CRTTYPE := MP43
   00f5: LDL  009d        Load local word MP157 (SYSCOM_C)
   00f8: INCP 1e          Inc field ptr (TOS+30) (CRTTYPE)
   00fa: LDL  002b        Load local word MP43
   00fc: STO              Store indirect (TOS into TOS-1)
      SYSCOM_C.CRTCTL := MP44
   00fd: LDL  009d        Load local word MP157 (SYSCOM_C)
   0100: INCP 1f          Inc field ptr (TOS+31) (CRTCTL)
   0102: LLA  002c        Load local address MP44
   0104: MOV  06          Move 6 words (TOS to TOS-1)
      SYSCOM_C.CRTINFO := MP50
   0106: LDL  009d        Load local word MP157 (SYSCOM_C)
   0109: INCP 25          Inc field ptr (TOS+37) (CRTINFO)
   010b: LLA  0032        Load local address MP50
   010d: MOV  0b          Move 11 words (TOS to TOS-1)
      INITIALI.INIT_FILLER(FILLER)
   010f: LDA  02 0019     Load addr G25 (FILLER)
   0112: CLP  03          Call local procedure 3 (child) INITIALI.INIT_FILLER
    END
    FCLOSE(FILEMISCINFO,0)
-> 0114: LAO  0f          Load global BASE15 (FILEMISCINFO)
   0116: SLDC 00          Short load constant 0
   0117: CXP  02 05       Call external procedure 5 in seg 2 (SYSIO) (FCLOSE)
    UNITCLEAR(1)
   011a: SLDC 01          Short load constant 1
   011b: CSP  26          Call standard procedure 38 UNITCLEAR
    SYSCOM_C := SYSCOM
   011d: LOD  02 0001     Load word at G1 (SYSCOM)
   0120: STL  009d        Store TOS into MP157 (SYSCOM_C)
    SYSCOM_C.XERRCD := 0
   0123: LDL  009d        Load local word MP157 (SYSCOM_C)
   0126: INCP 01          Inc field ptr (TOS+1)
   0128: SLDC 00          Short load constant 0
   0129: STO              Store indirect (TOS into TOS-1)
    SYSCOM_C.IORSLT := 0
   012a: LDL  009d        Load local word MP157 (SYSCOM_C)
   012d: SLDC 00          Short load constant 0
   012e: STO              Store indirect (TOS into TOS-1)
    SYSCOM_C.BUGSTA := 0
   012f: LDL  009d        Load local word MP157 (SYSCOM_C)
   0132: INCP 03          Inc field ptr (TOS+3)
   0134: SLDC 00          Short load constant 0
   0135: STO              Store indirect (TOS into TOS-1)
    CRTINFO := SYSCOM_C.CRTINFO
   0136: LDL  009d        Load local word MP157 (SYSCOM_C)
   0139: INCP 25          Inc field ptr (TOS+37)
   013b: STL  009e        Store TOS into MP158 (CRTINFO)
    
   013e: LDA  02 006f     Load addr G111 (NONPRINTCHARS)
   0141: LDL  009e        Load local word MP158 (CRTINFO)
   0144: INCP 08          Inc field ptr (TOS+8)
   0146: SLDC 08          Short load constant 8
   0147: SLDC 00          Short load constant 0
   0148: LDP              Load packed field (TOS)
   0149: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   014c: SLDC 01          Short load constant 1
   014d: STP              Store packed field (TOS into TOS-1)
   014e: LDA  02 006f     Load addr G111 (NONPRINTCHARS)
   0151: SLDC 10          Short load constant 16
   0152: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0155: SLDC 01          Short load constant 1
   0156: STP              Store packed field (TOS into TOS-1)
   0157: SLDC 00          Short load constant 0
   0158: LDL  009e        Load local word MP158 (CRTINFO)
   015b: INCP 03          Inc field ptr (TOS+3)
   015d: SLDC 08          Short load constant 8
   015e: SLDC 08          Short load constant 8
   015f: LDP              Load packed field (TOS)
   0160: CLP  05          Call local procedure 5 (child) SETPREFIXEDCRTINFO
   0162: SLDC 01          Short load constant 1
   0163: LDL  009e        Load local word MP158 (CRTINFO)
   0166: INCP 03          Inc field ptr (TOS+3)
   0168: SLDC 08          Short load constant 8
   0169: SLDC 00          Short load constant 0
   016a: LDP              Load packed field (TOS)
   016b: CLP  05          Call local procedure 5 (child) SETPREFIXEDCRTINFO
   016d: SLDC 03          Short load constant 3
   016e: LDL  009e        Load local word MP158 (CRTINFO)
   0171: INCP 02          Inc field ptr (TOS+2)
   0173: SLDC 08          Short load constant 8
   0174: SLDC 08          Short load constant 8
   0175: LDP              Load packed field (TOS)
   0176: CLP  05          Call local procedure 5 (child) SETPREFIXEDCRTINFO
   0178: SLDC 02          Short load constant 2
   0179: LDL  009e        Load local word MP158 (CRTINFO)
   017c: INCP 02          Inc field ptr (TOS+2)
   017e: SLDC 08          Short load constant 8
   017f: SLDC 00          Short load constant 0
   0180: LDP              Load packed field (TOS)
   0181: CLP  05          Call local procedure 5 (child) SETPREFIXEDCRTINFO
   0183: SLDC 0b          Short load constant 11
   0184: LDL  009e        Load local word MP158 (CRTINFO)
   0187: INCP 06          Inc field ptr (TOS+6)
   0189: SLDC 08          Short load constant 8
   018a: SLDC 00          Short load constant 0
   018b: LDP              Load packed field (TOS)
   018c: CLP  05          Call local procedure 5 (child) SETPREFIXEDCRTINFO
   018e: SLDC 08          Short load constant 8
   018f: LDL  009e        Load local word MP158 (CRTINFO)
   0192: INCP 04          Inc field ptr (TOS+4)
   0194: SLDC 08          Short load constant 8
   0195: SLDC 00          Short load constant 0
   0196: LDP              Load packed field (TOS)
   0197: CLP  05          Call local procedure 5 (child) SETPREFIXEDCRTINFO
   0199: SLDC 09          Short load constant 9
   019a: LDL  009e        Load local word MP158 (CRTINFO)
   019d: INCP 07          Inc field ptr (TOS+7)
   019f: SLDC 08          Short load constant 8
   01a0: SLDC 08          Short load constant 8
   01a1: LDP              Load packed field (TOS)
   01a2: CLP  05          Call local procedure 5 (child) SETPREFIXEDCRTINFO
   01a4: SLDC 0a          Short load constant 10
   01a5: LDL  009e        Load local word MP158 (CRTINFO)
   01a8: INCP 07          Inc field ptr (TOS+7)
   01aa: SLDC 08          Short load constant 8
   01ab: SLDC 00          Short load constant 0
   01ac: LDP              Load packed field (TOS)
   01ad: CLP  05          Call local procedure 5 (child) SETPREFIXEDCRTINFO
   01af: SLDC 0d          Short load constant 13
   01b0: LDL  009e        Load local word MP158 (CRTINFO)
   01b3: IND  09          Static index and load word (TOS+9)
   01b5: CLP  05          Call local procedure 5 (child) SETPREFIXEDCRTINFO
   01b7: SLDC 0c          Short load constant 12
   01b8: LDL  009e        Load local word MP158 (CRTINFO)
   01bb: INCP 08          Inc field ptr (TOS+8)
   01bd: SLDC 08          Short load constant 8
   01be: SLDC 08          Short load constant 8
   01bf: LDP              Load packed field (TOS)
   01c0: CLP  05          Call local procedure 5 (child) SETPREFIXEDCRTINFO
   01c2: LDL  009d        Load local word MP157 (SYSCOM_C)
   01c5: INCP 1f          Inc field ptr (TOS+31)
   01c7: STL  009e        Store TOS into MP158 (CRTINFO)
   01ca: SLDC 00          Short load constant 0
   01cb: LDL  009e        Load local word MP158 (CRTINFO)
   01ce: INCP 02          Inc field ptr (TOS+2)
   01d0: SLDC 08          Short load constant 8
   01d1: SLDC 08          Short load constant 8
   01d2: LDP              Load packed field (TOS)
   01d3: CLP  04          Call local procedure 4 (child) SETPREFIXEDCRTCTL
   01d5: SLDC 01          Short load constant 1
   01d6: LDL  009e        Load local word MP158 (CRTINFO)
   01d9: INCP 02          Inc field ptr (TOS+2)
   01db: SLDC 08          Short load constant 8
   01dc: SLDC 00          Short load constant 0
   01dd: LDP              Load packed field (TOS)
   01de: CLP  04          Call local procedure 4 (child) SETPREFIXEDCRTCTL
   01e0: SLDC 02          Short load constant 2
   01e1: LDL  009e        Load local word MP158 (CRTINFO)
   01e4: INCP 01          Inc field ptr (TOS+1)
   01e6: SLDC 08          Short load constant 8
   01e7: SLDC 08          Short load constant 8
   01e8: LDP              Load packed field (TOS)
   01e9: CLP  04          Call local procedure 4 (child) SETPREFIXEDCRTCTL
   01eb: SLDC 04          Short load constant 4
   01ec: LDL  009e        Load local word MP158 (CRTINFO)
   01ef: SLDC 08          Short load constant 8
   01f0: SLDC 08          Short load constant 8
   01f1: LDP              Load packed field (TOS)
   01f2: CLP  04          Call local procedure 4 (child) SETPREFIXEDCRTCTL
   01f4: SLDC 03          Short load constant 3
   01f5: LDL  009e        Load local word MP158 (CRTINFO)
   01f8: INCP 01          Inc field ptr (TOS+1)
   01fa: SLDC 08          Short load constant 8
   01fb: SLDC 00          Short load constant 0
   01fc: LDP              Load packed field (TOS)
   01fd: CLP  04          Call local procedure 4 (child) SETPREFIXEDCRTCTL
   01ff: SLDC 05          Short load constant 5
   0200: LDL  009e        Load local word MP158 (CRTINFO)
   0203: INCP 03          Inc field ptr (TOS+3)
   0205: SLDC 08          Short load constant 8
   0206: SLDC 00          Short load constant 0
   0207: LDP              Load packed field (TOS)
   0208: CLP  04          Call local procedure 4 (child) SETPREFIXEDCRTCTL
   020a: SLDC 06          Short load constant 6
   020b: LDL  009e        Load local word MP158 (CRTINFO)
   020e: INCP 04          Inc field ptr (TOS+4)
   0210: SLDC 08          Short load constant 8
   0211: SLDC 08          Short load constant 8
   0212: LDP              Load packed field (TOS)
   0213: CLP  04          Call local procedure 4 (child) SETPREFIXEDCRTCTL
   0215: SLDC 07          Short load constant 7
   0216: LDL  009e        Load local word MP158 (CRTINFO)
   0219: INCP 04          Inc field ptr (TOS+4)
   021b: SLDC 08          Short load constant 8
   021c: SLDC 00          Short load constant 0
   021d: LDP              Load packed field (TOS)
   021e: CLP  04          Call local procedure 4 (child) SETPREFIXEDCRTCTL
   0220: LDA  02 006f     Load addr G111 (NONPRINTCHARS)
   0223: LDL  009e        Load local word MP158 (CRTINFO)
   0226: SLDC 08          Short load constant 8
   0227: SLDC 00          Short load constant 0
   0228: LDP              Load packed field (TOS)
   0229: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   022c: SLDC 01          Short load constant 1
   022d: STP              Store packed field (TOS into TOS-1)
   022e: LDA  02 006f     Load addr G111 (NONPRINTCHARS)
   0231: SLDC 0d          Short load constant 13
   0232: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0235: SLDC 00          Short load constant 0
   0236: STP              Store packed field (TOS into TOS-1)
-> 0237: RNP  00          Return from nonbase procedure
  END

LL 2 entry 0000 exit 002c parms=1 words data=1 words
###    PROCEDURE INITIALI.INIT_FILLER(FILLER:STRING) (3)
      MP1=FILLER:STRING
      MP2=CRTCTL
    BEGIN
      CRTCTL := SYSCOM.CRTCTL
-> 0000: LOD  03 0001     Load word at G1 (SYSCOM)
   0003: INCP 1f          Inc field ptr (TOS+31) (CRTCTL)
   0005: STL  0002        Store TOS into MP2 (CRTCTL)
      IF CRTCTL.FILLCOUNT > 11 THEN
   0007: SLDL 02          Short load local MP2 (CRTCTL)
   0008: INCP 03          Inc field ptr (TOS+3) (FILLCOUNT)
   000a: SLDC 08          Short load constant 8
   000b: SLDC 08          Short load constant 8
   000c: LDP              Load packed field (TOS)
   000d: SLDC 0b          Short load constant 11
   000e: GRTI             Integer TOS-1 > TOS
   000f: FJP  $0018       Jump if TOS false
      BEGIN
        CRTCTL.FILLCOUNT := 11
   0011: SLDL 02          Short load local MP2 (CRTCTL)
   0012: INCP 03          Inc field ptr (TOS+3) (FILLCOUNT)
   0014: SLDC 08          Short load constant 8
   0015: SLDC 08          Short load constant 8
   0016: SLDC 0b          Short load constant 11
   0017: STP              Store packed field (TOS into TOS-1)
      END
      FILLER[0] := FILLCOUNT
-> 0018: SLDL 01          Short load local MP1 (FILLER) [FILLER]
   0019: SLDC 00          Short load constant 0 [0,FILLER]
   001a: SLDL 02          Short load local MP2 (CRTCTL) [CRTCTL,0,FILLER]
   001b: INCP 03          Inc field ptr (TOS+3) (FILLCOUNT) [FILLCOUNT^,0,FILLER]
   001d: SLDC 08          Short load constant 8 [8,FILLCOUNT^,0,FILLER]
   001e: SLDC 08          Short load constant 8 [8,8,FILLCOUNT^,0,FILLER]
   001f: LDP              Load packed field (TOS) [FILLCOUNT,0,FILLER]
   0020: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
      FILLCHAR(FILLER,1,FILLCOUNT,0)
   0021: SLDL 01          Short load local MP1 (FILLER)[FILLER]
   0022: SLDC 01          Short load constant 1 [1,FILLER]
   0023: SLDL 02          Short load local MP2 (CRTCTL) [CRTCTL,1,FILLER]
   0024: INCP 03          Inc field ptr (TOS+3) (FILLCOUNT) [FILLCOUNT^,1,FILLER]
   0026: SLDC 08          Short load constant 8 [8,FILLCOUNT^,1,FILLER]
   0027: SLDC 08          Short load constant 8 [8,8,FILLCOUNT^,1,FILLER]
   0028: LDP              Load packed field (TOS) [FILLCOUNT,1,FILLER]
   0029: SLDC 00          Short load constant 0 [0,FILLCOUNT,1,FILLER]
   002a: CSP  0a          Call standard procedure 10 FLCH
-> 002c: RNP  00          Return from nonbase procedure
    END

LL 2 entry 0038 exit 004e parms=2 words data=0 words
###    PROCEDURE INITIALI.SETPREFIXEDCRTCTL(WHICH:INTEGER;COMMANDCHAR:CHAR) (4)
      MP1=COMMANDCHAR:CHAR
      MP2=WHICH:INTEGER
    BEGIN
      IF NOT SYSCOM.PREFIXED1[WHICH] THEN
-> 0038: LOD  03 0001     Load word at G1 (SYSCOM)
   003b: INCP 24          Inc field ptr (TOS+36) (PREFIXED1)
   003d: SLDL 02          Short load local MP2 (WHICH)
   003e: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0041: LDP              Load packed field (TOS)
   0042: LNOT             Logical NOT (~TOS)
   0043: FJP  $004e       Jump if TOS false
      BEGIN
        NONPRINTCHARS[COMMANDCHAR] := TRUE
   0045: LDA  03 006f     Load addr G111 (NONPRINTCHARS)
   0048: SLDL 01          Short load local MP1 (COMMANDCHAR)
   0049: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   004c: SLDC 01          Short load constant 1
   004d: STP              Store packed field (TOS into TOS-1)
      END
-> 004e: RNP  00          Return from nonbase procedure
    END

LL 2 entry 005a exit 0070 parms=2 words data=0 words
###    PROCEDURE INITIALI.SETPREFIXEDCRTINFO(WHICH:INTEGER;COMMANDCHAR:CHAR) (5)
      MP1=COMMANDCHAR:CHAR
      MP2=WHICH:INTEGER
    BEGIN
      IF NOT SYSCOM.PREFIXED2[WHICH] THEN
-> 005a: LOD  03 0001     Load word at G1 (SYSCOM)
   005d: INCP 2f          Inc field ptr (TOS+47) (PREFIXED2)
   005f: SLDL 02          Short load local MP2
   0060: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0063: LDP              Load packed field (TOS)
   0064: LNOT             Logical NOT (~TOS)
   0065: FJP  $0070       Jump if TOS false
     BEGIN
       NONPRINTCHARS[COMMANDCHAR] := TRUE
   0067: LDA  03 006f     Load addr G111 (NONPRINTCHARS)
   006a: SLDL 01          Short load local MP1 (COMMANDCHAR)
   006b: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   006e: SLDC 01          Short load constant 1
   006f: STP              Store packed field (TOS into TOS-1)
     END
-> 0070: RNP  00          Return from nonbase procedure
    END

LL 1 entry 027e exit 03bf parms=0 words data=5 words
###  PROCEDURE INITIALI.INITUNITABLE (6)
    BASE1=LTITLE
    BASE14=STARTUP:BOOLEAN
    BASE15=LFIB
    BASE20=LFIB.FISOPEN:BOOLEAN
    MP1=LUNIT:UNITNUM
    MP2=LDIR
    MP3
    MP4=THISUNIT:UNITNUM
    MP5
  BEGIN
    FINIT(LFIB,NIL,-1)
-> 027e: LAO  0f          Load global BASE15 (LFIB)
   0280: LDCN             Load constant NIL
   0281: SLDC 01          Short load constant 1
   0282: NGI              Negate integer
   0283: CXP  02 02       Call external procedure 2 in seg 2 (SYSIO) (FINIT)
    LUNIT := 0
   0286: SLDC 00          Short load constant 0
   0287: STL  0001        Store TOS into MP1 (LUNIT)
    MP3 := 12
   0289: SLDC 0c          Short load constant 12
   028a: STL  0003        Store TOS into MP3
    FOR LUNIT := 0 TO 12 DO
-> 028c: SLDL 01          Short load local MP1 (LUNIT)
   028d: SLDL 03          Short load local MP3
   028e: LEQI             Integer TOS-1 <= TOS
   028f: FJP  $0366       Jump if TOS false
    BEGIN
      THISUNIT := UNITABLE[LUNIT]
   0291: LDA  02 001f     Load addr G31 (UNITABLE)
   0294: SLDL 01          Short load local MP1 (LUNIT)
   0295: IXA  06          Index array (TOS-1 + TOS * 6)
   0297: STL  0004        Store TOS into MP4 (THISUNIT)
      THISUNIT.UVID := ''
   0299: SLDL 04          Short load local MP4 (THISUNIT)
   029a: NOP              No operation
   029b: LSA  00          Load string address: ''
   029d: SAS  07          String assign (TOS to TOS-1, 7 chars)
      THISUNIT.UISBLKD := LUNIT=4 OR LUNIT=5 OR (LUNIT >= 9 AND LUNIT <= 12)
   029f: SLDL 04          Short load local MP4 (THISUNIT)
   02a0: INCP 04          Inc field ptr (TOS+4) (UISBLKD)
   02a2: SLDL 01          Short load local MP1 (LUNIT)
   02a3: SLDC 04          Short load constant 4
   02a4: EQUI             Integer TOS-1 = TOS
   02a5: SLDL 01          Short load local MP1 (LUNIT)
   02a6: SLDC 05          Short load constant 5
   02a7: EQUI             Integer TOS-1 = TOS
   02a8: LOR              Logical OR (TOS | TOS-1)
   02a9: SLDL 01          Short load local MP1 (LUNIT)
   02aa: SLDC 09          Short load constant 9
   02ab: GEQI             Integer TOS-1 >= TOS
   02ac: SLDL 01          Short load local MP1 (LUNIT)
   02ad: SLDC 0c          Short load constant 12
   02ae: LEQI             Integer TOS-1 <= TOS
   02af: LAND             Logical AND (TOS & TOS-1)
   02b0: LOR              Logical OR (TOS | TOS-1)
   02b1: STO              Store indirect (TOS into TOS-1)
      IF THISUNIT.UISBLKD THEN
   02b2: SLDL 04          Short load local MP4 (THISUNIT)
   02b3: SIND 04          Short index load *TOS+4 (UISBLKD)
   02b4: FJP  $035f       Jump if TOS false
      BEGIN
        THISUNIT.UEOVBLK := 32767
   02b6: SLDL 04          Short load local MP4 (THISUNIT)
   02b7: INCP 05          Inc field ptr (TOS+5)
   02b9: LDCI 7fff        Load word 32767
   02bc: STO              Store indirect (TOS into TOS-1)
        IF NOT SINGLEDRIVESYSTEM OR (LUNIT = 4)
   02bd: LOD  02 01d8     Load word at G472 (SINGLEDRIVESYSTEM)
   02c1: LNOT             Logical NOT (~TOS)
   02c2: SLDL 01          Short load local MP1 (LUNIT)
   02c3: SLDC 04          Short load constant 4
   02c4: EQUI             Integer TOS-1 = TOS
   02c5: LOR              Logical OR (TOS | TOS-1)
   02c6: FJP  $035f       Jump if TOS false
        BEGIN
          UNITCLEAR(LUNIT)
   02c8: SLDL 01          Short load local MP1 (LUNIT)
   02c9: CSP  26          Call standard procedure 38 UNITCLEAR
          IF IORESULT = 0 THEN
   02cb: CSP  22          Call standard procedure 34 IORESULT
   02cd: SLDC 00          Short load constant 0
   02ce: EQUI             Integer TOS-1 = TOS
   02cf: FJP  $035f       Jump if TOS false
          BEGIN
            IF SYSIO.FETCHDIR(LUNIT) THEN
   02d1: SLDL 01          Short load local MP1 (LUNIT)
   02d2: SLDC 00          Short load constant 0
   02d3: SLDC 00          Short load constant 0
   02d4: CXP  02 09       Call external procedure 9 in seg 2 (SYSIO) (FETCHDIR)
   02d7: FJP  $035f       Jump if TOS false
            BEGIN
              THISUNIT.UVID := SYSCOM.GDIRP[0].DVID
   02d9: SLDL 04          Short load local MP4 (THISUNIT)
   02da: LOD  02 0001     Load word at G1 (SYSCOM)
   02dd: SIND 04          Short index load *TOS+4 (GDIRP)
   02de: SLDC 00          Short load constant 0
   02df: IXA  0d          Index array (TOS-1 + TOS * 13)
   02e1: INCP 03          Inc field ptr (TOS+3) (DVID)
   02e3: SAS  07          String assign (TOS to TOS-1, 7 chars)
              IF LUNIT = SYSCOM.SYSUNIT THEN
   02e5: SLDL 01          Short load local MP1 (LUNIT)
   02e6: LOD  02 0001     Load word at G1 (SYSCOM)
   02e9: SIND 02          Short index load *TOS+2 (SYSUNIT)
   02ea: EQUI             Integer TOS-1 = TOS
   02eb: FJP  $035f       Jump if TOS false
              BEGIN
                SYVID := THISUNIT.UVID
   02ed: LDA  02 000e     Load addr G14 (SYVID)
   02f0: SLDL 04          Short load local MP4 (THISUNIT)
   02f1: SAS  07          String assign (TOS to TOS-1, 7 chars)
                LTITLE := '*SYSTEM.STARTUP'
   02f3: LAO  01          Load global BASE1 (LTITLE)
   02f5: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   0306: NOP              No operation
   0307: SAS  17          String assign (TOS to TOS-1, 23 chars)
                FOPEN(LFIB,LTITLE,1,NIL)
   0309: LAO  0f          Load global BASE15 (LFIB)
   030b: LAO  01          Load global BASE1 (LTITLE)
   030d: SLDC 01          Short load constant 1
   030e: LDCN             Load constant NIL
   030f: CXP  02 04       Call external procedure 4 in seg 2 (SYSIO) (FOPEN)
                STARTUP := LFIB.FISOPEN 
   0312: LDO  14          Load global word BASE20 (LFIB.FISOPEN)
   0314: SRO  0e          Store global word BASE14 (STARTUP)
                FCLOSE(LFIB,0)
   0316: LAO  0f          Load global BASE15 (LFIB)
   0318: SLDC 00          Short load constant 0
   0319: CXP  02 05       Call external procedure 5 in seg 2 (SYSIO) (FCLOSE)
                LUNIT := VOLSEARCH(SYVID,FALSE,LDIR)
   031c: LDA  02 000e     Load addr G14 (SYVID)
   031f: SLDC 00          Short load constant 0
   0320: LLA  0002        Load local address MP2 (LDIR)
   0322: SLDC 00          Short load constant 0
   0323: SLDC 00          Short load constant 0
   0324: CXP  02 06       Call external procedure 6 in seg 2 (SYSIO) (VOLSEARCH)
   0327: STL  0001        Store TOS into MP1 (LUNIT)
                IF LDIR = NIL THEN
   0329: SLDL 02          Short load local MP2 (LDIR)
   032a: LDCN             Load constant NIL
   032b: EQUI             Integer TOS-1 = TOS
   032c: FJP  $0330       Jump if TOS false
                BEGIN
                  HALT
   032e: CSP  27          Call standard procedure 39 HALT
                END
                THEDATE := LDIR[0].DLASTBOOT
-> 0330: LDA  02 0012     Load addr G18 (THEDATE)
   0333: SLDL 02          Short load local MP2 (LDIR)
   0334: SLDC 00          Short load constant 0
   0335: IXA  0d          Index array (TOS-1 + TOS * 13)
   0337: INCP 0a          Inc field ptr (TOS+10) (DLASTBOOT)
   0339: MOV  01          Move 1 words (TOS to TOS-1)
                DACCESS := LDIR[0].DACCESS {this seems to be a reserved field...}
   033b: SLDL 02          Short load local MP2 (LDIR)
   033c: SLDC 00          Short load constant 0
   033d: IXA  0d          Index array (TOS-1 + TOS * 13)
   033f: INCP 0c          Inc field ptr (TOS+12)
   0341: STL  0005        Store TOS into MP5
                FILEHANDLEROVERLAY := DACCESS.YEAR {used as a boolean so if bit 0 is set, it's true:'filehandler overlay'}
   0343: SLDL 05          Short load local MP5 (DACCESS)
   0344: SLDC 07          Short load constant 7
   0345: SLDC 09          Short load constant 9
   0346: LDP              Load packed field (TOS)
   0347: STR  02 00b4     Store TOS to G180 (FILEHANDLEROVERLAY)
                SINGLEDRIVESYSTEM := DACCESS.YEAR / 2 { bit 1 of year is set = true:'single-drive system' }
   034b: SLDL 05          Short load local MP5
   034c: SLDC 07          Short load constant 7
   034d: SLDC 09          Short load constant 9
   034e: LDP              Load packed field (TOS)
   034f: SLDC 02          Short load constant 2
   0350: DVI              Divide integers (TOS-1 / TOS)
   0351: STR  02 01d8     Store TOS to G472 (SINGLEDRIVESYSTEM)
                IF ODD(DACCESS.YEAR / 4) THEN {bit 2 of year is set = true:'ignore external terminal' }
   0355: SLDL 05          Short load local MP5
   0356: SLDC 07          Short load constant 7
   0357: SLDC 09          Short load constant 9
   0358: LDP              Load packed field (TOS)
   0359: SLDC 04          Short load constant 4
   035a: DVI              Divide integers (TOS-1 / TOS)
   035b: FJP  $035f       Jump if TOS false
                  DISABLE80COL
   035d: CLP  07          Call local procedure 7 (child) (DISABLE80COL)
              END
            END
          END
        END
      END
-> 035f: SLDL 01          Short load local MP1 (LUNIT)
   0360: SLDC 01          Short load constant 1
   0361: ADI              Add integers (TOS + TOS-1)
   0362: STL  0001        Store TOS into MP1 (LUNIT)
   0364: UJP  $028c       Unconditional jump
    END
    IF JUSTBOOTED THEN
-> 0366: LOD  02 00b5     Load word at G181 (JUSTBOOTED)
   036a: FJP  $0374       Jump if TOS false
    BEGIN
      DKVID := SYVID
   036c: LDA  02 000a     Load addr G10 (DKVID)
   036f: LDA  02 000e     Load addr G14 (SYVID)
   0372: SAS  07          String assign (TOS to TOS-1, 7 chars)
    END
    INIT_ENTRY(1,'CONSOLE')
-> 0374: SLDC 01          Short load constant 1
   0375: LSA  07          Load string address: 'CONSOLE'
   037e: NOP              No operation
   037f: CLP  08          Call local procedure 8 (child) INIT_ENTRY
    INIT_ENTRY(2,'SYSTERM')
   0381: SLDC 02          Short load constant 2
   0382: NOP              No operation
   0383: LSA  07          Load string address: 'SYSTERM'
   038c: CLP  08          Call local procedure 8 (child) INIT_ENTRY
    INIT_ENTRY(3,'GRAPHIC')
   038e: SLDC 03          Short load constant 3
   038f: LSA  07          Load string address: 'GRAPHIC'
   0398: NOP              No operation
   0399: CLP  08          Call local procedure 8 (child) INIT_ENTRY
    INIT_ENTRY(6,'PRINTER')
   039b: SLDC 06          Short load constant 6
   039c: NOP              No operation
   039d: LSA  07          Load string address: 'PRINTER'
   03a6: CLP  08          Call local procedure 8 (child) INIT_ENTRY
    INIT_ENTRY(7,'REMIN')
   03a8: SLDC 07          Short load constant 7
   03a9: LSA  05          Load string address: 'REMIN'
   03b0: NOP              No operation
   03b1: CLP  08          Call local procedure 8 (child) INIT_ENTRY
    INIT_ENTRY(8,'REMOUT')
   03b3: SLDC 08          Short load constant 8
   03b4: NOP              No operation
   03b5: LSA  06          Load string address: 'REMOUT'
   03bd: CLP  08          Call local procedure 8 (child) INIT_ENTRY
-> 03bf: RNP  00          Return from nonbase procedure
  END

LL 2 entry 0244 exit 024e parms=0 words data=1 words
###    PROCEDURE INITIALI.DISABLE80COL (7)
      MP1
    BEGIN
      MP1 := -16598
-> 0244: LDCI 40d6        Load word 16598
   0247: NGI              Negate integer
   0248: STL  0001        Store TOS into MP1
      {store 0 at memory address -16598 = 0xBF2A=SLTYPE[3]}
   024a: SLDL 01          Short load local MP1
   024b: SLDC 00          Short load constant 0
   024c: SLDC 00          Short load constant 0
   024d: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 024e: RNP  00          Return from nonbase procedure
    END

LL 2 entry 025a exit 0272 parms=2 words data=4 words
###    PROCEDURE INITIALI.INIT_ENTRY(LUNIT:UNITNUM; UNIT_NAME:VID) (8)
      MP1=UNIT_NAME:VID
      MP2=LUNIT:UNITNUM
      MP3=S:VID
    BEGIN
      S := UNIT_NAME
-> 025a: LLA  0003        Load local address MP3
   025c: SLDL 01          Short load local MP1
   025d: SAS  07          String assign (TOS to TOS-1, 7 chars)
      UNITCLEAR(LUNIT)
   025f: SLDL 02          Short load local MP2
   0260: CSP  26          Call standard procedure 38 UNITCLEAR
      IF IORESULT = 0 THEN
   0262: CSP  22          Call standard procedure 34 IORESULT
   0264: SLDC 00          Short load constant 0
   0265: EQUI             Integer TOS-1 = TOS
   0266: FJP  $0272       Jump if TOS false
      BEGIN
        UNITABLE[LUNIT] := S
   0268: LDA  03 001f     Load addr G31 (UNITABLE)
   026b: SLDL 02          Short load local MP2
   026c: IXA  06          Index array (TOS-1 + TOS * 6)
   026e: LLA  0003        Load local address MP3
   0270: SAS  07          String assign (TOS to TOS-1, 7 chars)
      END
-> 0272: RNP  00          Return from nonbase procedure
    END

LL 1 entry 03d8 exit 0440 parms=0 words data=1 words
###  PROCEDURE INITIALI.INITHEAP (9)
    MP1=LWINDOW:WINDOWP
  BEGIN
    SYSCOM.GDIRP := NIL
-> 03d8: LOD  02 0001     Load word at G1 (SYSCOM)
   03db: INCP 04          Inc field ptr (TOS+4) (GDIRP)
   03dd: LDCN             Load constant NIL
   03de: STO              Store indirect (TOS into TOS-1)
    NEW(SWAPFIB,30)
   03df: LDA  02 0006     Load addr G6 (SWAPFIB)
   03e2: SLDC 1e          Short load constant 30
   03e3: CSP  01          Call standard procedure 1 NEW
    FINIT(SWAPFIB,NIL,-1)
   03e5: LOD  02 0006     Load word at G6 (SWAPFIB)
   03e8: LDCN             Load constant NIL
   03e9: SLDC 01          Short load constant 1
   03ea: NGI              Negate integer
   03eb: CXP  02 02       Call external procedure 2 in seg 2 (SYSIO) (FINIT)
    NEW(INPUTFIB,30)
   03ee: LDA  02 0009     Load addr G9 (INPUTFIB)
   03f1: SLDC 1e          Short load constant 30
   03f2: CSP  01          Call standard procedure 1 NEW
    NEW(LWINDOW,1)
   03f4: LLA  0001        Load local address MP1 (LWINDOW)
   03f6: SLDC 01          Short load constant 1
   03f7: CSP  01          Call standard procedure 1 NEW
    FINIT(INPUTFIB,LWINDOW,0)
   03f9: LOD  02 0009     Load word at G9 (INPUTFIB)
   03fc: SLDL 01          Short load local MP1 (LWINDOW)
   03fd: SLDC 00          Short load constant 0
   03fe: CXP  02 02       Call external procedure 2 in seg 2 (SYSIO) (FINIT)
    NEW(OUTPUTFIB,30)
   0401: LDA  02 0008     Load addr G8 (OUTPUTFIB)
   0404: SLDC 1e          Short load constant 30
   0405: CSP  01          Call standard procedure 1 NEW
    NEW(LWINDOW,1)
   0407: LLA  0001        Load local address MP1 (LWINDOW)
   0409: SLDC 01          Short load constant 1
   040a: CSP  01          Call standard procedure 1 NEW
    FINIT(OUTPUTFIB,LWINDOW,0)
   040c: LOD  02 0008     Load word at G8 (OUTPUTFIB)
   040f: SLDL 01          Short load local MP1 (LWINDOW)
   0410: SLDC 00          Short load constant 0
   0411: CXP  02 02       Call external procedure 2 in seg 2 (SYSIO) (FINIT)
    NEW(SYSTERMFIB,30)
   0414: LDA  02 0007     Load addr G7 (SYSTERMFIB)
   0417: SLDC 1e          Short load constant 30
   0418: CSP  01          Call standard procedure 1 NEW
    NEW(LWINDOW,1)
   041a: LLA  0001        Load local address MP1 (LWINDOW)
   041c: SLDC 01          Short load constant 1
   041d: CSP  01          Call standard procedure 1 NEW
    FINIT(SYSTERMFIB,LWINDOW,0)
   041f: LOD  02 0007     Load word at G7 (SYSTERMFIB)
   0422: SLDL 01          Short load local MP1 (LWINDOW)
   0423: SLDC 00          Short load constant 0
   0424: CXP  02 02       Call external procedure 2 in seg 2 (SYSIO) (FINIT)
    GFILES[0] := INPUTFIB
   0427: LDA  02 0002     Load addr G2 (GFILES)
   042a: SLDC 00          Short load constant 0
   042b: IXA  01          Index array (TOS-1 + TOS * 1)
   042d: LOD  02 0009     Load word at G9 (INPUTFIB)
   0430: STO              Store indirect (TOS into TOS-1)
    GFILES[1] := OUTPUTFIB
   0431: LDA  02 0002     Load addr G2 (GFILES)
   0434: SLDC 01          Short load constant 1
   0435: IXA  01          Index array (TOS-1 + TOS * 1)
   0437: LOD  02 0008     Load word at G8 (OUTPUTFIB)
   043a: STO              Store indirect (TOS into TOS-1)
    MARK(EMPTYHEAP)
   043b: LDA  02 0005     Load addr G5 (EMPTYHEAP)
   043e: CSP  20          Call standard procedure 32 MARK
-> 0440: RNP  00          Return from nonbase procedure
  END

LL 1 entry 044c exit 04c1 parms=0 words data=0 words
###  PROCEDURE INITIALI.INITFILES (10)
    BASE1=LTITLE:STRING[40]
  BEGIN
    FCLOSE(SWAPFIB,0)
-> 044c: LOD  02 0006     Load word at G6 (SWAPFIB)
   044f: SLDC 00          Short load constant 0
   0450: CXP  02 05       Call external procedure 5 in seg 2 (SYSIO)  (FCLOSE)
    FCLOSE(INPUTFIB,0)
   0453: LOD  02 0009     Load word at G9 (INPUTFIB)
   0456: SLDC 00          Short load constant 0
   0457: CXP  02 05       Call external procedure 5 in seg 2 (SYSIO)  (FCLOSE)
    FCLOSE(OUTPUTFIB,0)
   045a: LOD  02 0008     Load word at G8 (OUTPUTFIB)
   045d: SLDC 00          Short load constant 0
   045e: CXP  02 05       Call external procedure 5 in seg 2 (SYSIO)  (FCLOSE)
    BASE1 := 'CONSOLE:'
   0461: LAO  01          Load global BASE1
   0463: LSA  08          Load string address: 'CONSOLE:'
   046d: NOP              No operation
   046e: SAS  17          String assign (TOS to TOS-1, 23 chars)
    FOPEN(INPUTFIB,BASE1,1,NIL)
   0470: LOD  02 0009     Load word at G9 (INPUTFIB)
   0473: LAO  01          Load global BASE1
   0475: SLDC 01          Short load constant 1
   0476: LDCN             Load constant NIL
   0477: CXP  02 04       Call external procedure 4 in seg 2 (SYSIO) (FOPEN)
    FOPEN(OUPUTFIB,BASE1,1,NIL)
   047a: LOD  02 0008     Load word at G8 (OUTPUTFIB)
   047d: LAO  01          Load global BASE1
   047f: SLDC 01          Short load constant 1
   0480: LDCN             Load constant NIL
   0481: CXP  02 04       Call external procedure 4 in seg 2 (SYSIO) (FOPEN)
    IF JUSTBOOTED THEN
   0484: LOD  02 00b5     Load word at G181 (JUSTBOOTED)
   0488: FJP  $04a3       Jump if TOS false
    BEGIN
      BASE1 := 'SYSTERM:'
   048a: LAO  01          Load global BASE1
   048c: NOP              No operation
   048d: LSA  08          Load string address: 'SYSTERM:'
   0497: SAS  17          String assign (TOS to TOS-1, 23 chars)
      FOPEN(SYSTERMFIB,BASE1,1,NIL)
   0499: LOD  02 0007     Load word at G7 (SYSTERMFIB)
   049c: LAO  01          Load global BASE1
   049e: SLDC 01          Short load constant 1
   049f: LDCN             Load constant NIL
   04a0: CXP  02 04       Call external procedure 4 in seg 2 (SYSIO) (FOPEN)
    END
    GFILES[0] := INPUTFIB
-> 04a3: LDA  02 0002     Load addr G2 (GFILES)
   04a6: SLDC 00          Short load constant 0
   04a7: IXA  01          Index array (TOS-1 + TOS * 1)
   04a9: LOD  02 0009     Load word at G9 (INPUTFIB)
   04ac: STO              Store indirect (TOS into TOS-1)
    GFILES[1] := OUTPUTFIB
   04ad: LDA  02 0002     Load addr G2 (GFILES)
   04b0: SLDC 01          Short load constant 1
   04b1: IXA  01          Index array (TOS-1 + TOS * 1)
   04b3: LOD  02 0008     Load word at G8 (OUTPUTFIB)
   04b6: STO              Store indirect (TOS into TOS-1)
    GFILES[2] := SYSTERMFIB
   04b7: LDA  02 0002     Load addr G2 (GFILES)
   04ba: SLDC 02          Short load constant 2
   04bb: IXA  01          Index array (TOS-1 + TOS * 1)
   04bd: LOD  02 0007     Load word at G7 (SYSTERMFIB)
   04c0: STO              Store indirect (TOS into TOS-1)
-> 04c1: RNP  00          Return from nonbase procedure
  END

## GETCMD (5) segment

Processing segment 5 named 'GETCMD' containing 7 procedures/functions...

{ 
  GETCMD procedures:
  FUNCTION GETCMD(LASTST: CMDSTATE):CMDSTATE #1
  PROCEDURE PARSECMD(PARAM1:STRING; PARAM2:BOOLEAN; PARAM3:INTEGER) #2
  FUNCTION GETSEGNUM(SEGDICT:SEGMENTDICTIONARY; SEGIDX:INTEGER):INTEGER #3
  PROCEDURE COPYSEGTBL(SEGDICT:SEGMENTDICTIONARY; F:FIB) #4
  FUNCTION FINDSEGSOFKIND(SEGDICT:SEGMENTDICTIONARY; VAR FOUNDSEGS:PACKED ARRAY[0..31] OF BOOLEAN; KINDS:PACKED ARRAY[LINKED..DATASEG] OF BOOLEAN):BOOLEAN #5
  FUNCTION LOADLIBRARY(TITLE:STRING):BOOLEAN #6
  FUNCTION ASSOCIATE(TITLE:STRING; OKTOLINK:BOOLEAN; RUNONLY:BOOLEAN; ERROR_OK:BOOLEAN; ASS_STATUS:STATUS_ASSOCIATE):BOOLEAN #7
}

LL 0 entry 03fa exit 04b2 parms=3 words data=2 words
### FUNCTION GETCMD.GETCMD(LASTST: CMDSTATE):CMDSTATE (1)
  BASE1=RETVAL1:CMDSTATE({0}HALTINIT,{1}DEBUGCALL,
                 {2}UPROGNOU,{3}UPROGUOK,{4}SYSPROG,
                 {5}COMPONLY,{6}COMPANDGO,{7}COMPDEBUG,
                 {8}LINKANDGO,{9}LINKDEBUG)
  BASE3=LASTST:CMDSTATE
  BASE5=DONTCARE:STATUS_ASSOCIATE
BEGIN
  GETCMD := 0
-> 03fa: SLDC 00          Short load constant 0
   03fb: SRO  01          Store global word BASE1 (GETCMD)
  INPUTFIB.FEOF := FALSE 
   03fd: LOD  01 0009     Load word at G9 (INPUTFIB)
   0400: INCP 02          Inc field ptr (TOS+2) (FEOF)
   0402: SLDC 00          Short load constant 0
   0403: STO              Store indirect (TOS into TOS-1)
  OUTPUTFIB.FEOF := FALSE
   0404: LOD  01 0008     Load word at G8 (OUTPUTFIB)
   0407: INCP 02          Inc field ptr (TOS+2) (FEOF)
   0409: SLDC 00          Short load constant 0
   040a: STO              Store indirect (TOS into TOS-1)
  SYSTERMFIB.FEOF := FALSE
   040b: LOD  01 0007     Load word at G7 (SYSTERMFIB)
   040e: INCP 02          Inc field ptr (TOS+2) (FEOF)
   0410: SLDC 00          Short load constant 0
   0411: STO              Store indirect (TOS into TOS-1)
  GFILES[0] := INPUTFIB
   0412: LDA  01 0002     Load addr G2 (GFILES)
   0415: SLDC 00          Short load constant 0
   0416: IXA  01          Index array (TOS-1 + TOS * 1)
   0418: LOD  01 0009     Load word at G9 (INPUTFIB)
   041b: STO              Store indirect (TOS into TOS-1)
  GFILES[1] := OUTPUTFIB
   041c: LDA  01 0002     Load addr G2 (GFILES)
   041f: SLDC 01          Short load constant 1
   0420: IXA  01          Index array (TOS-1 + TOS * 1)
   0422: LOD  01 0008     Load word at G8 (OUTPUTFIB)
   0425: STO              Store indirect (TOS into TOS-1)
  IF LASTST = HALTINIT THEN
   0426: SLDO 03          Short load global BASE3 (LASTST)
   0427: SLDC 00          Short load constant 0
   0428: EQUI             Integer TOS-1 = TOS
   0429: FJP  $0459       Jump if TOS false
  BEGIN
    IF JUSTBOOTED THEN
   042b: LOD  01 00b5     Load word at G181 (JUSTBOOTED)
   042f: FJP  $0459       Jump if TOS false
    BEGIN
      JUSTBOOTED := FALSE
   0431: SLDC 00          Short load constant 0
   0432: STR  01 00b5     Store TOS to G181 (JUSTBOOTED)
   0436: NOP              No operation
      IF ASSOCIATE('*SYSTEM.ATTACH',FALSE,FALSE,FALSE,DONTCARE) THEN
   0437: LSA  0e          Load string address: '*SYSTEM.ATTACH'
   0447: SLDC 00          Short load constant 0
   0448: SLDC 00          Short load constant 0
   0449: SLDC 00          Short load constant 0
   044a: LAO  05          Load global BASE5 (DONTCARE)
   044c: SLDC 00          Short load constant 0
   044d: SLDC 00          Short load constant 0
   044e: CLP  07          Call local procedure 7 (child) ASSOCIATE
   0450: FJP  $0459       Jump if TOS false
      BEGIN
        GETCMD := SYSPROG
   0452: SLDC 04          Short load constant 4
   0453: SRO  01          Store global word BASE1 (GETCMD)
        EXIT(GETCMD,GETCMD)
   0455: SLDC 05          Short load constant 5
   0456: SLDC 01          Short load constant 1
   0457: CSP  04          Call standard procedure 4 EXIT
      END
    END
  END
  IF LASTST = SYSPROG THEN
-> 0459: SLDO 03          Short load global BASE3 (LASTST)
   045a: SLDC 04          Short load constant 4
   045b: EQUI             Integer TOS-1 = TOS
   045c: FJP  $0461       Jump if TOS false
  BEGIN
    LASTST := HALTINIT
   045e: SLDC 00          Short load constant 0
   045f: SRO  03          Store global word BASE3 (LASTST)
  END
  IF LASTST = HALTINIT THEN
-> 0461: SLDO 03          Short load global BASE3 (LASTST)
   0462: SLDC 00          Short load constant 0
   0463: EQUI             Integer TOS-1 = TOS
   0464: FJP  $048d       Jump if TOS false
  BEGIN
    IF ASSOCIATE('*SYSTEM.STARTUP',FALSE,FALSE,TRUE,DONTCARE) THEN
   0466: NOP              No operation
   0467: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   0478: SLDC 00          Short load constant 0
   0479: SLDC 00          Short load constant 0
   047a: SLDC 01          Short load constant 1
   047b: LAO  05          Load global BASE5 (DONTCARE)
   047d: SLDC 00          Short load constant 0
   047e: SLDC 00          Short load constant 0
   047f: CLP  07          Call local procedure 7 (child) ASSOCIATE
   0481: FJP  $048d       Jump if TOS false
    BEGIN
      CLEARSCREEN
   0483: CXP  00 1f       Call external procedure 31 in seg 0
      GETCMD := UPROGUOK
   0486: SLDC 03          Short load constant 3
   0487: SRO  01          Store global word BASE1 (GETCMD)
      EXIT(GETCMD,GETCMD)
   0489: SLDC 05          Short load constant 5
   048a: SLDC 01          Short load constant 1
   048b: CSP  04          Call standard procedure 4 EXIT
  END
  IF GLOBALTITLE[0] > 0 THEN
-> 048d: LDA  01 007f     Load addr G127 (GLOBALTITLE)
   0490: SLDC 00          Short load constant 0
   0491: LDB              Load byte at byte ptr TOS-1 + TOS
   0492: SLDC 00          Short load constant 0
   0493: GRTI             Integer TOS-1 > TOS
   0494: FJP  $04b2       Jump if TOS false
  BEGIN
    PARSECMD(GLOBALTITLE,FALSE,23)
   0496: LDA  01 007f     Load addr G127 (GLOBALTITLE)
   0499: SLDC 00          Short load constant 0
   049a: SLDC 17          Short load constant 23
   049b: CLP  02          Call local procedure 2 (child) (PARSECMD)
    IF ASSOCIATE(GLOBALTITLE,FALSE,FALSE,TRUE,DONTCARE) THEN
   049d: LDA  01 007f     Load addr G127 (GLOBALTITLE)
   04a0: SLDC 00          Short load constant 0
   04a1: SLDC 00          Short load constant 0
   04a2: SLDC 01          Short load constant 1
   04a3: LAO  05          Load global BASE5 (DONTCARE)
   04a5: SLDC 00          Short load constant 0
   04a6: SLDC 00          Short load constant 0
   04a7: CLP  07          Call local procedure 7 (child) (ASSOCIATE)
   04a9: FJP  $04b2       Jump if TOS false
    BEGIN
      GETCMD := UPROGUOK
   04ab: SLDC 03          Short load constant 3
   04ac: SRO  01          Store global word BASE1 (GETCMD)
      EXIT(GETCMD,GETCMD)
   04ae: SLDC 05          Short load constant 5
   04af: SLDC 01          Short load constant 1
   04b0: CSP  04          Call standard procedure 4 EXIT
    END
  END
-> 04b2: RBP  01          Return from base procedure
END

LL 1 entry 0000 exit 0122 parms=3 words data=90 words
###  PROCEDURE GETCMD.PARSECMD(TITLE:STRING; PARAM2:BOOLEAN; PARAM3:INTEGER) (2)
    MP1=PARAM3:INTEGER
    MP2=PARAM2:BOOLEAN
    MP3=TITLE:STRING
    MP4=TITLELEN:INTEGER
    MP5=TMPPOS:INTEGER
    MP6:STRING[40]
    MP27
    MP30:STRING[5]
    MP33=TMPSTR:STRING[80]
  BEGIN
    TMPPOS := SPOS(' ',TITLE)
-> 0000: NOP              No operation
   0001: LSA  01          Load string address: ' '
   0004: SLDL 03          Short load local MP3 (TITLE)
   0005: SLDC 00          Short load constant 0
   0006: SLDC 00          Short load constant 0
   0007: CXP  00 1b       Call external procedure 27 in seg 0 SPOS
   000a: STL  0005        Store TOS into MP5
    WHILE TMPPOS > 0 DO
-> 000c: SLDL 05          Short load local MP5
   000d: SLDC 00          Short load constant 0
   000e: GRTI             Integer TOS-1 > TOS
   000f: FJP  $0025       Jump if TOS false
    BEGIN
      SDELETE(TITLE,TMPPOS,1)
   0011: SLDL 03          Short load local MP3 (TITLE)
   0012: SLDL 05          Short load local MP5
   0013: SLDC 01          Short load constant 1
   0014: CXP  00 1a       Call external procedure 26 in seg 0 SDELETE
      TMPPOS := SPOS(' ',TITLE)
   0017: LSA  01          Load string address: ' '
   001a: NOP              No operation
   001b: SLDL 03          Short load local MP3 (TITLE)
   001c: SLDC 00          Short load constant 0
   001d: SLDC 00          Short load constant 0
   001e: CXP  00 1b       Call external procedure 27 in seg 0 SPOS
   0021: STL  0005        Store TOS into MP5
   0023: UJP  $000c       Unconditional jump
    END
    TITLELEN := TITLE[0]
-> 0025: SLDL 03          Short load local MP3 (TITLE)
   0026: SLDC 00          Short load constant 0
   0027: LDB              Load byte at byte ptr TOS-1 + TOS
   0028: STL  0004        Store TOS into MP4
    IF TITLELEN > 0 THEN
   002a: SLDL 04          Short load local MP4
   002b: SLDC 00          Short load constant 0
   002c: GRTI             Integer TOS-1 > TOS
   002d: FJP  $0122       Jump if TOS false
    BEGIN
      IF TITLE[TITLELEN] <> '.' THEN
   002f: SLDL 03          Short load local MP3 (TITLE)
   0030: SLDL 04          Short load local MP4
   0031: LDB              Load byte at byte ptr TOS-1 + TOS
   0032: SLDC 2e          Short load constant 46
   0033: NEQI             Integer TOS-1 <> TOS
   0034: FJP  $011c       Jump if TOS false
      BEGIN
        MP6 := ''
   0036: LLA  0006        Load local address MP6
   0038: NOP              No operation
   0039: LSA  00          Load string address: ''
   003b: SAS  28          String assign (TOS to TOS-1, 40 chars)
        MP30 := MP6
   003d: LLA  001e        Load local address MP30
   003f: LLA  0006        Load local address MP6
   0041: SAS  05          String assign (TOS to TOS-1, 5 chars)
        TMPPOS := SPOS('[', TITLE)
   0043: LSA  01          Load string address: '['
   0046: NOP              No operation
   0047: SLDL 03          Short load local MP3 (TITLE)
   0048: SLDC 00          Short load constant 0
   0049: SLDC 00          Short load constant 0
   004a: CXP  00 1b       Call external procedure 27 in seg 0 SPOS
   004d: STL  0005        Store TOS into MP5
        IF TMPPOS > 0 THEN
   004f: SLDL 05          Short load local MP5
   0050: SLDC 00          Short load constant 0
   0051: GRTI             Integer TOS-1 > TOS
   0052: FJP  $0071       Jump if TOS false
        BEGIN
          TITLELEN := TITLE[0] - TMPPOS + 1
   0054: SLDL 03          Short load local MP3 (TITLE)
   0055: SLDC 00          Short load constant 0
   0056: LDB              Load byte at byte ptr TOS-1 + TOS
   0057: SLDL 05          Short load local MP5
   0058: SBI              Subtract integers (TOS-1 - TOS)
   0059: SLDC 01          Short load constant 1
   005a: ADI              Add integers (TOS + TOS-1)
   005b: STL  0004        Store TOS into MP4

   005d: LLA  0006        Load local address MP6
          SCOPY(TITLE,TMPSTR,TMPPOS,TITLELEN)
   005f: SLDL 03          Short load local MP3 (TITLE)
   0060: LLA  0021        Load local address MP33
   0062: SLDL 05          Short load local MP5
   0063: SLDL 04          Short load local MP4
   0064: CXP  00 19       Call external procedure 25 in seg 0 SCOPY
          MP6 := TMPSTR
   0067: LLA  0021        Load local address MP33
   0069: SAS  28          String assign (TOS to TOS-1, 40 chars)
          SDELETE(TITLE,TMPPOS,TITLELEN)
   006b: SLDL 03          Short load local MP3 (TITLE)
   006c: SLDL 05          Short load local MP5
   006d: SLDL 04          Short load local MP4
   006e: CXP  00 1a       Call external procedure 26 in seg 0 SDELETE
        END
        TITLELEN := TITLE[0]
-> 0071: SLDL 03          Short load local MP3 (TITLE)
   0072: SLDC 00          Short load constant 0
   0073: LDB              Load byte at byte ptr TOS-1 + TOS
   0074: STL  0004        Store TOS into MP4
        IF TITLELEN > 0 THEN
   0076: SLDL 04          Short load local MP4
   0077: SLDC 00          Short load constant 0
   0078: GRTI             Integer TOS-1 > TOS
   0079: FJP  $0103       Jump if TOS false
        BEGIN
          IF TITLE[TITLELEN] <> ':' THEN
   007b: SLDL 03          Short load local MP3 (TITLE)
   007c: SLDL 04          Short load local MP4
   007d: LDB              Load byte at byte ptr TOS-1 + TOS
   007e: SLDC 3a          Short load constant 58
   007f: NEQI             Integer TOS-1 <> TOS
   0080: FJP  $0103       Jump if TOS false
          BEGIN
            IF PARAM2 THEN
   0082: SLDL 02          Short load local MP2 (PARAM2)
   0083: FJP  $0093       Jump if TOS false
            BEGIN
              MP27 := '.TEXT'
   0085: LLA  001b        Load local address MP27
   0087: LSA  05          Load string address: '.TEXT'
   008e: NOP              No operation
   008f: SAS  05          String assign (TOS to TOS-1, 5 chars)
   0091: UJP  $009f       Unconditional jump
            END ELSE BEGIN
              MP27 := '.CODE'
-> 0093: LLA  001b        Load local address MP27
   0095: LSA  05          Load string address: '.CODE'
   009c: NOP              No operation
   009d: SAS  05          String assign (TOS to TOS-1, 5 chars)
            END
            TMPPOS := 1
-> 009f: SLDC 01          Short load constant 1
   00a0: STL  0005        Store TOS into MP5
            TMPSTR := TITLELEN
   00a2: SLDL 04          Short load local MP4
   00a3: STL  0021        Store TOS into MP33
            WHILE TMPPOS <= TMPSTR DO
-> 00a5: SLDL 05          Short load local MP5
   00a6: LDL  0021        Load local word MP33
   00a8: LEQI             Integer TOS-1 <= TOS
   00a9: FJP  $00c9       Jump if TOS false
            BEGIN
              IF TITLE[TMPPOS] >= 'a' AND TITLE[TMPPOS] <= 'z' THEN
   00ab: SLDL 03          Short load local MP3 (TITLE)
   00ac: SLDL 05          Short load local MP5
   00ad: LDB              Load byte at byte ptr TOS-1 + TOS
   00ae: SLDC 61          Short load constant 97
   00af: GEQI             Integer TOS-1 >= TOS
   00b0: SLDL 03          Short load local MP3 (TITLE)
   00b1: SLDL 05          Short load local MP5
   00b2: LDB              Load byte at byte ptr TOS-1 + TOS
   00b3: SLDC 7a          Short load constant 122
   00b4: LEQI             Integer TOS-1 <= TOS
   00b5: LAND             Logical AND (TOS & TOS-1)
   00b6: FJP  $00c2       Jump if TOS false
              BEGIN
                TITLE[TMPPOS] := TITLE[TMPPOS] - 'a' + 'A'
   00b8: SLDL 03          Short load local MP3 (TITLE)
   00b9: SLDL 05          Short load local MP5
   00ba: SLDL 03          Short load local MP3 (TITLE)
   00bb: SLDL 05          Short load local MP5
   00bc: LDB              Load byte at byte ptr TOS-1 + TOS
   00bd: SLDC 61          Short load constant 97
   00be: SBI              Subtract integers (TOS-1 - TOS)
   00bf: SLDC 41          Short load constant 65
   00c0: ADI              Add integers (TOS + TOS-1)
   00c1: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
              END
              TMPPOS := TMPPOS + 1
-> 00c2: SLDL 05          Short load local MP5
   00c3: SLDC 01          Short load constant 1
   00c4: ADI              Add integers (TOS + TOS-1)
   00c5: STL  0005        Store TOS into MP5
   00c7: UJP  $00a5       Unconditional jump
            END
            IF TITLELEN > 5 THEN
-> 00c9: SLDL 04          Short load local MP4
   00ca: SLDC 05          Short load constant 5
   00cb: GRTI             Integer TOS-1 > TOS
   00cc: FJP  $00e0       Jump if TOS false
            BEGIN
              
   00ce: LLA  001e        Load local address MP30 [MP30]
              SCOPY(TITLE,MP33,TITLELEN-5+1,5)
   00d0: SLDL 03          Short load local MP3 (TITLE) [PARAM1,MP30]
   00d1: LLA  0021        Load local address MP33 [MP33,PARAM1,MP30]
   00d3: SLDL 04          Short load local MP4 [MP4,MP33,PARAM1,MP30]
   00d4: SLDC 05          Short load constant 5 [5,MP4,MP33,PARAM1,MP30]
   00d5: SBI              Subtract integers (TOS-1 - TOS) [MP4-5,MP33,PARAM1,MP30]
   00d6: SLDC 01          Short load constant 1 [1,MP4-5,MP33,PARAM1,MP30]
   00d7: ADI              Add integers (TOS + TOS-1) [MP4-5+1,MP33,PARAM1,MP30]
   00d8: SLDC 05          Short load constant 5 [5,MP4-5+1,MP33,PARAM1,MP30]
   00d9: CXP  00 19       Call external procedure 25 in seg 0 SCOPY
              MP30 := MP33
   00dc: LLA  0021        Load local address MP33
   00de: SAS  05          String assign (TOS to TOS-1, 5 chars)
            END
            IF MP30 <> MP27 AND TITLELEN + MP6[0] <= PARAM3 - 5 THEN
-> 00e0: LLA  001e        Load local address MP30
   00e2: LLA  001b        Load local address MP27
   00e4: NEQSTR           String TOS-1 <> TOS
   00e6: SLDL 04          Short load local MP4
   00e7: LLA  0006        Load local address MP6
   00e9: SLDC 00          Short load constant 0
   00ea: LDB              Load byte at byte ptr TOS-1 + TOS
   00eb: ADI              Add integers (TOS + TOS-1)
   00ec: SLDL 01          Short load local MP1 (PARAM3)
   00ed: SLDC 05          Short load constant 5
   00ee: SBI              Subtract integers (TOS-1 - TOS)
   00ef: LEQI             Integer TOS-1 <= TOS
   00f0: LAND             Logical AND (TOS & TOS-1)
   00f1: FJP  $0103       Jump if TOS false
            BEGIN
              MOVELEFT(MP27,1,TITLE,TITLELEN + 1, 5)
   00f3: LLA  001b        Load local address MP27
   00f5: SLDC 01          Short load constant 1
   00f6: SLDL 03          Short load local MP3 (TITLE)
   00f7: SLDL 04          Short load local MP4
   00f8: SLDC 01          Short load constant 1
   00f9: ADI              Add integers (TOS + TOS-1)
   00fa: SLDC 05          Short load constant 5
   00fb: CSP  02          Call standard procedure 2 MOVL
              TITLE[0] := TITLELEN + 5
   00fd: SLDL 03          Short load local MP3 (PARAM1) [PARAM1]
   00fe: SLDC 00          Short load constant 0 [0,PARAM1]
   00ff: SLDL 04          Short load local MP4 [MP4,0,PARAM1]
   0100: SLDC 05          Short load constant 5 [5,MP4,0,PARAM1]
   0101: ADI              Add integers (TOS + TOS-1) [MP4+5,0,PARAM1]
   0102: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1 [PARAM1[0] := MP4+5]
            END
          END
        END
        
-> 0103: SLDL 03          Short load local MP3 (TITLE)
        MP33 := 0
   0104: SLDC 00          Short load constant 0
   0105: STL  0021        Store TOS into MP33
        SCONCAT(MP33,TITLE,80)
   0107: LLA  0021        Load local address MP33
   0109: SLDL 03          Short load local MP3 (TITLE)
   010a: SLDC 50          Short load constant 80
   010b: CXP  00 17       Call external procedure 23 in seg 0 SCONCAT
        SCONCAT(MP33,MP6,120)
   010e: LLA  0021        Load local address MP33
   0110: LLA  0006        Load local address MP6
   0112: SLDC 78          Short load constant 120
   0113: CXP  00 17       Call external procedure 23 in seg 0 SCONCAT
        TITLE := MP33
   0116: LLA  0021        Load local address MP33
   0118: SAS  50          String assign (TOS to TOS-1, 80 chars)
   011a: UJP  $0122       Unconditional jump
      END ELSE BEGIN
        TITLE[0] := TITLELEN - 1
-> 011c: SLDL 03          Short load local MP3 (TITLE)
   011d: SLDC 00          Short load constant 0
   011e: SLDL 04          Short load local MP4
   011f: SLDC 01          Short load constant 1
   0120: SBI              Subtract integers (TOS-1 - TOS)
   0121: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
      END
    END
-> 0122: RNP  00          Return from nonbase procedure
  END

LL 1 entry 013a exit 0156 parms=4 words data=1 words
###  FUNCTION GETCMD.GETSEGNUM(SEGDICT:SEGMENTDICTIONARY; SEGIDX:INTEGER (3)
    MP1=RETVAL1
    MP3=SEGIDX:INTEGER
    MP4=SEGDICT:SEGMENTDICTIONARY
    MP5=THISSEGINFO
  BEGIN
    THISSEGINFO := SEGDICT.SEGINFO[SEGIDX]
-> 013a: SLDL 04          Short load local MP4 (SEGDICT)
   013b: INCP 0080          Inc field ptr (TOS+128) (SEGINFO)
   013e: SLDL 03          Short load local MP3
   013f: IXA  01          Index array (TOS-1 + TOS * 1)
   0141: STL  0005        Store TOS into MP5 (THISSEGINFO)
    IF THISSEGINFO.VERSION < 1 THEN
   0143: SLDL 05          Short load local MP5 (THISSEGINFO)
   0144: SLDC 03          Short load constant 3
   0145: SLDC 0d          Short load constant 13
   0146: LDP              Load packed field (TOS)
   0147: SLDC 01          Short load constant 1
   0148: LESI             Integer TOS-1 < TOS
   0149: FJP  $0150       Jump if TOS false
    BEGIN
     GETSEGNUM := SEGIDX
   014b: SLDL 03          Short load local MP3
   014c: STL  0001        Store TOS into MP1
   014e: UJP  $0156       Unconditional jump
    END ELSE BEGIN
     GETSEGNUM :=  (THISSEGINFO).SEGNUM
-> 0150: SLDL 05          Short load local MP5 (THISSEGINFO)
   0151: SLDC 08          Short load constant 8
   0152: SLDC 00          Short load constant 0
   0153: LDP              Load packed field (TOS)
   0154: STL  0001        Store TOS into MP1
    END
-> 0156: RNP  01          Return from nonbase procedure
  END

LL 1 entry 0162 exit 01d2 parms=2 words data=9 words
###  PROCEDURE GETCMD.COPYSEGTBL(SEGDICT:SEGMENTDICTIONARY; F:FIB) (4)
    MP1=F:FIB
    MP2=SEGDICT:SEGMENTDICTIONARY
    MP3=SIDX
    MP4=LSEG
    MP5=SYSCOM_C
    MP6=SEGDICT_C:SEGMENTDICTIONARY
    MP7=F_C:FIB
    MP8=HEADER:DIRENTRY
    MP9
    MP10=FILESEGENTRY
    MP11=MEMSEGENTRY
  BEGIN
    SYSCOM_C := SYSCOM
-> 0162: LOD  02 0001     Load word at G1 (SYSCOM)
   0165: STL  0005        Store TOS into MP5 (SYSCOM_C)
    SEGDICT_C := SEGDICT
   0167: SLDL 02          Short load local MP2 (SEGDICT)
   0168: STL  0006        Store TOS into MP6 (SEGDICT_C)
    F_C := F
   016a: SLDL 01          Short load local MP1 (F)
   016b: STL  0007        Store TOS into MP7 (F_C)
    HEADER := F_C.FHEADER
   016d: SLDL 07          Short load local MP7 (F_C)
   016e: INCP 10          Inc field ptr (TOS+16) (FHEADER)
   0170: STL  0008        Store TOS into MP8 (HEADER)
    SIDX := 0
   0172: SLDC 00          Short load constant 0
   0173: STL  0003        Store TOS into MP3 (SIDX)
    MP9 := 15
   0175: SLDC 0f          Short load constant 15
   0176: STL  0009        Store TOS into MP9
    FOR SIDX := 0 TO 15 DO
-> 0178: SLDL 03          Short load local MP3 (SIDX)
   0179: SLDL 09          Short load local MP9
   017a: LEQI             Integer TOS-1 <= TOS
   017b: FJP  $01d2       Jump if TOS false
    BEGIN
      FILESEGENTRY := SEGDICT_C[SIDX]
   017d: SLDL 06          Short load local MP6 (SEGDICT_C)
   017e: SLDL 03          Short load local MP3 (SIDX)
   017f: IXA  02          Index array (TOS-1 + TOS * 2)
   0181: STL  000a        Store TOS into MP10 (FILESEGENTRY)
      IF FILESEGENTRY.CODELENG <> 0 THEN
   0183: SLDL 0a          Short load local MP10 (FILESEGENTRY)
   0184: SIND 01          Short index load *TOS+1
   0185: SLDC 00          Short load constant 0
   0186: NEQI             Integer TOS-1 <> TOS
   0187: FJP  $01cb       Jump if TOS false
      BEGIN
        LSEG := GETSEGNUM(SEGDICT,SIDX)
   0189: SLDL 02          Short load local MP2 (SEGDICT)
   018a: SLDL 03          Short load local MP3 (SIDX)
   018b: SLDC 00          Short load constant 0
   018c: SLDC 00          Short load constant 0
   018d: CGP  03          Call global procedure 3 (lexLevel 1, curr seg) GETSEGNUM
   018f: STL  0004        Store TOS into MP4 (LSEG)
        IF LSEG = 1 OR (LSEG >= 7 AND LSEG <= 31) THEN
   0191: SLDL 04          Short load local MP4 (LSEG)
   0192: SLDC 01          Short load constant 1
   0193: EQUI             Integer TOS-1 = TOS
   0194: SLDL 04          Short load local MP4 (LSEG)
   0195: SLDC 07          Short load constant 7
   0196: GEQI             Integer TOS-1 >= TOS
   0197: SLDL 04          Short load local MP4 (LSEG)
   0198: SLDC 1f          Short load constant 31
   0199: LEQI             Integer TOS-1 <= TOS
   019a: LAND             Logical AND (TOS & TOS-1)
   019b: LOR              Logical OR (TOS | TOS-1)
   019c: FJP  $01cb       Jump if TOS false
        BEGIN
          MEMSEGENTRY := SYSCOM_C.SEGTABLE[LSEG]
   019e: SLDL 05          Short load local MP5 (SYSCOM_C)
   019f: INCP 30          Inc field ptr (TOS+48) (SEGTABLE)
   01a1: SLDL 04          Short load local MP4 (LSEG)
   01a2: IXA  03          Index array (TOS-1 + TOS * 3)
   01a4: STL  000b        Store TOS into MP11 (MEMSEGENTRY)
          MEMSEGENTRY.CODEUNIT := F_C.FUNIT
   01a6: SLDL 0b          Short load local MP11 (MEMSEGENTRY)
   01a7: SLDL 07          Short load local MP7 (F_C)
   01a8: SIND 07          Short index load *TOS+7 (FUNIT)
   01a9: STO              Store indirect (TOS into TOS-1)
          MEMSEGENTRY.CODELENG := FILESEGENTRY.CODELENG
   01aa: SLDL 0b          Short load local MP11 (MEMSEGENTRY)
   01ab: INCP 02          Inc field ptr (TOS+2)
   01ad: SLDL 0a          Short load local MP10 (FILESEGENTRY)
   01ae: SIND 01          Short index load *TOS+1
   01af: STO              Store indirect (TOS into TOS-1)
          IF SEGDICT_C.SEGKIND[SIDX] = DATASEG THEN
   01b0: SLDL 06          Short load local MP6 (SEGDICT_C)
   01b1: INCP 60          Inc field ptr (TOS+96) (SEGKIND)
   01b3: SLDL 03          Short load local MP3 (SIDX)
   01b4: IXA  01          Index array (TOS-1 + TOS * 1)
   01b6: SIND 00          Short index load *TOS+0
   01b7: SLDC 07          Short load constant 7 {DATASEG}
   01b8: EQUI             Integer TOS-1 = TOS
   01b9: FJP  $01c2       Jump if TOS false
          BEGIN
            MEMSEGENTRY.DISKADDR := 0
   01bb: SLDL 0b          Short load local MP11 (MEMSEGENTRY)
   01bc: INCP 01          Inc field ptr (TOS+1)
   01be: SLDC 00          Short load constant 0
   01bf: STO              Store indirect (TOS into TOS-1)
   01c0: UJP  $01cb       Unconditional jump
          END ELSE BEGIN
            MEMSEGENTRY.DISKADDR := FILESEGENTRY.DISKADDR + HEADER.DFIRSTBLK
-> 01c2: SLDL 0b          Short load local MP11 (MEMSEGENTRY)
   01c3: INCP 01          Inc field ptr (TOS+1)
   01c5: SLDL 0a          Short load local MP10 (FILESEGENTRY)
   01c6: SIND 00          Short index load *TOS+0
   01c7: SLDL 08          Short load local MP8 (HEADER)
   01c8: SIND 00          Short index load *TOS+0 (DFIRSTBLK)
   01c9: ADI              Add integers (TOS + TOS-1)
   01ca: STO              Store indirect (TOS into TOS-1)
          END
        END
      END
-> 01cb: SLDL 03          Short load local MP3 (SIDX)
   01cc: SLDC 01          Short load constant 1
   01cd: ADI              Add integers (TOS + TOS-1)
   01ce: STL  0003        Store TOS into MP3 (SIDX)
   01d0: UJP  $0178       Unconditional jump
    END
-> 01d2: RNP  00          Return from nonbase procedure
  END

LL 1 entry 01e0 exit 022c parms=5 words data=4 words
###  FUNCTION GETCMD.FINDSEGSOFKIND(SEGDICT:SEGMENTDICTIONARY; VAR FOUNDSEGS:PACKED ARRAY[0..31] OF BOOLEAN; KINDS:PACKED ARRAY[LINKED..DATASEG] OF BOOLEAN):BOOLEAN (5)
    MP1=RETVAL1
    MP3=KINDS
    MP4=FOUNDSEGS:PACKED ARRAY[0..31] OF BOOLEAN {4 bytes}
    MP5=SEGDICT:SEGMENTDICTIONARY
    MP6=KINDS_C
    MP7=SEGIDX:INTEGER
    MP8=SEGDICT_C
    MP9
  BEGIN
    KINDS_C := KINDS
-> 01e0: LLA  0006        Load local address MP6 (KINDS_C)
   01e2: SLDL 03          Short load local MP3 (KINDS)
   01e3: MOV  01          Move 1 words (TOS to TOS-1)
    FILLCHAR(FOUNDSEGS,0,4,0)
   01e5: SLDL 04          Short load local MP4 (FOUNDSEGS)
   01e6: SLDC 00          Short load constant 0
   01e7: SLDC 04          Short load constant 4
   01e8: SLDC 00          Short load constant 0
   01e9: CSP  0a          Call standard procedure 10 FLCH
    FINDSEGSOFKIND := TRUE
   01eb: SLDC 01          Short load constant 1
   01ec: STL  0001        Store TOS into MP1
    SEGDICT_C := SEGDICT
   01ee: SLDL 05          Short load local MP5 (SEGDICT)
   01ef: STL  0008        Store TOS into MP8 (SEGDICT_C)
    SEGIDX := 0
   01f1: SLDC 00          Short load constant 0
   01f2: STL  0007        Store TOS into MP7 (SEGIDX)
    MP9 := 15
   01f4: SLDC 0f          Short load constant 15
   01f5: STL  0009        Store TOS into MP9
    FOR SEGIDX := 0 TO 15 DO 
-> 01f7: SLDL 07          Short load local MP7 (SEGIDX)
   01f8: SLDL 09          Short load local MP9
   01f9: LEQI             Integer TOS-1 <= TOS
   01fa: FJP  $022c       Jump if TOS false
    BEGIN
      IF SEGDICT_C[SEGIDX].CODELENG <> 0 THEN
   01fc: SLDL 08          Short load local MP8 (SEGDICT_C)
   01fd: SLDL 07          Short load local MP7 (SEGIDX)
   01fe: IXA  02          Index array (TOS-1 + TOS * 2)
   0200: SIND 01          Short index load *TOS+1
   0201: SLDC 00          Short load constant 0
   0202: NEQI             Integer TOS-1 <> TOS
   0203: FJP  $0225       Jump if TOS false
      BEGIN
        IF KINDS_C[SEGDICT_C.SEGKIND[SEGIDX]] THEN
   0205: LLA  0006        Load local address MP6 (KINDS_C)
   0207: SLDL 08          Short load local MP8 (SEGDICT_C)
   0208: INCP 60          Inc field ptr (TOS+96) (SEGKIND)
   020a: SLDL 07          Short load local MP7 (SEGIDX)
   020b: IXA  01          Index array (TOS-1 + TOS * 1)
   020d: SIND 00          Short index load *TOS+0
   020e: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0211: LDP              Load packed field (TOS)
   0212: FJP  $0222       Jump if TOS false
        BEGIN
          FOUNDSEGS[GETSEGNUM(SEGDICT,SEGIDX)] := TRUE
   0214: SLDL 04          Short load local MP4 (FOUNDSEGS)
   0215: SLDL 05          Short load local MP5 (SEGDICT)
   0216: SLDL 07          Short load local MP7 (SEGIDX)
   0217: SLDC 00          Short load constant 0
   0218: SLDC 00          Short load constant 0
   0219: CGP  03          Call global procedure 3 (lexLevel 1, curr seg) GETSEGNUM
   021b: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   021e: SLDC 01          Short load constant 1
   021f: STP              Store packed field (TOS into TOS-1)
   0220: UJP  $0225       Unconditional jump
        END ELSE BEGIN
          FINDSEGSOFKIND := FALSE
-> 0222: SLDC 00          Short load constant 0
   0223: STL  0001        Store TOS into MP1
        END
      END
-> 0225: SLDL 07          Short load local MP7 (SEGIDX)
   0226: SLDC 01          Short load constant 1
   0227: ADI              Add integers (TOS + TOS-1)
   0228: STL  0007        Store TOS into MP7 (SEGIDX)
   022a: UJP  $01f7       Unconditional jump
    END
-> 022c: RNP  01          Return from nonbase procedure
  END

LL 1 entry 023a exit 02b1 parms=3 words data=556 words
###  FUNCTION GETCMD.LOADLIBRARY(TITLE:TID):BOOLEAN (6)
    MP1=RETVAL1:BOOLEAN
    MP3=TITLE:TID
    MP4=TITLE_C:TID
    MP12=SEGDICT:SEGMENTDICTIONARY
    MP268=F:FIB
    MP275=F.FUNIT
    MP284=F.FHEADER.DFIRSTBLK
    MP558=KINDS:PACKED ARRAY[LINKED..DATASEG] OF BOOLEAN
    MP559=SYSCOM_C
  BEGIN
    TITLE_C := TITLE
-> 023a: LLA  0004        Load local address MP4 (TITLE_C)
   023c: SLDL 03          Short load local MP3 (TITLE)
   023d: SAS  0f          String assign (TOS to TOS-1, 15 chars)
    FINIT(F,NIL,-1)
   023f: LLA  010c        Load local address MP268 (F)
   0242: LDCN             Load constant NIL
   0243: SLDC 01          Short load constant 1
   0244: NGI              Negate integer
   0245: CXP  02 02       Call external procedure 2 in seg 2 (SYSIO) (FINIT)
    LOADLIBRARY := FALSE
   0248: SLDC 00          Short load constant 0
   0249: STL  0001        Store TOS into MP1
    FOPEN(F,TITLE_C,1,NIL)
   024b: LLA  010c        Load local address MP268 (F)
   024e: LLA  0004        Load local address MP4 (TITLE_C)
   0250: SLDC 01          Short load constant 1
   0251: LDCN             Load constant NIL
   0252: CXP  02 04       Call external procedure 4 in seg 2 (SYSIO) (FOPEN)
    IF IORESULT = 0 THEN
   0255: CSP  22          Call standard procedure 34 IORESULT
   0257: SLDC 00          Short load constant 0
   0258: EQUI             Integer TOS-1 = TOS
   0259: FJP  $02aa       Jump if TOS false
    BEGIN
      SYSCOM_C := SYSCOM
   025b: LOD  02 0001     Load word at G1 (SYSCOM)
   025e: STL  022f        Store TOS into MP559 (SYSCOM_C)
      UNITREAD(F.FUNIT,SEGDICT,0,512,F.FHEADER.DFIRSTBLK,0)
   0261: LDL  0113        Load local word MP275 (F.FUNIT)
   0264: LLA  000c        Load local address MP12 (SEGDICT)
   0266: SLDC 00          Short load constant 0
   0267: LDCI 0200        Load word 512
   026a: LDL  011c        Load local word MP284 (F.FHEADER.DFIRSTBLK)
   026d: SLDC 00          Short load constant 0
   026e: CSP  05          Call standard procedure 5 UNITREAD
      IF IORESULT <> 0 THEN
   0270: CSP  22          Call standard procedure 34 IORESULT
   0272: SLDC 00          Short load constant 0
   0273: NEQI             Integer TOS-1 <> TOS
   0274: FJP  $0278       Jump if TOS false
        GOTO 1
   0276: UJP  $02aa       Unconditional jump
      FILLCHAR(KINDS,0,2,0)
-> 0278: LLA  022e        Load local address MP558 (KINDS)
   027b: SLDC 00          Short load constant 0
   027c: SLDC 02          Short load constant 2
   027d: SLDC 00          Short load constant 0
   027e: CSP  0a          Call standard procedure 10 FLCH
      KINDS[LINKED_INTRINS] := TRUE
   0280: LLA  022e        Load local address MP558 (KINDS)
   0283: SLDC 06          Short load constant 6
   0284: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0287: SLDC 01          Short load constant 1
   0288: STP              Store packed field (TOS into TOS-1)
      KINDS[DATASEG] := TRUE
   0289: LLA  022e        Load local address MP558 (KINDS)
   028c: SLDC 07          Short load constant 7
   028d: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0290: SLDC 01          Short load constant 1
   0291: STP              Store packed field (TOS into TOS-1)
      IF FINDSEGSOFKIND(SEGDICT,DATASEGS,KINDS) THEN;
   0292: LLA  000c        Load local address MP12 (SEGDICT)
   0294: LDA  02 006d     Load addr G109 (DATASEGS)
   0297: LLA  022e        Load local address MP558 (KINDS)
   029a: SLDC 00          Short load constant 0
   029b: SLDC 00          Short load constant 0
   029c: CGP  05          Call global procedure 5 (lexLevel 1, curr seg) 
   029e: FJP  $02a0       Jump if TOS false
      COPYSEGTBL(SEGDICT,F)
-> 02a0: LLA  000c        Load local address MP12 (SEGDICT)
   02a2: LLA  010c        Load local address MP268 (F)
   02a5: CGP  04          Call global procedure 4 (lexLevel 1, curr seg) 
      LOADLIBRARY := TRUE
   02a7: SLDC 01          Short load constant 1
   02a8: STL  0001        Store TOS into MP1
    END
    1:
    FCLOSE(F,0)
-> 02aa: LLA  010c        Load local address MP268 (F)
   02ad: SLDC 00          Short load constant 0
   02ae: CXP  02 05       Call external procedure 5 in seg 2 (SYSIO) (FCLOSE)
-> 02b1: RNP  01          Return from nonbase procedure
  END

LL 1 entry 02be exit 03e5 parms=7 words data=304 words
###  FUNCTION GETCMD.ASSOCIATE(TITLE:STRING; OKTOLINK:BOOLEAN; RUNONLY:BOOLEAN; ERROR_OK:BOOLEAN; ASS_STATUS:STATUS_ASSOCIATE): BOOLEAN (7)
    MP1=RETVAL1:BOOLEAN
    MP3=ASS_STATUS:STATUS_ASSOCIATE=(FOUND_OK,FOUND_BAD,NOT_FOUND)
    MP4=ERROR_OK:BOOLEAN
    MP5=RUNONLY:BOOLEAN
    MP6=OKTOLINK:BOOLEAN
    MP7=TITLE:STRING
    MP8=TITLE_C:STRING
    MP49=SEGTBL
    MP193=SEGTBL.INTRINS_SEGS
    MP305=LNKDSEGS:PACKED ARRAY[0..31] OF BOOLEAN
    MP307=KINDS:PACKED ARRAY[LINKED..DTASEG] OF BOOLEAN
    MP308
    MP310=LSEG:INTEGER
    MP311=SYSCOM_C
  BEGIN
    TITLE_C := TITLE
-> 02be: LLA  0008        Load local address MP8 (TITLE_C)
   02c0: SLDL 07          Short load local MP7 (TITLE)
   02c1: SAS  50          String assign (TOS to TOS-1, 80 chars)
    ASS_STATUS := NOT_FOUND
   02c3: SLDL 03          Short load local MP3 (ASS_STATUS)
   02c4: SLDC 02          Short load constant 2
   02c5: STO              Store indirect (TOS into TOS-1)
    ASSOCIATE := FALSE
   02c6: SLDC 00          Short load constant 0
   02c7: STL  0001        Store TOS into MP1 (ASSOCIATE)
    FOPEN(G182,TITLE_C,TRUE,NIL)
   02c9: LDA  02 00b6     Load addr G182
   02cd: LLA  0008        Load local address MP8 (TITLE_C)
   02cf: SLDC 01          Short load constant 1
   02d0: LDCN             Load constant NIL
   02d1: CXP  02 04       Call external procedure 4 in seg 2 (SYSIO) (FOPEN)
    IF IORESULT <> 0 THEN
   02d4: CSP  22          Call standard procedure 34 IORESULT
   02d6: SLDC 00          Short load constant 0
   02d7: NEQI             Integer TOS-1 <> TOS
   02d8: FJP  $02e5       Jump if TOS false
    BEGIN
      IF ERROR_OK THEN
   02da: SLDL 04          Short load local MP4 (ERROR_OK)
   02db: FJP  $02e3       Jump if TOS false
        EXECERROR(2) { 'specified program file not available' }
   02dd: SLDC 02          Short load constant 2
   02de: CXP  00 02       Call external procedure 2 in seg 0 EXECERROR
   02e1: UJP  $02e5       Unconditional jump
-> 02e3: UJP  $03dd       Unconditional jump
    END
    ASS_STATUS := FOUND_BAD
-> 02e5: SLDL 03          Short load local MP3 (ASS_STATUS)
   02e6: SLDC 01          Short load constant 1
   02e7: STO              Store indirect (TOS into TOS-1)
    SYSCOM_C := SYSCOM
   02e8: LOD  02 0001     Load word at G1 (SYSCOM)
   02eb: STL  0137        Store TOS into MP311 (SYSCOM_C)
    IF G182.DFKIND <> CODEFILE THEN
   02ee: LDA  02 00c8     Load addr G200 (G182+18)
   02f2: SLDC 04          Short load constant 4
   02f3: SLDC 00          Short load constant 0
   02f4: LDP              Load packed field (TOS)
   02f5: SLDC 02          Short load constant 2
   02f6: NEQI             Integer TOS-1 <> TOS
   02f7: FJP  $02ff       Jump if TOS false
      BEGIN
        EXECERROR(3) { 'specified program file is not code file' }
   02f9: SLDC 03          Short load constant 3
   02fa: CXP  00 02       Call external procedure 2 in seg 0 EXECERROR
        GOTO 1
   02fd: UJP  $03d7       Unconditional jump
      END
      UNITREAD(G182.FUNIT,SEGTBL,0,512,G182.DFIRSTBLK,0)
-> 02ff: LOD  02 00bd     Load word at G189
   0303: LLA  0031        Load local address MP49 (SEGTBL)
   0305: SLDC 00          Short load constant 0
   0306: LDCI 0200        Load word 512
   0309: LOD  02 00c6     Load word at G198 (G182+16)
   030d: SLDC 00          Short load constant 0
   030e: CSP  05          Call standard procedure 5 UNITREAD
      IF IORESULT <> 0 THEN
   0310: CSP  22          Call standard procedure 34 IORESULT
   0312: SLDC 00          Short load constant 0
   0313: NEQI             Integer TOS-1 <> TOS
   0314: FJP  $031a       Jump if TOS false
        EXECERROR(4) { 'unable to read block zero of specified file' }
   0316: SLDC 04          Short load constant 4
   0317: CXP  00 02       Call external procedure 2 in seg 0 EXECERROR
      FILLCHAR(KINDS,0,2,0)
-> 031a: LLA  0133        Load local address MP307 (KINDS)
   031d: SLDC 00          Short load constant 0
   031e: SLDC 02          Short load constant 2
   031f: SLDC 00          Short load constant 0
   0320: CSP  0a          Call standard procedure 10 FLCH
      KINDS[LINKED] := TRUE
   0322: LLA  0133        Load local address MP307 (KINDS)
   0325: SLDC 00          Short load constant 0 {LINKED}
   0326: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0329: SLDC 01          Short load constant 1 
   032a: STP              Store packed field (TOS into TOS-1)
      IF NOT FINDSEGSOFKIND(SEGTBL,LNKDSEGS,KINDS) THEN
   032b: LLA  0031        Load local address MP49 (SEGTBL)
   032d: LLA  0131        Load local address MP305 (LNKDSEGS)
   0330: LLA  0133        Load local address MP307 (KINDS)
   0333: SLDC 00          Short load constant 0
   0334: SLDC 00          Short load constant 0
   0335: CGP  05          Call global procedure 5 (lexLevel 1, curr seg) 
   0337: LNOT             Logical NOT (~TOS)
   0338: FJP  $033e       Jump if TOS false
        EXECERROR(5) { 'specified code file is un-linked' }
   033a: SLDC 05          Short load constant 5
   033b: CXP  00 02       Call external procedure 2 in seg 0 EXECERROR
      LSEG := 0
-> 033e: SLDC 00          Short load constant 0
   033f: STL  0136        Store TOS into MP310 (LSEG)
      WHILE LSEG <= 31 DO
-> 0342: LDL  0136        Load local word MP310 (LSEG)
   0345: SLDC 1f          Short load constant 31
   0346: LEQI             Integer TOS-1 <= TOS
   0347: FJP  $036e       Jump if TOS false
      BEGIN
        IF LNKDSEGS[LSEG] AND SEGTBL.INTRINS_SEGS[LSEG] THEN
   0349: LLA  0131        Load local address MP305 (LNKDSEGS)
   034c: LDL  0136        Load local word MP310 (LSEG)
   034f: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0352: LDP              Load packed field (TOS)
   0353: LLA  00c1        Load local address MP193 (SEGTBL.INTRINS_SEGS)
   0356: LDL  0136        Load local word MP310 (LSEG)
   0359: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   035c: LDP              Load packed field (TOS)
   035d: LAND             Logical AND (TOS & TOS-1)
   035e: FJP  $0364       Jump if TOS false
          EXECERROR(6) { 'conflict between user and intrinsic segments' }
   0360: SLDC 06          Short load constant 6
   0361: CXP  00 02       Call external procedure 2 in seg 0 EXECERROR
        LSEG := LSEG + 1
-> 0364: LDL  0136        Load local word MP310 (LSEG)
   0367: SLDC 01          Short load constant 1
   0368: ADI              Add integers (TOS + TOS-1)
   0369: STL  0136        Store TOS into MP310 (LSEG)
   036c: UJP  $0342       Unconditional jump
      END
      FILLCHAR(MP308,0,4,0)
-> 036e: LLA  0134        Load local address MP308
   0371: SLDC 00          Short load constant 0
   0372: SLDC 04          Short load constant 4
   0373: SLDC 00          Short load constant 0
   0374: CSP  0a          Call standard procedure 10 FLCH
      WHILE SEGTBL.INTRINS_SEGS <> MP308 DO
   0376: LLA  00c1        Load local address MP193 (SEGTBL.INTRINS_SEGS)
   0379: LLA  0134        Load local address MP308
   037c: NEQWORD 2        Word array TOS-1 <> TOS (2 words)
   037f: FJP  $03cf       Jump if TOS false
      BEGIN
        IF NOT LOADLIBRARY('*SYSTEM.LIBRARY') THEN
   0381: LSA  0f          Load string address: '*SYSTEM.LIBRARY'
   0392: NOP              No operation
   0393: SLDC 00          Short load constant 0
   0394: SLDC 00          Short load constant 0
   0395: CGP  06          Call global procedure 6 (lexLevel 1, curr seg) LOADLIBRARY
   0397: LNOT             Logical NOT (~TOS)
   0398: FJP  $039e       Jump if TOS false
          EXECERROR(10) { 'can't load required intrinsics/can't open library file' }
   039a: SLDC 0a          Short load constant 10
   039b: CXP  00 02       Call external procedure 2 in seg 0 EXECERROR
        LSEG := 0
-> 039e: SLDC 00          Short load constant 0
   039f: STL  0136        Store TOS into MP310 (LSEG)
        WHILE LSEG <= 31 DO
-> 03a2: LDL  0136        Load local word MP310 (LSEG)
   03a5: SLDC 1f          Short load constant 31
   03a6: LEQI             Integer TOS-1 <= TOS
   03a7: FJP  $03cf       Jump if TOS false
        BEGIN
          IF SEGTBL.INTRINS_SEGS[LSEG] AND NOT DATASEGS[LSEG] THEN
   03a9: LLA  00c1        Load local address MP193 (SEGTBL.INTRINS_SEGS)
   03ac: LDL  0136        Load local word MP310 (LSEG)
   03af: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   03b2: LDP              Load packed field (TOS)
   03b3: LDA  02 006d     Load addr G109 (DATASEGS)
   03b6: LDL  0136        Load local word MP310 (LSEG)
   03b9: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   03bc: LDP              Load packed field (TOS)
   03bd: LNOT             Logical NOT (~TOS)
   03be: LAND             Logical AND (TOS & TOS-1)
   03bf: FJP  $03c5       Jump if TOS false
            EXECERROR(8) { 'Required intrinsics not available' }
   03c1: SLDC 08          Short load constant 8
   03c2: CXP  00 02       Call external procedure 2 in seg 0 EXECERROR
          LSEG := LSEG + 1
-> 03c5: LDL  0136        Load local word MP310 (LSEG)
   03c8: SLDC 01          Short load constant 1
   03c9: ADI              Add integers (TOS + TOS-1)
   03ca: STL  0136        Store TOS into MP310 (LSEG)
   03cd: UJP  $03a2       Unconditional jump
      END
      COPYSEGTBL(SEGTBL,G182)
-> 03cf: LLA  0031        Load local address MP49 (SEGTBL)
   03d1: LDA  02 00b6     Load addr G182
   03d5: CGP  04          Call global procedure 4 (lexLevel 1, curr seg) PROC4
      ASS_STATUS := FOUND_OK
-> 03d7: SLDL 03          Short load local MP3 (ASS_STATUS)
   03d8: SLDC 00          Short load constant 0
   03d9: STO              Store indirect (TOS into TOS-1)
      ASSOCIATE := TRUE
   03da: SLDC 01          Short load constant 1
   03db: STL  0001        Store TOS into MP1 (ASSOCIATE)
      FCLOSE(G182,0)
-> 03dd: LDA  02 00b6     Load addr G182
   03e1: SLDC 00          Short load constant 0
   03e2: CXP  02 05       Call external procedure 5 in seg 2 (SYSIO) (FCLOSE)
-> 03e5: RNP  01          Return from nonbase procedure
  END

## FIOPRIMS (6) segment
Processing segment 6 named 'FIOPRIMS' containing 3 procedures/functions...
{ 
  FIOPRIMS procedures:
  PROCEDURE FIOPRIMS() #1
  PROCEDURE FGET(VAR F:FIB) #2
  PROCEDURE DOENDOFPAGE(VAR F:FIB) #3
}

LL 1 entry 0266 exit 0266 parms=0 words data=0 words
###  PROCEDURE FIOPRIMS.FIOPRIMS (1)
  BEGIN
-> 0266: RNP  00          Return from nonbase procedure
  END

LL 1 entry 005e exit 024d parms=1 words data=12 words
###  PROCEDURE FIOPRIMS.FGET(VAR F:FIB) (2)
    MP1=F:FIB
    MP2
    MP3
    MP4
    MP5
    MP6
    MP7
    MP8
    MP9
    MP10
    MP11
    MP12
    MP13
  BEGIN
-> 005e: LOD  02 0001     Load word at G1 (SYSCOM)
   0061: SLDC 00          Short load constant 0
   0062: STO              Store indirect (TOS into TOS-1)
   0063: SLDL 01          Short load local MP1
   0064: STL  000c        Store TOS into MP12
   0066: SLDL 0c          Short load local MP12
   0067: SIND 05          Short index load *TOS+5
   0068: FJP  $023e       Jump if TOS false
   006a: SLDL 0c          Short load local MP12
   006b: IND  0e          Static index and load word (TOS+14)
   006d: SLDC 00          Short load constant 0
   006e: GRTI             Integer TOS-1 > TOS
   006f: FJP  $0083       Jump if TOS false
   0071: SLDL 0c          Short load local MP12
   0072: INCP 0e          Inc field ptr (TOS+14)
   0074: SLDL 0c          Short load local MP12
   0075: IND  0e          Static index and load word (TOS+14)
   0077: SLDC 01          Short load constant 1
   0078: SBI              Subtract integers (TOS-1 - TOS)
   0079: STO              Store indirect (TOS into TOS-1)
   007a: SLDL 0c          Short load local MP12
   007b: IND  0e          Static index and load word (TOS+14)
   007d: SLDC 00          Short load constant 0
   007e: GRTI             Integer TOS-1 > TOS
   007f: FJP  $0083       Jump if TOS false
   0081: UJP  $024d       Unconditional jump
-> 0083: SLDL 0c          Short load local MP12
   0084: IND  1d          Static index and load word (TOS+29)
   0086: FJP  $0150       Jump if TOS false
   0088: SLDL 0c          Short load local MP12
   0089: INCP 10          Inc field ptr (TOS+16)
   008b: STL  000d        Store TOS into MP13
   008d: SLDL 0c          Short load local MP12
   008e: SIND 04          Short index load *TOS+4
   008f: STL  0006        Store TOS into MP6
   0091: SLDC 00          Short load constant 0
   0092: STL  0005        Store TOS into MP5
-> 0094: SLDL 0c          Short load local MP12
   0095: IND  0d          Static index and load word (TOS+13)
   0097: SLDL 0c          Short load local MP12
   0098: IND  0c          Static index and load word (TOS+12)
   009a: GEQI             Integer TOS-1 >= TOS
   009b: FJP  $00b7       Jump if TOS false
   009d: SLDL 0c          Short load local MP12
   009e: IND  1f          Static index and load word (TOS+31)
   00a0: SLDL 06          Short load local MP6
   00a1: ADI              Add integers (TOS + TOS-1)
   00a2: SLDL 0c          Short load local MP12
   00a3: IND  1e          Static index and load word (TOS+30)
   00a5: GRTI             Integer TOS-1 > TOS
   00a6: FJP  $00ac       Jump if TOS false
   00a8: UJP  $0243       Unconditional jump
   00aa: UJP  $00b5       Unconditional jump
-> 00ac: SLDL 0d          Short load local MP13
   00ad: IND  0b          Static index and load word (TOS+11)
   00af: SLDL 0c          Short load local MP12
   00b0: IND  1f          Static index and load word (TOS+31)
   00b2: SBI              Subtract integers (TOS-1 - TOS)
   00b3: STL  0004        Store TOS into MP4
-> 00b5: UJP  $00c0       Unconditional jump
-> 00b7: LDCI 0200        Load word 512
   00ba: SLDL 0c          Short load local MP12
   00bb: IND  1f          Static index and load word (TOS+31)
   00bd: SBI              Subtract integers (TOS-1 - TOS)
   00be: STL  0004        Store TOS into MP4
-> 00c0: SLDL 06          Short load local MP6
   00c1: STL  0003        Store TOS into MP3
   00c3: SLDL 03          Short load local MP3
   00c4: SLDL 04          Short load local MP4
   00c5: GRTI             Integer TOS-1 > TOS
   00c6: FJP  $00cb       Jump if TOS false
   00c8: SLDL 04          Short load local MP4
   00c9: STL  0003        Store TOS into MP3
-> 00cb: SLDL 03          Short load local MP3
   00cc: SLDC 00          Short load constant 0
   00cd: GRTI             Integer TOS-1 > TOS
   00ce: FJP  $00ef       Jump if TOS false
   00d0: SLDL 0c          Short load local MP12
   00d1: INCP 21          Inc field ptr (TOS+33)
   00d3: SLDL 0c          Short load local MP12
   00d4: IND  1f          Static index and load word (TOS+31)
   00d6: SLDL 0c          Short load local MP12
   00d7: SIND 00          Short index load *TOS+0
   00d8: SLDL 05          Short load local MP5
   00d9: SLDL 03          Short load local MP3
   00da: CSP  02          Call standard procedure 2 MOVL
   00dc: SLDL 0c          Short load local MP12
   00dd: INCP 1f          Inc field ptr (TOS+31)
   00df: SLDL 0c          Short load local MP12
   00e0: IND  1f          Static index and load word (TOS+31)
   00e2: SLDL 03          Short load local MP3
   00e3: ADI              Add integers (TOS + TOS-1)
   00e4: STO              Store indirect (TOS into TOS-1)
   00e5: SLDL 05          Short load local MP5
   00e6: SLDL 03          Short load local MP3
   00e7: ADI              Add integers (TOS + TOS-1)
   00e8: STL  0005        Store TOS into MP5
   00ea: SLDL 06          Short load local MP6
   00eb: SLDL 03          Short load local MP3
   00ec: SBI              Subtract integers (TOS-1 - TOS)
   00ed: STL  0006        Store TOS into MP6
-> 00ef: SLDL 06          Short load local MP6
   00f0: SLDC 00          Short load constant 0
   00f1: EQUI             Integer TOS-1 = TOS
   00f2: STL  0008        Store TOS into MP8
   00f4: SLDL 08          Short load local MP8
   00f5: LNOT             Logical NOT (~TOS)
   00f6: FJP  $014b       Jump if TOS false
   00f8: SLDL 0c          Short load local MP12
   00f9: IND  20          Static index and load word (TOS+32)
   00fb: FJP  $011b       Jump if TOS false
   00fd: SLDL 0c          Short load local MP12
   00fe: INCP 20          Inc field ptr (TOS+32)
   0100: SLDC 00          Short load constant 0
   0101: STO              Store indirect (TOS into TOS-1)
   0102: SLDL 0c          Short load local MP12
   0103: INCP 0f          Inc field ptr (TOS+15)
   0105: SLDC 01          Short load constant 1
   0106: STO              Store indirect (TOS into TOS-1)
   0107: SLDL 0c          Short load local MP12
   0108: SIND 07          Short index load *TOS+7
   0109: SLDL 0c          Short load local MP12
   010a: INCP 21          Inc field ptr (TOS+33)
   010c: SLDC 00          Short load constant 0
   010d: LDCI 0200        Load word 512
   0110: SLDL 0d          Short load local MP13
   0111: SIND 00          Short index load *TOS+0
   0112: SLDL 0c          Short load local MP12
   0113: IND  0d          Static index and load word (TOS+13)
   0115: ADI              Add integers (TOS + TOS-1)
   0116: SLDC 01          Short load constant 1
   0117: SBI              Subtract integers (TOS-1 - TOS)
   0118: SLDC 00          Short load constant 0
   0119: CSP  06          Call standard procedure 6 UNITWRITE
-> 011b: CSP  22          Call standard procedure 34 IORESULT
   011d: SLDC 00          Short load constant 0
   011e: NEQI             Integer TOS-1 <> TOS
   011f: FJP  $0123       Jump if TOS false
   0121: UJP  $0243       Unconditional jump
-> 0123: SLDL 0c          Short load local MP12
   0124: SIND 07          Short index load *TOS+7
   0125: SLDL 0c          Short load local MP12
   0126: INCP 21          Inc field ptr (TOS+33)
   0128: SLDC 00          Short load constant 0
   0129: LDCI 0200        Load word 512
   012c: SLDL 0d          Short load local MP13
   012d: SIND 00          Short index load *TOS+0
   012e: SLDL 0c          Short load local MP12
   012f: IND  0d          Static index and load word (TOS+13)
   0131: ADI              Add integers (TOS + TOS-1)
   0132: SLDC 00          Short load constant 0
   0133: CSP  05          Call standard procedure 5 UNITREAD
   0135: CSP  22          Call standard procedure 34 IORESULT
   0137: SLDC 00          Short load constant 0
   0138: NEQI             Integer TOS-1 <> TOS
   0139: FJP  $013d       Jump if TOS false
   013b: UJP  $0243       Unconditional jump
-> 013d: SLDL 0c          Short load local MP12
   013e: INCP 0d          Inc field ptr (TOS+13)
   0140: SLDL 0c          Short load local MP12
   0141: IND  0d          Static index and load word (TOS+13)
   0143: SLDC 01          Short load constant 1
   0144: ADI              Add integers (TOS + TOS-1)
   0145: STO              Store indirect (TOS into TOS-1)
   0146: SLDL 0c          Short load local MP12
   0147: INCP 1f          Inc field ptr (TOS+31)
   0149: SLDC 00          Short load constant 0
   014a: STO              Store indirect (TOS into TOS-1)
-> 014b: SLDL 08          Short load local MP8
   014c: FJP  $0094       Jump if TOS false
   014e: UJP  $01c0       Unconditional jump
-> 0150: SLDL 0c          Short load local MP12
   0151: SIND 07          Short index load *TOS+7
   0152: SLDC 01          Short load constant 1
   0153: EQUI             Integer TOS-1 = TOS
   0154: STL  0009        Store TOS into MP9
   0156: SLDL 09          Short load local MP9
   0157: FJP  $015e       Jump if TOS false
   0159: SLDC 02          Short load constant 2
   015a: STL  0007        Store TOS into MP7
   015c: UJP  $0162       Unconditional jump
-> 015e: SLDL 0c          Short load local MP12
   015f: SIND 07          Short index load *TOS+7
   0160: STL  0007        Store TOS into MP7
-> 0162: SLDC 01          Short load constant 1
   0163: STL  000a        Store TOS into MP10
   0165: SLDC 20          Short load constant 32
   0166: STL  000b        Store TOS into MP11
   0168: SLDC 00          Short load constant 0
   0169: STL  0002        Store TOS into MP2
-> 016b: SLDL 02          Short load local MP2
   016c: SLDL 0c          Short load local MP12
   016d: SIND 04          Short index load *TOS+4
   016e: LESI             Integer TOS-1 < TOS
   016f: SLDL 0a          Short load local MP10
   0170: LAND             Logical AND (TOS & TOS-1)
   0171: FJP  $01c0       Jump if TOS false
   0173: SLDL 07          Short load local MP7
   0174: LLA  000b        Load local address MP11
   0176: SLDC 00          Short load constant 0
   0177: SLDC 01          Short load constant 1
   0178: SLDC 00          Short load constant 0
   0179: SLDC 00          Short load constant 0
   017a: CSP  05          Call standard procedure 5 UNITREAD
   017c: CSP  22          Call standard procedure 34 IORESULT
   017e: SLDC 00          Short load constant 0
   017f: NEQI             Integer TOS-1 <> TOS
   0180: FJP  $0184       Jump if TOS false
   0182: UJP  $0243       Unconditional jump
-> 0184: SLDL 09          Short load local MP9
   0185: FJP  $019c       Jump if TOS false
   0187: LDA  02 006f     Load addr G111 (NONPRINTCHARS)
   018a: SLDL 0b          Short load local MP11
   018b: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   018e: LDP              Load packed field (TOS)
   018f: LNOT             Logical NOT (~TOS)
   0190: FJP  $019c       Jump if TOS false
   0192: SLDL 0c          Short load local MP12
   0193: SIND 07          Short index load *TOS+7
   0194: LLA  000b        Load local address MP11
   0196: SLDC 00          Short load constant 0
   0197: SLDC 01          Short load constant 1
   0198: SLDC 00          Short load constant 0
   0199: SLDC 00          Short load constant 0
   019a: CSP  06          Call standard procedure 6 UNITWRITE
-> 019c: SLDL 0b          Short load local MP11
   019d: LOD  02 0001     Load word at G1 (SYSCOM)
   01a0: INCP 29          Inc field ptr (TOS+41)
   01a2: SLDC 08          Short load constant 8
   01a3: SLDC 00          Short load constant 0
   01a4: LDP              Load packed field (TOS)
   01a5: EQUI             Integer TOS-1 = TOS
   01a6: FJP  $01b4       Jump if TOS false
   01a8: SLDL 0c          Short load local MP12
   01a9: SIND 07          Short index load *TOS+7
   01aa: SLDC 01          Short load constant 1
   01ab: EQUI             Integer TOS-1 = TOS
   01ac: FJP  $01b1       Jump if TOS false
   01ae: SLDC 00          Short load constant 0
   01af: STL  000b        Store TOS into MP11
-> 01b1: SLDC 00          Short load constant 0
   01b2: STL  000a        Store TOS into MP10
-> 01b4: SLDL 0c          Short load local MP12
   01b5: SIND 00          Short index load *TOS+0
   01b6: SLDL 02          Short load local MP2
   01b7: SLDL 0b          Short load local MP11
   01b8: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   01b9: SLDL 02          Short load local MP2
   01ba: SLDC 01          Short load constant 1
   01bb: ADI              Add integers (TOS + TOS-1)
   01bc: STL  0002        Store TOS into MP2
   01be: UJP  $016b       Unconditional jump
-> 01c0: SLDL 0c          Short load local MP12
   01c1: SIND 04          Short index load *TOS+4
   01c2: SLDC 01          Short load constant 1
   01c3: EQUI             Integer TOS-1 = TOS
   01c4: FJP  $023c       Jump if TOS false
   01c6: SLDL 0c          Short load local MP12
   01c7: INCP 01          Inc field ptr (TOS+1)
   01c9: SLDC 00          Short load constant 0
   01ca: STO              Store indirect (TOS into TOS-1)
   01cb: SLDL 0c          Short load local MP12
   01cc: SIND 03          Short index load *TOS+3
   01cd: SLDC 00          Short load constant 0
   01ce: NEQI             Integer TOS-1 <> TOS
   01cf: FJP  $01d6       Jump if TOS false
   01d1: SLDL 0c          Short load local MP12
   01d2: INCP 03          Inc field ptr (TOS+3)
   01d4: SLDC 02          Short load constant 2
   01d5: STO              Store indirect (TOS into TOS-1)
-> 01d6: SLDL 0c          Short load local MP12
   01d7: SIND 00          Short index load *TOS+0
   01d8: SLDC 00          Short load constant 0
   01d9: LDB              Load byte at byte ptr TOS-1 + TOS
   01da: SLDC 0d          Short load constant 13
   01db: EQUI             Integer TOS-1 = TOS
   01dc: FJP  $01ea       Jump if TOS false
   01de: SLDL 0c          Short load local MP12
   01df: SIND 00          Short index load *TOS+0
   01e0: SLDC 00          Short load constant 0
   01e1: SLDC 20          Short load constant 32
   01e2: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   01e3: SLDL 0c          Short load local MP12
   01e4: INCP 01          Inc field ptr (TOS+1)
   01e6: SLDC 01          Short load constant 1
   01e7: STO              Store indirect (TOS into TOS-1)
   01e8: UJP  $024d       Unconditional jump
-> 01ea: SLDL 0c          Short load local MP12
   01eb: SIND 00          Short index load *TOS+0
   01ec: SLDC 00          Short load constant 0
   01ed: LDB              Load byte at byte ptr TOS-1 + TOS
   01ee: SLDC 10          Short load constant 16
   01ef: EQUI             Integer TOS-1 = TOS
   01f0: SLDL 0c          Short load local MP12
   01f1: SIND 07          Short index load *TOS+7
   01f2: SLDC 02          Short load constant 2
   01f3: GRTI             Integer TOS-1 > TOS
   01f4: LAND             Logical AND (TOS & TOS-1)
   01f5: FJP  $021a       Jump if TOS false
   01f7: SLDL 01          Short load local MP1
   01f8: CGP  02          Call global procedure 2 (lexLevel 1, curr seg) FGET
   01fa: SLDL 0c          Short load local MP12
   01fb: SIND 00          Short index load *TOS+0
   01fc: SLDC 00          Short load constant 0
   01fd: LDB              Load byte at byte ptr TOS-1 + TOS
   01fe: SLDC 20          Short load constant 32
   01ff: SBI              Subtract integers (TOS-1 - TOS)
   0200: STL  0003        Store TOS into MP3
   0202: SLDL 03          Short load local MP3
   0203: SLDC 00          Short load constant 0
   0204: GRTI             Integer TOS-1 > TOS
   0205: SLDL 03          Short load local MP3
   0206: SLDC 7f          Short load constant 127
   0207: LEQI             Integer TOS-1 <= TOS
   0208: LAND             Logical AND (TOS & TOS-1)
   0209: FJP  $0217       Jump if TOS false
   020b: SLDL 0c          Short load local MP12
   020c: SIND 00          Short index load *TOS+0
   020d: SLDC 00          Short load constant 0
   020e: SLDC 20          Short load constant 32
   020f: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0210: SLDL 0c          Short load local MP12
   0211: INCP 0e          Inc field ptr (TOS+14)
   0213: SLDL 03          Short load local MP3
   0214: STO              Store indirect (TOS into TOS-1)
   0215: UJP  $024d       Unconditional jump
-> 0217: SLDL 01          Short load local MP1
   0218: CGP  02          Call global procedure 2 (lexLevel 1, curr seg) FGET
-> 021a: SLDL 0c          Short load local MP12
   021b: SIND 00          Short index load *TOS+0
   021c: SLDC 00          Short load constant 0
   021d: LDB              Load byte at byte ptr TOS-1 + TOS
   021e: SLDC 00          Short load constant 0
   021f: EQUI             Integer TOS-1 = TOS
   0220: FJP  $023c       Jump if TOS false
   0222: SLDL 0c          Short load local MP12
   0223: IND  1d          Static index and load word (TOS+29)
   0225: SLDL 0c          Short load local MP12
   0226: INCP 12          Inc field ptr (TOS+18)
   0228: SLDC 04          Short load constant 4
   0229: SLDC 00          Short load constant 0
   022a: LDP              Load packed field (TOS)
   022b: SLDC 03          Short load constant 3
   022c: EQUI             Integer TOS-1 = TOS
   022d: LAND             Logical AND (TOS & TOS-1)
   022e: FJP  $0235       Jump if TOS false
   0230: SLDL 01          Short load local MP1
   0231: CLP  03          Call local procedure 3 (child) DOENDOFPAGE
   0233: UJP  $023c       Unconditional jump
-> 0235: SLDL 0c          Short load local MP12
   0236: SIND 00          Short index load *TOS+0
   0237: SLDC 00          Short load constant 0
   0238: SLDC 20          Short load constant 32
   0239: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   023a: UJP  $0243       Unconditional jump
-> 023c: UJP  $024d       Unconditional jump
-> 023e: LOD  02 0001     Load word at G1 (SYSCOM)
   0241: SLDC 0d          Short load constant 13
   0242: STO              Store indirect (TOS into TOS-1)
-> 0243: SLDL 0c          Short load local MP12
   0244: INCP 02          Inc field ptr (TOS+2)
   0246: SLDC 01          Short load constant 1
   0247: STO              Store indirect (TOS into TOS-1)
   0248: SLDL 0c          Short load local MP12
   0249: INCP 01          Inc field ptr (TOS+1)
   024b: SLDC 01          Short load constant 1
   024c: STO              Store indirect (TOS into TOS-1)
-> 024d: RNP  00          Return from nonbase procedure
  END

LL 2 entry 0000 exit 0051 parms=1 words data=291 words
###    PROCEDURE FIOPRIMS.DOENDOFPAGE(F:FIB) (3)
      MP1=F:FIBP
      MP2=F_C:FIB
      MP292=F_P:FIBP
    BEGIN
      F_C := F
-> 0000: LLA  0002        Load local address MP2
   0002: SLDL 01          Short load local MP1
   0003: MOV  0122        Move 290 words (TOS to TOS-1)
      F_P := F
   0006: SLDL 01          Short load local MP1
   0007: STL  0124        Store TOS into MP292
   000a: LDL  0124        Load local word MP292
      IF ODD(F_P.FNEXTBLK) THEN
   000d: IND  0d          Static index and load word (TOS+13)
   000f: FJP  $001e       Jump if TOS false
      BEGIN
        F_P.FNEXTBLK := F_P.FNEXTBLK + 1
   0011: LDL  0124        Load local word MP292
   0014: INCP 0d          Inc field ptr (TOS+13)
   0016: LDL  0124        Load local word MP292
   0019: IND  0d          Static index and load word (TOS+13)
   001b: SLDC 01          Short load constant 1
   001c: ADI              Add integers (TOS + TOS-1)
   001d: STO              Store indirect (TOS into TOS-1)
      END
      F_P.FNEXTBYTE := 512
-> 001e: LDL  0124        Load local word MP292
   0021: INCP 1f          Inc field ptr (TOS+31)
   0023: LDCI 0200        Load word 512
   0026: STO              Store indirect (TOS into TOS-1)
      FGET(F)
   0027: SLDL 01          Short load local MP1
   0028: CGP  02          Call global procedure 2 (lexLevel 1, curr seg) FGET
      IF F_P.FEOF THEN
   002a: LDL  0124        Load local word MP292
   002d: SIND 02          Short index load *TOS+2
   002e: FJP  $0051       Jump if TOS false
      BEGIN
        MP1 := F_C
   0030: SLDL 01          Short load local MP1
   0031: LLA  0002        Load local address MP2
   0033: MOV  0122        Move 290 words (TOS to TOS-1)
        F_P.FEOF := TRUE 
   0036: LDL  0124        Load local word MP292
   0039: INCP 02          Inc field ptr (TOS+2)
   003b: SLDC 01          Short load constant 1
   003c: STO              Store indirect (TOS into TOS-1)
        F_P.FEOLN := TRUE
   003d: LDL  0124        Load local word MP292
   0040: INCP 01          Inc field ptr (TOS+1)
   0042: SLDC 01          Short load constant 1
   0043: STO              Store indirect (TOS into TOS-1)
        F_P.FNEXTBYTE := F_P.FNEXTBYTE - 1
   0044: LDL  0124        Load local word MP292
   0047: INCP 1f          Inc field ptr (TOS+31)
   0049: LDL  0124        Load local word MP292
   004c: IND  1f          Static index and load word (TOS+31)
   004e: SLDC 01          Short load constant 1
   004f: SBI              Subtract integers (TOS-1 - TOS)
   0050: STO              Store indirect (TOS into TOS-1)
      END
-> 0051: RNP  00          Return from nonbase procedure
    END
