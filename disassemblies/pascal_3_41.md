#  SYSTEM.PASCAL-03-41.bin 

## Segment Table
| slot |segNum | name | block | length | kind | textAddr | mType | version |
|-----:|------:|------|------:|-------:|------|---------:|-------|--------:|
| 0 | 0 | PASCALSY | 0001 | 1894 | linked | 0000 | 2 | 5 |
| 15 | 15 |  | 0005 | 1400 | linked | 0000 | 0 | 0 |
| 1 | 1 | USERPROG | 0008 | 20 | linked | 0000 | 2 | 5 |
| 2 | 2 | FIOPRIMS | 0009 | 808 | linked_intrins | 0000 | 2 | 5 |
| 3 | 3 | PRINTERR | 000B | 20 | linked | 0000 | 2 | 5 |
| 4 | 4 | INITIALI | 000C | 2000 | linked | 0000 | 2 | 5 |
| 5 | 5 | GETCMD | 0010 | 2360 | linked | 0000 | 2 | 5 |
| 6 | 6 | SYSIO | 0015 | 3652 | linked_intrins | 0000 | 2 | 5 |

intrinsics: [2, 6]

comment: COPYRIGHT 1979,1980,1983 APPLE COMPUTER, INC. ALL RIGHTS RESERVED

## Globals

G1
G2
G3
G5
G6
G7
G8
G9
G10
G14
G18
G19
G20
G25
G31
G157
G173
G185
G226
G227
G228
G229
G230
G237
G246
G248
G520
G521
G525
G529
G533

## Segment PASCALSY (0)

### PROCEDURE PASCALSY.PASCALSY (* P=1 LL=-1 *)
  G5
BEGIN
-> 0000: LDCN             Load constant NIL
   0001: STL  0005        Store TOS into MP5
   0003: SLDC 01          Short load constant 1
   0004: CSP  26          Call standard procedure UNITCLEAR
   0006: CXP  04 01       Call external procedure INITIALI.INITIALIZE
-> 0009: CBP  20          Call base procedure PASCALSY.32
   000b: SLDL 05          Short load local MP5
   000c: LDCN             Load constant NIL
   000d: NEQI             Integer TOS-1 <> TOS
   000e: FJP  $0013       Jump if TOS false
   0010: CXP  04 01       Call external procedure INITIALI.INITIALIZE
-> 0013: SLDC 00          Short load constant 0
   0014: FJP  $0009       Jump if TOS false
-> 0016: XIT              Exit the operating system
END

### PROCEDURE PASCALSY.EXECERROR(PARAM1) (* P=2 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 0024: SLDC 01          Short load constant 1
   0025: SLDC 0a          Short load constant 10
   0026: CXP  00 1d       Call external procedure PASCALSY.FGOTOXY
   0029: LOD  01 0003     Load word at G3 (OUTPUT)
   002c: NOP              No operation
   002d: LSA  16          Load string address: 'SYSTEM FAILURE NUMBER '
   0045: SLDC 00          Short load constant 0
   0046: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0049: CSP  00          Call standard procedure IOC
   004b: LOD  01 0003     Load word at G3 (OUTPUT)
   004e: SLDO 01          Short load global BASE1
   004f: SLDC 00          Short load constant 0
   0050: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0053: CSP  00          Call standard procedure IOC
   0055: LOD  01 0003     Load word at G3 (OUTPUT)
   0058: NOP              No operation
   0059: LSA  0e          Load string address: '. PLEASE REFER'
   0069: SLDC 00          Short load constant 0
   006a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   006d: CSP  00          Call standard procedure IOC
   006f: SLDC 01          Short load constant 1
   0070: SLDC 0b          Short load constant 11
   0071: CXP  00 1d       Call external procedure PASCALSY.FGOTOXY
   0074: LOD  01 0003     Load word at G3 (OUTPUT)
   0077: LSA  22          Load string address: 'TO PRODUCT MANUAL FOR EXPLANATION.'
   009b: NOP              No operation
   009c: SLDC 00          Short load constant 0
   009d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   00a0: CSP  00          Call standard procedure IOC
-> 00a2: SLDC 01          Short load constant 1
   00a3: FJP  $00a7       Jump if TOS false
   00a5: UJP  $00a2       Unconditional jump
