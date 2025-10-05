#  SYSTEM.PASCAL-01-00.bin 

## Segment Table
| slot |segNum | name | block | length | kind | textAddr | mType | version |
|-----:|------:|------|------:|-------:|------|---------:|-------|--------:|
| 0 | 0 | PASCALSY | 0001 | 3576 | linked | 0000 | 0 | 0 |
| 15 | 15 |  | 0008 | 4696 | linked | 0000 | 0 | 0 |
| 1 | 1 | USERPROG | 0012 | 56 | linked | 0000 | 0 | 0 |
| 2 | 2 | DEBUGGER | 0013 | 62 | linked | 0000 | 0 | 0 |
| 3 | 3 | PRINTERR | 0014 | 1034 | linked | 0000 | 0 | 0 |
| 4 | 4 | INITIALI | 0017 | 2990 | linked | 0000 | 0 | 0 |
| 5 | 5 | GETCMD | 001D | 3182 | linked | 0000 | 0 | 0 |

intrinsics: []

comment: (c) Regents of the University of California, UCSD, 1979

## Globals

G1
G2
G3
G8
G9
G10
G11
G12
G13
G14
G15
G16
G17
G18
G22
G26
G30
G38
G46
G54
G55
G56
G57
G58
G59
G63
G67
G68
G69
G70
G111
G116
G122
G126
G204
G264
G266
G268

## Segment PASCALSY (0)

### PROCEDURE PASCALSY.PASCALSY (* P=1 LL=-1 *)
  G54
BEGIN
-> 0000: LDCN             Load constant NIL
   0001: STL  0036        Store TOS into MP54
   0003: CXP  04 01       Call external procedure INITIALI.INITIALIZE
-> 0006: CBP  2b          Call base procedure PASCALSY.43
   0008: LDL  0036        Load local word MP54
   000a: LDCN             Load constant NIL
   000b: NEQI             Integer TOS-1 <> TOS
   000c: FJP  $0011       Jump if TOS false
   000e: CXP  04 01       Call external procedure INITIALI.INITIALIZE
-> 0011: LDL  0036        Load local word MP54
   0013: LDCN             Load constant NIL
   0014: EQUI             Integer TOS-1 = TOS
   0015: FJP  $0006       Jump if TOS false
-> 0017: XIT              Exit the operating system
END

### PROCEDURE PASCALSY.EXECERROR (* P=2 LL=0 *)
  BASE1
BEGIN
-> 0024: LOD  01 0001     Load word at G1 (SYSCOM)
   0027: SRO  0001        Store global word BASE1
   0029: SLDO 01          Short load global BASE1
   002a: SIND 01          Short index load *TOS+1
   002b: SLDC 04          Short load constant 4
   002c: EQUI             Integer TOS-1 = TOS
   002d: FJP  $0059       Jump if TOS false
   002f: LDA  01 0036     Load addr G54
   0032: CSP  21          Call standard procedure RELEASE
   0034: LDA  01 0046     Load addr G70
   0037: LSA  0b          Load string address: '*STK OFLOW*'
   0044: NOP              No operation
   0045: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0047: SLDC 02          Short load constant 2
   0048: LDA  01 0046     Load addr G70
   004b: SLDC 01          Short load constant 1
   004c: LDA  01 0046     Load addr G70
   004f: SLDC 00          Short load constant 0
   0050: LDB              Load byte at byte ptr TOS-1 + TOS
   0051: SLDC 00          Short load constant 0
   0052: SLDC 00          Short load constant 0
   0053: CSP  06          Call standard procedure UNITWRITE
   0055: SLDC 00          Short load constant 0
   0056: SLDC 2b          Short load constant 43
   0057: CSP  04          Call standard procedure EXIT
-> 0059: SLDO 01          Short load global BASE1
   005a: SIND 05          Short index load *TOS+5
   005b: INC  0004        Inc field ptr (TOS+4)
   005d: SLDO 01          Short load global BASE1
   005e: IND  000b        Static index and load word (TOS+11)
   0060: STO              Store indirect (TOS into TOS-1)
   0061: SLDO 01          Short load global BASE1
   0062: SIND 03          Short index load *TOS+3
   0063: SLDC 00          Short load constant 0
   0064: NEQI             Integer TOS-1 <> TOS
   0065: FJP  $0071       Jump if TOS false
   0067: CXP  02 01       Call external procedure DEBUGGER.1
   006a: SLDO 01          Short load global BASE1
   006b: INC  0001        Inc field ptr (TOS+1)
   006d: SLDC 00          Short load constant 0
   006e: STO              Store indirect (TOS into TOS-1)
   006f: UJP  $00d8       Unconditional jump
-> 0071: LDA  01 0002     Load addr G2 (INPUT)
   0074: SLDC 00          Short load constant 0
   0075: IXA  0001        Index array (TOS-1 + TOS * 1)
   0077: LOD  01 003a     Load word at G58
   007a: STO              Store indirect (TOS into TOS-1)
   007b: LDA  01 0002     Load addr G2 (INPUT)
   007e: SLDC 01          Short load constant 1
   007f: IXA  0001        Index array (TOS-1 + TOS * 1)
   0081: LOD  01 0039     Load word at G57
   0084: STO              Store indirect (TOS into TOS-1)
   0085: SLDO 01          Short load global BASE1
   0086: INC  000b        Inc field ptr (TOS+11)
   0088: CSP  22          Call standard procedure IORESULT
   008a: STO              Store indirect (TOS into TOS-1)
   008b: LOD  01 0038     Load word at G56
   008e: CBP  16          Call base procedure PASCALSY.FWRITELN
   0090: CSP  28          Call standard procedure MEMAVAIL
   0092: LDCI 07ec        Load word 2028
   0095: SLDC 32          Short load constant 50
   0096: ADI              Add integers (TOS + TOS-1)
   0097: LEQI             Integer TOS-1 <= TOS
   0098: FJP  $009e       Jump if TOS false
   009a: CLP  2d          Call local procedure PASCALSY.45
   009c: UJP  $00c5       Unconditional jump
-> 009e: SLDO 01          Short load global BASE1
   009f: SIND 02          Short index load *TOS+2
   00a0: SLDC 00          Short load constant 0
   00a1: SLDC 00          Short load constant 0
   00a2: CBP  2a          Call base procedure PASCALSY.42
   00a4: LNOT             Logical NOT (~TOS)
   00a5: FJP  $00ab       Jump if TOS false
   00a7: CLP  2d          Call local procedure PASCALSY.45
   00a9: UJP  $00c5       Unconditional jump
-> 00ab: SLDO 01          Short load global BASE1
   00ac: SIND 04          Short index load *TOS+4
   00ad: SLDC 00          Short load constant 0
   00ae: IXA  000d        Index array (TOS-1 + TOS * 13)
   00b0: INC  0003        Inc field ptr (TOS+3)
   00b2: LDA  01 003f     Load addr G63
   00b5: NEQSTR           String TOS-1 <> TOS
   00b7: FJP  $00bd       Jump if TOS false
   00b9: CLP  2d          Call local procedure PASCALSY.45
   00bb: UJP  $00c5       Unconditional jump
-> 00bd: SLDO 01          Short load global BASE1
   00be: SIND 01          Short index load *TOS+1
   00bf: SLDO 01          Short load global BASE1
   00c0: IND  000b        Static index and load word (TOS+11)
   00c2: CXP  03 01       Call external procedure PRINTERR.PRINTERROR
-> 00c5: CLP  2c          Call local procedure PASCALSY.44
   00c7: SLDC 01          Short load constant 1
   00c8: SLDC 00          Short load constant 0
   00c9: SLDC 00          Short load constant 0
   00ca: CBP  28          Call base procedure PASCALSY.40
   00cc: LNOT             Logical NOT (~TOS)
   00cd: FJP  $00d8       Jump if TOS false
   00cf: LDA  01 0036     Load addr G54
   00d2: CSP  21          Call standard procedure RELEASE
   00d4: SLDC 00          Short load constant 0
   00d5: SLDC 2b          Short load constant 43
   00d6: CSP  04          Call standard procedure EXIT
-> 00d8: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FINIT(PARAM1; PARAM2; PARAM3) (* P=3 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 00e4: SLDO 03          Short load global BASE3
   00e5: SRO  0004        Store global word BASE4
   00e7: SLDO 04          Short load global BASE4
   00e8: INC  0003        Inc field ptr (TOS+3)
   00ea: SLDC 00          Short load constant 0
   00eb: STO              Store indirect (TOS into TOS-1)
   00ec: SLDO 04          Short load global BASE4
   00ed: INC  0005        Inc field ptr (TOS+5)
   00ef: SLDC 00          Short load constant 0
   00f0: STO              Store indirect (TOS into TOS-1)
   00f1: SLDO 04          Short load global BASE4
   00f2: INC  0002        Inc field ptr (TOS+2)
   00f4: SLDC 01          Short load constant 1
   00f5: STO              Store indirect (TOS into TOS-1)
   00f6: SLDO 04          Short load global BASE4
   00f7: INC  0001        Inc field ptr (TOS+1)
   00f9: SLDC 01          Short load constant 1
   00fa: STO              Store indirect (TOS into TOS-1)
   00fb: SLDO 04          Short load global BASE4
   00fc: SLDO 02          Short load global BASE2
   00fd: STO              Store indirect (TOS into TOS-1)
   00fe: SLDO 01          Short load global BASE1
   00ff: SLDC 00          Short load constant 0
   0100: EQUI             Integer TOS-1 = TOS
   0101: SLDO 01          Short load global BASE1
   0102: SLDC 02          Short load constant 2
   0103: NGI              Negate integer
   0104: EQUI             Integer TOS-1 = TOS
   0105: LOR              Logical OR (TOS | TOS-1)
   0106: FJP  $011e       Jump if TOS false
   0108: SLDO 04          Short load global BASE4
   0109: SIND 00          Short index load *TOS+0
   010a: SLDC 01          Short load constant 1
   010b: SLDC 00          Short load constant 0
   010c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   010d: SLDO 04          Short load global BASE4
   010e: INC  0004        Inc field ptr (TOS+4)
   0110: SLDC 01          Short load constant 1
   0111: STO              Store indirect (TOS into TOS-1)
   0112: SLDO 01          Short load global BASE1
   0113: SLDC 00          Short load constant 0
   0114: EQUI             Integer TOS-1 = TOS
   0115: FJP  $011c       Jump if TOS false
   0117: SLDO 04          Short load global BASE4
   0118: INC  0003        Inc field ptr (TOS+3)
   011a: SLDC 01          Short load constant 1
   011b: STO              Store indirect (TOS into TOS-1)
-> 011c: UJP  $0134       Unconditional jump
-> 011e: SLDO 01          Short load global BASE1
   011f: SLDC 00          Short load constant 0
   0120: LESI             Integer TOS-1 < TOS
   0121: FJP  $012d       Jump if TOS false
   0123: SLDO 04          Short load global BASE4
   0124: LDCN             Load constant NIL
   0125: STO              Store indirect (TOS into TOS-1)
   0126: SLDO 04          Short load global BASE4
   0127: INC  0004        Inc field ptr (TOS+4)
   0129: SLDC 00          Short load constant 0
   012a: STO              Store indirect (TOS into TOS-1)
   012b: UJP  $0134       Unconditional jump
-> 012d: SLDO 04          Short load global BASE4
   012e: INC  0004        Inc field ptr (TOS+4)
   0130: SLDO 01          Short load global BASE1
   0131: SLDO 01          Short load global BASE1
   0132: ADI              Add integers (TOS + TOS-1)
   0133: STO              Store indirect (TOS into TOS-1)
-> 0134: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FRESET(PARAM1) (* P=4 LL=0 *)
  BASE1=PARAM1
  BASE2
BEGIN
-> 0140: LOD  01 0001     Load word at G1 (SYSCOM)
   0143: SLDC 00          Short load constant 0
   0144: STO              Store indirect (TOS into TOS-1)
   0145: SLDO 01          Short load global BASE1
   0146: SRO  0002        Store global word BASE2
   0148: SLDO 02          Short load global BASE2
   0149: SIND 05          Short index load *TOS+5
   014a: FJP  $0165       Jump if TOS false
   014c: SLDO 01          Short load global BASE1
   014d: CBP  32          Call base procedure PASCALSY.50
   014f: SLDO 02          Short load global BASE2
   0150: SIND 04          Short index load *TOS+4
   0151: SLDC 00          Short load constant 0
   0152: GRTI             Integer TOS-1 > TOS
   0153: FJP  $0165       Jump if TOS false
   0155: SLDO 02          Short load global BASE2
   0156: SIND 03          Short index load *TOS+3
   0157: SLDC 00          Short load constant 0
   0158: EQUI             Integer TOS-1 = TOS
   0159: FJP  $0160       Jump if TOS false
   015b: SLDO 01          Short load global BASE1
   015c: CBP  07          Call base procedure PASCALSY.FGET
   015e: UJP  $0165       Unconditional jump
-> 0160: SLDO 02          Short load global BASE2
   0161: INC  0003        Inc field ptr (TOS+3)
   0163: SLDC 01          Short load constant 1
   0164: STO              Store indirect (TOS into TOS-1)
-> 0165: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FOPEN(PARAM1; PARAM2; PARAM3; PARAM4) (* P=5 LL=0 *)
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
  BASE6
  BASE7
  BASE8
  BASE9
  BASE10
  BASE11
  BASE12
  BASE13
  BASE14
  BASE18
  BASE26
  BASE27
  BASE28
  BASE29
BEGIN
-> 0172: LOD  01 0001     Load word at G1 (SYSCOM)
   0175: SLDC 00          Short load constant 0
   0176: STO              Store indirect (TOS into TOS-1)
   0177: SLDO 04          Short load global BASE4
   0178: SRO  001a        Store global word BASE26
   017a: LDO  001a        Load global word BASE26
   017c: SIND 05          Short index load *TOS+5
   017d: FJP  $0186       Jump if TOS false
   017f: LOD  01 0001     Load word at G1 (SYSCOM)
   0182: SLDC 0c          Short load constant 12
   0183: STO              Store indirect (TOS into TOS-1)
   0184: UJP  $0440       Unconditional jump
-> 0186: SLDO 03          Short load global BASE3
   0187: LAO  000e        Load global BASE14
   0189: LAO  0012        Load global BASE18
   018b: LAO  0009        Load global BASE9
   018d: LAO  000a        Load global BASE10
   018f: SLDC 00          Short load constant 0
   0190: SLDC 00          Short load constant 0
   0191: CBP  21          Call base procedure PASCALSY.33
   0193: FJP  $043b       Jump if TOS false
   0195: SLDO 02          Short load global BASE2
   0196: SLDC 01          Short load constant 1
   0197: GRTI             Integer TOS-1 > TOS
   0198: FJP  $01a3       Jump if TOS false
   019a: SLDO 02          Short load global BASE2
   019b: SLDC 02          Short load constant 2
   019c: EQUI             Integer TOS-1 = TOS
   019d: SLDO 02          Short load global BASE2
   019e: SLDC 04          Short load constant 4
   019f: EQUI             Integer TOS-1 = TOS
   01a0: LOR              Logical OR (TOS | TOS-1)
   01a1: SRO  0002        Store global word BASE2
-> 01a3: SLDC 00          Short load constant 0
   01a4: SRO  000c        Store global word BASE12
   01a6: LOD  01 0037     Load word at G55
   01a9: SRO  001b        Store global word BASE27
   01ab: LDO  001b        Load global word BASE27
   01ad: SIND 05          Short index load *TOS+5
   01ae: LOD  01 0001     Load word at G1 (SYSCOM)
   01b1: SIND 04          Short index load *TOS+4
   01b2: LDCN             Load constant NIL
   01b3: EQUI             Integer TOS-1 = TOS
   01b4: LAND             Logical AND (TOS & TOS-1)
   01b5: FJP  $020c       Jump if TOS false
   01b7: LAO  000b        Load global BASE11
   01b9: CSP  20          Call standard procedure MARK
   01bb: LOD  01 0001     Load word at G1 (SYSCOM)
   01be: SIND 07          Short index load *TOS+7
   01bf: SLDO 0b          Short load global BASE11
   01c0: SBI              Subtract integers (TOS-1 - TOS)
   01c1: SRO  0008        Store global word BASE8
   01c3: SLDO 08          Short load global BASE8
   01c4: SLDC 00          Short load constant 0
   01c5: GRTI             Integer TOS-1 > TOS
   01c6: SLDO 08          Short load global BASE8
   01c7: LDCI 07ec        Load word 2028
   01ca: LDCI 0190        Load word 400
   01cd: ADI              Add integers (TOS + TOS-1)
   01ce: LESI             Integer TOS-1 < TOS
   01cf: LAND             Logical AND (TOS & TOS-1)
   01d0: FJP  $020c       Jump if TOS false
   01d2: SLDO 0b          Short load global BASE11
   01d3: LOD  01 0036     Load word at G54
   01d6: SBI              Subtract integers (TOS-1 - TOS)
   01d7: SRO  0008        Store global word BASE8
   01d9: SLDO 08          Short load global BASE8
   01da: SLDC 00          Short load constant 0
   01db: GRTI             Integer TOS-1 > TOS
   01dc: SLDO 08          Short load global BASE8
   01dd: LDCI 07ec        Load word 2028
   01e0: GRTI             Integer TOS-1 > TOS
   01e1: LAND             Logical AND (TOS & TOS-1)
   01e2: LDA  01 007e     Load addr G126
   01e5: LDO  001b        Load global word BASE27
   01e7: SIND 07          Short index load *TOS+7
   01e8: IXA  0006        Index array (TOS-1 + TOS * 6)
   01ea: LDO  001b        Load global word BASE27
   01ec: INC  0008        Inc field ptr (TOS+8)
   01ee: EQLSTR           String TOS-1 = TOS
   01f0: LAND             Logical AND (TOS & TOS-1)
   01f1: FJP  $020c       Jump if TOS false
   01f3: LDO  001b        Load global word BASE27
   01f5: SIND 07          Short index load *TOS+7
   01f6: LOD  01 0036     Load word at G54
   01f9: SLDC 00          Short load constant 0
   01fa: LDCI 07ec        Load word 2028
   01fd: LDO  001b        Load global word BASE27
   01ff: IND  0010        Static index and load word (TOS+16)
   0201: SLDC 00          Short load constant 0
   0202: CSP  06          Call standard procedure UNITWRITE
   0204: LDA  01 0036     Load addr G54
   0207: CSP  21          Call standard procedure RELEASE
   0209: SLDC 01          Short load constant 1
   020a: SRO  000c        Store global word BASE12
-> 020c: LAO  000e        Load global BASE14
   020e: SLDC 01          Short load constant 1
   020f: LAO  0005        Load global BASE5
   0211: SLDC 00          Short load constant 0
   0212: SLDC 00          Short load constant 0
   0213: CBP  1e          Call base procedure PASCALSY.30
   0215: SRO  0006        Store global word BASE6
   0217: SLDO 06          Short load global BASE6
   0218: SLDC 00          Short load constant 0
   0219: EQUI             Integer TOS-1 = TOS
   021a: FJP  $0223       Jump if TOS false
   021c: LOD  01 0001     Load word at G1 (SYSCOM)
   021f: SLDC 09          Short load constant 9
   0220: STO              Store indirect (TOS into TOS-1)
   0221: UJP  $040d       Unconditional jump
-> 0223: LDA  01 007e     Load addr G126
   0226: SLDO 06          Short load global BASE6
   0227: IXA  0006        Index array (TOS-1 + TOS * 6)
   0229: SRO  001b        Store global word BASE27
   022b: LDO  001a        Load global word BASE26
   022d: INC  0005        Inc field ptr (TOS+5)
   022f: SLDC 01          Short load constant 1
   0230: STO              Store indirect (TOS into TOS-1)
   0231: LDO  001a        Load global word BASE26
   0233: INC  000f        Inc field ptr (TOS+15)
   0235: SLDC 00          Short load constant 0
   0236: STO              Store indirect (TOS into TOS-1)
   0237: LDO  001a        Load global word BASE26
   0239: INC  0007        Inc field ptr (TOS+7)
   023b: SLDO 06          Short load global BASE6
   023c: STO              Store indirect (TOS into TOS-1)
   023d: LDO  001a        Load global word BASE26
   023f: INC  0008        Inc field ptr (TOS+8)
   0241: LAO  000e        Load global BASE14
   0243: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0245: LDO  001a        Load global word BASE26
   0247: INC  000d        Inc field ptr (TOS+13)
   0249: SLDC 00          Short load constant 0
   024a: STO              Store indirect (TOS into TOS-1)
   024b: LDO  001a        Load global word BASE26
   024d: INC  0006        Inc field ptr (TOS+6)
   024f: LDO  001b        Load global word BASE27
   0251: SIND 04          Short index load *TOS+4
   0252: STO              Store indirect (TOS into TOS-1)
   0253: LDO  001a        Load global word BASE26
   0255: INC  001d        Inc field ptr (TOS+29)
   0257: LDO  001b        Load global word BASE27
   0259: SIND 04          Short index load *TOS+4
   025a: LDO  001a        Load global word BASE26
   025c: SIND 04          Short index load *TOS+4
   025d: SLDC 00          Short load constant 0
   025e: NEQI             Integer TOS-1 <> TOS
   025f: LAND             Logical AND (TOS & TOS-1)
   0260: STO              Store indirect (TOS into TOS-1)
   0261: SLDO 05          Short load global BASE5
   0262: LDCN             Load constant NIL
   0263: NEQI             Integer TOS-1 <> TOS
   0264: LAO  0012        Load global BASE18
   0266: SLDC 00          Short load constant 0
   0267: LDB              Load byte at byte ptr TOS-1 + TOS
   0268: SLDC 00          Short load constant 0
   0269: GRTI             Integer TOS-1 > TOS
   026a: LAND             Logical AND (TOS & TOS-1)
   026b: FJP  $030b       Jump if TOS false
   026d: LAO  0012        Load global BASE18
   026f: SLDO 02          Short load global BASE2
   0270: SLDO 05          Short load global BASE5
   0271: SLDC 00          Short load constant 0
   0272: SLDC 00          Short load constant 0
   0273: CBP  20          Call base procedure PASCALSY.32
   0275: SRO  0007        Store global word BASE7
   0277: SLDO 02          Short load global BASE2
   0278: FJP  $0294       Jump if TOS false
   027a: SLDO 07          Short load global BASE7
   027b: SLDC 00          Short load constant 0
   027c: EQUI             Integer TOS-1 = TOS
   027d: FJP  $0288       Jump if TOS false
   027f: LOD  01 0001     Load word at G1 (SYSCOM)
   0282: SLDC 0a          Short load constant 10
   0283: STO              Store indirect (TOS into TOS-1)
   0284: UJP  $03f3       Unconditional jump
   0286: UJP  $0292       Unconditional jump
-> 0288: LDO  001a        Load global word BASE26
   028a: INC  0010        Inc field ptr (TOS+16)
   028c: SLDO 05          Short load global BASE5
   028d: SLDO 07          Short load global BASE7
   028e: IXA  000d        Index array (TOS-1 + TOS * 13)
   0290: MOV  000d        Move 13 words (TOS to TOS-1)
-> 0292: UJP  $0309       Unconditional jump
-> 0294: SLDO 07          Short load global BASE7
   0295: SLDC 00          Short load constant 0
   0296: GRTI             Integer TOS-1 > TOS
   0297: FJP  $02a2       Jump if TOS false
   0299: LOD  01 0001     Load word at G1 (SYSCOM)
   029c: SLDC 0b          Short load constant 11
   029d: STO              Store indirect (TOS into TOS-1)
   029e: UJP  $03f3       Unconditional jump
   02a0: UJP  $0309       Unconditional jump
-> 02a2: SLDO 0a          Short load global BASE10
   02a3: SLDC 00          Short load constant 0
   02a4: EQUI             Integer TOS-1 = TOS
   02a5: FJP  $02aa       Jump if TOS false
   02a7: SLDC 05          Short load constant 5
   02a8: SRO  000a        Store global word BASE10
-> 02aa: LAO  0012        Load global BASE18
   02ac: SLDO 09          Short load global BASE9
   02ad: SLDO 0a          Short load global BASE10
   02ae: SLDO 05          Short load global BASE5
   02af: SLDC 00          Short load constant 0
   02b0: SLDC 00          Short load constant 0
   02b1: CBP  30          Call base procedure PASCALSY.48
   02b3: SRO  0007        Store global word BASE7
   02b5: SLDO 07          Short load global BASE7
   02b6: SLDC 00          Short load constant 0
   02b7: GRTI             Integer TOS-1 > TOS
   02b8: SLDO 0a          Short load global BASE10
   02b9: SLDC 03          Short load constant 3
   02ba: EQUI             Integer TOS-1 = TOS
   02bb: LAND             Logical AND (TOS & TOS-1)
   02bc: FJP  $02e9       Jump if TOS false
   02be: SLDO 05          Short load global BASE5
   02bf: SLDO 07          Short load global BASE7
   02c0: IXA  000d        Index array (TOS-1 + TOS * 13)
   02c2: SRO  001c        Store global word BASE28
   02c4: LDO  001c        Load global word BASE28
   02c6: SIND 01          Short index load *TOS+1
   02c7: LDO  001c        Load global word BASE28
   02c9: SIND 00          Short index load *TOS+0
   02ca: SBI              Subtract integers (TOS-1 - TOS)
   02cb: FJP  $02d7       Jump if TOS false
   02cd: LDO  001c        Load global word BASE28
   02cf: INC  0001        Inc field ptr (TOS+1)
   02d1: LDO  001c        Load global word BASE28
   02d3: SIND 01          Short index load *TOS+1
   02d4: SLDC 01          Short load constant 1
   02d5: SBI              Subtract integers (TOS-1 - TOS)
   02d6: STO              Store indirect (TOS into TOS-1)
-> 02d7: LDO  001c        Load global word BASE28
   02d9: SIND 01          Short index load *TOS+1
   02da: LDO  001c        Load global word BASE28
   02dc: SIND 00          Short index load *TOS+0
   02dd: SBI              Subtract integers (TOS-1 - TOS)
   02de: SLDC 04          Short load constant 4
   02df: LESI             Integer TOS-1 < TOS
   02e0: FJP  $02e9       Jump if TOS false
   02e2: SLDO 07          Short load global BASE7
   02e3: SLDO 05          Short load global BASE5
   02e4: CBP  22          Call base procedure PASCALSY.34
   02e6: SLDC 00          Short load constant 0
   02e7: SRO  0007        Store global word BASE7
-> 02e9: SLDO 07          Short load global BASE7
   02ea: SLDC 00          Short load constant 0
   02eb: EQUI             Integer TOS-1 = TOS
   02ec: FJP  $02f5       Jump if TOS false
   02ee: LOD  01 0001     Load word at G1 (SYSCOM)
   02f1: SLDC 08          Short load constant 8
   02f2: STO              Store indirect (TOS into TOS-1)
   02f3: UJP  $03f3       Unconditional jump
-> 02f5: LDO  001a        Load global word BASE26
   02f7: INC  0010        Inc field ptr (TOS+16)
   02f9: SLDO 05          Short load global BASE5
   02fa: SLDO 07          Short load global BASE7
   02fb: IXA  000d        Index array (TOS-1 + TOS * 13)
   02fd: MOV  000d        Move 13 words (TOS to TOS-1)
   02ff: LDO  001a        Load global word BASE26
   0301: INC  000f        Inc field ptr (TOS+15)
   0303: SLDC 01          Short load constant 1
   0304: STO              Store indirect (TOS into TOS-1)
   0305: SLDO 06          Short load global BASE6
   0306: SLDO 05          Short load global BASE5
   0307: CBP  1f          Call base procedure PASCALSY.31
-> 0309: UJP  $035b       Unconditional jump
-> 030b: LDO  001a        Load global word BASE26
   030d: INC  0010        Inc field ptr (TOS+16)
   030f: SRO  001c        Store global word BASE28
   0311: LDO  001c        Load global word BASE28
   0313: SLDC 00          Short load constant 0
   0314: STO              Store indirect (TOS into TOS-1)
   0315: LDO  001c        Load global word BASE28
   0317: INC  0001        Inc field ptr (TOS+1)
   0319: LDCI 7fff        Load word 32767
   031c: STO              Store indirect (TOS into TOS-1)
   031d: LDO  001b        Load global word BASE27
   031f: SIND 04          Short index load *TOS+4
   0320: FJP  $032a       Jump if TOS false
   0322: LDO  001c        Load global word BASE28
   0324: INC  0001        Inc field ptr (TOS+1)
   0326: LDO  001b        Load global word BASE27
   0328: SIND 05          Short index load *TOS+5
   0329: STO              Store indirect (TOS into TOS-1)
-> 032a: LDO  001c        Load global word BASE28
   032c: INC  0002        Inc field ptr (TOS+2)
   032e: SLDC 04          Short load constant 4
   032f: SLDC 00          Short load constant 0
   0330: SLDO 0a          Short load global BASE10
   0331: STP              Store packed field (TOS into TOS-1)
   0332: LDO  001c        Load global word BASE28
   0334: INC  0003        Inc field ptr (TOS+3)
   0336: NOP              No operation
   0337: LSA  00          Load string address: ''
   0339: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   033b: LDO  001c        Load global word BASE28
   033d: INC  000b        Inc field ptr (TOS+11)
   033f: LDCI 0200        Load word 512
   0342: STO              Store indirect (TOS into TOS-1)
   0343: LDO  001c        Load global word BASE28
   0345: INC  000c        Inc field ptr (TOS+12)
   0347: SRO  001d        Store global word BASE29
   0349: LDO  001d        Load global word BASE29
   034b: SLDC 04          Short load constant 4
   034c: SLDC 00          Short load constant 0
   034d: SLDC 00          Short load constant 0
   034e: STP              Store packed field (TOS into TOS-1)
   034f: LDO  001d        Load global word BASE29
   0351: SLDC 05          Short load constant 5
   0352: SLDC 04          Short load constant 4
   0353: SLDC 00          Short load constant 0
   0354: STP              Store packed field (TOS into TOS-1)
   0355: LDO  001d        Load global word BASE29
   0357: SLDC 07          Short load constant 7
   0358: SLDC 09          Short load constant 9
   0359: SLDC 00          Short load constant 0
   035a: STP              Store packed field (TOS into TOS-1)
-> 035b: SLDO 02          Short load global BASE2
   035c: FJP  $036e       Jump if TOS false
   035e: LDO  001a        Load global word BASE26
   0360: INC  000c        Inc field ptr (TOS+12)
   0362: LDO  001a        Load global word BASE26
   0364: IND  0011        Static index and load word (TOS+17)
   0366: LDO  001a        Load global word BASE26
   0368: IND  0010        Static index and load word (TOS+16)
   036a: SBI              Subtract integers (TOS-1 - TOS)
   036b: STO              Store indirect (TOS into TOS-1)
   036c: UJP  $0374       Unconditional jump
-> 036e: LDO  001a        Load global word BASE26
   0370: INC  000c        Inc field ptr (TOS+12)
   0372: SLDC 00          Short load constant 0
   0373: STO              Store indirect (TOS into TOS-1)
-> 0374: LDO  001a        Load global word BASE26
   0376: IND  001d        Static index and load word (TOS+29)
   0378: FJP  $03e8       Jump if TOS false
   037a: LDO  001a        Load global word BASE26
   037c: INC  001f        Inc field ptr (TOS+31)
   037e: LDCI 0200        Load word 512
   0381: STO              Store indirect (TOS into TOS-1)
   0382: LDO  001a        Load global word BASE26
   0384: INC  0020        Inc field ptr (TOS+32)
   0386: SLDC 00          Short load constant 0
   0387: STO              Store indirect (TOS into TOS-1)
   0388: SLDO 02          Short load global BASE2
   0389: FJP  $0396       Jump if TOS false
   038b: LDO  001a        Load global word BASE26
   038d: INC  001e        Inc field ptr (TOS+30)
   038f: LDO  001a        Load global word BASE26
   0391: IND  001b        Static index and load word (TOS+27)
   0393: STO              Store indirect (TOS into TOS-1)
   0394: UJP  $039e       Unconditional jump
-> 0396: LDO  001a        Load global word BASE26
   0398: INC  001e        Inc field ptr (TOS+30)
   039a: LDCI 0200        Load word 512
   039d: STO              Store indirect (TOS into TOS-1)
-> 039e: LDO  001a        Load global word BASE26
   03a0: INC  0010        Inc field ptr (TOS+16)
   03a2: SRO  001c        Store global word BASE28
   03a4: LDO  001c        Load global word BASE28
   03a6: INC  0002        Inc field ptr (TOS+2)
   03a8: SLDC 04          Short load constant 4
   03a9: SLDC 00          Short load constant 0
   03aa: LDP              Load packed field (TOS)
   03ab: SLDC 03          Short load constant 3
   03ac: EQUI             Integer TOS-1 = TOS
   03ad: FJP  $03e8       Jump if TOS false
   03af: LDO  001a        Load global word BASE26
   03b1: INC  000d        Inc field ptr (TOS+13)
   03b3: SLDC 02          Short load constant 2
   03b4: STO              Store indirect (TOS into TOS-1)
   03b5: SLDO 02          Short load global BASE2
   03b6: LNOT             Logical NOT (~TOS)
   03b7: FJP  $03e8       Jump if TOS false
   03b9: LDO  001a        Load global word BASE26
   03bb: INC  0021        Inc field ptr (TOS+33)
   03bd: SLDC 00          Short load constant 0
   03be: LDCI 0202        Load word 514
   03c1: SLDC 00          Short load constant 0
   03c2: CSP  0a          Call standard procedure FLCH
   03c4: LDO  001a        Load global word BASE26
   03c6: SIND 07          Short index load *TOS+7
   03c7: LDO  001a        Load global word BASE26
   03c9: INC  0021        Inc field ptr (TOS+33)
   03cb: SLDC 00          Short load constant 0
   03cc: LDCI 0200        Load word 512
   03cf: LDO  001c        Load global word BASE28
   03d1: SIND 00          Short index load *TOS+0
   03d2: SLDC 00          Short load constant 0
   03d3: CSP  06          Call standard procedure UNITWRITE
   03d5: LDO  001a        Load global word BASE26
   03d7: SIND 07          Short index load *TOS+7
   03d8: LDO  001a        Load global word BASE26
   03da: INC  0021        Inc field ptr (TOS+33)
   03dc: SLDC 00          Short load constant 0
   03dd: LDCI 0200        Load word 512
   03e0: LDO  001c        Load global word BASE28
   03e2: SIND 00          Short index load *TOS+0
   03e3: SLDC 01          Short load constant 1
   03e4: ADI              Add integers (TOS + TOS-1)
   03e5: SLDC 00          Short load constant 0
   03e6: CSP  06          Call standard procedure UNITWRITE
-> 03e8: SLDO 02          Short load global BASE2
   03e9: FJP  $03f0       Jump if TOS false
   03eb: SLDO 04          Short load global BASE4
   03ec: CBP  04          Call base procedure PASCALSY.FRESET
   03ee: UJP  $03f3       Unconditional jump
-> 03f0: SLDO 04          Short load global BASE4
   03f1: CBP  32          Call base procedure PASCALSY.50
-> 03f3: LOD  01 0001     Load word at G1 (SYSCOM)
   03f6: SIND 00          Short index load *TOS+0
   03f7: SLDC 00          Short load constant 0
   03f8: NEQI             Integer TOS-1 <> TOS
   03f9: FJP  $040d       Jump if TOS false
   03fb: LDO  001a        Load global word BASE26
   03fd: INC  0005        Inc field ptr (TOS+5)
   03ff: SLDC 00          Short load constant 0
   0400: STO              Store indirect (TOS into TOS-1)
   0401: LDO  001a        Load global word BASE26
   0403: INC  0002        Inc field ptr (TOS+2)
   0405: SLDC 01          Short load constant 1
   0406: STO              Store indirect (TOS into TOS-1)
   0407: LDO  001a        Load global word BASE26
   0409: INC  0001        Inc field ptr (TOS+1)
   040b: SLDC 01          Short load constant 1
   040c: STO              Store indirect (TOS into TOS-1)
-> 040d: SLDO 0c          Short load global BASE12
   040e: FJP  $0439       Jump if TOS false
   0410: LAO  000b        Load global BASE11
   0412: CSP  21          Call standard procedure RELEASE
   0414: LOD  01 0001     Load word at G1 (SYSCOM)
   0417: INC  0004        Inc field ptr (TOS+4)
   0419: LDCN             Load constant NIL
   041a: STO              Store indirect (TOS into TOS-1)
   041b: LOD  01 0001     Load word at G1 (SYSCOM)
   041e: SIND 00          Short index load *TOS+0
   041f: SRO  000d        Store global word BASE13
   0421: LOD  01 0037     Load word at G55
   0424: SIND 07          Short index load *TOS+7
   0425: LOD  01 0036     Load word at G54
   0428: SLDC 00          Short load constant 0
   0429: LDCI 07ec        Load word 2028
   042c: LOD  01 0037     Load word at G55
   042f: IND  0010        Static index and load word (TOS+16)
   0431: SLDC 00          Short load constant 0
   0432: CSP  05          Call standard procedure UNITREAD
   0434: LOD  01 0001     Load word at G1 (SYSCOM)
   0437: SLDO 0d          Short load global BASE13
   0438: STO              Store indirect (TOS into TOS-1)
-> 0439: UJP  $0440       Unconditional jump
-> 043b: LOD  01 0001     Load word at G1 (SYSCOM)
   043e: SLDC 07          Short load constant 7
   043f: STO              Store indirect (TOS into TOS-1)
-> 0440: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FCLOSE(PARAM1; PARAM2) (* P=6 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
  BASE4
  BASE5
  BASE6
  BASE7
  BASE8
BEGIN
-> 0456: LOD  01 0001     Load word at G1 (SYSCOM)
   0459: SLDC 00          Short load constant 0
   045a: STO              Store indirect (TOS into TOS-1)
   045b: SLDO 02          Short load global BASE2
   045c: SRO  0007        Store global word BASE7
   045e: SLDO 07          Short load global BASE7
   045f: SIND 05          Short index load *TOS+5
   0460: SLDO 07          Short load global BASE7
   0461: SIND 00          Short index load *TOS+0
   0462: LOD  01 0038     Load word at G56
   0465: SIND 00          Short index load *TOS+0
   0466: NEQI             Integer TOS-1 <> TOS
   0467: LAND             Logical AND (TOS & TOS-1)
   0468: FJP  $05e2       Jump if TOS false
   046a: SLDO 07          Short load global BASE7
   046b: SIND 06          Short index load *TOS+6
   046c: FJP  $05b9       Jump if TOS false
   046e: SLDO 07          Short load global BASE7
   046f: INC  0010        Inc field ptr (TOS+16)
   0471: SRO  0008        Store global word BASE8
   0473: SLDO 08          Short load global BASE8
   0474: INC  0003        Inc field ptr (TOS+3)
   0476: SLDC 00          Short load constant 0
   0477: LDB              Load byte at byte ptr TOS-1 + TOS
   0478: SLDC 00          Short load constant 0
   0479: GRTI             Integer TOS-1 > TOS
   047a: FJP  $05b9       Jump if TOS false
   047c: SLDO 01          Short load global BASE1
   047d: SLDC 03          Short load constant 3
   047e: EQUI             Integer TOS-1 = TOS
   047f: FJP  $049e       Jump if TOS false
   0481: SLDO 07          Short load global BASE7
   0482: INC  000c        Inc field ptr (TOS+12)
   0484: SLDO 07          Short load global BASE7
   0485: IND  000d        Static index and load word (TOS+13)
   0487: STO              Store indirect (TOS into TOS-1)
   0488: SLDO 08          Short load global BASE8
   0489: INC  000c        Inc field ptr (TOS+12)
   048b: SLDC 07          Short load constant 7
   048c: SLDC 09          Short load constant 9
   048d: SLDC 64          Short load constant 100
   048e: STP              Store packed field (TOS into TOS-1)
   048f: SLDC 01          Short load constant 1
   0490: SRO  0001        Store global word BASE1
   0492: SLDO 07          Short load global BASE7
   0493: IND  001d        Static index and load word (TOS+29)
   0495: FJP  $049e       Jump if TOS false
   0497: SLDO 07          Short load global BASE7
   0498: INC  001e        Inc field ptr (TOS+30)
   049a: SLDO 07          Short load global BASE7
   049b: IND  001f        Static index and load word (TOS+31)
   049d: STO              Store indirect (TOS into TOS-1)
-> 049e: SLDO 02          Short load global BASE2
   049f: CBP  32          Call base procedure PASCALSY.50
   04a1: SLDO 07          Short load global BASE7
   04a2: IND  000f        Static index and load word (TOS+15)
   04a4: SLDO 08          Short load global BASE8
   04a5: INC  000c        Inc field ptr (TOS+12)
   04a7: SLDC 07          Short load constant 7
   04a8: SLDC 09          Short load constant 9
   04a9: LDP              Load packed field (TOS)
   04aa: SLDC 64          Short load constant 100
   04ab: EQUI             Integer TOS-1 = TOS
   04ac: LOR              Logical OR (TOS | TOS-1)
   04ad: SLDO 01          Short load global BASE1
   04ae: SLDC 02          Short load constant 2
   04af: EQUI             Integer TOS-1 = TOS
   04b0: LOR              Logical OR (TOS | TOS-1)
   04b1: FJP  $05b9       Jump if TOS false
   04b3: SLDO 07          Short load global BASE7
   04b4: SIND 07          Short index load *TOS+7
   04b5: SLDO 07          Short load global BASE7
   04b6: INC  0008        Inc field ptr (TOS+8)
   04b8: SLDC 00          Short load constant 0
   04b9: LAO  0005        Load global BASE5
   04bb: SLDC 00          Short load constant 0
   04bc: SLDC 00          Short load constant 0
   04bd: CBP  1e          Call base procedure PASCALSY.30
   04bf: NEQI             Integer TOS-1 <> TOS
   04c0: FJP  $04c9       Jump if TOS false
   04c2: LOD  01 0001     Load word at G1 (SYSCOM)
   04c5: SLDC 05          Short load constant 5
   04c6: STO              Store indirect (TOS into TOS-1)
   04c7: UJP  $05d3       Unconditional jump
-> 04c9: SLDC 01          Short load constant 1
   04ca: SRO  0004        Store global word BASE4
   04cc: SLDC 00          Short load constant 0
   04cd: SRO  0006        Store global word BASE6
-> 04cf: SLDO 04          Short load global BASE4
   04d0: SLDO 05          Short load global BASE5
   04d1: SLDC 00          Short load constant 0
   04d2: IXA  000d        Index array (TOS-1 + TOS * 13)
   04d4: IND  0008        Static index and load word (TOS+8)
   04d6: LEQI             Integer TOS-1 <= TOS
   04d7: SLDO 06          Short load global BASE6
   04d8: LNOT             Logical NOT (~TOS)
   04d9: LAND             Logical AND (TOS & TOS-1)
   04da: FJP  $04f6       Jump if TOS false
   04dc: SLDO 05          Short load global BASE5
   04dd: SLDO 04          Short load global BASE4
   04de: IXA  000d        Index array (TOS-1 + TOS * 13)
   04e0: SIND 00          Short index load *TOS+0
   04e1: SLDO 08          Short load global BASE8
   04e2: SIND 00          Short index load *TOS+0
   04e3: EQUI             Integer TOS-1 = TOS
   04e4: SLDO 05          Short load global BASE5
   04e5: SLDO 04          Short load global BASE4
   04e6: IXA  000d        Index array (TOS-1 + TOS * 13)
   04e8: SIND 01          Short index load *TOS+1
   04e9: SLDO 08          Short load global BASE8
   04ea: SIND 01          Short index load *TOS+1
   04eb: EQUI             Integer TOS-1 = TOS
   04ec: LAND             Logical AND (TOS & TOS-1)
   04ed: SRO  0006        Store global word BASE6
   04ef: SLDO 04          Short load global BASE4
   04f0: SLDC 01          Short load constant 1
   04f1: ADI              Add integers (TOS + TOS-1)
   04f2: SRO  0004        Store global word BASE4
   04f4: UJP  $04cf       Unconditional jump
-> 04f6: SLDO 06          Short load global BASE6
   04f7: LNOT             Logical NOT (~TOS)
   04f8: FJP  $0501       Jump if TOS false
   04fa: LOD  01 0001     Load word at G1 (SYSCOM)
   04fd: SLDC 06          Short load constant 6
   04fe: STO              Store indirect (TOS into TOS-1)
   04ff: UJP  $05d3       Unconditional jump
-> 0501: SLDO 04          Short load global BASE4
   0502: SLDC 01          Short load constant 1
   0503: SBI              Subtract integers (TOS-1 - TOS)
   0504: SRO  0004        Store global word BASE4
   0506: SLDO 01          Short load global BASE1
   0507: SLDC 00          Short load constant 0
   0508: EQUI             Integer TOS-1 = TOS
   0509: SLDO 05          Short load global BASE5
   050a: SLDO 04          Short load global BASE4
   050b: IXA  000d        Index array (TOS-1 + TOS * 13)
   050d: INC  000c        Inc field ptr (TOS+12)
   050f: SLDC 07          Short load constant 7
   0510: SLDC 09          Short load constant 9
   0511: LDP              Load packed field (TOS)
   0512: SLDC 64          Short load constant 100
   0513: EQUI             Integer TOS-1 = TOS
   0514: LAND             Logical AND (TOS & TOS-1)
   0515: SLDO 01          Short load global BASE1
   0516: SLDC 02          Short load constant 2
   0517: EQUI             Integer TOS-1 = TOS
   0518: LOR              Logical OR (TOS | TOS-1)
   0519: FJP  $0521       Jump if TOS false
   051b: SLDO 04          Short load global BASE4
   051c: SLDO 05          Short load global BASE5
   051d: CBP  22          Call base procedure PASCALSY.34
   051f: UJP  $05b4       Unconditional jump
-> 0521: SLDO 08          Short load global BASE8
   0522: INC  0003        Inc field ptr (TOS+3)
   0524: SLDC 01          Short load constant 1
   0525: SLDO 05          Short load global BASE5
   0526: SLDC 00          Short load constant 0
   0527: SLDC 00          Short load constant 0
   0528: CBP  20          Call base procedure PASCALSY.32
   052a: SRO  0003        Store global word BASE3
   052c: SLDO 03          Short load global BASE3
   052d: SLDC 00          Short load constant 0
   052e: NEQI             Integer TOS-1 <> TOS
   052f: SLDO 03          Short load global BASE3
   0530: SLDO 04          Short load global BASE4
   0531: NEQI             Integer TOS-1 <> TOS
   0532: LAND             Logical AND (TOS & TOS-1)
   0533: FJP  $0543       Jump if TOS false
   0535: SLDO 03          Short load global BASE3
   0536: SLDO 05          Short load global BASE5
   0537: CBP  22          Call base procedure PASCALSY.34
   0539: SLDO 03          Short load global BASE3
   053a: SLDO 04          Short load global BASE4
   053b: LESI             Integer TOS-1 < TOS
   053c: FJP  $0543       Jump if TOS false
   053e: SLDO 04          Short load global BASE4
   053f: SLDC 01          Short load constant 1
   0540: SBI              Subtract integers (TOS-1 - TOS)
   0541: SRO  0004        Store global word BASE4
-> 0543: SLDO 05          Short load global BASE5
   0544: SLDO 04          Short load global BASE4
   0545: IXA  000d        Index array (TOS-1 + TOS * 13)
   0547: INC  000c        Inc field ptr (TOS+12)
   0549: SLDC 07          Short load constant 7
   054a: SLDC 09          Short load constant 9
   054b: LDP              Load packed field (TOS)
   054c: SLDC 64          Short load constant 100
   054d: EQUI             Integer TOS-1 = TOS
   054e: FJP  $0566       Jump if TOS false
   0550: SLDO 08          Short load global BASE8
   0551: INC  000c        Inc field ptr (TOS+12)
   0553: SLDC 07          Short load constant 7
   0554: SLDC 09          Short load constant 9
   0555: LDP              Load packed field (TOS)
   0556: SLDC 64          Short load constant 100
   0557: EQUI             Integer TOS-1 = TOS
   0558: FJP  $0564       Jump if TOS false
   055a: SLDO 08          Short load global BASE8
   055b: INC  000c        Inc field ptr (TOS+12)
   055d: LDA  01 0043     Load addr G67
   0560: MOV  0001        Move 1 words (TOS to TOS-1)
   0562: UJP  $0564       Unconditional jump
-> 0564: UJP  $0589       Unconditional jump
-> 0566: SLDO 07          Short load global BASE7
   0567: IND  000f        Static index and load word (TOS+15)
   0569: LDA  01 0043     Load addr G67
   056c: SLDC 04          Short load constant 4
   056d: SLDC 00          Short load constant 0
   056e: LDP              Load packed field (TOS)
   056f: SLDC 00          Short load constant 0
   0570: NEQI             Integer TOS-1 <> TOS
   0571: LAND             Logical AND (TOS & TOS-1)
   0572: FJP  $057e       Jump if TOS false
   0574: SLDO 08          Short load global BASE8
   0575: INC  000c        Inc field ptr (TOS+12)
   0577: LDA  01 0043     Load addr G67
   057a: MOV  0001        Move 1 words (TOS to TOS-1)
   057c: UJP  $0589       Unconditional jump
-> 057e: SLDO 08          Short load global BASE8
   057f: INC  000c        Inc field ptr (TOS+12)
   0581: SLDO 05          Short load global BASE5
   0582: SLDO 04          Short load global BASE4
   0583: IXA  000d        Index array (TOS-1 + TOS * 13)
   0585: INC  000c        Inc field ptr (TOS+12)
   0587: MOV  0001        Move 1 words (TOS to TOS-1)
-> 0589: SLDO 08          Short load global BASE8
   058a: INC  0001        Inc field ptr (TOS+1)
   058c: SLDO 08          Short load global BASE8
   058d: SIND 00          Short index load *TOS+0
   058e: SLDO 07          Short load global BASE7
   058f: IND  000c        Static index and load word (TOS+12)
   0591: ADI              Add integers (TOS + TOS-1)
   0592: STO              Store indirect (TOS into TOS-1)
   0593: SLDO 07          Short load global BASE7
   0594: IND  001d        Static index and load word (TOS+29)
   0596: FJP  $059f       Jump if TOS false
   0598: SLDO 08          Short load global BASE8
   0599: INC  000b        Inc field ptr (TOS+11)
   059b: SLDO 07          Short load global BASE7
   059c: IND  001e        Static index and load word (TOS+30)
   059e: STO              Store indirect (TOS into TOS-1)
-> 059f: SLDO 07          Short load global BASE7
   05a0: INC  0012        Inc field ptr (TOS+18)
   05a2: SLDC 0c          Short load constant 12
   05a3: SLDC 04          Short load constant 4
   05a4: SLDC 00          Short load constant 0
   05a5: STP              Store packed field (TOS into TOS-1)
   05a6: SLDO 07          Short load global BASE7
   05a7: INC  000f        Inc field ptr (TOS+15)
   05a9: SLDC 00          Short load constant 0
   05aa: STO              Store indirect (TOS into TOS-1)
   05ab: SLDO 05          Short load global BASE5
   05ac: SLDO 04          Short load global BASE4
   05ad: IXA  000d        Index array (TOS-1 + TOS * 13)
   05af: SLDO 07          Short load global BASE7
   05b0: INC  0010        Inc field ptr (TOS+16)
   05b2: MOV  000d        Move 13 words (TOS to TOS-1)
-> 05b4: SLDO 07          Short load global BASE7
   05b5: SIND 07          Short index load *TOS+7
   05b6: SLDO 05          Short load global BASE5
   05b7: CBP  1f          Call base procedure PASCALSY.31
-> 05b9: SLDO 01          Short load global BASE1
   05ba: SLDC 02          Short load constant 2
   05bb: EQUI             Integer TOS-1 = TOS
   05bc: FJP  $05d3       Jump if TOS false
   05be: SLDO 07          Short load global BASE7
   05bf: INC  0013        Inc field ptr (TOS+19)
   05c1: SLDC 00          Short load constant 0
   05c2: LDB              Load byte at byte ptr TOS-1 + TOS
   05c3: SLDC 00          Short load constant 0
   05c4: EQUI             Integer TOS-1 = TOS
   05c5: FJP  $05d3       Jump if TOS false
   05c7: LDA  01 007e     Load addr G126
   05ca: SLDO 07          Short load global BASE7
   05cb: SIND 07          Short index load *TOS+7
   05cc: IXA  0006        Index array (TOS-1 + TOS * 6)
   05ce: NOP              No operation
   05cf: LSA  00          Load string address: ''
   05d1: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 05d3: SLDO 07          Short load global BASE7
   05d4: INC  0002        Inc field ptr (TOS+2)
   05d6: SLDC 01          Short load constant 1
   05d7: STO              Store indirect (TOS into TOS-1)
   05d8: SLDO 07          Short load global BASE7
   05d9: INC  0001        Inc field ptr (TOS+1)
   05db: SLDC 01          Short load constant 1
   05dc: STO              Store indirect (TOS into TOS-1)
   05dd: SLDO 07          Short load global BASE7
   05de: INC  0005        Inc field ptr (TOS+5)
   05e0: SLDC 00          Short load constant 0
   05e1: STO              Store indirect (TOS into TOS-1)
-> 05e2: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FGET(PARAM1) (* P=7 LL=0 *)
  BASE1=PARAM1
  BASE2
  BASE3
  BASE4
  BASE5
  BASE6
  BASE7
  BASE8
  BASE9
  BASE10
  BASE11
  BASE12
  BASE13
BEGIN
-> 05fc: LOD  01 0001     Load word at G1 (SYSCOM)
   05ff: SLDC 00          Short load constant 0
   0600: STO              Store indirect (TOS into TOS-1)
   0601: SLDO 01          Short load global BASE1
   0602: SRO  000c        Store global word BASE12
   0604: SLDO 0c          Short load global BASE12
   0605: SIND 05          Short index load *TOS+5
   0606: FJP  $07dd       Jump if TOS false
   0608: SLDO 0c          Short load global BASE12
   0609: IND  000e        Static index and load word (TOS+14)
   060b: SLDC 00          Short load constant 0
   060c: GRTI             Integer TOS-1 > TOS
   060d: FJP  $0621       Jump if TOS false
   060f: SLDO 0c          Short load global BASE12
   0610: INC  000e        Inc field ptr (TOS+14)
   0612: SLDO 0c          Short load global BASE12
   0613: IND  000e        Static index and load word (TOS+14)
   0615: SLDC 01          Short load constant 1
   0616: SBI              Subtract integers (TOS-1 - TOS)
   0617: STO              Store indirect (TOS into TOS-1)
   0618: SLDO 0c          Short load global BASE12
   0619: IND  000e        Static index and load word (TOS+14)
   061b: SLDC 00          Short load constant 0
   061c: GRTI             Integer TOS-1 > TOS
   061d: FJP  $0621       Jump if TOS false
   061f: UJP  $07ec       Unconditional jump
-> 0621: SLDO 0c          Short load global BASE12
   0622: IND  001d        Static index and load word (TOS+29)
   0624: FJP  $06ee       Jump if TOS false
   0626: SLDO 0c          Short load global BASE12
   0627: INC  0010        Inc field ptr (TOS+16)
   0629: SRO  000d        Store global word BASE13
   062b: SLDO 0c          Short load global BASE12
   062c: SIND 04          Short index load *TOS+4
   062d: SRO  0006        Store global word BASE6
   062f: SLDC 00          Short load constant 0
   0630: SRO  0005        Store global word BASE5
-> 0632: SLDO 0c          Short load global BASE12
   0633: IND  000d        Static index and load word (TOS+13)
   0635: SLDO 0c          Short load global BASE12
   0636: IND  000c        Static index and load word (TOS+12)
   0638: GEQI             Integer TOS-1 >= TOS
   0639: FJP  $0655       Jump if TOS false
   063b: SLDO 0c          Short load global BASE12
   063c: IND  001f        Static index and load word (TOS+31)
   063e: SLDO 06          Short load global BASE6
   063f: ADI              Add integers (TOS + TOS-1)
   0640: SLDO 0c          Short load global BASE12
   0641: IND  001e        Static index and load word (TOS+30)
   0643: GRTI             Integer TOS-1 > TOS
   0644: FJP  $064a       Jump if TOS false
   0646: UJP  $07e2       Unconditional jump
   0648: UJP  $0653       Unconditional jump
-> 064a: SLDO 0d          Short load global BASE13
   064b: IND  000b        Static index and load word (TOS+11)
   064d: SLDO 0c          Short load global BASE12
   064e: IND  001f        Static index and load word (TOS+31)
   0650: SBI              Subtract integers (TOS-1 - TOS)
   0651: SRO  0004        Store global word BASE4
-> 0653: UJP  $065e       Unconditional jump
-> 0655: LDCI 0200        Load word 512
   0658: SLDO 0c          Short load global BASE12
   0659: IND  001f        Static index and load word (TOS+31)
   065b: SBI              Subtract integers (TOS-1 - TOS)
   065c: SRO  0004        Store global word BASE4
-> 065e: SLDO 06          Short load global BASE6
   065f: SRO  0003        Store global word BASE3
   0661: SLDO 03          Short load global BASE3
   0662: SLDO 04          Short load global BASE4
   0663: GRTI             Integer TOS-1 > TOS
   0664: FJP  $0669       Jump if TOS false
   0666: SLDO 04          Short load global BASE4
   0667: SRO  0003        Store global word BASE3
-> 0669: SLDO 03          Short load global BASE3
   066a: SLDC 00          Short load constant 0
   066b: GRTI             Integer TOS-1 > TOS
   066c: FJP  $068d       Jump if TOS false
   066e: SLDO 0c          Short load global BASE12
   066f: INC  0021        Inc field ptr (TOS+33)
   0671: SLDO 0c          Short load global BASE12
   0672: IND  001f        Static index and load word (TOS+31)
   0674: SLDO 0c          Short load global BASE12
   0675: SIND 00          Short index load *TOS+0
   0676: SLDO 05          Short load global BASE5
   0677: SLDO 03          Short load global BASE3
   0678: CSP  02          Call standard procedure MOVL
   067a: SLDO 0c          Short load global BASE12
   067b: INC  001f        Inc field ptr (TOS+31)
   067d: SLDO 0c          Short load global BASE12
   067e: IND  001f        Static index and load word (TOS+31)
   0680: SLDO 03          Short load global BASE3
   0681: ADI              Add integers (TOS + TOS-1)
   0682: STO              Store indirect (TOS into TOS-1)
   0683: SLDO 05          Short load global BASE5
   0684: SLDO 03          Short load global BASE3
   0685: ADI              Add integers (TOS + TOS-1)
   0686: SRO  0005        Store global word BASE5
   0688: SLDO 06          Short load global BASE6
   0689: SLDO 03          Short load global BASE3
   068a: SBI              Subtract integers (TOS-1 - TOS)
   068b: SRO  0006        Store global word BASE6
-> 068d: SLDO 06          Short load global BASE6
   068e: SLDC 00          Short load constant 0
   068f: EQUI             Integer TOS-1 = TOS
   0690: SRO  0008        Store global word BASE8
   0692: SLDO 08          Short load global BASE8
   0693: LNOT             Logical NOT (~TOS)
   0694: FJP  $06e9       Jump if TOS false
   0696: SLDO 0c          Short load global BASE12
   0697: IND  0020        Static index and load word (TOS+32)
   0699: FJP  $06b9       Jump if TOS false
   069b: SLDO 0c          Short load global BASE12
   069c: INC  0020        Inc field ptr (TOS+32)
   069e: SLDC 00          Short load constant 0
   069f: STO              Store indirect (TOS into TOS-1)
   06a0: SLDO 0c          Short load global BASE12
   06a1: INC  000f        Inc field ptr (TOS+15)
   06a3: SLDC 01          Short load constant 1
   06a4: STO              Store indirect (TOS into TOS-1)
   06a5: SLDO 0c          Short load global BASE12
   06a6: SIND 07          Short index load *TOS+7
   06a7: SLDO 0c          Short load global BASE12
   06a8: INC  0021        Inc field ptr (TOS+33)
   06aa: SLDC 00          Short load constant 0
   06ab: LDCI 0200        Load word 512
   06ae: SLDO 0d          Short load global BASE13
   06af: SIND 00          Short index load *TOS+0
   06b0: SLDO 0c          Short load global BASE12
   06b1: IND  000d        Static index and load word (TOS+13)
   06b3: ADI              Add integers (TOS + TOS-1)
   06b4: SLDC 01          Short load constant 1
   06b5: SBI              Subtract integers (TOS-1 - TOS)
   06b6: SLDC 00          Short load constant 0
   06b7: CSP  06          Call standard procedure UNITWRITE
-> 06b9: CSP  22          Call standard procedure IORESULT
   06bb: SLDC 00          Short load constant 0
   06bc: NEQI             Integer TOS-1 <> TOS
   06bd: FJP  $06c1       Jump if TOS false
   06bf: UJP  $07e2       Unconditional jump
-> 06c1: SLDO 0c          Short load global BASE12
   06c2: SIND 07          Short index load *TOS+7
   06c3: SLDO 0c          Short load global BASE12
   06c4: INC  0021        Inc field ptr (TOS+33)
   06c6: SLDC 00          Short load constant 0
   06c7: LDCI 0200        Load word 512
   06ca: SLDO 0d          Short load global BASE13
   06cb: SIND 00          Short index load *TOS+0
   06cc: SLDO 0c          Short load global BASE12
   06cd: IND  000d        Static index and load word (TOS+13)
   06cf: ADI              Add integers (TOS + TOS-1)
   06d0: SLDC 00          Short load constant 0
   06d1: CSP  05          Call standard procedure UNITREAD
   06d3: CSP  22          Call standard procedure IORESULT
   06d5: SLDC 00          Short load constant 0
   06d6: NEQI             Integer TOS-1 <> TOS
   06d7: FJP  $06db       Jump if TOS false
   06d9: UJP  $07e2       Unconditional jump
-> 06db: SLDO 0c          Short load global BASE12
   06dc: INC  000d        Inc field ptr (TOS+13)
   06de: SLDO 0c          Short load global BASE12
   06df: IND  000d        Static index and load word (TOS+13)
   06e1: SLDC 01          Short load constant 1
   06e2: ADI              Add integers (TOS + TOS-1)
   06e3: STO              Store indirect (TOS into TOS-1)
   06e4: SLDO 0c          Short load global BASE12
   06e5: INC  001f        Inc field ptr (TOS+31)
   06e7: SLDC 00          Short load constant 0
   06e8: STO              Store indirect (TOS into TOS-1)
-> 06e9: SLDO 08          Short load global BASE8
   06ea: FJP  $0632       Jump if TOS false
   06ec: UJP  $075f       Unconditional jump
-> 06ee: SLDO 0c          Short load global BASE12
   06ef: SIND 07          Short index load *TOS+7
   06f0: SLDC 01          Short load constant 1
   06f1: EQUI             Integer TOS-1 = TOS
   06f2: SRO  0009        Store global word BASE9
   06f4: SLDO 09          Short load global BASE9
   06f5: FJP  $06fc       Jump if TOS false
   06f7: SLDC 02          Short load constant 2
   06f8: SRO  0007        Store global word BASE7
   06fa: UJP  $0700       Unconditional jump
-> 06fc: SLDO 0c          Short load global BASE12
   06fd: SIND 07          Short index load *TOS+7
   06fe: SRO  0007        Store global word BASE7
-> 0700: SLDC 01          Short load constant 1
   0701: SRO  000a        Store global word BASE10
   0703: SLDC 20          Short load constant 32
   0704: SRO  000b        Store global word BASE11
   0706: SLDC 00          Short load constant 0
   0707: SRO  0002        Store global word BASE2
-> 0709: SLDO 02          Short load global BASE2
   070a: SLDO 0c          Short load global BASE12
   070b: SIND 04          Short index load *TOS+4
   070c: LESI             Integer TOS-1 < TOS
   070d: SLDO 0a          Short load global BASE10
   070e: LAND             Logical AND (TOS & TOS-1)
   070f: FJP  $075f       Jump if TOS false
   0711: SLDO 07          Short load global BASE7
   0712: LAO  000b        Load global BASE11
   0714: SLDC 00          Short load constant 0
   0715: SLDC 01          Short load constant 1
   0716: SLDC 00          Short load constant 0
   0717: SLDC 00          Short load constant 0
   0718: CSP  05          Call standard procedure UNITREAD
   071a: CSP  22          Call standard procedure IORESULT
   071c: SLDC 00          Short load constant 0
   071d: NEQI             Integer TOS-1 <> TOS
   071e: FJP  $0722       Jump if TOS false
   0720: UJP  $07e2       Unconditional jump
-> 0722: SLDO 09          Short load global BASE9
   0723: FJP  $073b       Jump if TOS false
   0725: SLDO 0b          Short load global BASE11
   0726: LDA  01 010c     Load addr G268
   072a: LDM  10          Load 16 words from (TOS)
   072c: SLDC 10          Short load constant 16
   072d: INN              Set membership (TOS-1 in set TOS)
   072e: LNOT             Logical NOT (~TOS)
   072f: FJP  $073b       Jump if TOS false
   0731: SLDO 0c          Short load global BASE12
   0732: SIND 07          Short index load *TOS+7
   0733: LAO  000b        Load global BASE11
   0735: SLDC 00          Short load constant 0
   0736: SLDC 01          Short load constant 1
   0737: SLDC 00          Short load constant 0
   0738: SLDC 00          Short load constant 0
   0739: CSP  06          Call standard procedure UNITWRITE
-> 073b: SLDO 0b          Short load global BASE11
   073c: LOD  01 0001     Load word at G1 (SYSCOM)
   073f: INC  0029        Inc field ptr (TOS+41)
   0741: SLDC 08          Short load constant 8
   0742: SLDC 00          Short load constant 0
   0743: LDP              Load packed field (TOS)
   0744: EQUI             Integer TOS-1 = TOS
   0745: FJP  $0753       Jump if TOS false
   0747: SLDO 0c          Short load global BASE12
   0748: SIND 07          Short index load *TOS+7
   0749: SLDC 01          Short load constant 1
   074a: EQUI             Integer TOS-1 = TOS
   074b: FJP  $0750       Jump if TOS false
   074d: SLDC 00          Short load constant 0
   074e: SRO  000b        Store global word BASE11
-> 0750: SLDC 00          Short load constant 0
   0751: SRO  000a        Store global word BASE10
-> 0753: SLDO 0c          Short load global BASE12
   0754: SIND 00          Short index load *TOS+0
   0755: SLDO 02          Short load global BASE2
   0756: SLDO 0b          Short load global BASE11
   0757: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0758: SLDO 02          Short load global BASE2
   0759: SLDC 01          Short load constant 1
   075a: ADI              Add integers (TOS + TOS-1)
   075b: SRO  0002        Store global word BASE2
   075d: UJP  $0709       Unconditional jump
-> 075f: SLDO 0c          Short load global BASE12
   0760: SIND 04          Short index load *TOS+4
   0761: SLDC 01          Short load constant 1
   0762: EQUI             Integer TOS-1 = TOS
   0763: FJP  $07db       Jump if TOS false
   0765: SLDO 0c          Short load global BASE12
   0766: INC  0001        Inc field ptr (TOS+1)
   0768: SLDC 00          Short load constant 0
   0769: STO              Store indirect (TOS into TOS-1)
   076a: SLDO 0c          Short load global BASE12
   076b: SIND 03          Short index load *TOS+3
   076c: SLDC 00          Short load constant 0
   076d: NEQI             Integer TOS-1 <> TOS
   076e: FJP  $0775       Jump if TOS false
   0770: SLDO 0c          Short load global BASE12
   0771: INC  0003        Inc field ptr (TOS+3)
   0773: SLDC 02          Short load constant 2
   0774: STO              Store indirect (TOS into TOS-1)
-> 0775: SLDO 0c          Short load global BASE12
   0776: SIND 00          Short index load *TOS+0
   0777: SLDC 00          Short load constant 0
   0778: LDB              Load byte at byte ptr TOS-1 + TOS
   0779: SLDC 0d          Short load constant 13
   077a: EQUI             Integer TOS-1 = TOS
   077b: FJP  $0789       Jump if TOS false
   077d: SLDO 0c          Short load global BASE12
   077e: SIND 00          Short index load *TOS+0
   077f: SLDC 00          Short load constant 0
   0780: SLDC 20          Short load constant 32
   0781: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0782: SLDO 0c          Short load global BASE12
   0783: INC  0001        Inc field ptr (TOS+1)
   0785: SLDC 01          Short load constant 1
   0786: STO              Store indirect (TOS into TOS-1)
   0787: UJP  $07ec       Unconditional jump
-> 0789: SLDO 0c          Short load global BASE12
   078a: SIND 00          Short index load *TOS+0
   078b: SLDC 00          Short load constant 0
   078c: LDB              Load byte at byte ptr TOS-1 + TOS
   078d: SLDC 10          Short load constant 16
   078e: EQUI             Integer TOS-1 = TOS
   078f: SLDO 0c          Short load global BASE12
   0790: SIND 07          Short index load *TOS+7
   0791: SLDC 02          Short load constant 2
   0792: GRTI             Integer TOS-1 > TOS
   0793: LAND             Logical AND (TOS & TOS-1)
   0794: FJP  $07b9       Jump if TOS false
   0796: SLDO 01          Short load global BASE1
   0797: CBP  07          Call base procedure PASCALSY.FGET
   0799: SLDO 0c          Short load global BASE12
   079a: SIND 00          Short index load *TOS+0
   079b: SLDC 00          Short load constant 0
   079c: LDB              Load byte at byte ptr TOS-1 + TOS
   079d: SLDC 20          Short load constant 32
   079e: SBI              Subtract integers (TOS-1 - TOS)
   079f: SRO  0003        Store global word BASE3
   07a1: SLDO 03          Short load global BASE3
   07a2: SLDC 00          Short load constant 0
   07a3: GRTI             Integer TOS-1 > TOS
   07a4: SLDO 03          Short load global BASE3
   07a5: SLDC 7f          Short load constant 127
   07a6: LEQI             Integer TOS-1 <= TOS
   07a7: LAND             Logical AND (TOS & TOS-1)
   07a8: FJP  $07b6       Jump if TOS false
   07aa: SLDO 0c          Short load global BASE12
   07ab: SIND 00          Short index load *TOS+0
   07ac: SLDC 00          Short load constant 0
   07ad: SLDC 20          Short load constant 32
   07ae: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   07af: SLDO 0c          Short load global BASE12
   07b0: INC  000e        Inc field ptr (TOS+14)
   07b2: SLDO 03          Short load global BASE3
   07b3: STO              Store indirect (TOS into TOS-1)
   07b4: UJP  $07ec       Unconditional jump
-> 07b6: SLDO 01          Short load global BASE1
   07b7: CBP  07          Call base procedure PASCALSY.FGET
-> 07b9: SLDO 0c          Short load global BASE12
   07ba: SIND 00          Short index load *TOS+0
   07bb: SLDC 00          Short load constant 0
   07bc: LDB              Load byte at byte ptr TOS-1 + TOS
   07bd: SLDC 00          Short load constant 0
   07be: EQUI             Integer TOS-1 = TOS
   07bf: FJP  $07db       Jump if TOS false
   07c1: SLDO 0c          Short load global BASE12
   07c2: IND  001d        Static index and load word (TOS+29)
   07c4: SLDO 0c          Short load global BASE12
   07c5: INC  0012        Inc field ptr (TOS+18)
   07c7: SLDC 04          Short load constant 4
   07c8: SLDC 00          Short load constant 0
   07c9: LDP              Load packed field (TOS)
   07ca: SLDC 03          Short load constant 3
   07cb: EQUI             Integer TOS-1 = TOS
   07cc: LAND             Logical AND (TOS & TOS-1)
   07cd: FJP  $07d4       Jump if TOS false
   07cf: SLDO 01          Short load global BASE1
   07d0: CLP  35          Call local procedure PASCALSY.53
   07d2: UJP  $07db       Unconditional jump
-> 07d4: SLDO 0c          Short load global BASE12
   07d5: SIND 00          Short index load *TOS+0
   07d6: SLDC 00          Short load constant 0
   07d7: SLDC 20          Short load constant 32
   07d8: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   07d9: UJP  $07e2       Unconditional jump
-> 07db: UJP  $07ec       Unconditional jump
-> 07dd: LOD  01 0001     Load word at G1 (SYSCOM)
   07e0: SLDC 0d          Short load constant 13
   07e1: STO              Store indirect (TOS into TOS-1)
-> 07e2: SLDO 0c          Short load global BASE12
   07e3: INC  0002        Inc field ptr (TOS+2)
   07e5: SLDC 01          Short load constant 1
   07e6: STO              Store indirect (TOS into TOS-1)
   07e7: SLDO 0c          Short load global BASE12
   07e8: INC  0001        Inc field ptr (TOS+1)
   07ea: SLDC 01          Short load constant 1
   07eb: STO              Store indirect (TOS into TOS-1)
-> 07ec: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FPUT(PARAM1) (* P=8 LL=0 *)
  BASE1=PARAM1
  BASE2
  BASE3
  BASE4
  BASE5
  BASE6
  BASE7
  BASE8
BEGIN
-> 0804: LOD  01 0001     Load word at G1 (SYSCOM)
   0807: SLDC 00          Short load constant 0
   0808: STO              Store indirect (TOS into TOS-1)
   0809: SLDO 01          Short load global BASE1
   080a: SRO  0007        Store global word BASE7
   080c: SLDO 07          Short load global BASE7
   080d: SIND 05          Short index load *TOS+5
   080e: FJP  $095e       Jump if TOS false
   0810: SLDO 07          Short load global BASE7
   0811: IND  001d        Static index and load word (TOS+29)
   0813: FJP  $0949       Jump if TOS false
   0815: SLDO 07          Short load global BASE7
   0816: INC  0010        Inc field ptr (TOS+16)
   0818: SRO  0008        Store global word BASE8
   081a: SLDO 07          Short load global BASE7
   081b: SIND 04          Short index load *TOS+4
   081c: SRO  0005        Store global word BASE5
   081e: SLDC 00          Short load constant 0
   081f: SRO  0004        Store global word BASE4
-> 0821: SLDO 08          Short load global BASE8
   0822: SIND 00          Short index load *TOS+0
   0823: SLDO 07          Short load global BASE7
   0824: IND  000d        Static index and load word (TOS+13)
   0826: ADI              Add integers (TOS + TOS-1)
   0827: SLDO 08          Short load global BASE8
   0828: SIND 01          Short index load *TOS+1
   0829: EQUI             Integer TOS-1 = TOS
   082a: FJP  $085d       Jump if TOS false
   082c: SLDO 07          Short load global BASE7
   082d: IND  001f        Static index and load word (TOS+31)
   082f: SLDO 05          Short load global BASE5
   0830: ADI              Add integers (TOS + TOS-1)
   0831: SLDO 08          Short load global BASE8
   0832: IND  000b        Static index and load word (TOS+11)
   0834: GRTI             Integer TOS-1 > TOS
   0835: FJP  $0852       Jump if TOS false
   0837: SLDO 01          Short load global BASE1
   0838: SLDC 00          Short load constant 0
   0839: SLDC 00          Short load constant 0
   083a: CBP  33          Call base procedure PASCALSY.51
   083c: FJP  $0847       Jump if TOS false
   083e: LOD  01 0001     Load word at G1 (SYSCOM)
   0841: SLDC 08          Short load constant 8
   0842: STO              Store indirect (TOS into TOS-1)
   0843: UJP  $0963       Unconditional jump
   0845: UJP  $0850       Unconditional jump
-> 0847: LDCI 0200        Load word 512
   084a: SLDO 07          Short load global BASE7
   084b: IND  001f        Static index and load word (TOS+31)
   084d: SBI              Subtract integers (TOS-1 - TOS)
   084e: SRO  0003        Store global word BASE3
-> 0850: UJP  $085b       Unconditional jump
-> 0852: SLDO 08          Short load global BASE8
   0853: IND  000b        Static index and load word (TOS+11)
   0855: SLDO 07          Short load global BASE7
   0856: IND  001f        Static index and load word (TOS+31)
   0858: SBI              Subtract integers (TOS-1 - TOS)
   0859: SRO  0003        Store global word BASE3
-> 085b: UJP  $0866       Unconditional jump
-> 085d: LDCI 0200        Load word 512
   0860: SLDO 07          Short load global BASE7
   0861: IND  001f        Static index and load word (TOS+31)
   0863: SBI              Subtract integers (TOS-1 - TOS)
   0864: SRO  0003        Store global word BASE3
-> 0866: SLDO 05          Short load global BASE5
   0867: SRO  0002        Store global word BASE2
   0869: SLDO 02          Short load global BASE2
   086a: SLDO 03          Short load global BASE3
   086b: GRTI             Integer TOS-1 > TOS
   086c: FJP  $0871       Jump if TOS false
   086e: SLDO 03          Short load global BASE3
   086f: SRO  0002        Store global word BASE2
-> 0871: SLDO 02          Short load global BASE2
   0872: SLDC 00          Short load constant 0
   0873: GRTI             Integer TOS-1 > TOS
   0874: FJP  $089a       Jump if TOS false
   0876: SLDO 07          Short load global BASE7
   0877: INC  0020        Inc field ptr (TOS+32)
   0879: SLDC 01          Short load constant 1
   087a: STO              Store indirect (TOS into TOS-1)
   087b: SLDO 07          Short load global BASE7
   087c: SIND 00          Short index load *TOS+0
   087d: SLDO 04          Short load global BASE4
   087e: SLDO 07          Short load global BASE7
   087f: INC  0021        Inc field ptr (TOS+33)
   0881: SLDO 07          Short load global BASE7
   0882: IND  001f        Static index and load word (TOS+31)
   0884: SLDO 02          Short load global BASE2
   0885: CSP  02          Call standard procedure MOVL
   0887: SLDO 07          Short load global BASE7
   0888: INC  001f        Inc field ptr (TOS+31)
   088a: SLDO 07          Short load global BASE7
   088b: IND  001f        Static index and load word (TOS+31)
   088d: SLDO 02          Short load global BASE2
   088e: ADI              Add integers (TOS + TOS-1)
   088f: STO              Store indirect (TOS into TOS-1)
   0890: SLDO 04          Short load global BASE4
   0891: SLDO 02          Short load global BASE2
   0892: ADI              Add integers (TOS + TOS-1)
   0893: SRO  0004        Store global word BASE4
   0895: SLDO 05          Short load global BASE5
   0896: SLDO 02          Short load global BASE2
   0897: SBI              Subtract integers (TOS-1 - TOS)
   0898: SRO  0005        Store global word BASE5
-> 089a: SLDO 05          Short load global BASE5
   089b: SLDC 00          Short load constant 0
   089c: EQUI             Integer TOS-1 = TOS
   089d: SRO  0006        Store global word BASE6
   089f: SLDO 06          Short load global BASE6
   08a0: LNOT             Logical NOT (~TOS)
   08a1: FJP  $090b       Jump if TOS false
   08a3: SLDO 07          Short load global BASE7
   08a4: IND  0020        Static index and load word (TOS+32)
   08a6: FJP  $08c6       Jump if TOS false
   08a8: SLDO 07          Short load global BASE7
   08a9: INC  0020        Inc field ptr (TOS+32)
   08ab: SLDC 00          Short load constant 0
   08ac: STO              Store indirect (TOS into TOS-1)
   08ad: SLDO 07          Short load global BASE7
   08ae: INC  000f        Inc field ptr (TOS+15)
   08b0: SLDC 01          Short load constant 1
   08b1: STO              Store indirect (TOS into TOS-1)
   08b2: SLDO 07          Short load global BASE7
   08b3: SIND 07          Short index load *TOS+7
   08b4: SLDO 07          Short load global BASE7
   08b5: INC  0021        Inc field ptr (TOS+33)
   08b7: SLDC 00          Short load constant 0
   08b8: LDCI 0200        Load word 512
   08bb: SLDO 08          Short load global BASE8
   08bc: SIND 00          Short index load *TOS+0
   08bd: SLDO 07          Short load global BASE7
   08be: IND  000d        Static index and load word (TOS+13)
   08c0: ADI              Add integers (TOS + TOS-1)
   08c1: SLDC 01          Short load constant 1
   08c2: SBI              Subtract integers (TOS-1 - TOS)
   08c3: SLDC 00          Short load constant 0
   08c4: CSP  06          Call standard procedure UNITWRITE
-> 08c6: CSP  22          Call standard procedure IORESULT
   08c8: SLDC 00          Short load constant 0
   08c9: NEQI             Integer TOS-1 <> TOS
   08ca: FJP  $08ce       Jump if TOS false
   08cc: UJP  $0963       Unconditional jump
-> 08ce: SLDO 07          Short load global BASE7
   08cf: IND  000d        Static index and load word (TOS+13)
   08d1: SLDO 07          Short load global BASE7
   08d2: IND  000c        Static index and load word (TOS+12)
   08d4: LESI             Integer TOS-1 < TOS
   08d5: FJP  $08eb       Jump if TOS false
   08d7: SLDO 07          Short load global BASE7
   08d8: SIND 07          Short index load *TOS+7
   08d9: SLDO 07          Short load global BASE7
   08da: INC  0021        Inc field ptr (TOS+33)
   08dc: SLDC 00          Short load constant 0
   08dd: LDCI 0200        Load word 512
   08e0: SLDO 08          Short load global BASE8
   08e1: SIND 00          Short index load *TOS+0
   08e2: SLDO 07          Short load global BASE7
   08e3: IND  000d        Static index and load word (TOS+13)
   08e5: ADI              Add integers (TOS + TOS-1)
   08e6: SLDC 00          Short load constant 0
   08e7: CSP  05          Call standard procedure UNITREAD
   08e9: UJP  $08f5       Unconditional jump
-> 08eb: SLDO 07          Short load global BASE7
   08ec: INC  0021        Inc field ptr (TOS+33)
   08ee: SLDC 00          Short load constant 0
   08ef: LDCI 0200        Load word 512
   08f2: SLDC 00          Short load constant 0
   08f3: CSP  0a          Call standard procedure FLCH
-> 08f5: CSP  22          Call standard procedure IORESULT
   08f7: SLDC 00          Short load constant 0
   08f8: NEQI             Integer TOS-1 <> TOS
   08f9: FJP  $08fd       Jump if TOS false
   08fb: UJP  $0963       Unconditional jump
-> 08fd: SLDO 07          Short load global BASE7
   08fe: INC  000d        Inc field ptr (TOS+13)
   0900: SLDO 07          Short load global BASE7
   0901: IND  000d        Static index and load word (TOS+13)
   0903: SLDC 01          Short load constant 1
   0904: ADI              Add integers (TOS + TOS-1)
   0905: STO              Store indirect (TOS into TOS-1)
   0906: SLDO 07          Short load global BASE7
   0907: INC  001f        Inc field ptr (TOS+31)
   0909: SLDC 00          Short load constant 0
   090a: STO              Store indirect (TOS into TOS-1)
-> 090b: SLDO 06          Short load global BASE6
   090c: FJP  $0821       Jump if TOS false
   090e: SLDO 07          Short load global BASE7
   090f: SIND 04          Short index load *TOS+4
   0910: SLDC 01          Short load constant 1
   0911: EQUI             Integer TOS-1 = TOS
   0912: FJP  $0947       Jump if TOS false
   0914: SLDO 07          Short load global BASE7
   0915: SIND 00          Short index load *TOS+0
   0916: SLDC 00          Short load constant 0
   0917: LDB              Load byte at byte ptr TOS-1 + TOS
   0918: SLDC 0d          Short load constant 13
   0919: EQUI             Integer TOS-1 = TOS
   091a: FJP  $0947       Jump if TOS false
   091c: SLDO 08          Short load global BASE8
   091d: INC  0002        Inc field ptr (TOS+2)
   091f: SLDC 04          Short load constant 4
   0920: SLDC 00          Short load constant 0
   0921: LDP              Load packed field (TOS)
   0922: SLDC 03          Short load constant 3
   0923: EQUI             Integer TOS-1 = TOS
   0924: FJP  $0947       Jump if TOS false
   0926: SLDO 07          Short load global BASE7
   0927: IND  001f        Static index and load word (TOS+31)
   0929: LDCI 0200        Load word 512
   092c: SLDC 7f          Short load constant 127
   092d: SBI              Subtract integers (TOS-1 - TOS)
   092e: GEQI             Integer TOS-1 >= TOS
   092f: SLDO 07          Short load global BASE7
   0930: IND  000d        Static index and load word (TOS+13)
   0932: LNOT             Logical NOT (~TOS)
   0933: LAND             Logical AND (TOS & TOS-1)
   0934: FJP  $0947       Jump if TOS false
   0936: SLDO 07          Short load global BASE7
   0937: INC  001f        Inc field ptr (TOS+31)
   0939: LDCI 0200        Load word 512
   093c: SLDC 01          Short load constant 1
   093d: SBI              Subtract integers (TOS-1 - TOS)
   093e: STO              Store indirect (TOS into TOS-1)
   093f: SLDO 07          Short load global BASE7
   0940: SIND 00          Short index load *TOS+0
   0941: SLDC 00          Short load constant 0
   0942: SLDC 00          Short load constant 0
   0943: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0944: SLDO 01          Short load global BASE1
   0945: CBP  08          Call base procedure PASCALSY.FPUT
-> 0947: UJP  $095c       Unconditional jump
-> 0949: SLDO 07          Short load global BASE7
   094a: SIND 07          Short index load *TOS+7
   094b: SLDO 07          Short load global BASE7
   094c: SIND 00          Short index load *TOS+0
   094d: SLDC 00          Short load constant 0
   094e: SLDO 07          Short load global BASE7
   094f: SIND 04          Short index load *TOS+4
   0950: SLDC 00          Short load constant 0
   0951: SLDC 00          Short load constant 0
   0952: CSP  06          Call standard procedure UNITWRITE
   0954: CSP  22          Call standard procedure IORESULT
   0956: SLDC 00          Short load constant 0
   0957: NEQI             Integer TOS-1 <> TOS
   0958: FJP  $095c       Jump if TOS false
   095a: UJP  $0963       Unconditional jump
-> 095c: UJP  $096d       Unconditional jump
-> 095e: LOD  01 0001     Load word at G1 (SYSCOM)
   0961: SLDC 0d          Short load constant 13
   0962: STO              Store indirect (TOS into TOS-1)
-> 0963: SLDO 07          Short load global BASE7
   0964: INC  0002        Inc field ptr (TOS+2)
   0966: SLDC 01          Short load constant 1
   0967: STO              Store indirect (TOS into TOS-1)
   0968: SLDO 07          Short load global BASE7
   0969: INC  0001        Inc field ptr (TOS+1)
   096b: SLDC 01          Short load constant 1
   096c: STO              Store indirect (TOS into TOS-1)
-> 096d: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XSEEK (* P=9 LL=0 *)
BEGIN
-> 0982: LOD  01 0001     Load word at G1 (SYSCOM)
   0985: INC  0001        Inc field ptr (TOS+1)
   0987: SLDC 0b          Short load constant 11
   0988: STO              Store indirect (TOS into TOS-1)
   0989: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 098b: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FEOF(PARAM1): RETVAL (* P=10 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
BEGIN
-> 0998: SLDO 03          Short load global BASE3
   0999: SIND 02          Short index load *TOS+2
   099a: SRO  0001        Store global word BASE1
-> 099c: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FEOLN(PARAM1): RETVAL (* P=11 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
BEGIN
-> 09a8: SLDO 03          Short load global BASE3
   09a9: SIND 01          Short index load *TOS+1
   09aa: SRO  0001        Store global word BASE1
-> 09ac: RBP  01          Return from base procedure
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
-> 09b8: SLDO 02          Short load global BASE2
   09b9: SRO  0030        Store global word BASE48
   09bb: LDO  0030        Load global word BASE48
   09bd: SIND 07          Short index load *TOS+7
   09be: SLDC 01          Short load constant 1
   09bf: EQUI             Integer TOS-1 = TOS
   09c0: FJP  $09c9       Jump if TOS false
   09c2: LAO  0007        Load global BASE7
   09c4: SLDC 00          Short load constant 0
   09c5: SLDC 51          Short load constant 81
   09c6: SLDC 50          Short load constant 80
   09c7: CSP  0a          Call standard procedure FLCH
-> 09c9: SLDO 01          Short load global BASE1
   09ca: SLDC 00          Short load constant 0
   09cb: STO              Store indirect (TOS into TOS-1)
   09cc: SLDC 00          Short load constant 0
   09cd: SRO  0005        Store global word BASE5
   09cf: SLDC 00          Short load constant 0
   09d0: SRO  0004        Store global word BASE4
   09d2: LDO  0030        Load global word BASE48
   09d4: SIND 03          Short index load *TOS+3
   09d5: SLDC 01          Short load constant 1
   09d6: EQUI             Integer TOS-1 = TOS
   09d7: FJP  $09dc       Jump if TOS false
   09d9: SLDO 02          Short load global BASE2
   09da: CBP  07          Call base procedure PASCALSY.FGET
-> 09dc: LDO  0030        Load global word BASE48
   09de: SIND 00          Short index load *TOS+0
   09df: SLDC 00          Short load constant 0
   09e0: LDB              Load byte at byte ptr TOS-1 + TOS
   09e1: SLDC 20          Short load constant 32
   09e2: EQUI             Integer TOS-1 = TOS
   09e3: LDO  0030        Load global word BASE48
   09e5: SIND 02          Short index load *TOS+2
   09e6: LNOT             Logical NOT (~TOS)
   09e7: LAND             Logical AND (TOS & TOS-1)
   09e8: FJP  $09ef       Jump if TOS false
   09ea: SLDO 02          Short load global BASE2
   09eb: CBP  07          Call base procedure PASCALSY.FGET
   09ed: UJP  $09dc       Unconditional jump
-> 09ef: LDO  0030        Load global word BASE48
   09f1: SIND 02          Short index load *TOS+2
   09f2: FJP  $09f6       Jump if TOS false
   09f4: UJP  $0a98       Unconditional jump
-> 09f6: LDO  0030        Load global word BASE48
   09f8: SIND 00          Short index load *TOS+0
   09f9: SLDC 00          Short load constant 0
   09fa: LDB              Load byte at byte ptr TOS-1 + TOS
   09fb: SRO  0003        Store global word BASE3
   09fd: SLDO 03          Short load global BASE3
   09fe: SLDC 2b          Short load constant 43
   09ff: EQUI             Integer TOS-1 = TOS
   0a00: SLDO 03          Short load global BASE3
   0a01: SLDC 2d          Short load constant 45
   0a02: EQUI             Integer TOS-1 = TOS
   0a03: LOR              Logical OR (TOS | TOS-1)
   0a04: FJP  $0a1a       Jump if TOS false
   0a06: SLDC 02          Short load constant 2
   0a07: SRO  0006        Store global word BASE6
   0a09: SLDO 03          Short load global BASE3
   0a0a: SLDC 2d          Short load constant 45
   0a0b: EQUI             Integer TOS-1 = TOS
   0a0c: SRO  0005        Store global word BASE5
   0a0e: SLDO 02          Short load global BASE2
   0a0f: CBP  07          Call base procedure PASCALSY.FGET
   0a11: LDO  0030        Load global word BASE48
   0a13: SIND 00          Short index load *TOS+0
   0a14: SLDC 00          Short load constant 0
   0a15: LDB              Load byte at byte ptr TOS-1 + TOS
   0a16: SRO  0003        Store global word BASE3
   0a18: UJP  $0a1d       Unconditional jump
-> 0a1a: SLDC 01          Short load constant 1
   0a1b: SRO  0006        Store global word BASE6
-> 0a1d: SLDO 03          Short load global BASE3
   0a1e: LDA  01 007a     Load addr G122
   0a21: LDM  04          Load 4 words from (TOS)
   0a23: SLDC 04          Short load constant 4
   0a24: INN              Set membership (TOS-1 in set TOS)
   0a25: FJP  $0a80       Jump if TOS false
   0a27: SLDC 01          Short load constant 1
   0a28: SRO  0004        Store global word BASE4
-> 0a2a: SLDO 01          Short load global BASE1
   0a2b: SLDO 01          Short load global BASE1
   0a2c: SIND 00          Short index load *TOS+0
   0a2d: SLDC 0a          Short load constant 10
   0a2e: MPI              Multiply integers (TOS * TOS-1)
   0a2f: SLDO 03          Short load global BASE3
   0a30: ADI              Add integers (TOS + TOS-1)
   0a31: SLDC 30          Short load constant 48
   0a32: SBI              Subtract integers (TOS-1 - TOS)
   0a33: STO              Store indirect (TOS into TOS-1)
   0a34: SLDO 02          Short load global BASE2
   0a35: CBP  07          Call base procedure PASCALSY.FGET
   0a37: LDO  0030        Load global word BASE48
   0a39: SIND 00          Short index load *TOS+0
   0a3a: SLDC 00          Short load constant 0
   0a3b: LDB              Load byte at byte ptr TOS-1 + TOS
   0a3c: SRO  0003        Store global word BASE3
   0a3e: SLDO 06          Short load global BASE6
   0a3f: SLDC 01          Short load constant 1
   0a40: ADI              Add integers (TOS + TOS-1)
   0a41: SRO  0006        Store global word BASE6
   0a43: LDO  0030        Load global word BASE48
   0a45: SIND 07          Short index load *TOS+7
   0a46: SLDC 01          Short load constant 1
   0a47: EQUI             Integer TOS-1 = TOS
   0a48: FJP  $0a71       Jump if TOS false
-> 0a4a: SLDO 03          Short load global BASE3
   0a4b: LAO  0006        Load global BASE6
   0a4d: LAO  0007        Load global BASE7
   0a4f: SLDC 00          Short load constant 0
   0a50: SLDC 00          Short load constant 0
   0a51: CBP  2f          Call base procedure PASCALSY.47
   0a53: FJP  $0a71       Jump if TOS false
   0a55: SLDO 06          Short load global BASE6
   0a56: SLDC 01          Short load constant 1
   0a57: EQUI             Integer TOS-1 = TOS
   0a58: FJP  $0a5f       Jump if TOS false
   0a5a: SLDO 01          Short load global BASE1
   0a5b: SLDC 00          Short load constant 0
   0a5c: STO              Store indirect (TOS into TOS-1)
   0a5d: UJP  $0a65       Unconditional jump
-> 0a5f: SLDO 01          Short load global BASE1
   0a60: SLDO 01          Short load global BASE1
   0a61: SIND 00          Short index load *TOS+0
   0a62: SLDC 0a          Short load constant 10
   0a63: DVI              Divide integers (TOS-1 / TOS)
   0a64: STO              Store indirect (TOS into TOS-1)
-> 0a65: SLDO 02          Short load global BASE2
   0a66: CBP  07          Call base procedure PASCALSY.FGET
   0a68: LDO  0030        Load global word BASE48
   0a6a: SIND 00          Short index load *TOS+0
   0a6b: SLDC 00          Short load constant 0
   0a6c: LDB              Load byte at byte ptr TOS-1 + TOS
   0a6d: SRO  0003        Store global word BASE3
   0a6f: UJP  $0a4a       Unconditional jump
-> 0a71: SLDO 03          Short load global BASE3
   0a72: LDA  01 007a     Load addr G122
   0a75: LDM  04          Load 4 words from (TOS)
   0a77: SLDC 04          Short load constant 4
   0a78: INN              Set membership (TOS-1 in set TOS)
   0a79: LNOT             Logical NOT (~TOS)
   0a7a: LDO  0030        Load global word BASE48
   0a7c: SIND 01          Short index load *TOS+1
   0a7d: LOR              Logical OR (TOS | TOS-1)
   0a7e: FJP  $0a2a       Jump if TOS false
-> 0a80: SLDO 04          Short load global BASE4
   0a81: LDO  0030        Load global word BASE48
   0a83: SIND 02          Short index load *TOS+2
   0a84: LOR              Logical OR (TOS | TOS-1)
   0a85: FJP  $0a93       Jump if TOS false
   0a87: SLDO 05          Short load global BASE5
   0a88: FJP  $0a91       Jump if TOS false
   0a8a: SLDO 01          Short load global BASE1
   0a8b: SLDO 01          Short load global BASE1
   0a8c: SIND 00          Short index load *TOS+0
   0a8d: NGI              Negate integer
   0a8e: STO              Store indirect (TOS into TOS-1)
   0a8f: UJP  $0a91       Unconditional jump
-> 0a91: UJP  $0a98       Unconditional jump
-> 0a93: LOD  01 0001     Load word at G1 (SYSCOM)
   0a96: SLDC 0e          Short load constant 14
   0a97: STO              Store indirect (TOS into TOS-1)
-> 0a98: RBP  00          Return from base procedure
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
-> 0aac: SLDC 01          Short load constant 1
   0aad: SRO  0004        Store global word BASE4
   0aaf: LAO  0008        Load global BASE8
   0ab1: SLDC 00          Short load constant 0
   0ab2: SLDC 0a          Short load constant 10
   0ab3: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0ab4: SLDC 01          Short load constant 1
   0ab5: SRO  0007        Store global word BASE7
   0ab7: SLDO 02          Short load global BASE2
   0ab8: SLDC 00          Short load constant 0
   0ab9: LESI             Integer TOS-1 < TOS
   0aba: FJP  $0adc       Jump if TOS false
   0abc: SLDO 02          Short load global BASE2
   0abd: ABI              Absolute value of integer (TOS)
   0abe: SRO  0002        Store global word BASE2
   0ac0: LAO  0008        Load global BASE8
   0ac2: SLDC 01          Short load constant 1
   0ac3: SLDC 2d          Short load constant 45
   0ac4: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0ac5: SLDC 02          Short load constant 2
   0ac6: SRO  0004        Store global word BASE4
   0ac8: SLDO 02          Short load global BASE2
   0ac9: SLDC 00          Short load constant 0
   0aca: EQUI             Integer TOS-1 = TOS
   0acb: FJP  $0adc       Jump if TOS false
   0acd: LAO  0008        Load global BASE8
   0acf: LSA  06          Load string address: '-32768'
   0ad7: NOP              No operation
   0ad8: SAS  0a          String assign (TOS to TOS-1, 10 chars)
   0ada: UJP  $0b2c       Unconditional jump
-> 0adc: SLDC 04          Short load constant 4
   0add: SRO  0005        Store global word BASE5
   0adf: SLDC 00          Short load constant 0
   0ae0: SRO  000e        Store global word BASE14
-> 0ae2: SLDO 05          Short load global BASE5
   0ae3: SLDO 0e          Short load global BASE14
   0ae4: GEQI             Integer TOS-1 >= TOS
   0ae5: FJP  $0b25       Jump if TOS false
   0ae7: SLDO 02          Short load global BASE2
   0ae8: LDA  01 006f     Load addr G111
   0aeb: SLDO 05          Short load global BASE5
   0aec: IXA  0001        Index array (TOS-1 + TOS * 1)
   0aee: SIND 00          Short index load *TOS+0
   0aef: DVI              Divide integers (TOS-1 / TOS)
   0af0: SLDC 30          Short load constant 48
   0af1: ADI              Add integers (TOS + TOS-1)
   0af2: SRO  0006        Store global word BASE6
   0af4: SLDO 06          Short load global BASE6
   0af5: SLDC 30          Short load constant 48
   0af6: EQUI             Integer TOS-1 = TOS
   0af7: SLDO 05          Short load global BASE5
   0af8: SLDC 00          Short load constant 0
   0af9: GRTI             Integer TOS-1 > TOS
   0afa: LAND             Logical AND (TOS & TOS-1)
   0afb: SLDO 07          Short load global BASE7
   0afc: LAND             Logical AND (TOS & TOS-1)
   0afd: FJP  $0b01       Jump if TOS false
   0aff: UJP  $0b1e       Unconditional jump
-> 0b01: SLDC 00          Short load constant 0
   0b02: SRO  0007        Store global word BASE7
   0b04: LAO  0008        Load global BASE8
   0b06: SLDO 04          Short load global BASE4
   0b07: SLDO 06          Short load global BASE6
   0b08: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0b09: SLDO 04          Short load global BASE4
   0b0a: SLDC 01          Short load constant 1
   0b0b: ADI              Add integers (TOS + TOS-1)
   0b0c: SRO  0004        Store global word BASE4
   0b0e: SLDO 06          Short load global BASE6
   0b0f: SLDC 30          Short load constant 48
   0b10: NEQI             Integer TOS-1 <> TOS
   0b11: FJP  $0b1e       Jump if TOS false
   0b13: SLDO 02          Short load global BASE2
   0b14: LDA  01 006f     Load addr G111
   0b17: SLDO 05          Short load global BASE5
   0b18: IXA  0001        Index array (TOS-1 + TOS * 1)
   0b1a: SIND 00          Short index load *TOS+0
   0b1b: MODI             Modulo integers (TOS-1 % TOS)
   0b1c: SRO  0002        Store global word BASE2
-> 0b1e: SLDO 05          Short load global BASE5
   0b1f: SLDC 01          Short load constant 1
   0b20: SBI              Subtract integers (TOS-1 - TOS)
   0b21: SRO  0005        Store global word BASE5
   0b23: UJP  $0ae2       Unconditional jump
-> 0b25: LAO  0008        Load global BASE8
   0b27: SLDC 00          Short load constant 0
   0b28: SLDO 04          Short load global BASE4
   0b29: SLDC 01          Short load constant 1
   0b2a: SBI              Subtract integers (TOS-1 - TOS)
   0b2b: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0b2c: SLDO 01          Short load global BASE1
   0b2d: LAO  0008        Load global BASE8
   0b2f: SLDC 00          Short load constant 0
   0b30: LDB              Load byte at byte ptr TOS-1 + TOS
   0b31: LESI             Integer TOS-1 < TOS
   0b32: FJP  $0b3a       Jump if TOS false
   0b34: LAO  0008        Load global BASE8
   0b36: SLDC 00          Short load constant 0
   0b37: LDB              Load byte at byte ptr TOS-1 + TOS
   0b38: SRO  0001        Store global word BASE1
-> 0b3a: SLDO 03          Short load global BASE3
   0b3b: LAO  0008        Load global BASE8
   0b3d: SLDO 01          Short load global BASE1
   0b3e: CBP  13          Call base procedure PASCALSY.FWRITESTRING
-> 0b40: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XREADREAL (* P=14 LL=0 *)
BEGIN
-> 0b4e: LOD  01 0001     Load word at G1 (SYSCOM)
   0b51: INC  0001        Inc field ptr (TOS+1)
   0b53: SLDC 0b          Short load constant 11
   0b54: STO              Store indirect (TOS into TOS-1)
   0b55: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 0b57: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XWRITEREAL (* P=15 LL=0 *)
BEGIN
-> 0b64: LOD  01 0001     Load word at G1 (SYSCOM)
   0b67: INC  0001        Inc field ptr (TOS+1)
   0b69: SLDC 0b          Short load constant 11
   0b6a: STO              Store indirect (TOS into TOS-1)
   0b6b: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 0b6d: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADCHAR(PARAM1; PARAM2) (* P=16 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0b7a: SLDO 02          Short load global BASE2
   0b7b: SRO  0003        Store global word BASE3
   0b7d: LOD  01 0001     Load word at G1 (SYSCOM)
   0b80: SLDC 00          Short load constant 0
   0b81: STO              Store indirect (TOS into TOS-1)
   0b82: SLDO 03          Short load global BASE3
   0b83: SIND 03          Short index load *TOS+3
   0b84: SLDC 01          Short load constant 1
   0b85: EQUI             Integer TOS-1 = TOS
   0b86: FJP  $0b8b       Jump if TOS false
   0b88: SLDO 02          Short load global BASE2
   0b89: CBP  07          Call base procedure PASCALSY.FGET
-> 0b8b: SLDO 01          Short load global BASE1
   0b8c: SLDO 03          Short load global BASE3
   0b8d: SIND 00          Short index load *TOS+0
   0b8e: SLDC 00          Short load constant 0
   0b8f: LDB              Load byte at byte ptr TOS-1 + TOS
   0b90: STO              Store indirect (TOS into TOS-1)
   0b91: SLDO 03          Short load global BASE3
   0b92: SIND 03          Short index load *TOS+3
   0b93: SLDC 00          Short load constant 0
   0b94: EQUI             Integer TOS-1 = TOS
   0b95: FJP  $0b9c       Jump if TOS false
   0b97: SLDO 02          Short load global BASE2
   0b98: CBP  07          Call base procedure PASCALSY.FGET
   0b9a: UJP  $0ba1       Unconditional jump
-> 0b9c: SLDO 03          Short load global BASE3
   0b9d: INC  0003        Inc field ptr (TOS+3)
   0b9f: SLDC 01          Short load constant 1
   0ba0: STO              Store indirect (TOS into TOS-1)
-> 0ba1: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITECHAR(PARAM1; PARAM2; PARAM3) (* P=17 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 0bae: SLDO 03          Short load global BASE3
   0baf: SRO  0004        Store global word BASE4
   0bb1: SLDO 04          Short load global BASE4
   0bb2: SIND 05          Short index load *TOS+5
   0bb3: FJP  $0c04       Jump if TOS false
   0bb5: SLDO 04          Short load global BASE4
   0bb6: IND  001d        Static index and load word (TOS+29)
   0bb8: FJP  $0bd8       Jump if TOS false
-> 0bba: SLDO 01          Short load global BASE1
   0bbb: SLDC 01          Short load constant 1
   0bbc: GRTI             Integer TOS-1 > TOS
   0bbd: FJP  $0bce       Jump if TOS false
   0bbf: SLDO 04          Short load global BASE4
   0bc0: SIND 00          Short index load *TOS+0
   0bc1: SLDC 00          Short load constant 0
   0bc2: SLDC 20          Short load constant 32
   0bc3: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0bc4: SLDO 03          Short load global BASE3
   0bc5: CBP  08          Call base procedure PASCALSY.FPUT
   0bc7: SLDO 01          Short load global BASE1
   0bc8: SLDC 01          Short load constant 1
   0bc9: SBI              Subtract integers (TOS-1 - TOS)
   0bca: SRO  0001        Store global word BASE1
   0bcc: UJP  $0bba       Unconditional jump
-> 0bce: SLDO 04          Short load global BASE4
   0bcf: SIND 00          Short index load *TOS+0
   0bd0: SLDC 00          Short load constant 0
   0bd1: SLDO 02          Short load global BASE2
   0bd2: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0bd3: SLDO 03          Short load global BASE3
   0bd4: CBP  08          Call base procedure PASCALSY.FPUT
   0bd6: UJP  $0c02       Unconditional jump
-> 0bd8: SLDO 01          Short load global BASE1
   0bd9: SLDC 01          Short load constant 1
   0bda: GRTI             Integer TOS-1 > TOS
   0bdb: FJP  $0bf3       Jump if TOS false
   0bdd: SLDO 04          Short load global BASE4
   0bde: SIND 00          Short index load *TOS+0
   0bdf: SLDC 00          Short load constant 0
   0be0: SLDC 20          Short load constant 32
   0be1: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0be2: SLDO 04          Short load global BASE4
   0be3: SIND 07          Short index load *TOS+7
   0be4: SLDO 04          Short load global BASE4
   0be5: SIND 00          Short index load *TOS+0
   0be6: SLDC 00          Short load constant 0
   0be7: SLDC 01          Short load constant 1
   0be8: SLDC 00          Short load constant 0
   0be9: SLDC 00          Short load constant 0
   0bea: CSP  06          Call standard procedure UNITWRITE
   0bec: SLDO 01          Short load global BASE1
   0bed: SLDC 01          Short load constant 1
   0bee: SBI              Subtract integers (TOS-1 - TOS)
   0bef: SRO  0001        Store global word BASE1
   0bf1: UJP  $0bd8       Unconditional jump
-> 0bf3: SLDO 04          Short load global BASE4
   0bf4: SIND 00          Short index load *TOS+0
   0bf5: SLDC 00          Short load constant 0
   0bf6: SLDO 02          Short load global BASE2
   0bf7: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0bf8: SLDO 04          Short load global BASE4
   0bf9: SIND 07          Short index load *TOS+7
   0bfa: SLDO 04          Short load global BASE4
   0bfb: SIND 00          Short index load *TOS+0
   0bfc: SLDC 00          Short load constant 0
   0bfd: SLDC 01          Short load constant 1
   0bfe: SLDC 00          Short load constant 0
   0bff: SLDC 00          Short load constant 0
   0c00: CSP  06          Call standard procedure UNITWRITE
-> 0c02: UJP  $0c09       Unconditional jump
-> 0c04: LOD  01 0001     Load word at G1 (SYSCOM)
   0c07: SLDC 0d          Short load constant 13
   0c08: STO              Store indirect (TOS into TOS-1)
-> 0c09: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADSTRING(PARAM1; PARAM2; PARAM3) (* P=18 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 0c1a: SLDO 03          Short load global BASE3
   0c1b: SRO  0006        Store global word BASE6
   0c1d: SLDC 01          Short load constant 1
   0c1e: SRO  0004        Store global word BASE4
   0c20: SLDO 06          Short load global BASE6
   0c21: SIND 03          Short index load *TOS+3
   0c22: SLDC 01          Short load constant 1
   0c23: EQUI             Integer TOS-1 = TOS
   0c24: FJP  $0c29       Jump if TOS false
   0c26: SLDO 03          Short load global BASE3
   0c27: CBP  07          Call base procedure PASCALSY.FGET
-> 0c29: SLDO 02          Short load global BASE2
   0c2a: SLDC 00          Short load constant 0
   0c2b: SLDO 01          Short load global BASE1
   0c2c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0c2d: SLDO 04          Short load global BASE4
   0c2e: SLDO 01          Short load global BASE1
   0c2f: LEQI             Integer TOS-1 <= TOS
   0c30: SLDO 06          Short load global BASE6
   0c31: SIND 01          Short index load *TOS+1
   0c32: SLDO 06          Short load global BASE6
   0c33: SIND 02          Short index load *TOS+2
   0c34: LOR              Logical OR (TOS | TOS-1)
   0c35: LNOT             Logical NOT (~TOS)
   0c36: LAND             Logical AND (TOS & TOS-1)
   0c37: FJP  $0c6a       Jump if TOS false
   0c39: SLDO 06          Short load global BASE6
   0c3a: SIND 00          Short index load *TOS+0
   0c3b: SLDC 00          Short load constant 0
   0c3c: LDB              Load byte at byte ptr TOS-1 + TOS
   0c3d: SRO  0005        Store global word BASE5
   0c3f: SLDO 06          Short load global BASE6
   0c40: SIND 07          Short index load *TOS+7
   0c41: SLDC 01          Short load constant 1
   0c42: EQUI             Integer TOS-1 = TOS
   0c43: FJP  $0c5c       Jump if TOS false
   0c45: SLDO 05          Short load global BASE5
   0c46: LAO  0004        Load global BASE4
   0c48: SLDO 02          Short load global BASE2
   0c49: SLDC 00          Short load constant 0
   0c4a: SLDC 00          Short load constant 0
   0c4b: CBP  2f          Call base procedure PASCALSY.47
   0c4d: FJP  $0c51       Jump if TOS false
   0c4f: UJP  $0c5a       Unconditional jump
-> 0c51: SLDO 02          Short load global BASE2
   0c52: SLDO 04          Short load global BASE4
   0c53: SLDO 05          Short load global BASE5
   0c54: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0c55: SLDO 04          Short load global BASE4
   0c56: SLDC 01          Short load constant 1
   0c57: ADI              Add integers (TOS + TOS-1)
   0c58: SRO  0004        Store global word BASE4
-> 0c5a: UJP  $0c65       Unconditional jump
-> 0c5c: SLDO 02          Short load global BASE2
   0c5d: SLDO 04          Short load global BASE4
   0c5e: SLDO 05          Short load global BASE5
   0c5f: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0c60: SLDO 04          Short load global BASE4
   0c61: SLDC 01          Short load constant 1
   0c62: ADI              Add integers (TOS + TOS-1)
   0c63: SRO  0004        Store global word BASE4
-> 0c65: SLDO 03          Short load global BASE3
   0c66: CBP  07          Call base procedure PASCALSY.FGET
   0c68: UJP  $0c2d       Unconditional jump
-> 0c6a: SLDO 02          Short load global BASE2
   0c6b: SLDC 00          Short load constant 0
   0c6c: SLDO 04          Short load global BASE4
   0c6d: SLDC 01          Short load constant 1
   0c6e: SBI              Subtract integers (TOS-1 - TOS)
   0c6f: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0c70: SLDO 06          Short load global BASE6
   0c71: SIND 01          Short index load *TOS+1
   0c72: LNOT             Logical NOT (~TOS)
   0c73: FJP  $0c7a       Jump if TOS false
   0c75: SLDO 03          Short load global BASE3
   0c76: CBP  07          Call base procedure PASCALSY.FGET
   0c78: UJP  $0c70       Unconditional jump
-> 0c7a: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITESTRING(PARAM1; PARAM2; PARAM3) (* P=19 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 0c8a: SLDO 03          Short load global BASE3
   0c8b: SRO  0005        Store global word BASE5
   0c8d: SLDO 05          Short load global BASE5
   0c8e: SIND 05          Short index load *TOS+5
   0c8f: FJP  $0cde       Jump if TOS false
   0c91: SLDO 01          Short load global BASE1
   0c92: SLDC 00          Short load constant 0
   0c93: LEQI             Integer TOS-1 <= TOS
   0c94: FJP  $0c9b       Jump if TOS false
   0c96: SLDO 02          Short load global BASE2
   0c97: SLDC 00          Short load constant 0
   0c98: LDB              Load byte at byte ptr TOS-1 + TOS
   0c99: SRO  0001        Store global word BASE1
-> 0c9b: SLDO 01          Short load global BASE1
   0c9c: SLDO 02          Short load global BASE2
   0c9d: SLDC 00          Short load constant 0
   0c9e: LDB              Load byte at byte ptr TOS-1 + TOS
   0c9f: GRTI             Integer TOS-1 > TOS
   0ca0: FJP  $0cb0       Jump if TOS false
   0ca2: SLDO 03          Short load global BASE3
   0ca3: SLDC 20          Short load constant 32
   0ca4: SLDO 01          Short load global BASE1
   0ca5: SLDO 02          Short load global BASE2
   0ca6: SLDC 00          Short load constant 0
   0ca7: LDB              Load byte at byte ptr TOS-1 + TOS
   0ca8: SBI              Subtract integers (TOS-1 - TOS)
   0ca9: CBP  11          Call base procedure PASCALSY.FWRITECHAR
   0cab: SLDO 02          Short load global BASE2
   0cac: SLDC 00          Short load constant 0
   0cad: LDB              Load byte at byte ptr TOS-1 + TOS
   0cae: SRO  0001        Store global word BASE1
-> 0cb0: SLDO 05          Short load global BASE5
   0cb1: IND  001d        Static index and load word (TOS+29)
   0cb3: FJP  $0cd3       Jump if TOS false
   0cb5: SLDC 01          Short load constant 1
   0cb6: SRO  0004        Store global word BASE4
   0cb8: SLDO 01          Short load global BASE1
   0cb9: SRO  0006        Store global word BASE6
-> 0cbb: SLDO 04          Short load global BASE4
   0cbc: SLDO 06          Short load global BASE6
   0cbd: LEQI             Integer TOS-1 <= TOS
   0cbe: FJP  $0cd1       Jump if TOS false
   0cc0: SLDO 05          Short load global BASE5
   0cc1: SIND 00          Short index load *TOS+0
   0cc2: SLDC 00          Short load constant 0
   0cc3: SLDO 02          Short load global BASE2
   0cc4: SLDO 04          Short load global BASE4
   0cc5: LDB              Load byte at byte ptr TOS-1 + TOS
   0cc6: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0cc7: SLDO 03          Short load global BASE3
   0cc8: CBP  08          Call base procedure PASCALSY.FPUT
   0cca: SLDO 04          Short load global BASE4
   0ccb: SLDC 01          Short load constant 1
   0ccc: ADI              Add integers (TOS + TOS-1)
   0ccd: SRO  0004        Store global word BASE4
   0ccf: UJP  $0cbb       Unconditional jump
-> 0cd1: UJP  $0cdc       Unconditional jump
-> 0cd3: SLDO 05          Short load global BASE5
   0cd4: SIND 07          Short index load *TOS+7
   0cd5: SLDO 02          Short load global BASE2
   0cd6: SLDC 01          Short load constant 1
   0cd7: SLDO 01          Short load global BASE1
   0cd8: SLDC 00          Short load constant 0
   0cd9: SLDC 00          Short load constant 0
   0cda: CSP  06          Call standard procedure UNITWRITE
-> 0cdc: UJP  $0ce3       Unconditional jump
-> 0cde: LOD  01 0001     Load word at G1 (SYSCOM)
   0ce1: SLDC 0d          Short load constant 13
   0ce2: STO              Store indirect (TOS into TOS-1)
-> 0ce3: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITEBYTES(PARAM1; PARAM2; PARAM3; PARAM4) (* P=20 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
  BASE6
BEGIN
-> 0cf2: SLDO 04          Short load global BASE4
   0cf3: SRO  0006        Store global word BASE6
   0cf5: SLDO 06          Short load global BASE6
   0cf6: SIND 05          Short index load *TOS+5
   0cf7: FJP  $0d37       Jump if TOS false
   0cf9: SLDO 02          Short load global BASE2
   0cfa: SLDO 01          Short load global BASE1
   0cfb: GRTI             Integer TOS-1 > TOS
   0cfc: FJP  $0d08       Jump if TOS false
   0cfe: SLDO 04          Short load global BASE4
   0cff: SLDC 20          Short load constant 32
   0d00: SLDO 02          Short load global BASE2
   0d01: SLDO 01          Short load global BASE1
   0d02: SBI              Subtract integers (TOS-1 - TOS)
   0d03: CBP  11          Call base procedure PASCALSY.FWRITECHAR
   0d05: SLDO 01          Short load global BASE1
   0d06: SRO  0002        Store global word BASE2
-> 0d08: SLDO 06          Short load global BASE6
   0d09: IND  001d        Static index and load word (TOS+29)
   0d0b: FJP  $0d2c       Jump if TOS false
   0d0d: SLDC 00          Short load constant 0
   0d0e: SRO  0005        Store global word BASE5
-> 0d10: SLDO 05          Short load global BASE5
   0d11: SLDO 02          Short load global BASE2
   0d12: LESI             Integer TOS-1 < TOS
   0d13: SLDO 06          Short load global BASE6
   0d14: SIND 02          Short index load *TOS+2
   0d15: LNOT             Logical NOT (~TOS)
   0d16: LAND             Logical AND (TOS & TOS-1)
   0d17: FJP  $0d2a       Jump if TOS false
   0d19: SLDO 06          Short load global BASE6
   0d1a: SIND 00          Short index load *TOS+0
   0d1b: SLDC 00          Short load constant 0
   0d1c: SLDO 03          Short load global BASE3
   0d1d: SLDO 05          Short load global BASE5
   0d1e: LDB              Load byte at byte ptr TOS-1 + TOS
   0d1f: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0d20: SLDO 04          Short load global BASE4
   0d21: CBP  08          Call base procedure PASCALSY.FPUT
   0d23: SLDO 05          Short load global BASE5
   0d24: SLDC 01          Short load constant 1
   0d25: ADI              Add integers (TOS + TOS-1)
   0d26: SRO  0005        Store global word BASE5
   0d28: UJP  $0d10       Unconditional jump
-> 0d2a: UJP  $0d35       Unconditional jump
-> 0d2c: SLDO 06          Short load global BASE6
   0d2d: SIND 07          Short index load *TOS+7
   0d2e: SLDO 03          Short load global BASE3
   0d2f: SLDC 00          Short load constant 0
   0d30: SLDO 02          Short load global BASE2
   0d31: SLDC 00          Short load constant 0
   0d32: SLDC 00          Short load constant 0
   0d33: CSP  06          Call standard procedure UNITWRITE
-> 0d35: UJP  $0d3c       Unconditional jump
-> 0d37: LOD  01 0001     Load word at G1 (SYSCOM)
   0d3a: SLDC 0d          Short load constant 13
   0d3b: STO              Store indirect (TOS into TOS-1)
-> 0d3c: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADLN(PARAM1) (* P=21 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 0d4a: SLDO 01          Short load global BASE1
   0d4b: SIND 01          Short index load *TOS+1
   0d4c: LNOT             Logical NOT (~TOS)
   0d4d: FJP  $0d54       Jump if TOS false
   0d4f: SLDO 01          Short load global BASE1
   0d50: CBP  07          Call base procedure PASCALSY.FGET
   0d52: UJP  $0d4a       Unconditional jump
-> 0d54: SLDO 01          Short load global BASE1
   0d55: SIND 03          Short index load *TOS+3
   0d56: SLDC 00          Short load constant 0
   0d57: EQUI             Integer TOS-1 = TOS
   0d58: FJP  $0d5f       Jump if TOS false
   0d5a: SLDO 01          Short load global BASE1
   0d5b: CBP  07          Call base procedure PASCALSY.FGET
   0d5d: UJP  $0d69       Unconditional jump
-> 0d5f: SLDO 01          Short load global BASE1
   0d60: INC  0003        Inc field ptr (TOS+3)
   0d62: SLDC 01          Short load constant 1
   0d63: STO              Store indirect (TOS into TOS-1)
   0d64: SLDO 01          Short load global BASE1
   0d65: INC  0001        Inc field ptr (TOS+1)
   0d67: SLDC 00          Short load constant 0
   0d68: STO              Store indirect (TOS into TOS-1)
-> 0d69: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITELN(PARAM1) (* P=22 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 0d78: SLDO 01          Short load global BASE1
   0d79: SIND 00          Short index load *TOS+0
   0d7a: SLDC 00          Short load constant 0
   0d7b: SLDC 0d          Short load constant 13
   0d7c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0d7d: SLDO 01          Short load global BASE1
   0d7e: CBP  08          Call base procedure PASCALSY.FPUT
-> 0d80: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCONCAT(PARAM1; PARAM2; PARAM3) (* P=23 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 0000: SLDO 02          Short load global BASE2
   0001: SLDC 00          Short load constant 0
   0002: LDB              Load byte at byte ptr TOS-1 + TOS
   0003: SLDO 03          Short load global BASE3
   0004: SLDC 00          Short load constant 0
   0005: LDB              Load byte at byte ptr TOS-1 + TOS
   0006: ADI              Add integers (TOS + TOS-1)
   0007: SLDO 01          Short load global BASE1
   0008: LEQI             Integer TOS-1 <= TOS
   0009: FJP  $0022       Jump if TOS false
   000b: SLDO 02          Short load global BASE2
   000c: SLDC 01          Short load constant 1
   000d: SLDO 03          Short load global BASE3
   000e: SLDO 03          Short load global BASE3
   000f: SLDC 00          Short load constant 0
   0010: LDB              Load byte at byte ptr TOS-1 + TOS
   0011: SLDC 01          Short load constant 1
   0012: ADI              Add integers (TOS + TOS-1)
   0013: SLDO 02          Short load global BASE2
   0014: SLDC 00          Short load constant 0
   0015: LDB              Load byte at byte ptr TOS-1 + TOS
   0016: CSP  02          Call standard procedure MOVL
   0018: SLDO 03          Short load global BASE3
   0019: SLDC 00          Short load constant 0
   001a: SLDO 02          Short load global BASE2
   001b: SLDC 00          Short load constant 0
   001c: LDB              Load byte at byte ptr TOS-1 + TOS
   001d: SLDO 03          Short load global BASE3
   001e: SLDC 00          Short load constant 0
   001f: LDB              Load byte at byte ptr TOS-1 + TOS
   0020: ADI              Add integers (TOS + TOS-1)
   0021: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0022: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SINSERT(PARAM1; PARAM2; PARAM3; PARAM4) (* P=24 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
BEGIN
-> 002e: SLDO 01          Short load global BASE1
   002f: SLDC 00          Short load constant 0
   0030: GRTI             Integer TOS-1 > TOS
   0031: SLDO 04          Short load global BASE4
   0032: SLDC 00          Short load constant 0
   0033: LDB              Load byte at byte ptr TOS-1 + TOS
   0034: SLDC 00          Short load constant 0
   0035: GRTI             Integer TOS-1 > TOS
   0036: LAND             Logical AND (TOS & TOS-1)
   0037: SLDO 04          Short load global BASE4
   0038: SLDC 00          Short load constant 0
   0039: LDB              Load byte at byte ptr TOS-1 + TOS
   003a: SLDO 03          Short load global BASE3
   003b: SLDC 00          Short load constant 0
   003c: LDB              Load byte at byte ptr TOS-1 + TOS
   003d: ADI              Add integers (TOS + TOS-1)
   003e: SLDO 02          Short load global BASE2
   003f: LEQI             Integer TOS-1 <= TOS
   0040: LAND             Logical AND (TOS & TOS-1)
   0041: FJP  $0077       Jump if TOS false
   0043: SLDO 03          Short load global BASE3
   0044: SLDC 00          Short load constant 0
   0045: LDB              Load byte at byte ptr TOS-1 + TOS
   0046: SLDO 01          Short load global BASE1
   0047: SBI              Subtract integers (TOS-1 - TOS)
   0048: SLDC 01          Short load constant 1
   0049: ADI              Add integers (TOS + TOS-1)
   004a: SRO  0005        Store global word BASE5
   004c: SLDO 05          Short load global BASE5
   004d: SLDC 00          Short load constant 0
   004e: GRTI             Integer TOS-1 > TOS
   004f: FJP  $005f       Jump if TOS false
   0051: SLDO 03          Short load global BASE3
   0052: SLDO 01          Short load global BASE1
   0053: SLDO 03          Short load global BASE3
   0054: SLDO 01          Short load global BASE1
   0055: SLDO 04          Short load global BASE4
   0056: SLDC 00          Short load constant 0
   0057: LDB              Load byte at byte ptr TOS-1 + TOS
   0058: ADI              Add integers (TOS + TOS-1)
   0059: SLDO 05          Short load global BASE5
   005a: CSP  03          Call standard procedure MOVR
   005c: SLDC 00          Short load constant 0
   005d: SRO  0005        Store global word BASE5
-> 005f: SLDO 05          Short load global BASE5
   0060: SLDC 00          Short load constant 0
   0061: EQUI             Integer TOS-1 = TOS
   0062: FJP  $0077       Jump if TOS false
   0064: SLDO 04          Short load global BASE4
   0065: SLDC 01          Short load constant 1
   0066: SLDO 03          Short load global BASE3
   0067: SLDO 01          Short load global BASE1
   0068: SLDO 04          Short load global BASE4
   0069: SLDC 00          Short load constant 0
   006a: LDB              Load byte at byte ptr TOS-1 + TOS
   006b: CSP  02          Call standard procedure MOVL
   006d: SLDO 03          Short load global BASE3
   006e: SLDC 00          Short load constant 0
   006f: SLDO 03          Short load global BASE3
   0070: SLDC 00          Short load constant 0
   0071: LDB              Load byte at byte ptr TOS-1 + TOS
   0072: SLDO 04          Short load global BASE4
   0073: SLDC 00          Short load constant 0
   0074: LDB              Load byte at byte ptr TOS-1 + TOS
   0075: ADI              Add integers (TOS + TOS-1)
   0076: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0077: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCOPY(PARAM1; PARAM2; PARAM3; PARAM4) (* P=25 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
BEGIN
-> 0084: SLDO 03          Short load global BASE3
   0085: LSA  00          Load string address: ''
   0087: NOP              No operation
   0088: SAS  50          String assign (TOS to TOS-1, 80 chars)
   008a: SLDO 02          Short load global BASE2
   008b: SLDC 00          Short load constant 0
   008c: GRTI             Integer TOS-1 > TOS
   008d: SLDO 01          Short load global BASE1
   008e: SLDC 00          Short load constant 0
   008f: GRTI             Integer TOS-1 > TOS
   0090: LAND             Logical AND (TOS & TOS-1)
   0091: SLDO 02          Short load global BASE2
   0092: SLDO 01          Short load global BASE1
   0093: ADI              Add integers (TOS + TOS-1)
   0094: SLDC 01          Short load constant 1
   0095: SBI              Subtract integers (TOS-1 - TOS)
   0096: SLDO 04          Short load global BASE4
   0097: SLDC 00          Short load constant 0
   0098: LDB              Load byte at byte ptr TOS-1 + TOS
   0099: LEQI             Integer TOS-1 <= TOS
   009a: LAND             Logical AND (TOS & TOS-1)
   009b: FJP  $00a8       Jump if TOS false
   009d: SLDO 04          Short load global BASE4
   009e: SLDO 02          Short load global BASE2
   009f: SLDO 03          Short load global BASE3
   00a0: SLDC 01          Short load constant 1
   00a1: SLDO 01          Short load global BASE1
   00a2: CSP  02          Call standard procedure MOVL
   00a4: SLDO 03          Short load global BASE3
   00a5: SLDC 00          Short load constant 0
   00a6: SLDO 01          Short load global BASE1
   00a7: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 00a8: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SDELETE(PARAM1; PARAM2; PARAM3) (* P=26 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 00b4: SLDO 02          Short load global BASE2
   00b5: SLDC 00          Short load constant 0
   00b6: GRTI             Integer TOS-1 > TOS
   00b7: SLDO 01          Short load global BASE1
   00b8: SLDC 00          Short load constant 0
   00b9: GRTI             Integer TOS-1 > TOS
   00ba: LAND             Logical AND (TOS & TOS-1)
   00bb: FJP  $00eb       Jump if TOS false
   00bd: SLDO 03          Short load global BASE3
   00be: SLDC 00          Short load constant 0
   00bf: LDB              Load byte at byte ptr TOS-1 + TOS
   00c0: SLDO 02          Short load global BASE2
   00c1: SBI              Subtract integers (TOS-1 - TOS)
   00c2: SLDO 01          Short load global BASE1
   00c3: SBI              Subtract integers (TOS-1 - TOS)
   00c4: SLDC 01          Short load constant 1
   00c5: ADI              Add integers (TOS + TOS-1)
   00c6: SRO  0004        Store global word BASE4
   00c8: SLDO 04          Short load global BASE4
   00c9: SLDC 00          Short load constant 0
   00ca: EQUI             Integer TOS-1 = TOS
   00cb: FJP  $00d5       Jump if TOS false
   00cd: SLDO 03          Short load global BASE3
   00ce: SLDC 00          Short load constant 0
   00cf: SLDO 02          Short load global BASE2
   00d0: SLDC 01          Short load constant 1
   00d1: SBI              Subtract integers (TOS-1 - TOS)
   00d2: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   00d3: UJP  $00eb       Unconditional jump
-> 00d5: SLDO 04          Short load global BASE4
   00d6: SLDC 00          Short load constant 0
   00d7: GRTI             Integer TOS-1 > TOS
   00d8: FJP  $00eb       Jump if TOS false
   00da: SLDO 03          Short load global BASE3
   00db: SLDO 02          Short load global BASE2
   00dc: SLDO 01          Short load global BASE1
   00dd: ADI              Add integers (TOS + TOS-1)
   00de: SLDO 03          Short load global BASE3
   00df: SLDO 02          Short load global BASE2
   00e0: SLDO 04          Short load global BASE4
   00e1: CSP  02          Call standard procedure MOVL
   00e3: SLDO 03          Short load global BASE3
   00e4: SLDC 00          Short load constant 0
   00e5: SLDO 03          Short load global BASE3
   00e6: SLDC 00          Short load constant 0
   00e7: LDB              Load byte at byte ptr TOS-1 + TOS
   00e8: SLDO 01          Short load global BASE1
   00e9: SBI              Subtract integers (TOS-1 - TOS)
   00ea: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 00eb: RBP  00          Return from base procedure
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
-> 00f8: SLDC 00          Short load constant 0
   00f9: SRO  0001        Store global word BASE1
   00fb: SLDO 04          Short load global BASE4
   00fc: SLDC 00          Short load constant 0
   00fd: LDB              Load byte at byte ptr TOS-1 + TOS
   00fe: SLDC 00          Short load constant 0
   00ff: GRTI             Integer TOS-1 > TOS
   0100: FJP  $0153       Jump if TOS false
   0102: SLDO 04          Short load global BASE4
   0103: SLDC 01          Short load constant 1
   0104: LDB              Load byte at byte ptr TOS-1 + TOS
   0105: SRO  0007        Store global word BASE7
   0107: SLDC 01          Short load constant 1
   0108: SRO  0006        Store global word BASE6
   010a: SLDO 03          Short load global BASE3
   010b: SLDC 00          Short load constant 0
   010c: LDB              Load byte at byte ptr TOS-1 + TOS
   010d: SLDO 04          Short load global BASE4
   010e: SLDC 00          Short load constant 0
   010f: LDB              Load byte at byte ptr TOS-1 + TOS
   0110: SBI              Subtract integers (TOS-1 - TOS)
   0111: SLDC 01          Short load constant 1
   0112: ADI              Add integers (TOS + TOS-1)
   0113: SRO  0005        Store global word BASE5
   0115: LAO  0008        Load global BASE8
   0117: SLDC 00          Short load constant 0
   0118: SLDO 04          Short load global BASE4
   0119: SLDC 00          Short load constant 0
   011a: LDB              Load byte at byte ptr TOS-1 + TOS
   011b: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 011c: SLDO 06          Short load global BASE6
   011d: SLDO 05          Short load global BASE5
   011e: LEQI             Integer TOS-1 <= TOS
   011f: FJP  $0153       Jump if TOS false
   0121: SLDO 06          Short load global BASE6
   0122: SLDO 05          Short load global BASE5
   0123: SLDO 06          Short load global BASE6
   0124: SBI              Subtract integers (TOS-1 - TOS)
   0125: SLDC 00          Short load constant 0
   0126: SLDO 07          Short load global BASE7
   0127: SLDO 03          Short load global BASE3
   0128: SLDO 06          Short load global BASE6
   0129: SLDC 00          Short load constant 0
   012a: CSP  0b          Call standard procedure SCAN
   012c: ADI              Add integers (TOS + TOS-1)
   012d: SRO  0006        Store global word BASE6
   012f: SLDO 06          Short load global BASE6
   0130: SLDO 05          Short load global BASE5
   0131: GRTI             Integer TOS-1 > TOS
   0132: FJP  $0136       Jump if TOS false
   0134: UJP  $0153       Unconditional jump
-> 0136: SLDO 03          Short load global BASE3
   0137: SLDO 06          Short load global BASE6
   0138: LAO  0008        Load global BASE8
   013a: SLDC 01          Short load constant 1
   013b: SLDO 04          Short load global BASE4
   013c: SLDC 00          Short load constant 0
   013d: LDB              Load byte at byte ptr TOS-1 + TOS
   013e: CSP  02          Call standard procedure MOVL
   0140: LAO  0008        Load global BASE8
   0142: SLDO 04          Short load global BASE4
   0143: EQLSTR           String TOS-1 = TOS
   0145: FJP  $014c       Jump if TOS false
   0147: SLDO 06          Short load global BASE6
   0148: SRO  0001        Store global word BASE1
   014a: UJP  $0153       Unconditional jump
-> 014c: SLDO 06          Short load global BASE6
   014d: SLDC 01          Short load constant 1
   014e: ADI              Add integers (TOS + TOS-1)
   014f: SRO  0006        Store global word BASE6
   0151: UJP  $011c       Unconditional jump
-> 0153: RBP  01          Return from base procedure
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
-> 0162: SLDC 00          Short load constant 0
   0163: SRO  0001        Store global word BASE1
   0165: LOD  01 0001     Load word at G1 (SYSCOM)
   0168: SLDC 00          Short load constant 0
   0169: STO              Store indirect (TOS into TOS-1)
   016a: SLDO 08          Short load global BASE8
   016b: SRO  0009        Store global word BASE9
   016d: SLDO 09          Short load global BASE9
   016e: SIND 05          Short index load *TOS+5
   016f: SLDO 05          Short load global BASE5
   0170: SLDC 00          Short load constant 0
   0171: GEQI             Integer TOS-1 >= TOS
   0172: LAND             Logical AND (TOS & TOS-1)
   0173: FJP  $0245       Jump if TOS false
   0175: SLDO 09          Short load global BASE9
   0176: SIND 06          Short index load *TOS+6
   0177: FJP  $01f8       Jump if TOS false
   0179: SLDO 09          Short load global BASE9
   017a: INC  0010        Inc field ptr (TOS+16)
   017c: SRO  000a        Store global word BASE10
   017e: SLDO 04          Short load global BASE4
   017f: SLDC 00          Short load constant 0
   0180: LESI             Integer TOS-1 < TOS
   0181: FJP  $0188       Jump if TOS false
   0183: SLDO 09          Short load global BASE9
   0184: IND  000d        Static index and load word (TOS+13)
   0186: SRO  0004        Store global word BASE4
-> 0188: SLDO 0a          Short load global BASE10
   0189: SIND 00          Short index load *TOS+0
   018a: SLDO 04          Short load global BASE4
   018b: ADI              Add integers (TOS + TOS-1)
   018c: SRO  0004        Store global word BASE4
   018e: SLDO 04          Short load global BASE4
   018f: SLDO 05          Short load global BASE5
   0190: ADI              Add integers (TOS + TOS-1)
   0191: SLDO 0a          Short load global BASE10
   0192: SIND 01          Short index load *TOS+1
   0193: GRTI             Integer TOS-1 > TOS
   0194: FJP  $01a1       Jump if TOS false
   0196: SLDO 03          Short load global BASE3
   0197: LNOT             Logical NOT (~TOS)
   0198: FJP  $01a1       Jump if TOS false
   019a: SLDO 08          Short load global BASE8
   019b: SLDC 00          Short load constant 0
   019c: SLDC 00          Short load constant 0
   019d: CBP  33          Call base procedure PASCALSY.51
   019f: FJP  $01a1       Jump if TOS false
-> 01a1: SLDO 04          Short load global BASE4
   01a2: SLDO 05          Short load global BASE5
   01a3: ADI              Add integers (TOS + TOS-1)
   01a4: SLDO 0a          Short load global BASE10
   01a5: SIND 01          Short index load *TOS+1
   01a6: GRTI             Integer TOS-1 > TOS
   01a7: FJP  $01af       Jump if TOS false
   01a9: SLDO 0a          Short load global BASE10
   01aa: SIND 01          Short index load *TOS+1
   01ab: SLDO 04          Short load global BASE4
   01ac: SBI              Subtract integers (TOS-1 - TOS)
   01ad: SRO  0005        Store global word BASE5
-> 01af: SLDO 09          Short load global BASE9
   01b0: INC  0002        Inc field ptr (TOS+2)
   01b2: SLDO 04          Short load global BASE4
   01b3: SLDO 0a          Short load global BASE10
   01b4: SIND 01          Short index load *TOS+1
   01b5: GEQI             Integer TOS-1 >= TOS
   01b6: STO              Store indirect (TOS into TOS-1)
   01b7: SLDO 09          Short load global BASE9
   01b8: SIND 02          Short index load *TOS+2
   01b9: LNOT             Logical NOT (~TOS)
   01ba: FJP  $01f6       Jump if TOS false
   01bc: SLDO 09          Short load global BASE9
   01bd: SIND 07          Short index load *TOS+7
   01be: SLDO 07          Short load global BASE7
   01bf: SLDO 06          Short load global BASE6
   01c0: SLDO 05          Short load global BASE5
   01c1: SLDO 04          Short load global BASE4
   01c2: SLDO 03          Short load global BASE3
   01c3: CLP  34          Call local procedure PASCALSY.52
   01c5: SLDO 03          Short load global BASE3
   01c6: LNOT             Logical NOT (~TOS)
   01c7: FJP  $01ce       Jump if TOS false
   01c9: SLDO 09          Short load global BASE9
   01ca: INC  000f        Inc field ptr (TOS+15)
   01cc: SLDC 01          Short load constant 1
   01cd: STO              Store indirect (TOS into TOS-1)
-> 01ce: SLDO 05          Short load global BASE5
   01cf: SRO  0001        Store global word BASE1
   01d1: SLDO 04          Short load global BASE4
   01d2: SLDO 05          Short load global BASE5
   01d3: ADI              Add integers (TOS + TOS-1)
   01d4: SRO  0004        Store global word BASE4
   01d6: SLDO 09          Short load global BASE9
   01d7: INC  0002        Inc field ptr (TOS+2)
   01d9: SLDO 04          Short load global BASE4
   01da: SLDO 0a          Short load global BASE10
   01db: SIND 01          Short index load *TOS+1
   01dc: EQUI             Integer TOS-1 = TOS
   01dd: STO              Store indirect (TOS into TOS-1)
   01de: SLDO 09          Short load global BASE9
   01df: INC  000d        Inc field ptr (TOS+13)
   01e1: SLDO 04          Short load global BASE4
   01e2: SLDO 0a          Short load global BASE10
   01e3: SIND 00          Short index load *TOS+0
   01e4: SBI              Subtract integers (TOS-1 - TOS)
   01e5: STO              Store indirect (TOS into TOS-1)
   01e6: SLDO 09          Short load global BASE9
   01e7: IND  000d        Static index and load word (TOS+13)
   01e9: SLDO 09          Short load global BASE9
   01ea: IND  000c        Static index and load word (TOS+12)
   01ec: GRTI             Integer TOS-1 > TOS
   01ed: FJP  $01f6       Jump if TOS false
   01ef: SLDO 09          Short load global BASE9
   01f0: INC  000c        Inc field ptr (TOS+12)
   01f2: SLDO 09          Short load global BASE9
   01f3: IND  000d        Static index and load word (TOS+13)
   01f5: STO              Store indirect (TOS into TOS-1)
-> 01f6: UJP  $0243       Unconditional jump
-> 01f8: SLDO 05          Short load global BASE5
   01f9: SRO  0001        Store global word BASE1
   01fb: SLDO 09          Short load global BASE9
   01fc: SIND 07          Short index load *TOS+7
   01fd: SLDO 07          Short load global BASE7
   01fe: SLDO 06          Short load global BASE6
   01ff: SLDO 05          Short load global BASE5
   0200: SLDO 04          Short load global BASE4
   0201: SLDO 03          Short load global BASE3
   0202: CLP  34          Call local procedure PASCALSY.52
   0204: CSP  22          Call standard procedure IORESULT
   0206: SLDC 00          Short load constant 0
   0207: EQUI             Integer TOS-1 = TOS
   0208: FJP  $0240       Jump if TOS false
   020a: SLDO 03          Short load global BASE3
   020b: FJP  $023e       Jump if TOS false
   020d: SLDO 05          Short load global BASE5
   020e: LDCI 0200        Load word 512
   0211: MPI              Multiply integers (TOS * TOS-1)
   0212: SRO  0004        Store global word BASE4
   0214: SLDO 04          Short load global BASE4
   0215: SLDO 04          Short load global BASE4
   0216: NGI              Negate integer
   0217: SLDC 01          Short load constant 1
   0218: SLDC 00          Short load constant 0
   0219: SLDO 07          Short load global BASE7
   021a: SLDO 06          Short load global BASE6
   021b: SLDO 04          Short load global BASE4
   021c: ADI              Add integers (TOS + TOS-1)
   021d: SLDC 01          Short load constant 1
   021e: SBI              Subtract integers (TOS-1 - TOS)
   021f: SLDC 00          Short load constant 0
   0220: CSP  0b          Call standard procedure SCAN
   0222: ADI              Add integers (TOS + TOS-1)
   0223: SRO  0004        Store global word BASE4
   0225: SLDO 04          Short load global BASE4
   0226: LDCI 0200        Load word 512
   0229: ADI              Add integers (TOS + TOS-1)
   022a: SLDC 01          Short load constant 1
   022b: SBI              Subtract integers (TOS-1 - TOS)
   022c: LDCI 0200        Load word 512
   022f: DVI              Divide integers (TOS-1 / TOS)
   0230: SRO  0004        Store global word BASE4
   0232: SLDO 04          Short load global BASE4
   0233: SRO  0001        Store global word BASE1
   0235: SLDO 09          Short load global BASE9
   0236: INC  0002        Inc field ptr (TOS+2)
   0238: SLDO 04          Short load global BASE4
   0239: SLDO 05          Short load global BASE5
   023a: LESI             Integer TOS-1 < TOS
   023b: STO              Store indirect (TOS into TOS-1)
   023c: UJP  $023e       Unconditional jump
-> 023e: UJP  $0243       Unconditional jump
-> 0240: SLDC 00          Short load constant 0
   0241: SRO  0001        Store global word BASE1
-> 0243: UJP  $024a       Unconditional jump
-> 0245: LOD  01 0001     Load word at G1 (SYSCOM)
   0248: SLDC 0d          Short load constant 13
   0249: STO              Store indirect (TOS into TOS-1)
-> 024a: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.FGOTOXY(PARAM1; PARAM2) (* P=29 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0258: LOD  01 0001     Load word at G1 (SYSCOM)
   025b: INC  0025        Inc field ptr (TOS+37)
   025d: SRO  0003        Store global word BASE3
   025f: SLDO 02          Short load global BASE2
   0260: SLDC 00          Short load constant 0
   0261: LESI             Integer TOS-1 < TOS
   0262: FJP  $0267       Jump if TOS false
   0264: SLDC 00          Short load constant 0
   0265: SRO  0002        Store global word BASE2
-> 0267: SLDO 02          Short load global BASE2
   0268: SLDO 03          Short load global BASE3
   0269: SIND 01          Short index load *TOS+1
   026a: GRTI             Integer TOS-1 > TOS
   026b: FJP  $0271       Jump if TOS false
   026d: SLDO 03          Short load global BASE3
   026e: SIND 01          Short index load *TOS+1
   026f: SRO  0002        Store global word BASE2
-> 0271: SLDO 01          Short load global BASE1
   0272: SLDC 00          Short load constant 0
   0273: LESI             Integer TOS-1 < TOS
   0274: FJP  $0279       Jump if TOS false
   0276: SLDC 00          Short load constant 0
   0277: SRO  0001        Store global word BASE1
-> 0279: SLDO 01          Short load global BASE1
   027a: SLDO 03          Short load global BASE3
   027b: SIND 00          Short index load *TOS+0
   027c: GRTI             Integer TOS-1 > TOS
   027d: FJP  $0283       Jump if TOS false
   027f: SLDO 03          Short load global BASE3
   0280: SIND 00          Short index load *TOS+0
   0281: SRO  0001        Store global word BASE1
-> 0283: LOD  01 0003     Load word at G3 (OUTPUT)
   0286: SLDC 1e          Short load constant 30
   0287: SLDC 00          Short load constant 0
   0288: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   028b: LOD  01 0003     Load word at G3 (OUTPUT)
   028e: SLDO 02          Short load global BASE2
   028f: SLDC 20          Short load constant 32
   0290: ADI              Add integers (TOS + TOS-1)
   0291: SLDC 00          Short load constant 0
   0292: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0295: LOD  01 0003     Load word at G3 (OUTPUT)
   0298: SLDO 01          Short load global BASE1
   0299: SLDC 20          Short load constant 32
   029a: ADI              Add integers (TOS + TOS-1)
   029b: SLDC 00          Short load constant 0
   029c: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 029f: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC30(PARAM1; PARAM2; PARAM3): RETVAL (* P=30 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM3
  BASE4=PARAM2
  BASE5=PARAM1
  BASE6
  BASE7
  BASE8
  BASE9
  BASE10
  BASE11
BEGIN
-> 02ac: SLDC 00          Short load constant 0
   02ad: SRO  0001        Store global word BASE1
   02af: SLDO 03          Short load global BASE3
   02b0: LDCN             Load constant NIL
   02b1: STO              Store indirect (TOS into TOS-1)
   02b2: SLDC 00          Short load constant 0
   02b3: SRO  0008        Store global word BASE8
   02b5: SLDC 00          Short load constant 0
   02b6: SRO  0007        Store global word BASE7
   02b8: SLDO 05          Short load global BASE5
   02b9: SLDC 00          Short load constant 0
   02ba: LDB              Load byte at byte ptr TOS-1 + TOS
   02bb: SLDC 00          Short load constant 0
   02bc: GRTI             Integer TOS-1 > TOS
   02bd: FJP  $0336       Jump if TOS false
   02bf: SLDO 05          Short load global BASE5
   02c0: SLDC 01          Short load constant 1
   02c1: LDB              Load byte at byte ptr TOS-1 + TOS
   02c2: SLDC 23          Short load constant 35
   02c3: EQUI             Integer TOS-1 = TOS
   02c4: SLDO 05          Short load global BASE5
   02c5: SLDC 00          Short load constant 0
   02c6: LDB              Load byte at byte ptr TOS-1 + TOS
   02c7: SLDC 01          Short load constant 1
   02c8: GRTI             Integer TOS-1 > TOS
   02c9: LAND             Logical AND (TOS & TOS-1)
   02ca: FJP  $0311       Jump if TOS false
   02cc: SLDC 01          Short load constant 1
   02cd: SRO  0008        Store global word BASE8
   02cf: SLDC 00          Short load constant 0
   02d0: SRO  0006        Store global word BASE6
   02d2: SLDC 02          Short load constant 2
   02d3: SRO  000a        Store global word BASE10
-> 02d5: SLDO 05          Short load global BASE5
   02d6: SLDO 0a          Short load global BASE10
   02d7: LDB              Load byte at byte ptr TOS-1 + TOS
   02d8: LDA  01 007a     Load addr G122
   02db: LDM  04          Load 4 words from (TOS)
   02dd: SLDC 04          Short load constant 4
   02de: INN              Set membership (TOS-1 in set TOS)
   02df: FJP  $02ee       Jump if TOS false
   02e1: SLDO 06          Short load global BASE6
   02e2: SLDC 0a          Short load constant 10
   02e3: MPI              Multiply integers (TOS * TOS-1)
   02e4: SLDO 05          Short load global BASE5
   02e5: SLDO 0a          Short load global BASE10
   02e6: LDB              Load byte at byte ptr TOS-1 + TOS
   02e7: ADI              Add integers (TOS + TOS-1)
   02e8: SLDC 30          Short load constant 48
   02e9: SBI              Subtract integers (TOS-1 - TOS)
   02ea: SRO  0006        Store global word BASE6
   02ec: UJP  $02f1       Unconditional jump
-> 02ee: SLDC 00          Short load constant 0
   02ef: SRO  0008        Store global word BASE8
-> 02f1: SLDO 0a          Short load global BASE10
   02f2: SLDC 01          Short load constant 1
   02f3: ADI              Add integers (TOS + TOS-1)
   02f4: SRO  000a        Store global word BASE10
   02f6: SLDO 0a          Short load global BASE10
   02f7: SLDO 05          Short load global BASE5
   02f8: SLDC 00          Short load constant 0
   02f9: LDB              Load byte at byte ptr TOS-1 + TOS
   02fa: GRTI             Integer TOS-1 > TOS
   02fb: SLDO 08          Short load global BASE8
   02fc: LNOT             Logical NOT (~TOS)
   02fd: LOR              Logical OR (TOS | TOS-1)
   02fe: FJP  $02d5       Jump if TOS false
   0300: SLDO 08          Short load global BASE8
   0301: SLDO 06          Short load global BASE6
   0302: SLDC 00          Short load constant 0
   0303: GRTI             Integer TOS-1 > TOS
   0304: LAND             Logical AND (TOS & TOS-1)
   0305: SLDO 06          Short load global BASE6
   0306: SLDC 0c          Short load constant 12
   0307: LEQI             Integer TOS-1 <= TOS
   0308: LAND             Logical AND (TOS & TOS-1)
   0309: SRO  0007        Store global word BASE7
   030b: SLDO 04          Short load global BASE4
   030c: SLDO 07          Short load global BASE7
   030d: LNOT             Logical NOT (~TOS)
   030e: LAND             Logical AND (TOS & TOS-1)
   030f: SRO  0004        Store global word BASE4
-> 0311: SLDO 07          Short load global BASE7
   0312: LNOT             Logical NOT (~TOS)
   0313: FJP  $0336       Jump if TOS false
   0315: SLDC 00          Short load constant 0
   0316: SRO  0008        Store global word BASE8
   0318: SLDC 0c          Short load constant 12
   0319: SRO  0006        Store global word BASE6
-> 031b: SLDO 05          Short load global BASE5
   031c: LDA  01 007e     Load addr G126
   031f: SLDO 06          Short load global BASE6
   0320: IXA  0006        Index array (TOS-1 + TOS * 6)
   0322: EQLSTR           String TOS-1 = TOS
   0324: SRO  0008        Store global word BASE8
   0326: SLDO 08          Short load global BASE8
   0327: LNOT             Logical NOT (~TOS)
   0328: FJP  $032f       Jump if TOS false
   032a: SLDO 06          Short load global BASE6
   032b: SLDC 01          Short load constant 1
   032c: SBI              Subtract integers (TOS-1 - TOS)
   032d: SRO  0006        Store global word BASE6
-> 032f: SLDO 08          Short load global BASE8
   0330: SLDO 06          Short load global BASE6
   0331: SLDC 00          Short load constant 0
   0332: EQUI             Integer TOS-1 = TOS
   0333: LOR              Logical OR (TOS | TOS-1)
   0334: FJP  $031b       Jump if TOS false
-> 0336: SLDO 08          Short load global BASE8
   0337: FJP  $0399       Jump if TOS false
   0339: LDA  01 007e     Load addr G126
   033c: SLDO 06          Short load global BASE6
   033d: IXA  0006        Index array (TOS-1 + TOS * 6)
   033f: SIND 04          Short index load *TOS+4
   0340: FJP  $0399       Jump if TOS false
   0342: LOD  01 0001     Load word at G1 (SYSCOM)
   0345: SRO  000b        Store global word BASE11
   0347: SLDC 00          Short load constant 0
   0348: SRO  0008        Store global word BASE8
   034a: SLDO 0b          Short load global BASE11
   034b: SIND 04          Short index load *TOS+4
   034c: LDCN             Load constant NIL
   034d: NEQI             Integer TOS-1 <> TOS
   034e: FJP  $0371       Jump if TOS false
   0350: SLDO 05          Short load global BASE5
   0351: SLDO 0b          Short load global BASE11
   0352: SIND 04          Short index load *TOS+4
   0353: SLDC 00          Short load constant 0
   0354: IXA  000d        Index array (TOS-1 + TOS * 13)
   0356: INC  0003        Inc field ptr (TOS+3)
   0358: EQLSTR           String TOS-1 = TOS
   035a: FJP  $0371       Jump if TOS false
   035c: LAO  000a        Load global BASE10
   035e: LAO  0009        Load global BASE9
   0360: CSP  09          Call standard procedure TIME
   0362: SLDO 09          Short load global BASE9
   0363: SLDO 0b          Short load global BASE11
   0364: SIND 04          Short index load *TOS+4
   0365: SLDC 00          Short load constant 0
   0366: IXA  000d        Index array (TOS-1 + TOS * 13)
   0368: IND  0009        Static index and load word (TOS+9)
   036a: SBI              Subtract integers (TOS-1 - TOS)
   036b: LDCI 012c        Load word 300
   036e: LEQI             Integer TOS-1 <= TOS
   036f: SRO  0008        Store global word BASE8
-> 0371: SLDO 08          Short load global BASE8
   0372: LNOT             Logical NOT (~TOS)
   0373: FJP  $0399       Jump if TOS false
   0375: SLDO 07          Short load global BASE7
   0376: SRO  0008        Store global word BASE8
   0378: SLDO 06          Short load global BASE6
   0379: SLDC 00          Short load constant 0
   037a: SLDC 00          Short load constant 0
   037b: CBP  2a          Call base procedure PASCALSY.42
   037d: FJP  $0393       Jump if TOS false
   037f: SLDO 07          Short load global BASE7
   0380: LNOT             Logical NOT (~TOS)
   0381: FJP  $0391       Jump if TOS false
   0383: SLDO 05          Short load global BASE5
   0384: SLDO 0b          Short load global BASE11
   0385: SIND 04          Short index load *TOS+4
   0386: SLDC 00          Short load constant 0
   0387: IXA  000d        Index array (TOS-1 + TOS * 13)
   0389: INC  0003        Inc field ptr (TOS+3)
   038b: EQLSTR           String TOS-1 = TOS
   038d: SRO  0008        Store global word BASE8
   038f: UJP  $0391       Unconditional jump
-> 0391: UJP  $0399       Unconditional jump
-> 0393: CSP  22          Call standard procedure IORESULT
   0395: SLDC 00          Short load constant 0
   0396: EQUI             Integer TOS-1 = TOS
   0397: SRO  0008        Store global word BASE8
-> 0399: SLDO 08          Short load global BASE8
   039a: LNOT             Logical NOT (~TOS)
   039b: SLDO 04          Short load global BASE4
   039c: LAND             Logical AND (TOS & TOS-1)
   039d: FJP  $03cb       Jump if TOS false
   039f: SLDC 0c          Short load constant 12
   03a0: SRO  0006        Store global word BASE6
-> 03a2: LDA  01 007e     Load addr G126
   03a5: SLDO 06          Short load global BASE6
   03a6: IXA  0006        Index array (TOS-1 + TOS * 6)
   03a8: SRO  000b        Store global word BASE11
   03aa: SLDO 0b          Short load global BASE11
   03ab: SIND 04          Short index load *TOS+4
   03ac: FJP  $03bb       Jump if TOS false
   03ae: SLDO 06          Short load global BASE6
   03af: SLDC 00          Short load constant 0
   03b0: SLDC 00          Short load constant 0
   03b1: CBP  2a          Call base procedure PASCALSY.42
   03b3: FJP  $03bb       Jump if TOS false
   03b5: SLDO 05          Short load global BASE5
   03b6: SLDO 0b          Short load global BASE11
   03b7: EQLSTR           String TOS-1 = TOS
   03b9: SRO  0008        Store global word BASE8
-> 03bb: SLDO 08          Short load global BASE8
   03bc: LNOT             Logical NOT (~TOS)
   03bd: FJP  $03c4       Jump if TOS false
   03bf: SLDO 06          Short load global BASE6
   03c0: SLDC 01          Short load constant 1
   03c1: SBI              Subtract integers (TOS-1 - TOS)
   03c2: SRO  0006        Store global word BASE6
-> 03c4: SLDO 08          Short load global BASE8
   03c5: SLDO 06          Short load global BASE6
   03c6: SLDC 00          Short load constant 0
   03c7: EQUI             Integer TOS-1 = TOS
   03c8: LOR              Logical OR (TOS | TOS-1)
   03c9: FJP  $03a2       Jump if TOS false
-> 03cb: SLDO 08          Short load global BASE8
   03cc: FJP  $0400       Jump if TOS false
   03ce: LDA  01 007e     Load addr G126
   03d1: SLDO 06          Short load global BASE6
   03d2: IXA  0006        Index array (TOS-1 + TOS * 6)
   03d4: SRO  000b        Store global word BASE11
   03d6: SLDO 06          Short load global BASE6
   03d7: SRO  0001        Store global word BASE1
   03d9: SLDO 0b          Short load global BASE11
   03da: SLDC 00          Short load constant 0
   03db: LDB              Load byte at byte ptr TOS-1 + TOS
   03dc: SLDC 00          Short load constant 0
   03dd: GRTI             Integer TOS-1 > TOS
   03de: FJP  $03e4       Jump if TOS false
   03e0: SLDO 05          Short load global BASE5
   03e1: SLDO 0b          Short load global BASE11
   03e2: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 03e4: SLDO 0b          Short load global BASE11
   03e5: SIND 04          Short index load *TOS+4
   03e6: LOD  01 0001     Load word at G1 (SYSCOM)
   03e9: SIND 04          Short index load *TOS+4
   03ea: LDCN             Load constant NIL
   03eb: NEQI             Integer TOS-1 <> TOS
   03ec: LAND             Logical AND (TOS & TOS-1)
   03ed: FJP  $0400       Jump if TOS false
   03ef: SLDO 03          Short load global BASE3
   03f0: LOD  01 0001     Load word at G1 (SYSCOM)
   03f3: SIND 04          Short index load *TOS+4
   03f4: STO              Store indirect (TOS into TOS-1)
   03f5: LAO  000a        Load global BASE10
   03f7: SLDO 03          Short load global BASE3
   03f8: SIND 00          Short index load *TOS+0
   03f9: SLDC 00          Short load constant 0
   03fa: IXA  000d        Index array (TOS-1 + TOS * 13)
   03fc: INC  0009        Inc field ptr (TOS+9)
   03fe: CSP  09          Call standard procedure TIME
-> 0400: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC31(PARAM1; PARAM2) (* P=31 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
  BASE4
  BASE5
  BASE6
  BASE9
  BASE19
  BASE20
BEGIN
-> 0412: LDA  01 007e     Load addr G126
   0415: SLDO 02          Short load global BASE2
   0416: IXA  0006        Index array (TOS-1 + TOS * 6)
   0418: SRO  0013        Store global word BASE19
   041a: SLDO 01          Short load global BASE1
   041b: SLDC 00          Short load constant 0
   041c: IXA  000d        Index array (TOS-1 + TOS * 13)
   041e: SRO  0014        Store global word BASE20
   0420: LDO  0013        Load global word BASE19
   0422: LDO  0014        Load global word BASE20
   0424: INC  0003        Inc field ptr (TOS+3)
   0426: EQLSTR           String TOS-1 = TOS
   0428: LDO  0014        Load global word BASE20
   042a: INC  0002        Inc field ptr (TOS+2)
   042c: SLDC 04          Short load constant 4
   042d: SLDC 00          Short load constant 0
   042e: LDP              Load packed field (TOS)
   042f: SLDC 00          Short load constant 0
   0430: EQUI             Integer TOS-1 = TOS
   0431: LDO  0014        Load global word BASE20
   0433: INC  0002        Inc field ptr (TOS+2)
   0435: SLDC 04          Short load constant 4
   0436: SLDC 00          Short load constant 0
   0437: LDP              Load packed field (TOS)
   0438: SLDC 08          Short load constant 8
   0439: EQUI             Integer TOS-1 = TOS
   043a: LOR              Logical OR (TOS | TOS-1)
   043b: LAND             Logical AND (TOS & TOS-1)
   043c: SRO  0005        Store global word BASE5
   043e: SLDO 05          Short load global BASE5
   043f: FJP  $04bf       Jump if TOS false
   0441: LAO  0004        Load global BASE4
   0443: LAO  0003        Load global BASE3
   0445: CSP  09          Call standard procedure TIME
   0447: SLDO 03          Short load global BASE3
   0448: LDO  0014        Load global word BASE20
   044a: IND  0009        Static index and load word (TOS+9)
   044c: SBI              Subtract integers (TOS-1 - TOS)
   044d: LDCI 012c        Load word 300
   0450: LEQI             Integer TOS-1 <= TOS
   0451: SLDO 03          Short load global BASE3
   0452: LDO  0014        Load global word BASE20
   0454: IND  0009        Static index and load word (TOS+9)
   0456: SBI              Subtract integers (TOS-1 - TOS)
   0457: SLDC 00          Short load constant 0
   0458: GEQI             Integer TOS-1 >= TOS
   0459: LAND             Logical AND (TOS & TOS-1)
   045a: LOD  01 0001     Load word at G1 (SYSCOM)
   045d: INC  001d        Inc field ptr (TOS+29)
   045f: SLDC 01          Short load constant 1
   0460: SLDC 00          Short load constant 0
   0461: LDP              Load packed field (TOS)
   0462: LAND             Logical AND (TOS & TOS-1)
   0463: SRO  0005        Store global word BASE5
   0465: SLDO 05          Short load global BASE5
   0466: LNOT             Logical NOT (~TOS)
   0467: FJP  $0482       Jump if TOS false
   0469: SLDO 02          Short load global BASE2
   046a: LAO  0006        Load global BASE6
   046c: SLDC 00          Short load constant 0
   046d: SLDC 1a          Short load constant 26
   046e: SLDC 02          Short load constant 2
   046f: SLDC 00          Short load constant 0
   0470: CSP  05          Call standard procedure UNITREAD
   0472: CSP  22          Call standard procedure IORESULT
   0474: SLDC 00          Short load constant 0
   0475: EQUI             Integer TOS-1 = TOS
   0476: FJP  $0482       Jump if TOS false
   0478: LDO  0014        Load global word BASE20
   047a: INC  0003        Inc field ptr (TOS+3)
   047c: LAO  0009        Load global BASE9
   047e: EQLSTR           String TOS-1 = TOS
   0480: SRO  0005        Store global word BASE5
-> 0482: SLDO 05          Short load global BASE5
   0483: FJP  $04bf       Jump if TOS false
   0485: LDO  0014        Load global word BASE20
   0487: SLDC 00          Short load constant 0
   0488: STO              Store indirect (TOS into TOS-1)
   0489: SLDO 02          Short load global BASE2
   048a: SLDO 01          Short load global BASE1
   048b: SLDC 00          Short load constant 0
   048c: LDO  0014        Load global word BASE20
   048e: IND  0008        Static index and load word (TOS+8)
   0490: SLDC 01          Short load constant 1
   0491: ADI              Add integers (TOS + TOS-1)
   0492: SLDC 1a          Short load constant 26
   0493: MPI              Multiply integers (TOS * TOS-1)
   0494: SLDC 02          Short load constant 2
   0495: SLDC 00          Short load constant 0
   0496: CSP  06          Call standard procedure UNITWRITE
   0498: CSP  22          Call standard procedure IORESULT
   049a: SLDC 00          Short load constant 0
   049b: EQUI             Integer TOS-1 = TOS
   049c: SRO  0005        Store global word BASE5
   049e: LDO  0014        Load global word BASE20
   04a0: SIND 01          Short index load *TOS+1
   04a1: SLDC 0a          Short load constant 10
   04a2: EQUI             Integer TOS-1 = TOS
   04a3: FJP  $04b4       Jump if TOS false
   04a5: SLDO 02          Short load global BASE2
   04a6: SLDO 01          Short load global BASE1
   04a7: SLDC 00          Short load constant 0
   04a8: LDO  0014        Load global word BASE20
   04aa: IND  0008        Static index and load word (TOS+8)
   04ac: SLDC 01          Short load constant 1
   04ad: ADI              Add integers (TOS + TOS-1)
   04ae: SLDC 1a          Short load constant 26
   04af: MPI              Multiply integers (TOS * TOS-1)
   04b0: SLDC 06          Short load constant 6
   04b1: SLDC 00          Short load constant 0
   04b2: CSP  06          Call standard procedure UNITWRITE
-> 04b4: SLDO 05          Short load global BASE5
   04b5: FJP  $04bf       Jump if TOS false
   04b7: LAO  0004        Load global BASE4
   04b9: LDO  0014        Load global word BASE20
   04bb: INC  0009        Inc field ptr (TOS+9)
   04bd: CSP  09          Call standard procedure TIME
-> 04bf: SLDO 05          Short load global BASE5
   04c0: LNOT             Logical NOT (~TOS)
   04c1: FJP  $04d2       Jump if TOS false
   04c3: LDO  0013        Load global word BASE19
   04c5: LSA  00          Load string address: ''
   04c7: NOP              No operation
   04c8: SAS  07          String assign (TOS to TOS-1, 7 chars)
   04ca: LDO  0013        Load global word BASE19
   04cc: INC  0005        Inc field ptr (TOS+5)
   04ce: LDCI 7fff        Load word 32767
   04d1: STO              Store indirect (TOS into TOS-1)
-> 04d2: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC32(PARAM1; PARAM2; PARAM3): RETVAL (* P=32 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM3
  BASE4=PARAM2
  BASE5=PARAM1
  BASE6
  BASE7
  BASE8
BEGIN
-> 04de: SLDC 00          Short load constant 0
   04df: SRO  0001        Store global word BASE1
   04e1: SLDC 00          Short load constant 0
   04e2: SRO  0007        Store global word BASE7
   04e4: SLDC 01          Short load constant 1
   04e5: SRO  0006        Store global word BASE6
-> 04e7: SLDO 06          Short load global BASE6
   04e8: SLDO 03          Short load global BASE3
   04e9: SLDC 00          Short load constant 0
   04ea: IXA  000d        Index array (TOS-1 + TOS * 13)
   04ec: IND  0008        Static index and load word (TOS+8)
   04ee: LEQI             Integer TOS-1 <= TOS
   04ef: SLDO 07          Short load global BASE7
   04f0: LNOT             Logical NOT (~TOS)
   04f1: LAND             Logical AND (TOS & TOS-1)
   04f2: FJP  $051c       Jump if TOS false
   04f4: SLDO 03          Short load global BASE3
   04f5: SLDO 06          Short load global BASE6
   04f6: IXA  000d        Index array (TOS-1 + TOS * 13)
   04f8: SRO  0008        Store global word BASE8
   04fa: SLDO 08          Short load global BASE8
   04fb: INC  0003        Inc field ptr (TOS+3)
   04fd: SLDO 05          Short load global BASE5
   04fe: EQLSTR           String TOS-1 = TOS
   0500: FJP  $0515       Jump if TOS false
   0502: SLDO 04          Short load global BASE4
   0503: SLDO 08          Short load global BASE8
   0504: INC  000c        Inc field ptr (TOS+12)
   0506: SLDC 07          Short load constant 7
   0507: SLDC 09          Short load constant 9
   0508: LDP              Load packed field (TOS)
   0509: SLDC 64          Short load constant 100
   050a: NEQI             Integer TOS-1 <> TOS
   050b: EQLBOOL          Boolean TOS-1 = TOS
   050d: FJP  $0515       Jump if TOS false
   050f: SLDO 06          Short load global BASE6
   0510: SRO  0001        Store global word BASE1
   0512: SLDC 01          Short load constant 1
   0513: SRO  0007        Store global word BASE7
-> 0515: SLDO 06          Short load global BASE6
   0516: SLDC 01          Short load constant 1
   0517: ADI              Add integers (TOS + TOS-1)
   0518: SRO  0006        Store global word BASE6
   051a: UJP  $04e7       Unconditional jump
-> 051c: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FUNC33(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5): RETVAL (* P=33 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM5
  BASE4=PARAM4
  BASE5=PARAM3
  BASE6=PARAM2
  BASE7=PARAM1
  BASE8
  BASE49
  BASE50
  BASE51
  BASE52
  BASE53
BEGIN
-> 052a: LAO  0008        Load global BASE8
   052c: SLDO 07          Short load global BASE7
   052d: SAS  50          String assign (TOS to TOS-1, 80 chars)
   052f: SLDO 06          Short load global BASE6
   0530: NOP              No operation
   0531: LSA  00          Load string address: ''
   0533: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0535: SLDO 05          Short load global BASE5
   0536: NOP              No operation
   0537: LSA  00          Load string address: ''
   0539: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   053b: SLDO 04          Short load global BASE4
   053c: SLDC 00          Short load constant 0
   053d: STO              Store indirect (TOS into TOS-1)
   053e: SLDO 03          Short load global BASE3
   053f: SLDC 00          Short load constant 0
   0540: STO              Store indirect (TOS into TOS-1)
   0541: SLDC 00          Short load constant 0
   0542: SRO  0001        Store global word BASE1
   0544: SLDC 01          Short load constant 1
   0545: SRO  0032        Store global word BASE50
-> 0547: LDO  0032        Load global word BASE50
   0549: LAO  0008        Load global BASE8
   054b: SLDC 00          Short load constant 0
   054c: LDB              Load byte at byte ptr TOS-1 + TOS
   054d: LEQI             Integer TOS-1 <= TOS
   054e: FJP  $0585       Jump if TOS false
   0550: LAO  0008        Load global BASE8
   0552: LDO  0032        Load global word BASE50
   0554: LDB              Load byte at byte ptr TOS-1 + TOS
   0555: SRO  0033        Store global word BASE51
   0557: LDO  0033        Load global word BASE51
   0559: SLDC 20          Short load constant 32
   055a: LEQI             Integer TOS-1 <= TOS
   055b: FJP  $0567       Jump if TOS false
   055d: LAO  0008        Load global BASE8
   055f: LDO  0032        Load global word BASE50
   0561: SLDC 01          Short load constant 1
   0562: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0565: UJP  $0583       Unconditional jump
-> 0567: LDO  0033        Load global word BASE51
   0569: SLDC 61          Short load constant 97
   056a: GEQI             Integer TOS-1 >= TOS
   056b: LDO  0033        Load global word BASE51
   056d: SLDC 7a          Short load constant 122
   056e: LEQI             Integer TOS-1 <= TOS
   056f: LAND             Logical AND (TOS & TOS-1)
   0570: FJP  $057d       Jump if TOS false
   0572: LAO  0008        Load global BASE8
   0574: LDO  0032        Load global word BASE50
   0576: LDO  0033        Load global word BASE51
   0578: SLDC 61          Short load constant 97
   0579: SBI              Subtract integers (TOS-1 - TOS)
   057a: SLDC 41          Short load constant 65
   057b: ADI              Add integers (TOS + TOS-1)
   057c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 057d: LDO  0032        Load global word BASE50
   057f: SLDC 01          Short load constant 1
   0580: ADI              Add integers (TOS + TOS-1)
   0581: SRO  0032        Store global word BASE50
-> 0583: UJP  $0547       Unconditional jump
-> 0585: LAO  0008        Load global BASE8
   0587: SLDC 00          Short load constant 0
   0588: LDB              Load byte at byte ptr TOS-1 + TOS
   0589: SLDC 00          Short load constant 0
   058a: GRTI             Integer TOS-1 > TOS
   058b: FJP  $0751       Jump if TOS false
   058d: LAO  0008        Load global BASE8
   058f: SLDC 01          Short load constant 1
   0590: LDB              Load byte at byte ptr TOS-1 + TOS
   0591: SLDC 2a          Short load constant 42
   0592: EQUI             Integer TOS-1 = TOS
   0593: FJP  $05a2       Jump if TOS false
   0595: SLDO 06          Short load global BASE6
   0596: LDA  01 003f     Load addr G63
   0599: SAS  07          String assign (TOS to TOS-1, 7 chars)
   059b: LAO  0008        Load global BASE8
   059d: SLDC 01          Short load constant 1
   059e: SLDC 01          Short load constant 1
   059f: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 05a2: NOP              No operation
   05a3: LSA  01          Load string address: ':'
   05a6: LAO  0008        Load global BASE8
   05a8: SLDC 00          Short load constant 0
   05a9: SLDC 00          Short load constant 0
   05aa: CXP  00 1b       Call external procedure PASCALSY.SPOS
   05ad: SRO  0032        Store global word BASE50
   05af: LDO  0032        Load global word BASE50
   05b1: SLDC 01          Short load constant 1
   05b2: LEQI             Integer TOS-1 <= TOS
   05b3: FJP  $05d1       Jump if TOS false
   05b5: SLDO 06          Short load global BASE6
   05b6: SLDC 00          Short load constant 0
   05b7: LDB              Load byte at byte ptr TOS-1 + TOS
   05b8: SLDC 00          Short load constant 0
   05b9: EQUI             Integer TOS-1 = TOS
   05ba: FJP  $05c2       Jump if TOS false
   05bc: SLDO 06          Short load global BASE6
   05bd: LDA  01 003b     Load addr G59
   05c0: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 05c2: LDO  0032        Load global word BASE50
   05c4: SLDC 01          Short load constant 1
   05c5: EQUI             Integer TOS-1 = TOS
   05c6: FJP  $05cf       Jump if TOS false
   05c8: LAO  0008        Load global BASE8
   05ca: SLDC 01          Short load constant 1
   05cb: SLDC 01          Short load constant 1
   05cc: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 05cf: UJP  $05f2       Unconditional jump
-> 05d1: LDO  0032        Load global word BASE50
   05d3: SLDC 01          Short load constant 1
   05d4: SBI              Subtract integers (TOS-1 - TOS)
   05d5: SLDC 07          Short load constant 7
   05d6: LEQI             Integer TOS-1 <= TOS
   05d7: FJP  $05f2       Jump if TOS false
   05d9: SLDO 06          Short load global BASE6
   05da: LAO  0008        Load global BASE8
   05dc: LAO  0035        Load global BASE53
   05de: SLDC 01          Short load constant 1
   05df: LDO  0032        Load global word BASE50
   05e1: SLDC 01          Short load constant 1
   05e2: SBI              Subtract integers (TOS-1 - TOS)
   05e3: CXP  00 19       Call external procedure PASCALSY.SCOPY
   05e6: LAO  0035        Load global BASE53
   05e8: SAS  07          String assign (TOS to TOS-1, 7 chars)
   05ea: LAO  0008        Load global BASE8
   05ec: SLDC 01          Short load constant 1
   05ed: LDO  0032        Load global word BASE50
   05ef: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 05f2: SLDO 06          Short load global BASE6
   05f3: SLDC 00          Short load constant 0
   05f4: LDB              Load byte at byte ptr TOS-1 + TOS
   05f5: SLDC 00          Short load constant 0
   05f6: GRTI             Integer TOS-1 > TOS
   05f7: FJP  $0751       Jump if TOS false
   05f9: LSA  01          Load string address: '['
   05fc: NOP              No operation
   05fd: LAO  0008        Load global BASE8
   05ff: SLDC 00          Short load constant 0
   0600: SLDC 00          Short load constant 0
   0601: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0604: SRO  0032        Store global word BASE50
   0606: LDO  0032        Load global word BASE50
   0608: SLDC 00          Short load constant 0
   0609: GRTI             Integer TOS-1 > TOS
   060a: FJP  $0614       Jump if TOS false
   060c: LDO  0032        Load global word BASE50
   060e: SLDC 01          Short load constant 1
   060f: SBI              Subtract integers (TOS-1 - TOS)
   0610: SRO  0032        Store global word BASE50
   0612: UJP  $061a       Unconditional jump
-> 0614: LAO  0008        Load global BASE8
   0616: SLDC 00          Short load constant 0
   0617: LDB              Load byte at byte ptr TOS-1 + TOS
   0618: SRO  0032        Store global word BASE50
-> 061a: LDO  0032        Load global word BASE50
   061c: SLDC 0f          Short load constant 15
   061d: LEQI             Integer TOS-1 <= TOS
   061e: FJP  $0751       Jump if TOS false
   0620: LDO  0032        Load global word BASE50
   0622: SLDC 00          Short load constant 0
   0623: GRTI             Integer TOS-1 > TOS
   0624: FJP  $063d       Jump if TOS false
   0626: SLDO 05          Short load global BASE5
   0627: LAO  0008        Load global BASE8
   0629: LAO  0035        Load global BASE53
   062b: SLDC 01          Short load constant 1
   062c: LDO  0032        Load global word BASE50
   062e: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0631: LAO  0035        Load global BASE53
   0633: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0635: LAO  0008        Load global BASE8
   0637: SLDC 01          Short load constant 1
   0638: LDO  0032        Load global word BASE50
   063a: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 063d: LAO  0008        Load global BASE8
   063f: SLDC 00          Short load constant 0
   0640: LDB              Load byte at byte ptr TOS-1 + TOS
   0641: SLDC 00          Short load constant 0
   0642: EQUI             Integer TOS-1 = TOS
   0643: FJP  $064a       Jump if TOS false
   0645: SLDC 01          Short load constant 1
   0646: SRO  0034        Store global word BASE52
   0648: UJP  $06c1       Unconditional jump
-> 064a: SLDC 00          Short load constant 0
   064b: SRO  0034        Store global word BASE52
   064d: LSA  01          Load string address: ']'
   0650: NOP              No operation
   0651: LAO  0008        Load global BASE8
   0653: SLDC 00          Short load constant 0
   0654: SLDC 00          Short load constant 0
   0655: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0658: SRO  0031        Store global word BASE49
   065a: LDO  0031        Load global word BASE49
   065c: SLDC 02          Short load constant 2
   065d: EQUI             Integer TOS-1 = TOS
   065e: FJP  $0665       Jump if TOS false
   0660: SLDC 01          Short load constant 1
   0661: SRO  0034        Store global word BASE52
   0663: UJP  $06c1       Unconditional jump
-> 0665: LDO  0031        Load global word BASE49
   0667: SLDC 02          Short load constant 2
   0668: GRTI             Integer TOS-1 > TOS
   0669: FJP  $06c1       Jump if TOS false
   066b: SLDC 01          Short load constant 1
   066c: SRO  0034        Store global word BASE52
   066e: SLDC 02          Short load constant 2
   066f: SRO  0032        Store global word BASE50
-> 0671: LAO  0008        Load global BASE8
   0673: LDO  0032        Load global word BASE50
   0675: LDB              Load byte at byte ptr TOS-1 + TOS
   0676: SRO  0033        Store global word BASE51
   0678: LDO  0033        Load global word BASE51
   067a: LDA  01 007a     Load addr G122
   067d: LDM  04          Load 4 words from (TOS)
   067f: SLDC 04          Short load constant 4
   0680: INN              Set membership (TOS-1 in set TOS)
   0681: FJP  $0690       Jump if TOS false
   0683: SLDO 04          Short load global BASE4
   0684: SLDO 04          Short load global BASE4
   0685: SIND 00          Short index load *TOS+0
   0686: SLDC 0a          Short load constant 10
   0687: MPI              Multiply integers (TOS * TOS-1)
   0688: LDO  0033        Load global word BASE51
   068a: SLDC 30          Short load constant 48
   068b: SBI              Subtract integers (TOS-1 - TOS)
   068c: ADI              Add integers (TOS + TOS-1)
   068d: STO              Store indirect (TOS into TOS-1)
   068e: UJP  $0693       Unconditional jump
-> 0690: SLDC 00          Short load constant 0
   0691: SRO  0034        Store global word BASE52
-> 0693: LDO  0032        Load global word BASE50
   0695: SLDC 01          Short load constant 1
   0696: ADI              Add integers (TOS + TOS-1)
   0697: SRO  0032        Store global word BASE50
   0699: LDO  0032        Load global word BASE50
   069b: LDO  0031        Load global word BASE49
   069d: EQUI             Integer TOS-1 = TOS
   069e: LDO  0034        Load global word BASE52
   06a0: LNOT             Logical NOT (~TOS)
   06a1: LOR              Logical OR (TOS | TOS-1)
   06a2: FJP  $0671       Jump if TOS false
   06a4: LDO  0032        Load global word BASE50
   06a6: SLDC 03          Short load constant 3
   06a7: EQUI             Integer TOS-1 = TOS
   06a8: LDO  0031        Load global word BASE49
   06aa: SLDC 03          Short load constant 3
   06ab: EQUI             Integer TOS-1 = TOS
   06ac: LAND             Logical AND (TOS & TOS-1)
   06ad: FJP  $06c1       Jump if TOS false
   06af: LAO  0008        Load global BASE8
   06b1: LDO  0032        Load global word BASE50
   06b3: SLDC 01          Short load constant 1
   06b4: SBI              Subtract integers (TOS-1 - TOS)
   06b5: LDB              Load byte at byte ptr TOS-1 + TOS
   06b6: SLDC 2a          Short load constant 42
   06b7: EQUI             Integer TOS-1 = TOS
   06b8: FJP  $06c1       Jump if TOS false
   06ba: SLDO 04          Short load global BASE4
   06bb: SLDC 01          Short load constant 1
   06bc: NGI              Negate integer
   06bd: STO              Store indirect (TOS into TOS-1)
   06be: SLDC 01          Short load constant 1
   06bf: SRO  0034        Store global word BASE52
-> 06c1: LDO  0034        Load global word BASE52
   06c3: SRO  0001        Store global word BASE1
   06c5: LDO  0034        Load global word BASE52
   06c7: SLDO 05          Short load global BASE5
   06c8: SLDC 00          Short load constant 0
   06c9: LDB              Load byte at byte ptr TOS-1 + TOS
   06ca: SLDC 05          Short load constant 5
   06cb: GRTI             Integer TOS-1 > TOS
   06cc: LAND             Logical AND (TOS & TOS-1)
   06cd: FJP  $0751       Jump if TOS false
   06cf: LAO  0008        Load global BASE8
   06d1: SLDO 05          Short load global BASE5
   06d2: LAO  0035        Load global BASE53
   06d4: SLDO 05          Short load global BASE5
   06d5: SLDC 00          Short load constant 0
   06d6: LDB              Load byte at byte ptr TOS-1 + TOS
   06d7: SLDC 04          Short load constant 4
   06d8: SBI              Subtract integers (TOS-1 - TOS)
   06d9: SLDC 05          Short load constant 5
   06da: CXP  00 19       Call external procedure PASCALSY.SCOPY
   06dd: LAO  0035        Load global BASE53
   06df: SAS  50          String assign (TOS to TOS-1, 80 chars)
   06e1: LAO  0008        Load global BASE8
   06e3: LSA  05          Load string address: '.TEXT'
   06ea: NOP              No operation
   06eb: EQLSTR           String TOS-1 = TOS
   06ed: FJP  $06f4       Jump if TOS false
   06ef: SLDO 03          Short load global BASE3
   06f0: SLDC 03          Short load constant 3
   06f1: STO              Store indirect (TOS into TOS-1)
   06f2: UJP  $0751       Unconditional jump
-> 06f4: LAO  0008        Load global BASE8
   06f6: NOP              No operation
   06f7: LSA  05          Load string address: '.CODE'
   06fe: EQLSTR           String TOS-1 = TOS
   0700: FJP  $0707       Jump if TOS false
   0702: SLDO 03          Short load global BASE3
   0703: SLDC 02          Short load constant 2
   0704: STO              Store indirect (TOS into TOS-1)
   0705: UJP  $0751       Unconditional jump
-> 0707: LAO  0008        Load global BASE8
   0709: LSA  05          Load string address: '.BACK'
   0710: NOP              No operation
   0711: EQLSTR           String TOS-1 = TOS
   0713: FJP  $071a       Jump if TOS false
   0715: SLDO 03          Short load global BASE3
   0716: SLDC 03          Short load constant 3
   0717: STO              Store indirect (TOS into TOS-1)
   0718: UJP  $0751       Unconditional jump
-> 071a: LAO  0008        Load global BASE8
   071c: NOP              No operation
   071d: LSA  05          Load string address: '.INFO'
   0724: EQLSTR           String TOS-1 = TOS
   0726: FJP  $072d       Jump if TOS false
   0728: SLDO 03          Short load global BASE3
   0729: SLDC 04          Short load constant 4
   072a: STO              Store indirect (TOS into TOS-1)
   072b: UJP  $0751       Unconditional jump
-> 072d: LAO  0008        Load global BASE8
   072f: LSA  05          Load string address: '.GRAF'
   0736: NOP              No operation
   0737: EQLSTR           String TOS-1 = TOS
   0739: FJP  $0740       Jump if TOS false
   073b: SLDO 03          Short load global BASE3
   073c: SLDC 06          Short load constant 6
   073d: STO              Store indirect (TOS into TOS-1)
   073e: UJP  $0751       Unconditional jump
-> 0740: LAO  0008        Load global BASE8
   0742: NOP              No operation
   0743: LSA  05          Load string address: '.FOTO'
   074a: EQLSTR           String TOS-1 = TOS
   074c: FJP  $0751       Jump if TOS false
   074e: SLDO 03          Short load global BASE3
   074f: SLDC 07          Short load constant 7
   0750: STO              Store indirect (TOS into TOS-1)
-> 0751: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC34(PARAM1; PARAM2) (* P=34 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
  BASE4
  BASE5
BEGIN
-> 076a: SLDO 01          Short load global BASE1
   076b: SLDC 00          Short load constant 0
   076c: IXA  000d        Index array (TOS-1 + TOS * 13)
   076e: SRO  0004        Store global word BASE4
   0770: SLDO 02          Short load global BASE2
   0771: SRO  0003        Store global word BASE3
   0773: SLDO 04          Short load global BASE4
   0774: IND  0008        Static index and load word (TOS+8)
   0776: SLDC 01          Short load constant 1
   0777: SBI              Subtract integers (TOS-1 - TOS)
   0778: SRO  0005        Store global word BASE5
-> 077a: SLDO 03          Short load global BASE3
   077b: SLDO 05          Short load global BASE5
   077c: LEQI             Integer TOS-1 <= TOS
   077d: FJP  $0792       Jump if TOS false
   077f: SLDO 01          Short load global BASE1
   0780: SLDO 03          Short load global BASE3
   0781: IXA  000d        Index array (TOS-1 + TOS * 13)
   0783: SLDO 01          Short load global BASE1
   0784: SLDO 03          Short load global BASE3
   0785: SLDC 01          Short load constant 1
   0786: ADI              Add integers (TOS + TOS-1)
   0787: IXA  000d        Index array (TOS-1 + TOS * 13)
   0789: MOV  000d        Move 13 words (TOS to TOS-1)
   078b: SLDO 03          Short load global BASE3
   078c: SLDC 01          Short load constant 1
   078d: ADI              Add integers (TOS + TOS-1)
   078e: SRO  0003        Store global word BASE3
   0790: UJP  $077a       Unconditional jump
-> 0792: SLDO 01          Short load global BASE1
   0793: SLDO 04          Short load global BASE4
   0794: IND  0008        Static index and load word (TOS+8)
   0796: IXA  000d        Index array (TOS-1 + TOS * 13)
   0798: INC  0003        Inc field ptr (TOS+3)
   079a: NOP              No operation
   079b: LSA  00          Load string address: ''
   079d: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   079f: SLDO 04          Short load global BASE4
   07a0: INC  0008        Inc field ptr (TOS+8)
   07a2: SLDO 04          Short load global BASE4
   07a3: IND  0008        Static index and load word (TOS+8)
   07a5: SLDC 01          Short load constant 1
   07a6: SBI              Subtract integers (TOS-1 - TOS)
   07a7: STO              Store indirect (TOS into TOS-1)
-> 07a8: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC35(PARAM1; PARAM2; PARAM3) (* P=35 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 07b6: SLDO 01          Short load global BASE1
   07b7: SLDC 00          Short load constant 0
   07b8: IXA  000d        Index array (TOS-1 + TOS * 13)
   07ba: SRO  0005        Store global word BASE5
   07bc: SLDO 05          Short load global BASE5
   07bd: IND  0008        Static index and load word (TOS+8)
   07bf: SRO  0004        Store global word BASE4
   07c1: SLDO 02          Short load global BASE2
   07c2: SRO  0006        Store global word BASE6
-> 07c4: SLDO 04          Short load global BASE4
   07c5: SLDO 06          Short load global BASE6
   07c6: GEQI             Integer TOS-1 >= TOS
   07c7: FJP  $07dc       Jump if TOS false
   07c9: SLDO 01          Short load global BASE1
   07ca: SLDO 04          Short load global BASE4
   07cb: SLDC 01          Short load constant 1
   07cc: ADI              Add integers (TOS + TOS-1)
   07cd: IXA  000d        Index array (TOS-1 + TOS * 13)
   07cf: SLDO 01          Short load global BASE1
   07d0: SLDO 04          Short load global BASE4
   07d1: IXA  000d        Index array (TOS-1 + TOS * 13)
   07d3: MOV  000d        Move 13 words (TOS to TOS-1)
   07d5: SLDO 04          Short load global BASE4
   07d6: SLDC 01          Short load constant 1
   07d7: SBI              Subtract integers (TOS-1 - TOS)
   07d8: SRO  0004        Store global word BASE4
   07da: UJP  $07c4       Unconditional jump
-> 07dc: SLDO 01          Short load global BASE1
   07dd: SLDO 02          Short load global BASE2
   07de: IXA  000d        Index array (TOS-1 + TOS * 13)
   07e0: SLDO 03          Short load global BASE3
   07e1: MOV  000d        Move 13 words (TOS to TOS-1)
   07e3: SLDO 05          Short load global BASE5
   07e4: INC  0008        Inc field ptr (TOS+8)
   07e6: SLDO 05          Short load global BASE5
   07e7: IND  0008        Static index and load word (TOS+8)
   07e9: SLDC 01          Short load constant 1
   07ea: ADI              Add integers (TOS + TOS-1)
   07eb: STO              Store indirect (TOS into TOS-1)
-> 07ec: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC36 (* P=36 LL=0 *)
BEGIN
-> 07fa: SLDC 04          Short load constant 4
   07fb: LOD  01 0001     Load word at G1 (SYSCOM)
   07fe: INC  001f        Inc field ptr (TOS+31)
   0800: SLDC 08          Short load constant 8
   0801: SLDC 08          Short load constant 8
   0802: LDP              Load packed field (TOS)
   0803: CBP  2e          Call base procedure PASCALSY.46
-> 0805: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC37 (* P=37 LL=0 *)
  BASE1
  BASE2
BEGIN
-> 0812: CBP  24          Call base procedure PASCALSY.36
   0814: LOD  01 0001     Load word at G1 (SYSCOM)
   0817: SRO  0001        Store global word BASE1
   0819: SLDO 01          Short load global BASE1
   081a: INC  001f        Inc field ptr (TOS+31)
   081c: SRO  0002        Store global word BASE2
   081e: SLDC 03          Short load constant 3
   081f: CSP  26          Call standard procedure UNITCLEAR
   0821: SLDO 02          Short load global BASE2
   0822: INC  0001        Inc field ptr (TOS+1)
   0824: SLDC 08          Short load constant 8
   0825: SLDC 00          Short load constant 0
   0826: LDP              Load packed field (TOS)
   0827: SLDC 00          Short load constant 0
   0828: NEQI             Integer TOS-1 <> TOS
   0829: FJP  $0836       Jump if TOS false
   082b: SLDC 03          Short load constant 3
   082c: SLDO 02          Short load global BASE2
   082d: INC  0001        Inc field ptr (TOS+1)
   082f: SLDC 08          Short load constant 8
   0830: SLDC 00          Short load constant 0
   0831: LDP              Load packed field (TOS)
   0832: CBP  2e          Call base procedure PASCALSY.46
   0834: UJP  $083f       Unconditional jump
-> 0836: SLDC 06          Short load constant 6
   0837: SLDO 02          Short load global BASE2
   0838: INC  0004        Inc field ptr (TOS+4)
   083a: SLDC 08          Short load constant 8
   083b: SLDC 08          Short load constant 8
   083c: LDP              Load packed field (TOS)
   083d: CBP  2e          Call base procedure PASCALSY.46
-> 083f: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC38 (* P=38 LL=0 *)
  BASE1
  BASE2
  BASE3
  BASE4
BEGIN
-> 084c: LOD  01 0001     Load word at G1 (SYSCOM)
   084f: SRO  0002        Store global word BASE2
   0851: SLDO 02          Short load global BASE2
   0852: INC  001f        Inc field ptr (TOS+31)
   0854: SRO  0003        Store global word BASE3
   0856: SLDO 03          Short load global BASE3
   0857: INC  0001        Inc field ptr (TOS+1)
   0859: SLDC 08          Short load constant 8
   085a: SLDC 08          Short load constant 8
   085b: LDP              Load packed field (TOS)
   085c: SLDC 00          Short load constant 0
   085d: NEQI             Integer TOS-1 <> TOS
   085e: FJP  $086b       Jump if TOS false
   0860: SLDC 02          Short load constant 2
   0861: SLDO 03          Short load global BASE3
   0862: INC  0001        Inc field ptr (TOS+1)
   0864: SLDC 08          Short load constant 8
   0865: SLDC 08          Short load constant 8
   0866: LDP              Load packed field (TOS)
   0867: CBP  2e          Call base procedure PASCALSY.46
   0869: UJP  $08bd       Unconditional jump
-> 086b: SLDO 03          Short load global BASE3
   086c: INC  0004        Inc field ptr (TOS+4)
   086e: SLDC 08          Short load constant 8
   086f: SLDC 00          Short load constant 0
   0870: LDP              Load packed field (TOS)
   0871: SLDC 00          Short load constant 0
   0872: NEQI             Integer TOS-1 <> TOS
   0873: FJP  $0880       Jump if TOS false
   0875: SLDC 07          Short load constant 7
   0876: SLDO 03          Short load global BASE3
   0877: INC  0004        Inc field ptr (TOS+4)
   0879: SLDC 08          Short load constant 8
   087a: SLDC 00          Short load constant 0
   087b: LDP              Load packed field (TOS)
   087c: CBP  2e          Call base procedure PASCALSY.46
   087e: UJP  $08bd       Unconditional jump
-> 0880: SLDO 02          Short load global BASE2
   0881: INC  001d        Inc field ptr (TOS+29)
   0883: SLDC 01          Short load constant 1
   0884: SLDC 04          Short load constant 4
   0885: LDP              Load packed field (TOS)
   0886: LNOT             Logical NOT (~TOS)
   0887: SLDO 03          Short load global BASE3
   0888: INC  0002        Inc field ptr (TOS+2)
   088a: SLDC 08          Short load constant 8
   088b: SLDC 08          Short load constant 8
   088c: LDP              Load packed field (TOS)
   088d: SLDC 00          Short load constant 0
   088e: NEQI             Integer TOS-1 <> TOS
   088f: LAND             Logical AND (TOS & TOS-1)
   0890: FJP  $08bd       Jump if TOS false
   0892: SLDC 02          Short load constant 2
   0893: SRO  0001        Store global word BASE1
   0895: SLDO 02          Short load global BASE2
   0896: IND  0026        Static index and load word (TOS+38)
   0898: SRO  0004        Store global word BASE4
-> 089a: SLDO 01          Short load global BASE1
   089b: SLDO 04          Short load global BASE4
   089c: LEQI             Integer TOS-1 <= TOS
   089d: FJP  $08ae       Jump if TOS false
   089f: LOD  01 0003     Load word at G3 (OUTPUT)
   08a2: SLDC 20          Short load constant 32
   08a3: SLDC 00          Short load constant 0
   08a4: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   08a7: SLDO 01          Short load global BASE1
   08a8: SLDC 01          Short load constant 1
   08a9: ADI              Add integers (TOS + TOS-1)
   08aa: SRO  0001        Store global word BASE1
   08ac: UJP  $089a       Unconditional jump
-> 08ae: LOD  01 0003     Load word at G3 (OUTPUT)
   08b1: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   08b4: SLDC 00          Short load constant 0
   08b5: SLDO 03          Short load global BASE3
   08b6: INC  0002        Inc field ptr (TOS+2)
   08b8: SLDC 08          Short load constant 8
   08b9: SLDC 08          Short load constant 8
   08ba: LDP              Load packed field (TOS)
   08bb: CBP  2e          Call base procedure PASCALSY.46
-> 08bd: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC39 (* P=39 LL=0 *)
  BASE1
  BASE2
BEGIN
-> 08cc: CBP  24          Call base procedure PASCALSY.36
   08ce: LOD  01 0001     Load word at G1 (SYSCOM)
   08d1: SRO  0002        Store global word BASE2
   08d3: CBP  26          Call base procedure PASCALSY.38
   08d5: SLDO 02          Short load global BASE2
   08d6: INC  001d        Inc field ptr (TOS+29)
   08d8: SLDC 01          Short load constant 1
   08d9: SLDC 04          Short load constant 4
   08da: LDP              Load packed field (TOS)
   08db: FJP  $08fe       Jump if TOS false
   08dd: LDA  01 0046     Load addr G70
   08e0: SLDC 00          Short load constant 0
   08e1: LDB              Load byte at byte ptr TOS-1 + TOS
   08e2: SLDC 00          Short load constant 0
   08e3: SLDC 3a          Short load constant 58
   08e4: LDA  01 0046     Load addr G70
   08e7: SLDC 01          Short load constant 1
   08e8: SLDC 00          Short load constant 0
   08e9: CSP  0b          Call standard procedure SCAN
   08eb: SRO  0001        Store global word BASE1
   08ed: SLDO 01          Short load global BASE1
   08ee: LDA  01 0046     Load addr G70
   08f1: SLDC 00          Short load constant 0
   08f2: LDB              Load byte at byte ptr TOS-1 + TOS
   08f3: NEQI             Integer TOS-1 <> TOS
   08f4: FJP  $08fe       Jump if TOS false
   08f6: LDA  01 0046     Load addr G70
   08f9: SLDC 00          Short load constant 0
   08fa: SLDO 01          Short load global BASE1
   08fb: SLDC 01          Short load constant 1
   08fc: ADI              Add integers (TOS + TOS-1)
   08fd: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 08fe: LOD  01 0003     Load word at G3 (OUTPUT)
   0901: LDA  01 0046     Load addr G70
   0904: SLDC 00          Short load constant 0
   0905: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0908: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC40(PARAM1): RETVAL (* P=40 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
BEGIN
-> 0914: LOD  01 0003     Load word at G3 (OUTPUT)
   0917: LSA  0c          Load string address: 'Type <space>'
   0925: NOP              No operation
   0926: SLDC 00          Short load constant 0
   0927: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   092a: LOD  01 0001     Load word at G1 (SYSCOM)
   092d: INC  001d        Inc field ptr (TOS+29)
   092f: SLDC 01          Short load constant 1
   0930: SLDC 04          Short load constant 4
   0931: LDP              Load packed field (TOS)
   0932: LNOT             Logical NOT (~TOS)
   0933: FJP  $094b       Jump if TOS false
   0935: LOD  01 0003     Load word at G3 (OUTPUT)
   0938: NOP              No operation
   0939: LSA  0c          Load string address: ' to continue'
   0947: SLDC 00          Short load constant 0
   0948: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 094b: SLDO 03          Short load global BASE3
   094c: SLDC 00          Short load constant 0
   094d: SLDC 00          Short load constant 0
   094e: CBP  29          Call base procedure PASCALSY.41
   0950: SRO  0004        Store global word BASE4
   0952: LOD  01 0002     Load word at G2 (INPUT)
   0955: SLDC 00          Short load constant 0
   0956: SLDC 00          Short load constant 0
   0957: CXP  00 0b       Call external procedure PASCALSY.FEOLN
   095a: LNOT             Logical NOT (~TOS)
   095b: FJP  $0963       Jump if TOS false
   095d: LOD  01 0003     Load word at G3 (OUTPUT)
   0960: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0963: CBP  26          Call base procedure PASCALSY.38
   0965: SLDO 04          Short load global BASE4
   0966: SLDC 20          Short load constant 32
   0967: EQUI             Integer TOS-1 = TOS
   0968: SLDO 04          Short load global BASE4
   0969: LOD  01 0001     Load word at G1 (SYSCOM)
   096c: INC  002c        Inc field ptr (TOS+44)
   096e: SLDC 08          Short load constant 8
   096f: SLDC 08          Short load constant 8
   0970: LDP              Load packed field (TOS)
   0971: EQUI             Integer TOS-1 = TOS
   0972: LOR              Logical OR (TOS | TOS-1)
   0973: FJP  $0914       Jump if TOS false
   0975: SLDO 04          Short load global BASE4
   0976: SLDC 20          Short load constant 32
   0977: NEQI             Integer TOS-1 <> TOS
   0978: SRO  0001        Store global word BASE1
-> 097a: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FUNC41(PARAM1): RETVAL (* P=41 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
BEGIN
-> 0988: SLDO 03          Short load global BASE3
   0989: FJP  $098e       Jump if TOS false
   098b: SLDC 01          Short load constant 1
   098c: CSP  26          Call standard procedure UNITCLEAR
-> 098e: LOD  01 003a     Load word at G58
   0991: SIND 02          Short index load *TOS+2
   0992: FJP  $0998       Jump if TOS false
   0994: SLDC 00          Short load constant 0
   0995: SLDC 2b          Short load constant 43
   0996: CSP  04          Call standard procedure EXIT
-> 0998: LOD  01 003a     Load word at G58
   099b: INC  0003        Inc field ptr (TOS+3)
   099d: SLDC 01          Short load constant 1
   099e: STO              Store indirect (TOS into TOS-1)
   099f: LOD  01 0002     Load word at G2 (INPUT)
   09a2: LAO  0004        Load global BASE4
   09a4: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   09a7: SLDO 04          Short load global BASE4
   09a8: SLDC 61          Short load constant 97
   09a9: GEQI             Integer TOS-1 >= TOS
   09aa: SLDO 04          Short load global BASE4
   09ab: SLDC 7a          Short load constant 122
   09ac: LEQI             Integer TOS-1 <= TOS
   09ad: LAND             Logical AND (TOS & TOS-1)
   09ae: FJP  $09b7       Jump if TOS false
   09b0: SLDO 04          Short load global BASE4
   09b1: SLDC 61          Short load constant 97
   09b2: SBI              Subtract integers (TOS-1 - TOS)
   09b3: SLDC 41          Short load constant 65
   09b4: ADI              Add integers (TOS + TOS-1)
   09b5: SRO  0004        Store global word BASE4
-> 09b7: SLDO 04          Short load global BASE4
   09b8: SRO  0001        Store global word BASE1
-> 09ba: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FUNC42(PARAM1): RETVAL (* P=42 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
  BASE7
  BASE8
  BASE9
  BASE10
BEGIN
-> 09c6: SLDC 00          Short load constant 0
   09c7: SRO  0001        Store global word BASE1
   09c9: LOD  01 0001     Load word at G1 (SYSCOM)
   09cc: SRO  0007        Store global word BASE7
   09ce: LDA  01 007e     Load addr G126
   09d1: SLDO 03          Short load global BASE3
   09d2: IXA  0006        Index array (TOS-1 + TOS * 6)
   09d4: SRO  0008        Store global word BASE8
   09d6: SLDO 07          Short load global BASE7
   09d7: SIND 04          Short index load *TOS+4
   09d8: LDCN             Load constant NIL
   09d9: EQUI             Integer TOS-1 = TOS
   09da: FJP  $09e4       Jump if TOS false
   09dc: SLDO 07          Short load global BASE7
   09dd: INC  0004        Inc field ptr (TOS+4)
   09df: LDCI 03f6        Load word 1014
   09e2: CSP  01          Call standard procedure NEW
-> 09e4: SLDO 03          Short load global BASE3
   09e5: SLDO 07          Short load global BASE7
   09e6: SIND 04          Short index load *TOS+4
   09e7: SLDC 00          Short load constant 0
   09e8: LDCI 07ec        Load word 2028
   09eb: SLDC 02          Short load constant 2
   09ec: SLDC 00          Short load constant 0
   09ed: CSP  05          Call standard procedure UNITREAD
   09ef: SLDO 07          Short load global BASE7
   09f0: SIND 00          Short index load *TOS+0
   09f1: SLDC 00          Short load constant 0
   09f2: EQUI             Integer TOS-1 = TOS
   09f3: SRO  0005        Store global word BASE5
   09f5: SLDO 05          Short load global BASE5
   09f6: FJP  $0add       Jump if TOS false
   09f8: SLDO 07          Short load global BASE7
   09f9: SIND 04          Short index load *TOS+4
   09fa: SLDC 00          Short load constant 0
   09fb: IXA  000d        Index array (TOS-1 + TOS * 13)
   09fd: SRO  0009        Store global word BASE9
   09ff: SLDC 00          Short load constant 0
   0a00: SRO  0005        Store global word BASE5
   0a02: SLDO 09          Short load global BASE9
   0a03: SIND 00          Short index load *TOS+0
   0a04: SLDC 00          Short load constant 0
   0a05: EQUI             Integer TOS-1 = TOS
   0a06: SLDO 07          Short load global BASE7
   0a07: INC  001d        Inc field ptr (TOS+29)
   0a09: SLDC 02          Short load constant 2
   0a0a: SLDC 07          Short load constant 7
   0a0b: LDP              Load packed field (TOS)
   0a0c: SLDC 02          Short load constant 2
   0a0d: EQUI             Integer TOS-1 = TOS
   0a0e: SLDO 07          Short load global BASE7
   0a0f: INC  001d        Inc field ptr (TOS+29)
   0a11: SLDC 02          Short load constant 2
   0a12: SLDC 07          Short load constant 7
   0a13: LDP              Load packed field (TOS)
   0a14: SLDC 0a          Short load constant 10
   0a15: SLDC 01          Short load constant 1
   0a16: INN              Set membership (TOS-1 in set TOS)
   0a17: SLDO 09          Short load global BASE9
   0a18: INC  0002        Inc field ptr (TOS+2)
   0a1a: SLDC 04          Short load constant 4
   0a1b: SLDC 00          Short load constant 0
   0a1c: LDP              Load packed field (TOS)
   0a1d: SLDC 08          Short load constant 8
   0a1e: EQUI             Integer TOS-1 = TOS
   0a1f: LAND             Logical AND (TOS & TOS-1)
   0a20: LOR              Logical OR (TOS | TOS-1)
   0a21: SLDO 07          Short load global BASE7
   0a22: INC  001d        Inc field ptr (TOS+29)
   0a24: SLDC 02          Short load constant 2
   0a25: SLDC 07          Short load constant 7
   0a26: LDP              Load packed field (TOS)
   0a27: SLDC 00          Short load constant 0
   0a28: EQUI             Integer TOS-1 = TOS
   0a29: SLDO 09          Short load global BASE9
   0a2a: INC  0002        Inc field ptr (TOS+2)
   0a2c: SLDC 04          Short load constant 4
   0a2d: SLDC 00          Short load constant 0
   0a2e: LDP              Load packed field (TOS)
   0a2f: SLDC 00          Short load constant 0
   0a30: EQUI             Integer TOS-1 = TOS
   0a31: LAND             Logical AND (TOS & TOS-1)
   0a32: LOR              Logical OR (TOS | TOS-1)
   0a33: LAND             Logical AND (TOS & TOS-1)
   0a34: FJP  $0ac7       Jump if TOS false
   0a36: SLDO 09          Short load global BASE9
   0a37: INC  0003        Inc field ptr (TOS+3)
   0a39: SLDC 00          Short load constant 0
   0a3a: LDB              Load byte at byte ptr TOS-1 + TOS
   0a3b: SLDC 00          Short load constant 0
   0a3c: GRTI             Integer TOS-1 > TOS
   0a3d: SLDO 09          Short load global BASE9
   0a3e: INC  0003        Inc field ptr (TOS+3)
   0a40: SLDC 00          Short load constant 0
   0a41: LDB              Load byte at byte ptr TOS-1 + TOS
   0a42: SLDC 07          Short load constant 7
   0a43: LEQI             Integer TOS-1 <= TOS
   0a44: LAND             Logical AND (TOS & TOS-1)
   0a45: SLDO 09          Short load global BASE9
   0a46: IND  0008        Static index and load word (TOS+8)
   0a48: SLDC 00          Short load constant 0
   0a49: GEQI             Integer TOS-1 >= TOS
   0a4a: LAND             Logical AND (TOS & TOS-1)
   0a4b: SLDO 09          Short load global BASE9
   0a4c: IND  0008        Static index and load word (TOS+8)
   0a4e: SLDC 4d          Short load constant 77
   0a4f: LEQI             Integer TOS-1 <= TOS
   0a50: LAND             Logical AND (TOS & TOS-1)
   0a51: FJP  $0ac7       Jump if TOS false
   0a53: SLDC 01          Short load constant 1
   0a54: SRO  0005        Store global word BASE5
   0a56: SLDO 09          Short load global BASE9
   0a57: INC  0003        Inc field ptr (TOS+3)
   0a59: SLDO 08          Short load global BASE8
   0a5a: NEQSTR           String TOS-1 <> TOS
   0a5c: FJP  $0ac7       Jump if TOS false
   0a5e: SLDC 01          Short load constant 1
   0a5f: SRO  0004        Store global word BASE4
-> 0a61: SLDO 04          Short load global BASE4
   0a62: SLDO 09          Short load global BASE9
   0a63: IND  0008        Static index and load word (TOS+8)
   0a65: LEQI             Integer TOS-1 <= TOS
   0a66: FJP  $0aae       Jump if TOS false
   0a68: SLDO 07          Short load global BASE7
   0a69: SIND 04          Short index load *TOS+4
   0a6a: SLDO 04          Short load global BASE4
   0a6b: IXA  000d        Index array (TOS-1 + TOS * 13)
   0a6d: SRO  000a        Store global word BASE10
   0a6f: SLDO 0a          Short load global BASE10
   0a70: INC  0003        Inc field ptr (TOS+3)
   0a72: SLDC 00          Short load constant 0
   0a73: LDB              Load byte at byte ptr TOS-1 + TOS
   0a74: SLDC 00          Short load constant 0
   0a75: LEQI             Integer TOS-1 <= TOS
   0a76: SLDO 0a          Short load global BASE10
   0a77: INC  0003        Inc field ptr (TOS+3)
   0a79: SLDC 00          Short load constant 0
   0a7a: LDB              Load byte at byte ptr TOS-1 + TOS
   0a7b: SLDC 0f          Short load constant 15
   0a7c: GRTI             Integer TOS-1 > TOS
   0a7d: LOR              Logical OR (TOS | TOS-1)
   0a7e: SLDO 0a          Short load global BASE10
   0a7f: SIND 01          Short index load *TOS+1
   0a80: SLDO 0a          Short load global BASE10
   0a81: SIND 00          Short index load *TOS+0
   0a82: LESI             Integer TOS-1 < TOS
   0a83: LOR              Logical OR (TOS | TOS-1)
   0a84: SLDO 0a          Short load global BASE10
   0a85: IND  000b        Static index and load word (TOS+11)
   0a87: LDCI 0200        Load word 512
   0a8a: GRTI             Integer TOS-1 > TOS
   0a8b: LOR              Logical OR (TOS | TOS-1)
   0a8c: SLDO 0a          Short load global BASE10
   0a8d: IND  000b        Static index and load word (TOS+11)
   0a8f: SLDC 00          Short load constant 0
   0a90: LEQI             Integer TOS-1 <= TOS
   0a91: LOR              Logical OR (TOS | TOS-1)
   0a92: SLDO 0a          Short load global BASE10
   0a93: INC  000c        Inc field ptr (TOS+12)
   0a95: SLDC 07          Short load constant 7
   0a96: SLDC 09          Short load constant 9
   0a97: LDP              Load packed field (TOS)
   0a98: SLDC 64          Short load constant 100
   0a99: GEQI             Integer TOS-1 >= TOS
   0a9a: LOR              Logical OR (TOS | TOS-1)
   0a9b: FJP  $0aa7       Jump if TOS false
   0a9d: SLDC 00          Short load constant 0
   0a9e: SRO  0005        Store global word BASE5
   0aa0: SLDO 04          Short load global BASE4
   0aa1: SLDO 07          Short load global BASE7
   0aa2: SIND 04          Short index load *TOS+4
   0aa3: CBP  22          Call base procedure PASCALSY.34
   0aa5: UJP  $0aac       Unconditional jump
-> 0aa7: SLDO 04          Short load global BASE4
   0aa8: SLDC 01          Short load constant 1
   0aa9: ADI              Add integers (TOS + TOS-1)
   0aaa: SRO  0004        Store global word BASE4
-> 0aac: UJP  $0a61       Unconditional jump
-> 0aae: SLDO 05          Short load global BASE5
   0aaf: LNOT             Logical NOT (~TOS)
   0ab0: FJP  $0ac7       Jump if TOS false
   0ab2: SLDO 03          Short load global BASE3
   0ab3: SLDO 07          Short load global BASE7
   0ab4: SIND 04          Short index load *TOS+4
   0ab5: SLDC 00          Short load constant 0
   0ab6: SLDO 09          Short load global BASE9
   0ab7: IND  0008        Static index and load word (TOS+8)
   0ab9: SLDC 01          Short load constant 1
   0aba: ADI              Add integers (TOS + TOS-1)
   0abb: SLDC 1a          Short load constant 26
   0abc: MPI              Multiply integers (TOS * TOS-1)
   0abd: SLDC 02          Short load constant 2
   0abe: SLDC 00          Short load constant 0
   0abf: CSP  06          Call standard procedure UNITWRITE
   0ac1: SLDO 07          Short load global BASE7
   0ac2: SIND 00          Short index load *TOS+0
   0ac3: SLDC 00          Short load constant 0
   0ac4: EQUI             Integer TOS-1 = TOS
   0ac5: SRO  0005        Store global word BASE5
-> 0ac7: SLDO 05          Short load global BASE5
   0ac8: FJP  $0add       Jump if TOS false
   0aca: SLDO 08          Short load global BASE8
   0acb: SLDO 09          Short load global BASE9
   0acc: INC  0003        Inc field ptr (TOS+3)
   0ace: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0ad0: SLDO 08          Short load global BASE8
   0ad1: INC  0005        Inc field ptr (TOS+5)
   0ad3: SLDO 09          Short load global BASE9
   0ad4: SIND 07          Short index load *TOS+7
   0ad5: STO              Store indirect (TOS into TOS-1)
   0ad6: LAO  0006        Load global BASE6
   0ad8: SLDO 09          Short load global BASE9
   0ad9: INC  0009        Inc field ptr (TOS+9)
   0adb: CSP  09          Call standard procedure TIME
-> 0add: SLDO 05          Short load global BASE5
   0ade: SRO  0001        Store global word BASE1
   0ae0: SLDO 05          Short load global BASE5
   0ae1: LNOT             Logical NOT (~TOS)
   0ae2: FJP  $0afb       Jump if TOS false
   0ae4: SLDO 08          Short load global BASE8
   0ae5: LSA  00          Load string address: ''
   0ae7: NOP              No operation
   0ae8: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0aea: SLDO 08          Short load global BASE8
   0aeb: INC  0005        Inc field ptr (TOS+5)
   0aed: LDCI 7fff        Load word 32767
   0af0: STO              Store indirect (TOS into TOS-1)
   0af1: SLDO 07          Short load global BASE7
   0af2: INC  0004        Inc field ptr (TOS+4)
   0af4: CSP  21          Call standard procedure RELEASE
   0af6: SLDO 07          Short load global BASE7
   0af7: INC  0004        Inc field ptr (TOS+4)
   0af9: LDCN             Load constant NIL
   0afa: STO              Store indirect (TOS into TOS-1)
-> 0afb: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC43 (* P=43 LL=0 *)
  BASE1
  BASE2
BEGIN
-> 0b0e: SLDC 00          Short load constant 0
   0b0f: STR  01 0045     Store TOS to G69
-> 0b12: LDA  01 0036     Load addr G54
   0b15: CSP  21          Call standard procedure RELEASE
   0b17: LDA  01 007e     Load addr G126
   0b1a: LOD  01 0001     Load word at G1 (SYSCOM)
   0b1d: SIND 02          Short index load *TOS+2
   0b1e: IXA  0006        Index array (TOS-1 + TOS * 6)
   0b20: LDA  01 003f     Load addr G63
   0b23: NEQSTR           String TOS-1 <> TOS
   0b25: FJP  $0b31       Jump if TOS false
   0b27: LOD  01 0001     Load word at G1 (SYSCOM)
   0b2a: SIND 02          Short index load *TOS+2
   0b2b: SLDC 00          Short load constant 0
   0b2c: SLDC 00          Short load constant 0
   0b2d: CBP  2a          Call base procedure PASCALSY.42
   0b2f: FJP  $0b31       Jump if TOS false
-> 0b31: LDA  01 007e     Load addr G126
   0b34: LOD  01 0001     Load word at G1 (SYSCOM)
   0b37: SIND 02          Short index load *TOS+2
   0b38: IXA  0006        Index array (TOS-1 + TOS * 6)
   0b3a: LDA  01 003f     Load addr G63
   0b3d: NEQSTR           String TOS-1 <> TOS
   0b3f: FJP  $0b7e       Jump if TOS false
   0b41: LDA  01 0046     Load addr G70
   0b44: NOP              No operation
   0b45: LSA  08          Load string address: 'Put in :'
   0b4f: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0b51: LDA  01 003f     Load addr G63
   0b54: LDA  01 0046     Load addr G70
   0b57: SLDC 50          Short load constant 80
   0b58: SLDC 08          Short load constant 8
   0b59: CXP  00 18       Call external procedure PASCALSY.SINSERT
   0b5c: CBP  27          Call base procedure PASCALSY.39
   0b5e: SLDC 00          Short load constant 0
   0b5f: SRO  0001        Store global word BASE1
   0b61: LDCI 0fa0        Load word 4000
   0b64: SRO  0002        Store global word BASE2
-> 0b66: SLDO 01          Short load global BASE1
   0b67: SLDO 02          Short load global BASE2
   0b68: LEQI             Integer TOS-1 <= TOS
   0b69: FJP  $0b72       Jump if TOS false
   0b6b: SLDO 01          Short load global BASE1
   0b6c: SLDC 01          Short load constant 1
   0b6d: ADI              Add integers (TOS + TOS-1)
   0b6e: SRO  0001        Store global word BASE1
   0b70: UJP  $0b66       Unconditional jump
-> 0b72: LOD  01 0001     Load word at G1 (SYSCOM)
   0b75: SIND 02          Short index load *TOS+2
   0b76: SLDC 00          Short load constant 0
   0b77: SLDC 00          Short load constant 0
   0b78: CBP  2a          Call base procedure PASCALSY.42
   0b7a: FJP  $0b7c       Jump if TOS false
-> 0b7c: UJP  $0b31       Unconditional jump
-> 0b7e: LOD  01 0045     Load word at G69
   0b81: SLDC 00          Short load constant 0
   0b82: SLDC 00          Short load constant 0
   0b83: CXP  05 01       Call external procedure GETCMD.1
   0b86: STR  01 0045     Store TOS to G69
   0b89: LOD  01 0045     Load word at G69
   0b8c: UJP  $0b9a       Unconditional jump
   0b8e: LDCN             Load constant NIL
   0b8f: LDCN             Load constant NIL
   0b90: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   0b93: UJP  $0bb4       Unconditional jump
   0b95: CXP  02 01       Call external procedure DEBUGGER.1
   0b98: UJP  $0bb4       Unconditional jump
-> 0bb4: LOD  01 0045     Load word at G69
   0bb7: LDCI 00e0        Load word 224
   0bba: SLDC 01          Short load constant 1
   0bbb: INN              Set membership (TOS-1 in set TOS)
   0bbc: FJP  $0be2       Jump if TOS false
   0bbe: LOD  01 000a     Load word at G10
   0bc1: SLDC 00          Short load constant 0
   0bc2: EQUI             Integer TOS-1 = TOS
   0bc3: FJP  $0be2       Jump if TOS false
   0bc5: LOD  01 0008     Load word at G8
   0bc8: SLDC 01          Short load constant 1
   0bc9: CBP  06          Call base procedure PASCALSY.FCLOSE
   0bcb: CSP  22          Call standard procedure IORESULT
   0bcd: SLDC 00          Short load constant 0
   0bce: NEQI             Integer TOS-1 <> TOS
   0bcf: FJP  $0be2       Jump if TOS false
   0bd1: CSP  22          Call standard procedure IORESULT
   0bd3: SRO  0001        Store global word BASE1
   0bd5: LOD  01 0003     Load word at G3 (OUTPUT)
   0bd8: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0bdb: CBP  26          Call base procedure PASCALSY.38
   0bdd: SLDC 0a          Short load constant 10
   0bde: SLDO 01          Short load global BASE1
   0bdf: CXP  03 01       Call external procedure PRINTERR.PRINTERROR
-> 0be2: LOD  01 0045     Load word at G69
   0be5: SLDC 0c          Short load constant 12
   0be6: SLDC 01          Short load constant 1
   0be7: INN              Set membership (TOS-1 in set TOS)
   0be8: FJP  $0bfe       Jump if TOS false
   0bea: LDA  01 0002     Load addr G2 (INPUT)
   0bed: SLDC 00          Short load constant 0
   0bee: IXA  0001        Index array (TOS-1 + TOS * 1)
   0bf0: SIND 00          Short index load *TOS+0
   0bf1: SLDC 00          Short load constant 0
   0bf2: CBP  06          Call base procedure PASCALSY.FCLOSE
   0bf4: LDA  01 0002     Load addr G2 (INPUT)
   0bf7: SLDC 01          Short load constant 1
   0bf8: IXA  0001        Index array (TOS-1 + TOS * 1)
   0bfa: SIND 00          Short index load *TOS+0
   0bfb: SLDC 01          Short load constant 1
   0bfc: CBP  06          Call base procedure PASCALSY.FCLOSE
-> 0bfe: SLDC 01          Short load constant 1
   0bff: CSP  23          Call standard procedure UNITBUSY
   0c01: SLDC 02          Short load constant 2
   0c02: CSP  23          Call standard procedure UNITBUSY
   0c04: LOR              Logical OR (TOS | TOS-1)
   0c05: FJP  $0c0a       Jump if TOS false
   0c07: SLDC 01          Short load constant 1
   0c08: CSP  26          Call standard procedure UNITCLEAR
-> 0c0a: LOD  01 0045     Load word at G69
   0c0d: SLDC 00          Short load constant 0
   0c0e: EQUI             Integer TOS-1 = TOS
   0c0f: FJP  $0b12       Jump if TOS false
-> 0c11: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC44 (* P=44 LL=1 *)
  MP1
  MP2
BEGIN
-> 0c24: LOD  02 0001     Load word at G1 (SYSCOM)
   0c27: STL  0001        Store TOS into MP1
   0c29: LOD  02 0001     Load word at G1 (SYSCOM)
   0c2c: SIND 05          Short index load *TOS+5
   0c2d: STL  0002        Store TOS into MP2
   0c2f: LOD  02 0003     Load word at G3 (OUTPUT)
   0c32: NOP              No operation
   0c33: LSA  03          Load string address: 'S# '
   0c38: SLDC 00          Short load constant 0
   0c39: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c3c: LOD  02 0003     Load word at G3 (OUTPUT)
   0c3f: SLDL 02          Short load local MP2
   0c40: SIND 03          Short index load *TOS+3
   0c41: SLDC 00          Short load constant 0
   0c42: LDB              Load byte at byte ptr TOS-1 + TOS
   0c43: SLDC 00          Short load constant 0
   0c44: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0c47: LOD  02 0003     Load word at G3 (OUTPUT)
   0c4a: NOP              No operation
   0c4b: LSA  05          Load string address: ', P# '
   0c52: SLDC 00          Short load constant 0
   0c53: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c56: LOD  02 0003     Load word at G3 (OUTPUT)
   0c59: SLDL 02          Short load local MP2
   0c5a: SIND 02          Short index load *TOS+2
   0c5b: SLDC 00          Short load constant 0
   0c5c: LDB              Load byte at byte ptr TOS-1 + TOS
   0c5d: SLDC 00          Short load constant 0
   0c5e: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0c61: LOD  02 0003     Load word at G3 (OUTPUT)
   0c64: NOP              No operation
   0c65: LSA  05          Load string address: ', I# '
   0c6c: SLDC 00          Short load constant 0
   0c6d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c70: SLDL 01          Short load local MP1
   0c71: INC  001d        Inc field ptr (TOS+29)
   0c73: SLDC 01          Short load constant 1
   0c74: SLDC 0a          Short load constant 10
   0c75: LDP              Load packed field (TOS)
   0c76: FJP  $0c89       Jump if TOS false
   0c78: LOD  02 0003     Load word at G3 (OUTPUT)
   0c7b: SLDL 02          Short load local MP2
   0c7c: SIND 04          Short index load *TOS+4
   0c7d: SLDC 00          Short load constant 0
   0c7e: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0c81: LOD  02 0003     Load word at G3 (OUTPUT)
   0c84: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0c87: UJP  $0ca5       Unconditional jump
-> 0c89: LOD  02 0003     Load word at G3 (OUTPUT)
   0c8c: SLDL 02          Short load local MP2
   0c8d: SIND 04          Short index load *TOS+4
   0c8e: SLDL 02          Short load local MP2
   0c8f: SIND 02          Short index load *TOS+2
   0c90: SLDC 02          Short load constant 2
   0c91: SBI              Subtract integers (TOS-1 - TOS)
   0c92: SLDL 02          Short load local MP2
   0c93: SIND 02          Short index load *TOS+2
   0c94: SLDC 01          Short load constant 1
   0c95: NGI              Negate integer
   0c96: IXA  0001        Index array (TOS-1 + TOS * 1)
   0c98: SIND 00          Short index load *TOS+0
   0c99: SBI              Subtract integers (TOS-1 - TOS)
   0c9a: SBI              Subtract integers (TOS-1 - TOS)
   0c9b: SLDC 00          Short load constant 0
   0c9c: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0c9f: LOD  02 0003     Load word at G3 (OUTPUT)
   0ca2: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0ca5: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC45 (* P=45 LL=1 *)
  MP1
BEGIN
-> 0cb2: LOD  02 0001     Load word at G1 (SYSCOM)
   0cb5: STL  0001        Store TOS into MP1
   0cb7: LOD  02 0003     Load word at G3 (OUTPUT)
   0cba: NOP              No operation
   0cbb: LSA  0b          Load string address: 'Exec err # '
   0cc8: SLDC 00          Short load constant 0
   0cc9: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ccc: LOD  02 0003     Load word at G3 (OUTPUT)
   0ccf: SLDL 01          Short load local MP1
   0cd0: SIND 01          Short index load *TOS+1
   0cd1: SLDC 00          Short load constant 0
   0cd2: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0cd5: LOD  02 0003     Load word at G3 (OUTPUT)
   0cd8: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0cdb: SLDL 01          Short load local MP1
   0cdc: SIND 01          Short index load *TOS+1
   0cdd: SLDC 0a          Short load constant 10
   0cde: EQUI             Integer TOS-1 = TOS
   0cdf: FJP  $0cf3       Jump if TOS false
   0ce1: LOD  02 0003     Load word at G3 (OUTPUT)
   0ce4: SLDC 2c          Short load constant 44
   0ce5: SLDC 00          Short load constant 0
   0ce6: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0ce9: LOD  02 0003     Load word at G3 (OUTPUT)
   0cec: SLDL 01          Short load local MP1
   0ced: IND  000b        Static index and load word (TOS+11)
   0cef: SLDC 00          Short load constant 0
   0cf0: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
-> 0cf3: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC46(PARAM1; PARAM2) (* P=46 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0d00: LOD  01 0001     Load word at G1 (SYSCOM)
   0d03: SRO  0003        Store global word BASE3
   0d05: SLDO 01          Short load global BASE1
   0d06: SLDC 00          Short load constant 0
   0d07: NEQI             Integer TOS-1 <> TOS
   0d08: FJP  $0d38       Jump if TOS false
   0d0a: SLDO 03          Short load global BASE3
   0d0b: INC  0024        Inc field ptr (TOS+36)
   0d0d: SLDO 02          Short load global BASE2
   0d0e: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0d11: LDP              Load packed field (TOS)
   0d12: FJP  $0d21       Jump if TOS false
   0d14: LOD  01 0003     Load word at G3 (OUTPUT)
   0d17: SLDO 03          Short load global BASE3
   0d18: INC  001f        Inc field ptr (TOS+31)
   0d1a: SLDC 08          Short load constant 8
   0d1b: SLDC 00          Short load constant 0
   0d1c: LDP              Load packed field (TOS)
   0d1d: SLDC 00          Short load constant 0
   0d1e: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 0d21: LOD  01 0003     Load word at G3 (OUTPUT)
   0d24: SLDO 01          Short load global BASE1
   0d25: SLDC 00          Short load constant 0
   0d26: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0d29: SLDC 0b          Short load constant 11
   0d2a: SLDC 00          Short load constant 0
   0d2b: GRTI             Integer TOS-1 > TOS
   0d2c: FJP  $0d38       Jump if TOS false
   0d2e: LOD  01 0003     Load word at G3 (OUTPUT)
   0d31: LDA  01 0074     Load addr G116
   0d34: SLDC 00          Short load constant 0
   0d35: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0d38: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC47(PARAM1; PARAM2; PARAM3): RETVAL (* P=47 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM3
  BASE4=PARAM2
  BASE5=PARAM1
  BASE6
  BASE10
  BASE11
  BASE12
BEGIN
-> 0d44: SLDC 00          Short load constant 0
   0d45: SRO  0001        Store global word BASE1
   0d47: LOD  01 0001     Load word at G1 (SYSCOM)
   0d4a: SRO  000a        Store global word BASE10
   0d4c: SLDO 0a          Short load global BASE10
   0d4d: INC  001f        Inc field ptr (TOS+31)
   0d4f: SRO  000b        Store global word BASE11
   0d51: SLDO 05          Short load global BASE5
   0d52: SLDO 0a          Short load global BASE10
   0d53: INC  002c        Inc field ptr (TOS+44)
   0d55: SLDC 08          Short load constant 8
   0d56: SLDC 00          Short load constant 0
   0d57: LDP              Load packed field (TOS)
   0d58: EQUI             Integer TOS-1 = TOS
   0d59: FJP  $0e0e       Jump if TOS false
   0d5b: SLDC 01          Short load constant 1
   0d5c: SRO  0001        Store global word BASE1
   0d5e: SLDO 0b          Short load global BASE11
   0d5f: INC  0003        Inc field ptr (TOS+3)
   0d61: SLDC 08          Short load constant 8
   0d62: SLDC 00          Short load constant 0
   0d63: LDP              Load packed field (TOS)
   0d64: SLDC 00          Short load constant 0
   0d65: EQUI             Integer TOS-1 = TOS
   0d66: SLDO 0a          Short load global BASE10
   0d67: INC  001d        Inc field ptr (TOS+29)
   0d69: SLDC 01          Short load constant 1
   0d6a: SLDC 04          Short load constant 4
   0d6b: LDP              Load packed field (TOS)
   0d6c: LOR              Logical OR (TOS | TOS-1)
   0d6d: FJP  $0d88       Jump if TOS false
   0d6f: SLDO 04          Short load global BASE4
   0d70: SLDC 01          Short load constant 1
   0d71: STO              Store indirect (TOS into TOS-1)
   0d72: LOD  01 0003     Load word at G3 (OUTPUT)
   0d75: LSA  04          Load string address: '<DEL'
   0d7b: NOP              No operation
   0d7c: SLDC 00          Short load constant 0
   0d7d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0d80: LOD  01 0003     Load word at G3 (OUTPUT)
   0d83: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0d86: UJP  $0e0c       Unconditional jump
-> 0d88: LAO  0006        Load global BASE6
   0d8a: NOP              No operation
   0d8b: LSA  03          Load string address: '   '
   0d90: SAS  06          String assign (TOS to TOS-1, 6 chars)
   0d92: SLDO 0b          Short load global BASE11
   0d93: INC  0005        Inc field ptr (TOS+5)
   0d95: SLDC 05          Short load constant 5
   0d96: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0d99: LDP              Load packed field (TOS)
   0d9a: FJP  $0da6       Jump if TOS false
   0d9c: LAO  0006        Load global BASE6
   0d9e: SLDC 01          Short load constant 1
   0d9f: SLDO 0b          Short load global BASE11
   0da0: SLDC 08          Short load constant 8
   0da1: SLDC 00          Short load constant 0
   0da2: LDP              Load packed field (TOS)
   0da3: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0da4: UJP  $0dab       Unconditional jump
-> 0da6: LAO  0006        Load global BASE6
   0da8: SLDC 01          Short load constant 1
   0da9: SLDC 00          Short load constant 0
   0daa: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0dab: LAO  0006        Load global BASE6
   0dad: SLDC 02          Short load constant 2
   0dae: SLDO 0b          Short load global BASE11
   0daf: INC  0003        Inc field ptr (TOS+3)
   0db1: SLDC 08          Short load constant 8
   0db2: SLDC 00          Short load constant 0
   0db3: LDP              Load packed field (TOS)
   0db4: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0db5: LAO  0006        Load global BASE6
   0db7: SLDC 00          Short load constant 0
   0db8: SRO  000c        Store global word BASE12
   0dba: LAO  000c        Load global BASE12
   0dbc: LAO  0006        Load global BASE6
   0dbe: SLDC 06          Short load constant 6
   0dbf: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0dc2: LAO  000c        Load global BASE12
   0dc4: LAO  0006        Load global BASE6
   0dc6: SLDC 0c          Short load constant 12
   0dc7: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0dca: LAO  000c        Load global BASE12
   0dcc: SAS  06          String assign (TOS to TOS-1, 6 chars)
   0dce: SLDO 0b          Short load global BASE11
   0dcf: INC  0001        Inc field ptr (TOS+1)
   0dd1: SLDC 08          Short load constant 8
   0dd2: SLDC 08          Short load constant 8
   0dd3: LDP              Load packed field (TOS)
   0dd4: SLDC 00          Short load constant 0
   0dd5: EQUI             Integer TOS-1 = TOS
   0dd6: FJP  $0ddf       Jump if TOS false
   0dd8: LAO  0006        Load global BASE6
   0dda: SLDC 00          Short load constant 0
   0ddb: SLDC 05          Short load constant 5
   0ddc: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0ddd: UJP  $0de4       Unconditional jump
-> 0ddf: LAO  0006        Load global BASE6
   0de1: SLDC 00          Short load constant 0
   0de2: SLDC 02          Short load constant 2
   0de3: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0de4: SLDO 04          Short load global BASE4
   0de5: SIND 00          Short index load *TOS+0
   0de6: SLDC 01          Short load constant 1
   0de7: GRTI             Integer TOS-1 > TOS
   0de8: FJP  $0e03       Jump if TOS false
   0dea: SLDO 04          Short load global BASE4
   0deb: SLDO 04          Short load global BASE4
   0dec: SIND 00          Short index load *TOS+0
   0ded: SLDC 01          Short load constant 1
   0dee: SBI              Subtract integers (TOS-1 - TOS)
   0def: STO              Store indirect (TOS into TOS-1)
   0df0: SLDO 03          Short load global BASE3
   0df1: SLDO 04          Short load global BASE4
   0df2: SIND 00          Short index load *TOS+0
   0df3: LDB              Load byte at byte ptr TOS-1 + TOS
   0df4: SLDC 20          Short load constant 32
   0df5: GEQI             Integer TOS-1 >= TOS
   0df6: FJP  $0e01       Jump if TOS false
   0df8: LOD  01 0003     Load word at G3 (OUTPUT)
   0dfb: LAO  0006        Load global BASE6
   0dfd: SLDC 00          Short load constant 0
   0dfe: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0e01: UJP  $0de4       Unconditional jump
-> 0e03: SLDC 02          Short load constant 2
   0e04: SLDO 0b          Short load global BASE11
   0e05: INC  0001        Inc field ptr (TOS+1)
   0e07: SLDC 08          Short load constant 8
   0e08: SLDC 08          Short load constant 8
   0e09: LDP              Load packed field (TOS)
   0e0a: CBP  2e          Call base procedure PASCALSY.46
-> 0e0c: UJP  $0e71       Unconditional jump
-> 0e0e: SLDO 05          Short load global BASE5
   0e0f: SLDO 0a          Short load global BASE10
   0e10: INC  002b        Inc field ptr (TOS+43)
   0e12: SLDC 08          Short load constant 8
   0e13: SLDC 00          Short load constant 0
   0e14: LDP              Load packed field (TOS)
   0e15: EQUI             Integer TOS-1 = TOS
   0e16: FJP  $0e71       Jump if TOS false
   0e18: SLDC 01          Short load constant 1
   0e19: SRO  0001        Store global word BASE1
   0e1b: SLDO 04          Short load global BASE4
   0e1c: SIND 00          Short index load *TOS+0
   0e1d: SLDC 01          Short load constant 1
   0e1e: GRTI             Integer TOS-1 > TOS
   0e1f: FJP  $0e71       Jump if TOS false
   0e21: SLDO 04          Short load global BASE4
   0e22: SLDO 04          Short load global BASE4
   0e23: SIND 00          Short index load *TOS+0
   0e24: SLDC 01          Short load constant 1
   0e25: SBI              Subtract integers (TOS-1 - TOS)
   0e26: STO              Store indirect (TOS into TOS-1)
   0e27: SLDO 0b          Short load global BASE11
   0e28: INC  0003        Inc field ptr (TOS+3)
   0e2a: SLDC 08          Short load constant 8
   0e2b: SLDC 00          Short load constant 0
   0e2c: LDP              Load packed field (TOS)
   0e2d: SLDC 00          Short load constant 0
   0e2e: EQUI             Integer TOS-1 = TOS
   0e2f: FJP  $0e4f       Jump if TOS false
   0e31: SLDO 0a          Short load global BASE10
   0e32: INC  002b        Inc field ptr (TOS+43)
   0e34: SLDC 08          Short load constant 8
   0e35: SLDC 00          Short load constant 0
   0e36: LDP              Load packed field (TOS)
   0e37: SLDC 20          Short load constant 32
   0e38: LESI             Integer TOS-1 < TOS
   0e39: FJP  $0e45       Jump if TOS false
   0e3b: LOD  01 0003     Load word at G3 (OUTPUT)
   0e3e: SLDC 5f          Short load constant 95
   0e3f: SLDC 00          Short load constant 0
   0e40: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0e43: UJP  $0e4d       Unconditional jump
-> 0e45: LOD  01 0003     Load word at G3 (OUTPUT)
   0e48: SLDO 05          Short load global BASE5
   0e49: SLDC 00          Short load constant 0
   0e4a: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 0e4d: UJP  $0e71       Unconditional jump
-> 0e4f: SLDO 03          Short load global BASE3
   0e50: SLDO 04          Short load global BASE4
   0e51: SIND 00          Short index load *TOS+0
   0e52: LDB              Load byte at byte ptr TOS-1 + TOS
   0e53: SLDC 20          Short load constant 32
   0e54: GEQI             Integer TOS-1 >= TOS
   0e55: FJP  $0e71       Jump if TOS false
   0e57: SLDC 05          Short load constant 5
   0e58: SLDO 0b          Short load global BASE11
   0e59: INC  0003        Inc field ptr (TOS+3)
   0e5b: SLDC 08          Short load constant 8
   0e5c: SLDC 00          Short load constant 0
   0e5d: LDP              Load packed field (TOS)
   0e5e: CBP  2e          Call base procedure PASCALSY.46
   0e60: LOD  01 0003     Load word at G3 (OUTPUT)
   0e63: SLDC 20          Short load constant 32
   0e64: SLDC 00          Short load constant 0
   0e65: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0e68: SLDC 05          Short load constant 5
   0e69: SLDO 0b          Short load global BASE11
   0e6a: INC  0003        Inc field ptr (TOS+3)
   0e6c: SLDC 08          Short load constant 8
   0e6d: SLDC 00          Short load constant 0
   0e6e: LDP              Load packed field (TOS)
   0e6f: CBP  2e          Call base procedure PASCALSY.46
-> 0e71: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FUNC48(PARAM1; PARAM2; PARAM3; PARAM4): RETVAL (* P=48 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM4
  BASE4=PARAM3
  BASE5=PARAM2
  BASE6=PARAM1
  BASE7
  BASE8
  BASE9
  BASE10
  BASE11
  BASE12
  BASE13
  BASE14
  BASE15
  BASE16
  BASE24
  BASE25
  BASE26
BEGIN
-> 0e84: SLDC 00          Short load constant 0
   0e85: SRO  0008        Store global word BASE8
   0e87: SLDO 03          Short load global BASE3
   0e88: SLDC 00          Short load constant 0
   0e89: IXA  000d        Index array (TOS-1 + TOS * 13)
   0e8b: IND  0008        Static index and load word (TOS+8)
   0e8d: SRO  0009        Store global word BASE9
   0e8f: SLDC 00          Short load constant 0
   0e90: SRO  0007        Store global word BASE7
   0e92: SLDC 00          Short load constant 0
   0e93: SRO  000c        Store global word BASE12
   0e95: SLDO 05          Short load global BASE5
   0e96: SLDC 00          Short load constant 0
   0e97: LEQI             Integer TOS-1 <= TOS
   0e98: FJP  $0eeb       Jump if TOS false
   0e9a: SLDO 05          Short load global BASE5
   0e9b: SLDC 00          Short load constant 0
   0e9c: LESI             Integer TOS-1 < TOS
   0e9d: SRO  000b        Store global word BASE11
   0e9f: SLDC 01          Short load constant 1
   0ea0: SRO  000a        Store global word BASE10
   0ea2: SLDO 09          Short load global BASE9
   0ea3: SRO  001a        Store global word BASE26
-> 0ea5: SLDO 0a          Short load global BASE10
   0ea6: LDO  001a        Load global word BASE26
   0ea8: LEQI             Integer TOS-1 <= TOS
   0ea9: FJP  $0ec1       Jump if TOS false
   0eab: SLDO 0a          Short load global BASE10
   0eac: SLDO 03          Short load global BASE3
   0ead: SLDO 0a          Short load global BASE10
   0eae: SLDC 01          Short load constant 1
   0eaf: SBI              Subtract integers (TOS-1 - TOS)
   0eb0: IXA  000d        Index array (TOS-1 + TOS * 13)
   0eb2: SIND 01          Short index load *TOS+1
   0eb3: SLDO 03          Short load global BASE3
   0eb4: SLDO 0a          Short load global BASE10
   0eb5: IXA  000d        Index array (TOS-1 + TOS * 13)
   0eb7: SIND 00          Short index load *TOS+0
   0eb8: CLP  31          Call local procedure PASCALSY.49
   0eba: SLDO 0a          Short load global BASE10
   0ebb: SLDC 01          Short load constant 1
   0ebc: ADI              Add integers (TOS + TOS-1)
   0ebd: SRO  000a        Store global word BASE10
   0ebf: UJP  $0ea5       Unconditional jump
-> 0ec1: SLDO 09          Short load global BASE9
   0ec2: SLDC 01          Short load constant 1
   0ec3: ADI              Add integers (TOS + TOS-1)
   0ec4: SLDO 03          Short load global BASE3
   0ec5: SLDO 09          Short load global BASE9
   0ec6: IXA  000d        Index array (TOS-1 + TOS * 13)
   0ec8: SIND 01          Short index load *TOS+1
   0ec9: SLDO 03          Short load global BASE3
   0eca: SLDC 00          Short load constant 0
   0ecb: IXA  000d        Index array (TOS-1 + TOS * 13)
   0ecd: SIND 07          Short index load *TOS+7
   0ece: CLP  31          Call local procedure PASCALSY.49
   0ed0: SLDO 0b          Short load global BASE11
   0ed1: FJP  $0ee9       Jump if TOS false
   0ed3: SLDO 05          Short load global BASE5
   0ed4: SLDC 02          Short load constant 2
   0ed5: DVI              Divide integers (TOS-1 / TOS)
   0ed6: SLDO 0c          Short load global BASE12
   0ed7: LEQI             Integer TOS-1 <= TOS
   0ed8: FJP  $0ee2       Jump if TOS false
   0eda: SLDO 0c          Short load global BASE12
   0edb: SRO  0005        Store global word BASE5
   0edd: SLDO 07          Short load global BASE7
   0ede: SRO  0008        Store global word BASE8
   0ee0: UJP  $0ee9       Unconditional jump
-> 0ee2: SLDO 05          Short load global BASE5
   0ee3: SLDC 01          Short load constant 1
   0ee4: ADI              Add integers (TOS + TOS-1)
   0ee5: SLDC 02          Short load constant 2
   0ee6: DVI              Divide integers (TOS-1 / TOS)
   0ee7: SRO  0005        Store global word BASE5
-> 0ee9: UJP  $0f2a       Unconditional jump
-> 0eeb: SLDC 01          Short load constant 1
   0eec: SRO  000a        Store global word BASE10
-> 0eee: SLDO 0a          Short load global BASE10
   0eef: SLDO 09          Short load global BASE9
   0ef0: LEQI             Integer TOS-1 <= TOS
   0ef1: FJP  $0f11       Jump if TOS false
   0ef3: SLDO 03          Short load global BASE3
   0ef4: SLDO 0a          Short load global BASE10
   0ef5: IXA  000d        Index array (TOS-1 + TOS * 13)
   0ef7: SIND 00          Short index load *TOS+0
   0ef8: SLDO 03          Short load global BASE3
   0ef9: SLDO 0a          Short load global BASE10
   0efa: SLDC 01          Short load constant 1
   0efb: SBI              Subtract integers (TOS-1 - TOS)
   0efc: IXA  000d        Index array (TOS-1 + TOS * 13)
   0efe: SIND 01          Short index load *TOS+1
   0eff: SBI              Subtract integers (TOS-1 - TOS)
   0f00: SLDO 05          Short load global BASE5
   0f01: GEQI             Integer TOS-1 >= TOS
   0f02: FJP  $0f0a       Jump if TOS false
   0f04: SLDO 0a          Short load global BASE10
   0f05: SRO  0008        Store global word BASE8
   0f07: SLDO 09          Short load global BASE9
   0f08: SRO  000a        Store global word BASE10
-> 0f0a: SLDO 0a          Short load global BASE10
   0f0b: SLDC 01          Short load constant 1
   0f0c: ADI              Add integers (TOS + TOS-1)
   0f0d: SRO  000a        Store global word BASE10
   0f0f: UJP  $0eee       Unconditional jump
-> 0f11: SLDO 08          Short load global BASE8
   0f12: SLDC 00          Short load constant 0
   0f13: EQUI             Integer TOS-1 = TOS
   0f14: FJP  $0f2a       Jump if TOS false
   0f16: SLDO 03          Short load global BASE3
   0f17: SLDC 00          Short load constant 0
   0f18: IXA  000d        Index array (TOS-1 + TOS * 13)
   0f1a: SIND 07          Short index load *TOS+7
   0f1b: SLDO 03          Short load global BASE3
   0f1c: SLDO 09          Short load global BASE9
   0f1d: IXA  000d        Index array (TOS-1 + TOS * 13)
   0f1f: SIND 01          Short index load *TOS+1
   0f20: SBI              Subtract integers (TOS-1 - TOS)
   0f21: SLDO 05          Short load global BASE5
   0f22: GEQI             Integer TOS-1 >= TOS
   0f23: FJP  $0f2a       Jump if TOS false
   0f25: SLDO 09          Short load global BASE9
   0f26: SLDC 01          Short load constant 1
   0f27: ADI              Add integers (TOS + TOS-1)
   0f28: SRO  0008        Store global word BASE8
-> 0f2a: SLDO 09          Short load global BASE9
   0f2b: SLDC 4d          Short load constant 77
   0f2c: EQUI             Integer TOS-1 = TOS
   0f2d: FJP  $0f32       Jump if TOS false
   0f2f: SLDC 00          Short load constant 0
   0f30: SRO  0008        Store global word BASE8
-> 0f32: SLDO 08          Short load global BASE8
   0f33: SLDC 00          Short load constant 0
   0f34: GRTI             Integer TOS-1 > TOS
   0f35: FJP  $0f6d       Jump if TOS false
   0f37: SLDO 03          Short load global BASE3
   0f38: SLDO 08          Short load global BASE8
   0f39: SLDC 01          Short load constant 1
   0f3a: SBI              Subtract integers (TOS-1 - TOS)
   0f3b: IXA  000d        Index array (TOS-1 + TOS * 13)
   0f3d: SIND 01          Short index load *TOS+1
   0f3e: SRO  000d        Store global word BASE13
   0f40: SLDO 0d          Short load global BASE13
   0f41: SLDO 05          Short load global BASE5
   0f42: ADI              Add integers (TOS + TOS-1)
   0f43: SRO  000e        Store global word BASE14
   0f45: LAO  000f        Load global BASE15
   0f47: SLDC 04          Short load constant 4
   0f48: SLDC 00          Short load constant 0
   0f49: SLDO 04          Short load global BASE4
   0f4a: STP              Store packed field (TOS into TOS-1)
   0f4b: LAO  0010        Load global BASE16
   0f4d: SLDO 06          Short load global BASE6
   0f4e: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0f50: LDCI 0200        Load word 512
   0f53: SRO  0018        Store global word BASE24
   0f55: LAO  0019        Load global BASE25
   0f57: SLDC 04          Short load constant 4
   0f58: SLDC 00          Short load constant 0
   0f59: SLDC 00          Short load constant 0
   0f5a: STP              Store packed field (TOS into TOS-1)
   0f5b: LAO  0019        Load global BASE25
   0f5d: SLDC 05          Short load constant 5
   0f5e: SLDC 04          Short load constant 4
   0f5f: SLDC 00          Short load constant 0
   0f60: STP              Store packed field (TOS into TOS-1)
   0f61: LAO  0019        Load global BASE25
   0f63: SLDC 07          Short load constant 7
   0f64: SLDC 09          Short load constant 9
   0f65: SLDC 64          Short load constant 100
   0f66: STP              Store packed field (TOS into TOS-1)
   0f67: LAO  000d        Load global BASE13
   0f69: SLDO 08          Short load global BASE8
   0f6a: SLDO 03          Short load global BASE3
   0f6b: CBP  23          Call base procedure PASCALSY.35
-> 0f6d: SLDO 08          Short load global BASE8
   0f6e: SRO  0001        Store global word BASE1
-> 0f70: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC49(PARAM1; PARAM2; PARAM3) (* P=49 LL=1 *)
  BASE5
  BASE7
  BASE8
  BASE12
  MP1=PARAM3
  MP2=PARAM2
  MP3=PARAM1
  MP4
BEGIN
-> 0f80: SLDL 01          Short load local MP1
   0f81: SLDL 02          Short load local MP2
   0f82: SBI              Subtract integers (TOS-1 - TOS)
   0f83: STL  0004        Store TOS into MP4
   0f85: SLDL 04          Short load local MP4
   0f86: SLDO 05          Short load global BASE5
   0f87: GRTI             Integer TOS-1 > TOS
   0f88: FJP  $0f98       Jump if TOS false
   0f8a: SLDO 08          Short load global BASE8
   0f8b: SRO  0007        Store global word BASE7
   0f8d: SLDO 05          Short load global BASE5
   0f8e: SRO  000c        Store global word BASE12
   0f90: SLDL 03          Short load local MP3
   0f91: SRO  0008        Store global word BASE8
   0f93: SLDL 04          Short load local MP4
   0f94: SRO  0005        Store global word BASE5
   0f96: UJP  $0fa3       Unconditional jump
-> 0f98: SLDL 04          Short load local MP4
   0f99: SLDO 0c          Short load global BASE12
   0f9a: GRTI             Integer TOS-1 > TOS
   0f9b: FJP  $0fa3       Jump if TOS false
   0f9d: SLDL 04          Short load local MP4
   0f9e: SRO  000c        Store global word BASE12
   0fa0: SLDL 03          Short load local MP3
   0fa1: SRO  0007        Store global word BASE7
-> 0fa3: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC50(PARAM1) (* P=50 LL=0 *)
  BASE1=PARAM1
  BASE2
  BASE3
BEGIN
-> 0fb0: SLDO 01          Short load global BASE1
   0fb1: SRO  0003        Store global word BASE3
   0fb3: SLDO 03          Short load global BASE3
   0fb4: INC  000e        Inc field ptr (TOS+14)
   0fb6: SLDC 00          Short load constant 0
   0fb7: STO              Store indirect (TOS into TOS-1)
   0fb8: SLDO 03          Short load global BASE3
   0fb9: INC  0001        Inc field ptr (TOS+1)
   0fbb: SLDC 00          Short load constant 0
   0fbc: STO              Store indirect (TOS into TOS-1)
   0fbd: SLDO 03          Short load global BASE3
   0fbe: INC  0002        Inc field ptr (TOS+2)
   0fc0: SLDC 00          Short load constant 0
   0fc1: STO              Store indirect (TOS into TOS-1)
   0fc2: SLDO 03          Short load global BASE3
   0fc3: SIND 06          Short index load *TOS+6
   0fc4: FJP  $1092       Jump if TOS false
   0fc6: SLDO 03          Short load global BASE3
   0fc7: IND  000d        Static index and load word (TOS+13)
   0fc9: SLDO 03          Short load global BASE3
   0fca: IND  000c        Static index and load word (TOS+12)
   0fcc: GRTI             Integer TOS-1 > TOS
   0fcd: SRO  0002        Store global word BASE2
   0fcf: SLDO 02          Short load global BASE2
   0fd0: FJP  $0fd9       Jump if TOS false
   0fd2: SLDO 03          Short load global BASE3
   0fd3: INC  000c        Inc field ptr (TOS+12)
   0fd5: SLDO 03          Short load global BASE3
   0fd6: IND  000d        Static index and load word (TOS+13)
   0fd8: STO              Store indirect (TOS into TOS-1)
-> 0fd9: SLDO 03          Short load global BASE3
   0fda: IND  001d        Static index and load word (TOS+29)
   0fdc: FJP  $107a       Jump if TOS false
   0fde: SLDO 02          Short load global BASE2
   0fdf: FJP  $0fea       Jump if TOS false
   0fe1: SLDO 03          Short load global BASE3
   0fe2: INC  001e        Inc field ptr (TOS+30)
   0fe4: SLDO 03          Short load global BASE3
   0fe5: IND  001f        Static index and load word (TOS+31)
   0fe7: STO              Store indirect (TOS into TOS-1)
   0fe8: UJP  $1006       Unconditional jump
-> 0fea: SLDO 03          Short load global BASE3
   0feb: IND  000d        Static index and load word (TOS+13)
   0fed: SLDO 03          Short load global BASE3
   0fee: IND  000c        Static index and load word (TOS+12)
   0ff0: EQUI             Integer TOS-1 = TOS
   0ff1: FJP  $1006       Jump if TOS false
   0ff3: SLDO 03          Short load global BASE3
   0ff4: IND  001f        Static index and load word (TOS+31)
   0ff6: SLDO 03          Short load global BASE3
   0ff7: IND  001e        Static index and load word (TOS+30)
   0ff9: GRTI             Integer TOS-1 > TOS
   0ffa: FJP  $1006       Jump if TOS false
   0ffc: SLDC 01          Short load constant 1
   0ffd: SRO  0002        Store global word BASE2
   0fff: SLDO 03          Short load global BASE3
   1000: INC  001e        Inc field ptr (TOS+30)
   1002: SLDO 03          Short load global BASE3
   1003: IND  001f        Static index and load word (TOS+31)
   1005: STO              Store indirect (TOS into TOS-1)
-> 1006: SLDO 03          Short load global BASE3
   1007: IND  0020        Static index and load word (TOS+32)
   1009: FJP  $1073       Jump if TOS false
   100b: SLDO 03          Short load global BASE3
   100c: INC  0020        Inc field ptr (TOS+32)
   100e: SLDC 00          Short load constant 0
   100f: STO              Store indirect (TOS into TOS-1)
   1010: SLDO 03          Short load global BASE3
   1011: INC  000f        Inc field ptr (TOS+15)
   1013: SLDC 01          Short load constant 1
   1014: STO              Store indirect (TOS into TOS-1)
   1015: SLDO 02          Short load global BASE2
   1016: FJP  $1028       Jump if TOS false
   1018: SLDO 03          Short load global BASE3
   1019: INC  0021        Inc field ptr (TOS+33)
   101b: SLDO 03          Short load global BASE3
   101c: IND  001f        Static index and load word (TOS+31)
   101e: LDCI 0200        Load word 512
   1021: SLDO 03          Short load global BASE3
   1022: IND  001f        Static index and load word (TOS+31)
   1024: SBI              Subtract integers (TOS-1 - TOS)
   1025: SLDC 00          Short load constant 0
   1026: CSP  0a          Call standard procedure FLCH
-> 1028: SLDO 03          Short load global BASE3
   1029: SIND 07          Short index load *TOS+7
   102a: SLDO 03          Short load global BASE3
   102b: INC  0021        Inc field ptr (TOS+33)
   102d: SLDC 00          Short load constant 0
   102e: LDCI 0200        Load word 512
   1031: SLDO 03          Short load global BASE3
   1032: IND  0010        Static index and load word (TOS+16)
   1034: SLDO 03          Short load global BASE3
   1035: IND  000d        Static index and load word (TOS+13)
   1037: ADI              Add integers (TOS + TOS-1)
   1038: SLDC 01          Short load constant 1
   1039: SBI              Subtract integers (TOS-1 - TOS)
   103a: SLDC 00          Short load constant 0
   103b: CSP  06          Call standard procedure UNITWRITE
   103d: SLDO 02          Short load global BASE2
   103e: SLDO 03          Short load global BASE3
   103f: INC  0012        Inc field ptr (TOS+18)
   1041: SLDC 04          Short load constant 4
   1042: SLDC 00          Short load constant 0
   1043: LDP              Load packed field (TOS)
   1044: SLDC 03          Short load constant 3
   1045: EQUI             Integer TOS-1 = TOS
   1046: LAND             Logical AND (TOS & TOS-1)
   1047: SLDO 03          Short load global BASE3
   1048: IND  000d        Static index and load word (TOS+13)
   104a: LAND             Logical AND (TOS & TOS-1)
   104b: FJP  $1073       Jump if TOS false
   104d: SLDO 03          Short load global BASE3
   104e: INC  000c        Inc field ptr (TOS+12)
   1050: SLDO 03          Short load global BASE3
   1051: IND  000c        Static index and load word (TOS+12)
   1053: SLDC 01          Short load constant 1
   1054: ADI              Add integers (TOS + TOS-1)
   1055: STO              Store indirect (TOS into TOS-1)
   1056: SLDO 03          Short load global BASE3
   1057: INC  0021        Inc field ptr (TOS+33)
   1059: SLDC 00          Short load constant 0
   105a: LDCI 0200        Load word 512
   105d: SLDC 00          Short load constant 0
   105e: CSP  0a          Call standard procedure FLCH
   1060: SLDO 03          Short load global BASE3
   1061: SIND 07          Short index load *TOS+7
   1062: SLDO 03          Short load global BASE3
   1063: INC  0021        Inc field ptr (TOS+33)
   1065: SLDC 00          Short load constant 0
   1066: LDCI 0200        Load word 512
   1069: SLDO 03          Short load global BASE3
   106a: IND  0010        Static index and load word (TOS+16)
   106c: SLDO 03          Short load global BASE3
   106d: IND  000d        Static index and load word (TOS+13)
   106f: ADI              Add integers (TOS + TOS-1)
   1070: SLDC 00          Short load constant 0
   1071: CSP  06          Call standard procedure UNITWRITE
-> 1073: SLDO 03          Short load global BASE3
   1074: INC  001f        Inc field ptr (TOS+31)
   1076: LDCI 0200        Load word 512
   1079: STO              Store indirect (TOS into TOS-1)
-> 107a: SLDO 03          Short load global BASE3
   107b: INC  000d        Inc field ptr (TOS+13)
   107d: SLDC 00          Short load constant 0
   107e: STO              Store indirect (TOS into TOS-1)
   107f: SLDO 03          Short load global BASE3
   1080: IND  001d        Static index and load word (TOS+29)
   1082: SLDO 03          Short load global BASE3
   1083: INC  0012        Inc field ptr (TOS+18)
   1085: SLDC 04          Short load constant 4
   1086: SLDC 00          Short load constant 0
   1087: LDP              Load packed field (TOS)
   1088: SLDC 03          Short load constant 3
   1089: EQUI             Integer TOS-1 = TOS
   108a: LAND             Logical AND (TOS & TOS-1)
   108b: FJP  $1092       Jump if TOS false
   108d: SLDO 03          Short load global BASE3
   108e: INC  000d        Inc field ptr (TOS+13)
   1090: SLDC 02          Short load constant 2
   1091: STO              Store indirect (TOS into TOS-1)
-> 1092: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC51(PARAM1): RETVAL (* P=51 LL=0 *)
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
-> 10a2: SLDC 01          Short load constant 1
   10a3: SRO  0001        Store global word BASE1
   10a5: SLDC 00          Short load constant 0
   10a6: SRO  0005        Store global word BASE5
   10a8: SLDO 03          Short load global BASE3
   10a9: SRO  0009        Store global word BASE9
   10ab: SLDO 09          Short load global BASE9
   10ac: INC  0010        Inc field ptr (TOS+16)
   10ae: SRO  000a        Store global word BASE10
   10b0: SLDO 0a          Short load global BASE10
   10b1: INC  0003        Inc field ptr (TOS+3)
   10b3: SLDC 00          Short load constant 0
   10b4: LDB              Load byte at byte ptr TOS-1 + TOS
   10b5: SLDC 00          Short load constant 0
   10b6: GRTI             Integer TOS-1 > TOS
   10b7: FJP  $117e       Jump if TOS false
   10b9: SLDO 09          Short load global BASE9
   10ba: SIND 07          Short index load *TOS+7
   10bb: SLDO 09          Short load global BASE9
   10bc: INC  0008        Inc field ptr (TOS+8)
   10be: SLDC 00          Short load constant 0
   10bf: LAO  0008        Load global BASE8
   10c1: SLDC 00          Short load constant 0
   10c2: SLDC 00          Short load constant 0
   10c3: CBP  1e          Call base procedure PASCALSY.30
   10c5: NEQI             Integer TOS-1 <> TOS
   10c6: FJP  $10cf       Jump if TOS false
   10c8: LOD  01 0001     Load word at G1 (SYSCOM)
   10cb: SLDC 05          Short load constant 5
   10cc: STO              Store indirect (TOS into TOS-1)
   10cd: UJP  $117e       Unconditional jump
-> 10cf: SLDC 00          Short load constant 0
   10d0: SRO  0006        Store global word BASE6
   10d2: SLDC 01          Short load constant 1
   10d3: SRO  0004        Store global word BASE4
-> 10d5: SLDO 04          Short load global BASE4
   10d6: SLDO 08          Short load global BASE8
   10d7: SLDC 00          Short load constant 0
   10d8: IXA  000d        Index array (TOS-1 + TOS * 13)
   10da: IND  0008        Static index and load word (TOS+8)
   10dc: LEQI             Integer TOS-1 <= TOS
   10dd: SLDO 06          Short load global BASE6
   10de: LNOT             Logical NOT (~TOS)
   10df: LAND             Logical AND (TOS & TOS-1)
   10e0: FJP  $10fc       Jump if TOS false
   10e2: SLDO 08          Short load global BASE8
   10e3: SLDO 04          Short load global BASE4
   10e4: IXA  000d        Index array (TOS-1 + TOS * 13)
   10e6: SIND 00          Short index load *TOS+0
   10e7: SLDO 0a          Short load global BASE10
   10e8: SIND 00          Short index load *TOS+0
   10e9: EQUI             Integer TOS-1 = TOS
   10ea: SLDO 08          Short load global BASE8
   10eb: SLDO 04          Short load global BASE4
   10ec: IXA  000d        Index array (TOS-1 + TOS * 13)
   10ee: SIND 01          Short index load *TOS+1
   10ef: SLDO 0a          Short load global BASE10
   10f0: SIND 01          Short index load *TOS+1
   10f1: EQUI             Integer TOS-1 = TOS
   10f2: LAND             Logical AND (TOS & TOS-1)
   10f3: SRO  0006        Store global word BASE6
   10f5: SLDO 04          Short load global BASE4
   10f6: SLDC 01          Short load constant 1
   10f7: ADI              Add integers (TOS + TOS-1)
   10f8: SRO  0004        Store global word BASE4
   10fa: UJP  $10d5       Unconditional jump
-> 10fc: SLDO 06          Short load global BASE6
   10fd: LNOT             Logical NOT (~TOS)
   10fe: FJP  $1107       Jump if TOS false
   1100: LOD  01 0001     Load word at G1 (SYSCOM)
   1103: SLDC 06          Short load constant 6
   1104: STO              Store indirect (TOS into TOS-1)
   1105: UJP  $117e       Unconditional jump
-> 1107: SLDO 04          Short load global BASE4
   1108: SLDO 08          Short load global BASE8
   1109: SLDC 00          Short load constant 0
   110a: IXA  000d        Index array (TOS-1 + TOS * 13)
   110c: IND  0008        Static index and load word (TOS+8)
   110e: GRTI             Integer TOS-1 > TOS
   110f: FJP  $111a       Jump if TOS false
   1111: SLDO 08          Short load global BASE8
   1112: SLDC 00          Short load constant 0
   1113: IXA  000d        Index array (TOS-1 + TOS * 13)
   1115: SIND 07          Short index load *TOS+7
   1116: SRO  0007        Store global word BASE7
   1118: UJP  $1121       Unconditional jump
-> 111a: SLDO 08          Short load global BASE8
   111b: SLDO 04          Short load global BASE4
   111c: IXA  000d        Index array (TOS-1 + TOS * 13)
   111e: SIND 00          Short index load *TOS+0
   111f: SRO  0007        Store global word BASE7
-> 1121: SLDO 0a          Short load global BASE10
   1122: SIND 01          Short index load *TOS+1
   1123: SLDO 07          Short load global BASE7
   1124: LESI             Integer TOS-1 < TOS
   1125: SLDO 0a          Short load global BASE10
   1126: IND  000b        Static index and load word (TOS+11)
   1128: LDCI 0200        Load word 512
   112b: LESI             Integer TOS-1 < TOS
   112c: LOR              Logical OR (TOS | TOS-1)
   112d: FJP  $117b       Jump if TOS false
   112f: SLDO 08          Short load global BASE8
   1130: SLDO 04          Short load global BASE4
   1131: SLDC 01          Short load constant 1
   1132: SBI              Subtract integers (TOS-1 - TOS)
   1133: IXA  000d        Index array (TOS-1 + TOS * 13)
   1135: SRO  000b        Store global word BASE11
   1137: SLDO 0b          Short load global BASE11
   1138: INC  0001        Inc field ptr (TOS+1)
   113a: SLDO 07          Short load global BASE7
   113b: STO              Store indirect (TOS into TOS-1)
   113c: SLDO 0b          Short load global BASE11
   113d: INC  000b        Inc field ptr (TOS+11)
   113f: LDCI 0200        Load word 512
   1142: STO              Store indirect (TOS into TOS-1)
   1143: SLDO 09          Short load global BASE9
   1144: SIND 07          Short index load *TOS+7
   1145: SLDO 08          Short load global BASE8
   1146: CBP  1f          Call base procedure PASCALSY.31
   1148: CSP  22          Call standard procedure IORESULT
   114a: SLDC 00          Short load constant 0
   114b: NEQI             Integer TOS-1 <> TOS
   114c: FJP  $1150       Jump if TOS false
   114e: UJP  $117e       Unconditional jump
-> 1150: SLDO 09          Short load global BASE9
   1151: INC  0002        Inc field ptr (TOS+2)
   1153: SLDC 00          Short load constant 0
   1154: STO              Store indirect (TOS into TOS-1)
   1155: SLDO 09          Short load global BASE9
   1156: INC  0001        Inc field ptr (TOS+1)
   1158: SLDC 00          Short load constant 0
   1159: STO              Store indirect (TOS into TOS-1)
   115a: SLDO 09          Short load global BASE9
   115b: SIND 03          Short index load *TOS+3
   115c: SLDC 00          Short load constant 0
   115d: NEQI             Integer TOS-1 <> TOS
   115e: FJP  $1165       Jump if TOS false
   1160: SLDO 09          Short load global BASE9
   1161: INC  0003        Inc field ptr (TOS+3)
   1163: SLDC 01          Short load constant 1
   1164: STO              Store indirect (TOS into TOS-1)
-> 1165: SLDO 0a          Short load global BASE10
   1166: INC  0001        Inc field ptr (TOS+1)
   1168: SLDO 07          Short load global BASE7
   1169: STO              Store indirect (TOS into TOS-1)
   116a: SLDO 0a          Short load global BASE10
   116b: INC  000b        Inc field ptr (TOS+11)
   116d: LDCI 0200        Load word 512
   1170: STO              Store indirect (TOS into TOS-1)
   1171: SLDO 0a          Short load global BASE10
   1172: INC  000c        Inc field ptr (TOS+12)
   1174: SLDC 07          Short load constant 7
   1175: SLDC 09          Short load constant 9
   1176: SLDC 64          Short load constant 100
   1177: STP              Store packed field (TOS into TOS-1)
   1178: SLDC 00          Short load constant 0
   1179: SRO  0001        Store global word BASE1
-> 117b: SLDC 01          Short load constant 1
   117c: SRO  0005        Store global word BASE5
-> 117e: SLDO 05          Short load global BASE5
   117f: LNOT             Logical NOT (~TOS)
   1180: FJP  $118c       Jump if TOS false
   1182: SLDO 03          Short load global BASE3
   1183: INC  0002        Inc field ptr (TOS+2)
   1185: SLDC 01          Short load constant 1
   1186: STO              Store indirect (TOS into TOS-1)
   1187: SLDO 03          Short load global BASE3
   1188: INC  0001        Inc field ptr (TOS+1)
   118a: SLDC 01          Short load constant 1
   118b: STO              Store indirect (TOS into TOS-1)
-> 118c: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC52(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5; PARAM6) (* P=52 LL=1 *)
  MP1=PARAM6
  MP2=PARAM5
  MP3=PARAM4
  MP4=PARAM3
  MP5=PARAM2
  MP6=PARAM1
  MP7
  MP8
BEGIN
-> 119e: SLDL 03          Short load local MP3
   119f: SLDC 3f          Short load constant 63
   11a0: GRTI             Integer TOS-1 > TOS
   11a1: FJP  $11a8       Jump if TOS false
   11a3: SLDC 3f          Short load constant 63
   11a4: STL  0008        Store TOS into MP8
   11a6: UJP  $11ab       Unconditional jump
-> 11a8: SLDL 03          Short load local MP3
   11a9: STL  0008        Store TOS into MP8
-> 11ab: SLDL 08          Short load local MP8
   11ac: LDCI 0200        Load word 512
   11af: MPI              Multiply integers (TOS * TOS-1)
   11b0: STL  0007        Store TOS into MP7
-> 11b2: SLDL 03          Short load local MP3
   11b3: SLDC 00          Short load constant 0
   11b4: NEQI             Integer TOS-1 <> TOS
   11b5: FJP  $11ec       Jump if TOS false
   11b7: SLDL 01          Short load local MP1
   11b8: FJP  $11c4       Jump if TOS false
   11ba: SLDL 06          Short load local MP6
   11bb: SLDL 05          Short load local MP5
   11bc: SLDL 04          Short load local MP4
   11bd: SLDL 07          Short load local MP7
   11be: SLDL 02          Short load local MP2
   11bf: SLDC 00          Short load constant 0
   11c0: CSP  05          Call standard procedure UNITREAD
   11c2: UJP  $11cc       Unconditional jump
-> 11c4: SLDL 06          Short load local MP6
   11c5: SLDL 05          Short load local MP5
   11c6: SLDL 04          Short load local MP4
   11c7: SLDL 07          Short load local MP7
   11c8: SLDL 02          Short load local MP2
   11c9: SLDC 00          Short load constant 0
   11ca: CSP  06          Call standard procedure UNITWRITE
-> 11cc: SLDL 03          Short load local MP3
   11cd: SLDL 08          Short load local MP8
   11ce: SBI              Subtract integers (TOS-1 - TOS)
   11cf: STL  0003        Store TOS into MP3
   11d1: SLDL 04          Short load local MP4
   11d2: SLDL 07          Short load local MP7
   11d3: ADI              Add integers (TOS + TOS-1)
   11d4: STL  0004        Store TOS into MP4
   11d6: SLDL 02          Short load local MP2
   11d7: SLDL 08          Short load local MP8
   11d8: ADI              Add integers (TOS + TOS-1)
   11d9: STL  0002        Store TOS into MP2
   11db: SLDL 03          Short load local MP3
   11dc: SLDL 08          Short load local MP8
   11dd: LESI             Integer TOS-1 < TOS
   11de: FJP  $11ea       Jump if TOS false
   11e0: SLDL 03          Short load local MP3
   11e1: STL  0008        Store TOS into MP8
   11e3: SLDL 08          Short load local MP8
   11e4: LDCI 0200        Load word 512
   11e7: MPI              Multiply integers (TOS * TOS-1)
   11e8: STL  0007        Store TOS into MP7
-> 11ea: UJP  $11b2       Unconditional jump
-> 11ec: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC53(PARAM1) (* P=53 LL=1 *)
  MP1=PARAM1
  MP2
  MP292
BEGIN
-> 11fa: LLA  0002        Load local address MP2
   11fc: SLDL 01          Short load local MP1
   11fd: MOV  0122        Move 290 words (TOS to TOS-1)
   1200: SLDL 01          Short load local MP1
   1201: STL  0124        Store TOS into MP292
   1204: LDL  0124        Load local word MP292
   1207: IND  000d        Static index and load word (TOS+13)
   1209: FJP  $1218       Jump if TOS false
   120b: LDL  0124        Load local word MP292
   120e: INC  000d        Inc field ptr (TOS+13)
   1210: LDL  0124        Load local word MP292
   1213: IND  000d        Static index and load word (TOS+13)
   1215: SLDC 01          Short load constant 1
   1216: ADI              Add integers (TOS + TOS-1)
   1217: STO              Store indirect (TOS into TOS-1)
-> 1218: LDL  0124        Load local word MP292
   121b: INC  001f        Inc field ptr (TOS+31)
   121d: LDCI 0200        Load word 512
   1220: STO              Store indirect (TOS into TOS-1)
   1221: SLDL 01          Short load local MP1
   1222: CBP  07          Call base procedure PASCALSY.FGET
   1224: LDL  0124        Load local word MP292
   1227: SIND 02          Short index load *TOS+2
   1228: FJP  $124b       Jump if TOS false
   122a: SLDL 01          Short load local MP1
   122b: LLA  0002        Load local address MP2
   122d: MOV  0122        Move 290 words (TOS to TOS-1)
   1230: LDL  0124        Load local word MP292
   1233: INC  0002        Inc field ptr (TOS+2)
   1235: SLDC 01          Short load constant 1
   1236: STO              Store indirect (TOS into TOS-1)
   1237: LDL  0124        Load local word MP292
   123a: INC  0001        Inc field ptr (TOS+1)
   123c: SLDC 01          Short load constant 1
   123d: STO              Store indirect (TOS into TOS-1)
   123e: LDL  0124        Load local word MP292
   1241: INC  001f        Inc field ptr (TOS+31)
   1243: LDL  0124        Load local word MP292
   1246: IND  001f        Static index and load word (TOS+31)
   1248: SLDC 01          Short load constant 1
   1249: SBI              Subtract integers (TOS-1 - TOS)
   124a: STO              Store indirect (TOS into TOS-1)
-> 124b: RNP  00          Return from nonbase procedure
END

## Segment USERPROG (1)

### PROCEDURE USERPROG.USERPROG(PARAM1; PARAM2) (* P=1 LL=0 *)
BEGIN
-> 0000: LOD  01 0038     Load word at G56
   0003: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0006: LDA  01 0046     Load addr G70
   0009: LSA  0f          Load string address: 'No user program'
   001a: NOP              No operation
   001b: SAS  50          String assign (TOS to TOS-1, 80 chars)
   001d: LOD  01 0038     Load word at G56
   0020: LDA  01 0046     Load addr G70
   0023: SLDC 00          Short load constant 0
   0024: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0027: RBP  00          Return from base procedure
END

## Segment DEBUGGER (2)

### PROCEDURE DEBUGGER.DEBUGGER (* P=1 LL=0 *)
BEGIN
-> 0000: LOD  01 0038     Load word at G56
   0003: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0006: LDA  01 0046     Load addr G70
   0009: LSA  15          Load string address: 'No debugger in system'
   0020: NOP              No operation
   0021: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0023: LOD  01 0038     Load word at G56
   0026: LDA  01 0046     Load addr G70
   0029: SLDC 00          Short load constant 0
   002a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 002d: RBP  00          Return from base procedure
END

## Segment PRINTERR (3)

### PROCEDURE PRINTERR.PRINTERR(PARAM1; PARAM2) (* P=1 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0000: LAO  0003        Load global BASE3
   0002: NOP              No operation
   0003: LSA  16          Load string address: 'Unknown run-time error'
   001b: SAS  28          String assign (TOS to TOS-1, 40 chars)
   001d: SLDO 02          Short load global BASE2
   001e: UJP  $03bc       Unconditional jump
   0020: LAO  0003        Load global BASE3
   0022: NOP              No operation
   0023: LSA  11          Load string address: 'Value range error'
   0036: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0038: UJP  $03e2       Unconditional jump
   003a: LAO  0003        Load global BASE3
   003c: NOP              No operation
   003d: LSA  14          Load string address: 'No proc in seg-table'
   0053: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0055: UJP  $03e2       Unconditional jump
   0057: LAO  0003        Load global BASE3
   0059: LSA  17          Load string address: 'Exit from uncalled proc'
   0072: NOP              No operation
   0073: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0075: UJP  $03e2       Unconditional jump
   0077: LAO  0003        Load global BASE3
   0079: LSA  0e          Load string address: 'Stack overflow'
   0089: NOP              No operation
   008a: SAS  28          String assign (TOS to TOS-1, 40 chars)
   008c: UJP  $03e2       Unconditional jump
   008e: LAO  0003        Load global BASE3
   0090: NOP              No operation
   0091: LSA  10          Load string address: 'Integer overflow'
   00a3: SAS  28          String assign (TOS to TOS-1, 40 chars)
   00a5: UJP  $03e2       Unconditional jump
   00a7: LAO  0003        Load global BASE3
   00a9: LSA  0e          Load string address: 'Divide by zero'
   00b9: NOP              No operation
   00ba: SAS  28          String assign (TOS to TOS-1, 40 chars)
   00bc: UJP  $03e2       Unconditional jump
   00be: LAO  0003        Load global BASE3
   00c0: NOP              No operation
   00c1: LSA  15          Load string address: 'NIL pointer reference'
   00d8: SAS  28          String assign (TOS to TOS-1, 40 chars)
   00da: UJP  $03e2       Unconditional jump
   00dc: LAO  0003        Load global BASE3
   00de: NOP              No operation
   00df: LSA  1b          Load string address: 'Program interrupted by user'
   00fc: SAS  28          String assign (TOS to TOS-1, 40 chars)
   00fe: UJP  $03e2       Unconditional jump
   0100: LAO  0003        Load global BASE3
   0102: NOP              No operation
   0103: LSA  0f          Load string address: 'System IO error'
   0114: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0116: UJP  $03e2       Unconditional jump
   0118: LAO  0003        Load global BASE3
   011a: NOP              No operation
   011b: LSA  0d          Load string address: 'unknown cause'
   012a: SAS  28          String assign (TOS to TOS-1, 40 chars)
   012c: SLDO 01          Short load global BASE1
   012d: UJP  $02ec       Unconditional jump
   012f: LAO  0003        Load global BASE3
   0131: LSA  0c          Load string address: 'parity (CRC)'
   013f: NOP              No operation
   0140: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0142: UJP  $0318       Unconditional jump
   0144: LAO  0003        Load global BASE3
   0146: NOP              No operation
   0147: LSA  0e          Load string address: 'illegal unit #'
   0157: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0159: UJP  $0318       Unconditional jump
   015b: LAO  0003        Load global BASE3
   015d: LSA  12          Load string address: 'illegal IO request'
   0171: NOP              No operation
   0172: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0174: UJP  $0318       Unconditional jump
   0176: LAO  0003        Load global BASE3
   0178: NOP              No operation
   0179: LSA  10          Load string address: 'data-com timeout'
   018b: SAS  28          String assign (TOS to TOS-1, 40 chars)
   018d: UJP  $0318       Unconditional jump
   018f: LAO  0003        Load global BASE3
   0191: LSA  11          Load string address: 'vol went off-line'
   01a4: NOP              No operation
   01a5: SAS  28          String assign (TOS to TOS-1, 40 chars)
   01a7: UJP  $0318       Unconditional jump
   01a9: LAO  0003        Load global BASE3
   01ab: LSA  10          Load string address: 'file lost in dir'
   01bd: NOP              No operation
   01be: SAS  28          String assign (TOS to TOS-1, 40 chars)
   01c0: UJP  $0318       Unconditional jump
   01c2: LAO  0003        Load global BASE3
   01c4: NOP              No operation
   01c5: LSA  0d          Load string address: 'bad file name'
   01d4: SAS  28          String assign (TOS to TOS-1, 40 chars)
   01d6: UJP  $0318       Unconditional jump
   01d8: LAO  0003        Load global BASE3
   01da: NOP              No operation
   01db: LSA  0e          Load string address: 'no room on vol'
   01eb: SAS  28          String assign (TOS to TOS-1, 40 chars)
   01ed: UJP  $0318       Unconditional jump
   01ef: LAO  0003        Load global BASE3
   01f1: LSA  0d          Load string address: 'vol not found'
   0200: NOP              No operation
   0201: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0203: UJP  $0318       Unconditional jump
   0205: LAO  0003        Load global BASE3
   0207: LSA  0e          Load string address: 'file not found'
   0217: NOP              No operation
   0218: SAS  28          String assign (TOS to TOS-1, 40 chars)
   021a: UJP  $0318       Unconditional jump
   021c: LAO  0003        Load global BASE3
   021e: NOP              No operation
   021f: LSA  0d          Load string address: 'dup dir entry'
   022e: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0230: UJP  $0318       Unconditional jump
   0232: LAO  0003        Load global BASE3
   0234: NOP              No operation
   0235: LSA  11          Load string address: 'file already open'
   0248: SAS  28          String assign (TOS to TOS-1, 40 chars)
   024a: UJP  $0318       Unconditional jump
   024c: LAO  0003        Load global BASE3
   024e: NOP              No operation
   024f: LSA  0d          Load string address: 'file not open'
   025e: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0260: UJP  $0318       Unconditional jump
   0262: LAO  0003        Load global BASE3
   0264: NOP              No operation
   0265: LSA  10          Load string address: 'bad input format'
   0277: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0279: UJP  $0318       Unconditional jump
   027b: LAO  0003        Load global BASE3
   027d: LSA  14          Load string address: 'ring buffer overflow'
   0293: NOP              No operation
   0294: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0296: UJP  $0318       Unconditional jump
   0298: LAO  0003        Load global BASE3
   029a: NOP              No operation
   029b: LSA  14          Load string address: 'disk write protected'
   02b1: SAS  28          String assign (TOS to TOS-1, 40 chars)
   02b3: UJP  $0318       Unconditional jump
   02b5: LAO  0003        Load global BASE3
   02b7: LSA  0f          Load string address: 'illegal block #'
   02c8: NOP              No operation
   02c9: SAS  28          String assign (TOS to TOS-1, 40 chars)
   02cb: UJP  $0318       Unconditional jump
   02cd: LAO  0003        Load global BASE3
   02cf: LSA  16          Load string address: 'illegal buffer address'
   02e7: NOP              No operation
   02e8: SAS  28          String assign (TOS to TOS-1, 40 chars)
   02ea: UJP  $0318       Unconditional jump
-> 0318: NOP              No operation
   0319: LSA  0a          Load string address: 'IO error: '
   0325: LAO  0003        Load global BASE3
   0327: SLDC 28          Short load constant 40
   0328: SLDC 01          Short load constant 1
   0329: CXP  00 18       Call external procedure PASCALSY.SINSERT
   032c: UJP  $03e2       Unconditional jump
   032e: LAO  0003        Load global BASE3
   0330: NOP              No operation
   0331: LSA  19          Load string address: 'Unimplemented instruction'
   034c: SAS  28          String assign (TOS to TOS-1, 40 chars)
   034e: UJP  $03e2       Unconditional jump
   0350: LAO  0003        Load global BASE3
   0352: NOP              No operation
   0353: LSA  14          Load string address: 'Floating point error'
   0369: SAS  28          String assign (TOS to TOS-1, 40 chars)
   036b: UJP  $03e2       Unconditional jump
   036d: LAO  0003        Load global BASE3
   036f: LSA  0f          Load string address: 'String overflow'
   0380: NOP              No operation
   0381: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0383: UJP  $03e2       Unconditional jump
   0385: LAO  0003        Load global BASE3
   0387: LSA  0f          Load string address: 'Programmed HALT'
   0398: NOP              No operation
   0399: SAS  28          String assign (TOS to TOS-1, 40 chars)
   039b: UJP  $03e2       Unconditional jump
   039d: LAO  0003        Load global BASE3
   039f: LSA  16          Load string address: 'Programmed break-point'
   03b7: NOP              No operation
   03b8: SAS  28          String assign (TOS to TOS-1, 40 chars)
   03ba: UJP  $03e2       Unconditional jump
-> 03e2: LOD  01 0003     Load word at G3 (OUTPUT)
   03e5: LAO  0003        Load global BASE3
   03e7: SLDC 00          Short load constant 0
   03e8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   03eb: LOD  01 0003     Load word at G3 (OUTPUT)
   03ee: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 03f1: RBP  00          Return from base procedure
END

## Segment INITIALI (4)

### PROCEDURE INITIALI.INITIALI (* P=1 LL=0 *)
  BASE1
  BASE23
  BASE55
  BASE56
BEGIN
-> 0960: LOD  01 0036     Load word at G54
   0963: LDCN             Load constant NIL
   0964: EQUI             Integer TOS-1 = TOS
   0965: SRO  0001        Store global word BASE1
   0967: LAO  0017        Load global BASE23
   0969: SLDC 00          Short load constant 0
   096a: IXA  0002        Index array (TOS-1 + TOS * 2)
   096c: NOP              No operation
   096d: LSA  03          Load string address: '???'
   0972: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0974: LAO  0017        Load global BASE23
   0976: SLDC 01          Short load constant 1
   0977: IXA  0002        Index array (TOS-1 + TOS * 2)
   0979: LSA  03          Load string address: 'Jan'
   097e: NOP              No operation
   097f: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0981: LAO  0017        Load global BASE23
   0983: SLDC 02          Short load constant 2
   0984: IXA  0002        Index array (TOS-1 + TOS * 2)
   0986: NOP              No operation
   0987: LSA  03          Load string address: 'Feb'
   098c: SAS  03          String assign (TOS to TOS-1, 3 chars)
   098e: LAO  0017        Load global BASE23
   0990: SLDC 03          Short load constant 3
   0991: IXA  0002        Index array (TOS-1 + TOS * 2)
   0993: LSA  03          Load string address: 'Mar'
   0998: NOP              No operation
   0999: SAS  03          String assign (TOS to TOS-1, 3 chars)
   099b: LAO  0017        Load global BASE23
   099d: SLDC 04          Short load constant 4
   099e: IXA  0002        Index array (TOS-1 + TOS * 2)
   09a0: NOP              No operation
   09a1: LSA  03          Load string address: 'Apr'
   09a6: SAS  03          String assign (TOS to TOS-1, 3 chars)
   09a8: LAO  0017        Load global BASE23
   09aa: SLDC 05          Short load constant 5
   09ab: IXA  0002        Index array (TOS-1 + TOS * 2)
   09ad: LSA  03          Load string address: 'May'
   09b2: NOP              No operation
   09b3: SAS  03          String assign (TOS to TOS-1, 3 chars)
   09b5: LAO  0017        Load global BASE23
   09b7: SLDC 06          Short load constant 6
   09b8: IXA  0002        Index array (TOS-1 + TOS * 2)
   09ba: NOP              No operation
   09bb: LSA  03          Load string address: 'Jun'
   09c0: SAS  03          String assign (TOS to TOS-1, 3 chars)
   09c2: LAO  0017        Load global BASE23
   09c4: SLDC 07          Short load constant 7
   09c5: IXA  0002        Index array (TOS-1 + TOS * 2)
   09c7: LSA  03          Load string address: 'Jul'
   09cc: NOP              No operation
   09cd: SAS  03          String assign (TOS to TOS-1, 3 chars)
   09cf: LAO  0017        Load global BASE23
   09d1: SLDC 08          Short load constant 8
   09d2: IXA  0002        Index array (TOS-1 + TOS * 2)
   09d4: NOP              No operation
   09d5: LSA  03          Load string address: 'Aug'
   09da: SAS  03          String assign (TOS to TOS-1, 3 chars)
   09dc: LAO  0017        Load global BASE23
   09de: SLDC 09          Short load constant 9
   09df: IXA  0002        Index array (TOS-1 + TOS * 2)
   09e1: LSA  03          Load string address: 'Sep'
   09e6: NOP              No operation
   09e7: SAS  03          String assign (TOS to TOS-1, 3 chars)
   09e9: LAO  0017        Load global BASE23
   09eb: SLDC 0a          Short load constant 10
   09ec: IXA  0002        Index array (TOS-1 + TOS * 2)
   09ee: NOP              No operation
   09ef: LSA  03          Load string address: 'Oct'
   09f4: SAS  03          String assign (TOS to TOS-1, 3 chars)
   09f6: LAO  0017        Load global BASE23
   09f8: SLDC 0b          Short load constant 11
   09f9: IXA  0002        Index array (TOS-1 + TOS * 2)
   09fb: LSA  03          Load string address: 'Nov'
   0a00: NOP              No operation
   0a01: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0a03: LAO  0017        Load global BASE23
   0a05: SLDC 0c          Short load constant 12
   0a06: IXA  0002        Index array (TOS-1 + TOS * 2)
   0a08: NOP              No operation
   0a09: LSA  03          Load string address: 'Dec'
   0a0e: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0a10: LAO  0017        Load global BASE23
   0a12: SLDC 0d          Short load constant 13
   0a13: IXA  0002        Index array (TOS-1 + TOS * 2)
   0a15: LSA  03          Load string address: '???'
   0a1a: NOP              No operation
   0a1b: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0a1d: LAO  0017        Load global BASE23
   0a1f: SLDC 0e          Short load constant 14
   0a20: IXA  0002        Index array (TOS-1 + TOS * 2)
   0a22: NOP              No operation
   0a23: LSA  03          Load string address: '???'
   0a28: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0a2a: LAO  0017        Load global BASE23
   0a2c: SLDC 0f          Short load constant 15
   0a2d: IXA  0002        Index array (TOS-1 + TOS * 2)
   0a2f: LSA  03          Load string address: '???'
   0a34: NOP              No operation
   0a35: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0a37: SLDO 01          Short load global BASE1
   0a38: FJP  $0a3e       Jump if TOS false
   0a3a: CLP  0a          Call local procedure INITIALI.10
   0a3c: UJP  $0a43       Unconditional jump
-> 0a3e: LDA  01 0036     Load addr G54
   0a41: CSP  21          Call standard procedure RELEASE
-> 0a43: CLP  07          Call local procedure INITIALI.7
   0a45: CLP  02          Call local procedure INITIALI.INITSYSCOM
   0a47: CLP  0d          Call local procedure INITIALI.13
   0a49: CLP  03          Call local procedure INITIALI.INIT_FILLER
   0a4b: CLP  0b          Call local procedure INITIALI.11
   0a4d: CXP  00 25       Call external procedure PASCALSY.37
   0a50: LOD  01 0001     Load word at G1 (SYSCOM)
   0a53: INC  001d        Inc field ptr (TOS+29)
   0a55: SLDC 01          Short load constant 1
   0a56: SLDC 01          Short load constant 1
   0a57: LDP              Load packed field (TOS)
   0a58: FJP  $0a5c       Jump if TOS false
   0a5a: CLP  09          Call local procedure INITIALI.9
-> 0a5c: LOD  01 0003     Load word at G3 (OUTPUT)
   0a5f: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a62: SLDO 01          Short load global BASE1
   0a63: FJP  $0b5d       Jump if TOS false
   0a65: LDO  0037        Load global word BASE55
   0a67: LNOT             Logical NOT (~TOS)
   0a68: FJP  $0b5b       Jump if TOS false
   0a6a: LOD  01 0001     Load word at G1 (SYSCOM)
   0a6d: STL  0038        Store TOS into MP56
   0a6f: LDO  0038        Load global word BASE56
   0a71: INC  001d        Inc field ptr (TOS+29)
   0a73: SLDC 01          Short load constant 1
   0a74: SLDC 03          Short load constant 3
   0a75: LDP              Load packed field (TOS)
   0a76: FJP  $0a91       Jump if TOS false
   0a78: SLDC 00          Short load constant 0
   0a79: LDO  0038        Load global word BASE56
   0a7b: IND  0025        Static index and load word (TOS+37)
   0a7d: SLDC 03          Short load constant 3
   0a7e: DVI              Divide integers (TOS-1 / TOS)
   0a7f: CXP  00 1d       Call external procedure PASCALSY.FGOTOXY
   0a82: SLDC 0b          Short load constant 11
   0a83: SLDC 00          Short load constant 0
   0a84: GRTI             Integer TOS-1 > TOS
   0a85: FJP  $0a91       Jump if TOS false
   0a87: LOD  01 0003     Load word at G3 (OUTPUT)
   0a8a: LDA  01 0074     Load addr G116
   0a8d: SLDC 00          Short load constant 0
   0a8e: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0a91: LOD  01 0003     Load word at G3 (OUTPUT)
   0a94: NOP              No operation
   0a95: LSA  09          Load string address: 'Welcome  '
   0aa0: SLDC 00          Short load constant 0
   0aa1: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0aa4: LOD  01 0003     Load word at G3 (OUTPUT)
   0aa7: LDA  01 003f     Load addr G63
   0aaa: SLDC 00          Short load constant 0
   0aab: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0aae: LOD  01 0003     Load word at G3 (OUTPUT)
   0ab1: LSA  05          Load string address: ',  to'
   0ab8: NOP              No operation
   0ab9: SLDC 00          Short load constant 0
   0aba: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0abd: LOD  01 0003     Load word at G3 (OUTPUT)
   0ac0: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ac3: LOD  01 0003     Load word at G3 (OUTPUT)
   0ac6: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ac9: LOD  01 0003     Load word at G3 (OUTPUT)
   0acc: NOP              No operation
   0acd: LSA  1e          Load string address: 'U.C.S.D.  Pascal  System  II.1'
   0aed: SLDC 00          Short load constant 0
   0aee: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0af1: LOD  01 0003     Load word at G3 (OUTPUT)
   0af4: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0af7: LOD  01 0003     Load word at G3 (OUTPUT)
   0afa: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0afd: LOD  01 0003     Load word at G3 (OUTPUT)
   0b00: NOP              No operation
   0b01: LSA  11          Load string address: 'Current date is  '
   0b14: SLDC 00          Short load constant 0
   0b15: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b18: LOD  01 0003     Load word at G3 (OUTPUT)
   0b1b: LDA  01 0043     Load addr G67
   0b1e: SLDC 05          Short load constant 5
   0b1f: SLDC 04          Short load constant 4
   0b20: LDP              Load packed field (TOS)
   0b21: SLDC 00          Short load constant 0
   0b22: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0b25: LOD  01 0003     Load word at G3 (OUTPUT)
   0b28: SLDC 2d          Short load constant 45
   0b29: SLDC 00          Short load constant 0
   0b2a: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0b2d: LOD  01 0003     Load word at G3 (OUTPUT)
   0b30: LAO  0017        Load global BASE23
   0b32: LDA  01 0043     Load addr G67
   0b35: SLDC 04          Short load constant 4
   0b36: SLDC 00          Short load constant 0
   0b37: LDP              Load packed field (TOS)
   0b38: IXA  0002        Index array (TOS-1 + TOS * 2)
   0b3a: SLDC 00          Short load constant 0
   0b3b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b3e: LOD  01 0003     Load word at G3 (OUTPUT)
   0b41: SLDC 2d          Short load constant 45
   0b42: SLDC 00          Short load constant 0
   0b43: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0b46: LOD  01 0003     Load word at G3 (OUTPUT)
   0b49: LDA  01 0043     Load addr G67
   0b4c: SLDC 07          Short load constant 7
   0b4d: SLDC 09          Short load constant 9
   0b4e: LDP              Load packed field (TOS)
   0b4f: SLDC 00          Short load constant 0
   0b50: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0b53: LOD  01 0003     Load word at G3 (OUTPUT)
   0b56: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b59: UJP  $0b5b       Unconditional jump
-> 0b5b: UJP  $0b82       Unconditional jump
-> 0b5d: LOD  01 0003     Load word at G3 (OUTPUT)
   0b60: NOP              No operation
   0b61: LSA  15          Load string address: 'System re-initialized'
   0b78: SLDC 00          Short load constant 0
   0b79: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b7c: LOD  01 0003     Load word at G3 (OUTPUT)
   0b7f: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0b82: RBP  00          Return from base procedure
END

### PROCEDURE INITIALI.INITSYSCOM (* P=2 LL=1 *)
  MP1
  MP6
  MP8
  MP17
  MP291
  MP292
  MP293
  MP389
  MP421
  MP553
  MP594
  MP595
  MP596
  MP597
BEGIN
-> 0000: LDA  02 010a     Load addr G266
   0004: SLDC 00          Short load constant 0
   0005: ADJ  02          Adjust set to 2 words
   0007: STM  02          Store 2 words at TOS to TOS-1
   0009: LDA  02 0108     Load addr G264
   000d: SLDC 00          Short load constant 0
   000e: ADJ  02          Adjust set to 2 words
   0010: STM  02          Store 2 words at TOS to TOS-1
   0012: LLA  0001        Load local address MP1
   0014: LDCN             Load constant NIL
   0015: SLDC 01          Short load constant 1
   0016: NGI              Negate integer
   0017: CXP  00 03       Call external procedure PASCALSY.FINIT
   001a: LLA  0229        Load local address MP553
   001d: LSA  0f          Load string address: '*SYSTEM.LIBRARY'
   002e: NOP              No operation
   002f: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0031: LLA  0001        Load local address MP1
   0033: LLA  0229        Load local address MP553
   0036: SLDC 01          Short load constant 1
   0037: LDCN             Load constant NIL
   0038: CXP  00 05       Call external procedure PASCALSY.FOPEN
   003b: SLDL 06          Short load local MP6
   003c: FJP  $00eb       Jump if TOS false
   003e: SLDL 08          Short load local MP8
   003f: LLA  0125        Load local address MP293
   0042: SLDC 00          Short load constant 0
   0043: LDCI 0208        Load word 520
   0046: LDL  0011        Load local word MP17
   0048: SLDC 00          Short load constant 0
   0049: CSP  05          Call standard procedure UNITREAD
   004b: SLDC 00          Short load constant 0
   004c: STL  0123        Store TOS into MP291
   004f: SLDC 0f          Short load constant 15
   0050: STL  0252        Store TOS into MP594
-> 0053: LDL  0123        Load local word MP291
   0056: LDL  0252        Load local word MP594
   0059: LEQI             Integer TOS-1 <= TOS
   005a: FJP  $00eb       Jump if TOS false
   005c: LLA  0185        Load local address MP389
   005f: LDL  0123        Load local word MP291
   0062: IXA  0001        Index array (TOS-1 + TOS * 1)
   0064: SIND 00          Short index load *TOS+0
   0065: LDCI 00c0        Load word 192
   0068: SLDC 01          Short load constant 1
   0069: INN              Set membership (TOS-1 in set TOS)
   006a: FJP  $00e1       Jump if TOS false
   006c: LLA  01a5        Load local address MP421
   006f: LDL  0123        Load local word MP291
   0072: IXA  0001        Index array (TOS-1 + TOS * 1)
   0074: SLDC 08          Short load constant 8
   0075: SLDC 00          Short load constant 0
   0076: LDP              Load packed field (TOS)
   0077: STL  0124        Store TOS into MP292
   007a: LOD  02 0001     Load word at G1 (SYSCOM)
   007d: STL  0253        Store TOS into MP595
   0080: LDL  0253        Load local word MP595
   0083: INC  0030        Inc field ptr (TOS+48)
   0085: LDL  0124        Load local word MP292
   0088: IXA  0003        Index array (TOS-1 + TOS * 3)
   008a: STL  0254        Store TOS into MP596
   008d: LLA  0125        Load local address MP293
   0090: LDL  0123        Load local word MP291
   0093: IXA  0002        Index array (TOS-1 + TOS * 2)
   0095: STL  0255        Store TOS into MP597
   0098: LDL  0254        Load local word MP596
   009b: LDL  0253        Load local word MP595
   009e: SIND 02          Short index load *TOS+2
   009f: STO              Store indirect (TOS into TOS-1)
   00a0: LDL  0254        Load local word MP596
   00a3: INC  0002        Inc field ptr (TOS+2)
   00a5: LDL  0255        Load local word MP597
   00a8: SIND 01          Short index load *TOS+1
   00a9: STO              Store indirect (TOS into TOS-1)
   00aa: LDA  02 0108     Load addr G264
   00ae: LDA  02 0108     Load addr G264
   00b2: LDM  02          Load 2 words from (TOS)
   00b4: SLDC 02          Short load constant 2
   00b5: LDL  0124        Load local word MP292
   00b8: SGS              Build singleton set [TOS]
   00b9: UNI              Set union (TOS OR TOS-1)
   00ba: ADJ  02          Adjust set to 2 words
   00bc: STM  02          Store 2 words at TOS to TOS-1
   00be: LLA  0185        Load local address MP389
   00c1: LDL  0123        Load local word MP291
   00c4: IXA  0001        Index array (TOS-1 + TOS * 1)
   00c6: SIND 00          Short index load *TOS+0
   00c7: SLDC 07          Short load constant 7
   00c8: EQUI             Integer TOS-1 = TOS
   00c9: FJP  $00d4       Jump if TOS false
   00cb: LDL  0254        Load local word MP596
   00ce: INC  0001        Inc field ptr (TOS+1)
   00d0: SLDC 00          Short load constant 0
   00d1: STO              Store indirect (TOS into TOS-1)
   00d2: UJP  $00e1       Unconditional jump
-> 00d4: LDL  0254        Load local word MP596
   00d7: INC  0001        Inc field ptr (TOS+1)
   00d9: LDL  0011        Load local word MP17
   00db: LDL  0255        Load local word MP597
   00de: SIND 00          Short index load *TOS+0
   00df: ADI              Add integers (TOS + TOS-1)
   00e0: STO              Store indirect (TOS into TOS-1)
-> 00e1: LDL  0123        Load local word MP291
   00e4: SLDC 01          Short load constant 1
   00e5: ADI              Add integers (TOS + TOS-1)
   00e6: STL  0123        Store TOS into MP291
   00e9: UJP  $0053       Unconditional jump
-> 00eb: LLA  0001        Load local address MP1
   00ed: SLDC 00          Short load constant 0
   00ee: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 00f1: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.INIT_FILLER (* P=3 LL=1 *)
  MP1
  MP42
  MP71
  MP72
  MP73
  MP79
  MP186
  MP191
  MP193
  MP202
  MP476
  MP477
BEGIN
-> 0194: LDA  02 0074     Load addr G116
   0197: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0199: LDCN             Load constant NIL
   019a: STR  02 0044     Store TOS to G68
   019d: LDA  02 006f     Load addr G111
   01a0: SLDC 00          Short load constant 0
   01a1: IXA  0001        Index array (TOS-1 + TOS * 1)
   01a3: SLDC 01          Short load constant 1
   01a4: STO              Store indirect (TOS into TOS-1)
   01a5: LDA  02 006f     Load addr G111
   01a8: SLDC 01          Short load constant 1
   01a9: IXA  0001        Index array (TOS-1 + TOS * 1)
   01ab: SLDC 0a          Short load constant 10
   01ac: STO              Store indirect (TOS into TOS-1)
   01ad: LDA  02 006f     Load addr G111
   01b0: SLDC 02          Short load constant 2
   01b1: IXA  0001        Index array (TOS-1 + TOS * 1)
   01b3: SLDC 64          Short load constant 100
   01b4: STO              Store indirect (TOS into TOS-1)
   01b5: LDA  02 006f     Load addr G111
   01b8: SLDC 03          Short load constant 3
   01b9: IXA  0001        Index array (TOS-1 + TOS * 1)
   01bb: LDCI 03e8        Load word 1000
   01be: STO              Store indirect (TOS into TOS-1)
   01bf: LDA  02 006f     Load addr G111
   01c2: SLDC 04          Short load constant 4
   01c3: IXA  0001        Index array (TOS-1 + TOS * 1)
   01c5: LDCI 2710        Load word 10000
   01c8: STO              Store indirect (TOS into TOS-1)
   01c9: LDA  02 007a     Load addr G122
   01ce: LDC  04          Load multiple-word constant
                         03ff000000000000
   01d6: SLDC 04          Short load constant 4
   01d7: ADJ  04          Adjust set to 4 words
   01d9: STM  04          Store 4 words at TOS to TOS-1
   01db: LLA  0001        Load local address MP1
   01dd: LSA  10          Load string address: '*SYSTEM.MISCINFO'
   01ef: NOP              No operation
   01f0: SAS  50          String assign (TOS to TOS-1, 80 chars)
   01f2: LLA  00ba        Load local address MP186
   01f5: LDCN             Load constant NIL
   01f6: SLDC 01          Short load constant 1
   01f7: NGI              Negate integer
   01f8: CXP  00 03       Call external procedure PASCALSY.FINIT
   01fb: LLA  00ba        Load local address MP186
   01fe: LLA  0001        Load local address MP1
   0200: SLDC 01          Short load constant 1
   0201: LDCN             Load constant NIL
   0202: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0205: LDL  00bf        Load local word MP191
   0208: FJP  $0247       Jump if TOS false
   020a: LDL  00c1        Load local word MP193
   020d: LLA  002a        Load local address MP42
   020f: SLDC 00          Short load constant 0
   0210: LDCI 0120        Load word 288
   0213: LDL  00ca        Load local word MP202
   0216: SLDC 00          Short load constant 0
   0217: CSP  05          Call standard procedure UNITREAD
   0219: LOD  02 0001     Load word at G1 (SYSCOM)
   021c: STL  01dc        Store TOS into MP476
   021f: LDL  01dc        Load local word MP476
   0222: INC  001d        Inc field ptr (TOS+29)
   0224: LLA  0047        Load local address MP71
   0226: MOV  0001        Move 1 words (TOS to TOS-1)
   0228: LDL  01dc        Load local word MP476
   022b: INC  001e        Inc field ptr (TOS+30)
   022d: LDL  0048        Load local word MP72
   022f: STO              Store indirect (TOS into TOS-1)
   0230: LDL  01dc        Load local word MP476
   0233: INC  001f        Inc field ptr (TOS+31)
   0235: LLA  0049        Load local address MP73
   0237: MOV  0006        Move 6 words (TOS to TOS-1)
   0239: LDL  01dc        Load local word MP476
   023c: INC  0025        Inc field ptr (TOS+37)
   023e: LLA  004f        Load local address MP79
   0240: MOV  000b        Move 11 words (TOS to TOS-1)
   0242: LDA  02 0074     Load addr G116
   0245: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
-> 0247: LLA  00ba        Load local address MP186
   024a: SLDC 00          Short load constant 0
   024b: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   024e: SLDC 01          Short load constant 1
   024f: CSP  26          Call standard procedure UNITCLEAR
   0251: LOD  02 0001     Load word at G1 (SYSCOM)
   0254: STL  01dc        Store TOS into MP476
   0257: LDL  01dc        Load local word MP476
   025a: INC  0001        Inc field ptr (TOS+1)
   025c: SLDC 00          Short load constant 0
   025d: STO              Store indirect (TOS into TOS-1)
   025e: LDL  01dc        Load local word MP476
   0261: SLDC 00          Short load constant 0
   0262: STO              Store indirect (TOS into TOS-1)
   0263: LDL  01dc        Load local word MP476
   0266: INC  0003        Inc field ptr (TOS+3)
   0268: SLDC 00          Short load constant 0
   0269: STO              Store indirect (TOS into TOS-1)
   026a: LDL  01dc        Load local word MP476
   026d: INC  0025        Inc field ptr (TOS+37)
   026f: STL  01dd        Store TOS into MP477
   0272: LDA  02 010c     Load addr G268
   0276: SLDC 10          Short load constant 16
   0277: SGS              Build singleton set [TOS]
   0278: LDL  01dd        Load local word MP477
   027b: INC  0008        Inc field ptr (TOS+8)
   027d: SLDC 08          Short load constant 8
   027e: SLDC 00          Short load constant 0
   027f: LDP              Load packed field (TOS)
   0280: SGS              Build singleton set [TOS]
   0281: UNI              Set union (TOS OR TOS-1)
   0282: ADJ  10          Adjust set to 16 words
   0284: STM  10          Store 16 words at TOS to TOS-1
   0286: SLDC 00          Short load constant 0
   0287: LDL  01dd        Load local word MP477
   028a: INC  0003        Inc field ptr (TOS+3)
   028c: SLDC 08          Short load constant 8
   028d: SLDC 08          Short load constant 8
   028e: LDP              Load packed field (TOS)
   028f: CLP  06          Call local procedure INITIALI.INITUNITABLE
   0291: SLDC 01          Short load constant 1
   0292: LDL  01dd        Load local word MP477
   0295: INC  0003        Inc field ptr (TOS+3)
   0297: SLDC 08          Short load constant 8
   0298: SLDC 00          Short load constant 0
   0299: LDP              Load packed field (TOS)
   029a: CLP  06          Call local procedure INITIALI.INITUNITABLE
   029c: SLDC 03          Short load constant 3
   029d: LDL  01dd        Load local word MP477
   02a0: INC  0002        Inc field ptr (TOS+2)
   02a2: SLDC 08          Short load constant 8
   02a3: SLDC 08          Short load constant 8
   02a4: LDP              Load packed field (TOS)
   02a5: CLP  06          Call local procedure INITIALI.INITUNITABLE
   02a7: SLDC 02          Short load constant 2
   02a8: LDL  01dd        Load local word MP477
   02ab: INC  0002        Inc field ptr (TOS+2)
   02ad: SLDC 08          Short load constant 8
   02ae: SLDC 00          Short load constant 0
   02af: LDP              Load packed field (TOS)
   02b0: CLP  06          Call local procedure INITIALI.INITUNITABLE
   02b2: SLDC 0b          Short load constant 11
   02b3: LDL  01dd        Load local word MP477
   02b6: INC  0006        Inc field ptr (TOS+6)
   02b8: SLDC 08          Short load constant 8
   02b9: SLDC 00          Short load constant 0
   02ba: LDP              Load packed field (TOS)
   02bb: CLP  06          Call local procedure INITIALI.INITUNITABLE
   02bd: SLDC 08          Short load constant 8
   02be: LDL  01dd        Load local word MP477
   02c1: INC  0004        Inc field ptr (TOS+4)
   02c3: SLDC 08          Short load constant 8
   02c4: SLDC 00          Short load constant 0
   02c5: LDP              Load packed field (TOS)
   02c6: CLP  06          Call local procedure INITIALI.INITUNITABLE
   02c8: SLDC 09          Short load constant 9
   02c9: LDL  01dd        Load local word MP477
   02cc: INC  0007        Inc field ptr (TOS+7)
   02ce: SLDC 08          Short load constant 8
   02cf: SLDC 08          Short load constant 8
   02d0: LDP              Load packed field (TOS)
   02d1: CLP  06          Call local procedure INITIALI.INITUNITABLE
   02d3: SLDC 0a          Short load constant 10
   02d4: LDL  01dd        Load local word MP477
   02d7: INC  0007        Inc field ptr (TOS+7)
   02d9: SLDC 08          Short load constant 8
   02da: SLDC 00          Short load constant 0
   02db: LDP              Load packed field (TOS)
   02dc: CLP  06          Call local procedure INITIALI.INITUNITABLE
   02de: SLDC 0d          Short load constant 13
   02df: LDL  01dd        Load local word MP477
   02e2: IND  0009        Static index and load word (TOS+9)
   02e4: CLP  06          Call local procedure INITIALI.INITUNITABLE
   02e6: SLDC 0c          Short load constant 12
   02e7: LDL  01dd        Load local word MP477
   02ea: INC  0008        Inc field ptr (TOS+8)
   02ec: SLDC 08          Short load constant 8
   02ed: SLDC 08          Short load constant 8
   02ee: LDP              Load packed field (TOS)
   02ef: CLP  06          Call local procedure INITIALI.INITUNITABLE
   02f1: LDL  01dc        Load local word MP476
   02f4: INC  001f        Inc field ptr (TOS+31)
   02f6: STL  01dd        Store TOS into MP477
   02f9: SLDC 00          Short load constant 0
   02fa: LDL  01dd        Load local word MP477
   02fd: INC  0002        Inc field ptr (TOS+2)
   02ff: SLDC 08          Short load constant 8
   0300: SLDC 08          Short load constant 8
   0301: LDP              Load packed field (TOS)
   0302: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0304: SLDC 01          Short load constant 1
   0305: LDL  01dd        Load local word MP477
   0308: INC  0002        Inc field ptr (TOS+2)
   030a: SLDC 08          Short load constant 8
   030b: SLDC 00          Short load constant 0
   030c: LDP              Load packed field (TOS)
   030d: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   030f: SLDC 02          Short load constant 2
   0310: LDL  01dd        Load local word MP477
   0313: INC  0001        Inc field ptr (TOS+1)
   0315: SLDC 08          Short load constant 8
   0316: SLDC 08          Short load constant 8
   0317: LDP              Load packed field (TOS)
   0318: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   031a: SLDC 04          Short load constant 4
   031b: LDL  01dd        Load local word MP477
   031e: SLDC 08          Short load constant 8
   031f: SLDC 08          Short load constant 8
   0320: LDP              Load packed field (TOS)
   0321: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0323: SLDC 03          Short load constant 3
   0324: LDL  01dd        Load local word MP477
   0327: INC  0001        Inc field ptr (TOS+1)
   0329: SLDC 08          Short load constant 8
   032a: SLDC 00          Short load constant 0
   032b: LDP              Load packed field (TOS)
   032c: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   032e: SLDC 05          Short load constant 5
   032f: LDL  01dd        Load local word MP477
   0332: INC  0003        Inc field ptr (TOS+3)
   0334: SLDC 08          Short load constant 8
   0335: SLDC 00          Short load constant 0
   0336: LDP              Load packed field (TOS)
   0337: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0339: SLDC 06          Short load constant 6
   033a: LDL  01dd        Load local word MP477
   033d: INC  0004        Inc field ptr (TOS+4)
   033f: SLDC 08          Short load constant 8
   0340: SLDC 08          Short load constant 8
   0341: LDP              Load packed field (TOS)
   0342: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0344: SLDC 07          Short load constant 7
   0345: LDL  01dd        Load local word MP477
   0348: INC  0004        Inc field ptr (TOS+4)
   034a: SLDC 08          Short load constant 8
   034b: SLDC 00          Short load constant 0
   034c: LDP              Load packed field (TOS)
   034d: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   034f: LDA  02 010c     Load addr G268
   0353: LDA  02 010c     Load addr G268
   0357: LDM  10          Load 16 words from (TOS)
   0359: SLDC 10          Short load constant 16
   035a: LDL  01dd        Load local word MP477
   035d: SLDC 08          Short load constant 8
   035e: SLDC 00          Short load constant 0
   035f: LDP              Load packed field (TOS)
   0360: SGS              Build singleton set [TOS]
   0361: UNI              Set union (TOS OR TOS-1)
   0362: SLDC 0d          Short load constant 13
   0363: SGS              Build singleton set [TOS]
   0364: DIF              Set difference (TOS-1 AND NOT TOS)
   0365: ADJ  10          Adjust set to 16 words
   0367: STM  10          Store 16 words at TOS to TOS-1
-> 0369: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.SETPREFIXEDCRTCTL(PARAM1) (* P=4 LL=2 *)
  MP1=PARAM1
  MP2
BEGIN
-> 0104: LOD  03 0001     Load word at G1 (SYSCOM)
   0107: INC  001f        Inc field ptr (TOS+31)
   0109: STL  0002        Store TOS into MP2
   010b: SLDL 02          Short load local MP2
   010c: INC  0003        Inc field ptr (TOS+3)
   010e: SLDC 08          Short load constant 8
   010f: SLDC 08          Short load constant 8
   0110: LDP              Load packed field (TOS)
   0111: SLDC 0b          Short load constant 11
   0112: GRTI             Integer TOS-1 > TOS
   0113: FJP  $011c       Jump if TOS false
   0115: SLDL 02          Short load local MP2
   0116: INC  0003        Inc field ptr (TOS+3)
   0118: SLDC 08          Short load constant 8
   0119: SLDC 08          Short load constant 8
   011a: SLDC 0b          Short load constant 11
   011b: STP              Store packed field (TOS into TOS-1)
-> 011c: SLDL 01          Short load local MP1
   011d: SLDC 00          Short load constant 0
   011e: SLDL 02          Short load local MP2
   011f: INC  0003        Inc field ptr (TOS+3)
   0121: SLDC 08          Short load constant 8
   0122: SLDC 08          Short load constant 8
   0123: LDP              Load packed field (TOS)
   0124: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0125: SLDL 01          Short load local MP1
   0126: SLDC 01          Short load constant 1
   0127: SLDL 02          Short load local MP2
   0128: INC  0003        Inc field ptr (TOS+3)
   012a: SLDC 08          Short load constant 8
   012b: SLDC 08          Short load constant 8
   012c: LDP              Load packed field (TOS)
   012d: SLDC 00          Short load constant 0
   012e: CSP  0a          Call standard procedure FLCH
-> 0130: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.SETPREFIXEDCRTINFO(PARAM1; PARAM2) (* P=5 LL=2 *)
  MP1=PARAM2
  MP2=PARAM1
BEGIN
-> 013c: LOD  03 0001     Load word at G1 (SYSCOM)
   013f: INC  0024        Inc field ptr (TOS+36)
   0141: SLDL 02          Short load local MP2
   0142: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0145: LDP              Load packed field (TOS)
   0146: LNOT             Logical NOT (~TOS)
   0147: FJP  $015b       Jump if TOS false
   0149: LDA  03 010c     Load addr G268
   014d: LDA  03 010c     Load addr G268
   0151: LDM  10          Load 16 words from (TOS)
   0153: SLDC 10          Short load constant 16
   0154: SLDL 01          Short load local MP1
   0155: SGS              Build singleton set [TOS]
   0156: UNI              Set union (TOS OR TOS-1)
   0157: ADJ  10          Adjust set to 16 words
   0159: STM  10          Store 16 words at TOS to TOS-1
-> 015b: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.INITUNITABLE(PARAM1; PARAM2) (* P=6 LL=2 *)
  MP1=PARAM2
  MP2=PARAM1
BEGIN
-> 0168: LOD  03 0001     Load word at G1 (SYSCOM)
   016b: INC  002f        Inc field ptr (TOS+47)
   016d: SLDL 02          Short load local MP2
   016e: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0171: LDP              Load packed field (TOS)
   0172: LNOT             Logical NOT (~TOS)
   0173: FJP  $0187       Jump if TOS false
   0175: LDA  03 010c     Load addr G268
   0179: LDA  03 010c     Load addr G268
   017d: LDM  10          Load 16 words from (TOS)
   017f: SLDC 10          Short load constant 16
   0180: SLDL 01          Short load local MP1
   0181: SGS              Build singleton set [TOS]
   0182: UNI              Set union (TOS OR TOS-1)
   0183: ADJ  10          Adjust set to 16 words
   0185: STM  10          Store 16 words at TOS to TOS-1
-> 0187: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC7 (* P=7 LL=1 *)
  BASE1
  BASE2
  BASE55
  MP1
  MP2
  MP3
  MP8
  MP293
  MP294
  MP354
  MP355
  MP356
  MP357
  MP358
BEGIN
-> 039a: LDA  02 00cc     Load addr G204
   039e: SLDC 00          Short load constant 0
   039f: IXA  000c        Index array (TOS-1 + TOS * 12)
   03a1: LSA  10          Load string address: ':SYSTEM.ASSMBLER'
   03b3: NOP              No operation
   03b4: SAS  17          String assign (TOS to TOS-1, 23 chars)
   03b6: LDA  02 00cc     Load addr G204
   03ba: SLDC 01          Short load constant 1
   03bb: IXA  000c        Index array (TOS-1 + TOS * 12)
   03bd: LSA  10          Load string address: ':SYSTEM.COMPILER'
   03cf: NOP              No operation
   03d0: SAS  17          String assign (TOS to TOS-1, 23 chars)
   03d2: LDA  02 00cc     Load addr G204
   03d6: SLDC 02          Short load constant 2
   03d7: IXA  000c        Index array (TOS-1 + TOS * 12)
   03d9: LSA  0e          Load string address: ':SYSTEM.EDITOR'
   03e9: NOP              No operation
   03ea: SAS  17          String assign (TOS to TOS-1, 23 chars)
   03ec: LDA  02 00cc     Load addr G204
   03f0: SLDC 03          Short load constant 3
   03f1: IXA  000c        Index array (TOS-1 + TOS * 12)
   03f3: LSA  0d          Load string address: ':SYSTEM.FILER'
   0402: NOP              No operation
   0403: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0405: LDA  02 00cc     Load addr G204
   0409: SLDC 04          Short load constant 4
   040a: IXA  000c        Index array (TOS-1 + TOS * 12)
   040c: NOP              No operation
   040d: LSA  0e          Load string address: ':SYSTEM.LINKER'
   041d: SAS  17          String assign (TOS to TOS-1, 23 chars)
   041f: LLA  0126        Load local address MP294
   0422: LDA  02 00cc     Load addr G204
   0426: MOV  003c        Move 60 words (TOS to TOS-1)
   0428: SLDC 1f          Short load constant 31
   0429: SLDC 01          Short load constant 1
   042a: ADJ  01          Adjust set to 1 words
   042c: STL  0162        Store TOS into MP354
   042f: LLA  0003        Load local address MP3
   0431: LDCN             Load constant NIL
   0432: SLDC 01          Short load constant 1
   0433: NGI              Negate integer
   0434: CXP  00 03       Call external procedure PASCALSY.FINIT
   0437: SLDC 00          Short load constant 0
   0438: STL  0001        Store TOS into MP1
   043a: SLDC 0c          Short load constant 12
   043b: STL  0163        Store TOS into MP355
-> 043e: SLDL 01          Short load local MP1
   043f: LDL  0163        Load local word MP355
   0442: LEQI             Integer TOS-1 <= TOS
   0443: FJP  $054c       Jump if TOS false
   0445: LDA  02 007e     Load addr G126
   0448: SLDL 01          Short load local MP1
   0449: IXA  0006        Index array (TOS-1 + TOS * 6)
   044b: STL  0164        Store TOS into MP356
   044e: LDL  0164        Load local word MP356
   0451: LSA  00          Load string address: ''
   0453: NOP              No operation
   0454: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0456: LDL  0164        Load local word MP356
   0459: INC  0004        Inc field ptr (TOS+4)
   045b: SLDL 01          Short load local MP1
   045c: LDCI 1e30        Load word 7728
   045f: SLDC 01          Short load constant 1
   0460: INN              Set membership (TOS-1 in set TOS)
   0461: STO              Store indirect (TOS into TOS-1)
   0462: LDL  0164        Load local word MP356
   0465: SIND 04          Short index load *TOS+4
   0466: FJP  $0545       Jump if TOS false
   0468: LDL  0164        Load local word MP356
   046b: INC  0005        Inc field ptr (TOS+5)
   046d: LDCI 7fff        Load word 32767
   0470: STO              Store indirect (TOS into TOS-1)
   0471: SLDL 01          Short load local MP1
   0472: CSP  26          Call standard procedure UNITCLEAR
   0474: CSP  22          Call standard procedure IORESULT
   0476: SLDC 00          Short load constant 0
   0477: EQUI             Integer TOS-1 = TOS
   0478: FJP  $0545       Jump if TOS false
   047a: SLDL 01          Short load local MP1
   047b: SLDC 00          Short load constant 0
   047c: SLDC 00          Short load constant 0
   047d: CXP  00 2a       Call external procedure PASCALSY.42
   0480: FJP  $0545       Jump if TOS false
   0482: LDL  0164        Load local word MP356
   0485: LOD  02 0001     Load word at G1 (SYSCOM)
   0488: SIND 04          Short index load *TOS+4
   0489: SLDC 00          Short load constant 0
   048a: IXA  000d        Index array (TOS-1 + TOS * 13)
   048c: INC  0003        Inc field ptr (TOS+3)
   048e: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0490: SLDL 01          Short load local MP1
   0491: LOD  02 0001     Load word at G1 (SYSCOM)
   0494: SIND 02          Short index load *TOS+2
   0495: EQUI             Integer TOS-1 = TOS
   0496: FJP  $04c8       Jump if TOS false
   0498: LDA  02 003f     Load addr G63
   049b: LDL  0164        Load local word MP356
   049e: SAS  07          String assign (TOS to TOS-1, 7 chars)
   04a0: LAO  0002        Load global BASE2
   04a2: NOP              No operation
   04a3: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   04b4: SAS  28          String assign (TOS to TOS-1, 40 chars)
   04b6: LLA  0003        Load local address MP3
   04b8: LAO  0002        Load global BASE2
   04ba: SLDC 01          Short load constant 1
   04bb: LDCN             Load constant NIL
   04bc: CXP  00 05       Call external procedure PASCALSY.FOPEN
   04bf: SLDL 08          Short load local MP8
   04c0: SRO  0037        Store global word BASE55
   04c2: LLA  0003        Load local address MP3
   04c4: SLDC 00          Short load constant 0
   04c5: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 04c8: SLDC 00          Short load constant 0
   04c9: STL  0125        Store TOS into MP293
   04cc: SLDC 04          Short load constant 4
   04cd: STL  0165        Store TOS into MP357
-> 04d0: LDL  0125        Load local word MP293
   04d3: LDL  0165        Load local word MP357
   04d6: LEQI             Integer TOS-1 <= TOS
   04d7: FJP  $0545       Jump if TOS false
   04d9: SLDL 01          Short load local MP1
   04da: LOD  02 0001     Load word at G1 (SYSCOM)
   04dd: SIND 02          Short index load *TOS+2
   04de: EQUI             Integer TOS-1 = TOS
   04df: LDL  0125        Load local word MP293
   04e2: LDL  0162        Load local word MP354
   04e5: SLDC 01          Short load constant 1
   04e6: INN              Set membership (TOS-1 in set TOS)
   04e7: LOR              Logical OR (TOS | TOS-1)
   04e8: FJP  $053b       Jump if TOS false
   04ea: LAO  0002        Load global BASE2
   04ec: SLDC 00          Short load constant 0
   04ed: STL  0166        Store TOS into MP358
   04f0: LLA  0166        Load local address MP358
   04f3: LDL  0164        Load local word MP356
   04f6: SLDC 07          Short load constant 7
   04f7: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   04fa: LLA  0166        Load local address MP358
   04fd: LLA  0126        Load local address MP294
   0500: LDL  0125        Load local word MP293
   0503: IXA  000c        Index array (TOS-1 + TOS * 12)
   0505: SLDC 1e          Short load constant 30
   0506: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0509: LLA  0166        Load local address MP358
   050c: SAS  28          String assign (TOS to TOS-1, 40 chars)
   050e: LLA  0003        Load local address MP3
   0510: LAO  0002        Load global BASE2
   0512: SLDC 01          Short load constant 1
   0513: LDCN             Load constant NIL
   0514: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0517: SLDL 08          Short load local MP8
   0518: FJP  $0535       Jump if TOS false
   051a: LDA  02 00cc     Load addr G204
   051e: LDL  0125        Load local word MP293
   0521: IXA  000c        Index array (TOS-1 + TOS * 12)
   0523: LAO  0002        Load global BASE2
   0525: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0527: LDL  0162        Load local word MP354
   052a: SLDC 01          Short load constant 1
   052b: LDL  0125        Load local word MP293
   052e: SGS              Build singleton set [TOS]
   052f: DIF              Set difference (TOS-1 AND NOT TOS)
   0530: ADJ  01          Adjust set to 1 words
   0532: STL  0162        Store TOS into MP354
-> 0535: LLA  0003        Load local address MP3
   0537: SLDC 00          Short load constant 0
   0538: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 053b: LDL  0125        Load local word MP293
   053e: SLDC 01          Short load constant 1
   053f: ADI              Add integers (TOS + TOS-1)
   0540: STL  0125        Store TOS into MP293
   0543: UJP  $04d0       Unconditional jump
-> 0545: SLDL 01          Short load local MP1
   0546: SLDC 01          Short load constant 1
   0547: ADI              Add integers (TOS + TOS-1)
   0548: STL  0001        Store TOS into MP1
   054a: UJP  $043e       Unconditional jump
-> 054c: SLDO 01          Short load global BASE1
   054d: FJP  $0557       Jump if TOS false
   054f: LDA  02 003b     Load addr G59
   0552: LDA  02 003f     Load addr G63
   0555: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0557: LDA  02 003f     Load addr G63
   055a: SLDC 00          Short load constant 0
   055b: LLA  0002        Load local address MP2
   055d: SLDC 00          Short load constant 0
   055e: SLDC 00          Short load constant 0
   055f: CXP  00 1e       Call external procedure PASCALSY.30
   0562: STL  0001        Store TOS into MP1
   0564: SLDL 02          Short load local MP2
   0565: LDCN             Load constant NIL
   0566: EQUI             Integer TOS-1 = TOS
   0567: FJP  $056b       Jump if TOS false
   0569: CSP  27          Call standard procedure HALT
-> 056b: LDA  02 0043     Load addr G67
   056e: SLDL 02          Short load local MP2
   056f: SLDC 00          Short load constant 0
   0570: IXA  000d        Index array (TOS-1 + TOS * 13)
   0572: INC  000a        Inc field ptr (TOS+10)
   0574: MOV  0001        Move 1 words (TOS to TOS-1)
   0576: SLDC 01          Short load constant 1
   0577: LSA  07          Load string address: 'CONSOLE'
   0580: NOP              No operation
   0581: CLP  08          Call local procedure INITIALI.8
   0583: SLDC 02          Short load constant 2
   0584: NOP              No operation
   0585: LSA  07          Load string address: 'SYSTERM'
   058e: CLP  08          Call local procedure INITIALI.8
   0590: SLDC 03          Short load constant 3
   0591: LSA  07          Load string address: 'GRAPHIC'
   059a: NOP              No operation
   059b: CLP  08          Call local procedure INITIALI.8
   059d: SLDC 06          Short load constant 6
   059e: NOP              No operation
   059f: LSA  07          Load string address: 'PRINTER'
   05a8: CLP  08          Call local procedure INITIALI.8
   05aa: SLDC 07          Short load constant 7
   05ab: LSA  05          Load string address: 'REMIN'
   05b2: NOP              No operation
   05b3: CLP  08          Call local procedure INITIALI.8
   05b5: SLDC 08          Short load constant 8
   05b6: NOP              No operation
   05b7: LSA  06          Load string address: 'REMOUT'
   05bf: CLP  08          Call local procedure INITIALI.8
-> 05c1: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC8(PARAM1; PARAM2) (* P=8 LL=2 *)
  MP1=PARAM2
  MP2=PARAM1
  MP3
BEGIN
-> 0376: LLA  0003        Load local address MP3
   0378: SLDL 01          Short load local MP1
   0379: SAS  07          String assign (TOS to TOS-1, 7 chars)
   037b: SLDL 02          Short load local MP2
   037c: CSP  26          Call standard procedure UNITCLEAR
   037e: CSP  22          Call standard procedure IORESULT
   0380: SLDC 00          Short load constant 0
   0381: EQUI             Integer TOS-1 = TOS
   0382: FJP  $038e       Jump if TOS false
   0384: LDA  03 007e     Load addr G126
   0387: SLDL 02          Short load local MP2
   0388: IXA  0006        Index array (TOS-1 + TOS * 6)
   038a: LLA  0003        Load local address MP3
   038c: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 038e: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC9 (* P=9 LL=1 *)
  BASE1
  BASE2
  BASE55
  MP1
  MP2
  MP3
  MP4
  MP1604
  MP2116
  MP2628
  MP2884
  MP2889
  MP2891
  MP2900
  MP2901
  MP4374
BEGIN
-> 05da: LLA  0b44        Load local address MP2884
   05dd: LDCN             Load constant NIL
   05de: SLDC 01          Short load constant 1
   05df: NGI              Negate integer
   05e0: CXP  00 03       Call external procedure PASCALSY.FINIT
   05e3: LAO  0002        Load global BASE2
   05e5: LSA  0f          Load string address: '*SYSTEM.CHARSET'
   05f6: NOP              No operation
   05f7: SAS  28          String assign (TOS to TOS-1, 40 chars)
   05f9: LLA  0b44        Load local address MP2884
   05fc: LAO  0002        Load global BASE2
   05fe: SLDC 01          Short load constant 1
   05ff: LDCN             Load constant NIL
   0600: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0603: LDL  0b49        Load local word MP2889
   0606: FJP  $06ed       Jump if TOS false
   0608: SLDC 03          Short load constant 3
   0609: CSP  26          Call standard procedure UNITCLEAR
   060b: CSP  22          Call standard procedure IORESULT
   060d: SLDC 00          Short load constant 0
   060e: EQUI             Integer TOS-1 = TOS
   060f: FJP  $06eb       Jump if TOS false
   0611: SLDC 03          Short load constant 3
   0612: LLA  0003        Load local address MP3
   0614: SLDC 00          Short load constant 0
   0615: LDCI 0080        Load word 128
   0618: SLDC 00          Short load constant 0
   0619: SLDC 00          Short load constant 0
   061a: CSP  06          Call standard procedure UNITWRITE
   061c: LDL  0b55        Load local word MP2901
   061f: LDL  0b54        Load local word MP2900
   0622: SBI              Subtract integers (TOS-1 - TOS)
   0623: SLDC 04          Short load constant 4
   0624: GRTI             Integer TOS-1 > TOS
   0625: STL  0002        Store TOS into MP2
   0627: LDL  0b4b        Load local word MP2891
   062a: LLA  0644        Load local address MP1604
   062d: SLDC 00          Short load constant 0
   062e: LDCI 0a00        Load word 2560
   0631: LDL  0b54        Load local word MP2900
   0634: SLDC 00          Short load constant 0
   0635: CSP  05          Call standard procedure UNITREAD
   0637: LDCI 0200        Load word 512
   063a: LDCI 2000        Load word 8192
   063d: SBI              Subtract integers (TOS-1 - TOS)
   063e: STL  0003        Store TOS into MP3
   0640: SLDC 20          Short load constant 32
   0641: STL  0001        Store TOS into MP1
   0643: SLDC 7f          Short load constant 127
   0644: STL  1116        Store TOS into MP4374
-> 0647: SLDL 01          Short load local MP1
   0648: LDL  1116        Load local word MP4374
   064b: LEQI             Integer TOS-1 <= TOS
   064c: FJP  $0668       Jump if TOS false
   064e: LLA  0644        Load local address MP1604
   0651: SLDL 01          Short load local MP1
   0652: SLDC 20          Short load constant 32
   0653: SBI              Subtract integers (TOS-1 - TOS)
   0654: IXA  0005        Index array (TOS-1 + TOS * 5)
   0656: SLDC 00          Short load constant 0
   0657: SLDL 03          Short load local MP3
   0658: SLDC 00          Short load constant 0
   0659: SLDC 0a          Short load constant 10
   065a: CSP  03          Call standard procedure MOVR
   065c: SLDL 03          Short load local MP3
   065d: SLDC 10          Short load constant 16
   065e: ADI              Add integers (TOS + TOS-1)
   065f: STL  0003        Store TOS into MP3
   0661: SLDL 01          Short load local MP1
   0662: SLDC 01          Short load constant 1
   0663: ADI              Add integers (TOS + TOS-1)
   0664: STL  0001        Store TOS into MP1
   0666: UJP  $0647       Unconditional jump
-> 0668: LDCI 0200        Load word 512
   066b: LDCI 1800        Load word 6144
   066e: SBI              Subtract integers (TOS-1 - TOS)
   066f: STL  0003        Store TOS into MP3
   0671: SLDC 20          Short load constant 32
   0672: STL  0001        Store TOS into MP1
   0674: SLDC 7f          Short load constant 127
   0675: STL  1116        Store TOS into MP4374
-> 0678: SLDL 01          Short load local MP1
   0679: LDL  1116        Load local word MP4374
   067c: LEQI             Integer TOS-1 <= TOS
   067d: FJP  $0699       Jump if TOS false
   067f: LLA  0844        Load local address MP2116
   0682: SLDL 01          Short load local MP1
   0683: SLDC 20          Short load constant 32
   0684: SBI              Subtract integers (TOS-1 - TOS)
   0685: IXA  0005        Index array (TOS-1 + TOS * 5)
   0687: SLDC 00          Short load constant 0
   0688: SLDL 03          Short load local MP3
   0689: SLDC 00          Short load constant 0
   068a: SLDC 0a          Short load constant 10
   068b: CSP  03          Call standard procedure MOVR
   068d: SLDL 03          Short load local MP3
   068e: SLDC 10          Short load constant 16
   068f: ADI              Add integers (TOS + TOS-1)
   0690: STL  0003        Store TOS into MP3
   0692: SLDL 01          Short load local MP1
   0693: SLDC 01          Short load constant 1
   0694: ADI              Add integers (TOS + TOS-1)
   0695: STL  0001        Store TOS into MP1
   0697: UJP  $0678       Unconditional jump
-> 0699: SLDO 01          Short load global BASE1
   069a: SLDL 02          Short load local MP2
   069b: LAND             Logical AND (TOS & TOS-1)
   069c: LDO  0037        Load global word BASE55
   069e: LNOT             Logical NOT (~TOS)
   069f: LAND             Logical AND (TOS & TOS-1)
   06a0: FJP  $06e2       Jump if TOS false
   06a2: LLA  0004        Load local address MP4
   06a4: SLDC 00          Short load constant 0
   06a5: LDCI 0c80        Load word 3200
   06a8: SLDC 00          Short load constant 0
   06a9: CSP  0a          Call standard procedure FLCH
   06ab: SLDC 00          Short load constant 0
   06ac: STL  0001        Store TOS into MP1
   06ae: SLDC 3f          Short load constant 63
   06af: STL  1116        Store TOS into MP4374
-> 06b2: SLDL 01          Short load local MP1
   06b3: LDL  1116        Load local word MP4374
   06b6: LEQI             Integer TOS-1 <= TOS
   06b7: FJP  $06d3       Jump if TOS false
   06b9: LLA  0a44        Load local address MP2628
   06bc: SLDL 01          Short load local MP1
   06bd: IXA  0004        Index array (TOS-1 + TOS * 4)
   06bf: SLDC 00          Short load constant 0
   06c0: LLA  0004        Load local address MP4
   06c2: SLDL 01          Short load local MP1
   06c3: IXA  0014        Index array (TOS-1 + TOS * 20)
   06c5: SLDC 0a          Short load constant 10
   06c6: IXA  0001        Index array (TOS-1 + TOS * 1)
   06c8: SLDC 00          Short load constant 0
   06c9: SLDC 08          Short load constant 8
   06ca: CSP  02          Call standard procedure MOVL
   06cc: SLDL 01          Short load local MP1
   06cd: SLDC 01          Short load constant 1
   06ce: ADI              Add integers (TOS + TOS-1)
   06cf: STL  0001        Store TOS into MP1
   06d1: UJP  $06b2       Unconditional jump
-> 06d3: SLDC 03          Short load constant 3
   06d4: LLA  0004        Load local address MP4
   06d6: SLDC 50          Short load constant 80
   06d7: NGI              Negate integer
   06d8: IXA  0014        Index array (TOS-1 + TOS * 20)
   06da: SLDC 00          Short load constant 0
   06db: SLDC 17          Short load constant 23
   06dc: SLDC 00          Short load constant 0
   06dd: SLDC 00          Short load constant 0
   06de: CSP  06          Call standard procedure UNITWRITE
   06e0: UJP  $06eb       Unconditional jump
-> 06e2: SLDC 03          Short load constant 3
   06e3: LLA  0004        Load local address MP4
   06e5: SLDC 00          Short load constant 0
   06e6: SLDC 07          Short load constant 7
   06e7: SLDC 00          Short load constant 0
   06e8: SLDC 00          Short load constant 0
   06e9: CSP  06          Call standard procedure UNITWRITE
-> 06eb: UJP  $06f6       Unconditional jump
-> 06ed: LOD  02 0001     Load word at G1 (SYSCOM)
   06f0: INC  001d        Inc field ptr (TOS+29)
   06f2: SLDC 01          Short load constant 1
   06f3: SLDC 01          Short load constant 1
   06f4: SLDC 00          Short load constant 0
   06f5: STP              Store packed field (TOS into TOS-1)
-> 06f6: LLA  0b44        Load local address MP2884
   06f9: SLDC 00          Short load constant 0
   06fa: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 06fd: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC10 (* P=10 LL=1 *)
  MP1
BEGIN
-> 0714: LOD  02 0001     Load word at G1 (SYSCOM)
   0717: INC  0004        Inc field ptr (TOS+4)
   0719: LDCN             Load constant NIL
   071a: STO              Store indirect (TOS into TOS-1)
   071b: LDA  02 0037     Load addr G55
   071e: SLDC 1e          Short load constant 30
   071f: CSP  01          Call standard procedure NEW
   0721: LOD  02 0037     Load word at G55
   0724: LDCN             Load constant NIL
   0725: SLDC 01          Short load constant 1
   0726: NGI              Negate integer
   0727: CXP  00 03       Call external procedure PASCALSY.FINIT
   072a: LDA  02 003a     Load addr G58
   072d: SLDC 1e          Short load constant 30
   072e: CSP  01          Call standard procedure NEW
   0730: LLA  0001        Load local address MP1
   0732: SLDC 01          Short load constant 1
   0733: CSP  01          Call standard procedure NEW
   0735: LOD  02 003a     Load word at G58
   0738: SLDL 01          Short load local MP1
   0739: SLDC 00          Short load constant 0
   073a: CXP  00 03       Call external procedure PASCALSY.FINIT
   073d: LDA  02 0039     Load addr G57
   0740: SLDC 1e          Short load constant 30
   0741: CSP  01          Call standard procedure NEW
   0743: LLA  0001        Load local address MP1
   0745: SLDC 01          Short load constant 1
   0746: CSP  01          Call standard procedure NEW
   0748: LOD  02 0039     Load word at G57
   074b: SLDL 01          Short load local MP1
   074c: SLDC 00          Short load constant 0
   074d: CXP  00 03       Call external procedure PASCALSY.FINIT
   0750: LDA  02 0038     Load addr G56
   0753: SLDC 1e          Short load constant 30
   0754: CSP  01          Call standard procedure NEW
   0756: LLA  0001        Load local address MP1
   0758: SLDC 01          Short load constant 1
   0759: CSP  01          Call standard procedure NEW
   075b: LOD  02 0038     Load word at G56
   075e: SLDL 01          Short load local MP1
   075f: SLDC 00          Short load constant 0
   0760: CXP  00 03       Call external procedure PASCALSY.FINIT
   0763: LDA  02 0002     Load addr G2 (INPUT)
   0766: SLDC 00          Short load constant 0
   0767: IXA  0001        Index array (TOS-1 + TOS * 1)
   0769: LOD  02 003a     Load word at G58
   076c: STO              Store indirect (TOS into TOS-1)
   076d: LDA  02 0002     Load addr G2 (INPUT)
   0770: SLDC 01          Short load constant 1
   0771: IXA  0001        Index array (TOS-1 + TOS * 1)
   0773: LOD  02 0039     Load word at G57
   0776: STO              Store indirect (TOS into TOS-1)
   0777: LDA  02 0009     Load addr G9
   077a: SLDC 1e          Short load constant 30
   077b: CSP  01          Call standard procedure NEW
   077d: LOD  02 0009     Load word at G9
   0780: LDCN             Load constant NIL
   0781: SLDC 01          Short load constant 1
   0782: NGI              Negate integer
   0783: CXP  00 03       Call external procedure PASCALSY.FINIT
   0786: LDA  02 0008     Load addr G8
   0789: SLDC 1e          Short load constant 30
   078a: CSP  01          Call standard procedure NEW
   078c: LOD  02 0008     Load word at G8
   078f: LDCN             Load constant NIL
   0790: SLDC 01          Short load constant 1
   0791: NGI              Negate integer
   0792: CXP  00 03       Call external procedure PASCALSY.FINIT
   0795: LDA  02 0036     Load addr G54
   0798: CSP  20          Call standard procedure MARK
-> 079a: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC11 (* P=11 LL=1 *)
  BASE1
BEGIN
-> 080e: SLDC 00          Short load constant 0
   080f: STR  02 000a     Store TOS to G10
   0812: SLDC 00          Short load constant 0
   0813: STR  02 000b     Store TOS to G11
   0816: SLDC 00          Short load constant 0
   0817: STR  02 000c     Store TOS to G12
   081a: SLDO 01          Short load global BASE1
   081b: FJP  $084d       Jump if TOS false
   081d: LDA  02 0026     Load addr G38
   0820: NOP              No operation
   0821: LSA  00          Load string address: ''
   0823: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0825: LDA  02 001e     Load addr G30
   0828: NOP              No operation
   0829: LSA  00          Load string address: ''
   082b: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   082d: LDA  02 002e     Load addr G46
   0830: NOP              No operation
   0831: LSA  00          Load string address: ''
   0833: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0835: LDA  02 0016     Load addr G22
   0838: LDA  02 003f     Load addr G63
   083b: SAS  07          String assign (TOS to TOS-1, 7 chars)
   083d: LDA  02 0012     Load addr G18
   0840: LDA  02 003f     Load addr G63
   0843: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0845: LDA  02 001a     Load addr G26
   0848: LDA  02 003f     Load addr G63
   084b: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 084d: LOD  02 0009     Load word at G9
   0850: NOP              No operation
   0851: LSA  10          Load string address: '*SYSTEM.WRK.TEXT'
   0863: LDA  02 0016     Load addr G22
   0866: LDA  02 0026     Load addr G38
   0869: LDA  02 0011     Load addr G17
   086c: CLP  0c          Call local procedure INITIALI.12
   086e: LOD  02 0008     Load word at G8
   0871: LSA  10          Load string address: '*SYSTEM.WRK.CODE'
   0883: NOP              No operation
   0884: LDA  02 0012     Load addr G18
   0887: LDA  02 001e     Load addr G30
   088a: LDA  02 0010     Load addr G16
   088d: CLP  0c          Call local procedure INITIALI.12
   088f: LOD  02 0001     Load word at G1 (SYSCOM)
   0892: INC  002c        Inc field ptr (TOS+44)
   0894: SLDC 08          Short load constant 8
   0895: SLDC 08          Short load constant 8
   0896: LDP              Load packed field (TOS)
   0897: STR  02 000f     Store TOS to G15
   089a: LOD  02 0001     Load word at G1 (SYSCOM)
   089d: INC  001d        Inc field ptr (TOS+29)
   089f: SLDC 01          Short load constant 1
   08a0: SLDC 04          Short load constant 4
   08a1: LDP              Load packed field (TOS)
   08a2: STR  02 000e     Store TOS to G14
   08a5: LOD  02 0001     Load word at G1 (SYSCOM)
   08a8: INC  001d        Inc field ptr (TOS+29)
   08aa: SLDC 01          Short load constant 1
   08ab: SLDC 05          Short load constant 5
   08ac: LDP              Load packed field (TOS)
   08ad: STR  02 000d     Store TOS to G13
-> 08b0: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC12(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5) (* P=12 LL=2 *)
  MP1=PARAM5
  MP2=PARAM4
  MP3=PARAM3
  MP4=PARAM2
  MP5=PARAM1
  MP6
  MP18
  MP30
BEGIN
-> 07a6: LLA  0006        Load local address MP6
   07a8: SLDL 04          Short load local MP4
   07a9: SAS  17          String assign (TOS to TOS-1, 23 chars)
   07ab: SLDL 05          Short load local MP5
   07ac: LLA  0006        Load local address MP6
   07ae: SLDC 01          Short load constant 1
   07af: LDCN             Load constant NIL
   07b0: CXP  00 05       Call external procedure PASCALSY.FOPEN
   07b3: SLDL 05          Short load local MP5
   07b4: SIND 05          Short index load *TOS+5
   07b5: LNOT             Logical NOT (~TOS)
   07b6: FJP  $07e9       Jump if TOS false
   07b8: SLDL 02          Short load local MP2
   07b9: LSA  00          Load string address: ''
   07bb: NOP              No operation
   07bc: NEQSTR           String TOS-1 <> TOS
   07be: FJP  $07e9       Jump if TOS false
   07c0: LLA  0012        Load local address MP18
   07c2: SLDC 00          Short load constant 0
   07c3: STL  001e        Store TOS into MP30
   07c5: LLA  001e        Load local address MP30
   07c7: SLDL 03          Short load local MP3
   07c8: SLDC 07          Short load constant 7
   07c9: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   07cc: LLA  001e        Load local address MP30
   07ce: NOP              No operation
   07cf: LSA  01          Load string address: ':'
   07d2: SLDC 08          Short load constant 8
   07d3: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   07d6: LLA  001e        Load local address MP30
   07d8: SLDL 02          Short load local MP2
   07d9: SLDC 17          Short load constant 23
   07da: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   07dd: LLA  001e        Load local address MP30
   07df: SAS  17          String assign (TOS to TOS-1, 23 chars)
   07e1: SLDL 05          Short load local MP5
   07e2: LLA  0012        Load local address MP18
   07e4: SLDC 01          Short load constant 1
   07e5: LDCN             Load constant NIL
   07e6: CXP  00 05       Call external procedure PASCALSY.FOPEN
-> 07e9: SLDL 01          Short load local MP1
   07ea: SLDL 05          Short load local MP5
   07eb: SIND 05          Short index load *TOS+5
   07ec: STO              Store indirect (TOS into TOS-1)
   07ed: SLDL 01          Short load local MP1
   07ee: SIND 00          Short index load *TOS+0
   07ef: FJP  $07fd       Jump if TOS false
   07f1: SLDL 03          Short load local MP3
   07f2: SLDL 05          Short load local MP5
   07f3: INC  0008        Inc field ptr (TOS+8)
   07f5: SAS  07          String assign (TOS to TOS-1, 7 chars)
   07f7: SLDL 02          Short load local MP2
   07f8: SLDL 05          Short load local MP5
   07f9: INC  0013        Inc field ptr (TOS+19)
   07fb: SAS  0f          String assign (TOS to TOS-1, 15 chars)
-> 07fd: SLDL 05          Short load local MP5
   07fe: SLDC 00          Short load constant 0
   07ff: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 0802: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC13 (* P=13 LL=1 *)
  BASE1
  BASE2
BEGIN
-> 08bc: LOD  02 0037     Load word at G55
   08bf: SLDC 00          Short load constant 0
   08c0: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   08c3: LOD  02 0009     Load word at G9
   08c6: SLDC 00          Short load constant 0
   08c7: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   08ca: LOD  02 0008     Load word at G8
   08cd: SLDC 00          Short load constant 0
   08ce: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   08d1: LOD  02 003a     Load word at G58
   08d4: SLDC 00          Short load constant 0
   08d5: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   08d8: LOD  02 0039     Load word at G57
   08db: SLDC 00          Short load constant 0
   08dc: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   08df: LAO  0002        Load global BASE2
   08e1: LSA  08          Load string address: 'CONSOLE:'
   08eb: NOP              No operation
   08ec: SAS  28          String assign (TOS to TOS-1, 40 chars)
   08ee: LOD  02 003a     Load word at G58
   08f1: LAO  0002        Load global BASE2
   08f3: SLDC 01          Short load constant 1
   08f4: LDCN             Load constant NIL
   08f5: CXP  00 05       Call external procedure PASCALSY.FOPEN
   08f8: LOD  02 0039     Load word at G57
   08fb: LAO  0002        Load global BASE2
   08fd: SLDC 01          Short load constant 1
   08fe: LDCN             Load constant NIL
   08ff: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0902: SLDO 01          Short load global BASE1
   0903: FJP  $091e       Jump if TOS false
   0905: LAO  0002        Load global BASE2
   0907: LSA  08          Load string address: 'SYSTERM:'
   0911: NOP              No operation
   0912: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0914: LOD  02 0038     Load word at G56
   0917: LAO  0002        Load global BASE2
   0919: SLDC 01          Short load constant 1
   091a: LDCN             Load constant NIL
   091b: CXP  00 05       Call external procedure PASCALSY.FOPEN
-> 091e: LDA  02 0002     Load addr G2 (INPUT)
   0921: SLDC 00          Short load constant 0
   0922: IXA  0001        Index array (TOS-1 + TOS * 1)
   0924: LOD  02 003a     Load word at G58
   0927: STO              Store indirect (TOS into TOS-1)
   0928: LDA  02 0002     Load addr G2 (INPUT)
   092b: SLDC 01          Short load constant 1
   092c: IXA  0001        Index array (TOS-1 + TOS * 1)
   092e: LOD  02 0039     Load word at G57
   0931: STO              Store indirect (TOS into TOS-1)
   0932: LDA  02 0002     Load addr G2 (INPUT)
   0935: SLDC 02          Short load constant 2
   0936: IXA  0001        Index array (TOS-1 + TOS * 1)
   0938: LOD  02 0038     Load word at G56
   093b: STO              Store indirect (TOS into TOS-1)
   093c: LDA  02 0002     Load addr G2 (INPUT)
   093f: SLDC 03          Short load constant 3
   0940: IXA  0001        Index array (TOS-1 + TOS * 1)
   0942: LDCN             Load constant NIL
   0943: STO              Store indirect (TOS into TOS-1)
   0944: LDA  02 0002     Load addr G2 (INPUT)
   0947: SLDC 04          Short load constant 4
   0948: IXA  0001        Index array (TOS-1 + TOS * 1)
   094a: LDCN             Load constant NIL
   094b: STO              Store indirect (TOS into TOS-1)
   094c: LDA  02 0002     Load addr G2 (INPUT)
   094f: SLDC 05          Short load constant 5
   0950: IXA  0001        Index array (TOS-1 + TOS * 1)
   0952: LDCN             Load constant NIL
   0953: STO              Store indirect (TOS into TOS-1)
-> 0954: RNP  00          Return from nonbase procedure
END

## Segment GETCMD (5)

### FUNCTION GETCMD.GETCMD(PARAM1): RETVAL (* P=1 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 09da: LOD  01 003a     Load word at G58
   09dd: INC  0002        Inc field ptr (TOS+2)
   09df: SLDC 00          Short load constant 0
   09e0: STO              Store indirect (TOS into TOS-1)
   09e1: LOD  01 0039     Load word at G57
   09e4: INC  0002        Inc field ptr (TOS+2)
   09e6: SLDC 00          Short load constant 0
   09e7: STO              Store indirect (TOS into TOS-1)
   09e8: LOD  01 0038     Load word at G56
   09eb: INC  0002        Inc field ptr (TOS+2)
   09ed: SLDC 00          Short load constant 0
   09ee: STO              Store indirect (TOS into TOS-1)
   09ef: LDA  01 0002     Load addr G2 (INPUT)
   09f2: SLDC 00          Short load constant 0
   09f3: IXA  0001        Index array (TOS-1 + TOS * 1)
   09f5: LOD  01 003a     Load word at G58
   09f8: STO              Store indirect (TOS into TOS-1)
   09f9: LDA  01 0002     Load addr G2 (INPUT)
   09fc: SLDC 01          Short load constant 1
   09fd: IXA  0001        Index array (TOS-1 + TOS * 1)
   09ff: LOD  01 0039     Load word at G57
   0a02: STO              Store indirect (TOS into TOS-1)
   0a03: SLDO 03          Short load global BASE3
   0a04: SLDC 00          Short load constant 0
   0a05: EQUI             Integer TOS-1 = TOS
   0a06: FJP  $0a2f       Jump if TOS false
   0a08: NOP              No operation
   0a09: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   0a1a: SLDC 00          Short load constant 0
   0a1b: SLDC 00          Short load constant 0
   0a1c: SLDC 00          Short load constant 0
   0a1d: LAO  0006        Load global BASE6
   0a1f: SLDC 00          Short load constant 0
   0a20: SLDC 00          Short load constant 0
   0a21: CLP  08          Call local procedure GETCMD.8
   0a23: FJP  $0a2f       Jump if TOS false
   0a25: CXP  00 25       Call external procedure PASCALSY.37
   0a28: SLDC 04          Short load constant 4
   0a29: SRO  0001        Store global word BASE1
   0a2b: SLDC 05          Short load constant 5
   0a2c: SLDC 01          Short load constant 1
   0a2d: CSP  04          Call standard procedure EXIT
-> 0a2f: SLDO 03          Short load global BASE3
   0a30: LDCI 00e0        Load word 224
   0a33: SLDC 01          Short load constant 1
   0a34: INN              Set membership (TOS-1 in set TOS)
   0a35: FJP  $0a39       Jump if TOS false
   0a37: CLP  0a          Call local procedure GETCMD.10
-> 0a39: SLDO 03          Short load global BASE3
   0a3a: LDCI 0300        Load word 768
   0a3d: SLDC 01          Short load constant 1
   0a3e: INN              Set membership (TOS-1 in set TOS)
   0a3f: FJP  $0a47       Jump if TOS false
   0a41: SLDC 00          Short load constant 0
   0a42: SLDO 03          Short load global BASE3
   0a43: SLDC 08          Short load constant 8
   0a44: EQUI             Integer TOS-1 = TOS
   0a45: CLP  02          Call local procedure GETCMD.2
-> 0a47: LOD  01 0001     Load word at G1 (SYSCOM)
   0a4a: INC  001d        Inc field ptr (TOS+29)
   0a4c: SLDC 02          Short load constant 2
   0a4d: SLDC 07          Short load constant 7
   0a4e: LDP              Load packed field (TOS)
   0a4f: SLDC 01          Short load constant 1
   0a50: EQUI             Integer TOS-1 = TOS
   0a51: FJP  $0a6c       Jump if TOS false
   0a53: SLDO 03          Short load global BASE3
   0a54: SLDC 00          Short load constant 0
   0a55: EQUI             Integer TOS-1 = TOS
   0a56: FJP  $0a61       Jump if TOS false
   0a58: SLDC 06          Short load constant 6
   0a59: SRO  0003        Store global word BASE3
   0a5b: SLDC 01          Short load constant 1
   0a5c: SLDC 01          Short load constant 1
   0a5d: CLP  02          Call local procedure GETCMD.2
   0a5f: UJP  $0a6c       Unconditional jump
-> 0a61: LDCN             Load constant NIL
   0a62: STR  01 0036     Store TOS to G54
   0a65: SLDC 00          Short load constant 0
   0a66: SRO  0001        Store global word BASE1
   0a68: SLDC 05          Short load constant 5
   0a69: SLDC 01          Short load constant 1
   0a6a: CSP  04          Call standard procedure EXIT
-> 0a6c: SLDC 00          Short load constant 0
   0a6d: STR  01 000a     Store TOS to G10
   0a70: SLDC 00          Short load constant 0
   0a71: STR  01 000b     Store TOS to G11
   0a74: SLDC 00          Short load constant 0
   0a75: STR  01 000c     Store TOS to G12
   0a78: SLDC 00          Short load constant 0
   0a79: SRO  0005        Store global word BASE5
-> 0a7b: LDA  01 0046     Load addr G70
   0a7e: NOP              No operation
   0a7f: LSA  4d          Load string address: 'Command: E(dit, R(un, F(ile, C(omp, L(ink, X(ecute, A(ssem, D(ebug,? [II.1] '
   0ace: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0ad0: CXP  00 27       Call external procedure PASCALSY.39
   0ad3: SLDO 05          Short load global BASE5
   0ad4: SLDC 00          Short load constant 0
   0ad5: SLDC 00          Short load constant 0
   0ad6: CXP  00 29       Call external procedure PASCALSY.41
   0ad9: SRO  0004        Store global word BASE4
   0adb: CXP  00 25       Call external procedure PASCALSY.37
   0ade: SLDO 04          Short load global BASE4
   0adf: SLDC 3f          Short load constant 63
   0ae0: EQUI             Integer TOS-1 = TOS
   0ae1: FJP  $0b23       Jump if TOS false
   0ae3: LDA  01 0046     Load addr G70
   0ae6: NOP              No operation
   0ae7: LSA  2a          Load string address: 'Command: U(ser restart, I(nitialize, H(alt'
   0b13: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0b15: CXP  00 27       Call external procedure PASCALSY.39
   0b18: SLDO 05          Short load global BASE5
   0b19: SLDC 00          Short load constant 0
   0b1a: SLDC 00          Short load constant 0
   0b1b: CXP  00 29       Call external procedure PASCALSY.41
   0b1e: SRO  0004        Store global word BASE4
   0b20: CXP  00 25       Call external procedure PASCALSY.37
-> 0b23: SLDO 04          Short load global BASE4
   0b26: LDC  06          Load multiple-word constant
                         0124137a8000000000000000
   0b32: SLDC 06          Short load constant 6
   0b33: INN              Set membership (TOS-1 in set TOS)
   0b34: LNOT             Logical NOT (~TOS)
   0b35: SRO  0005        Store global word BASE5
   0b37: SLDO 05          Short load global BASE5
   0b38: LNOT             Logical NOT (~TOS)
   0b39: FJP  $0c3e       Jump if TOS false
   0b3b: SLDO 04          Short load global BASE4
   0b3c: UJP  $0c06       Unconditional jump
   0b3e: LOD  01 0003     Load word at G3 (OUTPUT)
   0b41: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b44: SLDC 02          Short load constant 2
   0b45: SLDC 00          Short load constant 0
   0b46: SLDC 00          Short load constant 0
   0b47: CLP  03          Call local procedure GETCMD.3
   0b49: FJP  $0b52       Jump if TOS false
   0b4b: SLDC 04          Short load constant 4
   0b4c: SRO  0001        Store global word BASE1
   0b4e: SLDC 05          Short load constant 5
   0b4f: SLDC 01          Short load constant 1
   0b50: CSP  04          Call standard procedure EXIT
-> 0b52: UJP  $0c3e       Unconditional jump
   0b54: LOD  01 0003     Load word at G3 (OUTPUT)
   0b57: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b5a: SLDC 03          Short load constant 3
   0b5b: SLDC 00          Short load constant 0
   0b5c: SLDC 00          Short load constant 0
   0b5d: CLP  03          Call local procedure GETCMD.3
   0b5f: FJP  $0b68       Jump if TOS false
   0b61: SLDC 04          Short load constant 4
   0b62: SRO  0001        Store global word BASE1
   0b64: SLDC 05          Short load constant 5
   0b65: SLDC 01          Short load constant 1
   0b66: CSP  04          Call standard procedure EXIT
-> 0b68: UJP  $0c3e       Unconditional jump
   0b6a: LOD  01 0003     Load word at G3 (OUTPUT)
   0b6d: LSA  0a          Load string address: 'Linking...'
   0b79: NOP              No operation
   0b7a: SLDC 00          Short load constant 0
   0b7b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b7e: LOD  01 0003     Load word at G3 (OUTPUT)
   0b81: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b84: SLDC 04          Short load constant 4
   0b85: SLDC 00          Short load constant 0
   0b86: SLDC 00          Short load constant 0
   0b87: CLP  03          Call local procedure GETCMD.3
   0b89: FJP  $0b92       Jump if TOS false
   0b8b: SLDC 04          Short load constant 4
   0b8c: SRO  0001        Store global word BASE1
   0b8e: SLDC 05          Short load constant 5
   0b8f: SLDC 01          Short load constant 1
   0b90: CSP  04          Call standard procedure EXIT
-> 0b92: UJP  $0c3e       Unconditional jump
   0b94: CLP  0b          Call local procedure GETCMD.11
   0b96: UJP  $0c3e       Unconditional jump
   0b98: SLDC 05          Short load constant 5
   0b99: CLP  09          Call local procedure GETCMD.9
   0b9b: UJP  $0c3e       Unconditional jump
   0b9d: SLDC 08          Short load constant 8
   0b9e: CLP  09          Call local procedure GETCMD.9
   0ba0: UJP  $0c3e       Unconditional jump
   0ba2: SLDO 03          Short load global BASE3
   0ba3: SLDC 02          Short load constant 2
   0ba4: NEQI             Integer TOS-1 <> TOS
   0ba5: FJP  $0bcd       Jump if TOS false
   0ba7: LOD  01 0003     Load word at G3 (OUTPUT)
   0baa: NOP              No operation
   0bab: LSA  0d          Load string address: 'Restarting...'
   0bba: SLDC 00          Short load constant 0
   0bbb: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0bbe: LOD  01 0003     Load word at G3 (OUTPUT)
   0bc1: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0bc4: SLDC 04          Short load constant 4
   0bc5: SRO  0001        Store global word BASE1
   0bc7: SLDC 05          Short load constant 5
   0bc8: SLDC 01          Short load constant 1
   0bc9: CSP  04          Call standard procedure EXIT
   0bcb: UJP  $0bea       Unconditional jump
-> 0bcd: LOD  01 0003     Load word at G3 (OUTPUT)
   0bd0: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0bd3: LOD  01 0003     Load word at G3 (OUTPUT)
   0bd6: NOP              No operation
   0bd7: LSA  0d          Load string address: 'U not allowed'
   0be6: SLDC 00          Short load constant 0
   0be7: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0bea: UJP  $0c3e       Unconditional jump
   0bec: SLDC 01          Short load constant 1
   0bed: SLDO 04          Short load global BASE4
   0bee: SLDC 52          Short load constant 82
   0bef: EQUI             Integer TOS-1 = TOS
   0bf0: CLP  02          Call local procedure GETCMD.2
   0bf2: UJP  $0c3e       Unconditional jump
   0bf4: SLDC 00          Short load constant 0
   0bf5: SRO  0001        Store global word BASE1
   0bf7: SLDO 04          Short load global BASE4
   0bf8: SLDC 48          Short load constant 72
   0bf9: EQUI             Integer TOS-1 = TOS
   0bfa: FJP  $0c00       Jump if TOS false
   0bfc: LDCN             Load constant NIL
   0bfd: STR  01 0036     Store TOS to G54
-> 0c00: SLDC 05          Short load constant 5
   0c01: SLDC 01          Short load constant 1
   0c02: CSP  04          Call standard procedure EXIT
   0c04: UJP  $0c3e       Unconditional jump
-> 0c3e: SLDC 00          Short load constant 0
   0c3f: FJP  $0a7b       Jump if TOS false
-> 0c41: RBP  01          Return from base procedure
END

### PROCEDURE GETCMD.PROC2(PARAM1; PARAM2) (* P=2 LL=1 *)
  BASE1
  BASE3
  BASE6
  MP1=PARAM2
  MP2=PARAM1
  MP3
BEGIN
-> 0950: LOD  02 0010     Load word at G16
   0953: FJP  $09c2       Jump if TOS false
   0955: CXP  00 25       Call external procedure PASCALSY.37
   0958: LOD  02 0003     Load word at G3 (OUTPUT)
   095b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   095e: SLDC 00          Short load constant 0
   095f: STL  0003        Store TOS into MP3
   0961: LLA  0003        Load local address MP3
   0963: LDA  02 0012     Load addr G18
   0966: SLDC 07          Short load constant 7
   0967: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   096a: LLA  0003        Load local address MP3
   096c: NOP              No operation
   096d: LSA  01          Load string address: ':'
   0970: SLDC 08          Short load constant 8
   0971: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0974: LLA  0003        Load local address MP3
   0976: LDA  02 001e     Load addr G30
   0979: SLDC 17          Short load constant 23
   097a: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   097d: LLA  0003        Load local address MP3
   097f: SLDL 02          Short load local MP2
   0980: SLDL 01          Short load local MP1
   0981: SLDC 01          Short load constant 1
   0982: LAO  0006        Load global BASE6
   0984: SLDC 00          Short load constant 0
   0985: SLDC 00          Short load constant 0
   0986: CGP  08          Call global procedure GETCMD.8
   0988: FJP  $09b3       Jump if TOS false
   098a: LOD  02 0003     Load word at G3 (OUTPUT)
   098d: LSA  0a          Load string address: 'Running...'
   0999: NOP              No operation
   099a: SLDC 00          Short load constant 0
   099b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   099e: LOD  02 0003     Load word at G3 (OUTPUT)
   09a1: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   09a4: SLDL 01          Short load local MP1
   09a5: FJP  $09ac       Jump if TOS false
   09a7: SLDC 04          Short load constant 4
   09a8: SRO  0001        Store global word BASE1
   09aa: UJP  $09af       Unconditional jump
-> 09ac: SLDC 01          Short load constant 1
   09ad: SRO  0001        Store global word BASE1
-> 09af: SLDC 05          Short load constant 5
   09b0: SLDC 01          Short load constant 1
   09b1: CSP  04          Call standard procedure EXIT
-> 09b3: SLDO 03          Short load global BASE3
   09b4: LDCI 0300        Load word 768
   09b7: SLDC 01          Short load constant 1
   09b8: INN              Set membership (TOS-1 in set TOS)
   09b9: LNOT             Logical NOT (~TOS)
   09ba: FJP  $09c0       Jump if TOS false
   09bc: SLDC 00          Short load constant 0
   09bd: STR  02 0010     Store TOS to G16
-> 09c0: UJP  $09cd       Unconditional jump
-> 09c2: SLDL 01          Short load local MP1
   09c3: FJP  $09ca       Jump if TOS false
   09c5: SLDC 06          Short load constant 6
   09c6: CGP  09          Call global procedure GETCMD.9
   09c8: UJP  $09cd       Unconditional jump
-> 09ca: SLDC 07          Short load constant 7
   09cb: CGP  09          Call global procedure GETCMD.9
-> 09cd: RNP  00          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC3(PARAM1): RETVAL (* P=3 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM1
  MP4
  MP8
  MP16
  MP17
  MP18
  MP19
  MP31
  MP32
  MP33
BEGIN
-> 03d4: LDA  02 00cc     Load addr G204
   03d8: SLDL 03          Short load local MP3
   03d9: IXA  000c        Index array (TOS-1 + TOS * 12)
   03db: SLDC 00          Short load constant 0
   03dc: SLDC 00          Short load constant 0
   03dd: SLDC 00          Short load constant 0
   03de: LLA  001f        Load local address MP31
   03e0: SLDC 00          Short load constant 0
   03e1: SLDC 00          Short load constant 0
   03e2: CGP  08          Call global procedure GETCMD.8
   03e4: STL  0001        Store TOS into MP1
   03e6: LDL  001f        Load local word MP31
   03e8: SLDC 02          Short load constant 2
   03e9: EQUI             Integer TOS-1 = TOS
   03ea: FJP  $04a8       Jump if TOS false
   03ec: LDA  02 00cc     Load addr G204
   03f0: SLDL 03          Short load local MP3
   03f1: IXA  000c        Index array (TOS-1 + TOS * 12)
   03f3: LLA  0004        Load local address MP4
   03f5: LLA  0008        Load local address MP8
   03f7: LLA  0010        Load local address MP16
   03f9: LLA  0011        Load local address MP17
   03fb: SLDC 00          Short load constant 0
   03fc: SLDC 00          Short load constant 0
   03fd: CXP  00 21       Call external procedure PASCALSY.33
   0400: FJP  $04a8       Jump if TOS false
   0402: SLDC 00          Short load constant 0
   0403: STL  0012        Store TOS into MP18
-> 0405: LDL  0012        Load local word MP18
   0407: SLDC 01          Short load constant 1
   0408: ADI              Add integers (TOS + TOS-1)
   0409: STL  0012        Store TOS into MP18
   040b: LDA  02 007e     Load addr G126
   040e: LDL  0012        Load local word MP18
   0410: IXA  0006        Index array (TOS-1 + TOS * 6)
   0412: STL  0020        Store TOS into MP32
   0414: LDL  0020        Load local word MP32
   0416: SIND 04          Short index load *TOS+4
   0417: FJP  $047e       Jump if TOS false
   0419: LDL  0020        Load local word MP32
   041b: LSA  00          Load string address: ''
   041d: NOP              No operation
   041e: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0420: LDL  0012        Load local word MP18
   0422: SLDC 00          Short load constant 0
   0423: SLDC 00          Short load constant 0
   0424: CXP  00 2a       Call external procedure PASCALSY.42
   0427: FJP  $047e       Jump if TOS false
   0429: LDL  0020        Load local word MP32
   042b: LOD  02 0001     Load word at G1 (SYSCOM)
   042e: SIND 04          Short index load *TOS+4
   042f: SLDC 00          Short load constant 0
   0430: IXA  000d        Index array (TOS-1 + TOS * 13)
   0432: INC  0003        Inc field ptr (TOS+3)
   0434: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0436: LLA  0013        Load local address MP19
   0438: SLDC 00          Short load constant 0
   0439: STL  0021        Store TOS into MP33
   043b: LLA  0021        Load local address MP33
   043d: LDL  0020        Load local word MP32
   043f: SLDC 07          Short load constant 7
   0440: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0443: LLA  0021        Load local address MP33
   0445: LSA  01          Load string address: ':'
   0448: NOP              No operation
   0449: SLDC 08          Short load constant 8
   044a: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   044d: LLA  0021        Load local address MP33
   044f: LLA  0008        Load local address MP8
   0451: SLDC 17          Short load constant 23
   0452: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0455: LLA  0021        Load local address MP33
   0457: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0459: LLA  0013        Load local address MP19
   045b: LDA  02 00cc     Load addr G204
   045f: SLDL 03          Short load local MP3
   0460: IXA  000c        Index array (TOS-1 + TOS * 12)
   0462: NEQSTR           String TOS-1 <> TOS
   0464: FJP  $047e       Jump if TOS false
   0466: LLA  0013        Load local address MP19
   0468: SLDC 00          Short load constant 0
   0469: SLDC 00          Short load constant 0
   046a: SLDC 00          Short load constant 0
   046b: LLA  001f        Load local address MP31
   046d: SLDC 00          Short load constant 0
   046e: SLDC 00          Short load constant 0
   046f: CGP  08          Call global procedure GETCMD.8
   0471: FJP  $047e       Jump if TOS false
   0473: LDA  02 00cc     Load addr G204
   0477: SLDL 03          Short load local MP3
   0478: IXA  000c        Index array (TOS-1 + TOS * 12)
   047a: LLA  0013        Load local address MP19
   047c: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 047e: LDL  0012        Load local word MP18
   0480: SLDC 0c          Short load constant 12
   0481: EQUI             Integer TOS-1 = TOS
   0482: LDL  001f        Load local word MP31
   0484: SLDC 03          Short load constant 3
   0485: SLDC 01          Short load constant 1
   0486: INN              Set membership (TOS-1 in set TOS)
   0487: LOR              Logical OR (TOS | TOS-1)
   0488: FJP  $0405       Jump if TOS false
   048a: LDL  001f        Load local word MP31
   048c: SLDC 00          Short load constant 0
   048d: EQUI             Integer TOS-1 = TOS
   048e: STL  0001        Store TOS into MP1
   0490: LDL  001f        Load local word MP31
   0492: SLDC 02          Short load constant 2
   0493: EQUI             Integer TOS-1 = TOS
   0494: FJP  $04a8       Jump if TOS false
   0496: LDA  02 00cc     Load addr G204
   049a: SLDL 03          Short load local MP3
   049b: IXA  000c        Index array (TOS-1 + TOS * 12)
   049d: SLDC 00          Short load constant 0
   049e: SLDC 00          Short load constant 0
   049f: SLDC 01          Short load constant 1
   04a0: LLA  001f        Load local address MP31
   04a2: SLDC 00          Short load constant 0
   04a3: SLDC 00          Short load constant 0
   04a4: CGP  08          Call global procedure GETCMD.8
   04a6: FJP  $04a8       Jump if TOS false
-> 04a8: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC4(PARAM1; PARAM2): RETVAL (* P=4 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM2
  MP4=PARAM1
  MP5
BEGIN
-> 0000: SLDL 04          Short load local MP4
   0001: INC  0080        Inc field ptr (TOS+128)
   0004: SLDL 03          Short load local MP3
   0005: IXA  0001        Index array (TOS-1 + TOS * 1)
   0007: STL  0005        Store TOS into MP5
   0009: SLDL 05          Short load local MP5
   000a: SLDC 03          Short load constant 3
   000b: SLDC 0d          Short load constant 13
   000c: LDP              Load packed field (TOS)
   000d: SLDC 01          Short load constant 1
   000e: LESI             Integer TOS-1 < TOS
   000f: FJP  $0016       Jump if TOS false
   0011: SLDL 03          Short load local MP3
   0012: STL  0001        Store TOS into MP1
   0014: UJP  $001c       Unconditional jump
-> 0016: SLDL 05          Short load local MP5
   0017: SLDC 08          Short load constant 8
   0018: SLDC 00          Short load constant 0
   0019: LDP              Load packed field (TOS)
   001a: STL  0001        Store TOS into MP1
-> 001c: RNP  01          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC5(PARAM1; PARAM2) (* P=5 LL=1 *)
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
-> 0028: LOD  02 0001     Load word at G1 (SYSCOM)
   002b: STL  0005        Store TOS into MP5
   002d: SLDL 02          Short load local MP2
   002e: STL  0006        Store TOS into MP6
   0030: SLDL 01          Short load local MP1
   0031: STL  0007        Store TOS into MP7
   0033: SLDL 07          Short load local MP7
   0034: INC  0010        Inc field ptr (TOS+16)
   0036: STL  0008        Store TOS into MP8
   0038: SLDC 00          Short load constant 0
   0039: STL  0003        Store TOS into MP3
   003b: SLDC 0f          Short load constant 15
   003c: STL  0009        Store TOS into MP9
-> 003e: SLDL 03          Short load local MP3
   003f: SLDL 09          Short load local MP9
   0040: LEQI             Integer TOS-1 <= TOS
   0041: FJP  $0096       Jump if TOS false
   0043: SLDL 06          Short load local MP6
   0044: SLDL 03          Short load local MP3
   0045: IXA  0002        Index array (TOS-1 + TOS * 2)
   0047: STL  000a        Store TOS into MP10
   0049: SLDL 0a          Short load local MP10
   004a: SIND 01          Short index load *TOS+1
   004b: SLDC 00          Short load constant 0
   004c: NEQI             Integer TOS-1 <> TOS
   004d: FJP  $008f       Jump if TOS false
   004f: SLDL 02          Short load local MP2
   0050: SLDL 03          Short load local MP3
   0051: SLDC 00          Short load constant 0
   0052: SLDC 00          Short load constant 0
   0053: CGP  04          Call global procedure GETCMD.4
   0055: STL  0004        Store TOS into MP4
   0057: SLDL 04          Short load local MP4
   005a: LDC  02          Load multiple-word constant
                         ffffffc2
   005e: SLDC 02          Short load constant 2
   005f: INN              Set membership (TOS-1 in set TOS)
   0060: FJP  $008f       Jump if TOS false
   0062: SLDL 05          Short load local MP5
   0063: INC  0030        Inc field ptr (TOS+48)
   0065: SLDL 04          Short load local MP4
   0066: IXA  0003        Index array (TOS-1 + TOS * 3)
   0068: STL  000b        Store TOS into MP11
   006a: SLDL 0b          Short load local MP11
   006b: SLDL 07          Short load local MP7
   006c: SIND 07          Short index load *TOS+7
   006d: STO              Store indirect (TOS into TOS-1)
   006e: SLDL 0b          Short load local MP11
   006f: INC  0002        Inc field ptr (TOS+2)
   0071: SLDL 0a          Short load local MP10
   0072: SIND 01          Short index load *TOS+1
   0073: STO              Store indirect (TOS into TOS-1)
   0074: SLDL 06          Short load local MP6
   0075: INC  0060        Inc field ptr (TOS+96)
   0077: SLDL 03          Short load local MP3
   0078: IXA  0001        Index array (TOS-1 + TOS * 1)
   007a: SIND 00          Short index load *TOS+0
   007b: SLDC 07          Short load constant 7
   007c: EQUI             Integer TOS-1 = TOS
   007d: FJP  $0086       Jump if TOS false
   007f: SLDL 0b          Short load local MP11
   0080: INC  0001        Inc field ptr (TOS+1)
   0082: SLDC 00          Short load constant 0
   0083: STO              Store indirect (TOS into TOS-1)
   0084: UJP  $008f       Unconditional jump
-> 0086: SLDL 0b          Short load local MP11
   0087: INC  0001        Inc field ptr (TOS+1)
   0089: SLDL 0a          Short load local MP10
   008a: SIND 00          Short index load *TOS+0
   008b: SLDL 08          Short load local MP8
   008c: SIND 00          Short index load *TOS+0
   008d: ADI              Add integers (TOS + TOS-1)
   008e: STO              Store indirect (TOS into TOS-1)
-> 008f: SLDL 03          Short load local MP3
   0090: SLDC 01          Short load constant 1
   0091: ADI              Add integers (TOS + TOS-1)
   0092: STL  0003        Store TOS into MP3
   0094: UJP  $003e       Unconditional jump
-> 0096: RNP  00          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC6(PARAM1; PARAM2; PARAM3): RETVAL (* P=6 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM3
  MP4=PARAM2
  MP5=PARAM1
  MP6
  MP7
  MP8
BEGIN
-> 00a4: SLDL 04          Short load local MP4
   00a5: SLDC 00          Short load constant 0
   00a6: ADJ  02          Adjust set to 2 words
   00a8: STM  02          Store 2 words at TOS to TOS-1
   00aa: SLDC 01          Short load constant 1
   00ab: STL  0001        Store TOS into MP1
   00ad: SLDL 05          Short load local MP5
   00ae: STL  0007        Store TOS into MP7
   00b0: SLDC 00          Short load constant 0
   00b1: STL  0006        Store TOS into MP6
   00b3: SLDC 0f          Short load constant 15
   00b4: STL  0008        Store TOS into MP8
-> 00b6: SLDL 06          Short load local MP6
   00b7: SLDL 08          Short load local MP8
   00b8: LEQI             Integer TOS-1 <= TOS
   00b9: FJP  $00ed       Jump if TOS false
   00bb: SLDL 07          Short load local MP7
   00bc: SLDL 06          Short load local MP6
   00bd: IXA  0002        Index array (TOS-1 + TOS * 2)
   00bf: SIND 01          Short index load *TOS+1
   00c0: SLDC 00          Short load constant 0
   00c1: NEQI             Integer TOS-1 <> TOS
   00c2: FJP  $00e6       Jump if TOS false
   00c4: SLDL 07          Short load local MP7
   00c5: INC  0060        Inc field ptr (TOS+96)
   00c7: SLDL 06          Short load local MP6
   00c8: IXA  0001        Index array (TOS-1 + TOS * 1)
   00ca: SIND 00          Short index load *TOS+0
   00cb: SLDL 03          Short load local MP3
   00cc: SLDC 01          Short load constant 1
   00cd: INN              Set membership (TOS-1 in set TOS)
   00ce: FJP  $00e3       Jump if TOS false
   00d0: SLDL 04          Short load local MP4
   00d1: SLDL 04          Short load local MP4
   00d2: LDM  02          Load 2 words from (TOS)
   00d4: SLDC 02          Short load constant 2
   00d5: SLDL 05          Short load local MP5
   00d6: SLDL 06          Short load local MP6
   00d7: SLDC 00          Short load constant 0
   00d8: SLDC 00          Short load constant 0
   00d9: CGP  04          Call global procedure GETCMD.4
   00db: SGS              Build singleton set [TOS]
   00dc: UNI              Set union (TOS OR TOS-1)
   00dd: ADJ  02          Adjust set to 2 words
   00df: STM  02          Store 2 words at TOS to TOS-1
   00e1: UJP  $00e6       Unconditional jump
-> 00e3: SLDC 00          Short load constant 0
   00e4: STL  0001        Store TOS into MP1
-> 00e6: SLDL 06          Short load local MP6
   00e7: SLDC 01          Short load constant 1
   00e8: ADI              Add integers (TOS + TOS-1)
   00e9: STL  0006        Store TOS into MP6
   00eb: UJP  $00b6       Unconditional jump
-> 00ed: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC7(PARAM1): RETVAL (* P=7 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM1
  MP4
  MP12
  MP272
  MP279
  MP288
  MP562
BEGIN
-> 00fc: LLA  0004        Load local address MP4
   00fe: SLDL 03          Short load local MP3
   00ff: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0101: LLA  0110        Load local address MP272
   0104: LDCN             Load constant NIL
   0105: SLDC 01          Short load constant 1
   0106: NGI              Negate integer
   0107: CXP  00 03       Call external procedure PASCALSY.FINIT
   010a: SLDC 00          Short load constant 0
   010b: STL  0001        Store TOS into MP1
   010d: LLA  0110        Load local address MP272
   0110: LLA  0004        Load local address MP4
   0112: SLDC 01          Short load constant 1
   0113: LDCN             Load constant NIL
   0114: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0117: CSP  22          Call standard procedure IORESULT
   0119: SLDC 00          Short load constant 0
   011a: EQUI             Integer TOS-1 = TOS
   011b: FJP  $015f       Jump if TOS false
   011d: LOD  02 0001     Load word at G1 (SYSCOM)
   0120: STL  0232        Store TOS into MP562
   0123: LDL  0117        Load local word MP279
   0126: LLA  000c        Load local address MP12
   0128: SLDC 00          Short load constant 0
   0129: LDCI 0208        Load word 520
   012c: LDL  0120        Load local word MP288
   012f: SLDC 00          Short load constant 0
   0130: CSP  05          Call standard procedure UNITREAD
   0132: CSP  22          Call standard procedure IORESULT
   0134: SLDC 00          Short load constant 0
   0135: NEQI             Integer TOS-1 <> TOS
   0136: FJP  $013a       Jump if TOS false
   0138: UJP  $015f       Unconditional jump
-> 013a: LLA  000c        Load local address MP12
   013c: LDA  02 0108     Load addr G264
   0140: LDCI 00c0        Load word 192
   0143: SLDC 01          Short load constant 1
   0144: ADJ  01          Adjust set to 1 words
   0146: SLDC 00          Short load constant 0
   0147: SLDC 00          Short load constant 0
   0148: CGP  06          Call global procedure GETCMD.6
   014a: FJP  $014c       Jump if TOS false
-> 014c: LLA  000c        Load local address MP12
   014e: LLA  0110        Load local address MP272
   0151: CGP  05          Call global procedure GETCMD.5
   0153: LDA  02 010a     Load addr G266
   0157: SLDC 00          Short load constant 0
   0158: ADJ  02          Adjust set to 2 words
   015a: STM  02          Store 2 words at TOS to TOS-1
   015c: SLDC 01          Short load constant 1
   015d: STL  0001        Store TOS into MP1
-> 015f: LLA  0110        Load local address MP272
   0162: SLDC 00          Short load constant 0
   0163: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 0166: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC8(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5): RETVAL (* P=8 LL=1 *)
  BASE1
  BASE3
  MP1=RETVAL1
  MP3=PARAM5
  MP4=PARAM4
  MP5=PARAM3
  MP6=PARAM2
  MP7=PARAM1
  MP8
  MP49
  MP193
  MP309
  MP311
  MP312
  MP313
BEGIN
-> 0172: LLA  0008        Load local address MP8
   0174: SLDL 07          Short load local MP7
   0175: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0177: SLDL 03          Short load local MP3
   0178: SLDC 02          Short load constant 2
   0179: STO              Store indirect (TOS into TOS-1)
   017a: SLDC 00          Short load constant 0
   017b: STL  0001        Store TOS into MP1
   017d: LOD  02 0008     Load word at G8
   0180: LLA  0008        Load local address MP8
   0182: SLDC 01          Short load constant 1
   0183: LDCN             Load constant NIL
   0184: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0187: CSP  22          Call standard procedure IORESULT
   0189: SLDC 00          Short load constant 0
   018a: NEQI             Integer TOS-1 <> TOS
   018b: FJP  $01d0       Jump if TOS false
   018d: SLDL 04          Short load local MP4
   018e: FJP  $01ce       Jump if TOS false
   0190: CSP  22          Call standard procedure IORESULT
   0192: SLDC 07          Short load constant 7
   0193: EQUI             Integer TOS-1 = TOS
   0194: FJP  $01b3       Jump if TOS false
   0196: LOD  02 0003     Load word at G3 (OUTPUT)
   0199: LSA  11          Load string address: 'Illegal file name'
   01ac: NOP              No operation
   01ad: SLDC 00          Short load constant 0
   01ae: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   01b1: UJP  $01ce       Unconditional jump
-> 01b3: LOD  02 0003     Load word at G3 (OUTPUT)
   01b6: NOP              No operation
   01b7: LSA  08          Load string address: 'No file '
   01c1: SLDC 00          Short load constant 0
   01c2: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   01c5: LOD  02 0003     Load word at G3 (OUTPUT)
   01c8: LLA  0008        Load local address MP8
   01ca: SLDC 00          Short load constant 0
   01cb: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 01ce: UJP  $03bc       Unconditional jump
-> 01d0: SLDL 03          Short load local MP3
   01d1: SLDC 01          Short load constant 1
   01d2: STO              Store indirect (TOS into TOS-1)
   01d3: LOD  02 0001     Load word at G1 (SYSCOM)
   01d6: STL  0137        Store TOS into MP311
   01d9: LOD  02 0008     Load word at G8
   01dc: STL  0138        Store TOS into MP312
   01df: LDL  0138        Load local word MP312
   01e2: INC  0010        Inc field ptr (TOS+16)
   01e4: STL  0139        Store TOS into MP313
   01e7: LDL  0139        Load local word MP313
   01ea: INC  0002        Inc field ptr (TOS+2)
   01ec: SLDC 04          Short load constant 4
   01ed: SLDC 00          Short load constant 0
   01ee: LDP              Load packed field (TOS)
   01ef: SLDC 02          Short load constant 2
   01f0: NEQI             Integer TOS-1 <> TOS
   01f1: FJP  $0213       Jump if TOS false
   01f3: LOD  02 0003     Load word at G3 (OUTPUT)
   01f6: LLA  0008        Load local address MP8
   01f8: SLDC 00          Short load constant 0
   01f9: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   01fc: LOD  02 0003     Load word at G3 (OUTPUT)
   01ff: LSA  09          Load string address: ' not code'
   020a: NOP              No operation
   020b: SLDC 00          Short load constant 0
   020c: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   020f: UJP  $03bc       Unconditional jump
   0211: UJP  $0398       Unconditional jump
-> 0213: LDL  0138        Load local word MP312
   0216: SIND 07          Short index load *TOS+7
   0217: LLA  0031        Load local address MP49
   0219: SLDC 00          Short load constant 0
   021a: LDCI 0208        Load word 520
   021d: LDL  0139        Load local word MP313
   0220: SIND 00          Short index load *TOS+0
   0221: SLDC 00          Short load constant 0
   0222: CSP  05          Call standard procedure UNITREAD
   0224: CSP  22          Call standard procedure IORESULT
   0226: SLDC 00          Short load constant 0
   0227: NEQI             Integer TOS-1 <> TOS
   0228: FJP  $0242       Jump if TOS false
   022a: LOD  02 0003     Load word at G3 (OUTPUT)
   022d: LSA  0c          Load string address: 'Bad block #0'
   023b: NOP              No operation
   023c: SLDC 00          Short load constant 0
   023d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0240: UJP  $03bc       Unconditional jump
-> 0242: LLA  0031        Load local address MP49
   0244: LLA  0135        Load local address MP309
   0247: SLDC 01          Short load constant 1
   0248: SLDC 01          Short load constant 1
   0249: ADJ  01          Adjust set to 1 words
   024b: SLDC 00          Short load constant 0
   024c: SLDC 00          Short load constant 0
   024d: CGP  06          Call global procedure GETCMD.6
   024f: LNOT             Logical NOT (~TOS)
   0250: FJP  $02b3       Jump if TOS false
   0252: SLDL 06          Short load local MP6
   0253: FJP  $028e       Jump if TOS false
   0255: LOD  02 0003     Load word at G3 (OUTPUT)
   0258: NOP              No operation
   0259: LSA  0a          Load string address: 'Linking...'
   0265: SLDC 00          Short load constant 0
   0266: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0269: LOD  02 0003     Load word at G3 (OUTPUT)
   026c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   026f: LOD  02 0008     Load word at G8
   0272: SLDC 00          Short load constant 0
   0273: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0276: SLDC 04          Short load constant 4
   0277: SLDC 00          Short load constant 0
   0278: SLDC 00          Short load constant 0
   0279: CGP  03          Call global procedure GETCMD.3
   027b: FJP  $028c       Jump if TOS false
   027d: SLDL 05          Short load local MP5
   027e: FJP  $0285       Jump if TOS false
   0280: SLDC 08          Short load constant 8
   0281: SRO  0001        Store global word BASE1
   0283: UJP  $0288       Unconditional jump
-> 0285: SLDC 09          Short load constant 9
   0286: SRO  0001        Store global word BASE1
-> 0288: SLDC 05          Short load constant 5
   0289: SLDC 01          Short load constant 1
   028a: CSP  04          Call standard procedure EXIT
-> 028c: UJP  $02b1       Unconditional jump
-> 028e: SLDO 03          Short load global BASE3
   028f: LDCI 0300        Load word 768
   0292: SLDC 01          Short load constant 1
   0293: INN              Set membership (TOS-1 in set TOS)
   0294: LNOT             Logical NOT (~TOS)
   0295: FJP  $02b1       Jump if TOS false
   0297: LOD  02 0003     Load word at G3 (OUTPUT)
   029a: NOP              No operation
   029b: LSA  10          Load string address: 'Must L(ink first'
   02ad: SLDC 00          Short load constant 0
   02ae: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 02b1: UJP  $03bc       Unconditional jump
-> 02b3: LLA  0135        Load local address MP309
   02b6: LDM  02          Load 2 words from (TOS)
   02b8: SLDC 02          Short load constant 2
   02b9: LLA  00c1        Load local address MP193
   02bc: LDM  02          Load 2 words from (TOS)
   02be: SLDC 02          Short load constant 2
   02bf: INT              Set intersection (TOS AND TOS-1)
   02c0: SLDC 00          Short load constant 0
   02c1: NEQSET           Set TOS-1 <> TOS
   02c3: FJP  $02ff       Jump if TOS false
   02c5: LOD  02 0003     Load word at G3 (OUTPUT)
   02c8: NOP              No operation
   02c9: LSA  2e          Load string address: 'Conflict between intrinsic and user segment(s)'
   02f9: SLDC 00          Short load constant 0
   02fa: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   02fd: UJP  $03bc       Unconditional jump
-> 02ff: LDA  02 010a     Load addr G266
   0303: LDM  02          Load 2 words from (TOS)
   0305: SLDC 02          Short load constant 2
   0306: SLDC 00          Short load constant 0
   0307: NEQSET           Set TOS-1 <> TOS
   0309: FJP  $0350       Jump if TOS false
   030b: LSA  0f          Load string address: '*SYSTEM.LIBRARY'
   031c: NOP              No operation
   031d: SLDC 00          Short load constant 0
   031e: SLDC 00          Short load constant 0
   031f: CGP  07          Call global procedure GETCMD.7
   0321: LNOT             Logical NOT (~TOS)
   0322: FJP  $0350       Jump if TOS false
   0324: LOD  02 0003     Load word at G3 (OUTPUT)
   0327: LSA  20          Load string address: 'Can't load required intrinsic(s)'
   0349: NOP              No operation
   034a: SLDC 00          Short load constant 0
   034b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   034e: UJP  $03bc       Unconditional jump
-> 0350: LLA  00c1        Load local address MP193
   0353: LDM  02          Load 2 words from (TOS)
   0355: SLDC 02          Short load constant 2
   0356: LDA  02 0108     Load addr G264
   035a: LDM  02          Load 2 words from (TOS)
   035c: SLDC 02          Short load constant 2
   035d: LEQSET           Set TOS-1 <= TOS
   035f: LNOT             Logical NOT (~TOS)
   0360: FJP  $0391       Jump if TOS false
   0362: LOD  02 0003     Load word at G3 (OUTPUT)
   0365: LSA  23          Load string address: 'Required intrinsic(s) not available'
   038a: NOP              No operation
   038b: SLDC 00          Short load constant 0
   038c: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   038f: UJP  $03bc       Unconditional jump
-> 0391: LLA  0031        Load local address MP49
   0393: LOD  02 0008     Load word at G8
   0396: CGP  05          Call global procedure GETCMD.5
-> 0398: LDA  02 010a     Load addr G266
   039c: LDA  02 010a     Load addr G266
   03a0: LDM  02          Load 2 words from (TOS)
   03a2: SLDC 02          Short load constant 2
   03a3: LLA  0135        Load local address MP309
   03a6: LDM  02          Load 2 words from (TOS)
   03a8: SLDC 02          Short load constant 2
   03a9: LDA  02 0108     Load addr G264
   03ad: LDM  02          Load 2 words from (TOS)
   03af: SLDC 02          Short load constant 2
   03b0: INT              Set intersection (TOS AND TOS-1)
   03b1: UNI              Set union (TOS OR TOS-1)
   03b2: ADJ  02          Adjust set to 2 words
   03b4: STM  02          Store 2 words at TOS to TOS-1
   03b6: SLDL 03          Short load local MP3
   03b7: SLDC 00          Short load constant 0
   03b8: STO              Store indirect (TOS into TOS-1)
   03b9: SLDC 01          Short load constant 1
   03ba: STL  0001        Store TOS into MP1
-> 03bc: LOD  02 0008     Load word at G8
   03bf: SLDC 00          Short load constant 0
   03c0: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 03c3: RNP  01          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC9(PARAM1) (* P=9 LL=1 *)
  BASE1
  MP1=PARAM1
  MP2
  MP23
  MP44
  MP45
  MP57
  MP58
  MP186
BEGIN
-> 04ba: SLDL 01          Short load local MP1
   04bb: SLDC 08          Short load constant 8
   04bc: EQUI             Integer TOS-1 = TOS
   04bd: FJP  $04d5       Jump if TOS false
   04bf: LOD  02 0003     Load word at G3 (OUTPUT)
   04c2: NOP              No operation
   04c3: LSA  0a          Load string address: 'Assembling'
   04cf: SLDC 00          Short load constant 0
   04d0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   04d3: UJP  $04e8       Unconditional jump
-> 04d5: LOD  02 0003     Load word at G3 (OUTPUT)
   04d8: NOP              No operation
   04d9: LSA  09          Load string address: 'Compiling'
   04e4: SLDC 00          Short load constant 0
   04e5: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 04e8: LOD  02 0003     Load word at G3 (OUTPUT)
   04eb: LSA  03          Load string address: '...'
   04f0: NOP              No operation
   04f1: SLDC 00          Short load constant 0
   04f2: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   04f5: LOD  02 0003     Load word at G3 (OUTPUT)
   04f8: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   04fb: SLDL 01          Short load local MP1
   04fc: SLDC 08          Short load constant 8
   04fd: EQUI             Integer TOS-1 = TOS
   04fe: FJP  $0505       Jump if TOS false
   0500: SLDC 00          Short load constant 0
   0501: STL  0039        Store TOS into MP57
   0503: UJP  $0508       Unconditional jump
-> 0505: SLDC 01          Short load constant 1
   0506: STL  0039        Store TOS into MP57
-> 0508: LDL  0039        Load local word MP57
   050a: SLDC 00          Short load constant 0
   050b: SLDC 00          Short load constant 0
   050c: CGP  03          Call global procedure GETCMD.3
   050e: FJP  $079a       Jump if TOS false
   0510: LOD  02 0011     Load word at G17
   0513: FJP  $053c       Jump if TOS false
   0515: LLA  0002        Load local address MP2
   0517: SLDC 00          Short load constant 0
   0518: STL  003a        Store TOS into MP58
   051a: LLA  003a        Load local address MP58
   051c: LDA  02 0016     Load addr G22
   051f: SLDC 07          Short load constant 7
   0520: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0523: LLA  003a        Load local address MP58
   0525: LSA  01          Load string address: ':'
   0528: NOP              No operation
   0529: SLDC 08          Short load constant 8
   052a: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   052d: LLA  003a        Load local address MP58
   052f: LDA  02 0026     Load addr G38
   0532: SLDC 17          Short load constant 23
   0533: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0536: LLA  003a        Load local address MP58
   0538: SAS  28          String assign (TOS to TOS-1, 40 chars)
   053a: UJP  $05d2       Unconditional jump
-> 053c: SLDL 01          Short load local MP1
   053d: SLDC 08          Short load constant 8
   053e: EQUI             Integer TOS-1 = TOS
   053f: FJP  $0555       Jump if TOS false
   0541: LOD  02 0003     Load word at G3 (OUTPUT)
   0544: NOP              No operation
   0545: LSA  08          Load string address: 'Assemble'
   054f: SLDC 00          Short load constant 0
   0550: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0553: UJP  $0566       Unconditional jump
-> 0555: LOD  02 0003     Load word at G3 (OUTPUT)
   0558: NOP              No operation
   0559: LSA  07          Load string address: 'Compile'
   0562: SLDC 00          Short load constant 0
   0563: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0566: LOD  02 0003     Load word at G3 (OUTPUT)
   0569: LSA  0c          Load string address: ' what text? '
   0577: NOP              No operation
   0578: SLDC 00          Short load constant 0
   0579: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   057c: LOD  02 0002     Load word at G2 (INPUT)
   057f: LLA  0017        Load local address MP23
   0581: SLDC 28          Short load constant 40
   0582: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   0585: LOD  02 0002     Load word at G2 (INPUT)
   0588: CXP  00 15       Call external procedure PASCALSY.FREADLN
   058b: LLA  0017        Load local address MP23
   058d: LSA  00          Load string address: ''
   058f: NOP              No operation
   0590: EQLSTR           String TOS-1 = TOS
   0592: FJP  $0596       Jump if TOS false
   0594: UJP  $078c       Unconditional jump
-> 0596: LLA  0017        Load local address MP23
   0598: LLA  0017        Load local address MP23
   059a: SLDC 00          Short load constant 0
   059b: LDB              Load byte at byte ptr TOS-1 + TOS
   059c: LDB              Load byte at byte ptr TOS-1 + TOS
   059d: SLDC 2e          Short load constant 46
   059e: EQUI             Integer TOS-1 = TOS
   059f: FJP  $05b3       Jump if TOS false
   05a1: LLA  0017        Load local address MP23
   05a3: SLDC 00          Short load constant 0
   05a4: LLA  0017        Load local address MP23
   05a6: SLDC 00          Short load constant 0
   05a7: LDB              Load byte at byte ptr TOS-1 + TOS
   05a8: SLDC 01          Short load constant 1
   05a9: SBI              Subtract integers (TOS-1 - TOS)
   05aa: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   05ab: LLA  0002        Load local address MP2
   05ad: LLA  0017        Load local address MP23
   05af: SAS  28          String assign (TOS to TOS-1, 40 chars)
   05b1: UJP  $05d2       Unconditional jump
-> 05b3: LLA  0002        Load local address MP2
   05b5: SLDC 00          Short load constant 0
   05b6: STL  003a        Store TOS into MP58
   05b8: LLA  003a        Load local address MP58
   05ba: LLA  0017        Load local address MP23
   05bc: SLDC 28          Short load constant 40
   05bd: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05c0: LLA  003a        Load local address MP58
   05c2: NOP              No operation
   05c3: LSA  05          Load string address: '.TEXT'
   05ca: SLDC 2d          Short load constant 45
   05cb: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05ce: LLA  003a        Load local address MP58
   05d0: SAS  28          String assign (TOS to TOS-1, 40 chars)
-> 05d2: LOD  02 0009     Load word at G9
   05d5: LLA  0002        Load local address MP2
   05d7: SLDC 01          Short load constant 1
   05d8: LDCN             Load constant NIL
   05d9: CXP  00 05       Call external procedure PASCALSY.FOPEN
   05dc: CSP  22          Call standard procedure IORESULT
   05de: SLDC 00          Short load constant 0
   05df: NEQI             Integer TOS-1 <> TOS
   05e0: FJP  $0606       Jump if TOS false
   05e2: LOD  02 0003     Load word at G3 (OUTPUT)
   05e5: LSA  0b          Load string address: 'Can't find '
   05f2: NOP              No operation
   05f3: SLDC 00          Short load constant 0
   05f4: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   05f7: LOD  02 0003     Load word at G3 (OUTPUT)
   05fa: LLA  0017        Load local address MP23
   05fc: SLDC 00          Short load constant 0
   05fd: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0600: SLDC 00          Short load constant 0
   0601: STR  02 0011     Store TOS to G17
   0604: UJP  $078c       Unconditional jump
-> 0606: LLA  0002        Load local address MP2
   0608: SLDC 00          Short load constant 0
   0609: STL  003a        Store TOS into MP58
   060b: LLA  003a        Load local address MP58
   060d: LDA  02 00cc     Load addr G204
   0611: LDL  0039        Load local word MP57
   0613: IXA  000c        Index array (TOS-1 + TOS * 12)
   0615: LLA  00ba        Load local address MP186
   0618: SLDC 01          Short load constant 1
   0619: LSA  01          Load string address: ':'
   061c: NOP              No operation
   061d: LDA  02 00cc     Load addr G204
   0621: LDL  0039        Load local word MP57
   0623: IXA  000c        Index array (TOS-1 + TOS * 12)
   0625: SLDC 00          Short load constant 0
   0626: SLDC 00          Short load constant 0
   0627: CXP  00 1b       Call external procedure PASCALSY.SPOS
   062a: CXP  00 19       Call external procedure PASCALSY.SCOPY
   062d: LLA  00ba        Load local address MP186
   0630: SLDC 17          Short load constant 23
   0631: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0634: LLA  003a        Load local address MP58
   0636: NOP              No operation
   0637: LSA  0f          Load string address: 'SYSTEM.SWAPDISK'
   0648: SLDC 26          Short load constant 38
   0649: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   064c: LLA  003a        Load local address MP58
   064e: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0650: LOD  02 0037     Load word at G55
   0653: LLA  0002        Load local address MP2
   0655: SLDC 01          Short load constant 1
   0656: LDCN             Load constant NIL
   0657: CXP  00 05       Call external procedure PASCALSY.FOPEN
   065a: LLA  002d        Load local address MP45
   065c: NOP              No operation
   065d: LSA  13          Load string address: '*SYSTEM.WRK.CODE[*]'
   0672: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0674: LOD  02 0011     Load word at G17
   0677: LNOT             Logical NOT (~TOS)
   0678: FJP  $0741       Jump if TOS false
   067a: LOD  02 0003     Load word at G3 (OUTPUT)
   067d: LSA  12          Load string address: 'To what codefile? '
   0691: NOP              No operation
   0692: SLDC 00          Short load constant 0
   0693: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0696: LOD  02 0002     Load word at G2 (INPUT)
   0699: LLA  0002        Load local address MP2
   069b: SLDC 28          Short load constant 40
   069c: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   069f: LOD  02 0002     Load word at G2 (INPUT)
   06a2: CXP  00 15       Call external procedure PASCALSY.FREADLN
   06a5: LLA  0002        Load local address MP2
   06a7: LSA  00          Load string address: ''
   06a9: NOP              No operation
   06aa: NEQSTR           String TOS-1 <> TOS
   06ac: FJP  $0741       Jump if TOS false
   06ae: LLA  0002        Load local address MP2
   06b0: SLDC 01          Short load constant 1
   06b1: LDB              Load byte at byte ptr TOS-1 + TOS
   06b2: LOD  02 0001     Load word at G1 (SYSCOM)
   06b5: INC  002c        Inc field ptr (TOS+44)
   06b7: SLDC 08          Short load constant 8
   06b8: SLDC 08          Short load constant 8
   06b9: LDP              Load packed field (TOS)
   06ba: EQUI             Integer TOS-1 = TOS
   06bb: FJP  $06c1       Jump if TOS false
   06bd: UJP  $078c       Unconditional jump
   06bf: UJP  $0741       Unconditional jump
-> 06c1: LSA  01          Load string address: '$'
   06c4: NOP              No operation
   06c5: LLA  0002        Load local address MP2
   06c7: SLDC 00          Short load constant 0
   06c8: SLDC 00          Short load constant 0
   06c9: CXP  00 1b       Call external procedure PASCALSY.SPOS
   06cc: STL  002c        Store TOS into MP44
-> 06ce: LDL  002c        Load local word MP44
   06d0: SLDC 00          Short load constant 0
   06d1: NEQI             Integer TOS-1 <> TOS
   06d2: FJP  $0701       Jump if TOS false
   06d4: LLA  0002        Load local address MP2
   06d6: LDL  002c        Load local word MP44
   06d8: SLDC 01          Short load constant 1
   06d9: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   06dc: LLA  0017        Load local address MP23
   06de: LLA  003a        Load local address MP58
   06e0: SLDC 01          Short load constant 1
   06e1: LLA  0017        Load local address MP23
   06e3: SLDC 00          Short load constant 0
   06e4: LDB              Load byte at byte ptr TOS-1 + TOS
   06e5: CXP  00 19       Call external procedure PASCALSY.SCOPY
   06e8: LLA  003a        Load local address MP58
   06ea: LLA  0002        Load local address MP2
   06ec: SLDC 28          Short load constant 40
   06ed: LDL  002c        Load local word MP44
   06ef: CXP  00 18       Call external procedure PASCALSY.SINSERT
   06f2: NOP              No operation
   06f3: LSA  01          Load string address: '$'
   06f6: LLA  0002        Load local address MP2
   06f8: SLDC 00          Short load constant 0
   06f9: SLDC 00          Short load constant 0
   06fa: CXP  00 1b       Call external procedure PASCALSY.SPOS
   06fd: STL  002c        Store TOS into MP44
   06ff: UJP  $06ce       Unconditional jump
-> 0701: LLA  0002        Load local address MP2
   0703: LLA  0002        Load local address MP2
   0705: SLDC 00          Short load constant 0
   0706: LDB              Load byte at byte ptr TOS-1 + TOS
   0707: LDB              Load byte at byte ptr TOS-1 + TOS
   0708: SLDC 2e          Short load constant 46
   0709: EQUI             Integer TOS-1 = TOS
   070a: FJP  $0722       Jump if TOS false
   070c: LLA  002d        Load local address MP45
   070e: LLA  0002        Load local address MP2
   0710: LLA  003a        Load local address MP58
   0712: SLDC 01          Short load constant 1
   0713: LLA  0002        Load local address MP2
   0715: SLDC 00          Short load constant 0
   0716: LDB              Load byte at byte ptr TOS-1 + TOS
   0717: SLDC 01          Short load constant 1
   0718: SBI              Subtract integers (TOS-1 - TOS)
   0719: CXP  00 19       Call external procedure PASCALSY.SCOPY
   071c: LLA  003a        Load local address MP58
   071e: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0720: UJP  $0741       Unconditional jump
-> 0722: LLA  002d        Load local address MP45
   0724: SLDC 00          Short load constant 0
   0725: STL  003a        Store TOS into MP58
   0727: LLA  003a        Load local address MP58
   0729: LLA  0002        Load local address MP2
   072b: SLDC 28          Short load constant 40
   072c: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   072f: LLA  003a        Load local address MP58
   0731: LSA  05          Load string address: '.CODE'
   0738: NOP              No operation
   0739: SLDC 2d          Short load constant 45
   073a: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   073d: LLA  003a        Load local address MP58
   073f: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 0741: LOD  02 0008     Load word at G8
   0744: LLA  002d        Load local address MP45
   0746: SLDC 00          Short load constant 0
   0747: LDCN             Load constant NIL
   0748: CXP  00 05       Call external procedure PASCALSY.FOPEN
   074b: CSP  22          Call standard procedure IORESULT
   074d: SLDC 00          Short load constant 0
   074e: NEQI             Integer TOS-1 <> TOS
   074f: FJP  $0771       Jump if TOS false
   0751: LOD  02 0003     Load word at G3 (OUTPUT)
   0754: NOP              No operation
   0755: LSA  0b          Load string address: 'Can't open '
   0762: SLDC 00          Short load constant 0
   0763: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0766: LOD  02 0003     Load word at G3 (OUTPUT)
   0769: LLA  002d        Load local address MP45
   076b: SLDC 00          Short load constant 0
   076c: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   076f: UJP  $078c       Unconditional jump
-> 0771: SLDC 00          Short load constant 0
   0772: STR  02 000a     Store TOS to G10
   0775: SLDC 00          Short load constant 0
   0776: STR  02 000b     Store TOS to G11
   0779: SLDC 00          Short load constant 0
   077a: STR  02 000c     Store TOS to G12
   077d: SLDL 01          Short load local MP1
   077e: SLDC 08          Short load constant 8
   077f: EQUI             Integer TOS-1 = TOS
   0780: FJP  $0785       Jump if TOS false
   0782: SLDC 05          Short load constant 5
   0783: STL  0001        Store TOS into MP1
-> 0785: SLDL 01          Short load local MP1
   0786: SRO  0001        Store global word BASE1
   0788: SLDC 05          Short load constant 5
   0789: SLDC 01          Short load constant 1
   078a: CSP  04          Call standard procedure EXIT
-> 078c: LOD  02 0009     Load word at G9
   078f: SLDC 00          Short load constant 0
   0790: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0793: LOD  02 0037     Load word at G55
   0796: SLDC 00          Short load constant 0
   0797: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 079a: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC10 (* P=10 LL=1 *)
  BASE1
  BASE3
  MP2
BEGIN
-> 07b4: LOD  02 0009     Load word at G9
   07b7: SLDC 00          Short load constant 0
   07b8: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   07bb: LOD  02 0037     Load word at G55
   07be: SLDC 00          Short load constant 0
   07bf: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   07c2: LOD  02 0001     Load word at G1 (SYSCOM)
   07c5: INC  001d        Inc field ptr (TOS+29)
   07c7: SLDC 01          Short load constant 1
   07c8: SLDC 01          Short load constant 1
   07c9: LDP              Load packed field (TOS)
   07ca: FJP  $07cf       Jump if TOS false
   07cc: SLDC 03          Short load constant 3
   07cd: CSP  26          Call standard procedure UNITCLEAR
-> 07cf: LOD  02 000a     Load word at G10
   07d2: SLDC 00          Short load constant 0
   07d3: GRTI             Integer TOS-1 > TOS
   07d4: FJP  $0801       Jump if TOS false
   07d6: SLDC 00          Short load constant 0
   07d7: STR  02 0010     Store TOS to G16
   07da: LOD  02 0008     Load word at G8
   07dd: SLDC 02          Short load constant 2
   07de: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   07e1: LOD  02 000b     Load word at G11
   07e4: SLDC 00          Short load constant 0
   07e5: GRTI             Integer TOS-1 > TOS
   07e6: FJP  $07ff       Jump if TOS false
   07e8: CXP  00 25       Call external procedure PASCALSY.37
   07eb: LOD  02 0003     Load word at G3 (OUTPUT)
   07ee: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   07f1: SLDC 02          Short load constant 2
   07f2: SLDC 00          Short load constant 0
   07f3: SLDC 00          Short load constant 0
   07f4: CGP  03          Call global procedure GETCMD.3
   07f6: FJP  $07ff       Jump if TOS false
   07f8: SLDC 04          Short load constant 4
   07f9: SRO  0001        Store global word BASE1
   07fb: SLDC 05          Short load constant 5
   07fc: SLDC 01          Short load constant 1
   07fd: CSP  04          Call standard procedure EXIT
-> 07ff: UJP  $089f       Unconditional jump
-> 0801: LDA  02 001e     Load addr G30
   0804: NOP              No operation
   0805: LSA  0f          Load string address: 'SYSTEM.WRK.CODE'
   0816: NEQSTR           String TOS-1 <> TOS
   0818: FJP  $088d       Jump if TOS false
   081a: LDA  02 0012     Load addr G18
   081d: LOD  02 0008     Load word at G8
   0820: INC  0008        Inc field ptr (TOS+8)
   0822: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0824: LDA  02 001e     Load addr G30
   0827: LOD  02 0008     Load word at G8
   082a: INC  0013        Inc field ptr (TOS+19)
   082c: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   082e: LDA  02 001e     Load addr G30
   0831: LSA  0f          Load string address: 'SYSTEM.WRK.CODE'
   0842: NOP              No operation
   0843: NEQSTR           String TOS-1 <> TOS
   0845: FJP  $088d       Jump if TOS false
   0847: LDA  02 001a     Load addr G26
   084a: LDA  02 0012     Load addr G18
   084d: SAS  07          String assign (TOS to TOS-1, 7 chars)
   084f: LDA  02 001e     Load addr G30
   0852: SLDC 00          Short load constant 0
   0853: LDB              Load byte at byte ptr TOS-1 + TOS
   0854: SLDC 05          Short load constant 5
   0855: GRTI             Integer TOS-1 > TOS
   0856: FJP  $088d       Jump if TOS false
   0858: LDA  02 001e     Load addr G30
   085b: LLA  0002        Load local address MP2
   085d: LDA  02 001e     Load addr G30
   0860: SLDC 00          Short load constant 0
   0861: LDB              Load byte at byte ptr TOS-1 + TOS
   0862: SLDC 04          Short load constant 4
   0863: SBI              Subtract integers (TOS-1 - TOS)
   0864: SLDC 05          Short load constant 5
   0865: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0868: LLA  0002        Load local address MP2
   086a: NOP              No operation
   086b: LSA  05          Load string address: '.CODE'
   0872: EQLSTR           String TOS-1 = TOS
   0874: FJP  $088d       Jump if TOS false
   0876: LDA  02 002e     Load addr G46
   0879: LDA  02 001e     Load addr G30
   087c: LLA  0002        Load local address MP2
   087e: SLDC 01          Short load constant 1
   087f: LDA  02 001e     Load addr G30
   0882: SLDC 00          Short load constant 0
   0883: LDB              Load byte at byte ptr TOS-1 + TOS
   0884: SLDC 05          Short load constant 5
   0885: SBI              Subtract integers (TOS-1 - TOS)
   0886: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0889: LLA  0002        Load local address MP2
   088b: SAS  0f          String assign (TOS to TOS-1, 15 chars)
-> 088d: SLDC 01          Short load constant 1
   088e: STR  02 0010     Store TOS to G16
   0891: SLDO 03          Short load global BASE3
   0892: LDCI 00c0        Load word 192
   0895: SLDC 01          Short load constant 1
   0896: INN              Set membership (TOS-1 in set TOS)
   0897: FJP  $089f       Jump if TOS false
   0899: SLDC 01          Short load constant 1
   089a: SLDO 03          Short load global BASE3
   089b: SLDC 06          Short load constant 6
   089c: EQUI             Integer TOS-1 = TOS
   089d: CGP  02          Call global procedure GETCMD.2
-> 089f: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC11 (* P=11 LL=1 *)
  BASE1
  BASE6
  MP1
BEGIN
-> 08ae: LOD  02 0003     Load word at G3 (OUTPUT)
   08b1: LSA  07          Load string address: 'Execute'
   08ba: NOP              No operation
   08bb: SLDC 00          Short load constant 0
   08bc: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   08bf: LOD  02 0001     Load word at G1 (SYSCOM)
   08c2: INC  001d        Inc field ptr (TOS+29)
   08c4: SLDC 01          Short load constant 1
   08c5: SLDC 04          Short load constant 4
   08c6: LDP              Load packed field (TOS)
   08c7: LNOT             Logical NOT (~TOS)
   08c8: FJP  $08de       Jump if TOS false
   08ca: LOD  02 0003     Load word at G3 (OUTPUT)
   08cd: LSA  0a          Load string address: ' what file'
   08d9: NOP              No operation
   08da: SLDC 00          Short load constant 0
   08db: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 08de: LOD  02 0003     Load word at G3 (OUTPUT)
   08e1: LSA  02          Load string address: '? '
   08e5: NOP              No operation
   08e6: SLDC 00          Short load constant 0
   08e7: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   08ea: LOD  02 0002     Load word at G2 (INPUT)
   08ed: LLA  0001        Load local address MP1
   08ef: LDCI 00ff        Load word 255
   08f2: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   08f5: LOD  02 0002     Load word at G2 (INPUT)
   08f8: CXP  00 15       Call external procedure PASCALSY.FREADLN
   08fb: LLA  0001        Load local address MP1
   08fd: SLDC 00          Short load constant 0
   08fe: LDB              Load byte at byte ptr TOS-1 + TOS
   08ff: SLDC 00          Short load constant 0
   0900: GRTI             Integer TOS-1 > TOS
   0901: FJP  $0944       Jump if TOS false
   0903: LLA  0001        Load local address MP1
   0905: LLA  0001        Load local address MP1
   0907: SLDC 00          Short load constant 0
   0908: LDB              Load byte at byte ptr TOS-1 + TOS
   0909: LDB              Load byte at byte ptr TOS-1 + TOS
   090a: SLDC 2e          Short load constant 46
   090b: EQUI             Integer TOS-1 = TOS
   090c: FJP  $091a       Jump if TOS false
   090e: LLA  0001        Load local address MP1
   0910: LLA  0001        Load local address MP1
   0912: SLDC 00          Short load constant 0
   0913: LDB              Load byte at byte ptr TOS-1 + TOS
   0914: SLDC 01          Short load constant 1
   0915: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0918: UJP  $0930       Unconditional jump
-> 091a: NOP              No operation
   091b: LSA  05          Load string address: '.CODE'
   0922: LLA  0001        Load local address MP1
   0924: LDCI 00ff        Load word 255
   0927: LLA  0001        Load local address MP1
   0929: SLDC 00          Short load constant 0
   092a: LDB              Load byte at byte ptr TOS-1 + TOS
   092b: SLDC 01          Short load constant 1
   092c: ADI              Add integers (TOS + TOS-1)
   092d: CXP  00 18       Call external procedure PASCALSY.SINSERT
-> 0930: LLA  0001        Load local address MP1
   0932: SLDC 00          Short load constant 0
   0933: SLDC 00          Short load constant 0
   0934: SLDC 01          Short load constant 1
   0935: LAO  0006        Load global BASE6
   0937: SLDC 00          Short load constant 0
   0938: SLDC 00          Short load constant 0
   0939: CGP  08          Call global procedure GETCMD.8
   093b: FJP  $0944       Jump if TOS false
   093d: SLDC 04          Short load constant 4
   093e: SRO  0001        Store global word BASE1
   0940: SLDC 05          Short load constant 5
   0941: SLDC 01          Short load constant 1
   0942: CSP  04          Call standard procedure EXIT
-> 0944: RNP  00          Return from nonbase procedure
END

