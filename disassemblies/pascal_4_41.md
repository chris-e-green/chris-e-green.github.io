#  SYSTEM.PASCAL-04-41.bin 

## Segment Table
| slot |segNum | name | block | length | kind | textAddr | mType | version |
|-----:|------:|------|------:|-------:|------|---------:|-------|--------:|
| 0 | 0 | PASCALSY | 0001 | 1406 | linked | 0000 | 2 | 6 |
| 15 | 15 |  | 0004 | 1898 | linked | 0000 | 0 | 0 |
| 1 | 1 | USERPROG | 0008 | 20 | linked | 0000 | 2 | 6 |
| 2 | 2 | FIOPRIMS | 0009 | 796 | linked_intrins | 0000 | 2 | 6 |
| 3 | 3 | PRINTERR | 000B | 20 | linked | 0000 | 2 | 6 |
| 4 | 4 | INITIALI | 000C | 1996 | linked | 0000 | 2 | 6 |
| 5 | 5 | GETCMD | 0010 | 2422 | linked | 0000 | 2 | 6 |
| 6 | 6 | SYSIO | 0015 | 3652 | linked_intrins | 0000 | 2 | 6 |

intrinsics: [2, 6]

comment: COPYRIGHT 1979,1980,1983-1985 APPLE COMPUTER, INC. ALL RIGHTS RESERVED

## Globals

G1 SYSCOM:^SYSCOMREC
G2 GFILES[0]=INPUT:FIBP
G3 GFILES[1]=OUTPUT:FIBP
G4 GFILES[2]=SYSTERM:FIBP
G5 EMPTYHEAP:^INTEGER
G6 SWAPFIB
G7 SYSTERMFIB
G8 OUTPUTFIB
G9 INPUTFIB
G10
G14 SYVID
G18
G19
G20 IPOT
G25 FILLER
G31 UNITABLE
G157
G173 GLOBALTITLE
G185
G226
G227
G228
G229 JUSTBOOTED:BOOLEAN
G230
G237
G246
G248
G520
G521
G525
G529
G533 DATASEGS

## Segment PASCALSY (0)

### PROCEDURE PASCALSY.PASCALSY (* P=1 LL=-1 *)
  G5 EMPTYHEAP
BEGIN
  EMPTYHEAP := NIL
-> 0000: LDCN             Load constant NIL
   0001: STL  0005        Store TOS into G5 (EMPTYHEAP)
  UNITCLEAR(1)
   0003: SLDC 01          Short load constant 1
   0004: CSP  26          Call standard procedure UNITCLEAR
  INITIALI.INITIALIZE
   0006: CXP  04 01       Call external procedure INITIALI.INITIALIZE
  REPEAT
    PASCALSY.COMMAND
-> 0009: CBP  20          Call base procedure PASCALSY.COMMAND
    IF EMPTYHEAP <> NIL THEN
   000b: SLDL 05          Short load local G5 (EMPTYHEAP)
   000c: LDCN             Load constant NIL
   000d: NEQI             Integer TOS-1 <> TOS
   000e: FJP  $0013       Jump if TOS false
      INITIALI.INITIALIZE
   0010: CXP  04 01       Call external procedure INITIALI.INITIALIZE
  UNTIL FALSE
-> 0013: SLDC 00          Short load constant 0
   0014: FJP  $0009       Jump if TOS false
-> 0016: XIT              Exit the operating system
END

### PROCEDURE PASCALSY.EXECERROR(ERRNUM:INTEGER) (* P=2 LL=0 *)
  BASE1=ERRNUM:INTEGER
BEGIN
  PASCALSY.FGOTOXY(1,10)
-> 0024: SLDC 01          Short load constant 1
   0025: SLDC 0a          Short load constant 10
   0026: CXP  00 1d       Call external procedure PASCALSY.FGOTOXY
  PASCALSY.FWRITESTRING(OUTPUT,'SYSTEM FAILURE NUMBER ',0)
   0029: LOD  01 0003     Load word at G3 (OUTPUT)
   002c: NOP              No operation
   002d: LSA  16          Load string address: 'SYSTEM FAILURE NUMBER '
   0045: SLDC 00          Short load constant 0
   0046: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
  IOCHECK 
   0049: CSP  00          Call standard procedure IOC
  PASCALSY.FWRITEINT(OUTPUT,ERRNUM,0)
   004b: LOD  01 0003     Load word at G3 (OUTPUT)
   004e: SLDO 01          Short load global BASE1 (ERRNUM)
   004f: SLDC 00          Short load constant 0
   0050: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
  IOCHECK
   0053: CSP  00          Call standard procedure IOC
  PASCALSY.FWRITESTRING(OUTPUT,'. PLEASE REFER',0)
   0055: LOD  01 0003     Load word at G3 (OUTPUT)
   0058: NOP              No operation
   0059: LSA  0e          Load string address: '. PLEASE REFER'
   0069: SLDC 00          Short load constant 0
   006a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
  IOCHECK
   006d: CSP  00          Call standard procedure IOC
  PASCALSY.FGOTOXY(1,11)
   006f: SLDC 01          Short load constant 1
   0070: SLDC 0b          Short load constant 11
   0071: CXP  00 1d       Call external procedure PASCALSY.FGOTOXY
  PASCALSY.FWRITESTRING(OUTPUT,'TO PRODUCT MANUAL FOR EXPLANATION.',0)
   0074: LOD  01 0003     Load word at G3 (OUTPUT)
   0077: LSA  22          Load string address: 'TO PRODUCT MANUAL FOR EXPLANATION.'
   009b: NOP              No operation
   009c: SLDC 00          Short load constant 0
   009d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
  IOCHECK
   00a0: CSP  00          Call standard procedure IOC
  REPEAT
-> 00a2: SLDC 01          Short load constant 1
   00a3: FJP  $00a7       Jump if TOS false
  UNTIL FALSE
   00a5: UJP  $00a2       Unconditional jump
-> 00a7: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FINIT(VAR F:FIB; WINDOW:WINDOWP; RECWORDS:INTEGER) (* P=3 LL=0 *)
  BASE1=RECWORDS:INTEGER
  BASE2=WINDOW:WINDOWP
  BASE3=F:FIB
BEGIN
  SYSIO.FINIT(F,WINDOW,RECWORDS)
-> 00b6: SLDO 03          Short load global BASE3 (F)
   00b7: SLDO 02          Short load global BASE2 (WINDOW)
   00b8: SLDO 01          Short load global BASE1 (RECWORDS)
   00b9: CXP  06 02       Call external procedure SYSIO.FINIT
-> 00bc: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FRESET(VAR F:FIB) (* P=4 LL=0 *)
  BASE1=F:FIB
BEGIN
  SYSIO.FRESET(F)
-> 00c8: SLDO 01          Short load global BASE1 (F)
   00c9: CXP  06 03       Call external procedure SYSIO.FRESET
-> 00cc: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FOPEN(VAR F:FIB; VAR FTITLE:STRING; FOPENOLD:BOOLEAN; JUNK:FIBP) (* P=5 LL=0 *)
  BASE1=JUNK:FIBP
  BASE2=FOPENOLD:BOOLEAN
  BASE3=FTITLE:STRING
  BASE4=F:FIB
BEGIN
-> 00d8: SLDO 04          Short load global BASE4
   00d9: SLDO 03          Short load global BASE3
   00da: SLDO 02          Short load global BASE2
   00db: SLDO 01          Short load global BASE1
   00dc: CXP  06 04       Call external procedure SYSIO.FOPEN
-> 00df: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FCLOSE(VAR F: FIB; FTYPE: CLOSETYPE) (* P=6 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
BEGIN
-> 00ec: SLDO 02          Short load global BASE2
   00ed: SLDO 01          Short load global BASE1
   00ee: CXP  06 05       Call external procedure SYSIO.FCLOSE
-> 00f1: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FGET(VAR F:FIB) (* P=7 LL=0 *)
  BASE1=PARAM1
  BASE2
  BASE7
  BASE9
  BASE10
  BASE11
  BASE12
BEGIN
-> 00fe: LOD  01 0001     Load word at G1 (SYSCOM)
   0101: SLDC 00          Short load constant 0
   0102: STO              Store indirect (TOS into TOS-1)
   0103: SLDO 01          Short load global BASE1
   0104: SRO  0c          Store global word BASE12
   0106: SLDO 0c          Short load global BASE12
   0107: SIND 05          Short index load *TOS+5
   0108: FJP  $020e       Jump if TOS false
   010a: SLDO 0c          Short load global BASE12
   010b: IND  0e          Static index and load word (TOS+14)
   010d: SLDC 00          Short load constant 0
   010e: GRTI             Integer TOS-1 > TOS
   010f: FJP  $0123       Jump if TOS false
   0111: SLDO 0c          Short load global BASE12
   0112: INCP 0e          Inc field ptr (TOS+14)
   0114: SLDO 0c          Short load global BASE12
   0115: IND  0e          Static index and load word (TOS+14)
   0117: SLDC 01          Short load constant 1
   0118: SBI              Subtract integers (TOS-1 - TOS)
   0119: STO              Store indirect (TOS into TOS-1)
   011a: SLDO 0c          Short load global BASE12
   011b: IND  0e          Static index and load word (TOS+14)
   011d: SLDC 00          Short load constant 0
   011e: GRTI             Integer TOS-1 > TOS
   011f: FJP  $0123       Jump if TOS false
   0121: UJP  $021d       Unconditional jump
-> 0123: SLDO 0c          Short load global BASE12
   0124: IND  1d          Static index and load word (TOS+29)
   0126: FJP  $0134       Jump if TOS false
   0128: SLDO 01          Short load global BASE1
   0129: SLDC 00          Short load constant 0
   012a: SLDC 00          Short load constant 0
   012b: CXP  02 02       Call external procedure FIOPRIMS.2
   012e: FJP  $0132       Jump if TOS false
   0130: UJP  $0213       Unconditional jump
-> 0132: UJP  $01a5       Unconditional jump
-> 0134: SLDO 0c          Short load global BASE12
   0135: SIND 07          Short index load *TOS+7
   0136: SLDC 01          Short load constant 1
   0137: EQUI             Integer TOS-1 = TOS
   0138: SRO  09          Store global word BASE9
   013a: SLDO 09          Short load global BASE9
   013b: FJP  $0142       Jump if TOS false
   013d: SLDC 02          Short load constant 2
   013e: SRO  07          Store global word BASE7
   0140: UJP  $0146       Unconditional jump
-> 0142: SLDO 0c          Short load global BASE12
   0143: SIND 07          Short index load *TOS+7
   0144: SRO  07          Store global word BASE7
-> 0146: SLDC 01          Short load constant 1
   0147: SRO  0a          Store global word BASE10
   0149: SLDC 20          Short load constant 32
   014a: SRO  0b          Store global word BASE11
   014c: SLDC 00          Short load constant 0
   014d: SRO  02          Store global word BASE2
-> 014f: SLDO 02          Short load global BASE2
   0150: SLDO 0c          Short load global BASE12
   0151: SIND 04          Short index load *TOS+4
   0152: LESI             Integer TOS-1 < TOS
   0153: SLDO 0a          Short load global BASE10
   0154: LAND             Logical AND (TOS & TOS-1)
   0155: FJP  $01a5       Jump if TOS false
   0157: SLDO 07          Short load global BASE7
   0158: LAO  0b          Load global BASE11
   015a: SLDC 00          Short load constant 0
   015b: SLDC 01          Short load constant 1
   015c: SLDC 00          Short load constant 0
   015d: SLDC 00          Short load constant 0
   015e: CSP  05          Call standard procedure UNITREAD
   0160: CSP  22          Call standard procedure IORESULT
   0162: SLDC 00          Short load constant 0
   0163: NEQI             Integer TOS-1 <> TOS
   0164: FJP  $0168       Jump if TOS false
   0166: UJP  $0213       Unconditional jump
-> 0168: SLDO 09          Short load global BASE9
   0169: FJP  $0181       Jump if TOS false
   016b: LDA  01 009d     Load addr G157
   016f: SLDO 0b          Short load global BASE11
   0170: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0173: LDP              Load packed field (TOS)
   0174: LNOT             Logical NOT (~TOS)
   0175: FJP  $0181       Jump if TOS false
   0177: SLDO 0c          Short load global BASE12
   0178: SIND 07          Short index load *TOS+7
   0179: LAO  0b          Load global BASE11
   017b: SLDC 00          Short load constant 0
   017c: SLDC 01          Short load constant 1
   017d: SLDC 00          Short load constant 0
   017e: SLDC 00          Short load constant 0
   017f: CSP  06          Call standard procedure UNITWRITE
-> 0181: SLDO 0b          Short load global BASE11
   0182: LOD  01 0001     Load word at G1 (SYSCOM)
   0185: INCP 29          Inc field ptr (TOS+41)
   0187: SLDC 08          Short load constant 8
   0188: SLDC 00          Short load constant 0
   0189: LDP              Load packed field (TOS)
   018a: EQUI             Integer TOS-1 = TOS
   018b: FJP  $0199       Jump if TOS false
   018d: SLDO 0c          Short load global BASE12
   018e: SIND 07          Short index load *TOS+7
   018f: SLDC 01          Short load constant 1
   0190: EQUI             Integer TOS-1 = TOS
   0191: FJP  $0196       Jump if TOS false
   0193: SLDC 00          Short load constant 0
   0194: SRO  0b          Store global word BASE11
-> 0196: SLDC 00          Short load constant 0
   0197: SRO  0a          Store global word BASE10
-> 0199: SLDO 0c          Short load global BASE12
   019a: SIND 00          Short index load *TOS+0
   019b: SLDO 02          Short load global BASE2
   019c: SLDO 0b          Short load global BASE11
   019d: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   019e: SLDO 02          Short load global BASE2
   019f: SLDC 01          Short load constant 1
   01a0: ADI              Add integers (TOS + TOS-1)
   01a1: SRO  02          Store global word BASE2
   01a3: UJP  $014f       Unconditional jump
-> 01a5: SLDO 0c          Short load global BASE12
   01a6: SIND 04          Short index load *TOS+4
   01a7: SLDC 01          Short load constant 1
   01a8: EQUI             Integer TOS-1 = TOS
   01a9: FJP  $020c       Jump if TOS false
   01ab: SLDO 0c          Short load global BASE12
   01ac: INCP 01          Inc field ptr (TOS+1)
   01ae: SLDC 00          Short load constant 0
   01af: STO              Store indirect (TOS into TOS-1)
   01b0: SLDO 0c          Short load global BASE12
   01b1: SIND 03          Short index load *TOS+3
   01b2: SLDC 00          Short load constant 0
   01b3: NEQI             Integer TOS-1 <> TOS
   01b4: FJP  $01bb       Jump if TOS false
   01b6: SLDO 0c          Short load global BASE12
   01b7: INCP 03          Inc field ptr (TOS+3)
   01b9: SLDC 02          Short load constant 2
   01ba: STO              Store indirect (TOS into TOS-1)
-> 01bb: SLDO 0c          Short load global BASE12
   01bc: SIND 00          Short index load *TOS+0
   01bd: SLDC 00          Short load constant 0
   01be: LDB              Load byte at byte ptr TOS-1 + TOS
   01bf: SLDC 0d          Short load constant 13
   01c0: EQUI             Integer TOS-1 = TOS
   01c1: FJP  $01cf       Jump if TOS false
   01c3: SLDO 0c          Short load global BASE12
   01c4: SIND 00          Short index load *TOS+0
   01c5: SLDC 00          Short load constant 0
   01c6: SLDC 20          Short load constant 32
   01c7: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   01c8: SLDO 0c          Short load global BASE12
   01c9: INCP 01          Inc field ptr (TOS+1)
   01cb: SLDC 01          Short load constant 1
   01cc: STO              Store indirect (TOS into TOS-1)
   01cd: UJP  $021d       Unconditional jump
-> 01cf: SLDO 0c          Short load global BASE12
   01d0: SIND 07          Short index load *TOS+7
   01d1: SLDC 02          Short load constant 2
   01d2: GRTI             Integer TOS-1 > TOS
   01d3: FJP  $01e9       Jump if TOS false
   01d5: SLDO 0c          Short load global BASE12
   01d6: SIND 00          Short index load *TOS+0
   01d7: SLDC 00          Short load constant 0
   01d8: LDB              Load byte at byte ptr TOS-1 + TOS
   01d9: SLDC 10          Short load constant 16
   01da: EQUI             Integer TOS-1 = TOS
   01db: FJP  $01e9       Jump if TOS false
   01dd: SLDO 01          Short load global BASE1
   01de: SLDC 00          Short load constant 0
   01df: SLDC 00          Short load constant 0
   01e0: CXP  02 03       Call external procedure FIOPRIMS.3
   01e3: FJP  $01e9       Jump if TOS false
   01e5: SLDC 00          Short load constant 0
   01e6: SLDC 07          Short load constant 7
   01e7: CSP  04          Call standard procedure EXIT
-> 01e9: SLDO 0c          Short load global BASE12
   01ea: SIND 00          Short index load *TOS+0
   01eb: SLDC 00          Short load constant 0
   01ec: LDB              Load byte at byte ptr TOS-1 + TOS
   01ed: SLDC 00          Short load constant 0
   01ee: EQUI             Integer TOS-1 = TOS
   01ef: FJP  $020c       Jump if TOS false
   01f1: SLDO 0c          Short load global BASE12
   01f2: IND  1d          Static index and load word (TOS+29)
   01f4: SLDO 0c          Short load global BASE12
   01f5: INCP 12          Inc field ptr (TOS+18)
   01f7: SLDC 04          Short load constant 4
   01f8: SLDC 00          Short load constant 0
   01f9: LDP              Load packed field (TOS)
   01fa: SLDC 03          Short load constant 3
   01fb: EQUI             Integer TOS-1 = TOS
   01fc: LAND             Logical AND (TOS & TOS-1)
   01fd: FJP  $0205       Jump if TOS false
   01ff: SLDO 01          Short load global BASE1
   0200: CXP  02 04       Call external procedure FIOPRIMS.4
   0203: UJP  $020c       Unconditional jump
-> 0205: SLDO 0c          Short load global BASE12
   0206: SIND 00          Short index load *TOS+0
   0207: SLDC 00          Short load constant 0
   0208: SLDC 20          Short load constant 32
   0209: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   020a: UJP  $0213       Unconditional jump
-> 020c: UJP  $021d       Unconditional jump
-> 020e: LOD  01 0001     Load word at G1 (SYSCOM)
   0211: SLDC 0d          Short load constant 13
   0212: STO              Store indirect (TOS into TOS-1)
-> 0213: SLDO 0c          Short load global BASE12
   0214: INCP 02          Inc field ptr (TOS+2)
   0216: SLDC 01          Short load constant 1
   0217: STO              Store indirect (TOS into TOS-1)
   0218: SLDO 0c          Short load global BASE12
   0219: INCP 01          Inc field ptr (TOS+1)
   021b: SLDC 01          Short load constant 1
   021c: STO              Store indirect (TOS into TOS-1)
-> 021d: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FPUT(VAR F:FIB) (* P=8 LL=0 *)
  BASE1=PARAM1
  BASE7
BEGIN
-> 0232: LOD  01 0001     Load word at G1 (SYSCOM)
   0235: SLDC 00          Short load constant 0
   0236: STO              Store indirect (TOS into TOS-1)
   0237: SLDO 01          Short load global BASE1
   0238: SRO  07          Store global word BASE7
   023a: SLDO 07          Short load global BASE7
   023b: SIND 05          Short index load *TOS+5
   023c: FJP  $0264       Jump if TOS false
   023e: SLDO 07          Short load global BASE7
   023f: IND  1d          Static index and load word (TOS+29)
   0241: FJP  $024f       Jump if TOS false
   0243: SLDO 01          Short load global BASE1
   0244: SLDC 00          Short load constant 0
   0245: SLDC 00          Short load constant 0
   0246: CXP  02 05       Call external procedure FIOPRIMS.5
   0249: FJP  $024d       Jump if TOS false
   024b: UJP  $0269       Unconditional jump
-> 024d: UJP  $0262       Unconditional jump
-> 024f: SLDO 07          Short load global BASE7
   0250: SIND 07          Short index load *TOS+7
   0251: SLDO 07          Short load global BASE7
   0252: SIND 00          Short index load *TOS+0
   0253: SLDC 00          Short load constant 0
   0254: SLDO 07          Short load global BASE7
   0255: SIND 04          Short index load *TOS+4
   0256: SLDC 00          Short load constant 0
   0257: SLDC 00          Short load constant 0
   0258: CSP  06          Call standard procedure UNITWRITE
   025a: CSP  22          Call standard procedure IORESULT
   025c: SLDC 00          Short load constant 0
   025d: NEQI             Integer TOS-1 <> TOS
   025e: FJP  $0262       Jump if TOS false
   0260: UJP  $0269       Unconditional jump
-> 0262: UJP  $0273       Unconditional jump
-> 0264: LOD  01 0001     Load word at G1 (SYSCOM)
   0267: SLDC 0d          Short load constant 13
   0268: STO              Store indirect (TOS into TOS-1)
-> 0269: SLDO 07          Short load global BASE7
   026a: INCP 02          Inc field ptr (TOS+2)
   026c: SLDC 01          Short load constant 1
   026d: STO              Store indirect (TOS into TOS-1)
   026e: SLDO 07          Short load global BASE7
   026f: INCP 01          Inc field ptr (TOS+1)
   0271: SLDC 01          Short load constant 1
   0272: STO              Store indirect (TOS into TOS-1)
-> 0273: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XSEEK (* P=9 LL=0 *)
BEGIN
-> 0280: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FEOF(VAR F:FIB): BOOLEAN (* P=10 LL=0 *)
  BASE1=RETVAL1:BOOLEAN
  BASE3=F:FIB
BEGIN
  FEOF := F.FEOF
-> 028c: SLDO 03          Short load global BASE3
   028d: SIND 02          Short index load *TOS+2
   028e: SRO  01          Store global word BASE1
-> 0290: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FEOLN(VAR F:FIB): BOOLEAN (* P=11 LL=0 *)
  BASE1=RETVAL1:BOOLEAN
  BASE3=F:FIB
BEGIN
  FEOLN := F.FEOLN
-> 029c: SLDO 03          Short load global BASE3
   029d: SIND 01          Short index load *TOS+1
   029e: SRO  01          Store global word BASE1
-> 02a0: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.FREADINT(VAR F:FIB; VAR I:INTEGER) (* P=12 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
  BASE4
  BASE5
  BASE6
  BASE7
  BASE48
BEGIN
-> 02ac: SLDO 02          Short load global BASE2
   02ad: SRO  30          Store global word BASE48
   02af: LDO  30          Load global word BASE48
   02b1: SIND 07          Short index load *TOS+7
   02b2: SLDC 01          Short load constant 1
   02b3: EQUI             Integer TOS-1 = TOS
   02b4: FJP  $02bd       Jump if TOS false
   02b6: LAO  07          Load global BASE7
   02b8: SLDC 00          Short load constant 0
   02b9: SLDC 51          Short load constant 81
   02ba: SLDC 50          Short load constant 80
   02bb: CSP  0a          Call standard procedure FLCH
-> 02bd: SLDO 01          Short load global BASE1
   02be: SLDC 00          Short load constant 0
   02bf: STO              Store indirect (TOS into TOS-1)
   02c0: SLDC 00          Short load constant 0
   02c1: SRO  05          Store global word BASE5
   02c3: SLDC 00          Short load constant 0
   02c4: SRO  04          Store global word BASE4
   02c6: LDO  30          Load global word BASE48
   02c8: SIND 03          Short index load *TOS+3
   02c9: SLDC 01          Short load constant 1
   02ca: EQUI             Integer TOS-1 = TOS
   02cb: FJP  $02d0       Jump if TOS false
   02cd: SLDO 02          Short load global BASE2
   02ce: CBP  07          Call base procedure PASCALSY.FGET
-> 02d0: LDO  30          Load global word BASE48
   02d2: SIND 00          Short index load *TOS+0
   02d3: SLDC 00          Short load constant 0
   02d4: LDB              Load byte at byte ptr TOS-1 + TOS
   02d5: SLDC 20          Short load constant 32
   02d6: EQUI             Integer TOS-1 = TOS
   02d7: LDO  30          Load global word BASE48
   02d9: SIND 02          Short index load *TOS+2
   02da: LNOT             Logical NOT (~TOS)
   02db: LAND             Logical AND (TOS & TOS-1)
   02dc: FJP  $02e3       Jump if TOS false
   02de: SLDO 02          Short load global BASE2
   02df: CBP  07          Call base procedure PASCALSY.FGET
   02e1: UJP  $02d0       Unconditional jump
-> 02e3: LDO  30          Load global word BASE48
   02e5: SIND 02          Short index load *TOS+2
   02e6: FJP  $02ea       Jump if TOS false
   02e8: UJP  $038a       Unconditional jump
-> 02ea: LDO  30          Load global word BASE48
   02ec: SIND 00          Short index load *TOS+0
   02ed: SLDC 00          Short load constant 0
   02ee: LDB              Load byte at byte ptr TOS-1 + TOS
   02ef: SRO  03          Store global word BASE3
   02f1: SLDO 03          Short load global BASE3
   02f2: SLDC 2b          Short load constant 43
   02f3: EQUI             Integer TOS-1 = TOS
   02f4: SLDO 03          Short load global BASE3
   02f5: SLDC 2d          Short load constant 45
   02f6: EQUI             Integer TOS-1 = TOS
   02f7: LOR              Logical OR (TOS | TOS-1)
   02f8: FJP  $030e       Jump if TOS false
   02fa: SLDC 02          Short load constant 2
   02fb: SRO  06          Store global word BASE6
   02fd: SLDO 03          Short load global BASE3
   02fe: SLDC 2d          Short load constant 45
   02ff: EQUI             Integer TOS-1 = TOS
   0300: SRO  05          Store global word BASE5
   0302: SLDO 02          Short load global BASE2
   0303: CBP  07          Call base procedure PASCALSY.FGET
   0305: LDO  30          Load global word BASE48
   0307: SIND 00          Short index load *TOS+0
   0308: SLDC 00          Short load constant 0
   0309: LDB              Load byte at byte ptr TOS-1 + TOS
   030a: SRO  03          Store global word BASE3
   030c: UJP  $0311       Unconditional jump
-> 030e: SLDC 01          Short load constant 1
   030f: SRO  06          Store global word BASE6
-> 0311: SLDO 03          Short load global BASE3
   0312: SLDC 30          Short load constant 48
   0313: GEQI             Integer TOS-1 >= TOS
   0314: SLDO 03          Short load global BASE3
   0315: SLDC 39          Short load constant 57
   0316: LEQI             Integer TOS-1 <= TOS
   0317: LAND             Logical AND (TOS & TOS-1)
   0318: FJP  $0372       Jump if TOS false
   031a: SLDC 01          Short load constant 1
   031b: SRO  04          Store global word BASE4
-> 031d: SLDO 01          Short load global BASE1
   031e: SLDO 01          Short load global BASE1
   031f: SIND 00          Short index load *TOS+0
   0320: SLDC 0a          Short load constant 10
   0321: MPI              Multiply integers (TOS * TOS-1)
   0322: SLDO 03          Short load global BASE3
   0323: ADI              Add integers (TOS + TOS-1)
   0324: SLDC 30          Short load constant 48
   0325: SBI              Subtract integers (TOS-1 - TOS)
   0326: STO              Store indirect (TOS into TOS-1)
   0327: SLDO 02          Short load global BASE2
   0328: CBP  07          Call base procedure PASCALSY.FGET
   032a: LDO  30          Load global word BASE48
   032c: SIND 00          Short index load *TOS+0
   032d: SLDC 00          Short load constant 0
   032e: LDB              Load byte at byte ptr TOS-1 + TOS
   032f: SRO  03          Store global word BASE3
   0331: SLDO 06          Short load global BASE6
   0332: SLDC 01          Short load constant 1
   0333: ADI              Add integers (TOS + TOS-1)
   0334: SRO  06          Store global word BASE6
   0336: LDO  30          Load global word BASE48
   0338: SIND 07          Short index load *TOS+7
   0339: SLDC 01          Short load constant 1
   033a: EQUI             Integer TOS-1 = TOS
   033b: FJP  $0364       Jump if TOS false
-> 033d: SLDO 03          Short load global BASE3
   033e: LAO  06          Load global BASE6
   0340: LAO  07          Load global BASE7
   0342: SLDC 00          Short load constant 0
   0343: SLDC 00          Short load constant 0
   0344: CBP  24          Call base procedure PASCALSY.CHECKDEL
   0346: FJP  $0364       Jump if TOS false
   0348: SLDO 06          Short load global BASE6
   0349: SLDC 01          Short load constant 1
   034a: EQUI             Integer TOS-1 = TOS
   034b: FJP  $0352       Jump if TOS false
   034d: SLDO 01          Short load global BASE1
   034e: SLDC 00          Short load constant 0
   034f: STO              Store indirect (TOS into TOS-1)
   0350: UJP  $0358       Unconditional jump
-> 0352: SLDO 01          Short load global BASE1
   0353: SLDO 01          Short load global BASE1
   0354: SIND 00          Short index load *TOS+0
   0355: SLDC 0a          Short load constant 10
   0356: DVI              Divide integers (TOS-1 / TOS)
   0357: STO              Store indirect (TOS into TOS-1)
-> 0358: SLDO 02          Short load global BASE2
   0359: CBP  07          Call base procedure PASCALSY.FGET
   035b: LDO  30          Load global word BASE48
   035d: SIND 00          Short index load *TOS+0
   035e: SLDC 00          Short load constant 0
   035f: LDB              Load byte at byte ptr TOS-1 + TOS
   0360: SRO  03          Store global word BASE3
   0362: UJP  $033d       Unconditional jump
-> 0364: SLDO 03          Short load global BASE3
   0365: SLDC 30          Short load constant 48
   0366: GEQI             Integer TOS-1 >= TOS
   0367: SLDO 03          Short load global BASE3
   0368: SLDC 39          Short load constant 57
   0369: LEQI             Integer TOS-1 <= TOS
   036a: LAND             Logical AND (TOS & TOS-1)
   036b: LNOT             Logical NOT (~TOS)
   036c: LDO  30          Load global word BASE48
   036e: SIND 01          Short index load *TOS+1
   036f: LOR              Logical OR (TOS | TOS-1)
   0370: FJP  $031d       Jump if TOS false
-> 0372: SLDO 04          Short load global BASE4
   0373: LDO  30          Load global word BASE48
   0375: SIND 02          Short index load *TOS+2
   0376: LOR              Logical OR (TOS | TOS-1)
   0377: FJP  $0385       Jump if TOS false
   0379: SLDO 05          Short load global BASE5
   037a: FJP  $0383       Jump if TOS false
   037c: SLDO 01          Short load global BASE1
   037d: SLDO 01          Short load global BASE1
   037e: SIND 00          Short index load *TOS+0
   037f: NGI              Negate integer
   0380: STO              Store indirect (TOS into TOS-1)
   0381: UJP  $0383       Unconditional jump
-> 0383: UJP  $038a       Unconditional jump
-> 0385: LOD  01 0001     Load word at G1 (SYSCOM)
   0388: SLDC 0e          Short load constant 14
   0389: STO              Store indirect (TOS into TOS-1)
-> 038a: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITEINT(VAR F:FIB; VAR I:INTEGER;VAR RLENG:INTEGER) (* P=13 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
  BASE7
  BASE8
  BASE14
BEGIN
-> 039e: SLDC 01          Short load constant 1
   039f: SRO  04          Store global word BASE4
   03a1: LAO  08          Load global BASE8
   03a3: SLDC 00          Short load constant 0
   03a4: SLDC 0a          Short load constant 10
   03a5: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   03a6: SLDC 01          Short load constant 1
   03a7: SRO  07          Store global word BASE7
   03a9: SLDO 02          Short load global BASE2
   03aa: SLDC 00          Short load constant 0
   03ab: LESI             Integer TOS-1 < TOS
   03ac: FJP  $03d5       Jump if TOS false
   03ae: SLDO 02          Short load global BASE2
   03af: LDCI 7fff        Load word 32767
   03b2: NGI              Negate integer
   03b3: SLDC 01          Short load constant 1
   03b4: SBI              Subtract integers (TOS-1 - TOS)
   03b5: EQUI             Integer TOS-1 = TOS
   03b6: FJP  $03c9       Jump if TOS false
   03b8: LAO  08          Load global BASE8
   03ba: NOP              No operation
   03bb: LSA  06          Load string address: '-32768'
   03c3: SAS  0a          String assign (TOS to TOS-1, 10 chars)
   03c5: UJP  $0425       Unconditional jump
   03c7: UJP  $03d5       Unconditional jump
-> 03c9: SLDO 02          Short load global BASE2
   03ca: ABI              Absolute value of integer (TOS)
   03cb: SRO  02          Store global word BASE2
   03cd: LAO  08          Load global BASE8
   03cf: SLDC 01          Short load constant 1
   03d0: SLDC 2d          Short load constant 45
   03d1: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   03d2: SLDC 02          Short load constant 2
   03d3: SRO  04          Store global word BASE4
-> 03d5: SLDC 04          Short load constant 4
   03d6: SRO  05          Store global word BASE5
   03d8: SLDC 00          Short load constant 0
   03d9: SRO  0e          Store global word BASE14
-> 03db: SLDO 05          Short load global BASE5
   03dc: SLDO 0e          Short load global BASE14
   03dd: GEQI             Integer TOS-1 >= TOS
   03de: FJP  $041e       Jump if TOS false
   03e0: SLDO 02          Short load global BASE2
   03e1: LDA  01 0014     Load addr G20 (IPOT)
   03e4: SLDO 05          Short load global BASE5
   03e5: IXA  01          Index array (TOS-1 + TOS * 1)
   03e7: SIND 00          Short index load *TOS+0
   03e8: DVI              Divide integers (TOS-1 / TOS)
   03e9: SLDC 30          Short load constant 48
   03ea: ADI              Add integers (TOS + TOS-1)
   03eb: SRO  06          Store global word BASE6
   03ed: SLDO 06          Short load global BASE6
   03ee: SLDC 30          Short load constant 48
   03ef: EQUI             Integer TOS-1 = TOS
   03f0: SLDO 05          Short load global BASE5
   03f1: SLDC 00          Short load constant 0
   03f2: GRTI             Integer TOS-1 > TOS
   03f3: LAND             Logical AND (TOS & TOS-1)
   03f4: SLDO 07          Short load global BASE7
   03f5: LAND             Logical AND (TOS & TOS-1)
   03f6: FJP  $03fa       Jump if TOS false
   03f8: UJP  $0417       Unconditional jump
-> 03fa: SLDC 00          Short load constant 0
   03fb: SRO  07          Store global word BASE7
   03fd: LAO  08          Load global BASE8
   03ff: SLDO 04          Short load global BASE4
   0400: SLDO 06          Short load global BASE6
   0401: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0402: SLDO 04          Short load global BASE4
   0403: SLDC 01          Short load constant 1
   0404: ADI              Add integers (TOS + TOS-1)
   0405: SRO  04          Store global word BASE4
   0407: SLDO 06          Short load global BASE6
   0408: SLDC 30          Short load constant 48
   0409: NEQI             Integer TOS-1 <> TOS
   040a: FJP  $0417       Jump if TOS false
   040c: SLDO 02          Short load global BASE2
   040d: LDA  01 0014     Load addr G20 (IPOT)
   0410: SLDO 05          Short load global BASE5
   0411: IXA  01          Index array (TOS-1 + TOS * 1)
   0413: SIND 00          Short index load *TOS+0
   0414: MODI             Modulo integers (TOS-1 % TOS)
   0415: SRO  02          Store global word BASE2
-> 0417: SLDO 05          Short load global BASE5
   0418: SLDC 01          Short load constant 1
   0419: SBI              Subtract integers (TOS-1 - TOS)
   041a: SRO  05          Store global word BASE5
   041c: UJP  $03db       Unconditional jump
-> 041e: LAO  08          Load global BASE8
   0420: SLDC 00          Short load constant 0
   0421: SLDO 04          Short load global BASE4
   0422: SLDC 01          Short load constant 1
   0423: SBI              Subtract integers (TOS-1 - TOS)
   0424: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0425: SLDO 01          Short load global BASE1
   0426: LAO  08          Load global BASE8
   0428: SLDC 00          Short load constant 0
   0429: LDB              Load byte at byte ptr TOS-1 + TOS
   042a: LESI             Integer TOS-1 < TOS
   042b: FJP  $0433       Jump if TOS false
   042d: LAO  08          Load global BASE8
   042f: SLDC 00          Short load constant 0
   0430: LDB              Load byte at byte ptr TOS-1 + TOS
   0431: SRO  01          Store global word BASE1
-> 0433: SLDO 03          Short load global BASE3
   0434: LAO  08          Load global BASE8
   0436: SLDO 01          Short load global BASE1
   0437: CBP  13          Call base procedure PASCALSY.FWRITESTRING
-> 0439: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XREADREAL (* P=14 LL=0 *)
BEGIN
-> 0448: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XWRITEREAL (* P=15 LL=0 *)
BEGIN
-> 0454: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADCHAR(VAR F:FIB; VAR CH:CHAR) (* P=16 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0460: SLDO 02          Short load global BASE2
   0461: SRO  03          Store global word BASE3
   0463: LOD  01 0001     Load word at G1 (SYSCOM)
   0466: SLDC 00          Short load constant 0
   0467: STO              Store indirect (TOS into TOS-1)
   0468: SLDO 03          Short load global BASE3
   0469: SIND 03          Short index load *TOS+3
   046a: SLDC 01          Short load constant 1
   046b: EQUI             Integer TOS-1 = TOS
   046c: FJP  $0471       Jump if TOS false
   046e: SLDO 02          Short load global BASE2
   046f: CBP  07          Call base procedure PASCALSY.FGET
-> 0471: SLDO 01          Short load global BASE1
   0472: SLDO 03          Short load global BASE3
   0473: SIND 00          Short index load *TOS+0
   0474: SLDC 00          Short load constant 0
   0475: LDB              Load byte at byte ptr TOS-1 + TOS
   0476: STO              Store indirect (TOS into TOS-1)
   0477: SLDO 03          Short load global BASE3
   0478: SIND 03          Short index load *TOS+3
   0479: SLDC 00          Short load constant 0
   047a: EQUI             Integer TOS-1 = TOS
   047b: FJP  $0482       Jump if TOS false
   047d: SLDO 02          Short load global BASE2
   047e: CBP  07          Call base procedure PASCALSY.FGET
   0480: UJP  $0487       Unconditional jump
-> 0482: SLDO 03          Short load global BASE3
   0483: INCP 03          Inc field ptr (TOS+3)
   0485: SLDC 01          Short load constant 1
   0486: STO              Store indirect (TOS into TOS-1)
-> 0487: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITECHAR(VAR F:FIB; CH:CHAR; RLENG:INTEGER) (* P=17 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 0494: SLDO 03          Short load global BASE3
   0495: SRO  04          Store global word BASE4
   0497: SLDO 04          Short load global BASE4
   0498: SIND 05          Short index load *TOS+5
   0499: FJP  $04b9       Jump if TOS false
-> 049b: SLDO 01          Short load global BASE1
   049c: SLDC 01          Short load constant 1
   049d: GRTI             Integer TOS-1 > TOS
   049e: FJP  $04af       Jump if TOS false
   04a0: SLDO 04          Short load global BASE4
   04a1: SIND 00          Short index load *TOS+0
   04a2: SLDC 00          Short load constant 0
   04a3: SLDC 20          Short load constant 32
   04a4: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   04a5: SLDO 03          Short load global BASE3
   04a6: CBP  08          Call base procedure PASCALSY.FPUT
   04a8: SLDO 01          Short load global BASE1
   04a9: SLDC 01          Short load constant 1
   04aa: SBI              Subtract integers (TOS-1 - TOS)
   04ab: SRO  01          Store global word BASE1
   04ad: UJP  $049b       Unconditional jump
-> 04af: SLDO 04          Short load global BASE4
   04b0: SIND 00          Short index load *TOS+0
   04b1: SLDC 00          Short load constant 0
   04b2: SLDO 02          Short load global BASE2
   04b3: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   04b4: SLDO 03          Short load global BASE3
   04b5: CBP  08          Call base procedure PASCALSY.FPUT
   04b7: UJP  $04be       Unconditional jump
-> 04b9: LOD  01 0001     Load word at G1 (SYSCOM)
   04bc: SLDC 0d          Short load constant 13
   04bd: STO              Store indirect (TOS into TOS-1)
-> 04be: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADSTRING(VAR F:FIB; VAR S:STRING; SLENG:INTEGER) (* P=18 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 0000: SLDO 03          Short load global BASE3
   0001: SRO  06          Store global word BASE6
   0003: SLDC 01          Short load constant 1
   0004: SRO  04          Store global word BASE4
   0006: SLDO 06          Short load global BASE6
   0007: SIND 03          Short index load *TOS+3
   0008: SLDC 01          Short load constant 1
   0009: EQUI             Integer TOS-1 = TOS
   000a: FJP  $000f       Jump if TOS false
   000c: SLDO 03          Short load global BASE3
   000d: CBP  07          Call base procedure PASCALSY.FGET
-> 000f: SLDO 02          Short load global BASE2
   0010: SLDC 00          Short load constant 0
   0011: SLDO 01          Short load global BASE1
   0012: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0013: SLDO 04          Short load global BASE4
   0014: SLDO 01          Short load global BASE1
   0015: LEQI             Integer TOS-1 <= TOS
   0016: SLDO 06          Short load global BASE6
   0017: SIND 01          Short index load *TOS+1
   0018: SLDO 06          Short load global BASE6
   0019: SIND 02          Short index load *TOS+2
   001a: LOR              Logical OR (TOS | TOS-1)
   001b: LNOT             Logical NOT (~TOS)
   001c: LAND             Logical AND (TOS & TOS-1)
   001d: FJP  $0050       Jump if TOS false
   001f: SLDO 06          Short load global BASE6
   0020: SIND 00          Short index load *TOS+0
   0021: SLDC 00          Short load constant 0
   0022: LDB              Load byte at byte ptr TOS-1 + TOS
   0023: SRO  05          Store global word BASE5
   0025: SLDO 06          Short load global BASE6
   0026: SIND 07          Short index load *TOS+7
   0027: SLDC 01          Short load constant 1
   0028: EQUI             Integer TOS-1 = TOS
   0029: FJP  $0042       Jump if TOS false
   002b: SLDO 05          Short load global BASE5
   002c: LAO  04          Load global BASE4
   002e: SLDO 02          Short load global BASE2
   002f: SLDC 00          Short load constant 0
   0030: SLDC 00          Short load constant 0
   0031: CBP  24          Call base procedure PASCALSY.CHECKDEL
   0033: FJP  $0037       Jump if TOS false
   0035: UJP  $0040       Unconditional jump
-> 0037: SLDO 02          Short load global BASE2
   0038: SLDO 04          Short load global BASE4
   0039: SLDO 05          Short load global BASE5
   003a: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   003b: SLDO 04          Short load global BASE4
   003c: SLDC 01          Short load constant 1
   003d: ADI              Add integers (TOS + TOS-1)
   003e: SRO  04          Store global word BASE4
-> 0040: UJP  $004b       Unconditional jump
-> 0042: SLDO 02          Short load global BASE2
   0043: SLDO 04          Short load global BASE4
   0044: SLDO 05          Short load global BASE5
   0045: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0046: SLDO 04          Short load global BASE4
   0047: SLDC 01          Short load constant 1
   0048: ADI              Add integers (TOS + TOS-1)
   0049: SRO  04          Store global word BASE4
-> 004b: SLDO 03          Short load global BASE3
   004c: CBP  07          Call base procedure PASCALSY.FGET
   004e: UJP  $0013       Unconditional jump
-> 0050: SLDO 02          Short load global BASE2
   0051: SLDC 00          Short load constant 0
   0052: SLDO 04          Short load global BASE4
   0053: SLDC 01          Short load constant 1
   0054: SBI              Subtract integers (TOS-1 - TOS)
   0055: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0056: SLDO 06          Short load global BASE6
   0057: SIND 01          Short index load *TOS+1
   0058: LNOT             Logical NOT (~TOS)
   0059: FJP  $0060       Jump if TOS false
   005b: SLDO 03          Short load global BASE3
   005c: CBP  07          Call base procedure PASCALSY.FGET
   005e: UJP  $0056       Unconditional jump
-> 0060: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITESTRING(VAR F:FIB; VAR S:STRING; RLENG:INTEGER) (* P=19 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 04cc: SLDO 01          Short load global BASE1
   04cd: SLDC 00          Short load constant 0
   04ce: LEQI             Integer TOS-1 <= TOS
   04cf: FJP  $04d6       Jump if TOS false
   04d1: SLDO 02          Short load global BASE2
   04d2: SLDC 00          Short load constant 0
   04d3: LDB              Load byte at byte ptr TOS-1 + TOS
   04d4: SRO  01          Store global word BASE1
-> 04d6: SLDO 03          Short load global BASE3
   04d7: SLDO 02          Short load global BASE2
   04d8: SLDC 01          Short load constant 1
   04d9: ADI              Add integers (TOS + TOS-1)
   04da: SLDO 01          Short load global BASE1
   04db: SLDO 02          Short load global BASE2
   04dc: SLDC 00          Short load constant 0
   04dd: LDB              Load byte at byte ptr TOS-1 + TOS
   04de: CBP  14          Call base procedure PASCALSY.FWRITEBYTES
-> 04e0: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITEBYTES(VAR F:FIB; VAR A:WINDOW; RLENG:INTEGER; ALENG:INTEGER) (* P=20 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
  BASE6
  BASE7
BEGIN
-> 0070: LOD  01 0001     Load word at G1 (SYSCOM)
   0073: SLDC 00          Short load constant 0
   0074: STO              Store indirect (TOS into TOS-1)
   0075: SLDO 04          Short load global BASE4
   0076: SRO  07          Store global word BASE7
   0078: SLDO 07          Short load global BASE7
   0079: SIND 05          Short index load *TOS+5
   007a: FJP  $00cc       Jump if TOS false
   007c: SLDO 02          Short load global BASE2
   007d: SLDO 01          Short load global BASE1
   007e: GRTI             Integer TOS-1 > TOS
   007f: FJP  $009d       Jump if TOS false
   0081: SLDO 02          Short load global BASE2
   0082: SLDO 01          Short load global BASE1
   0083: SBI              Subtract integers (TOS-1 - TOS)
   0084: SRO  06          Store global word BASE6
-> 0086: SLDO 06          Short load global BASE6
   0087: SLDC 00          Short load constant 0
   0088: GRTI             Integer TOS-1 > TOS
   0089: FJP  $009a       Jump if TOS false
   008b: SLDO 07          Short load global BASE7
   008c: SIND 00          Short index load *TOS+0
   008d: SLDC 00          Short load constant 0
   008e: SLDC 20          Short load constant 32
   008f: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0090: SLDO 04          Short load global BASE4
   0091: CBP  08          Call base procedure PASCALSY.FPUT
   0093: SLDO 06          Short load global BASE6
   0094: SLDC 01          Short load constant 1
   0095: SBI              Subtract integers (TOS-1 - TOS)
   0096: SRO  06          Store global word BASE6
   0098: UJP  $0086       Unconditional jump
-> 009a: SLDO 01          Short load global BASE1
   009b: SRO  02          Store global word BASE2
-> 009d: SLDO 07          Short load global BASE7
   009e: IND  1d          Static index and load word (TOS+29)
   00a0: FJP  $00c1       Jump if TOS false
   00a2: SLDC 00          Short load constant 0
   00a3: SRO  05          Store global word BASE5
-> 00a5: SLDO 05          Short load global BASE5
   00a6: SLDO 02          Short load global BASE2
   00a7: LESI             Integer TOS-1 < TOS
   00a8: SLDO 07          Short load global BASE7
   00a9: SIND 02          Short index load *TOS+2
   00aa: LNOT             Logical NOT (~TOS)
   00ab: LAND             Logical AND (TOS & TOS-1)
   00ac: FJP  $00bf       Jump if TOS false
   00ae: SLDO 07          Short load global BASE7
   00af: SIND 00          Short index load *TOS+0
   00b0: SLDC 00          Short load constant 0
   00b1: SLDO 03          Short load global BASE3
   00b2: SLDO 05          Short load global BASE5
   00b3: LDB              Load byte at byte ptr TOS-1 + TOS
   00b4: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   00b5: SLDO 04          Short load global BASE4
   00b6: CBP  08          Call base procedure PASCALSY.FPUT
   00b8: SLDO 05          Short load global BASE5
   00b9: SLDC 01          Short load constant 1
   00ba: ADI              Add integers (TOS + TOS-1)
   00bb: SRO  05          Store global word BASE5
   00bd: UJP  $00a5       Unconditional jump
-> 00bf: UJP  $00ca       Unconditional jump
-> 00c1: SLDO 07          Short load global BASE7
   00c2: SIND 07          Short index load *TOS+7
   00c3: SLDO 03          Short load global BASE3
   00c4: SLDC 00          Short load constant 0
   00c5: SLDO 02          Short load global BASE2
   00c6: SLDC 00          Short load constant 0
   00c7: SLDC 00          Short load constant 0
   00c8: CSP  06          Call standard procedure UNITWRITE
-> 00ca: UJP  $00d1       Unconditional jump
-> 00cc: LOD  01 0001     Load word at G1 (SYSCOM)
   00cf: SLDC 0d          Short load constant 13
   00d0: STO              Store indirect (TOS into TOS-1)
-> 00d1: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADLN(VAR F:FIB) (* P=21 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 04ec: SLDO 01          Short load global BASE1
   04ed: SIND 01          Short index load *TOS+1
   04ee: LNOT             Logical NOT (~TOS)
   04ef: FJP  $04f6       Jump if TOS false
   04f1: SLDO 01          Short load global BASE1
   04f2: CBP  07          Call base procedure PASCALSY.FGET
   04f4: UJP  $04ec       Unconditional jump
-> 04f6: SLDO 01          Short load global BASE1
   04f7: SIND 03          Short index load *TOS+3
   04f8: SLDC 00          Short load constant 0
   04f9: EQUI             Integer TOS-1 = TOS
   04fa: FJP  $0501       Jump if TOS false
   04fc: SLDO 01          Short load global BASE1
   04fd: CBP  07          Call base procedure PASCALSY.FGET
   04ff: UJP  $050b       Unconditional jump
-> 0501: SLDO 01          Short load global BASE1
   0502: INCP 03          Inc field ptr (TOS+3)
   0504: SLDC 01          Short load constant 1
   0505: STO              Store indirect (TOS into TOS-1)
   0506: SLDO 01          Short load global BASE1
   0507: INCP 01          Inc field ptr (TOS+1)
   0509: SLDC 00          Short load constant 0
   050a: STO              Store indirect (TOS into TOS-1)
-> 050b: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITELN(VAR F:FIB) (* P=22 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 051a: SLDO 01          Short load global BASE1
   051b: SIND 00          Short index load *TOS+0
   051c: SLDC 00          Short load constant 0
   051d: SLDC 0d          Short load constant 13
   051e: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   051f: SLDO 01          Short load global BASE1
   0520: CBP  08          Call base procedure PASCALSY.FPUT
-> 0522: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCONCAT(VAR DEST:STRING;SRC: STRING; DESTLENG: INTEGER) (* P=23 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 00e2: SLDO 02          Short load global BASE2
   00e3: SLDC 00          Short load constant 0
   00e4: LDB              Load byte at byte ptr TOS-1 + TOS
   00e5: SLDO 03          Short load global BASE3
   00e6: SLDC 00          Short load constant 0
   00e7: LDB              Load byte at byte ptr TOS-1 + TOS
   00e8: ADI              Add integers (TOS + TOS-1)
   00e9: SLDO 01          Short load global BASE1
   00ea: LEQI             Integer TOS-1 <= TOS
   00eb: FJP  $0104       Jump if TOS false
   00ed: SLDO 02          Short load global BASE2
   00ee: SLDC 01          Short load constant 1
   00ef: SLDO 03          Short load global BASE3
   00f0: SLDO 03          Short load global BASE3
   00f1: SLDC 00          Short load constant 0
   00f2: LDB              Load byte at byte ptr TOS-1 + TOS
   00f3: SLDC 01          Short load constant 1
   00f4: ADI              Add integers (TOS + TOS-1)
   00f5: SLDO 02          Short load global BASE2
   00f6: SLDC 00          Short load constant 0
   00f7: LDB              Load byte at byte ptr TOS-1 + TOS
   00f8: CSP  02          Call standard procedure MOVL
   00fa: SLDO 03          Short load global BASE3
   00fb: SLDC 00          Short load constant 0
   00fc: SLDO 02          Short load global BASE2
   00fd: SLDC 00          Short load constant 0
   00fe: LDB              Load byte at byte ptr TOS-1 + TOS
   00ff: SLDO 03          Short load global BASE3
   0100: SLDC 00          Short load constant 0
   0101: LDB              Load byte at byte ptr TOS-1 + TOS
   0102: ADI              Add integers (TOS + TOS-1)
   0103: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0104: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SINSERT(VAR SRC:STRING;DEST:STRING;DESTLENG:INTEGER;INSINX:INTEGER) (* P=24 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
BEGIN
-> 0110: SLDO 01          Short load global BASE1
   0111: SLDC 00          Short load constant 0
   0112: GRTI             Integer TOS-1 > TOS
   0113: SLDO 04          Short load global BASE4
   0114: SLDC 00          Short load constant 0
   0115: LDB              Load byte at byte ptr TOS-1 + TOS
   0116: SLDC 00          Short load constant 0
   0117: GRTI             Integer TOS-1 > TOS
   0118: LAND             Logical AND (TOS & TOS-1)
   0119: SLDO 04          Short load global BASE4
   011a: SLDC 00          Short load constant 0
   011b: LDB              Load byte at byte ptr TOS-1 + TOS
   011c: SLDO 03          Short load global BASE3
   011d: SLDC 00          Short load constant 0
   011e: LDB              Load byte at byte ptr TOS-1 + TOS
   011f: ADI              Add integers (TOS + TOS-1)
   0120: SLDO 02          Short load global BASE2
   0121: LEQI             Integer TOS-1 <= TOS
   0122: LAND             Logical AND (TOS & TOS-1)
   0123: FJP  $0159       Jump if TOS false
   0125: SLDO 03          Short load global BASE3
   0126: SLDC 00          Short load constant 0
   0127: LDB              Load byte at byte ptr TOS-1 + TOS
   0128: SLDO 01          Short load global BASE1
   0129: SBI              Subtract integers (TOS-1 - TOS)
   012a: SLDC 01          Short load constant 1
   012b: ADI              Add integers (TOS + TOS-1)
   012c: SRO  05          Store global word BASE5
   012e: SLDO 05          Short load global BASE5
   012f: SLDC 00          Short load constant 0
   0130: GRTI             Integer TOS-1 > TOS
   0131: FJP  $0141       Jump if TOS false
   0133: SLDO 03          Short load global BASE3
   0134: SLDO 01          Short load global BASE1
   0135: SLDO 03          Short load global BASE3
   0136: SLDO 01          Short load global BASE1
   0137: SLDO 04          Short load global BASE4
   0138: SLDC 00          Short load constant 0
   0139: LDB              Load byte at byte ptr TOS-1 + TOS
   013a: ADI              Add integers (TOS + TOS-1)
   013b: SLDO 05          Short load global BASE5
   013c: CSP  03          Call standard procedure MOVR
   013e: SLDC 00          Short load constant 0
   013f: SRO  05          Store global word BASE5
-> 0141: SLDO 05          Short load global BASE5
   0142: SLDC 00          Short load constant 0
   0143: EQUI             Integer TOS-1 = TOS
   0144: FJP  $0159       Jump if TOS false
   0146: SLDO 04          Short load global BASE4
   0147: SLDC 01          Short load constant 1
   0148: SLDO 03          Short load global BASE3
   0149: SLDO 01          Short load global BASE1
   014a: SLDO 04          Short load global BASE4
   014b: SLDC 00          Short load constant 0
   014c: LDB              Load byte at byte ptr TOS-1 + TOS
   014d: CSP  02          Call standard procedure MOVL
   014f: SLDO 03          Short load global BASE3
   0150: SLDC 00          Short load constant 0
   0151: SLDO 03          Short load global BASE3
   0152: SLDC 00          Short load constant 0
   0153: LDB              Load byte at byte ptr TOS-1 + TOS
   0154: SLDO 04          Short load global BASE4
   0155: SLDC 00          Short load constant 0
   0156: LDB              Load byte at byte ptr TOS-1 + TOS
   0157: ADI              Add integers (TOS + TOS-1)
   0158: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0159: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCOPY(VAR SRC:STRING;DEST:STRING;SRCINX:INTEGER;COPYLENG:INTEGER) (* P=25 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
BEGIN
-> 0166: SLDO 03          Short load global BASE3
   0167: LSA  00          Load string address: ''
   0169: NOP              No operation
   016a: SAS  50          String assign (TOS to TOS-1, 80 chars)
   016c: SLDO 02          Short load global BASE2
   016d: SLDC 00          Short load constant 0
   016e: GRTI             Integer TOS-1 > TOS
   016f: SLDO 01          Short load global BASE1
   0170: SLDC 00          Short load constant 0
   0171: GRTI             Integer TOS-1 > TOS
   0172: LAND             Logical AND (TOS & TOS-1)
   0173: SLDO 02          Short load global BASE2
   0174: SLDO 01          Short load global BASE1
   0175: ADI              Add integers (TOS + TOS-1)
   0176: SLDC 01          Short load constant 1
   0177: SBI              Subtract integers (TOS-1 - TOS)
   0178: SLDO 04          Short load global BASE4
   0179: SLDC 00          Short load constant 0
   017a: LDB              Load byte at byte ptr TOS-1 + TOS
   017b: LEQI             Integer TOS-1 <= TOS
   017c: LAND             Logical AND (TOS & TOS-1)
   017d: FJP  $018a       Jump if TOS false
   017f: SLDO 04          Short load global BASE4
   0180: SLDO 02          Short load global BASE2
   0181: SLDO 03          Short load global BASE3
   0182: SLDC 01          Short load constant 1
   0183: SLDO 01          Short load global BASE1
   0184: CSP  02          Call standard procedure MOVL
   0186: SLDO 03          Short load global BASE3
   0187: SLDC 00          Short load constant 0
   0188: SLDO 01          Short load global BASE1
   0189: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 018a: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SDELETE(VAR DEST:STRING;DELINX:INTEGER;DELLENG:INTEGER) (* P=26 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 0196: SLDO 02          Short load global BASE2
   0197: SLDC 00          Short load constant 0
   0198: GRTI             Integer TOS-1 > TOS
   0199: SLDO 01          Short load global BASE1
   019a: SLDC 00          Short load constant 0
   019b: GRTI             Integer TOS-1 > TOS
   019c: LAND             Logical AND (TOS & TOS-1)
   019d: FJP  $01cd       Jump if TOS false
   019f: SLDO 03          Short load global BASE3
   01a0: SLDC 00          Short load constant 0
   01a1: LDB              Load byte at byte ptr TOS-1 + TOS
   01a2: SLDO 02          Short load global BASE2
   01a3: SBI              Subtract integers (TOS-1 - TOS)
   01a4: SLDO 01          Short load global BASE1
   01a5: SBI              Subtract integers (TOS-1 - TOS)
   01a6: SLDC 01          Short load constant 1
   01a7: ADI              Add integers (TOS + TOS-1)
   01a8: SRO  04          Store global word BASE4
   01aa: SLDO 04          Short load global BASE4
   01ab: SLDC 00          Short load constant 0
   01ac: EQUI             Integer TOS-1 = TOS
   01ad: FJP  $01b7       Jump if TOS false
   01af: SLDO 03          Short load global BASE3
   01b0: SLDC 00          Short load constant 0
   01b1: SLDO 02          Short load global BASE2
   01b2: SLDC 01          Short load constant 1
   01b3: SBI              Subtract integers (TOS-1 - TOS)
   01b4: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   01b5: UJP  $01cd       Unconditional jump
-> 01b7: SLDO 04          Short load global BASE4
   01b8: SLDC 00          Short load constant 0
   01b9: GRTI             Integer TOS-1 > TOS
   01ba: FJP  $01cd       Jump if TOS false
   01bc: SLDO 03          Short load global BASE3
   01bd: SLDO 02          Short load global BASE2
   01be: SLDO 01          Short load global BASE1
   01bf: ADI              Add integers (TOS + TOS-1)
   01c0: SLDO 03          Short load global BASE3
   01c1: SLDO 02          Short load global BASE2
   01c2: SLDO 04          Short load global BASE4
   01c3: CSP  02          Call standard procedure MOVL
   01c5: SLDO 03          Short load global BASE3
   01c6: SLDC 00          Short load constant 0
   01c7: SLDO 03          Short load global BASE3
   01c8: SLDC 00          Short load constant 0
   01c9: LDB              Load byte at byte ptr TOS-1 + TOS
   01ca: SLDO 01          Short load global BASE1
   01cb: SBI              Subtract integers (TOS-1 - TOS)
   01cc: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 01cd: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.SPOS(VAR TARGET:STRING;SRC:STRING):INTEGER (* P=27 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
  BASE6
  BASE7
  BASE8
BEGIN
-> 01da: SLDC 00          Short load constant 0
   01db: SRO  01          Store global word BASE1
   01dd: SLDO 04          Short load global BASE4
   01de: SLDC 00          Short load constant 0
   01df: LDB              Load byte at byte ptr TOS-1 + TOS
   01e0: SLDC 00          Short load constant 0
   01e1: GRTI             Integer TOS-1 > TOS
   01e2: FJP  $0235       Jump if TOS false
   01e4: SLDO 04          Short load global BASE4
   01e5: SLDC 01          Short load constant 1
   01e6: LDB              Load byte at byte ptr TOS-1 + TOS
   01e7: SRO  07          Store global word BASE7
   01e9: SLDC 01          Short load constant 1
   01ea: SRO  06          Store global word BASE6
   01ec: SLDO 03          Short load global BASE3
   01ed: SLDC 00          Short load constant 0
   01ee: LDB              Load byte at byte ptr TOS-1 + TOS
   01ef: SLDO 04          Short load global BASE4
   01f0: SLDC 00          Short load constant 0
   01f1: LDB              Load byte at byte ptr TOS-1 + TOS
   01f2: SBI              Subtract integers (TOS-1 - TOS)
   01f3: SLDC 01          Short load constant 1
   01f4: ADI              Add integers (TOS + TOS-1)
   01f5: SRO  05          Store global word BASE5
   01f7: LAO  08          Load global BASE8
   01f9: SLDC 00          Short load constant 0
   01fa: SLDO 04          Short load global BASE4
   01fb: SLDC 00          Short load constant 0
   01fc: LDB              Load byte at byte ptr TOS-1 + TOS
   01fd: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 01fe: SLDO 06          Short load global BASE6
   01ff: SLDO 05          Short load global BASE5
   0200: LEQI             Integer TOS-1 <= TOS
   0201: FJP  $0235       Jump if TOS false
   0203: SLDO 06          Short load global BASE6
   0204: SLDO 05          Short load global BASE5
   0205: SLDO 06          Short load global BASE6
   0206: SBI              Subtract integers (TOS-1 - TOS)
   0207: SLDC 00          Short load constant 0
   0208: SLDO 07          Short load global BASE7
   0209: SLDO 03          Short load global BASE3
   020a: SLDO 06          Short load global BASE6
   020b: SLDC 00          Short load constant 0
   020c: CSP  0b          Call standard procedure SCAN
   020e: ADI              Add integers (TOS + TOS-1)
   020f: SRO  06          Store global word BASE6
   0211: SLDO 06          Short load global BASE6
   0212: SLDO 05          Short load global BASE5
   0213: GRTI             Integer TOS-1 > TOS
   0214: FJP  $0218       Jump if TOS false
   0216: UJP  $0235       Unconditional jump
-> 0218: SLDO 03          Short load global BASE3
   0219: SLDO 06          Short load global BASE6
   021a: LAO  08          Load global BASE8
   021c: SLDC 01          Short load constant 1
   021d: SLDO 04          Short load global BASE4
   021e: SLDC 00          Short load constant 0
   021f: LDB              Load byte at byte ptr TOS-1 + TOS
   0220: CSP  02          Call standard procedure MOVL
   0222: LAO  08          Load global BASE8
   0224: SLDO 04          Short load global BASE4
   0225: EQLSTR           String TOS-1 = TOS
   0227: FJP  $022e       Jump if TOS false
   0229: SLDO 06          Short load global BASE6
   022a: SRO  01          Store global word BASE1
   022c: UJP  $0235       Unconditional jump
-> 022e: SLDO 06          Short load global BASE6
   022f: SLDC 01          Short load constant 1
   0230: ADI              Add integers (TOS + TOS-1)
   0231: SRO  06          Store global word BASE6
   0233: UJP  $01fe       Unconditional jump
-> 0235: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FBLOCKIO(VAR F:FIB;VAR A:WINDOW;I:INTEGER;NBLOCKS,RBLOCK:INTEGER;DOREAD:BOOLEAN):INTEGER (* P=28 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM6
  BASE4=PARAM5
  BASE5=PARAM4
  BASE6=PARAM3
  BASE7=PARAM2
  BASE8=PARAM1
  BASE9
  BASE10
BEGIN
-> 0244: SLDC 00          Short load constant 0
   0245: SRO  01          Store global word BASE1
   0247: LOD  01 0001     Load word at G1 (SYSCOM)
   024a: SLDC 00          Short load constant 0
   024b: STO              Store indirect (TOS into TOS-1)
   024c: SLDO 08          Short load global BASE8
   024d: SRO  09          Store global word BASE9
   024f: SLDO 09          Short load global BASE9
   0250: SIND 05          Short index load *TOS+5
   0251: SLDO 05          Short load global BASE5
   0252: SLDC 00          Short load constant 0
   0253: GEQI             Integer TOS-1 >= TOS
   0254: LAND             Logical AND (TOS & TOS-1)
   0255: FJP  $032d       Jump if TOS false
   0257: SLDO 09          Short load global BASE9
   0258: SIND 06          Short index load *TOS+6
   0259: FJP  $02e0       Jump if TOS false
   025b: SLDO 09          Short load global BASE9
   025c: INCP 10          Inc field ptr (TOS+16)
   025e: SRO  0a          Store global word BASE10
   0260: SLDO 04          Short load global BASE4
   0261: SLDC 00          Short load constant 0
   0262: LESI             Integer TOS-1 < TOS
   0263: FJP  $026a       Jump if TOS false
   0265: SLDO 09          Short load global BASE9
   0266: IND  0d          Static index and load word (TOS+13)
   0268: SRO  04          Store global word BASE4
-> 026a: SLDO 0a          Short load global BASE10
   026b: SIND 00          Short index load *TOS+0
   026c: SLDO 04          Short load global BASE4
   026d: ADI              Add integers (TOS + TOS-1)
   026e: SRO  04          Store global word BASE4
   0270: SLDO 04          Short load global BASE4
   0271: SLDO 05          Short load global BASE5
   0272: ADI              Add integers (TOS + TOS-1)
   0273: SLDO 0a          Short load global BASE10
   0274: SIND 01          Short index load *TOS+1
   0275: GRTI             Integer TOS-1 > TOS
   0276: FJP  $0283       Jump if TOS false
   0278: SLDO 03          Short load global BASE3
   0279: LNOT             Logical NOT (~TOS)
   027a: FJP  $0283       Jump if TOS false
   027c: SLDO 08          Short load global BASE8
   027d: SLDC 00          Short load constant 0
   027e: SLDC 00          Short load constant 0
   027f: CBP  21          Call base procedure PASCALSY.33
   0281: FJP  $0283       Jump if TOS false
-> 0283: SLDO 04          Short load global BASE4
   0284: SLDO 05          Short load global BASE5
   0285: ADI              Add integers (TOS + TOS-1)
   0286: SLDO 0a          Short load global BASE10
   0287: SIND 01          Short index load *TOS+1
   0288: GRTI             Integer TOS-1 > TOS
   0289: FJP  $0291       Jump if TOS false
   028b: SLDO 0a          Short load global BASE10
   028c: SIND 01          Short index load *TOS+1
   028d: SLDO 04          Short load global BASE4
   028e: SBI              Subtract integers (TOS-1 - TOS)
   028f: SRO  05          Store global word BASE5
-> 0291: SLDO 09          Short load global BASE9
   0292: INCP 02          Inc field ptr (TOS+2)
   0294: SLDO 04          Short load global BASE4
   0295: SLDO 0a          Short load global BASE10
   0296: SIND 01          Short index load *TOS+1
   0297: GEQI             Integer TOS-1 >= TOS
   0298: STO              Store indirect (TOS into TOS-1)
   0299: SLDO 09          Short load global BASE9
   029a: SIND 02          Short index load *TOS+2
   029b: LNOT             Logical NOT (~TOS)
   029c: FJP  $02de       Jump if TOS false
   029e: SLDO 09          Short load global BASE9
   029f: SIND 07          Short index load *TOS+7
   02a0: SLDO 07          Short load global BASE7
   02a1: SLDO 06          Short load global BASE6
   02a2: SLDO 05          Short load global BASE5
   02a3: SLDO 04          Short load global BASE4
   02a4: SLDO 03          Short load global BASE3
   02a5: CLP  25          Call local procedure PASCALSY.37
   02a7: CSP  22          Call standard procedure IORESULT
   02a9: SLDC 00          Short load constant 0
   02aa: EQUI             Integer TOS-1 = TOS
   02ab: FJP  $02de       Jump if TOS false
   02ad: SLDO 03          Short load global BASE3
   02ae: LNOT             Logical NOT (~TOS)
   02af: FJP  $02b6       Jump if TOS false
   02b1: SLDO 09          Short load global BASE9
   02b2: INCP 0f          Inc field ptr (TOS+15)
   02b4: SLDC 01          Short load constant 1
   02b5: STO              Store indirect (TOS into TOS-1)
-> 02b6: SLDO 05          Short load global BASE5
   02b7: SRO  01          Store global word BASE1
   02b9: SLDO 04          Short load global BASE4
   02ba: SLDO 05          Short load global BASE5
   02bb: ADI              Add integers (TOS + TOS-1)
   02bc: SRO  04          Store global word BASE4
   02be: SLDO 09          Short load global BASE9
   02bf: INCP 02          Inc field ptr (TOS+2)
   02c1: SLDO 04          Short load global BASE4
   02c2: SLDO 0a          Short load global BASE10
   02c3: SIND 01          Short index load *TOS+1
   02c4: EQUI             Integer TOS-1 = TOS
   02c5: STO              Store indirect (TOS into TOS-1)
   02c6: SLDO 09          Short load global BASE9
   02c7: INCP 0d          Inc field ptr (TOS+13)
   02c9: SLDO 04          Short load global BASE4
   02ca: SLDO 0a          Short load global BASE10
   02cb: SIND 00          Short index load *TOS+0
   02cc: SBI              Subtract integers (TOS-1 - TOS)
   02cd: STO              Store indirect (TOS into TOS-1)
   02ce: SLDO 09          Short load global BASE9
   02cf: IND  0d          Static index and load word (TOS+13)
   02d1: SLDO 09          Short load global BASE9
   02d2: IND  0c          Static index and load word (TOS+12)
   02d4: GRTI             Integer TOS-1 > TOS
   02d5: FJP  $02de       Jump if TOS false
   02d7: SLDO 09          Short load global BASE9
   02d8: INCP 0c          Inc field ptr (TOS+12)
   02da: SLDO 09          Short load global BASE9
   02db: IND  0d          Static index and load word (TOS+13)
   02dd: STO              Store indirect (TOS into TOS-1)
-> 02de: UJP  $032b       Unconditional jump
-> 02e0: SLDO 05          Short load global BASE5
   02e1: SRO  01          Store global word BASE1
   02e3: SLDO 09          Short load global BASE9
   02e4: SIND 07          Short index load *TOS+7
   02e5: SLDO 07          Short load global BASE7
   02e6: SLDO 06          Short load global BASE6
   02e7: SLDO 05          Short load global BASE5
   02e8: SLDO 04          Short load global BASE4
   02e9: SLDO 03          Short load global BASE3
   02ea: CLP  25          Call local procedure PASCALSY.37
   02ec: CSP  22          Call standard procedure IORESULT
   02ee: SLDC 00          Short load constant 0
   02ef: EQUI             Integer TOS-1 = TOS
   02f0: FJP  $0328       Jump if TOS false
   02f2: SLDO 03          Short load global BASE3
   02f3: FJP  $0326       Jump if TOS false
   02f5: SLDO 05          Short load global BASE5
   02f6: LDCI 0200        Load word 512
   02f9: MPI              Multiply integers (TOS * TOS-1)
   02fa: SRO  04          Store global word BASE4
   02fc: SLDO 04          Short load global BASE4
   02fd: SLDO 04          Short load global BASE4
   02fe: NGI              Negate integer
   02ff: SLDC 01          Short load constant 1
   0300: SLDC 00          Short load constant 0
   0301: SLDO 07          Short load global BASE7
   0302: SLDO 06          Short load global BASE6
   0303: SLDO 04          Short load global BASE4
   0304: ADI              Add integers (TOS + TOS-1)
   0305: SLDC 01          Short load constant 1
   0306: SBI              Subtract integers (TOS-1 - TOS)
   0307: SLDC 00          Short load constant 0
   0308: CSP  0b          Call standard procedure SCAN
   030a: ADI              Add integers (TOS + TOS-1)
   030b: SRO  04          Store global word BASE4
   030d: SLDO 04          Short load global BASE4
   030e: LDCI 0200        Load word 512
   0311: ADI              Add integers (TOS + TOS-1)
   0312: SLDC 01          Short load constant 1
   0313: SBI              Subtract integers (TOS-1 - TOS)
   0314: LDCI 0200        Load word 512
   0317: DVI              Divide integers (TOS-1 / TOS)
   0318: SRO  04          Store global word BASE4
   031a: SLDO 04          Short load global BASE4
   031b: SRO  01          Store global word BASE1
   031d: SLDO 09          Short load global BASE9
   031e: INCP 02          Inc field ptr (TOS+2)
   0320: SLDO 04          Short load global BASE4
   0321: SLDO 05          Short load global BASE5
   0322: LESI             Integer TOS-1 < TOS
   0323: STO              Store indirect (TOS into TOS-1)
   0324: UJP  $0326       Unconditional jump
-> 0326: UJP  $032b       Unconditional jump
-> 0328: SLDC 00          Short load constant 0
   0329: SRO  01          Store global word BASE1
-> 032b: UJP  $0332       Unconditional jump
-> 032d: LOD  01 0001     Load word at G1 (SYSCOM)
   0330: SLDC 0d          Short load constant 13
   0331: STO              Store indirect (TOS into TOS-1)
-> 0332: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.FGOTOXY(X,Y:INTEGER) (* P=29 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0342: LOD  01 0001     Load word at G1 (SYSCOM)
   0345: INCP 25          Inc field ptr (TOS+37)
   0347: SRO  03          Store global word BASE3
   0349: SLDO 02          Short load global BASE2
   034a: SLDC 00          Short load constant 0
   034b: LESI             Integer TOS-1 < TOS
   034c: FJP  $0351       Jump if TOS false
   034e: SLDC 00          Short load constant 0
   034f: SRO  02          Store global word BASE2
-> 0351: SLDO 02          Short load global BASE2
   0352: SLDO 03          Short load global BASE3
   0353: SIND 01          Short index load *TOS+1
   0354: GRTI             Integer TOS-1 > TOS
   0355: FJP  $035b       Jump if TOS false
   0357: SLDO 03          Short load global BASE3
   0358: SIND 01          Short index load *TOS+1
   0359: SRO  02          Store global word BASE2
-> 035b: SLDO 01          Short load global BASE1
   035c: SLDC 00          Short load constant 0
   035d: LESI             Integer TOS-1 < TOS
   035e: FJP  $0363       Jump if TOS false
   0360: SLDC 00          Short load constant 0
   0361: SRO  01          Store global word BASE1
-> 0363: SLDO 01          Short load global BASE1
   0364: SLDO 03          Short load global BASE3
   0365: SIND 00          Short index load *TOS+0
   0366: GRTI             Integer TOS-1 > TOS
   0367: FJP  $036d       Jump if TOS false
   0369: SLDO 03          Short load global BASE3
   036a: SIND 00          Short index load *TOS+0
   036b: SRO  01          Store global word BASE1
-> 036d: LOD  01 0003     Load word at G3 (OUTPUT)
   0370: SLDC 1e          Short load constant 30
   0371: SLDC 00          Short load constant 0
   0372: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0375: CSP  00          Call standard procedure IOC
   0377: LOD  01 0003     Load word at G3 (OUTPUT)
   037a: SLDO 02          Short load global BASE2
   037b: SLDC 20          Short load constant 32
   037c: ADI              Add integers (TOS + TOS-1)
   037d: SLDC 00          Short load constant 0
   037e: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0381: CSP  00          Call standard procedure IOC
   0383: LOD  01 0003     Load word at G3 (OUTPUT)
   0386: SLDO 01          Short load global BASE1
   0387: SLDC 20          Short load constant 32
   0388: ADI              Add integers (TOS + TOS-1)
   0389: SLDC 00          Short load constant 0
   038a: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   038d: CSP  00          Call standard procedure IOC
-> 038f: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.HOMECURSOR (* P=30 LL=0 *)
BEGIN
-> 039c: SLDC 04          Short load constant 4
   039d: LOD  01 0001     Load word at G1 (SYSCOM)
   03a0: INCP 1f          Inc field ptr (TOS+31)
   03a2: SLDC 08          Short load constant 8
   03a3: SLDC 08          Short load constant 8
   03a4: LDP              Load packed field (TOS)
   03a5: CBP  23          Call base procedure PASCALSYS.PUTPREFIXED
-> 03a7: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.CLEARSCREEN (* P=31 LL=0 *)
  BASE1
  BASE2
BEGIN
-> 03b4: CBP  1e          Call base procedure PASCALSYS.HOMECURSOR
   03b6: LOD  01 0001     Load word at G1 (SYSCOM)
   03b9: SRO  01          Store global word BASE1
   03bb: SLDO 01          Short load global BASE1
   03bc: INCP 1f          Inc field ptr (TOS+31)
   03be: SRO  02          Store global word BASE2
   03c0: SLDC 03          Short load constant 3
   03c1: CSP  26          Call standard procedure UNITCLEAR
   03c3: SLDO 02          Short load global BASE2
   03c4: INCP 01          Inc field ptr (TOS+1)
   03c6: SLDC 08          Short load constant 8
   03c7: SLDC 00          Short load constant 0
   03c8: LDP              Load packed field (TOS)
   03c9: SLDC 00          Short load constant 0
   03ca: NEQI             Integer TOS-1 <> TOS
   03cb: FJP  $03d8       Jump if TOS false
   03cd: SLDC 03          Short load constant 3
   03ce: SLDO 02          Short load global BASE2
   03cf: INCP 01          Inc field ptr (TOS+1)
   03d1: SLDC 08          Short load constant 8
   03d2: SLDC 00          Short load constant 0
   03d3: LDP              Load packed field (TOS)
   03d4: CBP  23          Call base procedure PASCALSYS.PUTPREFIXED
   03d6: UJP  $03e1       Unconditional jump
-> 03d8: SLDC 06          Short load constant 6
   03d9: SLDO 02          Short load global BASE2
   03da: INCP 04          Inc field ptr (TOS+4)
   03dc: SLDC 08          Short load constant 8
   03dd: SLDC 08          Short load constant 8
   03de: LDP              Load packed field (TOS)
   03df: CBP  23          Call base procedure PASCALSYS.PUTPREFIXED
-> 03e1: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.COMMAND (* P=32 LL=0 *)
BEGIN
-> 03ee: SLDC 00          Short load constant 0
   03ef: STR  01 0013     Store TOS to G19
   03f2: SLDC 00          Short load constant 0
   03f3: STR  01 00e2     Store TOS to G226
-> 03f7: CBP  22          Call base procedure PASCALSY.34
   03f9: CLP  27          Call local procedure PASCALSY.39
   03fb: LOD  01 00e2     Load word at G226
   03ff: FJP  $0406       Jump if TOS false
   0401: LDCN             Load constant NIL
   0402: LDCN             Load constant NIL
   0403: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
-> 0406: LOD  01 0013     Load word at G19
   0409: SLDC 00          Short load constant 0
   040a: EQUI             Integer TOS-1 = TOS
   040b: FJP  $03f7       Jump if TOS false
-> 040d: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC33(PARAM1): RETVAL (* P=33 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
  BASE7
  BASE8
  BASE9
  BASE10
  BASE11
BEGIN
-> 041c: SLDC 01          Short load constant 1
   041d: SRO  01          Store global word BASE1
   041f: SLDC 00          Short load constant 0
   0420: SRO  05          Store global word BASE5
   0422: SLDO 03          Short load global BASE3
   0423: SRO  09          Store global word BASE9
   0425: SLDO 09          Short load global BASE9
   0426: INCP 10          Inc field ptr (TOS+16)
   0428: SRO  0a          Store global word BASE10
   042a: SLDO 0a          Short load global BASE10
   042b: INCP 03          Inc field ptr (TOS+3)
   042d: SLDC 00          Short load constant 0
   042e: LDB              Load byte at byte ptr TOS-1 + TOS
   042f: SLDC 00          Short load constant 0
   0430: GRTI             Integer TOS-1 > TOS
   0431: FJP  $04fa       Jump if TOS false
   0433: SLDO 09          Short load global BASE9
   0434: SIND 07          Short index load *TOS+7
   0435: SLDO 09          Short load global BASE9
   0436: INCP 08          Inc field ptr (TOS+8)
   0438: SLDC 00          Short load constant 0
   0439: LAO  08          Load global BASE8
   043b: SLDC 00          Short load constant 0
   043c: SLDC 00          Short load constant 0
   043d: CXP  06 06       Call external procedure SYSIO.6
   0440: NEQI             Integer TOS-1 <> TOS
   0441: FJP  $044a       Jump if TOS false
   0443: LOD  01 0001     Load word at G1 (SYSCOM)
   0446: SLDC 05          Short load constant 5
   0447: STO              Store indirect (TOS into TOS-1)
   0448: UJP  $04fa       Unconditional jump
-> 044a: SLDC 00          Short load constant 0
   044b: SRO  06          Store global word BASE6
   044d: SLDC 01          Short load constant 1
   044e: SRO  04          Store global word BASE4
-> 0450: SLDO 04          Short load global BASE4
   0451: SLDO 08          Short load global BASE8
   0452: SLDC 00          Short load constant 0
   0453: IXA  0d          Index array (TOS-1 + TOS * 13)
   0455: IND  08          Static index and load word (TOS+8)
   0457: LEQI             Integer TOS-1 <= TOS
   0458: SLDO 06          Short load global BASE6
   0459: LNOT             Logical NOT (~TOS)
   045a: LAND             Logical AND (TOS & TOS-1)
   045b: FJP  $0477       Jump if TOS false
   045d: SLDO 08          Short load global BASE8
   045e: SLDO 04          Short load global BASE4
   045f: IXA  0d          Index array (TOS-1 + TOS * 13)
   0461: SIND 00          Short index load *TOS+0
   0462: SLDO 0a          Short load global BASE10
   0463: SIND 00          Short index load *TOS+0
   0464: EQUI             Integer TOS-1 = TOS
   0465: SLDO 08          Short load global BASE8
   0466: SLDO 04          Short load global BASE4
   0467: IXA  0d          Index array (TOS-1 + TOS * 13)
   0469: SIND 01          Short index load *TOS+1
   046a: SLDO 0a          Short load global BASE10
   046b: SIND 01          Short index load *TOS+1
   046c: EQUI             Integer TOS-1 = TOS
   046d: LAND             Logical AND (TOS & TOS-1)
   046e: SRO  06          Store global word BASE6
   0470: SLDO 04          Short load global BASE4
   0471: SLDC 01          Short load constant 1
   0472: ADI              Add integers (TOS + TOS-1)
   0473: SRO  04          Store global word BASE4
   0475: UJP  $0450       Unconditional jump
-> 0477: SLDO 06          Short load global BASE6
   0478: LNOT             Logical NOT (~TOS)
   0479: FJP  $0482       Jump if TOS false
   047b: LOD  01 0001     Load word at G1 (SYSCOM)
   047e: SLDC 06          Short load constant 6
   047f: STO              Store indirect (TOS into TOS-1)
   0480: UJP  $04fa       Unconditional jump
-> 0482: SLDO 04          Short load global BASE4
   0483: SLDO 08          Short load global BASE8
   0484: SLDC 00          Short load constant 0
   0485: IXA  0d          Index array (TOS-1 + TOS * 13)
   0487: IND  08          Static index and load word (TOS+8)
   0489: GRTI             Integer TOS-1 > TOS
   048a: FJP  $0495       Jump if TOS false
   048c: SLDO 08          Short load global BASE8
   048d: SLDC 00          Short load constant 0
   048e: IXA  0d          Index array (TOS-1 + TOS * 13)
   0490: SIND 07          Short index load *TOS+7
   0491: SRO  07          Store global word BASE7
   0493: UJP  $049c       Unconditional jump
-> 0495: SLDO 08          Short load global BASE8
   0496: SLDO 04          Short load global BASE4
   0497: IXA  0d          Index array (TOS-1 + TOS * 13)
   0499: SIND 00          Short index load *TOS+0
   049a: SRO  07          Store global word BASE7
-> 049c: SLDO 0a          Short load global BASE10
   049d: SIND 01          Short index load *TOS+1
   049e: SLDO 07          Short load global BASE7
   049f: LESI             Integer TOS-1 < TOS
   04a0: SLDO 0a          Short load global BASE10
   04a1: IND  0b          Static index and load word (TOS+11)
   04a3: LDCI 0200        Load word 512
   04a6: LESI             Integer TOS-1 < TOS
   04a7: LOR              Logical OR (TOS | TOS-1)
   04a8: FJP  $04f7       Jump if TOS false
   04aa: SLDO 08          Short load global BASE8
   04ab: SLDO 04          Short load global BASE4
   04ac: SLDC 01          Short load constant 1
   04ad: SBI              Subtract integers (TOS-1 - TOS)
   04ae: IXA  0d          Index array (TOS-1 + TOS * 13)
   04b0: SRO  0b          Store global word BASE11
   04b2: SLDO 0b          Short load global BASE11
   04b3: INCP 01          Inc field ptr (TOS+1)
   04b5: SLDO 07          Short load global BASE7
   04b6: STO              Store indirect (TOS into TOS-1)
   04b7: SLDO 0b          Short load global BASE11
   04b8: INCP 0b          Inc field ptr (TOS+11)
   04ba: LDCI 0200        Load word 512
   04bd: STO              Store indirect (TOS into TOS-1)
   04be: SLDO 09          Short load global BASE9
   04bf: SIND 07          Short index load *TOS+7
   04c0: SLDO 08          Short load global BASE8
   04c1: CXP  06 0a       Call external procedure SYSIO.10
   04c4: CSP  22          Call standard procedure IORESULT
   04c6: SLDC 00          Short load constant 0
   04c7: NEQI             Integer TOS-1 <> TOS
   04c8: FJP  $04cc       Jump if TOS false
   04ca: UJP  $04fa       Unconditional jump
-> 04cc: SLDO 09          Short load global BASE9
   04cd: INCP 02          Inc field ptr (TOS+2)
   04cf: SLDC 00          Short load constant 0
   04d0: STO              Store indirect (TOS into TOS-1)
   04d1: SLDO 09          Short load global BASE9
   04d2: INCP 01          Inc field ptr (TOS+1)
   04d4: SLDC 00          Short load constant 0
   04d5: STO              Store indirect (TOS into TOS-1)
   04d6: SLDO 09          Short load global BASE9
   04d7: SIND 03          Short index load *TOS+3
   04d8: SLDC 00          Short load constant 0
   04d9: NEQI             Integer TOS-1 <> TOS
   04da: FJP  $04e1       Jump if TOS false
   04dc: SLDO 09          Short load global BASE9
   04dd: INCP 03          Inc field ptr (TOS+3)
   04df: SLDC 01          Short load constant 1
   04e0: STO              Store indirect (TOS into TOS-1)
-> 04e1: SLDO 0a          Short load global BASE10
   04e2: INCP 01          Inc field ptr (TOS+1)
   04e4: SLDO 07          Short load global BASE7
   04e5: STO              Store indirect (TOS into TOS-1)
   04e6: SLDO 0a          Short load global BASE10
   04e7: INCP 0b          Inc field ptr (TOS+11)
   04e9: LDCI 0200        Load word 512
   04ec: STO              Store indirect (TOS into TOS-1)
   04ed: SLDO 0a          Short load global BASE10
   04ee: INCP 0c          Inc field ptr (TOS+12)
   04f0: SLDC 07          Short load constant 7
   04f1: SLDC 09          Short load constant 9
   04f2: SLDC 64          Short load constant 100
   04f3: STP              Store packed field (TOS into TOS-1)
   04f4: SLDC 00          Short load constant 0
   04f5: SRO  01          Store global word BASE1
-> 04f7: SLDC 01          Short load constant 1
   04f8: SRO  05          Store global word BASE5
-> 04fa: SLDO 05          Short load global BASE5
   04fb: LNOT             Logical NOT (~TOS)
   04fc: FJP  $0508       Jump if TOS false
   04fe: SLDO 03          Short load global BASE3
   04ff: INCP 02          Inc field ptr (TOS+2)
   0501: SLDC 01          Short load constant 1
   0502: STO              Store indirect (TOS into TOS-1)
   0503: SLDO 03          Short load global BASE3
   0504: INCP 01          Inc field ptr (TOS+1)
   0506: SLDC 01          Short load constant 1
   0507: STO              Store indirect (TOS into TOS-1)
-> 0508: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC34 (* P=34 LL=0 *)
BEGIN
-> 051a: LDA  01 0005     Load addr G5 (EMPTYHEAP)
   051d: CSP  21          Call standard procedure RELEASE
-> 051f: LDA  01 001f     Load addr G31 (UNITABLE)
   0522: LOD  01 0001     Load word at G1 (SYSCOM)
   0525: SIND 02          Short index load *TOS+2
   0526: IXA  06          Index array (TOS-1 + TOS * 6)
   0528: LDA  01 000e     Load addr G14 (SYVID)
   052b: NEQSTR           String TOS-1 <> TOS
   052d: FJP  $053f       Jump if TOS false
   052f: SLDC 0c          Short load constant 12 {'original disk not in boot drive'}
   0530: CBP  02          Call base procedure PASCALSY.EXECERROR
   0532: LOD  01 0001     Load word at G1 (SYSCOM)
   0535: SIND 02          Short index load *TOS+2
   0536: SLDC 00          Short load constant 0
   0537: SLDC 00          Short load constant 0
   0538: CXP  06 09       Call external procedure SYSIO.9
   053b: FJP  $053d       Jump if TOS false
-> 053d: UJP  $051f       Unconditional jump
-> 053f: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PUTPREFIXED(WHICH:INTEGER;COMMANDCHAR:CHAR) (* P=35 LL=0 *)
  BASE1=COMMANDCHAR:CHAR
  BASE2=WHICH:INTEGER
  BASE3=SYSCOM_C
BEGIN
  SYSCOM_C := SYSCOM
-> 054e: LOD  01 0001     Load word at G1 (SYSCOM)
   0551: SRO  03          Store global word BASE3 (SYSCOM_C)
  IF COMMANDCHAR <> 0 THEN
   0553: SLDO 01          Short load global BASE1 (COMMANDCHAR)
   0554: SLDC 00          Short load constant 0
   0555: NEQI             Integer TOS-1 <> TOS
   0556: FJP  $058c       Jump if TOS false
  BEGIN
    IF SYSCOM_C.PREFIXED[WHICH] THEN
   0558: SLDO 03          Short load global BASE3 (SYSCOM_C)
   0559: INCP 24          Inc field ptr (TOS+36) (PREFIXED)
   055b: SLDO 02          Short load global BASE2 (WHICH)
   055c: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   055f: LDP              Load packed field (TOS)
   0560: FJP  $0571       Jump if TOS false
    BEGIN
      PASCALSY.FWRITECHAR(OUTPUT,SYSCOM_C.ESCAPE,0)
   0562: LOD  01 0003     Load word at G3 (OUTPUT)
   0565: SLDO 03          Short load global BASE3 (SYSCOM_C)
   0566: INCP 1f          Inc field ptr (TOS+31) (ESCAPE)
   0568: SLDC 08          Short load constant 8
   0569: SLDC 00          Short load constant 0
   056a: LDP              Load packed field (TOS)
   056b: SLDC 00          Short load constant 0
   056c: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
      IOC
   056f: CSP  00          Call standard procedure IOC
    END
    PASCALSY.FWRITECHAR(OUTPUT,COMMANDCHAR,0)
-> 0571: LOD  01 0003     Load word at G3 (OUTPUT)
   0574: SLDO 01          Short load global BASE1 (COMMANDCHAR)
   0575: SLDC 00          Short load constant 0
   0576: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
    IOC
   0579: CSP  00          Call standard procedure IOC
    IF 11 > 0 THEN
   057b: SLDC 0b          Short load constant 11
   057c: SLDC 00          Short load constant 0
   057d: GRTI             Integer TOS-1 > TOS
   057e: FJP  $058c       Jump if TOS false
    BEGIN
      PASCALSY.FWRITESTRING(OUTPUT,FILLER,0)
   0580: LOD  01 0003     Load word at G3 (OUTPUT)
   0583: LDA  01 0019     Load addr G25 (FILLER)
   0586: SLDC 00          Short load constant 0
   0587: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
      IOC
   058a: CSP  00          Call standard procedure IOC
    END
  END
-> 058c: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.CHECKDEL(CH:CHAR; SINX:INTEGER; PARAM3:STRING): BOOLEAN (* P=36 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM3
  BASE4=PARAM2
  BASE5=PARAM1
  BASE6
  BASE7
BEGIN
-> 0598: SLDC 00          Short load constant 0
   0599: SRO  01          Store global word BASE1
   059b: LOD  01 0001     Load word at G1 (SYSCOM)
   059e: SRO  06          Store global word BASE6
   05a0: SLDO 06          Short load global BASE6
   05a1: INCP 1f          Inc field ptr (TOS+31)
   05a3: SRO  07          Store global word BASE7
   05a5: SLDO 05          Short load global BASE5
   05a6: SLDO 06          Short load global BASE6
   05a7: INCP 2c          Inc field ptr (TOS+44)
   05a9: SLDC 08          Short load constant 8
   05aa: SLDC 00          Short load constant 0
   05ab: LDP              Load packed field (TOS)
   05ac: EQUI             Integer TOS-1 = TOS
   05ad: FJP  $05e0       Jump if TOS false
   05af: SLDC 01          Short load constant 1
   05b0: SRO  01          Store global word BASE1
-> 05b2: SLDO 04          Short load global BASE4
   05b3: SIND 00          Short index load *TOS+0
   05b4: SLDC 01          Short load constant 1
   05b5: GRTI             Integer TOS-1 > TOS
   05b6: FJP  $05d5       Jump if TOS false
   05b8: SLDO 04          Short load global BASE4
   05b9: SLDO 04          Short load global BASE4
   05ba: SIND 00          Short index load *TOS+0
   05bb: SLDC 01          Short load constant 1
   05bc: SBI              Subtract integers (TOS-1 - TOS)
   05bd: STO              Store indirect (TOS into TOS-1)
   05be: SLDO 03          Short load global BASE3
   05bf: SLDO 04          Short load global BASE4
   05c0: SIND 00          Short index load *TOS+0
   05c1: LDB              Load byte at byte ptr TOS-1 + TOS
   05c2: SLDC 20          Short load constant 32
   05c3: GEQI             Integer TOS-1 >= TOS
   05c4: FJP  $05d3       Jump if TOS false
   05c6: LOD  01 0003     Load word at G3 (OUTPUT)
   05c9: LDA  01 0209     Load addr G521
   05cd: SLDC 00          Short load constant 0
   05ce: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   05d1: CSP  00          Call standard procedure IOC
-> 05d3: UJP  $05b2       Unconditional jump
-> 05d5: SLDC 02          Short load constant 2
   05d6: SLDO 07          Short load global BASE7
   05d7: INCP 01          Inc field ptr (TOS+1)
   05d9: SLDC 08          Short load constant 8
   05da: SLDC 08          Short load constant 8
   05db: LDP              Load packed field (TOS)
   05dc: CBP  23          Call base procedure PASCALSYS.PUTPREFIXED
   05de: UJP  $060e       Unconditional jump
-> 05e0: SLDO 05          Short load global BASE5
   05e1: SLDO 06          Short load global BASE6
   05e2: INCP 2b          Inc field ptr (TOS+43)
   05e4: SLDC 08          Short load constant 8
   05e5: SLDC 00          Short load constant 0
   05e6: LDP              Load packed field (TOS)
   05e7: EQUI             Integer TOS-1 = TOS
   05e8: FJP  $060e       Jump if TOS false
   05ea: SLDC 01          Short load constant 1
   05eb: SRO  01          Store global word BASE1
   05ed: SLDO 04          Short load global BASE4
   05ee: SIND 00          Short index load *TOS+0
   05ef: SLDC 01          Short load constant 1
   05f0: GRTI             Integer TOS-1 > TOS
   05f1: FJP  $060e       Jump if TOS false
   05f3: SLDO 04          Short load global BASE4
   05f4: SLDO 04          Short load global BASE4
   05f5: SIND 00          Short index load *TOS+0
   05f6: SLDC 01          Short load constant 1
   05f7: SBI              Subtract integers (TOS-1 - TOS)
   05f8: STO              Store indirect (TOS into TOS-1)
   05f9: SLDO 03          Short load global BASE3
   05fa: SLDO 04          Short load global BASE4
   05fb: SIND 00          Short index load *TOS+0
   05fc: LDB              Load byte at byte ptr TOS-1 + TOS
   05fd: SLDC 20          Short load constant 32
   05fe: GEQI             Integer TOS-1 >= TOS
   05ff: FJP  $060e       Jump if TOS false
   0601: LOD  01 0003     Load word at G3 (OUTPUT)
   0604: LDA  01 020d     Load addr G525
   0608: SLDC 00          Short load constant 0
   0609: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   060c: CSP  00          Call standard procedure IOC
-> 060e: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC37(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5; PARAM6) (* P=37 LL=1 *)
  MP1=PARAM6
  MP2=PARAM5
  MP3=PARAM4
  MP4=PARAM3
  MP5=PARAM2
  MP6=PARAM1
  MP7
  MP8
BEGIN
-> 061c: SLDL 03          Short load local MP3
   061d: SLDC 3f          Short load constant 63
   061e: GRTI             Integer TOS-1 > TOS
   061f: FJP  $0626       Jump if TOS false
   0621: SLDC 3f          Short load constant 63
   0622: STL  0008        Store TOS into MP8
   0624: UJP  $0629       Unconditional jump
-> 0626: SLDL 03          Short load local MP3
   0627: STL  0008        Store TOS into MP8
-> 0629: SLDL 08          Short load local MP8
   062a: LDCI 0200        Load word 512
   062d: MPI              Multiply integers (TOS * TOS-1)
   062e: STL  0007        Store TOS into MP7
-> 0630: SLDL 03          Short load local MP3
   0631: SLDC 00          Short load constant 0
   0632: NEQI             Integer TOS-1 <> TOS
   0633: FJP  $0674       Jump if TOS false
   0635: SLDL 01          Short load local MP1
   0636: FJP  $0642       Jump if TOS false
   0638: SLDL 06          Short load local MP6
   0639: SLDL 05          Short load local MP5
   063a: SLDL 04          Short load local MP4
   063b: SLDL 07          Short load local MP7
   063c: SLDL 02          Short load local MP2
   063d: SLDC 00          Short load constant 0
   063e: CSP  05          Call standard procedure UNITREAD
   0640: UJP  $064a       Unconditional jump
-> 0642: SLDL 06          Short load local MP6
   0643: SLDL 05          Short load local MP5
   0644: SLDL 04          Short load local MP4
   0645: SLDL 07          Short load local MP7
   0646: SLDL 02          Short load local MP2
   0647: SLDC 00          Short load constant 0
   0648: CSP  06          Call standard procedure UNITWRITE
-> 064a: CSP  22          Call standard procedure IORESULT
   064c: SLDC 00          Short load constant 0
   064d: NEQI             Integer TOS-1 <> TOS
   064e: FJP  $0654       Jump if TOS false
   0650: SLDC 00          Short load constant 0
   0651: SLDC 25          Short load constant 37
   0652: CSP  04          Call standard procedure EXIT
-> 0654: SLDL 03          Short load local MP3
   0655: SLDL 08          Short load local MP8
   0656: SBI              Subtract integers (TOS-1 - TOS)
   0657: STL  0003        Store TOS into MP3
   0659: SLDL 04          Short load local MP4
   065a: SLDL 07          Short load local MP7
   065b: ADI              Add integers (TOS + TOS-1)
   065c: STL  0004        Store TOS into MP4
   065e: SLDL 02          Short load local MP2
   065f: SLDL 08          Short load local MP8
   0660: ADI              Add integers (TOS + TOS-1)
   0661: STL  0002        Store TOS into MP2
   0663: SLDL 03          Short load local MP3
   0664: SLDL 08          Short load local MP8
   0665: LESI             Integer TOS-1 < TOS
   0666: FJP  $0672       Jump if TOS false
   0668: SLDL 03          Short load local MP3
   0669: STL  0008        Store TOS into MP8
   066b: SLDL 08          Short load local MP8
   066c: LDCI 0200        Load word 512
   066f: MPI              Multiply integers (TOS * TOS-1)
   0670: STL  0007        Store TOS into MP7
-> 0672: UJP  $0630       Unconditional jump
-> 0674: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC38 (* P=38 LL=1 *)
BEGIN
-> 0682: UJP  $0714       Unconditional jump
-> 0684: LOD  02 00e2     Load word at G226
   0688: LNOT             Logical NOT (~TOS)
   0689: FJP  $06bf       Jump if TOS false
   068b: CBP  22          Call base procedure PASCALSY.34
   068d: LOD  02 0013     Load word at G19
   0690: SLDC 00          Short load constant 0
   0691: SLDC 00          Short load constant 0
   0692: CXP  05 01       Call external procedure GETCMD.GETCMD
   0695: STR  02 0013     Store TOS to G19
   0698: LDA  02 00ad     Load addr G173 (GLOBALTITLE)
   069c: NOP              No operation
   069d: LSA  00          Load string address: ''
   069f: SAS  17          String assign (TOS to TOS-1, 23 chars)
   06a1: LOD  02 0013     Load word at G19
   06a4: SLDC 00          Short load constant 0
   06a5: NEQI             Integer TOS-1 <> TOS
   06a6: FJP  $06bf       Jump if TOS false
   06a8: LOD  02 00e4     Load word at G228
   06ac: LNOT             Logical NOT (~TOS)
   06ad: FJP  $06b6       Jump if TOS false
   06af: LDCN             Load constant NIL
   06b0: LDCN             Load constant NIL
   06b1: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   06b4: UJP  $06bf       Unconditional jump
-> 06b6: SLDC 01          Short load constant 1
   06b7: STR  02 00e2     Store TOS to G226
   06bb: SLDC 00          Short load constant 0
   06bc: SLDC 26          Short load constant 38
   06bd: CSP  04          Call standard procedure EXIT
-> 06bf: LOD  02 0013     Load word at G19
   06c2: SLDC 00          Short load constant 0
   06c3: NEQI             Integer TOS-1 <> TOS
   06c4: FJP  $06d9       Jump if TOS false
   06c6: SLDC 00          Short load constant 0
   06c7: STR  02 00e2     Store TOS to G226
   06cb: SLDC 03          Short load constant 3
   06cc: CSP  26          Call standard procedure UNITCLEAR
   06ce: LOD  02 0001     Load word at G1 (SYSCOM)
   06d1: SIND 02          Short index load *TOS+2
   06d2: SLDC 00          Short load constant 0
   06d3: SLDC 00          Short load constant 0
   06d4: CXP  06 09       Call external procedure SYSIO.9
   06d7: FJP  $06d9       Jump if TOS false
-> 06d9: LOD  02 0013     Load word at G19
   06dc: SLDC 01          Short load constant 1
   06dd: EQUI             Integer TOS-1 = TOS
   06de: LOD  02 0013     Load word at G19
   06e1: SLDC 02          Short load constant 2
   06e2: EQUI             Integer TOS-1 = TOS
   06e3: LOR              Logical OR (TOS | TOS-1)
   06e4: FJP  $06fc       Jump if TOS false
   06e6: LDA  02 0002     Load addr G2 (INPUT)
   06e9: SLDC 00          Short load constant 0
   06ea: IXA  01          Index array (TOS-1 + TOS * 1)
   06ec: SIND 00          Short index load *TOS+0
   06ed: SLDC 00          Short load constant 0
   06ee: CXP  06 05       Call external procedure SYSIO.FCLOSE
   06f1: LDA  02 0002     Load addr G2 (INPUT)
   06f4: SLDC 01          Short load constant 1
   06f5: IXA  01          Index array (TOS-1 + TOS * 1)
   06f7: SIND 00          Short index load *TOS+0
   06f8: SLDC 01          Short load constant 1
   06f9: CXP  06 05       Call external procedure SYSIO.FCLOSE
-> 06fc: SLDC 01          Short load constant 1
   06fd: CSP  23          Call standard procedure UNITBUSY
   06ff: SLDC 02          Short load constant 2
   0700: CSP  23          Call standard procedure UNITBUSY
   0702: LOR              Logical OR (TOS | TOS-1)
   0703: FJP  $0708       Jump if TOS false
   0705: SLDC 01          Short load constant 1
   0706: CSP  26          Call standard procedure UNITCLEAR
-> 0708: LOD  02 0013     Load word at G19
   070b: SLDC 00          Short load constant 0
   070c: EQUI             Integer TOS-1 = TOS
   070d: FJP  $0684       Jump if TOS false
-> 070f: SLDC 06          Short load constant 6
   0710: CSP  16          Call standard procedure UNLOADSEGMENT
   0712: UJP  $0719       Unconditional jump
-> 0714: SLDC 06          Short load constant 6
   0715: CSP  15          Call standard procedure LOADSEGMENT
   0717: UJP  $0684       Unconditional jump
-> 0719: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC39 (* P=39 LL=1 *)
BEGIN
-> 072c: UJP  $0755       Unconditional jump
-> 072e: CBP  22          Call base procedure PASCALSY.34
   0730: CGP  26          Call global procedure PASCALSY.38
   0732: LOD  02 00e3     Load word at G227
   0736: LNOT             Logical NOT (~TOS)
   0737: LOD  02 00e2     Load word at G226
   073b: LAND             Logical AND (TOS & TOS-1)
   073c: FJP  $0745       Jump if TOS false
   073e: LDCN             Load constant NIL
   073f: LDCN             Load constant NIL
   0740: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   0743: UJP  $0749       Unconditional jump
-> 0745: SLDC 00          Short load constant 0
   0746: SLDC 27          Short load constant 39
   0747: CSP  04          Call standard procedure EXIT
-> 0749: LOD  02 0013     Load word at G19
   074c: SLDC 00          Short load constant 0
   074d: EQUI             Integer TOS-1 = TOS
   074e: FJP  $072e       Jump if TOS false
-> 0750: SLDC 02          Short load constant 2
   0751: CSP  16          Call standard procedure UNLOADSEGMENT
   0753: UJP  $075a       Unconditional jump
-> 0755: SLDC 02          Short load constant 2
   0756: CSP  15          Call standard procedure LOADSEGMENT
   0758: UJP  $072e       Unconditional jump
-> 075a: RNP  00          Return from nonbase procedure
END

## Segment USERPROG (1)

### PROCEDURE USERPROG.USERPROG(PARAM1; PARAM2) (* P=1 LL=0 *)
BEGIN
-> 0000: SLDC 09          Short load constant 9 { 'system internal inconsistency' }
   0001: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 0004: RBP  00          Return from base procedure
END

## Segment FIOPRIMS (2)

### PROCEDURE FIOPRIMS.FIOPRIMS (* P=1 LL=1 *)
BEGIN
-> 0304: RNP  00          Return from nonbase procedure
END

### FUNCTION FIOPRIMS.FUNC2(VAR F:FIB): BOOLEAN (* P=2 LL=1 *)
  MP1=RETVAL1:BOOLEAN
  MP3=F:FIB
  MP4
  MP5
  MP6
  MP7=RECSIZE:INTEGER
  MP8=DONE:BOOLEAN
  MP9=F_C:FIB
  MP10=HEADER:DIRENTRY
BEGIN
  RETVAL1 := TRUE
-> 0000: SLDC 01          Short load constant 1
   0001: STL  0001        Store TOS into MP1
  F_C := F
   0003: SLDL 03          Short load local MP3 (F)
   0004: STL  0009        Store TOS into MP9 (F_C)
  HEADER := F_C.FHEADER
   0006: SLDL 09          Short load local MP9 (F_C)
   0007: INCP 10          Inc field ptr (TOS+16) (FHEADER)
   0009: STL  000a        Store TOS into MP10 (HEADER)
  RECSIZE := F_C.FRECSIZE
   000b: SLDL 09          Short load local MP9 (F_C)
   000c: SIND 04          Short index load *TOS+4 (FRECSIZE)
   000d: STL  0007        Store TOS into MP7 (RECSIZE)
  MP6 := 0
   000f: SLDC 00          Short load constant 0
   0010: STL  0006        Store TOS into MP6
  REPEAT
    IF F_C.FNXTBLK >= F_C.MAXBLK THEN
-> 0012: SLDL 09          Short load local MP9 (F_C)
   0013: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   0015: SLDL 09          Short load local MP9 (F_C)
   0016: IND  0c          Static index and load word (TOS+12) (FMAXBLK)
   0018: GEQI             Integer TOS-1 >= TOS
   0019: FJP  $0035       Jump if TOS false
    BEGIN
      IF F_C.FNXTBYTE + RECSIZE > F_C.FMAXBYTE THEN
   001b: SLDL 09          Short load local MP9 (F_C)
   001c: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   001e: SLDL 07          Short load local MP7 (RECSIZE)
   001f: ADI              Add integers (TOS + TOS-1)
   0020: SLDL 09          Short load local MP9 (F_C)
   0021: IND  1e          Static index and load word (TOS+30)
   0023: GRTI             Integer TOS-1 > TOS
   0024: FJP  $002a       Jump if TOS false
      BEGIN
        GOTO 1
   0026: UJP  $00cf       Unconditional jump
   0028: UJP  $0033       Unconditional jump
      END ELSE BEGIN
        MP5 := HEADER.DLASTBYTE - F_C.FNXTBYTE
-> 002a: SLDL 0a          Short load local MP10 (HEADER)
   002b: IND  0b          Static index and load word (TOS+11)
   002d: SLDL 09          Short load local MP9 (F_C)
   002e: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   0030: SBI              Subtract integers (TOS-1 - TOS)
   0031: STL  0005        Store TOS into MP5
-> 0033: UJP  $003e       Unconditional jump
      END
    END ELSE BEGIN
      MP5 := 512 - F_C.FNXTBYTE
-> 0035: LDCI 0200        Load word 512
   0038: SLDL 09          Short load local MP9 (F_C)
   0039: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   003b: SBI              Subtract integers (TOS-1 - TOS)
   003c: STL  0005        Store TOS into MP5
    END
    MP4 := RECSIZE
-> 003e: SLDL 07          Short load local MP7 (RECSIZE)
   003f: STL  0004        Store TOS into MP4
    IF MP4 > MP5 THEN
   0041: SLDL 04          Short load local MP4
   0042: SLDL 05          Short load local MP5
   0043: GRTI             Integer TOS-1 > TOS
   0044: FJP  $0049       Jump if TOS false
    BEGIN
      MP4 := MP5
   0046: SLDL 05          Short load local MP5
   0047: STL  0004        Store TOS into MP4
    END
    IF MP4 > 0 THEN
-> 0049: SLDL 04          Short load local MP4
   004a: SLDC 00          Short load constant 0
   004b: GRTI             Integer TOS-1 > TOS
   004c: FJP  $006d       Jump if TOS false
    BEGIN
      MOVELEFT(F_C.FBUFFER,F_C.FNXTBYTE,F_C.FWINDOW,MP6,MP4)
   004e: SLDL 09          Short load local MP9 (F_C)
   004f: INCP 21          Inc field ptr (TOS+33) (FBUFFER)
   0051: SLDL 09          Short load local MP9 (F_C)
   0052: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   0054: SLDL 09          Short load local MP9 (F_C)
   0055: SIND 00          Short index load *TOS+0 (FWINDOW)
   0056: SLDL 06          Short load local MP6
   0057: SLDL 04          Short load local MP4
   0058: CSP  02          Call standard procedure MOVL
      F_C.FNXTBYTE := F_C.FNXTBYTE + MP4
   005a: SLDL 09          Short load local MP9 (F_C)
   005b: INCP 1f          Inc field ptr (TOS+31) (FNXTBYTE)
   005d: SLDL 09          Short load local MP9 (F_C)
   005e: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   0060: SLDL 04          Short load local MP4
   0061: ADI              Add integers (TOS + TOS-1)
   0062: STO              Store indirect (TOS into TOS-1)
      MP6 := MP6 + MP4
   0063: SLDL 06          Short load local MP6
   0064: SLDL 04          Short load local MP4
   0065: ADI              Add integers (TOS + TOS-1)
   0066: STL  0006        Store TOS into MP6
      RECSIZE := RECSIZE - MP4
   0068: SLDL 07          Short load local MP7 (RECSIZE)
   0069: SLDL 04          Short load local MP4
   006a: SBI              Subtract integers (TOS-1 - TOS)
   006b: STL  0007        Store TOS into MP7 (RECSIZE)
    END
    DONE := RECSIZE = 0
-> 006d: SLDL 07          Short load local MP7 (RECSIZE)
   006e: SLDC 00          Short load constant 0
   006f: EQUI             Integer TOS-1 = TOS
   0070: STL  0008        Store TOS into MP8 (DONE)
    IF NOT DONE THEN
   0072: SLDL 08          Short load local MP8 (DONE)
   0073: LNOT             Logical NOT (~TOS)
   0074: FJP  $00c9       Jump if TOS false
    BEGIN
      IF F_C.FBUFCHNGD THEN
   0076: SLDL 09          Short load local MP9 (F_C)
   0077: IND  20          Static index and load word (TOS+32) (FBUFCHNGD)
   0079: FJP  $0099       Jump if TOS false
      BEGIN
        F_C.FBUFCHNGD := FALSE
   007b: SLDL 09          Short load local MP9 (F_C)
   007c: INCP 20          Inc field ptr (TOS+32) (FBUFCHNGD)
   007e: SLDC 00          Short load constant 0
   007f: STO              Store indirect (TOS into TOS-1)
        F_C.FMODIFIED := TRUE
   0080: SLDL 09          Short load local MP9 (F_C)
   0081: INCP 0f          Inc field ptr (TOS+15) (FMODIFIED)
   0083: SLDC 01          Short load constant 1
   0084: STO              Store indirect (TOS into TOS-1)
        UNITWRITE(F_C.FUNIT,F_C.FBUFFER,0,512,HEADER.DFIRSTBLK+F_C.FNXTBLK-1,0)
   0085: SLDL 09          Short load local MP9 (F_C)
   0086: SIND 07          Short index load *TOS+7 (FUNIT)
   0087: SLDL 09          Short load local MP9 (F_C)
   0088: INCP 21          Inc field ptr (TOS+33) (FBUFFER)
   008a: SLDC 00          Short load constant 0
   008b: LDCI 0200        Load word 512
   008e: SLDL 0a          Short load local MP10 (HEADER)
   008f: SIND 00          Short index load *TOS+0 (DFIRSTBLK)
   0090: SLDL 09          Short load local MP9 (F_C)
   0091: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   0093: ADI              Add integers (TOS + TOS-1)
   0094: SLDC 01          Short load constant 1
   0095: SBI              Subtract integers (TOS-1 - TOS)
   0096: SLDC 00          Short load constant 0
   0097: CSP  06          Call standard procedure UNITWRITE
      END
      IF IORESULT <> 0 THEN
-> 0099: CSP  22          Call standard procedure IORESULT
   009b: SLDC 00          Short load constant 0
   009c: NEQI             Integer TOS-1 <> TOS
   009d: FJP  $00a1       Jump if TOS false
      BEGIN
        GOTO 1
   009f: UJP  $00cf       Unconditional jump
      END
      UNITREAD(F_C.FUNIT,F_C.FBUFFER,0,512,HEADER.DFIRSTBLK+F_C.FNXTBLK,0)
-> 00a1: SLDL 09          Short load local MP9 (F_C)
   00a2: SIND 07          Short index load *TOS+7 (FUNIT)
   00a3: SLDL 09          Short load local MP9 (F_C)
   00a4: INCP 21          Inc field ptr (TOS+33) (FBUFFER)
   00a6: SLDC 00          Short load constant 0
   00a7: LDCI 0200        Load word 512
   00aa: SLDL 0a          Short load local MP10 (HEADER)
   00ab: SIND 00          Short index load *TOS+0 (DFIRSTBLK)
   00ac: SLDL 09          Short load local MP9 (F_C)
   00ad: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   00af: ADI              Add integers (TOS + TOS-1)
   00b0: SLDC 00          Short load constant 0
   00b1: CSP  05          Call standard procedure UNITREAD
      IF IORESULT <> 0 THEN
   00b3: CSP  22          Call standard procedure IORESULT
   00b5: SLDC 00          Short load constant 0
   00b6: NEQI             Integer TOS-1 <> TOS
   00b7: FJP  $00bb       Jump if TOS false
      BEGIN
        GOTO 1
   00b9: UJP  $00cf       Unconditional jump
      END
      F_C.FNXTBLK := F_C.FNXTBLK + 1
-> 00bb: SLDL 09          Short load local MP9 (F_C)
   00bc: INCP 0d          Inc field ptr (TOS+13) (FNXTBLK)
   00be: SLDL 09          Short load local MP9 (F_C)
   00bf: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   00c1: SLDC 01          Short load constant 1
   00c2: ADI              Add integers (TOS + TOS-1)
   00c3: STO              Store indirect (TOS into TOS-1)
      F_C.FNXTBYTE := 0
   00c4: SLDL 09          Short load local MP9 (F_C)
   00c5: INCP 1f          Inc field ptr (TOS+31) (FNXTBYTE)
   00c7: SLDC 00          Short load constant 0
   00c8: STO              Store indirect (TOS into TOS-1)
    END
-> 00c9: SLDL 08          Short load local MP8 (DONE)
   00ca: FJP  $0012       Jump if TOS false
  UNTIL DONE
  RETVAL1 := FALSE
   00cc: SLDC 00          Short load constant 0
   00cd: STL  0001        Store TOS into MP1
  1:
-> 00cf: RNP  01          Return from nonbase procedure
END

### FUNCTION FIOPRIMS.FUNC3(VAR F:FIB): BOOLEAN (* P=3 LL=1 *)
  MP1=RETVAL1:BOOLEAN
  MP3=F:FIB
  MP4=F_C:FIB
BEGIN
  PASCALSY.FGET(F)
-> 00e0: SLDL 03          Short load local MP3 (F)
   00e1: CXP  00 07       Call external procedure PASCALSY.FGET
  F_C := F
   00e4: SLDL 03          Short load local MP3 (F)
   00e5: STL  0004        Store TOS into MP4 (F_C)
  IF F_C.FWINDOW[0] > 32 THEN
   00e7: SLDL 04          Short load local MP4 (F_C)
   00e8: SIND 00          Short index load *TOS+0
   00e9: SLDC 00          Short load constant 0
   00ea: LDB              Load byte at byte ptr TOS-1 + TOS
   00eb: SLDC 20          Short load constant 32
   00ec: GRTI             Integer TOS-1 > TOS
   00ed: FJP  $0103       Jump if TOS false
  BEGIN
    F_C.FREPTCNT := F_C.FWINDOW[0] - 32
   00ef: SLDL 04          Short load local MP4 (F_C)
   00f0: INCP 0e          Inc field ptr (TOS+14) (FREPTCNT)
   00f2: SLDL 04          Short load local MP4 (F_C)
   00f3: SIND 00          Short index load *TOS+0 (FWINDOW)
   00f4: SLDC 00          Short load constant 0
   00f5: LDB              Load byte at byte ptr TOS-1 + TOS
   00f6: SLDC 20          Short load constant 32
   00f7: SBI              Subtract integers (TOS-1 - TOS)
   00f8: STO              Store indirect (TOS into TOS-1)
    F_C.FWINDOW[0] := 32
   00f9: SLDL 04          Short load local MP4 (F_C)
   00fa: SIND 00          Short index load *TOS+0 (FWINDOW)
   00fb: SLDC 00          Short load constant 0
   00fc: SLDC 20          Short load constant 32
   00fd: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
    RETVAL1 := TRUE
   00fe: SLDC 01          Short load constant 1
   00ff: STL  0001        Store TOS into MP1 (RETVAL1)
    GOTO 1
   0101: UJP  $010a       Unconditional jump
  END
  FGET(F)
-> 0103: SLDL 03          Short load local MP3 (F)
   0104: CXP  00 07       Call external procedure PASCALSY.FGET
  RETVAL1 := FALSE
   0107: SLDC 00          Short load constant 0
   0108: STL  0001        Store TOS into MP1 (RETVAL1)
  1:
-> 010a: RNP  01          Return from nonbase procedure
END

### PROCEDURE FIOPRIMS.PROC4(VAR F:FIB) (* P=4 LL=1 *)
  MP1=F:FIBP
  MP2=F_C:FIB
  MP292=F_P:FIBP
BEGIN
  F_C := F
-> 0116: LLA  0002        Load local address MP2 (F_C)
   0118: SLDL 01          Short load local MP1 (F)
   0119: MOV  0122        Move 290 words (TOS to TOS-1)
  F_P := F
   011c: SLDL 01          Short load local MP1 (F)
   011d: STL  0124        Store TOS into MP292 (F_P)
  IF ODD(F_P.FNXTBLK) THEN
   0120: LDL  0124        Load local word MP292 (F_P)
   0123: IND  0d          Static index and load word (TOS+13)
   0125: FJP  $0134       Jump if TOS false
  BEGIN
    F_P.FNXTBLK := F_P.FNXTBLK + 1
   0127: LDL  0124        Load local word MP292 (F_P)
   012a: INCP 0d          Inc field ptr (TOS+13)
   012c: LDL  0124        Load local word MP292 (F_P)
   012f: IND  0d          Static index and load word (TOS+13)
   0131: SLDC 01          Short load constant 1
   0132: ADI              Add integers (TOS + TOS-1)
   0133: STO              Store indirect (TOS into TOS-1)
  END
  F_P.FNXTBYTE := 512
-> 0134: LDL  0124        Load local word MP292 (F_P)
   0137: INCP 1f          Inc field ptr (TOS+31)
   0139: LDCI 0200        Load word 512
   013c: STO              Store indirect (TOS into TOS-1)
  PASCALSY.FGET(F)
   013d: SLDL 01          Short load local MP1 (F)
   013e: CXP  00 07       Call external procedure PASCALSY.FGET
  IF F_P.FEOF THEN
   0141: LDL  0124        Load local word MP292 (F_P)
   0144: SIND 02          Short index load *TOS+2
   0145: FJP  $0168       Jump if TOS false
  BEGIN
    F := F_C
   0147: SLDL 01          Short load local MP1 (F)
   0148: LLA  0002        Load local address MP2 (F_C)
   014a: MOV  0122        Move 290 words (TOS to TOS-1)
    F_P.FEOF := TRUE
   014d: LDL  0124        Load local word MP292 (F_P)
   0150: INCP 02          Inc field ptr (TOS+2)
   0152: SLDC 01          Short load constant 1
   0153: STO              Store indirect (TOS into TOS-1)
    F_P.FEOLN := TRUE
   0154: LDL  0124        Load local word MP292 (F_P)
   0157: INCP 01          Inc field ptr (TOS+1)
   0159: SLDC 01          Short load constant 1
   015a: STO              Store indirect (TOS into TOS-1)
    F_P.FNXTBYTE := F_P.FNXTBYTE - 1
   015b: LDL  0124        Load local word MP292 (F_P)
   015e: INCP 1f          Inc field ptr (TOS+31)
   0160: LDL  0124        Load local word MP292 (F_P)
   0163: IND  1f          Static index and load word (TOS+31)
   0165: SLDC 01          Short load constant 1
   0166: SBI              Subtract integers (TOS-1 - TOS)
   0167: STO              Store indirect (TOS into TOS-1)
  END
-> 0168: RNP  00          Return from nonbase procedure
END

### FUNCTION FIOPRIMS.FUNC5(VAR F:FIB): BOOLEAN (* P=5 LL=1 *)
  MP1=RETVAL1:BOOLEAN
  MP3=F:FIB
  MP4
  MP5
  MP6
  MP7=RECSIZE:INTEGER
  MP8
  MP9=F_C:FIB
  MP10=HEADER:DIRENTRY
BEGIN
  RETVAL := TRUE
-> 0174: SLDC 01          Short load constant 1
   0175: STL  0001        Store TOS into MP1
  F_C := F
   0177: SLDL 03          Short load local MP3 (F)
   0178: STL  0009        Store TOS into MP9 (F_C)
  HEADER := F_C.FHEADER
   017a: SLDL 09          Short load local MP9 (F_C)
   017b: INCP 10          Inc field ptr (TOS+16) (FHEADER)
   017d: STL  000a        Store TOS into MP10 (HEADER)
  RECSIZE := F_C.FRECSIZE
   017f: SLDL 09          Short load local MP9 (F_C)
   0180: SIND 04          Short index load *TOS+4 (FRECSIZE)
   0181: STL  0007        Store TOS into MP7 (RECSIZE)
  MP6 := 0
   0183: SLDC 00          Short load constant 0
   0184: STL  0006        Store TOS into MP6
  REPEAT
    IF (HEADER.DFIRSTBLK + F_C.FNXTBLK = HEADER.DLASTBLK) AND (F_C.FNXTBYTE + RECSIZE > HEADER.DLASTBYTE) THEN
-> 0186: SLDL 0a          Short load local MP10 (HEADER)
   0187: SIND 00          Short index load *TOS+0 (DFIRSTBLK)
   0188: SLDL 09          Short load local MP9 (F_C)
   0189: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   018b: ADI              Add integers (TOS + TOS-1)
   018c: SLDL 0a          Short load local MP10 (HEADER)
   018d: SIND 01          Short index load *TOS+1 (DLASTBLK)
   018e: EQUI             Integer TOS-1 = TOS
   018f: SLDL 09          Short load local MP9 (F_C)
   0190: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   0192: SLDL 07          Short load local MP7 (RECSIZE)
   0193: ADI              Add integers (TOS + TOS-1)
   0194: SLDL 0a          Short load local MP10 (HEADER)
   0195: IND  0b          Static index and load word (TOS+11) (DLASTBYTE)
   0197: GRTI             Integer TOS-1 > TOS
   0198: LAND             Logical AND (TOS & TOS-1)
   0199: FJP  $01aa       Jump if TOS false
     BEGIN
       IF PASCALSY.FUNC33(F) THEN
   019b: SLDL 03          Short load local MP3 (F)
   019c: SLDC 00          Short load constant 0
   019d: SLDC 00          Short load constant 0
   019e: CXP  00 21       Call external procedure PASCALSY.33
   01a1: FJP  $01aa       Jump if TOS false
      BEGIN
        SYSCOM.IORESULT := 8 { 'No room on volume' }
   01a3: LOD  02 0001     Load word at G1 (SYSCOM)
   01a6: SLDC 08          Short load constant 8
   01a7: STO              Store indirect (TOS into TOS-1)
        GOTO 1
   01a8: UJP  $02f3       Unconditional jump
      END
    END
    IF HEADER.FDIRSTBLK + F_C.FNXTBLK = HEADER.DLASTBLK THEN
-> 01aa: SLDL 0a          Short load local MP10 (HEADER)
   01ab: SIND 00          Short index load *TOS+0 (DFIRSTBLK)
   01ac: SLDL 09          Short load local MP9 (F_C)
   01ad: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   01af: ADI              Add integers (TOS + TOS-1)
   01b0: SLDL 0a          Short load local MP10 (HEADER)
   01b1: SIND 01          Short index load *TOS+1 (DLASTBLK)
   01b2: EQUI             Integer TOS-1 = TOS
   01b3: FJP  $01d4       Jump if TOS false
    BEGIN
      IF F_C.FNXTBYTE + RECSIZE = HEADER.DLASTBYTE THEN
   01b5: SLDL 09          Short load local MP9 (F_C)
   01b6: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   01b8: SLDL 07          Short load local MP7 (RECSIZE)
   01b9: ADI              Add integers (TOS + TOS-1)
   01ba: SLDL 0a          Short load local MP10 (HEADER)
   01bb: IND  0b          Static index and load word (TOS+11) (DLASTBYTE)
   01bd: GRTI             Integer TOS-1 > TOS
   01be: FJP  $01c9       Jump if TOS false
      BEGIN
        SYSCOM.IORESULT := 8 { 'No room on volume' }
   01c0: LOD  02 0001     Load word at G1 (SYSCOM)
   01c3: SLDC 08          Short load constant 8
   01c4: STO              Store indirect (TOS into TOS-1)
        GOTO 1
   01c5: UJP  $02f3       Unconditional jump
   01c7: UJP  $01d2       Unconditional jump
      END ELSE BEGIN
        MP5 := HEADER.DLASTBYTE - F_C.FNXTBYTE
-> 01c9: SLDL 0a          Short load local MP10 (HEADER)
   01ca: IND  0b          Static index and load word (TOS+11) (DLASTBYTE)
   01cc: SLDL 09          Short load local MP9 (F_C)
   01cd: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   01cf: SBI              Subtract integers (TOS-1 - TOS)
   01d0: STL  0005        Store TOS into MP5
      END
-> 01d2: UJP  $01dd       Unconditional jump
    END ELSE BEGIN
      MP5 := 512 - F_C.FNXTBYTE
-> 01d4: LDCI 0200        Load word 512
   01d7: SLDL 09          Short load local MP9 (F_C)
   01d8: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   01da: SBI              Subtract integers (TOS-1 - TOS)
   01db: STL  0005        Store TOS into MP5
    END
    MP4 := RECSIZE
-> 01dd: SLDL 07          Short load local MP7 (RECSIZE)
   01de: STL  0004        Store TOS into MP4
    IF MP4 > MP5 THEN
   01e0: SLDL 04          Short load local MP4
   01e1: SLDL 05          Short load local MP5
   01e2: GRTI             Integer TOS-1 > TOS
   01e3: FJP  $01e8       Jump if TOS false
    BEGIN
      MP4 := MP5
   01e5: SLDL 05          Short load local MP5
   01e6: STL  0004        Store TOS into MP4
    END
    IF MP4 > 0 THEN
-> 01e8: SLDL 04          Short load local MP4
   01e9: SLDC 00          Short load constant 0
   01ea: GRTI             Integer TOS-1 > TOS
   01eb: FJP  $0211       Jump if TOS false
    BEGIN
      F_C.FBUFCHNGD := TRUE
   01ed: SLDL 09          Short load local MP9 (F_C)
   01ee: INCP 20          Inc field ptr (TOS+32) (FBUFCHNGD)
   01f0: SLDC 01          Short load constant 1
   01f1: STO              Store indirect (TOS into TOS-1)
      MOVELEFT(F_C.FWINDOW, MP6, F_C.FBUFFER, F_C.FNXTBYTE, MP4)
   01f2: SLDL 09          Short load local MP9 (F_C)
   01f3: SIND 00          Short index load *TOS+0 (FWINDOW)
   01f4: SLDL 06          Short load local MP6
   01f5: SLDL 09          Short load local MP9 (F_C)
   01f6: INCP 21          Inc field ptr (TOS+33) (FBUFFER)
   01f8: SLDL 09          Short load local MP9 (F_C)
   01f9: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   01fb: SLDL 04          Short load local MP4
   01fc: CSP  02          Call standard procedure MOVL
      F_C.FNXTBYTE := F_C.FNXTBYTE + MP4
   01fe: SLDL 09          Short load local MP9 (F_C)
   01ff: INCP 1f          Inc field ptr (TOS+31) (FNXTBYTE)
   0201: SLDL 09          Short load local MP9 (F_C)
   0202: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   0204: SLDL 04          Short load local MP4
   0205: ADI              Add integers (TOS + TOS-1)
   0206: STO              Store indirect (TOS into TOS-1)
      MP6 := MP6 + MP4
   0207: SLDL 06          Short load local MP6
   0208: SLDL 04          Short load local MP4
   0209: ADI              Add integers (TOS + TOS-1)
   020a: STL  0006        Store TOS into MP6
      RECSIZE := RECSIZE - MP4
   020c: SLDL 07          Short load local MP7 (RECSIZE)
   020d: SLDL 04          Short load local MP4
   020e: SBI              Subtract integers (TOS-1 - TOS)
   020f: STL  0007        Store TOS into MP7 (RECSIZE)
    END
    MP8 := RECSIZE = 0 
-> 0211: SLDL 07          Short load local MP7 (RECSIZE)
   0212: SLDC 00          Short load constant 0
   0213: EQUI             Integer TOS-1 = TOS
   0214: STL  0008        Store TOS into MP8
    IF NOT MP8 THEN
   0216: SLDL 08          Short load local MP8
   0217: LNOT             Logical NOT (~TOS)
   0218: FJP  $0282       Jump if TOS false
    BEGIN
      IF F_C.FBUFCHNGD THEN
   021a: SLDL 09          Short load local MP9 (F_C)
   021b: IND  20          Static index and load word (TOS+32) (FBUFCHNGD)
   021d: FJP  $023d       Jump if TOS false
      BEGIN
        F_C.FBUFCHNGD := FALSE
   021f: SLDL 09          Short load local MP9 (F_C)
   0220: INCP 20          Inc field ptr (TOS+32) (FBUFCHNGD)
   0222: SLDC 00          Short load constant 0
   0223: STO              Store indirect (TOS into TOS-1)
        F_C.FMODIFIED := TRUE
   0224: SLDL 09          Short load local MP9 (F_C)
   0225: INCP 0f          Inc field ptr (TOS+15) (FMODIFIED)
   0227: SLDC 01          Short load constant 1
   0228: STO              Store indirect (TOS into TOS-1)
        UNITWRITE(F_C.FUNIT,F_C.FBUFFER,0,512,HEADER.DFIRSTBLK+F_C.FNXTBLK-1,0)
   0229: SLDL 09          Short load local MP9 (F_C)
   022a: SIND 07          Short index load *TOS+7 (FUNIT)
   022b: SLDL 09          Short load local MP9 (F_C)
   022c: INCP 21          Inc field ptr (TOS+33) (FBUFFER)
   022e: SLDC 00          Short load constant 0
   022f: LDCI 0200        Load word 512
   0232: SLDL 0a          Short load local MP10 (HEADER)
   0233: SIND 00          Short index load *TOS+0
   0234: SLDL 09          Short load local MP9 (F_C)
   0235: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   0237: ADI              Add integers (TOS + TOS-1)
   0238: SLDC 01          Short load constant 1
   0239: SBI              Subtract integers (TOS-1 - TOS)
   023a: SLDC 00          Short load constant 0
   023b: CSP  06          Call standard procedure UNITWRITE
      END
      IF IORESULT <> 0 THEN
-> 023d: CSP  22          Call standard procedure IORESULT
   023f: SLDC 00          Short load constant 0
   0240: NEQI             Integer TOS-1 <> TOS
   0241: FJP  $0245       Jump if TOS false
      BEGIN
        GOTO 1
   0243: UJP  $02f3       Unconditional jump
      END
      IF F_C.FNXTBLK < F_C.FMAXBLK THEN
-> 0245: SLDL 09          Short load local MP9 (F_C)
   0246: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   0248: SLDL 09          Short load local MP9 (F_C)
   0249: IND  0c          Static index and load word (TOS+12) (FMAXBLK)
   024b: LESI             Integer TOS-1 < TOS
   024c: FJP  $0262       Jump if TOS false
      BEGIN
        UNITREAD(F_C.FUNIT,F_C.FBUFFER,0,512,HEADER.DFIRSTBLK+F_C.FNXTBLK,0)
   024e: SLDL 09          Short load local MP9 (F_C)
   024f: SIND 07          Short index load *TOS+7 (FUNIT)
   0250: SLDL 09          Short load local MP9 (F_C)
   0251: INCP 21          Inc field ptr (TOS+33) (FBUFFER)
   0253: SLDC 00          Short load constant 0
   0254: LDCI 0200        Load word 512
   0257: SLDL 0a          Short load local MP10 (HEADER)
   0258: SIND 00          Short index load *TOS+0 (DFIRSTBLK)
   0259: SLDL 09          Short load local MP9 (F_C)
   025a: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   025c: ADI              Add integers (TOS + TOS-1)
   025d: SLDC 00          Short load constant 0
   025e: CSP  05          Call standard procedure UNITREAD
   0260: UJP  $026c       Unconditional jump
      END ELSE BEGIN
        FILLCHAR(F_C.FBUFFER,0,512,0)
-> 0262: SLDL 09          Short load local MP9 (F_C)
   0263: INCP 21          Inc field ptr (TOS+33) (FBUFFER)
   0265: SLDC 00          Short load constant 0
   0266: LDCI 0200        Load word 512
   0269: SLDC 00          Short load constant 0
   026a: CSP  0a          Call standard procedure FLCH
      END
      IF IORESULT <> 0 THEN
-> 026c: CSP  22          Call standard procedure IORESULT
   026e: SLDC 00          Short load constant 0
   026f: NEQI             Integer TOS-1 <> TOS
   0270: FJP  $0274       Jump if TOS false
      BEGIN
        GOTO 1
   0272: UJP  $02f3       Unconditional jump
      END
      F_C.FNXTBLK := F_C.FNXTBLK + 1
-> 0274: SLDL 09          Short load local MP9 (F_C)
   0275: INCP 0d          Inc field ptr (TOS+13) (FNXTBLK)
   0277: SLDL 09          Short load local MP9 (F_C)
   0278: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   027a: SLDC 01          Short load constant 1
   027b: ADI              Add integers (TOS + TOS-1)
   027c: STO              Store indirect (TOS into TOS-1)
      F_C.FNXTBYTE := 0
   027d: SLDL 09          Short load local MP9 (F_C)
   027e: INCP 1f          Inc field ptr (TOS+31) (FNXTBYTE)
   0280: SLDC 00          Short load constant 0
   0281: STO              Store indirect (TOS into TOS-1)
    END
  UNTIL MP8
-> 0282: SLDL 08          Short load local MP8
   0283: FJP  $0186       Jump if TOS false
  IF F_C.FNXTBLK > F_C.FMAXBLK THEN
   0285: SLDL 09          Short load local MP9 (F_C)
   0286: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   0288: SLDL 09          Short load local MP9 (F_C)
   0289: IND  0c          Static index and load word (TOS+12) (FMAXBLK)
   028b: GRTI             Integer TOS-1 > TOS
   028c: FJP  $029e       Jump if TOS false
  BEGIN
    F_C.MAXBYTE := F_C.FNXTBYTE
   028e: SLDL 09          Short load local MP9 (F_C)
   028f: INCP 1e          Inc field ptr (TOS+30) (FMAXBYTE)
   0291: SLDL 09          Short load local MP9 (F_C)
   0292: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   0294: STO              Store indirect (TOS into TOS-1)
    F_C.FMAXBLK := F_C.FNXTBLK
   0295: SLDL 09          Short load local MP9 (F_C)
   0296: INCP 0c          Inc field ptr (TOS+12) (FMAXBLK)
   0298: SLDL 09          Short load local MP9 (F_C)
   0299: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   029b: STO              Store indirect (TOS into TOS-1)
   029c: UJP  $02b6       Unconditional jump
  END ELSE BEGIN
    IF (F_C.FNXTBLK = F_C.FMAXBLK) AND (F_C.FNXTBYTE > F_C.FMAXBYTE) THEN
-> 029e: SLDL 09          Short load local MP9 (F_C)
   029f: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   02a1: SLDL 09          Short load local MP9 (F_C)
   02a2: IND  0c          Static index and load word (TOS+12) (FMAXBLK)
   02a4: EQUI             Integer TOS-1 = TOS
   02a5: SLDL 09          Short load local MP9 (F_C)
   02a6: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   02a8: SLDL 09          Short load local MP9 (F_C)
   02a9: IND  1e          Static index and load word (TOS+30) (FMAXBYTE)
   02ab: GRTI             Integer TOS-1 > TOS
   02ac: LAND             Logical AND (TOS & TOS-1)
   02ad: FJP  $02b6       Jump if TOS false
    BEGIN
      F_C.FMAXBYTE := F_C.FNXTBYTE
   02af: SLDL 09          Short load local MP9 (F_C)
   02b0: INCP 1e          Inc field ptr (TOS+30) (FMAXBYTE)
   02b2: SLDL 09          Short load local MP9 (F_C)
   02b3: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   02b5: STO              Store indirect (TOS into TOS-1)
    END
  END
  IF F_C.FRECSIZE = 1 THEN
-> 02b6: SLDL 09          Short load local MP9 (F_C)
   02b7: SIND 04          Short index load *TOS+4 (FRECSIZE)
   02b8: SLDC 01          Short load constant 1
   02b9: EQUI             Integer TOS-1 = TOS
   02ba: FJP  $02f0       Jump if TOS false
  BEGIN
    IF F_C.FWINDOW[0] = 13 THEN
   02bc: SLDL 09          Short load local MP9 (F_C)
   02bd: SIND 00          Short index load *TOS+0 (FWINDOW)
   02be: SLDC 00          Short load constant 0
   02bf: LDB              Load byte at byte ptr TOS-1 + TOS
   02c0: SLDC 0d          Short load constant 13
   02c1: EQUI             Integer TOS-1 = TOS
   02c2: FJP  $02f0       Jump if TOS false
    BEGIN
      IF HEADER.DFKIND = 3 THEN
   02c4: SLDL 0a          Short load local MP10 (HEADER)
   02c5: INCP 02          Inc field ptr (TOS+2) (DFKIND)
   02c7: SLDC 04          Short load constant 4
   02c8: SLDC 00          Short load constant 0
   02c9: LDP              Load packed field (TOS)
   02ca: SLDC 03          Short load constant 3
   02cb: EQUI             Integer TOS-1 = TOS
   02cc: FJP  $02f0       Jump if TOS false
      BEGIN
        IF (F_C.FNXTBYTE >= 512 - 127) AND (ODD(F_C.FNXTBLK)) THEN
   02ce: SLDL 09          Short load local MP9 (F_C)
   02cf: IND  1f          Static index and load word (TOS+31) (FNXTBYTE)
   02d1: LDCI 0200        Load word 512
   02d4: SLDC 7f          Short load constant 127
   02d5: SBI              Subtract integers (TOS-1 - TOS)
   02d6: GEQI             Integer TOS-1 >= TOS
   02d7: SLDL 09          Short load local MP9 (F_C)
   02d8: IND  0d          Static index and load word (TOS+13) (FNXTBLK)
   02da: LNOT             Logical NOT (~TOS)
   02db: LAND             Logical AND (TOS & TOS-1)
   02dc: FJP  $02f0       Jump if TOS false
        BEGIN
          F_C.FNXTBYTE := 512 - 1
   02de: SLDL 09          Short load local MP9 (F_C)
   02df: INCP 1f          Inc field ptr (TOS+31) (FNXTBYTE)
   02e1: LDCI 0200        Load word 512
   02e4: SLDC 01          Short load constant 1
   02e5: SBI              Subtract integers (TOS-1 - TOS)
   02e6: STO              Store indirect (TOS into TOS-1)
          F_C.FWINDOW[0] := 0
   02e7: SLDL 09          Short load local MP9 (F_C)
   02e8: SIND 00          Short index load *TOS+0 (FWINDOW)
   02e9: SLDC 00          Short load constant 0
   02ea: SLDC 00          Short load constant 0
   02eb: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
          PASCALSY.FPUT(F)
   02ec: SLDL 03          Short load local MP3 (F)
   02ed: CXP  00 08       Call external procedure PASCALSY.FPUT
        END
      END
    END
  END
  RETVAL := FALSE
-> 02f0: SLDC 00          Short load constant 0
   02f1: STL  0001        Store TOS into MP1
  1:
-> 02f3: RNP  01          Return from nonbase procedure
END

## Segment PRINTERR (3)

### PROCEDURE PRINTERR.PRINTERR (* P=1 LL=0 *)
BEGIN
  PASCAL.EXECERROR(9)
-> 0000: SLDC 09          Short load constant 9
   0001: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 0004: RBP  00          Return from base procedure
END

## Segment INITIALI (4)

### PROCEDURE INITIALI.INITIALI (* P=1 LL=0 *)
  BASE305=IS128K:BOOLEAN
  BASE306=TMPADDR
BEGIN
  GOTO 1
-> 060a: UJP  $0799       Unconditional jump
  2:
  JUSTBOOTED := EMPTYHEAP = NIL
-> 060c: LOD  01 0005     Load word at G5 (EMPTYHEAP)
   060f: LDCN             Load constant NIL
   0610: EQUI             Integer TOS-1 = TOS
   0611: STR  01 00e5     Store TOS to G229 (JUSTBOOTED)
  IF JUSTBOOTED THEN
   0615: LOD  01 00e5     Load word at G229 (JUSTBOOTED)
   0619: FJP  $061f       Jump if TOS false
  BEGIN
    INITIALI.PROC9
   061b: CLP  09          Call local procedure INITIALI.PROC9
   061d: UJP  $0624       Unconditional jump
  END ELSE BEGIN
    RELEASE(EMPTYHEAP)
-> 061f: LDA  01 0005     Load addr G5 (EMPTYHEAP)
   0622: CSP  21          Call standard procedure RELEASE
  END
  G529 := ''
-> 0624: LDA  01 0211     Load addr G529
   0628: NOP              No operation
   0629: LSA  00          Load string address: ''
   062b: SAS  07          String assign (TOS to TOS-1, 7 chars)
  G520 := 0
   062d: SLDC 00          Short load constant 0
   062e: STR  01 0208     Store TOS to G520
  INITIALI.INITUNITABLE
   0632: CLP  07          Call local procedure INITIALI.INITUNITABLE
  FILLCHAR(DATASEGS,0,8,0)
   0634: LDA  01 0215     Load addr G533 (DATASEGS)
   0638: SLDC 00          Short load constant 0
   0639: SLDC 08          Short load constant 8
   063a: SLDC 00          Short load constant 0
   063b: CSP  0a          Call standard procedure FLCH
  INITIALI.INITCHARSET
   063d: CLP  02          Call local procedure INITIALI.INITCHARSET
  INITIALI.INITFILES
   063f: CLP  0a          Call local procedure INITIALI.INITFILES
  INITIALI.INITSYSCOM
   0641: CLP  03          Call local procedure INITIALI.INITSYSCOM
  GLOBALTITLE := ''
   0643: LDA  01 00ad     Load addr G173 (GLOBALTITLE)
   0647: LSA  00          Load string address: ''
   0649: NOP              No operation
   064a: SAS  17          String assign (TOS to TOS-1, 23 chars)
  G185 := ''
   064c: LDA  01 00b9     Load addr G185
   0650: NOP              No operation
   0651: LSA  00          Load string address: ''
   0653: SAS  50          String assign (TOS to TOS-1, 80 chars)
  PASCALSYS.CLEARSCREEN
   0655: CXP  00 1f       Call external procedure PASCALSYS.CLEARSCREEN
  TMPADDR := -16607 (0xBF21=VERSION)
   0658: LDCI 40df        Load word 16607
   065b: NGI              Negate integer
   065c: SRO  0132        Store global word BASE306 (TMPADDR)
  IF TMPADDR[0] <> 4 THEN
   065f: LDO  0132        Load global word BASE306 (TMPADDR)
   0662: SLDC 00          Short load constant 0
   0663: LDB              Load byte at byte ptr TOS-1 + TOS
   0664: SLDC 04          Short load constant 4
   0665: NEQI             Integer TOS-1 <> TOS
   0666: FJP  $06f0       Jump if TOS false
  BEGIN
    PASCALSY.FWRITELN(OUTPUT)
   0668: LOD  01 0003     Load word at G3 (OUTPUT)
   066b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
    IOC
   066e: CSP  00          Call standard procedure IOC
    PASCALSY.FWRITELN
   0670: LOD  01 0003     Load word at G3 (OUTPUT)
   0673: CXP  00 16       Call external procedure PASCALSY.FWRITELN
    IOC
   0676: CSP  00          Call standard procedure IOC
    PASCALSY.FWRITESTRING(OUTPUT,'Version 1.3 of SYSTEM.PASCAL cannot run',0)
   0678: LOD  01 0003     Load word at G3 (OUTPUT)
   067b: LSA  27          Load string address: 'Version 1.3 of SYSTEM.PASCAL cannot run'
   06a4: NOP              No operation
   06a5: SLDC 00          Short load constant 0
   06a6: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
    IOC
   06a9: CSP  00          Call standard procedure IOC
    PASCALSY.FWRITELN(OUTPUT)
   06ab: LOD  01 0003     Load word at G3 (OUTPUT)
   06ae: CXP  00 16       Call external procedure PASCALSY.FWRITELN
    IOC
   06b1: CSP  00          Call standard procedure IOC
    PASCALSY.FWRITESTRING(OUTPUT,'with a non-1.3 version of SYSTEM.APPLE',0)
   06b3: LOD  01 0003     Load word at G3 (OUTPUT)
   06b6: NOP              No operation
   06b7: LSA  26          Load string address: 'with a non-1.3 version of SYSTEM.APPLE'
   06df: SLDC 00          Short load constant 0
   06e0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
    IOC
   06e3: CSP  00          Call standard procedure IOC
    PASCALSY.FWRITELN(OUTPUT)
   06e5: LOD  01 0003     Load word at G3 (OUTPUT)
   06e8: CXP  00 16       Call external procedure PASCALSY.FWRITELN
    IOC
   06eb: CSP  00          Call standard procedure IOC
    REPEAT UNTIL FALSE
-> 06ed: SLDC 00          Short load constant 0
   06ee: FJP  $06ed       Jump if TOS false
  END
  TMPADDR := -16606 (0xBF22=FLAVOR)
-> 06f0: LDCI 40de        Load word 16606
   06f3: NGI              Negate integer
   06f4: SRO  0132        Store global word BASE306 (TMPADDR)
  IS128K := TMPADDR[6] (bit 6 is set if 128k version)
   06f7: LDO  0132        Load global word BASE306 (TMPADDR)
   06fa: SLDC 06          Short load constant 6
   06fb: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   06fe: LDP              Load packed field (TOS)
   06ff: SRO  0131        Store global word BASE305 (IS128K)
  IF NOT IS128K THEN
   0702: LDO  0131        Load global word BASE305 (IS128K)
   0705: LNOT             Logical NOT (~TOS)
   0706: FJP  $0794       Jump if TOS false
  BEGIN
    PASCALSY.FWRITELN(OUTPUT)
   0708: LOD  01 0003     Load word at G3 (OUTPUT)
   070b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
    IOC
   070e: CSP  00          Call standard procedure IOC
    PASCALSY.FWRITELN(OUTPUT)
   0710: LOD  01 0003     Load word at G3 (OUTPUT)
   0713: CXP  00 16       Call external procedure PASCALSY.FWRITELN
    IOC
   0716: CSP  00          Call standard procedure IOC
    PASCALSY.FWRITESTRING(OUTPUT,'The 128K version of SYSTEM.PASCAL cannot ',0)
   0718: LOD  01 0003     Load word at G3 (OUTPUT)
   071b: LSA  29          Load string address: 'The 128K version of SYSTEM.PASCAL cannot '
   0746: NOP              No operation
   0747: SLDC 00          Short load constant 0
   0748: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
    IOC
   074b: CSP  00          Call standard procedure IOC
    PASCALSY.FWRITELN(OUTPUT)
   074d: LOD  01 0003     Load word at G3 (OUTPUT)
   0750: CXP  00 16       Call external procedure PASCALSY.FWRITELN
    IOC
   0753: CSP  00          Call standard procedure IOC
    PASCALSY.FWRITESTRING(OUTPUT,'run with the 64K version of SYSTEM.APPLE',0)
   0755: LOD  01 0003     Load word at G3 (OUTPUT)
   0758: NOP              No operation
   0759: LSA  28          Load string address: 'run with the 64K version of SYSTEM.APPLE'
   0783: SLDC 00          Short load constant 0
   0784: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
    IOC
   0787: CSP  00          Call standard procedure IOC
    PASCALSY.FWRITELN(OUTPUT)
   0789: LOD  01 0003     Load word at G3 (OUTPUT)
   078c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
    IOC
   078f: CSP  00          Call standard procedure IOC
    REPEAT UNTIL FALSE
-> 0791: SLDC 00          Short load constant 0
   0792: FJP  $0791       Jump if TOS false
  END
  UNLOADSEGMENT(6)
-> 0794: SLDC 06          Short load constant 6
   0795: CSP  16          Call standard procedure UNLOADSEGMENT
  GOTO 3
   0797: UJP  $079e       Unconditional jump
  1:
  LOADSEGMENT(6)
-> 0799: SLDC 06          Short load constant 6
   079a: CSP  15          Call standard procedure LOADSEGMENT
  GOTO 2
   079c: UJP  $060c       Unconditional jump
  3:
-> 079e: RBP  00          Return from base procedure
END

### PROCEDURE INITIALI.INITCHARSET (* P=2 LL=1 *)
  MP1=FLAVOR
  MP2
  MP3=F:FIB
  MP43
  MP303:WINDOWP
BEGIN
  PASCALSY.FINIT(F,MP303,-1)
-> 0000: LLA  0003        Load local address MP3 (F)
   0002: LLA  012f        Load local address MP303
   0005: LDCI 0001        Load word 1
   0008: NGI              Negate integer
   0009: CXP  00 03       Call external procedure PASCALSY.FINIT
  FLAVOR := -16606 (0xBF22=FLAVOR)
   000c: LDCI 40de        Load word 16606
   000f: NGI              Negate integer
   0010: STL  0001        Store TOS into MP1 (FLAVOR)
  IF FLAVOR[0] > 127 THEN (bit 7 set, console output directed)
   0012: SLDL 01          Short load local MP1 (FLAVOR)
   0013: SLDC 00          Short load constant 0
   0014: LDB              Load byte at byte ptr TOS-1 + TOS
   0015: SLDC 7f          Short load constant 127
   0016: GRTI             Integer TOS-1 > TOS
   0017: FJP  $004d       Jump if TOS false
  BEGIN
    FOPEN(F,'SYSTEM.CHARSET',1,0)
   0019: LLA  0003        Load local address MP3 (F)
   001b: LSA  0e          Load string address: 'SYSTEM.CHARSET'
   002b: NOP              No operation
   002c: SLDC 01          Short load constant 1
   002d: SLDC 00          Short load constant 0
   002e: CXP  00 05       Call external procedure PASCALSY.FOPEN
    MP2 := 2048
   0031: LDCI 0800        Load word 2048
   0034: STL  0002        Store TOS into MP2
    MP43 := PASCALSY.FBLOCKIO(F,MP2,0,2,-1,TRUE)
   0036: LLA  0003        Load local address MP3 (F)
   0038: SLDL 02          Short load local MP2
   0039: SLDC 00          Short load constant 0
   003a: SLDC 02          Short load constant 2
   003b: LDCI 0001        Load word 1
   003e: NGI              Negate integer
   003f: SLDC 01          Short load constant 1
   0040: SLDC 00          Short load constant 0
   0041: SLDC 00          Short load constant 0
   0042: CXP  00 1c       Call external procedure PASCALSY.FBLOCKIO
   0045: STL  002b        Store TOS into MP43
    PASCALSY.FCLOSE(F,0)
   0047: LLA  0003        Load local address MP3 (F)
   0049: SLDC 00          Short load constant 0
   004a: CXP  00 06       Call external procedure PASCALSY.FCLOSE
  END
  PASCALSY.FCLOSE(F,0)
-> 004d: LLA  0003        Load local address MP3 (F)
   004f: SLDC 00          Short load constant 0
   0050: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0053: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.INITSYSCOM (* P=3 LL=1 *)
  BASE15=FILEMISCINFO:FIB
  BASE20
  BASE22
  BASE31
  MP1=TITLE:STRING
  MP13
  MP42
  MP43
  MP44
  MP50
  MP253
  MP254=SYSCOM_C
  MP255
  MP256
BEGIN
  INITIALI.INIT_FILLER(FILLER)
-> 00e0: LDA  02 0019     Load addr G25 (FILLER)
   00e3: CLP  04          Call local procedure INITIALI.INIT_FILLER
   00e5: LDA  02 0014     Load addr G20 (IPOT)
   00e8: SLDC 00          Short load constant 0
   00e9: IXA  01          Index array (TOS-1 + TOS * 1)
   00eb: SLDC 01          Short load constant 1
   00ec: STO              Store indirect (TOS into TOS-1)
   00ed: LDA  02 0014     Load addr G20 (IPOT)
   00f0: SLDC 01          Short load constant 1
   00f1: IXA  01          Index array (TOS-1 + TOS * 1)
   00f3: SLDC 0a          Short load constant 10
   00f4: STO              Store indirect (TOS into TOS-1)
   00f5: LDA  02 0014     Load addr G20 (IPOT)
   00f8: SLDC 02          Short load constant 2
   00f9: IXA  01          Index array (TOS-1 + TOS * 1)
   00fb: SLDC 64          Short load constant 100
   00fc: STO              Store indirect (TOS into TOS-1)
   00fd: LDA  02 0014     Load addr G20 (IPOT)
   0100: SLDC 03          Short load constant 3
   0101: IXA  01          Index array (TOS-1 + TOS * 1)
   0103: LDCI 03e8        Load word 1000
   0106: STO              Store indirect (TOS into TOS-1)
   0107: LDA  02 0014     Load addr G20 (IPOT)
   010a: SLDC 04          Short load constant 4
   010b: IXA  01          Index array (TOS-1 + TOS * 1)
   010d: LDCI 2710        Load word 10000
   0110: STO              Store indirect (TOS into TOS-1)
   0111: LLA  0001        Load local address MP1 (TITLE)
   0113: LSA  10          Load string address: '*SYSTEM.MISCINFO'
   0125: NOP              No operation
   0126: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0128: LAO  0f          Load global BASE15 (FILEMISCINFO)
   012a: LDCN             Load constant NIL
   012b: SLDC 01          Short load constant 1
   012c: NGI              Negate integer
   012d: CXP  06 02       Call external procedure SYSIO.FINIT
   0130: LAO  0f          Load global BASE15 (FILEMISCINFO)
   0132: LLA  0001        Load local address MP1 (TITLE)
   0134: SLDC 01          Short load constant 1
   0135: LDCN             Load constant NIL
   0136: CXP  06 04       Call external procedure SYSIO.FOPEN
   0139: LDO  14          Load global word BASE20 (FILEMISCINFO.FISOPEN)
   013b: FJP  $0178       Jump if TOS false
   013d: LDO  16          Load global word BASE22 (FILEMISCINFO.FUNIT)
   013f: LLA  000d        Load local address MP13
   0141: SLDC 00          Short load constant 0
   0142: LDCI 01e0        Load word 480
   0145: LDO  1f          Load global word BASE31 (FILEMISCINFO.FHEADER.DFIRSTBLK)
   0147: SLDC 00          Short load constant 0
   0148: CSP  05          Call standard procedure UNITREAD
   014a: LOD  02 0001     Load word at G1 (SYSCOM)
   014d: STL  00fe        Store TOS into MP254 (SYSCOM_C)
   0150: LDL  00fe        Load local word MP254 (SYSCOM_C)
   0153: INCP 1d          Inc field ptr (TOS+29) (MISCINFO)
   0155: LLA  002a        Load local address MP42
   0157: MOV  01          Move 1 words (TOS to TOS-1)
   0159: LDL  00fe        Load local word MP254 (SYSCOM_C)
   015c: INCP 1e          Inc field ptr (TOS+30) (CRTTYPE)
   015e: LDL  002b        Load local word MP43
   0160: STO              Store indirect (TOS into TOS-1)
   0161: LDL  00fe        Load local word MP254 (SYSCOM_C)
   0164: INCP 1f          Inc field ptr (TOS+31) (CRTCTL)
   0166: LLA  002c        Load local address MP44
   0168: MOV  06          Move 6 words (TOS to TOS-1)
   016a: LDL  00fe        Load local word MP254 (SYSCOM_C)
   016d: INCP 25          Inc field ptr (TOS+37) (CRTINFO)
   016f: LLA  0032        Load local address MP50
   0171: MOV  0b          Move 11 words (TOS to TOS-1)
  INITIALI.INIT_FILLER(FILLER)
   0173: LDA  02 0019     Load addr G25 (FILLER)
   0176: CLP  04          Call local procedure INITIALI.INIT_FILLER
-> 0178: LAO  0f          Load global BASE15 (FILEMISCINFO)
   017a: SLDC 00          Short load constant 0
   017b: CXP  06 05       Call external procedure SYSIO.FCLOSE
   017e: SLDC 01          Short load constant 1
   017f: CSP  26          Call standard procedure UNITCLEAR
   0181: LOD  02 0001     Load word at G1 (SYSCOM)
   0184: STL  00fe        Store TOS into MP254 (SYSCOM_C)
   0187: LDL  00fe        Load local word MP254 (SYSCOM_C)
   018a: INCP 01          Inc field ptr (TOS+1) (XERRCD)
   018c: SLDC 00          Short load constant 0
   018d: STO              Store indirect (TOS into TOS-1)
   018e: LDL  00fe        Load local word MP254 (SYSCOM_C)
   0191: SLDC 00          Short load constant 0
   0192: STO              Store indirect (TOS into TOS-1)
   0193: LDL  00fe        Load local word MP254 (SYSCOM_C)
   0196: INCP 03          Inc field ptr (TOS+3) (BUGSTA)
   0198: SLDC 00          Short load constant 0
   0199: STO              Store indirect (TOS into TOS-1)
   019a: LDL  00fe        Load local word MP254 (SYSCOM_C)
   019d: INCP 25          Inc field ptr (TOS+37) (CRTINFO)
   019f: STL  00ff        Store TOS into MP255
   01a2: SLDC 00          Short load constant 0
   01a3: STL  00fd        Store TOS into MP253
   01a6: LDCI 00ff        Load word 255
   01a9: STL  0100        Store TOS into MP256
-> 01ac: LDL  00fd        Load local word MP253
   01af: LDL  0100        Load local word MP256
   01b2: LEQI             Integer TOS-1 <= TOS
   01b3: FJP  $01cb       Jump if TOS false
   01b5: LDA  02 009d     Load addr G157
   01b9: LDL  00fd        Load local word MP253
   01bc: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   01bf: SLDC 00          Short load constant 0
   01c0: STP              Store packed field (TOS into TOS-1)
   01c1: LDL  00fd        Load local word MP253
   01c4: SLDC 01          Short load constant 1
   01c5: ADI              Add integers (TOS + TOS-1)
   01c6: STL  00fd        Store TOS into MP253
   01c9: UJP  $01ac       Unconditional jump
-> 01cb: LDA  02 009d     Load addr G157
   01cf: LDL  00ff        Load local word MP255
   01d2: INCP 08          Inc field ptr (TOS+8)
   01d4: SLDC 08          Short load constant 8
   01d5: SLDC 00          Short load constant 0
   01d6: LDP              Load packed field (TOS)
   01d7: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   01da: SLDC 01          Short load constant 1
   01db: STP              Store packed field (TOS into TOS-1)
   01dc: SLDC 00          Short load constant 0
   01dd: LDL  00ff        Load local word MP255
   01e0: INCP 03          Inc field ptr (TOS+3)
   01e2: SLDC 08          Short load constant 8
   01e3: SLDC 08          Short load constant 8
   01e4: LDP              Load packed field (TOS)
   01e5: CLP  06          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01e7: SLDC 01          Short load constant 1
   01e8: LDL  00ff        Load local word MP255
   01eb: INCP 03          Inc field ptr (TOS+3)
   01ed: SLDC 08          Short load constant 8
   01ee: SLDC 00          Short load constant 0
   01ef: LDP              Load packed field (TOS)
   01f0: CLP  06          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01f2: SLDC 03          Short load constant 3
   01f3: LDL  00ff        Load local word MP255
   01f6: INCP 02          Inc field ptr (TOS+2)
   01f8: SLDC 08          Short load constant 8
   01f9: SLDC 08          Short load constant 8
   01fa: LDP              Load packed field (TOS)
   01fb: CLP  06          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01fd: SLDC 02          Short load constant 2
   01fe: LDL  00ff        Load local word MP255
   0201: INCP 02          Inc field ptr (TOS+2)
   0203: SLDC 08          Short load constant 8
   0204: SLDC 00          Short load constant 0
   0205: LDP              Load packed field (TOS)
   0206: CLP  06          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0208: SLDC 0b          Short load constant 11
   0209: LDL  00ff        Load local word MP255
   020c: INCP 06          Inc field ptr (TOS+6)
   020e: SLDC 08          Short load constant 8
   020f: SLDC 00          Short load constant 0
   0210: LDP              Load packed field (TOS)
   0211: CLP  06          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0213: SLDC 08          Short load constant 8
   0214: LDL  00ff        Load local word MP255
   0217: INCP 04          Inc field ptr (TOS+4)
   0219: SLDC 08          Short load constant 8
   021a: SLDC 00          Short load constant 0
   021b: LDP              Load packed field (TOS)
   021c: CLP  06          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   021e: SLDC 09          Short load constant 9
   021f: LDL  00ff        Load local word MP255
   0222: INCP 07          Inc field ptr (TOS+7)
   0224: SLDC 08          Short load constant 8
   0225: SLDC 08          Short load constant 8
   0226: LDP              Load packed field (TOS)
   0227: CLP  06          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0229: SLDC 0a          Short load constant 10
   022a: LDL  00ff        Load local word MP255
   022d: INCP 07          Inc field ptr (TOS+7)
   022f: SLDC 08          Short load constant 8
   0230: SLDC 00          Short load constant 0
   0231: LDP              Load packed field (TOS)
   0232: CLP  06          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0234: SLDC 0d          Short load constant 13
   0235: LDL  00ff        Load local word MP255
   0238: IND  09          Static index and load word (TOS+9)
   023a: CLP  06          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   023c: SLDC 0c          Short load constant 12
   023d: LDL  00ff        Load local word MP255
   0240: INCP 08          Inc field ptr (TOS+8)
   0242: SLDC 08          Short load constant 8
   0243: SLDC 08          Short load constant 8
   0244: LDP              Load packed field (TOS)
   0245: CLP  06          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0247: LDL  00fe        Load local word MP254 (SYSCOM_C)
   024a: INCP 1f          Inc field ptr (TOS+31)
   024c: STL  00ff        Store TOS into MP255
   024f: SLDC 00          Short load constant 0
   0250: LDL  00ff        Load local word MP255
   0253: INCP 02          Inc field ptr (TOS+2)
   0255: SLDC 08          Short load constant 8
   0256: SLDC 08          Short load constant 8
   0257: LDP              Load packed field (TOS)
   0258: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   025a: SLDC 01          Short load constant 1
   025b: LDL  00ff        Load local word MP255
   025e: INCP 02          Inc field ptr (TOS+2)
   0260: SLDC 08          Short load constant 8
   0261: SLDC 00          Short load constant 0
   0262: LDP              Load packed field (TOS)
   0263: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0265: SLDC 02          Short load constant 2
   0266: LDL  00ff        Load local word MP255
   0269: INCP 01          Inc field ptr (TOS+1)
   026b: SLDC 08          Short load constant 8
   026c: SLDC 08          Short load constant 8
   026d: LDP              Load packed field (TOS)
   026e: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0270: SLDC 04          Short load constant 4
   0271: LDL  00ff        Load local word MP255
   0274: SLDC 08          Short load constant 8
   0275: SLDC 08          Short load constant 8
   0276: LDP              Load packed field (TOS)
   0277: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0279: SLDC 03          Short load constant 3
   027a: LDL  00ff        Load local word MP255
   027d: INCP 01          Inc field ptr (TOS+1)
   027f: SLDC 08          Short load constant 8
   0280: SLDC 00          Short load constant 0
   0281: LDP              Load packed field (TOS)
   0282: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0284: SLDC 05          Short load constant 5
   0285: LDL  00ff        Load local word MP255
   0288: INCP 03          Inc field ptr (TOS+3)
   028a: SLDC 08          Short load constant 8
   028b: SLDC 00          Short load constant 0
   028c: LDP              Load packed field (TOS)
   028d: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   028f: SLDC 06          Short load constant 6
   0290: LDL  00ff        Load local word MP255
   0293: INCP 04          Inc field ptr (TOS+4)
   0295: SLDC 08          Short load constant 8
   0296: SLDC 08          Short load constant 8
   0297: LDP              Load packed field (TOS)
   0298: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   029a: SLDC 07          Short load constant 7
   029b: LDL  00ff        Load local word MP255
   029e: INCP 04          Inc field ptr (TOS+4)
   02a0: SLDC 08          Short load constant 8
   02a1: SLDC 00          Short load constant 0
   02a2: LDP              Load packed field (TOS)
   02a3: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   02a5: LDA  02 009d     Load addr G157
   02a9: LDL  00ff        Load local word MP255
   02ac: SLDC 08          Short load constant 8
   02ad: SLDC 00          Short load constant 0
   02ae: LDP              Load packed field (TOS)
   02af: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   02b2: SLDC 01          Short load constant 1
   02b3: STP              Store packed field (TOS into TOS-1)
   02b4: SLDC 00          Short load constant 0
   02b5: STL  00fd        Store TOS into MP253
   02b8: SLDC 1f          Short load constant 31
   02b9: STL  0100        Store TOS into MP256
-> 02bc: LDL  00fd        Load local word MP253
   02bf: LDL  0100        Load local word MP256
   02c2: LEQI             Integer TOS-1 <= TOS
   02c3: FJP  $02db       Jump if TOS false
   02c5: LDA  02 009d     Load addr G157
   02c9: LDL  00fd        Load local word MP253
   02cc: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   02cf: SLDC 01          Short load constant 1
   02d0: STP              Store packed field (TOS into TOS-1)
   02d1: LDL  00fd        Load local word MP253
   02d4: SLDC 01          Short load constant 1
   02d5: ADI              Add integers (TOS + TOS-1)
   02d6: STL  00fd        Store TOS into MP253
   02d9: UJP  $02bc       Unconditional jump
-> 02db: LDA  02 009d     Load addr G157
   02df: SLDC 0d          Short load constant 13
   02e0: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   02e3: SLDC 00          Short load constant 0
   02e4: STP              Store packed field (TOS into TOS-1)
   02e5: LDA  02 009d     Load addr G157
   02e9: SLDC 07          Short load constant 7
   02ea: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   02ed: SLDC 00          Short load constant 0
   02ee: STP              Store packed field (TOS into TOS-1)
   02ef: LDA  02 020d     Load addr G525
   02f3: LSA  03          Load string address: '   '
   02f8: NOP              No operation
   02f9: SAS  06          String assign (TOS to TOS-1, 6 chars)
   02fb: LDL  00ff        Load local word MP255
   02fe: INCP 05          Inc field ptr (TOS+5)
   0300: SLDC 05          Short load constant 5
   0301: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0304: LDP              Load packed field (TOS)
   0305: FJP  $0315       Jump if TOS false
   0307: LDA  02 020d     Load addr G525
   030b: SLDC 01          Short load constant 1
   030c: LDL  00ff        Load local word MP255
   030f: SLDC 08          Short load constant 8
   0310: SLDC 00          Short load constant 0
   0311: LDP              Load packed field (TOS)
   0312: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0313: UJP  $031c       Unconditional jump
-> 0315: LDA  02 020d     Load addr G525
   0319: SLDC 01          Short load constant 1
   031a: SLDC 00          Short load constant 0
   031b: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 031c: LDA  02 020d     Load addr G525
   0320: SLDC 02          Short load constant 2
   0321: LDL  00ff        Load local word MP255
   0324: INCP 03          Inc field ptr (TOS+3)
   0326: SLDC 08          Short load constant 8
   0327: SLDC 00          Short load constant 0
   0328: LDP              Load packed field (TOS)
   0329: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   032a: LDA  02 020d     Load addr G525
   032e: SLDC 00          Short load constant 0
   032f: STL  0100        Store TOS into MP256
   0332: LLA  0100        Load local address MP256
   0335: LDA  02 020d     Load addr G525
   0339: SLDC 06          Short load constant 6
   033a: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   033d: LLA  0100        Load local address MP256
   0340: LDA  02 020d     Load addr G525
   0344: SLDC 0c          Short load constant 12
   0345: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0348: LLA  0100        Load local address MP256
   034b: SAS  06          String assign (TOS to TOS-1, 6 chars)
   034d: LDA  02 020d     Load addr G525
   0351: SLDC 00          Short load constant 0
   0352: SLDC 05          Short load constant 5
   0353: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0354: LDA  02 0209     Load addr G521
   0358: LDA  02 020d     Load addr G525
   035c: SAS  06          String assign (TOS to TOS-1, 6 chars)
   035e: LDL  00ff        Load local word MP255
   0361: INCP 01          Inc field ptr (TOS+1)
   0363: SLDC 08          Short load constant 8
   0364: SLDC 08          Short load constant 8
   0365: LDP              Load packed field (TOS)
   0366: SLDC 00          Short load constant 0
   0367: NEQI             Integer TOS-1 <> TOS
   0368: FJP  $0371       Jump if TOS false
   036a: LDA  02 0209     Load addr G521
   036e: SLDC 00          Short load constant 0
   036f: SLDC 02          Short load constant 2
   0370: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0371: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.INIT_FILLER(FILLER:STRING) (* P=4 LL=2 *)
  MP1=FILLER:STRING
  MP2
BEGIN
-> 0060: LOD  03 0001     Load word at G1 (SYSCOM)
   0063: INCP 1f          Inc field ptr (TOS+31)
   0065: STL  0002        Store TOS into MP2
   0067: SLDL 02          Short load local MP2
   0068: INCP 03          Inc field ptr (TOS+3)
   006a: SLDC 08          Short load constant 8
   006b: SLDC 08          Short load constant 8
   006c: LDP              Load packed field (TOS)
   006d: SLDC 0b          Short load constant 11
   006e: GRTI             Integer TOS-1 > TOS
   006f: FJP  $0078       Jump if TOS false
   0071: SLDL 02          Short load local MP2
   0072: INCP 03          Inc field ptr (TOS+3)
   0074: SLDC 08          Short load constant 8
   0075: SLDC 08          Short load constant 8
   0076: SLDC 0b          Short load constant 11
   0077: STP              Store packed field (TOS into TOS-1)
-> 0078: SLDL 01          Short load local MP1
   0079: SLDC 00          Short load constant 0
   007a: SLDL 02          Short load local MP2
   007b: INCP 03          Inc field ptr (TOS+3)
   007d: SLDC 08          Short load constant 8
   007e: SLDC 08          Short load constant 8
   007f: LDP              Load packed field (TOS)
   0080: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0081: SLDL 01          Short load local MP1
   0082: SLDC 01          Short load constant 1
   0083: SLDL 02          Short load local MP2
   0084: INCP 03          Inc field ptr (TOS+3)
   0086: SLDC 08          Short load constant 8
   0087: SLDC 08          Short load constant 8
   0088: LDP              Load packed field (TOS)
   0089: SLDC 00          Short load constant 0
   008a: CSP  0a          Call standard procedure FLCH
-> 008c: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.SETPREFIXEDCRTCTL(WHICH:INTEGER;COMMANDCHAR:CHAR) (* P=5 LL=2 *)
  MP1=COMMANDCHAR:CHAR
  MP2=WHICH:INTEGER
BEGIN
-> 0098: LOD  03 0001     Load word at G1 (SYSCOM)
   009b: INCP 24          Inc field ptr (TOS+36)
   009d: SLDL 02          Short load local MP2
   009e: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   00a1: LDP              Load packed field (TOS)
   00a2: LNOT             Logical NOT (~TOS)
   00a3: FJP  $00af       Jump if TOS false
   00a5: LDA  03 009d     Load addr G157
   00a9: SLDL 01          Short load local MP1
   00aa: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   00ad: SLDC 01          Short load constant 1
   00ae: STP              Store packed field (TOS into TOS-1)
-> 00af: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.SETPREFIXEDCRTINFO(WHICH:INTEGER;COMMANDCHAR:CHAR) (* P=6 LL=2 *)
  MP1=COMMANDCHAR:CHAR
  MP2=WHICH:INTEGER
BEGIN
-> 00bc: LOD  03 0001     Load word at G1 (SYSCOM)
   00bf: INCP 2f          Inc field ptr (TOS+47)
   00c1: SLDL 02          Short load local MP2
   00c2: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   00c5: LDP              Load packed field (TOS)
   00c6: LNOT             Logical NOT (~TOS)
   00c7: FJP  $00d3       Jump if TOS false
   00c9: LDA  03 009d     Load addr G157
   00cd: SLDL 01          Short load local MP1
   00ce: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   00d1: SLDC 01          Short load constant 1
   00d2: STP              Store packed field (TOS into TOS-1)
-> 00d3: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.INITUNITABLE (* P=7 LL=1 *)
  BASE1
  BASE14
  BASE15
  BASE20
  MP1
  MP2
  MP3
  MP4
  MP5
BEGIN
-> 03a6: LAO  0f          Load global BASE15
   03a8: LDCN             Load constant NIL
   03a9: SLDC 01          Short load constant 1
   03aa: NGI              Negate integer
   03ab: CXP  06 02       Call external procedure SYSIO.FINIT
   03ae: SLDC 00          Short load constant 0
   03af: STL  0001        Store TOS into MP1
   03b1: SLDC 14          Short load constant 20
   03b2: STL  0003        Store TOS into MP3
-> 03b4: SLDL 01          Short load local MP1
   03b5: SLDL 03          Short load local MP3
   03b6: LEQI             Integer TOS-1 <= TOS
   03b7: FJP  $0499       Jump if TOS false
   03b9: LDA  02 001f     Load addr G31 (UNITABLE)
   03bc: SLDL 01          Short load local MP1
   03bd: IXA  06          Index array (TOS-1 + TOS * 6)
   03bf: STL  0004        Store TOS into MP4
   03c1: SLDL 04          Short load local MP4
   03c2: NOP              No operation
   03c3: LSA  00          Load string address: ''
   03c5: SAS  07          String assign (TOS to TOS-1, 7 chars)
   03c7: SLDL 04          Short load local MP4
   03c8: INCP 04          Inc field ptr (TOS+4)
   03ca: SLDL 01          Short load local MP1
   03cb: SLDC 04          Short load constant 4
   03cc: EQUI             Integer TOS-1 = TOS
   03cd: SLDL 01          Short load local MP1
   03ce: SLDC 05          Short load constant 5
   03cf: EQUI             Integer TOS-1 = TOS
   03d0: LOR              Logical OR (TOS | TOS-1)
   03d1: SLDL 01          Short load local MP1
   03d2: SLDC 09          Short load constant 9
   03d3: GEQI             Integer TOS-1 >= TOS
   03d4: SLDL 01          Short load local MP1
   03d5: SLDC 14          Short load constant 20
   03d6: LEQI             Integer TOS-1 <= TOS
   03d7: LAND             Logical AND (TOS & TOS-1)
   03d8: LOR              Logical OR (TOS | TOS-1)
   03d9: STO              Store indirect (TOS into TOS-1)
   03da: SLDL 04          Short load local MP4
   03db: SIND 04          Short index load *TOS+4
   03dc: FJP  $0492       Jump if TOS false
   03de: SLDL 04          Short load local MP4
   03df: INCP 05          Inc field ptr (TOS+5)
   03e1: LDCI 7fff        Load word 32767
   03e4: STO              Store indirect (TOS into TOS-1)
   03e5: LOD  02 0208     Load word at G520
   03e9: LNOT             Logical NOT (~TOS)
   03ea: SLDL 01          Short load local MP1
   03eb: SLDC 04          Short load constant 4
   03ec: EQUI             Integer TOS-1 = TOS
   03ed: LOR              Logical OR (TOS | TOS-1)
   03ee: FJP  $0492       Jump if TOS false
   03f0: SLDL 01          Short load local MP1
   03f1: CSP  26          Call standard procedure UNITCLEAR
   03f3: CSP  22          Call standard procedure IORESULT
   03f5: SLDC 00          Short load constant 0
   03f6: EQUI             Integer TOS-1 = TOS
   03f7: FJP  $0492       Jump if TOS false
   03f9: SLDL 01          Short load local MP1
   03fa: SLDC 00          Short load constant 0
   03fb: SLDC 00          Short load constant 0
   03fc: CXP  06 09       Call external procedure SYSIO.9
   03ff: FJP  $0492       Jump if TOS false
   0401: SLDL 04          Short load local MP4
   0402: LOD  02 0001     Load word at G1 (SYSCOM)
   0405: SIND 04          Short index load *TOS+4
   0406: SLDC 00          Short load constant 0
   0407: IXA  0d          Index array (TOS-1 + TOS * 13)
   0409: INCP 03          Inc field ptr (TOS+3)
   040b: SAS  07          String assign (TOS to TOS-1, 7 chars)
   040d: SLDL 01          Short load local MP1
   040e: LOD  02 0001     Load word at G1 (SYSCOM)
   0411: SIND 02          Short index load *TOS+2
   0412: EQUI             Integer TOS-1 = TOS
   0413: FJP  $0492       Jump if TOS false
   0415: LDA  02 000e     Load addr G14 (SYVID)
   0418: SLDL 04          Short load local MP4
   0419: SAS  07          String assign (TOS to TOS-1, 7 chars)
   041b: LAO  01          Load global BASE1
   041d: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   042e: NOP              No operation
   042f: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0431: LAO  0f          Load global BASE15
   0433: LAO  01          Load global BASE1
   0435: SLDC 01          Short load constant 1
   0436: LDCN             Load constant NIL
   0437: CXP  06 04       Call external procedure SYSIO.FOPEN
   043a: LDO  14          Load global word BASE20
   043c: SRO  0e          Store global word BASE14
   043e: LAO  0f          Load global BASE15
   0440: SLDC 00          Short load constant 0
   0441: CXP  06 05       Call external procedure SYSIO.FCLOSE
   0444: LDA  02 000e     Load addr G14 (SYVID)
   0447: SLDC 00          Short load constant 0
   0448: LLA  0002        Load local address MP2
   044a: SLDC 00          Short load constant 0
   044b: SLDC 00          Short load constant 0
   044c: CXP  06 06       Call external procedure SYSIO.6
   044f: STL  0001        Store TOS into MP1
   0451: SLDL 02          Short load local MP2
   0452: LDCN             Load constant NIL
   0453: EQUI             Integer TOS-1 = TOS
   0454: FJP  $0458       Jump if TOS false
   0456: CSP  27          Call standard procedure HALT
-> 0458: LDA  02 0012     Load addr G18
   045b: SLDL 02          Short load local MP2
   045c: SLDC 00          Short load constant 0
   045d: IXA  0d          Index array (TOS-1 + TOS * 13)
   045f: INCP 0a          Inc field ptr (TOS+10)
   0461: MOV  01          Move 1 words (TOS to TOS-1)
   0463: SLDL 02          Short load local MP2
   0464: SLDC 00          Short load constant 0
   0465: IXA  0d          Index array (TOS-1 + TOS * 13)
   0467: INCP 0c          Inc field ptr (TOS+12)
   0469: STL  0005        Store TOS into MP5
   046b: SLDL 05          Short load local MP5
   046c: SLDC 07          Short load constant 7
   046d: SLDC 09          Short load constant 9
   046e: LDP              Load packed field (TOS)
   046f: STR  02 00e4     Store TOS to G228
   0473: SLDL 05          Short load local MP5
   0474: SLDC 07          Short load constant 7
   0475: SLDC 09          Short load constant 9
   0476: LDP              Load packed field (TOS)
   0477: SLDC 02          Short load constant 2
   0478: DVI              Divide integers (TOS-1 / TOS)
   0479: STR  02 0208     Store TOS to G520
   047d: SLDL 05          Short load local MP5
   047e: SLDC 07          Short load constant 7
   047f: SLDC 09          Short load constant 9
   0480: LDP              Load packed field (TOS)
   0481: SLDC 08          Short load constant 8
   0482: DVI              Divide integers (TOS-1 / TOS)
   0483: STR  02 00e3     Store TOS to G227
   0487: LOD  02 00e3     Load word at G227
   048b: FJP  $0492       Jump if TOS false
   048d: SLDC 01          Short load constant 1
   048e: STR  02 00e4     Store TOS to G228
-> 0492: SLDL 01          Short load local MP1
   0493: SLDC 01          Short load constant 1
   0494: ADI              Add integers (TOS + TOS-1)
   0495: STL  0001        Store TOS into MP1
   0497: UJP  $03b4       Unconditional jump
-> 0499: LOD  02 00e5     Load word at G229 (JUSTBOOTED)
   049d: FJP  $04a7       Jump if TOS false
   049f: LDA  02 000a     Load addr G10
   04a2: LDA  02 000e     Load addr G14 (SYVID)
   04a5: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 04a7: SLDC 01          Short load constant 1
   04a8: NOP              No operation
   04a9: LSA  07          Load string address: 'CONSOLE'
   04b2: CLP  08          Call local procedure INITIALI.8
   04b4: SLDC 02          Short load constant 2
   04b5: LSA  07          Load string address: 'SYSTERM'
   04be: NOP              No operation
   04bf: CLP  08          Call local procedure INITIALI.8
   04c1: SLDC 03          Short load constant 3
   04c2: NOP              No operation
   04c3: LSA  07          Load string address: 'GRAPHIC'
   04cc: CLP  08          Call local procedure INITIALI.8
   04ce: SLDC 06          Short load constant 6
   04cf: LSA  07          Load string address: 'PRINTER'
   04d8: NOP              No operation
   04d9: CLP  08          Call local procedure INITIALI.8
   04db: SLDC 07          Short load constant 7
   04dc: NOP              No operation
   04dd: LSA  05          Load string address: 'REMIN'
   04e4: CLP  08          Call local procedure INITIALI.8
   04e6: SLDC 08          Short load constant 8
   04e7: LSA  06          Load string address: 'REMOUT'
   04ef: NOP              No operation
   04f0: CLP  08          Call local procedure INITIALI.8
-> 04f2: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC8(PARAM1; PARAM2) (* P=8 LL=2 *)
  MP1=PARAM2
  MP2=PARAM1
  MP3
BEGIN
-> 0382: LLA  0003        Load local address MP3
   0384: SLDL 01          Short load local MP1
   0385: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0387: SLDL 02          Short load local MP2
   0388: CSP  26          Call standard procedure UNITCLEAR
   038a: CSP  22          Call standard procedure IORESULT
   038c: SLDC 00          Short load constant 0
   038d: EQUI             Integer TOS-1 = TOS
   038e: FJP  $039a       Jump if TOS false
   0390: LDA  03 001f     Load addr G31 (UNITABLE)
   0393: SLDL 02          Short load local MP2
   0394: IXA  06          Index array (TOS-1 + TOS * 6)
   0396: LLA  0003        Load local address MP3
   0398: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 039a: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC9 (* P=9 LL=1 *)
  MP1
BEGIN
-> 050a: LOD  02 0001     Load word at G1 (SYSCOM)
   050d: INCP 04          Inc field ptr (TOS+4)
   050f: LDCN             Load constant NIL
   0510: STO              Store indirect (TOS into TOS-1)
   0511: LDA  02 0006     Load addr G6 (SWAPFIB)
   0514: SLDC 1e          Short load constant 30
   0515: CSP  01          Call standard procedure NEW
   0517: LOD  02 0006     Load word at G6 (SWAPFIB)
   051a: LDCN             Load constant NIL
   051b: SLDC 01          Short load constant 1
   051c: NGI              Negate integer
   051d: CXP  06 02       Call external procedure SYSIO.FINIT
   0520: LDA  02 0009     Load addr G9 (INPUTFIB)
   0523: SLDC 1e          Short load constant 30
   0524: CSP  01          Call standard procedure NEW
   0526: LLA  0001        Load local address MP1
   0528: SLDC 01          Short load constant 1
   0529: CSP  01          Call standard procedure NEW
   052b: LOD  02 0009     Load word at G9 (INPUTFIB)
   052e: SLDL 01          Short load local MP1
   052f: SLDC 00          Short load constant 0
   0530: CXP  06 02       Call external procedure SYSIO.FINIT
   0533: LDA  02 0008     Load addr G8
   0536: SLDC 1e          Short load constant 30
   0537: CSP  01          Call standard procedure NEW
   0539: LLA  0001        Load local address MP1
   053b: SLDC 01          Short load constant 1
   053c: CSP  01          Call standard procedure NEW
   053e: LOD  02 0008     Load word at G8
   0541: SLDL 01          Short load local MP1
   0542: SLDC 00          Short load constant 0
   0543: CXP  06 02       Call external procedure SYSIO.FINIT
   0546: LDA  02 0007     Load addr G7 (SYSTERMFIB)
   0549: SLDC 1e          Short load constant 30
   054a: CSP  01          Call standard procedure NEW
   054c: LLA  0001        Load local address MP1
   054e: SLDC 01          Short load constant 1
   054f: CSP  01          Call standard procedure NEW
   0551: LOD  02 0007     Load word at G7 (SYSTERMFIB)
   0554: SLDL 01          Short load local MP1
   0555: SLDC 00          Short load constant 0
   0556: CXP  06 02       Call external procedure SYSIO.FINIT
   0559: LDA  02 0002     Load addr G2 (INPUT)
   055c: SLDC 00          Short load constant 0
   055d: IXA  01          Index array (TOS-1 + TOS * 1)
   055f: LOD  02 0009     Load word at G9 (INPUTFIB)
   0562: STO              Store indirect (TOS into TOS-1)
   0563: LDA  02 0002     Load addr G2 (INPUT)
   0566: SLDC 01          Short load constant 1
   0567: IXA  01          Index array (TOS-1 + TOS * 1)
   0569: LOD  02 0008     Load word at G8
   056c: STO              Store indirect (TOS into TOS-1)
   056d: LDA  02 0005     Load addr G5 (EMPTYHEAP)
   0570: CSP  20          Call standard procedure MARK
-> 0572: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.INITFILES (* P=10 LL=1 *)
  BASE1=LTITLE:STRING[40]
BEGIN
  SYSIO.FCLOSE(SWAPFIB,0)
-> 057e: LOD  02 0006     Load word at G6 (SWAPFIB)
   0581: SLDC 00          Short load constant 0
   0582: CXP  06 05       Call external procedure SYSIO.FCLOSE
  SYSIO.FINIT(G230,NIL,-1)
   0585: LDA  02 00e6     Load addr G230
   0589: LDCN             Load constant NIL
   058a: SLDC 01          Short load constant 1
   058b: NGI              Negate integer
   058c: CXP  06 02       Call external procedure SYSIO.FINIT
  SYSIO.FCLOSE(INPUTFIB,0)
   058f: LOD  02 0009     Load word at G9 (INPUTFIB)
   0592: SLDC 00          Short load constant 0
   0593: CXP  06 05       Call external procedure SYSIO.FCLOSE
  SYSIO.FCLOSE(OUTPUTFIB,0)
   0596: LOD  02 0008     Load word at G8 (OUTPUTFIB)
   0599: SLDC 00          Short load constant 0
   059a: CXP  06 05       Call external procedure SYSIO.FCLOSE
  LTITLE := 'CONSOLE:'
   059d: LAO  01          Load global BASE1 (LTITLE)
   059f: LSA  08          Load string address: 'CONSOLE:'
   05a9: NOP              No operation
   05aa: SAS  17          String assign (TOS to TOS-1, 23 chars)
  SYSIO.FOPEN(INPUTFIB,LTITLE,1,NIL)
   05ac: LOD  02 0009     Load word at G9 (INPUTFIB)
   05af: LAO  01          Load global BASE1 (LTITLE)
   05b1: SLDC 01          Short load constant 1
   05b2: LDCN             Load constant NIL
   05b3: CXP  06 04       Call external procedure SYSIO.FOPEN
  SYSIO.FOPEN(OUTPUTFIB,LTITLE,1,NIL)
   05b6: LOD  02 0008     Load word at G8 (OUTPUTFIB)
   05b9: LAO  01          Load global BASE1 (LTITLE)
   05bb: SLDC 01          Short load constant 1
   05bc: LDCN             Load constant NIL
   05bd: CXP  06 04       Call external procedure SYSIO.FOPEN
  IF JUSTBOOTED THEN
   05c0: LOD  02 00e5     Load word at G229 (JUSTBOOTED)
   05c4: FJP  $05df       Jump if TOS false
  BEGIN
    LTITLE := 'SYSTERM:'
   05c6: LAO  01          Load global BASE1 (LTITLE)
   05c8: NOP              No operation
   05c9: LSA  08          Load string address: 'SYSTERM:'
   05d3: SAS  17          String assign (TOS to TOS-1, 23 chars)
    SYSIO.FOPEN(SYSTERMFIB,LTITLE,1,NIL)
   05d5: LOD  02 0007     Load word at G7 (SYSTERMFIB)
   05d8: LAO  01          Load global BASE1 (LTITLE)
   05da: SLDC 01          Short load constant 1
   05db: LDCN             Load constant NIL
   05dc: CXP  06 04       Call external procedure SYSIO.FOPEN
  END
  GFILES[0] := INPUTFIB
-> 05df: LDA  02 0002     Load addr G2 (GFILES)
   05e2: SLDC 00          Short load constant 0
   05e3: IXA  01          Index array (TOS-1 + TOS * 1)
   05e5: LOD  02 0009     Load word at G9 (INPUTFIB)
   05e8: STO              Store indirect (TOS into TOS-1)
  GFILES[1] := OUTPUTFIB
   05e9: LDA  02 0002     Load addr G2 (GFILES)
   05ec: SLDC 01          Short load constant 1
   05ed: IXA  01          Index array (TOS-1 + TOS * 1)
   05ef: LOD  02 0008     Load word at G8 (OUTPUTFIB)
   05f2: STO              Store indirect (TOS into TOS-1)
  GFILES[2] := SYSTERMFIB
   05f3: LDA  02 0002     Load addr G2 (GFILES)
   05f6: SLDC 02          Short load constant 2
   05f7: IXA  01          Index array (TOS-1 + TOS * 1)
   05f9: LOD  02 0007     Load word at G7 (SYSTERMFIB)
   05fc: STO              Store indirect (TOS into TOS-1)
-> 05fd: RNP  00          Return from nonbase procedure
END

## Segment GETCMD (5)

### FUNCTION GETCMD.GETCMD(PARAM1): RETVAL (* P=1 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE5
BEGIN
-> 088a: SLDC 00          Short load constant 0
   088b: SRO  01          Store global word BASE1
   088d: LOD  01 0009     Load word at G9 (INPUTFIB)
   0890: INCP 02          Inc field ptr (TOS+2)
   0892: SLDC 00          Short load constant 0
   0893: STO              Store indirect (TOS into TOS-1)
   0894: LOD  01 0008     Load word at G8 (OUTPUTFIB)
   0897: INCP 02          Inc field ptr (TOS+2)
   0899: SLDC 00          Short load constant 0
   089a: STO              Store indirect (TOS into TOS-1)
   089b: LOD  01 0007     Load word at G7 (SYSTERMFIB)
   089e: INCP 02          Inc field ptr (TOS+2)
   08a0: SLDC 00          Short load constant 0
   08a1: STO              Store indirect (TOS into TOS-1)
   08a2: LDA  01 0002     Load addr G2 (INPUT)
   08a5: SLDC 00          Short load constant 0
   08a6: IXA  01          Index array (TOS-1 + TOS * 1)
   08a8: LOD  01 0009     Load word at G9 (INPUTFIB)
   08ab: STO              Store indirect (TOS into TOS-1)
   08ac: LDA  01 0002     Load addr G2 (INPUT)
   08af: SLDC 01          Short load constant 1
   08b0: IXA  01          Index array (TOS-1 + TOS * 1)
   08b2: LOD  01 0008     Load word at G8 (OUTPUTFIB)
   08b5: STO              Store indirect (TOS into TOS-1)
   08b6: SLDO 03          Short load global BASE3
   08b7: SLDC 00          Short load constant 0
   08b8: EQUI             Integer TOS-1 = TOS
   08b9: FJP  $08ea       Jump if TOS false
   08bb: LOD  01 00e5     Load word at G229 (JUSTBOOTED)
   08bf: FJP  $08ea       Jump if TOS false
   08c1: SLDC 00          Short load constant 0
   08c2: STR  01 00e5     Store TOS to G229 (JUSTBOOTED)
   08c6: NOP              No operation
   08c7: LSA  0e          Load string address: '*SYSTEM.ATTACH'
   08d7: SLDC 00          Short load constant 0
   08d8: SLDC 00          Short load constant 0
   08d9: SLDC 00          Short load constant 0
   08da: LAO  05          Load global BASE5
   08dc: SLDC 01          Short load constant 1
   08dd: SLDC 00          Short load constant 0
   08de: SLDC 00          Short load constant 0
   08df: CLP  10          Call local procedure GETCMD.16
   08e1: FJP  $08ea       Jump if TOS false
   08e3: SLDC 04          Short load constant 4
   08e4: SRO  01          Store global word BASE1
   08e6: SLDC 05          Short load constant 5
   08e7: SLDC 01          Short load constant 1
   08e8: CSP  04          Call standard procedure EXIT
-> 08ea: SLDO 03          Short load global BASE3
   08eb: SLDC 04          Short load constant 4
   08ec: EQUI             Integer TOS-1 = TOS
   08ed: FJP  $08f2       Jump if TOS false
   08ef: SLDC 00          Short load constant 0
   08f0: SRO  03          Store global word BASE3
-> 08f2: SLDO 03          Short load global BASE3
   08f3: SLDC 00          Short load constant 0
   08f4: EQUI             Integer TOS-1 = TOS
   08f5: FJP  $091f       Jump if TOS false
   08f7: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   0908: NOP              No operation
   0909: SLDC 00          Short load constant 0
   090a: SLDC 00          Short load constant 0
   090b: SLDC 01          Short load constant 1
   090c: LAO  05          Load global BASE5
   090e: SLDC 00          Short load constant 0
   090f: SLDC 00          Short load constant 0
   0910: SLDC 00          Short load constant 0
   0911: CLP  10          Call local procedure GETCMD.16
   0913: FJP  $091f       Jump if TOS false
   0915: CXP  00 1f       Call external procedure PASCALSYS.CLEARSCREEN
   0918: SLDC 03          Short load constant 3
   0919: SRO  01          Store global word BASE1
   091b: SLDC 05          Short load constant 5
   091c: SLDC 01          Short load constant 1
   091d: CSP  04          Call standard procedure EXIT
-> 091f: LDA  01 00ad     Load addr G173 (GLOBALTITLE)
   0923: SLDC 00          Short load constant 0
   0924: LDB              Load byte at byte ptr TOS-1 + TOS
   0925: SLDC 00          Short load constant 0
   0926: GRTI             Integer TOS-1 > TOS
   0927: FJP  $0948       Jump if TOS false
   0929: LDA  01 00ad     Load addr G173 (GLOBALTITLE)
   092d: SLDC 00          Short load constant 0
   092e: SLDC 17          Short load constant 23
   092f: CLP  02          Call local procedure GETCMD.2
   0931: LDA  01 00ad     Load addr G173 (GLOBALTITLE)
   0935: SLDC 00          Short load constant 0
   0936: SLDC 00          Short load constant 0
   0937: SLDC 01          Short load constant 1
   0938: LAO  05          Load global BASE5
   093a: SLDC 00          Short load constant 0
   093b: SLDC 00          Short load constant 0
   093c: SLDC 00          Short load constant 0
   093d: CLP  10          Call local procedure GETCMD.16
   093f: FJP  $0948       Jump if TOS false
   0941: SLDC 03          Short load constant 3
   0942: SRO  01          Store global word BASE1
   0944: SLDC 05          Short load constant 5
   0945: SLDC 01          Short load constant 1
   0946: CSP  04          Call standard procedure EXIT
-> 0948: RBP  01          Return from base procedure
END

### PROCEDURE GETCMD.PROC2(PARAM1; PARAM2; PARAM3) (* P=2 LL=1 *)
  MP1=PARAM3
  MP2=PARAM2
  MP3=PARAM1
  MP4
  MP5
  MP6
  MP27
  MP30
  MP33
BEGIN
-> 0000: NOP              No operation
   0001: LSA  01          Load string address: ' '
   0004: SLDL 03          Short load local MP3
   0005: SLDC 00          Short load constant 0
   0006: SLDC 00          Short load constant 0
   0007: CXP  00 1b       Call external procedure PASCALSY.SPOS
   000a: STL  0005        Store TOS into MP5
-> 000c: SLDL 05          Short load local MP5
   000d: SLDC 00          Short load constant 0
   000e: GRTI             Integer TOS-1 > TOS
   000f: FJP  $0025       Jump if TOS false
   0011: SLDL 03          Short load local MP3
   0012: SLDL 05          Short load local MP5
   0013: SLDC 01          Short load constant 1
   0014: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0017: LSA  01          Load string address: ' '
   001a: NOP              No operation
   001b: SLDL 03          Short load local MP3
   001c: SLDC 00          Short load constant 0
   001d: SLDC 00          Short load constant 0
   001e: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0021: STL  0005        Store TOS into MP5
   0023: UJP  $000c       Unconditional jump
-> 0025: SLDL 03          Short load local MP3
   0026: SLDC 00          Short load constant 0
   0027: LDB              Load byte at byte ptr TOS-1 + TOS
   0028: STL  0004        Store TOS into MP4
   002a: SLDL 04          Short load local MP4
   002b: SLDC 00          Short load constant 0
   002c: GRTI             Integer TOS-1 > TOS
   002d: FJP  $012d       Jump if TOS false
   002f: SLDL 03          Short load local MP3
   0030: SLDL 04          Short load local MP4
   0031: LDB              Load byte at byte ptr TOS-1 + TOS
   0032: SLDC 2e          Short load constant 46
   0033: NEQI             Integer TOS-1 <> TOS
   0034: FJP  $0127       Jump if TOS false
   0036: LLA  0006        Load local address MP6
   0038: NOP              No operation
   0039: LSA  00          Load string address: ''
   003b: SAS  28          String assign (TOS to TOS-1, 40 chars)
   003d: LLA  001e        Load local address MP30
   003f: LLA  0006        Load local address MP6
   0041: SAS  05          String assign (TOS to TOS-1, 5 chars)
   0043: LSA  01          Load string address: '['
   0046: NOP              No operation
   0047: SLDL 03          Short load local MP3
   0048: SLDC 00          Short load constant 0
   0049: SLDC 00          Short load constant 0
   004a: CXP  00 1b       Call external procedure PASCALSY.SPOS
   004d: STL  0005        Store TOS into MP5
   004f: SLDL 05          Short load local MP5
   0050: SLDC 00          Short load constant 0
   0051: GRTI             Integer TOS-1 > TOS
   0052: FJP  $0071       Jump if TOS false
   0054: SLDL 03          Short load local MP3
   0055: SLDC 00          Short load constant 0
   0056: LDB              Load byte at byte ptr TOS-1 + TOS
   0057: SLDL 05          Short load local MP5
   0058: SBI              Subtract integers (TOS-1 - TOS)
   0059: SLDC 01          Short load constant 1
   005a: ADI              Add integers (TOS + TOS-1)
   005b: STL  0004        Store TOS into MP4
   005d: LLA  0006        Load local address MP6
   005f: SLDL 03          Short load local MP3
   0060: LLA  0021        Load local address MP33
   0062: SLDL 05          Short load local MP5
   0063: SLDL 04          Short load local MP4
   0064: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0067: LLA  0021        Load local address MP33
   0069: SAS  28          String assign (TOS to TOS-1, 40 chars)
   006b: SLDL 03          Short load local MP3
   006c: SLDL 05          Short load local MP5
   006d: SLDL 04          Short load local MP4
   006e: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0071: SLDL 03          Short load local MP3
   0072: SLDC 00          Short load constant 0
   0073: LDB              Load byte at byte ptr TOS-1 + TOS
   0074: STL  0004        Store TOS into MP4
   0076: SLDL 04          Short load local MP4
   0077: SLDC 00          Short load constant 0
   0078: GRTI             Integer TOS-1 > TOS
   0079: FJP  $010e       Jump if TOS false
   007b: SLDL 03          Short load local MP3
   007c: SLDL 04          Short load local MP4
   007d: LDB              Load byte at byte ptr TOS-1 + TOS
   007e: SLDC 3a          Short load constant 58
   007f: NEQI             Integer TOS-1 <> TOS
   0080: FJP  $010e       Jump if TOS false
   0082: SLDL 02          Short load local MP2
   0083: FJP  $0093       Jump if TOS false
   0085: LLA  001b        Load local address MP27
   0087: LSA  05          Load string address: '.TEXT'
   008e: NOP              No operation
   008f: SAS  05          String assign (TOS to TOS-1, 5 chars)
   0091: UJP  $009f       Unconditional jump
-> 0093: LLA  001b        Load local address MP27
   0095: LSA  05          Load string address: '.CODE'
   009c: NOP              No operation
   009d: SAS  05          String assign (TOS to TOS-1, 5 chars)
-> 009f: SLDC 01          Short load constant 1
   00a0: STL  0005        Store TOS into MP5
   00a2: SLDL 04          Short load local MP4
   00a3: STL  0021        Store TOS into MP33
-> 00a5: SLDL 05          Short load local MP5
   00a6: LDL  0021        Load local word MP33
   00a8: LEQI             Integer TOS-1 <= TOS
   00a9: FJP  $00d4       Jump if TOS false
   00ab: SLDL 03          Short load local MP3
   00ac: SLDL 05          Short load local MP5
   00ad: LDB              Load byte at byte ptr TOS-1 + TOS
   00ae: SLDC 61          Short load constant 97
   00af: GEQI             Integer TOS-1 >= TOS
   00b0: SLDL 03          Short load local MP3
   00b1: SLDL 05          Short load local MP5
   00b2: LDB              Load byte at byte ptr TOS-1 + TOS
   00b3: SLDC 7a          Short load constant 122
   00b4: LEQI             Integer TOS-1 <= TOS
   00b5: LAND             Logical AND (TOS & TOS-1)
   00b6: FJP  $00c2       Jump if TOS false
   00b8: SLDL 03          Short load local MP3
   00b9: SLDL 05          Short load local MP5
   00ba: SLDL 03          Short load local MP3
   00bb: SLDL 05          Short load local MP5
   00bc: LDB              Load byte at byte ptr TOS-1 + TOS
   00bd: SLDC 61          Short load constant 97
   00be: SBI              Subtract integers (TOS-1 - TOS)
   00bf: SLDC 41          Short load constant 65
   00c0: ADI              Add integers (TOS + TOS-1)
   00c1: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 00c2: SLDL 03          Short load local MP3
   00c3: SLDL 05          Short load local MP5
   00c4: LDB              Load byte at byte ptr TOS-1 + TOS
   00c5: SLDC 20          Short load constant 32
   00c6: LESI             Integer TOS-1 < TOS
   00c7: FJP  $00cd       Jump if TOS false
   00c9: SLDL 03          Short load local MP3
   00ca: SLDL 05          Short load local MP5
   00cb: SLDC 3f          Short load constant 63
   00cc: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 00cd: SLDL 05          Short load local MP5
   00ce: SLDC 01          Short load constant 1
   00cf: ADI              Add integers (TOS + TOS-1)
   00d0: STL  0005        Store TOS into MP5
   00d2: UJP  $00a5       Unconditional jump
-> 00d4: SLDL 04          Short load local MP4
   00d5: SLDC 05          Short load constant 5
   00d6: GRTI             Integer TOS-1 > TOS
   00d7: FJP  $00eb       Jump if TOS false
   00d9: LLA  001e        Load local address MP30
   00db: SLDL 03          Short load local MP3
   00dc: LLA  0021        Load local address MP33
   00de: SLDL 04          Short load local MP4
   00df: SLDC 05          Short load constant 5
   00e0: SBI              Subtract integers (TOS-1 - TOS)
   00e1: SLDC 01          Short load constant 1
   00e2: ADI              Add integers (TOS + TOS-1)
   00e3: SLDC 05          Short load constant 5
   00e4: CXP  00 19       Call external procedure PASCALSY.SCOPY
   00e7: LLA  0021        Load local address MP33
   00e9: SAS  05          String assign (TOS to TOS-1, 5 chars)
-> 00eb: LLA  001e        Load local address MP30
   00ed: LLA  001b        Load local address MP27
   00ef: NEQSTR           String TOS-1 <> TOS
   00f1: SLDL 04          Short load local MP4
   00f2: LLA  0006        Load local address MP6
   00f4: SLDC 00          Short load constant 0
   00f5: LDB              Load byte at byte ptr TOS-1 + TOS
   00f6: ADI              Add integers (TOS + TOS-1)
   00f7: SLDL 01          Short load local MP1
   00f8: SLDC 05          Short load constant 5
   00f9: SBI              Subtract integers (TOS-1 - TOS)
   00fa: LEQI             Integer TOS-1 <= TOS
   00fb: LAND             Logical AND (TOS & TOS-1)
   00fc: FJP  $010e       Jump if TOS false
   00fe: LLA  001b        Load local address MP27
   0100: SLDC 01          Short load constant 1
   0101: SLDL 03          Short load local MP3
   0102: SLDL 04          Short load local MP4
   0103: SLDC 01          Short load constant 1
   0104: ADI              Add integers (TOS + TOS-1)
   0105: SLDC 05          Short load constant 5
   0106: CSP  02          Call standard procedure MOVL
   0108: SLDL 03          Short load local MP3
   0109: SLDC 00          Short load constant 0
   010a: SLDL 04          Short load local MP4
   010b: SLDC 05          Short load constant 5
   010c: ADI              Add integers (TOS + TOS-1)
   010d: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 010e: SLDL 03          Short load local MP3
   010f: SLDC 00          Short load constant 0
   0110: STL  0021        Store TOS into MP33
   0112: LLA  0021        Load local address MP33
   0114: SLDL 03          Short load local MP3
   0115: SLDC 50          Short load constant 80
   0116: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0119: LLA  0021        Load local address MP33
   011b: LLA  0006        Load local address MP6
   011d: SLDC 78          Short load constant 120
   011e: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0121: LLA  0021        Load local address MP33
   0123: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0125: UJP  $012d       Unconditional jump
-> 0127: SLDL 03          Short load local MP3
   0128: SLDC 00          Short load constant 0
   0129: SLDL 04          Short load local MP4
   012a: SLDC 01          Short load constant 1
   012b: SBI              Subtract integers (TOS-1 - TOS)
   012c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 012d: RNP  00          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC3(PARAM1; PARAM2): RETVAL (* P=3 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM2
  MP4=PARAM1
  MP5
BEGIN
-> 0146: SLDL 04          Short load local MP4
   0147: INCP 0080        Inc field ptr (TOS+128)
   014a: SLDL 03          Short load local MP3
   014b: IXA  01          Index array (TOS-1 + TOS * 1)
   014d: STL  0005        Store TOS into MP5
   014f: SLDL 05          Short load local MP5
   0150: SLDC 03          Short load constant 3
   0151: SLDC 0d          Short load constant 13
   0152: LDP              Load packed field (TOS)
   0153: SLDC 01          Short load constant 1
   0154: LESI             Integer TOS-1 < TOS
   0155: FJP  $015c       Jump if TOS false
   0157: SLDL 03          Short load local MP3
   0158: STL  0001        Store TOS into MP1
   015a: UJP  $016f       Unconditional jump
-> 015c: SLDL 05          Short load local MP5
   015d: SLDC 08          Short load constant 8
   015e: SLDC 00          Short load constant 0
   015f: LDP              Load packed field (TOS)
   0160: SLDC 3f          Short load constant 63
   0161: GRTI             Integer TOS-1 > TOS
   0162: FJP  $0169       Jump if TOS false
   0164: SLDC 00          Short load constant 0
   0165: STL  0001        Store TOS into MP1
   0167: UJP  $016f       Unconditional jump
-> 0169: SLDL 05          Short load local MP5
   016a: SLDC 08          Short load constant 8
   016b: SLDC 00          Short load constant 0
   016c: LDP              Load packed field (TOS)
   016d: STL  0001        Store TOS into MP1
-> 016f: RNP  01          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC4(PARAM1) (* P=4 LL=1 *)
  MP1=PARAM1
  MP2
  MP3
  MP4
BEGIN
-> 01a4: SLDC 00          Short load constant 0
   01a5: STL  0003        Store TOS into MP3
-> 01a7: SLDL 01          Short load local MP1
   01a8: SLDL 03          Short load local MP3
   01a9: SLDC 00          Short load constant 0
   01aa: SLDC 00          Short load constant 0
   01ab: CGP  03          Call global procedure GETCMD.3
   01ad: SLDC 01          Short load constant 1
   01ae: NEQI             Integer TOS-1 <> TOS
   01af: FJP  $01b8       Jump if TOS false
   01b1: SLDL 03          Short load local MP3
   01b2: SLDC 01          Short load constant 1
   01b3: ADI              Add integers (TOS + TOS-1)
   01b4: STL  0003        Store TOS into MP3
   01b6: UJP  $01a7       Unconditional jump
-> 01b8: SLDL 01          Short load local MP1
   01b9: INCP 0080        Inc field ptr (TOS+128)
   01bc: SLDL 03          Short load local MP3
   01bd: IXA  01          Index array (TOS-1 + TOS * 1)
   01bf: SLDC 03          Short load constant 3
   01c0: SLDC 0d          Short load constant 13
   01c1: LDP              Load packed field (TOS)
   01c2: STL  0002        Store TOS into MP2
   01c4: SLDL 02          Short load local MP2
   01c5: SLDC 01          Short load constant 1
   01c6: EQUI             Integer TOS-1 = TOS
   01c7: FJP  $01cd       Jump if TOS false
   01c9: CLP  05          Call local procedure GETCMD.5
   01cb: UJP  $01fc       Unconditional jump
-> 01cd: SLDL 02          Short load local MP2
   01ce: SLDC 02          Short load constant 2
   01cf: EQUI             Integer TOS-1 = TOS
   01d0: FJP  $01fc       Jump if TOS false
   01d2: LLA  0004        Load local address MP4
   01d4: SLDL 01          Short load local MP1
   01d5: INCP 90          Inc field ptr (TOS+144)
   01d8: MOV  04          Move 4 words (TOS to TOS-1)
   01da: LLA  0004        Load local address MP4
   01dc: SLDC 02          Short load constant 2
   01dd: IXA  01          Index array (TOS-1 + TOS * 1)
   01df: SIND 00          Short index load *TOS+0
   01e0: SLDC 2a          Short load constant 42
   01e1: EQUI             Integer TOS-1 = TOS
   01e2: LLA  0004        Load local address MP4
   01e4: SLDC 03          Short load constant 3
   01e5: IXA  01          Index array (TOS-1 + TOS * 1)
   01e7: SIND 00          Short index load *TOS+0
   01e8: LDCI 061e        Load word 1566
   01eb: EQUI             Integer TOS-1 = TOS
   01ec: LLA  0004        Load local address MP4
   01ee: SLDC 03          Short load constant 3
   01ef: IXA  01          Index array (TOS-1 + TOS * 1)
   01f1: SIND 00          Short index load *TOS+0
   01f2: LDCI 061f        Load word 1567
   01f5: EQUI             Integer TOS-1 = TOS
   01f6: LOR              Logical OR (TOS | TOS-1)
   01f7: LAND             Logical AND (TOS & TOS-1)
   01f8: FJP  $01fc       Jump if TOS false
   01fa: CLP  05          Call local procedure GETCMD.5
-> 01fc: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC5 (* P=5 LL=2 *)
BEGIN
-> 017c: LDA  01 0004     Load addr L14
   017f: SLDC 02          Short load constant 2
   0180: IXA  01          Index array (TOS-1 + TOS * 1)
   0182: SLDC 00          Short load constant 0
   0183: STO              Store indirect (TOS into TOS-1)
   0184: LDA  01 0004     Load addr L14
   0187: SLDC 03          Short load constant 3
   0188: IXA  01          Index array (TOS-1 + TOS * 1)
   018a: SLDC 00          Short load constant 0
   018b: STO              Store indirect (TOS into TOS-1)
   018c: LOD  01 0001     Load word at L1_1
   018f: INCP 0090        Inc field ptr (TOS+144)
   0192: LDA  01 0004     Load addr L14
   0195: MOV  04          Move 4 words (TOS to TOS-1)
-> 0197: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC6(PARAM1; PARAM2) (* P=6 LL=1 *)
  MP1=PARAM2
  MP2=PARAM1
  MP3
  MP4
  MP5
  MP6
  MP7
  MP8
  MP9
  MP10
  MP11
BEGIN
-> 020a: LOD  02 0001     Load word at G1 (SYSCOM)
   020d: STL  0005        Store TOS into MP5
   020f: SLDL 02          Short load local MP2
   0210: STL  0006        Store TOS into MP6
   0212: SLDL 01          Short load local MP1
   0213: STL  0007        Store TOS into MP7
   0215: SLDL 07          Short load local MP7
   0216: INCP 10          Inc field ptr (TOS+16)
   0218: STL  0008        Store TOS into MP8
   021a: SLDC 00          Short load constant 0
   021b: STL  0003        Store TOS into MP3
   021d: SLDC 0f          Short load constant 15
   021e: STL  0009        Store TOS into MP9
-> 0220: SLDL 03          Short load local MP3
   0221: SLDL 09          Short load local MP9
   0222: LEQI             Integer TOS-1 <= TOS
   0223: FJP  $027a       Jump if TOS false
   0225: SLDL 06          Short load local MP6
   0226: SLDL 03          Short load local MP3
   0227: IXA  02          Index array (TOS-1 + TOS * 2)
   0229: STL  000a        Store TOS into MP10
   022b: SLDL 0a          Short load local MP10
   022c: SIND 01          Short index load *TOS+1
   022d: SLDC 00          Short load constant 0
   022e: NEQI             Integer TOS-1 <> TOS
   022f: FJP  $0273       Jump if TOS false
   0231: SLDL 02          Short load local MP2
   0232: SLDL 03          Short load local MP3
   0233: SLDC 00          Short load constant 0
   0234: SLDC 00          Short load constant 0
   0235: CGP  03          Call global procedure GETCMD.3
   0237: STL  0004        Store TOS into MP4
   0239: SLDL 04          Short load local MP4
   023a: SLDC 01          Short load constant 1
   023b: EQUI             Integer TOS-1 = TOS
   023c: SLDL 04          Short load local MP4
   023d: SLDC 07          Short load constant 7
   023e: GEQI             Integer TOS-1 >= TOS
   023f: SLDL 04          Short load local MP4
   0240: SLDC 3f          Short load constant 63
   0241: LEQI             Integer TOS-1 <= TOS
   0242: LAND             Logical AND (TOS & TOS-1)
   0243: LOR              Logical OR (TOS | TOS-1)
   0244: FJP  $0273       Jump if TOS false
   0246: SLDL 05          Short load local MP5
   0247: INCP 30          Inc field ptr (TOS+48)
   0249: SLDL 04          Short load local MP4
   024a: IXA  03          Index array (TOS-1 + TOS * 3)
   024c: STL  000b        Store TOS into MP11
   024e: SLDL 0b          Short load local MP11
   024f: SLDL 07          Short load local MP7
   0250: SIND 07          Short index load *TOS+7
   0251: STO              Store indirect (TOS into TOS-1)
   0252: SLDL 0b          Short load local MP11
   0253: INCP 02          Inc field ptr (TOS+2)
   0255: SLDL 0a          Short load local MP10
   0256: SIND 01          Short index load *TOS+1
   0257: STO              Store indirect (TOS into TOS-1)
   0258: SLDL 06          Short load local MP6
   0259: INCP 60          Inc field ptr (TOS+96)
   025b: SLDL 03          Short load local MP3
   025c: IXA  01          Index array (TOS-1 + TOS * 1)
   025e: SIND 00          Short index load *TOS+0
   025f: SLDC 07          Short load constant 7
   0260: EQUI             Integer TOS-1 = TOS
   0261: FJP  $026a       Jump if TOS false
   0263: SLDL 0b          Short load local MP11
   0264: INCP 01          Inc field ptr (TOS+1)
   0266: SLDC 00          Short load constant 0
   0267: STO              Store indirect (TOS into TOS-1)
   0268: UJP  $0273       Unconditional jump
-> 026a: SLDL 0b          Short load local MP11
   026b: INCP 01          Inc field ptr (TOS+1)
   026d: SLDL 0a          Short load local MP10
   026e: SIND 00          Short index load *TOS+0
   026f: SLDL 08          Short load local MP8
   0270: SIND 00          Short index load *TOS+0
   0271: ADI              Add integers (TOS + TOS-1)
   0272: STO              Store indirect (TOS into TOS-1)
-> 0273: SLDL 03          Short load local MP3
   0274: SLDC 01          Short load constant 1
   0275: ADI              Add integers (TOS + TOS-1)
   0276: STL  0003        Store TOS into MP3
   0278: UJP  $0220       Unconditional jump
-> 027a: RNP  00          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC7(PARAM1; PARAM2; PARAM3): RETVAL (* P=7 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM3
  MP4=PARAM2
  MP5=PARAM1
  MP6
  MP7
  MP8
  MP9
BEGIN
-> 0288: LLA  0006        Load local address MP6
   028a: SLDL 03          Short load local MP3
   028b: MOV  01          Move 1 words (TOS to TOS-1)
   028d: SLDL 04          Short load local MP4
   028e: SLDC 00          Short load constant 0
   028f: SLDC 08          Short load constant 8
   0290: SLDC 00          Short load constant 0
   0291: CSP  0a          Call standard procedure FLCH
   0293: SLDC 01          Short load constant 1
   0294: STL  0001        Store TOS into MP1
   0296: SLDL 05          Short load local MP5
   0297: STL  0008        Store TOS into MP8
   0299: SLDC 00          Short load constant 0
   029a: STL  0007        Store TOS into MP7
   029c: SLDC 0f          Short load constant 15
   029d: STL  0009        Store TOS into MP9
-> 029f: SLDL 07          Short load local MP7
   02a0: SLDL 09          Short load local MP9
   02a1: LEQI             Integer TOS-1 <= TOS
   02a2: FJP  $02d4       Jump if TOS false
   02a4: SLDL 08          Short load local MP8
   02a5: SLDL 07          Short load local MP7
   02a6: IXA  02          Index array (TOS-1 + TOS * 2)
   02a8: SIND 01          Short index load *TOS+1
   02a9: SLDC 00          Short load constant 0
   02aa: NEQI             Integer TOS-1 <> TOS
   02ab: FJP  $02cd       Jump if TOS false
   02ad: LLA  0006        Load local address MP6
   02af: SLDL 08          Short load local MP8
   02b0: INCP 60          Inc field ptr (TOS+96)
   02b2: SLDL 07          Short load local MP7
   02b3: IXA  01          Index array (TOS-1 + TOS * 1)
   02b5: SIND 00          Short index load *TOS+0
   02b6: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   02b9: LDP              Load packed field (TOS)
   02ba: FJP  $02ca       Jump if TOS false
   02bc: SLDL 04          Short load local MP4
   02bd: SLDL 05          Short load local MP5
   02be: SLDL 07          Short load local MP7
   02bf: SLDC 00          Short load constant 0
   02c0: SLDC 00          Short load constant 0
   02c1: CGP  03          Call global procedure GETCMD.3
   02c3: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   02c6: SLDC 01          Short load constant 1
   02c7: STP              Store packed field (TOS into TOS-1)
   02c8: UJP  $02cd       Unconditional jump
-> 02ca: SLDC 00          Short load constant 0
   02cb: STL  0001        Store TOS into MP1
-> 02cd: SLDL 07          Short load local MP7
   02ce: SLDC 01          Short load constant 1
   02cf: ADI              Add integers (TOS + TOS-1)
   02d0: STL  0007        Store TOS into MP7
   02d2: UJP  $029f       Unconditional jump
-> 02d4: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC8(PARAM1; PARAM2): RETVAL (* P=8 LL=1 *)
  MP1=RETVAL1
  MP4=PARAM1
  MP5
  MP63
  MP66
  MP67
  MP68
  MP530
  MP571
  MP902
BEGIN
-> 0628: LLA  0005        Load local address MP5
   062a: SLDL 04          Short load local MP4
   062b: SAS  50          String assign (TOS to TOS-1, 80 chars)
   062d: SLDC 00          Short load constant 0
   062e: STL  0042        Store TOS into MP66
   0630: SLDC 00          Short load constant 0
   0631: STL  0001        Store TOS into MP1
   0633: SLDC 00          Short load constant 0
   0634: STL  003f        Store TOS into MP63
   0636: LDA  02 0215     Load addr G533 (DATASEGS)
   063a: SLDC 00          Short load constant 0
   063b: SLDC 08          Short load constant 8
   063c: SLDC 00          Short load constant 0
   063d: CSP  0a          Call standard procedure FLCH
   063f: LLA  023b        Load local address MP571
   0642: LLA  0005        Load local address MP5
   0644: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0646: CLP  0f          Call local procedure GETCMD.15
   0648: CLP  0d          Call local procedure GETCMD.13
   064a: SLDC 00          Short load constant 0
   064b: SLDC 00          Short load constant 0
   064c: CLP  09          Call local procedure GETCMD.9
   064e: LDL  0042        Load local word MP66
   0650: SLDC 00          Short load constant 0
   0651: GRTI             Integer TOS-1 > TOS
   0652: LAND             Logical AND (TOS & TOS-1)
   0653: FJP  $0677       Jump if TOS false
   0655: SLDC 01          Short load constant 1
   0656: STL  0043        Store TOS into MP67
   0658: LDL  0042        Load local word MP66
   065a: STL  0386        Store TOS into MP902
-> 065d: LDL  0043        Load local word MP67
   065f: LDL  0386        Load local word MP902
   0662: LEQI             Integer TOS-1 <= TOS
   0663: FJP  $0677       Jump if TOS false
   0665: LLA  0044        Load local address MP68
   0667: LDL  0043        Load local word MP67
   0669: SLDC 01          Short load constant 1
   066a: SBI              Subtract integers (TOS-1 - TOS)
   066b: IXA  29          Index array (TOS-1 + TOS * 41)
   066d: CLP  0b          Call local procedure GETCMD.11
   066f: LDL  0043        Load local word MP67
   0671: SLDC 01          Short load constant 1
   0672: ADI              Add integers (TOS + TOS-1)
   0673: STL  0043        Store TOS into MP67
   0675: UJP  $065d       Unconditional jump
-> 0677: SLDC 00          Short load constant 0
   0678: SLDC 00          Short load constant 0
   0679: CLP  09          Call local procedure GETCMD.9
   067b: FJP  $0699       Jump if TOS false
   067d: LLA  0212        Load local address MP530
   0680: NOP              No operation
   0681: LSA  0f          Load string address: '*SYSTEM.LIBRARY'
   0692: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0694: LLA  0212        Load local address MP530
   0697: CLP  0b          Call local procedure GETCMD.11
-> 0699: SLDC 01          Short load constant 1
   069a: STL  0001        Store TOS into MP1
   069c: LDL  003f        Load local word MP63
   069e: LNOT             Logical NOT (~TOS)
   069f: FJP  $06a5       Jump if TOS false
   06a1: SLDC 0a          Short load constant 10
   06a2: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 06a5: SLDC 00          Short load constant 0
   06a6: SLDC 00          Short load constant 0
   06a7: CLP  09          Call local procedure GETCMD.9
   06a9: LDL  003f        Load local word MP63
   06ab: LAND             Logical AND (TOS & TOS-1)
   06ac: FJP  $06b2       Jump if TOS false
   06ae: SLDC 08          Short load constant 8
   06af: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 06b2: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC9: RETVAL (* P=9 LL=2 *)
  MP1=RETVAL1
BEGIN
-> 02e2: LOD  01 0003     Load word at L1_3
   02e5: INCP 0090        Inc field ptr (TOS+144)
   02e8: LDA  03 0215     Load addr G533 (DATASEGS)
   02ec: NEQWORD          Word array (4 long) TOS-1 <> TOS
   02ef: FJP  $02f6       Jump if TOS false
   02f1: SLDC 01          Short load constant 1
   02f2: STL  0001        Store TOS into MP1
   02f4: UJP  $02f9       Unconditional jump
-> 02f6: SLDC 00          Short load constant 0
   02f7: STL  0001        Store TOS into MP1
-> 02f9: RNP  01          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC10 (* P=10 LL=2 *)
  MP1
  MP2
  MP3
  MP4
BEGIN
-> 0306: SLDC 00          Short load constant 0
   0307: STL  0002        Store TOS into MP2
   0309: SLDC 0f          Short load constant 15
   030a: STL  0004        Store TOS into MP4
-> 030c: SLDL 02          Short load local MP2
   030d: SLDL 04          Short load local MP4
   030e: LEQI             Integer TOS-1 <= TOS
   030f: FJP  $037d       Jump if TOS false
   0311: LDA  01 0111     Load addr L1273
   0315: SLDL 02          Short load local MP2
   0316: SLDC 00          Short load constant 0
   0317: SLDC 00          Short load constant 0
   0318: CGP  03          Call global procedure GETCMD.3
   031a: STL  0001        Store TOS into MP1
   031c: LLA  0003        Load local address MP3
   031e: SLDC 00          Short load constant 0
   031f: SLDC 02          Short load constant 2
   0320: SLDC 00          Short load constant 0
   0321: CSP  0a          Call standard procedure FLCH
   0323: LLA  0003        Load local address MP3
   0325: SLDC 06          Short load constant 6
   0326: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0329: SLDC 01          Short load constant 1
   032a: STP              Store packed field (TOS into TOS-1)
   032b: LLA  0003        Load local address MP3
   032d: SLDC 07          Short load constant 7
   032e: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0331: SLDC 01          Short load constant 1
   0332: STP              Store packed field (TOS into TOS-1)
   0333: LLA  0003        Load local address MP3
   0335: LDA  01 0171     Load addr L1369
   0339: SLDL 02          Short load local MP2
   033a: IXA  01          Index array (TOS-1 + TOS * 1)
   033c: SIND 00          Short index load *TOS+0
   033d: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0340: LDP              Load packed field (TOS)
   0341: LDA  03 0215     Load addr G533 (DATASEGS)
   0345: SLDL 01          Short load local MP1
   0346: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0349: LDP              Load packed field (TOS)
   034a: LNOT             Logical NOT (~TOS)
   034b: LAND             Logical AND (TOS & TOS-1)
   034c: LOD  01 0003     Load word at L1_3
   034f: INCP 0090        Inc field ptr (TOS+144)
   0351: MPR              Multiply reals (TOS * TOS-1)
   0352: SLDL 01          Short load local MP1
   0353: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0356: LDP              Load packed field (TOS)
   0357: LAND             Logical AND (TOS & TOS-1)
   0358: FJP  $036b       Jump if TOS false
   035a: LDA  03 0215     Load addr G533 (DATASEGS)
   035e: SLDL 01          Short load local MP1
   035f: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0362: SLDC 01          Short load constant 1
   0363: STP              Store packed field (TOS into TOS-1)
   0364: SLDC 01          Short load constant 1
   0365: STR  01 0211     Store TOS to L1529
   0369: UJP  $0376       Unconditional jump
-> 036b: LDA  01 0111     Load addr L1273
   036f: SLDL 02          Short load local MP2
   0370: IXA  02          Index array (TOS-1 + TOS * 2)
   0372: INCP 01          Inc field ptr (TOS+1)
   0374: SLDC 00          Short load constant 0
   0375: STO              Store indirect (TOS into TOS-1)
-> 0376: SLDL 02          Short load local MP2
   0377: SLDC 01          Short load constant 1
   0378: ADI              Add integers (TOS + TOS-1)
   0379: STL  0002        Store TOS into MP2
   037b: UJP  $030c       Unconditional jump
-> 037d: LDA  01 0111     Load addr L1273
   0381: LDA  01 0264     Load addr L1612
   0385: CGP  06          Call global procedure GETCMD.6
-> 0387: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC11(PARAM1) (* P=11 LL=2 *)
  MP1=PARAM1
  MP2
BEGIN
-> 0396: LLA  0002        Load local address MP2
   0398: SLDL 01          Short load local MP1
   0399: SAS  50          String assign (TOS to TOS-1, 80 chars)
   039b: LDA  01 0264     Load addr L1612
   039f: LDCN             Load constant NIL
   03a0: SLDC 01          Short load constant 1
   03a1: NGI              Negate integer
   03a2: CXP  06 02       Call external procedure SYSIO.FINIT
   03a5: LDA  01 0264     Load addr L1612
   03a9: LLA  0002        Load local address MP2
   03ab: SLDC 01          Short load constant 1
   03ac: LDCN             Load constant NIL
   03ad: CXP  06 04       Call external procedure SYSIO.FOPEN
   03b0: SLDC 00          Short load constant 0
   03b1: STR  01 0211     Store TOS to L1529
   03b5: CSP  22          Call standard procedure IORESULT
   03b7: SLDC 00          Short load constant 0
   03b8: EQUI             Integer TOS-1 = TOS
   03b9: FJP  $03dc       Jump if TOS false
   03bb: SLDC 01          Short load constant 1
   03bc: STR  01 003f     Store TOS to L163
   03bf: LOD  01 026b     Load word at L1_619
   03c3: LDA  01 0111     Load addr L1273
   03c7: SLDC 00          Short load constant 0
   03c8: LDCI 0200        Load word 512
   03cb: LOD  01 0274     Load word at L1_628
   03cf: SLDC 00          Short load constant 0
   03d0: CSP  05          Call standard procedure UNITREAD
   03d2: CSP  22          Call standard procedure IORESULT
   03d4: SLDC 00          Short load constant 0
   03d5: EQUI             Integer TOS-1 = TOS
   03d6: FJP  $03da       Jump if TOS false
   03d8: CIP  0a          Call intermediate procedure 10 GETCMD.10
-> 03da: UJP  $03e0       Unconditional jump
-> 03dc: SLDC 0a          Short load constant 10
   03dd: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 03e0: LDA  01 0264     Load addr L1612
   03e4: SLDC 00          Short load constant 0
   03e5: CXP  06 05       Call external procedure SYSIO.FCLOSE
-> 03e8: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC12 (* P=12 LL=2 *)
  MP1
  MP2
  MP3
  MP4
BEGIN
-> 03f4: SLDC 0f          Short load constant 15
   03f5: STL  0002        Store TOS into MP2
   03f7: LDA  01 0111     Load addr L1273
   03fb: SLDL 02          Short load local MP2
   03fc: LDB              Load byte at byte ptr TOS-1 + TOS
   03fd: SLDC 10          Short load constant 16
   03fe: EQUI             Integer TOS-1 = TOS
   03ff: FJP  $0406       Jump if TOS false
   0401: SLDL 02          Short load local MP2
   0402: SLDC 02          Short load constant 2
   0403: ADI              Add integers (TOS + TOS-1)
   0404: STL  0002        Store TOS into MP2
-> 0406: SLDC 00          Short load constant 0
   0407: STL  0001        Store TOS into MP1
   0409: LDA  01 0111     Load addr L1273
   040d: SLDL 02          Short load local MP2
   040e: LDB              Load byte at byte ptr TOS-1 + TOS
   040f: SLDC 24          Short load constant 36
   0410: EQUI             Integer TOS-1 = TOS
   0411: LDA  01 0111     Load addr L1273
   0415: SLDL 02          Short load local MP2
   0416: SLDC 01          Short load constant 1
   0417: ADI              Add integers (TOS + TOS-1)
   0418: LDB              Load byte at byte ptr TOS-1 + TOS
   0419: SLDC 24          Short load constant 36
   041a: EQUI             Integer TOS-1 = TOS
   041b: LAND             Logical AND (TOS & TOS-1)
   041c: LNOT             Logical NOT (~TOS)
   041d: FJP  $0488       Jump if TOS false
   041f: SLDC 01          Short load constant 1
   0420: STL  0003        Store TOS into MP3
   0422: SLDC 05          Short load constant 5
   0423: STL  0004        Store TOS into MP4
-> 0425: SLDL 03          Short load local MP3
   0426: SLDL 04          Short load local MP4
   0427: LEQI             Integer TOS-1 <= TOS
   0428: FJP  $0482       Jump if TOS false
   042a: SLDC 50          Short load constant 80
   042b: SLDC 00          Short load constant 0
   042c: SLDC 0d          Short load constant 13
   042d: LDA  01 0111     Load addr L1273
   0431: SLDL 02          Short load local MP2
   0432: SLDC 00          Short load constant 0
   0433: CSP  0b          Call standard procedure SCAN
   0435: STL  0001        Store TOS into MP1
   0437: LDA  01 0111     Load addr L1273
   043b: SLDL 02          Short load local MP2
   043c: LDA  01 0044     Load addr L168
   043f: SLDL 03          Short load local MP3
   0440: SLDC 01          Short load constant 1
   0441: SBI              Subtract integers (TOS-1 - TOS)
   0442: IXA  29          Index array (TOS-1 + TOS * 41)
   0444: SLDC 01          Short load constant 1
   0445: SLDL 01          Short load local MP1
   0446: CSP  02          Call standard procedure MOVL
   0448: LDA  01 0044     Load addr L168
   044b: SLDL 03          Short load local MP3
   044c: SLDC 01          Short load constant 1
   044d: SBI              Subtract integers (TOS-1 - TOS)
   044e: IXA  29          Index array (TOS-1 + TOS * 41)
   0450: SLDC 00          Short load constant 0
   0451: SLDL 01          Short load local MP1
   0452: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0453: SLDL 02          Short load local MP2
   0454: SLDL 01          Short load local MP1
   0455: ADI              Add integers (TOS + TOS-1)
   0456: SLDC 01          Short load constant 1
   0457: ADI              Add integers (TOS + TOS-1)
   0458: STL  0002        Store TOS into MP2
   045a: LDA  01 0111     Load addr L1273
   045e: SLDL 02          Short load local MP2
   045f: LDB              Load byte at byte ptr TOS-1 + TOS
   0460: SLDC 10          Short load constant 16
   0461: EQUI             Integer TOS-1 = TOS
   0462: FJP  $0469       Jump if TOS false
   0464: SLDL 02          Short load local MP2
   0465: SLDC 02          Short load constant 2
   0466: ADI              Add integers (TOS + TOS-1)
   0467: STL  0002        Store TOS into MP2
-> 0469: LDA  01 0111     Load addr L1273
   046d: SLDL 02          Short load local MP2
   046e: LDB              Load byte at byte ptr TOS-1 + TOS
   046f: SLDC 24          Short load constant 36
   0470: EQUI             Integer TOS-1 = TOS
   0471: FJP  $047b       Jump if TOS false
   0473: SLDL 03          Short load local MP3
   0474: STR  01 0042     Store TOS to L166
   0477: SLDC 05          Short load constant 5
   0478: SLDC 0c          Short load constant 12
   0479: CSP  04          Call standard procedure EXIT
-> 047b: SLDL 03          Short load local MP3
   047c: SLDC 01          Short load constant 1
   047d: ADI              Add integers (TOS + TOS-1)
   047e: STL  0003        Store TOS into MP3
   0480: UJP  $0425       Unconditional jump
-> 0482: SLDC 05          Short load constant 5
   0483: STR  01 0042     Store TOS to L166
   0486: UJP  $048c       Unconditional jump
-> 0488: SLDC 00          Short load constant 0
   0489: STR  01 0042     Store TOS to L166
-> 048c: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC13 (* P=13 LL=2 *)
  MP1
BEGIN
-> 04d0: LDA  01 0264     Load addr L1612
   04d4: LDCN             Load constant NIL
   04d5: SLDC 01          Short load constant 1
   04d6: NGI              Negate integer
   04d7: CXP  06 02       Call external procedure SYSIO.FINIT
   04da: LDA  01 0264     Load addr L1612
   04de: LDA  01 023b     Load addr L1571
   04e2: SLDC 01          Short load constant 1
   04e3: LDCN             Load constant NIL
   04e4: CXP  06 04       Call external procedure SYSIO.FOPEN
   04e7: CSP  22          Call standard procedure IORESULT
   04e9: SLDC 00          Short load constant 0
   04ea: EQUI             Integer TOS-1 = TOS
   04eb: FJP  $056c       Jump if TOS false
   04ed: LOD  01 026b     Load word at L1_619
   04f1: LDA  01 0111     Load addr L1273
   04f5: SLDC 00          Short load constant 0
   04f6: LDCI 0200        Load word 512
   04f9: LOD  01 0274     Load word at L1_628
   04fd: SLDC 02          Short load constant 2
   04fe: ADI              Add integers (TOS + TOS-1)
   04ff: SLDC 00          Short load constant 0
   0500: CSP  05          Call standard procedure UNITREAD
   0502: CSP  22          Call standard procedure IORESULT
   0504: SLDC 00          Short load constant 0
   0505: EQUI             Integer TOS-1 = TOS
   0506: FJP  $054e       Jump if TOS false
   0508: LDA  01 0111     Load addr L1273
   050c: SLDC 00          Short load constant 0
   050d: LLA  0001        Load local address MP1
   050f: SLDC 01          Short load constant 1
   0510: SLDC 0e          Short load constant 14
   0511: CSP  02          Call standard procedure MOVL
   0513: CLP  0e          Call local procedure GETCMD.14
   0515: LLA  0001        Load local address MP1
   0517: SLDC 01          Short load constant 1
   0518: LDB              Load byte at byte ptr TOS-1 + TOS
   0519: SLDC 4c          Short load constant 76
   051a: EQUI             Integer TOS-1 = TOS
   051b: LLA  0001        Load local address MP1
   051d: SLDC 02          Short load constant 2
   051e: LDB              Load byte at byte ptr TOS-1 + TOS
   051f: SLDC 49          Short load constant 73
   0520: EQUI             Integer TOS-1 = TOS
   0521: LAND             Logical AND (TOS & TOS-1)
   0522: FJP  $054e       Jump if TOS false
   0524: LLA  0001        Load local address MP1
   0526: SLDC 00          Short load constant 0
   0527: SLDC 0e          Short load constant 14
   0528: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0529: LLA  0001        Load local address MP1
   052b: LSA  0e          Load string address: 'LIBRARY FILES:'
   053b: NOP              No operation
   053c: EQLSTR           String TOS-1 = TOS
   053e: FJP  $054e       Jump if TOS false
   0540: CIP  0c          Call intermediate procedure 12 GETCMD.12
   0542: LDA  01 0264     Load addr L1612
   0546: SLDC 00          Short load constant 0
   0547: CXP  06 05       Call external procedure SYSIO.FCLOSE
   054a: SLDC 05          Short load constant 5
   054b: SLDC 0d          Short load constant 13
   054c: CSP  04          Call standard procedure EXIT
-> 054e: SLDC 01          Short load constant 1
   054f: STR  01 003f     Store TOS to L163
   0552: SLDC 00          Short load constant 0
   0553: STR  01 0211     Store TOS to L1529
   0557: LOD  01 026b     Load word at L1_619
   055b: LDA  01 0111     Load addr L1273
   055f: SLDC 00          Short load constant 0
   0560: LDCI 0200        Load word 512
   0563: LOD  01 0274     Load word at L1_628
   0567: SLDC 00          Short load constant 0
   0568: CSP  05          Call standard procedure UNITREAD
   056a: CIP  0a          Call intermediate procedure 10 GETCMD.10
-> 056c: LDA  01 0264     Load addr L1612
   0570: SLDC 00          Short load constant 0
   0571: CXP  06 05       Call external procedure SYSIO.FCLOSE
-> 0574: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC14 (* P=14 LL=3 *)
  MP1
  MP2
BEGIN
-> 049a: SLDC 01          Short load constant 1
   049b: STL  0001        Store TOS into MP1
   049d: SLDC 0d          Short load constant 13
   049e: STL  0002        Store TOS into MP2
-> 04a0: SLDL 01          Short load local MP1
   04a1: SLDL 02          Short load local MP2
   04a2: LEQI             Integer TOS-1 <= TOS
   04a3: FJP  $04c1       Jump if TOS false
   04a5: LDA  01 0001     Load addr L21
   04a8: SLDL 01          Short load local MP1
   04a9: LDB              Load byte at byte ptr TOS-1 + TOS
   04aa: SLDC 61          Short load constant 97
   04ab: GEQI             Integer TOS-1 >= TOS
   04ac: FJP  $04ba       Jump if TOS false
   04ae: LDA  01 0001     Load addr L21
   04b1: SLDL 01          Short load local MP1
   04b2: LDA  01 0001     Load addr L21
   04b5: SLDL 01          Short load local MP1
   04b6: LDB              Load byte at byte ptr TOS-1 + TOS
   04b7: SLDC 20          Short load constant 32
   04b8: SBI              Subtract integers (TOS-1 - TOS)
   04b9: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 04ba: SLDL 01          Short load local MP1
   04bb: SLDC 01          Short load constant 1
   04bc: ADI              Add integers (TOS + TOS-1)
   04bd: STL  0001        Store TOS into MP1
   04bf: UJP  $04a0       Unconditional jump
-> 04c1: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC15 (* P=15 LL=2 *)
  MP1
  MP2
BEGIN
-> 0580: LDA  01 023b     Load addr L1571
   0584: LDA  01 002e     Load addr L146
   0587: LDA  01 0032     Load addr L150
   058a: LLA  0001        Load local address MP1
   058c: LDA  01 003e     Load addr L162
   058f: SLDC 00          Short load constant 0
   0590: SLDC 00          Short load constant 0
   0591: CXP  06 0b       Call external procedure SYSIO.11
   0594: FJP  $0596       Jump if TOS false
-> 0596: LDA  01 0032     Load addr L150
   0599: SLDC 00          Short load constant 0
   059a: SLDC 0f          Short load constant 15
   059b: CGP  02          Call global procedure GETCMD.2
   059d: LDA  01 0032     Load addr L150
   05a0: SLDC 00          Short load constant 0
   05a1: LDB              Load byte at byte ptr TOS-1 + TOS
   05a2: STL  0001        Store TOS into MP1
   05a4: SLDL 01          Short load local MP1
   05a5: SLDC 05          Short load constant 5
   05a6: GRTI             Integer TOS-1 > TOS
   05a7: FJP  $05cd       Jump if TOS false
   05a9: LDA  01 0032     Load addr L150
   05ac: LLA  0002        Load local address MP2
   05ae: SLDL 01          Short load local MP1
   05af: SLDC 04          Short load constant 4
   05b0: SBI              Subtract integers (TOS-1 - TOS)
   05b1: SLDC 05          Short load constant 5
   05b2: CXP  00 19       Call external procedure PASCALSY.SCOPY
   05b5: LLA  0002        Load local address MP2
   05b7: LSA  05          Load string address: '.CODE'
   05be: NOP              No operation
   05bf: EQLSTR           String TOS-1 = TOS
   05c1: FJP  $05cd       Jump if TOS false
   05c3: LDA  01 0032     Load addr L150
   05c6: SLDL 01          Short load local MP1
   05c7: SLDC 04          Short load constant 4
   05c8: SBI              Subtract integers (TOS-1 - TOS)
   05c9: SLDC 05          Short load constant 5
   05ca: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 05cd: LDA  01 0032     Load addr L150
   05d0: SLDC 00          Short load constant 0
   05d1: LDB              Load byte at byte ptr TOS-1 + TOS
   05d2: SLDC 0b          Short load constant 11
   05d3: GRTI             Integer TOS-1 > TOS
   05d4: FJP  $05e7       Jump if TOS false
   05d6: LDA  01 0032     Load addr L150
   05d9: LDA  01 0032     Load addr L150
   05dc: LLA  0002        Load local address MP2
   05de: SLDC 01          Short load constant 1
   05df: SLDC 0b          Short load constant 11
   05e0: CXP  00 19       Call external procedure PASCALSY.SCOPY
   05e3: LLA  0002        Load local address MP2
   05e5: SAS  0f          String assign (TOS to TOS-1, 15 chars)
-> 05e7: LDA  01 023b     Load addr L1571
   05eb: SLDC 00          Short load constant 0
   05ec: STL  0002        Store TOS into MP2
   05ee: LLA  0002        Load local address MP2
   05f0: LDA  01 002e     Load addr L146
   05f3: SLDC 07          Short load constant 7
   05f4: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05f7: LLA  0002        Load local address MP2
   05f9: LSA  01          Load string address: ':'
   05fc: NOP              No operation
   05fd: SLDC 08          Short load constant 8
   05fe: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0601: LLA  0002        Load local address MP2
   0603: LDA  01 0032     Load addr L150
   0606: SLDC 17          Short load constant 23
   0607: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   060a: LLA  0002        Load local address MP2
   060c: NOP              No operation
   060d: LSA  04          Load string address: '.LIB'
   0613: SLDC 1b          Short load constant 27
   0614: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0617: LLA  0002        Load local address MP2
   0619: SAS  50          String assign (TOS to TOS-1, 80 chars)
-> 061b: RNP  00          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC16(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5; PARAM6): RETVAL (* P=16 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM6
  MP4=PARAM5
  MP5=PARAM4
  MP8=PARAM1
  MP9
  MP50
  MP82
  MP178
  MP194
  MP306
  MP310
  MP351
  MP355
  MP359
  MP367
  MP368
  MP369
  MP370
  MP371
  MP375
  MP376
BEGIN
-> 06c0: LLA  0009        Load local address MP9
   06c2: SLDL 08          Short load local MP8
   06c3: SAS  50          String assign (TOS to TOS-1, 80 chars)
   06c5: SLDL 04          Short load local MP4
   06c6: SLDC 02          Short load constant 2
   06c7: STO              Store indirect (TOS into TOS-1)
   06c8: SLDC 00          Short load constant 0
   06c9: STL  0001        Store TOS into MP1
   06cb: LLA  015f        Load local address MP351
   06ce: LDA  02 0211     Load addr G529
   06d2: SAS  07          String assign (TOS to TOS-1, 7 chars)
   06d4: LLA  0136        Load local address MP310
   06d7: LLA  0009        Load local address MP9
   06d9: SAS  50          String assign (TOS to TOS-1, 80 chars)
   06db: LLA  0136        Load local address MP310
   06de: LLA  0163        Load local address MP355
   06e1: LLA  0167        Load local address MP359
   06e4: LLA  016f        Load local address MP367
   06e7: LLA  0170        Load local address MP368
   06ea: SLDC 00          Short load constant 0
   06eb: SLDC 00          Short load constant 0
   06ec: CXP  06 0b       Call external procedure SYSIO.11
   06ef: STL  0171        Store TOS into MP369
   06f2: LDA  02 0211     Load addr G529
   06f6: LLA  0163        Load local address MP355
   06f9: SAS  07          String assign (TOS to TOS-1, 7 chars)
   06fb: LDL  0171        Load local word MP369
   06fe: LNOT             Logical NOT (~TOS)
   06ff: FJP  $070a       Jump if TOS false
   0701: LDA  02 0211     Load addr G529
   0705: LSA  00          Load string address: ''
   0707: NOP              No operation
   0708: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 070a: LDA  02 00e6     Load addr G230
   070e: LLA  0009        Load local address MP9
   0710: SLDC 01          Short load constant 1
   0711: LDCN             Load constant NIL
   0712: CXP  06 04       Call external procedure SYSIO.FOPEN
   0715: CSP  22          Call standard procedure IORESULT
   0717: SLDC 00          Short load constant 0
   0718: NEQI             Integer TOS-1 <> TOS
   0719: FJP  $0726       Jump if TOS false
   071b: SLDL 05          Short load local MP5
   071c: FJP  $0724       Jump if TOS false
   071e: SLDC 02          Short load constant 2
   071f: CXP  00 02       Call external procedure PASCALSY.EXECERROR
   0722: UJP  $0726       Unconditional jump
-> 0724: UJP  $0867       Unconditional jump
-> 0726: SLDL 04          Short load local MP4
   0727: SLDC 01          Short load constant 1
   0728: STO              Store indirect (TOS into TOS-1)
   0729: LOD  02 0001     Load word at G1 (SYSCOM)
   072c: STL  0178        Store TOS into MP376
   072f: LDA  02 00f8     Load addr G248
   0733: SLDC 04          Short load constant 4
   0734: SLDC 00          Short load constant 0
   0735: LDP              Load packed field (TOS)
   0736: SLDC 02          Short load constant 2
   0737: NEQI             Integer TOS-1 <> TOS
   0738: FJP  $0740       Jump if TOS false
   073a: SLDC 03          Short load constant 3
   073b: CXP  00 02       Call external procedure PASCALSY.EXECERROR
   073e: UJP  $0855       Unconditional jump
-> 0740: LOD  02 00ed     Load word at G237
   0744: LLA  0032        Load local address MP50
   0746: SLDC 00          Short load constant 0
   0747: LDCI 0200        Load word 512
   074a: LOD  02 00f6     Load word at G246
   074e: SLDC 00          Short load constant 0
   074f: CSP  05          Call standard procedure UNITREAD
   0751: CSP  22          Call standard procedure IORESULT
   0753: SLDC 00          Short load constant 0
   0754: NEQI             Integer TOS-1 <> TOS
   0755: FJP  $075b       Jump if TOS false
   0757: SLDC 04          Short load constant 4
   0758: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 075b: SLDL 03          Short load local MP3
   075c: FJP  $07d1       Jump if TOS false
   075e: LLA  00b2        Load local address MP178
   0761: SLDC 01          Short load constant 1
   0762: IXA  01          Index array (TOS-1 + TOS * 1)
   0764: SLDC 03          Short load constant 3
   0765: SLDC 0d          Short load constant 13
   0766: LDP              Load packed field (TOS)
   0767: SLDC 06          Short load constant 6
   0768: NEQI             Integer TOS-1 <> TOS
   0769: FJP  $07d1       Jump if TOS false
   076b: LSA  0f          Load string address: 'SYSTEM.COMPILER'
   077c: NOP              No operation
   077d: LLA  0009        Load local address MP9
   077f: SLDC 00          Short load constant 0
   0780: SLDC 00          Short load constant 0
   0781: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0784: SLDC 00          Short load constant 0
   0785: NEQI             Integer TOS-1 <> TOS
   0786: LLA  0052        Load local address MP82
   0788: SLDC 01          Short load constant 1
   0789: IXA  04          Index array (TOS-1 + TOS * 4)
   078b: NOP              No operation
   078c: LPA  08          Load packed array
                         464f525452414e3a
   0796: EQLBYTE          Byte array (8 long) TOS-1 = TOS
   0799: LAND             Logical AND (TOS & TOS-1)
   079a: LNOT             Logical NOT (~TOS)
   079b: FJP  $07d1       Jump if TOS false
   079d: LOD  02 0003     Load word at G3 (OUTPUT)
   07a0: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   07a3: CSP  00          Call standard procedure IOC
   07a5: LOD  02 0003     Load word at G3 (OUTPUT)
   07a8: LLA  0009        Load local address MP9
   07aa: SLDC 00          Short load constant 0
   07ab: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   07ae: CSP  00          Call standard procedure IOC
   07b0: LOD  02 0003     Load word at G3 (OUTPUT)
   07b3: LSA  13          Load string address: ' is not version 1.3'
   07c8: NOP              No operation
   07c9: SLDC 00          Short load constant 0
   07ca: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   07cd: CSP  00          Call standard procedure IOC
   07cf: UJP  $0867       Unconditional jump
-> 07d1: SLDL 03          Short load local MP3
   07d2: LNOT             Logical NOT (~TOS)
   07d3: FJP  $07d9       Jump if TOS false
   07d5: LLA  0032        Load local address MP50
   07d7: CGP  04          Call global procedure GETCMD.4
-> 07d9: LLA  0172        Load local address MP370
   07dc: SLDC 00          Short load constant 0
   07dd: SLDC 02          Short load constant 2
   07de: SLDC 00          Short load constant 0
   07df: CSP  0a          Call standard procedure FLCH
   07e1: LLA  0172        Load local address MP370
   07e4: SLDC 00          Short load constant 0
   07e5: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   07e8: SLDC 01          Short load constant 1
   07e9: STP              Store packed field (TOS into TOS-1)
   07ea: LLA  0032        Load local address MP50
   07ec: LLA  0132        Load local address MP306
   07ef: LLA  0172        Load local address MP370
   07f2: SLDC 00          Short load constant 0
   07f3: SLDC 00          Short load constant 0
   07f4: CGP  07          Call global procedure GETCMD.7
   07f6: LNOT             Logical NOT (~TOS)
   07f7: FJP  $07fd       Jump if TOS false
   07f9: SLDC 05          Short load constant 5
   07fa: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 07fd: SLDC 00          Short load constant 0
   07fe: STL  0177        Store TOS into MP375
-> 0801: LDL  0177        Load local word MP375
   0804: SLDC 3f          Short load constant 63
   0805: LEQI             Integer TOS-1 <= TOS
   0806: FJP  $082d       Jump if TOS false
   0808: LLA  0132        Load local address MP306
   080b: LDL  0177        Load local word MP375
   080e: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0811: LDP              Load packed field (TOS)
   0812: LLA  00c2        Load local address MP194
   0815: LDL  0177        Load local word MP375
   0818: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   081b: LDP              Load packed field (TOS)
   081c: LAND             Logical AND (TOS & TOS-1)
   081d: FJP  $0823       Jump if TOS false
   081f: SLDC 06          Short load constant 6
   0820: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 0823: LDL  0177        Load local word MP375
   0826: SLDC 01          Short load constant 1
   0827: ADI              Add integers (TOS + TOS-1)
   0828: STL  0177        Store TOS into MP375
   082b: UJP  $0801       Unconditional jump
-> 082d: LLA  0173        Load local address MP371
   0830: SLDC 00          Short load constant 0
   0831: SLDC 08          Short load constant 8
   0832: SLDC 00          Short load constant 0
   0833: CSP  0a          Call standard procedure FLCH
   0835: LLA  00c2        Load local address MP194
   0838: LLA  0173        Load local address MP371
   083b: NEQWORD          Word array (4 long) TOS-1 <> TOS
   083e: FJP  $084d       Jump if TOS false
   0840: LLA  0009        Load local address MP9
   0842: LLA  0032        Load local address MP50
   0844: SLDC 00          Short load constant 0
   0845: SLDC 00          Short load constant 0
   0846: CGP  08          Call global procedure GETCMD.8
   0848: LNOT             Logical NOT (~TOS)
   0849: FJP  $084d       Jump if TOS false
   084b: UJP  $0867       Unconditional jump
-> 084d: LLA  0032        Load local address MP50
   084f: LDA  02 00e6     Load addr G230
   0853: CGP  06          Call global procedure GETCMD.6
-> 0855: SLDL 04          Short load local MP4
   0856: SLDC 00          Short load constant 0
   0857: STO              Store indirect (TOS into TOS-1)
   0858: SLDC 01          Short load constant 1
   0859: STL  0001        Store TOS into MP1
   085b: LDA  02 00e6     Load addr G230
   085f: SLDC 00          Short load constant 0
   0860: CXP  06 05       Call external procedure SYSIO.FCLOSE
   0863: SLDC 05          Short load constant 5
   0864: SLDC 10          Short load constant 16
   0865: CSP  04          Call standard procedure EXIT
-> 0867: LDA  02 00e6     Load addr G230
   086b: SLDC 00          Short load constant 0
   086c: CXP  06 05       Call external procedure SYSIO.FCLOSE
   086f: LDA  02 0211     Load addr G529
   0873: LLA  015f        Load local address MP351
   0876: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0878: RNP  01          Return from nonbase procedure
END

## Segment SYSIO (6)

### PROCEDURE SYSIO.SYSIO (* P=1 LL=1 *)
BEGIN
-> 0e18: RNP  00          Return from nonbase procedure
END

### PROCEDURE SYSIO.FINIT(VAR F:FIB; WINDOW:WINDOWP; RECWORDS:INTEGER) (* P=2 LL=1 *)
  MP1=RECWORDS:INTEGER
  MP2=WINDOW:WINDOWP
  MP3=F:FIB
  MP4
BEGIN
-> 06b8: SLDL 03          Short load local MP3
   06b9: STL  0004        Store TOS into MP4
   06bb: SLDL 04          Short load local MP4
   06bc: INCP 03          Inc field ptr (TOS+3)
   06be: SLDC 00          Short load constant 0
   06bf: STO              Store indirect (TOS into TOS-1)
   06c0: SLDL 04          Short load local MP4
   06c1: INCP 05          Inc field ptr (TOS+5)
   06c3: SLDC 00          Short load constant 0
   06c4: STO              Store indirect (TOS into TOS-1)
   06c5: SLDL 04          Short load local MP4
   06c6: INCP 02          Inc field ptr (TOS+2)
   06c8: SLDC 01          Short load constant 1
   06c9: STO              Store indirect (TOS into TOS-1)
   06ca: SLDL 04          Short load local MP4
   06cb: INCP 01          Inc field ptr (TOS+1)
   06cd: SLDC 01          Short load constant 1
   06ce: STO              Store indirect (TOS into TOS-1)
   06cf: SLDL 04          Short load local MP4
   06d0: SLDL 02          Short load local MP2
   06d1: STO              Store indirect (TOS into TOS-1)
   06d2: SLDL 01          Short load local MP1
   06d3: SLDC 00          Short load constant 0
   06d4: EQUI             Integer TOS-1 = TOS
   06d5: SLDL 01          Short load local MP1
   06d6: SLDC 02          Short load constant 2
   06d7: NGI              Negate integer
   06d8: EQUI             Integer TOS-1 = TOS
   06d9: LOR              Logical OR (TOS | TOS-1)
   06da: FJP  $06f2       Jump if TOS false
   06dc: SLDL 04          Short load local MP4
   06dd: SIND 00          Short index load *TOS+0
   06de: SLDC 01          Short load constant 1
   06df: SLDC 00          Short load constant 0
   06e0: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   06e1: SLDL 04          Short load local MP4
   06e2: INCP 04          Inc field ptr (TOS+4)
   06e4: SLDC 01          Short load constant 1
   06e5: STO              Store indirect (TOS into TOS-1)
   06e6: SLDL 01          Short load local MP1
   06e7: SLDC 00          Short load constant 0
   06e8: EQUI             Integer TOS-1 = TOS
   06e9: FJP  $06f0       Jump if TOS false
   06eb: SLDL 04          Short load local MP4
   06ec: INCP 03          Inc field ptr (TOS+3)
   06ee: SLDC 01          Short load constant 1
   06ef: STO              Store indirect (TOS into TOS-1)
-> 06f0: UJP  $0708       Unconditional jump
-> 06f2: SLDL 01          Short load local MP1
   06f3: SLDC 00          Short load constant 0
   06f4: LESI             Integer TOS-1 < TOS
   06f5: FJP  $0701       Jump if TOS false
   06f7: SLDL 04          Short load local MP4
   06f8: LDCN             Load constant NIL
   06f9: STO              Store indirect (TOS into TOS-1)
   06fa: SLDL 04          Short load local MP4
   06fb: INCP 04          Inc field ptr (TOS+4)
   06fd: SLDC 00          Short load constant 0
   06fe: STO              Store indirect (TOS into TOS-1)
   06ff: UJP  $0708       Unconditional jump
-> 0701: SLDL 04          Short load local MP4
   0702: INCP 04          Inc field ptr (TOS+4)
   0704: SLDL 01          Short load local MP1
   0705: SLDL 01          Short load local MP1
   0706: ADI              Add integers (TOS + TOS-1)
   0707: STO              Store indirect (TOS into TOS-1)
-> 0708: RNP  00          Return from nonbase procedure
END

### PROCEDURE SYSIO.FRESET(VAR F:FIB) (* P=3 LL=1 *)
  MP1=F:FIB
  MP2
BEGIN
-> 0806: LOD  02 0001     Load word at G1 (SYSCOM)
   0809: SLDC 00          Short load constant 0
   080a: STO              Store indirect (TOS into TOS-1)
   080b: SLDL 01          Short load local MP1
   080c: STL  0002        Store TOS into MP2
   080e: SLDL 02          Short load local MP2
   080f: SIND 05          Short index load *TOS+5
   0810: FJP  $082c       Jump if TOS false
   0812: SLDL 01          Short load local MP1
   0813: CGP  0d          Call global procedure SYSIO.13
   0815: SLDL 02          Short load local MP2
   0816: SIND 04          Short index load *TOS+4
   0817: SLDC 00          Short load constant 0
   0818: GRTI             Integer TOS-1 > TOS
   0819: FJP  $082c       Jump if TOS false
   081b: SLDL 02          Short load local MP2
   081c: SIND 03          Short index load *TOS+3
   081d: SLDC 00          Short load constant 0
   081e: EQUI             Integer TOS-1 = TOS
   081f: FJP  $0827       Jump if TOS false
   0821: SLDL 01          Short load local MP1
   0822: CXP  00 07       Call external procedure PASCALSY.FGET
   0825: UJP  $082c       Unconditional jump
-> 0827: SLDL 02          Short load local MP2
   0828: INCP 03          Inc field ptr (TOS+3)
   082a: SLDC 01          Short load constant 1
   082b: STO              Store indirect (TOS into TOS-1)
-> 082c: RNP  00          Return from nonbase procedure
END

### PROCEDURE SYSIO.FOPEN(VAR F:FIB; VAR FTITLE:STRING; FOPENOLD:BOOLEAN; JUNK:FIBP) (* P=4 LL=1 *)
  MP2=PARAM3
  MP3=PARAM2
  MP4=PARAM1
  MP5
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
-> 0972: LOD  02 0001     Load word at G1 (SYSCOM)
   0975: SLDC 00          Short load constant 0
   0976: STO              Store indirect (TOS into TOS-1)
   0977: SLDL 04          Short load local MP4
   0978: STL  001a        Store TOS into MP26
   097a: LDL  001a        Load local word MP26
   097c: SIND 05          Short index load *TOS+5
   097d: FJP  $0986       Jump if TOS false
   097f: LOD  02 0001     Load word at G1 (SYSCOM)
   0982: SLDC 0c          Short load constant 12
   0983: STO              Store indirect (TOS into TOS-1)
   0984: UJP  $0c5c       Unconditional jump
-> 0986: SLDL 03          Short load local MP3
   0987: LLA  000e        Load local address MP14
   0989: LLA  0012        Load local address MP18
   098b: LLA  0009        Load local address MP9
   098d: LLA  000a        Load local address MP10
   098f: SLDC 00          Short load constant 0
   0990: SLDC 00          Short load constant 0
   0991: CGP  0b          Call global procedure SYSIO.11
   0993: FJP  $0c57       Jump if TOS false
   0995: SLDL 02          Short load local MP2
   0996: SLDC 01          Short load constant 1
   0997: GRTI             Integer TOS-1 > TOS
   0998: FJP  $09a3       Jump if TOS false
   099a: SLDL 02          Short load local MP2
   099b: SLDC 02          Short load constant 2
   099c: EQUI             Integer TOS-1 = TOS
   099d: SLDL 02          Short load local MP2
   099e: SLDC 04          Short load constant 4
   099f: EQUI             Integer TOS-1 = TOS
   09a0: LOR              Logical OR (TOS | TOS-1)
   09a1: STL  0002        Store TOS into MP2
-> 09a3: SLDC 00          Short load constant 0
   09a4: STL  000c        Store TOS into MP12
   09a6: LOD  02 0006     Load word at G6 (SWAPFIB)
   09a9: STL  001b        Store TOS into MP27
   09ab: LDL  001b        Load local word MP27
   09ad: SIND 05          Short index load *TOS+5
   09ae: LOD  02 0001     Load word at G1 (SYSCOM)
   09b1: SIND 04          Short index load *TOS+4
   09b2: LDCN             Load constant NIL
   09b3: EQUI             Integer TOS-1 = TOS
   09b4: LAND             Logical AND (TOS & TOS-1)
   09b5: FJP  $0a0c       Jump if TOS false
   09b7: LLA  000b        Load local address MP11
   09b9: CSP  20          Call standard procedure MARK
   09bb: LOD  02 0001     Load word at G1 (SYSCOM)
   09be: SIND 07          Short index load *TOS+7
   09bf: SLDL 0b          Short load local MP11
   09c0: SBI              Subtract integers (TOS-1 - TOS)
   09c1: STL  0008        Store TOS into MP8
   09c3: SLDL 08          Short load local MP8
   09c4: SLDC 00          Short load constant 0
   09c5: GRTI             Integer TOS-1 > TOS
   09c6: SLDL 08          Short load local MP8
   09c7: LDCI 07ec        Load word 2028
   09ca: LDCI 0190        Load word 400
   09cd: ADI              Add integers (TOS + TOS-1)
   09ce: LESI             Integer TOS-1 < TOS
   09cf: LAND             Logical AND (TOS & TOS-1)
   09d0: FJP  $0a0c       Jump if TOS false
   09d2: SLDL 0b          Short load local MP11
   09d3: LOD  02 0005     Load word at G5 (EMPTYHEAP)
   09d6: SBI              Subtract integers (TOS-1 - TOS)
   09d7: STL  0008        Store TOS into MP8
   09d9: SLDL 08          Short load local MP8
   09da: SLDC 00          Short load constant 0
   09db: GRTI             Integer TOS-1 > TOS
   09dc: SLDL 08          Short load local MP8
   09dd: LDCI 07ec        Load word 2028
   09e0: GRTI             Integer TOS-1 > TOS
   09e1: LAND             Logical AND (TOS & TOS-1)
   09e2: LDA  02 001f     Load addr G31 (UNITABLE)
   09e5: LDL  001b        Load local word MP27
   09e7: SIND 07          Short index load *TOS+7
   09e8: IXA  06          Index array (TOS-1 + TOS * 6)
   09ea: LDL  001b        Load local word MP27
   09ec: INCP 08          Inc field ptr (TOS+8)
   09ee: EQLSTR           String TOS-1 = TOS
   09f0: LAND             Logical AND (TOS & TOS-1)
   09f1: FJP  $0a0c       Jump if TOS false
   09f3: LDL  001b        Load local word MP27
   09f5: SIND 07          Short index load *TOS+7
   09f6: LOD  02 0005     Load word at G5 (EMPTYHEAP)
   09f9: SLDC 00          Short load constant 0
   09fa: LDCI 07ec        Load word 2028
   09fd: LDL  001b        Load local word MP27
   09ff: IND  10          Static index and load word (TOS+16)
   0a01: SLDC 00          Short load constant 0
   0a02: CSP  06          Call standard procedure UNITWRITE
   0a04: LDA  02 0005     Load addr G5 (EMPTYHEAP)
   0a07: CSP  21          Call standard procedure RELEASE
   0a09: SLDC 01          Short load constant 1
   0a0a: STL  000c        Store TOS into MP12
-> 0a0c: LLA  000e        Load local address MP14
   0a0e: SLDC 01          Short load constant 1
   0a0f: LLA  0005        Load local address MP5
   0a11: SLDC 00          Short load constant 0
   0a12: SLDC 00          Short load constant 0
   0a13: CGP  06          Call global procedure SYSIO.6
   0a15: STL  0006        Store TOS into MP6
   0a17: SLDL 06          Short load local MP6
   0a18: SLDC 00          Short load constant 0
   0a19: EQUI             Integer TOS-1 = TOS
   0a1a: FJP  $0a23       Jump if TOS false
   0a1c: LOD  02 0001     Load word at G1 (SYSCOM)
   0a1f: SLDC 09          Short load constant 9
   0a20: STO              Store indirect (TOS into TOS-1)
   0a21: UJP  $0c29       Unconditional jump
-> 0a23: LDA  02 001f     Load addr G31 (UNITABLE)
   0a26: SLDL 06          Short load local MP6
   0a27: IXA  06          Index array (TOS-1 + TOS * 6)
   0a29: STL  001b        Store TOS into MP27
   0a2b: LDL  001a        Load local word MP26
   0a2d: INCP 05          Inc field ptr (TOS+5)
   0a2f: SLDC 01          Short load constant 1
   0a30: STO              Store indirect (TOS into TOS-1)
   0a31: LDL  001a        Load local word MP26
   0a33: INCP 0f          Inc field ptr (TOS+15)
   0a35: SLDC 00          Short load constant 0
   0a36: STO              Store indirect (TOS into TOS-1)
   0a37: LDL  001a        Load local word MP26
   0a39: INCP 07          Inc field ptr (TOS+7)
   0a3b: SLDL 06          Short load local MP6
   0a3c: STO              Store indirect (TOS into TOS-1)
   0a3d: LDL  001a        Load local word MP26
   0a3f: INCP 08          Inc field ptr (TOS+8)
   0a41: LLA  000e        Load local address MP14
   0a43: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0a45: LDL  001a        Load local word MP26
   0a47: INCP 0d          Inc field ptr (TOS+13)
   0a49: SLDC 00          Short load constant 0
   0a4a: STO              Store indirect (TOS into TOS-1)
   0a4b: LDL  001a        Load local word MP26
   0a4d: INCP 06          Inc field ptr (TOS+6)
   0a4f: LDL  001b        Load local word MP27
   0a51: SIND 04          Short index load *TOS+4
   0a52: STO              Store indirect (TOS into TOS-1)
   0a53: LDL  001a        Load local word MP26
   0a55: INCP 1d          Inc field ptr (TOS+29)
   0a57: LDL  001b        Load local word MP27
   0a59: SIND 04          Short index load *TOS+4
   0a5a: LDL  001a        Load local word MP26
   0a5c: SIND 04          Short index load *TOS+4
   0a5d: SLDC 00          Short load constant 0
   0a5e: NEQI             Integer TOS-1 <> TOS
   0a5f: LAND             Logical AND (TOS & TOS-1)
   0a60: STO              Store indirect (TOS into TOS-1)
   0a61: SLDL 05          Short load local MP5
   0a62: LDCN             Load constant NIL
   0a63: NEQI             Integer TOS-1 <> TOS
   0a64: LLA  0012        Load local address MP18
   0a66: SLDC 00          Short load constant 0
   0a67: LDB              Load byte at byte ptr TOS-1 + TOS
   0a68: SLDC 00          Short load constant 0
   0a69: GRTI             Integer TOS-1 > TOS
   0a6a: LAND             Logical AND (TOS & TOS-1)
   0a6b: FJP  $0b0b       Jump if TOS false
   0a6d: LLA  0012        Load local address MP18
   0a6f: SLDL 02          Short load local MP2
   0a70: SLDL 05          Short load local MP5
   0a71: SLDC 00          Short load constant 0
   0a72: SLDC 00          Short load constant 0
   0a73: CGP  0c          Call global procedure SYSIO.12
   0a75: STL  0007        Store TOS into MP7
   0a77: SLDL 02          Short load local MP2
   0a78: FJP  $0a94       Jump if TOS false
   0a7a: SLDL 07          Short load local MP7
   0a7b: SLDC 00          Short load constant 0
   0a7c: EQUI             Integer TOS-1 = TOS
   0a7d: FJP  $0a88       Jump if TOS false
   0a7f: LOD  02 0001     Load word at G1 (SYSCOM)
   0a82: SLDC 0a          Short load constant 10
   0a83: STO              Store indirect (TOS into TOS-1)
   0a84: UJP  $0c0f       Unconditional jump
   0a86: UJP  $0a92       Unconditional jump
-> 0a88: LDL  001a        Load local word MP26
   0a8a: INCP 10          Inc field ptr (TOS+16)
   0a8c: SLDL 05          Short load local MP5
   0a8d: SLDL 07          Short load local MP7
   0a8e: IXA  0d          Index array (TOS-1 + TOS * 13)
   0a90: MOV  0d          Move 13 words (TOS to TOS-1)
-> 0a92: UJP  $0b09       Unconditional jump
-> 0a94: SLDL 07          Short load local MP7
   0a95: SLDC 00          Short load constant 0
   0a96: GRTI             Integer TOS-1 > TOS
   0a97: FJP  $0aa2       Jump if TOS false
   0a99: LOD  02 0001     Load word at G1 (SYSCOM)
   0a9c: SLDC 0b          Short load constant 11
   0a9d: STO              Store indirect (TOS into TOS-1)
   0a9e: UJP  $0c0f       Unconditional jump
   0aa0: UJP  $0b09       Unconditional jump
-> 0aa2: SLDL 0a          Short load local MP10
   0aa3: SLDC 00          Short load constant 0
   0aa4: EQUI             Integer TOS-1 = TOS
   0aa5: FJP  $0aaa       Jump if TOS false
   0aa7: SLDC 05          Short load constant 5
   0aa8: STL  000a        Store TOS into MP10
-> 0aaa: LLA  0012        Load local address MP18
   0aac: SLDL 09          Short load local MP9
   0aad: SLDL 0a          Short load local MP10
   0aae: SLDL 05          Short load local MP5
   0aaf: SLDC 00          Short load constant 0
   0ab0: SLDC 00          Short load constant 0
   0ab1: CLP  0e          Call local procedure SYSIO.14
   0ab3: STL  0007        Store TOS into MP7
   0ab5: SLDL 07          Short load local MP7
   0ab6: SLDC 00          Short load constant 0
   0ab7: GRTI             Integer TOS-1 > TOS
   0ab8: SLDL 0a          Short load local MP10
   0ab9: SLDC 03          Short load constant 3
   0aba: EQUI             Integer TOS-1 = TOS
   0abb: LAND             Logical AND (TOS & TOS-1)
   0abc: FJP  $0ae9       Jump if TOS false
   0abe: SLDL 05          Short load local MP5
   0abf: SLDL 07          Short load local MP7
   0ac0: IXA  0d          Index array (TOS-1 + TOS * 13)
   0ac2: STL  001c        Store TOS into MP28
   0ac4: LDL  001c        Load local word MP28
   0ac6: SIND 01          Short index load *TOS+1
   0ac7: LDL  001c        Load local word MP28
   0ac9: SIND 00          Short index load *TOS+0
   0aca: SBI              Subtract integers (TOS-1 - TOS)
   0acb: FJP  $0ad7       Jump if TOS false
   0acd: LDL  001c        Load local word MP28
   0acf: INCP 01          Inc field ptr (TOS+1)
   0ad1: LDL  001c        Load local word MP28
   0ad3: SIND 01          Short index load *TOS+1
   0ad4: SLDC 01          Short load constant 1
   0ad5: SBI              Subtract integers (TOS-1 - TOS)
   0ad6: STO              Store indirect (TOS into TOS-1)
-> 0ad7: LDL  001c        Load local word MP28
   0ad9: SIND 01          Short index load *TOS+1
   0ada: LDL  001c        Load local word MP28
   0adc: SIND 00          Short index load *TOS+0
   0add: SBI              Subtract integers (TOS-1 - TOS)
   0ade: SLDC 04          Short load constant 4
   0adf: LESI             Integer TOS-1 < TOS
   0ae0: FJP  $0ae9       Jump if TOS false
   0ae2: SLDL 07          Short load local MP7
   0ae3: SLDL 05          Short load local MP5
   0ae4: CGP  08          Call global procedure SYSIO.8
   0ae6: SLDC 00          Short load constant 0
   0ae7: STL  0007        Store TOS into MP7
-> 0ae9: SLDL 07          Short load local MP7
   0aea: SLDC 00          Short load constant 0
   0aeb: EQUI             Integer TOS-1 = TOS
   0aec: FJP  $0af5       Jump if TOS false
   0aee: LOD  02 0001     Load word at G1 (SYSCOM)
   0af1: SLDC 08          Short load constant 8
   0af2: STO              Store indirect (TOS into TOS-1)
   0af3: UJP  $0c0f       Unconditional jump
-> 0af5: LDL  001a        Load local word MP26
   0af7: INCP 10          Inc field ptr (TOS+16)
   0af9: SLDL 05          Short load local MP5
   0afa: SLDL 07          Short load local MP7
   0afb: IXA  0d          Index array (TOS-1 + TOS * 13)
   0afd: MOV  0d          Move 13 words (TOS to TOS-1)
   0aff: LDL  001a        Load local word MP26
   0b01: INCP 0f          Inc field ptr (TOS+15)
   0b03: SLDC 01          Short load constant 1
   0b04: STO              Store indirect (TOS into TOS-1)
   0b05: SLDL 06          Short load local MP6
   0b06: SLDL 05          Short load local MP5
   0b07: CGP  0a          Call global procedure SYSIO.10
-> 0b09: UJP  $0b77       Unconditional jump
-> 0b0b: SLDL 05          Short load local MP5
   0b0c: LDCN             Load constant NIL
   0b0d: EQUI             Integer TOS-1 = TOS
   0b0e: LLA  0012        Load local address MP18
   0b10: SLDC 00          Short load constant 0
   0b11: LDB              Load byte at byte ptr TOS-1 + TOS
   0b12: SLDC 00          Short load constant 0
   0b13: NEQI             Integer TOS-1 <> TOS
   0b14: LAND             Logical AND (TOS & TOS-1)
   0b15: FJP  $0b27       Jump if TOS false
   0b17: LDA  02 001f     Load addr G31 (UNITABLE)
   0b1a: SLDL 06          Short load local MP6
   0b1b: IXA  06          Index array (TOS-1 + TOS * 6)
   0b1d: SIND 04          Short index load *TOS+4
   0b1e: FJP  $0b27       Jump if TOS false
   0b20: LOD  02 0001     Load word at G1 (SYSCOM)
   0b23: SLDC 0a          Short load constant 10
   0b24: STO              Store indirect (TOS into TOS-1)
   0b25: UJP  $0c0f       Unconditional jump
-> 0b27: LDL  001a        Load local word MP26
   0b29: INCP 10          Inc field ptr (TOS+16)
   0b2b: STL  001c        Store TOS into MP28
   0b2d: LDL  001c        Load local word MP28
   0b2f: SLDC 00          Short load constant 0
   0b30: STO              Store indirect (TOS into TOS-1)
   0b31: LDL  001c        Load local word MP28
   0b33: INCP 01          Inc field ptr (TOS+1)
   0b35: LDCI 7fff        Load word 32767
   0b38: STO              Store indirect (TOS into TOS-1)
   0b39: LDL  001b        Load local word MP27
   0b3b: SIND 04          Short index load *TOS+4
   0b3c: FJP  $0b46       Jump if TOS false
   0b3e: LDL  001c        Load local word MP28
   0b40: INCP 01          Inc field ptr (TOS+1)
   0b42: LDL  001b        Load local word MP27
   0b44: SIND 05          Short index load *TOS+5
   0b45: STO              Store indirect (TOS into TOS-1)
-> 0b46: LDL  001c        Load local word MP28
   0b48: INCP 02          Inc field ptr (TOS+2)
   0b4a: SLDC 04          Short load constant 4
   0b4b: SLDC 00          Short load constant 0
   0b4c: SLDL 0a          Short load local MP10
   0b4d: STP              Store packed field (TOS into TOS-1)
   0b4e: LDL  001c        Load local word MP28
   0b50: INCP 03          Inc field ptr (TOS+3)
   0b52: NOP              No operation
   0b53: LSA  00          Load string address: ''
   0b55: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0b57: LDL  001c        Load local word MP28
   0b59: INCP 0b          Inc field ptr (TOS+11)
   0b5b: LDCI 0200        Load word 512
   0b5e: STO              Store indirect (TOS into TOS-1)
   0b5f: LDL  001c        Load local word MP28
   0b61: INCP 0c          Inc field ptr (TOS+12)
   0b63: STL  001d        Store TOS into MP29
   0b65: LDL  001d        Load local word MP29
   0b67: SLDC 04          Short load constant 4
   0b68: SLDC 00          Short load constant 0
   0b69: SLDC 00          Short load constant 0
   0b6a: STP              Store packed field (TOS into TOS-1)
   0b6b: LDL  001d        Load local word MP29
   0b6d: SLDC 05          Short load constant 5
   0b6e: SLDC 04          Short load constant 4
   0b6f: SLDC 00          Short load constant 0
   0b70: STP              Store packed field (TOS into TOS-1)
   0b71: LDL  001d        Load local word MP29
   0b73: SLDC 07          Short load constant 7
   0b74: SLDC 09          Short load constant 9
   0b75: SLDC 00          Short load constant 0
   0b76: STP              Store packed field (TOS into TOS-1)
-> 0b77: SLDL 02          Short load local MP2
   0b78: FJP  $0b8a       Jump if TOS false
   0b7a: LDL  001a        Load local word MP26
   0b7c: INCP 0c          Inc field ptr (TOS+12)
   0b7e: LDL  001a        Load local word MP26
   0b80: IND  11          Static index and load word (TOS+17)
   0b82: LDL  001a        Load local word MP26
   0b84: IND  10          Static index and load word (TOS+16)
   0b86: SBI              Subtract integers (TOS-1 - TOS)
   0b87: STO              Store indirect (TOS into TOS-1)
   0b88: UJP  $0b90       Unconditional jump
-> 0b8a: LDL  001a        Load local word MP26
   0b8c: INCP 0c          Inc field ptr (TOS+12)
   0b8e: SLDC 00          Short load constant 0
   0b8f: STO              Store indirect (TOS into TOS-1)
-> 0b90: LDL  001a        Load local word MP26
   0b92: IND  1d          Static index and load word (TOS+29)
   0b94: FJP  $0c04       Jump if TOS false
   0b96: LDL  001a        Load local word MP26
   0b98: INCP 1f          Inc field ptr (TOS+31)
   0b9a: LDCI 0200        Load word 512
   0b9d: STO              Store indirect (TOS into TOS-1)
   0b9e: LDL  001a        Load local word MP26
   0ba0: INCP 20          Inc field ptr (TOS+32)
   0ba2: SLDC 00          Short load constant 0
   0ba3: STO              Store indirect (TOS into TOS-1)
   0ba4: SLDL 02          Short load local MP2
   0ba5: FJP  $0bb2       Jump if TOS false
   0ba7: LDL  001a        Load local word MP26
   0ba9: INCP 1e          Inc field ptr (TOS+30)
   0bab: LDL  001a        Load local word MP26
   0bad: IND  1b          Static index and load word (TOS+27)
   0baf: STO              Store indirect (TOS into TOS-1)
   0bb0: UJP  $0bba       Unconditional jump
-> 0bb2: LDL  001a        Load local word MP26
   0bb4: INCP 1e          Inc field ptr (TOS+30)
   0bb6: LDCI 0200        Load word 512
   0bb9: STO              Store indirect (TOS into TOS-1)
-> 0bba: LDL  001a        Load local word MP26
   0bbc: INCP 10          Inc field ptr (TOS+16)
   0bbe: STL  001c        Store TOS into MP28
   0bc0: LDL  001c        Load local word MP28
   0bc2: INCP 02          Inc field ptr (TOS+2)
   0bc4: SLDC 04          Short load constant 4
   0bc5: SLDC 00          Short load constant 0
   0bc6: LDP              Load packed field (TOS)
   0bc7: SLDC 03          Short load constant 3
   0bc8: EQUI             Integer TOS-1 = TOS
   0bc9: FJP  $0c04       Jump if TOS false
   0bcb: LDL  001a        Load local word MP26
   0bcd: INCP 0d          Inc field ptr (TOS+13)
   0bcf: SLDC 02          Short load constant 2
   0bd0: STO              Store indirect (TOS into TOS-1)
   0bd1: SLDL 02          Short load local MP2
   0bd2: LNOT             Logical NOT (~TOS)
   0bd3: FJP  $0c04       Jump if TOS false
   0bd5: LDL  001a        Load local word MP26
   0bd7: INCP 21          Inc field ptr (TOS+33)
   0bd9: SLDC 00          Short load constant 0
   0bda: LDCI 0202        Load word 514
   0bdd: SLDC 00          Short load constant 0
   0bde: CSP  0a          Call standard procedure FLCH
   0be0: LDL  001a        Load local word MP26
   0be2: SIND 07          Short index load *TOS+7
   0be3: LDL  001a        Load local word MP26
   0be5: INCP 21          Inc field ptr (TOS+33)
   0be7: SLDC 00          Short load constant 0
   0be8: LDCI 0200        Load word 512
   0beb: LDL  001c        Load local word MP28
   0bed: SIND 00          Short index load *TOS+0
   0bee: SLDC 00          Short load constant 0
   0bef: CSP  06          Call standard procedure UNITWRITE
   0bf1: LDL  001a        Load local word MP26
   0bf3: SIND 07          Short index load *TOS+7
   0bf4: LDL  001a        Load local word MP26
   0bf6: INCP 21          Inc field ptr (TOS+33)
   0bf8: SLDC 00          Short load constant 0
   0bf9: LDCI 0200        Load word 512
   0bfc: LDL  001c        Load local word MP28
   0bfe: SIND 00          Short index load *TOS+0
   0bff: SLDC 01          Short load constant 1
   0c00: ADI              Add integers (TOS + TOS-1)
   0c01: SLDC 00          Short load constant 0
   0c02: CSP  06          Call standard procedure UNITWRITE
-> 0c04: SLDL 02          Short load local MP2
   0c05: FJP  $0c0c       Jump if TOS false
   0c07: SLDL 04          Short load local MP4
   0c08: CGP  03          Call global procedure SYSIO.FRESET
   0c0a: UJP  $0c0f       Unconditional jump
-> 0c0c: SLDL 04          Short load local MP4
   0c0d: CGP  0d          Call global procedure SYSIO.13
-> 0c0f: LOD  02 0001     Load word at G1 (SYSCOM)
   0c12: SIND 00          Short index load *TOS+0
   0c13: SLDC 00          Short load constant 0
   0c14: NEQI             Integer TOS-1 <> TOS
   0c15: FJP  $0c29       Jump if TOS false
   0c17: LDL  001a        Load local word MP26
   0c19: INCP 05          Inc field ptr (TOS+5)
   0c1b: SLDC 00          Short load constant 0
   0c1c: STO              Store indirect (TOS into TOS-1)
   0c1d: LDL  001a        Load local word MP26
   0c1f: INCP 02          Inc field ptr (TOS+2)
   0c21: SLDC 01          Short load constant 1
   0c22: STO              Store indirect (TOS into TOS-1)
   0c23: LDL  001a        Load local word MP26
   0c25: INCP 01          Inc field ptr (TOS+1)
   0c27: SLDC 01          Short load constant 1
   0c28: STO              Store indirect (TOS into TOS-1)
-> 0c29: SLDL 0c          Short load local MP12
   0c2a: FJP  $0c55       Jump if TOS false
   0c2c: LLA  000b        Load local address MP11
   0c2e: CSP  21          Call standard procedure RELEASE
   0c30: LOD  02 0001     Load word at G1 (SYSCOM)
   0c33: INCP 04          Inc field ptr (TOS+4)
   0c35: LDCN             Load constant NIL
   0c36: STO              Store indirect (TOS into TOS-1)
   0c37: LOD  02 0001     Load word at G1 (SYSCOM)
   0c3a: SIND 00          Short index load *TOS+0
   0c3b: STL  000d        Store TOS into MP13
   0c3d: LOD  02 0006     Load word at G6 (SWAPFIB)
   0c40: SIND 07          Short index load *TOS+7
   0c41: LOD  02 0005     Load word at G5 (EMPTYHEAP)
   0c44: SLDC 00          Short load constant 0
   0c45: LDCI 07ec        Load word 2028
   0c48: LOD  02 0006     Load word at G6 (SWAPFIB)
   0c4b: IND  10          Static index and load word (TOS+16)
   0c4d: SLDC 00          Short load constant 0
   0c4e: CSP  05          Call standard procedure UNITREAD
   0c50: LOD  02 0001     Load word at G1 (SYSCOM)
   0c53: SLDL 0d          Short load local MP13
   0c54: STO              Store indirect (TOS into TOS-1)
-> 0c55: UJP  $0c5c       Unconditional jump
-> 0c57: LOD  02 0001     Load word at G1 (SYSCOM)
   0c5a: SLDC 07          Short load constant 7
   0c5b: STO              Store indirect (TOS into TOS-1)
-> 0c5c: RNP  00          Return from nonbase procedure
END

### PROCEDURE SYSIO.FCLOSE(VAR F: FIB; FTYPE: CLOSETYPE) (* P=5 LL=1 *)
  MP1=PARAM2
  MP2=PARAM1
  MP3
  MP4
  MP5
  MP6
  MP7
  MP8
BEGIN
-> 0c72: LOD  02 0001     Load word at G1 (SYSCOM)
   0c75: SLDC 00          Short load constant 0
   0c76: STO              Store indirect (TOS into TOS-1)
   0c77: SLDL 02          Short load local MP2
   0c78: STL  0007        Store TOS into MP7
   0c7a: SLDL 07          Short load local MP7
   0c7b: SIND 05          Short index load *TOS+5
   0c7c: SLDL 07          Short load local MP7
   0c7d: SIND 00          Short index load *TOS+0
   0c7e: LOD  02 0007     Load word at G7 (SYSTERMFIB)
   0c81: SIND 00          Short index load *TOS+0
   0c82: NEQI             Integer TOS-1 <> TOS
   0c83: LAND             Logical AND (TOS & TOS-1)
   0c84: FJP  $0dfe       Jump if TOS false
   0c86: SLDL 07          Short load local MP7
   0c87: SIND 06          Short index load *TOS+6
   0c88: FJP  $0dd5       Jump if TOS false
   0c8a: SLDL 07          Short load local MP7
   0c8b: INCP 10          Inc field ptr (TOS+16)
   0c8d: STL  0008        Store TOS into MP8
   0c8f: SLDL 08          Short load local MP8
   0c90: INCP 03          Inc field ptr (TOS+3)
   0c92: SLDC 00          Short load constant 0
   0c93: LDB              Load byte at byte ptr TOS-1 + TOS
   0c94: SLDC 00          Short load constant 0
   0c95: GRTI             Integer TOS-1 > TOS
   0c96: FJP  $0dd5       Jump if TOS false
   0c98: SLDL 01          Short load local MP1
   0c99: SLDC 03          Short load constant 3
   0c9a: EQUI             Integer TOS-1 = TOS
   0c9b: FJP  $0cba       Jump if TOS false
   0c9d: SLDL 07          Short load local MP7
   0c9e: INCP 0c          Inc field ptr (TOS+12)
   0ca0: SLDL 07          Short load local MP7
   0ca1: IND  0d          Static index and load word (TOS+13)
   0ca3: STO              Store indirect (TOS into TOS-1)
   0ca4: SLDL 08          Short load local MP8
   0ca5: INCP 0c          Inc field ptr (TOS+12)
   0ca7: SLDC 07          Short load constant 7
   0ca8: SLDC 09          Short load constant 9
   0ca9: SLDC 64          Short load constant 100
   0caa: STP              Store packed field (TOS into TOS-1)
   0cab: SLDC 01          Short load constant 1
   0cac: STL  0001        Store TOS into MP1
   0cae: SLDL 07          Short load local MP7
   0caf: IND  1d          Static index and load word (TOS+29)
   0cb1: FJP  $0cba       Jump if TOS false
   0cb3: SLDL 07          Short load local MP7
   0cb4: INCP 1e          Inc field ptr (TOS+30)
   0cb6: SLDL 07          Short load local MP7
   0cb7: IND  1f          Static index and load word (TOS+31)
   0cb9: STO              Store indirect (TOS into TOS-1)
-> 0cba: SLDL 02          Short load local MP2
   0cbb: CGP  0d          Call global procedure SYSIO.13
   0cbd: SLDL 07          Short load local MP7
   0cbe: IND  0f          Static index and load word (TOS+15)
   0cc0: SLDL 08          Short load local MP8
   0cc1: INCP 0c          Inc field ptr (TOS+12)
   0cc3: SLDC 07          Short load constant 7
   0cc4: SLDC 09          Short load constant 9
   0cc5: LDP              Load packed field (TOS)
   0cc6: SLDC 64          Short load constant 100
   0cc7: EQUI             Integer TOS-1 = TOS
   0cc8: LOR              Logical OR (TOS | TOS-1)
   0cc9: SLDL 01          Short load local MP1
   0cca: SLDC 02          Short load constant 2
   0ccb: EQUI             Integer TOS-1 = TOS
   0ccc: LOR              Logical OR (TOS | TOS-1)
   0ccd: FJP  $0dd5       Jump if TOS false
   0ccf: SLDL 07          Short load local MP7
   0cd0: SIND 07          Short index load *TOS+7
   0cd1: SLDL 07          Short load local MP7
   0cd2: INCP 08          Inc field ptr (TOS+8)
   0cd4: SLDC 00          Short load constant 0
   0cd5: LLA  0005        Load local address MP5
   0cd7: SLDC 00          Short load constant 0
   0cd8: SLDC 00          Short load constant 0
   0cd9: CGP  06          Call global procedure SYSIO.6
   0cdb: NEQI             Integer TOS-1 <> TOS
   0cdc: FJP  $0ce5       Jump if TOS false
   0cde: LOD  02 0001     Load word at G1 (SYSCOM)
   0ce1: SLDC 05          Short load constant 5
   0ce2: STO              Store indirect (TOS into TOS-1)
   0ce3: UJP  $0def       Unconditional jump
-> 0ce5: SLDC 01          Short load constant 1
   0ce6: STL  0004        Store TOS into MP4
   0ce8: SLDC 00          Short load constant 0
   0ce9: STL  0006        Store TOS into MP6
-> 0ceb: SLDL 04          Short load local MP4
   0cec: SLDL 05          Short load local MP5
   0ced: SLDC 00          Short load constant 0
   0cee: IXA  0d          Index array (TOS-1 + TOS * 13)
   0cf0: IND  08          Static index and load word (TOS+8)
   0cf2: LEQI             Integer TOS-1 <= TOS
   0cf3: SLDL 06          Short load local MP6
   0cf4: LNOT             Logical NOT (~TOS)
   0cf5: LAND             Logical AND (TOS & TOS-1)
   0cf6: FJP  $0d12       Jump if TOS false
   0cf8: SLDL 05          Short load local MP5
   0cf9: SLDL 04          Short load local MP4
   0cfa: IXA  0d          Index array (TOS-1 + TOS * 13)
   0cfc: SIND 00          Short index load *TOS+0
   0cfd: SLDL 08          Short load local MP8
   0cfe: SIND 00          Short index load *TOS+0
   0cff: EQUI             Integer TOS-1 = TOS
   0d00: SLDL 05          Short load local MP5
   0d01: SLDL 04          Short load local MP4
   0d02: IXA  0d          Index array (TOS-1 + TOS * 13)
   0d04: SIND 01          Short index load *TOS+1
   0d05: SLDL 08          Short load local MP8
   0d06: SIND 01          Short index load *TOS+1
   0d07: EQUI             Integer TOS-1 = TOS
   0d08: LAND             Logical AND (TOS & TOS-1)
   0d09: STL  0006        Store TOS into MP6
   0d0b: SLDL 04          Short load local MP4
   0d0c: SLDC 01          Short load constant 1
   0d0d: ADI              Add integers (TOS + TOS-1)
   0d0e: STL  0004        Store TOS into MP4
   0d10: UJP  $0ceb       Unconditional jump
-> 0d12: SLDL 06          Short load local MP6
   0d13: LNOT             Logical NOT (~TOS)
   0d14: FJP  $0d1d       Jump if TOS false
   0d16: LOD  02 0001     Load word at G1 (SYSCOM)
   0d19: SLDC 06          Short load constant 6
   0d1a: STO              Store indirect (TOS into TOS-1)
   0d1b: UJP  $0def       Unconditional jump
-> 0d1d: SLDL 04          Short load local MP4
   0d1e: SLDC 01          Short load constant 1
   0d1f: SBI              Subtract integers (TOS-1 - TOS)
   0d20: STL  0004        Store TOS into MP4
   0d22: SLDL 01          Short load local MP1
   0d23: SLDC 00          Short load constant 0
   0d24: EQUI             Integer TOS-1 = TOS
   0d25: SLDL 05          Short load local MP5
   0d26: SLDL 04          Short load local MP4
   0d27: IXA  0d          Index array (TOS-1 + TOS * 13)
   0d29: INCP 0c          Inc field ptr (TOS+12)
   0d2b: SLDC 07          Short load constant 7
   0d2c: SLDC 09          Short load constant 9
   0d2d: LDP              Load packed field (TOS)
   0d2e: SLDC 64          Short load constant 100
   0d2f: EQUI             Integer TOS-1 = TOS
   0d30: LAND             Logical AND (TOS & TOS-1)
   0d31: SLDL 01          Short load local MP1
   0d32: SLDC 02          Short load constant 2
   0d33: EQUI             Integer TOS-1 = TOS
   0d34: LOR              Logical OR (TOS | TOS-1)
   0d35: FJP  $0d3d       Jump if TOS false
   0d37: SLDL 04          Short load local MP4
   0d38: SLDL 05          Short load local MP5
   0d39: CGP  08          Call global procedure SYSIO.8
   0d3b: UJP  $0dd0       Unconditional jump
-> 0d3d: SLDL 08          Short load local MP8
   0d3e: INCP 03          Inc field ptr (TOS+3)
   0d40: SLDC 01          Short load constant 1
   0d41: SLDL 05          Short load local MP5
   0d42: SLDC 00          Short load constant 0
   0d43: SLDC 00          Short load constant 0
   0d44: CGP  0c          Call global procedure SYSIO.12
   0d46: STL  0003        Store TOS into MP3
   0d48: SLDL 03          Short load local MP3
   0d49: SLDC 00          Short load constant 0
   0d4a: NEQI             Integer TOS-1 <> TOS
   0d4b: SLDL 03          Short load local MP3
   0d4c: SLDL 04          Short load local MP4
   0d4d: NEQI             Integer TOS-1 <> TOS
   0d4e: LAND             Logical AND (TOS & TOS-1)
   0d4f: FJP  $0d5f       Jump if TOS false
   0d51: SLDL 03          Short load local MP3
   0d52: SLDL 05          Short load local MP5
   0d53: CGP  08          Call global procedure SYSIO.8
   0d55: SLDL 03          Short load local MP3
   0d56: SLDL 04          Short load local MP4
   0d57: LESI             Integer TOS-1 < TOS
   0d58: FJP  $0d5f       Jump if TOS false
   0d5a: SLDL 04          Short load local MP4
   0d5b: SLDC 01          Short load constant 1
   0d5c: SBI              Subtract integers (TOS-1 - TOS)
   0d5d: STL  0004        Store TOS into MP4
-> 0d5f: SLDL 05          Short load local MP5
   0d60: SLDL 04          Short load local MP4
   0d61: IXA  0d          Index array (TOS-1 + TOS * 13)
   0d63: INCP 0c          Inc field ptr (TOS+12)
   0d65: SLDC 07          Short load constant 7
   0d66: SLDC 09          Short load constant 9
   0d67: LDP              Load packed field (TOS)
   0d68: SLDC 64          Short load constant 100
   0d69: EQUI             Integer TOS-1 = TOS
   0d6a: FJP  $0d82       Jump if TOS false
   0d6c: SLDL 08          Short load local MP8
   0d6d: INCP 0c          Inc field ptr (TOS+12)
   0d6f: SLDC 07          Short load constant 7
   0d70: SLDC 09          Short load constant 9
   0d71: LDP              Load packed field (TOS)
   0d72: SLDC 64          Short load constant 100
   0d73: EQUI             Integer TOS-1 = TOS
   0d74: FJP  $0d80       Jump if TOS false
   0d76: SLDL 08          Short load local MP8
   0d77: INCP 0c          Inc field ptr (TOS+12)
   0d79: LDA  02 0012     Load addr G18
   0d7c: MOV  01          Move 1 words (TOS to TOS-1)
   0d7e: UJP  $0d80       Unconditional jump
-> 0d80: UJP  $0da5       Unconditional jump
-> 0d82: SLDL 07          Short load local MP7
   0d83: IND  0f          Static index and load word (TOS+15)
   0d85: LDA  02 0012     Load addr G18
   0d88: SLDC 04          Short load constant 4
   0d89: SLDC 00          Short load constant 0
   0d8a: LDP              Load packed field (TOS)
   0d8b: SLDC 00          Short load constant 0
   0d8c: NEQI             Integer TOS-1 <> TOS
   0d8d: LAND             Logical AND (TOS & TOS-1)
   0d8e: FJP  $0d9a       Jump if TOS false
   0d90: SLDL 08          Short load local MP8
   0d91: INCP 0c          Inc field ptr (TOS+12)
   0d93: LDA  02 0012     Load addr G18
   0d96: MOV  01          Move 1 words (TOS to TOS-1)
   0d98: UJP  $0da5       Unconditional jump
-> 0d9a: SLDL 08          Short load local MP8
   0d9b: INCP 0c          Inc field ptr (TOS+12)
   0d9d: SLDL 05          Short load local MP5
   0d9e: SLDL 04          Short load local MP4
   0d9f: IXA  0d          Index array (TOS-1 + TOS * 13)
   0da1: INCP 0c          Inc field ptr (TOS+12)
   0da3: MOV  01          Move 1 words (TOS to TOS-1)
-> 0da5: SLDL 08          Short load local MP8
   0da6: INCP 01          Inc field ptr (TOS+1)
   0da8: SLDL 08          Short load local MP8
   0da9: SIND 00          Short index load *TOS+0
   0daa: SLDL 07          Short load local MP7
   0dab: IND  0c          Static index and load word (TOS+12)
   0dad: ADI              Add integers (TOS + TOS-1)
   0dae: STO              Store indirect (TOS into TOS-1)
   0daf: SLDL 07          Short load local MP7
   0db0: IND  1d          Static index and load word (TOS+29)
   0db2: FJP  $0dbb       Jump if TOS false
   0db4: SLDL 08          Short load local MP8
   0db5: INCP 0b          Inc field ptr (TOS+11)
   0db7: SLDL 07          Short load local MP7
   0db8: IND  1e          Static index and load word (TOS+30)
   0dba: STO              Store indirect (TOS into TOS-1)
-> 0dbb: SLDL 07          Short load local MP7
   0dbc: INCP 12          Inc field ptr (TOS+18)
   0dbe: SLDC 0c          Short load constant 12
   0dbf: SLDC 04          Short load constant 4
   0dc0: SLDC 00          Short load constant 0
   0dc1: STP              Store packed field (TOS into TOS-1)
   0dc2: SLDL 07          Short load local MP7
   0dc3: INCP 0f          Inc field ptr (TOS+15)
   0dc5: SLDC 00          Short load constant 0
   0dc6: STO              Store indirect (TOS into TOS-1)
   0dc7: SLDL 05          Short load local MP5
   0dc8: SLDL 04          Short load local MP4
   0dc9: IXA  0d          Index array (TOS-1 + TOS * 13)
   0dcb: SLDL 07          Short load local MP7
   0dcc: INCP 10          Inc field ptr (TOS+16)
   0dce: MOV  0d          Move 13 words (TOS to TOS-1)
-> 0dd0: SLDL 07          Short load local MP7
   0dd1: SIND 07          Short index load *TOS+7
   0dd2: SLDL 05          Short load local MP5
   0dd3: CGP  0a          Call global procedure SYSIO.10
-> 0dd5: SLDL 01          Short load local MP1
   0dd6: SLDC 02          Short load constant 2
   0dd7: EQUI             Integer TOS-1 = TOS
   0dd8: FJP  $0def       Jump if TOS false
   0dda: SLDL 07          Short load local MP7
   0ddb: INCP 13          Inc field ptr (TOS+19)
   0ddd: SLDC 00          Short load constant 0
   0dde: LDB              Load byte at byte ptr TOS-1 + TOS
   0ddf: SLDC 00          Short load constant 0
   0de0: EQUI             Integer TOS-1 = TOS
   0de1: FJP  $0def       Jump if TOS false
   0de3: LDA  02 001f     Load addr G31 (UNITABLE)
   0de6: SLDL 07          Short load local MP7
   0de7: SIND 07          Short index load *TOS+7
   0de8: IXA  06          Index array (TOS-1 + TOS * 6)
   0dea: NOP              No operation
   0deb: LSA  00          Load string address: ''
   0ded: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0def: SLDL 07          Short load local MP7
   0df0: INCP 02          Inc field ptr (TOS+2)
   0df2: SLDC 01          Short load constant 1
   0df3: STO              Store indirect (TOS into TOS-1)
   0df4: SLDL 07          Short load local MP7
   0df5: INCP 01          Inc field ptr (TOS+1)
   0df7: SLDC 01          Short load constant 1
   0df8: STO              Store indirect (TOS into TOS-1)
   0df9: SLDL 07          Short load local MP7
   0dfa: INCP 05          Inc field ptr (TOS+5)
   0dfc: SLDC 00          Short load constant 0
   0dfd: STO              Store indirect (TOS into TOS-1)
-> 0dfe: RNP  00          Return from nonbase procedure
END

### FUNCTION SYSIO.FUNC6(PARAM1; PARAM2; PARAM3): RETVAL (* P=6 LL=1 *)
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
-> 0474: SLDC 00          Short load constant 0
   0475: STL  0001        Store TOS into MP1
   0477: SLDL 03          Short load local MP3
   0478: LDCN             Load constant NIL
   0479: STO              Store indirect (TOS into TOS-1)
   047a: SLDC 00          Short load constant 0
   047b: STL  0008        Store TOS into MP8
   047d: SLDC 00          Short load constant 0
   047e: STL  0007        Store TOS into MP7
   0480: SLDL 05          Short load local MP5
   0481: SLDC 00          Short load constant 0
   0482: LDB              Load byte at byte ptr TOS-1 + TOS
   0483: SLDC 00          Short load constant 0
   0484: GRTI             Integer TOS-1 > TOS
   0485: FJP  $04ff       Jump if TOS false
   0487: SLDL 05          Short load local MP5
   0488: SLDC 01          Short load constant 1
   0489: LDB              Load byte at byte ptr TOS-1 + TOS
   048a: SLDC 23          Short load constant 35
   048b: EQUI             Integer TOS-1 = TOS
   048c: SLDL 05          Short load local MP5
   048d: SLDC 00          Short load constant 0
   048e: LDB              Load byte at byte ptr TOS-1 + TOS
   048f: SLDC 01          Short load constant 1
   0490: GRTI             Integer TOS-1 > TOS
   0491: LAND             Logical AND (TOS & TOS-1)
   0492: FJP  $04da       Jump if TOS false
   0494: SLDC 01          Short load constant 1
   0495: STL  0008        Store TOS into MP8
   0497: SLDC 00          Short load constant 0
   0498: STL  0006        Store TOS into MP6
   049a: SLDC 02          Short load constant 2
   049b: STL  000a        Store TOS into MP10
-> 049d: SLDL 05          Short load local MP5
   049e: SLDL 0a          Short load local MP10
   049f: LDB              Load byte at byte ptr TOS-1 + TOS
   04a0: SLDC 30          Short load constant 48
   04a1: GEQI             Integer TOS-1 >= TOS
   04a2: SLDL 05          Short load local MP5
   04a3: SLDL 0a          Short load local MP10
   04a4: LDB              Load byte at byte ptr TOS-1 + TOS
   04a5: SLDC 39          Short load constant 57
   04a6: LEQI             Integer TOS-1 <= TOS
   04a7: LAND             Logical AND (TOS & TOS-1)
   04a8: FJP  $04b7       Jump if TOS false
   04aa: SLDL 06          Short load local MP6
   04ab: SLDC 0a          Short load constant 10
   04ac: MPI              Multiply integers (TOS * TOS-1)
   04ad: SLDL 05          Short load local MP5
   04ae: SLDL 0a          Short load local MP10
   04af: LDB              Load byte at byte ptr TOS-1 + TOS
   04b0: ADI              Add integers (TOS + TOS-1)
   04b1: SLDC 30          Short load constant 48
   04b2: SBI              Subtract integers (TOS-1 - TOS)
   04b3: STL  0006        Store TOS into MP6
   04b5: UJP  $04ba       Unconditional jump
-> 04b7: SLDC 00          Short load constant 0
   04b8: STL  0008        Store TOS into MP8
-> 04ba: SLDL 0a          Short load local MP10
   04bb: SLDC 01          Short load constant 1
   04bc: ADI              Add integers (TOS + TOS-1)
   04bd: STL  000a        Store TOS into MP10
   04bf: SLDL 0a          Short load local MP10
   04c0: SLDL 05          Short load local MP5
   04c1: SLDC 00          Short load constant 0
   04c2: LDB              Load byte at byte ptr TOS-1 + TOS
   04c3: GRTI             Integer TOS-1 > TOS
   04c4: SLDL 08          Short load local MP8
   04c5: LNOT             Logical NOT (~TOS)
   04c6: LOR              Logical OR (TOS | TOS-1)
   04c7: FJP  $049d       Jump if TOS false
   04c9: SLDL 08          Short load local MP8
   04ca: SLDL 06          Short load local MP6
   04cb: SLDC 00          Short load constant 0
   04cc: GRTI             Integer TOS-1 > TOS
   04cd: LAND             Logical AND (TOS & TOS-1)
   04ce: SLDL 06          Short load local MP6
   04cf: SLDC 14          Short load constant 20
   04d0: LEQI             Integer TOS-1 <= TOS
   04d1: LAND             Logical AND (TOS & TOS-1)
   04d2: STL  0007        Store TOS into MP7
   04d4: SLDL 04          Short load local MP4
   04d5: SLDL 07          Short load local MP7
   04d6: LNOT             Logical NOT (~TOS)
   04d7: LAND             Logical AND (TOS & TOS-1)
   04d8: STL  0004        Store TOS into MP4
-> 04da: SLDL 07          Short load local MP7
   04db: LNOT             Logical NOT (~TOS)
   04dc: FJP  $04ff       Jump if TOS false
   04de: SLDC 00          Short load constant 0
   04df: STL  0008        Store TOS into MP8
   04e1: SLDC 14          Short load constant 20
   04e2: STL  0006        Store TOS into MP6
-> 04e4: SLDL 05          Short load local MP5
   04e5: LDA  02 001f     Load addr G31 (UNITABLE)
   04e8: SLDL 06          Short load local MP6
   04e9: IXA  06          Index array (TOS-1 + TOS * 6)
   04eb: EQLSTR           String TOS-1 = TOS
   04ed: STL  0008        Store TOS into MP8
   04ef: SLDL 08          Short load local MP8
   04f0: LNOT             Logical NOT (~TOS)
   04f1: FJP  $04f8       Jump if TOS false
   04f3: SLDL 06          Short load local MP6
   04f4: SLDC 01          Short load constant 1
   04f5: SBI              Subtract integers (TOS-1 - TOS)
   04f6: STL  0006        Store TOS into MP6
-> 04f8: SLDL 08          Short load local MP8
   04f9: SLDL 06          Short load local MP6
   04fa: SLDC 00          Short load constant 0
   04fb: EQUI             Integer TOS-1 = TOS
   04fc: LOR              Logical OR (TOS | TOS-1)
   04fd: FJP  $04e4       Jump if TOS false
-> 04ff: SLDL 08          Short load local MP8
   0500: FJP  $0562       Jump if TOS false
   0502: LDA  02 001f     Load addr G31 (UNITABLE)
   0505: SLDL 06          Short load local MP6
   0506: IXA  06          Index array (TOS-1 + TOS * 6)
   0508: SIND 04          Short index load *TOS+4
   0509: FJP  $0562       Jump if TOS false
   050b: LOD  02 0001     Load word at G1 (SYSCOM)
   050e: STL  000b        Store TOS into MP11
   0510: SLDC 00          Short load constant 0
   0511: STL  0008        Store TOS into MP8
   0513: SLDL 0b          Short load local MP11
   0514: SIND 04          Short index load *TOS+4
   0515: LDCN             Load constant NIL
   0516: NEQI             Integer TOS-1 <> TOS
   0517: FJP  $053a       Jump if TOS false
   0519: SLDL 05          Short load local MP5
   051a: SLDL 0b          Short load local MP11
   051b: SIND 04          Short index load *TOS+4
   051c: SLDC 00          Short load constant 0
   051d: IXA  0d          Index array (TOS-1 + TOS * 13)
   051f: INCP 03          Inc field ptr (TOS+3)
   0521: EQLSTR           String TOS-1 = TOS
   0523: FJP  $053a       Jump if TOS false
   0525: LLA  000a        Load local address MP10
   0527: LLA  0009        Load local address MP9
   0529: CSP  09          Call standard procedure TIME
   052b: SLDL 09          Short load local MP9
   052c: SLDL 0b          Short load local MP11
   052d: SIND 04          Short index load *TOS+4
   052e: SLDC 00          Short load constant 0
   052f: IXA  0d          Index array (TOS-1 + TOS * 13)
   0531: IND  09          Static index and load word (TOS+9)
   0533: SBI              Subtract integers (TOS-1 - TOS)
   0534: LDCI 012c        Load word 300
   0537: LEQI             Integer TOS-1 <= TOS
   0538: STL  0008        Store TOS into MP8
-> 053a: SLDL 08          Short load local MP8
   053b: LNOT             Logical NOT (~TOS)
   053c: FJP  $0562       Jump if TOS false
   053e: SLDL 07          Short load local MP7
   053f: STL  0008        Store TOS into MP8
   0541: SLDL 06          Short load local MP6
   0542: SLDC 00          Short load constant 0
   0543: SLDC 00          Short load constant 0
   0544: CGP  09          Call global procedure SYSIO.9
   0546: FJP  $055c       Jump if TOS false
   0548: SLDL 07          Short load local MP7
   0549: LNOT             Logical NOT (~TOS)
   054a: FJP  $055a       Jump if TOS false
   054c: SLDL 05          Short load local MP5
   054d: SLDL 0b          Short load local MP11
   054e: SIND 04          Short index load *TOS+4
   054f: SLDC 00          Short load constant 0
   0550: IXA  0d          Index array (TOS-1 + TOS * 13)
   0552: INCP 03          Inc field ptr (TOS+3)
   0554: EQLSTR           String TOS-1 = TOS
   0556: STL  0008        Store TOS into MP8
   0558: UJP  $055a       Unconditional jump
-> 055a: UJP  $0562       Unconditional jump
-> 055c: CSP  22          Call standard procedure IORESULT
   055e: SLDC 00          Short load constant 0
   055f: EQUI             Integer TOS-1 = TOS
   0560: STL  0008        Store TOS into MP8
-> 0562: SLDL 08          Short load local MP8
   0563: LNOT             Logical NOT (~TOS)
   0564: SLDL 04          Short load local MP4
   0565: LAND             Logical AND (TOS & TOS-1)
   0566: FJP  $0594       Jump if TOS false
   0568: SLDC 14          Short load constant 20
   0569: STL  0006        Store TOS into MP6
-> 056b: LDA  02 001f     Load addr G31 (UNITABLE)
   056e: SLDL 06          Short load local MP6
   056f: IXA  06          Index array (TOS-1 + TOS * 6)
   0571: STL  000b        Store TOS into MP11
   0573: SLDL 0b          Short load local MP11
   0574: SIND 04          Short index load *TOS+4
   0575: FJP  $0584       Jump if TOS false
   0577: SLDL 06          Short load local MP6
   0578: SLDC 00          Short load constant 0
   0579: SLDC 00          Short load constant 0
   057a: CGP  09          Call global procedure SYSIO.9
   057c: FJP  $0584       Jump if TOS false
   057e: SLDL 05          Short load local MP5
   057f: SLDL 0b          Short load local MP11
   0580: EQLSTR           String TOS-1 = TOS
   0582: STL  0008        Store TOS into MP8
-> 0584: SLDL 08          Short load local MP8
   0585: LNOT             Logical NOT (~TOS)
   0586: FJP  $058d       Jump if TOS false
   0588: SLDL 06          Short load local MP6
   0589: SLDC 01          Short load constant 1
   058a: SBI              Subtract integers (TOS-1 - TOS)
   058b: STL  0006        Store TOS into MP6
-> 058d: SLDL 08          Short load local MP8
   058e: SLDL 06          Short load local MP6
   058f: SLDC 00          Short load constant 0
   0590: EQUI             Integer TOS-1 = TOS
   0591: LOR              Logical OR (TOS | TOS-1)
   0592: FJP  $056b       Jump if TOS false
-> 0594: SLDL 08          Short load local MP8
   0595: FJP  $05c9       Jump if TOS false
   0597: LDA  02 001f     Load addr G31 (UNITABLE)
   059a: SLDL 06          Short load local MP6
   059b: IXA  06          Index array (TOS-1 + TOS * 6)
   059d: STL  000b        Store TOS into MP11
   059f: SLDL 06          Short load local MP6
   05a0: STL  0001        Store TOS into MP1
   05a2: SLDL 0b          Short load local MP11
   05a3: SLDC 00          Short load constant 0
   05a4: LDB              Load byte at byte ptr TOS-1 + TOS
   05a5: SLDC 00          Short load constant 0
   05a6: GRTI             Integer TOS-1 > TOS
   05a7: FJP  $05ad       Jump if TOS false
   05a9: SLDL 05          Short load local MP5
   05aa: SLDL 0b          Short load local MP11
   05ab: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 05ad: SLDL 0b          Short load local MP11
   05ae: SIND 04          Short index load *TOS+4
   05af: LOD  02 0001     Load word at G1 (SYSCOM)
   05b2: SIND 04          Short index load *TOS+4
   05b3: LDCN             Load constant NIL
   05b4: NEQI             Integer TOS-1 <> TOS
   05b5: LAND             Logical AND (TOS & TOS-1)
   05b6: FJP  $05c9       Jump if TOS false
   05b8: SLDL 03          Short load local MP3
   05b9: LOD  02 0001     Load word at G1 (SYSCOM)
   05bc: SIND 04          Short index load *TOS+4
   05bd: STO              Store indirect (TOS into TOS-1)
   05be: LLA  000a        Load local address MP10
   05c0: SLDL 03          Short load local MP3
   05c1: SIND 00          Short index load *TOS+0
   05c2: SLDC 00          Short load constant 0
   05c3: IXA  0d          Index array (TOS-1 + TOS * 13)
   05c5: INCP 09          Inc field ptr (TOS+9)
   05c7: CSP  09          Call standard procedure TIME
-> 05c9: RNP  01          Return from nonbase procedure
END

### PROCEDURE SYSIO.PROC7(PARAM1; PARAM2; PARAM3) (* P=7 LL=1 *)
  MP1=PARAM3
  MP2=PARAM2
  MP3=PARAM1
  MP4
  MP5
  MP6
BEGIN
-> 0674: SLDL 01          Short load local MP1
   0675: SLDC 00          Short load constant 0
   0676: IXA  0d          Index array (TOS-1 + TOS * 13)
   0678: STL  0005        Store TOS into MP5
   067a: SLDL 05          Short load local MP5
   067b: IND  08          Static index and load word (TOS+8)
   067d: STL  0004        Store TOS into MP4
   067f: SLDL 02          Short load local MP2
   0680: STL  0006        Store TOS into MP6
-> 0682: SLDL 04          Short load local MP4
   0683: SLDL 06          Short load local MP6
   0684: GEQI             Integer TOS-1 >= TOS
   0685: FJP  $069a       Jump if TOS false
   0687: SLDL 01          Short load local MP1
   0688: SLDL 04          Short load local MP4
   0689: SLDC 01          Short load constant 1
   068a: ADI              Add integers (TOS + TOS-1)
   068b: IXA  0d          Index array (TOS-1 + TOS * 13)
   068d: SLDL 01          Short load local MP1
   068e: SLDL 04          Short load local MP4
   068f: IXA  0d          Index array (TOS-1 + TOS * 13)
   0691: MOV  0d          Move 13 words (TOS to TOS-1)
   0693: SLDL 04          Short load local MP4
   0694: SLDC 01          Short load constant 1
   0695: SBI              Subtract integers (TOS-1 - TOS)
   0696: STL  0004        Store TOS into MP4
   0698: UJP  $0682       Unconditional jump
-> 069a: SLDL 01          Short load local MP1
   069b: SLDL 02          Short load local MP2
   069c: IXA  0d          Index array (TOS-1 + TOS * 13)
   069e: SLDL 03          Short load local MP3
   069f: MOV  0d          Move 13 words (TOS to TOS-1)
   06a1: SLDL 05          Short load local MP5
   06a2: INCP 08          Inc field ptr (TOS+8)
   06a4: SLDL 05          Short load local MP5
   06a5: IND  08          Static index and load word (TOS+8)
   06a7: SLDC 01          Short load constant 1
   06a8: ADI              Add integers (TOS + TOS-1)
   06a9: STO              Store indirect (TOS into TOS-1)
-> 06aa: RNP  00          Return from nonbase procedure
END

### PROCEDURE SYSIO.PROC8(PARAM1; PARAM2) (* P=8 LL=1 *)
  MP1=PARAM2
  MP2=PARAM1
  MP3
  MP4
  MP5
BEGIN
-> 0628: SLDL 01          Short load local MP1
   0629: SLDC 00          Short load constant 0
   062a: IXA  0d          Index array (TOS-1 + TOS * 13)
   062c: STL  0004        Store TOS into MP4
   062e: SLDL 02          Short load local MP2
   062f: STL  0003        Store TOS into MP3
   0631: SLDL 04          Short load local MP4
   0632: IND  08          Static index and load word (TOS+8)
   0634: SLDC 01          Short load constant 1
   0635: SBI              Subtract integers (TOS-1 - TOS)
   0636: STL  0005        Store TOS into MP5
-> 0638: SLDL 03          Short load local MP3
   0639: SLDL 05          Short load local MP5
   063a: LEQI             Integer TOS-1 <= TOS
   063b: FJP  $0650       Jump if TOS false
   063d: SLDL 01          Short load local MP1
   063e: SLDL 03          Short load local MP3
   063f: IXA  0d          Index array (TOS-1 + TOS * 13)
   0641: SLDL 01          Short load local MP1
   0642: SLDL 03          Short load local MP3
   0643: SLDC 01          Short load constant 1
   0644: ADI              Add integers (TOS + TOS-1)
   0645: IXA  0d          Index array (TOS-1 + TOS * 13)
   0647: MOV  0d          Move 13 words (TOS to TOS-1)
   0649: SLDL 03          Short load local MP3
   064a: SLDC 01          Short load constant 1
   064b: ADI              Add integers (TOS + TOS-1)
   064c: STL  0003        Store TOS into MP3
   064e: UJP  $0638       Unconditional jump
-> 0650: SLDL 01          Short load local MP1
   0651: SLDL 04          Short load local MP4
   0652: IND  08          Static index and load word (TOS+8)
   0654: IXA  0d          Index array (TOS-1 + TOS * 13)
   0656: INCP 03          Inc field ptr (TOS+3)
   0658: NOP              No operation
   0659: LSA  00          Load string address: ''
   065b: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   065d: SLDL 04          Short load local MP4
   065e: INCP 08          Inc field ptr (TOS+8)
   0660: SLDL 04          Short load local MP4
   0661: IND  08          Static index and load word (TOS+8)
   0663: SLDC 01          Short load constant 1
   0664: SBI              Subtract integers (TOS-1 - TOS)
   0665: STO              Store indirect (TOS into TOS-1)
-> 0666: RNP  00          Return from nonbase procedure
END

### FUNCTION SYSIO.FUNC9(PARAM1): RETVAL (* P=9 LL=1 *)
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
-> 0258: SLDC 00          Short load constant 0
   0259: STL  0001        Store TOS into MP1
   025b: LOD  02 0001     Load word at G1 (SYSCOM)
   025e: STL  0007        Store TOS into MP7
   0260: LDA  02 001f     Load addr G31 (UNITABLE)
   0263: SLDL 03          Short load local MP3
   0264: IXA  06          Index array (TOS-1 + TOS * 6)
   0266: STL  0008        Store TOS into MP8
   0268: SLDL 07          Short load local MP7
   0269: SIND 04          Short index load *TOS+4
   026a: LDCN             Load constant NIL
   026b: EQUI             Integer TOS-1 = TOS
   026c: FJP  $0276       Jump if TOS false
   026e: SLDL 07          Short load local MP7
   026f: INCP 04          Inc field ptr (TOS+4)
   0271: LDCI 03f6        Load word 1014
   0274: CSP  01          Call standard procedure NEW
-> 0276: SLDL 03          Short load local MP3
   0277: SLDL 07          Short load local MP7
   0278: SIND 04          Short index load *TOS+4
   0279: SLDC 00          Short load constant 0
   027a: LDCI 07ec        Load word 2028
   027d: SLDC 02          Short load constant 2
   027e: SLDC 00          Short load constant 0
   027f: CSP  05          Call standard procedure UNITREAD
   0281: SLDL 07          Short load local MP7
   0282: SIND 00          Short index load *TOS+0
   0283: SLDC 00          Short load constant 0
   0284: EQUI             Integer TOS-1 = TOS
   0285: STL  0005        Store TOS into MP5
   0287: SLDL 05          Short load local MP5
   0288: FJP  $0377       Jump if TOS false
   028a: SLDL 07          Short load local MP7
   028b: SIND 04          Short index load *TOS+4
   028c: SLDC 00          Short load constant 0
   028d: IXA  0d          Index array (TOS-1 + TOS * 13)
   028f: STL  0009        Store TOS into MP9
   0291: SLDC 00          Short load constant 0
   0292: STL  0005        Store TOS into MP5
   0294: SLDL 09          Short load local MP9
   0295: SIND 00          Short index load *TOS+0
   0296: SLDC 00          Short load constant 0
   0297: EQUI             Integer TOS-1 = TOS
   0298: SLDL 07          Short load local MP7
   0299: INCP 1d          Inc field ptr (TOS+29)
   029b: SLDC 02          Short load constant 2
   029c: SLDC 07          Short load constant 7
   029d: LDP              Load packed field (TOS)
   029e: SLDC 02          Short load constant 2
   029f: EQUI             Integer TOS-1 = TOS
   02a0: SLDL 07          Short load local MP7
   02a1: INCP 1d          Inc field ptr (TOS+29)
   02a3: SLDC 02          Short load constant 2
   02a4: SLDC 07          Short load constant 7
   02a5: LDP              Load packed field (TOS)
   02a6: SLDC 01          Short load constant 1
   02a7: EQUI             Integer TOS-1 = TOS
   02a8: SLDL 07          Short load local MP7
   02a9: INCP 1d          Inc field ptr (TOS+29)
   02ab: SLDC 02          Short load constant 2
   02ac: SLDC 07          Short load constant 7
   02ad: LDP              Load packed field (TOS)
   02ae: SLDC 03          Short load constant 3
   02af: EQUI             Integer TOS-1 = TOS
   02b0: LOR              Logical OR (TOS | TOS-1)
   02b1: SLDL 09          Short load local MP9
   02b2: INCP 02          Inc field ptr (TOS+2)
   02b4: SLDC 04          Short load constant 4
   02b5: SLDC 00          Short load constant 0
   02b6: LDP              Load packed field (TOS)
   02b7: SLDC 08          Short load constant 8
   02b8: EQUI             Integer TOS-1 = TOS
   02b9: LAND             Logical AND (TOS & TOS-1)
   02ba: LOR              Logical OR (TOS | TOS-1)
   02bb: SLDL 07          Short load local MP7
   02bc: INCP 1d          Inc field ptr (TOS+29)
   02be: SLDC 02          Short load constant 2
   02bf: SLDC 07          Short load constant 7
   02c0: LDP              Load packed field (TOS)
   02c1: SLDC 00          Short load constant 0
   02c2: EQUI             Integer TOS-1 = TOS
   02c3: SLDL 09          Short load local MP9
   02c4: INCP 02          Inc field ptr (TOS+2)
   02c6: SLDC 04          Short load constant 4
   02c7: SLDC 00          Short load constant 0
   02c8: LDP              Load packed field (TOS)
   02c9: SLDC 00          Short load constant 0
   02ca: EQUI             Integer TOS-1 = TOS
   02cb: LAND             Logical AND (TOS & TOS-1)
   02cc: LOR              Logical OR (TOS | TOS-1)
   02cd: LAND             Logical AND (TOS & TOS-1)
   02ce: FJP  $0361       Jump if TOS false
   02d0: SLDL 09          Short load local MP9
   02d1: INCP 03          Inc field ptr (TOS+3)
   02d3: SLDC 00          Short load constant 0
   02d4: LDB              Load byte at byte ptr TOS-1 + TOS
   02d5: SLDC 00          Short load constant 0
   02d6: GRTI             Integer TOS-1 > TOS
   02d7: SLDL 09          Short load local MP9
   02d8: INCP 03          Inc field ptr (TOS+3)
   02da: SLDC 00          Short load constant 0
   02db: LDB              Load byte at byte ptr TOS-1 + TOS
   02dc: SLDC 07          Short load constant 7
   02dd: LEQI             Integer TOS-1 <= TOS
   02de: LAND             Logical AND (TOS & TOS-1)
   02df: SLDL 09          Short load local MP9
   02e0: IND  08          Static index and load word (TOS+8)
   02e2: SLDC 00          Short load constant 0
   02e3: GEQI             Integer TOS-1 >= TOS
   02e4: LAND             Logical AND (TOS & TOS-1)
   02e5: SLDL 09          Short load local MP9
   02e6: IND  08          Static index and load word (TOS+8)
   02e8: SLDC 4d          Short load constant 77
   02e9: LEQI             Integer TOS-1 <= TOS
   02ea: LAND             Logical AND (TOS & TOS-1)
   02eb: FJP  $0361       Jump if TOS false
   02ed: SLDC 01          Short load constant 1
   02ee: STL  0005        Store TOS into MP5
   02f0: SLDL 09          Short load local MP9
   02f1: INCP 03          Inc field ptr (TOS+3)
   02f3: SLDL 08          Short load local MP8
   02f4: NEQSTR           String TOS-1 <> TOS
   02f6: FJP  $0361       Jump if TOS false
   02f8: SLDC 01          Short load constant 1
   02f9: STL  0004        Store TOS into MP4
-> 02fb: SLDL 04          Short load local MP4
   02fc: SLDL 09          Short load local MP9
   02fd: IND  08          Static index and load word (TOS+8)
   02ff: LEQI             Integer TOS-1 <= TOS
   0300: FJP  $0348       Jump if TOS false
   0302: SLDL 07          Short load local MP7
   0303: SIND 04          Short index load *TOS+4
   0304: SLDL 04          Short load local MP4
   0305: IXA  0d          Index array (TOS-1 + TOS * 13)
   0307: STL  000a        Store TOS into MP10
   0309: SLDL 0a          Short load local MP10
   030a: INCP 03          Inc field ptr (TOS+3)
   030c: SLDC 00          Short load constant 0
   030d: LDB              Load byte at byte ptr TOS-1 + TOS
   030e: SLDC 00          Short load constant 0
   030f: LEQI             Integer TOS-1 <= TOS
   0310: SLDL 0a          Short load local MP10
   0311: INCP 03          Inc field ptr (TOS+3)
   0313: SLDC 00          Short load constant 0
   0314: LDB              Load byte at byte ptr TOS-1 + TOS
   0315: SLDC 0f          Short load constant 15
   0316: GRTI             Integer TOS-1 > TOS
   0317: LOR              Logical OR (TOS | TOS-1)
   0318: SLDL 0a          Short load local MP10
   0319: SIND 01          Short index load *TOS+1
   031a: SLDL 0a          Short load local MP10
   031b: SIND 00          Short index load *TOS+0
   031c: LESI             Integer TOS-1 < TOS
   031d: LOR              Logical OR (TOS | TOS-1)
   031e: SLDL 0a          Short load local MP10
   031f: IND  0b          Static index and load word (TOS+11)
   0321: LDCI 0200        Load word 512
   0324: GRTI             Integer TOS-1 > TOS
   0325: LOR              Logical OR (TOS | TOS-1)
   0326: SLDL 0a          Short load local MP10
   0327: IND  0b          Static index and load word (TOS+11)
   0329: SLDC 00          Short load constant 0
   032a: LEQI             Integer TOS-1 <= TOS
   032b: LOR              Logical OR (TOS | TOS-1)
   032c: SLDL 0a          Short load local MP10
   032d: INCP 0c          Inc field ptr (TOS+12)
   032f: SLDC 07          Short load constant 7
   0330: SLDC 09          Short load constant 9
   0331: LDP              Load packed field (TOS)
   0332: SLDC 64          Short load constant 100
   0333: GEQI             Integer TOS-1 >= TOS
   0334: LOR              Logical OR (TOS | TOS-1)
   0335: FJP  $0341       Jump if TOS false
   0337: SLDC 00          Short load constant 0
   0338: STL  0005        Store TOS into MP5
   033a: SLDL 04          Short load local MP4
   033b: SLDL 07          Short load local MP7
   033c: SIND 04          Short index load *TOS+4
   033d: CGP  08          Call global procedure SYSIO.8
   033f: UJP  $0346       Unconditional jump
-> 0341: SLDL 04          Short load local MP4
   0342: SLDC 01          Short load constant 1
   0343: ADI              Add integers (TOS + TOS-1)
   0344: STL  0004        Store TOS into MP4
-> 0346: UJP  $02fb       Unconditional jump
-> 0348: SLDL 05          Short load local MP5
   0349: LNOT             Logical NOT (~TOS)
   034a: FJP  $0361       Jump if TOS false
   034c: SLDL 03          Short load local MP3
   034d: SLDL 07          Short load local MP7
   034e: SIND 04          Short index load *TOS+4
   034f: SLDC 00          Short load constant 0
   0350: SLDL 09          Short load local MP9
   0351: IND  08          Static index and load word (TOS+8)
   0353: SLDC 01          Short load constant 1
   0354: ADI              Add integers (TOS + TOS-1)
   0355: SLDC 1a          Short load constant 26
   0356: MPI              Multiply integers (TOS * TOS-1)
   0357: SLDC 02          Short load constant 2
   0358: SLDC 00          Short load constant 0
   0359: CSP  06          Call standard procedure UNITWRITE
   035b: SLDL 07          Short load local MP7
   035c: SIND 00          Short index load *TOS+0
   035d: SLDC 00          Short load constant 0
   035e: EQUI             Integer TOS-1 = TOS
   035f: STL  0005        Store TOS into MP5
-> 0361: SLDL 05          Short load local MP5
   0362: FJP  $0377       Jump if TOS false
   0364: SLDL 08          Short load local MP8
   0365: SLDL 09          Short load local MP9
   0366: INCP 03          Inc field ptr (TOS+3)
   0368: SAS  07          String assign (TOS to TOS-1, 7 chars)
   036a: SLDL 08          Short load local MP8
   036b: INCP 05          Inc field ptr (TOS+5)
   036d: SLDL 09          Short load local MP9
   036e: SIND 07          Short index load *TOS+7
   036f: STO              Store indirect (TOS into TOS-1)
   0370: LLA  0006        Load local address MP6
   0372: SLDL 09          Short load local MP9
   0373: INCP 09          Inc field ptr (TOS+9)
   0375: CSP  09          Call standard procedure TIME
-> 0377: SLDL 05          Short load local MP5
   0378: STL  0001        Store TOS into MP1
   037a: SLDL 05          Short load local MP5
   037b: LNOT             Logical NOT (~TOS)
   037c: FJP  $0395       Jump if TOS false
   037e: SLDL 08          Short load local MP8
   037f: LSA  00          Load string address: ''
   0381: NOP              No operation
   0382: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0384: SLDL 08          Short load local MP8
   0385: INCP 05          Inc field ptr (TOS+5)
   0387: LDCI 7fff        Load word 32767
   038a: STO              Store indirect (TOS into TOS-1)
   038b: SLDL 07          Short load local MP7
   038c: INCP 04          Inc field ptr (TOS+4)
   038e: CSP  21          Call standard procedure RELEASE
   0390: SLDL 07          Short load local MP7
   0391: INCP 04          Inc field ptr (TOS+4)
   0393: LDCN             Load constant NIL
   0394: STO              Store indirect (TOS into TOS-1)
-> 0395: RNP  01          Return from nonbase procedure
END

### PROCEDURE SYSIO.PROC10(PARAM1; PARAM2) (* P=10 LL=1 *)
  MP1=PARAM2
  MP2=PARAM1
  MP3
  MP4
  MP5
  MP6
  MP9
  MP19
  MP20
BEGIN
-> 03a8: LDA  02 001f     Load addr G31 (UNITABLE)
   03ab: SLDL 02          Short load local MP2
   03ac: IXA  06          Index array (TOS-1 + TOS * 6)
   03ae: STL  0013        Store TOS into MP19
   03b0: SLDL 01          Short load local MP1
   03b1: SLDC 00          Short load constant 0
   03b2: IXA  0d          Index array (TOS-1 + TOS * 13)
   03b4: STL  0014        Store TOS into MP20
   03b6: LDL  0013        Load local word MP19
   03b8: LDL  0014        Load local word MP20
   03ba: INCP 03          Inc field ptr (TOS+3)
   03bc: EQLSTR           String TOS-1 = TOS
   03be: LDL  0014        Load local word MP20
   03c0: INCP 02          Inc field ptr (TOS+2)
   03c2: SLDC 04          Short load constant 4
   03c3: SLDC 00          Short load constant 0
   03c4: LDP              Load packed field (TOS)
   03c5: SLDC 00          Short load constant 0
   03c6: EQUI             Integer TOS-1 = TOS
   03c7: LDL  0014        Load local word MP20
   03c9: INCP 02          Inc field ptr (TOS+2)
   03cb: SLDC 04          Short load constant 4
   03cc: SLDC 00          Short load constant 0
   03cd: LDP              Load packed field (TOS)
   03ce: SLDC 08          Short load constant 8
   03cf: EQUI             Integer TOS-1 = TOS
   03d0: LOR              Logical OR (TOS | TOS-1)
   03d1: LAND             Logical AND (TOS & TOS-1)
   03d2: STL  0005        Store TOS into MP5
   03d4: SLDL 05          Short load local MP5
   03d5: FJP  $0455       Jump if TOS false
   03d7: LLA  0004        Load local address MP4
   03d9: LLA  0003        Load local address MP3
   03db: CSP  09          Call standard procedure TIME
   03dd: SLDL 03          Short load local MP3
   03de: LDL  0014        Load local word MP20
   03e0: IND  09          Static index and load word (TOS+9)
   03e2: SBI              Subtract integers (TOS-1 - TOS)
   03e3: LDCI 012c        Load word 300
   03e6: LEQI             Integer TOS-1 <= TOS
   03e7: SLDL 03          Short load local MP3
   03e8: LDL  0014        Load local word MP20
   03ea: IND  09          Static index and load word (TOS+9)
   03ec: SBI              Subtract integers (TOS-1 - TOS)
   03ed: SLDC 00          Short load constant 0
   03ee: GEQI             Integer TOS-1 >= TOS
   03ef: LAND             Logical AND (TOS & TOS-1)
   03f0: LOD  02 0001     Load word at G1 (SYSCOM)
   03f3: INCP 1d          Inc field ptr (TOS+29)
   03f5: SLDC 01          Short load constant 1
   03f6: SLDC 00          Short load constant 0
   03f7: LDP              Load packed field (TOS)
   03f8: LAND             Logical AND (TOS & TOS-1)
   03f9: STL  0005        Store TOS into MP5
   03fb: SLDL 05          Short load local MP5
   03fc: LNOT             Logical NOT (~TOS)
   03fd: FJP  $0418       Jump if TOS false
   03ff: SLDL 02          Short load local MP2
   0400: LLA  0006        Load local address MP6
   0402: SLDC 00          Short load constant 0
   0403: SLDC 1a          Short load constant 26
   0404: SLDC 02          Short load constant 2
   0405: SLDC 00          Short load constant 0
   0406: CSP  05          Call standard procedure UNITREAD
   0408: CSP  22          Call standard procedure IORESULT
   040a: SLDC 00          Short load constant 0
   040b: EQUI             Integer TOS-1 = TOS
   040c: FJP  $0418       Jump if TOS false
   040e: LDL  0014        Load local word MP20
   0410: INCP 03          Inc field ptr (TOS+3)
   0412: LLA  0009        Load local address MP9
   0414: EQLSTR           String TOS-1 = TOS
   0416: STL  0005        Store TOS into MP5
-> 0418: SLDL 05          Short load local MP5
   0419: FJP  $0455       Jump if TOS false
   041b: LDL  0014        Load local word MP20
   041d: SLDC 00          Short load constant 0
   041e: STO              Store indirect (TOS into TOS-1)
   041f: SLDL 02          Short load local MP2
   0420: SLDL 01          Short load local MP1
   0421: SLDC 00          Short load constant 0
   0422: LDL  0014        Load local word MP20
   0424: IND  08          Static index and load word (TOS+8)
   0426: SLDC 01          Short load constant 1
   0427: ADI              Add integers (TOS + TOS-1)
   0428: SLDC 1a          Short load constant 26
   0429: MPI              Multiply integers (TOS * TOS-1)
   042a: SLDC 02          Short load constant 2
   042b: SLDC 00          Short load constant 0
   042c: CSP  06          Call standard procedure UNITWRITE
   042e: CSP  22          Call standard procedure IORESULT
   0430: SLDC 00          Short load constant 0
   0431: EQUI             Integer TOS-1 = TOS
   0432: STL  0005        Store TOS into MP5
   0434: LDL  0014        Load local word MP20
   0436: SIND 01          Short index load *TOS+1
   0437: SLDC 0a          Short load constant 10
   0438: EQUI             Integer TOS-1 = TOS
   0439: FJP  $044a       Jump if TOS false
   043b: SLDL 02          Short load local MP2
   043c: SLDL 01          Short load local MP1
   043d: SLDC 00          Short load constant 0
   043e: LDL  0014        Load local word MP20
   0440: IND  08          Static index and load word (TOS+8)
   0442: SLDC 01          Short load constant 1
   0443: ADI              Add integers (TOS + TOS-1)
   0444: SLDC 1a          Short load constant 26
   0445: MPI              Multiply integers (TOS * TOS-1)
   0446: SLDC 06          Short load constant 6
   0447: SLDC 00          Short load constant 0
   0448: CSP  06          Call standard procedure UNITWRITE
-> 044a: SLDL 05          Short load local MP5
   044b: FJP  $0455       Jump if TOS false
   044d: LLA  0004        Load local address MP4
   044f: LDL  0014        Load local word MP20
   0451: INCP 09          Inc field ptr (TOS+9)
   0453: CSP  09          Call standard procedure TIME
-> 0455: SLDL 05          Short load local MP5
   0456: LNOT             Logical NOT (~TOS)
   0457: FJP  $0468       Jump if TOS false
   0459: LDL  0013        Load local word MP19
   045b: LSA  00          Load string address: ''
   045d: NOP              No operation
   045e: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0460: LDL  0013        Load local word MP19
   0462: INCP 05          Inc field ptr (TOS+5)
   0464: LDCI 7fff        Load word 32767
   0467: STO              Store indirect (TOS into TOS-1)
-> 0468: RNP  00          Return from nonbase procedure
END

### FUNCTION SYSIO.FUNC11(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5): RETVAL (* P=11 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM5
  MP4=PARAM4
  MP5=PARAM3
  MP6=PARAM2
  MP7=PARAM1
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
   0038: CXP  00 1a       Call external procedure PASCALSY.SDELETE
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
   0061: FJP  $023f       Jump if TOS false
   0063: LLA  0008        Load local address MP8
   0065: SLDC 01          Short load constant 1
   0066: LDB              Load byte at byte ptr TOS-1 + TOS
   0067: SLDC 2a          Short load constant 42
   0068: EQUI             Integer TOS-1 = TOS
   0069: FJP  $007a       Jump if TOS false
   006b: SLDL 06          Short load local MP6
   006c: LDA  02 000e     Load addr G14 (SYVID)
   006f: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0071: LLA  0008        Load local address MP8
   0073: SLDC 01          Short load constant 1
   0074: SLDC 01          Short load constant 1
   0075: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0078: UJP  $0090       Unconditional jump
-> 007a: LLA  0008        Load local address MP8
   007c: SLDC 01          Short load constant 1
   007d: LDB              Load byte at byte ptr TOS-1 + TOS
   007e: SLDC 25          Short load constant 37
   007f: EQUI             Integer TOS-1 = TOS
   0080: FJP  $0090       Jump if TOS false
   0082: SLDL 06          Short load local MP6
   0083: LDA  02 0211     Load addr G529
   0087: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0089: LLA  0008        Load local address MP8
   008b: SLDC 01          Short load constant 1
   008c: SLDC 01          Short load constant 1
   008d: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0090: NOP              No operation
   0091: LSA  01          Load string address: ':'
   0094: LLA  0008        Load local address MP8
   0096: SLDC 00          Short load constant 0
   0097: SLDC 00          Short load constant 0
   0098: CXP  00 1b       Call external procedure PASCALSY.SPOS
   009b: STL  0032        Store TOS into MP50
   009d: LDL  0032        Load local word MP50
   009f: SLDC 01          Short load constant 1
   00a0: LEQI             Integer TOS-1 <= TOS
   00a1: FJP  $00bf       Jump if TOS false
   00a3: SLDL 06          Short load local MP6
   00a4: SLDC 00          Short load constant 0
   00a5: LDB              Load byte at byte ptr TOS-1 + TOS
   00a6: SLDC 00          Short load constant 0
   00a7: EQUI             Integer TOS-1 = TOS
   00a8: FJP  $00b0       Jump if TOS false
   00aa: SLDL 06          Short load local MP6
   00ab: LDA  02 000a     Load addr G10
   00ae: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 00b0: LDL  0032        Load local word MP50
   00b2: SLDC 01          Short load constant 1
   00b3: EQUI             Integer TOS-1 = TOS
   00b4: FJP  $00bd       Jump if TOS false
   00b6: LLA  0008        Load local address MP8
   00b8: SLDC 01          Short load constant 1
   00b9: SLDC 01          Short load constant 1
   00ba: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 00bd: UJP  $00e0       Unconditional jump
-> 00bf: LDL  0032        Load local word MP50
   00c1: SLDC 01          Short load constant 1
   00c2: SBI              Subtract integers (TOS-1 - TOS)
   00c3: SLDC 07          Short load constant 7
   00c4: LEQI             Integer TOS-1 <= TOS
   00c5: FJP  $00e0       Jump if TOS false
   00c7: SLDL 06          Short load local MP6
   00c8: LLA  0008        Load local address MP8
   00ca: LLA  0035        Load local address MP53
   00cc: SLDC 01          Short load constant 1
   00cd: LDL  0032        Load local word MP50
   00cf: SLDC 01          Short load constant 1
   00d0: SBI              Subtract integers (TOS-1 - TOS)
   00d1: CXP  00 19       Call external procedure PASCALSY.SCOPY
   00d4: LLA  0035        Load local address MP53
   00d6: SAS  07          String assign (TOS to TOS-1, 7 chars)
   00d8: LLA  0008        Load local address MP8
   00da: SLDC 01          Short load constant 1
   00db: LDL  0032        Load local word MP50
   00dd: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 00e0: SLDL 06          Short load local MP6
   00e1: SLDC 00          Short load constant 0
   00e2: LDB              Load byte at byte ptr TOS-1 + TOS
   00e3: SLDC 00          Short load constant 0
   00e4: GRTI             Integer TOS-1 > TOS
   00e5: FJP  $023f       Jump if TOS false
   00e7: LSA  01          Load string address: '['
   00ea: NOP              No operation
   00eb: LLA  0008        Load local address MP8
   00ed: SLDC 00          Short load constant 0
   00ee: SLDC 00          Short load constant 0
   00ef: CXP  00 1b       Call external procedure PASCALSY.SPOS
   00f2: STL  0032        Store TOS into MP50
   00f4: LDL  0032        Load local word MP50
   00f6: SLDC 00          Short load constant 0
   00f7: GRTI             Integer TOS-1 > TOS
   00f8: FJP  $0102       Jump if TOS false
   00fa: LDL  0032        Load local word MP50
   00fc: SLDC 01          Short load constant 1
   00fd: SBI              Subtract integers (TOS-1 - TOS)
   00fe: STL  0032        Store TOS into MP50
   0100: UJP  $0108       Unconditional jump
-> 0102: LLA  0008        Load local address MP8
   0104: SLDC 00          Short load constant 0
   0105: LDB              Load byte at byte ptr TOS-1 + TOS
   0106: STL  0032        Store TOS into MP50
-> 0108: LDL  0032        Load local word MP50
   010a: SLDC 0f          Short load constant 15
   010b: LEQI             Integer TOS-1 <= TOS
   010c: FJP  $023f       Jump if TOS false
   010e: LDL  0032        Load local word MP50
   0110: SLDC 00          Short load constant 0
   0111: GRTI             Integer TOS-1 > TOS
   0112: FJP  $012b       Jump if TOS false
   0114: SLDL 05          Short load local MP5
   0115: LLA  0008        Load local address MP8
   0117: LLA  0035        Load local address MP53
   0119: SLDC 01          Short load constant 1
   011a: LDL  0032        Load local word MP50
   011c: CXP  00 19       Call external procedure PASCALSY.SCOPY
   011f: LLA  0035        Load local address MP53
   0121: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0123: LLA  0008        Load local address MP8
   0125: SLDC 01          Short load constant 1
   0126: LDL  0032        Load local word MP50
   0128: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 012b: LLA  0008        Load local address MP8
   012d: SLDC 00          Short load constant 0
   012e: LDB              Load byte at byte ptr TOS-1 + TOS
   012f: SLDC 00          Short load constant 0
   0130: EQUI             Integer TOS-1 = TOS
   0131: FJP  $0138       Jump if TOS false
   0133: SLDC 01          Short load constant 1
   0134: STL  0034        Store TOS into MP52
   0136: UJP  $01af       Unconditional jump
-> 0138: SLDC 00          Short load constant 0
   0139: STL  0034        Store TOS into MP52
   013b: LSA  01          Load string address: ']'
   013e: NOP              No operation
   013f: LLA  0008        Load local address MP8
   0141: SLDC 00          Short load constant 0
   0142: SLDC 00          Short load constant 0
   0143: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0146: STL  0031        Store TOS into MP49
   0148: LDL  0031        Load local word MP49
   014a: SLDC 02          Short load constant 2
   014b: EQUI             Integer TOS-1 = TOS
   014c: FJP  $0153       Jump if TOS false
   014e: SLDC 01          Short load constant 1
   014f: STL  0034        Store TOS into MP52
   0151: UJP  $01af       Unconditional jump
-> 0153: LDL  0031        Load local word MP49
   0155: SLDC 02          Short load constant 2
   0156: GRTI             Integer TOS-1 > TOS
   0157: FJP  $01af       Jump if TOS false
   0159: SLDC 01          Short load constant 1
   015a: STL  0034        Store TOS into MP52
   015c: SLDC 02          Short load constant 2
   015d: STL  0032        Store TOS into MP50
-> 015f: LLA  0008        Load local address MP8
   0161: LDL  0032        Load local word MP50
   0163: LDB              Load byte at byte ptr TOS-1 + TOS
   0164: STL  0033        Store TOS into MP51
   0166: LDL  0033        Load local word MP51
   0168: SLDC 30          Short load constant 48
   0169: GEQI             Integer TOS-1 >= TOS
   016a: LDL  0033        Load local word MP51
   016c: SLDC 39          Short load constant 57
   016d: LEQI             Integer TOS-1 <= TOS
   016e: LAND             Logical AND (TOS & TOS-1)
   016f: FJP  $017e       Jump if TOS false
   0171: SLDL 04          Short load local MP4
   0172: SLDL 04          Short load local MP4
   0173: SIND 00          Short index load *TOS+0
   0174: SLDC 0a          Short load constant 10
   0175: MPI              Multiply integers (TOS * TOS-1)
   0176: LDL  0033        Load local word MP51
   0178: SLDC 30          Short load constant 48
   0179: SBI              Subtract integers (TOS-1 - TOS)
   017a: ADI              Add integers (TOS + TOS-1)
   017b: STO              Store indirect (TOS into TOS-1)
   017c: UJP  $0181       Unconditional jump
-> 017e: SLDC 00          Short load constant 0
   017f: STL  0034        Store TOS into MP52
-> 0181: LDL  0032        Load local word MP50
   0183: SLDC 01          Short load constant 1
   0184: ADI              Add integers (TOS + TOS-1)
   0185: STL  0032        Store TOS into MP50
   0187: LDL  0032        Load local word MP50
   0189: LDL  0031        Load local word MP49
   018b: EQUI             Integer TOS-1 = TOS
   018c: LDL  0034        Load local word MP52
   018e: LNOT             Logical NOT (~TOS)
   018f: LOR              Logical OR (TOS | TOS-1)
   0190: FJP  $015f       Jump if TOS false
   0192: LDL  0032        Load local word MP50
   0194: SLDC 03          Short load constant 3
   0195: EQUI             Integer TOS-1 = TOS
   0196: LDL  0031        Load local word MP49
   0198: SLDC 03          Short load constant 3
   0199: EQUI             Integer TOS-1 = TOS
   019a: LAND             Logical AND (TOS & TOS-1)
   019b: FJP  $01af       Jump if TOS false
   019d: LLA  0008        Load local address MP8
   019f: LDL  0032        Load local word MP50
   01a1: SLDC 01          Short load constant 1
   01a2: SBI              Subtract integers (TOS-1 - TOS)
   01a3: LDB              Load byte at byte ptr TOS-1 + TOS
   01a4: SLDC 2a          Short load constant 42
   01a5: EQUI             Integer TOS-1 = TOS
   01a6: FJP  $01af       Jump if TOS false
   01a8: SLDL 04          Short load local MP4
   01a9: SLDC 01          Short load constant 1
   01aa: NGI              Negate integer
   01ab: STO              Store indirect (TOS into TOS-1)
   01ac: SLDC 01          Short load constant 1
   01ad: STL  0034        Store TOS into MP52
-> 01af: LDL  0034        Load local word MP52
   01b1: STL  0001        Store TOS into MP1
   01b3: LDL  0034        Load local word MP52
   01b5: SLDL 05          Short load local MP5
   01b6: SLDC 00          Short load constant 0
   01b7: LDB              Load byte at byte ptr TOS-1 + TOS
   01b8: SLDC 05          Short load constant 5
   01b9: GRTI             Integer TOS-1 > TOS
   01ba: LAND             Logical AND (TOS & TOS-1)
   01bb: FJP  $023f       Jump if TOS false
   01bd: LLA  0008        Load local address MP8
   01bf: SLDL 05          Short load local MP5
   01c0: LLA  0035        Load local address MP53
   01c2: SLDL 05          Short load local MP5
   01c3: SLDC 00          Short load constant 0
   01c4: LDB              Load byte at byte ptr TOS-1 + TOS
   01c5: SLDC 04          Short load constant 4
   01c6: SBI              Subtract integers (TOS-1 - TOS)
   01c7: SLDC 05          Short load constant 5
   01c8: CXP  00 19       Call external procedure PASCALSY.SCOPY
   01cb: LLA  0035        Load local address MP53
   01cd: SAS  50          String assign (TOS to TOS-1, 80 chars)
   01cf: LLA  0008        Load local address MP8
   01d1: LSA  05          Load string address: '.TEXT'
   01d8: NOP              No operation
   01d9: EQLSTR           String TOS-1 = TOS
   01db: FJP  $01e2       Jump if TOS false
   01dd: SLDL 03          Short load local MP3
   01de: SLDC 03          Short load constant 3
   01df: STO              Store indirect (TOS into TOS-1)
   01e0: UJP  $023f       Unconditional jump
-> 01e2: LLA  0008        Load local address MP8
   01e4: NOP              No operation
   01e5: LSA  05          Load string address: '.CODE'
   01ec: EQLSTR           String TOS-1 = TOS
   01ee: FJP  $01f5       Jump if TOS false
   01f0: SLDL 03          Short load local MP3
   01f1: SLDC 02          Short load constant 2
   01f2: STO              Store indirect (TOS into TOS-1)
   01f3: UJP  $023f       Unconditional jump
-> 01f5: LLA  0008        Load local address MP8
   01f7: LSA  05          Load string address: '.BACK'
   01fe: NOP              No operation
   01ff: EQLSTR           String TOS-1 = TOS
   0201: FJP  $0208       Jump if TOS false
   0203: SLDL 03          Short load local MP3
   0204: SLDC 03          Short load constant 3
   0205: STO              Store indirect (TOS into TOS-1)
   0206: UJP  $023f       Unconditional jump
-> 0208: LLA  0008        Load local address MP8
   020a: NOP              No operation
   020b: LSA  05          Load string address: '.INFO'
   0212: EQLSTR           String TOS-1 = TOS
   0214: FJP  $021b       Jump if TOS false
   0216: SLDL 03          Short load local MP3
   0217: SLDC 04          Short load constant 4
   0218: STO              Store indirect (TOS into TOS-1)
   0219: UJP  $023f       Unconditional jump
-> 021b: LLA  0008        Load local address MP8
   021d: LSA  05          Load string address: '.GRAF'
   0224: NOP              No operation
   0225: EQLSTR           String TOS-1 = TOS
   0227: FJP  $022e       Jump if TOS false
   0229: SLDL 03          Short load local MP3
   022a: SLDC 06          Short load constant 6
   022b: STO              Store indirect (TOS into TOS-1)
   022c: UJP  $023f       Unconditional jump
-> 022e: LLA  0008        Load local address MP8
   0230: NOP              No operation
   0231: LSA  05          Load string address: '.FOTO'
   0238: EQLSTR           String TOS-1 = TOS
   023a: FJP  $023f       Jump if TOS false
   023c: SLDL 03          Short load local MP3
   023d: SLDC 07          Short load constant 7
   023e: STO              Store indirect (TOS into TOS-1)
-> 023f: RNP  01          Return from nonbase procedure
END

### FUNCTION SYSIO.FUNC12(PARAM1; PARAM2; PARAM3): RETVAL (* P=12 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM3
  MP4=PARAM2
  MP5=PARAM1
  MP6
  MP7
  MP8
BEGIN
-> 05dc: SLDC 00          Short load constant 0
   05dd: STL  0001        Store TOS into MP1
   05df: SLDC 00          Short load constant 0
   05e0: STL  0007        Store TOS into MP7
   05e2: SLDC 01          Short load constant 1
   05e3: STL  0006        Store TOS into MP6
-> 05e5: SLDL 06          Short load local MP6
   05e6: SLDL 03          Short load local MP3
   05e7: SLDC 00          Short load constant 0
   05e8: IXA  0d          Index array (TOS-1 + TOS * 13)
   05ea: IND  08          Static index and load word (TOS+8)
   05ec: LEQI             Integer TOS-1 <= TOS
   05ed: SLDL 07          Short load local MP7
   05ee: LNOT             Logical NOT (~TOS)
   05ef: LAND             Logical AND (TOS & TOS-1)
   05f0: FJP  $061a       Jump if TOS false
   05f2: SLDL 03          Short load local MP3
   05f3: SLDL 06          Short load local MP6
   05f4: IXA  0d          Index array (TOS-1 + TOS * 13)
   05f6: STL  0008        Store TOS into MP8
   05f8: SLDL 08          Short load local MP8
   05f9: INCP 03          Inc field ptr (TOS+3)
   05fb: SLDL 05          Short load local MP5
   05fc: EQLSTR           String TOS-1 = TOS
   05fe: FJP  $0613       Jump if TOS false
   0600: SLDL 04          Short load local MP4
   0601: SLDL 08          Short load local MP8
   0602: INCP 0c          Inc field ptr (TOS+12)
   0604: SLDC 07          Short load constant 7
   0605: SLDC 09          Short load constant 9
   0606: LDP              Load packed field (TOS)
   0607: SLDC 64          Short load constant 100
   0608: NEQI             Integer TOS-1 <> TOS
   0609: EQLBOOL          Boolean TOS-1 = TOS
   060b: FJP  $0613       Jump if TOS false
   060d: SLDL 06          Short load local MP6
   060e: STL  0001        Store TOS into MP1
   0610: SLDC 01          Short load constant 1
   0611: STL  0007        Store TOS into MP7
-> 0613: SLDL 06          Short load local MP6
   0614: SLDC 01          Short load constant 1
   0615: ADI              Add integers (TOS + TOS-1)
   0616: STL  0006        Store TOS into MP6
   0618: UJP  $05e5       Unconditional jump
-> 061a: RNP  01          Return from nonbase procedure
END

### PROCEDURE SYSIO.PROC13(PARAM1) (* P=13 LL=1 *)
  MP1=PARAM1
  MP2
  MP3
BEGIN
-> 0714: SLDL 01          Short load local MP1
   0715: STL  0003        Store TOS into MP3
   0717: SLDL 03          Short load local MP3
   0718: INCP 0e          Inc field ptr (TOS+14)
   071a: SLDC 00          Short load constant 0
   071b: STO              Store indirect (TOS into TOS-1)
   071c: SLDL 03          Short load local MP3
   071d: INCP 01          Inc field ptr (TOS+1)
   071f: SLDC 00          Short load constant 0
   0720: STO              Store indirect (TOS into TOS-1)
   0721: SLDL 03          Short load local MP3
   0722: INCP 02          Inc field ptr (TOS+2)
   0724: SLDC 00          Short load constant 0
   0725: STO              Store indirect (TOS into TOS-1)
   0726: SLDL 03          Short load local MP3
   0727: SIND 06          Short index load *TOS+6
   0728: FJP  $07f6       Jump if TOS false
   072a: SLDL 03          Short load local MP3
   072b: IND  0d          Static index and load word (TOS+13)
   072d: SLDL 03          Short load local MP3
   072e: IND  0c          Static index and load word (TOS+12)
   0730: GRTI             Integer TOS-1 > TOS
   0731: STL  0002        Store TOS into MP2
   0733: SLDL 02          Short load local MP2
   0734: FJP  $073d       Jump if TOS false
   0736: SLDL 03          Short load local MP3
   0737: INCP 0c          Inc field ptr (TOS+12)
   0739: SLDL 03          Short load local MP3
   073a: IND  0d          Static index and load word (TOS+13)
   073c: STO              Store indirect (TOS into TOS-1)
-> 073d: SLDL 03          Short load local MP3
   073e: IND  1d          Static index and load word (TOS+29)
   0740: FJP  $07de       Jump if TOS false
   0742: SLDL 02          Short load local MP2
   0743: FJP  $074e       Jump if TOS false
   0745: SLDL 03          Short load local MP3
   0746: INCP 1e          Inc field ptr (TOS+30)
   0748: SLDL 03          Short load local MP3
   0749: IND  1f          Static index and load word (TOS+31)
   074b: STO              Store indirect (TOS into TOS-1)
   074c: UJP  $076a       Unconditional jump
-> 074e: SLDL 03          Short load local MP3
   074f: IND  0d          Static index and load word (TOS+13)
   0751: SLDL 03          Short load local MP3
   0752: IND  0c          Static index and load word (TOS+12)
   0754: EQUI             Integer TOS-1 = TOS
   0755: FJP  $076a       Jump if TOS false
   0757: SLDL 03          Short load local MP3
   0758: IND  1f          Static index and load word (TOS+31)
   075a: SLDL 03          Short load local MP3
   075b: IND  1e          Static index and load word (TOS+30)
   075d: GEQI             Integer TOS-1 >= TOS
   075e: FJP  $076a       Jump if TOS false
   0760: SLDC 01          Short load constant 1
   0761: STL  0002        Store TOS into MP2
   0763: SLDL 03          Short load local MP3
   0764: INCP 1e          Inc field ptr (TOS+30)
   0766: SLDL 03          Short load local MP3
   0767: IND  1f          Static index and load word (TOS+31)
   0769: STO              Store indirect (TOS into TOS-1)
-> 076a: SLDL 03          Short load local MP3
   076b: IND  20          Static index and load word (TOS+32)
   076d: FJP  $07d7       Jump if TOS false
   076f: SLDL 03          Short load local MP3
   0770: INCP 20          Inc field ptr (TOS+32)
   0772: SLDC 00          Short load constant 0
   0773: STO              Store indirect (TOS into TOS-1)
   0774: SLDL 03          Short load local MP3
   0775: INCP 0f          Inc field ptr (TOS+15)
   0777: SLDC 01          Short load constant 1
   0778: STO              Store indirect (TOS into TOS-1)
   0779: SLDL 02          Short load local MP2
   077a: FJP  $078c       Jump if TOS false
   077c: SLDL 03          Short load local MP3
   077d: INCP 21          Inc field ptr (TOS+33)
   077f: SLDL 03          Short load local MP3
   0780: IND  1f          Static index and load word (TOS+31)
   0782: LDCI 0200        Load word 512
   0785: SLDL 03          Short load local MP3
   0786: IND  1f          Static index and load word (TOS+31)
   0788: SBI              Subtract integers (TOS-1 - TOS)
   0789: SLDC 00          Short load constant 0
   078a: CSP  0a          Call standard procedure FLCH
-> 078c: SLDL 03          Short load local MP3
   078d: SIND 07          Short index load *TOS+7
   078e: SLDL 03          Short load local MP3
   078f: INCP 21          Inc field ptr (TOS+33)
   0791: SLDC 00          Short load constant 0
   0792: LDCI 0200        Load word 512
   0795: SLDL 03          Short load local MP3
   0796: IND  10          Static index and load word (TOS+16)
   0798: SLDL 03          Short load local MP3
   0799: IND  0d          Static index and load word (TOS+13)
   079b: ADI              Add integers (TOS + TOS-1)
   079c: SLDC 01          Short load constant 1
   079d: SBI              Subtract integers (TOS-1 - TOS)
   079e: SLDC 00          Short load constant 0
   079f: CSP  06          Call standard procedure UNITWRITE
   07a1: SLDL 02          Short load local MP2
   07a2: SLDL 03          Short load local MP3
   07a3: INCP 12          Inc field ptr (TOS+18)
   07a5: SLDC 04          Short load constant 4
   07a6: SLDC 00          Short load constant 0
   07a7: LDP              Load packed field (TOS)
   07a8: SLDC 03          Short load constant 3
   07a9: EQUI             Integer TOS-1 = TOS
   07aa: LAND             Logical AND (TOS & TOS-1)
   07ab: SLDL 03          Short load local MP3
   07ac: IND  0d          Static index and load word (TOS+13)
   07ae: LAND             Logical AND (TOS & TOS-1)
   07af: FJP  $07d7       Jump if TOS false
   07b1: SLDL 03          Short load local MP3
   07b2: INCP 0c          Inc field ptr (TOS+12)
   07b4: SLDL 03          Short load local MP3
   07b5: IND  0c          Static index and load word (TOS+12)
   07b7: SLDC 01          Short load constant 1
   07b8: ADI              Add integers (TOS + TOS-1)
   07b9: STO              Store indirect (TOS into TOS-1)
   07ba: SLDL 03          Short load local MP3
   07bb: INCP 21          Inc field ptr (TOS+33)
   07bd: SLDC 00          Short load constant 0
   07be: LDCI 0200        Load word 512
   07c1: SLDC 00          Short load constant 0
   07c2: CSP  0a          Call standard procedure FLCH
   07c4: SLDL 03          Short load local MP3
   07c5: SIND 07          Short index load *TOS+7
   07c6: SLDL 03          Short load local MP3
   07c7: INCP 21          Inc field ptr (TOS+33)
   07c9: SLDC 00          Short load constant 0
   07ca: LDCI 0200        Load word 512
   07cd: SLDL 03          Short load local MP3
   07ce: IND  10          Static index and load word (TOS+16)
   07d0: SLDL 03          Short load local MP3
   07d1: IND  0d          Static index and load word (TOS+13)
   07d3: ADI              Add integers (TOS + TOS-1)
   07d4: SLDC 00          Short load constant 0
   07d5: CSP  06          Call standard procedure UNITWRITE
-> 07d7: SLDL 03          Short load local MP3
   07d8: INCP 1f          Inc field ptr (TOS+31)
   07da: LDCI 0200        Load word 512
   07dd: STO              Store indirect (TOS into TOS-1)
-> 07de: SLDL 03          Short load local MP3
   07df: INCP 0d          Inc field ptr (TOS+13)
   07e1: SLDC 00          Short load constant 0
   07e2: STO              Store indirect (TOS into TOS-1)
   07e3: SLDL 03          Short load local MP3
   07e4: IND  1d          Static index and load word (TOS+29)
   07e6: SLDL 03          Short load local MP3
   07e7: INCP 12          Inc field ptr (TOS+18)
   07e9: SLDC 04          Short load constant 4
   07ea: SLDC 00          Short load constant 0
   07eb: LDP              Load packed field (TOS)
   07ec: SLDC 03          Short load constant 3
   07ed: EQUI             Integer TOS-1 = TOS
   07ee: LAND             Logical AND (TOS & TOS-1)
   07ef: FJP  $07f6       Jump if TOS false
   07f1: SLDL 03          Short load local MP3
   07f2: INCP 0d          Inc field ptr (TOS+13)
   07f4: SLDC 02          Short load constant 2
   07f5: STO              Store indirect (TOS into TOS-1)
-> 07f6: RNP  00          Return from nonbase procedure
END

### FUNCTION SYSIO.FUNC14(PARAM1; PARAM2; PARAM3; PARAM4): RETVAL (* P=14 LL=2 *)
  MP1=RETVAL1
  MP3=PARAM4
  MP4=PARAM3
  MP5=PARAM2
  MP6=PARAM1
  MP7
  MP8
  MP9
  MP10
  MP11
  MP12
  MP13
  MP14
  MP15
  MP16
  MP24
  MP25
  MP26
BEGIN
-> 0876: SLDC 00          Short load constant 0
   0877: STL  0008        Store TOS into MP8
   0879: SLDL 03          Short load local MP3
   087a: SLDC 00          Short load constant 0
   087b: IXA  0d          Index array (TOS-1 + TOS * 13)
   087d: IND  08          Static index and load word (TOS+8)
   087f: STL  0009        Store TOS into MP9
   0881: SLDC 00          Short load constant 0
   0882: STL  0007        Store TOS into MP7
   0884: SLDC 00          Short load constant 0
   0885: STL  000c        Store TOS into MP12
   0887: SLDL 05          Short load local MP5
   0888: SLDC 00          Short load constant 0
   0889: LEQI             Integer TOS-1 <= TOS
   088a: FJP  $08dd       Jump if TOS false
   088c: SLDL 05          Short load local MP5
   088d: SLDC 00          Short load constant 0
   088e: LESI             Integer TOS-1 < TOS
   088f: STL  000b        Store TOS into MP11
   0891: SLDC 01          Short load constant 1
   0892: STL  000a        Store TOS into MP10
   0894: SLDL 09          Short load local MP9
   0895: STL  001a        Store TOS into MP26
-> 0897: SLDL 0a          Short load local MP10
   0898: LDL  001a        Load local word MP26
   089a: LEQI             Integer TOS-1 <= TOS
   089b: FJP  $08b3       Jump if TOS false
   089d: SLDL 0a          Short load local MP10
   089e: SLDL 03          Short load local MP3
   089f: SLDL 0a          Short load local MP10
   08a0: SLDC 01          Short load constant 1
   08a1: SBI              Subtract integers (TOS-1 - TOS)
   08a2: IXA  0d          Index array (TOS-1 + TOS * 13)
   08a4: SIND 01          Short index load *TOS+1
   08a5: SLDL 03          Short load local MP3
   08a6: SLDL 0a          Short load local MP10
   08a7: IXA  0d          Index array (TOS-1 + TOS * 13)
   08a9: SIND 00          Short index load *TOS+0
   08aa: CLP  0f          Call local procedure SYSIO.15
   08ac: SLDL 0a          Short load local MP10
   08ad: SLDC 01          Short load constant 1
   08ae: ADI              Add integers (TOS + TOS-1)
   08af: STL  000a        Store TOS into MP10
   08b1: UJP  $0897       Unconditional jump
-> 08b3: SLDL 09          Short load local MP9
   08b4: SLDC 01          Short load constant 1
   08b5: ADI              Add integers (TOS + TOS-1)
   08b6: SLDL 03          Short load local MP3
   08b7: SLDL 09          Short load local MP9
   08b8: IXA  0d          Index array (TOS-1 + TOS * 13)
   08ba: SIND 01          Short index load *TOS+1
   08bb: SLDL 03          Short load local MP3
   08bc: SLDC 00          Short load constant 0
   08bd: IXA  0d          Index array (TOS-1 + TOS * 13)
   08bf: SIND 07          Short index load *TOS+7
   08c0: CLP  0f          Call local procedure SYSIO.15
   08c2: SLDL 0b          Short load local MP11
   08c3: FJP  $08db       Jump if TOS false
   08c5: SLDL 05          Short load local MP5
   08c6: SLDC 02          Short load constant 2
   08c7: DVI              Divide integers (TOS-1 / TOS)
   08c8: SLDL 0c          Short load local MP12
   08c9: LEQI             Integer TOS-1 <= TOS
   08ca: FJP  $08d4       Jump if TOS false
   08cc: SLDL 0c          Short load local MP12
   08cd: STL  0005        Store TOS into MP5
   08cf: SLDL 07          Short load local MP7
   08d0: STL  0008        Store TOS into MP8
   08d2: UJP  $08db       Unconditional jump
-> 08d4: SLDL 05          Short load local MP5
   08d5: SLDC 01          Short load constant 1
   08d6: ADI              Add integers (TOS + TOS-1)
   08d7: SLDC 02          Short load constant 2
   08d8: DVI              Divide integers (TOS-1 / TOS)
   08d9: STL  0005        Store TOS into MP5
-> 08db: UJP  $091c       Unconditional jump
-> 08dd: SLDC 01          Short load constant 1
   08de: STL  000a        Store TOS into MP10
-> 08e0: SLDL 0a          Short load local MP10
   08e1: SLDL 09          Short load local MP9
   08e2: LEQI             Integer TOS-1 <= TOS
   08e3: FJP  $0903       Jump if TOS false
   08e5: SLDL 03          Short load local MP3
   08e6: SLDL 0a          Short load local MP10
   08e7: IXA  0d          Index array (TOS-1 + TOS * 13)
   08e9: SIND 00          Short index load *TOS+0
   08ea: SLDL 03          Short load local MP3
   08eb: SLDL 0a          Short load local MP10
   08ec: SLDC 01          Short load constant 1
   08ed: SBI              Subtract integers (TOS-1 - TOS)
   08ee: IXA  0d          Index array (TOS-1 + TOS * 13)
   08f0: SIND 01          Short index load *TOS+1
   08f1: SBI              Subtract integers (TOS-1 - TOS)
   08f2: SLDL 05          Short load local MP5
   08f3: GEQI             Integer TOS-1 >= TOS
   08f4: FJP  $08fc       Jump if TOS false
   08f6: SLDL 0a          Short load local MP10
   08f7: STL  0008        Store TOS into MP8
   08f9: SLDL 09          Short load local MP9
   08fa: STL  000a        Store TOS into MP10
-> 08fc: SLDL 0a          Short load local MP10
   08fd: SLDC 01          Short load constant 1
   08fe: ADI              Add integers (TOS + TOS-1)
   08ff: STL  000a        Store TOS into MP10
   0901: UJP  $08e0       Unconditional jump
-> 0903: SLDL 08          Short load local MP8
   0904: SLDC 00          Short load constant 0
   0905: EQUI             Integer TOS-1 = TOS
   0906: FJP  $091c       Jump if TOS false
   0908: SLDL 03          Short load local MP3
   0909: SLDC 00          Short load constant 0
   090a: IXA  0d          Index array (TOS-1 + TOS * 13)
   090c: SIND 07          Short index load *TOS+7
   090d: SLDL 03          Short load local MP3
   090e: SLDL 09          Short load local MP9
   090f: IXA  0d          Index array (TOS-1 + TOS * 13)
   0911: SIND 01          Short index load *TOS+1
   0912: SBI              Subtract integers (TOS-1 - TOS)
   0913: SLDL 05          Short load local MP5
   0914: GEQI             Integer TOS-1 >= TOS
   0915: FJP  $091c       Jump if TOS false
   0917: SLDL 09          Short load local MP9
   0918: SLDC 01          Short load constant 1
   0919: ADI              Add integers (TOS + TOS-1)
   091a: STL  0008        Store TOS into MP8
-> 091c: SLDL 09          Short load local MP9
   091d: SLDC 4d          Short load constant 77
   091e: EQUI             Integer TOS-1 = TOS
   091f: FJP  $0924       Jump if TOS false
   0921: SLDC 00          Short load constant 0
   0922: STL  0008        Store TOS into MP8
-> 0924: SLDL 08          Short load local MP8
   0925: SLDC 00          Short load constant 0
   0926: GRTI             Integer TOS-1 > TOS
   0927: FJP  $095f       Jump if TOS false
   0929: SLDL 03          Short load local MP3
   092a: SLDL 08          Short load local MP8
   092b: SLDC 01          Short load constant 1
   092c: SBI              Subtract integers (TOS-1 - TOS)
   092d: IXA  0d          Index array (TOS-1 + TOS * 13)
   092f: SIND 01          Short index load *TOS+1
   0930: STL  000d        Store TOS into MP13
   0932: SLDL 0d          Short load local MP13
   0933: SLDL 05          Short load local MP5
   0934: ADI              Add integers (TOS + TOS-1)
   0935: STL  000e        Store TOS into MP14
   0937: LLA  000f        Load local address MP15
   0939: SLDC 04          Short load constant 4
   093a: SLDC 00          Short load constant 0
   093b: SLDL 04          Short load local MP4
   093c: STP              Store packed field (TOS into TOS-1)
   093d: LLA  0010        Load local address MP16
   093f: SLDL 06          Short load local MP6
   0940: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0942: LDCI 0200        Load word 512
   0945: STL  0018        Store TOS into MP24
   0947: LLA  0019        Load local address MP25
   0949: SLDC 04          Short load constant 4
   094a: SLDC 00          Short load constant 0
   094b: SLDC 00          Short load constant 0
   094c: STP              Store packed field (TOS into TOS-1)
   094d: LLA  0019        Load local address MP25
   094f: SLDC 05          Short load constant 5
   0950: SLDC 04          Short load constant 4
   0951: SLDC 00          Short load constant 0
   0952: STP              Store packed field (TOS into TOS-1)
   0953: LLA  0019        Load local address MP25
   0955: SLDC 07          Short load constant 7
   0956: SLDC 09          Short load constant 9
   0957: SLDC 64          Short load constant 100
   0958: STP              Store packed field (TOS into TOS-1)
   0959: LLA  000d        Load local address MP13
   095b: SLDL 08          Short load local MP8
   095c: SLDL 03          Short load local MP3
   095d: CGP  07          Call global procedure SYSIO.7
-> 095f: SLDL 08          Short load local MP8
   0960: STL  0001        Store TOS into MP1
-> 0962: RNP  01          Return from nonbase procedure
END

### PROCEDURE SYSIO.PROC15(PARAM1; PARAM2; PARAM3) (* P=15 LL=3 *)
  MP1=PARAM3
  MP2=PARAM2
  MP3=PARAM1
  MP4
BEGIN
-> 0838: SLDL 01          Short load local MP1
   0839: SLDL 02          Short load local MP2
   083a: SBI              Subtract integers (TOS-1 - TOS)
   083b: STL  0004        Store TOS into MP4
   083d: SLDL 04          Short load local MP4
   083e: LOD  01 0005     Load word at L2_5
   0841: GRTI             Integer TOS-1 > TOS
   0842: FJP  $085a       Jump if TOS false
   0844: LOD  01 0008     Load word at L2_8
   0847: STR  01 0007     Store TOS to L27
   084a: LOD  01 0005     Load word at L2_5
   084d: STR  01 000c     Store TOS to L212
   0850: SLDL 03          Short load local MP3
   0851: STR  01 0008     Store TOS to L28
   0854: SLDL 04          Short load local MP4
   0855: STR  01 0005     Store TOS to L25
   0858: UJP  $0869       Unconditional jump
-> 085a: SLDL 04          Short load local MP4
   085b: LOD  01 000c     Load word at L2_12
   085e: GRTI             Integer TOS-1 > TOS
   085f: FJP  $0869       Jump if TOS false
   0861: SLDL 04          Short load local MP4
   0862: STR  01 000c     Store TOS to L212
   0865: SLDL 03          Short load local MP3
   0866: STR  01 0007     Store TOS to L27
-> 0869: RNP  00          Return from nonbase procedure
END