-> 00a7: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FINIT(PARAM1; PARAM2; PARAM3) (* P=3 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 00b6: SLDO 03          Short load global BASE3
   00b7: SLDO 02          Short load global BASE2
   00b8: SLDO 01          Short load global BASE1
   00b9: CXP  06 02       Call external procedure SYSIO.2
-> 00bc: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FRESET(PARAM1) (* P=4 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 00c8: SLDO 01          Short load global BASE1
   00c9: CXP  06 03       Call external procedure SYSIO.3
-> 00cc: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FOPEN(PARAM1; PARAM2; PARAM3; PARAM4) (* P=5 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
BEGIN
-> 00d8: SLDO 04          Short load global BASE4
   00d9: SLDO 03          Short load global BASE3
   00da: SLDO 02          Short load global BASE2
   00db: SLDO 01          Short load global BASE1
   00dc: CXP  06 04       Call external procedure SYSIO.4
-> 00df: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FCLOSE(PARAM1; PARAM2) (* P=6 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
BEGIN
-> 00ec: SLDO 02          Short load global BASE2
   00ed: SLDO 01          Short load global BASE1
   00ee: CXP  06 05       Call external procedure SYSIO.5
-> 00f1: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FGET(PARAM1) (* P=7 LL=0 *)
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
   0104: SRO  000c        Store global word BASE12
   0106: SLDO 0c          Short load global BASE12
   0107: SIND 05          Short index load *TOS+5
   0108: FJP  $0204       Jump if TOS false
   010a: SLDO 0c          Short load global BASE12
   010b: IND  000e        Static index and load word (TOS+14)
   010d: SLDC 00          Short load constant 0
   010e: GRTI             Integer TOS-1 > TOS
   010f: FJP  $0123       Jump if TOS false
   0111: SLDO 0c          Short load global BASE12
   0112: INC  000e        Inc field ptr (TOS+14)
   0114: SLDO 0c          Short load global BASE12
   0115: IND  000e        Static index and load word (TOS+14)
   0117: SLDC 01          Short load constant 1
   0118: SBI              Subtract integers (TOS-1 - TOS)
   0119: STO              Store indirect (TOS into TOS-1)
   011a: SLDO 0c          Short load global BASE12
   011b: IND  000e        Static index and load word (TOS+14)
   011d: SLDC 00          Short load constant 0
   011e: GRTI             Integer TOS-1 > TOS
   011f: FJP  $0123       Jump if TOS false
   0121: UJP  $0213       Unconditional jump
-> 0123: SLDO 0c          Short load global BASE12
   0124: IND  001d        Static index and load word (TOS+29)
   0126: FJP  $0134       Jump if TOS false
   0128: SLDO 01          Short load global BASE1
   0129: SLDC 00          Short load constant 0
   012a: SLDC 00          Short load constant 0
   012b: CXP  02 02       Call external procedure FIOPRIMS.2
   012e: FJP  $0132       Jump if TOS false
   0130: UJP  $0209       Unconditional jump
-> 0132: UJP  $01a5       Unconditional jump
-> 0134: SLDO 0c          Short load global BASE12
   0135: SIND 07          Short index load *TOS+7
   0136: SLDC 01          Short load constant 1
   0137: EQUI             Integer TOS-1 = TOS
   0138: SRO  0009        Store global word BASE9
   013a: SLDO 09          Short load global BASE9
   013b: FJP  $0142       Jump if TOS false
   013d: SLDC 02          Short load constant 2
   013e: SRO  0007        Store global word BASE7
   0140: UJP  $0146       Unconditional jump
-> 0142: SLDO 0c          Short load global BASE12
   0143: SIND 07          Short index load *TOS+7
   0144: SRO  0007        Store global word BASE7
-> 0146: SLDC 01          Short load constant 1
   0147: SRO  000a        Store global word BASE10
   0149: SLDC 20          Short load constant 32
   014a: SRO  000b        Store global word BASE11
   014c: SLDC 00          Short load constant 0
   014d: SRO  0002        Store global word BASE2
-> 014f: SLDO 02          Short load global BASE2
   0150: SLDO 0c          Short load global BASE12
   0151: SIND 04          Short index load *TOS+4
   0152: LESI             Integer TOS-1 < TOS
   0153: SLDO 0a          Short load global BASE10
   0154: LAND             Logical AND (TOS & TOS-1)
   0155: FJP  $01a5       Jump if TOS false
   0157: SLDO 07          Short load global BASE7
   0158: LAO  000b        Load global BASE11
   015a: SLDC 00          Short load constant 0
   015b: SLDC 01          Short load constant 1
   015c: SLDC 00          Short load constant 0
   015d: SLDC 00          Short load constant 0
   015e: CSP  05          Call standard procedure UNITREAD
   0160: CSP  22          Call standard procedure IORESULT
   0162: SLDC 00          Short load constant 0
   0163: NEQI             Integer TOS-1 <> TOS
   0164: FJP  $0168       Jump if TOS false
   0166: UJP  $0209       Unconditional jump
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
   0179: LAO  000b        Load global BASE11
   017b: SLDC 00          Short load constant 0
   017c: SLDC 01          Short load constant 1
   017d: SLDC 00          Short load constant 0
   017e: SLDC 00          Short load constant 0
   017f: CSP  06          Call standard procedure UNITWRITE
-> 0181: SLDO 0b          Short load global BASE11
   0182: LOD  01 0001     Load word at G1 (SYSCOM)
   0185: INC  0029        Inc field ptr (TOS+41)
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
   0194: SRO  000b        Store global word BASE11
-> 0196: SLDC 00          Short load constant 0
   0197: SRO  000a        Store global word BASE10
-> 0199: SLDO 0c          Short load global BASE12
   019a: SIND 00          Short index load *TOS+0
   019b: SLDO 02          Short load global BASE2
   019c: SLDO 0b          Short load global BASE11
   019d: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   019e: SLDO 02          Short load global BASE2
   019f: SLDC 01          Short load constant 1
   01a0: ADI              Add integers (TOS + TOS-1)
   01a1: SRO  0002        Store global word BASE2
   01a3: UJP  $014f       Unconditional jump
-> 01a5: SLDO 0c          Short load global BASE12
   01a6: SIND 04          Short index load *TOS+4
   01a7: SLDC 01          Short load constant 1
   01a8: EQUI             Integer TOS-1 = TOS
   01a9: FJP  $0202       Jump if TOS false
   01ab: SLDO 0c          Short load global BASE12
   01ac: INC  0001        Inc field ptr (TOS+1)
   01ae: SLDC 00          Short load constant 0
   01af: STO              Store indirect (TOS into TOS-1)
   01b0: SLDO 0c          Short load global BASE12
   01b1: SIND 03          Short index load *TOS+3
   01b2: SLDC 00          Short load constant 0
   01b3: NEQI             Integer TOS-1 <> TOS
   01b4: FJP  $01bb       Jump if TOS false
   01b6: SLDO 0c          Short load global BASE12
   01b7: INC  0003        Inc field ptr (TOS+3)
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
   01c9: INC  0001        Inc field ptr (TOS+1)
   01cb: SLDC 01          Short load constant 1
   01cc: STO              Store indirect (TOS into TOS-1)
   01cd: UJP  $0213       Unconditional jump
-> 01cf: SLDO 0c          Short load global BASE12
   01d0: SIND 07          Short index load *TOS+7
   01d1: SLDC 02          Short load constant 2
   01d2: GRTI             Integer TOS-1 > TOS
   01d3: FJP  $01df       Jump if TOS false
   01d5: SLDO 01          Short load global BASE1
   01d6: SLDC 00          Short load constant 0
   01d7: SLDC 00          Short load constant 0
   01d8: CXP  02 03       Call external procedure FIOPRIMS.3
   01db: FJP  $01df       Jump if TOS false
   01dd: UJP  $0213       Unconditional jump
-> 01df: SLDO 0c          Short load global BASE12
   01e0: SIND 00          Short index load *TOS+0
   01e1: SLDC 00          Short load constant 0
   01e2: LDB              Load byte at byte ptr TOS-1 + TOS
   01e3: SLDC 00          Short load constant 0
   01e4: EQUI             Integer TOS-1 = TOS
   01e5: FJP  $0202       Jump if TOS false
   01e7: SLDO 0c          Short load global BASE12
   01e8: IND  001d        Static index and load word (TOS+29)
   01ea: SLDO 0c          Short load global BASE12
   01eb: INC  0012        Inc field ptr (TOS+18)
   01ed: SLDC 04          Short load constant 4
   01ee: SLDC 00          Short load constant 0
   01ef: LDP              Load packed field (TOS)
   01f0: SLDC 03          Short load constant 3
   01f1: EQUI             Integer TOS-1 = TOS
   01f2: LAND             Logical AND (TOS & TOS-1)
   01f3: FJP  $01fb       Jump if TOS false
   01f5: SLDO 01          Short load global BASE1
   01f6: CXP  02 04       Call external procedure FIOPRIMS.4
   01f9: UJP  $0202       Unconditional jump
-> 01fb: SLDO 0c          Short load global BASE12
   01fc: SIND 00          Short index load *TOS+0
   01fd: SLDC 00          Short load constant 0
   01fe: SLDC 20          Short load constant 32
   01ff: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0200: UJP  $0209       Unconditional jump
-> 0202: UJP  $0213       Unconditional jump
-> 0204: LOD  01 0001     Load word at G1 (SYSCOM)
   0207: SLDC 0d          Short load constant 13
   0208: STO              Store indirect (TOS into TOS-1)
-> 0209: SLDO 0c          Short load global BASE12
   020a: INC  0002        Inc field ptr (TOS+2)
   020c: SLDC 01          Short load constant 1
   020d: STO              Store indirect (TOS into TOS-1)
   020e: SLDO 0c          Short load global BASE12
   020f: INC  0001        Inc field ptr (TOS+1)
   0211: SLDC 01          Short load constant 1
   0212: STO              Store indirect (TOS into TOS-1)
-> 0213: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FPUT(PARAM1) (* P=8 LL=0 *)
  BASE1=PARAM1
  BASE7
BEGIN
-> 0228: LOD  01 0001     Load word at G1 (SYSCOM)
   022b: SLDC 00          Short load constant 0
   022c: STO              Store indirect (TOS into TOS-1)
   022d: SLDO 01          Short load global BASE1
   022e: SRO  0007        Store global word BASE7
   0230: SLDO 07          Short load global BASE7
   0231: SIND 05          Short index load *TOS+5
   0232: FJP  $025a       Jump if TOS false
   0234: SLDO 07          Short load global BASE7
   0235: IND  001d        Static index and load word (TOS+29)
   0237: FJP  $0245       Jump if TOS false
   0239: SLDO 01          Short load global BASE1
   023a: SLDC 00          Short load constant 0
   023b: SLDC 00          Short load constant 0
   023c: CXP  02 05       Call external procedure FIOPRIMS.5
   023f: FJP  $0243       Jump if TOS false
   0241: UJP  $025f       Unconditional jump
-> 0243: UJP  $0258       Unconditional jump
-> 0245: SLDO 07          Short load global BASE7
   0246: SIND 07          Short index load *TOS+7
   0247: SLDO 07          Short load global BASE7
   0248: SIND 00          Short index load *TOS+0
   0249: SLDC 00          Short load constant 0
   024a: SLDO 07          Short load global BASE7
   024b: SIND 04          Short index load *TOS+4
   024c: SLDC 00          Short load constant 0
   024d: SLDC 00          Short load constant 0
   024e: CSP  06          Call standard procedure UNITWRITE
   0250: CSP  22          Call standard procedure IORESULT
   0252: SLDC 00          Short load constant 0
   0253: NEQI             Integer TOS-1 <> TOS
   0254: FJP  $0258       Jump if TOS false
   0256: UJP  $025f       Unconditional jump
-> 0258: UJP  $0269       Unconditional jump
-> 025a: LOD  01 0001     Load word at G1 (SYSCOM)
   025d: SLDC 0d          Short load constant 13
   025e: STO              Store indirect (TOS into TOS-1)
-> 025f: SLDO 07          Short load global BASE7
   0260: INC  0002        Inc field ptr (TOS+2)
   0262: SLDC 01          Short load constant 1
   0263: STO              Store indirect (TOS into TOS-1)
   0264: SLDO 07          Short load global BASE7
   0265: INC  0001        Inc field ptr (TOS+1)
   0267: SLDC 01          Short load constant 1
   0268: STO              Store indirect (TOS into TOS-1)
-> 0269: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XSEEK (* P=9 LL=0 *)
BEGIN
-> 0276: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FEOF(PARAM1): RETVAL (* P=10 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
BEGIN
-> 0282: SLDO 03          Short load global BASE3
   0283: SIND 02          Short index load *TOS+2
   0284: SRO  0001        Store global word BASE1
-> 0286: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FEOLN(PARAM1): RETVAL (* P=11 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
BEGIN
-> 0292: SLDO 03          Short load global BASE3
   0293: SIND 01          Short index load *TOS+1
   0294: SRO  0001        Store global word BASE1
-> 0296: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.FREADINT(PARAM1; PARAM2) (* P=12 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
  BASE4
  BASE5
  BASE6
  BASE7
  BASE48
BEGIN
-> 02a2: SLDO 02          Short load global BASE2
   02a3: SRO  0030        Store global word BASE48
   02a5: LDO  0030        Load global word BASE48
   02a7: SIND 07          Short index load *TOS+7
   02a8: SLDC 01          Short load constant 1
   02a9: EQUI             Integer TOS-1 = TOS
   02aa: FJP  $02b3       Jump if TOS false
   02ac: LAO  0007        Load global BASE7
   02ae: SLDC 00          Short load constant 0
   02af: SLDC 51          Short load constant 81
   02b0: SLDC 50          Short load constant 80
   02b1: CSP  0a          Call standard procedure FLCH
-> 02b3: SLDO 01          Short load global BASE1
   02b4: SLDC 00          Short load constant 0
   02b5: STO              Store indirect (TOS into TOS-1)
   02b6: SLDC 00          Short load constant 0
   02b7: SRO  0005        Store global word BASE5
   02b9: SLDC 00          Short load constant 0
   02ba: SRO  0004        Store global word BASE4
   02bc: LDO  0030        Load global word BASE48
   02be: SIND 03          Short index load *TOS+3
   02bf: SLDC 01          Short load constant 1
   02c0: EQUI             Integer TOS-1 = TOS
   02c1: FJP  $02c6       Jump if TOS false
   02c3: SLDO 02          Short load global BASE2
   02c4: CBP  07          Call base procedure PASCALSY.FGET
-> 02c6: LDO  0030        Load global word BASE48
   02c8: SIND 00          Short index load *TOS+0
   02c9: SLDC 00          Short load constant 0
   02ca: LDB              Load byte at byte ptr TOS-1 + TOS
   02cb: SLDC 20          Short load constant 32
   02cc: EQUI             Integer TOS-1 = TOS
   02cd: LDO  0030        Load global word BASE48
   02cf: SIND 02          Short index load *TOS+2
   02d0: LNOT             Logical NOT (~TOS)
   02d1: LAND             Logical AND (TOS & TOS-1)
   02d2: FJP  $02d9       Jump if TOS false
   02d4: SLDO 02          Short load global BASE2
   02d5: CBP  07          Call base procedure PASCALSY.FGET
   02d7: UJP  $02c6       Unconditional jump
-> 02d9: LDO  0030        Load global word BASE48
   02db: SIND 02          Short index load *TOS+2
   02dc: FJP  $02e0       Jump if TOS false
   02de: UJP  $0380       Unconditional jump
-> 02e0: LDO  0030        Load global word BASE48
   02e2: SIND 00          Short index load *TOS+0
   02e3: SLDC 00          Short load constant 0
   02e4: LDB              Load byte at byte ptr TOS-1 + TOS
   02e5: SRO  0003        Store global word BASE3
   02e7: SLDO 03          Short load global BASE3
   02e8: SLDC 2b          Short load constant 43
   02e9: EQUI             Integer TOS-1 = TOS
   02ea: SLDO 03          Short load global BASE3
   02eb: SLDC 2d          Short load constant 45
   02ec: EQUI             Integer TOS-1 = TOS
   02ed: LOR              Logical OR (TOS | TOS-1)
   02ee: FJP  $0304       Jump if TOS false
   02f0: SLDC 02          Short load constant 2
   02f1: SRO  0006        Store global word BASE6
   02f3: SLDO 03          Short load global BASE3
   02f4: SLDC 2d          Short load constant 45
   02f5: EQUI             Integer TOS-1 = TOS
   02f6: SRO  0005        Store global word BASE5
   02f8: SLDO 02          Short load global BASE2
   02f9: CBP  07          Call base procedure PASCALSY.FGET
   02fb: LDO  0030        Load global word BASE48
   02fd: SIND 00          Short index load *TOS+0
   02fe: SLDC 00          Short load constant 0
   02ff: LDB              Load byte at byte ptr TOS-1 + TOS
   0300: SRO  0003        Store global word BASE3
   0302: UJP  $0307       Unconditional jump
-> 0304: SLDC 01          Short load constant 1
   0305: SRO  0006        Store global word BASE6
-> 0307: SLDO 03          Short load global BASE3
   0308: SLDC 30          Short load constant 48
   0309: GEQI             Integer TOS-1 >= TOS
   030a: SLDO 03          Short load global BASE3
   030b: SLDC 39          Short load constant 57
   030c: LEQI             Integer TOS-1 <= TOS
   030d: LAND             Logical AND (TOS & TOS-1)
   030e: FJP  $0368       Jump if TOS false
   0310: SLDC 01          Short load constant 1
   0311: SRO  0004        Store global word BASE4
-> 0313: SLDO 01          Short load global BASE1
   0314: SLDO 01          Short load global BASE1
   0315: SIND 00          Short index load *TOS+0
   0316: SLDC 0a          Short load constant 10
   0317: MPI              Multiply integers (TOS * TOS-1)
   0318: SLDO 03          Short load global BASE3
   0319: ADI              Add integers (TOS + TOS-1)
   031a: SLDC 30          Short load constant 48
   031b: SBI              Subtract integers (TOS-1 - TOS)
   031c: STO              Store indirect (TOS into TOS-1)
   031d: SLDO 02          Short load global BASE2
   031e: CBP  07          Call base procedure PASCALSY.FGET
   0320: LDO  0030        Load global word BASE48
   0322: SIND 00          Short index load *TOS+0
   0323: SLDC 00          Short load constant 0
   0324: LDB              Load byte at byte ptr TOS-1 + TOS
   0325: SRO  0003        Store global word BASE3
   0327: SLDO 06          Short load global BASE6
   0328: SLDC 01          Short load constant 1
   0329: ADI              Add integers (TOS + TOS-1)
   032a: SRO  0006        Store global word BASE6
   032c: LDO  0030        Load global word BASE48
   032e: SIND 07          Short index load *TOS+7
   032f: SLDC 01          Short load constant 1
   0330: EQUI             Integer TOS-1 = TOS
   0331: FJP  $035a       Jump if TOS false
-> 0333: SLDO 03          Short load global BASE3
   0334: LAO  0006        Load global BASE6
   0336: LAO  0007        Load global BASE7
   0338: SLDC 00          Short load constant 0
   0339: SLDC 00          Short load constant 0
   033a: CBP  23          Call base procedure PASCALSY.35
   033c: FJP  $035a       Jump if TOS false
   033e: SLDO 06          Short load global BASE6
   033f: SLDC 01          Short load constant 1
   0340: EQUI             Integer TOS-1 = TOS
   0341: FJP  $0348       Jump if TOS false
   0343: SLDO 01          Short load global BASE1
   0344: SLDC 00          Short load constant 0
   0345: STO              Store indirect (TOS into TOS-1)
   0346: UJP  $034e       Unconditional jump
-> 0348: SLDO 01          Short load global BASE1
   0349: SLDO 01          Short load global BASE1
   034a: SIND 00          Short index load *TOS+0
   034b: SLDC 0a          Short load constant 10
   034c: DVI              Divide integers (TOS-1 / TOS)
   034d: STO              Store indirect (TOS into TOS-1)
-> 034e: SLDO 02          Short load global BASE2
   034f: CBP  07          Call base procedure PASCALSY.FGET
   0351: LDO  0030        Load global word BASE48
   0353: SIND 00          Short index load *TOS+0
   0354: SLDC 00          Short load constant 0
   0355: LDB              Load byte at byte ptr TOS-1 + TOS
   0356: SRO  0003        Store global word BASE3
   0358: UJP  $0333       Unconditional jump
-> 035a: SLDO 03          Short load global BASE3
   035b: SLDC 30          Short load constant 48
   035c: GEQI             Integer TOS-1 >= TOS
   035d: SLDO 03          Short load global BASE3
   035e: SLDC 39          Short load constant 57
   035f: LEQI             Integer TOS-1 <= TOS
   0360: LAND             Logical AND (TOS & TOS-1)
   0361: LNOT             Logical NOT (~TOS)
   0362: LDO  0030        Load global word BASE48
   0364: SIND 01          Short index load *TOS+1
   0365: LOR              Logical OR (TOS | TOS-1)
   0366: FJP  $0313       Jump if TOS false
-> 0368: SLDO 04          Short load global BASE4
   0369: LDO  0030        Load global word BASE48
   036b: SIND 02          Short index load *TOS+2
   036c: LOR              Logical OR (TOS | TOS-1)
   036d: FJP  $037b       Jump if TOS false
   036f: SLDO 05          Short load global BASE5
   0370: FJP  $0379       Jump if TOS false
   0372: SLDO 01          Short load global BASE1
   0373: SLDO 01          Short load global BASE1
   0374: SIND 00          Short index load *TOS+0
   0375: NGI              Negate integer
   0376: STO              Store indirect (TOS into TOS-1)
   0377: UJP  $0379       Unconditional jump
-> 0379: UJP  $0380       Unconditional jump
-> 037b: LOD  01 0001     Load word at G1 (SYSCOM)
   037e: SLDC 0e          Short load constant 14
   037f: STO              Store indirect (TOS into TOS-1)
-> 0380: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITEINT(PARAM1; PARAM2; PARAM3) (* P=13 LL=0 *)
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
-> 0394: SLDC 01          Short load constant 1
   0395: SRO  0004        Store global word BASE4
   0397: LAO  0008        Load global BASE8
   0399: SLDC 00          Short load constant 0
   039a: SLDC 0a          Short load constant 10
   039b: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   039c: SLDC 01          Short load constant 1
   039d: SRO  0007        Store global word BASE7
   039f: SLDO 02          Short load global BASE2
   03a0: SLDC 00          Short load constant 0
   03a1: LESI             Integer TOS-1 < TOS
   03a2: FJP  $03cb       Jump if TOS false
   03a4: SLDO 02          Short load global BASE2
   03a5: LDCI 7fff        Load word 32767
   03a8: NGI              Negate integer
   03a9: SLDC 01          Short load constant 1
   03aa: SBI              Subtract integers (TOS-1 - TOS)
   03ab: EQUI             Integer TOS-1 = TOS
   03ac: FJP  $03bf       Jump if TOS false
   03ae: LAO  0008        Load global BASE8
   03b0: NOP              No operation
   03b1: LSA  06          Load string address: '-32768'
   03b9: SAS  0a          String assign (TOS to TOS-1, 10 chars)
   03bb: UJP  $041b       Unconditional jump
   03bd: UJP  $03cb       Unconditional jump
-> 03bf: SLDO 02          Short load global BASE2
   03c0: ABI              Absolute value of integer (TOS)
   03c1: SRO  0002        Store global word BASE2
   03c3: LAO  0008        Load global BASE8
   03c5: SLDC 01          Short load constant 1
   03c6: SLDC 2d          Short load constant 45
   03c7: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   03c8: SLDC 02          Short load constant 2
   03c9: SRO  0004        Store global word BASE4
-> 03cb: SLDC 04          Short load constant 4
   03cc: SRO  0005        Store global word BASE5
   03ce: SLDC 00          Short load constant 0
   03cf: SRO  000e        Store global word BASE14
-> 03d1: SLDO 05          Short load global BASE5
   03d2: SLDO 0e          Short load global BASE14
   03d3: GEQI             Integer TOS-1 >= TOS
   03d4: FJP  $0414       Jump if TOS false
   03d6: SLDO 02          Short load global BASE2
   03d7: LDA  01 0014     Load addr G20
   03da: SLDO 05          Short load global BASE5
   03db: IXA  0001        Index array (TOS-1 + TOS * 1)
   03dd: SIND 00          Short index load *TOS+0
   03de: DVI              Divide integers (TOS-1 / TOS)
   03df: SLDC 30          Short load constant 48
   03e0: ADI              Add integers (TOS + TOS-1)
   03e1: SRO  0006        Store global word BASE6
   03e3: SLDO 06          Short load global BASE6
   03e4: SLDC 30          Short load constant 48
   03e5: EQUI             Integer TOS-1 = TOS
   03e6: SLDO 05          Short load global BASE5
   03e7: SLDC 00          Short load constant 0
   03e8: GRTI             Integer TOS-1 > TOS
   03e9: LAND             Logical AND (TOS & TOS-1)
   03ea: SLDO 07          Short load global BASE7
   03eb: LAND             Logical AND (TOS & TOS-1)
   03ec: FJP  $03f0       Jump if TOS false
   03ee: UJP  $040d       Unconditional jump
-> 03f0: SLDC 00          Short load constant 0
   03f1: SRO  0007        Store global word BASE7
   03f3: LAO  0008        Load global BASE8
   03f5: SLDO 04          Short load global BASE4
   03f6: SLDO 06          Short load global BASE6
   03f7: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   03f8: SLDO 04          Short load global BASE4
   03f9: SLDC 01          Short load constant 1
   03fa: ADI              Add integers (TOS + TOS-1)
   03fb: SRO  0004        Store global word BASE4
   03fd: SLDO 06          Short load global BASE6
   03fe: SLDC 30          Short load constant 48
   03ff: NEQI             Integer TOS-1 <> TOS
   0400: FJP  $040d       Jump if TOS false
   0402: SLDO 02          Short load global BASE2
   0403: LDA  01 0014     Load addr G20
   0406: SLDO 05          Short load global BASE5
   0407: IXA  0001        Index array (TOS-1 + TOS * 1)
   0409: SIND 00          Short index load *TOS+0
   040a: MODI             Modulo integers (TOS-1 % TOS)
   040b: SRO  0002        Store global word BASE2
-> 040d: SLDO 05          Short load global BASE5
   040e: SLDC 01          Short load constant 1
   040f: SBI              Subtract integers (TOS-1 - TOS)
   0410: SRO  0005        Store global word BASE5
   0412: UJP  $03d1       Unconditional jump
-> 0414: LAO  0008        Load global BASE8
   0416: SLDC 00          Short load constant 0
   0417: SLDO 04          Short load global BASE4
   0418: SLDC 01          Short load constant 1
   0419: SBI              Subtract integers (TOS-1 - TOS)
   041a: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 041b: SLDO 01          Short load global BASE1
   041c: LAO  0008        Load global BASE8
   041e: SLDC 00          Short load constant 0
   041f: LDB              Load byte at byte ptr TOS-1 + TOS
   0420: LESI             Integer TOS-1 < TOS
   0421: FJP  $0429       Jump if TOS false
   0423: LAO  0008        Load global BASE8
   0425: SLDC 00          Short load constant 0
   0426: LDB              Load byte at byte ptr TOS-1 + TOS
   0427: SRO  0001        Store global word BASE1
-> 0429: SLDO 03          Short load global BASE3
   042a: LAO  0008        Load global BASE8
   042c: SLDO 01          Short load global BASE1
   042d: CBP  13          Call base procedure PASCALSY.FWRITESTRING
-> 042f: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XREADREAL (* P=14 LL=0 *)
BEGIN
-> 043e: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XWRITEREAL (* P=15 LL=0 *)
BEGIN
-> 044a: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADCHAR(PARAM1; PARAM2) (* P=16 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0456: SLDO 02          Short load global BASE2
   0457: SRO  0003        Store global word BASE3
   0459: LOD  01 0001     Load word at G1 (SYSCOM)
   045c: SLDC 00          Short load constant 0
   045d: STO              Store indirect (TOS into TOS-1)
   045e: SLDO 03          Short load global BASE3
   045f: SIND 03          Short index load *TOS+3
   0460: SLDC 01          Short load constant 1
   0461: EQUI             Integer TOS-1 = TOS
   0462: FJP  $0467       Jump if TOS false
   0464: SLDO 02          Short load global BASE2
   0465: CBP  07          Call base procedure PASCALSY.FGET
-> 0467: SLDO 01          Short load global BASE1
   0468: SLDO 03          Short load global BASE3
   0469: SIND 00          Short index load *TOS+0
   046a: SLDC 00          Short load constant 0
   046b: LDB              Load byte at byte ptr TOS-1 + TOS
   046c: STO              Store indirect (TOS into TOS-1)
   046d: SLDO 03          Short load global BASE3
   046e: SIND 03          Short index load *TOS+3
   046f: SLDC 00          Short load constant 0
   0470: EQUI             Integer TOS-1 = TOS
   0471: FJP  $0478       Jump if TOS false
   0473: SLDO 02          Short load global BASE2
   0474: CBP  07          Call base procedure PASCALSY.FGET
   0476: UJP  $047d       Unconditional jump
-> 0478: SLDO 03          Short load global BASE3
   0479: INC  0003        Inc field ptr (TOS+3)
   047b: SLDC 01          Short load constant 1
   047c: STO              Store indirect (TOS into TOS-1)
-> 047d: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITECHAR(PARAM1; PARAM2; PARAM3) (* P=17 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 048a: SLDO 03          Short load global BASE3
   048b: SRO  0004        Store global word BASE4
   048d: SLDO 04          Short load global BASE4
   048e: SIND 05          Short index load *TOS+5
   048f: FJP  $04af       Jump if TOS false
-> 0491: SLDO 01          Short load global BASE1
   0492: SLDC 01          Short load constant 1
   0493: GRTI             Integer TOS-1 > TOS
   0494: FJP  $04a5       Jump if TOS false
   0496: SLDO 04          Short load global BASE4
   0497: SIND 00          Short index load *TOS+0
   0498: SLDC 00          Short load constant 0
   0499: SLDC 20          Short load constant 32
   049a: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   049b: SLDO 03          Short load global BASE3
   049c: CBP  08          Call base procedure PASCALSY.FPUT
   049e: SLDO 01          Short load global BASE1
   049f: SLDC 01          Short load constant 1
   04a0: SBI              Subtract integers (TOS-1 - TOS)
   04a1: SRO  0001        Store global word BASE1
   04a3: UJP  $0491       Unconditional jump
-> 04a5: SLDO 04          Short load global BASE4
   04a6: SIND 00          Short index load *TOS+0
   04a7: SLDC 00          Short load constant 0
   04a8: SLDO 02          Short load global BASE2
   04a9: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   04aa: SLDO 03          Short load global BASE3
   04ab: CBP  08          Call base procedure PASCALSY.FPUT
   04ad: UJP  $04b4       Unconditional jump
-> 04af: LOD  01 0001     Load word at G1 (SYSCOM)
   04b2: SLDC 0d          Short load constant 13
   04b3: STO              Store indirect (TOS into TOS-1)
-> 04b4: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADSTRING(PARAM1; PARAM2; PARAM3) (* P=18 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 04c2: SLDO 03          Short load global BASE3
   04c3: SRO  0006        Store global word BASE6
   04c5: SLDC 01          Short load constant 1
   04c6: SRO  0004        Store global word BASE4
   04c8: SLDO 06          Short load global BASE6
   04c9: SIND 03          Short index load *TOS+3
   04ca: SLDC 01          Short load constant 1
   04cb: EQUI             Integer TOS-1 = TOS
   04cc: FJP  $04d1       Jump if TOS false
   04ce: SLDO 03          Short load global BASE3
   04cf: CBP  07          Call base procedure PASCALSY.FGET
-> 04d1: SLDO 02          Short load global BASE2
   04d2: SLDC 00          Short load constant 0
   04d3: SLDO 01          Short load global BASE1
   04d4: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 04d5: SLDO 04          Short load global BASE4
   04d6: SLDO 01          Short load global BASE1
   04d7: LEQI             Integer TOS-1 <= TOS
   04d8: SLDO 06          Short load global BASE6
   04d9: SIND 01          Short index load *TOS+1
   04da: SLDO 06          Short load global BASE6
   04db: SIND 02          Short index load *TOS+2
   04dc: LOR              Logical OR (TOS | TOS-1)
   04dd: LNOT             Logical NOT (~TOS)
   04de: LAND             Logical AND (TOS & TOS-1)
   04df: FJP  $0512       Jump if TOS false
   04e1: SLDO 06          Short load global BASE6
   04e2: SIND 00          Short index load *TOS+0
   04e3: SLDC 00          Short load constant 0
   04e4: LDB              Load byte at byte ptr TOS-1 + TOS
   04e5: SRO  0005        Store global word BASE5
   04e7: SLDO 06          Short load global BASE6
   04e8: SIND 07          Short index load *TOS+7
   04e9: SLDC 01          Short load constant 1
   04ea: EQUI             Integer TOS-1 = TOS
   04eb: FJP  $0504       Jump if TOS false
   04ed: SLDO 05          Short load global BASE5
   04ee: LAO  0004        Load global BASE4
   04f0: SLDO 02          Short load global BASE2
   04f1: SLDC 00          Short load constant 0
   04f2: SLDC 00          Short load constant 0
   04f3: CBP  23          Call base procedure PASCALSY.35
   04f5: FJP  $04f9       Jump if TOS false
   04f7: UJP  $0502       Unconditional jump
-> 04f9: SLDO 02          Short load global BASE2
   04fa: SLDO 04          Short load global BASE4
   04fb: SLDO 05          Short load global BASE5
   04fc: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   04fd: SLDO 04          Short load global BASE4
   04fe: SLDC 01          Short load constant 1
   04ff: ADI              Add integers (TOS + TOS-1)
   0500: SRO  0004        Store global word BASE4
-> 0502: UJP  $050d       Unconditional jump
-> 0504: SLDO 02          Short load global BASE2
   0505: SLDO 04          Short load global BASE4
   0506: SLDO 05          Short load global BASE5
   0507: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0508: SLDO 04          Short load global BASE4
   0509: SLDC 01          Short load constant 1
   050a: ADI              Add integers (TOS + TOS-1)
   050b: SRO  0004        Store global word BASE4
-> 050d: SLDO 03          Short load global BASE3
   050e: CBP  07          Call base procedure PASCALSY.FGET
   0510: UJP  $04d5       Unconditional jump
-> 0512: SLDO 02          Short load global BASE2
   0513: SLDC 00          Short load constant 0
   0514: SLDO 04          Short load global BASE4
   0515: SLDC 01          Short load constant 1
   0516: SBI              Subtract integers (TOS-1 - TOS)
   0517: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0518: SLDO 06          Short load global BASE6
   0519: SIND 01          Short index load *TOS+1
   051a: LNOT             Logical NOT (~TOS)
   051b: FJP  $0522       Jump if TOS false
   051d: SLDO 03          Short load global BASE3
   051e: CBP  07          Call base procedure PASCALSY.FGET
   0520: UJP  $0518       Unconditional jump
-> 0522: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITESTRING(PARAM1; PARAM2; PARAM3) (* P=19 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 0532: SLDO 01          Short load global BASE1
   0533: SLDC 00          Short load constant 0
   0534: LEQI             Integer TOS-1 <= TOS
   0535: FJP  $053c       Jump if TOS false
   0537: SLDO 02          Short load global BASE2
   0538: SLDC 00          Short load constant 0
   0539: LDB              Load byte at byte ptr TOS-1 + TOS
   053a: SRO  0001        Store global word BASE1
-> 053c: SLDO 03          Short load global BASE3
   053d: SLDO 02          Short load global BASE2
   053e: SLDC 01          Short load constant 1
   053f: ADI              Add integers (TOS + TOS-1)
   0540: SLDO 01          Short load global BASE1
   0541: SLDO 02          Short load global BASE2
   0542: SLDC 00          Short load constant 0
   0543: LDB              Load byte at byte ptr TOS-1 + TOS
   0544: CBP  14          Call base procedure PASCALSY.FWRITEBYTES
-> 0546: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITEBYTES(PARAM1; PARAM2; PARAM3; PARAM4) (* P=20 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
  BASE6
BEGIN
-> 0552: LOD  01 0001     Load word at G1 (SYSCOM)
   0555: SLDC 00          Short load constant 0
   0556: STO              Store indirect (TOS into TOS-1)
   0557: SLDO 04          Short load global BASE4
   0558: SRO  0006        Store global word BASE6
   055a: SLDO 06          Short load global BASE6
   055b: SIND 05          Short index load *TOS+5
   055c: FJP  $059c       Jump if TOS false
   055e: SLDO 02          Short load global BASE2
   055f: SLDO 01          Short load global BASE1
   0560: GRTI             Integer TOS-1 > TOS
   0561: FJP  $056d       Jump if TOS false
   0563: SLDO 04          Short load global BASE4
   0564: SLDC 20          Short load constant 32
   0565: SLDO 02          Short load global BASE2
   0566: SLDO 01          Short load global BASE1
   0567: SBI              Subtract integers (TOS-1 - TOS)
   0568: CBP  11          Call base procedure PASCALSY.FWRITECHAR
   056a: SLDO 01          Short load global BASE1
   056b: SRO  0002        Store global word BASE2
-> 056d: SLDO 06          Short load global BASE6
   056e: IND  001d        Static index and load word (TOS+29)
   0570: FJP  $0591       Jump if TOS false
   0572: SLDC 00          Short load constant 0
   0573: SRO  0005        Store global word BASE5
-> 0575: SLDO 05          Short load global BASE5
   0576: SLDO 02          Short load global BASE2
   0577: LESI             Integer TOS-1 < TOS
   0578: SLDO 06          Short load global BASE6
   0579: SIND 02          Short index load *TOS+2
   057a: LNOT             Logical NOT (~TOS)
   057b: LAND             Logical AND (TOS & TOS-1)
   057c: FJP  $058f       Jump if TOS false
   057e: SLDO 06          Short load global BASE6
   057f: SIND 00          Short index load *TOS+0
   0580: SLDC 00          Short load constant 0
   0581: SLDO 03          Short load global BASE3
   0582: SLDO 05          Short load global BASE5
   0583: LDB              Load byte at byte ptr TOS-1 + TOS
   0584: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0585: SLDO 04          Short load global BASE4
   0586: CBP  08          Call base procedure PASCALSY.FPUT
   0588: SLDO 05          Short load global BASE5
   0589: SLDC 01          Short load constant 1
   058a: ADI              Add integers (TOS + TOS-1)
   058b: SRO  0005        Store global word BASE5
   058d: UJP  $0575       Unconditional jump
-> 058f: UJP  $059a       Unconditional jump
-> 0591: SLDO 06          Short load global BASE6
   0592: SIND 07          Short index load *TOS+7
   0593: SLDO 03          Short load global BASE3
   0594: SLDC 00          Short load constant 0
   0595: SLDO 02          Short load global BASE2
   0596: SLDC 00          Short load constant 0
   0597: SLDC 00          Short load constant 0
   0598: CSP  06          Call standard procedure UNITWRITE
-> 059a: UJP  $05a1       Unconditional jump
-> 059c: LOD  01 0001     Load word at G1 (SYSCOM)
   059f: SLDC 0d          Short load constant 13
   05a0: STO              Store indirect (TOS into TOS-1)
-> 05a1: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADLN(PARAM1) (* P=21 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 05b0: SLDO 01          Short load global BASE1
   05b1: SIND 01          Short index load *TOS+1
   05b2: LNOT             Logical NOT (~TOS)
   05b3: FJP  $05ba       Jump if TOS false
   05b5: SLDO 01          Short load global BASE1
   05b6: CBP  07          Call base procedure PASCALSY.FGET
   05b8: UJP  $05b0       Unconditional jump
-> 05ba: SLDO 01          Short load global BASE1
   05bb: SIND 03          Short index load *TOS+3
   05bc: SLDC 00          Short load constant 0
   05bd: EQUI             Integer TOS-1 = TOS
   05be: FJP  $05c5       Jump if TOS false
   05c0: SLDO 01          Short load global BASE1
   05c1: CBP  07          Call base procedure PASCALSY.FGET
   05c3: UJP  $05cf       Unconditional jump
-> 05c5: SLDO 01          Short load global BASE1
   05c6: INC  0003        Inc field ptr (TOS+3)
   05c8: SLDC 01          Short load constant 1
   05c9: STO              Store indirect (TOS into TOS-1)
   05ca: SLDO 01          Short load global BASE1
   05cb: INC  0001        Inc field ptr (TOS+1)
   05cd: SLDC 00          Short load constant 0
   05ce: STO              Store indirect (TOS into TOS-1)
-> 05cf: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITELN(PARAM1) (* P=22 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 05de: SLDO 01          Short load global BASE1
   05df: SIND 00          Short index load *TOS+0
   05e0: SLDC 00          Short load constant 0
   05e1: SLDC 0d          Short load constant 13
   05e2: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   05e3: SLDO 01          Short load global BASE1
   05e4: CBP  08          Call base procedure PASCALSY.FPUT
-> 05e6: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCONCAT(PARAM1; PARAM2; PARAM3) (* P=23 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 05f2: SLDO 02          Short load global BASE2
   05f3: SLDC 00          Short load constant 0
   05f4: LDB              Load byte at byte ptr TOS-1 + TOS
   05f5: SLDO 03          Short load global BASE3
   05f6: SLDC 00          Short load constant 0
   05f7: LDB              Load byte at byte ptr TOS-1 + TOS
   05f8: ADI              Add integers (TOS + TOS-1)
   05f9: SLDO 01          Short load global BASE1
   05fa: LEQI             Integer TOS-1 <= TOS
   05fb: FJP  $0614       Jump if TOS false
   05fd: SLDO 02          Short load global BASE2
   05fe: SLDC 01          Short load constant 1
   05ff: SLDO 03          Short load global BASE3
   0600: SLDO 03          Short load global BASE3
   0601: SLDC 00          Short load constant 0
   0602: LDB              Load byte at byte ptr TOS-1 + TOS
   0603: SLDC 01          Short load constant 1
   0604: ADI              Add integers (TOS + TOS-1)
   0605: SLDO 02          Short load global BASE2
   0606: SLDC 00          Short load constant 0
   0607: LDB              Load byte at byte ptr TOS-1 + TOS
   0608: CSP  02          Call standard procedure MOVL
   060a: SLDO 03          Short load global BASE3
   060b: SLDC 00          Short load constant 0
   060c: SLDO 02          Short load global BASE2
   060d: SLDC 00          Short load constant 0
   060e: LDB              Load byte at byte ptr TOS-1 + TOS
   060f: SLDO 03          Short load global BASE3
   0610: SLDC 00          Short load constant 0
   0611: LDB              Load byte at byte ptr TOS-1 + TOS
   0612: ADI              Add integers (TOS + TOS-1)
   0613: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0614: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SINSERT(PARAM1; PARAM2; PARAM3; PARAM4) (* P=24 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
BEGIN
-> 0620: SLDO 01          Short load global BASE1
   0621: SLDC 00          Short load constant 0
   0622: GRTI             Integer TOS-1 > TOS
   0623: SLDO 04          Short load global BASE4
   0624: SLDC 00          Short load constant 0
   0625: LDB              Load byte at byte ptr TOS-1 + TOS
   0626: SLDC 00          Short load constant 0
   0627: GRTI             Integer TOS-1 > TOS
   0628: LAND             Logical AND (TOS & TOS-1)
   0629: SLDO 04          Short load global BASE4
   062a: SLDC 00          Short load constant 0
   062b: LDB              Load byte at byte ptr TOS-1 + TOS
   062c: SLDO 03          Short load global BASE3
   062d: SLDC 00          Short load constant 0
   062e: LDB              Load byte at byte ptr TOS-1 + TOS
   062f: ADI              Add integers (TOS + TOS-1)
   0630: SLDO 02          Short load global BASE2
   0631: LEQI             Integer TOS-1 <= TOS
   0632: LAND             Logical AND (TOS & TOS-1)
   0633: FJP  $0669       Jump if TOS false
   0635: SLDO 03          Short load global BASE3
   0636: SLDC 00          Short load constant 0
   0637: LDB              Load byte at byte ptr TOS-1 + TOS
   0638: SLDO 01          Short load global BASE1
   0639: SBI              Subtract integers (TOS-1 - TOS)
   063a: SLDC 01          Short load constant 1
   063b: ADI              Add integers (TOS + TOS-1)
   063c: SRO  0005        Store global word BASE5
   063e: SLDO 05          Short load global BASE5
   063f: SLDC 00          Short load constant 0
   0640: GRTI             Integer TOS-1 > TOS
   0641: FJP  $0651       Jump if TOS false
   0643: SLDO 03          Short load global BASE3
   0644: SLDO 01          Short load global BASE1
   0645: SLDO 03          Short load global BASE3
   0646: SLDO 01          Short load global BASE1
   0647: SLDO 04          Short load global BASE4
   0648: SLDC 00          Short load constant 0
   0649: LDB              Load byte at byte ptr TOS-1 + TOS
   064a: ADI              Add integers (TOS + TOS-1)
   064b: SLDO 05          Short load global BASE5
   064c: CSP  03          Call standard procedure MOVR
   064e: SLDC 00          Short load constant 0
   064f: SRO  0005        Store global word BASE5
-> 0651: SLDO 05          Short load global BASE5
   0652: SLDC 00          Short load constant 0
   0653: EQUI             Integer TOS-1 = TOS
   0654: FJP  $0669       Jump if TOS false
   0656: SLDO 04          Short load global BASE4
   0657: SLDC 01          Short load constant 1
   0658: SLDO 03          Short load global BASE3
   0659: SLDO 01          Short load global BASE1
   065a: SLDO 04          Short load global BASE4
   065b: SLDC 00          Short load constant 0
   065c: LDB              Load byte at byte ptr TOS-1 + TOS
   065d: CSP  02          Call standard procedure MOVL
   065f: SLDO 03          Short load global BASE3
   0660: SLDC 00          Short load constant 0
   0661: SLDO 03          Short load global BASE3
   0662: SLDC 00          Short load constant 0
   0663: LDB              Load byte at byte ptr TOS-1 + TOS
   0664: SLDO 04          Short load global BASE4
   0665: SLDC 00          Short load constant 0
   0666: LDB              Load byte at byte ptr TOS-1 + TOS
   0667: ADI              Add integers (TOS + TOS-1)
   0668: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0669: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCOPY(PARAM1; PARAM2; PARAM3; PARAM4) (* P=25 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
BEGIN
-> 0676: SLDO 03          Short load global BASE3
   0677: LSA  00          Load string address: ''
   0679: NOP              No operation
   067a: SAS  50          String assign (TOS to TOS-1, 80 chars)
   067c: SLDO 02          Short load global BASE2
   067d: SLDC 00          Short load constant 0
   067e: GRTI             Integer TOS-1 > TOS
   067f: SLDO 01          Short load global BASE1
   0680: SLDC 00          Short load constant 0
   0681: GRTI             Integer TOS-1 > TOS
   0682: LAND             Logical AND (TOS & TOS-1)
   0683: SLDO 02          Short load global BASE2
   0684: SLDO 01          Short load global BASE1
   0685: ADI              Add integers (TOS + TOS-1)
   0686: SLDC 01          Short load constant 1
   0687: SBI              Subtract integers (TOS-1 - TOS)
   0688: SLDO 04          Short load global BASE4
   0689: SLDC 00          Short load constant 0
   068a: LDB              Load byte at byte ptr TOS-1 + TOS
   068b: LEQI             Integer TOS-1 <= TOS
   068c: LAND             Logical AND (TOS & TOS-1)
   068d: FJP  $069a       Jump if TOS false
   068f: SLDO 04          Short load global BASE4
   0690: SLDO 02          Short load global BASE2
   0691: SLDO 03          Short load global BASE3
   0692: SLDC 01          Short load constant 1
   0693: SLDO 01          Short load global BASE1
   0694: CSP  02          Call standard procedure MOVL
   0696: SLDO 03          Short load global BASE3
   0697: SLDC 00          Short load constant 0
   0698: SLDO 01          Short load global BASE1
   0699: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 069a: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SDELETE(PARAM1; PARAM2; PARAM3) (* P=26 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 06a6: SLDO 02          Short load global BASE2
   06a7: SLDC 00          Short load constant 0
   06a8: GRTI             Integer TOS-1 > TOS
   06a9: SLDO 01          Short load global BASE1
   06aa: SLDC 00          Short load constant 0
   06ab: GRTI             Integer TOS-1 > TOS
   06ac: LAND             Logical AND (TOS & TOS-1)
   06ad: FJP  $06dd       Jump if TOS false
   06af: SLDO 03          Short load global BASE3
   06b0: SLDC 00          Short load constant 0
   06b1: LDB              Load byte at byte ptr TOS-1 + TOS
   06b2: SLDO 02          Short load global BASE2
   06b3: SBI              Subtract integers (TOS-1 - TOS)
   06b4: SLDO 01          Short load global BASE1
   06b5: SBI              Subtract integers (TOS-1 - TOS)
   06b6: SLDC 01          Short load constant 1
   06b7: ADI              Add integers (TOS + TOS-1)
   06b8: SRO  0004        Store global word BASE4
   06ba: SLDO 04          Short load global BASE4
   06bb: SLDC 00          Short load constant 0
   06bc: EQUI             Integer TOS-1 = TOS
   06bd: FJP  $06c7       Jump if TOS false
   06bf: SLDO 03          Short load global BASE3
   06c0: SLDC 00          Short load constant 0
   06c1: SLDO 02          Short load global BASE2
   06c2: SLDC 01          Short load constant 1
   06c3: SBI              Subtract integers (TOS-1 - TOS)
   06c4: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   06c5: UJP  $06dd       Unconditional jump
-> 06c7: SLDO 04          Short load global BASE4
   06c8: SLDC 00          Short load constant 0
   06c9: GRTI             Integer TOS-1 > TOS
   06ca: FJP  $06dd       Jump if TOS false
   06cc: SLDO 03          Short load global BASE3
   06cd: SLDO 02          Short load global BASE2
   06ce: SLDO 01          Short load global BASE1
   06cf: ADI              Add integers (TOS + TOS-1)
   06d0: SLDO 03          Short load global BASE3
   06d1: SLDO 02          Short load global BASE2
   06d2: SLDO 04          Short load global BASE4
   06d3: CSP  02          Call standard procedure MOVL
   06d5: SLDO 03          Short load global BASE3
   06d6: SLDC 00          Short load constant 0
   06d7: SLDO 03          Short load global BASE3
   06d8: SLDC 00          Short load constant 0
   06d9: LDB              Load byte at byte ptr TOS-1 + TOS
   06da: SLDO 01          Short load global BASE1
   06db: SBI              Subtract integers (TOS-1 - TOS)
   06dc: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 06dd: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.SPOS(PARAM1; PARAM2): RETVAL (* P=27 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
  BASE6
  BASE7
  BASE8
BEGIN
-> 0000: SLDC 00          Short load constant 0
   0001: SRO  0001        Store global word BASE1
   0003: SLDO 04          Short load global BASE4
   0004: SLDC 00          Short load constant 0
   0005: LDB              Load byte at byte ptr TOS-1 + TOS
   0006: SLDC 00          Short load constant 0
   0007: GRTI             Integer TOS-1 > TOS
   0008: FJP  $005b       Jump if TOS false
   000a: SLDO 04          Short load global BASE4
   000b: SLDC 01          Short load constant 1
   000c: LDB              Load byte at byte ptr TOS-1 + TOS
   000d: SRO  0007        Store global word BASE7
   000f: SLDC 01          Short load constant 1
   0010: SRO  0006        Store global word BASE6
   0012: SLDO 03          Short load global BASE3
   0013: SLDC 00          Short load constant 0
   0014: LDB              Load byte at byte ptr TOS-1 + TOS
   0015: SLDO 04          Short load global BASE4
   0016: SLDC 00          Short load constant 0
   0017: LDB              Load byte at byte ptr TOS-1 + TOS
   0018: SBI              Subtract integers (TOS-1 - TOS)
   0019: SLDC 01          Short load constant 1
   001a: ADI              Add integers (TOS + TOS-1)
   001b: SRO  0005        Store global word BASE5
   001d: LAO  0008        Load global BASE8
   001f: SLDC 00          Short load constant 0
   0020: SLDO 04          Short load global BASE4
   0021: SLDC 00          Short load constant 0
   0022: LDB              Load byte at byte ptr TOS-1 + TOS
   0023: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0024: SLDO 06          Short load global BASE6
   0025: SLDO 05          Short load global BASE5
   0026: LEQI             Integer TOS-1 <= TOS
   0027: FJP  $005b       Jump if TOS false
   0029: SLDO 06          Short load global BASE6
   002a: SLDO 05          Short load global BASE5
   002b: SLDO 06          Short load global BASE6
   002c: SBI              Subtract integers (TOS-1 - TOS)
   002d: SLDC 00          Short load constant 0
   002e: SLDO 07          Short load global BASE7
   002f: SLDO 03          Short load global BASE3
   0030: SLDO 06          Short load global BASE6
   0031: SLDC 00          Short load constant 0
   0032: CSP  0b          Call standard procedure SCAN
   0034: ADI              Add integers (TOS + TOS-1)
   0035: SRO  0006        Store global word BASE6
   0037: SLDO 06          Short load global BASE6
   0038: SLDO 05          Short load global BASE5
   0039: GRTI             Integer TOS-1 > TOS
   003a: FJP  $003e       Jump if TOS false
   003c: UJP  $005b       Unconditional jump
-> 003e: SLDO 03          Short load global BASE3
   003f: SLDO 06          Short load global BASE6
   0040: LAO  0008        Load global BASE8
   0042: SLDC 01          Short load constant 1
   0043: SLDO 04          Short load global BASE4
   0044: SLDC 00          Short load constant 0
   0045: LDB              Load byte at byte ptr TOS-1 + TOS
   0046: CSP  02          Call standard procedure MOVL
   0048: LAO  0008        Load global BASE8
   004a: SLDO 04          Short load global BASE4
   004b: EQLSTR           String TOS-1 = TOS
   004d: FJP  $0054       Jump if TOS false
   004f: SLDO 06          Short load global BASE6
   0050: SRO  0001        Store global word BASE1
   0052: UJP  $005b       Unconditional jump
-> 0054: SLDO 06          Short load global BASE6
   0055: SLDC 01          Short load constant 1
   0056: ADI              Add integers (TOS + TOS-1)
   0057: SRO  0006        Store global word BASE6
   0059: UJP  $0024       Unconditional jump
-> 005b: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FBLOCKIO(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5; PARAM6): RETVAL (* P=28 LL=0 *)
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
-> 006a: SLDC 00          Short load constant 0
   006b: SRO  0001        Store global word BASE1
   006d: LOD  01 0001     Load word at G1 (SYSCOM)
   0070: SLDC 00          Short load constant 0
   0071: STO              Store indirect (TOS into TOS-1)
   0072: SLDO 08          Short load global BASE8
   0073: SRO  0009        Store global word BASE9
   0075: SLDO 09          Short load global BASE9
   0076: SIND 05          Short index load *TOS+5
   0077: SLDO 05          Short load global BASE5
   0078: SLDC 00          Short load constant 0
   0079: GEQI             Integer TOS-1 >= TOS
   007a: LAND             Logical AND (TOS & TOS-1)
   007b: FJP  $0153       Jump if TOS false
   007d: SLDO 09          Short load global BASE9
   007e: SIND 06          Short index load *TOS+6
   007f: FJP  $0106       Jump if TOS false
   0081: SLDO 09          Short load global BASE9
   0082: INC  0010        Inc field ptr (TOS+16)
   0084: SRO  000a        Store global word BASE10
   0086: SLDO 04          Short load global BASE4
   0087: SLDC 00          Short load constant 0
   0088: LESI             Integer TOS-1 < TOS
   0089: FJP  $0090       Jump if TOS false
   008b: SLDO 09          Short load global BASE9
   008c: IND  000d        Static index and load word (TOS+13)
   008e: SRO  0004        Store global word BASE4
-> 0090: SLDO 0a          Short load global BASE10
   0091: SIND 00          Short index load *TOS+0
   0092: SLDO 04          Short load global BASE4
   0093: ADI              Add integers (TOS + TOS-1)
   0094: SRO  0004        Store global word BASE4
   0096: SLDO 04          Short load global BASE4
   0097: SLDO 05          Short load global BASE5
   0098: ADI              Add integers (TOS + TOS-1)
   0099: SLDO 0a          Short load global BASE10
   009a: SIND 01          Short index load *TOS+1
   009b: GRTI             Integer TOS-1 > TOS
   009c: FJP  $00a9       Jump if TOS false
   009e: SLDO 03          Short load global BASE3
   009f: LNOT             Logical NOT (~TOS)
   00a0: FJP  $00a9       Jump if TOS false
   00a2: SLDO 08          Short load global BASE8
   00a3: SLDC 00          Short load constant 0
   00a4: SLDC 00          Short load constant 0
   00a5: CBP  21          Call base procedure PASCALSY.33
   00a7: FJP  $00a9       Jump if TOS false
-> 00a9: SLDO 04          Short load global BASE4
   00aa: SLDO 05          Short load global BASE5
   00ab: ADI              Add integers (TOS + TOS-1)
   00ac: SLDO 0a          Short load global BASE10
   00ad: SIND 01          Short index load *TOS+1
   00ae: GRTI             Integer TOS-1 > TOS
   00af: FJP  $00b7       Jump if TOS false
   00b1: SLDO 0a          Short load global BASE10
   00b2: SIND 01          Short index load *TOS+1
   00b3: SLDO 04          Short load global BASE4
   00b4: SBI              Subtract integers (TOS-1 - TOS)
   00b5: SRO  0005        Store global word BASE5
-> 00b7: SLDO 09          Short load global BASE9
   00b8: INC  0002        Inc field ptr (TOS+2)
   00ba: SLDO 04          Short load global BASE4
   00bb: SLDO 0a          Short load global BASE10
   00bc: SIND 01          Short index load *TOS+1
   00bd: GEQI             Integer TOS-1 >= TOS
   00be: STO              Store indirect (TOS into TOS-1)
   00bf: SLDO 09          Short load global BASE9
   00c0: SIND 02          Short index load *TOS+2
   00c1: LNOT             Logical NOT (~TOS)
   00c2: FJP  $0104       Jump if TOS false
   00c4: SLDO 09          Short load global BASE9
   00c5: SIND 07          Short index load *TOS+7
   00c6: SLDO 07          Short load global BASE7
   00c7: SLDO 06          Short load global BASE6
   00c8: SLDO 05          Short load global BASE5
   00c9: SLDO 04          Short load global BASE4
   00ca: SLDO 03          Short load global BASE3
   00cb: CLP  24          Call local procedure PASCALSY.36
   00cd: CSP  22          Call standard procedure IORESULT
   00cf: SLDC 00          Short load constant 0
   00d0: EQUI             Integer TOS-1 = TOS
   00d1: FJP  $0104       Jump if TOS false
   00d3: SLDO 03          Short load global BASE3
   00d4: LNOT             Logical NOT (~TOS)
   00d5: FJP  $00dc       Jump if TOS false
   00d7: SLDO 09          Short load global BASE9
   00d8: INC  000f        Inc field ptr (TOS+15)
   00da: SLDC 01          Short load constant 1
   00db: STO              Store indirect (TOS into TOS-1)
-> 00dc: SLDO 05          Short load global BASE5
   00dd: SRO  0001        Store global word BASE1
   00df: SLDO 04          Short load global BASE4
   00e0: SLDO 05          Short load global BASE5
   00e1: ADI              Add integers (TOS + TOS-1)
   00e2: SRO  0004        Store global word BASE4
   00e4: SLDO 09          Short load global BASE9
   00e5: INC  0002        Inc field ptr (TOS+2)
   00e7: SLDO 04          Short load global BASE4
   00e8: SLDO 0a          Short load global BASE10
   00e9: SIND 01          Short index load *TOS+1
   00ea: EQUI             Integer TOS-1 = TOS
   00eb: STO              Store indirect (TOS into TOS-1)
   00ec: SLDO 09          Short load global BASE9
   00ed: INC  000d        Inc field ptr (TOS+13)
   00ef: SLDO 04          Short load global BASE4
   00f0: SLDO 0a          Short load global BASE10
   00f1: SIND 00          Short index load *TOS+0
   00f2: SBI              Subtract integers (TOS-1 - TOS)
   00f3: STO              Store indirect (TOS into TOS-1)
   00f4: SLDO 09          Short load global BASE9
   00f5: IND  000d        Static index and load word (TOS+13)
   00f7: SLDO 09          Short load global BASE9
   00f8: IND  000c        Static index and load word (TOS+12)
   00fa: GRTI             Integer TOS-1 > TOS
   00fb: FJP  $0104       Jump if TOS false
   00fd: SLDO 09          Short load global BASE9
   00fe: INC  000c        Inc field ptr (TOS+12)
   0100: SLDO 09          Short load global BASE9
   0101: IND  000d        Static index and load word (TOS+13)
   0103: STO              Store indirect (TOS into TOS-1)
-> 0104: UJP  $0151       Unconditional jump
-> 0106: SLDO 05          Short load global BASE5
   0107: SRO  0001        Store global word BASE1
   0109: SLDO 09          Short load global BASE9
   010a: SIND 07          Short index load *TOS+7
   010b: SLDO 07          Short load global BASE7
   010c: SLDO 06          Short load global BASE6
   010d: SLDO 05          Short load global BASE5
   010e: SLDO 04          Short load global BASE4
   010f: SLDO 03          Short load global BASE3
   0110: CLP  24          Call local procedure PASCALSY.36
   0112: CSP  22          Call standard procedure IORESULT
   0114: SLDC 00          Short load constant 0
   0115: EQUI             Integer TOS-1 = TOS
   0116: FJP  $014e       Jump if TOS false
   0118: SLDO 03          Short load global BASE3
   0119: FJP  $014c       Jump if TOS false
   011b: SLDO 05          Short load global BASE5
   011c: LDCI 0200        Load word 512
   011f: MPI              Multiply integers (TOS * TOS-1)
   0120: SRO  0004        Store global word BASE4
   0122: SLDO 04          Short load global BASE4
   0123: SLDO 04          Short load global BASE4
   0124: NGI              Negate integer
   0125: SLDC 01          Short load constant 1
   0126: SLDC 00          Short load constant 0
   0127: SLDO 07          Short load global BASE7
   0128: SLDO 06          Short load global BASE6
   0129: SLDO 04          Short load global BASE4
   012a: ADI              Add integers (TOS + TOS-1)
   012b: SLDC 01          Short load constant 1
   012c: SBI              Subtract integers (TOS-1 - TOS)
   012d: SLDC 00          Short load constant 0
   012e: CSP  0b          Call standard procedure SCAN
   0130: ADI              Add integers (TOS + TOS-1)
   0131: SRO  0004        Store global word BASE4
   0133: SLDO 04          Short load global BASE4
   0134: LDCI 0200        Load word 512
   0137: ADI              Add integers (TOS + TOS-1)
   0138: SLDC 01          Short load constant 1
   0139: SBI              Subtract integers (TOS-1 - TOS)
   013a: LDCI 0200        Load word 512
   013d: DVI              Divide integers (TOS-1 / TOS)
   013e: SRO  0004        Store global word BASE4
   0140: SLDO 04          Short load global BASE4
   0141: SRO  0001        Store global word BASE1
   0143: SLDO 09          Short load global BASE9
   0144: INC  0002        Inc field ptr (TOS+2)
   0146: SLDO 04          Short load global BASE4
   0147: SLDO 05          Short load global BASE5
   0148: LESI             Integer TOS-1 < TOS
   0149: STO              Store indirect (TOS into TOS-1)
   014a: UJP  $014c       Unconditional jump
-> 014c: UJP  $0151       Unconditional jump
-> 014e: SLDC 00          Short load constant 0
   014f: SRO  0001        Store global word BASE1
-> 0151: UJP  $0158       Unconditional jump
-> 0153: LOD  01 0001     Load word at G1 (SYSCOM)
   0156: SLDC 0d          Short load constant 13
   0157: STO              Store indirect (TOS into TOS-1)
-> 0158: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.FGOTOXY(PARAM1; PARAM2) (* P=29 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0168: LOD  01 0001     Load word at G1 (SYSCOM)
   016b: INC  0025        Inc field ptr (TOS+37)
   016d: SRO  0003        Store global word BASE3
   016f: SLDO 02          Short load global BASE2
   0170: SLDC 00          Short load constant 0
   0171: LESI             Integer TOS-1 < TOS
   0172: FJP  $0177       Jump if TOS false
   0174: SLDC 00          Short load constant 0
   0175: SRO  0002        Store global word BASE2
-> 0177: SLDO 02          Short load global BASE2
   0178: SLDO 03          Short load global BASE3
   0179: SIND 01          Short index load *TOS+1
   017a: GRTI             Integer TOS-1 > TOS
   017b: FJP  $0181       Jump if TOS false
   017d: SLDO 03          Short load global BASE3
   017e: SIND 01          Short index load *TOS+1
   017f: SRO  0002        Store global word BASE2
-> 0181: SLDO 01          Short load global BASE1
   0182: SLDC 00          Short load constant 0
   0183: LESI             Integer TOS-1 < TOS
   0184: FJP  $0189       Jump if TOS false
   0186: SLDC 00          Short load constant 0
   0187: SRO  0001        Store global word BASE1
-> 0189: SLDO 01          Short load global BASE1
   018a: SLDO 03          Short load global BASE3
   018b: SIND 00          Short index load *TOS+0
   018c: GRTI             Integer TOS-1 > TOS
   018d: FJP  $0193       Jump if TOS false
   018f: SLDO 03          Short load global BASE3
   0190: SIND 00          Short index load *TOS+0
   0191: SRO  0001        Store global word BASE1
-> 0193: LOD  01 0003     Load word at G3 (OUTPUT)
   0196: SLDC 1e          Short load constant 30
   0197: SLDC 00          Short load constant 0
   0198: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   019b: CSP  00          Call standard procedure IOC
   019d: LOD  01 0003     Load word at G3 (OUTPUT)
   01a0: SLDO 02          Short load global BASE2
   01a1: SLDC 20          Short load constant 32
   01a2: ADI              Add integers (TOS + TOS-1)
   01a3: SLDC 00          Short load constant 0
   01a4: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   01a7: CSP  00          Call standard procedure IOC
   01a9: LOD  01 0003     Load word at G3 (OUTPUT)
   01ac: SLDO 01          Short load global BASE1
   01ad: SLDC 20          Short load constant 32
   01ae: ADI              Add integers (TOS + TOS-1)
   01af: SLDC 00          Short load constant 0
   01b0: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   01b3: CSP  00          Call standard procedure IOC
-> 01b5: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC30 (* P=30 LL=0 *)
BEGIN
-> 06ea: SLDC 04          Short load constant 4
   06eb: LOD  01 0001     Load word at G1 (SYSCOM)
   06ee: INC  001f        Inc field ptr (TOS+31)
   06f0: SLDC 08          Short load constant 8
   06f1: SLDC 08          Short load constant 8
   06f2: LDP              Load packed field (TOS)
   06f3: CBP  22          Call base procedure PASCALSY.34
   06f5: LOD  01 0003     Load word at G3 (OUTPUT)
   06f8: SLDC 05          Short load constant 5
   06f9: SLDC 00          Short load constant 0
   06fa: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   06fd: CSP  00          Call standard procedure IOC
   06ff: LOD  01 0003     Load word at G3 (OUTPUT)
   0702: SLDC 0e          Short load constant 14
   0703: SLDC 00          Short load constant 0
   0704: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0707: CSP  00          Call standard procedure IOC
-> 0709: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC31 (* P=31 LL=0 *)
  BASE1
  BASE2
BEGIN
-> 01c2: CBP  1e          Call base procedure PASCALSY.30
   01c4: LOD  01 0001     Load word at G1 (SYSCOM)
   01c7: SRO  0001        Store global word BASE1
   01c9: SLDO 01          Short load global BASE1
   01ca: INC  001f        Inc field ptr (TOS+31)
   01cc: SRO  0002        Store global word BASE2
   01ce: SLDC 03          Short load constant 3
   01cf: CSP  26          Call standard procedure UNITCLEAR
   01d1: SLDO 02          Short load global BASE2
   01d2: INC  0001        Inc field ptr (TOS+1)
   01d4: SLDC 08          Short load constant 8
   01d5: SLDC 00          Short load constant 0
   01d6: LDP              Load packed field (TOS)
   01d7: SLDC 00          Short load constant 0
   01d8: NEQI             Integer TOS-1 <> TOS
   01d9: FJP  $01e6       Jump if TOS false
   01db: SLDC 03          Short load constant 3
   01dc: SLDO 02          Short load global BASE2
   01dd: INC  0001        Inc field ptr (TOS+1)
   01df: SLDC 08          Short load constant 8
   01e0: SLDC 00          Short load constant 0
   01e1: LDP              Load packed field (TOS)
   01e2: CBP  22          Call base procedure PASCALSY.34
   01e4: UJP  $01ef       Unconditional jump
-> 01e6: SLDC 06          Short load constant 6
   01e7: SLDO 02          Short load global BASE2
   01e8: INC  0004        Inc field ptr (TOS+4)
   01ea: SLDC 08          Short load constant 8
   01eb: SLDC 08          Short load constant 8
   01ec: LDP              Load packed field (TOS)
   01ed: CBP  22          Call base procedure PASCALSY.34
-> 01ef: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC32 (* P=32 LL=0 *)
BEGIN
-> 01fc: SLDC 00          Short load constant 0
   01fd: STR  01 0013     Store TOS to G19
   0200: SLDC 00          Short load constant 0
   0201: STR  01 00e2     Store TOS to G226
-> 0205: CBP  25          Call base procedure PASCALSY.37
   0207: CLP  27          Call local procedure PASCALSY.39
   0209: LOD  01 00e2     Load word at G226
   020d: FJP  $0214       Jump if TOS false
   020f: LDCN             Load constant NIL
   0210: LDCN             Load constant NIL
   0211: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
-> 0214: LOD  01 0013     Load word at G19
   0217: SLDC 00          Short load constant 0
   0218: EQUI             Integer TOS-1 = TOS
   0219: FJP  $0205       Jump if TOS false
-> 021b: RBP  00          Return from base procedure
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
-> 022a: SLDC 01          Short load constant 1
   022b: SRO  0001        Store global word BASE1
   022d: SLDC 00          Short load constant 0
   022e: SRO  0005        Store global word BASE5
   0230: SLDO 03          Short load global BASE3
   0231: SRO  0009        Store global word BASE9
   0233: SLDO 09          Short load global BASE9
   0234: INC  0010        Inc field ptr (TOS+16)
   0236: SRO  000a        Store global word BASE10
   0238: SLDO 0a          Short load global BASE10
   0239: INC  0003        Inc field ptr (TOS+3)
   023b: SLDC 00          Short load constant 0
   023c: LDB              Load byte at byte ptr TOS-1 + TOS
   023d: SLDC 00          Short load constant 0
   023e: GRTI             Integer TOS-1 > TOS
   023f: FJP  $0308       Jump if TOS false
   0241: SLDO 09          Short load global BASE9
   0242: SIND 07          Short index load *TOS+7
   0243: SLDO 09          Short load global BASE9
   0244: INC  0008        Inc field ptr (TOS+8)
   0246: SLDC 00          Short load constant 0
   0247: LAO  0008        Load global BASE8
   0249: SLDC 00          Short load constant 0
   024a: SLDC 00          Short load constant 0
   024b: CXP  06 06       Call external procedure SYSIO.6
   024e: NEQI             Integer TOS-1 <> TOS
   024f: FJP  $0258       Jump if TOS false
   0251: LOD  01 0001     Load word at G1 (SYSCOM)
   0254: SLDC 05          Short load constant 5
   0255: STO              Store indirect (TOS into TOS-1)
   0256: UJP  $0308       Unconditional jump
-> 0258: SLDC 00          Short load constant 0
   0259: SRO  0006        Store global word BASE6
   025b: SLDC 01          Short load constant 1
   025c: SRO  0004        Store global word BASE4
-> 025e: SLDO 04          Short load global BASE4
   025f: SLDO 08          Short load global BASE8
   0260: SLDC 00          Short load constant 0
   0261: IXA  000d        Index array (TOS-1 + TOS * 13)
   0263: IND  0008        Static index and load word (TOS+8)
   0265: LEQI             Integer TOS-1 <= TOS
   0266: SLDO 06          Short load global BASE6
   0267: LNOT             Logical NOT (~TOS)
   0268: LAND             Logical AND (TOS & TOS-1)
   0269: FJP  $0285       Jump if TOS false
   026b: SLDO 08          Short load global BASE8
   026c: SLDO 04          Short load global BASE4
   026d: IXA  000d        Index array (TOS-1 + TOS * 13)
   026f: SIND 00          Short index load *TOS+0
   0270: SLDO 0a          Short load global BASE10
   0271: SIND 00          Short index load *TOS+0
   0272: EQUI             Integer TOS-1 = TOS
   0273: SLDO 08          Short load global BASE8
   0274: SLDO 04          Short load global BASE4
   0275: IXA  000d        Index array (TOS-1 + TOS * 13)
   0277: SIND 01          Short index load *TOS+1
   0278: SLDO 0a          Short load global BASE10
   0279: SIND 01          Short index load *TOS+1
   027a: EQUI             Integer TOS-1 = TOS
   027b: LAND             Logical AND (TOS & TOS-1)
   027c: SRO  0006        Store global word BASE6
   027e: SLDO 04          Short load global BASE4
   027f: SLDC 01          Short load constant 1
   0280: ADI              Add integers (TOS + TOS-1)
   0281: SRO  0004        Store global word BASE4
   0283: UJP  $025e       Unconditional jump
-> 0285: SLDO 06          Short load global BASE6
   0286: LNOT             Logical NOT (~TOS)
   0287: FJP  $0290       Jump if TOS false
   0289: LOD  01 0001     Load word at G1 (SYSCOM)
   028c: SLDC 06          Short load constant 6
   028d: STO              Store indirect (TOS into TOS-1)
   028e: UJP  $0308       Unconditional jump
-> 0290: SLDO 04          Short load global BASE4
   0291: SLDO 08          Short load global BASE8
   0292: SLDC 00          Short load constant 0
   0293: IXA  000d        Index array (TOS-1 + TOS * 13)
   0295: IND  0008        Static index and load word (TOS+8)
   0297: GRTI             Integer TOS-1 > TOS
   0298: FJP  $02a3       Jump if TOS false
   029a: SLDO 08          Short load global BASE8
   029b: SLDC 00          Short load constant 0
   029c: IXA  000d        Index array (TOS-1 + TOS * 13)
   029e: SIND 07          Short index load *TOS+7
   029f: SRO  0007        Store global word BASE7
   02a1: UJP  $02aa       Unconditional jump
-> 02a3: SLDO 08          Short load global BASE8
   02a4: SLDO 04          Short load global BASE4
   02a5: IXA  000d        Index array (TOS-1 + TOS * 13)
   02a7: SIND 00          Short index load *TOS+0
   02a8: SRO  0007        Store global word BASE7
-> 02aa: SLDO 0a          Short load global BASE10
   02ab: SIND 01          Short index load *TOS+1
   02ac: SLDO 07          Short load global BASE7
   02ad: LESI             Integer TOS-1 < TOS
   02ae: SLDO 0a          Short load global BASE10
   02af: IND  000b        Static index and load word (TOS+11)
   02b1: LDCI 0200        Load word 512
   02b4: LESI             Integer TOS-1 < TOS
   02b5: LOR              Logical OR (TOS | TOS-1)
   02b6: FJP  $0305       Jump if TOS false
   02b8: SLDO 08          Short load global BASE8
   02b9: SLDO 04          Short load global BASE4
   02ba: SLDC 01          Short load constant 1
   02bb: SBI              Subtract integers (TOS-1 - TOS)
   02bc: IXA  000d        Index array (TOS-1 + TOS * 13)
   02be: SRO  000b        Store global word BASE11
   02c0: SLDO 0b          Short load global BASE11
   02c1: INC  0001        Inc field ptr (TOS+1)
   02c3: SLDO 07          Short load global BASE7
   02c4: STO              Store indirect (TOS into TOS-1)
   02c5: SLDO 0b          Short load global BASE11
   02c6: INC  000b        Inc field ptr (TOS+11)
   02c8: LDCI 0200        Load word 512
   02cb: STO              Store indirect (TOS into TOS-1)
   02cc: SLDO 09          Short load global BASE9
   02cd: SIND 07          Short index load *TOS+7
   02ce: SLDO 08          Short load global BASE8
   02cf: CXP  06 0a       Call external procedure SYSIO.10
   02d2: CSP  22          Call standard procedure IORESULT
   02d4: SLDC 00          Short load constant 0
   02d5: NEQI             Integer TOS-1 <> TOS
   02d6: FJP  $02da       Jump if TOS false
   02d8: UJP  $0308       Unconditional jump
-> 02da: SLDO 09          Short load global BASE9
   02db: INC  0002        Inc field ptr (TOS+2)
   02dd: SLDC 00          Short load constant 0
   02de: STO              Store indirect (TOS into TOS-1)
   02df: SLDO 09          Short load global BASE9
   02e0: INC  0001        Inc field ptr (TOS+1)
   02e2: SLDC 00          Short load constant 0
   02e3: STO              Store indirect (TOS into TOS-1)
   02e4: SLDO 09          Short load global BASE9
   02e5: SIND 03          Short index load *TOS+3
   02e6: SLDC 00          Short load constant 0
   02e7: NEQI             Integer TOS-1 <> TOS
   02e8: FJP  $02ef       Jump if TOS false
   02ea: SLDO 09          Short load global BASE9
   02eb: INC  0003        Inc field ptr (TOS+3)
   02ed: SLDC 01          Short load constant 1
   02ee: STO              Store indirect (TOS into TOS-1)
-> 02ef: SLDO 0a          Short load global BASE10
   02f0: INC  0001        Inc field ptr (TOS+1)
   02f2: SLDO 07          Short load global BASE7
   02f3: STO              Store indirect (TOS into TOS-1)
   02f4: SLDO 0a          Short load global BASE10
   02f5: INC  000b        Inc field ptr (TOS+11)
   02f7: LDCI 0200        Load word 512
   02fa: STO              Store indirect (TOS into TOS-1)
   02fb: SLDO 0a          Short load global BASE10
   02fc: INC  000c        Inc field ptr (TOS+12)
   02fe: SLDC 07          Short load constant 7
   02ff: SLDC 09          Short load constant 9
   0300: SLDC 64          Short load constant 100
   0301: STP              Store packed field (TOS into TOS-1)
   0302: SLDC 00          Short load constant 0
   0303: SRO  0001        Store global word BASE1
-> 0305: SLDC 01          Short load constant 1
   0306: SRO  0005        Store global word BASE5
-> 0308: SLDO 05          Short load global BASE5
   0309: LNOT             Logical NOT (~TOS)
   030a: FJP  $0316       Jump if TOS false
   030c: SLDO 03          Short load global BASE3
   030d: INC  0002        Inc field ptr (TOS+2)
   030f: SLDC 01          Short load constant 1
   0310: STO              Store indirect (TOS into TOS-1)
   0311: SLDO 03          Short load global BASE3
   0312: INC  0001        Inc field ptr (TOS+1)
   0314: SLDC 01          Short load constant 1
   0315: STO              Store indirect (TOS into TOS-1)
-> 0316: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC34(PARAM1; PARAM2) (* P=34 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0328: LOD  01 0001     Load word at G1 (SYSCOM)
   032b: SRO  0003        Store global word BASE3
   032d: SLDO 01          Short load global BASE1
   032e: SLDC 00          Short load constant 0
   032f: NEQI             Integer TOS-1 <> TOS
   0330: FJP  $0366       Jump if TOS false
   0332: SLDO 03          Short load global BASE3
   0333: INC  0024        Inc field ptr (TOS+36)
   0335: SLDO 02          Short load global BASE2
   0336: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0339: LDP              Load packed field (TOS)
   033a: FJP  $034b       Jump if TOS false
   033c: LOD  01 0003     Load word at G3 (OUTPUT)
   033f: SLDO 03          Short load global BASE3
   0340: INC  001f        Inc field ptr (TOS+31)
   0342: SLDC 08          Short load constant 8
   0343: SLDC 00          Short load constant 0
   0344: LDP              Load packed field (TOS)
   0345: SLDC 00          Short load constant 0
   0346: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0349: CSP  00          Call standard procedure IOC
-> 034b: LOD  01 0003     Load word at G3 (OUTPUT)
   034e: SLDO 01          Short load global BASE1
   034f: SLDC 00          Short load constant 0
   0350: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0353: CSP  00          Call standard procedure IOC
   0355: SLDC 0b          Short load constant 11
   0356: SLDC 00          Short load constant 0
   0357: GRTI             Integer TOS-1 > TOS
   0358: FJP  $0366       Jump if TOS false
   035a: LOD  01 0003     Load word at G3 (OUTPUT)
   035d: LDA  01 0019     Load addr G25
   0360: SLDC 00          Short load constant 0
   0361: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0364: CSP  00          Call standard procedure IOC
-> 0366: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC35(PARAM1; PARAM2; PARAM3): RETVAL (* P=35 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM3
  BASE4=PARAM2
  BASE5=PARAM1
  BASE6
  BASE7
BEGIN
-> 0372: SLDC 00          Short load constant 0
   0373: SRO  0001        Store global word BASE1
   0375: LOD  01 0001     Load word at G1 (SYSCOM)
   0378: SRO  0006        Store global word BASE6
   037a: SLDO 06          Short load global BASE6
   037b: INC  001f        Inc field ptr (TOS+31)
   037d: SRO  0007        Store global word BASE7
   037f: SLDO 05          Short load global BASE5
   0380: SLDO 06          Short load global BASE6
   0381: INC  002c        Inc field ptr (TOS+44)
   0383: SLDC 08          Short load constant 8
   0384: SLDC 00          Short load constant 0
   0385: LDP              Load packed field (TOS)
   0386: EQUI             Integer TOS-1 = TOS
   0387: FJP  $03ba       Jump if TOS false
   0389: SLDC 01          Short load constant 1
   038a: SRO  0001        Store global word BASE1
-> 038c: SLDO 04          Short load global BASE4
   038d: SIND 00          Short index load *TOS+0
   038e: SLDC 01          Short load constant 1
   038f: GRTI             Integer TOS-1 > TOS
   0390: FJP  $03af       Jump if TOS false
   0392: SLDO 04          Short load global BASE4
   0393: SLDO 04          Short load global BASE4
   0394: SIND 00          Short index load *TOS+0
   0395: SLDC 01          Short load constant 1
   0396: SBI              Subtract integers (TOS-1 - TOS)
   0397: STO              Store indirect (TOS into TOS-1)
   0398: SLDO 03          Short load global BASE3
   0399: SLDO 04          Short load global BASE4
   039a: SIND 00          Short index load *TOS+0
   039b: LDB              Load byte at byte ptr TOS-1 + TOS
   039c: SLDC 20          Short load constant 32
   039d: GEQI             Integer TOS-1 >= TOS
   039e: FJP  $03ad       Jump if TOS false
   03a0: LOD  01 0003     Load word at G3 (OUTPUT)
   03a3: LDA  01 0209     Load addr G521
   03a7: SLDC 00          Short load constant 0
   03a8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   03ab: CSP  00          Call standard procedure IOC
-> 03ad: UJP  $038c       Unconditional jump
-> 03af: SLDC 02          Short load constant 2
   03b0: SLDO 07          Short load global BASE7
   03b1: INC  0001        Inc field ptr (TOS+1)
   03b3: SLDC 08          Short load constant 8
   03b4: SLDC 08          Short load constant 8
   03b5: LDP              Load packed field (TOS)
   03b6: CBP  22          Call base procedure PASCALSY.34
   03b8: UJP  $03e8       Unconditional jump
-> 03ba: SLDO 05          Short load global BASE5
   03bb: SLDO 06          Short load global BASE6
   03bc: INC  002b        Inc field ptr (TOS+43)
   03be: SLDC 08          Short load constant 8
   03bf: SLDC 00          Short load constant 0
   03c0: LDP              Load packed field (TOS)
   03c1: EQUI             Integer TOS-1 = TOS
   03c2: FJP  $03e8       Jump if TOS false
   03c4: SLDC 01          Short load constant 1
   03c5: SRO  0001        Store global word BASE1
   03c7: SLDO 04          Short load global BASE4
   03c8: SIND 00          Short index load *TOS+0
   03c9: SLDC 01          Short load constant 1
   03ca: GRTI             Integer TOS-1 > TOS
   03cb: FJP  $03e8       Jump if TOS false
   03cd: SLDO 04          Short load global BASE4
   03ce: SLDO 04          Short load global BASE4
   03cf: SIND 00          Short index load *TOS+0
   03d0: SLDC 01          Short load constant 1
   03d1: SBI              Subtract integers (TOS-1 - TOS)
   03d2: STO              Store indirect (TOS into TOS-1)
   03d3: SLDO 03          Short load global BASE3
   03d4: SLDO 04          Short load global BASE4
   03d5: SIND 00          Short index load *TOS+0
   03d6: LDB              Load byte at byte ptr TOS-1 + TOS
   03d7: SLDC 20          Short load constant 32
   03d8: GEQI             Integer TOS-1 >= TOS
   03d9: FJP  $03e8       Jump if TOS false
   03db: LOD  01 0003     Load word at G3 (OUTPUT)
   03de: LDA  01 020d     Load addr G525
   03e2: SLDC 00          Short load constant 0
   03e3: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   03e6: CSP  00          Call standard procedure IOC
-> 03e8: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC36(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5; PARAM6) (* P=36 LL=1 *)
  MP1=PARAM6
  MP2=PARAM5
  MP3=PARAM4
  MP4=PARAM3
  MP5=PARAM2
  MP6=PARAM1
  MP7
  MP8
BEGIN
-> 03f6: SLDL 03          Short load local MP3
   03f7: SLDC 3f          Short load constant 63
   03f8: GRTI             Integer TOS-1 > TOS
   03f9: FJP  $0400       Jump if TOS false
   03fb: SLDC 3f          Short load constant 63
   03fc: STL  0008        Store TOS into MP8
   03fe: UJP  $0403       Unconditional jump
-> 0400: SLDL 03          Short load local MP3
   0401: STL  0008        Store TOS into MP8
-> 0403: SLDL 08          Short load local MP8
   0404: LDCI 0200        Load word 512
   0407: MPI              Multiply integers (TOS * TOS-1)
   0408: STL  0007        Store TOS into MP7
-> 040a: SLDL 03          Short load local MP3
   040b: SLDC 00          Short load constant 0
   040c: NEQI             Integer TOS-1 <> TOS
   040d: FJP  $044e       Jump if TOS false
   040f: SLDL 01          Short load local MP1
   0410: FJP  $041c       Jump if TOS false
   0412: SLDL 06          Short load local MP6
   0413: SLDL 05          Short load local MP5
   0414: SLDL 04          Short load local MP4
   0415: SLDL 07          Short load local MP7
   0416: SLDL 02          Short load local MP2
   0417: SLDC 00          Short load constant 0
   0418: CSP  05          Call standard procedure UNITREAD
   041a: UJP  $0424       Unconditional jump
-> 041c: SLDL 06          Short load local MP6
   041d: SLDL 05          Short load local MP5
   041e: SLDL 04          Short load local MP4
   041f: SLDL 07          Short load local MP7
   0420: SLDL 02          Short load local MP2
   0421: SLDC 00          Short load constant 0
   0422: CSP  06          Call standard procedure UNITWRITE
-> 0424: CSP  22          Call standard procedure IORESULT
   0426: SLDC 00          Short load constant 0
   0427: NEQI             Integer TOS-1 <> TOS
   0428: FJP  $042e       Jump if TOS false
   042a: SLDC 00          Short load constant 0
   042b: SLDC 24          Short load constant 36
   042c: CSP  04          Call standard procedure EXIT
-> 042e: SLDL 03          Short load local MP3
   042f: SLDL 08          Short load local MP8
   0430: SBI              Subtract integers (TOS-1 - TOS)
   0431: STL  0003        Store TOS into MP3
   0433: SLDL 04          Short load local MP4
   0434: SLDL 07          Short load local MP7
   0435: ADI              Add integers (TOS + TOS-1)
   0436: STL  0004        Store TOS into MP4
   0438: SLDL 02          Short load local MP2
   0439: SLDL 08          Short load local MP8
   043a: ADI              Add integers (TOS + TOS-1)
   043b: STL  0002        Store TOS into MP2
   043d: SLDL 03          Short load local MP3
   043e: SLDL 08          Short load local MP8
   043f: LESI             Integer TOS-1 < TOS
   0440: FJP  $044c       Jump if TOS false
   0442: SLDL 03          Short load local MP3
   0443: STL  0008        Store TOS into MP8
   0445: SLDL 08          Short load local MP8
   0446: LDCI 0200        Load word 512
   0449: MPI              Multiply integers (TOS * TOS-1)
   044a: STL  0007        Store TOS into MP7
-> 044c: UJP  $040a       Unconditional jump
-> 044e: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC37 (* P=37 LL=0 *)
BEGIN
-> 045c: LDA  01 0005     Load addr G5
   045f: CSP  21          Call standard procedure RELEASE
-> 0461: LDA  01 001f     Load addr G31
   0464: LOD  01 0001     Load word at G1 (SYSCOM)
   0467: SIND 02          Short index load *TOS+2
   0468: IXA  0006        Index array (TOS-1 + TOS * 6)
   046a: LDA  01 000e     Load addr G14
   046d: NEQSTR           String TOS-1 <> TOS
   046f: FJP  $0481       Jump if TOS false
   0471: SLDC 0c          Short load constant 12
   0472: CBP  02          Call base procedure PASCALSY.EXECERROR
   0474: LOD  01 0001     Load word at G1 (SYSCOM)
   0477: SIND 02          Short index load *TOS+2
   0478: SLDC 00          Short load constant 0
   0479: SLDC 00          Short load constant 0
   047a: CXP  06 09       Call external procedure SYSIO.9
   047d: FJP  $047f       Jump if TOS false
-> 047f: UJP  $0461       Unconditional jump
-> 0481: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC38 (* P=38 LL=1 *)
BEGIN
-> 0490: UJP  $0522       Unconditional jump
-> 0492: LOD  02 00e2     Load word at G226
   0496: LNOT             Logical NOT (~TOS)
   0497: FJP  $04cd       Jump if TOS false
   0499: CBP  25          Call base procedure PASCALSY.37
   049b: LOD  02 0013     Load word at G19
   049e: SLDC 00          Short load constant 0
   049f: SLDC 00          Short load constant 0
   04a0: CXP  05 01       Call external procedure GETCMD.1
   04a3: STR  02 0013     Store TOS to G19
   04a6: LDA  02 00ad     Load addr G173
   04aa: NOP              No operation
   04ab: LSA  00          Load string address: ''
   04ad: SAS  17          String assign (TOS to TOS-1, 23 chars)
   04af: LOD  02 0013     Load word at G19
   04b2: SLDC 00          Short load constant 0
   04b3: NEQI             Integer TOS-1 <> TOS
   04b4: FJP  $04cd       Jump if TOS false
   04b6: LOD  02 00e4     Load word at G228
   04ba: LNOT             Logical NOT (~TOS)
   04bb: FJP  $04c4       Jump if TOS false
   04bd: LDCN             Load constant NIL
   04be: LDCN             Load constant NIL
   04bf: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   04c2: UJP  $04cd       Unconditional jump
-> 04c4: SLDC 01          Short load constant 1
   04c5: STR  02 00e2     Store TOS to G226
   04c9: SLDC 00          Short load constant 0
   04ca: SLDC 26          Short load constant 38
   04cb: CSP  04          Call standard procedure EXIT
-> 04cd: LOD  02 0013     Load word at G19
   04d0: SLDC 00          Short load constant 0
   04d1: NEQI             Integer TOS-1 <> TOS
   04d2: FJP  $04e7       Jump if TOS false
   04d4: SLDC 00          Short load constant 0
   04d5: STR  02 00e2     Store TOS to G226
   04d9: SLDC 03          Short load constant 3
   04da: CSP  26          Call standard procedure UNITCLEAR
   04dc: LOD  02 0001     Load word at G1 (SYSCOM)
   04df: SIND 02          Short index load *TOS+2
   04e0: SLDC 00          Short load constant 0
   04e1: SLDC 00          Short load constant 0
   04e2: CXP  06 09       Call external procedure SYSIO.9
   04e5: FJP  $04e7       Jump if TOS false
-> 04e7: LOD  02 0013     Load word at G19
   04ea: SLDC 01          Short load constant 1
   04eb: EQUI             Integer TOS-1 = TOS
   04ec: LOD  02 0013     Load word at G19
   04ef: SLDC 02          Short load constant 2
   04f0: EQUI             Integer TOS-1 = TOS
   04f1: LOR              Logical OR (TOS | TOS-1)
   04f2: FJP  $050a       Jump if TOS false
   04f4: LDA  02 0002     Load addr G2 (INPUT)
   04f7: SLDC 00          Short load constant 0
   04f8: IXA  0001        Index array (TOS-1 + TOS * 1)
   04fa: SIND 00          Short index load *TOS+0
   04fb: SLDC 00          Short load constant 0
   04fc: CXP  06 05       Call external procedure SYSIO.5
   04ff: LDA  02 0002     Load addr G2 (INPUT)
   0502: SLDC 01          Short load constant 1
   0503: IXA  0001        Index array (TOS-1 + TOS * 1)
   0505: SIND 00          Short index load *TOS+0
   0506: SLDC 01          Short load constant 1
   0507: CXP  06 05       Call external procedure SYSIO.5
-> 050a: SLDC 01          Short load constant 1
   050b: CSP  23          Call standard procedure UNITBUSY
   050d: SLDC 02          Short load constant 2
   050e: CSP  23          Call standard procedure UNITBUSY
   0510: LOR              Logical OR (TOS | TOS-1)
   0511: FJP  $0516       Jump if TOS false
   0513: SLDC 01          Short load constant 1
   0514: CSP  26          Call standard procedure UNITCLEAR
-> 0516: LOD  02 0013     Load word at G19
   0519: SLDC 00          Short load constant 0
   051a: EQUI             Integer TOS-1 = TOS
   051b: FJP  $0492       Jump if TOS false
-> 051d: SLDC 06          Short load constant 6
   051e: CSP  16          Call standard procedure UNLOADSEGMENT
   0520: UJP  $0527       Unconditional jump
-> 0522: SLDC 06          Short load constant 6
   0523: CSP  15          Call standard procedure LOADSEGMENT
   0525: UJP  $0492       Unconditional jump
-> 0527: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC39 (* P=39 LL=1 *)
BEGIN
-> 053a: UJP  $0563       Unconditional jump
-> 053c: CBP  25          Call base procedure PASCALSY.37
   053e: CGP  26          Call global procedure PASCALSY.38
   0540: LOD  02 00e3     Load word at G227
   0544: LNOT             Logical NOT (~TOS)
   0545: LOD  02 00e2     Load word at G226
   0549: LAND             Logical AND (TOS & TOS-1)
   054a: FJP  $0553       Jump if TOS false
   054c: LDCN             Load constant NIL
   054d: LDCN             Load constant NIL
   054e: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   0551: UJP  $0557       Unconditional jump
-> 0553: SLDC 00          Short load constant 0
   0554: SLDC 27          Short load constant 39
   0555: CSP  04          Call standard procedure EXIT
-> 0557: LOD  02 0013     Load word at G19
   055a: SLDC 00          Short load constant 0
   055b: EQUI             Integer TOS-1 = TOS
   055c: FJP  $053c       Jump if TOS false
-> 055e: SLDC 02          Short load constant 2
   055f: CSP  16          Call standard procedure UNLOADSEGMENT
   0561: UJP  $0568       Unconditional jump
-> 0563: SLDC 02          Short load constant 2
   0564: CSP  15          Call standard procedure LOADSEGMENT
   0566: UJP  $053c       Unconditional jump
-> 0568: RNP  00          Return from nonbase procedure
END

## Segment USERPROG (1)

### PROCEDURE USERPROG.USERPROG(PARAM1; PARAM2) (* P=1 LL=0 *)
BEGIN
-> 0000: SLDC 09          Short load constant 9
   0001: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 0004: RBP  00          Return from base procedure
END

## Segment FIOPRIMS (2)

### PROCEDURE FIOPRIMS.FIOPRIMS (* P=1 LL=1 *)
BEGIN
-> 0310: RNP  00          Return from nonbase procedure
END

### FUNCTION FIOPRIMS.FUNC2(PARAM1): RETVAL (* P=2 LL=1 *)
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
-> 0000: SLDC 01          Short load constant 1
   0001: STL  0001        Store TOS into MP1
   0003: SLDL 03          Short load local MP3
   0004: STL  0009        Store TOS into MP9
   0006: SLDL 09          Short load local MP9
   0007: INC  0010        Inc field ptr (TOS+16)
   0009: STL  000a        Store TOS into MP10
   000b: SLDL 09          Short load local MP9
   000c: SIND 04          Short index load *TOS+4
   000d: STL  0007        Store TOS into MP7
   000f: SLDC 00          Short load constant 0
   0010: STL  0006        Store TOS into MP6
-> 0012: SLDL 09          Short load local MP9
   0013: IND  000d        Static index and load word (TOS+13)
   0015: SLDL 09          Short load local MP9
   0016: IND  000c        Static index and load word (TOS+12)
   0018: GEQI             Integer TOS-1 >= TOS
   0019: FJP  $0035       Jump if TOS false
   001b: SLDL 09          Short load local MP9
   001c: IND  001f        Static index and load word (TOS+31)
   001e: SLDL 07          Short load local MP7
   001f: ADI              Add integers (TOS + TOS-1)
   0020: SLDL 09          Short load local MP9
   0021: IND  001e        Static index and load word (TOS+30)
   0023: GRTI             Integer TOS-1 > TOS
   0024: FJP  $002a       Jump if TOS false
   0026: UJP  $00cf       Unconditional jump
   0028: UJP  $0033       Unconditional jump
-> 002a: SLDL 0a          Short load local MP10
   002b: IND  000b        Static index and load word (TOS+11)
   002d: SLDL 09          Short load local MP9
   002e: IND  001f        Static index and load word (TOS+31)
   0030: SBI              Subtract integers (TOS-1 - TOS)
   0031: STL  0005        Store TOS into MP5
-> 0033: UJP  $003e       Unconditional jump
-> 0035: LDCI 0200        Load word 512
   0038: SLDL 09          Short load local MP9
   0039: IND  001f        Static index and load word (TOS+31)
   003b: SBI              Subtract integers (TOS-1 - TOS)
   003c: STL  0005        Store TOS into MP5
-> 003e: SLDL 07          Short load local MP7
   003f: STL  0004        Store TOS into MP4
   0041: SLDL 04          Short load local MP4
   0042: SLDL 05          Short load local MP5
   0043: GRTI             Integer TOS-1 > TOS
   0044: FJP  $0049       Jump if TOS false
   0046: SLDL 05          Short load local MP5
   0047: STL  0004        Store TOS into MP4
-> 0049: SLDL 04          Short load local MP4
   004a: SLDC 00          Short load constant 0
   004b: GRTI             Integer TOS-1 > TOS
   004c: FJP  $006d       Jump if TOS false
   004e: SLDL 09          Short load local MP9
   004f: INC  0021        Inc field ptr (TOS+33)
   0051: SLDL 09          Short load local MP9
   0052: IND  001f        Static index and load word (TOS+31)
   0054: SLDL 09          Short load local MP9
   0055: SIND 00          Short index load *TOS+0
   0056: SLDL 06          Short load local MP6
   0057: SLDL 04          Short load local MP4
   0058: CSP  02          Call standard procedure MOVL
   005a: SLDL 09          Short load local MP9
   005b: INC  001f        Inc field ptr (TOS+31)
   005d: SLDL 09          Short load local MP9
   005e: IND  001f        Static index and load word (TOS+31)
   0060: SLDL 04          Short load local MP4
   0061: ADI              Add integers (TOS + TOS-1)
   0062: STO              Store indirect (TOS into TOS-1)
   0063: SLDL 06          Short load local MP6
   0064: SLDL 04          Short load local MP4
   0065: ADI              Add integers (TOS + TOS-1)
   0066: STL  0006        Store TOS into MP6
   0068: SLDL 07          Short load local MP7
   0069: SLDL 04          Short load local MP4
   006a: SBI              Subtract integers (TOS-1 - TOS)
   006b: STL  0007        Store TOS into MP7
-> 006d: SLDL 07          Short load local MP7
   006e: SLDC 00          Short load constant 0
   006f: EQUI             Integer TOS-1 = TOS
   0070: STL  0008        Store TOS into MP8
   0072: SLDL 08          Short load local MP8
   0073: LNOT             Logical NOT (~TOS)
   0074: FJP  $00c9       Jump if TOS false
   0076: SLDL 09          Short load local MP9
   0077: IND  0020        Static index and load word (TOS+32)
   0079: FJP  $0099       Jump if TOS false
   007b: SLDL 09          Short load local MP9
   007c: INC  0020        Inc field ptr (TOS+32)
   007e: SLDC 00          Short load constant 0
   007f: STO              Store indirect (TOS into TOS-1)
   0080: SLDL 09          Short load local MP9
   0081: INC  000f        Inc field ptr (TOS+15)
   0083: SLDC 01          Short load constant 1
   0084: STO              Store indirect (TOS into TOS-1)
   0085: SLDL 09          Short load local MP9
   0086: SIND 07          Short index load *TOS+7
   0087: SLDL 09          Short load local MP9
   0088: INC  0021        Inc field ptr (TOS+33)
   008a: SLDC 00          Short load constant 0
   008b: LDCI 0200        Load word 512
   008e: SLDL 0a          Short load local MP10
   008f: SIND 00          Short index load *TOS+0
   0090: SLDL 09          Short load local MP9
   0091: IND  000d        Static index and load word (TOS+13)
   0093: ADI              Add integers (TOS + TOS-1)
   0094: SLDC 01          Short load constant 1
   0095: SBI              Subtract integers (TOS-1 - TOS)
   0096: SLDC 00          Short load constant 0
   0097: CSP  06          Call standard procedure UNITWRITE
-> 0099: CSP  22          Call standard procedure IORESULT
   009b: SLDC 00          Short load constant 0
   009c: NEQI             Integer TOS-1 <> TOS
   009d: FJP  $00a1       Jump if TOS false
   009f: UJP  $00cf       Unconditional jump
-> 00a1: SLDL 09          Short load local MP9
   00a2: SIND 07          Short index load *TOS+7
   00a3: SLDL 09          Short load local MP9
   00a4: INC  0021        Inc field ptr (TOS+33)
   00a6: SLDC 00          Short load constant 0
   00a7: LDCI 0200        Load word 512
   00aa: SLDL 0a          Short load local MP10
   00ab: SIND 00          Short index load *TOS+0
   00ac: SLDL 09          Short load local MP9
   00ad: IND  000d        Static index and load word (TOS+13)
   00af: ADI              Add integers (TOS + TOS-1)
   00b0: SLDC 00          Short load constant 0
   00b1: CSP  05          Call standard procedure UNITREAD
   00b3: CSP  22          Call standard procedure IORESULT
   00b5: SLDC 00          Short load constant 0
   00b6: NEQI             Integer TOS-1 <> TOS
   00b7: FJP  $00bb       Jump if TOS false
   00b9: UJP  $00cf       Unconditional jump
-> 00bb: SLDL 09          Short load local MP9
   00bc: INC  000d        Inc field ptr (TOS+13)
   00be: SLDL 09          Short load local MP9
   00bf: IND  000d        Static index and load word (TOS+13)
   00c1: SLDC 01          Short load constant 1
   00c2: ADI              Add integers (TOS + TOS-1)
   00c3: STO              Store indirect (TOS into TOS-1)
   00c4: SLDL 09          Short load local MP9
   00c5: INC  001f        Inc field ptr (TOS+31)
   00c7: SLDC 00          Short load constant 0
   00c8: STO              Store indirect (TOS into TOS-1)
-> 00c9: SLDL 08          Short load local MP8
   00ca: FJP  $0012       Jump if TOS false
   00cc: SLDC 00          Short load constant 0
   00cd: STL  0001        Store TOS into MP1
-> 00cf: RNP  01          Return from nonbase procedure
END

### FUNCTION FIOPRIMS.FUNC3(PARAM1): RETVAL (* P=3 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM1
  MP4
  MP5
BEGIN
-> 00e0: SLDC 00          Short load constant 0
   00e1: STL  0001        Store TOS into MP1
   00e3: SLDL 03          Short load local MP3
   00e4: STL  0005        Store TOS into MP5
   00e6: SLDL 05          Short load local MP5
   00e7: SIND 00          Short index load *TOS+0
   00e8: SLDC 00          Short load constant 0
   00e9: LDB              Load byte at byte ptr TOS-1 + TOS
   00ea: SLDC 10          Short load constant 16
   00eb: EQUI             Integer TOS-1 = TOS
   00ec: FJP  $0116       Jump if TOS false
   00ee: SLDL 03          Short load local MP3
   00ef: CXP  00 07       Call external procedure PASCALSY.FGET
   00f2: SLDL 05          Short load local MP5
   00f3: SIND 00          Short index load *TOS+0
   00f4: SLDC 00          Short load constant 0
   00f5: LDB              Load byte at byte ptr TOS-1 + TOS
   00f6: SLDC 20          Short load constant 32
   00f7: SBI              Subtract integers (TOS-1 - TOS)
   00f8: STL  0004        Store TOS into MP4
   00fa: SLDL 04          Short load local MP4
   00fb: SLDC 00          Short load constant 0
   00fc: GRTI             Integer TOS-1 > TOS
   00fd: SLDL 04          Short load local MP4
   00fe: SLDC 7f          Short load constant 127
   00ff: LEQI             Integer TOS-1 <= TOS
   0100: LAND             Logical AND (TOS & TOS-1)
   0101: FJP  $0112       Jump if TOS false
   0103: SLDL 05          Short load local MP5
   0104: SIND 00          Short index load *TOS+0
   0105: SLDC 00          Short load constant 0
   0106: SLDC 20          Short load constant 32
   0107: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0108: SLDL 05          Short load local MP5
   0109: INC  000e        Inc field ptr (TOS+14)
   010b: SLDL 04          Short load local MP4
   010c: STO              Store indirect (TOS into TOS-1)
   010d: SLDC 01          Short load constant 1
   010e: STL  0001        Store TOS into MP1
   0110: UJP  $0116       Unconditional jump
-> 0112: SLDL 03          Short load local MP3
   0113: CXP  00 07       Call external procedure PASCALSY.FGET
-> 0116: RNP  01          Return from nonbase procedure
END

### PROCEDURE FIOPRIMS.PROC4(PARAM1) (* P=4 LL=1 *)
  MP1=PARAM1
  MP2
  MP292
BEGIN
-> 0122: LLA  0002        Load local address MP2
   0124: SLDL 01          Short load local MP1
   0125: MOV  0122        Move 290 words (TOS to TOS-1)
   0128: SLDL 01          Short load local MP1
   0129: STL  0124        Store TOS into MP292
   012c: LDL  0124        Load local word MP292
   012f: IND  000d        Static index and load word (TOS+13)
   0131: FJP  $0140       Jump if TOS false
   0133: LDL  0124        Load local word MP292
   0136: INC  000d        Inc field ptr (TOS+13)
   0138: LDL  0124        Load local word MP292
   013b: IND  000d        Static index and load word (TOS+13)
   013d: SLDC 01          Short load constant 1
   013e: ADI              Add integers (TOS + TOS-1)
   013f: STO              Store indirect (TOS into TOS-1)
-> 0140: LDL  0124        Load local word MP292
   0143: INC  001f        Inc field ptr (TOS+31)
   0145: LDCI 0200        Load word 512
   0148: STO              Store indirect (TOS into TOS-1)
   0149: SLDL 01          Short load local MP1
   014a: CXP  00 07       Call external procedure PASCALSY.FGET
   014d: LDL  0124        Load local word MP292
   0150: SIND 02          Short index load *TOS+2
   0151: FJP  $0174       Jump if TOS false
   0153: SLDL 01          Short load local MP1
   0154: LLA  0002        Load local address MP2
   0156: MOV  0122        Move 290 words (TOS to TOS-1)
   0159: LDL  0124        Load local word MP292
   015c: INC  0002        Inc field ptr (TOS+2)
   015e: SLDC 01          Short load constant 1
   015f: STO              Store indirect (TOS into TOS-1)
   0160: LDL  0124        Load local word MP292
   0163: INC  0001        Inc field ptr (TOS+1)
   0165: SLDC 01          Short load constant 1
   0166: STO              Store indirect (TOS into TOS-1)
   0167: LDL  0124        Load local word MP292
   016a: INC  001f        Inc field ptr (TOS+31)
   016c: LDL  0124        Load local word MP292
   016f: IND  001f        Static index and load word (TOS+31)
   0171: SLDC 01          Short load constant 1
   0172: SBI              Subtract integers (TOS-1 - TOS)
   0173: STO              Store indirect (TOS into TOS-1)
-> 0174: RNP  00          Return from nonbase procedure
END

### FUNCTION FIOPRIMS.FUNC5(PARAM1): RETVAL (* P=5 LL=1 *)
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
-> 0180: SLDC 01          Short load constant 1
   0181: STL  0001        Store TOS into MP1
   0183: SLDL 03          Short load local MP3
   0184: STL  0009        Store TOS into MP9
   0186: SLDL 09          Short load local MP9
   0187: INC  0010        Inc field ptr (TOS+16)
   0189: STL  000a        Store TOS into MP10
   018b: SLDL 09          Short load local MP9
   018c: SIND 04          Short index load *TOS+4
   018d: STL  0007        Store TOS into MP7
   018f: SLDC 00          Short load constant 0
   0190: STL  0006        Store TOS into MP6
-> 0192: SLDL 0a          Short load local MP10
   0193: SIND 00          Short index load *TOS+0
   0194: SLDL 09          Short load local MP9
   0195: IND  000d        Static index and load word (TOS+13)
   0197: ADI              Add integers (TOS + TOS-1)
   0198: SLDL 0a          Short load local MP10
   0199: SIND 01          Short index load *TOS+1
   019a: EQUI             Integer TOS-1 = TOS
   019b: SLDL 09          Short load local MP9
   019c: IND  001f        Static index and load word (TOS+31)
   019e: SLDL 07          Short load local MP7
   019f: ADI              Add integers (TOS + TOS-1)
   01a0: SLDL 0a          Short load local MP10
   01a1: IND  000b        Static index and load word (TOS+11)
   01a3: GRTI             Integer TOS-1 > TOS
   01a4: LAND             Logical AND (TOS & TOS-1)
   01a5: FJP  $01b6       Jump if TOS false
   01a7: SLDL 03          Short load local MP3
   01a8: SLDC 00          Short load constant 0
   01a9: SLDC 00          Short load constant 0
   01aa: CXP  00 21       Call external procedure PASCALSY.33
   01ad: FJP  $01b6       Jump if TOS false
   01af: LOD  02 0001     Load word at G1 (SYSCOM)
   01b2: SLDC 08          Short load constant 8
   01b3: STO              Store indirect (TOS into TOS-1)
   01b4: UJP  $02ff       Unconditional jump
-> 01b6: SLDL 0a          Short load local MP10
   01b7: SIND 00          Short index load *TOS+0
   01b8: SLDL 09          Short load local MP9
   01b9: IND  000d        Static index and load word (TOS+13)
   01bb: ADI              Add integers (TOS + TOS-1)
   01bc: SLDL 0a          Short load local MP10
   01bd: SIND 01          Short index load *TOS+1
   01be: EQUI             Integer TOS-1 = TOS
   01bf: FJP  $01e0       Jump if TOS false
   01c1: SLDL 09          Short load local MP9
   01c2: IND  001f        Static index and load word (TOS+31)
   01c4: SLDL 07          Short load local MP7
   01c5: ADI              Add integers (TOS + TOS-1)
   01c6: SLDL 0a          Short load local MP10
   01c7: IND  000b        Static index and load word (TOS+11)
   01c9: GRTI             Integer TOS-1 > TOS
   01ca: FJP  $01d5       Jump if TOS false
   01cc: LOD  02 0001     Load word at G1 (SYSCOM)
   01cf: SLDC 08          Short load constant 8
   01d0: STO              Store indirect (TOS into TOS-1)
   01d1: UJP  $02ff       Unconditional jump
   01d3: UJP  $01de       Unconditional jump
-> 01d5: SLDL 0a          Short load local MP10
   01d6: IND  000b        Static index and load word (TOS+11)
   01d8: SLDL 09          Short load local MP9
   01d9: IND  001f        Static index and load word (TOS+31)
   01db: SBI              Subtract integers (TOS-1 - TOS)
   01dc: STL  0005        Store TOS into MP5
-> 01de: UJP  $01e9       Unconditional jump
-> 01e0: LDCI 0200        Load word 512
   01e3: SLDL 09          Short load local MP9
   01e4: IND  001f        Static index and load word (TOS+31)
   01e6: SBI              Subtract integers (TOS-1 - TOS)
   01e7: STL  0005        Store TOS into MP5
-> 01e9: SLDL 07          Short load local MP7
   01ea: STL  0004        Store TOS into MP4
   01ec: SLDL 04          Short load local MP4
   01ed: SLDL 05          Short load local MP5
   01ee: GRTI             Integer TOS-1 > TOS
   01ef: FJP  $01f4       Jump if TOS false
   01f1: SLDL 05          Short load local MP5
   01f2: STL  0004        Store TOS into MP4
-> 01f4: SLDL 04          Short load local MP4
   01f5: SLDC 00          Short load constant 0
   01f6: GRTI             Integer TOS-1 > TOS
   01f7: FJP  $021d       Jump if TOS false
   01f9: SLDL 09          Short load local MP9
   01fa: INC  0020        Inc field ptr (TOS+32)
   01fc: SLDC 01          Short load constant 1
   01fd: STO              Store indirect (TOS into TOS-1)
   01fe: SLDL 09          Short load local MP9
   01ff: SIND 00          Short index load *TOS+0
   0200: SLDL 06          Short load local MP6
   0201: SLDL 09          Short load local MP9
   0202: INC  0021        Inc field ptr (TOS+33)
   0204: SLDL 09          Short load local MP9
   0205: IND  001f        Static index and load word (TOS+31)
   0207: SLDL 04          Short load local MP4
   0208: CSP  02          Call standard procedure MOVL
   020a: SLDL 09          Short load local MP9
   020b: INC  001f        Inc field ptr (TOS+31)
   020d: SLDL 09          Short load local MP9
   020e: IND  001f        Static index and load word (TOS+31)
   0210: SLDL 04          Short load local MP4
   0211: ADI              Add integers (TOS + TOS-1)
   0212: STO              Store indirect (TOS into TOS-1)
   0213: SLDL 06          Short load local MP6
   0214: SLDL 04          Short load local MP4
   0215: ADI              Add integers (TOS + TOS-1)
   0216: STL  0006        Store TOS into MP6
   0218: SLDL 07          Short load local MP7
   0219: SLDL 04          Short load local MP4
   021a: SBI              Subtract integers (TOS-1 - TOS)
   021b: STL  0007        Store TOS into MP7
-> 021d: SLDL 07          Short load local MP7
   021e: SLDC 00          Short load constant 0
   021f: EQUI             Integer TOS-1 = TOS
   0220: STL  0008        Store TOS into MP8
   0222: SLDL 08          Short load local MP8
   0223: LNOT             Logical NOT (~TOS)
   0224: FJP  $028e       Jump if TOS false
   0226: SLDL 09          Short load local MP9
   0227: IND  0020        Static index and load word (TOS+32)
   0229: FJP  $0249       Jump if TOS false
   022b: SLDL 09          Short load local MP9
   022c: INC  0020        Inc field ptr (TOS+32)
   022e: SLDC 00          Short load constant 0
   022f: STO              Store indirect (TOS into TOS-1)
   0230: SLDL 09          Short load local MP9
   0231: INC  000f        Inc field ptr (TOS+15)
   0233: SLDC 01          Short load constant 1
   0234: STO              Store indirect (TOS into TOS-1)
   0235: SLDL 09          Short load local MP9
   0236: SIND 07          Short index load *TOS+7
   0237: SLDL 09          Short load local MP9
   0238: INC  0021        Inc field ptr (TOS+33)
   023a: SLDC 00          Short load constant 0
   023b: LDCI 0200        Load word 512
   023e: SLDL 0a          Short load local MP10
   023f: SIND 00          Short index load *TOS+0
   0240: SLDL 09          Short load local MP9
   0241: IND  000d        Static index and load word (TOS+13)
   0243: ADI              Add integers (TOS + TOS-1)
   0244: SLDC 01          Short load constant 1
   0245: SBI              Subtract integers (TOS-1 - TOS)
   0246: SLDC 00          Short load constant 0
   0247: CSP  06          Call standard procedure UNITWRITE
-> 0249: CSP  22          Call standard procedure IORESULT
   024b: SLDC 00          Short load constant 0
   024c: NEQI             Integer TOS-1 <> TOS
   024d: FJP  $0251       Jump if TOS false
   024f: UJP  $02ff       Unconditional jump
-> 0251: SLDL 09          Short load local MP9
   0252: IND  000d        Static index and load word (TOS+13)
   0254: SLDL 09          Short load local MP9
   0255: IND  000c        Static index and load word (TOS+12)
   0257: LESI             Integer TOS-1 < TOS
   0258: FJP  $026e       Jump if TOS false
   025a: SLDL 09          Short load local MP9
   025b: SIND 07          Short index load *TOS+7
   025c: SLDL 09          Short load local MP9
   025d: INC  0021        Inc field ptr (TOS+33)
   025f: SLDC 00          Short load constant 0
   0260: LDCI 0200        Load word 512
   0263: SLDL 0a          Short load local MP10
   0264: SIND 00          Short index load *TOS+0
   0265: SLDL 09          Short load local MP9
   0266: IND  000d        Static index and load word (TOS+13)
   0268: ADI              Add integers (TOS + TOS-1)
   0269: SLDC 00          Short load constant 0
   026a: CSP  05          Call standard procedure UNITREAD
   026c: UJP  $0278       Unconditional jump
-> 026e: SLDL 09          Short load local MP9
   026f: INC  0021        Inc field ptr (TOS+33)
   0271: SLDC 00          Short load constant 0
   0272: LDCI 0200        Load word 512
   0275: SLDC 00          Short load constant 0
   0276: CSP  0a          Call standard procedure FLCH
-> 0278: CSP  22          Call standard procedure IORESULT
   027a: SLDC 00          Short load constant 0
   027b: NEQI             Integer TOS-1 <> TOS
   027c: FJP  $0280       Jump if TOS false
   027e: UJP  $02ff       Unconditional jump
-> 0280: SLDL 09          Short load local MP9
   0281: INC  000d        Inc field ptr (TOS+13)
   0283: SLDL 09          Short load local MP9
   0284: IND  000d        Static index and load word (TOS+13)
   0286: SLDC 01          Short load constant 1
   0287: ADI              Add integers (TOS + TOS-1)
   0288: STO              Store indirect (TOS into TOS-1)
   0289: SLDL 09          Short load local MP9
   028a: INC  001f        Inc field ptr (TOS+31)
   028c: SLDC 00          Short load constant 0
   028d: STO              Store indirect (TOS into TOS-1)
-> 028e: SLDL 08          Short load local MP8
   028f: FJP  $0192       Jump if TOS false
   0291: SLDL 09          Short load local MP9
   0292: IND  000d        Static index and load word (TOS+13)
   0294: SLDL 09          Short load local MP9
   0295: IND  000c        Static index and load word (TOS+12)
   0297: GRTI             Integer TOS-1 > TOS
   0298: FJP  $02aa       Jump if TOS false
   029a: SLDL 09          Short load local MP9
   029b: INC  001e        Inc field ptr (TOS+30)
   029d: SLDL 09          Short load local MP9
   029e: IND  001f        Static index and load word (TOS+31)
   02a0: STO              Store indirect (TOS into TOS-1)
   02a1: SLDL 09          Short load local MP9
   02a2: INC  000c        Inc field ptr (TOS+12)
   02a4: SLDL 09          Short load local MP9
   02a5: IND  000d        Static index and load word (TOS+13)
   02a7: STO              Store indirect (TOS into TOS-1)
   02a8: UJP  $02c2       Unconditional jump
-> 02aa: SLDL 09          Short load local MP9
   02ab: IND  000d        Static index and load word (TOS+13)
   02ad: SLDL 09          Short load local MP9
   02ae: IND  000c        Static index and load word (TOS+12)
   02b0: EQUI             Integer TOS-1 = TOS
   02b1: SLDL 09          Short load local MP9
   02b2: IND  001f        Static index and load word (TOS+31)
   02b4: SLDL 09          Short load local MP9
   02b5: IND  001e        Static index and load word (TOS+30)
   02b7: GRTI             Integer TOS-1 > TOS
   02b8: LAND             Logical AND (TOS & TOS-1)
   02b9: FJP  $02c2       Jump if TOS false
   02bb: SLDL 09          Short load local MP9
   02bc: INC  001e        Inc field ptr (TOS+30)
   02be: SLDL 09          Short load local MP9
   02bf: IND  001f        Static index and load word (TOS+31)
   02c1: STO              Store indirect (TOS into TOS-1)
-> 02c2: SLDL 09          Short load local MP9
   02c3: SIND 04          Short index load *TOS+4
   02c4: SLDC 01          Short load constant 1
   02c5: EQUI             Integer TOS-1 = TOS
   02c6: FJP  $02fc       Jump if TOS false
   02c8: SLDL 09          Short load local MP9
   02c9: SIND 00          Short index load *TOS+0
   02ca: SLDC 00          Short load constant 0
   02cb: LDB              Load byte at byte ptr TOS-1 + TOS
   02cc: SLDC 0d          Short load constant 13
   02cd: EQUI             Integer TOS-1 = TOS
   02ce: FJP  $02fc       Jump if TOS false
   02d0: SLDL 0a          Short load local MP10
   02d1: INC  0002        Inc field ptr (TOS+2)
   02d3: SLDC 04          Short load constant 4
   02d4: SLDC 00          Short load constant 0
   02d5: LDP              Load packed field (TOS)
   02d6: SLDC 03          Short load constant 3
   02d7: EQUI             Integer TOS-1 = TOS
   02d8: FJP  $02fc       Jump if TOS false
   02da: SLDL 09          Short load local MP9
   02db: IND  001f        Static index and load word (TOS+31)
   02dd: LDCI 0200        Load word 512
   02e0: SLDC 7f          Short load constant 127
   02e1: SBI              Subtract integers (TOS-1 - TOS)
   02e2: GEQI             Integer TOS-1 >= TOS
   02e3: SLDL 09          Short load local MP9
   02e4: IND  000d        Static index and load word (TOS+13)
   02e6: LNOT             Logical NOT (~TOS)
   02e7: LAND             Logical AND (TOS & TOS-1)
   02e8: FJP  $02fc       Jump if TOS false
   02ea: SLDL 09          Short load local MP9
   02eb: INC  001f        Inc field ptr (TOS+31)
   02ed: LDCI 0200        Load word 512
   02f0: SLDC 01          Short load constant 1
   02f1: SBI              Subtract integers (TOS-1 - TOS)
   02f2: STO              Store indirect (TOS into TOS-1)
   02f3: SLDL 09          Short load local MP9
   02f4: SIND 00          Short index load *TOS+0
   02f5: SLDC 00          Short load constant 0
   02f6: SLDC 00          Short load constant 0
   02f7: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   02f8: SLDL 03          Short load local MP3
   02f9: CXP  00 08       Call external procedure PASCALSY.FPUT
-> 02fc: SLDC 00          Short load constant 0
   02fd: STL  0001        Store TOS into MP1
-> 02ff: RNP  01          Return from nonbase procedure
END

## Segment PRINTERR (3)

### PROCEDURE PRINTERR.PRINTERR (* P=1 LL=0 *)
BEGIN
-> 0000: SLDC 09          Short load constant 9
   0001: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 0004: RBP  00          Return from base procedure
END

## Segment INITIALI (4)

### PROCEDURE INITIALI.INITIALI (* P=1 LL=0 *)
  BASE305
  BASE306
BEGIN
-> 060a: UJP  $079c       Unconditional jump
-> 060c: LOD  01 0005     Load word at G5
   060f: LDCN             Load constant NIL
   0610: EQUI             Integer TOS-1 = TOS
   0611: STR  01 00e5     Store TOS to G229
   0615: LOD  01 00e5     Load word at G229
   0619: FJP  $061f       Jump if TOS false
   061b: CLP  09          Call local procedure INITIALI.9
   061d: UJP  $0624       Unconditional jump
-> 061f: LDA  01 0005     Load addr G5
   0622: CSP  21          Call standard procedure RELEASE
-> 0624: LDA  01 0211     Load addr G529
   0628: NOP              No operation
   0629: LSA  00          Load string address: ''
   062b: SAS  07          String assign (TOS to TOS-1, 7 chars)
   062d: SLDC 00          Short load constant 0
   062e: STR  01 0208     Store TOS to G520
   0632: CLP  07          Call local procedure INITIALI.7
   0634: LDA  01 0215     Load addr G533
   0638: SLDC 00          Short load constant 0
   0639: SLDC 08          Short load constant 8
   063a: SLDC 00          Short load constant 0
   063b: CSP  0a          Call standard procedure FLCH
   063d: CLP  02          Call local procedure INITIALI.INITSYSCOM
   063f: CLP  0a          Call local procedure INITIALI.10
   0641: CLP  03          Call local procedure INITIALI.INIT_FILLER
   0643: LDA  01 00ad     Load addr G173
   0647: LSA  00          Load string address: ''
   0649: NOP              No operation
   064a: SAS  17          String assign (TOS to TOS-1, 23 chars)
   064c: LDA  01 00b9     Load addr G185
   0650: NOP              No operation
   0651: LSA  00          Load string address: ''
   0653: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0655: CXP  00 1f       Call external procedure PASCALSY.31
   0658: LDCI 40df        Load word 16607
   065b: NGI              Negate integer
   065c: SRO  0132        Store global word BASE306
   065f: LDO  0132        Load global word BASE306
   0662: SLDC 00          Short load constant 0
   0663: LDB              Load byte at byte ptr TOS-1 + TOS
   0664: SLDC 03          Short load constant 3
   0665: NEQI             Integer TOS-1 <> TOS
   0666: FJP  $06f3       Jump if TOS false
   0668: LOD  01 0003     Load word at G3 (OUTPUT)
   066b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   066e: CSP  00          Call standard procedure IOC
   0670: LOD  01 0003     Load word at G3 (OUTPUT)
   0673: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0676: CSP  00          Call standard procedure IOC
   0678: LOD  01 0003     Load word at G3 (OUTPUT)
   067b: LSA  27          Load string address: 'Version 1.2 of SYSTEM.PASCAL cannot run'
   06a4: NOP              No operation
   06a5: SLDC 00          Short load constant 0
   06a6: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   06a9: CSP  00          Call standard procedure IOC
   06ab: LOD  01 0003     Load word at G3 (OUTPUT)
   06ae: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   06b1: CSP  00          Call standard procedure IOC
   06b3: LOD  01 0003     Load word at G3 (OUTPUT)
   06b6: NOP              No operation
   06b7: LSA  29          Load string address: 'with a non-1.2 version of the interpreter'
   06e2: SLDC 00          Short load constant 0
   06e3: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   06e6: CSP  00          Call standard procedure IOC
   06e8: LOD  01 0003     Load word at G3 (OUTPUT)
   06eb: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   06ee: CSP  00          Call standard procedure IOC
-> 06f0: SLDC 00          Short load constant 0
   06f1: FJP  $06f0       Jump if TOS false
-> 06f3: LDCI 40de        Load word 16606
   06f6: NGI              Negate integer
   06f7: SRO  0132        Store global word BASE306
   06fa: LDO  0132        Load global word BASE306
   06fd: SLDC 06          Short load constant 6
   06fe: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0701: LDP              Load packed field (TOS)
   0702: SRO  0131        Store global word BASE305
   0705: LDO  0131        Load global word BASE305
   0708: LNOT             Logical NOT (~TOS)
   0709: FJP  $0797       Jump if TOS false
   070b: LOD  01 0003     Load word at G3 (OUTPUT)
   070e: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0711: CSP  00          Call standard procedure IOC
   0713: LOD  01 0003     Load word at G3 (OUTPUT)
   0716: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0719: CSP  00          Call standard procedure IOC
   071b: LOD  01 0003     Load word at G3 (OUTPUT)
   071e: NOP              No operation
   071f: LSA  29          Load string address: 'The 128K version of SYSTEM.PASCAL cannot '
   074a: SLDC 00          Short load constant 0
   074b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   074e: CSP  00          Call standard procedure IOC
   0750: LOD  01 0003     Load word at G3 (OUTPUT)
   0753: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0756: CSP  00          Call standard procedure IOC
   0758: LOD  01 0003     Load word at G3 (OUTPUT)
   075b: LSA  28          Load string address: 'run with the 64K version of SYSTEM.APPLE'
   0785: NOP              No operation
   0786: SLDC 00          Short load constant 0
   0787: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   078a: CSP  00          Call standard procedure IOC
   078c: LOD  01 0003     Load word at G3 (OUTPUT)
   078f: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0792: CSP  00          Call standard procedure IOC
-> 0794: SLDC 00          Short load constant 0
   0795: FJP  $0794       Jump if TOS false
-> 0797: SLDC 06          Short load constant 6
   0798: CSP  16          Call standard procedure UNLOADSEGMENT
   079a: UJP  $07a1       Unconditional jump
-> 079c: SLDC 06          Short load constant 6
   079d: CSP  15          Call standard procedure LOADSEGMENT
   079f: UJP  $060c       Unconditional jump
-> 07a1: RBP  00          Return from base procedure
END

### PROCEDURE INITIALI.INITSYSCOM (* P=2 LL=1 *)
  MP1
  MP2
  MP3
  MP43
  MP303
BEGIN
-> 0000: LLA  0003        Load local address MP3
   0002: LLA  012f        Load local address MP303
   0005: LDCI 0001        Load word 1
   0008: NGI              Negate integer
   0009: CXP  00 03       Call external procedure PASCALSY.FINIT
   000c: LDCI 40de        Load word 16606
   000f: NGI              Negate integer
   0010: STL  0001        Store TOS into MP1
   0012: SLDL 01          Short load local MP1
   0013: SLDC 00          Short load constant 0
   0014: LDB              Load byte at byte ptr TOS-1 + TOS
   0015: SLDC 7f          Short load constant 127
   0016: GRTI             Integer TOS-1 > TOS
   0017: FJP  $004d       Jump if TOS false
   0019: LLA  0003        Load local address MP3
   001b: LSA  0e          Load string address: 'SYSTEM.CHARSET'
   002b: NOP              No operation
   002c: SLDC 01          Short load constant 1
   002d: SLDC 00          Short load constant 0
   002e: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0031: LDCI 0800        Load word 2048
   0034: STL  0002        Store TOS into MP2
   0036: LLA  0003        Load local address MP3
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
   0047: LLA  0003        Load local address MP3
   0049: SLDC 00          Short load constant 0
   004a: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 004d: LLA  0003        Load local address MP3
   004f: SLDC 00          Short load constant 0
   0050: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0053: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.INIT_FILLER (* P=3 LL=1 *)
  BASE15
  BASE20
  BASE22
  BASE31
  MP1
  MP13
  MP42
  MP43
  MP44
  MP50
  MP253
  MP254
  MP255
  MP256
BEGIN
-> 00e0: LDA  02 0019     Load addr G25
   00e3: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   00e5: LDA  02 0014     Load addr G20
   00e8: SLDC 00          Short load constant 0
   00e9: IXA  0001        Index array (TOS-1 + TOS * 1)
   00eb: SLDC 01          Short load constant 1
   00ec: STO              Store indirect (TOS into TOS-1)
   00ed: LDA  02 0014     Load addr G20
   00f0: SLDC 01          Short load constant 1
   00f1: IXA  0001        Index array (TOS-1 + TOS * 1)
   00f3: SLDC 0a          Short load constant 10
   00f4: STO              Store indirect (TOS into TOS-1)
   00f5: LDA  02 0014     Load addr G20
   00f8: SLDC 02          Short load constant 2
   00f9: IXA  0001        Index array (TOS-1 + TOS * 1)
   00fb: SLDC 64          Short load constant 100
   00fc: STO              Store indirect (TOS into TOS-1)
   00fd: LDA  02 0014     Load addr G20
   0100: SLDC 03          Short load constant 3
   0101: IXA  0001        Index array (TOS-1 + TOS * 1)
   0103: LDCI 03e8        Load word 1000
   0106: STO              Store indirect (TOS into TOS-1)
   0107: LDA  02 0014     Load addr G20
   010a: SLDC 04          Short load constant 4
   010b: IXA  0001        Index array (TOS-1 + TOS * 1)
   010d: LDCI 2710        Load word 10000
   0110: STO              Store indirect (TOS into TOS-1)
   0111: LLA  0001        Load local address MP1
   0113: LSA  10          Load string address: '*SYSTEM.MISCINFO'
   0125: NOP              No operation
   0126: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0128: LAO  000f        Load global BASE15
   012a: LDCN             Load constant NIL
   012b: SLDC 01          Short load constant 1
   012c: NGI              Negate integer
   012d: CXP  06 02       Call external procedure SYSIO.2
   0130: LAO  000f        Load global BASE15
   0132: LLA  0001        Load local address MP1
   0134: SLDC 01          Short load constant 1
   0135: LDCN             Load constant NIL
   0136: CXP  06 04       Call external procedure SYSIO.4
   0139: LDO  0014        Load global word BASE20
   013b: FJP  $0178       Jump if TOS false
   013d: LDO  0016        Load global word BASE22
   013f: LLA  000d        Load local address MP13
   0141: SLDC 00          Short load constant 0
   0142: LDCI 01e0        Load word 480
   0145: LDO  001f        Load global word BASE31
   0147: SLDC 00          Short load constant 0
   0148: CSP  05          Call standard procedure UNITREAD
   014a: LOD  02 0001     Load word at G1 (SYSCOM)
   014d: STL  00fe        Store TOS into MP254
   0150: LDL  00fe        Load local word MP254
   0153: INC  001d        Inc field ptr (TOS+29)
   0155: LLA  002a        Load local address MP42
   0157: MOV  0001        Move 1 words (TOS to TOS-1)
   0159: LDL  00fe        Load local word MP254
   015c: INC  001e        Inc field ptr (TOS+30)
   015e: LDL  002b        Load local word MP43
   0160: STO              Store indirect (TOS into TOS-1)
   0161: LDL  00fe        Load local word MP254
   0164: INC  001f        Inc field ptr (TOS+31)
   0166: LLA  002c        Load local address MP44
   0168: MOV  0006        Move 6 words (TOS to TOS-1)
   016a: LDL  00fe        Load local word MP254
   016d: INC  0025        Inc field ptr (TOS+37)
   016f: LLA  0032        Load local address MP50
   0171: MOV  000b        Move 11 words (TOS to TOS-1)
   0173: LDA  02 0019     Load addr G25
   0176: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
-> 0178: LAO  000f        Load global BASE15
   017a: SLDC 00          Short load constant 0
   017b: CXP  06 05       Call external procedure SYSIO.5
   017e: SLDC 01          Short load constant 1
   017f: CSP  26          Call standard procedure UNITCLEAR
   0181: LOD  02 0001     Load word at G1 (SYSCOM)
   0184: STL  00fe        Store TOS into MP254
   0187: LDL  00fe        Load local word MP254
   018a: INC  0001        Inc field ptr (TOS+1)
   018c: SLDC 00          Short load constant 0
   018d: STO              Store indirect (TOS into TOS-1)
   018e: LDL  00fe        Load local word MP254
   0191: SLDC 00          Short load constant 0
   0192: STO              Store indirect (TOS into TOS-1)
   0193: LDL  00fe        Load local word MP254
   0196: INC  0003        Inc field ptr (TOS+3)
   0198: SLDC 00          Short load constant 0
   0199: STO              Store indirect (TOS into TOS-1)
   019a: LDL  00fe        Load local word MP254
   019d: INC  0025        Inc field ptr (TOS+37)
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
   01d2: INC  0008        Inc field ptr (TOS+8)
   01d4: SLDC 08          Short load constant 8
   01d5: SLDC 00          Short load constant 0
   01d6: LDP              Load packed field (TOS)
   01d7: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   01da: SLDC 01          Short load constant 1
   01db: STP              Store packed field (TOS into TOS-1)
   01dc: SLDC 00          Short load constant 0
   01dd: LDL  00ff        Load local word MP255
   01e0: INC  0003        Inc field ptr (TOS+3)
   01e2: SLDC 08          Short load constant 8
   01e3: SLDC 08          Short load constant 8
   01e4: LDP              Load packed field (TOS)
   01e5: CLP  06          Call local procedure INITIALI.INITUNITABLE
   01e7: SLDC 01          Short load constant 1
   01e8: LDL  00ff        Load local word MP255
   01eb: INC  0003        Inc field ptr (TOS+3)
   01ed: SLDC 08          Short load constant 8
   01ee: SLDC 00          Short load constant 0
   01ef: LDP              Load packed field (TOS)
   01f0: CLP  06          Call local procedure INITIALI.INITUNITABLE
   01f2: SLDC 03          Short load constant 3
   01f3: LDL  00ff        Load local word MP255
   01f6: INC  0002        Inc field ptr (TOS+2)
   01f8: SLDC 08          Short load constant 8
   01f9: SLDC 08          Short load constant 8
   01fa: LDP              Load packed field (TOS)
   01fb: CLP  06          Call local procedure INITIALI.INITUNITABLE
   01fd: SLDC 02          Short load constant 2
   01fe: LDL  00ff        Load local word MP255
   0201: INC  0002        Inc field ptr (TOS+2)
   0203: SLDC 08          Short load constant 8
   0204: SLDC 00          Short load constant 0
   0205: LDP              Load packed field (TOS)
   0206: CLP  06          Call local procedure INITIALI.INITUNITABLE
   0208: SLDC 0b          Short load constant 11
   0209: LDL  00ff        Load local word MP255
   020c: INC  0006        Inc field ptr (TOS+6)
   020e: SLDC 08          Short load constant 8
   020f: SLDC 00          Short load constant 0
   0210: LDP              Load packed field (TOS)
   0211: CLP  06          Call local procedure INITIALI.INITUNITABLE
   0213: SLDC 08          Short load constant 8
   0214: LDL  00ff        Load local word MP255
   0217: INC  0004        Inc field ptr (TOS+4)
   0219: SLDC 08          Short load constant 8
   021a: SLDC 00          Short load constant 0
   021b: LDP              Load packed field (TOS)
   021c: CLP  06          Call local procedure INITIALI.INITUNITABLE
   021e: SLDC 09          Short load constant 9
   021f: LDL  00ff        Load local word MP255
   0222: INC  0007        Inc field ptr (TOS+7)
   0224: SLDC 08          Short load constant 8
   0225: SLDC 08          Short load constant 8
   0226: LDP              Load packed field (TOS)
   0227: CLP  06          Call local procedure INITIALI.INITUNITABLE
   0229: SLDC 0a          Short load constant 10
   022a: LDL  00ff        Load local word MP255
   022d: INC  0007        Inc field ptr (TOS+7)
   022f: SLDC 08          Short load constant 8
   0230: SLDC 00          Short load constant 0
   0231: LDP              Load packed field (TOS)
   0232: CLP  06          Call local procedure INITIALI.INITUNITABLE
   0234: SLDC 0d          Short load constant 13
   0235: LDL  00ff        Load local word MP255
   0238: IND  0009        Static index and load word (TOS+9)
   023a: CLP  06          Call local procedure INITIALI.INITUNITABLE
   023c: SLDC 0c          Short load constant 12
   023d: LDL  00ff        Load local word MP255
   0240: INC  0008        Inc field ptr (TOS+8)
   0242: SLDC 08          Short load constant 8
   0243: SLDC 08          Short load constant 8
   0244: LDP              Load packed field (TOS)
   0245: CLP  06          Call local procedure INITIALI.INITUNITABLE
   0247: LDL  00fe        Load local word MP254
   024a: INC  001f        Inc field ptr (TOS+31)
   024c: STL  00ff        Store TOS into MP255
   024f: SLDC 00          Short load constant 0
   0250: LDL  00ff        Load local word MP255
   0253: INC  0002        Inc field ptr (TOS+2)
   0255: SLDC 08          Short load constant 8
   0256: SLDC 08          Short load constant 8
   0257: LDP              Load packed field (TOS)
   0258: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   025a: SLDC 01          Short load constant 1
   025b: LDL  00ff        Load local word MP255
   025e: INC  0002        Inc field ptr (TOS+2)
   0260: SLDC 08          Short load constant 8
   0261: SLDC 00          Short load constant 0
   0262: LDP              Load packed field (TOS)
   0263: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0265: SLDC 02          Short load constant 2
   0266: LDL  00ff        Load local word MP255
   0269: INC  0001        Inc field ptr (TOS+1)
   026b: SLDC 08          Short load constant 8
   026c: SLDC 08          Short load constant 8
   026d: LDP              Load packed field (TOS)
   026e: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0270: SLDC 04          Short load constant 4
   0271: LDL  00ff        Load local word MP255
   0274: SLDC 08          Short load constant 8
   0275: SLDC 08          Short load constant 8
   0276: LDP              Load packed field (TOS)
   0277: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0279: SLDC 03          Short load constant 3
   027a: LDL  00ff        Load local word MP255
   027d: INC  0001        Inc field ptr (TOS+1)
   027f: SLDC 08          Short load constant 8
   0280: SLDC 00          Short load constant 0
   0281: LDP              Load packed field (TOS)
   0282: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0284: SLDC 05          Short load constant 5
   0285: LDL  00ff        Load local word MP255
   0288: INC  0003        Inc field ptr (TOS+3)
   028a: SLDC 08          Short load constant 8
   028b: SLDC 00          Short load constant 0
   028c: LDP              Load packed field (TOS)
   028d: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   028f: SLDC 06          Short load constant 6
   0290: LDL  00ff        Load local word MP255
   0293: INC  0004        Inc field ptr (TOS+4)
   0295: SLDC 08          Short load constant 8
   0296: SLDC 08          Short load constant 8
   0297: LDP              Load packed field (TOS)
   0298: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   029a: SLDC 07          Short load constant 7
   029b: LDL  00ff        Load local word MP255
   029e: INC  0004        Inc field ptr (TOS+4)
   02a0: SLDC 08          Short load constant 8
   02a1: SLDC 00          Short load constant 0
   02a2: LDP              Load packed field (TOS)
   02a3: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
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
   02fe: INC  0005        Inc field ptr (TOS+5)
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
   0324: INC  0003        Inc field ptr (TOS+3)
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
   0361: INC  0001        Inc field ptr (TOS+1)
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

### PROCEDURE INITIALI.SETPREFIXEDCRTCTL(PARAM1) (* P=4 LL=2 *)
  MP1=PARAM1
  MP2
BEGIN
-> 0060: LOD  03 0001     Load word at G1 (SYSCOM)
   0063: INC  001f        Inc field ptr (TOS+31)
   0065: STL  0002        Store TOS into MP2
   0067: SLDL 02          Short load local MP2
   0068: INC  0003        Inc field ptr (TOS+3)
   006a: SLDC 08          Short load constant 8
   006b: SLDC 08          Short load constant 8
   006c: LDP              Load packed field (TOS)
   006d: SLDC 0b          Short load constant 11
   006e: GRTI             Integer TOS-1 > TOS
   006f: FJP  $0078       Jump if TOS false
   0071: SLDL 02          Short load local MP2
   0072: INC  0003        Inc field ptr (TOS+3)
   0074: SLDC 08          Short load constant 8
   0075: SLDC 08          Short load constant 8
   0076: SLDC 0b          Short load constant 11
   0077: STP              Store packed field (TOS into TOS-1)
-> 0078: SLDL 01          Short load local MP1
   0079: SLDC 00          Short load constant 0
   007a: SLDL 02          Short load local MP2
   007b: INC  0003        Inc field ptr (TOS+3)
   007d: SLDC 08          Short load constant 8
   007e: SLDC 08          Short load constant 8
   007f: LDP              Load packed field (TOS)
   0080: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0081: SLDL 01          Short load local MP1
   0082: SLDC 01          Short load constant 1
   0083: SLDL 02          Short load local MP2
   0084: INC  0003        Inc field ptr (TOS+3)
   0086: SLDC 08          Short load constant 8
   0087: SLDC 08          Short load constant 8
   0088: LDP              Load packed field (TOS)
   0089: SLDC 00          Short load constant 0
   008a: CSP  0a          Call standard procedure FLCH
-> 008c: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.SETPREFIXEDCRTINFO(PARAM1; PARAM2) (* P=5 LL=2 *)
  MP1=PARAM2
  MP2=PARAM1
BEGIN
-> 0098: LOD  03 0001     Load word at G1 (SYSCOM)
   009b: INC  0024        Inc field ptr (TOS+36)
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

### PROCEDURE INITIALI.INITUNITABLE(PARAM1; PARAM2) (* P=6 LL=2 *)
  MP1=PARAM2
  MP2=PARAM1
BEGIN
-> 00bc: LOD  03 0001     Load word at G1 (SYSCOM)
   00bf: INC  002f        Inc field ptr (TOS+47)
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

### PROCEDURE INITIALI.PROC7 (* P=7 LL=1 *)
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
-> 03a6: LAO  000f        Load global BASE15
   03a8: LDCN             Load constant NIL
   03a9: SLDC 01          Short load constant 1
   03aa: NGI              Negate integer
   03ab: CXP  06 02       Call external procedure SYSIO.2
   03ae: SLDC 00          Short load constant 0
   03af: STL  0001        Store TOS into MP1
   03b1: SLDC 14          Short load constant 20
   03b2: STL  0003        Store TOS into MP3
-> 03b4: SLDL 01          Short load local MP1
   03b5: SLDL 03          Short load local MP3
   03b6: LEQI             Integer TOS-1 <= TOS
   03b7: FJP  $0499       Jump if TOS false
   03b9: LDA  02 001f     Load addr G31
   03bc: SLDL 01          Short load local MP1
   03bd: IXA  0006        Index array (TOS-1 + TOS * 6)
   03bf: STL  0004        Store TOS into MP4
   03c1: SLDL 04          Short load local MP4
   03c2: NOP              No operation
   03c3: LSA  00          Load string address: ''
   03c5: SAS  07          String assign (TOS to TOS-1, 7 chars)
   03c7: SLDL 04          Short load local MP4
   03c8: INC  0004        Inc field ptr (TOS+4)
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
   03df: INC  0005        Inc field ptr (TOS+5)
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
   0407: IXA  000d        Index array (TOS-1 + TOS * 13)
   0409: INC  0003        Inc field ptr (TOS+3)
   040b: SAS  07          String assign (TOS to TOS-1, 7 chars)
   040d: SLDL 01          Short load local MP1
   040e: LOD  02 0001     Load word at G1 (SYSCOM)
   0411: SIND 02          Short index load *TOS+2
   0412: EQUI             Integer TOS-1 = TOS
   0413: FJP  $0492       Jump if TOS false
   0415: LDA  02 000e     Load addr G14
   0418: SLDL 04          Short load local MP4
   0419: SAS  07          String assign (TOS to TOS-1, 7 chars)
   041b: LAO  0001        Load global BASE1
   041d: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   042e: NOP              No operation
   042f: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0431: LAO  000f        Load global BASE15
   0433: LAO  0001        Load global BASE1
   0435: SLDC 01          Short load constant 1
   0436: LDCN             Load constant NIL
   0437: CXP  06 04       Call external procedure SYSIO.4
   043a: LDO  0014        Load global word BASE20
   043c: SRO  000e        Store global word BASE14
   043e: LAO  000f        Load global BASE15
   0440: SLDC 00          Short load constant 0
   0441: CXP  06 05       Call external procedure SYSIO.5
   0444: LDA  02 000e     Load addr G14
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
   045d: IXA  000d        Index array (TOS-1 + TOS * 13)
   045f: INC  000a        Inc field ptr (TOS+10)
   0461: MOV  0001        Move 1 words (TOS to TOS-1)
   0463: SLDL 02          Short load local MP2
   0464: SLDC 00          Short load constant 0
   0465: IXA  000d        Index array (TOS-1 + TOS * 13)
   0467: INC  000c        Inc field ptr (TOS+12)
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
-> 0499: LOD  02 00e5     Load word at G229
   049d: FJP  $04a7       Jump if TOS false
   049f: LDA  02 000a     Load addr G10
   04a2: LDA  02 000e     Load addr G14
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
   0390: LDA  03 001f     Load addr G31
   0393: SLDL 02          Short load local MP2
   0394: IXA  0006        Index array (TOS-1 + TOS * 6)
   0396: LLA  0003        Load local address MP3
   0398: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 039a: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC9 (* P=9 LL=1 *)
  MP1
BEGIN
-> 050a: LOD  02 0001     Load word at G1 (SYSCOM)
   050d: INC  0004        Inc field ptr (TOS+4)
   050f: LDCN             Load constant NIL
   0510: STO              Store indirect (TOS into TOS-1)
   0511: LDA  02 0006     Load addr G6
   0514: SLDC 1e          Short load constant 30
   0515: CSP  01          Call standard procedure NEW
   0517: LOD  02 0006     Load word at G6
   051a: LDCN             Load constant NIL
   051b: SLDC 01          Short load constant 1
   051c: NGI              Negate integer
   051d: CXP  06 02       Call external procedure SYSIO.2
   0520: LDA  02 0009     Load addr G9
   0523: SLDC 1e          Short load constant 30
   0524: CSP  01          Call standard procedure NEW
   0526: LLA  0001        Load local address MP1
   0528: SLDC 01          Short load constant 1
   0529: CSP  01          Call standard procedure NEW
   052b: LOD  02 0009     Load word at G9
   052e: SLDL 01          Short load local MP1
   052f: SLDC 00          Short load constant 0
   0530: CXP  06 02       Call external procedure SYSIO.2
   0533: LDA  02 0008     Load addr G8
   0536: SLDC 1e          Short load constant 30
   0537: CSP  01          Call standard procedure NEW
   0539: LLA  0001        Load local address MP1
   053b: SLDC 01          Short load constant 1
   053c: CSP  01          Call standard procedure NEW
   053e: LOD  02 0008     Load word at G8
   0541: SLDL 01          Short load local MP1
   0542: SLDC 00          Short load constant 0
   0543: CXP  06 02       Call external procedure SYSIO.2
   0546: LDA  02 0007     Load addr G7
   0549: SLDC 1e          Short load constant 30
   054a: CSP  01          Call standard procedure NEW
   054c: LLA  0001        Load local address MP1
   054e: SLDC 01          Short load constant 1
   054f: CSP  01          Call standard procedure NEW
   0551: LOD  02 0007     Load word at G7
   0554: SLDL 01          Short load local MP1
   0555: SLDC 00          Short load constant 0
   0556: CXP  06 02       Call external procedure SYSIO.2
   0559: LDA  02 0002     Load addr G2 (INPUT)
   055c: SLDC 00          Short load constant 0
   055d: IXA  0001        Index array (TOS-1 + TOS * 1)
   055f: LOD  02 0009     Load word at G9
   0562: STO              Store indirect (TOS into TOS-1)
   0563: LDA  02 0002     Load addr G2 (INPUT)
   0566: SLDC 01          Short load constant 1
   0567: IXA  0001        Index array (TOS-1 + TOS * 1)
   0569: LOD  02 0008     Load word at G8
   056c: STO              Store indirect (TOS into TOS-1)
   056d: LDA  02 0005     Load addr G5
   0570: CSP  20          Call standard procedure MARK
-> 0572: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC10 (* P=10 LL=1 *)
  BASE1
BEGIN
-> 057e: LOD  02 0006     Load word at G6
   0581: SLDC 00          Short load constant 0
   0582: CXP  06 05       Call external procedure SYSIO.5
   0585: LDA  02 00e6     Load addr G230
   0589: LDCN             Load constant NIL
   058a: SLDC 01          Short load constant 1
   058b: NGI              Negate integer
   058c: CXP  06 02       Call external procedure SYSIO.2
   058f: LOD  02 0009     Load word at G9
   0592: SLDC 00          Short load constant 0
   0593: CXP  06 05       Call external procedure SYSIO.5
   0596: LOD  02 0008     Load word at G8
   0599: SLDC 00          Short load constant 0
   059a: CXP  06 05       Call external procedure SYSIO.5
   059d: LAO  0001        Load global BASE1
   059f: LSA  08          Load string address: 'CONSOLE:'
   05a9: NOP              No operation
   05aa: SAS  17          String assign (TOS to TOS-1, 23 chars)
   05ac: LOD  02 0009     Load word at G9
   05af: LAO  0001        Load global BASE1
   05b1: SLDC 01          Short load constant 1
   05b2: LDCN             Load constant NIL
   05b3: CXP  06 04       Call external procedure SYSIO.4
   05b6: LOD  02 0008     Load word at G8
   05b9: LAO  0001        Load global BASE1
   05bb: SLDC 01          Short load constant 1
   05bc: LDCN             Load constant NIL
   05bd: CXP  06 04       Call external procedure SYSIO.4
   05c0: LOD  02 00e5     Load word at G229
   05c4: FJP  $05df       Jump if TOS false
   05c6: LAO  0001        Load global BASE1
   05c8: NOP              No operation
   05c9: LSA  08          Load string address: 'SYSTERM:'
   05d3: SAS  17          String assign (TOS to TOS-1, 23 chars)
   05d5: LOD  02 0007     Load word at G7
   05d8: LAO  0001        Load global BASE1
   05da: SLDC 01          Short load constant 1
   05db: LDCN             Load constant NIL
   05dc: CXP  06 04       Call external procedure SYSIO.4
-> 05df: LDA  02 0002     Load addr G2 (INPUT)
   05e2: SLDC 00          Short load constant 0
   05e3: IXA  0001        Index array (TOS-1 + TOS * 1)
   05e5: LOD  02 0009     Load word at G9
   05e8: STO              Store indirect (TOS into TOS-1)
   05e9: LDA  02 0002     Load addr G2 (INPUT)
   05ec: SLDC 01          Short load constant 1
   05ed: IXA  0001        Index array (TOS-1 + TOS * 1)
   05ef: LOD  02 0008     Load word at G8
   05f2: STO              Store indirect (TOS into TOS-1)
   05f3: LDA  02 0002     Load addr G2 (INPUT)
   05f6: SLDC 02          Short load constant 2
   05f7: IXA  0001        Index array (TOS-1 + TOS * 1)
   05f9: LOD  02 0007     Load word at G7
   05fc: STO              Store indirect (TOS into TOS-1)
-> 05fd: RNP  00          Return from nonbase procedure
END

## Segment GETCMD (5)

### FUNCTION GETCMD.GETCMD(PARAM1): RETVAL (* P=1 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE5
BEGIN
-> 084c: SLDC 00          Short load constant 0
   084d: SRO  0001        Store global word BASE1
   084f: LOD  01 0009     Load word at G9
   0852: INC  0002        Inc field ptr (TOS+2)
   0854: SLDC 00          Short load constant 0
   0855: STO              Store indirect (TOS into TOS-1)
   0856: LOD  01 0008     Load word at G8
   0859: INC  0002        Inc field ptr (TOS+2)
   085b: SLDC 00          Short load constant 0
   085c: STO              Store indirect (TOS into TOS-1)
   085d: LOD  01 0007     Load word at G7
   0860: INC  0002        Inc field ptr (TOS+2)
   0862: SLDC 00          Short load constant 0
   0863: STO              Store indirect (TOS into TOS-1)
   0864: LDA  01 0002     Load addr G2 (INPUT)
   0867: SLDC 00          Short load constant 0
   0868: IXA  0001        Index array (TOS-1 + TOS * 1)
   086a: LOD  01 0009     Load word at G9
   086d: STO              Store indirect (TOS into TOS-1)
   086e: LDA  01 0002     Load addr G2 (INPUT)
   0871: SLDC 01          Short load constant 1
   0872: IXA  0001        Index array (TOS-1 + TOS * 1)
   0874: LOD  01 0008     Load word at G8
   0877: STO              Store indirect (TOS into TOS-1)
   0878: SLDO 03          Short load global BASE3
   0879: SLDC 00          Short load constant 0
   087a: EQUI             Integer TOS-1 = TOS
   087b: FJP  $08ac       Jump if TOS false
   087d: LOD  01 00e5     Load word at G229
   0881: FJP  $08ac       Jump if TOS false
   0883: SLDC 00          Short load constant 0
   0884: STR  01 00e5     Store TOS to G229
   0888: NOP              No operation
   0889: LSA  0e          Load string address: '*SYSTEM.ATTACH'
   0899: SLDC 00          Short load constant 0
   089a: SLDC 00          Short load constant 0
   089b: SLDC 00          Short load constant 0
   089c: LAO  0005        Load global BASE5
   089e: SLDC 01          Short load constant 1
   089f: SLDC 00          Short load constant 0
   08a0: SLDC 00          Short load constant 0
   08a1: CLP  10          Call local procedure GETCMD.16
   08a3: FJP  $08ac       Jump if TOS false
   08a5: SLDC 04          Short load constant 4
   08a6: SRO  0001        Store global word BASE1
   08a8: SLDC 05          Short load constant 5
   08a9: SLDC 01          Short load constant 1
   08aa: CSP  04          Call standard procedure EXIT
-> 08ac: SLDO 03          Short load global BASE3
   08ad: SLDC 04          Short load constant 4
   08ae: EQUI             Integer TOS-1 = TOS
   08af: FJP  $08b4       Jump if TOS false
   08b1: SLDC 00          Short load constant 0
   08b2: SRO  0003        Store global word BASE3
-> 08b4: SLDO 03          Short load global BASE3
   08b5: SLDC 00          Short load constant 0
   08b6: EQUI             Integer TOS-1 = TOS
   08b7: FJP  $08e1       Jump if TOS false
   08b9: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   08ca: NOP              No operation
   08cb: SLDC 00          Short load constant 0
   08cc: SLDC 00          Short load constant 0
   08cd: SLDC 01          Short load constant 1
   08ce: LAO  0005        Load global BASE5
   08d0: SLDC 00          Short load constant 0
   08d1: SLDC 00          Short load constant 0
   08d2: SLDC 00          Short load constant 0
   08d3: CLP  10          Call local procedure GETCMD.16
   08d5: FJP  $08e1       Jump if TOS false
   08d7: CXP  00 1f       Call external procedure PASCALSY.31
   08da: SLDC 03          Short load constant 3
   08db: SRO  0001        Store global word BASE1
   08dd: SLDC 05          Short load constant 5
   08de: SLDC 01          Short load constant 1
   08df: CSP  04          Call standard procedure EXIT
-> 08e1: LDA  01 00ad     Load addr G173
   08e5: SLDC 00          Short load constant 0
   08e6: LDB              Load byte at byte ptr TOS-1 + TOS
   08e7: SLDC 00          Short load constant 0
   08e8: GRTI             Integer TOS-1 > TOS
   08e9: FJP  $090a       Jump if TOS false
   08eb: LDA  01 00ad     Load addr G173
   08ef: SLDC 00          Short load constant 0
   08f0: SLDC 17          Short load constant 23
   08f1: CLP  02          Call local procedure GETCMD.2
   08f3: LDA  01 00ad     Load addr G173
   08f7: SLDC 00          Short load constant 0
   08f8: SLDC 00          Short load constant 0
   08f9: SLDC 01          Short load constant 1
   08fa: LAO  0005        Load global BASE5
   08fc: SLDC 00          Short load constant 0
   08fd: SLDC 00          Short load constant 0
   08fe: SLDC 00          Short load constant 0
   08ff: CLP  10          Call local procedure GETCMD.16
   0901: FJP  $090a       Jump if TOS false
   0903: SLDC 03          Short load constant 3
   0904: SRO  0001        Store global word BASE1
   0906: SLDC 05          Short load constant 5
   0907: SLDC 01          Short load constant 1
   0908: CSP  04          Call standard procedure EXIT
-> 090a: RBP  01          Return from base procedure
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
   002d: FJP  $0122       Jump if TOS false
   002f: SLDL 03          Short load local MP3
   0030: SLDL 04          Short load local MP4
   0031: LDB              Load byte at byte ptr TOS-1 + TOS
   0032: SLDC 2e          Short load constant 46
   0033: NEQI             Integer TOS-1 <> TOS
   0034: FJP  $011c       Jump if TOS false
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
   0079: FJP  $0103       Jump if TOS false
   007b: SLDL 03          Short load local MP3
   007c: SLDL 04          Short load local MP4
   007d: LDB              Load byte at byte ptr TOS-1 + TOS
   007e: SLDC 3a          Short load constant 58
   007f: NEQI             Integer TOS-1 <> TOS
   0080: FJP  $0103       Jump if TOS false
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
   00a9: FJP  $00c9       Jump if TOS false
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
-> 00c2: SLDL 05          Short load local MP5
   00c3: SLDC 01          Short load constant 1
   00c4: ADI              Add integers (TOS + TOS-1)
   00c5: STL  0005        Store TOS into MP5
   00c7: UJP  $00a5       Unconditional jump
-> 00c9: SLDL 04          Short load local MP4
   00ca: SLDC 05          Short load constant 5
   00cb: GRTI             Integer TOS-1 > TOS
   00cc: FJP  $00e0       Jump if TOS false
   00ce: LLA  001e        Load local address MP30
   00d0: SLDL 03          Short load local MP3
   00d1: LLA  0021        Load local address MP33
   00d3: SLDL 04          Short load local MP4
   00d4: SLDC 05          Short load constant 5
   00d5: SBI              Subtract integers (TOS-1 - TOS)
   00d6: SLDC 01          Short load constant 1
   00d7: ADI              Add integers (TOS + TOS-1)
   00d8: SLDC 05          Short load constant 5
   00d9: CXP  00 19       Call external procedure PASCALSY.SCOPY
   00dc: LLA  0021        Load local address MP33
   00de: SAS  05          String assign (TOS to TOS-1, 5 chars)
-> 00e0: LLA  001e        Load local address MP30
   00e2: LLA  001b        Load local address MP27
   00e4: NEQSTR           String TOS-1 <> TOS
   00e6: SLDL 04          Short load local MP4
   00e7: LLA  0006        Load local address MP6
   00e9: SLDC 00          Short load constant 0
   00ea: LDB              Load byte at byte ptr TOS-1 + TOS
   00eb: ADI              Add integers (TOS + TOS-1)
   00ec: SLDL 01          Short load local MP1
   00ed: SLDC 05          Short load constant 5
   00ee: SBI              Subtract integers (TOS-1 - TOS)
   00ef: LEQI             Integer TOS-1 <= TOS
   00f0: LAND             Logical AND (TOS & TOS-1)
   00f1: FJP  $0103       Jump if TOS false
   00f3: LLA  001b        Load local address MP27
   00f5: SLDC 01          Short load constant 1
   00f6: SLDL 03          Short load local MP3
   00f7: SLDL 04          Short load local MP4
   00f8: SLDC 01          Short load constant 1
   00f9: ADI              Add integers (TOS + TOS-1)
   00fa: SLDC 05          Short load constant 5
   00fb: CSP  02          Call standard procedure MOVL
   00fd: SLDL 03          Short load local MP3
   00fe: SLDC 00          Short load constant 0
   00ff: SLDL 04          Short load local MP4
   0100: SLDC 05          Short load constant 5
   0101: ADI              Add integers (TOS + TOS-1)
   0102: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0103: SLDL 03          Short load local MP3
   0104: SLDC 00          Short load constant 0
   0105: STL  0021        Store TOS into MP33
   0107: LLA  0021        Load local address MP33
   0109: SLDL 03          Short load local MP3
   010a: SLDC 50          Short load constant 80
   010b: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   010e: LLA  0021        Load local address MP33
   0110: LLA  0006        Load local address MP6
   0112: SLDC 78          Short load constant 120
   0113: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0116: LLA  0021        Load local address MP33
   0118: SAS  50          String assign (TOS to TOS-1, 80 chars)
   011a: UJP  $0122       Unconditional jump
-> 011c: SLDL 03          Short load local MP3
   011d: SLDC 00          Short load constant 0
   011e: SLDL 04          Short load local MP4
   011f: SLDC 01          Short load constant 1
   0120: SBI              Subtract integers (TOS-1 - TOS)
   0121: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0122: RNP  00          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC3(PARAM1; PARAM2): RETVAL (* P=3 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM2
  MP4=PARAM1
  MP5
BEGIN
-> 013a: SLDL 04          Short load local MP4
   013b: INC  0080        Inc field ptr (TOS+128)
   013e: SLDL 03          Short load local MP3
   013f: IXA  0001        Index array (TOS-1 + TOS * 1)
   0141: STL  0005        Store TOS into MP5
   0143: SLDL 05          Short load local MP5
   0144: SLDC 03          Short load constant 3
   0145: SLDC 0d          Short load constant 13
   0146: LDP              Load packed field (TOS)
   0147: SLDC 01          Short load constant 1
   0148: LESI             Integer TOS-1 < TOS
   0149: FJP  $0150       Jump if TOS false
   014b: SLDL 03          Short load local MP3
   014c: STL  0001        Store TOS into MP1
   014e: UJP  $0163       Unconditional jump
-> 0150: SLDL 05          Short load local MP5
   0151: SLDC 08          Short load constant 8
   0152: SLDC 00          Short load constant 0
   0153: LDP              Load packed field (TOS)
   0154: SLDC 3f          Short load constant 63
   0155: GRTI             Integer TOS-1 > TOS
   0156: FJP  $015d       Jump if TOS false
   0158: SLDC 00          Short load constant 0
   0159: STL  0001        Store TOS into MP1
   015b: UJP  $0163       Unconditional jump
-> 015d: SLDL 05          Short load local MP5
   015e: SLDC 08          Short load constant 8
   015f: SLDC 00          Short load constant 0
   0160: LDP              Load packed field (TOS)
   0161: STL  0001        Store TOS into MP1
-> 0163: RNP  01          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC4(PARAM1) (* P=4 LL=1 *)
  MP1=PARAM1
  MP2
  MP3
  MP4
BEGIN
-> 0198: SLDC 00          Short load constant 0
   0199: STL  0003        Store TOS into MP3
-> 019b: SLDL 01          Short load local MP1
   019c: SLDL 03          Short load local MP3
   019d: SLDC 00          Short load constant 0
   019e: SLDC 00          Short load constant 0
   019f: CGP  03          Call global procedure GETCMD.3
   01a1: SLDC 01          Short load constant 1
   01a2: NEQI             Integer TOS-1 <> TOS
   01a3: FJP  $01ac       Jump if TOS false
   01a5: SLDL 03          Short load local MP3
   01a6: SLDC 01          Short load constant 1
   01a7: ADI              Add integers (TOS + TOS-1)
   01a8: STL  0003        Store TOS into MP3
   01aa: UJP  $019b       Unconditional jump
-> 01ac: SLDL 01          Short load local MP1
   01ad: INC  0080        Inc field ptr (TOS+128)
   01b0: SLDL 03          Short load local MP3
   01b1: IXA  0001        Index array (TOS-1 + TOS * 1)
   01b3: SLDC 03          Short load constant 3
   01b4: SLDC 0d          Short load constant 13
   01b5: LDP              Load packed field (TOS)
   01b6: STL  0002        Store TOS into MP2
   01b8: SLDL 02          Short load local MP2
   01b9: SLDC 01          Short load constant 1
   01ba: EQUI             Integer TOS-1 = TOS
   01bb: FJP  $01c1       Jump if TOS false
   01bd: CLP  05          Call local procedure GETCMD.5
   01bf: UJP  $01f0       Unconditional jump
-> 01c1: SLDL 02          Short load local MP2
   01c2: SLDC 02          Short load constant 2
   01c3: EQUI             Integer TOS-1 = TOS
   01c4: FJP  $01f0       Jump if TOS false
   01c6: LLA  0004        Load local address MP4
   01c8: SLDL 01          Short load local MP1
   01c9: INC  0090        Inc field ptr (TOS+144)
   01cc: MOV  0004        Move 4 words (TOS to TOS-1)
   01ce: LLA  0004        Load local address MP4
   01d0: SLDC 02          Short load constant 2
   01d1: IXA  0001        Index array (TOS-1 + TOS * 1)
   01d3: SIND 00          Short index load *TOS+0
   01d4: SLDC 2a          Short load constant 42
   01d5: EQUI             Integer TOS-1 = TOS
   01d6: LLA  0004        Load local address MP4
   01d8: SLDC 03          Short load constant 3
   01d9: IXA  0001        Index array (TOS-1 + TOS * 1)
   01db: SIND 00          Short index load *TOS+0
   01dc: LDCI 061e        Load word 1566
   01df: EQUI             Integer TOS-1 = TOS
   01e0: LLA  0004        Load local address MP4
   01e2: SLDC 03          Short load constant 3
   01e3: IXA  0001        Index array (TOS-1 + TOS * 1)
   01e5: SIND 00          Short index load *TOS+0
   01e6: LDCI 061f        Load word 1567
   01e9: EQUI             Integer TOS-1 = TOS
   01ea: LOR              Logical OR (TOS | TOS-1)
   01eb: LAND             Logical AND (TOS & TOS-1)
   01ec: FJP  $01f0       Jump if TOS false
   01ee: CLP  05          Call local procedure GETCMD.5
-> 01f0: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC5 (* P=5 LL=2 *)
BEGIN
-> 0170: LDA  01 0004     Load addr L14
   0173: SLDC 02          Short load constant 2
   0174: IXA  0001        Index array (TOS-1 + TOS * 1)
   0176: SLDC 00          Short load constant 0
   0177: STO              Store indirect (TOS into TOS-1)
   0178: LDA  01 0004     Load addr L14
   017b: SLDC 03          Short load constant 3
   017c: IXA  0001        Index array (TOS-1 + TOS * 1)
   017e: SLDC 00          Short load constant 0
   017f: STO              Store indirect (TOS into TOS-1)
   0180: LOD  01 0001     Load word at L1_1
   0183: INC  0090        Inc field ptr (TOS+144)
   0186: LDA  01 0004     Load addr L14
   0189: MOV  0004        Move 4 words (TOS to TOS-1)
-> 018b: RNP  00          Return from nonbase procedure
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
-> 01fe: LOD  02 0001     Load word at G1 (SYSCOM)
   0201: STL  0005        Store TOS into MP5
   0203: SLDL 02          Short load local MP2
   0204: STL  0006        Store TOS into MP6
   0206: SLDL 01          Short load local MP1
   0207: STL  0007        Store TOS into MP7
   0209: SLDL 07          Short load local MP7
   020a: INC  0010        Inc field ptr (TOS+16)
   020c: STL  0008        Store TOS into MP8
   020e: SLDC 00          Short load constant 0
   020f: STL  0003        Store TOS into MP3
   0211: SLDC 0f          Short load constant 15
   0212: STL  0009        Store TOS into MP9
-> 0214: SLDL 03          Short load local MP3
   0215: SLDL 09          Short load local MP9
   0216: LEQI             Integer TOS-1 <= TOS
   0217: FJP  $026e       Jump if TOS false
   0219: SLDL 06          Short load local MP6
   021a: SLDL 03          Short load local MP3
   021b: IXA  0002        Index array (TOS-1 + TOS * 2)
   021d: STL  000a        Store TOS into MP10
   021f: SLDL 0a          Short load local MP10
   0220: SIND 01          Short index load *TOS+1
   0221: SLDC 00          Short load constant 0
   0222: NEQI             Integer TOS-1 <> TOS
   0223: FJP  $0267       Jump if TOS false
   0225: SLDL 02          Short load local MP2
   0226: SLDL 03          Short load local MP3
   0227: SLDC 00          Short load constant 0
   0228: SLDC 00          Short load constant 0
   0229: CGP  03          Call global procedure GETCMD.3
   022b: STL  0004        Store TOS into MP4
   022d: SLDL 04          Short load local MP4
   022e: SLDC 01          Short load constant 1
   022f: EQUI             Integer TOS-1 = TOS
   0230: SLDL 04          Short load local MP4
   0231: SLDC 07          Short load constant 7
   0232: GEQI             Integer TOS-1 >= TOS
   0233: SLDL 04          Short load local MP4
   0234: SLDC 3f          Short load constant 63
   0235: LEQI             Integer TOS-1 <= TOS
   0236: LAND             Logical AND (TOS & TOS-1)
   0237: LOR              Logical OR (TOS | TOS-1)
   0238: FJP  $0267       Jump if TOS false
   023a: SLDL 05          Short load local MP5
   023b: INC  0030        Inc field ptr (TOS+48)
   023d: SLDL 04          Short load local MP4
   023e: IXA  0003        Index array (TOS-1 + TOS * 3)
   0240: STL  000b        Store TOS into MP11
   0242: SLDL 0b          Short load local MP11
   0243: SLDL 07          Short load local MP7
   0244: SIND 07          Short index load *TOS+7
   0245: STO              Store indirect (TOS into TOS-1)
   0246: SLDL 0b          Short load local MP11
   0247: INC  0002        Inc field ptr (TOS+2)
   0249: SLDL 0a          Short load local MP10
   024a: SIND 01          Short index load *TOS+1
   024b: STO              Store indirect (TOS into TOS-1)
   024c: SLDL 06          Short load local MP6
   024d: INC  0060        Inc field ptr (TOS+96)
   024f: SLDL 03          Short load local MP3
   0250: IXA  0001        Index array (TOS-1 + TOS * 1)
   0252: SIND 00          Short index load *TOS+0
   0253: SLDC 07          Short load constant 7
   0254: EQUI             Integer TOS-1 = TOS
   0255: FJP  $025e       Jump if TOS false
   0257: SLDL 0b          Short load local MP11
   0258: INC  0001        Inc field ptr (TOS+1)
   025a: SLDC 00          Short load constant 0
   025b: STO              Store indirect (TOS into TOS-1)
   025c: UJP  $0267       Unconditional jump
-> 025e: SLDL 0b          Short load local MP11
   025f: INC  0001        Inc field ptr (TOS+1)
   0261: SLDL 0a          Short load local MP10
   0262: SIND 00          Short index load *TOS+0
   0263: SLDL 08          Short load local MP8
   0264: SIND 00          Short index load *TOS+0
   0265: ADI              Add integers (TOS + TOS-1)
   0266: STO              Store indirect (TOS into TOS-1)
-> 0267: SLDL 03          Short load local MP3
   0268: SLDC 01          Short load constant 1
   0269: ADI              Add integers (TOS + TOS-1)
   026a: STL  0003        Store TOS into MP3
   026c: UJP  $0214       Unconditional jump
-> 026e: RNP  00          Return from nonbase procedure
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
-> 027c: LLA  0006        Load local address MP6
   027e: SLDL 03          Short load local MP3
   027f: MOV  0001        Move 1 words (TOS to TOS-1)
   0281: SLDL 04          Short load local MP4
   0282: SLDC 00          Short load constant 0
   0283: SLDC 08          Short load constant 8
   0284: SLDC 00          Short load constant 0
   0285: CSP  0a          Call standard procedure FLCH
   0287: SLDC 01          Short load constant 1
   0288: STL  0001        Store TOS into MP1
   028a: SLDL 05          Short load local MP5
   028b: STL  0008        Store TOS into MP8
   028d: SLDC 00          Short load constant 0
   028e: STL  0007        Store TOS into MP7
   0290: SLDC 0f          Short load constant 15
   0291: STL  0009        Store TOS into MP9
-> 0293: SLDL 07          Short load local MP7
   0294: SLDL 09          Short load local MP9
   0295: LEQI             Integer TOS-1 <= TOS
   0296: FJP  $02c8       Jump if TOS false
   0298: SLDL 08          Short load local MP8
   0299: SLDL 07          Short load local MP7
   029a: IXA  0002        Index array (TOS-1 + TOS * 2)
   029c: SIND 01          Short index load *TOS+1
   029d: SLDC 00          Short load constant 0
   029e: NEQI             Integer TOS-1 <> TOS
   029f: FJP  $02c1       Jump if TOS false
   02a1: LLA  0006        Load local address MP6
   02a3: SLDL 08          Short load local MP8
   02a4: INC  0060        Inc field ptr (TOS+96)
   02a6: SLDL 07          Short load local MP7
   02a7: IXA  0001        Index array (TOS-1 + TOS * 1)
   02a9: SIND 00          Short index load *TOS+0
   02aa: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   02ad: LDP              Load packed field (TOS)
   02ae: FJP  $02be       Jump if TOS false
   02b0: SLDL 04          Short load local MP4
   02b1: SLDL 05          Short load local MP5
   02b2: SLDL 07          Short load local MP7
   02b3: SLDC 00          Short load constant 0
   02b4: SLDC 00          Short load constant 0
   02b5: CGP  03          Call global procedure GETCMD.3
   02b7: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   02ba: SLDC 01          Short load constant 1
   02bb: STP              Store packed field (TOS into TOS-1)
   02bc: UJP  $02c1       Unconditional jump
-> 02be: SLDC 00          Short load constant 0
   02bf: STL  0001        Store TOS into MP1
-> 02c1: SLDL 07          Short load local MP7
   02c2: SLDC 01          Short load constant 1
   02c3: ADI              Add integers (TOS + TOS-1)
   02c4: STL  0007        Store TOS into MP7
   02c6: UJP  $0293       Unconditional jump
-> 02c8: RNP  01          Return from nonbase procedure
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
-> 061c: LLA  0005        Load local address MP5
   061e: SLDL 04          Short load local MP4
   061f: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0621: SLDC 00          Short load constant 0
   0622: STL  0042        Store TOS into MP66
   0624: SLDC 00          Short load constant 0
   0625: STL  0001        Store TOS into MP1
   0627: SLDC 00          Short load constant 0
   0628: STL  003f        Store TOS into MP63
   062a: LDA  02 0215     Load addr G533
   062e: SLDC 00          Short load constant 0
   062f: SLDC 08          Short load constant 8
   0630: SLDC 00          Short load constant 0
   0631: CSP  0a          Call standard procedure FLCH
   0633: LLA  023b        Load local address MP571
   0636: LLA  0005        Load local address MP5
   0638: SAS  50          String assign (TOS to TOS-1, 80 chars)
   063a: CLP  0f          Call local procedure GETCMD.15
   063c: CLP  0d          Call local procedure GETCMD.13
   063e: SLDC 00          Short load constant 0
   063f: SLDC 00          Short load constant 0
   0640: CLP  09          Call local procedure GETCMD.9
   0642: LDL  0042        Load local word MP66
   0644: SLDC 00          Short load constant 0
   0645: GRTI             Integer TOS-1 > TOS
   0646: LAND             Logical AND (TOS & TOS-1)
   0647: FJP  $066b       Jump if TOS false
   0649: SLDC 01          Short load constant 1
   064a: STL  0043        Store TOS into MP67
   064c: LDL  0042        Load local word MP66
   064e: STL  0386        Store TOS into MP902
-> 0651: LDL  0043        Load local word MP67
   0653: LDL  0386        Load local word MP902
   0656: LEQI             Integer TOS-1 <= TOS
   0657: FJP  $066b       Jump if TOS false
   0659: LLA  0044        Load local address MP68
   065b: LDL  0043        Load local word MP67
   065d: SLDC 01          Short load constant 1
   065e: SBI              Subtract integers (TOS-1 - TOS)
   065f: IXA  0029        Index array (TOS-1 + TOS * 41)
   0661: CLP  0b          Call local procedure GETCMD.11
   0663: LDL  0043        Load local word MP67
   0665: SLDC 01          Short load constant 1
   0666: ADI              Add integers (TOS + TOS-1)
   0667: STL  0043        Store TOS into MP67
   0669: UJP  $0651       Unconditional jump
-> 066b: SLDC 00          Short load constant 0
   066c: SLDC 00          Short load constant 0
   066d: CLP  09          Call local procedure GETCMD.9
   066f: FJP  $068d       Jump if TOS false
   0671: LLA  0212        Load local address MP530
   0674: NOP              No operation
   0675: LSA  0f          Load string address: '*SYSTEM.LIBRARY'
   0686: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0688: LLA  0212        Load local address MP530
   068b: CLP  0b          Call local procedure GETCMD.11
-> 068d: SLDC 01          Short load constant 1
   068e: STL  0001        Store TOS into MP1
   0690: LDL  003f        Load local word MP63
   0692: LNOT             Logical NOT (~TOS)
   0693: FJP  $0699       Jump if TOS false
   0695: SLDC 0a          Short load constant 10
   0696: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 0699: SLDC 00          Short load constant 0
   069a: SLDC 00          Short load constant 0
   069b: CLP  09          Call local procedure GETCMD.9
   069d: LDL  003f        Load local word MP63
   069f: LAND             Logical AND (TOS & TOS-1)
   06a0: FJP  $06a6       Jump if TOS false
   06a2: SLDC 08          Short load constant 8
   06a3: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 06a6: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC9: RETVAL (* P=9 LL=2 *)
  MP1=RETVAL1
BEGIN
-> 02d6: LOD  01 0003     Load word at L1_3
   02d9: INC  0090        Inc field ptr (TOS+144)
   02dc: LDA  03 0215     Load addr G533
   02e0: NEQWORD          Word array (4 long) TOS-1 <> TOS
   02e3: FJP  $02ea       Jump if TOS false
   02e5: SLDC 01          Short load constant 1
   02e6: STL  0001        Store TOS into MP1
   02e8: UJP  $02ed       Unconditional jump
-> 02ea: SLDC 00          Short load constant 0
   02eb: STL  0001        Store TOS into MP1
-> 02ed: RNP  01          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC10 (* P=10 LL=2 *)
  MP1
  MP2
  MP3
  MP4
BEGIN
-> 02fa: SLDC 00          Short load constant 0
   02fb: STL  0002        Store TOS into MP2
   02fd: SLDC 0f          Short load constant 15
   02fe: STL  0004        Store TOS into MP4
-> 0300: SLDL 02          Short load local MP2
   0301: SLDL 04          Short load local MP4
   0302: LEQI             Integer TOS-1 <= TOS
   0303: FJP  $0371       Jump if TOS false
   0305: LDA  01 0111     Load addr L1273
   0309: SLDL 02          Short load local MP2
   030a: SLDC 00          Short load constant 0
   030b: SLDC 00          Short load constant 0
   030c: CGP  03          Call global procedure GETCMD.3
   030e: STL  0001        Store TOS into MP1
   0310: LLA  0003        Load local address MP3
   0312: SLDC 00          Short load constant 0
   0313: SLDC 02          Short load constant 2
   0314: SLDC 00          Short load constant 0
   0315: CSP  0a          Call standard procedure FLCH
   0317: LLA  0003        Load local address MP3
   0319: SLDC 06          Short load constant 6
   031a: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   031d: SLDC 01          Short load constant 1
   031e: STP              Store packed field (TOS into TOS-1)
   031f: LLA  0003        Load local address MP3
   0321: SLDC 07          Short load constant 7
   0322: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0325: SLDC 01          Short load constant 1
   0326: STP              Store packed field (TOS into TOS-1)
   0327: LLA  0003        Load local address MP3
   0329: LDA  01 0171     Load addr L1369
   032d: SLDL 02          Short load local MP2
   032e: IXA  0001        Index array (TOS-1 + TOS * 1)
   0330: SIND 00          Short index load *TOS+0
   0331: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0334: LDP              Load packed field (TOS)
   0335: LDA  03 0215     Load addr G533
   0339: SLDL 01          Short load local MP1
   033a: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   033d: LDP              Load packed field (TOS)
   033e: LNOT             Logical NOT (~TOS)
   033f: LAND             Logical AND (TOS & TOS-1)
   0340: LOD  01 0003     Load word at L1_3
   0343: INC  0090        Inc field ptr (TOS+144)
   0346: SLDL 01          Short load local MP1
   0347: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   034a: LDP              Load packed field (TOS)
   034b: LAND             Logical AND (TOS & TOS-1)
   034c: FJP  $035f       Jump if TOS false
   034e: LDA  03 0215     Load addr G533
   0352: SLDL 01          Short load local MP1
   0353: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0356: SLDC 01          Short load constant 1
   0357: STP              Store packed field (TOS into TOS-1)
   0358: SLDC 01          Short load constant 1
   0359: STR  01 0211     Store TOS to L1529
   035d: UJP  $036a       Unconditional jump
-> 035f: LDA  01 0111     Load addr L1273
   0363: SLDL 02          Short load local MP2
   0364: IXA  0002        Index array (TOS-1 + TOS * 2)
   0366: INC  0001        Inc field ptr (TOS+1)
   0368: SLDC 00          Short load constant 0
   0369: STO              Store indirect (TOS into TOS-1)
-> 036a: SLDL 02          Short load local MP2
   036b: SLDC 01          Short load constant 1
   036c: ADI              Add integers (TOS + TOS-1)
   036d: STL  0002        Store TOS into MP2
   036f: UJP  $0300       Unconditional jump
-> 0371: LDA  01 0111     Load addr L1273
   0375: LDA  01 0264     Load addr L1612
   0379: CGP  06          Call global procedure GETCMD.6
-> 037b: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC11(PARAM1) (* P=11 LL=2 *)
  MP1=PARAM1
  MP2
BEGIN
-> 038a: LLA  0002        Load local address MP2
   038c: SLDL 01          Short load local MP1
   038d: SAS  50          String assign (TOS to TOS-1, 80 chars)
   038f: LDA  01 0264     Load addr L1612
   0393: LDCN             Load constant NIL
   0394: SLDC 01          Short load constant 1
   0395: NGI              Negate integer
   0396: CXP  06 02       Call external procedure SYSIO.2
   0399: LDA  01 0264     Load addr L1612
   039d: LLA  0002        Load local address MP2
   039f: SLDC 01          Short load constant 1
   03a0: LDCN             Load constant NIL
   03a1: CXP  06 04       Call external procedure SYSIO.4
   03a4: SLDC 00          Short load constant 0
   03a5: STR  01 0211     Store TOS to L1529
   03a9: CSP  22          Call standard procedure IORESULT
   03ab: SLDC 00          Short load constant 0
   03ac: EQUI             Integer TOS-1 = TOS
   03ad: FJP  $03d0       Jump if TOS false
   03af: SLDC 01          Short load constant 1
   03b0: STR  01 003f     Store TOS to L163
   03b3: LOD  01 026b     Load word at L1_619
   03b7: LDA  01 0111     Load addr L1273
   03bb: SLDC 00          Short load constant 0
   03bc: LDCI 0200        Load word 512
   03bf: LOD  01 0274     Load word at L1_628
   03c3: SLDC 00          Short load constant 0
   03c4: CSP  05          Call standard procedure UNITREAD
   03c6: CSP  22          Call standard procedure IORESULT
   03c8: SLDC 00          Short load constant 0
   03c9: EQUI             Integer TOS-1 = TOS
   03ca: FJP  $03ce       Jump if TOS false
   03cc: CIP  0a          Call intermediate procedure 10 GETCMD.10
-> 03ce: UJP  $03d4       Unconditional jump
-> 03d0: SLDC 0a          Short load constant 10
   03d1: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 03d4: LDA  01 0264     Load addr L1612
   03d8: SLDC 00          Short load constant 0
   03d9: CXP  06 05       Call external procedure SYSIO.5
-> 03dc: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC12 (* P=12 LL=2 *)
  MP1
  MP2
  MP3
  MP4
BEGIN
-> 03e8: SLDC 0f          Short load constant 15
   03e9: STL  0002        Store TOS into MP2
   03eb: LDA  01 0111     Load addr L1273
   03ef: SLDL 02          Short load local MP2
   03f0: LDB              Load byte at byte ptr TOS-1 + TOS
   03f1: SLDC 10          Short load constant 16
   03f2: EQUI             Integer TOS-1 = TOS
   03f3: FJP  $03fa       Jump if TOS false
   03f5: SLDL 02          Short load local MP2
   03f6: SLDC 02          Short load constant 2
   03f7: ADI              Add integers (TOS + TOS-1)
   03f8: STL  0002        Store TOS into MP2
-> 03fa: SLDC 00          Short load constant 0
   03fb: STL  0001        Store TOS into MP1
   03fd: LDA  01 0111     Load addr L1273
   0401: SLDL 02          Short load local MP2
   0402: LDB              Load byte at byte ptr TOS-1 + TOS
   0403: SLDC 24          Short load constant 36
   0404: EQUI             Integer TOS-1 = TOS
   0405: LDA  01 0111     Load addr L1273
   0409: SLDL 02          Short load local MP2
   040a: SLDC 01          Short load constant 1
   040b: ADI              Add integers (TOS + TOS-1)
   040c: LDB              Load byte at byte ptr TOS-1 + TOS
   040d: SLDC 24          Short load constant 36
   040e: EQUI             Integer TOS-1 = TOS
   040f: LAND             Logical AND (TOS & TOS-1)
   0410: LNOT             Logical NOT (~TOS)
   0411: FJP  $047c       Jump if TOS false
   0413: SLDC 01          Short load constant 1
   0414: STL  0003        Store TOS into MP3
   0416: SLDC 05          Short load constant 5
   0417: STL  0004        Store TOS into MP4
-> 0419: SLDL 03          Short load local MP3
   041a: SLDL 04          Short load local MP4
   041b: LEQI             Integer TOS-1 <= TOS
   041c: FJP  $0476       Jump if TOS false
   041e: SLDC 50          Short load constant 80
   041f: SLDC 00          Short load constant 0
   0420: SLDC 0d          Short load constant 13
   0421: LDA  01 0111     Load addr L1273
   0425: SLDL 02          Short load local MP2
   0426: SLDC 00          Short load constant 0
   0427: CSP  0b          Call standard procedure SCAN
   0429: STL  0001        Store TOS into MP1
   042b: LDA  01 0111     Load addr L1273
   042f: SLDL 02          Short load local MP2
   0430: LDA  01 0044     Load addr L168
   0433: SLDL 03          Short load local MP3
   0434: SLDC 01          Short load constant 1
   0435: SBI              Subtract integers (TOS-1 - TOS)
   0436: IXA  0029        Index array (TOS-1 + TOS * 41)
   0438: SLDC 01          Short load constant 1
   0439: SLDL 01          Short load local MP1
   043a: CSP  02          Call standard procedure MOVL
   043c: LDA  01 0044     Load addr L168
   043f: SLDL 03          Short load local MP3
   0440: SLDC 01          Short load constant 1
   0441: SBI              Subtract integers (TOS-1 - TOS)
   0442: IXA  0029        Index array (TOS-1 + TOS * 41)
   0444: SLDC 00          Short load constant 0
   0445: SLDL 01          Short load local MP1
   0446: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0447: SLDL 02          Short load local MP2
   0448: SLDL 01          Short load local MP1
   0449: ADI              Add integers (TOS + TOS-1)
   044a: SLDC 01          Short load constant 1
   044b: ADI              Add integers (TOS + TOS-1)
   044c: STL  0002        Store TOS into MP2
   044e: LDA  01 0111     Load addr L1273
   0452: SLDL 02          Short load local MP2
   0453: LDB              Load byte at byte ptr TOS-1 + TOS
   0454: SLDC 10          Short load constant 16
   0455: EQUI             Integer TOS-1 = TOS
   0456: FJP  $045d       Jump if TOS false
   0458: SLDL 02          Short load local MP2
   0459: SLDC 02          Short load constant 2
   045a: ADI              Add integers (TOS + TOS-1)
   045b: STL  0002        Store TOS into MP2
-> 045d: LDA  01 0111     Load addr L1273
   0461: SLDL 02          Short load local MP2
   0462: LDB              Load byte at byte ptr TOS-1 + TOS
   0463: SLDC 24          Short load constant 36
   0464: EQUI             Integer TOS-1 = TOS
   0465: FJP  $046f       Jump if TOS false
   0467: SLDL 03          Short load local MP3
   0468: STR  01 0042     Store TOS to L166
   046b: SLDC 05          Short load constant 5
   046c: SLDC 0c          Short load constant 12
   046d: CSP  04          Call standard procedure EXIT
-> 046f: SLDL 03          Short load local MP3
   0470: SLDC 01          Short load constant 1
   0471: ADI              Add integers (TOS + TOS-1)
   0472: STL  0003        Store TOS into MP3
   0474: UJP  $0419       Unconditional jump
-> 0476: SLDC 05          Short load constant 5
   0477: STR  01 0042     Store TOS to L166
   047a: UJP  $0480       Unconditional jump
-> 047c: SLDC 00          Short load constant 0
   047d: STR  01 0042     Store TOS to L166
-> 0480: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC13 (* P=13 LL=2 *)
  MP1
BEGIN
-> 04c4: LDA  01 0264     Load addr L1612
   04c8: LDCN             Load constant NIL
   04c9: SLDC 01          Short load constant 1
   04ca: NGI              Negate integer
   04cb: CXP  06 02       Call external procedure SYSIO.2
   04ce: LDA  01 0264     Load addr L1612
   04d2: LDA  01 023b     Load addr L1571
   04d6: SLDC 01          Short load constant 1
   04d7: LDCN             Load constant NIL
   04d8: CXP  06 04       Call external procedure SYSIO.4
   04db: CSP  22          Call standard procedure IORESULT
   04dd: SLDC 00          Short load constant 0
   04de: EQUI             Integer TOS-1 = TOS
   04df: FJP  $0560       Jump if TOS false
   04e1: LOD  01 026b     Load word at L1_619
   04e5: LDA  01 0111     Load addr L1273
   04e9: SLDC 00          Short load constant 0
   04ea: LDCI 0200        Load word 512
   04ed: LOD  01 0274     Load word at L1_628
   04f1: SLDC 02          Short load constant 2
   04f2: ADI              Add integers (TOS + TOS-1)
   04f3: SLDC 00          Short load constant 0
   04f4: CSP  05          Call standard procedure UNITREAD
   04f6: CSP  22          Call standard procedure IORESULT
   04f8: SLDC 00          Short load constant 0
   04f9: EQUI             Integer TOS-1 = TOS
   04fa: FJP  $0542       Jump if TOS false
   04fc: LDA  01 0111     Load addr L1273
   0500: SLDC 00          Short load constant 0
   0501: LLA  0001        Load local address MP1
   0503: SLDC 01          Short load constant 1
   0504: SLDC 0e          Short load constant 14
   0505: CSP  02          Call standard procedure MOVL
   0507: CLP  0e          Call local procedure GETCMD.14
   0509: LLA  0001        Load local address MP1
   050b: SLDC 01          Short load constant 1
   050c: LDB              Load byte at byte ptr TOS-1 + TOS
   050d: SLDC 4c          Short load constant 76
   050e: EQUI             Integer TOS-1 = TOS
   050f: LLA  0001        Load local address MP1
   0511: SLDC 02          Short load constant 2
   0512: LDB              Load byte at byte ptr TOS-1 + TOS
   0513: SLDC 49          Short load constant 73
   0514: EQUI             Integer TOS-1 = TOS
   0515: LAND             Logical AND (TOS & TOS-1)
   0516: FJP  $0542       Jump if TOS false
   0518: LLA  0001        Load local address MP1
   051a: SLDC 00          Short load constant 0
   051b: SLDC 0e          Short load constant 14
   051c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   051d: LLA  0001        Load local address MP1
   051f: LSA  0e          Load string address: 'LIBRARY FILES:'
   052f: NOP              No operation
   0530: EQLSTR           String TOS-1 = TOS
   0532: FJP  $0542       Jump if TOS false
   0534: CIP  0c          Call intermediate procedure 12 GETCMD.12
   0536: LDA  01 0264     Load addr L1612
   053a: SLDC 00          Short load constant 0
   053b: CXP  06 05       Call external procedure SYSIO.5
   053e: SLDC 05          Short load constant 5
   053f: SLDC 0d          Short load constant 13
   0540: CSP  04          Call standard procedure EXIT
-> 0542: SLDC 01          Short load constant 1
   0543: STR  01 003f     Store TOS to L163
   0546: SLDC 00          Short load constant 0
   0547: STR  01 0211     Store TOS to L1529
   054b: LOD  01 026b     Load word at L1_619
   054f: LDA  01 0111     Load addr L1273
   0553: SLDC 00          Short load constant 0
   0554: LDCI 0200        Load word 512
   0557: LOD  01 0274     Load word at L1_628
   055b: SLDC 00          Short load constant 0
   055c: CSP  05          Call standard procedure UNITREAD
   055e: CIP  0a          Call intermediate procedure 10 GETCMD.10
-> 0560: LDA  01 0264     Load addr L1612
   0564: SLDC 00          Short load constant 0
   0565: CXP  06 05       Call external procedure SYSIO.5
-> 0568: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC14 (* P=14 LL=3 *)
  MP1
  MP2
BEGIN
-> 048e: SLDC 01          Short load constant 1
   048f: STL  0001        Store TOS into MP1
   0491: SLDC 0d          Short load constant 13
   0492: STL  0002        Store TOS into MP2
-> 0494: SLDL 01          Short load local MP1
   0495: SLDL 02          Short load local MP2
   0496: LEQI             Integer TOS-1 <= TOS
   0497: FJP  $04b5       Jump if TOS false
   0499: LDA  01 0001     Load addr L21
   049c: SLDL 01          Short load local MP1
   049d: LDB              Load byte at byte ptr TOS-1 + TOS
   049e: SLDC 61          Short load constant 97
   049f: GEQI             Integer TOS-1 >= TOS
   04a0: FJP  $04ae       Jump if TOS false
   04a2: LDA  01 0001     Load addr L21
   04a5: SLDL 01          Short load local MP1
   04a6: LDA  01 0001     Load addr L21
   04a9: SLDL 01          Short load local MP1
   04aa: LDB              Load byte at byte ptr TOS-1 + TOS
   04ab: SLDC 20          Short load constant 32
   04ac: SBI              Subtract integers (TOS-1 - TOS)
   04ad: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 04ae: SLDL 01          Short load local MP1
   04af: SLDC 01          Short load constant 1
   04b0: ADI              Add integers (TOS + TOS-1)
   04b1: STL  0001        Store TOS into MP1
   04b3: UJP  $0494       Unconditional jump
-> 04b5: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC15 (* P=15 LL=2 *)
  MP1
  MP2
BEGIN
-> 0574: LDA  01 023b     Load addr L1571
   0578: LDA  01 002e     Load addr L146
   057b: LDA  01 0032     Load addr L150
   057e: LLA  0001        Load local address MP1
   0580: LDA  01 003e     Load addr L162
   0583: SLDC 00          Short load constant 0
   0584: SLDC 00          Short load constant 0
   0585: CXP  06 0b       Call external procedure SYSIO.11
   0588: FJP  $058a       Jump if TOS false
-> 058a: LDA  01 0032     Load addr L150
   058d: SLDC 00          Short load constant 0
   058e: SLDC 0f          Short load constant 15
   058f: CGP  02          Call global procedure GETCMD.2
   0591: LDA  01 0032     Load addr L150
   0594: SLDC 00          Short load constant 0
   0595: LDB              Load byte at byte ptr TOS-1 + TOS
   0596: STL  0001        Store TOS into MP1
   0598: SLDL 01          Short load local MP1
   0599: SLDC 05          Short load constant 5
   059a: GRTI             Integer TOS-1 > TOS
   059b: FJP  $05c1       Jump if TOS false
   059d: LDA  01 0032     Load addr L150
   05a0: LLA  0002        Load local address MP2
   05a2: SLDL 01          Short load local MP1
   05a3: SLDC 04          Short load constant 4
   05a4: SBI              Subtract integers (TOS-1 - TOS)
   05a5: SLDC 05          Short load constant 5
   05a6: CXP  00 19       Call external procedure PASCALSY.SCOPY
   05a9: LLA  0002        Load local address MP2
   05ab: LSA  05          Load string address: '.CODE'
   05b2: NOP              No operation
   05b3: EQLSTR           String TOS-1 = TOS
   05b5: FJP  $05c1       Jump if TOS false
   05b7: LDA  01 0032     Load addr L150
   05ba: SLDL 01          Short load local MP1
   05bb: SLDC 04          Short load constant 4
   05bc: SBI              Subtract integers (TOS-1 - TOS)
   05bd: SLDC 05          Short load constant 5
   05be: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 05c1: LDA  01 0032     Load addr L150
   05c4: SLDC 00          Short load constant 0
   05c5: LDB              Load byte at byte ptr TOS-1 + TOS
   05c6: SLDC 0b          Short load constant 11
   05c7: GRTI             Integer TOS-1 > TOS
   05c8: FJP  $05db       Jump if TOS false
   05ca: LDA  01 0032     Load addr L150
   05cd: LDA  01 0032     Load addr L150
   05d0: LLA  0002        Load local address MP2
   05d2: SLDC 01          Short load constant 1
   05d3: SLDC 0b          Short load constant 11
   05d4: CXP  00 19       Call external procedure PASCALSY.SCOPY
   05d7: LLA  0002        Load local address MP2
   05d9: SAS  0f          String assign (TOS to TOS-1, 15 chars)
-> 05db: LDA  01 023b     Load addr L1571
   05df: SLDC 00          Short load constant 0
   05e0: STL  0002        Store TOS into MP2
   05e2: LLA  0002        Load local address MP2
   05e4: LDA  01 002e     Load addr L146
   05e7: SLDC 07          Short load constant 7
   05e8: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05eb: LLA  0002        Load local address MP2
   05ed: LSA  01          Load string address: ':'
   05f0: NOP              No operation
   05f1: SLDC 08          Short load constant 8
   05f2: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05f5: LLA  0002        Load local address MP2
   05f7: LDA  01 0032     Load addr L150
   05fa: SLDC 17          Short load constant 23
   05fb: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05fe: LLA  0002        Load local address MP2
   0600: NOP              No operation
   0601: LSA  04          Load string address: '.LIB'
   0607: SLDC 1b          Short load constant 27
   0608: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   060b: LLA  0002        Load local address MP2
   060d: SAS  50          String assign (TOS to TOS-1, 80 chars)
-> 060f: RNP  00          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC16(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5; PARAM6): RETVAL (* P=16 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM6
  MP4=PARAM5
  MP5=PARAM4
  MP8=PARAM1
  MP9
  MP50
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
-> 06b4: LLA  0009        Load local address MP9
   06b6: SLDL 08          Short load local MP8
   06b7: SAS  50          String assign (TOS to TOS-1, 80 chars)
   06b9: SLDL 04          Short load local MP4
   06ba: SLDC 02          Short load constant 2
   06bb: STO              Store indirect (TOS into TOS-1)
   06bc: SLDC 00          Short load constant 0
   06bd: STL  0001        Store TOS into MP1
   06bf: LLA  015f        Load local address MP351
   06c2: LDA  02 0211     Load addr G529
   06c6: SAS  07          String assign (TOS to TOS-1, 7 chars)
   06c8: LLA  0136        Load local address MP310
   06cb: LLA  0009        Load local address MP9
   06cd: SAS  50          String assign (TOS to TOS-1, 80 chars)
   06cf: LLA  0136        Load local address MP310
   06d2: LLA  0163        Load local address MP355
   06d5: LLA  0167        Load local address MP359
   06d8: LLA  016f        Load local address MP367
   06db: LLA  0170        Load local address MP368
   06de: SLDC 00          Short load constant 0
   06df: SLDC 00          Short load constant 0
   06e0: CXP  06 0b       Call external procedure SYSIO.11
   06e3: STL  0171        Store TOS into MP369
   06e6: LDA  02 0211     Load addr G529
   06ea: LLA  0163        Load local address MP355
   06ed: SAS  07          String assign (TOS to TOS-1, 7 chars)
   06ef: LDL  0171        Load local word MP369
   06f2: LNOT             Logical NOT (~TOS)
   06f3: FJP  $06fe       Jump if TOS false
   06f5: LDA  02 0211     Load addr G529
   06f9: LSA  00          Load string address: ''
   06fb: NOP              No operation
   06fc: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 06fe: LDA  02 00e6     Load addr G230
   0702: LLA  0009        Load local address MP9
   0704: SLDC 01          Short load constant 1
   0705: LDCN             Load constant NIL
   0706: CXP  06 04       Call external procedure SYSIO.4
   0709: CSP  22          Call standard procedure IORESULT
   070b: SLDC 00          Short load constant 0
   070c: NEQI             Integer TOS-1 <> TOS
   070d: FJP  $071a       Jump if TOS false
   070f: SLDL 05          Short load local MP5
   0710: FJP  $0718       Jump if TOS false
   0712: SLDC 02          Short load constant 2
   0713: CXP  00 02       Call external procedure PASCALSY.EXECERROR
   0716: UJP  $071a       Unconditional jump
-> 0718: UJP  $0829       Unconditional jump
-> 071a: SLDL 04          Short load local MP4
   071b: SLDC 01          Short load constant 1
   071c: STO              Store indirect (TOS into TOS-1)
   071d: LOD  02 0001     Load word at G1 (SYSCOM)
   0720: STL  0178        Store TOS into MP376
   0723: LDA  02 00f8     Load addr G248
   0727: SLDC 04          Short load constant 4
   0728: SLDC 00          Short load constant 0
   0729: LDP              Load packed field (TOS)
   072a: SLDC 02          Short load constant 2
   072b: NEQI             Integer TOS-1 <> TOS
   072c: FJP  $0734       Jump if TOS false
   072e: SLDC 03          Short load constant 3
   072f: CXP  00 02       Call external procedure PASCALSY.EXECERROR
   0732: UJP  $0817       Unconditional jump
-> 0734: LOD  02 00ed     Load word at G237
   0738: LLA  0032        Load local address MP50
   073a: SLDC 00          Short load constant 0
   073b: LDCI 0200        Load word 512
   073e: LOD  02 00f6     Load word at G246
   0742: SLDC 00          Short load constant 0
   0743: CSP  05          Call standard procedure UNITREAD
   0745: CSP  22          Call standard procedure IORESULT
   0747: SLDC 00          Short load constant 0
   0748: NEQI             Integer TOS-1 <> TOS
   0749: FJP  $074f       Jump if TOS false
   074b: SLDC 04          Short load constant 4
   074c: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 074f: SLDL 03          Short load local MP3
   0750: FJP  $0793       Jump if TOS false
   0752: LLA  00b2        Load local address MP178
   0755: SLDC 01          Short load constant 1
   0756: IXA  0001        Index array (TOS-1 + TOS * 1)
   0758: SLDC 03          Short load constant 3
   0759: SLDC 0d          Short load constant 13
   075a: LDP              Load packed field (TOS)
   075b: SLDC 05          Short load constant 5
   075c: NEQI             Integer TOS-1 <> TOS
   075d: FJP  $0793       Jump if TOS false
   075f: LOD  02 0003     Load word at G3 (OUTPUT)
   0762: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0765: CSP  00          Call standard procedure IOC
   0767: LOD  02 0003     Load word at G3 (OUTPUT)
   076a: LLA  0009        Load local address MP9
   076c: SLDC 00          Short load constant 0
   076d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0770: CSP  00          Call standard procedure IOC
   0772: LOD  02 0003     Load word at G3 (OUTPUT)
   0775: LSA  13          Load string address: ' is not version 1.2'
   078a: NOP              No operation
   078b: SLDC 00          Short load constant 0
   078c: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   078f: CSP  00          Call standard procedure IOC
   0791: UJP  $0829       Unconditional jump
-> 0793: SLDL 03          Short load local MP3
   0794: LNOT             Logical NOT (~TOS)
   0795: FJP  $079b       Jump if TOS false
   0797: LLA  0032        Load local address MP50
   0799: CGP  04          Call global procedure GETCMD.4
-> 079b: LLA  0172        Load local address MP370
   079e: SLDC 00          Short load constant 0
   079f: SLDC 02          Short load constant 2
   07a0: SLDC 00          Short load constant 0
   07a1: CSP  0a          Call standard procedure FLCH
   07a3: LLA  0172        Load local address MP370
   07a6: SLDC 00          Short load constant 0
   07a7: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   07aa: SLDC 01          Short load constant 1
   07ab: STP              Store packed field (TOS into TOS-1)
   07ac: LLA  0032        Load local address MP50
   07ae: LLA  0132        Load local address MP306
   07b1: LLA  0172        Load local address MP370
   07b4: SLDC 00          Short load constant 0
   07b5: SLDC 00          Short load constant 0
   07b6: CGP  07          Call global procedure GETCMD.7
   07b8: LNOT             Logical NOT (~TOS)
   07b9: FJP  $07bf       Jump if TOS false
   07bb: SLDC 05          Short load constant 5
   07bc: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 07bf: SLDC 00          Short load constant 0
   07c0: STL  0177        Store TOS into MP375
-> 07c3: LDL  0177        Load local word MP375
   07c6: SLDC 3f          Short load constant 63
   07c7: LEQI             Integer TOS-1 <= TOS
   07c8: FJP  $07ef       Jump if TOS false
   07ca: LLA  0132        Load local address MP306
   07cd: LDL  0177        Load local word MP375
   07d0: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   07d3: LDP              Load packed field (TOS)
   07d4: LLA  00c2        Load local address MP194
   07d7: LDL  0177        Load local word MP375
   07da: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   07dd: LDP              Load packed field (TOS)
   07de: LAND             Logical AND (TOS & TOS-1)
   07df: FJP  $07e5       Jump if TOS false
   07e1: SLDC 06          Short load constant 6
   07e2: CXP  00 02       Call external procedure PASCALSY.EXECERROR
-> 07e5: LDL  0177        Load local word MP375
   07e8: SLDC 01          Short load constant 1
   07e9: ADI              Add integers (TOS + TOS-1)
   07ea: STL  0177        Store TOS into MP375
   07ed: UJP  $07c3       Unconditional jump
-> 07ef: LLA  0173        Load local address MP371
   07f2: SLDC 00          Short load constant 0
   07f3: SLDC 08          Short load constant 8
   07f4: SLDC 00          Short load constant 0
   07f5: CSP  0a          Call standard procedure FLCH
   07f7: LLA  00c2        Load local address MP194
   07fa: LLA  0173        Load local address MP371
   07fd: NEQWORD          Word array (4 long) TOS-1 <> TOS
   0800: FJP  $080f       Jump if TOS false
   0802: LLA  0009        Load local address MP9
   0804: LLA  0032        Load local address MP50
   0806: SLDC 00          Short load constant 0
   0807: SLDC 00          Short load constant 0
   0808: CGP  08          Call global procedure GETCMD.8
   080a: LNOT             Logical NOT (~TOS)
   080b: FJP  $080f       Jump if TOS false
   080d: UJP  $0829       Unconditional jump
-> 080f: LLA  0032        Load local address MP50
   0811: LDA  02 00e6     Load addr G230
   0815: CGP  06          Call global procedure GETCMD.6
-> 0817: SLDL 04          Short load local MP4
   0818: SLDC 00          Short load constant 0
   0819: STO              Store indirect (TOS into TOS-1)
   081a: SLDC 01          Short load constant 1
   081b: STL  0001        Store TOS into MP1
   081d: LDA  02 00e6     Load addr G230
   0821: SLDC 00          Short load constant 0
   0822: CXP  06 05       Call external procedure SYSIO.5
   0825: SLDC 05          Short load constant 5
   0826: SLDC 10          Short load constant 16
   0827: CSP  04          Call standard procedure EXIT
-> 0829: LDA  02 00e6     Load addr G230
   082d: SLDC 00          Short load constant 0
   082e: CXP  06 05       Call external procedure SYSIO.5
   0831: LDA  02 0211     Load addr G529
   0835: LLA  015f        Load local address MP351
   0838: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 083a: RNP  01          Return from nonbase procedure
END

## Segment SYSIO (6)

### PROCEDURE SYSIO.SYSIO (* P=1 LL=1 *)
BEGIN
-> 0e18: RNP  00          Return from nonbase procedure
END

### PROCEDURE SYSIO.PROC2(PARAM1; PARAM2; PARAM3) (* P=2 LL=1 *)
  MP1=PARAM3
  MP2=PARAM2
  MP3=PARAM1
  MP4
BEGIN
-> 06b8: SLDL 03          Short load local MP3
   06b9: STL  0004        Store TOS into MP4
   06bb: SLDL 04          Short load local MP4
   06bc: INC  0003        Inc field ptr (TOS+3)
   06be: SLDC 00          Short load constant 0
   06bf: STO              Store indirect (TOS into TOS-1)
   06c0: SLDL 04          Short load local MP4
   06c1: INC  0005        Inc field ptr (TOS+5)
   06c3: SLDC 00          Short load constant 0
   06c4: STO              Store indirect (TOS into TOS-1)
   06c5: SLDL 04          Short load local MP4
   06c6: INC  0002        Inc field ptr (TOS+2)
   06c8: SLDC 01          Short load constant 1
   06c9: STO              Store indirect (TOS into TOS-1)
   06ca: SLDL 04          Short load local MP4
   06cb: INC  0001        Inc field ptr (TOS+1)
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
   06e2: INC  0004        Inc field ptr (TOS+4)
   06e4: SLDC 01          Short load constant 1
   06e5: STO              Store indirect (TOS into TOS-1)
   06e6: SLDL 01          Short load local MP1
   06e7: SLDC 00          Short load constant 0
   06e8: EQUI             Integer TOS-1 = TOS
   06e9: FJP  $06f0       Jump if TOS false
   06eb: SLDL 04          Short load local MP4
   06ec: INC  0003        Inc field ptr (TOS+3)
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
   06fb: INC  0004        Inc field ptr (TOS+4)
   06fd: SLDC 00          Short load constant 0
   06fe: STO              Store indirect (TOS into TOS-1)
   06ff: UJP  $0708       Unconditional jump
-> 0701: SLDL 04          Short load local MP4
   0702: INC  0004        Inc field ptr (TOS+4)
   0704: SLDL 01          Short load local MP1
   0705: SLDL 01          Short load local MP1
   0706: ADI              Add integers (TOS + TOS-1)
   0707: STO              Store indirect (TOS into TOS-1)
-> 0708: RNP  00          Return from nonbase procedure
END

### PROCEDURE SYSIO.PROC3(PARAM1) (* P=3 LL=1 *)
  MP1=PARAM1
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
   0828: INC  0003        Inc field ptr (TOS+3)
   082a: SLDC 01          Short load constant 1
   082b: STO              Store indirect (TOS into TOS-1)
-> 082c: RNP  00          Return from nonbase procedure
END

### PROCEDURE SYSIO.PROC4(PARAM1; PARAM2; PARAM3; PARAM4) (* P=4 LL=1 *)
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
   09a6: LOD  02 0006     Load word at G6
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
   09d3: LOD  02 0005     Load word at G5
   09d6: SBI              Subtract integers (TOS-1 - TOS)
   09d7: STL  0008        Store TOS into MP8
   09d9: SLDL 08          Short load local MP8
   09da: SLDC 00          Short load constant 0
   09db: GRTI             Integer TOS-1 > TOS
   09dc: SLDL 08          Short load local MP8
   09dd: LDCI 07ec        Load word 2028
   09e0: GRTI             Integer TOS-1 > TOS
   09e1: LAND             Logical AND (TOS & TOS-1)
   09e2: LDA  02 001f     Load addr G31
   09e5: LDL  001b        Load local word MP27
   09e7: SIND 07          Short index load *TOS+7
   09e8: IXA  0006        Index array (TOS-1 + TOS * 6)
   09ea: LDL  001b        Load local word MP27
   09ec: INC  0008        Inc field ptr (TOS+8)
   09ee: EQLSTR           String TOS-1 = TOS
   09f0: LAND             Logical AND (TOS & TOS-1)
   09f1: FJP  $0a0c       Jump if TOS false
   09f3: LDL  001b        Load local word MP27
   09f5: SIND 07          Short index load *TOS+7
   09f6: LOD  02 0005     Load word at G5
   09f9: SLDC 00          Short load constant 0
   09fa: LDCI 07ec        Load word 2028
   09fd: LDL  001b        Load local word MP27
   09ff: IND  0010        Static index and load word (TOS+16)
   0a01: SLDC 00          Short load constant 0
   0a02: CSP  06          Call standard procedure UNITWRITE
   0a04: LDA  02 0005     Load addr G5
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
-> 0a23: LDA  02 001f     Load addr G31
   0a26: SLDL 06          Short load local MP6
   0a27: IXA  0006        Index array (TOS-1 + TOS * 6)
   0a29: STL  001b        Store TOS into MP27
   0a2b: LDL  001a        Load local word MP26
   0a2d: INC  0005        Inc field ptr (TOS+5)
   0a2f: SLDC 01          Short load constant 1
   0a30: STO              Store indirect (TOS into TOS-1)
   0a31: LDL  001a        Load local word MP26
   0a33: INC  000f        Inc field ptr (TOS+15)
   0a35: SLDC 00          Short load constant 0
   0a36: STO              Store indirect (TOS into TOS-1)
   0a37: LDL  001a        Load local word MP26
   0a39: INC  0007        Inc field ptr (TOS+7)
   0a3b: SLDL 06          Short load local MP6
   0a3c: STO              Store indirect (TOS into TOS-1)
   0a3d: LDL  001a        Load local word MP26
   0a3f: INC  0008        Inc field ptr (TOS+8)
   0a41: LLA  000e        Load local address MP14
   0a43: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0a45: LDL  001a        Load local word MP26
   0a47: INC  000d        Inc field ptr (TOS+13)
   0a49: SLDC 00          Short load constant 0
   0a4a: STO              Store indirect (TOS into TOS-1)
   0a4b: LDL  001a        Load local word MP26
   0a4d: INC  0006        Inc field ptr (TOS+6)
   0a4f: LDL  001b        Load local word MP27
   0a51: SIND 04          Short index load *TOS+4
   0a52: STO              Store indirect (TOS into TOS-1)
   0a53: LDL  001a        Load local word MP26
   0a55: INC  001d        Inc field ptr (TOS+29)
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
   0a8a: INC  0010        Inc field ptr (TOS+16)
   0a8c: SLDL 05          Short load local MP5
   0a8d: SLDL 07          Short load local MP7
   0a8e: IXA  000d        Index array (TOS-1 + TOS * 13)
   0a90: MOV  000d        Move 13 words (TOS to TOS-1)
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
   0ac0: IXA  000d        Index array (TOS-1 + TOS * 13)
   0ac2: STL  001c        Store TOS into MP28
   0ac4: LDL  001c        Load local word MP28
   0ac6: SIND 01          Short index load *TOS+1
   0ac7: LDL  001c        Load local word MP28
   0ac9: SIND 00          Short index load *TOS+0
   0aca: SBI              Subtract integers (TOS-1 - TOS)
   0acb: FJP  $0ad7       Jump if TOS false
   0acd: LDL  001c        Load local word MP28
   0acf: INC  0001        Inc field ptr (TOS+1)
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
   0af7: INC  0010        Inc field ptr (TOS+16)
   0af9: SLDL 05          Short load local MP5
   0afa: SLDL 07          Short load local MP7
   0afb: IXA  000d        Index array (TOS-1 + TOS * 13)
   0afd: MOV  000d        Move 13 words (TOS to TOS-1)
   0aff: LDL  001a        Load local word MP26
   0b01: INC  000f        Inc field ptr (TOS+15)
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
   0b17: LDA  02 001f     Load addr G31
   0b1a: SLDL 06          Short load local MP6
   0b1b: IXA  0006        Index array (TOS-1 + TOS * 6)
   0b1d: SIND 04          Short index load *TOS+4
   0b1e: FJP  $0b27       Jump if TOS false
   0b20: LOD  02 0001     Load word at G1 (SYSCOM)
   0b23: SLDC 0a          Short load constant 10
   0b24: STO              Store indirect (TOS into TOS-1)
   0b25: UJP  $0c0f       Unconditional jump
-> 0b27: LDL  001a        Load local word MP26
   0b29: INC  0010        Inc field ptr (TOS+16)
   0b2b: STL  001c        Store TOS into MP28
   0b2d: LDL  001c        Load local word MP28
   0b2f: SLDC 00          Short load constant 0
   0b30: STO              Store indirect (TOS into TOS-1)
   0b31: LDL  001c        Load local word MP28
   0b33: INC  0001        Inc field ptr (TOS+1)
   0b35: LDCI 7fff        Load word 32767
   0b38: STO              Store indirect (TOS into TOS-1)
   0b39: LDL  001b        Load local word MP27
   0b3b: SIND 04          Short index load *TOS+4
   0b3c: FJP  $0b46       Jump if TOS false
   0b3e: LDL  001c        Load local word MP28
   0b40: INC  0001        Inc field ptr (TOS+1)
   0b42: LDL  001b        Load local word MP27
   0b44: SIND 05          Short index load *TOS+5
   0b45: STO              Store indirect (TOS into TOS-1)
-> 0b46: LDL  001c        Load local word MP28
   0b48: INC  0002        Inc field ptr (TOS+2)
   0b4a: SLDC 04          Short load constant 4
   0b4b: SLDC 00          Short load constant 0
   0b4c: SLDL 0a          Short load local MP10
   0b4d: STP              Store packed field (TOS into TOS-1)
   0b4e: LDL  001c        Load local word MP28
   0b50: INC  0003        Inc field ptr (TOS+3)
   0b52: NOP              No operation
   0b53: LSA  00          Load string address: ''
   0b55: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0b57: LDL  001c        Load local word MP28
   0b59: INC  000b        Inc field ptr (TOS+11)
   0b5b: LDCI 0200        Load word 512
   0b5e: STO              Store indirect (TOS into TOS-1)
   0b5f: LDL  001c        Load local word MP28
   0b61: INC  000c        Inc field ptr (TOS+12)
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
   0b7c: INC  000c        Inc field ptr (TOS+12)
   0b7e: LDL  001a        Load local word MP26
   0b80: IND  0011        Static index and load word (TOS+17)
   0b82: LDL  001a        Load local word MP26
   0b84: IND  0010        Static index and load word (TOS+16)
   0b86: SBI              Subtract integers (TOS-1 - TOS)
   0b87: STO              Store indirect (TOS into TOS-1)
   0b88: UJP  $0b90       Unconditional jump
-> 0b8a: LDL  001a        Load local word MP26
   0b8c: INC  000c        Inc field ptr (TOS+12)
   0b8e: SLDC 00          Short load constant 0
   0b8f: STO              Store indirect (TOS into TOS-1)
-> 0b90: LDL  001a        Load local word MP26
   0b92: IND  001d        Static index and load word (TOS+29)
   0b94: FJP  $0c04       Jump if TOS false
   0b96: LDL  001a        Load local word MP26
   0b98: INC  001f        Inc field ptr (TOS+31)
   0b9a: LDCI 0200        Load word 512
   0b9d: STO              Store indirect (TOS into TOS-1)
   0b9e: LDL  001a        Load local word MP26
   0ba0: INC  0020        Inc field ptr (TOS+32)
   0ba2: SLDC 00          Short load constant 0
   0ba3: STO              Store indirect (TOS into TOS-1)
   0ba4: SLDL 02          Short load local MP2
   0ba5: FJP  $0bb2       Jump if TOS false
   0ba7: LDL  001a        Load local word MP26
   0ba9: INC  001e        Inc field ptr (TOS+30)
   0bab: LDL  001a        Load local word MP26
   0bad: IND  001b        Static index and load word (TOS+27)
   0baf: STO              Store indirect (TOS into TOS-1)
   0bb0: UJP  $0bba       Unconditional jump
-> 0bb2: LDL  001a        Load local word MP26
   0bb4: INC  001e        Inc field ptr (TOS+30)
   0bb6: LDCI 0200        Load word 512
   0bb9: STO              Store indirect (TOS into TOS-1)
-> 0bba: LDL  001a        Load local word MP26
   0bbc: INC  0010        Inc field ptr (TOS+16)
   0bbe: STL  001c        Store TOS into MP28
   0bc0: LDL  001c        Load local word MP28
   0bc2: INC  0002        Inc field ptr (TOS+2)
   0bc4: SLDC 04          Short load constant 4
   0bc5: SLDC 00          Short load constant 0
   0bc6: LDP              Load packed field (TOS)
   0bc7: SLDC 03          Short load constant 3
   0bc8: EQUI             Integer TOS-1 = TOS
   0bc9: FJP  $0c04       Jump if TOS false
   0bcb: LDL  001a        Load local word MP26
   0bcd: INC  000d        Inc field ptr (TOS+13)
   0bcf: SLDC 02          Short load constant 2
   0bd0: STO              Store indirect (TOS into TOS-1)
   0bd1: SLDL 02          Short load local MP2
   0bd2: LNOT             Logical NOT (~TOS)
   0bd3: FJP  $0c04       Jump if TOS false
   0bd5: LDL  001a        Load local word MP26
   0bd7: INC  0021        Inc field ptr (TOS+33)
   0bd9: SLDC 00          Short load constant 0
   0bda: LDCI 0202        Load word 514
   0bdd: SLDC 00          Short load constant 0
   0bde: CSP  0a          Call standard procedure FLCH
   0be0: LDL  001a        Load local word MP26
   0be2: SIND 07          Short index load *TOS+7
   0be3: LDL  001a        Load local word MP26
   0be5: INC  0021        Inc field ptr (TOS+33)
   0be7: SLDC 00          Short load constant 0
   0be8: LDCI 0200        Load word 512
   0beb: LDL  001c        Load local word MP28
   0bed: SIND 00          Short index load *TOS+0
   0bee: SLDC 00          Short load constant 0
   0bef: CSP  06          Call standard procedure UNITWRITE
   0bf1: LDL  001a        Load local word MP26
   0bf3: SIND 07          Short index load *TOS+7
   0bf4: LDL  001a        Load local word MP26
   0bf6: INC  0021        Inc field ptr (TOS+33)
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
   0c08: CGP  03          Call global procedure SYSIO.3
   0c0a: UJP  $0c0f       Unconditional jump
-> 0c0c: SLDL 04          Short load local MP4
   0c0d: CGP  0d          Call global procedure SYSIO.13
-> 0c0f: LOD  02 0001     Load word at G1 (SYSCOM)
   0c12: SIND 00          Short index load *TOS+0
   0c13: SLDC 00          Short load constant 0
   0c14: NEQI             Integer TOS-1 <> TOS
   0c15: FJP  $0c29       Jump if TOS false
   0c17: LDL  001a        Load local word MP26
   0c19: INC  0005        Inc field ptr (TOS+5)
   0c1b: SLDC 00          Short load constant 0
   0c1c: STO              Store indirect (TOS into TOS-1)
   0c1d: LDL  001a        Load local word MP26
   0c1f: INC  0002        Inc field ptr (TOS+2)
   0c21: SLDC 01          Short load constant 1
   0c22: STO              Store indirect (TOS into TOS-1)
   0c23: LDL  001a        Load local word MP26
   0c25: INC  0001        Inc field ptr (TOS+1)
   0c27: SLDC 01          Short load constant 1
   0c28: STO              Store indirect (TOS into TOS-1)
-> 0c29: SLDL 0c          Short load local MP12
   0c2a: FJP  $0c55       Jump if TOS false
   0c2c: LLA  000b        Load local address MP11
   0c2e: CSP  21          Call standard procedure RELEASE
   0c30: LOD  02 0001     Load word at G1 (SYSCOM)
   0c33: INC  0004        Inc field ptr (TOS+4)
   0c35: LDCN             Load constant NIL
   0c36: STO              Store indirect (TOS into TOS-1)
   0c37: LOD  02 0001     Load word at G1 (SYSCOM)
   0c3a: SIND 00          Short index load *TOS+0
   0c3b: STL  000d        Store TOS into MP13
   0c3d: LOD  02 0006     Load word at G6
   0c40: SIND 07          Short index load *TOS+7
   0c41: LOD  02 0005     Load word at G5
   0c44: SLDC 00          Short load constant 0
   0c45: LDCI 07ec        Load word 2028
   0c48: LOD  02 0006     Load word at G6
   0c4b: IND  0010        Static index and load word (TOS+16)
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

### PROCEDURE SYSIO.PROC5(PARAM1; PARAM2) (* P=5 LL=1 *)
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
   0c7e: LOD  02 0007     Load word at G7
   0c81: SIND 00          Short index load *TOS+0
   0c82: NEQI             Integer TOS-1 <> TOS
   0c83: LAND             Logical AND (TOS & TOS-1)
   0c84: FJP  $0dfe       Jump if TOS false
   0c86: SLDL 07          Short load local MP7
   0c87: SIND 06          Short index load *TOS+6
   0c88: FJP  $0dd5       Jump if TOS false
   0c8a: SLDL 07          Short load local MP7
   0c8b: INC  0010        Inc field ptr (TOS+16)
   0c8d: STL  0008        Store TOS into MP8
   0c8f: SLDL 08          Short load local MP8
   0c90: INC  0003        Inc field ptr (TOS+3)
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
   0c9e: INC  000c        Inc field ptr (TOS+12)
   0ca0: SLDL 07          Short load local MP7
   0ca1: IND  000d        Static index and load word (TOS+13)
   0ca3: STO              Store indirect (TOS into TOS-1)
   0ca4: SLDL 08          Short load local MP8
   0ca5: INC  000c        Inc field ptr (TOS+12)
   0ca7: SLDC 07          Short load constant 7
   0ca8: SLDC 09          Short load constant 9
   0ca9: SLDC 64          Short load constant 100
   0caa: STP              Store packed field (TOS into TOS-1)
   0cab: SLDC 01          Short load constant 1
   0cac: STL  0001        Store TOS into MP1
   0cae: SLDL 07          Short load local MP7
   0caf: IND  001d        Static index and load word (TOS+29)
   0cb1: FJP  $0cba       Jump if TOS false
   0cb3: SLDL 07          Short load local MP7
   0cb4: INC  001e        Inc field ptr (TOS+30)
   0cb6: SLDL 07          Short load local MP7
   0cb7: IND  001f        Static index and load word (TOS+31)
   0cb9: STO              Store indirect (TOS into TOS-1)
-> 0cba: SLDL 02          Short load local MP2
   0cbb: CGP  0d          Call global procedure SYSIO.13
   0cbd: SLDL 07          Short load local MP7
   0cbe: IND  000f        Static index and load word (TOS+15)
   0cc0: SLDL 08          Short load local MP8
   0cc1: INC  000c        Inc field ptr (TOS+12)
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
   0cd2: INC  0008        Inc field ptr (TOS+8)
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
   0cee: IXA  000d        Index array (TOS-1 + TOS * 13)
   0cf0: IND  0008        Static index and load word (TOS+8)
   0cf2: LEQI             Integer TOS-1 <= TOS
   0cf3: SLDL 06          Short load local MP6
   0cf4: LNOT             Logical NOT (~TOS)
   0cf5: LAND             Logical AND (TOS & TOS-1)
   0cf6: FJP  $0d12       Jump if TOS false
   0cf8: SLDL 05          Short load local MP5
   0cf9: SLDL 04          Short load local MP4
   0cfa: IXA  000d        Index array (TOS-1 + TOS * 13)
   0cfc: SIND 00          Short index load *TOS+0
   0cfd: SLDL 08          Short load local MP8
   0cfe: SIND 00          Short index load *TOS+0
   0cff: EQUI             Integer TOS-1 = TOS
   0d00: SLDL 05          Short load local MP5
   0d01: SLDL 04          Short load local MP4
   0d02: IXA  000d        Index array (TOS-1 + TOS * 13)
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
   0d27: IXA  000d        Index array (TOS-1 + TOS * 13)
   0d29: INC  000c        Inc field ptr (TOS+12)
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
   0d3e: INC  0003        Inc field ptr (TOS+3)
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
   0d61: IXA  000d        Index array (TOS-1 + TOS * 13)
   0d63: INC  000c        Inc field ptr (TOS+12)
   0d65: SLDC 07          Short load constant 7
   0d66: SLDC 09          Short load constant 9
   0d67: LDP              Load packed field (TOS)
   0d68: SLDC 64          Short load constant 100
   0d69: EQUI             Integer TOS-1 = TOS
   0d6a: FJP  $0d82       Jump if TOS false
   0d6c: SLDL 08          Short load local MP8
   0d6d: INC  000c        Inc field ptr (TOS+12)
   0d6f: SLDC 07          Short load constant 7
   0d70: SLDC 09          Short load constant 9
   0d71: LDP              Load packed field (TOS)
   0d72: SLDC 64          Short load constant 100
   0d73: EQUI             Integer TOS-1 = TOS
   0d74: FJP  $0d80       Jump if TOS false
   0d76: SLDL 08          Short load local MP8
   0d77: INC  000c        Inc field ptr (TOS+12)
   0d79: LDA  02 0012     Load addr G18
   0d7c: MOV  0001        Move 1 words (TOS to TOS-1)
   0d7e: UJP  $0d80       Unconditional jump
-> 0d80: UJP  $0da5       Unconditional jump
-> 0d82: SLDL 07          Short load local MP7
   0d83: IND  000f        Static index and load word (TOS+15)
   0d85: LDA  02 0012     Load addr G18
   0d88: SLDC 04          Short load constant 4
   0d89: SLDC 00          Short load constant 0
   0d8a: LDP              Load packed field (TOS)
   0d8b: SLDC 00          Short load constant 0
   0d8c: NEQI             Integer TOS-1 <> TOS
   0d8d: LAND             Logical AND (TOS & TOS-1)
   0d8e: FJP  $0d9a       Jump if TOS false
   0d90: SLDL 08          Short load local MP8
   0d91: INC  000c        Inc field ptr (TOS+12)
   0d93: LDA  02 0012     Load addr G18
   0d96: MOV  0001        Move 1 words (TOS to TOS-1)
   0d98: UJP  $0da5       Unconditional jump
-> 0d9a: SLDL 08          Short load local MP8
   0d9b: INC  000c        Inc field ptr (TOS+12)
   0d9d: SLDL 05          Short load local MP5
   0d9e: SLDL 04          Short load local MP4
   0d9f: IXA  000d        Index array (TOS-1 + TOS * 13)
   0da1: INC  000c        Inc field ptr (TOS+12)
   0da3: MOV  0001        Move 1 words (TOS to TOS-1)
-> 0da5: SLDL 08          Short load local MP8
   0da6: INC  0001        Inc field ptr (TOS+1)
   0da8: SLDL 08          Short load local MP8
   0da9: SIND 00          Short index load *TOS+0
   0daa: SLDL 07          Short load local MP7
   0dab: IND  000c        Static index and load word (TOS+12)
   0dad: ADI              Add integers (TOS + TOS-1)
   0dae: STO              Store indirect (TOS into TOS-1)
   0daf: SLDL 07          Short load local MP7
   0db0: IND  001d        Static index and load word (TOS+29)
   0db2: FJP  $0dbb       Jump if TOS false
   0db4: SLDL 08          Short load local MP8
   0db5: INC  000b        Inc field ptr (TOS+11)
   0db7: SLDL 07          Short load local MP7
   0db8: IND  001e        Static index and load word (TOS+30)
   0dba: STO              Store indirect (TOS into TOS-1)
-> 0dbb: SLDL 07          Short load local MP7
   0dbc: INC  0012        Inc field ptr (TOS+18)
   0dbe: SLDC 0c          Short load constant 12
   0dbf: SLDC 04          Short load constant 4
   0dc0: SLDC 00          Short load constant 0
   0dc1: STP              Store packed field (TOS into TOS-1)
   0dc2: SLDL 07          Short load local MP7
   0dc3: INC  000f        Inc field ptr (TOS+15)
   0dc5: SLDC 00          Short load constant 0
   0dc6: STO              Store indirect (TOS into TOS-1)
   0dc7: SLDL 05          Short load local MP5
   0dc8: SLDL 04          Short load local MP4
   0dc9: IXA  000d        Index array (TOS-1 + TOS * 13)
   0dcb: SLDL 07          Short load local MP7
   0dcc: INC  0010        Inc field ptr (TOS+16)
   0dce: MOV  000d        Move 13 words (TOS to TOS-1)
-> 0dd0: SLDL 07          Short load local MP7
   0dd1: SIND 07          Short index load *TOS+7
   0dd2: SLDL 05          Short load local MP5
   0dd3: CGP  0a          Call global procedure SYSIO.10
-> 0dd5: SLDL 01          Short load local MP1
   0dd6: SLDC 02          Short load constant 2
   0dd7: EQUI             Integer TOS-1 = TOS
   0dd8: FJP  $0def       Jump if TOS false
   0dda: SLDL 07          Short load local MP7
   0ddb: INC  0013        Inc field ptr (TOS+19)
   0ddd: SLDC 00          Short load constant 0
   0dde: LDB              Load byte at byte ptr TOS-1 + TOS
   0ddf: SLDC 00          Short load constant 0
   0de0: EQUI             Integer TOS-1 = TOS
   0de1: FJP  $0def       Jump if TOS false
   0de3: LDA  02 001f     Load addr G31
   0de6: SLDL 07          Short load local MP7
   0de7: SIND 07          Short index load *TOS+7
   0de8: IXA  0006        Index array (TOS-1 + TOS * 6)
   0dea: NOP              No operation
   0deb: LSA  00          Load string address: ''
   0ded: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0def: SLDL 07          Short load local MP7
   0df0: INC  0002        Inc field ptr (TOS+2)
   0df2: SLDC 01          Short load constant 1
   0df3: STO              Store indirect (TOS into TOS-1)
   0df4: SLDL 07          Short load local MP7
   0df5: INC  0001        Inc field ptr (TOS+1)
   0df7: SLDC 01          Short load constant 1
   0df8: STO              Store indirect (TOS into TOS-1)
   0df9: SLDL 07          Short load local MP7
   0dfa: INC  0005        Inc field ptr (TOS+5)
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
   04e5: LDA  02 001f     Load addr G31
   04e8: SLDL 06          Short load local MP6
   04e9: IXA  0006        Index array (TOS-1 + TOS * 6)
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
   0502: LDA  02 001f     Load addr G31
   0505: SLDL 06          Short load local MP6
   0506: IXA  0006        Index array (TOS-1 + TOS * 6)
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
   051d: IXA  000d        Index array (TOS-1 + TOS * 13)
   051f: INC  0003        Inc field ptr (TOS+3)
   0521: EQLSTR           String TOS-1 = TOS
   0523: FJP  $053a       Jump if TOS false
   0525: LLA  000a        Load local address MP10
   0527: LLA  0009        Load local address MP9
   0529: CSP  09          Call standard procedure TIME
   052b: SLDL 09          Short load local MP9
   052c: SLDL 0b          Short load local MP11
   052d: SIND 04          Short index load *TOS+4
   052e: SLDC 00          Short load constant 0
   052f: IXA  000d        Index array (TOS-1 + TOS * 13)
   0531: IND  0009        Static index and load word (TOS+9)
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
   0550: IXA  000d        Index array (TOS-1 + TOS * 13)
   0552: INC  0003        Inc field ptr (TOS+3)
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
-> 056b: LDA  02 001f     Load addr G31
   056e: SLDL 06          Short load local MP6
   056f: IXA  0006        Index array (TOS-1 + TOS * 6)
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
   0597: LDA  02 001f     Load addr G31
   059a: SLDL 06          Short load local MP6
   059b: IXA  0006        Index array (TOS-1 + TOS * 6)
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
   05c3: IXA  000d        Index array (TOS-1 + TOS * 13)
   05c5: INC  0009        Inc field ptr (TOS+9)
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
   0676: IXA  000d        Index array (TOS-1 + TOS * 13)
   0678: STL  0005        Store TOS into MP5
   067a: SLDL 05          Short load local MP5
   067b: IND  0008        Static index and load word (TOS+8)
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
   068b: IXA  000d        Index array (TOS-1 + TOS * 13)
   068d: SLDL 01          Short load local MP1
   068e: SLDL 04          Short load local MP4
   068f: IXA  000d        Index array (TOS-1 + TOS * 13)
   0691: MOV  000d        Move 13 words (TOS to TOS-1)
   0693: SLDL 04          Short load local MP4
   0694: SLDC 01          Short load constant 1
   0695: SBI              Subtract integers (TOS-1 - TOS)
   0696: STL  0004        Store TOS into MP4
   0698: UJP  $0682       Unconditional jump
-> 069a: SLDL 01          Short load local MP1
   069b: SLDL 02          Short load local MP2
   069c: IXA  000d        Index array (TOS-1 + TOS * 13)
   069e: SLDL 03          Short load local MP3
   069f: MOV  000d        Move 13 words (TOS to TOS-1)
   06a1: SLDL 05          Short load local MP5
   06a2: INC  0008        Inc field ptr (TOS+8)
   06a4: SLDL 05          Short load local MP5
   06a5: IND  0008        Static index and load word (TOS+8)
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
   062a: IXA  000d        Index array (TOS-1 + TOS * 13)
   062c: STL  0004        Store TOS into MP4
   062e: SLDL 02          Short load local MP2
   062f: STL  0003        Store TOS into MP3
   0631: SLDL 04          Short load local MP4
   0632: IND  0008        Static index and load word (TOS+8)
   0634: SLDC 01          Short load constant 1
   0635: SBI              Subtract integers (TOS-1 - TOS)
   0636: STL  0005        Store TOS into MP5
-> 0638: SLDL 03          Short load local MP3
   0639: SLDL 05          Short load local MP5
   063a: LEQI             Integer TOS-1 <= TOS
   063b: FJP  $0650       Jump if TOS false
   063d: SLDL 01          Short load local MP1
   063e: SLDL 03          Short load local MP3
   063f: IXA  000d        Index array (TOS-1 + TOS * 13)
   0641: SLDL 01          Short load local MP1
   0642: SLDL 03          Short load local MP3
   0643: SLDC 01          Short load constant 1
   0644: ADI              Add integers (TOS + TOS-1)
   0645: IXA  000d        Index array (TOS-1 + TOS * 13)
   0647: MOV  000d        Move 13 words (TOS to TOS-1)
   0649: SLDL 03          Short load local MP3
   064a: SLDC 01          Short load constant 1
   064b: ADI              Add integers (TOS + TOS-1)
   064c: STL  0003        Store TOS into MP3
   064e: UJP  $0638       Unconditional jump
-> 0650: SLDL 01          Short load local MP1
   0651: SLDL 04          Short load local MP4
   0652: IND  0008        Static index and load word (TOS+8)
   0654: IXA  000d        Index array (TOS-1 + TOS * 13)
   0656: INC  0003        Inc field ptr (TOS+3)
   0658: NOP              No operation
   0659: LSA  00          Load string address: ''
   065b: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   065d: SLDL 04          Short load local MP4
   065e: INC  0008        Inc field ptr (TOS+8)
   0660: SLDL 04          Short load local MP4
   0661: IND  0008        Static index and load word (TOS+8)
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
   0260: LDA  02 001f     Load addr G31
   0263: SLDL 03          Short load local MP3
   0264: IXA  0006        Index array (TOS-1 + TOS * 6)
   0266: STL  0008        Store TOS into MP8
   0268: SLDL 07          Short load local MP7
   0269: SIND 04          Short index load *TOS+4
   026a: LDCN             Load constant NIL
   026b: EQUI             Integer TOS-1 = TOS
   026c: FJP  $0276       Jump if TOS false
   026e: SLDL 07          Short load local MP7
   026f: INC  0004        Inc field ptr (TOS+4)
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
   028d: IXA  000d        Index array (TOS-1 + TOS * 13)
   028f: STL  0009        Store TOS into MP9
   0291: SLDC 00          Short load constant 0
   0292: STL  0005        Store TOS into MP5
   0294: SLDL 09          Short load local MP9
   0295: SIND 00          Short index load *TOS+0
   0296: SLDC 00          Short load constant 0
   0297: EQUI             Integer TOS-1 = TOS
   0298: SLDL 07          Short load local MP7
   0299: INC  001d        Inc field ptr (TOS+29)
   029b: SLDC 02          Short load constant 2
   029c: SLDC 07          Short load constant 7
   029d: LDP              Load packed field (TOS)
   029e: SLDC 02          Short load constant 2
   029f: EQUI             Integer TOS-1 = TOS
   02a0: SLDL 07          Short load local MP7
   02a1: INC  001d        Inc field ptr (TOS+29)
   02a3: SLDC 02          Short load constant 2
   02a4: SLDC 07          Short load constant 7
   02a5: LDP              Load packed field (TOS)
   02a6: SLDC 01          Short load constant 1
   02a7: EQUI             Integer TOS-1 = TOS
   02a8: SLDL 07          Short load local MP7
   02a9: INC  001d        Inc field ptr (TOS+29)
   02ab: SLDC 02          Short load constant 2
   02ac: SLDC 07          Short load constant 7
   02ad: LDP              Load packed field (TOS)
   02ae: SLDC 03          Short load constant 3
   02af: EQUI             Integer TOS-1 = TOS
   02b0: LOR              Logical OR (TOS | TOS-1)
   02b1: SLDL 09          Short load local MP9
   02b2: INC  0002        Inc field ptr (TOS+2)
   02b4: SLDC 04          Short load constant 4
   02b5: SLDC 00          Short load constant 0
   02b6: LDP              Load packed field (TOS)
   02b7: SLDC 08          Short load constant 8
   02b8: EQUI             Integer TOS-1 = TOS
   02b9: LAND             Logical AND (TOS & TOS-1)
   02ba: LOR              Logical OR (TOS | TOS-1)
   02bb: SLDL 07          Short load local MP7
   02bc: INC  001d        Inc field ptr (TOS+29)
   02be: SLDC 02          Short load constant 2
   02bf: SLDC 07          Short load constant 7
   02c0: LDP              Load packed field (TOS)
   02c1: SLDC 00          Short load constant 0
   02c2: EQUI             Integer TOS-1 = TOS
   02c3: SLDL 09          Short load local MP9
   02c4: INC  0002        Inc field ptr (TOS+2)
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
   02d1: INC  0003        Inc field ptr (TOS+3)
   02d3: SLDC 00          Short load constant 0
   02d4: LDB              Load byte at byte ptr TOS-1 + TOS
   02d5: SLDC 00          Short load constant 0
   02d6: GRTI             Integer TOS-1 > TOS
   02d7: SLDL 09          Short load local MP9
   02d8: INC  0003        Inc field ptr (TOS+3)
   02da: SLDC 00          Short load constant 0
   02db: LDB              Load byte at byte ptr TOS-1 + TOS
   02dc: SLDC 07          Short load constant 7
   02dd: LEQI             Integer TOS-1 <= TOS
   02de: LAND             Logical AND (TOS & TOS-1)
   02df: SLDL 09          Short load local MP9
   02e0: IND  0008        Static index and load word (TOS+8)
   02e2: SLDC 00          Short load constant 0
   02e3: GEQI             Integer TOS-1 >= TOS
   02e4: LAND             Logical AND (TOS & TOS-1)
   02e5: SLDL 09          Short load local MP9
   02e6: IND  0008        Static index and load word (TOS+8)
   02e8: SLDC 4d          Short load constant 77
   02e9: LEQI             Integer TOS-1 <= TOS
   02ea: LAND             Logical AND (TOS & TOS-1)
   02eb: FJP  $0361       Jump if TOS false
   02ed: SLDC 01          Short load constant 1
   02ee: STL  0005        Store TOS into MP5
   02f0: SLDL 09          Short load local MP9
   02f1: INC  0003        Inc field ptr (TOS+3)
   02f3: SLDL 08          Short load local MP8
   02f4: NEQSTR           String TOS-1 <> TOS
   02f6: FJP  $0361       Jump if TOS false
   02f8: SLDC 01          Short load constant 1
   02f9: STL  0004        Store TOS into MP4
-> 02fb: SLDL 04          Short load local MP4
   02fc: SLDL 09          Short load local MP9
   02fd: IND  0008        Static index and load word (TOS+8)
   02ff: LEQI             Integer TOS-1 <= TOS
   0300: FJP  $0348       Jump if TOS false
   0302: SLDL 07          Short load local MP7
   0303: SIND 04          Short index load *TOS+4
   0304: SLDL 04          Short load local MP4
   0305: IXA  000d        Index array (TOS-1 + TOS * 13)
   0307: STL  000a        Store TOS into MP10
   0309: SLDL 0a          Short load local MP10
   030a: INC  0003        Inc field ptr (TOS+3)
   030c: SLDC 00          Short load constant 0
   030d: LDB              Load byte at byte ptr TOS-1 + TOS
   030e: SLDC 00          Short load constant 0
   030f: LEQI             Integer TOS-1 <= TOS
   0310: SLDL 0a          Short load local MP10
   0311: INC  0003        Inc field ptr (TOS+3)
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
   031f: IND  000b        Static index and load word (TOS+11)
   0321: LDCI 0200        Load word 512
   0324: GRTI             Integer TOS-1 > TOS
   0325: LOR              Logical OR (TOS | TOS-1)
   0326: SLDL 0a          Short load local MP10
   0327: IND  000b        Static index and load word (TOS+11)
   0329: SLDC 00          Short load constant 0
   032a: LEQI             Integer TOS-1 <= TOS
   032b: LOR              Logical OR (TOS | TOS-1)
   032c: SLDL 0a          Short load local MP10
   032d: INC  000c        Inc field ptr (TOS+12)
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
   0351: IND  0008        Static index and load word (TOS+8)
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
   0366: INC  0003        Inc field ptr (TOS+3)
   0368: SAS  07          String assign (TOS to TOS-1, 7 chars)
   036a: SLDL 08          Short load local MP8
   036b: INC  0005        Inc field ptr (TOS+5)
   036d: SLDL 09          Short load local MP9
   036e: SIND 07          Short index load *TOS+7
   036f: STO              Store indirect (TOS into TOS-1)
   0370: LLA  0006        Load local address MP6
   0372: SLDL 09          Short load local MP9
   0373: INC  0009        Inc field ptr (TOS+9)
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
   0385: INC  0005        Inc field ptr (TOS+5)
   0387: LDCI 7fff        Load word 32767
   038a: STO              Store indirect (TOS into TOS-1)
   038b: SLDL 07          Short load local MP7
   038c: INC  0004        Inc field ptr (TOS+4)
   038e: CSP  21          Call standard procedure RELEASE
   0390: SLDL 07          Short load local MP7
   0391: INC  0004        Inc field ptr (TOS+4)
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
-> 03a8: LDA  02 001f     Load addr G31
   03ab: SLDL 02          Short load local MP2
   03ac: IXA  0006        Index array (TOS-1 + TOS * 6)
   03ae: STL  0013        Store TOS into MP19
   03b0: SLDL 01          Short load local MP1
   03b1: SLDC 00          Short load constant 0
   03b2: IXA  000d        Index array (TOS-1 + TOS * 13)
   03b4: STL  0014        Store TOS into MP20
   03b6: LDL  0013        Load local word MP19
   03b8: LDL  0014        Load local word MP20
   03ba: INC  0003        Inc field ptr (TOS+3)
   03bc: EQLSTR           String TOS-1 = TOS
   03be: LDL  0014        Load local word MP20
   03c0: INC  0002        Inc field ptr (TOS+2)
   03c2: SLDC 04          Short load constant 4
   03c3: SLDC 00          Short load constant 0
   03c4: LDP              Load packed field (TOS)
   03c5: SLDC 00          Short load constant 0
   03c6: EQUI             Integer TOS-1 = TOS
   03c7: LDL  0014        Load local word MP20
   03c9: INC  0002        Inc field ptr (TOS+2)
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
   03e0: IND  0009        Static index and load word (TOS+9)
   03e2: SBI              Subtract integers (TOS-1 - TOS)
   03e3: LDCI 012c        Load word 300
   03e6: LEQI             Integer TOS-1 <= TOS
   03e7: SLDL 03          Short load local MP3
   03e8: LDL  0014        Load local word MP20
   03ea: IND  0009        Static index and load word (TOS+9)
   03ec: SBI              Subtract integers (TOS-1 - TOS)
   03ed: SLDC 00          Short load constant 0
   03ee: GEQI             Integer TOS-1 >= TOS
   03ef: LAND             Logical AND (TOS & TOS-1)
   03f0: LOD  02 0001     Load word at G1 (SYSCOM)
   03f3: INC  001d        Inc field ptr (TOS+29)
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
   0410: INC  0003        Inc field ptr (TOS+3)
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
   0424: IND  0008        Static index and load word (TOS+8)
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
   0440: IND  0008        Static index and load word (TOS+8)
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
   0451: INC  0009        Inc field ptr (TOS+9)
   0453: CSP  09          Call standard procedure TIME
-> 0455: SLDL 05          Short load local MP5
   0456: LNOT             Logical NOT (~TOS)
   0457: FJP  $0468       Jump if TOS false
   0459: LDL  0013        Load local word MP19
   045b: LSA  00          Load string address: ''
   045d: NOP              No operation
   045e: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0460: LDL  0013        Load local word MP19
   0462: INC  0005        Inc field ptr (TOS+5)
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
   006c: LDA  02 000e     Load addr G14
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
   05e8: IXA  000d        Index array (TOS-1 + TOS * 13)
   05ea: IND  0008        Static index and load word (TOS+8)
   05ec: LEQI             Integer TOS-1 <= TOS
   05ed: SLDL 07          Short load local MP7
   05ee: LNOT             Logical NOT (~TOS)
   05ef: LAND             Logical AND (TOS & TOS-1)
   05f0: FJP  $061a       Jump if TOS false
   05f2: SLDL 03          Short load local MP3
   05f3: SLDL 06          Short load local MP6
   05f4: IXA  000d        Index array (TOS-1 + TOS * 13)
   05f6: STL  0008        Store TOS into MP8
   05f8: SLDL 08          Short load local MP8
   05f9: INC  0003        Inc field ptr (TOS+3)
   05fb: SLDL 05          Short load local MP5
   05fc: EQLSTR           String TOS-1 = TOS
   05fe: FJP  $0613       Jump if TOS false
   0600: SLDL 04          Short load local MP4
   0601: SLDL 08          Short load local MP8
   0602: INC  000c        Inc field ptr (TOS+12)
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
   0718: INC  000e        Inc field ptr (TOS+14)
   071a: SLDC 00          Short load constant 0
   071b: STO              Store indirect (TOS into TOS-1)
   071c: SLDL 03          Short load local MP3
   071d: INC  0001        Inc field ptr (TOS+1)
   071f: SLDC 00          Short load constant 0
   0720: STO              Store indirect (TOS into TOS-1)
   0721: SLDL 03          Short load local MP3
   0722: INC  0002        Inc field ptr (TOS+2)
   0724: SLDC 00          Short load constant 0
   0725: STO              Store indirect (TOS into TOS-1)
   0726: SLDL 03          Short load local MP3
   0727: SIND 06          Short index load *TOS+6
   0728: FJP  $07f6       Jump if TOS false
   072a: SLDL 03          Short load local MP3
   072b: IND  000d        Static index and load word (TOS+13)
   072d: SLDL 03          Short load local MP3
   072e: IND  000c        Static index and load word (TOS+12)
   0730: GRTI             Integer TOS-1 > TOS
   0731: STL  0002        Store TOS into MP2
   0733: SLDL 02          Short load local MP2
   0734: FJP  $073d       Jump if TOS false
   0736: SLDL 03          Short load local MP3
   0737: INC  000c        Inc field ptr (TOS+12)
   0739: SLDL 03          Short load local MP3
   073a: IND  000d        Static index and load word (TOS+13)
   073c: STO              Store indirect (TOS into TOS-1)
-> 073d: SLDL 03          Short load local MP3
   073e: IND  001d        Static index and load word (TOS+29)
   0740: FJP  $07de       Jump if TOS false
   0742: SLDL 02          Short load local MP2
   0743: FJP  $074e       Jump if TOS false
   0745: SLDL 03          Short load local MP3
   0746: INC  001e        Inc field ptr (TOS+30)
   0748: SLDL 03          Short load local MP3
   0749: IND  001f        Static index and load word (TOS+31)
   074b: STO              Store indirect (TOS into TOS-1)
   074c: UJP  $076a       Unconditional jump
-> 074e: SLDL 03          Short load local MP3
   074f: IND  000d        Static index and load word (TOS+13)
   0751: SLDL 03          Short load local MP3
   0752: IND  000c        Static index and load word (TOS+12)
   0754: EQUI             Integer TOS-1 = TOS
   0755: FJP  $076a       Jump if TOS false
   0757: SLDL 03          Short load local MP3
   0758: IND  001f        Static index and load word (TOS+31)
   075a: SLDL 03          Short load local MP3
   075b: IND  001e        Static index and load word (TOS+30)
   075d: GEQI             Integer TOS-1 >= TOS
   075e: FJP  $076a       Jump if TOS false
   0760: SLDC 01          Short load constant 1
   0761: STL  0002        Store TOS into MP2
   0763: SLDL 03          Short load local MP3
   0764: INC  001e        Inc field ptr (TOS+30)
   0766: SLDL 03          Short load local MP3
   0767: IND  001f        Static index and load word (TOS+31)
   0769: STO              Store indirect (TOS into TOS-1)
-> 076a: SLDL 03          Short load local MP3
   076b: IND  0020        Static index and load word (TOS+32)
   076d: FJP  $07d7       Jump if TOS false
   076f: SLDL 03          Short load local MP3
   0770: INC  0020        Inc field ptr (TOS+32)
   0772: SLDC 00          Short load constant 0
   0773: STO              Store indirect (TOS into TOS-1)
   0774: SLDL 03          Short load local MP3
   0775: INC  000f        Inc field ptr (TOS+15)
   0777: SLDC 01          Short load constant 1
   0778: STO              Store indirect (TOS into TOS-1)
   0779: SLDL 02          Short load local MP2
   077a: FJP  $078c       Jump if TOS false
   077c: SLDL 03          Short load local MP3
   077d: INC  0021        Inc field ptr (TOS+33)
   077f: SLDL 03          Short load local MP3
   0780: IND  001f        Static index and load word (TOS+31)
   0782: LDCI 0200        Load word 512
   0785: SLDL 03          Short load local MP3
   0786: IND  001f        Static index and load word (TOS+31)
   0788: SBI              Subtract integers (TOS-1 - TOS)
   0789: SLDC 00          Short load constant 0
   078a: CSP  0a          Call standard procedure FLCH
-> 078c: SLDL 03          Short load local MP3
   078d: SIND 07          Short index load *TOS+7
   078e: SLDL 03          Short load local MP3
   078f: INC  0021        Inc field ptr (TOS+33)
   0791: SLDC 00          Short load constant 0
   0792: LDCI 0200        Load word 512
   0795: SLDL 03          Short load local MP3
   0796: IND  0010        Static index and load word (TOS+16)
   0798: SLDL 03          Short load local MP3
   0799: IND  000d        Static index and load word (TOS+13)
   079b: ADI              Add integers (TOS + TOS-1)
   079c: SLDC 01          Short load constant 1
   079d: SBI              Subtract integers (TOS-1 - TOS)
   079e: SLDC 00          Short load constant 0
   079f: CSP  06          Call standard procedure UNITWRITE
   07a1: SLDL 02          Short load local MP2
   07a2: SLDL 03          Short load local MP3
   07a3: INC  0012        Inc field ptr (TOS+18)
   07a5: SLDC 04          Short load constant 4
   07a6: SLDC 00          Short load constant 0
   07a7: LDP              Load packed field (TOS)
   07a8: SLDC 03          Short load constant 3
   07a9: EQUI             Integer TOS-1 = TOS
   07aa: LAND             Logical AND (TOS & TOS-1)
   07ab: SLDL 03          Short load local MP3
   07ac: IND  000d        Static index and load word (TOS+13)
   07ae: LAND             Logical AND (TOS & TOS-1)
   07af: FJP  $07d7       Jump if TOS false
   07b1: SLDL 03          Short load local MP3
   07b2: INC  000c        Inc field ptr (TOS+12)
   07b4: SLDL 03          Short load local MP3
   07b5: IND  000c        Static index and load word (TOS+12)
   07b7: SLDC 01          Short load constant 1
   07b8: ADI              Add integers (TOS + TOS-1)
   07b9: STO              Store indirect (TOS into TOS-1)
   07ba: SLDL 03          Short load local MP3
   07bb: INC  0021        Inc field ptr (TOS+33)
   07bd: SLDC 00          Short load constant 0
   07be: LDCI 0200        Load word 512
   07c1: SLDC 00          Short load constant 0
   07c2: CSP  0a          Call standard procedure FLCH
   07c4: SLDL 03          Short load local MP3
   07c5: SIND 07          Short index load *TOS+7
   07c6: SLDL 03          Short load local MP3
   07c7: INC  0021        Inc field ptr (TOS+33)
   07c9: SLDC 00          Short load constant 0
   07ca: LDCI 0200        Load word 512
   07cd: SLDL 03          Short load local MP3
   07ce: IND  0010        Static index and load word (TOS+16)
   07d0: SLDL 03          Short load local MP3
   07d1: IND  000d        Static index and load word (TOS+13)
   07d3: ADI              Add integers (TOS + TOS-1)
   07d4: SLDC 00          Short load constant 0
   07d5: CSP  06          Call standard procedure UNITWRITE
-> 07d7: SLDL 03          Short load local MP3
   07d8: INC  001f        Inc field ptr (TOS+31)
   07da: LDCI 0200        Load word 512
   07dd: STO              Store indirect (TOS into TOS-1)
-> 07de: SLDL 03          Short load local MP3
   07df: INC  000d        Inc field ptr (TOS+13)
   07e1: SLDC 00          Short load constant 0
   07e2: STO              Store indirect (TOS into TOS-1)
   07e3: SLDL 03          Short load local MP3
   07e4: IND  001d        Static index and load word (TOS+29)
   07e6: SLDL 03          Short load local MP3
   07e7: INC  0012        Inc field ptr (TOS+18)
   07e9: SLDC 04          Short load constant 4
   07ea: SLDC 00          Short load constant 0
   07eb: LDP              Load packed field (TOS)
   07ec: SLDC 03          Short load constant 3
   07ed: EQUI             Integer TOS-1 = TOS
   07ee: LAND             Logical AND (TOS & TOS-1)
   07ef: FJP  $07f6       Jump if TOS false
   07f1: SLDL 03          Short load local MP3
   07f2: INC  000d        Inc field ptr (TOS+13)
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
   087b: IXA  000d        Index array (TOS-1 + TOS * 13)
   087d: IND  0008        Static index and load word (TOS+8)
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
   08a2: IXA  000d        Index array (TOS-1 + TOS * 13)
   08a4: SIND 01          Short index load *TOS+1
   08a5: SLDL 03          Short load local MP3
   08a6: SLDL 0a          Short load local MP10
   08a7: IXA  000d        Index array (TOS-1 + TOS * 13)
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
   08b8: IXA  000d        Index array (TOS-1 + TOS * 13)
   08ba: SIND 01          Short index load *TOS+1
   08bb: SLDL 03          Short load local MP3
   08bc: SLDC 00          Short load constant 0
   08bd: IXA  000d        Index array (TOS-1 + TOS * 13)
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
   08e7: IXA  000d        Index array (TOS-1 + TOS * 13)
   08e9: SIND 00          Short index load *TOS+0
   08ea: SLDL 03          Short load local MP3
   08eb: SLDL 0a          Short load local MP10
   08ec: SLDC 01          Short load constant 1
   08ed: SBI              Subtract integers (TOS-1 - TOS)
   08ee: IXA  000d        Index array (TOS-1 + TOS * 13)
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
   090a: IXA  000d        Index array (TOS-1 + TOS * 13)
   090c: SIND 07          Short index load *TOS+7
   090d: SLDL 03          Short load local MP3
   090e: SLDL 09          Short load local MP9
   090f: IXA  000d        Index array (TOS-1 + TOS * 13)
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
   092d: IXA  000d        Index array (TOS-1 + TOS * 13)
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

