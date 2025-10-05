#  SYSTEM.PASCAL-03-00.bin 

## Segment Table
| slot |segNum | name | block | length | kind | textAddr | mType | version |
|-----:|------:|------|------:|-------:|------|---------:|-------|--------:|
| 0 | 0 | PASCALSY | 0001 | 3124 | linked | 0000 | 2 | 5 |
| 15 | 15 |  | 0008 | 3362 | linked | 0000 | 0 | 0 |
| 1 | 1 | USERPROG | 000F | 56 | linked | 0000 | 2 | 5 |
| 2 | 2 | FIOPRIMS | 0010 | 808 | linked_intrins | 0000 | 2 | 5 |
| 3 | 3 | PRINTERR | 0012 | 1108 | linked | 0000 | 2 | 5 |
| 4 | 4 | INITIALI | 0015 | 3138 | linked | 0000 | 2 | 5 |
| 5 | 5 | GETCMD | 001C | 5074 | linked | 0000 | 2 | 5 |
| 6 | 6 | FILEPROC | 0026 | 2246 | linked | 0000 | 2 | 5 |

intrinsics: [2]

comment: COPYRIGHT 1979,1980,1983 APPLE COMPUTER, INC. ALL RIGHTS RESERVED

## Globals

G1
G2
G3
G4
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
G252
G312
G328
G340
G381
G382
G383
G384
G385
G386
G387
G388
G389
G390
G391
G392
G393
G394
G395
G396
G436
G440
G444
G448

## Segment PASCALSY (0)

### PROCEDURE PASCALSY.PASCALSY (* P=1 LL=-1 *)
  G54
  G396
  G696
BEGIN
-> 0000: LLA  018c        Load local address MP396
   0003: LLA  02b8        Load local address MP696
   0006: LDCI 0001        Load word 1
   0009: NGI              Negate integer
   000a: CXP  00 03       Call external procedure PASCALSY.FINIT
   000d: LDCN             Load constant NIL
   000e: STL  0036        Store TOS into MP54
   0010: SLDC 01          Short load constant 1
   0011: CSP  26          Call standard procedure UNITCLEAR
   0013: CXP  04 01       Call external procedure INITIALI.INITIALIZE
-> 0016: CBP  30          Call base procedure PASCALSY.48
   0018: LDL  0036        Load local word MP54
   001a: LDCN             Load constant NIL
   001b: NEQI             Integer TOS-1 <> TOS
   001c: FJP  $0021       Jump if TOS false
   001e: CXP  04 01       Call external procedure INITIALI.INITIALIZE
-> 0021: LDL  0036        Load local word MP54
   0023: LDCN             Load constant NIL
   0024: EQUI             Integer TOS-1 = TOS
   0025: FJP  $0016       Jump if TOS false
-> 0027: LLA  018c        Load local address MP396
   002a: SLDC 00          Short load constant 0
   002b: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   002e: XIT              Exit the operating system
END

### PROCEDURE PASCALSY.EXECERROR (* P=2 LL=0 *)
  BASE1
  BASE2
  BASE3
BEGIN
-> 003c: LOD  01 0001     Load word at G1 (SYSCOM)
   003f: SRO  0002        Store global word BASE2
   0041: LDA  01 0002     Load addr G2 (INPUT)
   0044: SLDC 00          Short load constant 0
   0045: IXA  0001        Index array (TOS-1 + TOS * 1)
   0047: LOD  01 003a     Load word at G58
   004a: STO              Store indirect (TOS into TOS-1)
   004b: LDA  01 0002     Load addr G2 (INPUT)
   004e: SLDC 01          Short load constant 1
   004f: IXA  0001        Index array (TOS-1 + TOS * 1)
   0051: LOD  01 0039     Load word at G57
   0054: STO              Store indirect (TOS into TOS-1)
   0055: CSP  22          Call standard procedure IORESULT
   0057: STR  01 000a     Store TOS to G10
   005a: SLDC 03          Short load constant 3
   005b: CSP  26          Call standard procedure UNITCLEAR
   005d: LOD  01 0038     Load word at G56
   0060: CBP  16          Call base procedure PASCALSY.FWRITELN
   0062: CSP  28          Call standard procedure MEMAVAIL
   0064: LDCI 07ec        Load word 2028
   0067: SLDC 32          Short load constant 50
   0068: ADI              Add integers (TOS + TOS-1)
   0069: LEQI             Integer TOS-1 <= TOS
   006a: FJP  $0070       Jump if TOS false
   006c: CLP  33          Call local procedure PASCALSY.51
   006e: UJP  $0097       Unconditional jump
-> 0070: SLDO 02          Short load global BASE2
   0071: SIND 02          Short index load *TOS+2
   0072: SLDC 00          Short load constant 0
   0073: SLDC 00          Short load constant 0
   0074: CBP  2a          Call base procedure PASCALSY.42
   0076: LNOT             Logical NOT (~TOS)
   0077: FJP  $007d       Jump if TOS false
   0079: CLP  33          Call local procedure PASCALSY.51
   007b: UJP  $0097       Unconditional jump
-> 007d: SLDO 02          Short load global BASE2
   007e: SIND 04          Short index load *TOS+4
   007f: SLDC 00          Short load constant 0
   0080: IXA  000d        Index array (TOS-1 + TOS * 13)
   0082: INC  0003        Inc field ptr (TOS+3)
   0084: LDA  01 003f     Load addr G63
   0087: NEQSTR           String TOS-1 <> TOS
   0089: FJP  $008f       Jump if TOS false
   008b: CLP  33          Call local procedure PASCALSY.51
   008d: UJP  $0097       Unconditional jump
-> 008f: SLDO 02          Short load global BASE2
   0090: SIND 01          Short index load *TOS+1
   0091: LOD  01 000a     Load word at G10
   0094: CXP  03 01       Call external procedure PRINTERR.PRINTERROR
-> 0097: CLP  32          Call local procedure PASCALSY.50
   0099: LOD  01 0182     Load word at G386
   009d: LOD  01 0183     Load word at G387
   00a1: LOR              Logical OR (TOS | TOS-1)
   00a2: FJP  $00a7       Jump if TOS false
   00a4: SLDC 01          Short load constant 1
   00a5: CBP  2d          Call base procedure PASCALSY.45
-> 00a7: SLDO 02          Short load global BASE2
   00a8: SIND 01          Short index load *TOS+1
   00a9: LDCI 6962        Load word 26978
   00ac: SLDC 01          Short load constant 1
   00ad: INN              Set membership (TOS-1 in set TOS)
   00ae: SLDO 02          Short load global BASE2
   00af: SIND 01          Short index load *TOS+1
   00b0: SLDC 0a          Short load constant 10
   00b1: EQUI             Integer TOS-1 = TOS
   00b2: LOD  01 000a     Load word at G10
   00b8: LDC  02          Load multiple-word constant
                         001ffffe
   00bc: SLDC 02          Short load constant 2
   00bd: INN              Set membership (TOS-1 in set TOS)
   00be: LAND             Logical AND (TOS & TOS-1)
   00bf: LOR              Logical OR (TOS | TOS-1)
   00c0: FJP  $0103       Jump if TOS false
   00c2: SLDC 01          Short load constant 1
   00c3: SLDC 00          Short load constant 0
   00c4: SLDC 00          Short load constant 0
   00c5: CBP  28          Call base procedure PASCALSY.40
   00c7: LNOT             Logical NOT (~TOS)
   00c8: FJP  $0101       Jump if TOS false
   00ca: SLDC 01          Short load constant 1
   00cb: SRO  0001        Store global word BASE1
   00cd: SLDC 14          Short load constant 20
   00ce: SRO  0003        Store global word BASE3
-> 00d0: SLDO 01          Short load global BASE1
   00d1: SLDO 03          Short load global BASE3
   00d2: LEQI             Integer TOS-1 <= TOS
   00d3: FJP  $00df       Jump if TOS false
   00d5: SLDO 01          Short load global BASE1
   00d6: CSP  26          Call standard procedure UNITCLEAR
   00d8: SLDO 01          Short load global BASE1
   00d9: SLDC 01          Short load constant 1
   00da: ADI              Add integers (TOS + TOS-1)
   00db: SRO  0001        Store global word BASE1
   00dd: UJP  $00d0       Unconditional jump
-> 00df: LDCI 0080        Load word 128
   00e2: SRO  0001        Store global word BASE1
   00e4: LDCI 008f        Load word 143
   00e7: SRO  0003        Store global word BASE3
-> 00e9: SLDO 01          Short load global BASE1
   00ea: SLDO 03          Short load global BASE3
   00eb: LEQI             Integer TOS-1 <= TOS
   00ec: FJP  $00f8       Jump if TOS false
   00ee: SLDO 01          Short load global BASE1
   00ef: CSP  26          Call standard procedure UNITCLEAR
   00f1: SLDO 01          Short load global BASE1
   00f2: SLDC 01          Short load constant 1
   00f3: ADI              Add integers (TOS + TOS-1)
   00f4: SRO  0001        Store global word BASE1
   00f6: UJP  $00e9       Unconditional jump
-> 00f8: LDA  01 0036     Load addr G54
   00fb: CSP  21          Call standard procedure RELEASE
   00fd: SLDC 00          Short load constant 0
   00fe: SLDC 30          Short load constant 48
   00ff: CSP  04          Call standard procedure EXIT
-> 0101: UJP  $012b       Unconditional jump
-> 0103: LOD  01 0003     Load word at G3 (OUTPUT)
   0106: NOP              No operation
   0107: LSA  13          Load string address: 'Press CONTROL-RESET'
   011c: SLDC 00          Short load constant 0
   011d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0120: LOD  01 0003     Load word at G3 (OUTPUT)
   0123: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0126: SLDC 01          Short load constant 1
   0127: FJP  $012b       Jump if TOS false
   0129: UJP  $0126       Unconditional jump
-> 012b: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FINIT(PARAM1; PARAM2; PARAM3) (* P=3 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 013e: SLDO 03          Short load global BASE3
   013f: SRO  0004        Store global word BASE4
   0141: SLDO 04          Short load global BASE4
   0142: INC  0003        Inc field ptr (TOS+3)
   0144: SLDC 00          Short load constant 0
   0145: STO              Store indirect (TOS into TOS-1)
   0146: SLDO 04          Short load global BASE4
   0147: INC  0005        Inc field ptr (TOS+5)
   0149: SLDC 00          Short load constant 0
   014a: STO              Store indirect (TOS into TOS-1)
   014b: SLDO 04          Short load global BASE4
   014c: INC  0002        Inc field ptr (TOS+2)
   014e: SLDC 01          Short load constant 1
   014f: STO              Store indirect (TOS into TOS-1)
   0150: SLDO 04          Short load global BASE4
   0151: INC  0001        Inc field ptr (TOS+1)
   0153: SLDC 01          Short load constant 1
   0154: STO              Store indirect (TOS into TOS-1)
   0155: SLDO 04          Short load global BASE4
   0156: SLDO 02          Short load global BASE2
   0157: STO              Store indirect (TOS into TOS-1)
   0158: SLDO 01          Short load global BASE1
   0159: SLDC 00          Short load constant 0
   015a: EQUI             Integer TOS-1 = TOS
   015b: SLDO 01          Short load global BASE1
   015c: SLDC 02          Short load constant 2
   015d: NGI              Negate integer
   015e: EQUI             Integer TOS-1 = TOS
   015f: LOR              Logical OR (TOS | TOS-1)
   0160: FJP  $0178       Jump if TOS false
   0162: SLDO 04          Short load global BASE4
   0163: SIND 00          Short index load *TOS+0
   0164: SLDC 01          Short load constant 1
   0165: SLDC 00          Short load constant 0
   0166: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0167: SLDO 04          Short load global BASE4
   0168: INC  0004        Inc field ptr (TOS+4)
   016a: SLDC 01          Short load constant 1
   016b: STO              Store indirect (TOS into TOS-1)
   016c: SLDO 01          Short load global BASE1
   016d: SLDC 00          Short load constant 0
   016e: EQUI             Integer TOS-1 = TOS
   016f: FJP  $0176       Jump if TOS false
   0171: SLDO 04          Short load global BASE4
   0172: INC  0003        Inc field ptr (TOS+3)
   0174: SLDC 01          Short load constant 1
   0175: STO              Store indirect (TOS into TOS-1)
-> 0176: UJP  $018e       Unconditional jump
-> 0178: SLDO 01          Short load global BASE1
   0179: SLDC 00          Short load constant 0
   017a: LESI             Integer TOS-1 < TOS
   017b: FJP  $0187       Jump if TOS false
   017d: SLDO 04          Short load global BASE4
   017e: LDCN             Load constant NIL
   017f: STO              Store indirect (TOS into TOS-1)
   0180: SLDO 04          Short load global BASE4
   0181: INC  0004        Inc field ptr (TOS+4)
   0183: SLDC 00          Short load constant 0
   0184: STO              Store indirect (TOS into TOS-1)
   0185: UJP  $018e       Unconditional jump
-> 0187: SLDO 04          Short load global BASE4
   0188: INC  0004        Inc field ptr (TOS+4)
   018a: SLDO 01          Short load global BASE1
   018b: SLDO 01          Short load global BASE1
   018c: ADI              Add integers (TOS + TOS-1)
   018d: STO              Store indirect (TOS into TOS-1)
-> 018e: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FRESET(PARAM1) (* P=4 LL=0 *)
  BASE1=PARAM1
  BASE2
  BASE4
  BASE5
  BASE6
BEGIN
-> 019a: SLDC 01          Short load constant 1
   019b: SLDO 01          Short load global BASE1
   019c: LAO  0002        Load global BASE2
   019e: SLDO 04          Short load global BASE4
   019f: SLDO 05          Short load global BASE5
   01a0: SLDO 06          Short load global BASE6
   01a1: CXP  06 01       Call external procedure FILEPROC.1
-> 01a4: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FOPEN(PARAM1; PARAM2; PARAM3; PARAM4) (* P=5 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
BEGIN
-> 01b0: SLDC 02          Short load constant 2
   01b1: SLDO 04          Short load global BASE4
   01b2: SLDO 03          Short load global BASE3
   01b3: SLDO 02          Short load global BASE2
   01b4: SLDO 01          Short load global BASE1
   01b5: SLDO 05          Short load global BASE5
   01b6: CXP  06 01       Call external procedure FILEPROC.1
-> 01b9: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FCLOSE(PARAM1; PARAM2) (* P=6 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
  BASE5
  BASE6
BEGIN
-> 01c6: SLDC 03          Short load constant 3
   01c7: SLDO 02          Short load global BASE2
   01c8: LAO  0003        Load global BASE3
   01ca: SLDO 05          Short load global BASE5
   01cb: SLDO 06          Short load global BASE6
   01cc: SLDO 01          Short load global BASE1
   01cd: CXP  06 01       Call external procedure FILEPROC.1
-> 01d0: RBP  00          Return from base procedure
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
-> 01dc: LOD  01 0001     Load word at G1 (SYSCOM)
   01df: SLDC 00          Short load constant 0
   01e0: STO              Store indirect (TOS into TOS-1)
   01e1: SLDO 01          Short load global BASE1
   01e2: SRO  000c        Store global word BASE12
   01e4: SLDO 0c          Short load global BASE12
   01e5: SIND 05          Short index load *TOS+5
   01e6: FJP  $0305       Jump if TOS false
   01e8: SLDO 0c          Short load global BASE12
   01e9: IND  000e        Static index and load word (TOS+14)
   01eb: SLDC 00          Short load constant 0
   01ec: GRTI             Integer TOS-1 > TOS
   01ed: FJP  $0201       Jump if TOS false
   01ef: SLDO 0c          Short load global BASE12
   01f0: INC  000e        Inc field ptr (TOS+14)
   01f2: SLDO 0c          Short load global BASE12
   01f3: IND  000e        Static index and load word (TOS+14)
   01f5: SLDC 01          Short load constant 1
   01f6: SBI              Subtract integers (TOS-1 - TOS)
   01f7: STO              Store indirect (TOS into TOS-1)
   01f8: SLDO 0c          Short load global BASE12
   01f9: IND  000e        Static index and load word (TOS+14)
   01fb: SLDC 00          Short load constant 0
   01fc: GRTI             Integer TOS-1 > TOS
   01fd: FJP  $0201       Jump if TOS false
   01ff: UJP  $0314       Unconditional jump
-> 0201: SLDO 0c          Short load global BASE12
   0202: IND  001d        Static index and load word (TOS+29)
   0204: FJP  $0212       Jump if TOS false
   0206: SLDO 01          Short load global BASE1
   0207: SLDC 00          Short load constant 0
   0208: SLDC 00          Short load constant 0
   0209: CXP  02 02       Call external procedure FIOPRIMS.2
   020c: FJP  $0210       Jump if TOS false
   020e: UJP  $030a       Unconditional jump
-> 0210: UJP  $02a6       Unconditional jump
-> 0212: SLDO 0c          Short load global BASE12
   0213: SIND 07          Short index load *TOS+7
   0214: SLDC 01          Short load constant 1
   0215: EQUI             Integer TOS-1 = TOS
   0216: SRO  0009        Store global word BASE9
   0218: SLDO 09          Short load global BASE9
   0219: FJP  $0220       Jump if TOS false
   021b: SLDC 02          Short load constant 2
   021c: SRO  0007        Store global word BASE7
   021e: UJP  $0224       Unconditional jump
-> 0220: SLDO 0c          Short load global BASE12
   0221: SIND 07          Short index load *TOS+7
   0222: SRO  0007        Store global word BASE7
-> 0224: SLDC 01          Short load constant 1
   0225: SRO  000a        Store global word BASE10
   0227: SLDC 20          Short load constant 32
   0228: SRO  000b        Store global word BASE11
   022a: SLDC 00          Short load constant 0
   022b: SRO  0002        Store global word BASE2
-> 022d: SLDO 02          Short load global BASE2
   022e: SLDO 0c          Short load global BASE12
   022f: SIND 04          Short index load *TOS+4
   0230: LESI             Integer TOS-1 < TOS
   0231: SLDO 0a          Short load global BASE10
   0232: LAND             Logical AND (TOS & TOS-1)
   0233: FJP  $02a6       Jump if TOS false
   0235: SLDO 07          Short load global BASE7
   0236: SLDC 06          Short load constant 6
   0237: SLDC 01          Short load constant 1
   0238: INN              Set membership (TOS-1 in set TOS)
   0239: LOD  01 0182     Load word at G386
   023d: LAND             Logical AND (TOS & TOS-1)
   023e: FJP  $0242       Jump if TOS false
   0240: CLP  37          Call local procedure PASCALSY.55
-> 0242: SLDO 07          Short load global BASE7
   0243: SLDC 06          Short load constant 6
   0244: SLDC 01          Short load constant 1
   0245: INN              Set membership (TOS-1 in set TOS)
   0246: LNOT             Logical NOT (~TOS)
   0247: LOD  01 0182     Load word at G386
   024b: LNOT             Logical NOT (~TOS)
   024c: LOR              Logical OR (TOS | TOS-1)
   024d: FJP  $0260       Jump if TOS false
   024f: SLDO 07          Short load global BASE7
   0250: LAO  000b        Load global BASE11
   0252: SLDC 00          Short load constant 0
   0253: SLDC 01          Short load constant 1
   0254: SLDC 00          Short load constant 0
   0255: SLDC 00          Short load constant 0
   0256: CSP  05          Call standard procedure UNITREAD
   0258: CSP  22          Call standard procedure IORESULT
   025a: SLDC 00          Short load constant 0
   025b: NEQI             Integer TOS-1 <> TOS
   025c: FJP  $0260       Jump if TOS false
   025e: UJP  $030a       Unconditional jump
-> 0260: LOD  01 0183     Load word at G387
   0264: FJP  $0269       Jump if TOS false
   0266: SLDO 0b          Short load global BASE11
   0267: CBP  2c          Call base procedure PASCALSY.44
-> 0269: SLDO 09          Short load global BASE9
   026a: FJP  $0282       Jump if TOS false
   026c: SLDO 0b          Short load global BASE11
   026d: LDA  01 0138     Load addr G312
   0271: LDM  10          Load 16 words from (TOS)
   0273: SLDC 10          Short load constant 16
   0274: INN              Set membership (TOS-1 in set TOS)
   0275: LNOT             Logical NOT (~TOS)
   0276: FJP  $0282       Jump if TOS false
   0278: SLDO 0c          Short load global BASE12
   0279: SIND 07          Short index load *TOS+7
   027a: LAO  000b        Load global BASE11
   027c: SLDC 00          Short load constant 0
   027d: SLDC 01          Short load constant 1
   027e: SLDC 00          Short load constant 0
   027f: SLDC 00          Short load constant 0
   0280: CSP  06          Call standard procedure UNITWRITE
-> 0282: SLDO 0b          Short load global BASE11
   0283: LOD  01 0001     Load word at G1 (SYSCOM)
   0286: INC  0029        Inc field ptr (TOS+41)
   0288: SLDC 08          Short load constant 8
   0289: SLDC 00          Short load constant 0
   028a: LDP              Load packed field (TOS)
   028b: EQUI             Integer TOS-1 = TOS
   028c: FJP  $029a       Jump if TOS false
   028e: SLDO 0c          Short load global BASE12
   028f: SIND 07          Short index load *TOS+7
   0290: SLDC 01          Short load constant 1
   0291: EQUI             Integer TOS-1 = TOS
   0292: FJP  $0297       Jump if TOS false
   0294: SLDC 00          Short load constant 0
   0295: SRO  000b        Store global word BASE11
-> 0297: SLDC 00          Short load constant 0
   0298: SRO  000a        Store global word BASE10
-> 029a: SLDO 0c          Short load global BASE12
   029b: SIND 00          Short index load *TOS+0
   029c: SLDO 02          Short load global BASE2
   029d: SLDO 0b          Short load global BASE11
   029e: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   029f: SLDO 02          Short load global BASE2
   02a0: SLDC 01          Short load constant 1
   02a1: ADI              Add integers (TOS + TOS-1)
   02a2: SRO  0002        Store global word BASE2
   02a4: UJP  $022d       Unconditional jump
-> 02a6: SLDO 0c          Short load global BASE12
   02a7: SIND 04          Short index load *TOS+4
   02a8: SLDC 01          Short load constant 1
   02a9: EQUI             Integer TOS-1 = TOS
   02aa: FJP  $0303       Jump if TOS false
   02ac: SLDO 0c          Short load global BASE12
   02ad: INC  0001        Inc field ptr (TOS+1)
   02af: SLDC 00          Short load constant 0
   02b0: STO              Store indirect (TOS into TOS-1)
   02b1: SLDO 0c          Short load global BASE12
   02b2: SIND 03          Short index load *TOS+3
   02b3: SLDC 00          Short load constant 0
   02b4: NEQI             Integer TOS-1 <> TOS
   02b5: FJP  $02bc       Jump if TOS false
   02b7: SLDO 0c          Short load global BASE12
   02b8: INC  0003        Inc field ptr (TOS+3)
   02ba: SLDC 02          Short load constant 2
   02bb: STO              Store indirect (TOS into TOS-1)
-> 02bc: SLDO 0c          Short load global BASE12
   02bd: SIND 00          Short index load *TOS+0
   02be: SLDC 00          Short load constant 0
   02bf: LDB              Load byte at byte ptr TOS-1 + TOS
   02c0: SLDC 0d          Short load constant 13
   02c1: EQUI             Integer TOS-1 = TOS
   02c2: FJP  $02d0       Jump if TOS false
   02c4: SLDO 0c          Short load global BASE12
   02c5: SIND 00          Short index load *TOS+0
   02c6: SLDC 00          Short load constant 0
   02c7: SLDC 20          Short load constant 32
   02c8: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   02c9: SLDO 0c          Short load global BASE12
   02ca: INC  0001        Inc field ptr (TOS+1)
   02cc: SLDC 01          Short load constant 1
   02cd: STO              Store indirect (TOS into TOS-1)
   02ce: UJP  $0314       Unconditional jump
-> 02d0: SLDO 0c          Short load global BASE12
   02d1: SIND 07          Short index load *TOS+7
   02d2: SLDC 02          Short load constant 2
   02d3: GRTI             Integer TOS-1 > TOS
   02d4: FJP  $02e0       Jump if TOS false
   02d6: SLDO 01          Short load global BASE1
   02d7: SLDC 00          Short load constant 0
   02d8: SLDC 00          Short load constant 0
   02d9: CXP  02 03       Call external procedure FIOPRIMS.3
   02dc: FJP  $02e0       Jump if TOS false
   02de: UJP  $0314       Unconditional jump
-> 02e0: SLDO 0c          Short load global BASE12
   02e1: SIND 00          Short index load *TOS+0
   02e2: SLDC 00          Short load constant 0
   02e3: LDB              Load byte at byte ptr TOS-1 + TOS
   02e4: SLDC 00          Short load constant 0
   02e5: EQUI             Integer TOS-1 = TOS
   02e6: FJP  $0303       Jump if TOS false
   02e8: SLDO 0c          Short load global BASE12
   02e9: IND  001d        Static index and load word (TOS+29)
   02eb: SLDO 0c          Short load global BASE12
   02ec: INC  0012        Inc field ptr (TOS+18)
   02ee: SLDC 04          Short load constant 4
   02ef: SLDC 00          Short load constant 0
   02f0: LDP              Load packed field (TOS)
   02f1: SLDC 03          Short load constant 3
   02f2: EQUI             Integer TOS-1 = TOS
   02f3: LAND             Logical AND (TOS & TOS-1)
   02f4: FJP  $02fc       Jump if TOS false
   02f6: SLDO 01          Short load global BASE1
   02f7: CXP  02 04       Call external procedure FIOPRIMS.4
   02fa: UJP  $0303       Unconditional jump
-> 02fc: SLDO 0c          Short load global BASE12
   02fd: SIND 00          Short index load *TOS+0
   02fe: SLDC 00          Short load constant 0
   02ff: SLDC 20          Short load constant 32
   0300: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0301: UJP  $030a       Unconditional jump
-> 0303: UJP  $0314       Unconditional jump
-> 0305: LOD  01 0001     Load word at G1 (SYSCOM)
   0308: SLDC 0d          Short load constant 13
   0309: STO              Store indirect (TOS into TOS-1)
-> 030a: SLDO 0c          Short load global BASE12
   030b: INC  0002        Inc field ptr (TOS+2)
   030d: SLDC 01          Short load constant 1
   030e: STO              Store indirect (TOS into TOS-1)
   030f: SLDO 0c          Short load global BASE12
   0310: INC  0001        Inc field ptr (TOS+1)
   0312: SLDC 01          Short load constant 1
   0313: STO              Store indirect (TOS into TOS-1)
-> 0314: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FPUT(PARAM1) (* P=8 LL=0 *)
  BASE1=PARAM1
  BASE7
BEGIN
-> 032a: LOD  01 0001     Load word at G1 (SYSCOM)
   032d: SLDC 00          Short load constant 0
   032e: STO              Store indirect (TOS into TOS-1)
   032f: SLDO 01          Short load global BASE1
   0330: SRO  0007        Store global word BASE7
   0332: SLDO 07          Short load global BASE7
   0333: SIND 05          Short index load *TOS+5
   0334: FJP  $035c       Jump if TOS false
   0336: SLDO 07          Short load global BASE7
   0337: IND  001d        Static index and load word (TOS+29)
   0339: FJP  $0347       Jump if TOS false
   033b: SLDO 01          Short load global BASE1
   033c: SLDC 00          Short load constant 0
   033d: SLDC 00          Short load constant 0
   033e: CXP  02 05       Call external procedure FIOPRIMS.5
   0341: FJP  $0345       Jump if TOS false
   0343: UJP  $0361       Unconditional jump
-> 0345: UJP  $035a       Unconditional jump
-> 0347: SLDO 07          Short load global BASE7
   0348: SIND 07          Short index load *TOS+7
   0349: SLDO 07          Short load global BASE7
   034a: SIND 00          Short index load *TOS+0
   034b: SLDC 00          Short load constant 0
   034c: SLDO 07          Short load global BASE7
   034d: SIND 04          Short index load *TOS+4
   034e: SLDC 00          Short load constant 0
   034f: SLDC 00          Short load constant 0
   0350: CSP  06          Call standard procedure UNITWRITE
   0352: CSP  22          Call standard procedure IORESULT
   0354: SLDC 00          Short load constant 0
   0355: NEQI             Integer TOS-1 <> TOS
   0356: FJP  $035a       Jump if TOS false
   0358: UJP  $0361       Unconditional jump
-> 035a: UJP  $036b       Unconditional jump
-> 035c: LOD  01 0001     Load word at G1 (SYSCOM)
   035f: SLDC 0d          Short load constant 13
   0360: STO              Store indirect (TOS into TOS-1)
-> 0361: SLDO 07          Short load global BASE7
   0362: INC  0002        Inc field ptr (TOS+2)
   0364: SLDC 01          Short load constant 1
   0365: STO              Store indirect (TOS into TOS-1)
   0366: SLDO 07          Short load global BASE7
   0367: INC  0001        Inc field ptr (TOS+1)
   0369: SLDC 01          Short load constant 1
   036a: STO              Store indirect (TOS into TOS-1)
-> 036b: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XSEEK (* P=9 LL=0 *)
BEGIN
-> 0378: LOD  01 0001     Load word at G1 (SYSCOM)
   037b: INC  0001        Inc field ptr (TOS+1)
   037d: SLDC 0b          Short load constant 11
   037e: STO              Store indirect (TOS into TOS-1)
   037f: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 0381: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FEOF(PARAM1): RETVAL (* P=10 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
BEGIN
-> 038e: SLDO 03          Short load global BASE3
   038f: SIND 02          Short index load *TOS+2
   0390: SRO  0001        Store global word BASE1
-> 0392: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FEOLN(PARAM1): RETVAL (* P=11 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
BEGIN
-> 039e: SLDO 03          Short load global BASE3
   039f: SIND 01          Short index load *TOS+1
   03a0: SRO  0001        Store global word BASE1
-> 03a2: RBP  01          Return from base procedure
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
-> 03ae: SLDO 02          Short load global BASE2
   03af: SRO  0030        Store global word BASE48
   03b1: LDO  0030        Load global word BASE48
   03b3: SIND 07          Short index load *TOS+7
   03b4: SLDC 01          Short load constant 1
   03b5: EQUI             Integer TOS-1 = TOS
   03b6: FJP  $03bf       Jump if TOS false
   03b8: LAO  0007        Load global BASE7
   03ba: SLDC 00          Short load constant 0
   03bb: SLDC 51          Short load constant 81
   03bc: SLDC 50          Short load constant 80
   03bd: CSP  0a          Call standard procedure FLCH
-> 03bf: SLDO 01          Short load global BASE1
   03c0: SLDC 00          Short load constant 0
   03c1: STO              Store indirect (TOS into TOS-1)
   03c2: SLDC 00          Short load constant 0
   03c3: SRO  0005        Store global word BASE5
   03c5: SLDC 00          Short load constant 0
   03c6: SRO  0004        Store global word BASE4
   03c8: LDO  0030        Load global word BASE48
   03ca: SIND 03          Short index load *TOS+3
   03cb: SLDC 01          Short load constant 1
   03cc: EQUI             Integer TOS-1 = TOS
   03cd: FJP  $03d2       Jump if TOS false
   03cf: SLDO 02          Short load global BASE2
   03d0: CBP  07          Call base procedure PASCALSY.FGET
-> 03d2: LDO  0030        Load global word BASE48
   03d4: SIND 00          Short index load *TOS+0
   03d5: SLDC 00          Short load constant 0
   03d6: LDB              Load byte at byte ptr TOS-1 + TOS
   03d7: SLDC 20          Short load constant 32
   03d8: EQUI             Integer TOS-1 = TOS
   03d9: LDO  0030        Load global word BASE48
   03db: SIND 02          Short index load *TOS+2
   03dc: LNOT             Logical NOT (~TOS)
   03dd: LAND             Logical AND (TOS & TOS-1)
   03de: FJP  $03e5       Jump if TOS false
   03e0: SLDO 02          Short load global BASE2
   03e1: CBP  07          Call base procedure PASCALSY.FGET
   03e3: UJP  $03d2       Unconditional jump
-> 03e5: LDO  0030        Load global word BASE48
   03e7: SIND 02          Short index load *TOS+2
   03e8: FJP  $03ec       Jump if TOS false
   03ea: UJP  $048e       Unconditional jump
-> 03ec: LDO  0030        Load global word BASE48
   03ee: SIND 00          Short index load *TOS+0
   03ef: SLDC 00          Short load constant 0
   03f0: LDB              Load byte at byte ptr TOS-1 + TOS
   03f1: SRO  0003        Store global word BASE3
   03f3: SLDO 03          Short load global BASE3
   03f4: SLDC 2b          Short load constant 43
   03f5: EQUI             Integer TOS-1 = TOS
   03f6: SLDO 03          Short load global BASE3
   03f7: SLDC 2d          Short load constant 45
   03f8: EQUI             Integer TOS-1 = TOS
   03f9: LOR              Logical OR (TOS | TOS-1)
   03fa: FJP  $0410       Jump if TOS false
   03fc: SLDC 02          Short load constant 2
   03fd: SRO  0006        Store global word BASE6
   03ff: SLDO 03          Short load global BASE3
   0400: SLDC 2d          Short load constant 45
   0401: EQUI             Integer TOS-1 = TOS
   0402: SRO  0005        Store global word BASE5
   0404: SLDO 02          Short load global BASE2
   0405: CBP  07          Call base procedure PASCALSY.FGET
   0407: LDO  0030        Load global word BASE48
   0409: SIND 00          Short index load *TOS+0
   040a: SLDC 00          Short load constant 0
   040b: LDB              Load byte at byte ptr TOS-1 + TOS
   040c: SRO  0003        Store global word BASE3
   040e: UJP  $0413       Unconditional jump
-> 0410: SLDC 01          Short load constant 1
   0411: SRO  0006        Store global word BASE6
-> 0413: SLDO 03          Short load global BASE3
   0414: LDA  01 007a     Load addr G122
   0417: LDM  04          Load 4 words from (TOS)
   0419: SLDC 04          Short load constant 4
   041a: INN              Set membership (TOS-1 in set TOS)
   041b: FJP  $0476       Jump if TOS false
   041d: SLDC 01          Short load constant 1
   041e: SRO  0004        Store global word BASE4
-> 0420: SLDO 01          Short load global BASE1
   0421: SLDO 01          Short load global BASE1
   0422: SIND 00          Short index load *TOS+0
   0423: SLDC 0a          Short load constant 10
   0424: MPI              Multiply integers (TOS * TOS-1)
   0425: SLDO 03          Short load global BASE3
   0426: ADI              Add integers (TOS + TOS-1)
   0427: SLDC 30          Short load constant 48
   0428: SBI              Subtract integers (TOS-1 - TOS)
   0429: STO              Store indirect (TOS into TOS-1)
   042a: SLDO 02          Short load global BASE2
   042b: CBP  07          Call base procedure PASCALSY.FGET
   042d: LDO  0030        Load global word BASE48
   042f: SIND 00          Short index load *TOS+0
   0430: SLDC 00          Short load constant 0
   0431: LDB              Load byte at byte ptr TOS-1 + TOS
   0432: SRO  0003        Store global word BASE3
   0434: SLDO 06          Short load global BASE6
   0435: SLDC 01          Short load constant 1
   0436: ADI              Add integers (TOS + TOS-1)
   0437: SRO  0006        Store global word BASE6
   0439: LDO  0030        Load global word BASE48
   043b: SIND 07          Short index load *TOS+7
   043c: SLDC 01          Short load constant 1
   043d: EQUI             Integer TOS-1 = TOS
   043e: FJP  $0467       Jump if TOS false
-> 0440: SLDO 03          Short load global BASE3
   0441: LAO  0006        Load global BASE6
   0443: LAO  0007        Load global BASE7
   0445: SLDC 00          Short load constant 0
   0446: SLDC 00          Short load constant 0
   0447: CBP  35          Call base procedure PASCALSY.53
   0449: FJP  $0467       Jump if TOS false
   044b: SLDO 06          Short load global BASE6
   044c: SLDC 01          Short load constant 1
   044d: EQUI             Integer TOS-1 = TOS
   044e: FJP  $0455       Jump if TOS false
   0450: SLDO 01          Short load global BASE1
   0451: SLDC 00          Short load constant 0
   0452: STO              Store indirect (TOS into TOS-1)
   0453: UJP  $045b       Unconditional jump
-> 0455: SLDO 01          Short load global BASE1
   0456: SLDO 01          Short load global BASE1
   0457: SIND 00          Short index load *TOS+0
   0458: SLDC 0a          Short load constant 10
   0459: DVI              Divide integers (TOS-1 / TOS)
   045a: STO              Store indirect (TOS into TOS-1)
-> 045b: SLDO 02          Short load global BASE2
   045c: CBP  07          Call base procedure PASCALSY.FGET
   045e: LDO  0030        Load global word BASE48
   0460: SIND 00          Short index load *TOS+0
   0461: SLDC 00          Short load constant 0
   0462: LDB              Load byte at byte ptr TOS-1 + TOS
   0463: SRO  0003        Store global word BASE3
   0465: UJP  $0440       Unconditional jump
-> 0467: SLDO 03          Short load global BASE3
   0468: LDA  01 007a     Load addr G122
   046b: LDM  04          Load 4 words from (TOS)
   046d: SLDC 04          Short load constant 4
   046e: INN              Set membership (TOS-1 in set TOS)
   046f: LNOT             Logical NOT (~TOS)
   0470: LDO  0030        Load global word BASE48
   0472: SIND 01          Short index load *TOS+1
   0473: LOR              Logical OR (TOS | TOS-1)
   0474: FJP  $0420       Jump if TOS false
-> 0476: SLDO 04          Short load global BASE4
   0477: LDO  0030        Load global word BASE48
   0479: SIND 02          Short index load *TOS+2
   047a: LOR              Logical OR (TOS | TOS-1)
   047b: FJP  $0489       Jump if TOS false
   047d: SLDO 05          Short load global BASE5
   047e: FJP  $0487       Jump if TOS false
   0480: SLDO 01          Short load global BASE1
   0481: SLDO 01          Short load global BASE1
   0482: SIND 00          Short index load *TOS+0
   0483: NGI              Negate integer
   0484: STO              Store indirect (TOS into TOS-1)
   0485: UJP  $0487       Unconditional jump
-> 0487: UJP  $048e       Unconditional jump
-> 0489: LOD  01 0001     Load word at G1 (SYSCOM)
   048c: SLDC 0e          Short load constant 14
   048d: STO              Store indirect (TOS into TOS-1)
-> 048e: RBP  00          Return from base procedure
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
-> 04a2: SLDC 01          Short load constant 1
   04a3: SRO  0004        Store global word BASE4
   04a5: LAO  0008        Load global BASE8
   04a7: SLDC 00          Short load constant 0
   04a8: SLDC 0a          Short load constant 10
   04a9: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   04aa: SLDC 01          Short load constant 1
   04ab: SRO  0007        Store global word BASE7
   04ad: SLDO 02          Short load global BASE2
   04ae: SLDC 00          Short load constant 0
   04af: LESI             Integer TOS-1 < TOS
   04b0: FJP  $04d9       Jump if TOS false
   04b2: SLDO 02          Short load global BASE2
   04b3: LDCI 7fff        Load word 32767
   04b6: NGI              Negate integer
   04b7: SLDC 01          Short load constant 1
   04b8: SBI              Subtract integers (TOS-1 - TOS)
   04b9: EQUI             Integer TOS-1 = TOS
   04ba: FJP  $04cd       Jump if TOS false
   04bc: LAO  0008        Load global BASE8
   04be: NOP              No operation
   04bf: LSA  06          Load string address: '-32768'
   04c7: SAS  0a          String assign (TOS to TOS-1, 10 chars)
   04c9: UJP  $0529       Unconditional jump
   04cb: UJP  $04d9       Unconditional jump
-> 04cd: SLDO 02          Short load global BASE2
   04ce: ABI              Absolute value of integer (TOS)
   04cf: SRO  0002        Store global word BASE2
   04d1: LAO  0008        Load global BASE8
   04d3: SLDC 01          Short load constant 1
   04d4: SLDC 2d          Short load constant 45
   04d5: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   04d6: SLDC 02          Short load constant 2
   04d7: SRO  0004        Store global word BASE4
-> 04d9: SLDC 04          Short load constant 4
   04da: SRO  0005        Store global word BASE5
   04dc: SLDC 00          Short load constant 0
   04dd: SRO  000e        Store global word BASE14
-> 04df: SLDO 05          Short load global BASE5
   04e0: SLDO 0e          Short load global BASE14
   04e1: GEQI             Integer TOS-1 >= TOS
   04e2: FJP  $0522       Jump if TOS false
   04e4: SLDO 02          Short load global BASE2
   04e5: LDA  01 006f     Load addr G111
   04e8: SLDO 05          Short load global BASE5
   04e9: IXA  0001        Index array (TOS-1 + TOS * 1)
   04eb: SIND 00          Short index load *TOS+0
   04ec: DVI              Divide integers (TOS-1 / TOS)
   04ed: SLDC 30          Short load constant 48
   04ee: ADI              Add integers (TOS + TOS-1)
   04ef: SRO  0006        Store global word BASE6
   04f1: SLDO 06          Short load global BASE6
   04f2: SLDC 30          Short load constant 48
   04f3: EQUI             Integer TOS-1 = TOS
   04f4: SLDO 05          Short load global BASE5
   04f5: SLDC 00          Short load constant 0
   04f6: GRTI             Integer TOS-1 > TOS
   04f7: LAND             Logical AND (TOS & TOS-1)
   04f8: SLDO 07          Short load global BASE7
   04f9: LAND             Logical AND (TOS & TOS-1)
   04fa: FJP  $04fe       Jump if TOS false
   04fc: UJP  $051b       Unconditional jump
-> 04fe: SLDC 00          Short load constant 0
   04ff: SRO  0007        Store global word BASE7
   0501: LAO  0008        Load global BASE8
   0503: SLDO 04          Short load global BASE4
   0504: SLDO 06          Short load global BASE6
   0505: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0506: SLDO 04          Short load global BASE4
   0507: SLDC 01          Short load constant 1
   0508: ADI              Add integers (TOS + TOS-1)
   0509: SRO  0004        Store global word BASE4
   050b: SLDO 06          Short load global BASE6
   050c: SLDC 30          Short load constant 48
   050d: NEQI             Integer TOS-1 <> TOS
   050e: FJP  $051b       Jump if TOS false
   0510: SLDO 02          Short load global BASE2
   0511: LDA  01 006f     Load addr G111
   0514: SLDO 05          Short load global BASE5
   0515: IXA  0001        Index array (TOS-1 + TOS * 1)
   0517: SIND 00          Short index load *TOS+0
   0518: MODI             Modulo integers (TOS-1 % TOS)
   0519: SRO  0002        Store global word BASE2
-> 051b: SLDO 05          Short load global BASE5
   051c: SLDC 01          Short load constant 1
   051d: SBI              Subtract integers (TOS-1 - TOS)
   051e: SRO  0005        Store global word BASE5
   0520: UJP  $04df       Unconditional jump
-> 0522: LAO  0008        Load global BASE8
   0524: SLDC 00          Short load constant 0
   0525: SLDO 04          Short load global BASE4
   0526: SLDC 01          Short load constant 1
   0527: SBI              Subtract integers (TOS-1 - TOS)
   0528: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0529: SLDO 01          Short load global BASE1
   052a: LAO  0008        Load global BASE8
   052c: SLDC 00          Short load constant 0
   052d: LDB              Load byte at byte ptr TOS-1 + TOS
   052e: LESI             Integer TOS-1 < TOS
   052f: FJP  $0537       Jump if TOS false
   0531: LAO  0008        Load global BASE8
   0533: SLDC 00          Short load constant 0
   0534: LDB              Load byte at byte ptr TOS-1 + TOS
   0535: SRO  0001        Store global word BASE1
-> 0537: SLDO 03          Short load global BASE3
   0538: LAO  0008        Load global BASE8
   053a: SLDO 01          Short load global BASE1
   053b: CBP  13          Call base procedure PASCALSY.FWRITESTRING
-> 053d: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XREADREAL (* P=14 LL=0 *)
BEGIN
-> 054c: LOD  01 0001     Load word at G1 (SYSCOM)
   054f: INC  0001        Inc field ptr (TOS+1)
   0551: SLDC 0b          Short load constant 11
   0552: STO              Store indirect (TOS into TOS-1)
   0553: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 0555: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XWRITEREAL (* P=15 LL=0 *)
BEGIN
-> 0562: LOD  01 0001     Load word at G1 (SYSCOM)
   0565: INC  0001        Inc field ptr (TOS+1)
   0567: SLDC 0b          Short load constant 11
   0568: STO              Store indirect (TOS into TOS-1)
   0569: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 056b: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADCHAR(PARAM1; PARAM2) (* P=16 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0578: SLDO 02          Short load global BASE2
   0579: SRO  0003        Store global word BASE3
   057b: LOD  01 0001     Load word at G1 (SYSCOM)
   057e: SLDC 00          Short load constant 0
   057f: STO              Store indirect (TOS into TOS-1)
   0580: SLDO 03          Short load global BASE3
   0581: SIND 03          Short index load *TOS+3
   0582: SLDC 01          Short load constant 1
   0583: EQUI             Integer TOS-1 = TOS
   0584: FJP  $0589       Jump if TOS false
   0586: SLDO 02          Short load global BASE2
   0587: CBP  07          Call base procedure PASCALSY.FGET
-> 0589: SLDO 01          Short load global BASE1
   058a: SLDO 03          Short load global BASE3
   058b: SIND 00          Short index load *TOS+0
   058c: SLDC 00          Short load constant 0
   058d: LDB              Load byte at byte ptr TOS-1 + TOS
   058e: STO              Store indirect (TOS into TOS-1)
   058f: SLDO 03          Short load global BASE3
   0590: SIND 03          Short index load *TOS+3
   0591: SLDC 00          Short load constant 0
   0592: EQUI             Integer TOS-1 = TOS
   0593: FJP  $059a       Jump if TOS false
   0595: SLDO 02          Short load global BASE2
   0596: CBP  07          Call base procedure PASCALSY.FGET
   0598: UJP  $059f       Unconditional jump
-> 059a: SLDO 03          Short load global BASE3
   059b: INC  0003        Inc field ptr (TOS+3)
   059d: SLDC 01          Short load constant 1
   059e: STO              Store indirect (TOS into TOS-1)
-> 059f: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITECHAR(PARAM1; PARAM2; PARAM3) (* P=17 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 05ac: SLDO 03          Short load global BASE3
   05ad: SRO  0004        Store global word BASE4
   05af: SLDO 04          Short load global BASE4
   05b0: SIND 05          Short index load *TOS+5
   05b1: FJP  $05d1       Jump if TOS false
-> 05b3: SLDO 01          Short load global BASE1
   05b4: SLDC 01          Short load constant 1
   05b5: GRTI             Integer TOS-1 > TOS
   05b6: FJP  $05c7       Jump if TOS false
   05b8: SLDO 04          Short load global BASE4
   05b9: SIND 00          Short index load *TOS+0
   05ba: SLDC 00          Short load constant 0
   05bb: SLDC 20          Short load constant 32
   05bc: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   05bd: SLDO 03          Short load global BASE3
   05be: CBP  08          Call base procedure PASCALSY.FPUT
   05c0: SLDO 01          Short load global BASE1
   05c1: SLDC 01          Short load constant 1
   05c2: SBI              Subtract integers (TOS-1 - TOS)
   05c3: SRO  0001        Store global word BASE1
   05c5: UJP  $05b3       Unconditional jump
-> 05c7: SLDO 04          Short load global BASE4
   05c8: SIND 00          Short index load *TOS+0
   05c9: SLDC 00          Short load constant 0
   05ca: SLDO 02          Short load global BASE2
   05cb: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   05cc: SLDO 03          Short load global BASE3
   05cd: CBP  08          Call base procedure PASCALSY.FPUT
   05cf: UJP  $05d6       Unconditional jump
-> 05d1: LOD  01 0001     Load word at G1 (SYSCOM)
   05d4: SLDC 0d          Short load constant 13
   05d5: STO              Store indirect (TOS into TOS-1)
-> 05d6: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADSTRING(PARAM1; PARAM2; PARAM3) (* P=18 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 05e4: SLDO 03          Short load global BASE3
   05e5: SRO  0006        Store global word BASE6
   05e7: SLDC 01          Short load constant 1
   05e8: SRO  0004        Store global word BASE4
   05ea: SLDO 06          Short load global BASE6
   05eb: SIND 03          Short index load *TOS+3
   05ec: SLDC 01          Short load constant 1
   05ed: EQUI             Integer TOS-1 = TOS
   05ee: FJP  $05f3       Jump if TOS false
   05f0: SLDO 03          Short load global BASE3
   05f1: CBP  07          Call base procedure PASCALSY.FGET
-> 05f3: SLDO 02          Short load global BASE2
   05f4: SLDC 00          Short load constant 0
   05f5: SLDO 01          Short load global BASE1
   05f6: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 05f7: SLDO 04          Short load global BASE4
   05f8: SLDO 01          Short load global BASE1
   05f9: LEQI             Integer TOS-1 <= TOS
   05fa: SLDO 06          Short load global BASE6
   05fb: SIND 01          Short index load *TOS+1
   05fc: SLDO 06          Short load global BASE6
   05fd: SIND 02          Short index load *TOS+2
   05fe: LOR              Logical OR (TOS | TOS-1)
   05ff: LNOT             Logical NOT (~TOS)
   0600: LAND             Logical AND (TOS & TOS-1)
   0601: FJP  $0634       Jump if TOS false
   0603: SLDO 06          Short load global BASE6
   0604: SIND 00          Short index load *TOS+0
   0605: SLDC 00          Short load constant 0
   0606: LDB              Load byte at byte ptr TOS-1 + TOS
   0607: SRO  0005        Store global word BASE5
   0609: SLDO 06          Short load global BASE6
   060a: SIND 07          Short index load *TOS+7
   060b: SLDC 01          Short load constant 1
   060c: EQUI             Integer TOS-1 = TOS
   060d: FJP  $0626       Jump if TOS false
   060f: SLDO 05          Short load global BASE5
   0610: LAO  0004        Load global BASE4
   0612: SLDO 02          Short load global BASE2
   0613: SLDC 00          Short load constant 0
   0614: SLDC 00          Short load constant 0
   0615: CBP  35          Call base procedure PASCALSY.53
   0617: FJP  $061b       Jump if TOS false
   0619: UJP  $0624       Unconditional jump
-> 061b: SLDO 02          Short load global BASE2
   061c: SLDO 04          Short load global BASE4
   061d: SLDO 05          Short load global BASE5
   061e: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   061f: SLDO 04          Short load global BASE4
   0620: SLDC 01          Short load constant 1
   0621: ADI              Add integers (TOS + TOS-1)
   0622: SRO  0004        Store global word BASE4
-> 0624: UJP  $062f       Unconditional jump
-> 0626: SLDO 02          Short load global BASE2
   0627: SLDO 04          Short load global BASE4
   0628: SLDO 05          Short load global BASE5
   0629: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   062a: SLDO 04          Short load global BASE4
   062b: SLDC 01          Short load constant 1
   062c: ADI              Add integers (TOS + TOS-1)
   062d: SRO  0004        Store global word BASE4
-> 062f: SLDO 03          Short load global BASE3
   0630: CBP  07          Call base procedure PASCALSY.FGET
   0632: UJP  $05f7       Unconditional jump
-> 0634: SLDO 02          Short load global BASE2
   0635: SLDC 00          Short load constant 0
   0636: SLDO 04          Short load global BASE4
   0637: SLDC 01          Short load constant 1
   0638: SBI              Subtract integers (TOS-1 - TOS)
   0639: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 063a: SLDO 06          Short load global BASE6
   063b: SIND 01          Short index load *TOS+1
   063c: LNOT             Logical NOT (~TOS)
   063d: FJP  $0644       Jump if TOS false
   063f: SLDO 03          Short load global BASE3
   0640: CBP  07          Call base procedure PASCALSY.FGET
   0642: UJP  $063a       Unconditional jump
-> 0644: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITESTRING(PARAM1; PARAM2; PARAM3) (* P=19 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 0654: SLDO 01          Short load global BASE1
   0655: SLDC 00          Short load constant 0
   0656: LEQI             Integer TOS-1 <= TOS
   0657: FJP  $065e       Jump if TOS false
   0659: SLDO 02          Short load global BASE2
   065a: SLDC 00          Short load constant 0
   065b: LDB              Load byte at byte ptr TOS-1 + TOS
   065c: SRO  0001        Store global word BASE1
-> 065e: SLDO 03          Short load global BASE3
   065f: SLDO 02          Short load global BASE2
   0660: SLDC 01          Short load constant 1
   0661: ADI              Add integers (TOS + TOS-1)
   0662: SLDO 01          Short load global BASE1
   0663: SLDO 02          Short load global BASE2
   0664: SLDC 00          Short load constant 0
   0665: LDB              Load byte at byte ptr TOS-1 + TOS
   0666: CBP  14          Call base procedure PASCALSY.FWRITEBYTES
-> 0668: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITEBYTES(PARAM1; PARAM2; PARAM3; PARAM4) (* P=20 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
  BASE6
BEGIN
-> 0674: LOD  01 0001     Load word at G1 (SYSCOM)
   0677: SLDC 00          Short load constant 0
   0678: STO              Store indirect (TOS into TOS-1)
   0679: SLDO 04          Short load global BASE4
   067a: SRO  0006        Store global word BASE6
   067c: SLDO 06          Short load global BASE6
   067d: SIND 05          Short index load *TOS+5
   067e: FJP  $06be       Jump if TOS false
   0680: SLDO 02          Short load global BASE2
   0681: SLDO 01          Short load global BASE1
   0682: GRTI             Integer TOS-1 > TOS
   0683: FJP  $068f       Jump if TOS false
   0685: SLDO 04          Short load global BASE4
   0686: SLDC 20          Short load constant 32
   0687: SLDO 02          Short load global BASE2
   0688: SLDO 01          Short load global BASE1
   0689: SBI              Subtract integers (TOS-1 - TOS)
   068a: CBP  11          Call base procedure PASCALSY.FWRITECHAR
   068c: SLDO 01          Short load global BASE1
   068d: SRO  0002        Store global word BASE2
-> 068f: SLDO 06          Short load global BASE6
   0690: IND  001d        Static index and load word (TOS+29)
   0692: FJP  $06b3       Jump if TOS false
   0694: SLDC 00          Short load constant 0
   0695: SRO  0005        Store global word BASE5
-> 0697: SLDO 05          Short load global BASE5
   0698: SLDO 02          Short load global BASE2
   0699: LESI             Integer TOS-1 < TOS
   069a: SLDO 06          Short load global BASE6
   069b: SIND 02          Short index load *TOS+2
   069c: LNOT             Logical NOT (~TOS)
   069d: LAND             Logical AND (TOS & TOS-1)
   069e: FJP  $06b1       Jump if TOS false
   06a0: SLDO 06          Short load global BASE6
   06a1: SIND 00          Short index load *TOS+0
   06a2: SLDC 00          Short load constant 0
   06a3: SLDO 03          Short load global BASE3
   06a4: SLDO 05          Short load global BASE5
   06a5: LDB              Load byte at byte ptr TOS-1 + TOS
   06a6: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   06a7: SLDO 04          Short load global BASE4
   06a8: CBP  08          Call base procedure PASCALSY.FPUT
   06aa: SLDO 05          Short load global BASE5
   06ab: SLDC 01          Short load constant 1
   06ac: ADI              Add integers (TOS + TOS-1)
   06ad: SRO  0005        Store global word BASE5
   06af: UJP  $0697       Unconditional jump
-> 06b1: UJP  $06bc       Unconditional jump
-> 06b3: SLDO 06          Short load global BASE6
   06b4: SIND 07          Short index load *TOS+7
   06b5: SLDO 03          Short load global BASE3
   06b6: SLDC 00          Short load constant 0
   06b7: SLDO 02          Short load global BASE2
   06b8: SLDC 00          Short load constant 0
   06b9: SLDC 00          Short load constant 0
   06ba: CSP  06          Call standard procedure UNITWRITE
-> 06bc: UJP  $06c3       Unconditional jump
-> 06be: LOD  01 0001     Load word at G1 (SYSCOM)
   06c1: SLDC 0d          Short load constant 13
   06c2: STO              Store indirect (TOS into TOS-1)
-> 06c3: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADLN(PARAM1) (* P=21 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 06d2: SLDO 01          Short load global BASE1
   06d3: SIND 01          Short index load *TOS+1
   06d4: LNOT             Logical NOT (~TOS)
   06d5: FJP  $06dc       Jump if TOS false
   06d7: SLDO 01          Short load global BASE1
   06d8: CBP  07          Call base procedure PASCALSY.FGET
   06da: UJP  $06d2       Unconditional jump
-> 06dc: SLDO 01          Short load global BASE1
   06dd: SIND 03          Short index load *TOS+3
   06de: SLDC 00          Short load constant 0
   06df: EQUI             Integer TOS-1 = TOS
   06e0: FJP  $06e7       Jump if TOS false
   06e2: SLDO 01          Short load global BASE1
   06e3: CBP  07          Call base procedure PASCALSY.FGET
   06e5: UJP  $06f1       Unconditional jump
-> 06e7: SLDO 01          Short load global BASE1
   06e8: INC  0003        Inc field ptr (TOS+3)
   06ea: SLDC 01          Short load constant 1
   06eb: STO              Store indirect (TOS into TOS-1)
   06ec: SLDO 01          Short load global BASE1
   06ed: INC  0001        Inc field ptr (TOS+1)
   06ef: SLDC 00          Short load constant 0
   06f0: STO              Store indirect (TOS into TOS-1)
-> 06f1: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITELN(PARAM1) (* P=22 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 0700: SLDO 01          Short load global BASE1
   0701: SIND 00          Short index load *TOS+0
   0702: SLDC 00          Short load constant 0
   0703: SLDC 0d          Short load constant 13
   0704: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0705: SLDO 01          Short load global BASE1
   0706: CBP  08          Call base procedure PASCALSY.FPUT
-> 0708: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCONCAT(PARAM1; PARAM2; PARAM3) (* P=23 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 0714: SLDO 02          Short load global BASE2
   0715: SLDC 00          Short load constant 0
   0716: LDB              Load byte at byte ptr TOS-1 + TOS
   0717: SLDO 03          Short load global BASE3
   0718: SLDC 00          Short load constant 0
   0719: LDB              Load byte at byte ptr TOS-1 + TOS
   071a: ADI              Add integers (TOS + TOS-1)
   071b: SLDO 01          Short load global BASE1
   071c: LEQI             Integer TOS-1 <= TOS
   071d: FJP  $0736       Jump if TOS false
   071f: SLDO 02          Short load global BASE2
   0720: SLDC 01          Short load constant 1
   0721: SLDO 03          Short load global BASE3
   0722: SLDO 03          Short load global BASE3
   0723: SLDC 00          Short load constant 0
   0724: LDB              Load byte at byte ptr TOS-1 + TOS
   0725: SLDC 01          Short load constant 1
   0726: ADI              Add integers (TOS + TOS-1)
   0727: SLDO 02          Short load global BASE2
   0728: SLDC 00          Short load constant 0
   0729: LDB              Load byte at byte ptr TOS-1 + TOS
   072a: CSP  02          Call standard procedure MOVL
   072c: SLDO 03          Short load global BASE3
   072d: SLDC 00          Short load constant 0
   072e: SLDO 02          Short load global BASE2
   072f: SLDC 00          Short load constant 0
   0730: LDB              Load byte at byte ptr TOS-1 + TOS
   0731: SLDO 03          Short load global BASE3
   0732: SLDC 00          Short load constant 0
   0733: LDB              Load byte at byte ptr TOS-1 + TOS
   0734: ADI              Add integers (TOS + TOS-1)
   0735: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0736: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SINSERT(PARAM1; PARAM2; PARAM3; PARAM4) (* P=24 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
BEGIN
-> 0742: SLDO 01          Short load global BASE1
   0743: SLDC 00          Short load constant 0
   0744: GRTI             Integer TOS-1 > TOS
   0745: SLDO 04          Short load global BASE4
   0746: SLDC 00          Short load constant 0
   0747: LDB              Load byte at byte ptr TOS-1 + TOS
   0748: SLDC 00          Short load constant 0
   0749: GRTI             Integer TOS-1 > TOS
   074a: LAND             Logical AND (TOS & TOS-1)
   074b: SLDO 04          Short load global BASE4
   074c: SLDC 00          Short load constant 0
   074d: LDB              Load byte at byte ptr TOS-1 + TOS
   074e: SLDO 03          Short load global BASE3
   074f: SLDC 00          Short load constant 0
   0750: LDB              Load byte at byte ptr TOS-1 + TOS
   0751: ADI              Add integers (TOS + TOS-1)
   0752: SLDO 02          Short load global BASE2
   0753: LEQI             Integer TOS-1 <= TOS
   0754: LAND             Logical AND (TOS & TOS-1)
   0755: FJP  $078b       Jump if TOS false
   0757: SLDO 03          Short load global BASE3
   0758: SLDC 00          Short load constant 0
   0759: LDB              Load byte at byte ptr TOS-1 + TOS
   075a: SLDO 01          Short load global BASE1
   075b: SBI              Subtract integers (TOS-1 - TOS)
   075c: SLDC 01          Short load constant 1
   075d: ADI              Add integers (TOS + TOS-1)
   075e: SRO  0005        Store global word BASE5
   0760: SLDO 05          Short load global BASE5
   0761: SLDC 00          Short load constant 0
   0762: GRTI             Integer TOS-1 > TOS
   0763: FJP  $0773       Jump if TOS false
   0765: SLDO 03          Short load global BASE3
   0766: SLDO 01          Short load global BASE1
   0767: SLDO 03          Short load global BASE3
   0768: SLDO 01          Short load global BASE1
   0769: SLDO 04          Short load global BASE4
   076a: SLDC 00          Short load constant 0
   076b: LDB              Load byte at byte ptr TOS-1 + TOS
   076c: ADI              Add integers (TOS + TOS-1)
   076d: SLDO 05          Short load global BASE5
   076e: CSP  03          Call standard procedure MOVR
   0770: SLDC 00          Short load constant 0
   0771: SRO  0005        Store global word BASE5
-> 0773: SLDO 05          Short load global BASE5
   0774: SLDC 00          Short load constant 0
   0775: EQUI             Integer TOS-1 = TOS
   0776: FJP  $078b       Jump if TOS false
   0778: SLDO 04          Short load global BASE4
   0779: SLDC 01          Short load constant 1
   077a: SLDO 03          Short load global BASE3
   077b: SLDO 01          Short load global BASE1
   077c: SLDO 04          Short load global BASE4
   077d: SLDC 00          Short load constant 0
   077e: LDB              Load byte at byte ptr TOS-1 + TOS
   077f: CSP  02          Call standard procedure MOVL
   0781: SLDO 03          Short load global BASE3
   0782: SLDC 00          Short load constant 0
   0783: SLDO 03          Short load global BASE3
   0784: SLDC 00          Short load constant 0
   0785: LDB              Load byte at byte ptr TOS-1 + TOS
   0786: SLDO 04          Short load global BASE4
   0787: SLDC 00          Short load constant 0
   0788: LDB              Load byte at byte ptr TOS-1 + TOS
   0789: ADI              Add integers (TOS + TOS-1)
   078a: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 078b: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCOPY(PARAM1; PARAM2; PARAM3; PARAM4) (* P=25 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
BEGIN
-> 0798: SLDO 03          Short load global BASE3
   0799: LSA  00          Load string address: ''
   079b: NOP              No operation
   079c: SAS  50          String assign (TOS to TOS-1, 80 chars)
   079e: SLDO 02          Short load global BASE2
   079f: SLDC 00          Short load constant 0
   07a0: GRTI             Integer TOS-1 > TOS
   07a1: SLDO 01          Short load global BASE1
   07a2: SLDC 00          Short load constant 0
   07a3: GRTI             Integer TOS-1 > TOS
   07a4: LAND             Logical AND (TOS & TOS-1)
   07a5: SLDO 02          Short load global BASE2
   07a6: SLDO 01          Short load global BASE1
   07a7: ADI              Add integers (TOS + TOS-1)
   07a8: SLDC 01          Short load constant 1
   07a9: SBI              Subtract integers (TOS-1 - TOS)
   07aa: SLDO 04          Short load global BASE4
   07ab: SLDC 00          Short load constant 0
   07ac: LDB              Load byte at byte ptr TOS-1 + TOS
   07ad: LEQI             Integer TOS-1 <= TOS
   07ae: LAND             Logical AND (TOS & TOS-1)
   07af: FJP  $07bc       Jump if TOS false
   07b1: SLDO 04          Short load global BASE4
   07b2: SLDO 02          Short load global BASE2
   07b3: SLDO 03          Short load global BASE3
   07b4: SLDC 01          Short load constant 1
   07b5: SLDO 01          Short load global BASE1
   07b6: CSP  02          Call standard procedure MOVL
   07b8: SLDO 03          Short load global BASE3
   07b9: SLDC 00          Short load constant 0
   07ba: SLDO 01          Short load global BASE1
   07bb: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 07bc: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SDELETE(PARAM1; PARAM2; PARAM3) (* P=26 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 07c8: SLDO 02          Short load global BASE2
   07c9: SLDC 00          Short load constant 0
   07ca: GRTI             Integer TOS-1 > TOS
   07cb: SLDO 01          Short load global BASE1
   07cc: SLDC 00          Short load constant 0
   07cd: GRTI             Integer TOS-1 > TOS
   07ce: LAND             Logical AND (TOS & TOS-1)
   07cf: FJP  $07ff       Jump if TOS false
   07d1: SLDO 03          Short load global BASE3
   07d2: SLDC 00          Short load constant 0
   07d3: LDB              Load byte at byte ptr TOS-1 + TOS
   07d4: SLDO 02          Short load global BASE2
   07d5: SBI              Subtract integers (TOS-1 - TOS)
   07d6: SLDO 01          Short load global BASE1
   07d7: SBI              Subtract integers (TOS-1 - TOS)
   07d8: SLDC 01          Short load constant 1
   07d9: ADI              Add integers (TOS + TOS-1)
   07da: SRO  0004        Store global word BASE4
   07dc: SLDO 04          Short load global BASE4
   07dd: SLDC 00          Short load constant 0
   07de: EQUI             Integer TOS-1 = TOS
   07df: FJP  $07e9       Jump if TOS false
   07e1: SLDO 03          Short load global BASE3
   07e2: SLDC 00          Short load constant 0
   07e3: SLDO 02          Short load global BASE2
   07e4: SLDC 01          Short load constant 1
   07e5: SBI              Subtract integers (TOS-1 - TOS)
   07e6: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   07e7: UJP  $07ff       Unconditional jump
-> 07e9: SLDO 04          Short load global BASE4
   07ea: SLDC 00          Short load constant 0
   07eb: GRTI             Integer TOS-1 > TOS
   07ec: FJP  $07ff       Jump if TOS false
   07ee: SLDO 03          Short load global BASE3
   07ef: SLDO 02          Short load global BASE2
   07f0: SLDO 01          Short load global BASE1
   07f1: ADI              Add integers (TOS + TOS-1)
   07f2: SLDO 03          Short load global BASE3
   07f3: SLDO 02          Short load global BASE2
   07f4: SLDO 04          Short load global BASE4
   07f5: CSP  02          Call standard procedure MOVL
   07f7: SLDO 03          Short load global BASE3
   07f8: SLDC 00          Short load constant 0
   07f9: SLDO 03          Short load global BASE3
   07fa: SLDC 00          Short load constant 0
   07fb: LDB              Load byte at byte ptr TOS-1 + TOS
   07fc: SLDO 01          Short load global BASE1
   07fd: SBI              Subtract integers (TOS-1 - TOS)
   07fe: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 07ff: RBP  00          Return from base procedure
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
-> 080c: SLDC 00          Short load constant 0
   080d: SRO  0001        Store global word BASE1
   080f: SLDO 04          Short load global BASE4
   0810: SLDC 00          Short load constant 0
   0811: LDB              Load byte at byte ptr TOS-1 + TOS
   0812: SLDC 00          Short load constant 0
   0813: GRTI             Integer TOS-1 > TOS
   0814: FJP  $0867       Jump if TOS false
   0816: SLDO 04          Short load global BASE4
   0817: SLDC 01          Short load constant 1
   0818: LDB              Load byte at byte ptr TOS-1 + TOS
   0819: SRO  0007        Store global word BASE7
   081b: SLDC 01          Short load constant 1
   081c: SRO  0006        Store global word BASE6
   081e: SLDO 03          Short load global BASE3
   081f: SLDC 00          Short load constant 0
   0820: LDB              Load byte at byte ptr TOS-1 + TOS
   0821: SLDO 04          Short load global BASE4
   0822: SLDC 00          Short load constant 0
   0823: LDB              Load byte at byte ptr TOS-1 + TOS
   0824: SBI              Subtract integers (TOS-1 - TOS)
   0825: SLDC 01          Short load constant 1
   0826: ADI              Add integers (TOS + TOS-1)
   0827: SRO  0005        Store global word BASE5
   0829: LAO  0008        Load global BASE8
   082b: SLDC 00          Short load constant 0
   082c: SLDO 04          Short load global BASE4
   082d: SLDC 00          Short load constant 0
   082e: LDB              Load byte at byte ptr TOS-1 + TOS
   082f: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0830: SLDO 06          Short load global BASE6
   0831: SLDO 05          Short load global BASE5
   0832: LEQI             Integer TOS-1 <= TOS
   0833: FJP  $0867       Jump if TOS false
   0835: SLDO 06          Short load global BASE6
   0836: SLDO 05          Short load global BASE5
   0837: SLDO 06          Short load global BASE6
   0838: SBI              Subtract integers (TOS-1 - TOS)
   0839: SLDC 00          Short load constant 0
   083a: SLDO 07          Short load global BASE7
   083b: SLDO 03          Short load global BASE3
   083c: SLDO 06          Short load global BASE6
   083d: SLDC 00          Short load constant 0
   083e: CSP  0b          Call standard procedure SCAN
   0840: ADI              Add integers (TOS + TOS-1)
   0841: SRO  0006        Store global word BASE6
   0843: SLDO 06          Short load global BASE6
   0844: SLDO 05          Short load global BASE5
   0845: GRTI             Integer TOS-1 > TOS
   0846: FJP  $084a       Jump if TOS false
   0848: UJP  $0867       Unconditional jump
-> 084a: SLDO 03          Short load global BASE3
   084b: SLDO 06          Short load global BASE6
   084c: LAO  0008        Load global BASE8
   084e: SLDC 01          Short load constant 1
   084f: SLDO 04          Short load global BASE4
   0850: SLDC 00          Short load constant 0
   0851: LDB              Load byte at byte ptr TOS-1 + TOS
   0852: CSP  02          Call standard procedure MOVL
   0854: LAO  0008        Load global BASE8
   0856: SLDO 04          Short load global BASE4
   0857: EQLSTR           String TOS-1 = TOS
   0859: FJP  $0860       Jump if TOS false
   085b: SLDO 06          Short load global BASE6
   085c: SRO  0001        Store global word BASE1
   085e: UJP  $0867       Unconditional jump
-> 0860: SLDO 06          Short load global BASE6
   0861: SLDC 01          Short load constant 1
   0862: ADI              Add integers (TOS + TOS-1)
   0863: SRO  0006        Store global word BASE6
   0865: UJP  $0830       Unconditional jump
-> 0867: RBP  01          Return from base procedure
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
-> 0876: SLDC 00          Short load constant 0
   0877: SRO  0001        Store global word BASE1
   0879: LOD  01 0001     Load word at G1 (SYSCOM)
   087c: SLDC 00          Short load constant 0
   087d: STO              Store indirect (TOS into TOS-1)
   087e: SLDO 08          Short load global BASE8
   087f: SRO  0009        Store global word BASE9
   0881: SLDO 09          Short load global BASE9
   0882: SIND 05          Short index load *TOS+5
   0883: SLDO 05          Short load global BASE5
   0884: SLDC 00          Short load constant 0
   0885: GEQI             Integer TOS-1 >= TOS
   0886: LAND             Logical AND (TOS & TOS-1)
   0887: FJP  $095f       Jump if TOS false
   0889: SLDO 09          Short load global BASE9
   088a: SIND 06          Short index load *TOS+6
   088b: FJP  $0912       Jump if TOS false
   088d: SLDO 09          Short load global BASE9
   088e: INC  0010        Inc field ptr (TOS+16)
   0890: SRO  000a        Store global word BASE10
   0892: SLDO 04          Short load global BASE4
   0893: SLDC 00          Short load constant 0
   0894: LESI             Integer TOS-1 < TOS
   0895: FJP  $089c       Jump if TOS false
   0897: SLDO 09          Short load global BASE9
   0898: IND  000d        Static index and load word (TOS+13)
   089a: SRO  0004        Store global word BASE4
-> 089c: SLDO 0a          Short load global BASE10
   089d: SIND 00          Short index load *TOS+0
   089e: SLDO 04          Short load global BASE4
   089f: ADI              Add integers (TOS + TOS-1)
   08a0: SRO  0004        Store global word BASE4
   08a2: SLDO 04          Short load global BASE4
   08a3: SLDO 05          Short load global BASE5
   08a4: ADI              Add integers (TOS + TOS-1)
   08a5: SLDO 0a          Short load global BASE10
   08a6: SIND 01          Short index load *TOS+1
   08a7: GRTI             Integer TOS-1 > TOS
   08a8: FJP  $08b5       Jump if TOS false
   08aa: SLDO 03          Short load global BASE3
   08ab: LNOT             Logical NOT (~TOS)
   08ac: FJP  $08b5       Jump if TOS false
   08ae: SLDO 08          Short load global BASE8
   08af: SLDC 00          Short load constant 0
   08b0: SLDC 00          Short load constant 0
   08b1: CBP  31          Call base procedure PASCALSY.49
   08b3: FJP  $08b5       Jump if TOS false
-> 08b5: SLDO 04          Short load global BASE4
   08b6: SLDO 05          Short load global BASE5
   08b7: ADI              Add integers (TOS + TOS-1)
   08b8: SLDO 0a          Short load global BASE10
   08b9: SIND 01          Short index load *TOS+1
   08ba: GRTI             Integer TOS-1 > TOS
   08bb: FJP  $08c3       Jump if TOS false
   08bd: SLDO 0a          Short load global BASE10
   08be: SIND 01          Short index load *TOS+1
   08bf: SLDO 04          Short load global BASE4
   08c0: SBI              Subtract integers (TOS-1 - TOS)
   08c1: SRO  0005        Store global word BASE5
-> 08c3: SLDO 09          Short load global BASE9
   08c4: INC  0002        Inc field ptr (TOS+2)
   08c6: SLDO 04          Short load global BASE4
   08c7: SLDO 0a          Short load global BASE10
   08c8: SIND 01          Short index load *TOS+1
   08c9: GEQI             Integer TOS-1 >= TOS
   08ca: STO              Store indirect (TOS into TOS-1)
   08cb: SLDO 09          Short load global BASE9
   08cc: SIND 02          Short index load *TOS+2
   08cd: LNOT             Logical NOT (~TOS)
   08ce: FJP  $0910       Jump if TOS false
   08d0: SLDO 09          Short load global BASE9
   08d1: SIND 07          Short index load *TOS+7
   08d2: SLDO 07          Short load global BASE7
   08d3: SLDO 06          Short load global BASE6
   08d4: SLDO 05          Short load global BASE5
   08d5: SLDO 04          Short load global BASE4
   08d6: SLDO 03          Short load global BASE3
   08d7: CLP  36          Call local procedure PASCALSY.54
   08d9: CSP  22          Call standard procedure IORESULT
   08db: SLDC 00          Short load constant 0
   08dc: EQUI             Integer TOS-1 = TOS
   08dd: FJP  $0910       Jump if TOS false
   08df: SLDO 03          Short load global BASE3
   08e0: LNOT             Logical NOT (~TOS)
   08e1: FJP  $08e8       Jump if TOS false
   08e3: SLDO 09          Short load global BASE9
   08e4: INC  000f        Inc field ptr (TOS+15)
   08e6: SLDC 01          Short load constant 1
   08e7: STO              Store indirect (TOS into TOS-1)
-> 08e8: SLDO 05          Short load global BASE5
   08e9: SRO  0001        Store global word BASE1
   08eb: SLDO 04          Short load global BASE4
   08ec: SLDO 05          Short load global BASE5
   08ed: ADI              Add integers (TOS + TOS-1)
   08ee: SRO  0004        Store global word BASE4
   08f0: SLDO 09          Short load global BASE9
   08f1: INC  0002        Inc field ptr (TOS+2)
   08f3: SLDO 04          Short load global BASE4
   08f4: SLDO 0a          Short load global BASE10
   08f5: SIND 01          Short index load *TOS+1
   08f6: EQUI             Integer TOS-1 = TOS
   08f7: STO              Store indirect (TOS into TOS-1)
   08f8: SLDO 09          Short load global BASE9
   08f9: INC  000d        Inc field ptr (TOS+13)
   08fb: SLDO 04          Short load global BASE4
   08fc: SLDO 0a          Short load global BASE10
   08fd: SIND 00          Short index load *TOS+0
   08fe: SBI              Subtract integers (TOS-1 - TOS)
   08ff: STO              Store indirect (TOS into TOS-1)
   0900: SLDO 09          Short load global BASE9
   0901: IND  000d        Static index and load word (TOS+13)
   0903: SLDO 09          Short load global BASE9
   0904: IND  000c        Static index and load word (TOS+12)
   0906: GRTI             Integer TOS-1 > TOS
   0907: FJP  $0910       Jump if TOS false
   0909: SLDO 09          Short load global BASE9
   090a: INC  000c        Inc field ptr (TOS+12)
   090c: SLDO 09          Short load global BASE9
   090d: IND  000d        Static index and load word (TOS+13)
   090f: STO              Store indirect (TOS into TOS-1)
-> 0910: UJP  $095d       Unconditional jump
-> 0912: SLDO 05          Short load global BASE5
   0913: SRO  0001        Store global word BASE1
   0915: SLDO 09          Short load global BASE9
   0916: SIND 07          Short index load *TOS+7
   0917: SLDO 07          Short load global BASE7
   0918: SLDO 06          Short load global BASE6
   0919: SLDO 05          Short load global BASE5
   091a: SLDO 04          Short load global BASE4
   091b: SLDO 03          Short load global BASE3
   091c: CLP  36          Call local procedure PASCALSY.54
   091e: CSP  22          Call standard procedure IORESULT
   0920: SLDC 00          Short load constant 0
   0921: EQUI             Integer TOS-1 = TOS
   0922: FJP  $095a       Jump if TOS false
   0924: SLDO 03          Short load global BASE3
   0925: FJP  $0958       Jump if TOS false
   0927: SLDO 05          Short load global BASE5
   0928: LDCI 0200        Load word 512
   092b: MPI              Multiply integers (TOS * TOS-1)
   092c: SRO  0004        Store global word BASE4
   092e: SLDO 04          Short load global BASE4
   092f: SLDO 04          Short load global BASE4
   0930: NGI              Negate integer
   0931: SLDC 01          Short load constant 1
   0932: SLDC 00          Short load constant 0
   0933: SLDO 07          Short load global BASE7
   0934: SLDO 06          Short load global BASE6
   0935: SLDO 04          Short load global BASE4
   0936: ADI              Add integers (TOS + TOS-1)
   0937: SLDC 01          Short load constant 1
   0938: SBI              Subtract integers (TOS-1 - TOS)
   0939: SLDC 00          Short load constant 0
   093a: CSP  0b          Call standard procedure SCAN
   093c: ADI              Add integers (TOS + TOS-1)
   093d: SRO  0004        Store global word BASE4
   093f: SLDO 04          Short load global BASE4
   0940: LDCI 0200        Load word 512
   0943: ADI              Add integers (TOS + TOS-1)
   0944: SLDC 01          Short load constant 1
   0945: SBI              Subtract integers (TOS-1 - TOS)
   0946: LDCI 0200        Load word 512
   0949: DVI              Divide integers (TOS-1 / TOS)
   094a: SRO  0004        Store global word BASE4
   094c: SLDO 04          Short load global BASE4
   094d: SRO  0001        Store global word BASE1
   094f: SLDO 09          Short load global BASE9
   0950: INC  0002        Inc field ptr (TOS+2)
   0952: SLDO 04          Short load global BASE4
   0953: SLDO 05          Short load global BASE5
   0954: LESI             Integer TOS-1 < TOS
   0955: STO              Store indirect (TOS into TOS-1)
   0956: UJP  $0958       Unconditional jump
-> 0958: UJP  $095d       Unconditional jump
-> 095a: SLDC 00          Short load constant 0
   095b: SRO  0001        Store global word BASE1
-> 095d: UJP  $0964       Unconditional jump
-> 095f: LOD  01 0001     Load word at G1 (SYSCOM)
   0962: SLDC 0d          Short load constant 13
   0963: STO              Store indirect (TOS into TOS-1)
-> 0964: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.FGOTOXY(PARAM1; PARAM2) (* P=29 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0974: LOD  01 0001     Load word at G1 (SYSCOM)
   0977: INC  0025        Inc field ptr (TOS+37)
   0979: SRO  0003        Store global word BASE3
   097b: SLDO 02          Short load global BASE2
   097c: SLDC 00          Short load constant 0
   097d: LESI             Integer TOS-1 < TOS
   097e: FJP  $0983       Jump if TOS false
   0980: SLDC 00          Short load constant 0
   0981: SRO  0002        Store global word BASE2
-> 0983: SLDO 02          Short load global BASE2
   0984: SLDO 03          Short load global BASE3
   0985: SIND 01          Short index load *TOS+1
   0986: GRTI             Integer TOS-1 > TOS
   0987: FJP  $098d       Jump if TOS false
   0989: SLDO 03          Short load global BASE3
   098a: SIND 01          Short index load *TOS+1
   098b: SRO  0002        Store global word BASE2
-> 098d: SLDO 01          Short load global BASE1
   098e: SLDC 00          Short load constant 0
   098f: LESI             Integer TOS-1 < TOS
   0990: FJP  $0995       Jump if TOS false
   0992: SLDC 00          Short load constant 0
   0993: SRO  0001        Store global word BASE1
-> 0995: SLDO 01          Short load global BASE1
   0996: SLDO 03          Short load global BASE3
   0997: SIND 00          Short index load *TOS+0
   0998: GRTI             Integer TOS-1 > TOS
   0999: FJP  $099f       Jump if TOS false
   099b: SLDO 03          Short load global BASE3
   099c: SIND 00          Short index load *TOS+0
   099d: SRO  0001        Store global word BASE1
-> 099f: LOD  01 0003     Load word at G3 (OUTPUT)
   09a2: SLDC 1e          Short load constant 30
   09a3: SLDC 00          Short load constant 0
   09a4: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   09a7: LOD  01 0003     Load word at G3 (OUTPUT)
   09aa: SLDO 02          Short load global BASE2
   09ab: SLDC 20          Short load constant 32
   09ac: ADI              Add integers (TOS + TOS-1)
   09ad: SLDC 00          Short load constant 0
   09ae: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   09b1: LOD  01 0003     Load word at G3 (OUTPUT)
   09b4: SLDO 01          Short load global BASE1
   09b5: SLDC 20          Short load constant 32
   09b6: ADI              Add integers (TOS + TOS-1)
   09b7: SLDC 00          Short load constant 0
   09b8: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 09bb: RBP  00          Return from base procedure
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
-> 09c8: SLDC 00          Short load constant 0
   09c9: SRO  0001        Store global word BASE1
   09cb: SLDO 03          Short load global BASE3
   09cc: LDCN             Load constant NIL
   09cd: STO              Store indirect (TOS into TOS-1)
   09ce: SLDC 00          Short load constant 0
   09cf: SRO  0008        Store global word BASE8
   09d1: SLDC 00          Short load constant 0
   09d2: SRO  0007        Store global word BASE7
   09d4: SLDO 05          Short load global BASE5
   09d5: SLDC 00          Short load constant 0
   09d6: LDB              Load byte at byte ptr TOS-1 + TOS
   09d7: SLDC 00          Short load constant 0
   09d8: GRTI             Integer TOS-1 > TOS
   09d9: FJP  $0a52       Jump if TOS false
   09db: SLDO 05          Short load global BASE5
   09dc: SLDC 01          Short load constant 1
   09dd: LDB              Load byte at byte ptr TOS-1 + TOS
   09de: SLDC 23          Short load constant 35
   09df: EQUI             Integer TOS-1 = TOS
   09e0: SLDO 05          Short load global BASE5
   09e1: SLDC 00          Short load constant 0
   09e2: LDB              Load byte at byte ptr TOS-1 + TOS
   09e3: SLDC 01          Short load constant 1
   09e4: GRTI             Integer TOS-1 > TOS
   09e5: LAND             Logical AND (TOS & TOS-1)
   09e6: FJP  $0a2d       Jump if TOS false
   09e8: SLDC 01          Short load constant 1
   09e9: SRO  0008        Store global word BASE8
   09eb: SLDC 00          Short load constant 0
   09ec: SRO  0006        Store global word BASE6
   09ee: SLDC 02          Short load constant 2
   09ef: SRO  000a        Store global word BASE10
-> 09f1: SLDO 05          Short load global BASE5
   09f2: SLDO 0a          Short load global BASE10
   09f3: LDB              Load byte at byte ptr TOS-1 + TOS
   09f4: LDA  01 007a     Load addr G122
   09f7: LDM  04          Load 4 words from (TOS)
   09f9: SLDC 04          Short load constant 4
   09fa: INN              Set membership (TOS-1 in set TOS)
   09fb: FJP  $0a0a       Jump if TOS false
   09fd: SLDO 06          Short load global BASE6
   09fe: SLDC 0a          Short load constant 10
   09ff: MPI              Multiply integers (TOS * TOS-1)
   0a00: SLDO 05          Short load global BASE5
   0a01: SLDO 0a          Short load global BASE10
   0a02: LDB              Load byte at byte ptr TOS-1 + TOS
   0a03: ADI              Add integers (TOS + TOS-1)
   0a04: SLDC 30          Short load constant 48
   0a05: SBI              Subtract integers (TOS-1 - TOS)
   0a06: SRO  0006        Store global word BASE6
   0a08: UJP  $0a0d       Unconditional jump
-> 0a0a: SLDC 00          Short load constant 0
   0a0b: SRO  0008        Store global word BASE8
-> 0a0d: SLDO 0a          Short load global BASE10
   0a0e: SLDC 01          Short load constant 1
   0a0f: ADI              Add integers (TOS + TOS-1)
   0a10: SRO  000a        Store global word BASE10
   0a12: SLDO 0a          Short load global BASE10
   0a13: SLDO 05          Short load global BASE5
   0a14: SLDC 00          Short load constant 0
   0a15: LDB              Load byte at byte ptr TOS-1 + TOS
   0a16: GRTI             Integer TOS-1 > TOS
   0a17: SLDO 08          Short load global BASE8
   0a18: LNOT             Logical NOT (~TOS)
   0a19: LOR              Logical OR (TOS | TOS-1)
   0a1a: FJP  $09f1       Jump if TOS false
   0a1c: SLDO 08          Short load global BASE8
   0a1d: SLDO 06          Short load global BASE6
   0a1e: SLDC 00          Short load constant 0
   0a1f: GRTI             Integer TOS-1 > TOS
   0a20: LAND             Logical AND (TOS & TOS-1)
   0a21: SLDO 06          Short load global BASE6
   0a22: SLDC 14          Short load constant 20
   0a23: LEQI             Integer TOS-1 <= TOS
   0a24: LAND             Logical AND (TOS & TOS-1)
   0a25: SRO  0007        Store global word BASE7
   0a27: SLDO 04          Short load global BASE4
   0a28: SLDO 07          Short load global BASE7
   0a29: LNOT             Logical NOT (~TOS)
   0a2a: LAND             Logical AND (TOS & TOS-1)
   0a2b: SRO  0004        Store global word BASE4
-> 0a2d: SLDO 07          Short load global BASE7
   0a2e: LNOT             Logical NOT (~TOS)
   0a2f: FJP  $0a52       Jump if TOS false
   0a31: SLDC 00          Short load constant 0
   0a32: SRO  0008        Store global word BASE8
   0a34: SLDC 14          Short load constant 20
   0a35: SRO  0006        Store global word BASE6
-> 0a37: SLDO 05          Short load global BASE5
   0a38: LDA  01 007e     Load addr G126
   0a3b: SLDO 06          Short load global BASE6
   0a3c: IXA  0006        Index array (TOS-1 + TOS * 6)
   0a3e: EQLSTR           String TOS-1 = TOS
   0a40: SRO  0008        Store global word BASE8
   0a42: SLDO 08          Short load global BASE8
   0a43: LNOT             Logical NOT (~TOS)
   0a44: FJP  $0a4b       Jump if TOS false
   0a46: SLDO 06          Short load global BASE6
   0a47: SLDC 01          Short load constant 1
   0a48: SBI              Subtract integers (TOS-1 - TOS)
   0a49: SRO  0006        Store global word BASE6
-> 0a4b: SLDO 08          Short load global BASE8
   0a4c: SLDO 06          Short load global BASE6
   0a4d: SLDC 00          Short load constant 0
   0a4e: EQUI             Integer TOS-1 = TOS
   0a4f: LOR              Logical OR (TOS | TOS-1)
   0a50: FJP  $0a37       Jump if TOS false
-> 0a52: SLDO 08          Short load global BASE8
   0a53: FJP  $0ab5       Jump if TOS false
   0a55: LDA  01 007e     Load addr G126
   0a58: SLDO 06          Short load global BASE6
   0a59: IXA  0006        Index array (TOS-1 + TOS * 6)
   0a5b: SIND 04          Short index load *TOS+4
   0a5c: FJP  $0ab5       Jump if TOS false
   0a5e: LOD  01 0001     Load word at G1 (SYSCOM)
   0a61: SRO  000b        Store global word BASE11
   0a63: SLDC 00          Short load constant 0
   0a64: SRO  0008        Store global word BASE8
   0a66: SLDO 0b          Short load global BASE11
   0a67: SIND 04          Short index load *TOS+4
   0a68: LDCN             Load constant NIL
   0a69: NEQI             Integer TOS-1 <> TOS
   0a6a: FJP  $0a8d       Jump if TOS false
   0a6c: SLDO 05          Short load global BASE5
   0a6d: SLDO 0b          Short load global BASE11
   0a6e: SIND 04          Short index load *TOS+4
   0a6f: SLDC 00          Short load constant 0
   0a70: IXA  000d        Index array (TOS-1 + TOS * 13)
   0a72: INC  0003        Inc field ptr (TOS+3)
   0a74: EQLSTR           String TOS-1 = TOS
   0a76: FJP  $0a8d       Jump if TOS false
   0a78: LAO  000a        Load global BASE10
   0a7a: LAO  0009        Load global BASE9
   0a7c: CSP  09          Call standard procedure TIME
   0a7e: SLDO 09          Short load global BASE9
   0a7f: SLDO 0b          Short load global BASE11
   0a80: SIND 04          Short index load *TOS+4
   0a81: SLDC 00          Short load constant 0
   0a82: IXA  000d        Index array (TOS-1 + TOS * 13)
   0a84: IND  0009        Static index and load word (TOS+9)
   0a86: SBI              Subtract integers (TOS-1 - TOS)
   0a87: LDCI 012c        Load word 300
   0a8a: LEQI             Integer TOS-1 <= TOS
   0a8b: SRO  0008        Store global word BASE8
-> 0a8d: SLDO 08          Short load global BASE8
   0a8e: LNOT             Logical NOT (~TOS)
   0a8f: FJP  $0ab5       Jump if TOS false
   0a91: SLDO 07          Short load global BASE7
   0a92: SRO  0008        Store global word BASE8
   0a94: SLDO 06          Short load global BASE6
   0a95: SLDC 00          Short load constant 0
   0a96: SLDC 00          Short load constant 0
   0a97: CBP  2a          Call base procedure PASCALSY.42
   0a99: FJP  $0aaf       Jump if TOS false
   0a9b: SLDO 07          Short load global BASE7
   0a9c: LNOT             Logical NOT (~TOS)
   0a9d: FJP  $0aad       Jump if TOS false
   0a9f: SLDO 05          Short load global BASE5
   0aa0: SLDO 0b          Short load global BASE11
   0aa1: SIND 04          Short index load *TOS+4
   0aa2: SLDC 00          Short load constant 0
   0aa3: IXA  000d        Index array (TOS-1 + TOS * 13)
   0aa5: INC  0003        Inc field ptr (TOS+3)
   0aa7: EQLSTR           String TOS-1 = TOS
   0aa9: SRO  0008        Store global word BASE8
   0aab: UJP  $0aad       Unconditional jump
-> 0aad: UJP  $0ab5       Unconditional jump
-> 0aaf: CSP  22          Call standard procedure IORESULT
   0ab1: SLDC 00          Short load constant 0
   0ab2: EQUI             Integer TOS-1 = TOS
   0ab3: SRO  0008        Store global word BASE8
-> 0ab5: SLDO 08          Short load global BASE8
   0ab6: LNOT             Logical NOT (~TOS)
   0ab7: SLDO 04          Short load global BASE4
   0ab8: LAND             Logical AND (TOS & TOS-1)
   0ab9: FJP  $0ae7       Jump if TOS false
   0abb: SLDC 14          Short load constant 20
   0abc: SRO  0006        Store global word BASE6
-> 0abe: LDA  01 007e     Load addr G126
   0ac1: SLDO 06          Short load global BASE6
   0ac2: IXA  0006        Index array (TOS-1 + TOS * 6)
   0ac4: SRO  000b        Store global word BASE11
   0ac6: SLDO 0b          Short load global BASE11
   0ac7: SIND 04          Short index load *TOS+4
   0ac8: FJP  $0ad7       Jump if TOS false
   0aca: SLDO 06          Short load global BASE6
   0acb: SLDC 00          Short load constant 0
   0acc: SLDC 00          Short load constant 0
   0acd: CBP  2a          Call base procedure PASCALSY.42
   0acf: FJP  $0ad7       Jump if TOS false
   0ad1: SLDO 05          Short load global BASE5
   0ad2: SLDO 0b          Short load global BASE11
   0ad3: EQLSTR           String TOS-1 = TOS
   0ad5: SRO  0008        Store global word BASE8
-> 0ad7: SLDO 08          Short load global BASE8
   0ad8: LNOT             Logical NOT (~TOS)
   0ad9: FJP  $0ae0       Jump if TOS false
   0adb: SLDO 06          Short load global BASE6
   0adc: SLDC 01          Short load constant 1
   0add: SBI              Subtract integers (TOS-1 - TOS)
   0ade: SRO  0006        Store global word BASE6
-> 0ae0: SLDO 08          Short load global BASE8
   0ae1: SLDO 06          Short load global BASE6
   0ae2: SLDC 00          Short load constant 0
   0ae3: EQUI             Integer TOS-1 = TOS
   0ae4: LOR              Logical OR (TOS | TOS-1)
   0ae5: FJP  $0abe       Jump if TOS false
-> 0ae7: SLDO 08          Short load global BASE8
   0ae8: FJP  $0b1c       Jump if TOS false
   0aea: LDA  01 007e     Load addr G126
   0aed: SLDO 06          Short load global BASE6
   0aee: IXA  0006        Index array (TOS-1 + TOS * 6)
   0af0: SRO  000b        Store global word BASE11
   0af2: SLDO 06          Short load global BASE6
   0af3: SRO  0001        Store global word BASE1
   0af5: SLDO 0b          Short load global BASE11
   0af6: SLDC 00          Short load constant 0
   0af7: LDB              Load byte at byte ptr TOS-1 + TOS
   0af8: SLDC 00          Short load constant 0
   0af9: GRTI             Integer TOS-1 > TOS
   0afa: FJP  $0b00       Jump if TOS false
   0afc: SLDO 05          Short load global BASE5
   0afd: SLDO 0b          Short load global BASE11
   0afe: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0b00: SLDO 0b          Short load global BASE11
   0b01: SIND 04          Short index load *TOS+4
   0b02: LOD  01 0001     Load word at G1 (SYSCOM)
   0b05: SIND 04          Short index load *TOS+4
   0b06: LDCN             Load constant NIL
   0b07: NEQI             Integer TOS-1 <> TOS
   0b08: LAND             Logical AND (TOS & TOS-1)
   0b09: FJP  $0b1c       Jump if TOS false
   0b0b: SLDO 03          Short load global BASE3
   0b0c: LOD  01 0001     Load word at G1 (SYSCOM)
   0b0f: SIND 04          Short index load *TOS+4
   0b10: STO              Store indirect (TOS into TOS-1)
   0b11: LAO  000a        Load global BASE10
   0b13: SLDO 03          Short load global BASE3
   0b14: SIND 00          Short index load *TOS+0
   0b15: SLDC 00          Short load constant 0
   0b16: IXA  000d        Index array (TOS-1 + TOS * 13)
   0b18: INC  0009        Inc field ptr (TOS+9)
   0b1a: CSP  09          Call standard procedure TIME
-> 0b1c: RBP  01          Return from base procedure
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
-> 0000: LDA  01 007e     Load addr G126
   0003: SLDO 02          Short load global BASE2
   0004: IXA  0006        Index array (TOS-1 + TOS * 6)
   0006: SRO  0013        Store global word BASE19
   0008: SLDO 01          Short load global BASE1
   0009: SLDC 00          Short load constant 0
   000a: IXA  000d        Index array (TOS-1 + TOS * 13)
   000c: SRO  0014        Store global word BASE20
   000e: LDO  0013        Load global word BASE19
   0010: LDO  0014        Load global word BASE20
   0012: INC  0003        Inc field ptr (TOS+3)
   0014: EQLSTR           String TOS-1 = TOS
   0016: LDO  0014        Load global word BASE20
   0018: INC  0002        Inc field ptr (TOS+2)
   001a: SLDC 04          Short load constant 4
   001b: SLDC 00          Short load constant 0
   001c: LDP              Load packed field (TOS)
   001d: SLDC 00          Short load constant 0
   001e: EQUI             Integer TOS-1 = TOS
   001f: LDO  0014        Load global word BASE20
   0021: INC  0002        Inc field ptr (TOS+2)
   0023: SLDC 04          Short load constant 4
   0024: SLDC 00          Short load constant 0
   0025: LDP              Load packed field (TOS)
   0026: SLDC 08          Short load constant 8
   0027: EQUI             Integer TOS-1 = TOS
   0028: LOR              Logical OR (TOS | TOS-1)
   0029: LAND             Logical AND (TOS & TOS-1)
   002a: SRO  0005        Store global word BASE5
   002c: SLDO 05          Short load global BASE5
   002d: FJP  $00ad       Jump if TOS false
   002f: LAO  0004        Load global BASE4
   0031: LAO  0003        Load global BASE3
   0033: CSP  09          Call standard procedure TIME
   0035: SLDO 03          Short load global BASE3
   0036: LDO  0014        Load global word BASE20
   0038: IND  0009        Static index and load word (TOS+9)
   003a: SBI              Subtract integers (TOS-1 - TOS)
   003b: LDCI 012c        Load word 300
   003e: LEQI             Integer TOS-1 <= TOS
   003f: SLDO 03          Short load global BASE3
   0040: LDO  0014        Load global word BASE20
   0042: IND  0009        Static index and load word (TOS+9)
   0044: SBI              Subtract integers (TOS-1 - TOS)
   0045: SLDC 00          Short load constant 0
   0046: GEQI             Integer TOS-1 >= TOS
   0047: LAND             Logical AND (TOS & TOS-1)
   0048: LOD  01 0001     Load word at G1 (SYSCOM)
   004b: INC  001d        Inc field ptr (TOS+29)
   004d: SLDC 01          Short load constant 1
   004e: SLDC 00          Short load constant 0
   004f: LDP              Load packed field (TOS)
   0050: LAND             Logical AND (TOS & TOS-1)
   0051: SRO  0005        Store global word BASE5
   0053: SLDO 05          Short load global BASE5
   0054: LNOT             Logical NOT (~TOS)
   0055: FJP  $0070       Jump if TOS false
   0057: SLDO 02          Short load global BASE2
   0058: LAO  0006        Load global BASE6
   005a: SLDC 00          Short load constant 0
   005b: SLDC 1a          Short load constant 26
   005c: SLDC 02          Short load constant 2
   005d: SLDC 00          Short load constant 0
   005e: CSP  05          Call standard procedure UNITREAD
   0060: CSP  22          Call standard procedure IORESULT
   0062: SLDC 00          Short load constant 0
   0063: EQUI             Integer TOS-1 = TOS
   0064: FJP  $0070       Jump if TOS false
   0066: LDO  0014        Load global word BASE20
   0068: INC  0003        Inc field ptr (TOS+3)
   006a: LAO  0009        Load global BASE9
   006c: EQLSTR           String TOS-1 = TOS
   006e: SRO  0005        Store global word BASE5
-> 0070: SLDO 05          Short load global BASE5
   0071: FJP  $00ad       Jump if TOS false
   0073: LDO  0014        Load global word BASE20
   0075: SLDC 00          Short load constant 0
   0076: STO              Store indirect (TOS into TOS-1)
   0077: SLDO 02          Short load global BASE2
   0078: SLDO 01          Short load global BASE1
   0079: SLDC 00          Short load constant 0
   007a: LDO  0014        Load global word BASE20
   007c: IND  0008        Static index and load word (TOS+8)
   007e: SLDC 01          Short load constant 1
   007f: ADI              Add integers (TOS + TOS-1)
   0080: SLDC 1a          Short load constant 26
   0081: MPI              Multiply integers (TOS * TOS-1)
   0082: SLDC 02          Short load constant 2
   0083: SLDC 00          Short load constant 0
   0084: CSP  06          Call standard procedure UNITWRITE
   0086: CSP  22          Call standard procedure IORESULT
   0088: SLDC 00          Short load constant 0
   0089: EQUI             Integer TOS-1 = TOS
   008a: SRO  0005        Store global word BASE5
   008c: LDO  0014        Load global word BASE20
   008e: SIND 01          Short index load *TOS+1
   008f: SLDC 0a          Short load constant 10
   0090: EQUI             Integer TOS-1 = TOS
   0091: FJP  $00a2       Jump if TOS false
   0093: SLDO 02          Short load global BASE2
   0094: SLDO 01          Short load global BASE1
   0095: SLDC 00          Short load constant 0
   0096: LDO  0014        Load global word BASE20
   0098: IND  0008        Static index and load word (TOS+8)
   009a: SLDC 01          Short load constant 1
   009b: ADI              Add integers (TOS + TOS-1)
   009c: SLDC 1a          Short load constant 26
   009d: MPI              Multiply integers (TOS * TOS-1)
   009e: SLDC 06          Short load constant 6
   009f: SLDC 00          Short load constant 0
   00a0: CSP  06          Call standard procedure UNITWRITE
-> 00a2: SLDO 05          Short load global BASE5
   00a3: FJP  $00ad       Jump if TOS false
   00a5: LAO  0004        Load global BASE4
   00a7: LDO  0014        Load global word BASE20
   00a9: INC  0009        Inc field ptr (TOS+9)
   00ab: CSP  09          Call standard procedure TIME
-> 00ad: SLDO 05          Short load global BASE5
   00ae: LNOT             Logical NOT (~TOS)
   00af: FJP  $00c0       Jump if TOS false
   00b1: LDO  0013        Load global word BASE19
   00b3: LSA  00          Load string address: ''
   00b5: NOP              No operation
   00b6: SAS  07          String assign (TOS to TOS-1, 7 chars)
   00b8: LDO  0013        Load global word BASE19
   00ba: INC  0005        Inc field ptr (TOS+5)
   00bc: LDCI 7fff        Load word 32767
   00bf: STO              Store indirect (TOS into TOS-1)
-> 00c0: RBP  00          Return from base procedure
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
-> 0b2e: SLDC 00          Short load constant 0
   0b2f: SRO  0001        Store global word BASE1
   0b31: SLDC 00          Short load constant 0
   0b32: SRO  0007        Store global word BASE7
   0b34: SLDC 01          Short load constant 1
   0b35: SRO  0006        Store global word BASE6
-> 0b37: SLDO 06          Short load global BASE6
   0b38: SLDO 03          Short load global BASE3
   0b39: SLDC 00          Short load constant 0
   0b3a: IXA  000d        Index array (TOS-1 + TOS * 13)
   0b3c: IND  0008        Static index and load word (TOS+8)
   0b3e: LEQI             Integer TOS-1 <= TOS
   0b3f: SLDO 07          Short load global BASE7
   0b40: LNOT             Logical NOT (~TOS)
   0b41: LAND             Logical AND (TOS & TOS-1)
   0b42: FJP  $0b6c       Jump if TOS false
   0b44: SLDO 03          Short load global BASE3
   0b45: SLDO 06          Short load global BASE6
   0b46: IXA  000d        Index array (TOS-1 + TOS * 13)
   0b48: SRO  0008        Store global word BASE8
   0b4a: SLDO 08          Short load global BASE8
   0b4b: INC  0003        Inc field ptr (TOS+3)
   0b4d: SLDO 05          Short load global BASE5
   0b4e: EQLSTR           String TOS-1 = TOS
   0b50: FJP  $0b65       Jump if TOS false
   0b52: SLDO 04          Short load global BASE4
   0b53: SLDO 08          Short load global BASE8
   0b54: INC  000c        Inc field ptr (TOS+12)
   0b56: SLDC 07          Short load constant 7
   0b57: SLDC 09          Short load constant 9
   0b58: LDP              Load packed field (TOS)
   0b59: SLDC 64          Short load constant 100
   0b5a: NEQI             Integer TOS-1 <> TOS
   0b5b: EQLBOOL          Boolean TOS-1 = TOS
   0b5d: FJP  $0b65       Jump if TOS false
   0b5f: SLDO 06          Short load global BASE6
   0b60: SRO  0001        Store global word BASE1
   0b62: SLDC 01          Short load constant 1
   0b63: SRO  0007        Store global word BASE7
-> 0b65: SLDO 06          Short load global BASE6
   0b66: SLDC 01          Short load constant 1
   0b67: ADI              Add integers (TOS + TOS-1)
   0b68: SRO  0006        Store global word BASE6
   0b6a: UJP  $0b37       Unconditional jump
-> 0b6c: RBP  01          Return from base procedure
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
-> 00cc: LAO  0008        Load global BASE8
   00ce: SLDO 07          Short load global BASE7
   00cf: SAS  50          String assign (TOS to TOS-1, 80 chars)
   00d1: SLDO 06          Short load global BASE6
   00d2: NOP              No operation
   00d3: LSA  00          Load string address: ''
   00d5: SAS  07          String assign (TOS to TOS-1, 7 chars)
   00d7: SLDO 05          Short load global BASE5
   00d8: NOP              No operation
   00d9: LSA  00          Load string address: ''
   00db: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   00dd: SLDO 04          Short load global BASE4
   00de: SLDC 00          Short load constant 0
   00df: STO              Store indirect (TOS into TOS-1)
   00e0: SLDO 03          Short load global BASE3
   00e1: SLDC 00          Short load constant 0
   00e2: STO              Store indirect (TOS into TOS-1)
   00e3: SLDC 00          Short load constant 0
   00e4: SRO  0001        Store global word BASE1
   00e6: SLDC 01          Short load constant 1
   00e7: SRO  0032        Store global word BASE50
-> 00e9: LDO  0032        Load global word BASE50
   00eb: LAO  0008        Load global BASE8
   00ed: SLDC 00          Short load constant 0
   00ee: LDB              Load byte at byte ptr TOS-1 + TOS
   00ef: LEQI             Integer TOS-1 <= TOS
   00f0: FJP  $0127       Jump if TOS false
   00f2: LAO  0008        Load global BASE8
   00f4: LDO  0032        Load global word BASE50
   00f6: LDB              Load byte at byte ptr TOS-1 + TOS
   00f7: SRO  0033        Store global word BASE51
   00f9: LDO  0033        Load global word BASE51
   00fb: SLDC 20          Short load constant 32
   00fc: LEQI             Integer TOS-1 <= TOS
   00fd: FJP  $0109       Jump if TOS false
   00ff: LAO  0008        Load global BASE8
   0101: LDO  0032        Load global word BASE50
   0103: SLDC 01          Short load constant 1
   0104: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0107: UJP  $0125       Unconditional jump
-> 0109: LDO  0033        Load global word BASE51
   010b: SLDC 61          Short load constant 97
   010c: GEQI             Integer TOS-1 >= TOS
   010d: LDO  0033        Load global word BASE51
   010f: SLDC 7a          Short load constant 122
   0110: LEQI             Integer TOS-1 <= TOS
   0111: LAND             Logical AND (TOS & TOS-1)
   0112: FJP  $011f       Jump if TOS false
   0114: LAO  0008        Load global BASE8
   0116: LDO  0032        Load global word BASE50
   0118: LDO  0033        Load global word BASE51
   011a: SLDC 61          Short load constant 97
   011b: SBI              Subtract integers (TOS-1 - TOS)
   011c: SLDC 41          Short load constant 65
   011d: ADI              Add integers (TOS + TOS-1)
   011e: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 011f: LDO  0032        Load global word BASE50
   0121: SLDC 01          Short load constant 1
   0122: ADI              Add integers (TOS + TOS-1)
   0123: SRO  0032        Store global word BASE50
-> 0125: UJP  $00e9       Unconditional jump
-> 0127: LAO  0008        Load global BASE8
   0129: SLDC 00          Short load constant 0
   012a: LDB              Load byte at byte ptr TOS-1 + TOS
   012b: SLDC 00          Short load constant 0
   012c: GRTI             Integer TOS-1 > TOS
   012d: FJP  $030b       Jump if TOS false
   012f: LAO  0008        Load global BASE8
   0131: SLDC 01          Short load constant 1
   0132: LDB              Load byte at byte ptr TOS-1 + TOS
   0133: SLDC 2a          Short load constant 42
   0134: EQUI             Integer TOS-1 = TOS
   0135: FJP  $0146       Jump if TOS false
   0137: SLDO 06          Short load global BASE6
   0138: LDA  01 003f     Load addr G63
   013b: SAS  07          String assign (TOS to TOS-1, 7 chars)
   013d: LAO  0008        Load global BASE8
   013f: SLDC 01          Short load constant 1
   0140: SLDC 01          Short load constant 1
   0141: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0144: UJP  $015c       Unconditional jump
-> 0146: LAO  0008        Load global BASE8
   0148: SLDC 01          Short load constant 1
   0149: LDB              Load byte at byte ptr TOS-1 + TOS
   014a: SLDC 25          Short load constant 37
   014b: EQUI             Integer TOS-1 = TOS
   014c: FJP  $015c       Jump if TOS false
   014e: SLDO 06          Short load global BASE6
   014f: LDA  01 01bc     Load addr G444
   0153: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0155: LAO  0008        Load global BASE8
   0157: SLDC 01          Short load constant 1
   0158: SLDC 01          Short load constant 1
   0159: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 015c: NOP              No operation
   015d: LSA  01          Load string address: ':'
   0160: LAO  0008        Load global BASE8
   0162: SLDC 00          Short load constant 0
   0163: SLDC 00          Short load constant 0
   0164: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0167: SRO  0032        Store global word BASE50
   0169: LDO  0032        Load global word BASE50
   016b: SLDC 01          Short load constant 1
   016c: LEQI             Integer TOS-1 <= TOS
   016d: FJP  $018b       Jump if TOS false
   016f: SLDO 06          Short load global BASE6
   0170: SLDC 00          Short load constant 0
   0171: LDB              Load byte at byte ptr TOS-1 + TOS
   0172: SLDC 00          Short load constant 0
   0173: EQUI             Integer TOS-1 = TOS
   0174: FJP  $017c       Jump if TOS false
   0176: SLDO 06          Short load global BASE6
   0177: LDA  01 003b     Load addr G59
   017a: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 017c: LDO  0032        Load global word BASE50
   017e: SLDC 01          Short load constant 1
   017f: EQUI             Integer TOS-1 = TOS
   0180: FJP  $0189       Jump if TOS false
   0182: LAO  0008        Load global BASE8
   0184: SLDC 01          Short load constant 1
   0185: SLDC 01          Short load constant 1
   0186: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0189: UJP  $01ac       Unconditional jump
-> 018b: LDO  0032        Load global word BASE50
   018d: SLDC 01          Short load constant 1
   018e: SBI              Subtract integers (TOS-1 - TOS)
   018f: SLDC 07          Short load constant 7
   0190: LEQI             Integer TOS-1 <= TOS
   0191: FJP  $01ac       Jump if TOS false
   0193: SLDO 06          Short load global BASE6
   0194: LAO  0008        Load global BASE8
   0196: LAO  0035        Load global BASE53
   0198: SLDC 01          Short load constant 1
   0199: LDO  0032        Load global word BASE50
   019b: SLDC 01          Short load constant 1
   019c: SBI              Subtract integers (TOS-1 - TOS)
   019d: CXP  00 19       Call external procedure PASCALSY.SCOPY
   01a0: LAO  0035        Load global BASE53
   01a2: SAS  07          String assign (TOS to TOS-1, 7 chars)
   01a4: LAO  0008        Load global BASE8
   01a6: SLDC 01          Short load constant 1
   01a7: LDO  0032        Load global word BASE50
   01a9: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 01ac: SLDO 06          Short load global BASE6
   01ad: SLDC 00          Short load constant 0
   01ae: LDB              Load byte at byte ptr TOS-1 + TOS
   01af: SLDC 00          Short load constant 0
   01b0: GRTI             Integer TOS-1 > TOS
   01b1: FJP  $030b       Jump if TOS false
   01b3: LSA  01          Load string address: '['
   01b6: NOP              No operation
   01b7: LAO  0008        Load global BASE8
   01b9: SLDC 00          Short load constant 0
   01ba: SLDC 00          Short load constant 0
   01bb: CXP  00 1b       Call external procedure PASCALSY.SPOS
   01be: SRO  0032        Store global word BASE50
   01c0: LDO  0032        Load global word BASE50
   01c2: SLDC 00          Short load constant 0
   01c3: GRTI             Integer TOS-1 > TOS
   01c4: FJP  $01ce       Jump if TOS false
   01c6: LDO  0032        Load global word BASE50
   01c8: SLDC 01          Short load constant 1
   01c9: SBI              Subtract integers (TOS-1 - TOS)
   01ca: SRO  0032        Store global word BASE50
   01cc: UJP  $01d4       Unconditional jump
-> 01ce: LAO  0008        Load global BASE8
   01d0: SLDC 00          Short load constant 0
   01d1: LDB              Load byte at byte ptr TOS-1 + TOS
   01d2: SRO  0032        Store global word BASE50
-> 01d4: LDO  0032        Load global word BASE50
   01d6: SLDC 0f          Short load constant 15
   01d7: LEQI             Integer TOS-1 <= TOS
   01d8: FJP  $030b       Jump if TOS false
   01da: LDO  0032        Load global word BASE50
   01dc: SLDC 00          Short load constant 0
   01dd: GRTI             Integer TOS-1 > TOS
   01de: FJP  $01f7       Jump if TOS false
   01e0: SLDO 05          Short load global BASE5
   01e1: LAO  0008        Load global BASE8
   01e3: LAO  0035        Load global BASE53
   01e5: SLDC 01          Short load constant 1
   01e6: LDO  0032        Load global word BASE50
   01e8: CXP  00 19       Call external procedure PASCALSY.SCOPY
   01eb: LAO  0035        Load global BASE53
   01ed: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   01ef: LAO  0008        Load global BASE8
   01f1: SLDC 01          Short load constant 1
   01f2: LDO  0032        Load global word BASE50
   01f4: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 01f7: LAO  0008        Load global BASE8
   01f9: SLDC 00          Short load constant 0
   01fa: LDB              Load byte at byte ptr TOS-1 + TOS
   01fb: SLDC 00          Short load constant 0
   01fc: EQUI             Integer TOS-1 = TOS
   01fd: FJP  $0204       Jump if TOS false
   01ff: SLDC 01          Short load constant 1
   0200: SRO  0034        Store global word BASE52
   0202: UJP  $027b       Unconditional jump
-> 0204: SLDC 00          Short load constant 0
   0205: SRO  0034        Store global word BASE52
   0207: LSA  01          Load string address: ']'
   020a: NOP              No operation
   020b: LAO  0008        Load global BASE8
   020d: SLDC 00          Short load constant 0
   020e: SLDC 00          Short load constant 0
   020f: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0212: SRO  0031        Store global word BASE49
   0214: LDO  0031        Load global word BASE49
   0216: SLDC 02          Short load constant 2
   0217: EQUI             Integer TOS-1 = TOS
   0218: FJP  $021f       Jump if TOS false
   021a: SLDC 01          Short load constant 1
   021b: SRO  0034        Store global word BASE52
   021d: UJP  $027b       Unconditional jump
-> 021f: LDO  0031        Load global word BASE49
   0221: SLDC 02          Short load constant 2
   0222: GRTI             Integer TOS-1 > TOS
   0223: FJP  $027b       Jump if TOS false
   0225: SLDC 01          Short load constant 1
   0226: SRO  0034        Store global word BASE52
   0228: SLDC 02          Short load constant 2
   0229: SRO  0032        Store global word BASE50
-> 022b: LAO  0008        Load global BASE8
   022d: LDO  0032        Load global word BASE50
   022f: LDB              Load byte at byte ptr TOS-1 + TOS
   0230: SRO  0033        Store global word BASE51
   0232: LDO  0033        Load global word BASE51
   0234: LDA  01 007a     Load addr G122
   0237: LDM  04          Load 4 words from (TOS)
   0239: SLDC 04          Short load constant 4
   023a: INN              Set membership (TOS-1 in set TOS)
   023b: FJP  $024a       Jump if TOS false
   023d: SLDO 04          Short load global BASE4
   023e: SLDO 04          Short load global BASE4
   023f: SIND 00          Short index load *TOS+0
   0240: SLDC 0a          Short load constant 10
   0241: MPI              Multiply integers (TOS * TOS-1)
   0242: LDO  0033        Load global word BASE51
   0244: SLDC 30          Short load constant 48
   0245: SBI              Subtract integers (TOS-1 - TOS)
   0246: ADI              Add integers (TOS + TOS-1)
   0247: STO              Store indirect (TOS into TOS-1)
   0248: UJP  $024d       Unconditional jump
-> 024a: SLDC 00          Short load constant 0
   024b: SRO  0034        Store global word BASE52
-> 024d: LDO  0032        Load global word BASE50
   024f: SLDC 01          Short load constant 1
   0250: ADI              Add integers (TOS + TOS-1)
   0251: SRO  0032        Store global word BASE50
   0253: LDO  0032        Load global word BASE50
   0255: LDO  0031        Load global word BASE49
   0257: EQUI             Integer TOS-1 = TOS
   0258: LDO  0034        Load global word BASE52
   025a: LNOT             Logical NOT (~TOS)
   025b: LOR              Logical OR (TOS | TOS-1)
   025c: FJP  $022b       Jump if TOS false
   025e: LDO  0032        Load global word BASE50
   0260: SLDC 03          Short load constant 3
   0261: EQUI             Integer TOS-1 = TOS
   0262: LDO  0031        Load global word BASE49
   0264: SLDC 03          Short load constant 3
   0265: EQUI             Integer TOS-1 = TOS
   0266: LAND             Logical AND (TOS & TOS-1)
   0267: FJP  $027b       Jump if TOS false
   0269: LAO  0008        Load global BASE8
   026b: LDO  0032        Load global word BASE50
   026d: SLDC 01          Short load constant 1
   026e: SBI              Subtract integers (TOS-1 - TOS)
   026f: LDB              Load byte at byte ptr TOS-1 + TOS
   0270: SLDC 2a          Short load constant 42
   0271: EQUI             Integer TOS-1 = TOS
   0272: FJP  $027b       Jump if TOS false
   0274: SLDO 04          Short load global BASE4
   0275: SLDC 01          Short load constant 1
   0276: NGI              Negate integer
   0277: STO              Store indirect (TOS into TOS-1)
   0278: SLDC 01          Short load constant 1
   0279: SRO  0034        Store global word BASE52
-> 027b: LDO  0034        Load global word BASE52
   027d: SRO  0001        Store global word BASE1
   027f: LDO  0034        Load global word BASE52
   0281: SLDO 05          Short load global BASE5
   0282: SLDC 00          Short load constant 0
   0283: LDB              Load byte at byte ptr TOS-1 + TOS
   0284: SLDC 05          Short load constant 5
   0285: GRTI             Integer TOS-1 > TOS
   0286: LAND             Logical AND (TOS & TOS-1)
   0287: FJP  $030b       Jump if TOS false
   0289: LAO  0008        Load global BASE8
   028b: SLDO 05          Short load global BASE5
   028c: LAO  0035        Load global BASE53
   028e: SLDO 05          Short load global BASE5
   028f: SLDC 00          Short load constant 0
   0290: LDB              Load byte at byte ptr TOS-1 + TOS
   0291: SLDC 04          Short load constant 4
   0292: SBI              Subtract integers (TOS-1 - TOS)
   0293: SLDC 05          Short load constant 5
   0294: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0297: LAO  0035        Load global BASE53
   0299: SAS  50          String assign (TOS to TOS-1, 80 chars)
   029b: LAO  0008        Load global BASE8
   029d: LSA  05          Load string address: '.TEXT'
   02a4: NOP              No operation
   02a5: EQLSTR           String TOS-1 = TOS
   02a7: FJP  $02ae       Jump if TOS false
   02a9: SLDO 03          Short load global BASE3
   02aa: SLDC 03          Short load constant 3
   02ab: STO              Store indirect (TOS into TOS-1)
   02ac: UJP  $030b       Unconditional jump
-> 02ae: LAO  0008        Load global BASE8
   02b0: NOP              No operation
   02b1: LSA  05          Load string address: '.CODE'
   02b8: EQLSTR           String TOS-1 = TOS
   02ba: FJP  $02c1       Jump if TOS false
   02bc: SLDO 03          Short load global BASE3
   02bd: SLDC 02          Short load constant 2
   02be: STO              Store indirect (TOS into TOS-1)
   02bf: UJP  $030b       Unconditional jump
-> 02c1: LAO  0008        Load global BASE8
   02c3: LSA  05          Load string address: '.BACK'
   02ca: NOP              No operation
   02cb: EQLSTR           String TOS-1 = TOS
   02cd: FJP  $02d4       Jump if TOS false
   02cf: SLDO 03          Short load global BASE3
   02d0: SLDC 03          Short load constant 3
   02d1: STO              Store indirect (TOS into TOS-1)
   02d2: UJP  $030b       Unconditional jump
-> 02d4: LAO  0008        Load global BASE8
   02d6: NOP              No operation
   02d7: LSA  05          Load string address: '.INFO'
   02de: EQLSTR           String TOS-1 = TOS
   02e0: FJP  $02e7       Jump if TOS false
   02e2: SLDO 03          Short load global BASE3
   02e3: SLDC 04          Short load constant 4
   02e4: STO              Store indirect (TOS into TOS-1)
   02e5: UJP  $030b       Unconditional jump
-> 02e7: LAO  0008        Load global BASE8
   02e9: LSA  05          Load string address: '.GRAF'
   02f0: NOP              No operation
   02f1: EQLSTR           String TOS-1 = TOS
   02f3: FJP  $02fa       Jump if TOS false
   02f5: SLDO 03          Short load global BASE3
   02f6: SLDC 06          Short load constant 6
   02f7: STO              Store indirect (TOS into TOS-1)
   02f8: UJP  $030b       Unconditional jump
-> 02fa: LAO  0008        Load global BASE8
   02fc: NOP              No operation
   02fd: LSA  05          Load string address: '.FOTO'
   0304: EQLSTR           String TOS-1 = TOS
   0306: FJP  $030b       Jump if TOS false
   0308: SLDO 03          Short load global BASE3
   0309: SLDC 07          Short load constant 7
   030a: STO              Store indirect (TOS into TOS-1)
-> 030b: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC34(PARAM1; PARAM2) (* P=34 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
  BASE4
  BASE5
BEGIN
-> 0324: SLDO 01          Short load global BASE1
   0325: SLDC 00          Short load constant 0
   0326: IXA  000d        Index array (TOS-1 + TOS * 13)
   0328: SRO  0004        Store global word BASE4
   032a: SLDO 02          Short load global BASE2
   032b: SRO  0003        Store global word BASE3
   032d: SLDO 04          Short load global BASE4
   032e: IND  0008        Static index and load word (TOS+8)
   0330: SLDC 01          Short load constant 1
   0331: SBI              Subtract integers (TOS-1 - TOS)
   0332: SRO  0005        Store global word BASE5
-> 0334: SLDO 03          Short load global BASE3
   0335: SLDO 05          Short load global BASE5
   0336: LEQI             Integer TOS-1 <= TOS
   0337: FJP  $034c       Jump if TOS false
   0339: SLDO 01          Short load global BASE1
   033a: SLDO 03          Short load global BASE3
   033b: IXA  000d        Index array (TOS-1 + TOS * 13)
   033d: SLDO 01          Short load global BASE1
   033e: SLDO 03          Short load global BASE3
   033f: SLDC 01          Short load constant 1
   0340: ADI              Add integers (TOS + TOS-1)
   0341: IXA  000d        Index array (TOS-1 + TOS * 13)
   0343: MOV  000d        Move 13 words (TOS to TOS-1)
   0345: SLDO 03          Short load global BASE3
   0346: SLDC 01          Short load constant 1
   0347: ADI              Add integers (TOS + TOS-1)
   0348: SRO  0003        Store global word BASE3
   034a: UJP  $0334       Unconditional jump
-> 034c: SLDO 01          Short load global BASE1
   034d: SLDO 04          Short load global BASE4
   034e: IND  0008        Static index and load word (TOS+8)
   0350: IXA  000d        Index array (TOS-1 + TOS * 13)
   0352: INC  0003        Inc field ptr (TOS+3)
   0354: NOP              No operation
   0355: LSA  00          Load string address: ''
   0357: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0359: SLDO 04          Short load global BASE4
   035a: INC  0008        Inc field ptr (TOS+8)
   035c: SLDO 04          Short load global BASE4
   035d: IND  0008        Static index and load word (TOS+8)
   035f: SLDC 01          Short load constant 1
   0360: SBI              Subtract integers (TOS-1 - TOS)
   0361: STO              Store indirect (TOS into TOS-1)
-> 0362: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC35(PARAM1; PARAM2; PARAM3) (* P=35 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 0b7a: SLDO 01          Short load global BASE1
   0b7b: SLDC 00          Short load constant 0
   0b7c: IXA  000d        Index array (TOS-1 + TOS * 13)
   0b7e: SRO  0005        Store global word BASE5
   0b80: SLDO 05          Short load global BASE5
   0b81: IND  0008        Static index and load word (TOS+8)
   0b83: SRO  0004        Store global word BASE4
   0b85: SLDO 02          Short load global BASE2
   0b86: SRO  0006        Store global word BASE6
-> 0b88: SLDO 04          Short load global BASE4
   0b89: SLDO 06          Short load global BASE6
   0b8a: GEQI             Integer TOS-1 >= TOS
   0b8b: FJP  $0ba0       Jump if TOS false
   0b8d: SLDO 01          Short load global BASE1
   0b8e: SLDO 04          Short load global BASE4
   0b8f: SLDC 01          Short load constant 1
   0b90: ADI              Add integers (TOS + TOS-1)
   0b91: IXA  000d        Index array (TOS-1 + TOS * 13)
   0b93: SLDO 01          Short load global BASE1
   0b94: SLDO 04          Short load global BASE4
   0b95: IXA  000d        Index array (TOS-1 + TOS * 13)
   0b97: MOV  000d        Move 13 words (TOS to TOS-1)
   0b99: SLDO 04          Short load global BASE4
   0b9a: SLDC 01          Short load constant 1
   0b9b: SBI              Subtract integers (TOS-1 - TOS)
   0b9c: SRO  0004        Store global word BASE4
   0b9e: UJP  $0b88       Unconditional jump
-> 0ba0: SLDO 01          Short load global BASE1
   0ba1: SLDO 02          Short load global BASE2
   0ba2: IXA  000d        Index array (TOS-1 + TOS * 13)
   0ba4: SLDO 03          Short load global BASE3
   0ba5: MOV  000d        Move 13 words (TOS to TOS-1)
   0ba7: SLDO 05          Short load global BASE5
   0ba8: INC  0008        Inc field ptr (TOS+8)
   0baa: SLDO 05          Short load global BASE5
   0bab: IND  0008        Static index and load word (TOS+8)
   0bad: SLDC 01          Short load constant 1
   0bae: ADI              Add integers (TOS + TOS-1)
   0baf: STO              Store indirect (TOS into TOS-1)
-> 0bb0: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC36 (* P=36 LL=0 *)
BEGIN
-> 0370: SLDC 04          Short load constant 4
   0371: LOD  01 0001     Load word at G1 (SYSCOM)
   0374: INC  001f        Inc field ptr (TOS+31)
   0376: SLDC 08          Short load constant 8
   0377: SLDC 08          Short load constant 8
   0378: LDP              Load packed field (TOS)
   0379: CBP  34          Call base procedure PASCALSY.52
   037b: LOD  01 0003     Load word at G3 (OUTPUT)
   037e: SLDC 05          Short load constant 5
   037f: SLDC 00          Short load constant 0
   0380: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0383: LOD  01 0003     Load word at G3 (OUTPUT)
   0386: SLDC 0e          Short load constant 14
   0387: SLDC 00          Short load constant 0
   0388: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 038b: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC37 (* P=37 LL=0 *)
  BASE1
  BASE2
BEGIN
-> 0398: CBP  24          Call base procedure PASCALSY.36
   039a: LOD  01 0001     Load word at G1 (SYSCOM)
   039d: SRO  0001        Store global word BASE1
   039f: SLDO 01          Short load global BASE1
   03a0: INC  001f        Inc field ptr (TOS+31)
   03a2: SRO  0002        Store global word BASE2
   03a4: SLDC 03          Short load constant 3
   03a5: CSP  26          Call standard procedure UNITCLEAR
   03a7: SLDO 02          Short load global BASE2
   03a8: INC  0001        Inc field ptr (TOS+1)
   03aa: SLDC 08          Short load constant 8
   03ab: SLDC 00          Short load constant 0
   03ac: LDP              Load packed field (TOS)
   03ad: SLDC 00          Short load constant 0
   03ae: NEQI             Integer TOS-1 <> TOS
   03af: FJP  $03bc       Jump if TOS false
   03b1: SLDC 03          Short load constant 3
   03b2: SLDO 02          Short load global BASE2
   03b3: INC  0001        Inc field ptr (TOS+1)
   03b5: SLDC 08          Short load constant 8
   03b6: SLDC 00          Short load constant 0
   03b7: LDP              Load packed field (TOS)
   03b8: CBP  34          Call base procedure PASCALSY.52
   03ba: UJP  $03c5       Unconditional jump
-> 03bc: SLDC 06          Short load constant 6
   03bd: SLDO 02          Short load global BASE2
   03be: INC  0004        Inc field ptr (TOS+4)
   03c0: SLDC 08          Short load constant 8
   03c1: SLDC 08          Short load constant 8
   03c2: LDP              Load packed field (TOS)
   03c3: CBP  34          Call base procedure PASCALSY.52
-> 03c5: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC38 (* P=38 LL=0 *)
  BASE1
  BASE2
  BASE3
  BASE4
BEGIN
-> 03d2: LOD  01 0001     Load word at G1 (SYSCOM)
   03d5: SRO  0002        Store global word BASE2
   03d7: SLDO 02          Short load global BASE2
   03d8: INC  001f        Inc field ptr (TOS+31)
   03da: SRO  0003        Store global word BASE3
   03dc: SLDO 03          Short load global BASE3
   03dd: INC  0001        Inc field ptr (TOS+1)
   03df: SLDC 08          Short load constant 8
   03e0: SLDC 08          Short load constant 8
   03e1: LDP              Load packed field (TOS)
   03e2: SLDC 00          Short load constant 0
   03e3: NEQI             Integer TOS-1 <> TOS
   03e4: FJP  $03f1       Jump if TOS false
   03e6: SLDC 02          Short load constant 2
   03e7: SLDO 03          Short load global BASE3
   03e8: INC  0001        Inc field ptr (TOS+1)
   03ea: SLDC 08          Short load constant 8
   03eb: SLDC 08          Short load constant 8
   03ec: LDP              Load packed field (TOS)
   03ed: CBP  34          Call base procedure PASCALSY.52
   03ef: UJP  $043b       Unconditional jump
-> 03f1: SLDO 03          Short load global BASE3
   03f2: INC  0004        Inc field ptr (TOS+4)
   03f4: SLDC 08          Short load constant 8
   03f5: SLDC 00          Short load constant 0
   03f6: LDP              Load packed field (TOS)
   03f7: SLDC 00          Short load constant 0
   03f8: NEQI             Integer TOS-1 <> TOS
   03f9: FJP  $0406       Jump if TOS false
   03fb: SLDC 07          Short load constant 7
   03fc: SLDO 03          Short load global BASE3
   03fd: INC  0004        Inc field ptr (TOS+4)
   03ff: SLDC 08          Short load constant 8
   0400: SLDC 00          Short load constant 0
   0401: LDP              Load packed field (TOS)
   0402: CBP  34          Call base procedure PASCALSY.52
   0404: UJP  $043b       Unconditional jump
-> 0406: SLDO 03          Short load global BASE3
   0407: INC  0002        Inc field ptr (TOS+2)
   0409: SLDC 08          Short load constant 8
   040a: SLDC 08          Short load constant 8
   040b: LDP              Load packed field (TOS)
   040c: SLDC 00          Short load constant 0
   040d: NEQI             Integer TOS-1 <> TOS
   040e: FJP  $043b       Jump if TOS false
   0410: SLDC 02          Short load constant 2
   0411: SRO  0001        Store global word BASE1
   0413: SLDO 02          Short load global BASE2
   0414: IND  0026        Static index and load word (TOS+38)
   0416: SRO  0004        Store global word BASE4
-> 0418: SLDO 01          Short load global BASE1
   0419: SLDO 04          Short load global BASE4
   041a: LEQI             Integer TOS-1 <= TOS
   041b: FJP  $042c       Jump if TOS false
   041d: LOD  01 0003     Load word at G3 (OUTPUT)
   0420: SLDC 20          Short load constant 32
   0421: SLDC 00          Short load constant 0
   0422: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0425: SLDO 01          Short load global BASE1
   0426: SLDC 01          Short load constant 1
   0427: ADI              Add integers (TOS + TOS-1)
   0428: SRO  0001        Store global word BASE1
   042a: UJP  $0418       Unconditional jump
-> 042c: LOD  01 0003     Load word at G3 (OUTPUT)
   042f: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0432: SLDC 00          Short load constant 0
   0433: SLDO 03          Short load global BASE3
   0434: INC  0002        Inc field ptr (TOS+2)
   0436: SLDC 08          Short load constant 8
   0437: SLDC 08          Short load constant 8
   0438: LDP              Load packed field (TOS)
   0439: CBP  34          Call base procedure PASCALSY.52
-> 043b: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC39 (* P=39 LL=0 *)
BEGIN
-> 044a: CBP  24          Call base procedure PASCALSY.36
   044c: CBP  26          Call base procedure PASCALSY.38
   044e: LOD  01 0003     Load word at G3 (OUTPUT)
   0451: LDA  01 0046     Load addr G70
   0454: SLDC 00          Short load constant 0
   0455: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0458: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC40(PARAM1): RETVAL (* P=40 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
BEGIN
-> 0464: LOD  01 0003     Load word at G3 (OUTPUT)
   0467: LSA  18          Load string address: 'Type <space> to continue'
   0481: NOP              No operation
   0482: SLDC 00          Short load constant 0
   0483: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0486: SLDO 03          Short load global BASE3
   0487: SLDC 00          Short load constant 0
   0488: SLDC 00          Short load constant 0
   0489: CBP  29          Call base procedure PASCALSY.41
   048b: SRO  0004        Store global word BASE4
   048d: LOD  01 0002     Load word at G2 (INPUT)
   0490: SLDC 00          Short load constant 0
   0491: SLDC 00          Short load constant 0
   0492: CXP  00 0b       Call external procedure PASCALSY.FEOLN
   0495: LNOT             Logical NOT (~TOS)
   0496: FJP  $049e       Jump if TOS false
   0498: LOD  01 0003     Load word at G3 (OUTPUT)
   049b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 049e: CBP  26          Call base procedure PASCALSY.38
   04a0: SLDO 04          Short load global BASE4
   04a1: SLDC 20          Short load constant 32
   04a2: EQUI             Integer TOS-1 = TOS
   04a3: SLDO 04          Short load global BASE4
   04a4: LOD  01 0001     Load word at G1 (SYSCOM)
   04a7: INC  002c        Inc field ptr (TOS+44)
   04a9: SLDC 08          Short load constant 8
   04aa: SLDC 08          Short load constant 8
   04ab: LDP              Load packed field (TOS)
   04ac: EQUI             Integer TOS-1 = TOS
   04ad: LOR              Logical OR (TOS | TOS-1)
   04ae: FJP  $0464       Jump if TOS false
   04b0: SLDO 04          Short load global BASE4
   04b1: SLDC 20          Short load constant 32
   04b2: NEQI             Integer TOS-1 <> TOS
   04b3: SRO  0001        Store global word BASE1
-> 04b5: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FUNC41(PARAM1): RETVAL (* P=41 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
BEGIN
-> 04c4: SLDO 03          Short load global BASE3
   04c5: FJP  $04ca       Jump if TOS false
   04c7: SLDC 01          Short load constant 1
   04c8: CSP  26          Call standard procedure UNITCLEAR
-> 04ca: LOD  01 003a     Load word at G58
   04cd: SIND 02          Short index load *TOS+2
   04ce: FJP  $04d4       Jump if TOS false
   04d0: SLDC 00          Short load constant 0
   04d1: SLDC 30          Short load constant 48
   04d2: CSP  04          Call standard procedure EXIT
-> 04d4: LOD  01 003a     Load word at G58
   04d7: INC  0003        Inc field ptr (TOS+3)
   04d9: SLDC 01          Short load constant 1
   04da: STO              Store indirect (TOS into TOS-1)
   04db: LOD  01 0002     Load word at G2 (INPUT)
   04de: LAO  0004        Load global BASE4
   04e0: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   04e3: SLDO 04          Short load global BASE4
   04e4: SLDC 61          Short load constant 97
   04e5: GEQI             Integer TOS-1 >= TOS
   04e6: SLDO 04          Short load global BASE4
   04e7: SLDC 7a          Short load constant 122
   04e8: LEQI             Integer TOS-1 <= TOS
   04e9: LAND             Logical AND (TOS & TOS-1)
   04ea: FJP  $04f3       Jump if TOS false
   04ec: SLDO 04          Short load global BASE4
   04ed: SLDC 61          Short load constant 97
   04ee: SBI              Subtract integers (TOS-1 - TOS)
   04ef: SLDC 41          Short load constant 65
   04f0: ADI              Add integers (TOS + TOS-1)
   04f1: SRO  0004        Store global word BASE4
-> 04f3: SLDO 04          Short load global BASE4
   04f4: SRO  0001        Store global word BASE1
-> 04f6: RBP  01          Return from base procedure
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
-> 0502: SLDC 00          Short load constant 0
   0503: SRO  0001        Store global word BASE1
   0505: LOD  01 0001     Load word at G1 (SYSCOM)
   0508: SRO  0007        Store global word BASE7
   050a: LDA  01 007e     Load addr G126
   050d: SLDO 03          Short load global BASE3
   050e: IXA  0006        Index array (TOS-1 + TOS * 6)
   0510: SRO  0008        Store global word BASE8
   0512: SLDO 07          Short load global BASE7
   0513: SIND 04          Short index load *TOS+4
   0514: LDCN             Load constant NIL
   0515: EQUI             Integer TOS-1 = TOS
   0516: FJP  $0520       Jump if TOS false
   0518: SLDO 07          Short load global BASE7
   0519: INC  0004        Inc field ptr (TOS+4)
   051b: LDCI 03f6        Load word 1014
   051e: CSP  01          Call standard procedure NEW
-> 0520: SLDO 03          Short load global BASE3
   0521: SLDO 07          Short load global BASE7
   0522: SIND 04          Short index load *TOS+4
   0523: SLDC 00          Short load constant 0
   0524: LDCI 07ec        Load word 2028
   0527: SLDC 02          Short load constant 2
   0528: SLDC 00          Short load constant 0
   0529: CSP  05          Call standard procedure UNITREAD
   052b: SLDO 07          Short load global BASE7
   052c: SIND 00          Short index load *TOS+0
   052d: SLDC 00          Short load constant 0
   052e: EQUI             Integer TOS-1 = TOS
   052f: SRO  0005        Store global word BASE5
   0531: SLDO 05          Short load global BASE5
   0532: FJP  $0619       Jump if TOS false
   0534: SLDO 07          Short load global BASE7
   0535: SIND 04          Short index load *TOS+4
   0536: SLDC 00          Short load constant 0
   0537: IXA  000d        Index array (TOS-1 + TOS * 13)
   0539: SRO  0009        Store global word BASE9
   053b: SLDC 00          Short load constant 0
   053c: SRO  0005        Store global word BASE5
   053e: SLDO 09          Short load global BASE9
   053f: SIND 00          Short index load *TOS+0
   0540: SLDC 00          Short load constant 0
   0541: EQUI             Integer TOS-1 = TOS
   0542: SLDO 07          Short load global BASE7
   0543: INC  001d        Inc field ptr (TOS+29)
   0545: SLDC 02          Short load constant 2
   0546: SLDC 07          Short load constant 7
   0547: LDP              Load packed field (TOS)
   0548: SLDC 02          Short load constant 2
   0549: EQUI             Integer TOS-1 = TOS
   054a: SLDO 07          Short load global BASE7
   054b: INC  001d        Inc field ptr (TOS+29)
   054d: SLDC 02          Short load constant 2
   054e: SLDC 07          Short load constant 7
   054f: LDP              Load packed field (TOS)
   0550: SLDC 0a          Short load constant 10
   0551: SLDC 01          Short load constant 1
   0552: INN              Set membership (TOS-1 in set TOS)
   0553: SLDO 09          Short load global BASE9
   0554: INC  0002        Inc field ptr (TOS+2)
   0556: SLDC 04          Short load constant 4
   0557: SLDC 00          Short load constant 0
   0558: LDP              Load packed field (TOS)
   0559: SLDC 08          Short load constant 8
   055a: EQUI             Integer TOS-1 = TOS
   055b: LAND             Logical AND (TOS & TOS-1)
   055c: LOR              Logical OR (TOS | TOS-1)
   055d: SLDO 07          Short load global BASE7
   055e: INC  001d        Inc field ptr (TOS+29)
   0560: SLDC 02          Short load constant 2
   0561: SLDC 07          Short load constant 7
   0562: LDP              Load packed field (TOS)
   0563: SLDC 00          Short load constant 0
   0564: EQUI             Integer TOS-1 = TOS
   0565: SLDO 09          Short load global BASE9
   0566: INC  0002        Inc field ptr (TOS+2)
   0568: SLDC 04          Short load constant 4
   0569: SLDC 00          Short load constant 0
   056a: LDP              Load packed field (TOS)
   056b: SLDC 00          Short load constant 0
   056c: EQUI             Integer TOS-1 = TOS
   056d: LAND             Logical AND (TOS & TOS-1)
   056e: LOR              Logical OR (TOS | TOS-1)
   056f: LAND             Logical AND (TOS & TOS-1)
   0570: FJP  $0603       Jump if TOS false
   0572: SLDO 09          Short load global BASE9
   0573: INC  0003        Inc field ptr (TOS+3)
   0575: SLDC 00          Short load constant 0
   0576: LDB              Load byte at byte ptr TOS-1 + TOS
   0577: SLDC 00          Short load constant 0
   0578: GRTI             Integer TOS-1 > TOS
   0579: SLDO 09          Short load global BASE9
   057a: INC  0003        Inc field ptr (TOS+3)
   057c: SLDC 00          Short load constant 0
   057d: LDB              Load byte at byte ptr TOS-1 + TOS
   057e: SLDC 07          Short load constant 7
   057f: LEQI             Integer TOS-1 <= TOS
   0580: LAND             Logical AND (TOS & TOS-1)
   0581: SLDO 09          Short load global BASE9
   0582: IND  0008        Static index and load word (TOS+8)
   0584: SLDC 00          Short load constant 0
   0585: GEQI             Integer TOS-1 >= TOS
   0586: LAND             Logical AND (TOS & TOS-1)
   0587: SLDO 09          Short load global BASE9
   0588: IND  0008        Static index and load word (TOS+8)
   058a: SLDC 4d          Short load constant 77
   058b: LEQI             Integer TOS-1 <= TOS
   058c: LAND             Logical AND (TOS & TOS-1)
   058d: FJP  $0603       Jump if TOS false
   058f: SLDC 01          Short load constant 1
   0590: SRO  0005        Store global word BASE5
   0592: SLDO 09          Short load global BASE9
   0593: INC  0003        Inc field ptr (TOS+3)
   0595: SLDO 08          Short load global BASE8
   0596: NEQSTR           String TOS-1 <> TOS
   0598: FJP  $0603       Jump if TOS false
   059a: SLDC 01          Short load constant 1
   059b: SRO  0004        Store global word BASE4
-> 059d: SLDO 04          Short load global BASE4
   059e: SLDO 09          Short load global BASE9
   059f: IND  0008        Static index and load word (TOS+8)
   05a1: LEQI             Integer TOS-1 <= TOS
   05a2: FJP  $05ea       Jump if TOS false
   05a4: SLDO 07          Short load global BASE7
   05a5: SIND 04          Short index load *TOS+4
   05a6: SLDO 04          Short load global BASE4
   05a7: IXA  000d        Index array (TOS-1 + TOS * 13)
   05a9: SRO  000a        Store global word BASE10
   05ab: SLDO 0a          Short load global BASE10
   05ac: INC  0003        Inc field ptr (TOS+3)
   05ae: SLDC 00          Short load constant 0
   05af: LDB              Load byte at byte ptr TOS-1 + TOS
   05b0: SLDC 00          Short load constant 0
   05b1: LEQI             Integer TOS-1 <= TOS
   05b2: SLDO 0a          Short load global BASE10
   05b3: INC  0003        Inc field ptr (TOS+3)
   05b5: SLDC 00          Short load constant 0
   05b6: LDB              Load byte at byte ptr TOS-1 + TOS
   05b7: SLDC 0f          Short load constant 15
   05b8: GRTI             Integer TOS-1 > TOS
   05b9: LOR              Logical OR (TOS | TOS-1)
   05ba: SLDO 0a          Short load global BASE10
   05bb: SIND 01          Short index load *TOS+1
   05bc: SLDO 0a          Short load global BASE10
   05bd: SIND 00          Short index load *TOS+0
   05be: LESI             Integer TOS-1 < TOS
   05bf: LOR              Logical OR (TOS | TOS-1)
   05c0: SLDO 0a          Short load global BASE10
   05c1: IND  000b        Static index and load word (TOS+11)
   05c3: LDCI 0200        Load word 512
   05c6: GRTI             Integer TOS-1 > TOS
   05c7: LOR              Logical OR (TOS | TOS-1)
   05c8: SLDO 0a          Short load global BASE10
   05c9: IND  000b        Static index and load word (TOS+11)
   05cb: SLDC 00          Short load constant 0
   05cc: LEQI             Integer TOS-1 <= TOS
   05cd: LOR              Logical OR (TOS | TOS-1)
   05ce: SLDO 0a          Short load global BASE10
   05cf: INC  000c        Inc field ptr (TOS+12)
   05d1: SLDC 07          Short load constant 7
   05d2: SLDC 09          Short load constant 9
   05d3: LDP              Load packed field (TOS)
   05d4: SLDC 64          Short load constant 100
   05d5: GEQI             Integer TOS-1 >= TOS
   05d6: LOR              Logical OR (TOS | TOS-1)
   05d7: FJP  $05e3       Jump if TOS false
   05d9: SLDC 00          Short load constant 0
   05da: SRO  0005        Store global word BASE5
   05dc: SLDO 04          Short load global BASE4
   05dd: SLDO 07          Short load global BASE7
   05de: SIND 04          Short index load *TOS+4
   05df: CBP  22          Call base procedure PASCALSY.34
   05e1: UJP  $05e8       Unconditional jump
-> 05e3: SLDO 04          Short load global BASE4
   05e4: SLDC 01          Short load constant 1
   05e5: ADI              Add integers (TOS + TOS-1)
   05e6: SRO  0004        Store global word BASE4
-> 05e8: UJP  $059d       Unconditional jump
-> 05ea: SLDO 05          Short load global BASE5
   05eb: LNOT             Logical NOT (~TOS)
   05ec: FJP  $0603       Jump if TOS false
   05ee: SLDO 03          Short load global BASE3
   05ef: SLDO 07          Short load global BASE7
   05f0: SIND 04          Short index load *TOS+4
   05f1: SLDC 00          Short load constant 0
   05f2: SLDO 09          Short load global BASE9
   05f3: IND  0008        Static index and load word (TOS+8)
   05f5: SLDC 01          Short load constant 1
   05f6: ADI              Add integers (TOS + TOS-1)
   05f7: SLDC 1a          Short load constant 26
   05f8: MPI              Multiply integers (TOS * TOS-1)
   05f9: SLDC 02          Short load constant 2
   05fa: SLDC 00          Short load constant 0
   05fb: CSP  06          Call standard procedure UNITWRITE
   05fd: SLDO 07          Short load global BASE7
   05fe: SIND 00          Short index load *TOS+0
   05ff: SLDC 00          Short load constant 0
   0600: EQUI             Integer TOS-1 = TOS
   0601: SRO  0005        Store global word BASE5
-> 0603: SLDO 05          Short load global BASE5
   0604: FJP  $0619       Jump if TOS false
   0606: SLDO 08          Short load global BASE8
   0607: SLDO 09          Short load global BASE9
   0608: INC  0003        Inc field ptr (TOS+3)
   060a: SAS  07          String assign (TOS to TOS-1, 7 chars)
   060c: SLDO 08          Short load global BASE8
   060d: INC  0005        Inc field ptr (TOS+5)
   060f: SLDO 09          Short load global BASE9
   0610: SIND 07          Short index load *TOS+7
   0611: STO              Store indirect (TOS into TOS-1)
   0612: LAO  0006        Load global BASE6
   0614: SLDO 09          Short load global BASE9
   0615: INC  0009        Inc field ptr (TOS+9)
   0617: CSP  09          Call standard procedure TIME
-> 0619: SLDO 05          Short load global BASE5
   061a: SRO  0001        Store global word BASE1
   061c: SLDO 05          Short load global BASE5
   061d: LNOT             Logical NOT (~TOS)
   061e: FJP  $0637       Jump if TOS false
   0620: SLDO 08          Short load global BASE8
   0621: LSA  00          Load string address: ''
   0623: NOP              No operation
   0624: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0626: SLDO 08          Short load global BASE8
   0627: INC  0005        Inc field ptr (TOS+5)
   0629: LDCI 7fff        Load word 32767
   062c: STO              Store indirect (TOS into TOS-1)
   062d: SLDO 07          Short load global BASE7
   062e: INC  0004        Inc field ptr (TOS+4)
   0630: CSP  21          Call standard procedure RELEASE
   0632: SLDO 07          Short load global BASE7
   0633: INC  0004        Inc field ptr (TOS+4)
   0635: LDCN             Load constant NIL
   0636: STO              Store indirect (TOS into TOS-1)
-> 0637: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC43(PARAM1; PARAM2; PARAM3) (* P=43 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE294
BEGIN
-> 064a: SLDC 04          Short load constant 4
   064b: LAO  0004        Load global BASE4
   064d: SLDO 03          Short load global BASE3
   064e: SLDO 02          Short load global BASE2
   064f: LDO  0126        Load global word BASE294
   0652: SLDO 01          Short load global BASE1
   0653: CXP  06 01       Call external procedure FILEPROC.1
-> 0656: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC44(PARAM1) (* P=44 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 0662: LOD  01 017d     Load word at G381
   0666: LOD  01 017f     Load word at G383
   066a: SLDO 01          Short load global BASE1
   066b: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   066c: LOD  01 017f     Load word at G383
   0670: SLDC 01          Short load constant 1
   0671: ADI              Add integers (TOS + TOS-1)
   0672: STR  01 017f     Store TOS to G383
   0676: LOD  01 017f     Load word at G383
   067a: LDCI 01fd        Load word 509
   067d: GRTI             Integer TOS-1 > TOS
   067e: LOD  01 0181     Load word at G385
   0682: LAND             Logical AND (TOS & TOS-1)
   0683: FJP  $0693       Jump if TOS false
   0685: LOD  01 017d     Load word at G381
   0689: LOD  01 017f     Load word at G383
   068d: SLDC 0d          Short load constant 13
   068e: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   068f: CBP  2f          Call base procedure PASCALSY.47
   0691: UJP  $069f       Unconditional jump
-> 0693: LOD  01 017f     Load word at G383
   0697: LDCI 01ff        Load word 511
   069a: GRTI             Integer TOS-1 > TOS
   069b: FJP  $069f       Jump if TOS false
   069d: CBP  2f          Call base procedure PASCALSY.47
-> 069f: SLDO 01          Short load global BASE1
   06a0: LOD  01 018b     Load word at G395
   06a4: EQUI             Integer TOS-1 = TOS
   06a5: FJP  $06b5       Jump if TOS false
   06a7: LOD  01 018a     Load word at G394
   06ab: LOD  01 018b     Load word at G395
   06af: EQUI             Integer TOS-1 = TOS
   06b0: FJP  $06b5       Jump if TOS false
   06b2: SLDC 01          Short load constant 1
   06b3: CBP  2d          Call base procedure PASCALSY.45
-> 06b5: SLDO 01          Short load global BASE1
   06b6: STR  01 018a     Store TOS to G394
-> 06ba: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC45(PARAM1) (* P=45 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 06c6: LOD  01 0182     Load word at G386
   06ca: FJP  $06db       Jump if TOS false
   06cc: SLDC 00          Short load constant 0
   06cd: STR  01 0182     Store TOS to G386
   06d1: LDA  01 018c     Load addr G396
   06d5: SLDC 00          Short load constant 0
   06d6: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   06d9: UJP  $070e       Unconditional jump
-> 06db: SLDO 01          Short load global BASE1
   06dc: FJP  $0701       Jump if TOS false
   06de: SLDC 20          Short load constant 32
   06df: STR  01 018a     Store TOS to G394
   06e3: LOD  01 018b     Load word at G395
   06e7: CBP  2c          Call base procedure PASCALSY.44
   06e9: SLDC 20          Short load constant 32
   06ea: STR  01 018a     Store TOS to G394
   06ee: LOD  01 018b     Load word at G395
   06f2: CBP  2c          Call base procedure PASCALSY.44
   06f4: SLDC 0d          Short load constant 13
   06f5: CBP  2c          Call base procedure PASCALSY.44
   06f7: CBP  2f          Call base procedure PASCALSY.47
   06f9: LOD  01 0181     Load word at G385
   06fd: FJP  $0701       Jump if TOS false
   06ff: CBP  2f          Call base procedure PASCALSY.47
-> 0701: SLDC 00          Short load constant 0
   0702: STR  01 0183     Store TOS to G387
   0706: LDA  01 018c     Load addr G396
   070a: SLDC 01          Short load constant 1
   070b: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 070e: LOD  01 017e     Load word at G382
   0712: STR  01 0036     Store TOS to G54
   0715: SLDC 01          Short load constant 1
   0716: STR  01 0187     Store TOS to G391
-> 071a: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC46 (* P=46 LL=0 *)
BEGIN
-> 0726: LOD  01 0181     Load word at G385
   072a: SLDC 01          Short load constant 1
   072b: ADI              Add integers (TOS + TOS-1)
   072c: STR  01 0181     Store TOS to G385
   0730: LDA  01 018c     Load addr G396
   0734: LOD  01 017d     Load word at G381
   0738: SLDC 00          Short load constant 0
   0739: SLDC 01          Short load constant 1
   073a: LOD  01 0181     Load word at G385
   073e: SLDC 01          Short load constant 1
   073f: SLDC 00          Short load constant 0
   0740: SLDC 00          Short load constant 0
   0741: CXP  00 1c       Call external procedure PASCALSY.FBLOCKIO
   0744: SLDC 01          Short load constant 1
   0745: NEQI             Integer TOS-1 <> TOS
   0746: FJP  $077a       Jump if TOS false
   0748: LOD  01 0003     Load word at G3 (OUTPUT)
   074b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   074e: LOD  01 0003     Load word at G3 (OUTPUT)
   0751: LSA  17          Load string address: 'Error reading exec file'
   076a: NOP              No operation
   076b: SLDC 00          Short load constant 0
   076c: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   076f: LOD  01 0003     Load word at G3 (OUTPUT)
   0772: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0775: SLDC 01          Short load constant 1
   0776: CBP  2d          Call base procedure PASCALSY.45
   0778: UJP  $07a6       Unconditional jump
-> 077a: SLDC 00          Short load constant 0
   077b: STR  01 017f     Store TOS to G383
   077f: LOD  01 0181     Load word at G385
   0783: FJP  $079f       Jump if TOS false
   0785: LDCI 01fe        Load word 510
   0788: LDCI 01ff        Load word 511
   078b: NGI              Negate integer
   078c: SLDC 00          Short load constant 0
   078d: SLDC 0d          Short load constant 13
   078e: LOD  01 017d     Load word at G381
   0792: LDCI 01ff        Load word 511
   0795: SLDC 00          Short load constant 0
   0796: CSP  0b          Call standard procedure SCAN
   0798: ADI              Add integers (TOS + TOS-1)
   0799: STR  01 0180     Store TOS to G384
   079d: UJP  $07a6       Unconditional jump
-> 079f: LDCI 01ff        Load word 511
   07a2: STR  01 0180     Store TOS to G384
-> 07a6: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC47 (* P=47 LL=0 *)
BEGIN
-> 07b2: LDA  01 018c     Load addr G396
   07b6: LOD  01 017d     Load word at G381
   07ba: SLDC 00          Short load constant 0
   07bb: SLDC 01          Short load constant 1
   07bc: LOD  01 0181     Load word at G385
   07c0: SLDC 00          Short load constant 0
   07c1: SLDC 00          Short load constant 0
   07c2: SLDC 00          Short load constant 0
   07c3: CXP  00 1c       Call external procedure PASCALSY.FBLOCKIO
   07c6: SLDC 01          Short load constant 1
   07c7: NEQI             Integer TOS-1 <> TOS
   07c8: FJP  $07fc       Jump if TOS false
   07ca: LOD  01 0003     Load word at G3 (OUTPUT)
   07cd: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   07d0: LOD  01 0003     Load word at G3 (OUTPUT)
   07d3: LSA  17          Load string address: 'Error writing exec file'
   07ec: NOP              No operation
   07ed: SLDC 00          Short load constant 0
   07ee: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   07f1: LOD  01 0003     Load word at G3 (OUTPUT)
   07f4: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   07f7: SLDC 00          Short load constant 0
   07f8: CBP  2d          Call base procedure PASCALSY.45
   07fa: UJP  $0816       Unconditional jump
-> 07fc: LOD  01 017d     Load word at G381
   0800: SLDC 00          Short load constant 0
   0801: LDCI 0200        Load word 512
   0804: SLDC 00          Short load constant 0
   0805: CSP  0a          Call standard procedure FLCH
   0807: SLDC 00          Short load constant 0
   0808: STR  01 017f     Store TOS to G383
   080c: LOD  01 0181     Load word at G385
   0810: SLDC 01          Short load constant 1
   0811: ADI              Add integers (TOS + TOS-1)
   0812: STR  01 0181     Store TOS to G385
-> 0816: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC48 (* P=48 LL=0 *)
BEGIN
-> 0822: SLDC 00          Short load constant 0
   0823: STR  01 0045     Store TOS to G69
   0826: SLDC 00          Short load constant 0
   0827: STR  01 0184     Store TOS to G388
-> 082b: CBP  38          Call base procedure PASCALSY.56
   082d: CLP  3a          Call local procedure PASCALSY.58
   082f: LOD  01 0184     Load word at G388
   0833: FJP  $083a       Jump if TOS false
   0835: LDCN             Load constant NIL
   0836: LDCN             Load constant NIL
   0837: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
-> 083a: LOD  01 0045     Load word at G69
   083d: SLDC 00          Short load constant 0
   083e: EQUI             Integer TOS-1 = TOS
   083f: FJP  $082b       Jump if TOS false
-> 0841: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC49(PARAM1): RETVAL (* P=49 LL=0 *)
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
-> 0850: SLDC 01          Short load constant 1
   0851: SRO  0001        Store global word BASE1
   0853: SLDC 00          Short load constant 0
   0854: SRO  0005        Store global word BASE5
   0856: SLDO 03          Short load global BASE3
   0857: SRO  0009        Store global word BASE9
   0859: SLDO 09          Short load global BASE9
   085a: INC  0010        Inc field ptr (TOS+16)
   085c: SRO  000a        Store global word BASE10
   085e: SLDO 0a          Short load global BASE10
   085f: INC  0003        Inc field ptr (TOS+3)
   0861: SLDC 00          Short load constant 0
   0862: LDB              Load byte at byte ptr TOS-1 + TOS
   0863: SLDC 00          Short load constant 0
   0864: GRTI             Integer TOS-1 > TOS
   0865: FJP  $092c       Jump if TOS false
   0867: SLDO 09          Short load global BASE9
   0868: SIND 07          Short index load *TOS+7
   0869: SLDO 09          Short load global BASE9
   086a: INC  0008        Inc field ptr (TOS+8)
   086c: SLDC 00          Short load constant 0
   086d: LAO  0008        Load global BASE8
   086f: SLDC 00          Short load constant 0
   0870: SLDC 00          Short load constant 0
   0871: CBP  1e          Call base procedure PASCALSY.30
   0873: NEQI             Integer TOS-1 <> TOS
   0874: FJP  $087d       Jump if TOS false
   0876: LOD  01 0001     Load word at G1 (SYSCOM)
   0879: SLDC 05          Short load constant 5
   087a: STO              Store indirect (TOS into TOS-1)
   087b: UJP  $092c       Unconditional jump
-> 087d: SLDC 00          Short load constant 0
   087e: SRO  0006        Store global word BASE6
   0880: SLDC 01          Short load constant 1
   0881: SRO  0004        Store global word BASE4
-> 0883: SLDO 04          Short load global BASE4
   0884: SLDO 08          Short load global BASE8
   0885: SLDC 00          Short load constant 0
   0886: IXA  000d        Index array (TOS-1 + TOS * 13)
   0888: IND  0008        Static index and load word (TOS+8)
   088a: LEQI             Integer TOS-1 <= TOS
   088b: SLDO 06          Short load global BASE6
   088c: LNOT             Logical NOT (~TOS)
   088d: LAND             Logical AND (TOS & TOS-1)
   088e: FJP  $08aa       Jump if TOS false
   0890: SLDO 08          Short load global BASE8
   0891: SLDO 04          Short load global BASE4
   0892: IXA  000d        Index array (TOS-1 + TOS * 13)
   0894: SIND 00          Short index load *TOS+0
   0895: SLDO 0a          Short load global BASE10
   0896: SIND 00          Short index load *TOS+0
   0897: EQUI             Integer TOS-1 = TOS
   0898: SLDO 08          Short load global BASE8
   0899: SLDO 04          Short load global BASE4
   089a: IXA  000d        Index array (TOS-1 + TOS * 13)
   089c: SIND 01          Short index load *TOS+1
   089d: SLDO 0a          Short load global BASE10
   089e: SIND 01          Short index load *TOS+1
   089f: EQUI             Integer TOS-1 = TOS
   08a0: LAND             Logical AND (TOS & TOS-1)
   08a1: SRO  0006        Store global word BASE6
   08a3: SLDO 04          Short load global BASE4
   08a4: SLDC 01          Short load constant 1
   08a5: ADI              Add integers (TOS + TOS-1)
   08a6: SRO  0004        Store global word BASE4
   08a8: UJP  $0883       Unconditional jump
-> 08aa: SLDO 06          Short load global BASE6
   08ab: LNOT             Logical NOT (~TOS)
   08ac: FJP  $08b5       Jump if TOS false
   08ae: LOD  01 0001     Load word at G1 (SYSCOM)
   08b1: SLDC 06          Short load constant 6
   08b2: STO              Store indirect (TOS into TOS-1)
   08b3: UJP  $092c       Unconditional jump
-> 08b5: SLDO 04          Short load global BASE4
   08b6: SLDO 08          Short load global BASE8
   08b7: SLDC 00          Short load constant 0
   08b8: IXA  000d        Index array (TOS-1 + TOS * 13)
   08ba: IND  0008        Static index and load word (TOS+8)
   08bc: GRTI             Integer TOS-1 > TOS
   08bd: FJP  $08c8       Jump if TOS false
   08bf: SLDO 08          Short load global BASE8
   08c0: SLDC 00          Short load constant 0
   08c1: IXA  000d        Index array (TOS-1 + TOS * 13)
   08c3: SIND 07          Short index load *TOS+7
   08c4: SRO  0007        Store global word BASE7
   08c6: UJP  $08cf       Unconditional jump
-> 08c8: SLDO 08          Short load global BASE8
   08c9: SLDO 04          Short load global BASE4
   08ca: IXA  000d        Index array (TOS-1 + TOS * 13)
   08cc: SIND 00          Short index load *TOS+0
   08cd: SRO  0007        Store global word BASE7
-> 08cf: SLDO 0a          Short load global BASE10
   08d0: SIND 01          Short index load *TOS+1
   08d1: SLDO 07          Short load global BASE7
   08d2: LESI             Integer TOS-1 < TOS
   08d3: SLDO 0a          Short load global BASE10
   08d4: IND  000b        Static index and load word (TOS+11)
   08d6: LDCI 0200        Load word 512
   08d9: LESI             Integer TOS-1 < TOS
   08da: LOR              Logical OR (TOS | TOS-1)
   08db: FJP  $0929       Jump if TOS false
   08dd: SLDO 08          Short load global BASE8
   08de: SLDO 04          Short load global BASE4
   08df: SLDC 01          Short load constant 1
   08e0: SBI              Subtract integers (TOS-1 - TOS)
   08e1: IXA  000d        Index array (TOS-1 + TOS * 13)
   08e3: SRO  000b        Store global word BASE11
   08e5: SLDO 0b          Short load global BASE11
   08e6: INC  0001        Inc field ptr (TOS+1)
   08e8: SLDO 07          Short load global BASE7
   08e9: STO              Store indirect (TOS into TOS-1)
   08ea: SLDO 0b          Short load global BASE11
   08eb: INC  000b        Inc field ptr (TOS+11)
   08ed: LDCI 0200        Load word 512
   08f0: STO              Store indirect (TOS into TOS-1)
   08f1: SLDO 09          Short load global BASE9
   08f2: SIND 07          Short index load *TOS+7
   08f3: SLDO 08          Short load global BASE8
   08f4: CBP  1f          Call base procedure PASCALSY.31
   08f6: CSP  22          Call standard procedure IORESULT
   08f8: SLDC 00          Short load constant 0
   08f9: NEQI             Integer TOS-1 <> TOS
   08fa: FJP  $08fe       Jump if TOS false
   08fc: UJP  $092c       Unconditional jump
-> 08fe: SLDO 09          Short load global BASE9
   08ff: INC  0002        Inc field ptr (TOS+2)
   0901: SLDC 00          Short load constant 0
   0902: STO              Store indirect (TOS into TOS-1)
   0903: SLDO 09          Short load global BASE9
   0904: INC  0001        Inc field ptr (TOS+1)
   0906: SLDC 00          Short load constant 0
   0907: STO              Store indirect (TOS into TOS-1)
   0908: SLDO 09          Short load global BASE9
   0909: SIND 03          Short index load *TOS+3
   090a: SLDC 00          Short load constant 0
   090b: NEQI             Integer TOS-1 <> TOS
   090c: FJP  $0913       Jump if TOS false
   090e: SLDO 09          Short load global BASE9
   090f: INC  0003        Inc field ptr (TOS+3)
   0911: SLDC 01          Short load constant 1
   0912: STO              Store indirect (TOS into TOS-1)
-> 0913: SLDO 0a          Short load global BASE10
   0914: INC  0001        Inc field ptr (TOS+1)
   0916: SLDO 07          Short load global BASE7
   0917: STO              Store indirect (TOS into TOS-1)
   0918: SLDO 0a          Short load global BASE10
   0919: INC  000b        Inc field ptr (TOS+11)
   091b: LDCI 0200        Load word 512
   091e: STO              Store indirect (TOS into TOS-1)
   091f: SLDO 0a          Short load global BASE10
   0920: INC  000c        Inc field ptr (TOS+12)
   0922: SLDC 07          Short load constant 7
   0923: SLDC 09          Short load constant 9
   0924: SLDC 64          Short load constant 100
   0925: STP              Store packed field (TOS into TOS-1)
   0926: SLDC 00          Short load constant 0
   0927: SRO  0001        Store global word BASE1
-> 0929: SLDC 01          Short load constant 1
   092a: SRO  0005        Store global word BASE5
-> 092c: SLDO 05          Short load global BASE5
   092d: LNOT             Logical NOT (~TOS)
   092e: FJP  $093a       Jump if TOS false
   0930: SLDO 03          Short load global BASE3
   0931: INC  0002        Inc field ptr (TOS+2)
   0933: SLDC 01          Short load constant 1
   0934: STO              Store indirect (TOS into TOS-1)
   0935: SLDO 03          Short load global BASE3
   0936: INC  0001        Inc field ptr (TOS+1)
   0938: SLDC 01          Short load constant 1
   0939: STO              Store indirect (TOS into TOS-1)
-> 093a: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC50 (* P=50 LL=1 *)
  MP1
BEGIN
-> 094c: LOD  02 0001     Load word at G1 (SYSCOM)
   094f: STL  0001        Store TOS into MP1
   0951: LOD  02 0003     Load word at G3 (OUTPUT)
   0954: NOP              No operation
   0955: LSA  03          Load string address: 'S# '
   095a: SLDC 00          Short load constant 0
   095b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   095e: LOD  02 0003     Load word at G3 (OUTPUT)
   0961: SLDL 01          Short load local MP1
   0962: IND  0009        Static index and load word (TOS+9)
   0964: SLDC 00          Short load constant 0
   0965: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0968: LOD  02 0003     Load word at G3 (OUTPUT)
   096b: LSA  05          Load string address: ', P# '
   0972: NOP              No operation
   0973: SLDC 00          Short load constant 0
   0974: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0977: LOD  02 0003     Load word at G3 (OUTPUT)
   097a: SLDL 01          Short load local MP1
   097b: IND  0008        Static index and load word (TOS+8)
   097d: SLDC 00          Short load constant 0
   097e: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0981: LOD  02 0003     Load word at G3 (OUTPUT)
   0984: NOP              No operation
   0985: LSA  05          Load string address: ', I# '
   098c: SLDC 00          Short load constant 0
   098d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0990: LOD  02 0003     Load word at G3 (OUTPUT)
   0993: SLDL 01          Short load local MP1
   0994: IND  000b        Static index and load word (TOS+11)
   0996: SLDC 00          Short load constant 0
   0997: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   099a: LOD  02 0003     Load word at G3 (OUTPUT)
   099d: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 09a0: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC51 (* P=51 LL=1 *)
  MP1
BEGIN
-> 09ac: LOD  02 0001     Load word at G1 (SYSCOM)
   09af: STL  0001        Store TOS into MP1
   09b1: LOD  02 0003     Load word at G3 (OUTPUT)
   09b4: NOP              No operation
   09b5: LSA  0b          Load string address: 'Exec err # '
   09c2: SLDC 00          Short load constant 0
   09c3: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09c6: LOD  02 0003     Load word at G3 (OUTPUT)
   09c9: SLDL 01          Short load local MP1
   09ca: SIND 01          Short index load *TOS+1
   09cb: SLDC 00          Short load constant 0
   09cc: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   09cf: LOD  02 0003     Load word at G3 (OUTPUT)
   09d2: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   09d5: SLDL 01          Short load local MP1
   09d6: SIND 01          Short index load *TOS+1
   09d7: SLDC 0a          Short load constant 10
   09d8: EQUI             Integer TOS-1 = TOS
   09d9: FJP  $09ed       Jump if TOS false
   09db: LOD  02 0003     Load word at G3 (OUTPUT)
   09de: SLDC 2c          Short load constant 44
   09df: SLDC 00          Short load constant 0
   09e0: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   09e3: LOD  02 0003     Load word at G3 (OUTPUT)
   09e6: LOD  02 000a     Load word at G10
   09e9: SLDC 00          Short load constant 0
   09ea: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
-> 09ed: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC52(PARAM1; PARAM2) (* P=52 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 09fa: LOD  01 0001     Load word at G1 (SYSCOM)
   09fd: SRO  0003        Store global word BASE3
   09ff: SLDO 01          Short load global BASE1
   0a00: SLDC 00          Short load constant 0
   0a01: NEQI             Integer TOS-1 <> TOS
   0a02: FJP  $0a32       Jump if TOS false
   0a04: SLDO 03          Short load global BASE3
   0a05: INC  0024        Inc field ptr (TOS+36)
   0a07: SLDO 02          Short load global BASE2
   0a08: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0a0b: LDP              Load packed field (TOS)
   0a0c: FJP  $0a1b       Jump if TOS false
   0a0e: LOD  01 0003     Load word at G3 (OUTPUT)
   0a11: SLDO 03          Short load global BASE3
   0a12: INC  001f        Inc field ptr (TOS+31)
   0a14: SLDC 08          Short load constant 8
   0a15: SLDC 00          Short load constant 0
   0a16: LDP              Load packed field (TOS)
   0a17: SLDC 00          Short load constant 0
   0a18: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 0a1b: LOD  01 0003     Load word at G3 (OUTPUT)
   0a1e: SLDO 01          Short load global BASE1
   0a1f: SLDC 00          Short load constant 0
   0a20: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0a23: SLDC 0b          Short load constant 11
   0a24: SLDC 00          Short load constant 0
   0a25: GRTI             Integer TOS-1 > TOS
   0a26: FJP  $0a32       Jump if TOS false
   0a28: LOD  01 0003     Load word at G3 (OUTPUT)
   0a2b: LDA  01 0074     Load addr G116
   0a2e: SLDC 00          Short load constant 0
   0a2f: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0a32: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC53(PARAM1; PARAM2; PARAM3): RETVAL (* P=53 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM3
  BASE4=PARAM2
  BASE5=PARAM1
  BASE6
  BASE7
BEGIN
-> 0a3e: SLDC 00          Short load constant 0
   0a3f: SRO  0001        Store global word BASE1
   0a41: LOD  01 0001     Load word at G1 (SYSCOM)
   0a44: SRO  0006        Store global word BASE6
   0a46: SLDO 06          Short load global BASE6
   0a47: INC  001f        Inc field ptr (TOS+31)
   0a49: SRO  0007        Store global word BASE7
   0a4b: SLDO 05          Short load global BASE5
   0a4c: SLDO 06          Short load global BASE6
   0a4d: INC  002c        Inc field ptr (TOS+44)
   0a4f: SLDC 08          Short load constant 8
   0a50: SLDC 00          Short load constant 0
   0a51: LDP              Load packed field (TOS)
   0a52: EQUI             Integer TOS-1 = TOS
   0a53: FJP  $0a84       Jump if TOS false
   0a55: SLDC 01          Short load constant 1
   0a56: SRO  0001        Store global word BASE1
-> 0a58: SLDO 04          Short load global BASE4
   0a59: SIND 00          Short index load *TOS+0
   0a5a: SLDC 01          Short load constant 1
   0a5b: GRTI             Integer TOS-1 > TOS
   0a5c: FJP  $0a79       Jump if TOS false
   0a5e: SLDO 04          Short load global BASE4
   0a5f: SLDO 04          Short load global BASE4
   0a60: SIND 00          Short index load *TOS+0
   0a61: SLDC 01          Short load constant 1
   0a62: SBI              Subtract integers (TOS-1 - TOS)
   0a63: STO              Store indirect (TOS into TOS-1)
   0a64: SLDO 03          Short load global BASE3
   0a65: SLDO 04          Short load global BASE4
   0a66: SIND 00          Short index load *TOS+0
   0a67: LDB              Load byte at byte ptr TOS-1 + TOS
   0a68: SLDC 20          Short load constant 32
   0a69: GEQI             Integer TOS-1 >= TOS
   0a6a: FJP  $0a77       Jump if TOS false
   0a6c: LOD  01 0003     Load word at G3 (OUTPUT)
   0a6f: LDA  01 01b4     Load addr G436
   0a73: SLDC 00          Short load constant 0
   0a74: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0a77: UJP  $0a58       Unconditional jump
-> 0a79: SLDC 02          Short load constant 2
   0a7a: SLDO 07          Short load global BASE7
   0a7b: INC  0001        Inc field ptr (TOS+1)
   0a7d: SLDC 08          Short load constant 8
   0a7e: SLDC 08          Short load constant 8
   0a7f: LDP              Load packed field (TOS)
   0a80: CBP  34          Call base procedure PASCALSY.52
   0a82: UJP  $0ab0       Unconditional jump
-> 0a84: SLDO 05          Short load global BASE5
   0a85: SLDO 06          Short load global BASE6
   0a86: INC  002b        Inc field ptr (TOS+43)
   0a88: SLDC 08          Short load constant 8
   0a89: SLDC 00          Short load constant 0
   0a8a: LDP              Load packed field (TOS)
   0a8b: EQUI             Integer TOS-1 = TOS
   0a8c: FJP  $0ab0       Jump if TOS false
   0a8e: SLDC 01          Short load constant 1
   0a8f: SRO  0001        Store global word BASE1
   0a91: SLDO 04          Short load global BASE4
   0a92: SIND 00          Short index load *TOS+0
   0a93: SLDC 01          Short load constant 1
   0a94: GRTI             Integer TOS-1 > TOS
   0a95: FJP  $0ab0       Jump if TOS false
   0a97: SLDO 04          Short load global BASE4
   0a98: SLDO 04          Short load global BASE4
   0a99: SIND 00          Short index load *TOS+0
   0a9a: SLDC 01          Short load constant 1
   0a9b: SBI              Subtract integers (TOS-1 - TOS)
   0a9c: STO              Store indirect (TOS into TOS-1)
   0a9d: SLDO 03          Short load global BASE3
   0a9e: SLDO 04          Short load global BASE4
   0a9f: SIND 00          Short index load *TOS+0
   0aa0: LDB              Load byte at byte ptr TOS-1 + TOS
   0aa1: SLDC 20          Short load constant 32
   0aa2: GEQI             Integer TOS-1 >= TOS
   0aa3: FJP  $0ab0       Jump if TOS false
   0aa5: LOD  01 0003     Load word at G3 (OUTPUT)
   0aa8: LDA  01 01b8     Load addr G440
   0aac: SLDC 00          Short load constant 0
   0aad: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0ab0: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC54(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5; PARAM6) (* P=54 LL=1 *)
  MP1=PARAM6
  MP2=PARAM5
  MP3=PARAM4
  MP4=PARAM3
  MP5=PARAM2
  MP6=PARAM1
  MP7
  MP8
BEGIN
-> 0abe: SLDL 03          Short load local MP3
   0abf: SLDC 3f          Short load constant 63
   0ac0: GRTI             Integer TOS-1 > TOS
   0ac1: FJP  $0ac8       Jump if TOS false
   0ac3: SLDC 3f          Short load constant 63
   0ac4: STL  0008        Store TOS into MP8
   0ac6: UJP  $0acb       Unconditional jump
-> 0ac8: SLDL 03          Short load local MP3
   0ac9: STL  0008        Store TOS into MP8
-> 0acb: SLDL 08          Short load local MP8
   0acc: LDCI 0200        Load word 512
   0acf: MPI              Multiply integers (TOS * TOS-1)
   0ad0: STL  0007        Store TOS into MP7
-> 0ad2: SLDL 03          Short load local MP3
   0ad3: SLDC 00          Short load constant 0
   0ad4: NEQI             Integer TOS-1 <> TOS
   0ad5: FJP  $0b16       Jump if TOS false
   0ad7: SLDL 01          Short load local MP1
   0ad8: FJP  $0ae4       Jump if TOS false
   0ada: SLDL 06          Short load local MP6
   0adb: SLDL 05          Short load local MP5
   0adc: SLDL 04          Short load local MP4
   0add: SLDL 07          Short load local MP7
   0ade: SLDL 02          Short load local MP2
   0adf: SLDC 00          Short load constant 0
   0ae0: CSP  05          Call standard procedure UNITREAD
   0ae2: UJP  $0aec       Unconditional jump
-> 0ae4: SLDL 06          Short load local MP6
   0ae5: SLDL 05          Short load local MP5
   0ae6: SLDL 04          Short load local MP4
   0ae7: SLDL 07          Short load local MP7
   0ae8: SLDL 02          Short load local MP2
   0ae9: SLDC 00          Short load constant 0
   0aea: CSP  06          Call standard procedure UNITWRITE
-> 0aec: CSP  22          Call standard procedure IORESULT
   0aee: SLDC 00          Short load constant 0
   0aef: NEQI             Integer TOS-1 <> TOS
   0af0: FJP  $0af6       Jump if TOS false
   0af2: SLDC 00          Short load constant 0
   0af3: SLDC 36          Short load constant 54
   0af4: CSP  04          Call standard procedure EXIT
-> 0af6: SLDL 03          Short load local MP3
   0af7: SLDL 08          Short load local MP8
   0af8: SBI              Subtract integers (TOS-1 - TOS)
   0af9: STL  0003        Store TOS into MP3
   0afb: SLDL 04          Short load local MP4
   0afc: SLDL 07          Short load local MP7
   0afd: ADI              Add integers (TOS + TOS-1)
   0afe: STL  0004        Store TOS into MP4
   0b00: SLDL 02          Short load local MP2
   0b01: SLDL 08          Short load local MP8
   0b02: ADI              Add integers (TOS + TOS-1)
   0b03: STL  0002        Store TOS into MP2
   0b05: SLDL 03          Short load local MP3
   0b06: SLDL 08          Short load local MP8
   0b07: LESI             Integer TOS-1 < TOS
   0b08: FJP  $0b14       Jump if TOS false
   0b0a: SLDL 03          Short load local MP3
   0b0b: STL  0008        Store TOS into MP8
   0b0d: SLDL 08          Short load local MP8
   0b0e: LDCI 0200        Load word 512
   0b11: MPI              Multiply integers (TOS * TOS-1)
   0b12: STL  0007        Store TOS into MP7
-> 0b14: UJP  $0ad2       Unconditional jump
-> 0b16: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC55 (* P=55 LL=1 *)
  BASE11
BEGIN
-> 0b24: LOD  02 017d     Load word at G381
   0b28: LOD  02 017f     Load word at G383
   0b2c: LDB              Load byte at byte ptr TOS-1 + TOS
   0b2d: SRO  000b        Store global word BASE11
   0b2f: LOD  02 017f     Load word at G383
   0b33: SLDC 01          Short load constant 1
   0b34: ADI              Add integers (TOS + TOS-1)
   0b35: STR  02 017f     Store TOS to G383
   0b39: LOD  02 017f     Load word at G383
   0b3d: LOD  02 0180     Load word at G384
   0b41: GRTI             Integer TOS-1 > TOS
   0b42: FJP  $0b46       Jump if TOS false
   0b44: CBP  2e          Call base procedure PASCALSY.46
-> 0b46: SLDO 0b          Short load global BASE11
   0b47: LOD  02 018b     Load word at G395
   0b4b: EQUI             Integer TOS-1 = TOS
   0b4c: LOD  02 017d     Load word at G381
   0b50: LOD  02 017f     Load word at G383
   0b54: LDB              Load byte at byte ptr TOS-1 + TOS
   0b55: LOD  02 018b     Load word at G395
   0b59: EQUI             Integer TOS-1 = TOS
   0b5a: LAND             Logical AND (TOS & TOS-1)
   0b5b: FJP  $0b60       Jump if TOS false
   0b5d: SLDC 01          Short load constant 1
   0b5e: CBP  2d          Call base procedure PASCALSY.45
-> 0b60: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC56 (* P=56 LL=0 *)
  BASE2
BEGIN
-> 0b6c: LDA  01 0036     Load addr G54
   0b6f: CSP  21          Call standard procedure RELEASE
-> 0b71: LDA  01 007e     Load addr G126
   0b74: LOD  01 0001     Load word at G1 (SYSCOM)
   0b77: SIND 02          Short index load *TOS+2
   0b78: IXA  0006        Index array (TOS-1 + TOS * 6)
   0b7a: LDA  01 003f     Load addr G63
   0b7d: NEQSTR           String TOS-1 <> TOS
   0b7f: FJP  $0bdd       Jump if TOS false
   0b81: LDA  01 0046     Load addr G70
   0b84: NOP              No operation
   0b85: LSA  08          Load string address: 'Put in :'
   0b8f: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0b91: LDA  01 003f     Load addr G63
   0b94: LDA  01 0046     Load addr G70
   0b97: SLDC 50          Short load constant 80
   0b98: SLDC 08          Short load constant 8
   0b99: CXP  00 18       Call external procedure PASCALSY.SINSERT
   0b9c: CBP  27          Call base procedure PASCALSY.39
   0b9e: LOD  01 0003     Load word at G3 (OUTPUT)
   0ba1: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ba4: LOD  01 0003     Load word at G3 (OUTPUT)
   0ba7: LSA  11          Load string address: 'then press RETURN'
   0bba: NOP              No operation
   0bbb: SLDC 00          Short load constant 0
   0bbc: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0bbf: LOD  01 0004     Load word at G4 (SYSTERM)
   0bc2: LAO  0002        Load global BASE2
   0bc4: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   0bc7: LOD  01 0004     Load word at G4 (SYSTERM)
   0bca: SLDC 00          Short load constant 0
   0bcb: SLDC 00          Short load constant 0
   0bcc: CXP  00 0b       Call external procedure PASCALSY.FEOLN
   0bcf: FJP  $0bbf       Jump if TOS false
   0bd1: LOD  01 0001     Load word at G1 (SYSCOM)
   0bd4: SIND 02          Short index load *TOS+2
   0bd5: SLDC 00          Short load constant 0
   0bd6: SLDC 00          Short load constant 0
   0bd7: CBP  2a          Call base procedure PASCALSY.42
   0bd9: FJP  $0bdb       Jump if TOS false
-> 0bdb: UJP  $0b71       Unconditional jump
-> 0bdd: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC57 (* P=57 LL=1 *)
  MP1
BEGIN
-> 0bee: UJP  $0ccc       Unconditional jump
-> 0bf0: LOD  02 0184     Load word at G388
   0bf4: LNOT             Logical NOT (~TOS)
   0bf5: FJP  $0c4e       Jump if TOS false
   0bf7: CBP  38          Call base procedure PASCALSY.56
   0bf9: LOD  02 0045     Load word at G69
   0bfc: SLDC 00          Short load constant 0
   0bfd: SLDC 00          Short load constant 0
   0bfe: CXP  05 01       Call external procedure GETCMD.1
   0c01: STR  02 0045     Store TOS to G69
   0c04: LDA  02 0148     Load addr G328
   0c08: NOP              No operation
   0c09: LSA  00          Load string address: ''
   0c0b: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0c0d: LOD  02 0045     Load word at G69
   0c10: UJP  $0c35       Unconditional jump
   0c12: LOD  02 0186     Load word at G390
   0c16: LNOT             Logical NOT (~TOS)
   0c17: LOD  02 0188     Load word at G392
   0c1b: LOR              Logical OR (TOS | TOS-1)
   0c1c: FJP  $0c2a       Jump if TOS false
   0c1e: SLDC 00          Short load constant 0
   0c1f: STR  02 0188     Store TOS to G392
   0c23: LDCN             Load constant NIL
   0c24: LDCN             Load constant NIL
   0c25: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   0c28: UJP  $0c33       Unconditional jump
-> 0c2a: SLDC 01          Short load constant 1
   0c2b: STR  02 0184     Store TOS to G388
   0c2f: SLDC 00          Short load constant 0
   0c30: SLDC 39          Short load constant 57
   0c31: CSP  04          Call standard procedure EXIT
-> 0c33: UJP  $0c4e       Unconditional jump
-> 0c4e: LOD  02 0045     Load word at G69
   0c51: LDCI 07fc        Load word 2044
   0c54: SLDC 01          Short load constant 1
   0c55: INN              Set membership (TOS-1 in set TOS)
   0c56: FJP  $0c6a       Jump if TOS false
   0c58: SLDC 00          Short load constant 0
   0c59: STR  02 0184     Store TOS to G388
   0c5d: SLDC 03          Short load constant 3
   0c5e: CSP  26          Call standard procedure UNITCLEAR
   0c60: LOD  02 0001     Load word at G1 (SYSCOM)
   0c63: SIND 02          Short index load *TOS+2
   0c64: SLDC 00          Short load constant 0
   0c65: SLDC 00          Short load constant 0
   0c66: CBP  2a          Call base procedure PASCALSY.42
   0c68: FJP  $0c6a       Jump if TOS false
-> 0c6a: LOD  02 0045     Load word at G69
   0c6d: LDCI 00e0        Load word 224
   0c70: SLDC 01          Short load constant 1
   0c71: INN              Set membership (TOS-1 in set TOS)
   0c72: FJP  $0c98       Jump if TOS false
   0c74: LOD  02 000a     Load word at G10
   0c77: SLDC 00          Short load constant 0
   0c78: EQUI             Integer TOS-1 = TOS
   0c79: FJP  $0c98       Jump if TOS false
   0c7b: LOD  02 0008     Load word at G8
   0c7e: SLDC 01          Short load constant 1
   0c7f: CBP  06          Call base procedure PASCALSY.FCLOSE
   0c81: CSP  22          Call standard procedure IORESULT
   0c83: SLDC 00          Short load constant 0
   0c84: NEQI             Integer TOS-1 <> TOS
   0c85: FJP  $0c98       Jump if TOS false
   0c87: CSP  22          Call standard procedure IORESULT
   0c89: STL  0001        Store TOS into MP1
   0c8b: LOD  02 0003     Load word at G3 (OUTPUT)
   0c8e: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0c91: CBP  26          Call base procedure PASCALSY.38
   0c93: SLDC 0a          Short load constant 10
   0c94: SLDL 01          Short load local MP1
   0c95: CXP  03 01       Call external procedure PRINTERR.PRINTERROR
-> 0c98: LOD  02 0045     Load word at G69
   0c9b: SLDC 0c          Short load constant 12
   0c9c: SLDC 01          Short load constant 1
   0c9d: INN              Set membership (TOS-1 in set TOS)
   0c9e: FJP  $0cb4       Jump if TOS false
   0ca0: LDA  02 0002     Load addr G2 (INPUT)
   0ca3: SLDC 00          Short load constant 0
   0ca4: IXA  0001        Index array (TOS-1 + TOS * 1)
   0ca6: SIND 00          Short index load *TOS+0
   0ca7: SLDC 00          Short load constant 0
   0ca8: CBP  06          Call base procedure PASCALSY.FCLOSE
   0caa: LDA  02 0002     Load addr G2 (INPUT)
   0cad: SLDC 01          Short load constant 1
   0cae: IXA  0001        Index array (TOS-1 + TOS * 1)
   0cb0: SIND 00          Short index load *TOS+0
   0cb1: SLDC 01          Short load constant 1
   0cb2: CBP  06          Call base procedure PASCALSY.FCLOSE
-> 0cb4: SLDC 01          Short load constant 1
   0cb5: CSP  23          Call standard procedure UNITBUSY
   0cb7: SLDC 02          Short load constant 2
   0cb8: CSP  23          Call standard procedure UNITBUSY
   0cba: LOR              Logical OR (TOS | TOS-1)
   0cbb: FJP  $0cc0       Jump if TOS false
   0cbd: SLDC 01          Short load constant 1
   0cbe: CSP  26          Call standard procedure UNITCLEAR
-> 0cc0: LOD  02 0045     Load word at G69
   0cc3: SLDC 00          Short load constant 0
   0cc4: EQUI             Integer TOS-1 = TOS
   0cc5: FJP  $0bf0       Jump if TOS false
-> 0cc7: SLDC 06          Short load constant 6
   0cc8: CSP  16          Call standard procedure UNLOADSEGMENT
   0cca: UJP  $0cd1       Unconditional jump
-> 0ccc: SLDC 06          Short load constant 6
   0ccd: CSP  15          Call standard procedure LOADSEGMENT
   0ccf: UJP  $0bf0       Unconditional jump
-> 0cd1: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC58 (* P=58 LL=1 *)
BEGIN
-> 0ce4: UJP  $0d0d       Unconditional jump
-> 0ce6: CBP  38          Call base procedure PASCALSY.56
   0ce8: CGP  39          Call global procedure PASCALSY.57
   0cea: LOD  02 0185     Load word at G389
   0cee: LNOT             Logical NOT (~TOS)
   0cef: LOD  02 0184     Load word at G388
   0cf3: LAND             Logical AND (TOS & TOS-1)
   0cf4: FJP  $0cfd       Jump if TOS false
   0cf6: LDCN             Load constant NIL
   0cf7: LDCN             Load constant NIL
   0cf8: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   0cfb: UJP  $0d01       Unconditional jump
-> 0cfd: SLDC 00          Short load constant 0
   0cfe: SLDC 3a          Short load constant 58
   0cff: CSP  04          Call standard procedure EXIT
-> 0d01: LOD  02 0045     Load word at G69
   0d04: SLDC 00          Short load constant 0
   0d05: EQUI             Integer TOS-1 = TOS
   0d06: FJP  $0ce6       Jump if TOS false
-> 0d08: SLDC 02          Short load constant 2
   0d09: CSP  16          Call standard procedure UNLOADSEGMENT
   0d0b: UJP  $0d12       Unconditional jump
-> 0d0d: SLDC 02          Short load constant 2
   0d0e: CSP  15          Call standard procedure LOADSEGMENT
   0d10: UJP  $0ce6       Unconditional jump
-> 0d12: RNP  00          Return from nonbase procedure
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
   01aa: CXP  00 31       Call external procedure PASCALSY.49
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

### PROCEDURE PRINTERR.PRINTERR(PARAM1; PARAM2) (* P=1 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0000: LAO  0003        Load global BASE3
   0002: NOP              No operation
   0003: LSA  16          Load string address: 'Unknown run-time error'
   001b: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   001d: SLDO 02          Short load global BASE2
   001e: UJP  $0405       Unconditional jump
   0020: LAO  0003        Load global BASE3
   0022: NOP              No operation
   0023: LSA  11          Load string address: 'Value range error'
   0036: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0038: UJP  $042c       Unconditional jump
   003a: LAO  0003        Load global BASE3
   003c: NOP              No operation
   003d: LSA  14          Load string address: 'No proc in seg-table'
   0053: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0055: UJP  $042c       Unconditional jump
   0057: LAO  0003        Load global BASE3
   0059: LSA  17          Load string address: 'Exit from uncalled proc'
   0072: NOP              No operation
   0073: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0075: UJP  $042c       Unconditional jump
   0077: LAO  0003        Load global BASE3
   0079: LSA  0e          Load string address: 'Stack overflow'
   0089: NOP              No operation
   008a: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   008c: UJP  $042c       Unconditional jump
   008e: LAO  0003        Load global BASE3
   0090: NOP              No operation
   0091: LSA  10          Load string address: 'Integer overflow'
   00a3: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   00a5: UJP  $042c       Unconditional jump
   00a7: LAO  0003        Load global BASE3
   00a9: LSA  0e          Load string address: 'Divide by zero'
   00b9: NOP              No operation
   00ba: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   00bc: UJP  $042c       Unconditional jump
   00be: LAO  0003        Load global BASE3
   00c0: NOP              No operation
   00c1: LSA  15          Load string address: 'NIL pointer reference'
   00d8: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   00da: UJP  $042c       Unconditional jump
   00dc: LAO  0003        Load global BASE3
   00de: NOP              No operation
   00df: LSA  1b          Load string address: 'Program interrupted by user'
   00fc: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   00fe: UJP  $042c       Unconditional jump
   0100: LAO  0003        Load global BASE3
   0102: NOP              No operation
   0103: LSA  0f          Load string address: 'System IO error'
   0114: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0116: UJP  $042c       Unconditional jump
   0118: LAO  0003        Load global BASE3
   011a: NOP              No operation
   011b: LSA  0d          Load string address: 'unknown cause'
   012a: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   012c: SLDO 01          Short load global BASE1
   012d: UJP  $0317       Unconditional jump
   012f: LAO  0003        Load global BASE3
   0131: LSA  0c          Load string address: 'parity (CRC)'
   013f: NOP              No operation
   0140: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0142: UJP  $0346       Unconditional jump
   0144: LAO  0003        Load global BASE3
   0146: NOP              No operation
   0147: LSA  0e          Load string address: 'illegal unit #'
   0157: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0159: UJP  $0346       Unconditional jump
   015b: LAO  0003        Load global BASE3
   015d: LSA  12          Load string address: 'illegal IO request'
   0171: NOP              No operation
   0172: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0174: UJP  $0346       Unconditional jump
   0176: LAO  0003        Load global BASE3
   0178: NOP              No operation
   0179: LSA  10          Load string address: 'data-com timeout'
   018b: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   018d: UJP  $0346       Unconditional jump
   018f: LAO  0003        Load global BASE3
   0191: LSA  11          Load string address: 'vol went off-line'
   01a4: NOP              No operation
   01a5: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   01a7: UJP  $0346       Unconditional jump
   01a9: LAO  0003        Load global BASE3
   01ab: LSA  10          Load string address: 'file lost in dir'
   01bd: NOP              No operation
   01be: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   01c0: UJP  $0346       Unconditional jump
   01c2: LAO  0003        Load global BASE3
   01c4: NOP              No operation
   01c5: LSA  0d          Load string address: 'bad file name'
   01d4: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   01d6: UJP  $0346       Unconditional jump
   01d8: LAO  0003        Load global BASE3
   01da: NOP              No operation
   01db: LSA  0e          Load string address: 'no room on vol'
   01eb: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   01ed: UJP  $0346       Unconditional jump
   01ef: LAO  0003        Load global BASE3
   01f1: LSA  0d          Load string address: 'vol not found'
   0200: NOP              No operation
   0201: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0203: UJP  $0346       Unconditional jump
   0205: LAO  0003        Load global BASE3
   0207: LSA  0e          Load string address: 'file not found'
   0217: NOP              No operation
   0218: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   021a: UJP  $0346       Unconditional jump
   021c: LAO  0003        Load global BASE3
   021e: NOP              No operation
   021f: LSA  0d          Load string address: 'dup dir entry'
   022e: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0230: UJP  $0346       Unconditional jump
   0232: LAO  0003        Load global BASE3
   0234: NOP              No operation
   0235: LSA  11          Load string address: 'file already open'
   0248: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   024a: UJP  $0346       Unconditional jump
   024c: LAO  0003        Load global BASE3
   024e: NOP              No operation
   024f: LSA  0d          Load string address: 'file not open'
   025e: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0260: UJP  $0346       Unconditional jump
   0262: LAO  0003        Load global BASE3
   0264: NOP              No operation
   0265: LSA  10          Load string address: 'bad input format'
   0277: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0279: UJP  $0346       Unconditional jump
   027b: LAO  0003        Load global BASE3
   027d: LSA  14          Load string address: 'disk write protected'
   0293: NOP              No operation
   0294: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0296: UJP  $0346       Unconditional jump
   0298: LAO  0003        Load global BASE3
   029a: NOP              No operation
   029b: LSA  0f          Load string address: 'illegal block #'
   02ac: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   02ae: UJP  $0346       Unconditional jump
   02b0: LAO  0003        Load global BASE3
   02b2: NOP              No operation
   02b3: LSA  16          Load string address: 'illegal buffer address'
   02cb: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   02cd: UJP  $0346       Unconditional jump
   02cf: LAO  0003        Load global BASE3
   02d1: LSA  21          Load string address: 'must read a multiple of 512 bytes'
   02f4: NOP              No operation
   02f5: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   02f7: UJP  $0346       Unconditional jump
   02f9: LAO  0003        Load global BASE3
   02fb: LSA  15          Load string address: 'unknown ProFile error'
   0312: NOP              No operation
   0313: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0315: UJP  $0346       Unconditional jump
-> 0346: NOP              No operation
   0347: LSA  0a          Load string address: 'IO error: '
   0353: LAO  0003        Load global BASE3
   0355: SLDC 2d          Short load constant 45
   0356: SLDC 01          Short load constant 1
   0357: CXP  00 18       Call external procedure PASCALSY.SINSERT
   035a: UJP  $042c       Unconditional jump
   035c: LAO  0003        Load global BASE3
   035e: NOP              No operation
   035f: LSA  19          Load string address: 'Unimplemented instruction'
   037a: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   037c: UJP  $042c       Unconditional jump
   037e: LAO  0003        Load global BASE3
   0380: NOP              No operation
   0381: LSA  14          Load string address: 'Floating point error'
   0397: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0399: UJP  $042c       Unconditional jump
   039b: LAO  0003        Load global BASE3
   039d: LSA  0f          Load string address: 'String overflow'
   03ae: NOP              No operation
   03af: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   03b1: UJP  $042c       Unconditional jump
   03b3: LAO  0003        Load global BASE3
   03b5: LSA  0f          Load string address: 'Programmed HALT'
   03c6: NOP              No operation
   03c7: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   03c9: UJP  $042c       Unconditional jump
   03cb: LAO  0003        Load global BASE3
   03cd: LSA  16          Load string address: 'Programmed break-point'
   03e5: NOP              No operation
   03e6: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   03e8: UJP  $042c       Unconditional jump
   03ea: LAO  0003        Load global BASE3
   03ec: NOP              No operation
   03ed: LSA  12          Load string address: 'Codespace overflow'
   0401: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0403: UJP  $042c       Unconditional jump
-> 042c: LOD  01 0003     Load word at G3 (OUTPUT)
   042f: LAO  0003        Load global BASE3
   0431: SLDC 00          Short load constant 0
   0432: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0435: LOD  01 0003     Load word at G3 (OUTPUT)
   0438: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 043b: RBP  00          Return from base procedure
END

## Segment INITIALI (4)

### PROCEDURE INITIALI.INITIALI (* P=1 LL=0 *)
  BASE22
  BASE23
  BASE55
  BASE56
  BASE57
  BASE58
  BASE59
BEGIN
-> 07b6: UJP  $0c07       Unconditional jump
-> 07b8: LOD  01 0036     Load word at G54
   07bb: LDCN             Load constant NIL
   07bc: EQUI             Integer TOS-1 = TOS
   07bd: STR  01 0189     Store TOS to G393
   07c1: LAO  0017        Load global BASE23
   07c3: SLDC 00          Short load constant 0
   07c4: IXA  0002        Index array (TOS-1 + TOS * 2)
   07c6: NOP              No operation
   07c7: LSA  03          Load string address: '???'
   07cc: SAS  03          String assign (TOS to TOS-1, 3 chars)
   07ce: LAO  0017        Load global BASE23
   07d0: SLDC 01          Short load constant 1
   07d1: IXA  0002        Index array (TOS-1 + TOS * 2)
   07d3: LSA  03          Load string address: 'Jan'
   07d8: NOP              No operation
   07d9: SAS  03          String assign (TOS to TOS-1, 3 chars)
   07db: LAO  0017        Load global BASE23
   07dd: SLDC 02          Short load constant 2
   07de: IXA  0002        Index array (TOS-1 + TOS * 2)
   07e0: NOP              No operation
   07e1: LSA  03          Load string address: 'Feb'
   07e6: SAS  03          String assign (TOS to TOS-1, 3 chars)
   07e8: LAO  0017        Load global BASE23
   07ea: SLDC 03          Short load constant 3
   07eb: IXA  0002        Index array (TOS-1 + TOS * 2)
   07ed: LSA  03          Load string address: 'Mar'
   07f2: NOP              No operation
   07f3: SAS  03          String assign (TOS to TOS-1, 3 chars)
   07f5: LAO  0017        Load global BASE23
   07f7: SLDC 04          Short load constant 4
   07f8: IXA  0002        Index array (TOS-1 + TOS * 2)
   07fa: NOP              No operation
   07fb: LSA  03          Load string address: 'Apr'
   0800: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0802: LAO  0017        Load global BASE23
   0804: SLDC 05          Short load constant 5
   0805: IXA  0002        Index array (TOS-1 + TOS * 2)
   0807: LSA  03          Load string address: 'May'
   080c: NOP              No operation
   080d: SAS  03          String assign (TOS to TOS-1, 3 chars)
   080f: LAO  0017        Load global BASE23
   0811: SLDC 06          Short load constant 6
   0812: IXA  0002        Index array (TOS-1 + TOS * 2)
   0814: NOP              No operation
   0815: LSA  03          Load string address: 'Jun'
   081a: SAS  03          String assign (TOS to TOS-1, 3 chars)
   081c: LAO  0017        Load global BASE23
   081e: SLDC 07          Short load constant 7
   081f: IXA  0002        Index array (TOS-1 + TOS * 2)
   0821: LSA  03          Load string address: 'Jul'
   0826: NOP              No operation
   0827: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0829: LAO  0017        Load global BASE23
   082b: SLDC 08          Short load constant 8
   082c: IXA  0002        Index array (TOS-1 + TOS * 2)
   082e: NOP              No operation
   082f: LSA  03          Load string address: 'Aug'
   0834: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0836: LAO  0017        Load global BASE23
   0838: SLDC 09          Short load constant 9
   0839: IXA  0002        Index array (TOS-1 + TOS * 2)
   083b: LSA  03          Load string address: 'Sep'
   0840: NOP              No operation
   0841: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0843: LAO  0017        Load global BASE23
   0845: SLDC 0a          Short load constant 10
   0846: IXA  0002        Index array (TOS-1 + TOS * 2)
   0848: NOP              No operation
   0849: LSA  03          Load string address: 'Oct'
   084e: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0850: LAO  0017        Load global BASE23
   0852: SLDC 0b          Short load constant 11
   0853: IXA  0002        Index array (TOS-1 + TOS * 2)
   0855: LSA  03          Load string address: 'Nov'
   085a: NOP              No operation
   085b: SAS  03          String assign (TOS to TOS-1, 3 chars)
   085d: LAO  0017        Load global BASE23
   085f: SLDC 0c          Short load constant 12
   0860: IXA  0002        Index array (TOS-1 + TOS * 2)
   0862: NOP              No operation
   0863: LSA  03          Load string address: 'Dec'
   0868: SAS  03          String assign (TOS to TOS-1, 3 chars)
   086a: LAO  0017        Load global BASE23
   086c: SLDC 0d          Short load constant 13
   086d: IXA  0002        Index array (TOS-1 + TOS * 2)
   086f: LSA  03          Load string address: '???'
   0874: NOP              No operation
   0875: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0877: LAO  0017        Load global BASE23
   0879: SLDC 0e          Short load constant 14
   087a: IXA  0002        Index array (TOS-1 + TOS * 2)
   087c: NOP              No operation
   087d: LSA  03          Load string address: '???'
   0882: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0884: LAO  0017        Load global BASE23
   0886: SLDC 0f          Short load constant 15
   0887: IXA  0002        Index array (TOS-1 + TOS * 2)
   0889: LSA  03          Load string address: '???'
   088e: NOP              No operation
   088f: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0891: LOD  01 0189     Load word at G393
   0895: FJP  $089b       Jump if TOS false
   0897: CLP  08          Call local procedure INITIALI.8
   0899: UJP  $08a0       Unconditional jump
-> 089b: LDA  01 0036     Load addr G54
   089e: CSP  21          Call standard procedure RELEASE
-> 08a0: LDA  01 01bc     Load addr G444
   08a4: NOP              No operation
   08a5: LSA  00          Load string address: ''
   08a7: SAS  07          String assign (TOS to TOS-1, 7 chars)
   08a9: CLP  06          Call local procedure INITIALI.INITUNITABLE
   08ab: LDA  01 01c0     Load addr G448
   08af: SLDC 00          Short load constant 0
   08b0: ADJ  02          Adjust set to 2 words
   08b2: STM  02          Store 2 words at TOS to TOS-1
   08b4: CLP  0b          Call local procedure INITIALI.11
   08b6: CLP  02          Call local procedure INITIALI.INITSYSCOM
   08b8: CLP  09          Call local procedure INITIALI.9
   08ba: LDA  01 0148     Load addr G328
   08be: NOP              No operation
   08bf: LSA  00          Load string address: ''
   08c1: SAS  17          String assign (TOS to TOS-1, 23 chars)
   08c3: LDA  01 0154     Load addr G340
   08c7: LSA  00          Load string address: ''
   08c9: NOP              No operation
   08ca: SAS  50          String assign (TOS to TOS-1, 80 chars)
   08cc: SLDC 25          Short load constant 37
   08cd: STR  01 018b     Store TOS to G395
   08d1: SLDC 00          Short load constant 0
   08d2: STR  01 0186     Store TOS to G390
   08d6: SLDC 00          Short load constant 0
   08d7: STR  01 0185     Store TOS to G389
   08db: SLDC 00          Short load constant 0
   08dc: STR  01 0182     Store TOS to G386
   08e0: SLDC 00          Short load constant 0
   08e1: STR  01 0183     Store TOS to G387
   08e5: SLDC 00          Short load constant 0
   08e6: STR  01 0187     Store TOS to G391
   08ea: SLDC 00          Short load constant 0
   08eb: STR  01 0188     Store TOS to G392
   08ef: CXP  00 25       Call external procedure PASCALSY.37
   08f2: LDCI 40df        Load word 16607
   08f5: NGI              Negate integer
   08f6: SRO  0039        Store global word BASE57
   08f8: LDO  0039        Load global word BASE57
   08fa: SLDC 00          Short load constant 0
   08fb: LDB              Load byte at byte ptr TOS-1 + TOS
   08fc: SLDC 03          Short load constant 3
   08fd: NEQI             Integer TOS-1 <> TOS
   08fe: FJP  $097f       Jump if TOS false
   0900: LOD  01 0003     Load word at G3 (OUTPUT)
   0903: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0906: LOD  01 0003     Load word at G3 (OUTPUT)
   0909: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   090c: LOD  01 0003     Load word at G3 (OUTPUT)
   090f: LSA  27          Load string address: 'Version 1.2 of SYSTEM.PASCAL cannot run'
   0938: NOP              No operation
   0939: SLDC 00          Short load constant 0
   093a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   093d: LOD  01 0003     Load word at G3 (OUTPUT)
   0940: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0943: LOD  01 0003     Load word at G3 (OUTPUT)
   0946: NOP              No operation
   0947: LSA  29          Load string address: 'with a non-1.2 version of the interpreter'
   0972: SLDC 00          Short load constant 0
   0973: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0976: LOD  01 0003     Load word at G3 (OUTPUT)
   0979: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 097c: SLDC 00          Short load constant 0
   097d: FJP  $097c       Jump if TOS false
-> 097f: LDCI 40de        Load word 16606
   0982: NGI              Negate integer
   0983: SRO  0039        Store global word BASE57
   0985: LDO  0039        Load global word BASE57
   0987: SLDC 06          Short load constant 6
   0988: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   098b: LDP              Load packed field (TOS)
   098c: SRO  0038        Store global word BASE56
   098e: LDO  0038        Load global word BASE56
   0990: FJP  $0a12       Jump if TOS false
   0992: LOD  01 0003     Load word at G3 (OUTPUT)
   0995: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0998: LOD  01 0003     Load word at G3 (OUTPUT)
   099b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   099e: LOD  01 0003     Load word at G3 (OUTPUT)
   09a1: LSA  28          Load string address: 'The 64K version of SYSTEM.PASCAL cannot '
   09cb: NOP              No operation
   09cc: SLDC 00          Short load constant 0
   09cd: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09d0: LOD  01 0003     Load word at G3 (OUTPUT)
   09d3: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   09d6: LOD  01 0003     Load word at G3 (OUTPUT)
   09d9: LSA  29          Load string address: 'run with the 128K version of SYSTEM.APPLE'
   0a04: NOP              No operation
   0a05: SLDC 00          Short load constant 0
   0a06: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a09: LOD  01 0003     Load word at G3 (OUTPUT)
   0a0c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0a0f: SLDC 00          Short load constant 0
   0a10: FJP  $0a0f       Jump if TOS false
-> 0a12: LOD  01 0003     Load word at G3 (OUTPUT)
   0a15: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a18: LOD  01 0189     Load word at G393
   0a1c: FJP  $0bdd       Jump if TOS false
   0a1e: LDO  0037        Load global word BASE55
   0a20: LNOT             Logical NOT (~TOS)
   0a21: FJP  $0bdb       Jump if TOS false
   0a23: LOD  01 0001     Load word at G1 (SYSCOM)
   0a26: SRO  003a        Store global word BASE58
   0a28: LDO  003a        Load global word BASE58
   0a2a: INC  001d        Inc field ptr (TOS+29)
   0a2c: SLDC 01          Short load constant 1
   0a2d: SLDC 03          Short load constant 3
   0a2e: LDP              Load packed field (TOS)
   0a2f: FJP  $0a4a       Jump if TOS false
   0a31: SLDC 00          Short load constant 0
   0a32: LDO  003a        Load global word BASE58
   0a34: IND  0025        Static index and load word (TOS+37)
   0a36: SLDC 03          Short load constant 3
   0a37: DVI              Divide integers (TOS-1 / TOS)
   0a38: CXP  00 1d       Call external procedure PASCALSY.FGOTOXY
   0a3b: SLDC 0b          Short load constant 11
   0a3c: SLDC 00          Short load constant 0
   0a3d: GRTI             Integer TOS-1 > TOS
   0a3e: FJP  $0a4a       Jump if TOS false
   0a40: LOD  01 0003     Load word at G3 (OUTPUT)
   0a43: LDA  01 0074     Load addr G116
   0a46: SLDC 00          Short load constant 0
   0a47: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0a4a: LOD  01 0003     Load word at G3 (OUTPUT)
   0a4d: LSA  08          Load string address: 'Welcome '
   0a57: NOP              No operation
   0a58: SLDC 00          Short load constant 0
   0a59: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a5c: LOD  01 0003     Load word at G3 (OUTPUT)
   0a5f: LDA  01 003f     Load addr G63
   0a62: SLDC 00          Short load constant 0
   0a63: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a66: LOD  01 0003     Load word at G3 (OUTPUT)
   0a69: LSA  18          Load string address: ', to Apple II Pascal 1.2'
   0a83: NOP              No operation
   0a84: SLDC 00          Short load constant 0
   0a85: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a88: LOD  01 0003     Load word at G3 (OUTPUT)
   0a8b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a8e: LOD  01 0003     Load word at G3 (OUTPUT)
   0a91: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a94: LOD  01 0003     Load word at G3 (OUTPUT)
   0a97: LSA  19          Load string address: 'Based on UCSD Pascal II.1'
   0ab2: NOP              No operation
   0ab3: SLDC 00          Short load constant 0
   0ab4: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ab7: LOD  01 0003     Load word at G3 (OUTPUT)
   0aba: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0abd: LOD  01 0003     Load word at G3 (OUTPUT)
   0ac0: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ac3: LOD  01 0003     Load word at G3 (OUTPUT)
   0ac6: NOP              No operation
   0ac7: LSA  10          Load string address: 'Current date is '
   0ad9: SLDC 00          Short load constant 0
   0ada: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0add: LOD  01 0003     Load word at G3 (OUTPUT)
   0ae0: LDA  01 0043     Load addr G67
   0ae3: SLDC 05          Short load constant 5
   0ae4: SLDC 04          Short load constant 4
   0ae5: LDP              Load packed field (TOS)
   0ae6: SLDC 00          Short load constant 0
   0ae7: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0aea: LOD  01 0003     Load word at G3 (OUTPUT)
   0aed: SLDC 2d          Short load constant 45
   0aee: SLDC 00          Short load constant 0
   0aef: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0af2: LOD  01 0003     Load word at G3 (OUTPUT)
   0af5: LAO  0017        Load global BASE23
   0af7: LDA  01 0043     Load addr G67
   0afa: SLDC 04          Short load constant 4
   0afb: SLDC 00          Short load constant 0
   0afc: LDP              Load packed field (TOS)
   0afd: IXA  0002        Index array (TOS-1 + TOS * 2)
   0aff: SLDC 00          Short load constant 0
   0b00: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b03: LOD  01 0003     Load word at G3 (OUTPUT)
   0b06: SLDC 2d          Short load constant 45
   0b07: SLDC 00          Short load constant 0
   0b08: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0b0b: LOD  01 0003     Load word at G3 (OUTPUT)
   0b0e: LDA  01 0043     Load addr G67
   0b11: SLDC 07          Short load constant 7
   0b12: SLDC 09          Short load constant 9
   0b13: LDP              Load packed field (TOS)
   0b14: SLDC 00          Short load constant 0
   0b15: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0b18: SLDC 01          Short load constant 1
   0b19: SRO  0016        Store global word BASE22
   0b1b: SLDC 03          Short load constant 3
   0b1c: SRO  003b        Store global word BASE59
-> 0b1e: LDO  0016        Load global word BASE22
   0b20: LDO  003b        Load global word BASE59
   0b22: LEQI             Integer TOS-1 <= TOS
   0b23: FJP  $0b33       Jump if TOS false
   0b25: LOD  01 0003     Load word at G3 (OUTPUT)
   0b28: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b2b: LDO  0016        Load global word BASE22
   0b2d: SLDC 01          Short load constant 1
   0b2e: ADI              Add integers (TOS + TOS-1)
   0b2f: SRO  0016        Store global word BASE22
   0b31: UJP  $0b1e       Unconditional jump
-> 0b33: LOD  01 0003     Load word at G3 (OUTPUT)
   0b36: NOP              No operation
   0b37: LSA  19          Load string address: 'Pascal system size is 64K'
   0b52: SLDC 00          Short load constant 0
   0b53: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b56: LOD  01 0003     Load word at G3 (OUTPUT)
   0b59: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b5c: SLDC 01          Short load constant 1
   0b5d: SRO  0016        Store global word BASE22
   0b5f: SLDC 03          Short load constant 3
   0b60: SRO  003b        Store global word BASE59
-> 0b62: LDO  0016        Load global word BASE22
   0b64: LDO  003b        Load global word BASE59
   0b66: LEQI             Integer TOS-1 <= TOS
   0b67: FJP  $0b77       Jump if TOS false
   0b69: LOD  01 0003     Load word at G3 (OUTPUT)
   0b6c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b6f: LDO  0016        Load global word BASE22
   0b71: SLDC 01          Short load constant 1
   0b72: ADI              Add integers (TOS + TOS-1)
   0b73: SRO  0016        Store global word BASE22
   0b75: UJP  $0b62       Unconditional jump
-> 0b77: LOD  01 0003     Load word at G3 (OUTPUT)
   0b7a: NOP              No operation
   0b7b: LSA  27          Load string address: 'Copyright Apple Computer 1979,1980,1983'
   0ba4: SLDC 00          Short load constant 0
   0ba5: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ba8: LOD  01 0003     Load word at G3 (OUTPUT)
   0bab: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0bae: LOD  01 0003     Load word at G3 (OUTPUT)
   0bb1: LSA  1b          Load string address: 'Copyright U.C. Regents 1979'
   0bce: NOP              No operation
   0bcf: SLDC 00          Short load constant 0
   0bd0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0bd3: LOD  01 0003     Load word at G3 (OUTPUT)
   0bd6: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0bd9: UJP  $0bdb       Unconditional jump
-> 0bdb: UJP  $0c02       Unconditional jump
-> 0bdd: LOD  01 0003     Load word at G3 (OUTPUT)
   0be0: NOP              No operation
   0be1: LSA  15          Load string address: 'System re-initialized'
   0bf8: SLDC 00          Short load constant 0
   0bf9: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0bfc: LOD  01 0003     Load word at G3 (OUTPUT)
   0bff: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0c02: SLDC 06          Short load constant 6
   0c03: CSP  16          Call standard procedure UNLOADSEGMENT
   0c05: UJP  $0c0c       Unconditional jump
-> 0c07: SLDC 06          Short load constant 6
   0c08: CSP  15          Call standard procedure LOADSEGMENT
   0c0a: UJP  $07b8       Unconditional jump
-> 0c0c: RBP  00          Return from base procedure
END

### PROCEDURE INITIALI.INITSYSCOM (* P=2 LL=1 *)
  MP1
  MP42
  MP71
  MP72
  MP73
  MP79
  MP187
  MP192
  MP194
  MP203
  MP477
  MP478
  MP479
BEGIN
-> 0090: LDA  02 0074     Load addr G116
   0093: CLP  03          Call local procedure INITIALI.INIT_FILLER
   0095: LDCN             Load constant NIL
   0096: STR  02 0044     Store TOS to G68
   0099: LDA  02 006f     Load addr G111
   009c: SLDC 00          Short load constant 0
   009d: IXA  0001        Index array (TOS-1 + TOS * 1)
   009f: SLDC 01          Short load constant 1
   00a0: STO              Store indirect (TOS into TOS-1)
   00a1: LDA  02 006f     Load addr G111
   00a4: SLDC 01          Short load constant 1
   00a5: IXA  0001        Index array (TOS-1 + TOS * 1)
   00a7: SLDC 0a          Short load constant 10
   00a8: STO              Store indirect (TOS into TOS-1)
   00a9: LDA  02 006f     Load addr G111
   00ac: SLDC 02          Short load constant 2
   00ad: IXA  0001        Index array (TOS-1 + TOS * 1)
   00af: SLDC 64          Short load constant 100
   00b0: STO              Store indirect (TOS into TOS-1)
   00b1: LDA  02 006f     Load addr G111
   00b4: SLDC 03          Short load constant 3
   00b5: IXA  0001        Index array (TOS-1 + TOS * 1)
   00b7: LDCI 03e8        Load word 1000
   00ba: STO              Store indirect (TOS into TOS-1)
   00bb: LDA  02 006f     Load addr G111
   00be: SLDC 04          Short load constant 4
   00bf: IXA  0001        Index array (TOS-1 + TOS * 1)
   00c1: LDCI 2710        Load word 10000
   00c4: STO              Store indirect (TOS into TOS-1)
   00c5: LDA  02 007a     Load addr G122
   00ca: LDC  04          Load multiple-word constant
                         03ff000000000000
   00d2: SLDC 04          Short load constant 4
   00d3: ADJ  04          Adjust set to 4 words
   00d5: STM  04          Store 4 words at TOS to TOS-1
   00d7: LLA  0001        Load local address MP1
   00d9: LSA  10          Load string address: '*SYSTEM.MISCINFO'
   00eb: NOP              No operation
   00ec: SAS  50          String assign (TOS to TOS-1, 80 chars)
   00ee: LLA  00bb        Load local address MP187
   00f1: LDCN             Load constant NIL
   00f2: SLDC 01          Short load constant 1
   00f3: NGI              Negate integer
   00f4: CXP  00 03       Call external procedure PASCALSY.FINIT
   00f7: LLA  00bb        Load local address MP187
   00fa: LLA  0001        Load local address MP1
   00fc: SLDC 01          Short load constant 1
   00fd: LDCN             Load constant NIL
   00fe: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0101: LDL  00c0        Load local word MP192
   0104: FJP  $0143       Jump if TOS false
   0106: LDL  00c2        Load local word MP194
   0109: LLA  002a        Load local address MP42
   010b: SLDC 00          Short load constant 0
   010c: LDCI 0120        Load word 288
   010f: LDL  00cb        Load local word MP203
   0112: SLDC 00          Short load constant 0
   0113: CSP  05          Call standard procedure UNITREAD
   0115: LOD  02 0001     Load word at G1 (SYSCOM)
   0118: STL  01dd        Store TOS into MP477
   011b: LDL  01dd        Load local word MP477
   011e: INC  001d        Inc field ptr (TOS+29)
   0120: LLA  0047        Load local address MP71
   0122: MOV  0001        Move 1 words (TOS to TOS-1)
   0124: LDL  01dd        Load local word MP477
   0127: INC  001e        Inc field ptr (TOS+30)
   0129: LDL  0048        Load local word MP72
   012b: STO              Store indirect (TOS into TOS-1)
   012c: LDL  01dd        Load local word MP477
   012f: INC  001f        Inc field ptr (TOS+31)
   0131: LLA  0049        Load local address MP73
   0133: MOV  0006        Move 6 words (TOS to TOS-1)
   0135: LDL  01dd        Load local word MP477
   0138: INC  0025        Inc field ptr (TOS+37)
   013a: LLA  004f        Load local address MP79
   013c: MOV  000b        Move 11 words (TOS to TOS-1)
   013e: LDA  02 0074     Load addr G116
   0141: CLP  03          Call local procedure INITIALI.INIT_FILLER
-> 0143: LLA  00bb        Load local address MP187
   0146: SLDC 00          Short load constant 0
   0147: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   014a: SLDC 01          Short load constant 1
   014b: CSP  26          Call standard procedure UNITCLEAR
   014d: LOD  02 0001     Load word at G1 (SYSCOM)
   0150: STL  01dd        Store TOS into MP477
   0153: LDL  01dd        Load local word MP477
   0156: INC  0001        Inc field ptr (TOS+1)
   0158: SLDC 00          Short load constant 0
   0159: STO              Store indirect (TOS into TOS-1)
   015a: LDL  01dd        Load local word MP477
   015d: SLDC 00          Short load constant 0
   015e: STO              Store indirect (TOS into TOS-1)
   015f: LDL  01dd        Load local word MP477
   0162: INC  0003        Inc field ptr (TOS+3)
   0164: SLDC 00          Short load constant 0
   0165: STO              Store indirect (TOS into TOS-1)
   0166: LDL  01dd        Load local word MP477
   0169: INC  0025        Inc field ptr (TOS+37)
   016b: STL  01de        Store TOS into MP478
   016e: LDA  02 0138     Load addr G312
   0172: LDL  01de        Load local word MP478
   0175: INC  0008        Inc field ptr (TOS+8)
   0177: SLDC 08          Short load constant 8
   0178: SLDC 00          Short load constant 0
   0179: LDP              Load packed field (TOS)
   017a: SGS              Build singleton set [TOS]
   017b: ADJ  10          Adjust set to 16 words
   017d: STM  10          Store 16 words at TOS to TOS-1
   017f: SLDC 00          Short load constant 0
   0180: LDL  01de        Load local word MP478
   0183: INC  0003        Inc field ptr (TOS+3)
   0185: SLDC 08          Short load constant 8
   0186: SLDC 08          Short load constant 8
   0187: LDP              Load packed field (TOS)
   0188: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   018a: SLDC 01          Short load constant 1
   018b: LDL  01de        Load local word MP478
   018e: INC  0003        Inc field ptr (TOS+3)
   0190: SLDC 08          Short load constant 8
   0191: SLDC 00          Short load constant 0
   0192: LDP              Load packed field (TOS)
   0193: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0195: SLDC 03          Short load constant 3
   0196: LDL  01de        Load local word MP478
   0199: INC  0002        Inc field ptr (TOS+2)
   019b: SLDC 08          Short load constant 8
   019c: SLDC 08          Short load constant 8
   019d: LDP              Load packed field (TOS)
   019e: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01a0: SLDC 02          Short load constant 2
   01a1: LDL  01de        Load local word MP478
   01a4: INC  0002        Inc field ptr (TOS+2)
   01a6: SLDC 08          Short load constant 8
   01a7: SLDC 00          Short load constant 0
   01a8: LDP              Load packed field (TOS)
   01a9: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01ab: SLDC 0b          Short load constant 11
   01ac: LDL  01de        Load local word MP478
   01af: INC  0006        Inc field ptr (TOS+6)
   01b1: SLDC 08          Short load constant 8
   01b2: SLDC 00          Short load constant 0
   01b3: LDP              Load packed field (TOS)
   01b4: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01b6: SLDC 08          Short load constant 8
   01b7: LDL  01de        Load local word MP478
   01ba: INC  0004        Inc field ptr (TOS+4)
   01bc: SLDC 08          Short load constant 8
   01bd: SLDC 00          Short load constant 0
   01be: LDP              Load packed field (TOS)
   01bf: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01c1: SLDC 09          Short load constant 9
   01c2: LDL  01de        Load local word MP478
   01c5: INC  0007        Inc field ptr (TOS+7)
   01c7: SLDC 08          Short load constant 8
   01c8: SLDC 08          Short load constant 8
   01c9: LDP              Load packed field (TOS)
   01ca: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01cc: SLDC 0a          Short load constant 10
   01cd: LDL  01de        Load local word MP478
   01d0: INC  0007        Inc field ptr (TOS+7)
   01d2: SLDC 08          Short load constant 8
   01d3: SLDC 00          Short load constant 0
   01d4: LDP              Load packed field (TOS)
   01d5: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01d7: SLDC 0d          Short load constant 13
   01d8: LDL  01de        Load local word MP478
   01db: IND  0009        Static index and load word (TOS+9)
   01dd: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01df: SLDC 0c          Short load constant 12
   01e0: LDL  01de        Load local word MP478
   01e3: INC  0008        Inc field ptr (TOS+8)
   01e5: SLDC 08          Short load constant 8
   01e6: SLDC 08          Short load constant 8
   01e7: LDP              Load packed field (TOS)
   01e8: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01ea: LDL  01dd        Load local word MP477
   01ed: INC  001f        Inc field ptr (TOS+31)
   01ef: STL  01de        Store TOS into MP478
   01f2: SLDC 00          Short load constant 0
   01f3: LDL  01de        Load local word MP478
   01f6: INC  0002        Inc field ptr (TOS+2)
   01f8: SLDC 08          Short load constant 8
   01f9: SLDC 08          Short load constant 8
   01fa: LDP              Load packed field (TOS)
   01fb: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   01fd: SLDC 01          Short load constant 1
   01fe: LDL  01de        Load local word MP478
   0201: INC  0002        Inc field ptr (TOS+2)
   0203: SLDC 08          Short load constant 8
   0204: SLDC 00          Short load constant 0
   0205: LDP              Load packed field (TOS)
   0206: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0208: SLDC 02          Short load constant 2
   0209: LDL  01de        Load local word MP478
   020c: INC  0001        Inc field ptr (TOS+1)
   020e: SLDC 08          Short load constant 8
   020f: SLDC 08          Short load constant 8
   0210: LDP              Load packed field (TOS)
   0211: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0213: SLDC 04          Short load constant 4
   0214: LDL  01de        Load local word MP478
   0217: SLDC 08          Short load constant 8
   0218: SLDC 08          Short load constant 8
   0219: LDP              Load packed field (TOS)
   021a: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   021c: SLDC 03          Short load constant 3
   021d: LDL  01de        Load local word MP478
   0220: INC  0001        Inc field ptr (TOS+1)
   0222: SLDC 08          Short load constant 8
   0223: SLDC 00          Short load constant 0
   0224: LDP              Load packed field (TOS)
   0225: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0227: SLDC 05          Short load constant 5
   0228: LDL  01de        Load local word MP478
   022b: INC  0003        Inc field ptr (TOS+3)
   022d: SLDC 08          Short load constant 8
   022e: SLDC 00          Short load constant 0
   022f: LDP              Load packed field (TOS)
   0230: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0232: SLDC 06          Short load constant 6
   0233: LDL  01de        Load local word MP478
   0236: INC  0004        Inc field ptr (TOS+4)
   0238: SLDC 08          Short load constant 8
   0239: SLDC 08          Short load constant 8
   023a: LDP              Load packed field (TOS)
   023b: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   023d: SLDC 07          Short load constant 7
   023e: LDL  01de        Load local word MP478
   0241: INC  0004        Inc field ptr (TOS+4)
   0243: SLDC 08          Short load constant 8
   0244: SLDC 00          Short load constant 0
   0245: LDP              Load packed field (TOS)
   0246: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0248: LDA  02 0138     Load addr G312
   024c: LDA  02 0138     Load addr G312
   0250: LDM  10          Load 16 words from (TOS)
   0252: SLDC 10          Short load constant 16
   0253: LDL  01de        Load local word MP478
   0256: SLDC 08          Short load constant 8
   0257: SLDC 00          Short load constant 0
   0258: LDP              Load packed field (TOS)
   0259: SGS              Build singleton set [TOS]
   025a: UNI              Set union (TOS OR TOS-1)
   025b: SLDC 00          Short load constant 0
   025c: SLDC 1f          Short load constant 31
   025d: SRS              Subrange set [TOS-1..TOS]
   025e: UNI              Set union (TOS OR TOS-1)
   025f: SLDC 0d          Short load constant 13
   0260: SGS              Build singleton set [TOS]
   0261: DIF              Set difference (TOS-1 AND NOT TOS)
   0262: SLDC 07          Short load constant 7
   0263: SGS              Build singleton set [TOS]
   0264: DIF              Set difference (TOS-1 AND NOT TOS)
   0265: ADJ  10          Adjust set to 16 words
   0267: STM  10          Store 16 words at TOS to TOS-1
   0269: LDA  02 01b8     Load addr G440
   026d: LSA  03          Load string address: '   '
   0272: NOP              No operation
   0273: SAS  06          String assign (TOS to TOS-1, 6 chars)
   0275: LDL  01de        Load local word MP478
   0278: INC  0005        Inc field ptr (TOS+5)
   027a: SLDC 05          Short load constant 5
   027b: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   027e: LDP              Load packed field (TOS)
   027f: FJP  $028f       Jump if TOS false
   0281: LDA  02 01b8     Load addr G440
   0285: SLDC 01          Short load constant 1
   0286: LDL  01de        Load local word MP478
   0289: SLDC 08          Short load constant 8
   028a: SLDC 00          Short load constant 0
   028b: LDP              Load packed field (TOS)
   028c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   028d: UJP  $0296       Unconditional jump
-> 028f: LDA  02 01b8     Load addr G440
   0293: SLDC 01          Short load constant 1
   0294: SLDC 00          Short load constant 0
   0295: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0296: LDA  02 01b8     Load addr G440
   029a: SLDC 02          Short load constant 2
   029b: LDL  01de        Load local word MP478
   029e: INC  0003        Inc field ptr (TOS+3)
   02a0: SLDC 08          Short load constant 8
   02a1: SLDC 00          Short load constant 0
   02a2: LDP              Load packed field (TOS)
   02a3: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   02a4: LDA  02 01b8     Load addr G440
   02a8: SLDC 00          Short load constant 0
   02a9: STL  01df        Store TOS into MP479
   02ac: LLA  01df        Load local address MP479
   02af: LDA  02 01b8     Load addr G440
   02b3: SLDC 06          Short load constant 6
   02b4: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   02b7: LLA  01df        Load local address MP479
   02ba: LDA  02 01b8     Load addr G440
   02be: SLDC 0c          Short load constant 12
   02bf: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   02c2: LLA  01df        Load local address MP479
   02c5: SAS  06          String assign (TOS to TOS-1, 6 chars)
   02c7: LDA  02 01b8     Load addr G440
   02cb: SLDC 00          Short load constant 0
   02cc: SLDC 05          Short load constant 5
   02cd: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   02ce: LDA  02 01b4     Load addr G436
   02d2: LDA  02 01b8     Load addr G440
   02d6: SAS  06          String assign (TOS to TOS-1, 6 chars)
   02d8: LDL  01de        Load local word MP478
   02db: INC  0001        Inc field ptr (TOS+1)
   02dd: SLDC 08          Short load constant 8
   02de: SLDC 08          Short load constant 8
   02df: LDP              Load packed field (TOS)
   02e0: SLDC 00          Short load constant 0
   02e1: NEQI             Integer TOS-1 <> TOS
   02e2: FJP  $02eb       Jump if TOS false
   02e4: LDA  02 01b4     Load addr G436
   02e8: SLDC 00          Short load constant 0
   02e9: SLDC 02          Short load constant 2
   02ea: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 02eb: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.INIT_FILLER(PARAM1) (* P=3 LL=2 *)
  MP1=PARAM1
  MP2
BEGIN
-> 0000: LOD  03 0001     Load word at G1 (SYSCOM)
   0003: INC  001f        Inc field ptr (TOS+31)
   0005: STL  0002        Store TOS into MP2
   0007: SLDL 02          Short load local MP2
   0008: INC  0003        Inc field ptr (TOS+3)
   000a: SLDC 08          Short load constant 8
   000b: SLDC 08          Short load constant 8
   000c: LDP              Load packed field (TOS)
   000d: SLDC 0b          Short load constant 11
   000e: GRTI             Integer TOS-1 > TOS
   000f: FJP  $0018       Jump if TOS false
   0011: SLDL 02          Short load local MP2
   0012: INC  0003        Inc field ptr (TOS+3)
   0014: SLDC 08          Short load constant 8
   0015: SLDC 08          Short load constant 8
   0016: SLDC 0b          Short load constant 11
   0017: STP              Store packed field (TOS into TOS-1)
-> 0018: SLDL 01          Short load local MP1
   0019: SLDC 00          Short load constant 0
   001a: SLDL 02          Short load local MP2
   001b: INC  0003        Inc field ptr (TOS+3)
   001d: SLDC 08          Short load constant 8
   001e: SLDC 08          Short load constant 8
   001f: LDP              Load packed field (TOS)
   0020: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0021: SLDL 01          Short load local MP1
   0022: SLDC 01          Short load constant 1
   0023: SLDL 02          Short load local MP2
   0024: INC  0003        Inc field ptr (TOS+3)
   0026: SLDC 08          Short load constant 8
   0027: SLDC 08          Short load constant 8
   0028: LDP              Load packed field (TOS)
   0029: SLDC 00          Short load constant 0
   002a: CSP  0a          Call standard procedure FLCH
-> 002c: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.SETPREFIXEDCRTCTL(PARAM1; PARAM2) (* P=4 LL=2 *)
  MP1=PARAM2
  MP2=PARAM1
BEGIN
-> 0038: LOD  03 0001     Load word at G1 (SYSCOM)
   003b: INC  0024        Inc field ptr (TOS+36)
   003d: SLDL 02          Short load local MP2
   003e: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0041: LDP              Load packed field (TOS)
   0042: LNOT             Logical NOT (~TOS)
   0043: FJP  $0057       Jump if TOS false
   0045: LDA  03 0138     Load addr G312
   0049: LDA  03 0138     Load addr G312
   004d: LDM  10          Load 16 words from (TOS)
   004f: SLDC 10          Short load constant 16
   0050: SLDL 01          Short load local MP1
   0051: SGS              Build singleton set [TOS]
   0052: UNI              Set union (TOS OR TOS-1)
   0053: ADJ  10          Adjust set to 16 words
   0055: STM  10          Store 16 words at TOS to TOS-1
-> 0057: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.SETPREFIXEDCRTINFO(PARAM1; PARAM2) (* P=5 LL=2 *)
  MP1=PARAM2
  MP2=PARAM1
BEGIN
-> 0064: LOD  03 0001     Load word at G1 (SYSCOM)
   0067: INC  002f        Inc field ptr (TOS+47)
   0069: SLDL 02          Short load local MP2
   006a: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   006d: LDP              Load packed field (TOS)
   006e: LNOT             Logical NOT (~TOS)
   006f: FJP  $0083       Jump if TOS false
   0071: LDA  03 0138     Load addr G312
   0075: LDA  03 0138     Load addr G312
   0079: LDM  10          Load 16 words from (TOS)
   007b: SLDC 10          Short load constant 16
   007c: SLDL 01          Short load local MP1
   007d: SGS              Build singleton set [TOS]
   007e: UNI              Set union (TOS OR TOS-1)
   007f: ADJ  10          Adjust set to 16 words
   0081: STM  10          Store 16 words at TOS to TOS-1
-> 0083: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.INITUNITABLE (* P=6 LL=1 *)
  BASE1
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
-> 031c: LDA  02 00fc     Load addr G252
   0320: SLDC 00          Short load constant 0
   0321: IXA  000c        Index array (TOS-1 + TOS * 12)
   0323: LSA  10          Load string address: ':SYSTEM.ASSMBLER'
   0335: NOP              No operation
   0336: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0338: LDA  02 00fc     Load addr G252
   033c: SLDC 01          Short load constant 1
   033d: IXA  000c        Index array (TOS-1 + TOS * 12)
   033f: LSA  10          Load string address: ':SYSTEM.COMPILER'
   0351: NOP              No operation
   0352: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0354: LDA  02 00fc     Load addr G252
   0358: SLDC 02          Short load constant 2
   0359: IXA  000c        Index array (TOS-1 + TOS * 12)
   035b: LSA  0e          Load string address: ':SYSTEM.EDITOR'
   036b: NOP              No operation
   036c: SAS  17          String assign (TOS to TOS-1, 23 chars)
   036e: LDA  02 00fc     Load addr G252
   0372: SLDC 03          Short load constant 3
   0373: IXA  000c        Index array (TOS-1 + TOS * 12)
   0375: LSA  0d          Load string address: ':SYSTEM.FILER'
   0384: NOP              No operation
   0385: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0387: LDA  02 00fc     Load addr G252
   038b: SLDC 04          Short load constant 4
   038c: IXA  000c        Index array (TOS-1 + TOS * 12)
   038e: NOP              No operation
   038f: LSA  0e          Load string address: ':SYSTEM.LINKER'
   039f: SAS  17          String assign (TOS to TOS-1, 23 chars)
   03a1: LLA  0126        Load local address MP294
   03a4: LDA  02 00fc     Load addr G252
   03a8: MOV  003c        Move 60 words (TOS to TOS-1)
   03aa: SLDC 1f          Short load constant 31
   03ab: SLDC 01          Short load constant 1
   03ac: ADJ  01          Adjust set to 1 words
   03ae: STL  0162        Store TOS into MP354
   03b1: LLA  0003        Load local address MP3
   03b3: LDCN             Load constant NIL
   03b4: SLDC 01          Short load constant 1
   03b5: NGI              Negate integer
   03b6: CXP  00 03       Call external procedure PASCALSY.FINIT
   03b9: SLDC 00          Short load constant 0
   03ba: STL  0001        Store TOS into MP1
   03bc: SLDC 14          Short load constant 20
   03bd: STL  0163        Store TOS into MP355
-> 03c0: SLDL 01          Short load local MP1
   03c1: LDL  0163        Load local word MP355
   03c4: LEQI             Integer TOS-1 <= TOS
   03c5: FJP  $04d1       Jump if TOS false
   03c7: LDA  02 007e     Load addr G126
   03ca: SLDL 01          Short load local MP1
   03cb: IXA  0006        Index array (TOS-1 + TOS * 6)
   03cd: STL  0164        Store TOS into MP356
   03d0: LDL  0164        Load local word MP356
   03d3: LSA  00          Load string address: ''
   03d5: NOP              No operation
   03d6: SAS  07          String assign (TOS to TOS-1, 7 chars)
   03d8: LDL  0164        Load local word MP356
   03db: INC  0004        Inc field ptr (TOS+4)
   03dd: SLDL 01          Short load local MP1
   03e0: LDC  02          Load multiple-word constant
                         001ffe30
   03e4: SLDC 02          Short load constant 2
   03e5: INN              Set membership (TOS-1 in set TOS)
   03e6: STO              Store indirect (TOS into TOS-1)
   03e7: LDL  0164        Load local word MP356
   03ea: SIND 04          Short index load *TOS+4
   03eb: FJP  $04ca       Jump if TOS false
   03ed: LDL  0164        Load local word MP356
   03f0: INC  0005        Inc field ptr (TOS+5)
   03f2: LDCI 7fff        Load word 32767
   03f5: STO              Store indirect (TOS into TOS-1)
   03f6: SLDL 01          Short load local MP1
   03f7: CSP  26          Call standard procedure UNITCLEAR
   03f9: CSP  22          Call standard procedure IORESULT
   03fb: SLDC 00          Short load constant 0
   03fc: EQUI             Integer TOS-1 = TOS
   03fd: FJP  $04ca       Jump if TOS false
   03ff: SLDL 01          Short load local MP1
   0400: SLDC 00          Short load constant 0
   0401: SLDC 00          Short load constant 0
   0402: CXP  00 2a       Call external procedure PASCALSY.42
   0405: FJP  $04ca       Jump if TOS false
   0407: LDL  0164        Load local word MP356
   040a: LOD  02 0001     Load word at G1 (SYSCOM)
   040d: SIND 04          Short index load *TOS+4
   040e: SLDC 00          Short load constant 0
   040f: IXA  000d        Index array (TOS-1 + TOS * 13)
   0411: INC  0003        Inc field ptr (TOS+3)
   0413: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0415: SLDL 01          Short load local MP1
   0416: LOD  02 0001     Load word at G1 (SYSCOM)
   0419: SIND 02          Short index load *TOS+2
   041a: EQUI             Integer TOS-1 = TOS
   041b: FJP  $044d       Jump if TOS false
   041d: LDA  02 003f     Load addr G63
   0420: LDL  0164        Load local word MP356
   0423: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0425: LAO  0001        Load global BASE1
   0427: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   0438: NOP              No operation
   0439: SAS  28          String assign (TOS to TOS-1, 40 chars)
   043b: LLA  0003        Load local address MP3
   043d: LAO  0001        Load global BASE1
   043f: SLDC 01          Short load constant 1
   0440: LDCN             Load constant NIL
   0441: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0444: SLDL 08          Short load local MP8
   0445: SRO  0037        Store global word BASE55
   0447: LLA  0003        Load local address MP3
   0449: SLDC 00          Short load constant 0
   044a: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 044d: SLDC 00          Short load constant 0
   044e: STL  0125        Store TOS into MP293
   0451: SLDC 04          Short load constant 4
   0452: STL  0165        Store TOS into MP357
-> 0455: LDL  0125        Load local word MP293
   0458: LDL  0165        Load local word MP357
   045b: LEQI             Integer TOS-1 <= TOS
   045c: FJP  $04ca       Jump if TOS false
   045e: SLDL 01          Short load local MP1
   045f: LOD  02 0001     Load word at G1 (SYSCOM)
   0462: SIND 02          Short index load *TOS+2
   0463: EQUI             Integer TOS-1 = TOS
   0464: LDL  0125        Load local word MP293
   0467: LDL  0162        Load local word MP354
   046a: SLDC 01          Short load constant 1
   046b: INN              Set membership (TOS-1 in set TOS)
   046c: LOR              Logical OR (TOS | TOS-1)
   046d: FJP  $04c0       Jump if TOS false
   046f: LAO  0001        Load global BASE1
   0471: SLDC 00          Short load constant 0
   0472: STL  0166        Store TOS into MP358
   0475: LLA  0166        Load local address MP358
   0478: LDL  0164        Load local word MP356
   047b: SLDC 07          Short load constant 7
   047c: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   047f: LLA  0166        Load local address MP358
   0482: LLA  0126        Load local address MP294
   0485: LDL  0125        Load local word MP293
   0488: IXA  000c        Index array (TOS-1 + TOS * 12)
   048a: SLDC 1e          Short load constant 30
   048b: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   048e: LLA  0166        Load local address MP358
   0491: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0493: LLA  0003        Load local address MP3
   0495: LAO  0001        Load global BASE1
   0497: SLDC 01          Short load constant 1
   0498: LDCN             Load constant NIL
   0499: CXP  00 05       Call external procedure PASCALSY.FOPEN
   049c: SLDL 08          Short load local MP8
   049d: FJP  $04ba       Jump if TOS false
   049f: LDA  02 00fc     Load addr G252
   04a3: LDL  0125        Load local word MP293
   04a6: IXA  000c        Index array (TOS-1 + TOS * 12)
   04a8: LAO  0001        Load global BASE1
   04aa: SAS  17          String assign (TOS to TOS-1, 23 chars)
   04ac: LDL  0162        Load local word MP354
   04af: SLDC 01          Short load constant 1
   04b0: LDL  0125        Load local word MP293
   04b3: SGS              Build singleton set [TOS]
   04b4: DIF              Set difference (TOS-1 AND NOT TOS)
   04b5: ADJ  01          Adjust set to 1 words
   04b7: STL  0162        Store TOS into MP354
-> 04ba: LLA  0003        Load local address MP3
   04bc: SLDC 00          Short load constant 0
   04bd: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 04c0: LDL  0125        Load local word MP293
   04c3: SLDC 01          Short load constant 1
   04c4: ADI              Add integers (TOS + TOS-1)
   04c5: STL  0125        Store TOS into MP293
   04c8: UJP  $0455       Unconditional jump
-> 04ca: SLDL 01          Short load local MP1
   04cb: SLDC 01          Short load constant 1
   04cc: ADI              Add integers (TOS + TOS-1)
   04cd: STL  0001        Store TOS into MP1
   04cf: UJP  $03c0       Unconditional jump
-> 04d1: LOD  02 0189     Load word at G393
   04d5: FJP  $04df       Jump if TOS false
   04d7: LDA  02 003b     Load addr G59
   04da: LDA  02 003f     Load addr G63
   04dd: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 04df: LDA  02 003f     Load addr G63
   04e2: SLDC 00          Short load constant 0
   04e3: LLA  0002        Load local address MP2
   04e5: SLDC 00          Short load constant 0
   04e6: SLDC 00          Short load constant 0
   04e7: CXP  00 1e       Call external procedure PASCALSY.30
   04ea: STL  0001        Store TOS into MP1
   04ec: SLDL 02          Short load local MP2
   04ed: LDCN             Load constant NIL
   04ee: EQUI             Integer TOS-1 = TOS
   04ef: FJP  $04f3       Jump if TOS false
   04f1: CSP  27          Call standard procedure HALT
-> 04f3: LDA  02 0043     Load addr G67
   04f6: SLDL 02          Short load local MP2
   04f7: SLDC 00          Short load constant 0
   04f8: IXA  000d        Index array (TOS-1 + TOS * 13)
   04fa: INC  000a        Inc field ptr (TOS+10)
   04fc: MOV  0001        Move 1 words (TOS to TOS-1)
   04fe: SLDC 01          Short load constant 1
   04ff: LSA  07          Load string address: 'CONSOLE'
   0508: NOP              No operation
   0509: CLP  07          Call local procedure INITIALI.7
   050b: SLDC 02          Short load constant 2
   050c: NOP              No operation
   050d: LSA  07          Load string address: 'SYSTERM'
   0516: CLP  07          Call local procedure INITIALI.7
   0518: SLDC 03          Short load constant 3
   0519: LSA  07          Load string address: 'GRAPHIC'
   0522: NOP              No operation
   0523: CLP  07          Call local procedure INITIALI.7
   0525: SLDC 06          Short load constant 6
   0526: NOP              No operation
   0527: LSA  07          Load string address: 'PRINTER'
   0530: CLP  07          Call local procedure INITIALI.7
   0532: SLDC 07          Short load constant 7
   0533: LSA  05          Load string address: 'REMIN'
   053a: NOP              No operation
   053b: CLP  07          Call local procedure INITIALI.7
   053d: SLDC 08          Short load constant 8
   053e: NOP              No operation
   053f: LSA  06          Load string address: 'REMOUT'
   0547: CLP  07          Call local procedure INITIALI.7
-> 0549: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC7(PARAM1; PARAM2) (* P=7 LL=2 *)
  MP1=PARAM2
  MP2=PARAM1
  MP3
BEGIN
-> 02f8: LLA  0003        Load local address MP3
   02fa: SLDL 01          Short load local MP1
   02fb: SAS  07          String assign (TOS to TOS-1, 7 chars)
   02fd: SLDL 02          Short load local MP2
   02fe: CSP  26          Call standard procedure UNITCLEAR
   0300: CSP  22          Call standard procedure IORESULT
   0302: SLDC 00          Short load constant 0
   0303: EQUI             Integer TOS-1 = TOS
   0304: FJP  $0310       Jump if TOS false
   0306: LDA  03 007e     Load addr G126
   0309: SLDL 02          Short load local MP2
   030a: IXA  0006        Index array (TOS-1 + TOS * 6)
   030c: LLA  0003        Load local address MP3
   030e: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0310: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC8 (* P=8 LL=1 *)
  MP1
BEGIN
-> 0562: LOD  02 0001     Load word at G1 (SYSCOM)
   0565: INC  0004        Inc field ptr (TOS+4)
   0567: LDCN             Load constant NIL
   0568: STO              Store indirect (TOS into TOS-1)
   0569: LDA  02 0037     Load addr G55
   056c: SLDC 1e          Short load constant 30
   056d: CSP  01          Call standard procedure NEW
   056f: LOD  02 0037     Load word at G55
   0572: LDCN             Load constant NIL
   0573: SLDC 01          Short load constant 1
   0574: NGI              Negate integer
   0575: CXP  00 03       Call external procedure PASCALSY.FINIT
   0578: LDA  02 003a     Load addr G58
   057b: SLDC 1e          Short load constant 30
   057c: CSP  01          Call standard procedure NEW
   057e: LLA  0001        Load local address MP1
   0580: SLDC 01          Short load constant 1
   0581: CSP  01          Call standard procedure NEW
   0583: LOD  02 003a     Load word at G58
   0586: SLDL 01          Short load local MP1
   0587: SLDC 00          Short load constant 0
   0588: CXP  00 03       Call external procedure PASCALSY.FINIT
   058b: LDA  02 0039     Load addr G57
   058e: SLDC 1e          Short load constant 30
   058f: CSP  01          Call standard procedure NEW
   0591: LLA  0001        Load local address MP1
   0593: SLDC 01          Short load constant 1
   0594: CSP  01          Call standard procedure NEW
   0596: LOD  02 0039     Load word at G57
   0599: SLDL 01          Short load local MP1
   059a: SLDC 00          Short load constant 0
   059b: CXP  00 03       Call external procedure PASCALSY.FINIT
   059e: LDA  02 0038     Load addr G56
   05a1: SLDC 1e          Short load constant 30
   05a2: CSP  01          Call standard procedure NEW
   05a4: LLA  0001        Load local address MP1
   05a6: SLDC 01          Short load constant 1
   05a7: CSP  01          Call standard procedure NEW
   05a9: LOD  02 0038     Load word at G56
   05ac: SLDL 01          Short load local MP1
   05ad: SLDC 00          Short load constant 0
   05ae: CXP  00 03       Call external procedure PASCALSY.FINIT
   05b1: LDA  02 0002     Load addr G2 (INPUT)
   05b4: SLDC 00          Short load constant 0
   05b5: IXA  0001        Index array (TOS-1 + TOS * 1)
   05b7: LOD  02 003a     Load word at G58
   05ba: STO              Store indirect (TOS into TOS-1)
   05bb: LDA  02 0002     Load addr G2 (INPUT)
   05be: SLDC 01          Short load constant 1
   05bf: IXA  0001        Index array (TOS-1 + TOS * 1)
   05c1: LOD  02 0039     Load word at G57
   05c4: STO              Store indirect (TOS into TOS-1)
   05c5: LDA  02 0009     Load addr G9
   05c8: SLDC 1e          Short load constant 30
   05c9: CSP  01          Call standard procedure NEW
   05cb: LOD  02 0009     Load word at G9
   05ce: LDCN             Load constant NIL
   05cf: SLDC 01          Short load constant 1
   05d0: NGI              Negate integer
   05d1: CXP  00 03       Call external procedure PASCALSY.FINIT
   05d4: LDA  02 0008     Load addr G8
   05d7: SLDC 1e          Short load constant 30
   05d8: CSP  01          Call standard procedure NEW
   05da: LOD  02 0008     Load word at G8
   05dd: LDCN             Load constant NIL
   05de: SLDC 01          Short load constant 1
   05df: NGI              Negate integer
   05e0: CXP  00 03       Call external procedure PASCALSY.FINIT
   05e3: LDA  02 0036     Load addr G54
   05e6: CSP  20          Call standard procedure MARK
-> 05e8: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC9 (* P=9 LL=1 *)
BEGIN
-> 065c: SLDC 00          Short load constant 0
   065d: STR  02 000a     Store TOS to G10
   0660: SLDC 00          Short load constant 0
   0661: STR  02 000b     Store TOS to G11
   0664: SLDC 00          Short load constant 0
   0665: STR  02 000c     Store TOS to G12
   0668: LOD  02 0189     Load word at G393
   066c: FJP  $069e       Jump if TOS false
   066e: LDA  02 0026     Load addr G38
   0671: LSA  00          Load string address: ''
   0673: NOP              No operation
   0674: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0676: LDA  02 001e     Load addr G30
   0679: LSA  00          Load string address: ''
   067b: NOP              No operation
   067c: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   067e: LDA  02 002e     Load addr G46
   0681: LSA  00          Load string address: ''
   0683: NOP              No operation
   0684: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0686: LDA  02 0016     Load addr G22
   0689: LDA  02 003f     Load addr G63
   068c: SAS  07          String assign (TOS to TOS-1, 7 chars)
   068e: LDA  02 0012     Load addr G18
   0691: LDA  02 003f     Load addr G63
   0694: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0696: LDA  02 001a     Load addr G26
   0699: LDA  02 003f     Load addr G63
   069c: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 069e: LOD  02 0009     Load word at G9
   06a1: LSA  10          Load string address: '*SYSTEM.WRK.TEXT'
   06b3: NOP              No operation
   06b4: LDA  02 0016     Load addr G22
   06b7: LDA  02 0026     Load addr G38
   06ba: LDA  02 0011     Load addr G17
   06bd: CLP  0a          Call local procedure INITIALI.10
   06bf: LOD  02 0008     Load word at G8
   06c2: NOP              No operation
   06c3: LSA  10          Load string address: '*SYSTEM.WRK.CODE'
   06d5: LDA  02 0012     Load addr G18
   06d8: LDA  02 001e     Load addr G30
   06db: LDA  02 0010     Load addr G16
   06de: CLP  0a          Call local procedure INITIALI.10
   06e0: LOD  02 0001     Load word at G1 (SYSCOM)
   06e3: INC  002c        Inc field ptr (TOS+44)
   06e5: SLDC 08          Short load constant 8
   06e6: SLDC 08          Short load constant 8
   06e7: LDP              Load packed field (TOS)
   06e8: STR  02 000f     Store TOS to G15
   06eb: LOD  02 0001     Load word at G1 (SYSCOM)
   06ee: INC  001d        Inc field ptr (TOS+29)
   06f0: SLDC 01          Short load constant 1
   06f1: SLDC 04          Short load constant 4
   06f2: LDP              Load packed field (TOS)
   06f3: STR  02 000e     Store TOS to G14
   06f6: LOD  02 0001     Load word at G1 (SYSCOM)
   06f9: INC  001d        Inc field ptr (TOS+29)
   06fb: SLDC 01          Short load constant 1
   06fc: SLDC 05          Short load constant 5
   06fd: LDP              Load packed field (TOS)
   06fe: STR  02 000d     Store TOS to G13
-> 0701: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC10(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5) (* P=10 LL=2 *)
  MP1=PARAM5
  MP2=PARAM4
  MP3=PARAM3
  MP4=PARAM2
  MP5=PARAM1
  MP6
  MP18
  MP30
BEGIN
-> 05f4: LLA  0006        Load local address MP6
   05f6: SLDL 04          Short load local MP4
   05f7: SAS  17          String assign (TOS to TOS-1, 23 chars)
   05f9: SLDL 05          Short load local MP5
   05fa: LLA  0006        Load local address MP6
   05fc: SLDC 01          Short load constant 1
   05fd: LDCN             Load constant NIL
   05fe: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0601: SLDL 05          Short load local MP5
   0602: SIND 05          Short index load *TOS+5
   0603: LNOT             Logical NOT (~TOS)
   0604: FJP  $0637       Jump if TOS false
   0606: SLDL 02          Short load local MP2
   0607: LSA  00          Load string address: ''
   0609: NOP              No operation
   060a: NEQSTR           String TOS-1 <> TOS
   060c: FJP  $0637       Jump if TOS false
   060e: LLA  0012        Load local address MP18
   0610: SLDC 00          Short load constant 0
   0611: STL  001e        Store TOS into MP30
   0613: LLA  001e        Load local address MP30
   0615: SLDL 03          Short load local MP3
   0616: SLDC 07          Short load constant 7
   0617: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   061a: LLA  001e        Load local address MP30
   061c: NOP              No operation
   061d: LSA  01          Load string address: ':'
   0620: SLDC 08          Short load constant 8
   0621: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0624: LLA  001e        Load local address MP30
   0626: SLDL 02          Short load local MP2
   0627: SLDC 17          Short load constant 23
   0628: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   062b: LLA  001e        Load local address MP30
   062d: SAS  17          String assign (TOS to TOS-1, 23 chars)
   062f: SLDL 05          Short load local MP5
   0630: LLA  0012        Load local address MP18
   0632: SLDC 01          Short load constant 1
   0633: LDCN             Load constant NIL
   0634: CXP  00 05       Call external procedure PASCALSY.FOPEN
-> 0637: SLDL 01          Short load local MP1
   0638: SLDL 05          Short load local MP5
   0639: SIND 05          Short index load *TOS+5
   063a: STO              Store indirect (TOS into TOS-1)
   063b: SLDL 01          Short load local MP1
   063c: SIND 00          Short index load *TOS+0
   063d: FJP  $064b       Jump if TOS false
   063f: SLDL 03          Short load local MP3
   0640: SLDL 05          Short load local MP5
   0641: INC  0008        Inc field ptr (TOS+8)
   0643: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0645: SLDL 02          Short load local MP2
   0646: SLDL 05          Short load local MP5
   0647: INC  0013        Inc field ptr (TOS+19)
   0649: SAS  0f          String assign (TOS to TOS-1, 15 chars)
-> 064b: SLDL 05          Short load local MP5
   064c: SLDC 00          Short load constant 0
   064d: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 0650: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC11 (* P=11 LL=1 *)
  BASE1
BEGIN
-> 070e: LOD  02 0037     Load word at G55
   0711: SLDC 00          Short load constant 0
   0712: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0715: LOD  02 0009     Load word at G9
   0718: SLDC 00          Short load constant 0
   0719: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   071c: LOD  02 0008     Load word at G8
   071f: SLDC 00          Short load constant 0
   0720: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0723: LOD  02 003a     Load word at G58
   0726: SLDC 00          Short load constant 0
   0727: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   072a: LOD  02 0039     Load word at G57
   072d: SLDC 00          Short load constant 0
   072e: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0731: LAO  0001        Load global BASE1
   0733: LSA  08          Load string address: 'CONSOLE:'
   073d: NOP              No operation
   073e: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0740: LOD  02 003a     Load word at G58
   0743: LAO  0001        Load global BASE1
   0745: SLDC 01          Short load constant 1
   0746: LDCN             Load constant NIL
   0747: CXP  00 05       Call external procedure PASCALSY.FOPEN
   074a: LOD  02 0039     Load word at G57
   074d: LAO  0001        Load global BASE1
   074f: SLDC 01          Short load constant 1
   0750: LDCN             Load constant NIL
   0751: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0754: LOD  02 0189     Load word at G393
   0758: FJP  $0773       Jump if TOS false
   075a: LAO  0001        Load global BASE1
   075c: NOP              No operation
   075d: LSA  08          Load string address: 'SYSTERM:'
   0767: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0769: LOD  02 0038     Load word at G56
   076c: LAO  0001        Load global BASE1
   076e: SLDC 01          Short load constant 1
   076f: LDCN             Load constant NIL
   0770: CXP  00 05       Call external procedure PASCALSY.FOPEN
-> 0773: LDA  02 0002     Load addr G2 (INPUT)
   0776: SLDC 00          Short load constant 0
   0777: IXA  0001        Index array (TOS-1 + TOS * 1)
   0779: LOD  02 003a     Load word at G58
   077c: STO              Store indirect (TOS into TOS-1)
   077d: LDA  02 0002     Load addr G2 (INPUT)
   0780: SLDC 01          Short load constant 1
   0781: IXA  0001        Index array (TOS-1 + TOS * 1)
   0783: LOD  02 0039     Load word at G57
   0786: STO              Store indirect (TOS into TOS-1)
   0787: LDA  02 0002     Load addr G2 (INPUT)
   078a: SLDC 02          Short load constant 2
   078b: IXA  0001        Index array (TOS-1 + TOS * 1)
   078d: LOD  02 0038     Load word at G56
   0790: STO              Store indirect (TOS into TOS-1)
   0791: LDA  02 0002     Load addr G2 (INPUT)
   0794: SLDC 03          Short load constant 3
   0795: IXA  0001        Index array (TOS-1 + TOS * 1)
   0797: LDCN             Load constant NIL
   0798: STO              Store indirect (TOS into TOS-1)
   0799: LDA  02 0002     Load addr G2 (INPUT)
   079c: SLDC 04          Short load constant 4
   079d: IXA  0001        Index array (TOS-1 + TOS * 1)
   079f: LDCN             Load constant NIL
   07a0: STO              Store indirect (TOS into TOS-1)
   07a1: LDA  02 0002     Load addr G2 (INPUT)
   07a4: SLDC 05          Short load constant 5
   07a5: IXA  0001        Index array (TOS-1 + TOS * 1)
   07a7: LDCN             Load constant NIL
   07a8: STO              Store indirect (TOS into TOS-1)
-> 07a9: RNP  00          Return from nonbase procedure
END

## Segment GETCMD (5)

### FUNCTION GETCMD.GETCMD(PARAM1): RETVAL (* P=1 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 109e: LOD  01 003a     Load word at G58
   10a1: INC  0002        Inc field ptr (TOS+2)
   10a3: SLDC 00          Short load constant 0
   10a4: STO              Store indirect (TOS into TOS-1)
   10a5: LOD  01 0039     Load word at G57
   10a8: INC  0002        Inc field ptr (TOS+2)
   10aa: SLDC 00          Short load constant 0
   10ab: STO              Store indirect (TOS into TOS-1)
   10ac: LOD  01 0038     Load word at G56
   10af: INC  0002        Inc field ptr (TOS+2)
   10b1: SLDC 00          Short load constant 0
   10b2: STO              Store indirect (TOS into TOS-1)
   10b3: LDA  01 0002     Load addr G2 (INPUT)
   10b6: SLDC 00          Short load constant 0
   10b7: IXA  0001        Index array (TOS-1 + TOS * 1)
   10b9: LOD  01 003a     Load word at G58
   10bc: STO              Store indirect (TOS into TOS-1)
   10bd: LDA  01 0002     Load addr G2 (INPUT)
   10c0: SLDC 01          Short load constant 1
   10c1: IXA  0001        Index array (TOS-1 + TOS * 1)
   10c3: LOD  01 0039     Load word at G57
   10c6: STO              Store indirect (TOS into TOS-1)
   10c7: SLDO 03          Short load global BASE3
   10c8: SLDC 00          Short load constant 0
   10c9: EQUI             Integer TOS-1 = TOS
   10ca: FJP  $10fb       Jump if TOS false
   10cc: LOD  01 0189     Load word at G393
   10d0: FJP  $10fb       Jump if TOS false
   10d2: SLDC 00          Short load constant 0
   10d3: STR  01 0189     Store TOS to G393
   10d7: LSA  0e          Load string address: '*SYSTEM.ATTACH'
   10e7: NOP              No operation
   10e8: SLDC 00          Short load constant 0
   10e9: SLDC 00          Short load constant 0
   10ea: SLDC 00          Short load constant 0
   10eb: LAO  0006        Load global BASE6
   10ed: SLDC 01          Short load constant 1
   10ee: SLDC 00          Short load constant 0
   10ef: SLDC 00          Short load constant 0
   10f0: CLP  0d          Call local procedure GETCMD.13
   10f2: FJP  $10fb       Jump if TOS false
   10f4: SLDC 0a          Short load constant 10
   10f5: SRO  0001        Store global word BASE1
   10f7: SLDC 05          Short load constant 5
   10f8: SLDC 01          Short load constant 1
   10f9: CSP  04          Call standard procedure EXIT
-> 10fb: SLDO 03          Short load global BASE3
   10fc: SLDC 0a          Short load constant 10
   10fd: EQUI             Integer TOS-1 = TOS
   10fe: FJP  $1103       Jump if TOS false
   1100: SLDC 00          Short load constant 0
   1101: SRO  0003        Store global word BASE3
-> 1103: SLDO 03          Short load global BASE3
   1104: SLDC 00          Short load constant 0
   1105: EQUI             Integer TOS-1 = TOS
   1106: FJP  $1130       Jump if TOS false
   1108: NOP              No operation
   1109: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   111a: SLDC 00          Short load constant 0
   111b: SLDC 00          Short load constant 0
   111c: SLDC 00          Short load constant 0
   111d: LAO  0006        Load global BASE6
   111f: SLDC 00          Short load constant 0
   1120: SLDC 00          Short load constant 0
   1121: SLDC 00          Short load constant 0
   1122: CLP  0d          Call local procedure GETCMD.13
   1124: FJP  $1130       Jump if TOS false
   1126: CXP  00 25       Call external procedure PASCALSY.37
   1129: SLDC 04          Short load constant 4
   112a: SRO  0001        Store global word BASE1
   112c: SLDC 05          Short load constant 5
   112d: SLDC 01          Short load constant 1
   112e: CSP  04          Call standard procedure EXIT
-> 1130: SLDO 03          Short load global BASE3
   1131: LDCI 00e0        Load word 224
   1134: SLDC 01          Short load constant 1
   1135: INN              Set membership (TOS-1 in set TOS)
   1136: FJP  $113a       Jump if TOS false
   1138: CLP  10          Call local procedure GETCMD.16
-> 113a: SLDO 03          Short load global BASE3
   113b: LDCI 0300        Load word 768
   113e: SLDC 01          Short load constant 1
   113f: INN              Set membership (TOS-1 in set TOS)
   1140: FJP  $1145       Jump if TOS false
   1142: SLDC 00          Short load constant 0
   1143: CLP  02          Call local procedure GETCMD.2
-> 1145: LOD  01 0001     Load word at G1 (SYSCOM)
   1148: INC  001d        Inc field ptr (TOS+29)
   114a: SLDC 02          Short load constant 2
   114b: SLDC 07          Short load constant 7
   114c: LDP              Load packed field (TOS)
   114d: SLDC 01          Short load constant 1
   114e: EQUI             Integer TOS-1 = TOS
   114f: FJP  $1169       Jump if TOS false
   1151: SLDO 03          Short load global BASE3
   1152: SLDC 00          Short load constant 0
   1153: EQUI             Integer TOS-1 = TOS
   1154: FJP  $115e       Jump if TOS false
   1156: SLDC 06          Short load constant 6
   1157: SRO  0003        Store global word BASE3
   1159: SLDC 01          Short load constant 1
   115a: CLP  02          Call local procedure GETCMD.2
   115c: UJP  $1169       Unconditional jump
-> 115e: LDCN             Load constant NIL
   115f: STR  01 0036     Store TOS to G54
   1162: SLDC 00          Short load constant 0
   1163: SRO  0001        Store global word BASE1
   1165: SLDC 05          Short load constant 5
   1166: SLDC 01          Short load constant 1
   1167: CSP  04          Call standard procedure EXIT
-> 1169: SLDC 00          Short load constant 0
   116a: STR  01 000a     Store TOS to G10
   116d: SLDC 00          Short load constant 0
   116e: STR  01 000b     Store TOS to G11
   1171: SLDC 00          Short load constant 0
   1172: STR  01 000c     Store TOS to G12
   1175: SLDC 00          Short load constant 0
   1176: SRO  0005        Store global word BASE5
   1178: LDA  01 0148     Load addr G328
   117c: SLDC 00          Short load constant 0
   117d: LDB              Load byte at byte ptr TOS-1 + TOS
   117e: SLDC 00          Short load constant 0
   117f: NEQI             Integer TOS-1 <> TOS
   1180: FJP  $1185       Jump if TOS false
   1182: SLDC 01          Short load constant 1
   1183: CLP  13          Call local procedure GETCMD.19
-> 1185: LDA  01 0046     Load addr G70
   1188: NOP              No operation
   1189: LSA  43          Load string address: 'Command: E(dit, R(un, F(ile, C(omp, L(ink, X(ecute, A(ssem, ? [1.2]'
   11ce: SAS  50          String assign (TOS to TOS-1, 80 chars)
   11d0: CXP  00 27       Call external procedure PASCALSY.39
   11d3: SLDO 05          Short load global BASE5
   11d4: SLDC 00          Short load constant 0
   11d5: SLDC 00          Short load constant 0
   11d6: CXP  00 29       Call external procedure PASCALSY.41
   11d9: SRO  0004        Store global word BASE4
   11db: CXP  00 25       Call external procedure PASCALSY.37
   11de: SLDO 04          Short load global BASE4
   11df: SLDC 3f          Short load constant 63
   11e0: EQUI             Integer TOS-1 = TOS
   11e1: FJP  $1236       Jump if TOS false
   11e3: LDA  01 0046     Load addr G70
   11e6: NOP              No operation
   11e7: LSA  3d          Load string address: 'Command: U(ser restart, I(nitialize, H(alt, S(wap, M(ake exec'
   1226: SAS  50          String assign (TOS to TOS-1, 80 chars)
   1228: CXP  00 27       Call external procedure PASCALSY.39
   122b: SLDO 05          Short load global BASE5
   122c: SLDC 00          Short load constant 0
   122d: SLDC 00          Short load constant 0
   122e: CXP  00 29       Call external procedure PASCALSY.41
   1231: SRO  0004        Store global word BASE4
   1233: CXP  00 25       Call external procedure PASCALSY.37
-> 1236: LOD  01 0187     Load word at G391
   123a: FJP  $1246       Jump if TOS false
   123c: LDA  01 0036     Load addr G54
   123f: CSP  21          Call standard procedure RELEASE
   1241: SLDC 00          Short load constant 0
   1242: STR  01 0187     Store TOS to G391
-> 1246: SLDO 04          Short load global BASE4
   124a: LDC  06          Load multiple-word constant
                         012c336a8000000000000000
   1256: SLDC 06          Short load constant 6
   1257: INN              Set membership (TOS-1 in set TOS)
   1258: LNOT             Logical NOT (~TOS)
   1259: SRO  0005        Store global word BASE5
   125b: SLDO 05          Short load global BASE5
   125c: LNOT             Logical NOT (~TOS)
   125d: FJP  $138e       Jump if TOS false
   125f: SLDO 04          Short load global BASE4
   1260: UJP  $1357       Unconditional jump
   1262: LOD  01 0003     Load word at G3 (OUTPUT)
   1265: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1268: SLDC 02          Short load constant 2
   1269: SLDC 01          Short load constant 1
   126a: SLDC 00          Short load constant 0
   126b: SLDC 00          Short load constant 0
   126c: CLP  03          Call local procedure GETCMD.3
   126e: FJP  $1277       Jump if TOS false
   1270: SLDC 04          Short load constant 4
   1271: SRO  0001        Store global word BASE1
   1273: SLDC 05          Short load constant 5
   1274: SLDC 01          Short load constant 1
   1275: CSP  04          Call standard procedure EXIT
-> 1277: UJP  $138e       Unconditional jump
   1279: LOD  01 0003     Load word at G3 (OUTPUT)
   127c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   127f: SLDC 03          Short load constant 3
   1280: SLDC 01          Short load constant 1
   1281: SLDC 00          Short load constant 0
   1282: SLDC 00          Short load constant 0
   1283: CLP  03          Call local procedure GETCMD.3
   1285: FJP  $1293       Jump if TOS false
   1287: SLDC 04          Short load constant 4
   1288: SRO  0001        Store global word BASE1
   128a: SLDC 01          Short load constant 1
   128b: STR  01 0188     Store TOS to G392
   128f: SLDC 05          Short load constant 5
   1290: SLDC 01          Short load constant 1
   1291: CSP  04          Call standard procedure EXIT
-> 1293: UJP  $138e       Unconditional jump
   1295: LOD  01 0003     Load word at G3 (OUTPUT)
   1298: NOP              No operation
   1299: LSA  0a          Load string address: 'Linking...'
   12a5: SLDC 00          Short load constant 0
   12a6: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   12a9: LOD  01 0003     Load word at G3 (OUTPUT)
   12ac: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   12af: SLDC 04          Short load constant 4
   12b0: SLDC 01          Short load constant 1
   12b1: SLDC 00          Short load constant 0
   12b2: SLDC 00          Short load constant 0
   12b3: CLP  03          Call local procedure GETCMD.3
   12b5: FJP  $12be       Jump if TOS false
   12b7: SLDC 04          Short load constant 4
   12b8: SRO  0001        Store global word BASE1
   12ba: SLDC 05          Short load constant 5
   12bb: SLDC 01          Short load constant 1
   12bc: CSP  04          Call standard procedure EXIT
-> 12be: UJP  $138e       Unconditional jump
   12c0: SLDC 00          Short load constant 0
   12c1: CLP  13          Call local procedure GETCMD.19
   12c3: UJP  $138e       Unconditional jump
   12c5: SLDC 05          Short load constant 5
   12c6: CLP  0e          Call local procedure GETCMD.14
   12c8: UJP  $138e       Unconditional jump
   12ca: SLDC 08          Short load constant 8
   12cb: CLP  0e          Call local procedure GETCMD.14
   12cd: UJP  $138e       Unconditional jump
   12cf: SLDO 03          Short load global BASE3
   12d0: SLDC 02          Short load constant 2
   12d1: NEQI             Integer TOS-1 <> TOS
   12d2: FJP  $12fa       Jump if TOS false
   12d4: LOD  01 0003     Load word at G3 (OUTPUT)
   12d7: LSA  0d          Load string address: 'Restarting...'
   12e6: NOP              No operation
   12e7: SLDC 00          Short load constant 0
   12e8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   12eb: LOD  01 0003     Load word at G3 (OUTPUT)
   12ee: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   12f1: SLDC 04          Short load constant 4
   12f2: SRO  0001        Store global word BASE1
   12f4: SLDC 05          Short load constant 5
   12f5: SLDC 01          Short load constant 1
   12f6: CSP  04          Call standard procedure EXIT
   12f8: UJP  $1317       Unconditional jump
-> 12fa: LOD  01 0003     Load word at G3 (OUTPUT)
   12fd: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1300: LOD  01 0003     Load word at G3 (OUTPUT)
   1303: LSA  0d          Load string address: 'U not allowed'
   1312: NOP              No operation
   1313: SLDC 00          Short load constant 0
   1314: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 1317: UJP  $138e       Unconditional jump
   1319: SLDC 01          Short load constant 1
   131a: CLP  02          Call local procedure GETCMD.2
   131c: UJP  $138e       Unconditional jump
   131e: LOD  01 0183     Load word at G387
   1322: LOD  01 0182     Load word at G386
   1326: LOR              Logical OR (TOS | TOS-1)
   1327: FJP  $132d       Jump if TOS false
   1329: SLDC 01          Short load constant 1
   132a: CXP  00 2d       Call external procedure PASCALSY.45
-> 132d: SLDC 00          Short load constant 0
   132e: SRO  0001        Store global word BASE1
   1330: SLDO 04          Short load global BASE4
   1331: SLDC 48          Short load constant 72
   1332: EQUI             Integer TOS-1 = TOS
   1333: FJP  $1339       Jump if TOS false
   1335: LDCN             Load constant NIL
   1336: STR  01 0036     Store TOS to G54
-> 1339: SLDC 05          Short load constant 5
   133a: SLDC 01          Short load constant 1
   133b: CSP  04          Call standard procedure EXIT
   133d: UJP  $138e       Unconditional jump
   133f: CLP  14          Call local procedure GETCMD.20
   1341: UJP  $138e       Unconditional jump
   1343: LOD  01 0182     Load word at G386
   1347: LOD  01 0183     Load word at G387
   134b: LOR              Logical OR (TOS | TOS-1)
   134c: FJP  $1353       Jump if TOS false
   134e: SLDC 01          Short load constant 1
   134f: CLP  11          Call local procedure GETCMD.17
   1351: UJP  $1355       Unconditional jump
-> 1353: CLP  15          Call local procedure GETCMD.21
-> 1355: UJP  $138e       Unconditional jump
-> 138e: SLDC 00          Short load constant 0
   138f: FJP  $1185       Jump if TOS false
-> 1391: RBP  01          Return from base procedure
END

### PROCEDURE GETCMD.PROC2(PARAM1) (* P=2 LL=1 *)
  BASE1
  BASE3
  BASE6
  MP1=PARAM1
  MP2
BEGIN
-> 0cd4: LOD  02 0010     Load word at G16
   0cd7: FJP  $0d3f       Jump if TOS false
   0cd9: CXP  00 25       Call external procedure PASCALSY.37
   0cdc: LOD  02 0003     Load word at G3 (OUTPUT)
   0cdf: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ce2: SLDC 00          Short load constant 0
   0ce3: STL  0002        Store TOS into MP2
   0ce5: LLA  0002        Load local address MP2
   0ce7: LDA  02 0012     Load addr G18
   0cea: SLDC 07          Short load constant 7
   0ceb: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0cee: LLA  0002        Load local address MP2
   0cf0: NOP              No operation
   0cf1: LSA  01          Load string address: ':'
   0cf4: SLDC 08          Short load constant 8
   0cf5: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0cf8: LLA  0002        Load local address MP2
   0cfa: LDA  02 001e     Load addr G30
   0cfd: SLDC 17          Short load constant 23
   0cfe: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0d01: LLA  0002        Load local address MP2
   0d03: SLDL 01          Short load local MP1
   0d04: SLDC 01          Short load constant 1
   0d05: SLDC 01          Short load constant 1
   0d06: LAO  0006        Load global BASE6
   0d08: SLDC 00          Short load constant 0
   0d09: SLDC 00          Short load constant 0
   0d0a: SLDC 00          Short load constant 0
   0d0b: CGP  0d          Call global procedure GETCMD.13
   0d0d: FJP  $0d30       Jump if TOS false
   0d0f: LOD  02 0003     Load word at G3 (OUTPUT)
   0d12: NOP              No operation
   0d13: LSA  0a          Load string address: 'Running...'
   0d1f: SLDC 00          Short load constant 0
   0d20: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0d23: LOD  02 0003     Load word at G3 (OUTPUT)
   0d26: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0d29: SLDC 04          Short load constant 4
   0d2a: SRO  0001        Store global word BASE1
   0d2c: SLDC 05          Short load constant 5
   0d2d: SLDC 01          Short load constant 1
   0d2e: CSP  04          Call standard procedure EXIT
-> 0d30: SLDO 03          Short load global BASE3
   0d31: LDCI 0300        Load word 768
   0d34: SLDC 01          Short load constant 1
   0d35: INN              Set membership (TOS-1 in set TOS)
   0d36: LNOT             Logical NOT (~TOS)
   0d37: FJP  $0d3d       Jump if TOS false
   0d39: SLDC 00          Short load constant 0
   0d3a: STR  02 0010     Store TOS to G16
-> 0d3d: UJP  $0d42       Unconditional jump
-> 0d3f: SLDC 06          Short load constant 6
   0d40: CGP  0e          Call global procedure GETCMD.14
-> 0d42: RNP  00          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC3(PARAM1; PARAM2): RETVAL (* P=3 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM2
  MP4=PARAM1
  MP5
  MP9
  MP17
  MP18
  MP19
  MP20
  MP32
  MP33
  MP34
BEGIN
-> 0628: LDA  02 00fc     Load addr G252
   062c: SLDL 04          Short load local MP4
   062d: IXA  000c        Index array (TOS-1 + TOS * 12)
   062f: SLDC 00          Short load constant 0
   0630: SLDC 00          Short load constant 0
   0631: SLDC 00          Short load constant 0
   0632: LLA  0020        Load local address MP32
   0634: SLDL 03          Short load local MP3
   0635: SLDC 00          Short load constant 0
   0636: SLDC 00          Short load constant 0
   0637: CGP  0d          Call global procedure GETCMD.13
   0639: STL  0001        Store TOS into MP1
   063b: LDL  0020        Load local word MP32
   063d: SLDC 02          Short load constant 2
   063e: EQUI             Integer TOS-1 = TOS
   063f: FJP  $06ff       Jump if TOS false
   0641: LDA  02 00fc     Load addr G252
   0645: SLDL 04          Short load local MP4
   0646: IXA  000c        Index array (TOS-1 + TOS * 12)
   0648: LLA  0005        Load local address MP5
   064a: LLA  0009        Load local address MP9
   064c: LLA  0011        Load local address MP17
   064e: LLA  0012        Load local address MP18
   0650: SLDC 00          Short load constant 0
   0651: SLDC 00          Short load constant 0
   0652: CXP  00 21       Call external procedure PASCALSY.33
   0655: FJP  $06ff       Jump if TOS false
   0657: SLDC 00          Short load constant 0
   0658: STL  0013        Store TOS into MP19
-> 065a: LDL  0013        Load local word MP19
   065c: SLDC 01          Short load constant 1
   065d: ADI              Add integers (TOS + TOS-1)
   065e: STL  0013        Store TOS into MP19
   0660: LDA  02 007e     Load addr G126
   0663: LDL  0013        Load local word MP19
   0665: IXA  0006        Index array (TOS-1 + TOS * 6)
   0667: STL  0021        Store TOS into MP33
   0669: LDL  0021        Load local word MP33
   066b: SIND 04          Short index load *TOS+4
   066c: FJP  $06d4       Jump if TOS false
   066e: LDL  0021        Load local word MP33
   0670: NOP              No operation
   0671: LSA  00          Load string address: ''
   0673: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0675: LDL  0013        Load local word MP19
   0677: SLDC 00          Short load constant 0
   0678: SLDC 00          Short load constant 0
   0679: CXP  00 2a       Call external procedure PASCALSY.42
   067c: FJP  $06d4       Jump if TOS false
   067e: LDL  0021        Load local word MP33
   0680: LOD  02 0001     Load word at G1 (SYSCOM)
   0683: SIND 04          Short index load *TOS+4
   0684: SLDC 00          Short load constant 0
   0685: IXA  000d        Index array (TOS-1 + TOS * 13)
   0687: INC  0003        Inc field ptr (TOS+3)
   0689: SAS  07          String assign (TOS to TOS-1, 7 chars)
   068b: LLA  0014        Load local address MP20
   068d: SLDC 00          Short load constant 0
   068e: STL  0022        Store TOS into MP34
   0690: LLA  0022        Load local address MP34
   0692: LDL  0021        Load local word MP33
   0694: SLDC 07          Short load constant 7
   0695: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0698: LLA  0022        Load local address MP34
   069a: NOP              No operation
   069b: LSA  01          Load string address: ':'
   069e: SLDC 08          Short load constant 8
   069f: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   06a2: LLA  0022        Load local address MP34
   06a4: LLA  0009        Load local address MP9
   06a6: SLDC 17          Short load constant 23
   06a7: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   06aa: LLA  0022        Load local address MP34
   06ac: SAS  17          String assign (TOS to TOS-1, 23 chars)
   06ae: LLA  0014        Load local address MP20
   06b0: LDA  02 00fc     Load addr G252
   06b4: SLDL 04          Short load local MP4
   06b5: IXA  000c        Index array (TOS-1 + TOS * 12)
   06b7: NEQSTR           String TOS-1 <> TOS
   06b9: FJP  $06d4       Jump if TOS false
   06bb: LLA  0014        Load local address MP20
   06bd: SLDC 00          Short load constant 0
   06be: SLDC 00          Short load constant 0
   06bf: SLDC 00          Short load constant 0
   06c0: LLA  0020        Load local address MP32
   06c2: SLDL 03          Short load local MP3
   06c3: SLDC 00          Short load constant 0
   06c4: SLDC 00          Short load constant 0
   06c5: CGP  0d          Call global procedure GETCMD.13
   06c7: FJP  $06d4       Jump if TOS false
   06c9: LDA  02 00fc     Load addr G252
   06cd: SLDL 04          Short load local MP4
   06ce: IXA  000c        Index array (TOS-1 + TOS * 12)
   06d0: LLA  0014        Load local address MP20
   06d2: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 06d4: LDL  0013        Load local word MP19
   06d6: SLDC 14          Short load constant 20
   06d7: EQUI             Integer TOS-1 = TOS
   06d8: LDL  0020        Load local word MP32
   06da: SLDC 03          Short load constant 3
   06db: SLDC 01          Short load constant 1
   06dc: INN              Set membership (TOS-1 in set TOS)
   06dd: LOR              Logical OR (TOS | TOS-1)
   06de: FJP  $065a       Jump if TOS false
   06e0: LDL  0020        Load local word MP32
   06e2: SLDC 00          Short load constant 0
   06e3: EQUI             Integer TOS-1 = TOS
   06e4: STL  0001        Store TOS into MP1
   06e6: LDL  0020        Load local word MP32
   06e8: SLDC 02          Short load constant 2
   06e9: EQUI             Integer TOS-1 = TOS
   06ea: FJP  $06ff       Jump if TOS false
   06ec: LDA  02 00fc     Load addr G252
   06f0: SLDL 04          Short load local MP4
   06f1: IXA  000c        Index array (TOS-1 + TOS * 12)
   06f3: SLDC 00          Short load constant 0
   06f4: SLDC 00          Short load constant 0
   06f5: SLDC 01          Short load constant 1
   06f6: LLA  0020        Load local address MP32
   06f8: SLDC 00          Short load constant 0
   06f9: SLDC 00          Short load constant 0
   06fa: SLDC 00          Short load constant 0
   06fb: CGP  0d          Call global procedure GETCMD.13
   06fd: FJP  $06ff       Jump if TOS false
-> 06ff: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC4: RETVAL (* P=4 LL=1 *)
  MP1=RETVAL1
  MP3
BEGIN
-> 0000: LOD  02 0002     Load word at G2 (INPUT)
   0003: LLA  0003        Load local address MP3
   0005: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   0008: SLDL 03          Short load local MP3
   000c: LDC  08          Load multiple-word constant
                         02004000020040000000000000000000
   001c: SLDC 08          Short load constant 8
   001d: INN              Set membership (TOS-1 in set TOS)
   001e: FJP  $0000       Jump if TOS false
   0020: SLDL 03          Short load local MP3
   0021: SLDC 59          Short load constant 89
   0022: EQUI             Integer TOS-1 = TOS
   0023: SLDL 03          Short load local MP3
   0024: SLDC 79          Short load constant 121
   0025: EQUI             Integer TOS-1 = TOS
   0026: LOR              Logical OR (TOS | TOS-1)
   0027: STL  0001        Store TOS into MP1
-> 0029: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC5(PARAM1; PARAM2): RETVAL (* P=5 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM2
  MP4=PARAM1
  MP5
BEGIN
-> 0038: SLDL 04          Short load local MP4
   0039: INC  0080        Inc field ptr (TOS+128)
   003c: SLDL 03          Short load local MP3
   003d: IXA  0001        Index array (TOS-1 + TOS * 1)
   003f: STL  0005        Store TOS into MP5
   0041: SLDL 05          Short load local MP5
   0042: SLDC 03          Short load constant 3
   0043: SLDC 0d          Short load constant 13
   0044: LDP              Load packed field (TOS)
   0045: SLDC 01          Short load constant 1
   0046: LESI             Integer TOS-1 < TOS
   0047: FJP  $004e       Jump if TOS false
   0049: SLDL 03          Short load local MP3
   004a: STL  0001        Store TOS into MP1
   004c: UJP  $0061       Unconditional jump
-> 004e: SLDL 05          Short load local MP5
   004f: SLDC 08          Short load constant 8
   0050: SLDC 00          Short load constant 0
   0051: LDP              Load packed field (TOS)
   0052: SLDC 1f          Short load constant 31
   0053: GRTI             Integer TOS-1 > TOS
   0054: FJP  $005b       Jump if TOS false
   0056: SLDC 00          Short load constant 0
   0057: STL  0001        Store TOS into MP1
   0059: UJP  $0061       Unconditional jump
-> 005b: SLDL 05          Short load local MP5
   005c: SLDC 08          Short load constant 8
   005d: SLDC 00          Short load constant 0
   005e: LDP              Load packed field (TOS)
   005f: STL  0001        Store TOS into MP1
-> 0061: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC6(PARAM1): RETVAL (* P=6 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM1
  MP4
  MP45
  MP49
  MP57
  MP58
BEGIN
-> 006e: LLA  0004        Load local address MP4
   0070: SLDL 03          Short load local MP3
   0071: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0073: SLDC 00          Short load constant 0
   0074: STL  0001        Store TOS into MP1
   0076: LLA  0004        Load local address MP4
   0078: LLA  002d        Load local address MP45
   007a: LLA  0031        Load local address MP49
   007c: LLA  0039        Load local address MP57
   007e: LLA  003a        Load local address MP58
   0080: SLDC 00          Short load constant 0
   0081: SLDC 00          Short load constant 0
   0082: CXP  00 21       Call external procedure PASCALSY.33
   0085: FJP  $0087       Jump if TOS false
-> 0087: LLA  0031        Load local address MP49
   0089: LSA  00          Load string address: ''
   008b: NOP              No operation
   008c: EQLSTR           String TOS-1 = TOS
   008e: FJP  $00b9       Jump if TOS false
   0090: LOD  02 0003     Load word at G3 (OUTPUT)
   0093: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0096: LOD  02 0003     Load word at G3 (OUTPUT)
   0099: LSA  10          Load string address: 'Illegal filename'
   00ab: NOP              No operation
   00ac: SLDC 00          Short load constant 0
   00ad: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   00b0: LOD  02 0003     Load word at G3 (OUTPUT)
   00b3: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   00b6: SLDC 01          Short load constant 1
   00b7: STL  0001        Store TOS into MP1
-> 00b9: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC7(PARAM1): RETVAL (* P=7 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM1
  MP4
  MP5
BEGIN
-> 00c6: SLDC 01          Short load constant 1
   00c7: STL  0001        Store TOS into MP1
   00c9: SLDC 01          Short load constant 1
   00ca: STL  0004        Store TOS into MP4
   00cc: SLDC 0f          Short load constant 15
   00cd: STL  0005        Store TOS into MP5
-> 00cf: SLDL 04          Short load local MP4
   00d0: SLDL 05          Short load local MP5
   00d1: LEQI             Integer TOS-1 <= TOS
   00d2: FJP  $00f1       Jump if TOS false
   00d4: SLDL 03          Short load local MP3
   00d5: SLDL 04          Short load local MP4
   00d6: IXA  0002        Index array (TOS-1 + TOS * 2)
   00d8: SIND 01          Short index load *TOS+1
   00d9: SLDC 00          Short load constant 0
   00da: NEQI             Integer TOS-1 <> TOS
   00db: FJP  $00ea       Jump if TOS false
   00dd: SLDL 03          Short load local MP3
   00de: SLDL 04          Short load local MP4
   00df: SLDC 00          Short load constant 0
   00e0: SLDC 00          Short load constant 0
   00e1: CGP  05          Call global procedure GETCMD.5
   00e3: SLDC 00          Short load constant 0
   00e4: EQUI             Integer TOS-1 = TOS
   00e5: FJP  $00ea       Jump if TOS false
   00e7: SLDC 00          Short load constant 0
   00e8: STL  0001        Store TOS into MP1
-> 00ea: SLDL 04          Short load local MP4
   00eb: SLDC 01          Short load constant 1
   00ec: ADI              Add integers (TOS + TOS-1)
   00ed: STL  0004        Store TOS into MP4
   00ef: UJP  $00cf       Unconditional jump
-> 00f1: SLDL 03          Short load local MP3
   00f2: INC  0092        Inc field ptr (TOS+146)
   00f5: SLDC 00          Short load constant 0
   00f6: IXA  0001        Index array (TOS-1 + TOS * 1)
   00f8: SIND 00          Short index load *TOS+0
   00f9: SLDC 00          Short load constant 0
   00fa: NEQI             Integer TOS-1 <> TOS
   00fb: SLDL 03          Short load local MP3
   00fc: INC  0092        Inc field ptr (TOS+146)
   00ff: SLDC 01          Short load constant 1
   0100: IXA  0001        Index array (TOS-1 + TOS * 1)
   0102: SIND 00          Short index load *TOS+0
   0103: SLDC 00          Short load constant 0
   0104: NEQI             Integer TOS-1 <> TOS
   0105: LOR              Logical OR (TOS | TOS-1)
   0106: FJP  $010b       Jump if TOS false
   0108: SLDC 00          Short load constant 0
   0109: STL  0001        Store TOS into MP1
-> 010b: RNP  01          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC8(PARAM1) (* P=8 LL=1 *)
  MP1=PARAM1
  MP2
  MP3
  MP4
BEGIN
-> 013c: SLDC 00          Short load constant 0
   013d: STL  0003        Store TOS into MP3
-> 013f: SLDL 01          Short load local MP1
   0140: SLDL 03          Short load local MP3
   0141: SLDC 00          Short load constant 0
   0142: SLDC 00          Short load constant 0
   0143: CGP  05          Call global procedure GETCMD.5
   0145: SLDC 01          Short load constant 1
   0146: NEQI             Integer TOS-1 <> TOS
   0147: FJP  $0150       Jump if TOS false
   0149: SLDL 03          Short load local MP3
   014a: SLDC 01          Short load constant 1
   014b: ADI              Add integers (TOS + TOS-1)
   014c: STL  0003        Store TOS into MP3
   014e: UJP  $013f       Unconditional jump
-> 0150: SLDL 01          Short load local MP1
   0151: INC  0080        Inc field ptr (TOS+128)
   0154: SLDL 03          Short load local MP3
   0155: IXA  0001        Index array (TOS-1 + TOS * 1)
   0157: SLDC 03          Short load constant 3
   0158: SLDC 0d          Short load constant 13
   0159: LDP              Load packed field (TOS)
   015a: STL  0002        Store TOS into MP2
   015c: SLDL 02          Short load local MP2
   015d: SLDC 01          Short load constant 1
   015e: EQUI             Integer TOS-1 = TOS
   015f: FJP  $0165       Jump if TOS false
   0161: CLP  09          Call local procedure GETCMD.9
   0163: UJP  $01a8       Unconditional jump
-> 0165: SLDL 02          Short load local MP2
   0166: SLDC 02          Short load constant 2
   0167: EQUI             Integer TOS-1 = TOS
   0168: FJP  $01a8       Jump if TOS false
   016a: LLA  0004        Load local address MP4
   016c: SLDC 02          Short load constant 2
   016d: IXA  0001        Index array (TOS-1 + TOS * 1)
   016f: SLDL 01          Short load local MP1
   0170: INC  0092        Inc field ptr (TOS+146)
   0173: SLDC 00          Short load constant 0
   0174: IXA  0001        Index array (TOS-1 + TOS * 1)
   0176: SIND 00          Short index load *TOS+0
   0177: STO              Store indirect (TOS into TOS-1)
   0178: LLA  0004        Load local address MP4
   017a: SLDC 03          Short load constant 3
   017b: IXA  0001        Index array (TOS-1 + TOS * 1)
   017d: SLDL 01          Short load local MP1
   017e: INC  0092        Inc field ptr (TOS+146)
   0181: SLDC 01          Short load constant 1
   0182: IXA  0001        Index array (TOS-1 + TOS * 1)
   0184: SIND 00          Short index load *TOS+0
   0185: STO              Store indirect (TOS into TOS-1)
   0186: LLA  0004        Load local address MP4
   0188: SLDC 02          Short load constant 2
   0189: IXA  0001        Index array (TOS-1 + TOS * 1)
   018b: SIND 00          Short index load *TOS+0
   018c: SLDC 2a          Short load constant 42
   018d: EQUI             Integer TOS-1 = TOS
   018e: LLA  0004        Load local address MP4
   0190: SLDC 03          Short load constant 3
   0191: IXA  0001        Index array (TOS-1 + TOS * 1)
   0193: SIND 00          Short index load *TOS+0
   0194: LDCI 061e        Load word 1566
   0197: EQUI             Integer TOS-1 = TOS
   0198: LLA  0004        Load local address MP4
   019a: SLDC 03          Short load constant 3
   019b: IXA  0001        Index array (TOS-1 + TOS * 1)
   019d: SIND 00          Short index load *TOS+0
   019e: LDCI 061f        Load word 1567
   01a1: EQUI             Integer TOS-1 = TOS
   01a2: LOR              Logical OR (TOS | TOS-1)
   01a3: LAND             Logical AND (TOS & TOS-1)
   01a4: FJP  $01a8       Jump if TOS false
   01a6: CLP  09          Call local procedure GETCMD.9
-> 01a8: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC9 (* P=9 LL=2 *)
BEGIN
-> 011a: LOD  01 0001     Load word at L1_1
   011d: INC  0092        Inc field ptr (TOS+146)
   0120: SLDC 00          Short load constant 0
   0121: IXA  0001        Index array (TOS-1 + TOS * 1)
   0123: SLDC 00          Short load constant 0
   0124: STO              Store indirect (TOS into TOS-1)
   0125: LOD  01 0001     Load word at L1_1
   0128: INC  0092        Inc field ptr (TOS+146)
   012b: SLDC 01          Short load constant 1
   012c: IXA  0001        Index array (TOS-1 + TOS * 1)
   012e: SLDC 00          Short load constant 0
   012f: STO              Store indirect (TOS into TOS-1)
-> 0130: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC10(PARAM1; PARAM2) (* P=10 LL=1 *)
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
-> 01b6: LOD  02 0001     Load word at G1 (SYSCOM)
   01b9: STL  0005        Store TOS into MP5
   01bb: SLDL 02          Short load local MP2
   01bc: STL  0006        Store TOS into MP6
   01be: SLDL 01          Short load local MP1
   01bf: STL  0007        Store TOS into MP7
   01c1: SLDL 07          Short load local MP7
   01c2: INC  0010        Inc field ptr (TOS+16)
   01c4: STL  0008        Store TOS into MP8
   01c6: SLDC 00          Short load constant 0
   01c7: STL  0003        Store TOS into MP3
   01c9: SLDC 0f          Short load constant 15
   01ca: STL  0009        Store TOS into MP9
-> 01cc: SLDL 03          Short load local MP3
   01cd: SLDL 09          Short load local MP9
   01ce: LEQI             Integer TOS-1 <= TOS
   01cf: FJP  $0224       Jump if TOS false
   01d1: SLDL 06          Short load local MP6
   01d2: SLDL 03          Short load local MP3
   01d3: IXA  0002        Index array (TOS-1 + TOS * 2)
   01d5: STL  000a        Store TOS into MP10
   01d7: SLDL 0a          Short load local MP10
   01d8: SIND 01          Short index load *TOS+1
   01d9: SLDC 00          Short load constant 0
   01da: NEQI             Integer TOS-1 <> TOS
   01db: FJP  $021d       Jump if TOS false
   01dd: SLDL 02          Short load local MP2
   01de: SLDL 03          Short load local MP3
   01df: SLDC 00          Short load constant 0
   01e0: SLDC 00          Short load constant 0
   01e1: CGP  05          Call global procedure GETCMD.5
   01e3: STL  0004        Store TOS into MP4
   01e5: SLDL 04          Short load local MP4
   01e8: LDC  02          Load multiple-word constant
                         ffffff82
   01ec: SLDC 02          Short load constant 2
   01ed: INN              Set membership (TOS-1 in set TOS)
   01ee: FJP  $021d       Jump if TOS false
   01f0: SLDL 05          Short load local MP5
   01f1: INC  0030        Inc field ptr (TOS+48)
   01f3: SLDL 04          Short load local MP4
   01f4: IXA  0003        Index array (TOS-1 + TOS * 3)
   01f6: STL  000b        Store TOS into MP11
   01f8: SLDL 0b          Short load local MP11
   01f9: SLDL 07          Short load local MP7
   01fa: SIND 07          Short index load *TOS+7
   01fb: STO              Store indirect (TOS into TOS-1)
   01fc: SLDL 0b          Short load local MP11
   01fd: INC  0002        Inc field ptr (TOS+2)
   01ff: SLDL 0a          Short load local MP10
   0200: SIND 01          Short index load *TOS+1
   0201: STO              Store indirect (TOS into TOS-1)
   0202: SLDL 06          Short load local MP6
   0203: INC  0060        Inc field ptr (TOS+96)
   0205: SLDL 03          Short load local MP3
   0206: IXA  0001        Index array (TOS-1 + TOS * 1)
   0208: SIND 00          Short index load *TOS+0
   0209: SLDC 07          Short load constant 7
   020a: EQUI             Integer TOS-1 = TOS
   020b: FJP  $0214       Jump if TOS false
   020d: SLDL 0b          Short load local MP11
   020e: INC  0001        Inc field ptr (TOS+1)
   0210: SLDC 00          Short load constant 0
   0211: STO              Store indirect (TOS into TOS-1)
   0212: UJP  $021d       Unconditional jump
-> 0214: SLDL 0b          Short load local MP11
   0215: INC  0001        Inc field ptr (TOS+1)
   0217: SLDL 0a          Short load local MP10
   0218: SIND 00          Short index load *TOS+0
   0219: SLDL 08          Short load local MP8
   021a: SIND 00          Short index load *TOS+0
   021b: ADI              Add integers (TOS + TOS-1)
   021c: STO              Store indirect (TOS into TOS-1)
-> 021d: SLDL 03          Short load local MP3
   021e: SLDC 01          Short load constant 1
   021f: ADI              Add integers (TOS + TOS-1)
   0220: STL  0003        Store TOS into MP3
   0222: UJP  $01cc       Unconditional jump
-> 0224: RNP  00          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC11(PARAM1; PARAM2; PARAM3): RETVAL (* P=11 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM3
  MP4=PARAM2
  MP5=PARAM1
  MP6
  MP7
  MP8
BEGIN
-> 0232: SLDL 04          Short load local MP4
   0233: SLDC 00          Short load constant 0
   0234: ADJ  02          Adjust set to 2 words
   0236: STM  02          Store 2 words at TOS to TOS-1
   0238: SLDC 01          Short load constant 1
   0239: STL  0001        Store TOS into MP1
   023b: SLDL 05          Short load local MP5
   023c: STL  0007        Store TOS into MP7
   023e: SLDC 00          Short load constant 0
   023f: STL  0006        Store TOS into MP6
   0241: SLDC 0f          Short load constant 15
   0242: STL  0008        Store TOS into MP8
-> 0244: SLDL 06          Short load local MP6
   0245: SLDL 08          Short load local MP8
   0246: LEQI             Integer TOS-1 <= TOS
   0247: FJP  $027b       Jump if TOS false
   0249: SLDL 07          Short load local MP7
   024a: SLDL 06          Short load local MP6
   024b: IXA  0002        Index array (TOS-1 + TOS * 2)
   024d: SIND 01          Short index load *TOS+1
   024e: SLDC 00          Short load constant 0
   024f: NEQI             Integer TOS-1 <> TOS
   0250: FJP  $0274       Jump if TOS false
   0252: SLDL 07          Short load local MP7
   0253: INC  0060        Inc field ptr (TOS+96)
   0255: SLDL 06          Short load local MP6
   0256: IXA  0001        Index array (TOS-1 + TOS * 1)
   0258: SIND 00          Short index load *TOS+0
   0259: SLDL 03          Short load local MP3
   025a: SLDC 01          Short load constant 1
   025b: INN              Set membership (TOS-1 in set TOS)
   025c: FJP  $0271       Jump if TOS false
   025e: SLDL 04          Short load local MP4
   025f: SLDL 04          Short load local MP4
   0260: LDM  02          Load 2 words from (TOS)
   0262: SLDC 02          Short load constant 2
   0263: SLDL 05          Short load local MP5
   0264: SLDL 06          Short load local MP6
   0265: SLDC 00          Short load constant 0
   0266: SLDC 00          Short load constant 0
   0267: CGP  05          Call global procedure GETCMD.5
   0269: SGS              Build singleton set [TOS]
   026a: UNI              Set union (TOS OR TOS-1)
   026b: ADJ  02          Adjust set to 2 words
   026d: STM  02          Store 2 words at TOS to TOS-1
   026f: UJP  $0274       Unconditional jump
-> 0271: SLDC 00          Short load constant 0
   0272: STL  0001        Store TOS into MP1
-> 0274: SLDL 06          Short load local MP6
   0275: SLDC 01          Short load constant 1
   0276: ADI              Add integers (TOS + TOS-1)
   0277: STL  0006        Store TOS into MP6
   0279: UJP  $0244       Unconditional jump
-> 027b: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC12(PARAM1): RETVAL (* P=12 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM1
  MP4
  MP12
  MP268
  MP275
  MP284
  MP558
BEGIN
-> 028a: LLA  0004        Load local address MP4
   028c: SLDL 03          Short load local MP3
   028d: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   028f: LLA  010c        Load local address MP268
   0292: LDCN             Load constant NIL
   0293: SLDC 01          Short load constant 1
   0294: NGI              Negate integer
   0295: CXP  00 03       Call external procedure PASCALSY.FINIT
   0298: SLDC 00          Short load constant 0
   0299: STL  0001        Store TOS into MP1
   029b: LLA  010c        Load local address MP268
   029e: LLA  0004        Load local address MP4
   02a0: SLDC 01          Short load constant 1
   02a1: LDCN             Load constant NIL
   02a2: CXP  00 05       Call external procedure PASCALSY.FOPEN
   02a5: CSP  22          Call standard procedure IORESULT
   02a7: SLDC 00          Short load constant 0
   02a8: EQUI             Integer TOS-1 = TOS
   02a9: FJP  $02e4       Jump if TOS false
   02ab: LOD  02 0001     Load word at G1 (SYSCOM)
   02ae: STL  022e        Store TOS into MP558
   02b1: LDL  0113        Load local word MP275
   02b4: LLA  000c        Load local address MP12
   02b6: SLDC 00          Short load constant 0
   02b7: LDCI 0200        Load word 512
   02ba: LDL  011c        Load local word MP284
   02bd: SLDC 00          Short load constant 0
   02be: CSP  05          Call standard procedure UNITREAD
   02c0: CSP  22          Call standard procedure IORESULT
   02c2: SLDC 00          Short load constant 0
   02c3: NEQI             Integer TOS-1 <> TOS
   02c4: FJP  $02c8       Jump if TOS false
   02c6: UJP  $02e4       Unconditional jump
-> 02c8: LLA  000c        Load local address MP12
   02ca: LDA  02 01c0     Load addr G448
   02ce: LDCI 00c0        Load word 192
   02d1: SLDC 01          Short load constant 1
   02d2: ADJ  01          Adjust set to 1 words
   02d4: SLDC 00          Short load constant 0
   02d5: SLDC 00          Short load constant 0
   02d6: CGP  0b          Call global procedure GETCMD.11
   02d8: FJP  $02da       Jump if TOS false
-> 02da: LLA  000c        Load local address MP12
   02dc: LLA  010c        Load local address MP268
   02df: CGP  0a          Call global procedure GETCMD.10
   02e1: SLDC 01          Short load constant 1
   02e2: STL  0001        Store TOS into MP1
-> 02e4: LLA  010c        Load local address MP268
   02e7: SLDC 00          Short load constant 0
   02e8: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 02eb: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC13(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5; PARAM6): RETVAL (* P=13 LL=1 *)
  BASE1
  BASE3
  MP1=RETVAL1
  MP3=PARAM6
  MP4=PARAM5
  MP5=PARAM4
  MP6=PARAM3
  MP7=PARAM2
  MP8=PARAM1
  MP9
  MP50
  MP178
  MP194
  MP306
  MP308
  MP349
  MP353
  MP357
  MP365
  MP366
  MP367
  MP368
  MP369
  MP370
BEGIN
-> 02f8: LLA  0009        Load local address MP9
   02fa: SLDL 08          Short load local MP8
   02fb: SAS  50          String assign (TOS to TOS-1, 80 chars)
   02fd: SLDL 04          Short load local MP4
   02fe: SLDC 02          Short load constant 2
   02ff: STO              Store indirect (TOS into TOS-1)
   0300: SLDC 00          Short load constant 0
   0301: STL  0001        Store TOS into MP1
   0303: LLA  015d        Load local address MP349
   0306: LDA  02 01bc     Load addr G444
   030a: SAS  07          String assign (TOS to TOS-1, 7 chars)
   030c: LLA  0134        Load local address MP308
   030f: LLA  0009        Load local address MP9
   0311: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0313: LLA  0134        Load local address MP308
   0316: LLA  0161        Load local address MP353
   0319: LLA  0165        Load local address MP357
   031c: LLA  016d        Load local address MP365
   031f: LLA  016e        Load local address MP366
   0322: SLDC 00          Short load constant 0
   0323: SLDC 00          Short load constant 0
   0324: CXP  00 21       Call external procedure PASCALSY.33
   0327: STL  016f        Store TOS into MP367
   032a: LDA  02 01bc     Load addr G444
   032e: LLA  0161        Load local address MP353
   0331: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0333: LDL  016f        Load local word MP367
   0336: LNOT             Logical NOT (~TOS)
   0337: FJP  $0342       Jump if TOS false
   0339: LDA  02 01bc     Load addr G444
   033d: LSA  00          Load string address: ''
   033f: NOP              No operation
   0340: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0342: LOD  02 0008     Load word at G8
   0345: LLA  0009        Load local address MP9
   0347: SLDC 01          Short load constant 1
   0348: LDCN             Load constant NIL
   0349: CXP  00 05       Call external procedure PASCALSY.FOPEN
   034c: CSP  22          Call standard procedure IORESULT
   034e: SLDC 00          Short load constant 0
   034f: NEQI             Integer TOS-1 <> TOS
   0350: FJP  $0395       Jump if TOS false
   0352: SLDL 05          Short load local MP5
   0353: FJP  $0393       Jump if TOS false
   0355: CSP  22          Call standard procedure IORESULT
   0357: SLDC 07          Short load constant 7
   0358: EQUI             Integer TOS-1 = TOS
   0359: FJP  $0378       Jump if TOS false
   035b: LOD  02 0003     Load word at G3 (OUTPUT)
   035e: NOP              No operation
   035f: LSA  11          Load string address: 'Illegal file name'
   0372: SLDC 00          Short load constant 0
   0373: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0376: UJP  $0393       Unconditional jump
-> 0378: LOD  02 0003     Load word at G3 (OUTPUT)
   037b: LSA  08          Load string address: 'No file '
   0385: NOP              No operation
   0386: SLDC 00          Short load constant 0
   0387: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   038a: LOD  02 0003     Load word at G3 (OUTPUT)
   038d: LLA  0009        Load local address MP9
   038f: SLDC 00          Short load constant 0
   0390: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0393: UJP  $0605       Unconditional jump
-> 0395: SLDL 04          Short load local MP4
   0396: SLDC 01          Short load constant 1
   0397: STO              Store indirect (TOS into TOS-1)
   0398: LOD  02 0001     Load word at G1 (SYSCOM)
   039b: STL  0170        Store TOS into MP368
   039e: LOD  02 0008     Load word at G8
   03a1: STL  0171        Store TOS into MP369
   03a4: LDL  0171        Load local word MP369
   03a7: INC  0010        Inc field ptr (TOS+16)
   03a9: STL  0172        Store TOS into MP370
   03ac: LDL  0172        Load local word MP370
   03af: INC  0002        Inc field ptr (TOS+2)
   03b1: SLDC 04          Short load constant 4
   03b2: SLDC 00          Short load constant 0
   03b3: LDP              Load packed field (TOS)
   03b4: SLDC 02          Short load constant 2
   03b5: NEQI             Integer TOS-1 <> TOS
   03b6: FJP  $03d8       Jump if TOS false
   03b8: LOD  02 0003     Load word at G3 (OUTPUT)
   03bb: LLA  0009        Load local address MP9
   03bd: SLDC 00          Short load constant 0
   03be: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   03c1: LOD  02 0003     Load word at G3 (OUTPUT)
   03c4: NOP              No operation
   03c5: LSA  09          Load string address: ' not code'
   03d0: SLDC 00          Short load constant 0
   03d1: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   03d4: UJP  $0605       Unconditional jump
   03d6: UJP  $05f4       Unconditional jump
-> 03d8: LDL  0171        Load local word MP369
   03db: SIND 07          Short index load *TOS+7
   03dc: LLA  0032        Load local address MP50
   03de: SLDC 00          Short load constant 0
   03df: LDCI 0200        Load word 512
   03e2: LDL  0172        Load local word MP370
   03e5: SIND 00          Short index load *TOS+0
   03e6: SLDC 00          Short load constant 0
   03e7: CSP  05          Call standard procedure UNITREAD
   03e9: CSP  22          Call standard procedure IORESULT
   03eb: SLDC 00          Short load constant 0
   03ec: NEQI             Integer TOS-1 <> TOS
   03ed: FJP  $0407       Jump if TOS false
   03ef: LOD  02 0003     Load word at G3 (OUTPUT)
   03f2: NOP              No operation
   03f3: LSA  0c          Load string address: 'Bad block #0'
   0401: SLDC 00          Short load constant 0
   0402: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0405: UJP  $0605       Unconditional jump
-> 0407: SLDL 03          Short load local MP3
   0408: FJP  $0445       Jump if TOS false
   040a: LLA  00b2        Load local address MP178
   040d: SLDC 01          Short load constant 1
   040e: IXA  0001        Index array (TOS-1 + TOS * 1)
   0410: SLDC 03          Short load constant 3
   0411: SLDC 0d          Short load constant 13
   0412: LDP              Load packed field (TOS)
   0413: SLDC 05          Short load constant 5
   0414: NEQI             Integer TOS-1 <> TOS
   0415: FJP  $0445       Jump if TOS false
   0417: LOD  02 0003     Load word at G3 (OUTPUT)
   041a: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   041d: LOD  02 0003     Load word at G3 (OUTPUT)
   0420: LLA  0009        Load local address MP9
   0422: SLDC 00          Short load constant 0
   0423: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0426: LOD  02 0003     Load word at G3 (OUTPUT)
   0429: LSA  13          Load string address: ' is not version 1.2'
   043e: NOP              No operation
   043f: SLDC 00          Short load constant 0
   0440: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0443: UJP  $0605       Unconditional jump
-> 0445: SLDL 03          Short load local MP3
   0446: LNOT             Logical NOT (~TOS)
   0447: FJP  $044d       Jump if TOS false
   0449: LLA  0032        Load local address MP50
   044b: CGP  08          Call global procedure GETCMD.8
-> 044d: LLA  0032        Load local address MP50
   044f: SLDC 00          Short load constant 0
   0450: SLDC 00          Short load constant 0
   0451: CGP  07          Call global procedure GETCMD.7
   0453: LNOT             Logical NOT (~TOS)
   0454: FJP  $049e       Jump if TOS false
   0456: LOD  02 0003     Load word at G3 (OUTPUT)
   0459: LSA  3c          Load string address: 'Specified code file must be run under the 128K Pascal system'
   0497: NOP              No operation
   0498: SLDC 00          Short load constant 0
   0499: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   049c: UJP  $0605       Unconditional jump
-> 049e: LLA  0032        Load local address MP50
   04a0: LLA  0132        Load local address MP306
   04a3: SLDC 01          Short load constant 1
   04a4: SLDC 01          Short load constant 1
   04a5: ADJ  01          Adjust set to 1 words
   04a7: SLDC 00          Short load constant 0
   04a8: SLDC 00          Short load constant 0
   04a9: CGP  0b          Call global procedure GETCMD.11
   04ab: LNOT             Logical NOT (~TOS)
   04ac: FJP  $0510       Jump if TOS false
   04ae: SLDL 07          Short load local MP7
   04af: FJP  $04eb       Jump if TOS false
   04b1: LOD  02 0003     Load word at G3 (OUTPUT)
   04b4: NOP              No operation
   04b5: LSA  0a          Load string address: 'Linking...'
   04c1: SLDC 00          Short load constant 0
   04c2: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   04c5: LOD  02 0003     Load word at G3 (OUTPUT)
   04c8: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   04cb: LOD  02 0008     Load word at G8
   04ce: SLDC 00          Short load constant 0
   04cf: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   04d2: SLDC 04          Short load constant 4
   04d3: SLDC 01          Short load constant 1
   04d4: SLDC 00          Short load constant 0
   04d5: SLDC 00          Short load constant 0
   04d6: CGP  03          Call global procedure GETCMD.3
   04d8: FJP  $04e9       Jump if TOS false
   04da: SLDL 06          Short load local MP6
   04db: FJP  $04e2       Jump if TOS false
   04dd: SLDC 08          Short load constant 8
   04de: SRO  0001        Store global word BASE1
   04e0: UJP  $04e5       Unconditional jump
-> 04e2: SLDC 09          Short load constant 9
   04e3: SRO  0001        Store global word BASE1
-> 04e5: SLDC 05          Short load constant 5
   04e6: SLDC 01          Short load constant 1
   04e7: CSP  04          Call standard procedure EXIT
-> 04e9: UJP  $050e       Unconditional jump
-> 04eb: SLDO 03          Short load global BASE3
   04ec: LDCI 0300        Load word 768
   04ef: SLDC 01          Short load constant 1
   04f0: INN              Set membership (TOS-1 in set TOS)
   04f1: LNOT             Logical NOT (~TOS)
   04f2: FJP  $050e       Jump if TOS false
   04f4: LOD  02 0003     Load word at G3 (OUTPUT)
   04f7: LSA  10          Load string address: 'Must L(ink first'
   0509: NOP              No operation
   050a: SLDC 00          Short load constant 0
   050b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 050e: UJP  $0605       Unconditional jump
-> 0510: LLA  0132        Load local address MP306
   0513: LDM  02          Load 2 words from (TOS)
   0515: SLDC 02          Short load constant 2
   0516: LLA  00c2        Load local address MP194
   0519: LDM  02          Load 2 words from (TOS)
   051b: SLDC 02          Short load constant 2
   051c: INT              Set intersection (TOS AND TOS-1)
   051d: SLDC 00          Short load constant 0
   051e: NEQSET           Set TOS-1 <> TOS
   0520: FJP  $055c       Jump if TOS false
   0522: LOD  02 0003     Load word at G3 (OUTPUT)
   0525: LSA  2e          Load string address: 'Conflict between intrinsic and user segment(s)'
   0555: NOP              No operation
   0556: SLDC 00          Short load constant 0
   0557: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   055a: UJP  $0605       Unconditional jump
-> 055c: LLA  00c2        Load local address MP194
   055f: LDM  02          Load 2 words from (TOS)
   0561: SLDC 02          Short load constant 2
   0562: SLDC 00          Short load constant 0
   0563: NEQSET           Set TOS-1 <> TOS
   0565: FJP  $05ed       Jump if TOS false
   0567: LSA  0f          Load string address: '*SYSTEM.LIBRARY'
   0578: NOP              No operation
   0579: SLDC 00          Short load constant 0
   057a: SLDC 00          Short load constant 0
   057b: CGP  0c          Call global procedure GETCMD.12
   057d: LNOT             Logical NOT (~TOS)
   057e: FJP  $05ac       Jump if TOS false
   0580: LOD  02 0003     Load word at G3 (OUTPUT)
   0583: LSA  20          Load string address: 'Can't load required intrinsic(s)'
   05a5: NOP              No operation
   05a6: SLDC 00          Short load constant 0
   05a7: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   05aa: UJP  $0605       Unconditional jump
-> 05ac: LLA  00c2        Load local address MP194
   05af: LDM  02          Load 2 words from (TOS)
   05b1: SLDC 02          Short load constant 2
   05b2: LDA  02 01c0     Load addr G448
   05b6: LDM  02          Load 2 words from (TOS)
   05b8: SLDC 02          Short load constant 2
   05b9: LEQSET           Set TOS-1 <= TOS
   05bb: LNOT             Logical NOT (~TOS)
   05bc: FJP  $05ed       Jump if TOS false
   05be: LOD  02 0003     Load word at G3 (OUTPUT)
   05c1: LSA  23          Load string address: 'Required intrinsic(s) not available'
   05e6: NOP              No operation
   05e7: SLDC 00          Short load constant 0
   05e8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   05eb: UJP  $0605       Unconditional jump
-> 05ed: LLA  0032        Load local address MP50
   05ef: LOD  02 0008     Load word at G8
   05f2: CGP  0a          Call global procedure GETCMD.10
-> 05f4: SLDL 04          Short load local MP4
   05f5: SLDC 00          Short load constant 0
   05f6: STO              Store indirect (TOS into TOS-1)
   05f7: SLDC 01          Short load constant 1
   05f8: STL  0001        Store TOS into MP1
   05fa: LOD  02 0008     Load word at G8
   05fd: SLDC 00          Short load constant 0
   05fe: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0601: SLDC 05          Short load constant 5
   0602: SLDC 0d          Short load constant 13
   0603: CSP  04          Call standard procedure EXIT
-> 0605: LOD  02 0008     Load word at G8
   0608: SLDC 00          Short load constant 0
   0609: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   060c: LDA  02 01bc     Load addr G444
   0610: LLA  015d        Load local address MP349
   0613: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0615: RNP  01          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC14(PARAM1) (* P=14 LL=1 *)
  BASE1
  MP1=PARAM1
  MP2
  MP23
  MP44
  MP56
  MP57
  MP58
  MP186
BEGIN
-> 073e: SLDL 01          Short load local MP1
   073f: SLDC 08          Short load constant 8
   0740: EQUI             Integer TOS-1 = TOS
   0741: FJP  $0759       Jump if TOS false
   0743: LOD  02 0003     Load word at G3 (OUTPUT)
   0746: NOP              No operation
   0747: LSA  0a          Load string address: 'Assembling'
   0753: SLDC 00          Short load constant 0
   0754: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0757: UJP  $076c       Unconditional jump
-> 0759: LOD  02 0003     Load word at G3 (OUTPUT)
   075c: NOP              No operation
   075d: LSA  09          Load string address: 'Compiling'
   0768: SLDC 00          Short load constant 0
   0769: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 076c: LOD  02 0003     Load word at G3 (OUTPUT)
   076f: LSA  03          Load string address: '...'
   0774: NOP              No operation
   0775: SLDC 00          Short load constant 0
   0776: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0779: LOD  02 0003     Load word at G3 (OUTPUT)
   077c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   077f: SLDL 01          Short load local MP1
   0780: SLDC 08          Short load constant 8
   0781: EQUI             Integer TOS-1 = TOS
   0782: FJP  $0789       Jump if TOS false
   0784: SLDC 00          Short load constant 0
   0785: STL  0039        Store TOS into MP57
   0787: UJP  $078c       Unconditional jump
-> 0789: SLDC 01          Short load constant 1
   078a: STL  0039        Store TOS into MP57
-> 078c: LDL  0039        Load local word MP57
   078e: SLDC 01          Short load constant 1
   078f: SLDC 00          Short load constant 0
   0790: SLDC 00          Short load constant 0
   0791: CGP  03          Call global procedure GETCMD.3
   0793: FJP  $09fa       Jump if TOS false
   0795: LOD  02 0011     Load word at G17
   0798: FJP  $07c1       Jump if TOS false
   079a: LLA  0002        Load local address MP2
   079c: SLDC 00          Short load constant 0
   079d: STL  003a        Store TOS into MP58
   079f: LLA  003a        Load local address MP58
   07a1: LDA  02 0016     Load addr G22
   07a4: SLDC 07          Short load constant 7
   07a5: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   07a8: LLA  003a        Load local address MP58
   07aa: NOP              No operation
   07ab: LSA  01          Load string address: ':'
   07ae: SLDC 08          Short load constant 8
   07af: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   07b2: LLA  003a        Load local address MP58
   07b4: LDA  02 0026     Load addr G38
   07b7: SLDC 17          Short load constant 23
   07b8: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   07bb: LLA  003a        Load local address MP58
   07bd: SAS  28          String assign (TOS to TOS-1, 40 chars)
   07bf: UJP  $0845       Unconditional jump
-> 07c1: SLDL 01          Short load local MP1
   07c2: SLDC 08          Short load constant 8
   07c3: EQUI             Integer TOS-1 = TOS
   07c4: FJP  $07da       Jump if TOS false
   07c6: LOD  02 0003     Load word at G3 (OUTPUT)
   07c9: LSA  08          Load string address: 'Assemble'
   07d3: NOP              No operation
   07d4: SLDC 00          Short load constant 0
   07d5: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   07d8: UJP  $07eb       Unconditional jump
-> 07da: LOD  02 0003     Load word at G3 (OUTPUT)
   07dd: LSA  07          Load string address: 'Compile'
   07e6: NOP              No operation
   07e7: SLDC 00          Short load constant 0
   07e8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 07eb: LOD  02 0003     Load word at G3 (OUTPUT)
   07ee: NOP              No operation
   07ef: LSA  0c          Load string address: ' what text? '
   07fd: SLDC 00          Short load constant 0
   07fe: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0801: LOD  02 0002     Load word at G2 (INPUT)
   0804: LLA  0002        Load local address MP2
   0806: SLDC 28          Short load constant 40
   0807: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   080a: LOD  02 0002     Load word at G2 (INPUT)
   080d: CXP  00 15       Call external procedure PASCALSY.FREADLN
   0810: CLP  0f          Call local procedure GETCMD.15
   0812: LLA  0002        Load local address MP2
   0814: NOP              No operation
   0815: LSA  00          Load string address: ''
   0817: EQLSTR           String TOS-1 = TOS
   0819: FJP  $081f       Jump if TOS false
   081b: UJP  $09ec       Unconditional jump
   081d: UJP  $0845       Unconditional jump
-> 081f: LLA  0002        Load local address MP2
   0821: SLDC 01          Short load constant 1
   0822: LDB              Load byte at byte ptr TOS-1 + TOS
   0823: LOD  02 0001     Load word at G1 (SYSCOM)
   0826: INC  002c        Inc field ptr (TOS+44)
   0828: SLDC 08          Short load constant 8
   0829: SLDC 08          Short load constant 8
   082a: LDP              Load packed field (TOS)
   082b: EQUI             Integer TOS-1 = TOS
   082c: FJP  $0832       Jump if TOS false
   082e: UJP  $09ec       Unconditional jump
   0830: UJP  $0845       Unconditional jump
-> 0832: LLA  0002        Load local address MP2
   0834: SLDC 00          Short load constant 0
   0835: SLDC 00          Short load constant 0
   0836: CGP  06          Call global procedure GETCMD.6
   0838: FJP  $083e       Jump if TOS false
   083a: SLDC 05          Short load constant 5
   083b: SLDC 0e          Short load constant 14
   083c: CSP  04          Call standard procedure EXIT
-> 083e: LLA  0002        Load local address MP2
   0840: SLDC 01          Short load constant 1
   0841: SLDC 28          Short load constant 40
   0842: CXP  00 2b       Call external procedure PASCALSY.43
-> 0845: LLA  0017        Load local address MP23
   0847: LLA  0002        Load local address MP2
   0849: SAS  28          String assign (TOS to TOS-1, 40 chars)
   084b: LSA  05          Load string address: '.TEXT'
   0852: NOP              No operation
   0853: LLA  0017        Load local address MP23
   0855: SLDC 00          Short load constant 0
   0856: SLDC 00          Short load constant 0
   0857: CXP  00 1b       Call external procedure PASCALSY.SPOS
   085a: STL  0038        Store TOS into MP56
   085c: LDL  0038        Load local word MP56
   085e: SLDC 00          Short load constant 0
   085f: NEQI             Integer TOS-1 <> TOS
   0860: LDL  0038        Load local word MP56
   0862: LLA  0017        Load local address MP23
   0864: SLDC 00          Short load constant 0
   0865: LDB              Load byte at byte ptr TOS-1 + TOS
   0866: SLDC 04          Short load constant 4
   0867: SBI              Subtract integers (TOS-1 - TOS)
   0868: EQUI             Integer TOS-1 = TOS
   0869: LAND             Logical AND (TOS & TOS-1)
   086a: FJP  $0874       Jump if TOS false
   086c: LLA  0017        Load local address MP23
   086e: LDL  0038        Load local word MP56
   0870: SLDC 05          Short load constant 5
   0871: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0874: LOD  02 0009     Load word at G9
   0877: LLA  0002        Load local address MP2
   0879: SLDC 01          Short load constant 1
   087a: LDCN             Load constant NIL
   087b: CXP  00 05       Call external procedure PASCALSY.FOPEN
   087e: CSP  22          Call standard procedure IORESULT
   0880: SLDC 00          Short load constant 0
   0881: NEQI             Integer TOS-1 <> TOS
   0882: FJP  $08a8       Jump if TOS false
   0884: LOD  02 0003     Load word at G3 (OUTPUT)
   0887: LSA  0b          Load string address: 'Can't find '
   0894: NOP              No operation
   0895: SLDC 00          Short load constant 0
   0896: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0899: LOD  02 0003     Load word at G3 (OUTPUT)
   089c: LLA  0002        Load local address MP2
   089e: SLDC 00          Short load constant 0
   089f: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   08a2: SLDC 00          Short load constant 0
   08a3: STR  02 0011     Store TOS to G17
   08a6: UJP  $09ec       Unconditional jump
-> 08a8: LLA  0002        Load local address MP2
   08aa: SLDC 00          Short load constant 0
   08ab: STL  003a        Store TOS into MP58
   08ad: LLA  003a        Load local address MP58
   08af: LDA  02 00fc     Load addr G252
   08b3: LDL  0039        Load local word MP57
   08b5: IXA  000c        Index array (TOS-1 + TOS * 12)
   08b7: LLA  00ba        Load local address MP186
   08ba: SLDC 01          Short load constant 1
   08bb: LSA  01          Load string address: ':'
   08be: NOP              No operation
   08bf: LDA  02 00fc     Load addr G252
   08c3: LDL  0039        Load local word MP57
   08c5: IXA  000c        Index array (TOS-1 + TOS * 12)
   08c7: SLDC 00          Short load constant 0
   08c8: SLDC 00          Short load constant 0
   08c9: CXP  00 1b       Call external procedure PASCALSY.SPOS
   08cc: CXP  00 19       Call external procedure PASCALSY.SCOPY
   08cf: LLA  00ba        Load local address MP186
   08d2: SLDC 17          Short load constant 23
   08d3: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   08d6: LLA  003a        Load local address MP58
   08d8: NOP              No operation
   08d9: LSA  0f          Load string address: 'SYSTEM.SWAPDISK'
   08ea: SLDC 26          Short load constant 38
   08eb: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   08ee: LLA  003a        Load local address MP58
   08f0: SAS  28          String assign (TOS to TOS-1, 40 chars)
   08f2: LOD  02 0037     Load word at G55
   08f5: LLA  0002        Load local address MP2
   08f7: SLDC 01          Short load constant 1
   08f8: LDCN             Load constant NIL
   08f9: CXP  00 05       Call external procedure PASCALSY.FOPEN
   08fc: LLA  002c        Load local address MP44
   08fe: NOP              No operation
   08ff: LSA  13          Load string address: '*SYSTEM.WRK.CODE[*]'
   0914: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0916: LOD  02 0011     Load word at G17
   0919: LNOT             Logical NOT (~TOS)
   091a: FJP  $09a1       Jump if TOS false
   091c: LOD  02 0003     Load word at G3 (OUTPUT)
   091f: LSA  12          Load string address: 'To what codefile? '
   0933: NOP              No operation
   0934: SLDC 00          Short load constant 0
   0935: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0938: LOD  02 0002     Load word at G2 (INPUT)
   093b: LLA  0002        Load local address MP2
   093d: SLDC 28          Short load constant 40
   093e: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   0941: LOD  02 0002     Load word at G2 (INPUT)
   0944: CXP  00 15       Call external procedure PASCALSY.FREADLN
   0947: CLP  0f          Call local procedure GETCMD.15
   0949: LLA  0002        Load local address MP2
   094b: LSA  00          Load string address: ''
   094d: NOP              No operation
   094e: NEQSTR           String TOS-1 <> TOS
   0950: FJP  $09a1       Jump if TOS false
   0952: LLA  0002        Load local address MP2
   0954: SLDC 01          Short load constant 1
   0955: LDB              Load byte at byte ptr TOS-1 + TOS
   0956: LOD  02 0001     Load word at G1 (SYSCOM)
   0959: INC  002c        Inc field ptr (TOS+44)
   095b: SLDC 08          Short load constant 8
   095c: SLDC 08          Short load constant 8
   095d: LDP              Load packed field (TOS)
   095e: EQUI             Integer TOS-1 = TOS
   095f: FJP  $0965       Jump if TOS false
   0961: UJP  $09ec       Unconditional jump
   0963: UJP  $09a1       Unconditional jump
-> 0965: LSA  01          Load string address: '$'
   0968: NOP              No operation
   0969: LLA  0002        Load local address MP2
   096b: SLDC 00          Short load constant 0
   096c: SLDC 00          Short load constant 0
   096d: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0970: STL  0038        Store TOS into MP56
   0972: LDL  0038        Load local word MP56
   0974: SLDC 00          Short load constant 0
   0975: GRTI             Integer TOS-1 > TOS
   0976: FJP  $098a       Jump if TOS false
   0978: LLA  0002        Load local address MP2
   097a: LDL  0038        Load local word MP56
   097c: SLDC 01          Short load constant 1
   097d: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0980: LLA  0017        Load local address MP23
   0982: LLA  0002        Load local address MP2
   0984: SLDC 28          Short load constant 40
   0985: LDL  0038        Load local word MP56
   0987: CXP  00 18       Call external procedure PASCALSY.SINSERT
-> 098a: LLA  0002        Load local address MP2
   098c: SLDC 00          Short load constant 0
   098d: SLDC 00          Short load constant 0
   098e: CGP  06          Call global procedure GETCMD.6
   0990: FJP  $0994       Jump if TOS false
   0992: UJP  $09ec       Unconditional jump
-> 0994: LLA  0002        Load local address MP2
   0996: SLDC 00          Short load constant 0
   0997: SLDC 17          Short load constant 23
   0998: CXP  00 2b       Call external procedure PASCALSY.43
   099b: LLA  002c        Load local address MP44
   099d: LLA  0002        Load local address MP2
   099f: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 09a1: LOD  02 0008     Load word at G8
   09a4: LLA  002c        Load local address MP44
   09a6: SLDC 00          Short load constant 0
   09a7: LDCN             Load constant NIL
   09a8: CXP  00 05       Call external procedure PASCALSY.FOPEN
   09ab: CSP  22          Call standard procedure IORESULT
   09ad: SLDC 00          Short load constant 0
   09ae: NEQI             Integer TOS-1 <> TOS
   09af: FJP  $09d1       Jump if TOS false
   09b1: LOD  02 0003     Load word at G3 (OUTPUT)
   09b4: NOP              No operation
   09b5: LSA  0b          Load string address: 'Can't open '
   09c2: SLDC 00          Short load constant 0
   09c3: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09c6: LOD  02 0003     Load word at G3 (OUTPUT)
   09c9: LLA  002c        Load local address MP44
   09cb: SLDC 00          Short load constant 0
   09cc: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09cf: UJP  $09ec       Unconditional jump
-> 09d1: SLDC 00          Short load constant 0
   09d2: STR  02 000a     Store TOS to G10
   09d5: SLDC 00          Short load constant 0
   09d6: STR  02 000b     Store TOS to G11
   09d9: SLDC 00          Short load constant 0
   09da: STR  02 000c     Store TOS to G12
   09dd: SLDL 01          Short load local MP1
   09de: SLDC 08          Short load constant 8
   09df: EQUI             Integer TOS-1 = TOS
   09e0: FJP  $09e5       Jump if TOS false
   09e2: SLDC 05          Short load constant 5
   09e3: STL  0001        Store TOS into MP1
-> 09e5: SLDL 01          Short load local MP1
   09e6: SRO  0001        Store global word BASE1
   09e8: SLDC 05          Short load constant 5
   09e9: SLDC 01          Short load constant 1
   09ea: CSP  04          Call standard procedure EXIT
-> 09ec: LOD  02 0009     Load word at G9
   09ef: SLDC 00          Short load constant 0
   09f0: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   09f3: LOD  02 0037     Load word at G55
   09f6: SLDC 00          Short load constant 0
   09f7: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 09fa: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC15 (* P=15 LL=2 *)
BEGIN
-> 0712: SLDC 01          Short load constant 1
   0713: LDA  01 0002     Load addr L12
   0716: SLDC 00          Short load constant 0
   0717: LDB              Load byte at byte ptr TOS-1 + TOS
   0718: SLDC 01          Short load constant 1
   0719: SLDC 20          Short load constant 32
   071a: LDA  01 0002     Load addr L12
   071d: SLDC 01          Short load constant 1
   071e: SLDC 00          Short load constant 0
   071f: CSP  0b          Call standard procedure SCAN
   0721: ADI              Add integers (TOS + TOS-1)
   0722: STR  01 0038     Store TOS to L156
   0725: LDA  01 0002     Load addr L12
   0728: SLDC 01          Short load constant 1
   0729: LOD  01 0038     Load word at L1_56
   072c: SLDC 01          Short load constant 1
   072d: SBI              Subtract integers (TOS-1 - TOS)
   072e: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0731: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC16 (* P=16 LL=1 *)
  BASE1
  BASE3
  MP2
  MP10
BEGIN
-> 0a0e: LOD  02 0009     Load word at G9
   0a11: SLDC 00          Short load constant 0
   0a12: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0a15: LOD  02 0037     Load word at G55
   0a18: SLDC 00          Short load constant 0
   0a19: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0a1c: LOD  02 000a     Load word at G10
   0a1f: SLDC 00          Short load constant 0
   0a20: GRTI             Integer TOS-1 > TOS
   0a21: FJP  $0a4f       Jump if TOS false
   0a23: SLDC 00          Short load constant 0
   0a24: STR  02 0010     Store TOS to G16
   0a27: LOD  02 0008     Load word at G8
   0a2a: SLDC 02          Short load constant 2
   0a2b: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0a2e: LOD  02 000b     Load word at G11
   0a31: SLDC 00          Short load constant 0
   0a32: GRTI             Integer TOS-1 > TOS
   0a33: FJP  $0a4d       Jump if TOS false
   0a35: CXP  00 25       Call external procedure PASCALSY.37
   0a38: LOD  02 0003     Load word at G3 (OUTPUT)
   0a3b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a3e: SLDC 02          Short load constant 2
   0a3f: SLDC 01          Short load constant 1
   0a40: SLDC 00          Short load constant 0
   0a41: SLDC 00          Short load constant 0
   0a42: CGP  03          Call global procedure GETCMD.3
   0a44: FJP  $0a4d       Jump if TOS false
   0a46: SLDC 04          Short load constant 4
   0a47: SRO  0001        Store global word BASE1
   0a49: SLDC 05          Short load constant 5
   0a4a: SLDC 01          Short load constant 1
   0a4b: CSP  04          Call standard procedure EXIT
-> 0a4d: UJP  $0aea       Unconditional jump
-> 0a4f: LDA  02 001e     Load addr G30
   0a52: NOP              No operation
   0a53: LSA  0f          Load string address: 'SYSTEM.WRK.CODE'
   0a64: NEQSTR           String TOS-1 <> TOS
   0a66: FJP  $0adb       Jump if TOS false
   0a68: LDA  02 0012     Load addr G18
   0a6b: LOD  02 0008     Load word at G8
   0a6e: INC  0008        Inc field ptr (TOS+8)
   0a70: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0a72: LDA  02 001e     Load addr G30
   0a75: LOD  02 0008     Load word at G8
   0a78: INC  0013        Inc field ptr (TOS+19)
   0a7a: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0a7c: LDA  02 001e     Load addr G30
   0a7f: LSA  0f          Load string address: 'SYSTEM.WRK.CODE'
   0a90: NOP              No operation
   0a91: NEQSTR           String TOS-1 <> TOS
   0a93: FJP  $0adb       Jump if TOS false
   0a95: LDA  02 001a     Load addr G26
   0a98: LDA  02 0012     Load addr G18
   0a9b: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0a9d: LDA  02 001e     Load addr G30
   0aa0: SLDC 00          Short load constant 0
   0aa1: LDB              Load byte at byte ptr TOS-1 + TOS
   0aa2: SLDC 05          Short load constant 5
   0aa3: GRTI             Integer TOS-1 > TOS
   0aa4: FJP  $0adb       Jump if TOS false
   0aa6: LDA  02 001e     Load addr G30
   0aa9: LLA  0002        Load local address MP2
   0aab: LDA  02 001e     Load addr G30
   0aae: SLDC 00          Short load constant 0
   0aaf: LDB              Load byte at byte ptr TOS-1 + TOS
   0ab0: SLDC 04          Short load constant 4
   0ab1: SBI              Subtract integers (TOS-1 - TOS)
   0ab2: SLDC 05          Short load constant 5
   0ab3: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0ab6: LLA  0002        Load local address MP2
   0ab8: NOP              No operation
   0ab9: LSA  05          Load string address: '.CODE'
   0ac0: EQLSTR           String TOS-1 = TOS
   0ac2: FJP  $0adb       Jump if TOS false
   0ac4: LDA  02 002e     Load addr G46
   0ac7: LDA  02 001e     Load addr G30
   0aca: LLA  000a        Load local address MP10
   0acc: SLDC 01          Short load constant 1
   0acd: LDA  02 001e     Load addr G30
   0ad0: SLDC 00          Short load constant 0
   0ad1: LDB              Load byte at byte ptr TOS-1 + TOS
   0ad2: SLDC 05          Short load constant 5
   0ad3: SBI              Subtract integers (TOS-1 - TOS)
   0ad4: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0ad7: LLA  000a        Load local address MP10
   0ad9: SAS  0f          String assign (TOS to TOS-1, 15 chars)
-> 0adb: SLDC 01          Short load constant 1
   0adc: STR  02 0010     Store TOS to G16
   0adf: SLDO 03          Short load global BASE3
   0ae0: LDCI 00c0        Load word 192
   0ae3: SLDC 01          Short load constant 1
   0ae4: INN              Set membership (TOS-1 in set TOS)
   0ae5: FJP  $0aea       Jump if TOS false
   0ae7: SLDC 01          Short load constant 1
   0ae8: CGP  02          Call global procedure GETCMD.2
-> 0aea: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC17(PARAM1) (* P=17 LL=1 *)
  MP1=PARAM1
BEGIN
-> 0af8: LOD  02 0003     Load word at G3 (OUTPUT)
   0afb: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0afe: SLDL 01          Short load local MP1
   0aff: SLDC 01          Short load constant 1
   0b00: EQUI             Integer TOS-1 = TOS
   0b01: FJP  $0b31       Jump if TOS false
   0b03: LOD  02 0003     Load word at G3 (OUTPUT)
   0b06: NOP              No operation
   0b07: LSA  1c          Load string address: 'Nested exec commands illegal'
   0b25: SLDC 00          Short load constant 0
   0b26: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b29: LOD  02 0003     Load word at G3 (OUTPUT)
   0b2c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b2f: UJP  $0b53       Unconditional jump
-> 0b31: LOD  02 0003     Load word at G3 (OUTPUT)
   0b34: NOP              No operation
   0b35: LSA  12          Load string address: 'Error opening exec'
   0b49: SLDC 00          Short load constant 0
   0b4a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b4d: LOD  02 0003     Load word at G3 (OUTPUT)
   0b50: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0b53: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC18 (* P=18 LL=1 *)
BEGIN
-> 0b60: SLDC 20          Short load constant 32
   0b61: STR  02 018a     Store TOS to G394
   0b65: LOD  02 0036     Load word at G54
   0b68: STR  02 017e     Store TOS to G382
   0b6c: LDA  02 017d     Load addr G381
   0b70: LDCI 0100        Load word 256
   0b73: CSP  01          Call standard procedure NEW
   0b75: LDA  02 0036     Load addr G54
   0b78: CSP  20          Call standard procedure MARK
-> 0b7a: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC19(PARAM1) (* P=19 LL=1 *)
  BASE1
  BASE6
  MP1=PARAM1
  MP2
  MP43
  MP46
  MP47
  MP48
BEGIN
-> 0b86: SLDL 01          Short load local MP1
   0b87: FJP  $0b93       Jump if TOS false
   0b89: LLA  0002        Load local address MP2
   0b8b: LDA  02 0148     Load addr G328
   0b8f: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0b91: UJP  $0bde       Unconditional jump
-> 0b93: LOD  02 0003     Load word at G3 (OUTPUT)
   0b96: NOP              No operation
   0b97: LSA  07          Load string address: 'Execute'
   0ba0: SLDC 00          Short load constant 0
   0ba1: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ba4: LOD  02 0001     Load word at G1 (SYSCOM)
   0ba7: INC  001d        Inc field ptr (TOS+29)
   0ba9: SLDC 01          Short load constant 1
   0baa: SLDC 04          Short load constant 4
   0bab: LDP              Load packed field (TOS)
   0bac: LNOT             Logical NOT (~TOS)
   0bad: FJP  $0bc3       Jump if TOS false
   0baf: LOD  02 0003     Load word at G3 (OUTPUT)
   0bb2: NOP              No operation
   0bb3: LSA  0a          Load string address: ' what file'
   0bbf: SLDC 00          Short load constant 0
   0bc0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0bc3: LOD  02 0003     Load word at G3 (OUTPUT)
   0bc6: NOP              No operation
   0bc7: LSA  02          Load string address: '? '
   0bcb: SLDC 00          Short load constant 0
   0bcc: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0bcf: LOD  02 0002     Load word at G2 (INPUT)
   0bd2: LLA  0002        Load local address MP2
   0bd4: SLDC 50          Short load constant 80
   0bd5: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   0bd8: LOD  02 0002     Load word at G2 (INPUT)
   0bdb: CXP  00 15       Call external procedure PASCALSY.FREADLN
-> 0bde: LLA  0002        Load local address MP2
   0be0: SLDC 00          Short load constant 0
   0be1: LDB              Load byte at byte ptr TOS-1 + TOS
   0be2: SLDC 00          Short load constant 0
   0be3: GRTI             Integer TOS-1 > TOS
   0be4: FJP  $0cc1       Jump if TOS false
   0be6: LLA  0002        Load local address MP2
   0be8: SLDC 00          Short load constant 0
   0be9: LDB              Load byte at byte ptr TOS-1 + TOS
   0bea: SLDC 05          Short load constant 5
   0beb: GRTI             Integer TOS-1 > TOS
   0bec: FJP  $0ca5       Jump if TOS false
   0bee: LLA  002b        Load local address MP43
   0bf0: LLA  0002        Load local address MP2
   0bf2: LLA  0030        Load local address MP48
   0bf4: SLDC 01          Short load constant 1
   0bf5: SLDC 05          Short load constant 5
   0bf6: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0bf9: LLA  0030        Load local address MP48
   0bfb: SAS  05          String assign (TOS to TOS-1, 5 chars)
   0bfd: SLDC 01          Short load constant 1
   0bfe: STL  002e        Store TOS into MP46
   0c00: SLDC 04          Short load constant 4
   0c01: STL  0030        Store TOS into MP48
-> 0c03: LDL  002e        Load local word MP46
   0c05: LDL  0030        Load local word MP48
   0c07: LEQI             Integer TOS-1 <= TOS
   0c08: FJP  $0c2d       Jump if TOS false
   0c0a: LLA  002b        Load local address MP43
   0c0c: LDL  002e        Load local word MP46
   0c0e: LDB              Load byte at byte ptr TOS-1 + TOS
   0c0f: STL  002f        Store TOS into MP47
   0c11: LDL  002f        Load local word MP47
   0c13: SLDC 61          Short load constant 97
   0c14: GEQI             Integer TOS-1 >= TOS
   0c15: LDL  002f        Load local word MP47
   0c17: SLDC 7a          Short load constant 122
   0c18: LEQI             Integer TOS-1 <= TOS
   0c19: LAND             Logical AND (TOS & TOS-1)
   0c1a: FJP  $0c25       Jump if TOS false
   0c1c: LLA  002b        Load local address MP43
   0c1e: LDL  002e        Load local word MP46
   0c20: LDL  002f        Load local word MP47
   0c22: SLDC 20          Short load constant 32
   0c23: SBI              Subtract integers (TOS-1 - TOS)
   0c24: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0c25: LDL  002e        Load local word MP46
   0c27: SLDC 01          Short load constant 1
   0c28: ADI              Add integers (TOS + TOS-1)
   0c29: STL  002e        Store TOS into MP46
   0c2b: UJP  $0c03       Unconditional jump
-> 0c2d: LLA  002b        Load local address MP43
   0c2f: LSA  05          Load string address: 'EXEC/'
   0c36: NOP              No operation
   0c37: EQLSTR           String TOS-1 = TOS
   0c39: FJP  $0ca5       Jump if TOS false
   0c3b: LOD  02 0183     Load word at G387
   0c3f: LOD  02 0182     Load word at G386
   0c43: LOR              Logical OR (TOS | TOS-1)
   0c44: FJP  $0c4b       Jump if TOS false
   0c46: SLDC 01          Short load constant 1
   0c47: CGP  11          Call global procedure GETCMD.17
   0c49: UJP  $0ca1       Unconditional jump
-> 0c4b: LLA  0002        Load local address MP2
   0c4d: SLDC 01          Short load constant 1
   0c4e: SLDC 05          Short load constant 5
   0c4f: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0c52: LLA  0002        Load local address MP2
   0c54: SLDC 00          Short load constant 0
   0c55: SLDC 00          Short load constant 0
   0c56: CGP  06          Call global procedure GETCMD.6
   0c58: FJP  $0c5e       Jump if TOS false
   0c5a: SLDC 05          Short load constant 5
   0c5b: SLDC 13          Short load constant 19
   0c5c: CSP  04          Call standard procedure EXIT
-> 0c5e: LLA  0002        Load local address MP2
   0c60: SLDC 01          Short load constant 1
   0c61: SLDC 50          Short load constant 80
   0c62: CXP  00 2b       Call external procedure PASCALSY.43
   0c65: LDA  02 018c     Load addr G396
   0c69: LLA  0002        Load local address MP2
   0c6b: SLDC 01          Short load constant 1
   0c6c: SLDC 00          Short load constant 0
   0c6d: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0c70: CSP  22          Call standard procedure IORESULT
   0c72: SLDC 00          Short load constant 0
   0c73: EQUI             Integer TOS-1 = TOS
   0c74: FJP  $0c9e       Jump if TOS false
   0c76: CGP  12          Call global procedure GETCMD.18
   0c78: SLDC 01          Short load constant 1
   0c79: STR  02 0182     Store TOS to G386
   0c7d: SLDC 01          Short load constant 1
   0c7e: STR  02 0181     Store TOS to G385
   0c82: CXP  00 2e       Call external procedure PASCALSY.46
   0c85: LOD  02 017d     Load word at G381
   0c89: LOD  02 017f     Load word at G383
   0c8d: LDB              Load byte at byte ptr TOS-1 + TOS
   0c8e: STR  02 018b     Store TOS to G395
   0c92: LOD  02 017f     Load word at G383
   0c96: SLDC 01          Short load constant 1
   0c97: ADI              Add integers (TOS + TOS-1)
   0c98: STR  02 017f     Store TOS to G383
   0c9c: UJP  $0ca1       Unconditional jump
-> 0c9e: SLDC 02          Short load constant 2
   0c9f: CGP  11          Call global procedure GETCMD.17
-> 0ca1: SLDC 05          Short load constant 5
   0ca2: SLDC 13          Short load constant 19
   0ca3: CSP  04          Call standard procedure EXIT
-> 0ca5: LLA  0002        Load local address MP2
   0ca7: SLDC 00          Short load constant 0
   0ca8: SLDC 50          Short load constant 80
   0ca9: CXP  00 2b       Call external procedure PASCALSY.43
   0cac: LLA  0002        Load local address MP2
   0cae: SLDC 00          Short load constant 0
   0caf: SLDC 00          Short load constant 0
   0cb0: SLDC 01          Short load constant 1
   0cb1: LAO  0006        Load global BASE6
   0cb3: SLDC 00          Short load constant 0
   0cb4: SLDC 00          Short load constant 0
   0cb5: SLDC 00          Short load constant 0
   0cb6: CGP  0d          Call global procedure GETCMD.13
   0cb8: FJP  $0cc1       Jump if TOS false
   0cba: SLDC 04          Short load constant 4
   0cbb: SRO  0001        Store global word BASE1
   0cbd: SLDC 05          Short load constant 5
   0cbe: SLDC 01          Short load constant 1
   0cbf: CSP  04          Call standard procedure EXIT
-> 0cc1: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC20 (* P=20 LL=1 *)
  MP1
  MP2
BEGIN
-> 0d4e: LOD  02 0186     Load word at G390
   0d52: LOD  02 0185     Load word at G389
   0d56: ADI              Add integers (TOS + TOS-1)
   0d57: STL  0002        Store TOS into MP2
   0d59: LOD  02 0003     Load word at G3 (OUTPUT)
   0d5c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0d5f: LOD  02 0003     Load word at G3 (OUTPUT)
   0d62: NOP              No operation
   0d63: LSA  10          Load string address: 'Swapping levels:'
   0d75: SLDC 00          Short load constant 0
   0d76: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0d79: LOD  02 0003     Load word at G3 (OUTPUT)
   0d7c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0d7f: LOD  02 0003     Load word at G3 (OUTPUT)
   0d82: NOP              No operation
   0d83: LSA  1b          Load string address: '  0 = system is not swapped'
   0da0: SLDC 00          Short load constant 0
   0da1: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0da4: LOD  02 0003     Load word at G3 (OUTPUT)
   0da7: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0daa: LOD  02 0003     Load word at G3 (OUTPUT)
   0dad: LSA  30          Load string address: '  1 = file open and close procedures are swapped'
   0ddf: NOP              No operation
   0de0: SLDC 00          Short load constant 0
   0de1: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0de4: LOD  02 0003     Load word at G3 (OUTPUT)
   0de7: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0dea: LOD  02 0003     Load word at G3 (OUTPUT)
   0ded: LSA  3d          Load string address: '  2 = file open/close and disk get and put procedures swapped'
   0e2c: NOP              No operation
   0e2d: SLDC 00          Short load constant 0
   0e2e: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0e31: LOD  02 0003     Load word at G3 (OUTPUT)
   0e34: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0e37: LOD  02 0003     Load word at G3 (OUTPUT)
   0e3a: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0e3d: LOD  02 0003     Load word at G3 (OUTPUT)
   0e40: NOP              No operation
   0e41: LSA  16          Load string address: 'Old swapping level is '
   0e59: SLDC 00          Short load constant 0
   0e5a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0e5d: LOD  02 0003     Load word at G3 (OUTPUT)
   0e60: SLDL 02          Short load local MP2
   0e61: SLDC 00          Short load constant 0
   0e62: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0e65: LOD  02 0003     Load word at G3 (OUTPUT)
   0e68: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0e6b: LOD  02 0003     Load word at G3 (OUTPUT)
   0e6e: NOP              No operation
   0e6f: LSA  25          Load string address: 'New swapping level (ESCAPE to exit): '
   0e96: SLDC 00          Short load constant 0
   0e97: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0e9a: LOD  02 0004     Load word at G4 (SYSTERM)
   0e9d: LLA  0001        Load local address MP1
   0e9f: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   0ea2: SLDL 01          Short load local MP1
   0ea3: LOD  02 0001     Load word at G1 (SYSCOM)
   0ea6: INC  002c        Inc field ptr (TOS+44)
   0ea8: SLDC 08          Short load constant 8
   0ea9: SLDC 08          Short load constant 8
   0eaa: LDP              Load packed field (TOS)
   0eab: EQUI             Integer TOS-1 = TOS
   0eac: SLDL 01          Short load local MP1
   0ead: SLDC 30          Short load constant 48
   0eae: EQUI             Integer TOS-1 = TOS
   0eaf: LOR              Logical OR (TOS | TOS-1)
   0eb0: SLDL 01          Short load local MP1
   0eb1: SLDC 31          Short load constant 49
   0eb2: EQUI             Integer TOS-1 = TOS
   0eb3: LOR              Logical OR (TOS | TOS-1)
   0eb4: SLDL 01          Short load local MP1
   0eb5: SLDC 32          Short load constant 50
   0eb6: EQUI             Integer TOS-1 = TOS
   0eb7: LOR              Logical OR (TOS | TOS-1)
   0eb8: FJP  $0e9a       Jump if TOS false
   0eba: SLDL 01          Short load local MP1
   0ebe: LDC  04          Load multiple-word constant
                         0007000000000000
   0ec6: SLDC 04          Short load constant 4
   0ec7: INN              Set membership (TOS-1 in set TOS)
   0ec8: FJP  $0f3d       Jump if TOS false
   0eca: LOD  02 0003     Load word at G3 (OUTPUT)
   0ecd: SLDL 01          Short load local MP1
   0ece: SLDC 00          Short load constant 0
   0ecf: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0ed2: SLDL 01          Short load local MP1
   0ed3: SLDC 32          Short load constant 50
   0ed4: EQUI             Integer TOS-1 = TOS
   0ed5: STR  02 0185     Store TOS to G389
   0ed9: SLDL 01          Short load local MP1
   0eda: SLDC 31          Short load constant 49
   0edb: EQUI             Integer TOS-1 = TOS
   0edc: LOD  02 0185     Load word at G389
   0ee0: LOR              Logical OR (TOS | TOS-1)
   0ee1: STR  02 0186     Store TOS to G390
   0ee5: LOD  02 0185     Load word at G389
   0ee9: FJP  $0f3d       Jump if TOS false
   0eeb: LOD  02 0003     Load word at G3 (OUTPUT)
   0eee: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ef1: LOD  02 0003     Load word at G3 (OUTPUT)
   0ef4: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ef7: LOD  02 0003     Load word at G3 (OUTPUT)
   0efa: NOP              No operation
   0efb: LSA  3c          Load string address: 'Warning, programs using GET or PUT to disk will be very slow'
   0f39: SLDC 00          Short load constant 0
   0f3a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0f3d: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC21 (* P=21 LL=1 *)
  MP1
  MP2
  MP23
  MP24
BEGIN
-> 0f4c: LOD  02 0003     Load word at G3 (OUTPUT)
   0f4f: LSA  0e          Load string address: 'New exec name:'
   0f5f: NOP              No operation
   0f60: SLDC 00          Short load constant 0
   0f61: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0f64: LOD  02 0002     Load word at G2 (INPUT)
   0f67: LLA  0002        Load local address MP2
   0f69: SLDC 28          Short load constant 40
   0f6a: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   0f6d: LOD  02 0002     Load word at G2 (INPUT)
   0f70: CXP  00 15       Call external procedure PASCALSY.FREADLN
   0f73: LLA  0002        Load local address MP2
   0f75: SLDC 00          Short load constant 0
   0f76: LDB              Load byte at byte ptr TOS-1 + TOS
   0f77: SLDC 00          Short load constant 0
   0f78: GRTI             Integer TOS-1 > TOS
   0f79: FJP  $0fcd       Jump if TOS false
   0f7b: LLA  0002        Load local address MP2
   0f7d: LLA  0002        Load local address MP2
   0f7f: SLDC 00          Short load constant 0
   0f80: LDB              Load byte at byte ptr TOS-1 + TOS
   0f81: LDB              Load byte at byte ptr TOS-1 + TOS
   0f82: SLDC 2e          Short load constant 46
   0f83: EQUI             Integer TOS-1 = TOS
   0f84: STL  0017        Store TOS into MP23
   0f86: LLA  0002        Load local address MP2
   0f88: SLDC 00          Short load constant 0
   0f89: SLDC 00          Short load constant 0
   0f8a: CGP  06          Call global procedure GETCMD.6
   0f8c: FJP  $0f92       Jump if TOS false
   0f8e: SLDC 05          Short load constant 5
   0f8f: SLDC 15          Short load constant 21
   0f90: CSP  04          Call standard procedure EXIT
-> 0f92: LLA  0002        Load local address MP2
   0f94: SLDC 01          Short load constant 1
   0f95: SLDC 25          Short load constant 37
   0f96: CXP  00 2b       Call external procedure PASCALSY.43
   0f99: LLA  0002        Load local address MP2
   0f9b: SLDC 00          Short load constant 0
   0f9c: LDB              Load byte at byte ptr TOS-1 + TOS
   0f9d: SLDC 00          Short load constant 0
   0f9e: GRTI             Integer TOS-1 > TOS
   0f9f: LDL  0017        Load local word MP23
   0fa1: LNOT             Logical NOT (~TOS)
   0fa2: LAND             Logical AND (TOS & TOS-1)
   0fa3: FJP  $0fcd       Jump if TOS false
   0fa5: LLA  0002        Load local address MP2
   0fa7: LLA  0002        Load local address MP2
   0fa9: SLDC 00          Short load constant 0
   0faa: LDB              Load byte at byte ptr TOS-1 + TOS
   0fab: LDB              Load byte at byte ptr TOS-1 + TOS
   0fac: SLDC 5d          Short load constant 93
   0fad: NEQI             Integer TOS-1 <> TOS
   0fae: FJP  $0fcd       Jump if TOS false
   0fb0: LLA  0002        Load local address MP2
   0fb2: SLDC 00          Short load constant 0
   0fb3: STL  0018        Store TOS into MP24
   0fb5: LLA  0018        Load local address MP24
   0fb7: LLA  0002        Load local address MP2
   0fb9: SLDC 28          Short load constant 40
   0fba: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0fbd: LLA  0018        Load local address MP24
   0fbf: LSA  03          Load string address: '[8]'
   0fc4: NOP              No operation
   0fc5: SLDC 2b          Short load constant 43
   0fc6: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0fc9: LLA  0018        Load local address MP24
   0fcb: SAS  28          String assign (TOS to TOS-1, 40 chars)
-> 0fcd: LDA  02 018c     Load addr G396
   0fd1: LLA  0002        Load local address MP2
   0fd3: SLDC 00          Short load constant 0
   0fd4: SLDC 00          Short load constant 0
   0fd5: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0fd8: CSP  22          Call standard procedure IORESULT
   0fda: SLDC 00          Short load constant 0
   0fdb: EQUI             Integer TOS-1 = TOS
   0fdc: FJP  $108a       Jump if TOS false
   0fde: SLDC 25          Short load constant 37
   0fdf: STR  02 018b     Store TOS to G395
   0fe3: LOD  02 0003     Load word at G3 (OUTPUT)
   0fe6: NOP              No operation
   0fe7: LSA  0b          Load string address: 'Terminator='
   0ff4: SLDC 00          Short load constant 0
   0ff5: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ff8: LOD  02 0003     Load word at G3 (OUTPUT)
   0ffb: LOD  02 018b     Load word at G395
   0fff: SLDC 00          Short load constant 0
   1000: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   1003: LOD  02 0003     Load word at G3 (OUTPUT)
   1006: NOP              No operation
   1007: LSA  0c          Load string address: ', change it?'
   1015: SLDC 00          Short load constant 0
   1016: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1019: SLDC 00          Short load constant 0
   101a: SLDC 00          Short load constant 0
   101b: CGP  04          Call global procedure GETCMD.4
   101d: FJP  $1048       Jump if TOS false
   101f: LOD  02 0003     Load word at G3 (OUTPUT)
   1022: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1025: LOD  02 0003     Load word at G3 (OUTPUT)
   1028: NOP              No operation
   1029: LSA  0f          Load string address: 'New terminator:'
   103a: SLDC 00          Short load constant 0
   103b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   103e: LOD  02 0002     Load word at G2 (INPUT)
   1041: LDA  02 018b     Load addr G395
   1045: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
-> 1048: CGP  12          Call global procedure GETCMD.18
   104a: SLDC 01          Short load constant 1
   104b: STR  02 0183     Store TOS to G387
   104f: LOD  02 017d     Load word at G381
   1053: SLDC 00          Short load constant 0
   1054: LDCI 0200        Load word 512
   1057: SLDC 00          Short load constant 0
   1058: CSP  0a          Call standard procedure FLCH
   105a: SLDC 00          Short load constant 0
   105b: STR  02 0181     Store TOS to G385
   105f: SLDC 01          Short load constant 1
   1060: STL  0001        Store TOS into MP1
   1062: SLDC 02          Short load constant 2
   1063: STL  0018        Store TOS into MP24
-> 1065: SLDL 01          Short load local MP1
   1066: LDL  0018        Load local word MP24
   1068: LEQI             Integer TOS-1 <= TOS
   1069: FJP  $107b       Jump if TOS false
   106b: LOD  02 0183     Load word at G387
   106f: FJP  $1074       Jump if TOS false
   1071: CXP  00 2f       Call external procedure PASCALSY.47
-> 1074: SLDL 01          Short load local MP1
   1075: SLDC 01          Short load constant 1
   1076: ADI              Add integers (TOS + TOS-1)
   1077: STL  0001        Store TOS into MP1
   1079: UJP  $1065       Unconditional jump
-> 107b: LOD  02 0183     Load word at G387
   107f: FJP  $1088       Jump if TOS false
   1081: LOD  02 018b     Load word at G395
   1085: CXP  00 2c       Call external procedure PASCALSY.44
-> 1088: UJP  $108d       Unconditional jump
-> 108a: SLDC 02          Short load constant 2
   108b: CGP  11          Call global procedure GETCMD.17
-> 108d: RNP  00          Return from nonbase procedure
END

## Segment FILEPROC (6)

### PROCEDURE FILEPROC.FILEPROC(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5; PARAM6) (* P=1 LL=0 *)
  BASE1=PARAM6
  BASE2=PARAM5
  BASE3=PARAM4
  BASE4=PARAM3
  BASE5=PARAM2
  BASE6=PARAM1
  BASE7
BEGIN
-> 0856: SLDO 06          Short load global BASE6
   0857: UJP  $0899       Unconditional jump
   0859: SLDO 05          Short load global BASE5
   085a: CLP  03          Call local procedure FILEPROC.3
   085c: UJP  $08a8       Unconditional jump
   085e: SLDO 05          Short load global BASE5
   085f: SLDO 04          Short load global BASE4
   0860: SLDO 03          Short load global BASE3
   0861: SLDO 02          Short load global BASE2
   0862: CLP  04          Call local procedure FILEPROC.4
   0864: UJP  $08a8       Unconditional jump
   0866: SLDO 01          Short load global BASE1
   0867: UJP  $087d       Unconditional jump
   0869: SLDC 00          Short load constant 0
   086a: SRO  0007        Store global word BASE7
   086c: UJP  $088c       Unconditional jump
   086e: SLDC 01          Short load constant 1
   086f: SRO  0007        Store global word BASE7
   0871: UJP  $088c       Unconditional jump
   0873: SLDC 02          Short load constant 2
   0874: SRO  0007        Store global word BASE7
   0876: UJP  $088c       Unconditional jump
   0878: SLDC 03          Short load constant 3
   0879: SRO  0007        Store global word BASE7
   087b: UJP  $088c       Unconditional jump
-> 088c: SLDO 05          Short load global BASE5
   088d: SLDO 07          Short load global BASE7
   088e: CLP  07          Call local procedure FILEPROC.7
   0890: UJP  $08a8       Unconditional jump
   0892: SLDO 04          Short load global BASE4
   0893: SLDO 03          Short load global BASE3
   0894: SLDO 01          Short load global BASE1
   0895: CLP  08          Call local procedure FILEPROC.8
   0897: UJP  $08a8       Unconditional jump
-> 08a8: RBP  00          Return from base procedure
END

### PROCEDURE FILEPROC.PROC2(PARAM1) (* P=2 LL=1 *)
  MP1=PARAM1
  MP2
  MP3
BEGIN
-> 0000: SLDL 01          Short load local MP1
   0001: STL  0003        Store TOS into MP3
   0003: SLDL 03          Short load local MP3
   0004: INC  000e        Inc field ptr (TOS+14)
   0006: SLDC 00          Short load constant 0
   0007: STO              Store indirect (TOS into TOS-1)
   0008: SLDL 03          Short load local MP3
   0009: INC  0001        Inc field ptr (TOS+1)
   000b: SLDC 00          Short load constant 0
   000c: STO              Store indirect (TOS into TOS-1)
   000d: SLDL 03          Short load local MP3
   000e: INC  0002        Inc field ptr (TOS+2)
   0010: SLDC 00          Short load constant 0
   0011: STO              Store indirect (TOS into TOS-1)
   0012: SLDL 03          Short load local MP3
   0013: SIND 06          Short index load *TOS+6
   0014: FJP  $00e2       Jump if TOS false
   0016: SLDL 03          Short load local MP3
   0017: IND  000d        Static index and load word (TOS+13)
   0019: SLDL 03          Short load local MP3
   001a: IND  000c        Static index and load word (TOS+12)
   001c: GRTI             Integer TOS-1 > TOS
   001d: STL  0002        Store TOS into MP2
   001f: SLDL 02          Short load local MP2
   0020: FJP  $0029       Jump if TOS false
   0022: SLDL 03          Short load local MP3
   0023: INC  000c        Inc field ptr (TOS+12)
   0025: SLDL 03          Short load local MP3
   0026: IND  000d        Static index and load word (TOS+13)
   0028: STO              Store indirect (TOS into TOS-1)
-> 0029: SLDL 03          Short load local MP3
   002a: IND  001d        Static index and load word (TOS+29)
   002c: FJP  $00ca       Jump if TOS false
   002e: SLDL 02          Short load local MP2
   002f: FJP  $003a       Jump if TOS false
   0031: SLDL 03          Short load local MP3
   0032: INC  001e        Inc field ptr (TOS+30)
   0034: SLDL 03          Short load local MP3
   0035: IND  001f        Static index and load word (TOS+31)
   0037: STO              Store indirect (TOS into TOS-1)
   0038: UJP  $0056       Unconditional jump
-> 003a: SLDL 03          Short load local MP3
   003b: IND  000d        Static index and load word (TOS+13)
   003d: SLDL 03          Short load local MP3
   003e: IND  000c        Static index and load word (TOS+12)
   0040: EQUI             Integer TOS-1 = TOS
   0041: FJP  $0056       Jump if TOS false
   0043: SLDL 03          Short load local MP3
   0044: IND  001f        Static index and load word (TOS+31)
   0046: SLDL 03          Short load local MP3
   0047: IND  001e        Static index and load word (TOS+30)
   0049: GEQI             Integer TOS-1 >= TOS
   004a: FJP  $0056       Jump if TOS false
   004c: SLDC 01          Short load constant 1
   004d: STL  0002        Store TOS into MP2
   004f: SLDL 03          Short load local MP3
   0050: INC  001e        Inc field ptr (TOS+30)
   0052: SLDL 03          Short load local MP3
   0053: IND  001f        Static index and load word (TOS+31)
   0055: STO              Store indirect (TOS into TOS-1)
-> 0056: SLDL 03          Short load local MP3
   0057: IND  0020        Static index and load word (TOS+32)
   0059: FJP  $00c3       Jump if TOS false
   005b: SLDL 03          Short load local MP3
   005c: INC  0020        Inc field ptr (TOS+32)
   005e: SLDC 00          Short load constant 0
   005f: STO              Store indirect (TOS into TOS-1)
   0060: SLDL 03          Short load local MP3
   0061: INC  000f        Inc field ptr (TOS+15)
   0063: SLDC 01          Short load constant 1
   0064: STO              Store indirect (TOS into TOS-1)
   0065: SLDL 02          Short load local MP2
   0066: FJP  $0078       Jump if TOS false
   0068: SLDL 03          Short load local MP3
   0069: INC  0021        Inc field ptr (TOS+33)
   006b: SLDL 03          Short load local MP3
   006c: IND  001f        Static index and load word (TOS+31)
   006e: LDCI 0200        Load word 512
   0071: SLDL 03          Short load local MP3
   0072: IND  001f        Static index and load word (TOS+31)
   0074: SBI              Subtract integers (TOS-1 - TOS)
   0075: SLDC 00          Short load constant 0
   0076: CSP  0a          Call standard procedure FLCH
-> 0078: SLDL 03          Short load local MP3
   0079: SIND 07          Short index load *TOS+7
   007a: SLDL 03          Short load local MP3
   007b: INC  0021        Inc field ptr (TOS+33)
   007d: SLDC 00          Short load constant 0
   007e: LDCI 0200        Load word 512
   0081: SLDL 03          Short load local MP3
   0082: IND  0010        Static index and load word (TOS+16)
   0084: SLDL 03          Short load local MP3
   0085: IND  000d        Static index and load word (TOS+13)
   0087: ADI              Add integers (TOS + TOS-1)
   0088: SLDC 01          Short load constant 1
   0089: SBI              Subtract integers (TOS-1 - TOS)
   008a: SLDC 00          Short load constant 0
   008b: CSP  06          Call standard procedure UNITWRITE
   008d: SLDL 02          Short load local MP2
   008e: SLDL 03          Short load local MP3
   008f: INC  0012        Inc field ptr (TOS+18)
   0091: SLDC 04          Short load constant 4
   0092: SLDC 00          Short load constant 0
   0093: LDP              Load packed field (TOS)
   0094: SLDC 03          Short load constant 3
   0095: EQUI             Integer TOS-1 = TOS
   0096: LAND             Logical AND (TOS & TOS-1)
   0097: SLDL 03          Short load local MP3
   0098: IND  000d        Static index and load word (TOS+13)
   009a: LAND             Logical AND (TOS & TOS-1)
   009b: FJP  $00c3       Jump if TOS false
   009d: SLDL 03          Short load local MP3
   009e: INC  000c        Inc field ptr (TOS+12)
   00a0: SLDL 03          Short load local MP3
   00a1: IND  000c        Static index and load word (TOS+12)
   00a3: SLDC 01          Short load constant 1
   00a4: ADI              Add integers (TOS + TOS-1)
   00a5: STO              Store indirect (TOS into TOS-1)
   00a6: SLDL 03          Short load local MP3
   00a7: INC  0021        Inc field ptr (TOS+33)
   00a9: SLDC 00          Short load constant 0
   00aa: LDCI 0200        Load word 512
   00ad: SLDC 00          Short load constant 0
   00ae: CSP  0a          Call standard procedure FLCH
   00b0: SLDL 03          Short load local MP3
   00b1: SIND 07          Short index load *TOS+7
   00b2: SLDL 03          Short load local MP3
   00b3: INC  0021        Inc field ptr (TOS+33)
   00b5: SLDC 00          Short load constant 0
   00b6: LDCI 0200        Load word 512
   00b9: SLDL 03          Short load local MP3
   00ba: IND  0010        Static index and load word (TOS+16)
   00bc: SLDL 03          Short load local MP3
   00bd: IND  000d        Static index and load word (TOS+13)
   00bf: ADI              Add integers (TOS + TOS-1)
   00c0: SLDC 00          Short load constant 0
   00c1: CSP  06          Call standard procedure UNITWRITE
-> 00c3: SLDL 03          Short load local MP3
   00c4: INC  001f        Inc field ptr (TOS+31)
   00c6: LDCI 0200        Load word 512
   00c9: STO              Store indirect (TOS into TOS-1)
-> 00ca: SLDL 03          Short load local MP3
   00cb: INC  000d        Inc field ptr (TOS+13)
   00cd: SLDC 00          Short load constant 0
   00ce: STO              Store indirect (TOS into TOS-1)
   00cf: SLDL 03          Short load local MP3
   00d0: IND  001d        Static index and load word (TOS+29)
   00d2: SLDL 03          Short load local MP3
   00d3: INC  0012        Inc field ptr (TOS+18)
   00d5: SLDC 04          Short load constant 4
   00d6: SLDC 00          Short load constant 0
   00d7: LDP              Load packed field (TOS)
   00d8: SLDC 03          Short load constant 3
   00d9: EQUI             Integer TOS-1 = TOS
   00da: LAND             Logical AND (TOS & TOS-1)
   00db: FJP  $00e2       Jump if TOS false
   00dd: SLDL 03          Short load local MP3
   00de: INC  000d        Inc field ptr (TOS+13)
   00e0: SLDC 02          Short load constant 2
   00e1: STO              Store indirect (TOS into TOS-1)
-> 00e2: RNP  00          Return from nonbase procedure
END

### PROCEDURE FILEPROC.PROC3(PARAM1) (* P=3 LL=1 *)
  MP1=PARAM1
  MP2
BEGIN
-> 00f2: LOD  02 0001     Load word at G1 (SYSCOM)
   00f5: SLDC 00          Short load constant 0
   00f6: STO              Store indirect (TOS into TOS-1)
   00f7: SLDL 01          Short load local MP1
   00f8: STL  0002        Store TOS into MP2
   00fa: SLDL 02          Short load local MP2
   00fb: SIND 05          Short index load *TOS+5
   00fc: FJP  $0118       Jump if TOS false
   00fe: SLDL 01          Short load local MP1
   00ff: CGP  02          Call global procedure FILEPROC.2
   0101: SLDL 02          Short load local MP2
   0102: SIND 04          Short index load *TOS+4
   0103: SLDC 00          Short load constant 0
   0104: GRTI             Integer TOS-1 > TOS
   0105: FJP  $0118       Jump if TOS false
   0107: SLDL 02          Short load local MP2
   0108: SIND 03          Short index load *TOS+3
   0109: SLDC 00          Short load constant 0
   010a: EQUI             Integer TOS-1 = TOS
   010b: FJP  $0113       Jump if TOS false
   010d: SLDL 01          Short load local MP1
   010e: CXP  00 07       Call external procedure PASCALSY.FGET
   0111: UJP  $0118       Unconditional jump
-> 0113: SLDL 02          Short load local MP2
   0114: INC  0003        Inc field ptr (TOS+3)
   0116: SLDC 01          Short load constant 1
   0117: STO              Store indirect (TOS into TOS-1)
-> 0118: RNP  00          Return from nonbase procedure
END

### PROCEDURE FILEPROC.PROC4(PARAM1; PARAM2; PARAM3; PARAM4) (* P=4 LL=1 *)
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
-> 0260: LOD  02 0001     Load word at G1 (SYSCOM)
   0263: SLDC 00          Short load constant 0
   0264: STO              Store indirect (TOS into TOS-1)
   0265: SLDL 04          Short load local MP4
   0266: STL  001a        Store TOS into MP26
   0268: LDL  001a        Load local word MP26
   026a: SIND 05          Short index load *TOS+5
   026b: FJP  $0274       Jump if TOS false
   026d: LOD  02 0001     Load word at G1 (SYSCOM)
   0270: SLDC 0c          Short load constant 12
   0271: STO              Store indirect (TOS into TOS-1)
   0272: UJP  $054f       Unconditional jump
-> 0274: SLDL 03          Short load local MP3
   0275: LLA  000e        Load local address MP14
   0277: LLA  0012        Load local address MP18
   0279: LLA  0009        Load local address MP9
   027b: LLA  000a        Load local address MP10
   027d: SLDC 00          Short load constant 0
   027e: SLDC 00          Short load constant 0
   027f: CXP  00 21       Call external procedure PASCALSY.33
   0282: FJP  $054a       Jump if TOS false
   0284: SLDL 02          Short load local MP2
   0285: SLDC 01          Short load constant 1
   0286: GRTI             Integer TOS-1 > TOS
   0287: FJP  $0292       Jump if TOS false
   0289: SLDL 02          Short load local MP2
   028a: SLDC 02          Short load constant 2
   028b: EQUI             Integer TOS-1 = TOS
   028c: SLDL 02          Short load local MP2
   028d: SLDC 04          Short load constant 4
   028e: EQUI             Integer TOS-1 = TOS
   028f: LOR              Logical OR (TOS | TOS-1)
   0290: STL  0002        Store TOS into MP2
-> 0292: SLDC 00          Short load constant 0
   0293: STL  000c        Store TOS into MP12
   0295: LOD  02 0037     Load word at G55
   0298: STL  001b        Store TOS into MP27
   029a: LDL  001b        Load local word MP27
   029c: SIND 05          Short index load *TOS+5
   029d: LOD  02 0001     Load word at G1 (SYSCOM)
   02a0: SIND 04          Short index load *TOS+4
   02a1: LDCN             Load constant NIL
   02a2: EQUI             Integer TOS-1 = TOS
   02a3: LAND             Logical AND (TOS & TOS-1)
   02a4: FJP  $02fb       Jump if TOS false
   02a6: LLA  000b        Load local address MP11
   02a8: CSP  20          Call standard procedure MARK
   02aa: LOD  02 0001     Load word at G1 (SYSCOM)
   02ad: SIND 07          Short index load *TOS+7
   02ae: SLDL 0b          Short load local MP11
   02af: SBI              Subtract integers (TOS-1 - TOS)
   02b0: STL  0008        Store TOS into MP8
   02b2: SLDL 08          Short load local MP8
   02b3: SLDC 00          Short load constant 0
   02b4: GRTI             Integer TOS-1 > TOS
   02b5: SLDL 08          Short load local MP8
   02b6: LDCI 07ec        Load word 2028
   02b9: LDCI 0190        Load word 400
   02bc: ADI              Add integers (TOS + TOS-1)
   02bd: LESI             Integer TOS-1 < TOS
   02be: LAND             Logical AND (TOS & TOS-1)
   02bf: FJP  $02fb       Jump if TOS false
   02c1: SLDL 0b          Short load local MP11
   02c2: LOD  02 0036     Load word at G54
   02c5: SBI              Subtract integers (TOS-1 - TOS)
   02c6: STL  0008        Store TOS into MP8
   02c8: SLDL 08          Short load local MP8
   02c9: SLDC 00          Short load constant 0
   02ca: GRTI             Integer TOS-1 > TOS
   02cb: SLDL 08          Short load local MP8
   02cc: LDCI 07ec        Load word 2028
   02cf: GRTI             Integer TOS-1 > TOS
   02d0: LAND             Logical AND (TOS & TOS-1)
   02d1: LDA  02 007e     Load addr G126
   02d4: LDL  001b        Load local word MP27
   02d6: SIND 07          Short index load *TOS+7
   02d7: IXA  0006        Index array (TOS-1 + TOS * 6)
   02d9: LDL  001b        Load local word MP27
   02db: INC  0008        Inc field ptr (TOS+8)
   02dd: EQLSTR           String TOS-1 = TOS
   02df: LAND             Logical AND (TOS & TOS-1)
   02e0: FJP  $02fb       Jump if TOS false
   02e2: LDL  001b        Load local word MP27
   02e4: SIND 07          Short index load *TOS+7
   02e5: LOD  02 0036     Load word at G54
   02e8: SLDC 00          Short load constant 0
   02e9: LDCI 07ec        Load word 2028
   02ec: LDL  001b        Load local word MP27
   02ee: IND  0010        Static index and load word (TOS+16)
   02f0: SLDC 00          Short load constant 0
   02f1: CSP  06          Call standard procedure UNITWRITE
   02f3: LDA  02 0036     Load addr G54
   02f6: CSP  21          Call standard procedure RELEASE
   02f8: SLDC 01          Short load constant 1
   02f9: STL  000c        Store TOS into MP12
-> 02fb: LLA  000e        Load local address MP14
   02fd: SLDC 01          Short load constant 1
   02fe: LLA  0005        Load local address MP5
   0300: SLDC 00          Short load constant 0
   0301: SLDC 00          Short load constant 0
   0302: CXP  00 1e       Call external procedure PASCALSY.30
   0305: STL  0006        Store TOS into MP6
   0307: SLDL 06          Short load local MP6
   0308: SLDC 00          Short load constant 0
   0309: EQUI             Integer TOS-1 = TOS
   030a: FJP  $0313       Jump if TOS false
   030c: LOD  02 0001     Load word at G1 (SYSCOM)
   030f: SLDC 09          Short load constant 9
   0310: STO              Store indirect (TOS into TOS-1)
   0311: UJP  $051c       Unconditional jump
-> 0313: LDA  02 007e     Load addr G126
   0316: SLDL 06          Short load local MP6
   0317: IXA  0006        Index array (TOS-1 + TOS * 6)
   0319: STL  001b        Store TOS into MP27
   031b: LDL  001a        Load local word MP26
   031d: INC  0005        Inc field ptr (TOS+5)
   031f: SLDC 01          Short load constant 1
   0320: STO              Store indirect (TOS into TOS-1)
   0321: LDL  001a        Load local word MP26
   0323: INC  000f        Inc field ptr (TOS+15)
   0325: SLDC 00          Short load constant 0
   0326: STO              Store indirect (TOS into TOS-1)
   0327: LDL  001a        Load local word MP26
   0329: INC  0007        Inc field ptr (TOS+7)
   032b: SLDL 06          Short load local MP6
   032c: STO              Store indirect (TOS into TOS-1)
   032d: LDL  001a        Load local word MP26
   032f: INC  0008        Inc field ptr (TOS+8)
   0331: LLA  000e        Load local address MP14
   0333: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0335: LDL  001a        Load local word MP26
   0337: INC  000d        Inc field ptr (TOS+13)
   0339: SLDC 00          Short load constant 0
   033a: STO              Store indirect (TOS into TOS-1)
   033b: LDL  001a        Load local word MP26
   033d: INC  0006        Inc field ptr (TOS+6)
   033f: LDL  001b        Load local word MP27
   0341: SIND 04          Short index load *TOS+4
   0342: STO              Store indirect (TOS into TOS-1)
   0343: LDL  001a        Load local word MP26
   0345: INC  001d        Inc field ptr (TOS+29)
   0347: LDL  001b        Load local word MP27
   0349: SIND 04          Short index load *TOS+4
   034a: LDL  001a        Load local word MP26
   034c: SIND 04          Short index load *TOS+4
   034d: SLDC 00          Short load constant 0
   034e: NEQI             Integer TOS-1 <> TOS
   034f: LAND             Logical AND (TOS & TOS-1)
   0350: STO              Store indirect (TOS into TOS-1)
   0351: SLDL 05          Short load local MP5
   0352: LDCN             Load constant NIL
   0353: NEQI             Integer TOS-1 <> TOS
   0354: LLA  0012        Load local address MP18
   0356: SLDC 00          Short load constant 0
   0357: LDB              Load byte at byte ptr TOS-1 + TOS
   0358: SLDC 00          Short load constant 0
   0359: GRTI             Integer TOS-1 > TOS
   035a: LAND             Logical AND (TOS & TOS-1)
   035b: FJP  $03fe       Jump if TOS false
   035d: LLA  0012        Load local address MP18
   035f: SLDL 02          Short load local MP2
   0360: SLDL 05          Short load local MP5
   0361: SLDC 00          Short load constant 0
   0362: SLDC 00          Short load constant 0
   0363: CXP  00 20       Call external procedure PASCALSY.32
   0366: STL  0007        Store TOS into MP7
   0368: SLDL 02          Short load local MP2
   0369: FJP  $0385       Jump if TOS false
   036b: SLDL 07          Short load local MP7
   036c: SLDC 00          Short load constant 0
   036d: EQUI             Integer TOS-1 = TOS
   036e: FJP  $0379       Jump if TOS false
   0370: LOD  02 0001     Load word at G1 (SYSCOM)
   0373: SLDC 0a          Short load constant 10
   0374: STO              Store indirect (TOS into TOS-1)
   0375: UJP  $0502       Unconditional jump
   0377: UJP  $0383       Unconditional jump
-> 0379: LDL  001a        Load local word MP26
   037b: INC  0010        Inc field ptr (TOS+16)
   037d: SLDL 05          Short load local MP5
   037e: SLDL 07          Short load local MP7
   037f: IXA  000d        Index array (TOS-1 + TOS * 13)
   0381: MOV  000d        Move 13 words (TOS to TOS-1)
-> 0383: UJP  $03fc       Unconditional jump
-> 0385: SLDL 07          Short load local MP7
   0386: SLDC 00          Short load constant 0
   0387: GRTI             Integer TOS-1 > TOS
   0388: FJP  $0393       Jump if TOS false
   038a: LOD  02 0001     Load word at G1 (SYSCOM)
   038d: SLDC 0b          Short load constant 11
   038e: STO              Store indirect (TOS into TOS-1)
   038f: UJP  $0502       Unconditional jump
   0391: UJP  $03fc       Unconditional jump
-> 0393: SLDL 0a          Short load local MP10
   0394: SLDC 00          Short load constant 0
   0395: EQUI             Integer TOS-1 = TOS
   0396: FJP  $039b       Jump if TOS false
   0398: SLDC 05          Short load constant 5
   0399: STL  000a        Store TOS into MP10
-> 039b: LLA  0012        Load local address MP18
   039d: SLDL 09          Short load local MP9
   039e: SLDL 0a          Short load local MP10
   039f: SLDL 05          Short load local MP5
   03a0: SLDC 00          Short load constant 0
   03a1: SLDC 00          Short load constant 0
   03a2: CLP  05          Call local procedure FILEPROC.5
   03a4: STL  0007        Store TOS into MP7
   03a6: SLDL 07          Short load local MP7
   03a7: SLDC 00          Short load constant 0
   03a8: GRTI             Integer TOS-1 > TOS
   03a9: SLDL 0a          Short load local MP10
   03aa: SLDC 03          Short load constant 3
   03ab: EQUI             Integer TOS-1 = TOS
   03ac: LAND             Logical AND (TOS & TOS-1)
   03ad: FJP  $03db       Jump if TOS false
   03af: SLDL 05          Short load local MP5
   03b0: SLDL 07          Short load local MP7
   03b1: IXA  000d        Index array (TOS-1 + TOS * 13)
   03b3: STL  001c        Store TOS into MP28
   03b5: LDL  001c        Load local word MP28
   03b7: SIND 01          Short index load *TOS+1
   03b8: LDL  001c        Load local word MP28
   03ba: SIND 00          Short index load *TOS+0
   03bb: SBI              Subtract integers (TOS-1 - TOS)
   03bc: FJP  $03c8       Jump if TOS false
   03be: LDL  001c        Load local word MP28
   03c0: INC  0001        Inc field ptr (TOS+1)
   03c2: LDL  001c        Load local word MP28
   03c4: SIND 01          Short index load *TOS+1
   03c5: SLDC 01          Short load constant 1
   03c6: SBI              Subtract integers (TOS-1 - TOS)
   03c7: STO              Store indirect (TOS into TOS-1)
-> 03c8: LDL  001c        Load local word MP28
   03ca: SIND 01          Short index load *TOS+1
   03cb: LDL  001c        Load local word MP28
   03cd: SIND 00          Short index load *TOS+0
   03ce: SBI              Subtract integers (TOS-1 - TOS)
   03cf: SLDC 04          Short load constant 4
   03d0: LESI             Integer TOS-1 < TOS
   03d1: FJP  $03db       Jump if TOS false
   03d3: SLDL 07          Short load local MP7
   03d4: SLDL 05          Short load local MP5
   03d5: CXP  00 22       Call external procedure PASCALSY.34
   03d8: SLDC 00          Short load constant 0
   03d9: STL  0007        Store TOS into MP7
-> 03db: SLDL 07          Short load local MP7
   03dc: SLDC 00          Short load constant 0
   03dd: EQUI             Integer TOS-1 = TOS
   03de: FJP  $03e7       Jump if TOS false
   03e0: LOD  02 0001     Load word at G1 (SYSCOM)
   03e3: SLDC 08          Short load constant 8
   03e4: STO              Store indirect (TOS into TOS-1)
   03e5: UJP  $0502       Unconditional jump
-> 03e7: LDL  001a        Load local word MP26
   03e9: INC  0010        Inc field ptr (TOS+16)
   03eb: SLDL 05          Short load local MP5
   03ec: SLDL 07          Short load local MP7
   03ed: IXA  000d        Index array (TOS-1 + TOS * 13)
   03ef: MOV  000d        Move 13 words (TOS to TOS-1)
   03f1: LDL  001a        Load local word MP26
   03f3: INC  000f        Inc field ptr (TOS+15)
   03f5: SLDC 01          Short load constant 1
   03f6: STO              Store indirect (TOS into TOS-1)
   03f7: SLDL 06          Short load local MP6
   03f8: SLDL 05          Short load local MP5
   03f9: CXP  00 1f       Call external procedure PASCALSY.31
-> 03fc: UJP  $046a       Unconditional jump
-> 03fe: SLDL 05          Short load local MP5
   03ff: LDCN             Load constant NIL
   0400: EQUI             Integer TOS-1 = TOS
   0401: LLA  0012        Load local address MP18
   0403: SLDC 00          Short load constant 0
   0404: LDB              Load byte at byte ptr TOS-1 + TOS
   0405: SLDC 00          Short load constant 0
   0406: NEQI             Integer TOS-1 <> TOS
   0407: LAND             Logical AND (TOS & TOS-1)
   0408: FJP  $041a       Jump if TOS false
   040a: LDA  02 007e     Load addr G126
   040d: SLDL 06          Short load local MP6
   040e: IXA  0006        Index array (TOS-1 + TOS * 6)
   0410: SIND 04          Short index load *TOS+4
   0411: FJP  $041a       Jump if TOS false
   0413: LOD  02 0001     Load word at G1 (SYSCOM)
   0416: SLDC 0a          Short load constant 10
   0417: STO              Store indirect (TOS into TOS-1)
   0418: UJP  $0502       Unconditional jump
-> 041a: LDL  001a        Load local word MP26
   041c: INC  0010        Inc field ptr (TOS+16)
   041e: STL  001c        Store TOS into MP28
   0420: LDL  001c        Load local word MP28
   0422: SLDC 00          Short load constant 0
   0423: STO              Store indirect (TOS into TOS-1)
   0424: LDL  001c        Load local word MP28
   0426: INC  0001        Inc field ptr (TOS+1)
   0428: LDCI 7fff        Load word 32767
   042b: STO              Store indirect (TOS into TOS-1)
   042c: LDL  001b        Load local word MP27
   042e: SIND 04          Short index load *TOS+4
   042f: FJP  $0439       Jump if TOS false
   0431: LDL  001c        Load local word MP28
   0433: INC  0001        Inc field ptr (TOS+1)
   0435: LDL  001b        Load local word MP27
   0437: SIND 05          Short index load *TOS+5
   0438: STO              Store indirect (TOS into TOS-1)
-> 0439: LDL  001c        Load local word MP28
   043b: INC  0002        Inc field ptr (TOS+2)
   043d: SLDC 04          Short load constant 4
   043e: SLDC 00          Short load constant 0
   043f: SLDL 0a          Short load local MP10
   0440: STP              Store packed field (TOS into TOS-1)
   0441: LDL  001c        Load local word MP28
   0443: INC  0003        Inc field ptr (TOS+3)
   0445: LSA  00          Load string address: ''
   0447: NOP              No operation
   0448: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   044a: LDL  001c        Load local word MP28
   044c: INC  000b        Inc field ptr (TOS+11)
   044e: LDCI 0200        Load word 512
   0451: STO              Store indirect (TOS into TOS-1)
   0452: LDL  001c        Load local word MP28
   0454: INC  000c        Inc field ptr (TOS+12)
   0456: STL  001d        Store TOS into MP29
   0458: LDL  001d        Load local word MP29
   045a: SLDC 04          Short load constant 4
   045b: SLDC 00          Short load constant 0
   045c: SLDC 00          Short load constant 0
   045d: STP              Store packed field (TOS into TOS-1)
   045e: LDL  001d        Load local word MP29
   0460: SLDC 05          Short load constant 5
   0461: SLDC 04          Short load constant 4
   0462: SLDC 00          Short load constant 0
   0463: STP              Store packed field (TOS into TOS-1)
   0464: LDL  001d        Load local word MP29
   0466: SLDC 07          Short load constant 7
   0467: SLDC 09          Short load constant 9
   0468: SLDC 00          Short load constant 0
   0469: STP              Store packed field (TOS into TOS-1)
-> 046a: SLDL 02          Short load local MP2
   046b: FJP  $047d       Jump if TOS false
   046d: LDL  001a        Load local word MP26
   046f: INC  000c        Inc field ptr (TOS+12)
   0471: LDL  001a        Load local word MP26
   0473: IND  0011        Static index and load word (TOS+17)
   0475: LDL  001a        Load local word MP26
   0477: IND  0010        Static index and load word (TOS+16)
   0479: SBI              Subtract integers (TOS-1 - TOS)
   047a: STO              Store indirect (TOS into TOS-1)
   047b: UJP  $0483       Unconditional jump
-> 047d: LDL  001a        Load local word MP26
   047f: INC  000c        Inc field ptr (TOS+12)
   0481: SLDC 00          Short load constant 0
   0482: STO              Store indirect (TOS into TOS-1)
-> 0483: LDL  001a        Load local word MP26
   0485: IND  001d        Static index and load word (TOS+29)
   0487: FJP  $04f7       Jump if TOS false
   0489: LDL  001a        Load local word MP26
   048b: INC  001f        Inc field ptr (TOS+31)
   048d: LDCI 0200        Load word 512
   0490: STO              Store indirect (TOS into TOS-1)
   0491: LDL  001a        Load local word MP26
   0493: INC  0020        Inc field ptr (TOS+32)
   0495: SLDC 00          Short load constant 0
   0496: STO              Store indirect (TOS into TOS-1)
   0497: SLDL 02          Short load local MP2
   0498: FJP  $04a5       Jump if TOS false
   049a: LDL  001a        Load local word MP26
   049c: INC  001e        Inc field ptr (TOS+30)
   049e: LDL  001a        Load local word MP26
   04a0: IND  001b        Static index and load word (TOS+27)
   04a2: STO              Store indirect (TOS into TOS-1)
   04a3: UJP  $04ad       Unconditional jump
-> 04a5: LDL  001a        Load local word MP26
   04a7: INC  001e        Inc field ptr (TOS+30)
   04a9: LDCI 0200        Load word 512
   04ac: STO              Store indirect (TOS into TOS-1)
-> 04ad: LDL  001a        Load local word MP26
   04af: INC  0010        Inc field ptr (TOS+16)
   04b1: STL  001c        Store TOS into MP28
   04b3: LDL  001c        Load local word MP28
   04b5: INC  0002        Inc field ptr (TOS+2)
   04b7: SLDC 04          Short load constant 4
   04b8: SLDC 00          Short load constant 0
   04b9: LDP              Load packed field (TOS)
   04ba: SLDC 03          Short load constant 3
   04bb: EQUI             Integer TOS-1 = TOS
   04bc: FJP  $04f7       Jump if TOS false
   04be: LDL  001a        Load local word MP26
   04c0: INC  000d        Inc field ptr (TOS+13)
   04c2: SLDC 02          Short load constant 2
   04c3: STO              Store indirect (TOS into TOS-1)
   04c4: SLDL 02          Short load local MP2
   04c5: LNOT             Logical NOT (~TOS)
   04c6: FJP  $04f7       Jump if TOS false
   04c8: LDL  001a        Load local word MP26
   04ca: INC  0021        Inc field ptr (TOS+33)
   04cc: SLDC 00          Short load constant 0
   04cd: LDCI 0202        Load word 514
   04d0: SLDC 00          Short load constant 0
   04d1: CSP  0a          Call standard procedure FLCH
   04d3: LDL  001a        Load local word MP26
   04d5: SIND 07          Short index load *TOS+7
   04d6: LDL  001a        Load local word MP26
   04d8: INC  0021        Inc field ptr (TOS+33)
   04da: SLDC 00          Short load constant 0
   04db: LDCI 0200        Load word 512
   04de: LDL  001c        Load local word MP28
   04e0: SIND 00          Short index load *TOS+0
   04e1: SLDC 00          Short load constant 0
   04e2: CSP  06          Call standard procedure UNITWRITE
   04e4: LDL  001a        Load local word MP26
   04e6: SIND 07          Short index load *TOS+7
   04e7: LDL  001a        Load local word MP26
   04e9: INC  0021        Inc field ptr (TOS+33)
   04eb: SLDC 00          Short load constant 0
   04ec: LDCI 0200        Load word 512
   04ef: LDL  001c        Load local word MP28
   04f1: SIND 00          Short index load *TOS+0
   04f2: SLDC 01          Short load constant 1
   04f3: ADI              Add integers (TOS + TOS-1)
   04f4: SLDC 00          Short load constant 0
   04f5: CSP  06          Call standard procedure UNITWRITE
-> 04f7: SLDL 02          Short load local MP2
   04f8: FJP  $04ff       Jump if TOS false
   04fa: SLDL 04          Short load local MP4
   04fb: CGP  03          Call global procedure FILEPROC.3
   04fd: UJP  $0502       Unconditional jump
-> 04ff: SLDL 04          Short load local MP4
   0500: CGP  02          Call global procedure FILEPROC.2
-> 0502: LOD  02 0001     Load word at G1 (SYSCOM)
   0505: SIND 00          Short index load *TOS+0
   0506: SLDC 00          Short load constant 0
   0507: NEQI             Integer TOS-1 <> TOS
   0508: FJP  $051c       Jump if TOS false
   050a: LDL  001a        Load local word MP26
   050c: INC  0005        Inc field ptr (TOS+5)
   050e: SLDC 00          Short load constant 0
   050f: STO              Store indirect (TOS into TOS-1)
   0510: LDL  001a        Load local word MP26
   0512: INC  0002        Inc field ptr (TOS+2)
   0514: SLDC 01          Short load constant 1
   0515: STO              Store indirect (TOS into TOS-1)
   0516: LDL  001a        Load local word MP26
   0518: INC  0001        Inc field ptr (TOS+1)
   051a: SLDC 01          Short load constant 1
   051b: STO              Store indirect (TOS into TOS-1)
-> 051c: SLDL 0c          Short load local MP12
   051d: FJP  $0548       Jump if TOS false
   051f: LLA  000b        Load local address MP11
   0521: CSP  21          Call standard procedure RELEASE
   0523: LOD  02 0001     Load word at G1 (SYSCOM)
   0526: INC  0004        Inc field ptr (TOS+4)
   0528: LDCN             Load constant NIL
   0529: STO              Store indirect (TOS into TOS-1)
   052a: LOD  02 0001     Load word at G1 (SYSCOM)
   052d: SIND 00          Short index load *TOS+0
   052e: STL  000d        Store TOS into MP13
   0530: LOD  02 0037     Load word at G55
   0533: SIND 07          Short index load *TOS+7
   0534: LOD  02 0036     Load word at G54
   0537: SLDC 00          Short load constant 0
   0538: LDCI 07ec        Load word 2028
   053b: LOD  02 0037     Load word at G55
   053e: IND  0010        Static index and load word (TOS+16)
   0540: SLDC 00          Short load constant 0
   0541: CSP  05          Call standard procedure UNITREAD
   0543: LOD  02 0001     Load word at G1 (SYSCOM)
   0546: SLDL 0d          Short load local MP13
   0547: STO              Store indirect (TOS into TOS-1)
-> 0548: UJP  $054f       Unconditional jump
-> 054a: LOD  02 0001     Load word at G1 (SYSCOM)
   054d: SLDC 07          Short load constant 7
   054e: STO              Store indirect (TOS into TOS-1)
-> 054f: RNP  00          Return from nonbase procedure
END

### FUNCTION FILEPROC.FUNC5(PARAM1; PARAM2; PARAM3; PARAM4): RETVAL (* P=5 LL=2 *)
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
-> 0162: SLDC 00          Short load constant 0
   0163: STL  0008        Store TOS into MP8
   0165: SLDL 03          Short load local MP3
   0166: SLDC 00          Short load constant 0
   0167: IXA  000d        Index array (TOS-1 + TOS * 13)
   0169: IND  0008        Static index and load word (TOS+8)
   016b: STL  0009        Store TOS into MP9
   016d: SLDC 00          Short load constant 0
   016e: STL  0007        Store TOS into MP7
   0170: SLDC 00          Short load constant 0
   0171: STL  000c        Store TOS into MP12
   0173: SLDL 05          Short load local MP5
   0174: SLDC 00          Short load constant 0
   0175: LEQI             Integer TOS-1 <= TOS
   0176: FJP  $01c9       Jump if TOS false
   0178: SLDL 05          Short load local MP5
   0179: SLDC 00          Short load constant 0
   017a: LESI             Integer TOS-1 < TOS
   017b: STL  000b        Store TOS into MP11
   017d: SLDC 01          Short load constant 1
   017e: STL  000a        Store TOS into MP10
   0180: SLDL 09          Short load local MP9
   0181: STL  001a        Store TOS into MP26
-> 0183: SLDL 0a          Short load local MP10
   0184: LDL  001a        Load local word MP26
   0186: LEQI             Integer TOS-1 <= TOS
   0187: FJP  $019f       Jump if TOS false
   0189: SLDL 0a          Short load local MP10
   018a: SLDL 03          Short load local MP3
   018b: SLDL 0a          Short load local MP10
   018c: SLDC 01          Short load constant 1
   018d: SBI              Subtract integers (TOS-1 - TOS)
   018e: IXA  000d        Index array (TOS-1 + TOS * 13)
   0190: SIND 01          Short index load *TOS+1
   0191: SLDL 03          Short load local MP3
   0192: SLDL 0a          Short load local MP10
   0193: IXA  000d        Index array (TOS-1 + TOS * 13)
   0195: SIND 00          Short index load *TOS+0
   0196: CLP  06          Call local procedure FILEPROC.6
   0198: SLDL 0a          Short load local MP10
   0199: SLDC 01          Short load constant 1
   019a: ADI              Add integers (TOS + TOS-1)
   019b: STL  000a        Store TOS into MP10
   019d: UJP  $0183       Unconditional jump
-> 019f: SLDL 09          Short load local MP9
   01a0: SLDC 01          Short load constant 1
   01a1: ADI              Add integers (TOS + TOS-1)
   01a2: SLDL 03          Short load local MP3
   01a3: SLDL 09          Short load local MP9
   01a4: IXA  000d        Index array (TOS-1 + TOS * 13)
   01a6: SIND 01          Short index load *TOS+1
   01a7: SLDL 03          Short load local MP3
   01a8: SLDC 00          Short load constant 0
   01a9: IXA  000d        Index array (TOS-1 + TOS * 13)
   01ab: SIND 07          Short index load *TOS+7
   01ac: CLP  06          Call local procedure FILEPROC.6
   01ae: SLDL 0b          Short load local MP11
   01af: FJP  $01c7       Jump if TOS false
   01b1: SLDL 05          Short load local MP5
   01b2: SLDC 02          Short load constant 2
   01b3: DVI              Divide integers (TOS-1 / TOS)
   01b4: SLDL 0c          Short load local MP12
   01b5: LEQI             Integer TOS-1 <= TOS
   01b6: FJP  $01c0       Jump if TOS false
   01b8: SLDL 0c          Short load local MP12
   01b9: STL  0005        Store TOS into MP5
   01bb: SLDL 07          Short load local MP7
   01bc: STL  0008        Store TOS into MP8
   01be: UJP  $01c7       Unconditional jump
-> 01c0: SLDL 05          Short load local MP5
   01c1: SLDC 01          Short load constant 1
   01c2: ADI              Add integers (TOS + TOS-1)
   01c3: SLDC 02          Short load constant 2
   01c4: DVI              Divide integers (TOS-1 / TOS)
   01c5: STL  0005        Store TOS into MP5
-> 01c7: UJP  $0208       Unconditional jump
-> 01c9: SLDC 01          Short load constant 1
   01ca: STL  000a        Store TOS into MP10
-> 01cc: SLDL 0a          Short load local MP10
   01cd: SLDL 09          Short load local MP9
   01ce: LEQI             Integer TOS-1 <= TOS
   01cf: FJP  $01ef       Jump if TOS false
   01d1: SLDL 03          Short load local MP3
   01d2: SLDL 0a          Short load local MP10
   01d3: IXA  000d        Index array (TOS-1 + TOS * 13)
   01d5: SIND 00          Short index load *TOS+0
   01d6: SLDL 03          Short load local MP3
   01d7: SLDL 0a          Short load local MP10
   01d8: SLDC 01          Short load constant 1
   01d9: SBI              Subtract integers (TOS-1 - TOS)
   01da: IXA  000d        Index array (TOS-1 + TOS * 13)
   01dc: SIND 01          Short index load *TOS+1
   01dd: SBI              Subtract integers (TOS-1 - TOS)
   01de: SLDL 05          Short load local MP5
   01df: GEQI             Integer TOS-1 >= TOS
   01e0: FJP  $01e8       Jump if TOS false
   01e2: SLDL 0a          Short load local MP10
   01e3: STL  0008        Store TOS into MP8
   01e5: SLDL 09          Short load local MP9
   01e6: STL  000a        Store TOS into MP10
-> 01e8: SLDL 0a          Short load local MP10
   01e9: SLDC 01          Short load constant 1
   01ea: ADI              Add integers (TOS + TOS-1)
   01eb: STL  000a        Store TOS into MP10
   01ed: UJP  $01cc       Unconditional jump
-> 01ef: SLDL 08          Short load local MP8
   01f0: SLDC 00          Short load constant 0
   01f1: EQUI             Integer TOS-1 = TOS
   01f2: FJP  $0208       Jump if TOS false
   01f4: SLDL 03          Short load local MP3
   01f5: SLDC 00          Short load constant 0
   01f6: IXA  000d        Index array (TOS-1 + TOS * 13)
   01f8: SIND 07          Short index load *TOS+7
   01f9: SLDL 03          Short load local MP3
   01fa: SLDL 09          Short load local MP9
   01fb: IXA  000d        Index array (TOS-1 + TOS * 13)
   01fd: SIND 01          Short index load *TOS+1
   01fe: SBI              Subtract integers (TOS-1 - TOS)
   01ff: SLDL 05          Short load local MP5
   0200: GEQI             Integer TOS-1 >= TOS
   0201: FJP  $0208       Jump if TOS false
   0203: SLDL 09          Short load local MP9
   0204: SLDC 01          Short load constant 1
   0205: ADI              Add integers (TOS + TOS-1)
   0206: STL  0008        Store TOS into MP8
-> 0208: SLDL 09          Short load local MP9
   0209: SLDC 4d          Short load constant 77
   020a: EQUI             Integer TOS-1 = TOS
   020b: FJP  $0210       Jump if TOS false
   020d: SLDC 00          Short load constant 0
   020e: STL  0008        Store TOS into MP8
-> 0210: SLDL 08          Short load local MP8
   0211: SLDC 00          Short load constant 0
   0212: GRTI             Integer TOS-1 > TOS
   0213: FJP  $024c       Jump if TOS false
   0215: SLDL 03          Short load local MP3
   0216: SLDL 08          Short load local MP8
   0217: SLDC 01          Short load constant 1
   0218: SBI              Subtract integers (TOS-1 - TOS)
   0219: IXA  000d        Index array (TOS-1 + TOS * 13)
   021b: SIND 01          Short index load *TOS+1
   021c: STL  000d        Store TOS into MP13
   021e: SLDL 0d          Short load local MP13
   021f: SLDL 05          Short load local MP5
   0220: ADI              Add integers (TOS + TOS-1)
   0221: STL  000e        Store TOS into MP14
   0223: LLA  000f        Load local address MP15
   0225: SLDC 04          Short load constant 4
   0226: SLDC 00          Short load constant 0
   0227: SLDL 04          Short load local MP4
   0228: STP              Store packed field (TOS into TOS-1)
   0229: LLA  0010        Load local address MP16
   022b: SLDL 06          Short load local MP6
   022c: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   022e: LDCI 0200        Load word 512
   0231: STL  0018        Store TOS into MP24
   0233: LLA  0019        Load local address MP25
   0235: SLDC 04          Short load constant 4
   0236: SLDC 00          Short load constant 0
   0237: SLDC 00          Short load constant 0
   0238: STP              Store packed field (TOS into TOS-1)
   0239: LLA  0019        Load local address MP25
   023b: SLDC 05          Short load constant 5
   023c: SLDC 04          Short load constant 4
   023d: SLDC 00          Short load constant 0
   023e: STP              Store packed field (TOS into TOS-1)
   023f: LLA  0019        Load local address MP25
   0241: SLDC 07          Short load constant 7
   0242: SLDC 09          Short load constant 9
   0243: SLDC 64          Short load constant 100
   0244: STP              Store packed field (TOS into TOS-1)
   0245: LLA  000d        Load local address MP13
   0247: SLDL 08          Short load local MP8
   0248: SLDL 03          Short load local MP3
   0249: CXP  00 23       Call external procedure PASCALSY.35
-> 024c: SLDL 08          Short load local MP8
   024d: STL  0001        Store TOS into MP1
-> 024f: RNP  01          Return from nonbase procedure
END

### PROCEDURE FILEPROC.PROC6(PARAM1; PARAM2; PARAM3) (* P=6 LL=3 *)
  MP1=PARAM3
  MP2=PARAM2
  MP3=PARAM1
  MP4
BEGIN
-> 0124: SLDL 01          Short load local MP1
   0125: SLDL 02          Short load local MP2
   0126: SBI              Subtract integers (TOS-1 - TOS)
   0127: STL  0004        Store TOS into MP4
   0129: SLDL 04          Short load local MP4
   012a: LOD  01 0005     Load word at L2_5
   012d: GRTI             Integer TOS-1 > TOS
   012e: FJP  $0146       Jump if TOS false
   0130: LOD  01 0008     Load word at L2_8
   0133: STR  01 0007     Store TOS to L27
   0136: LOD  01 0005     Load word at L2_5
   0139: STR  01 000c     Store TOS to L212
   013c: SLDL 03          Short load local MP3
   013d: STR  01 0008     Store TOS to L28
   0140: SLDL 04          Short load local MP4
   0141: STR  01 0005     Store TOS to L25
   0144: UJP  $0155       Unconditional jump
-> 0146: SLDL 04          Short load local MP4
   0147: LOD  01 000c     Load word at L2_12
   014a: GRTI             Integer TOS-1 > TOS
   014b: FJP  $0155       Jump if TOS false
   014d: SLDL 04          Short load local MP4
   014e: STR  01 000c     Store TOS to L212
   0151: SLDL 03          Short load local MP3
   0152: STR  01 0007     Store TOS to L27
-> 0155: RNP  00          Return from nonbase procedure
END

### PROCEDURE FILEPROC.PROC7(PARAM1; PARAM2) (* P=7 LL=1 *)
  MP1=PARAM2
  MP2=PARAM1
  MP3
  MP4
  MP5
  MP6
  MP7
  MP8
BEGIN
-> 0566: LOD  02 0001     Load word at G1 (SYSCOM)
   0569: SLDC 00          Short load constant 0
   056a: STO              Store indirect (TOS into TOS-1)
   056b: SLDL 02          Short load local MP2
   056c: STL  0007        Store TOS into MP7
   056e: SLDL 07          Short load local MP7
   056f: SIND 05          Short index load *TOS+5
   0570: SLDL 07          Short load local MP7
   0571: SIND 00          Short index load *TOS+0
   0572: LOD  02 0038     Load word at G56
   0575: SIND 00          Short index load *TOS+0
   0576: NEQI             Integer TOS-1 <> TOS
   0577: LAND             Logical AND (TOS & TOS-1)
   0578: FJP  $06f7       Jump if TOS false
   057a: SLDL 07          Short load local MP7
   057b: SIND 06          Short index load *TOS+6
   057c: FJP  $06ce       Jump if TOS false
   057e: SLDL 07          Short load local MP7
   057f: INC  0010        Inc field ptr (TOS+16)
   0581: STL  0008        Store TOS into MP8
   0583: SLDL 08          Short load local MP8
   0584: INC  0003        Inc field ptr (TOS+3)
   0586: SLDC 00          Short load constant 0
   0587: LDB              Load byte at byte ptr TOS-1 + TOS
   0588: SLDC 00          Short load constant 0
   0589: GRTI             Integer TOS-1 > TOS
   058a: FJP  $06ce       Jump if TOS false
   058c: SLDL 01          Short load local MP1
   058d: SLDC 03          Short load constant 3
   058e: EQUI             Integer TOS-1 = TOS
   058f: FJP  $05ae       Jump if TOS false
   0591: SLDL 07          Short load local MP7
   0592: INC  000c        Inc field ptr (TOS+12)
   0594: SLDL 07          Short load local MP7
   0595: IND  000d        Static index and load word (TOS+13)
   0597: STO              Store indirect (TOS into TOS-1)
   0598: SLDL 08          Short load local MP8
   0599: INC  000c        Inc field ptr (TOS+12)
   059b: SLDC 07          Short load constant 7
   059c: SLDC 09          Short load constant 9
   059d: SLDC 64          Short load constant 100
   059e: STP              Store packed field (TOS into TOS-1)
   059f: SLDC 01          Short load constant 1
   05a0: STL  0001        Store TOS into MP1
   05a2: SLDL 07          Short load local MP7
   05a3: IND  001d        Static index and load word (TOS+29)
   05a5: FJP  $05ae       Jump if TOS false
   05a7: SLDL 07          Short load local MP7
   05a8: INC  001e        Inc field ptr (TOS+30)
   05aa: SLDL 07          Short load local MP7
   05ab: IND  001f        Static index and load word (TOS+31)
   05ad: STO              Store indirect (TOS into TOS-1)
-> 05ae: SLDL 02          Short load local MP2
   05af: CGP  02          Call global procedure FILEPROC.2
   05b1: SLDL 07          Short load local MP7
   05b2: IND  000f        Static index and load word (TOS+15)
   05b4: SLDL 08          Short load local MP8
   05b5: INC  000c        Inc field ptr (TOS+12)
   05b7: SLDC 07          Short load constant 7
   05b8: SLDC 09          Short load constant 9
   05b9: LDP              Load packed field (TOS)
   05ba: SLDC 64          Short load constant 100
   05bb: EQUI             Integer TOS-1 = TOS
   05bc: LOR              Logical OR (TOS | TOS-1)
   05bd: SLDL 01          Short load local MP1
   05be: SLDC 02          Short load constant 2
   05bf: EQUI             Integer TOS-1 = TOS
   05c0: LOR              Logical OR (TOS | TOS-1)
   05c1: FJP  $06ce       Jump if TOS false
   05c3: SLDL 07          Short load local MP7
   05c4: SIND 07          Short index load *TOS+7
   05c5: SLDL 07          Short load local MP7
   05c6: INC  0008        Inc field ptr (TOS+8)
   05c8: SLDC 00          Short load constant 0
   05c9: LLA  0005        Load local address MP5
   05cb: SLDC 00          Short load constant 0
   05cc: SLDC 00          Short load constant 0
   05cd: CXP  00 1e       Call external procedure PASCALSY.30
   05d0: NEQI             Integer TOS-1 <> TOS
   05d1: FJP  $05da       Jump if TOS false
   05d3: LOD  02 0001     Load word at G1 (SYSCOM)
   05d6: SLDC 05          Short load constant 5
   05d7: STO              Store indirect (TOS into TOS-1)
   05d8: UJP  $06e8       Unconditional jump
-> 05da: SLDC 01          Short load constant 1
   05db: STL  0004        Store TOS into MP4
   05dd: SLDC 00          Short load constant 0
   05de: STL  0006        Store TOS into MP6
-> 05e0: SLDL 04          Short load local MP4
   05e1: SLDL 05          Short load local MP5
   05e2: SLDC 00          Short load constant 0
   05e3: IXA  000d        Index array (TOS-1 + TOS * 13)
   05e5: IND  0008        Static index and load word (TOS+8)
   05e7: LEQI             Integer TOS-1 <= TOS
   05e8: SLDL 06          Short load local MP6
   05e9: LNOT             Logical NOT (~TOS)
   05ea: LAND             Logical AND (TOS & TOS-1)
   05eb: FJP  $0607       Jump if TOS false
   05ed: SLDL 05          Short load local MP5
   05ee: SLDL 04          Short load local MP4
   05ef: IXA  000d        Index array (TOS-1 + TOS * 13)
   05f1: SIND 00          Short index load *TOS+0
   05f2: SLDL 08          Short load local MP8
   05f3: SIND 00          Short index load *TOS+0
   05f4: EQUI             Integer TOS-1 = TOS
   05f5: SLDL 05          Short load local MP5
   05f6: SLDL 04          Short load local MP4
   05f7: IXA  000d        Index array (TOS-1 + TOS * 13)
   05f9: SIND 01          Short index load *TOS+1
   05fa: SLDL 08          Short load local MP8
   05fb: SIND 01          Short index load *TOS+1
   05fc: EQUI             Integer TOS-1 = TOS
   05fd: LAND             Logical AND (TOS & TOS-1)
   05fe: STL  0006        Store TOS into MP6
   0600: SLDL 04          Short load local MP4
   0601: SLDC 01          Short load constant 1
   0602: ADI              Add integers (TOS + TOS-1)
   0603: STL  0004        Store TOS into MP4
   0605: UJP  $05e0       Unconditional jump
-> 0607: SLDL 06          Short load local MP6
   0608: LNOT             Logical NOT (~TOS)
   0609: FJP  $0612       Jump if TOS false
   060b: LOD  02 0001     Load word at G1 (SYSCOM)
   060e: SLDC 06          Short load constant 6
   060f: STO              Store indirect (TOS into TOS-1)
   0610: UJP  $06e8       Unconditional jump
-> 0612: SLDL 04          Short load local MP4
   0613: SLDC 01          Short load constant 1
   0614: SBI              Subtract integers (TOS-1 - TOS)
   0615: STL  0004        Store TOS into MP4
   0617: SLDL 01          Short load local MP1
   0618: SLDC 00          Short load constant 0
   0619: EQUI             Integer TOS-1 = TOS
   061a: SLDL 05          Short load local MP5
   061b: SLDL 04          Short load local MP4
   061c: IXA  000d        Index array (TOS-1 + TOS * 13)
   061e: INC  000c        Inc field ptr (TOS+12)
   0620: SLDC 07          Short load constant 7
   0621: SLDC 09          Short load constant 9
   0622: LDP              Load packed field (TOS)
   0623: SLDC 64          Short load constant 100
   0624: EQUI             Integer TOS-1 = TOS
   0625: LAND             Logical AND (TOS & TOS-1)
   0626: SLDL 01          Short load local MP1
   0627: SLDC 02          Short load constant 2
   0628: EQUI             Integer TOS-1 = TOS
   0629: LOR              Logical OR (TOS | TOS-1)
   062a: FJP  $0633       Jump if TOS false
   062c: SLDL 04          Short load local MP4
   062d: SLDL 05          Short load local MP5
   062e: CXP  00 22       Call external procedure PASCALSY.34
   0631: UJP  $06c8       Unconditional jump
-> 0633: SLDL 08          Short load local MP8
   0634: INC  0003        Inc field ptr (TOS+3)
   0636: SLDC 01          Short load constant 1
   0637: SLDL 05          Short load local MP5
   0638: SLDC 00          Short load constant 0
   0639: SLDC 00          Short load constant 0
   063a: CXP  00 20       Call external procedure PASCALSY.32
   063d: STL  0003        Store TOS into MP3
   063f: SLDL 03          Short load local MP3
   0640: SLDC 00          Short load constant 0
   0641: NEQI             Integer TOS-1 <> TOS
   0642: SLDL 03          Short load local MP3
   0643: SLDL 04          Short load local MP4
   0644: NEQI             Integer TOS-1 <> TOS
   0645: LAND             Logical AND (TOS & TOS-1)
   0646: FJP  $0657       Jump if TOS false
   0648: SLDL 03          Short load local MP3
   0649: SLDL 05          Short load local MP5
   064a: CXP  00 22       Call external procedure PASCALSY.34
   064d: SLDL 03          Short load local MP3
   064e: SLDL 04          Short load local MP4
   064f: LESI             Integer TOS-1 < TOS
   0650: FJP  $0657       Jump if TOS false
   0652: SLDL 04          Short load local MP4
   0653: SLDC 01          Short load constant 1
   0654: SBI              Subtract integers (TOS-1 - TOS)
   0655: STL  0004        Store TOS into MP4
-> 0657: SLDL 05          Short load local MP5
   0658: SLDL 04          Short load local MP4
   0659: IXA  000d        Index array (TOS-1 + TOS * 13)
   065b: INC  000c        Inc field ptr (TOS+12)
   065d: SLDC 07          Short load constant 7
   065e: SLDC 09          Short load constant 9
   065f: LDP              Load packed field (TOS)
   0660: SLDC 64          Short load constant 100
   0661: EQUI             Integer TOS-1 = TOS
   0662: FJP  $067a       Jump if TOS false
   0664: SLDL 08          Short load local MP8
   0665: INC  000c        Inc field ptr (TOS+12)
   0667: SLDC 07          Short load constant 7
   0668: SLDC 09          Short load constant 9
   0669: LDP              Load packed field (TOS)
   066a: SLDC 64          Short load constant 100
   066b: EQUI             Integer TOS-1 = TOS
   066c: FJP  $0678       Jump if TOS false
   066e: SLDL 08          Short load local MP8
   066f: INC  000c        Inc field ptr (TOS+12)
   0671: LDA  02 0043     Load addr G67
   0674: MOV  0001        Move 1 words (TOS to TOS-1)
   0676: UJP  $0678       Unconditional jump
-> 0678: UJP  $069d       Unconditional jump
-> 067a: SLDL 07          Short load local MP7
   067b: IND  000f        Static index and load word (TOS+15)
   067d: LDA  02 0043     Load addr G67
   0680: SLDC 04          Short load constant 4
   0681: SLDC 00          Short load constant 0
   0682: LDP              Load packed field (TOS)
   0683: SLDC 00          Short load constant 0
   0684: NEQI             Integer TOS-1 <> TOS
   0685: LAND             Logical AND (TOS & TOS-1)
   0686: FJP  $0692       Jump if TOS false
   0688: SLDL 08          Short load local MP8
   0689: INC  000c        Inc field ptr (TOS+12)
   068b: LDA  02 0043     Load addr G67
   068e: MOV  0001        Move 1 words (TOS to TOS-1)
   0690: UJP  $069d       Unconditional jump
-> 0692: SLDL 08          Short load local MP8
   0693: INC  000c        Inc field ptr (TOS+12)
   0695: SLDL 05          Short load local MP5
   0696: SLDL 04          Short load local MP4
   0697: IXA  000d        Index array (TOS-1 + TOS * 13)
   0699: INC  000c        Inc field ptr (TOS+12)
   069b: MOV  0001        Move 1 words (TOS to TOS-1)
-> 069d: SLDL 08          Short load local MP8
   069e: INC  0001        Inc field ptr (TOS+1)
   06a0: SLDL 08          Short load local MP8
   06a1: SIND 00          Short index load *TOS+0
   06a2: SLDL 07          Short load local MP7
   06a3: IND  000c        Static index and load word (TOS+12)
   06a5: ADI              Add integers (TOS + TOS-1)
   06a6: STO              Store indirect (TOS into TOS-1)
   06a7: SLDL 07          Short load local MP7
   06a8: IND  001d        Static index and load word (TOS+29)
   06aa: FJP  $06b3       Jump if TOS false
   06ac: SLDL 08          Short load local MP8
   06ad: INC  000b        Inc field ptr (TOS+11)
   06af: SLDL 07          Short load local MP7
   06b0: IND  001e        Static index and load word (TOS+30)
   06b2: STO              Store indirect (TOS into TOS-1)
-> 06b3: SLDL 07          Short load local MP7
   06b4: INC  0012        Inc field ptr (TOS+18)
   06b6: SLDC 0c          Short load constant 12
   06b7: SLDC 04          Short load constant 4
   06b8: SLDC 00          Short load constant 0
   06b9: STP              Store packed field (TOS into TOS-1)
   06ba: SLDL 07          Short load local MP7
   06bb: INC  000f        Inc field ptr (TOS+15)
   06bd: SLDC 00          Short load constant 0
   06be: STO              Store indirect (TOS into TOS-1)
   06bf: SLDL 05          Short load local MP5
   06c0: SLDL 04          Short load local MP4
   06c1: IXA  000d        Index array (TOS-1 + TOS * 13)
   06c3: SLDL 07          Short load local MP7
   06c4: INC  0010        Inc field ptr (TOS+16)
   06c6: MOV  000d        Move 13 words (TOS to TOS-1)
-> 06c8: SLDL 07          Short load local MP7
   06c9: SIND 07          Short index load *TOS+7
   06ca: SLDL 05          Short load local MP5
   06cb: CXP  00 1f       Call external procedure PASCALSY.31
-> 06ce: SLDL 01          Short load local MP1
   06cf: SLDC 02          Short load constant 2
   06d0: EQUI             Integer TOS-1 = TOS
   06d1: FJP  $06e8       Jump if TOS false
   06d3: SLDL 07          Short load local MP7
   06d4: INC  0013        Inc field ptr (TOS+19)
   06d6: SLDC 00          Short load constant 0
   06d7: LDB              Load byte at byte ptr TOS-1 + TOS
   06d8: SLDC 00          Short load constant 0
   06d9: EQUI             Integer TOS-1 = TOS
   06da: FJP  $06e8       Jump if TOS false
   06dc: LDA  02 007e     Load addr G126
   06df: SLDL 07          Short load local MP7
   06e0: SIND 07          Short index load *TOS+7
   06e1: IXA  0006        Index array (TOS-1 + TOS * 6)
   06e3: LSA  00          Load string address: ''
   06e5: NOP              No operation
   06e6: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 06e8: SLDL 07          Short load local MP7
   06e9: INC  0002        Inc field ptr (TOS+2)
   06eb: SLDC 01          Short load constant 1
   06ec: STO              Store indirect (TOS into TOS-1)
   06ed: SLDL 07          Short load local MP7
   06ee: INC  0001        Inc field ptr (TOS+1)
   06f0: SLDC 01          Short load constant 1
   06f1: STO              Store indirect (TOS into TOS-1)
   06f2: SLDL 07          Short load local MP7
   06f3: INC  0005        Inc field ptr (TOS+5)
   06f5: SLDC 00          Short load constant 0
   06f6: STO              Store indirect (TOS into TOS-1)
-> 06f7: RNP  00          Return from nonbase procedure
END

### PROCEDURE FILEPROC.PROC8(PARAM1; PARAM2; PARAM3) (* P=8 LL=1 *)
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
-> 0712: NOP              No operation
   0713: LSA  01          Load string address: ' '
   0716: SLDL 03          Short load local MP3
   0717: SLDC 00          Short load constant 0
   0718: SLDC 00          Short load constant 0
   0719: CXP  00 1b       Call external procedure PASCALSY.SPOS
   071c: STL  0005        Store TOS into MP5
-> 071e: SLDL 05          Short load local MP5
   071f: SLDC 00          Short load constant 0
   0720: GRTI             Integer TOS-1 > TOS
   0721: FJP  $0737       Jump if TOS false
   0723: SLDL 03          Short load local MP3
   0724: SLDL 05          Short load local MP5
   0725: SLDC 01          Short load constant 1
   0726: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0729: LSA  01          Load string address: ' '
   072c: NOP              No operation
   072d: SLDL 03          Short load local MP3
   072e: SLDC 00          Short load constant 0
   072f: SLDC 00          Short load constant 0
   0730: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0733: STL  0005        Store TOS into MP5
   0735: UJP  $071e       Unconditional jump
-> 0737: SLDL 03          Short load local MP3
   0738: SLDC 00          Short load constant 0
   0739: LDB              Load byte at byte ptr TOS-1 + TOS
   073a: STL  0004        Store TOS into MP4
   073c: SLDL 04          Short load local MP4
   073d: SLDC 00          Short load constant 0
   073e: GRTI             Integer TOS-1 > TOS
   073f: FJP  $083e       Jump if TOS false
   0741: SLDL 03          Short load local MP3
   0742: SLDL 04          Short load local MP4
   0743: LDB              Load byte at byte ptr TOS-1 + TOS
   0744: SLDC 2e          Short load constant 46
   0745: NEQI             Integer TOS-1 <> TOS
   0746: FJP  $0838       Jump if TOS false
   0748: LLA  0006        Load local address MP6
   074a: NOP              No operation
   074b: LSA  00          Load string address: ''
   074d: SAS  28          String assign (TOS to TOS-1, 40 chars)
   074f: LLA  001e        Load local address MP30
   0751: LLA  0006        Load local address MP6
   0753: SAS  05          String assign (TOS to TOS-1, 5 chars)
   0755: LSA  01          Load string address: '['
   0758: NOP              No operation
   0759: SLDL 03          Short load local MP3
   075a: SLDC 00          Short load constant 0
   075b: SLDC 00          Short load constant 0
   075c: CXP  00 1b       Call external procedure PASCALSY.SPOS
   075f: STL  0005        Store TOS into MP5
   0761: SLDL 05          Short load local MP5
   0762: SLDC 00          Short load constant 0
   0763: GRTI             Integer TOS-1 > TOS
   0764: FJP  $0783       Jump if TOS false
   0766: SLDL 03          Short load local MP3
   0767: SLDC 00          Short load constant 0
   0768: LDB              Load byte at byte ptr TOS-1 + TOS
   0769: SLDL 05          Short load local MP5
   076a: SBI              Subtract integers (TOS-1 - TOS)
   076b: SLDC 01          Short load constant 1
   076c: ADI              Add integers (TOS + TOS-1)
   076d: STL  0004        Store TOS into MP4
   076f: LLA  0006        Load local address MP6
   0771: SLDL 03          Short load local MP3
   0772: LLA  0021        Load local address MP33
   0774: SLDL 05          Short load local MP5
   0775: SLDL 04          Short load local MP4
   0776: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0779: LLA  0021        Load local address MP33
   077b: SAS  28          String assign (TOS to TOS-1, 40 chars)
   077d: SLDL 03          Short load local MP3
   077e: SLDL 05          Short load local MP5
   077f: SLDL 04          Short load local MP4
   0780: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0783: SLDL 03          Short load local MP3
   0784: SLDC 00          Short load constant 0
   0785: LDB              Load byte at byte ptr TOS-1 + TOS
   0786: STL  0004        Store TOS into MP4
   0788: SLDL 04          Short load local MP4
   0789: SLDC 00          Short load constant 0
   078a: GRTI             Integer TOS-1 > TOS
   078b: FJP  $081f       Jump if TOS false
   078d: SLDL 03          Short load local MP3
   078e: SLDL 04          Short load local MP4
   078f: LDB              Load byte at byte ptr TOS-1 + TOS
   0790: SLDC 3a          Short load constant 58
   0791: NEQI             Integer TOS-1 <> TOS
   0792: FJP  $081f       Jump if TOS false
   0794: SLDL 02          Short load local MP2
   0795: FJP  $07a5       Jump if TOS false
   0797: LLA  001b        Load local address MP27
   0799: LSA  05          Load string address: '.TEXT'
   07a0: NOP              No operation
   07a1: SAS  05          String assign (TOS to TOS-1, 5 chars)
   07a3: UJP  $07b1       Unconditional jump
-> 07a5: LLA  001b        Load local address MP27
   07a7: LSA  05          Load string address: '.CODE'
   07ae: NOP              No operation
   07af: SAS  05          String assign (TOS to TOS-1, 5 chars)
-> 07b1: SLDC 01          Short load constant 1
   07b2: STL  0005        Store TOS into MP5
   07b4: SLDL 04          Short load local MP4
   07b5: STL  0021        Store TOS into MP33
-> 07b7: SLDL 05          Short load local MP5
   07b8: LDL  0021        Load local word MP33
   07ba: LEQI             Integer TOS-1 <= TOS
   07bb: FJP  $07e5       Jump if TOS false
   07bd: SLDL 03          Short load local MP3
   07be: SLDL 05          Short load local MP5
   07bf: LDB              Load byte at byte ptr TOS-1 + TOS
   07c2: LDC  08          Load multiple-word constant
                         07fffffe000000000000000000000000
   07d2: SLDC 08          Short load constant 8
   07d3: INN              Set membership (TOS-1 in set TOS)
   07d4: FJP  $07de       Jump if TOS false
   07d6: SLDL 03          Short load local MP3
   07d7: SLDL 05          Short load local MP5
   07d8: SLDL 03          Short load local MP3
   07d9: SLDL 05          Short load local MP5
   07da: LDB              Load byte at byte ptr TOS-1 + TOS
   07db: SLDC 20          Short load constant 32
   07dc: SBI              Subtract integers (TOS-1 - TOS)
   07dd: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 07de: SLDL 05          Short load local MP5
   07df: SLDC 01          Short load constant 1
   07e0: ADI              Add integers (TOS + TOS-1)
   07e1: STL  0005        Store TOS into MP5
   07e3: UJP  $07b7       Unconditional jump
-> 07e5: SLDL 04          Short load local MP4
   07e6: SLDC 05          Short load constant 5
   07e7: GRTI             Integer TOS-1 > TOS
   07e8: FJP  $07fc       Jump if TOS false
   07ea: LLA  001e        Load local address MP30
   07ec: SLDL 03          Short load local MP3
   07ed: LLA  0021        Load local address MP33
   07ef: SLDL 04          Short load local MP4
   07f0: SLDC 05          Short load constant 5
   07f1: SBI              Subtract integers (TOS-1 - TOS)
   07f2: SLDC 01          Short load constant 1
   07f3: ADI              Add integers (TOS + TOS-1)
   07f4: SLDC 05          Short load constant 5
   07f5: CXP  00 19       Call external procedure PASCALSY.SCOPY
   07f8: LLA  0021        Load local address MP33
   07fa: SAS  05          String assign (TOS to TOS-1, 5 chars)
-> 07fc: LLA  001e        Load local address MP30
   07fe: LLA  001b        Load local address MP27
   0800: NEQSTR           String TOS-1 <> TOS
   0802: SLDL 04          Short load local MP4
   0803: LLA  0006        Load local address MP6
   0805: SLDC 00          Short load constant 0
   0806: LDB              Load byte at byte ptr TOS-1 + TOS
   0807: ADI              Add integers (TOS + TOS-1)
   0808: SLDL 01          Short load local MP1
   0809: SLDC 05          Short load constant 5
   080a: SBI              Subtract integers (TOS-1 - TOS)
   080b: LEQI             Integer TOS-1 <= TOS
   080c: LAND             Logical AND (TOS & TOS-1)
   080d: FJP  $081f       Jump if TOS false
   080f: LLA  001b        Load local address MP27
   0811: SLDC 01          Short load constant 1
   0812: SLDL 03          Short load local MP3
   0813: SLDL 04          Short load local MP4
   0814: SLDC 01          Short load constant 1
   0815: ADI              Add integers (TOS + TOS-1)
   0816: SLDC 05          Short load constant 5
   0817: CSP  02          Call standard procedure MOVL
   0819: SLDL 03          Short load local MP3
   081a: SLDC 00          Short load constant 0
   081b: SLDL 04          Short load local MP4
   081c: SLDC 05          Short load constant 5
   081d: ADI              Add integers (TOS + TOS-1)
   081e: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 081f: SLDL 03          Short load local MP3
   0820: SLDC 00          Short load constant 0
   0821: STL  0021        Store TOS into MP33
   0823: LLA  0021        Load local address MP33
   0825: SLDL 03          Short load local MP3
   0826: SLDC 50          Short load constant 80
   0827: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   082a: LLA  0021        Load local address MP33
   082c: LLA  0006        Load local address MP6
   082e: SLDC 78          Short load constant 120
   082f: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0832: LLA  0021        Load local address MP33
   0834: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0836: UJP  $083e       Unconditional jump
-> 0838: SLDL 03          Short load local MP3
   0839: SLDC 00          Short load constant 0
   083a: SLDL 04          Short load local MP4
   083b: SLDC 01          Short load constant 1
   083c: SBI              Subtract integers (TOS-1 - TOS)
   083d: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 083e: RNP  00          Return from nonbase procedure
END

