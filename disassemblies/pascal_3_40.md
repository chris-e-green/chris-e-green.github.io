#  SYSTEM.PASCAL-03-40.bin 

## Segment Table
| slot |segNum | name | block | length | kind | textAddr | mType | version |
|-----:|------:|------|------:|-------:|------|---------:|-------|--------:|
| 0 | 0 | PASCALSY | 0001 | 1864 | linked | 0000 | 2 | 5 |
| 15 | 15 |  | 0005 | 4622 | linked | 0000 | 0 | 0 |
| 1 | 1 | USERPROG | 000F | 56 | linked | 0000 | 2 | 5 |
| 2 | 2 | FIOPRIMS | 0010 | 808 | linked_intrins | 0000 | 2 | 5 |
| 3 | 3 | PRINTERR | 0012 | 1108 | linked | 0000 | 2 | 5 |
| 4 | 4 | INITIALI | 0015 | 3140 | linked | 0000 | 2 | 5 |
| 5 | 5 | GETCMD | 001C | 6010 | linked | 0000 | 2 | 5 |
| 6 | 6 | FILEPROC | 0028 | 2246 | linked | 0000 | 2 | 5 |

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
-> 0000: SLDO 01          Short load global BASE1
   0001: SIND 01          Short index load *TOS+1
   0002: LNOT             Logical NOT (~TOS)
   0003: FJP  $000a       Jump if TOS false
   0005: SLDO 01          Short load global BASE1
   0006: CBP  07          Call base procedure PASCALSY.FGET
   0008: UJP  $0000       Unconditional jump
-> 000a: SLDO 01          Short load global BASE1
   000b: SIND 03          Short index load *TOS+3
   000c: SLDC 00          Short load constant 0
   000d: EQUI             Integer TOS-1 = TOS
   000e: FJP  $0015       Jump if TOS false
   0010: SLDO 01          Short load global BASE1
   0011: CBP  07          Call base procedure PASCALSY.FGET
   0013: UJP  $001f       Unconditional jump
-> 0015: SLDO 01          Short load global BASE1
   0016: INC  0003        Inc field ptr (TOS+3)
   0018: SLDC 01          Short load constant 1
   0019: STO              Store indirect (TOS into TOS-1)
   001a: SLDO 01          Short load global BASE1
   001b: INC  0001        Inc field ptr (TOS+1)
   001d: SLDC 00          Short load constant 0
   001e: STO              Store indirect (TOS into TOS-1)
-> 001f: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITELN(PARAM1) (* P=22 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 002e: SLDO 01          Short load global BASE1
   002f: SIND 00          Short index load *TOS+0
   0030: SLDC 00          Short load constant 0
   0031: SLDC 0d          Short load constant 13
   0032: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0033: SLDO 01          Short load global BASE1
   0034: CBP  08          Call base procedure PASCALSY.FPUT
-> 0036: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCONCAT(PARAM1; PARAM2; PARAM3) (* P=23 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 0042: SLDO 02          Short load global BASE2
   0043: SLDC 00          Short load constant 0
   0044: LDB              Load byte at byte ptr TOS-1 + TOS
   0045: SLDO 03          Short load global BASE3
   0046: SLDC 00          Short load constant 0
   0047: LDB              Load byte at byte ptr TOS-1 + TOS
   0048: ADI              Add integers (TOS + TOS-1)
   0049: SLDO 01          Short load global BASE1
   004a: LEQI             Integer TOS-1 <= TOS
   004b: FJP  $0064       Jump if TOS false
   004d: SLDO 02          Short load global BASE2
   004e: SLDC 01          Short load constant 1
   004f: SLDO 03          Short load global BASE3
   0050: SLDO 03          Short load global BASE3
   0051: SLDC 00          Short load constant 0
   0052: LDB              Load byte at byte ptr TOS-1 + TOS
   0053: SLDC 01          Short load constant 1
   0054: ADI              Add integers (TOS + TOS-1)
   0055: SLDO 02          Short load global BASE2
   0056: SLDC 00          Short load constant 0
   0057: LDB              Load byte at byte ptr TOS-1 + TOS
   0058: CSP  02          Call standard procedure MOVL
   005a: SLDO 03          Short load global BASE3
   005b: SLDC 00          Short load constant 0
   005c: SLDO 02          Short load global BASE2
   005d: SLDC 00          Short load constant 0
   005e: LDB              Load byte at byte ptr TOS-1 + TOS
   005f: SLDO 03          Short load global BASE3
   0060: SLDC 00          Short load constant 0
   0061: LDB              Load byte at byte ptr TOS-1 + TOS
   0062: ADI              Add integers (TOS + TOS-1)
   0063: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0064: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SINSERT(PARAM1; PARAM2; PARAM3; PARAM4) (* P=24 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
BEGIN
-> 0070: SLDO 01          Short load global BASE1
   0071: SLDC 00          Short load constant 0
   0072: GRTI             Integer TOS-1 > TOS
   0073: SLDO 04          Short load global BASE4
   0074: SLDC 00          Short load constant 0
   0075: LDB              Load byte at byte ptr TOS-1 + TOS
   0076: SLDC 00          Short load constant 0
   0077: GRTI             Integer TOS-1 > TOS
   0078: LAND             Logical AND (TOS & TOS-1)
   0079: SLDO 04          Short load global BASE4
   007a: SLDC 00          Short load constant 0
   007b: LDB              Load byte at byte ptr TOS-1 + TOS
   007c: SLDO 03          Short load global BASE3
   007d: SLDC 00          Short load constant 0
   007e: LDB              Load byte at byte ptr TOS-1 + TOS
   007f: ADI              Add integers (TOS + TOS-1)
   0080: SLDO 02          Short load global BASE2
   0081: LEQI             Integer TOS-1 <= TOS
   0082: LAND             Logical AND (TOS & TOS-1)
   0083: FJP  $00b9       Jump if TOS false
   0085: SLDO 03          Short load global BASE3
   0086: SLDC 00          Short load constant 0
   0087: LDB              Load byte at byte ptr TOS-1 + TOS
   0088: SLDO 01          Short load global BASE1
   0089: SBI              Subtract integers (TOS-1 - TOS)
   008a: SLDC 01          Short load constant 1
   008b: ADI              Add integers (TOS + TOS-1)
   008c: SRO  0005        Store global word BASE5
   008e: SLDO 05          Short load global BASE5
   008f: SLDC 00          Short load constant 0
   0090: GRTI             Integer TOS-1 > TOS
   0091: FJP  $00a1       Jump if TOS false
   0093: SLDO 03          Short load global BASE3
   0094: SLDO 01          Short load global BASE1
   0095: SLDO 03          Short load global BASE3
   0096: SLDO 01          Short load global BASE1
   0097: SLDO 04          Short load global BASE4
   0098: SLDC 00          Short load constant 0
   0099: LDB              Load byte at byte ptr TOS-1 + TOS
   009a: ADI              Add integers (TOS + TOS-1)
   009b: SLDO 05          Short load global BASE5
   009c: CSP  03          Call standard procedure MOVR
   009e: SLDC 00          Short load constant 0
   009f: SRO  0005        Store global word BASE5
-> 00a1: SLDO 05          Short load global BASE5
   00a2: SLDC 00          Short load constant 0
   00a3: EQUI             Integer TOS-1 = TOS
   00a4: FJP  $00b9       Jump if TOS false
   00a6: SLDO 04          Short load global BASE4
   00a7: SLDC 01          Short load constant 1
   00a8: SLDO 03          Short load global BASE3
   00a9: SLDO 01          Short load global BASE1
   00aa: SLDO 04          Short load global BASE4
   00ab: SLDC 00          Short load constant 0
   00ac: LDB              Load byte at byte ptr TOS-1 + TOS
   00ad: CSP  02          Call standard procedure MOVL
   00af: SLDO 03          Short load global BASE3
   00b0: SLDC 00          Short load constant 0
   00b1: SLDO 03          Short load global BASE3
   00b2: SLDC 00          Short load constant 0
   00b3: LDB              Load byte at byte ptr TOS-1 + TOS
   00b4: SLDO 04          Short load global BASE4
   00b5: SLDC 00          Short load constant 0
   00b6: LDB              Load byte at byte ptr TOS-1 + TOS
   00b7: ADI              Add integers (TOS + TOS-1)
   00b8: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 00b9: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCOPY(PARAM1; PARAM2; PARAM3; PARAM4) (* P=25 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
BEGIN
-> 00c6: SLDO 03          Short load global BASE3
   00c7: LSA  00          Load string address: ''
   00c9: NOP              No operation
   00ca: SAS  50          String assign (TOS to TOS-1, 80 chars)
   00cc: SLDO 02          Short load global BASE2
   00cd: SLDC 00          Short load constant 0
   00ce: GRTI             Integer TOS-1 > TOS
   00cf: SLDO 01          Short load global BASE1
   00d0: SLDC 00          Short load constant 0
   00d1: GRTI             Integer TOS-1 > TOS
   00d2: LAND             Logical AND (TOS & TOS-1)
   00d3: SLDO 02          Short load global BASE2
   00d4: SLDO 01          Short load global BASE1
   00d5: ADI              Add integers (TOS + TOS-1)
   00d6: SLDC 01          Short load constant 1
   00d7: SBI              Subtract integers (TOS-1 - TOS)
   00d8: SLDO 04          Short load global BASE4
   00d9: SLDC 00          Short load constant 0
   00da: LDB              Load byte at byte ptr TOS-1 + TOS
   00db: LEQI             Integer TOS-1 <= TOS
   00dc: LAND             Logical AND (TOS & TOS-1)
   00dd: FJP  $00ea       Jump if TOS false
   00df: SLDO 04          Short load global BASE4
   00e0: SLDO 02          Short load global BASE2
   00e1: SLDO 03          Short load global BASE3
   00e2: SLDC 01          Short load constant 1
   00e3: SLDO 01          Short load global BASE1
   00e4: CSP  02          Call standard procedure MOVL
   00e6: SLDO 03          Short load global BASE3
   00e7: SLDC 00          Short load constant 0
   00e8: SLDO 01          Short load global BASE1
   00e9: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 00ea: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SDELETE(PARAM1; PARAM2; PARAM3) (* P=26 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 00f6: SLDO 02          Short load global BASE2
   00f7: SLDC 00          Short load constant 0
   00f8: GRTI             Integer TOS-1 > TOS
   00f9: SLDO 01          Short load global BASE1
   00fa: SLDC 00          Short load constant 0
   00fb: GRTI             Integer TOS-1 > TOS
   00fc: LAND             Logical AND (TOS & TOS-1)
   00fd: FJP  $012d       Jump if TOS false
   00ff: SLDO 03          Short load global BASE3
   0100: SLDC 00          Short load constant 0
   0101: LDB              Load byte at byte ptr TOS-1 + TOS
   0102: SLDO 02          Short load global BASE2
   0103: SBI              Subtract integers (TOS-1 - TOS)
   0104: SLDO 01          Short load global BASE1
   0105: SBI              Subtract integers (TOS-1 - TOS)
   0106: SLDC 01          Short load constant 1
   0107: ADI              Add integers (TOS + TOS-1)
   0108: SRO  0004        Store global word BASE4
   010a: SLDO 04          Short load global BASE4
   010b: SLDC 00          Short load constant 0
   010c: EQUI             Integer TOS-1 = TOS
   010d: FJP  $0117       Jump if TOS false
   010f: SLDO 03          Short load global BASE3
   0110: SLDC 00          Short load constant 0
   0111: SLDO 02          Short load global BASE2
   0112: SLDC 01          Short load constant 1
   0113: SBI              Subtract integers (TOS-1 - TOS)
   0114: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0115: UJP  $012d       Unconditional jump
-> 0117: SLDO 04          Short load global BASE4
   0118: SLDC 00          Short load constant 0
   0119: GRTI             Integer TOS-1 > TOS
   011a: FJP  $012d       Jump if TOS false
   011c: SLDO 03          Short load global BASE3
   011d: SLDO 02          Short load global BASE2
   011e: SLDO 01          Short load global BASE1
   011f: ADI              Add integers (TOS + TOS-1)
   0120: SLDO 03          Short load global BASE3
   0121: SLDO 02          Short load global BASE2
   0122: SLDO 04          Short load global BASE4
   0123: CSP  02          Call standard procedure MOVL
   0125: SLDO 03          Short load global BASE3
   0126: SLDC 00          Short load constant 0
   0127: SLDO 03          Short load global BASE3
   0128: SLDC 00          Short load constant 0
   0129: LDB              Load byte at byte ptr TOS-1 + TOS
   012a: SLDO 01          Short load global BASE1
   012b: SBI              Subtract integers (TOS-1 - TOS)
   012c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 012d: RBP  00          Return from base procedure
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
-> 013a: SLDC 00          Short load constant 0
   013b: SRO  0001        Store global word BASE1
   013d: SLDO 04          Short load global BASE4
   013e: SLDC 00          Short load constant 0
   013f: LDB              Load byte at byte ptr TOS-1 + TOS
   0140: SLDC 00          Short load constant 0
   0141: GRTI             Integer TOS-1 > TOS
   0142: FJP  $0195       Jump if TOS false
   0144: SLDO 04          Short load global BASE4
   0145: SLDC 01          Short load constant 1
   0146: LDB              Load byte at byte ptr TOS-1 + TOS
   0147: SRO  0007        Store global word BASE7
   0149: SLDC 01          Short load constant 1
   014a: SRO  0006        Store global word BASE6
   014c: SLDO 03          Short load global BASE3
   014d: SLDC 00          Short load constant 0
   014e: LDB              Load byte at byte ptr TOS-1 + TOS
   014f: SLDO 04          Short load global BASE4
   0150: SLDC 00          Short load constant 0
   0151: LDB              Load byte at byte ptr TOS-1 + TOS
   0152: SBI              Subtract integers (TOS-1 - TOS)
   0153: SLDC 01          Short load constant 1
   0154: ADI              Add integers (TOS + TOS-1)
   0155: SRO  0005        Store global word BASE5
   0157: LAO  0008        Load global BASE8
   0159: SLDC 00          Short load constant 0
   015a: SLDO 04          Short load global BASE4
   015b: SLDC 00          Short load constant 0
   015c: LDB              Load byte at byte ptr TOS-1 + TOS
   015d: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 015e: SLDO 06          Short load global BASE6
   015f: SLDO 05          Short load global BASE5
   0160: LEQI             Integer TOS-1 <= TOS
   0161: FJP  $0195       Jump if TOS false
   0163: SLDO 06          Short load global BASE6
   0164: SLDO 05          Short load global BASE5
   0165: SLDO 06          Short load global BASE6
   0166: SBI              Subtract integers (TOS-1 - TOS)
   0167: SLDC 00          Short load constant 0
   0168: SLDO 07          Short load global BASE7
   0169: SLDO 03          Short load global BASE3
   016a: SLDO 06          Short load global BASE6
   016b: SLDC 00          Short load constant 0
   016c: CSP  0b          Call standard procedure SCAN
   016e: ADI              Add integers (TOS + TOS-1)
   016f: SRO  0006        Store global word BASE6
   0171: SLDO 06          Short load global BASE6
   0172: SLDO 05          Short load global BASE5
   0173: GRTI             Integer TOS-1 > TOS
   0174: FJP  $0178       Jump if TOS false
   0176: UJP  $0195       Unconditional jump
-> 0178: SLDO 03          Short load global BASE3
   0179: SLDO 06          Short load global BASE6
   017a: LAO  0008        Load global BASE8
   017c: SLDC 01          Short load constant 1
   017d: SLDO 04          Short load global BASE4
   017e: SLDC 00          Short load constant 0
   017f: LDB              Load byte at byte ptr TOS-1 + TOS
   0180: CSP  02          Call standard procedure MOVL
   0182: LAO  0008        Load global BASE8
   0184: SLDO 04          Short load global BASE4
   0185: EQLSTR           String TOS-1 = TOS
   0187: FJP  $018e       Jump if TOS false
   0189: SLDO 06          Short load global BASE6
   018a: SRO  0001        Store global word BASE1
   018c: UJP  $0195       Unconditional jump
-> 018e: SLDO 06          Short load global BASE6
   018f: SLDC 01          Short load constant 1
   0190: ADI              Add integers (TOS + TOS-1)
   0191: SRO  0006        Store global word BASE6
   0193: UJP  $015e       Unconditional jump
-> 0195: RBP  01          Return from base procedure
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
-> 01a4: SLDC 00          Short load constant 0
   01a5: SRO  0001        Store global word BASE1
   01a7: LOD  01 0001     Load word at G1 (SYSCOM)
   01aa: SLDC 00          Short load constant 0
   01ab: STO              Store indirect (TOS into TOS-1)
   01ac: SLDO 08          Short load global BASE8
   01ad: SRO  0009        Store global word BASE9
   01af: SLDO 09          Short load global BASE9
   01b0: SIND 05          Short index load *TOS+5
   01b1: SLDO 05          Short load global BASE5
   01b2: SLDC 00          Short load constant 0
   01b3: GEQI             Integer TOS-1 >= TOS
   01b4: LAND             Logical AND (TOS & TOS-1)
   01b5: FJP  $028d       Jump if TOS false
   01b7: SLDO 09          Short load global BASE9
   01b8: SIND 06          Short index load *TOS+6
   01b9: FJP  $0240       Jump if TOS false
   01bb: SLDO 09          Short load global BASE9
   01bc: INC  0010        Inc field ptr (TOS+16)
   01be: SRO  000a        Store global word BASE10
   01c0: SLDO 04          Short load global BASE4
   01c1: SLDC 00          Short load constant 0
   01c2: LESI             Integer TOS-1 < TOS
   01c3: FJP  $01ca       Jump if TOS false
   01c5: SLDO 09          Short load global BASE9
   01c6: IND  000d        Static index and load word (TOS+13)
   01c8: SRO  0004        Store global word BASE4
-> 01ca: SLDO 0a          Short load global BASE10
   01cb: SIND 00          Short index load *TOS+0
   01cc: SLDO 04          Short load global BASE4
   01cd: ADI              Add integers (TOS + TOS-1)
   01ce: SRO  0004        Store global word BASE4
   01d0: SLDO 04          Short load global BASE4
   01d1: SLDO 05          Short load global BASE5
   01d2: ADI              Add integers (TOS + TOS-1)
   01d3: SLDO 0a          Short load global BASE10
   01d4: SIND 01          Short index load *TOS+1
   01d5: GRTI             Integer TOS-1 > TOS
   01d6: FJP  $01e3       Jump if TOS false
   01d8: SLDO 03          Short load global BASE3
   01d9: LNOT             Logical NOT (~TOS)
   01da: FJP  $01e3       Jump if TOS false
   01dc: SLDO 08          Short load global BASE8
   01dd: SLDC 00          Short load constant 0
   01de: SLDC 00          Short load constant 0
   01df: CBP  31          Call base procedure PASCALSY.49
   01e1: FJP  $01e3       Jump if TOS false
-> 01e3: SLDO 04          Short load global BASE4
   01e4: SLDO 05          Short load global BASE5
   01e5: ADI              Add integers (TOS + TOS-1)
   01e6: SLDO 0a          Short load global BASE10
   01e7: SIND 01          Short index load *TOS+1
   01e8: GRTI             Integer TOS-1 > TOS
   01e9: FJP  $01f1       Jump if TOS false
   01eb: SLDO 0a          Short load global BASE10
   01ec: SIND 01          Short index load *TOS+1
   01ed: SLDO 04          Short load global BASE4
   01ee: SBI              Subtract integers (TOS-1 - TOS)
   01ef: SRO  0005        Store global word BASE5
-> 01f1: SLDO 09          Short load global BASE9
   01f2: INC  0002        Inc field ptr (TOS+2)
   01f4: SLDO 04          Short load global BASE4
   01f5: SLDO 0a          Short load global BASE10
   01f6: SIND 01          Short index load *TOS+1
   01f7: GEQI             Integer TOS-1 >= TOS
   01f8: STO              Store indirect (TOS into TOS-1)
   01f9: SLDO 09          Short load global BASE9
   01fa: SIND 02          Short index load *TOS+2
   01fb: LNOT             Logical NOT (~TOS)
   01fc: FJP  $023e       Jump if TOS false
   01fe: SLDO 09          Short load global BASE9
   01ff: SIND 07          Short index load *TOS+7
   0200: SLDO 07          Short load global BASE7
   0201: SLDO 06          Short load global BASE6
   0202: SLDO 05          Short load global BASE5
   0203: SLDO 04          Short load global BASE4
   0204: SLDO 03          Short load global BASE3
   0205: CLP  36          Call local procedure PASCALSY.54
   0207: CSP  22          Call standard procedure IORESULT
   0209: SLDC 00          Short load constant 0
   020a: EQUI             Integer TOS-1 = TOS
   020b: FJP  $023e       Jump if TOS false
   020d: SLDO 03          Short load global BASE3
   020e: LNOT             Logical NOT (~TOS)
   020f: FJP  $0216       Jump if TOS false
   0211: SLDO 09          Short load global BASE9
   0212: INC  000f        Inc field ptr (TOS+15)
   0214: SLDC 01          Short load constant 1
   0215: STO              Store indirect (TOS into TOS-1)
-> 0216: SLDO 05          Short load global BASE5
   0217: SRO  0001        Store global word BASE1
   0219: SLDO 04          Short load global BASE4
   021a: SLDO 05          Short load global BASE5
   021b: ADI              Add integers (TOS + TOS-1)
   021c: SRO  0004        Store global word BASE4
   021e: SLDO 09          Short load global BASE9
   021f: INC  0002        Inc field ptr (TOS+2)
   0221: SLDO 04          Short load global BASE4
   0222: SLDO 0a          Short load global BASE10
   0223: SIND 01          Short index load *TOS+1
   0224: EQUI             Integer TOS-1 = TOS
   0225: STO              Store indirect (TOS into TOS-1)
   0226: SLDO 09          Short load global BASE9
   0227: INC  000d        Inc field ptr (TOS+13)
   0229: SLDO 04          Short load global BASE4
   022a: SLDO 0a          Short load global BASE10
   022b: SIND 00          Short index load *TOS+0
   022c: SBI              Subtract integers (TOS-1 - TOS)
   022d: STO              Store indirect (TOS into TOS-1)
   022e: SLDO 09          Short load global BASE9
   022f: IND  000d        Static index and load word (TOS+13)
   0231: SLDO 09          Short load global BASE9
   0232: IND  000c        Static index and load word (TOS+12)
   0234: GRTI             Integer TOS-1 > TOS
   0235: FJP  $023e       Jump if TOS false
   0237: SLDO 09          Short load global BASE9
   0238: INC  000c        Inc field ptr (TOS+12)
   023a: SLDO 09          Short load global BASE9
   023b: IND  000d        Static index and load word (TOS+13)
   023d: STO              Store indirect (TOS into TOS-1)
-> 023e: UJP  $028b       Unconditional jump
-> 0240: SLDO 05          Short load global BASE5
   0241: SRO  0001        Store global word BASE1
   0243: SLDO 09          Short load global BASE9
   0244: SIND 07          Short index load *TOS+7
   0245: SLDO 07          Short load global BASE7
   0246: SLDO 06          Short load global BASE6
   0247: SLDO 05          Short load global BASE5
   0248: SLDO 04          Short load global BASE4
   0249: SLDO 03          Short load global BASE3
   024a: CLP  36          Call local procedure PASCALSY.54
   024c: CSP  22          Call standard procedure IORESULT
   024e: SLDC 00          Short load constant 0
   024f: EQUI             Integer TOS-1 = TOS
   0250: FJP  $0288       Jump if TOS false
   0252: SLDO 03          Short load global BASE3
   0253: FJP  $0286       Jump if TOS false
   0255: SLDO 05          Short load global BASE5
   0256: LDCI 0200        Load word 512
   0259: MPI              Multiply integers (TOS * TOS-1)
   025a: SRO  0004        Store global word BASE4
   025c: SLDO 04          Short load global BASE4
   025d: SLDO 04          Short load global BASE4
   025e: NGI              Negate integer
   025f: SLDC 01          Short load constant 1
   0260: SLDC 00          Short load constant 0
   0261: SLDO 07          Short load global BASE7
   0262: SLDO 06          Short load global BASE6
   0263: SLDO 04          Short load global BASE4
   0264: ADI              Add integers (TOS + TOS-1)
   0265: SLDC 01          Short load constant 1
   0266: SBI              Subtract integers (TOS-1 - TOS)
   0267: SLDC 00          Short load constant 0
   0268: CSP  0b          Call standard procedure SCAN
   026a: ADI              Add integers (TOS + TOS-1)
   026b: SRO  0004        Store global word BASE4
   026d: SLDO 04          Short load global BASE4
   026e: LDCI 0200        Load word 512
   0271: ADI              Add integers (TOS + TOS-1)
   0272: SLDC 01          Short load constant 1
   0273: SBI              Subtract integers (TOS-1 - TOS)
   0274: LDCI 0200        Load word 512
   0277: DVI              Divide integers (TOS-1 / TOS)
   0278: SRO  0004        Store global word BASE4
   027a: SLDO 04          Short load global BASE4
   027b: SRO  0001        Store global word BASE1
   027d: SLDO 09          Short load global BASE9
   027e: INC  0002        Inc field ptr (TOS+2)
   0280: SLDO 04          Short load global BASE4
   0281: SLDO 05          Short load global BASE5
   0282: LESI             Integer TOS-1 < TOS
   0283: STO              Store indirect (TOS into TOS-1)
   0284: UJP  $0286       Unconditional jump
-> 0286: UJP  $028b       Unconditional jump
-> 0288: SLDC 00          Short load constant 0
   0289: SRO  0001        Store global word BASE1
-> 028b: UJP  $0292       Unconditional jump
-> 028d: LOD  01 0001     Load word at G1 (SYSCOM)
   0290: SLDC 0d          Short load constant 13
   0291: STO              Store indirect (TOS into TOS-1)
-> 0292: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.FGOTOXY(PARAM1; PARAM2) (* P=29 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 02a2: LOD  01 0001     Load word at G1 (SYSCOM)
   02a5: INC  0025        Inc field ptr (TOS+37)
   02a7: SRO  0003        Store global word BASE3
   02a9: SLDO 02          Short load global BASE2
   02aa: SLDC 00          Short load constant 0
   02ab: LESI             Integer TOS-1 < TOS
   02ac: FJP  $02b1       Jump if TOS false
   02ae: SLDC 00          Short load constant 0
   02af: SRO  0002        Store global word BASE2
-> 02b1: SLDO 02          Short load global BASE2
   02b2: SLDO 03          Short load global BASE3
   02b3: SIND 01          Short index load *TOS+1
   02b4: GRTI             Integer TOS-1 > TOS
   02b5: FJP  $02bb       Jump if TOS false
   02b7: SLDO 03          Short load global BASE3
   02b8: SIND 01          Short index load *TOS+1
   02b9: SRO  0002        Store global word BASE2
-> 02bb: SLDO 01          Short load global BASE1
   02bc: SLDC 00          Short load constant 0
   02bd: LESI             Integer TOS-1 < TOS
   02be: FJP  $02c3       Jump if TOS false
   02c0: SLDC 00          Short load constant 0
   02c1: SRO  0001        Store global word BASE1
-> 02c3: SLDO 01          Short load global BASE1
   02c4: SLDO 03          Short load global BASE3
   02c5: SIND 00          Short index load *TOS+0
   02c6: GRTI             Integer TOS-1 > TOS
   02c7: FJP  $02cd       Jump if TOS false
   02c9: SLDO 03          Short load global BASE3
   02ca: SIND 00          Short index load *TOS+0
   02cb: SRO  0001        Store global word BASE1
-> 02cd: LOD  01 0003     Load word at G3 (OUTPUT)
   02d0: SLDC 1e          Short load constant 30
   02d1: SLDC 00          Short load constant 0
   02d2: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   02d5: LOD  01 0003     Load word at G3 (OUTPUT)
   02d8: SLDO 02          Short load global BASE2
   02d9: SLDC 20          Short load constant 32
   02da: ADI              Add integers (TOS + TOS-1)
   02db: SLDC 00          Short load constant 0
   02dc: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   02df: LOD  01 0003     Load word at G3 (OUTPUT)
   02e2: SLDO 01          Short load global BASE1
   02e3: SLDC 20          Short load constant 32
   02e4: ADI              Add integers (TOS + TOS-1)
   02e5: SLDC 00          Short load constant 0
   02e6: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 02e9: RBP  00          Return from base procedure
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
-> 02f6: SLDC 00          Short load constant 0
   02f7: SRO  0001        Store global word BASE1
   02f9: SLDO 03          Short load global BASE3
   02fa: LDCN             Load constant NIL
   02fb: STO              Store indirect (TOS into TOS-1)
   02fc: SLDC 00          Short load constant 0
   02fd: SRO  0008        Store global word BASE8
   02ff: SLDC 00          Short load constant 0
   0300: SRO  0007        Store global word BASE7
   0302: SLDO 05          Short load global BASE5
   0303: SLDC 00          Short load constant 0
   0304: LDB              Load byte at byte ptr TOS-1 + TOS
   0305: SLDC 00          Short load constant 0
   0306: GRTI             Integer TOS-1 > TOS
   0307: FJP  $0380       Jump if TOS false
   0309: SLDO 05          Short load global BASE5
   030a: SLDC 01          Short load constant 1
   030b: LDB              Load byte at byte ptr TOS-1 + TOS
   030c: SLDC 23          Short load constant 35
   030d: EQUI             Integer TOS-1 = TOS
   030e: SLDO 05          Short load global BASE5
   030f: SLDC 00          Short load constant 0
   0310: LDB              Load byte at byte ptr TOS-1 + TOS
   0311: SLDC 01          Short load constant 1
   0312: GRTI             Integer TOS-1 > TOS
   0313: LAND             Logical AND (TOS & TOS-1)
   0314: FJP  $035b       Jump if TOS false
   0316: SLDC 01          Short load constant 1
   0317: SRO  0008        Store global word BASE8
   0319: SLDC 00          Short load constant 0
   031a: SRO  0006        Store global word BASE6
   031c: SLDC 02          Short load constant 2
   031d: SRO  000a        Store global word BASE10
-> 031f: SLDO 05          Short load global BASE5
   0320: SLDO 0a          Short load global BASE10
   0321: LDB              Load byte at byte ptr TOS-1 + TOS
   0322: LDA  01 007a     Load addr G122
   0325: LDM  04          Load 4 words from (TOS)
   0327: SLDC 04          Short load constant 4
   0328: INN              Set membership (TOS-1 in set TOS)
   0329: FJP  $0338       Jump if TOS false
   032b: SLDO 06          Short load global BASE6
   032c: SLDC 0a          Short load constant 10
   032d: MPI              Multiply integers (TOS * TOS-1)
   032e: SLDO 05          Short load global BASE5
   032f: SLDO 0a          Short load global BASE10
   0330: LDB              Load byte at byte ptr TOS-1 + TOS
   0331: ADI              Add integers (TOS + TOS-1)
   0332: SLDC 30          Short load constant 48
   0333: SBI              Subtract integers (TOS-1 - TOS)
   0334: SRO  0006        Store global word BASE6
   0336: UJP  $033b       Unconditional jump
-> 0338: SLDC 00          Short load constant 0
   0339: SRO  0008        Store global word BASE8
-> 033b: SLDO 0a          Short load global BASE10
   033c: SLDC 01          Short load constant 1
   033d: ADI              Add integers (TOS + TOS-1)
   033e: SRO  000a        Store global word BASE10
   0340: SLDO 0a          Short load global BASE10
   0341: SLDO 05          Short load global BASE5
   0342: SLDC 00          Short load constant 0
   0343: LDB              Load byte at byte ptr TOS-1 + TOS
   0344: GRTI             Integer TOS-1 > TOS
   0345: SLDO 08          Short load global BASE8
   0346: LNOT             Logical NOT (~TOS)
   0347: LOR              Logical OR (TOS | TOS-1)
   0348: FJP  $031f       Jump if TOS false
   034a: SLDO 08          Short load global BASE8
   034b: SLDO 06          Short load global BASE6
   034c: SLDC 00          Short load constant 0
   034d: GRTI             Integer TOS-1 > TOS
   034e: LAND             Logical AND (TOS & TOS-1)
   034f: SLDO 06          Short load global BASE6
   0350: SLDC 14          Short load constant 20
   0351: LEQI             Integer TOS-1 <= TOS
   0352: LAND             Logical AND (TOS & TOS-1)
   0353: SRO  0007        Store global word BASE7
   0355: SLDO 04          Short load global BASE4
   0356: SLDO 07          Short load global BASE7
   0357: LNOT             Logical NOT (~TOS)
   0358: LAND             Logical AND (TOS & TOS-1)
   0359: SRO  0004        Store global word BASE4
-> 035b: SLDO 07          Short load global BASE7
   035c: LNOT             Logical NOT (~TOS)
   035d: FJP  $0380       Jump if TOS false
   035f: SLDC 00          Short load constant 0
   0360: SRO  0008        Store global word BASE8
   0362: SLDC 14          Short load constant 20
   0363: SRO  0006        Store global word BASE6
-> 0365: SLDO 05          Short load global BASE5
   0366: LDA  01 007e     Load addr G126
   0369: SLDO 06          Short load global BASE6
   036a: IXA  0006        Index array (TOS-1 + TOS * 6)
   036c: EQLSTR           String TOS-1 = TOS
   036e: SRO  0008        Store global word BASE8
   0370: SLDO 08          Short load global BASE8
   0371: LNOT             Logical NOT (~TOS)
   0372: FJP  $0379       Jump if TOS false
   0374: SLDO 06          Short load global BASE6
   0375: SLDC 01          Short load constant 1
   0376: SBI              Subtract integers (TOS-1 - TOS)
   0377: SRO  0006        Store global word BASE6
-> 0379: SLDO 08          Short load global BASE8
   037a: SLDO 06          Short load global BASE6
   037b: SLDC 00          Short load constant 0
   037c: EQUI             Integer TOS-1 = TOS
   037d: LOR              Logical OR (TOS | TOS-1)
   037e: FJP  $0365       Jump if TOS false
-> 0380: SLDO 08          Short load global BASE8
   0381: FJP  $03e3       Jump if TOS false
   0383: LDA  01 007e     Load addr G126
   0386: SLDO 06          Short load global BASE6
   0387: IXA  0006        Index array (TOS-1 + TOS * 6)
   0389: SIND 04          Short index load *TOS+4
   038a: FJP  $03e3       Jump if TOS false
   038c: LOD  01 0001     Load word at G1 (SYSCOM)
   038f: SRO  000b        Store global word BASE11
   0391: SLDC 00          Short load constant 0
   0392: SRO  0008        Store global word BASE8
   0394: SLDO 0b          Short load global BASE11
   0395: SIND 04          Short index load *TOS+4
   0396: LDCN             Load constant NIL
   0397: NEQI             Integer TOS-1 <> TOS
   0398: FJP  $03bb       Jump if TOS false
   039a: SLDO 05          Short load global BASE5
   039b: SLDO 0b          Short load global BASE11
   039c: SIND 04          Short index load *TOS+4
   039d: SLDC 00          Short load constant 0
   039e: IXA  000d        Index array (TOS-1 + TOS * 13)
   03a0: INC  0003        Inc field ptr (TOS+3)
   03a2: EQLSTR           String TOS-1 = TOS
   03a4: FJP  $03bb       Jump if TOS false
   03a6: LAO  000a        Load global BASE10
   03a8: LAO  0009        Load global BASE9
   03aa: CSP  09          Call standard procedure TIME
   03ac: SLDO 09          Short load global BASE9
   03ad: SLDO 0b          Short load global BASE11
   03ae: SIND 04          Short index load *TOS+4
   03af: SLDC 00          Short load constant 0
   03b0: IXA  000d        Index array (TOS-1 + TOS * 13)
   03b2: IND  0009        Static index and load word (TOS+9)
   03b4: SBI              Subtract integers (TOS-1 - TOS)
   03b5: LDCI 012c        Load word 300
   03b8: LEQI             Integer TOS-1 <= TOS
   03b9: SRO  0008        Store global word BASE8
-> 03bb: SLDO 08          Short load global BASE8
   03bc: LNOT             Logical NOT (~TOS)
   03bd: FJP  $03e3       Jump if TOS false
   03bf: SLDO 07          Short load global BASE7
   03c0: SRO  0008        Store global word BASE8
   03c2: SLDO 06          Short load global BASE6
   03c3: SLDC 00          Short load constant 0
   03c4: SLDC 00          Short load constant 0
   03c5: CBP  2a          Call base procedure PASCALSY.42
   03c7: FJP  $03dd       Jump if TOS false
   03c9: SLDO 07          Short load global BASE7
   03ca: LNOT             Logical NOT (~TOS)
   03cb: FJP  $03db       Jump if TOS false
   03cd: SLDO 05          Short load global BASE5
   03ce: SLDO 0b          Short load global BASE11
   03cf: SIND 04          Short index load *TOS+4
   03d0: SLDC 00          Short load constant 0
   03d1: IXA  000d        Index array (TOS-1 + TOS * 13)
   03d3: INC  0003        Inc field ptr (TOS+3)
   03d5: EQLSTR           String TOS-1 = TOS
   03d7: SRO  0008        Store global word BASE8
   03d9: UJP  $03db       Unconditional jump
-> 03db: UJP  $03e3       Unconditional jump
-> 03dd: CSP  22          Call standard procedure IORESULT
   03df: SLDC 00          Short load constant 0
   03e0: EQUI             Integer TOS-1 = TOS
   03e1: SRO  0008        Store global word BASE8
-> 03e3: SLDO 08          Short load global BASE8
   03e4: LNOT             Logical NOT (~TOS)
   03e5: SLDO 04          Short load global BASE4
   03e6: LAND             Logical AND (TOS & TOS-1)
   03e7: FJP  $0415       Jump if TOS false
   03e9: SLDC 14          Short load constant 20
   03ea: SRO  0006        Store global word BASE6
-> 03ec: LDA  01 007e     Load addr G126
   03ef: SLDO 06          Short load global BASE6
   03f0: IXA  0006        Index array (TOS-1 + TOS * 6)
   03f2: SRO  000b        Store global word BASE11
   03f4: SLDO 0b          Short load global BASE11
   03f5: SIND 04          Short index load *TOS+4
   03f6: FJP  $0405       Jump if TOS false
   03f8: SLDO 06          Short load global BASE6
   03f9: SLDC 00          Short load constant 0
   03fa: SLDC 00          Short load constant 0
   03fb: CBP  2a          Call base procedure PASCALSY.42
   03fd: FJP  $0405       Jump if TOS false
   03ff: SLDO 05          Short load global BASE5
   0400: SLDO 0b          Short load global BASE11
   0401: EQLSTR           String TOS-1 = TOS
   0403: SRO  0008        Store global word BASE8
-> 0405: SLDO 08          Short load global BASE8
   0406: LNOT             Logical NOT (~TOS)
   0407: FJP  $040e       Jump if TOS false
   0409: SLDO 06          Short load global BASE6
   040a: SLDC 01          Short load constant 1
   040b: SBI              Subtract integers (TOS-1 - TOS)
   040c: SRO  0006        Store global word BASE6
-> 040e: SLDO 08          Short load global BASE8
   040f: SLDO 06          Short load global BASE6
   0410: SLDC 00          Short load constant 0
   0411: EQUI             Integer TOS-1 = TOS
   0412: LOR              Logical OR (TOS | TOS-1)
   0413: FJP  $03ec       Jump if TOS false
-> 0415: SLDO 08          Short load global BASE8
   0416: FJP  $044a       Jump if TOS false
   0418: LDA  01 007e     Load addr G126
   041b: SLDO 06          Short load global BASE6
   041c: IXA  0006        Index array (TOS-1 + TOS * 6)
   041e: SRO  000b        Store global word BASE11
   0420: SLDO 06          Short load global BASE6
   0421: SRO  0001        Store global word BASE1
   0423: SLDO 0b          Short load global BASE11
   0424: SLDC 00          Short load constant 0
   0425: LDB              Load byte at byte ptr TOS-1 + TOS
   0426: SLDC 00          Short load constant 0
   0427: GRTI             Integer TOS-1 > TOS
   0428: FJP  $042e       Jump if TOS false
   042a: SLDO 05          Short load global BASE5
   042b: SLDO 0b          Short load global BASE11
   042c: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 042e: SLDO 0b          Short load global BASE11
   042f: SIND 04          Short index load *TOS+4
   0430: LOD  01 0001     Load word at G1 (SYSCOM)
   0433: SIND 04          Short index load *TOS+4
   0434: LDCN             Load constant NIL
   0435: NEQI             Integer TOS-1 <> TOS
   0436: LAND             Logical AND (TOS & TOS-1)
   0437: FJP  $044a       Jump if TOS false
   0439: SLDO 03          Short load global BASE3
   043a: LOD  01 0001     Load word at G1 (SYSCOM)
   043d: SIND 04          Short index load *TOS+4
   043e: STO              Store indirect (TOS into TOS-1)
   043f: LAO  000a        Load global BASE10
   0441: SLDO 03          Short load global BASE3
   0442: SIND 00          Short index load *TOS+0
   0443: SLDC 00          Short load constant 0
   0444: IXA  000d        Index array (TOS-1 + TOS * 13)
   0446: INC  0009        Inc field ptr (TOS+9)
   0448: CSP  09          Call standard procedure TIME
-> 044a: RBP  01          Return from base procedure
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
-> 045c: LDA  01 007e     Load addr G126
   045f: SLDO 02          Short load global BASE2
   0460: IXA  0006        Index array (TOS-1 + TOS * 6)
   0462: SRO  0013        Store global word BASE19
   0464: SLDO 01          Short load global BASE1
   0465: SLDC 00          Short load constant 0
   0466: IXA  000d        Index array (TOS-1 + TOS * 13)
   0468: SRO  0014        Store global word BASE20
   046a: LDO  0013        Load global word BASE19
   046c: LDO  0014        Load global word BASE20
   046e: INC  0003        Inc field ptr (TOS+3)
   0470: EQLSTR           String TOS-1 = TOS
   0472: LDO  0014        Load global word BASE20
   0474: INC  0002        Inc field ptr (TOS+2)
   0476: SLDC 04          Short load constant 4
   0477: SLDC 00          Short load constant 0
   0478: LDP              Load packed field (TOS)
   0479: SLDC 00          Short load constant 0
   047a: EQUI             Integer TOS-1 = TOS
   047b: LDO  0014        Load global word BASE20
   047d: INC  0002        Inc field ptr (TOS+2)
   047f: SLDC 04          Short load constant 4
   0480: SLDC 00          Short load constant 0
   0481: LDP              Load packed field (TOS)
   0482: SLDC 08          Short load constant 8
   0483: EQUI             Integer TOS-1 = TOS
   0484: LOR              Logical OR (TOS | TOS-1)
   0485: LAND             Logical AND (TOS & TOS-1)
   0486: SRO  0005        Store global word BASE5
   0488: SLDO 05          Short load global BASE5
   0489: FJP  $0509       Jump if TOS false
   048b: LAO  0004        Load global BASE4
   048d: LAO  0003        Load global BASE3
   048f: CSP  09          Call standard procedure TIME
   0491: SLDO 03          Short load global BASE3
   0492: LDO  0014        Load global word BASE20
   0494: IND  0009        Static index and load word (TOS+9)
   0496: SBI              Subtract integers (TOS-1 - TOS)
   0497: LDCI 012c        Load word 300
   049a: LEQI             Integer TOS-1 <= TOS
   049b: SLDO 03          Short load global BASE3
   049c: LDO  0014        Load global word BASE20
   049e: IND  0009        Static index and load word (TOS+9)
   04a0: SBI              Subtract integers (TOS-1 - TOS)
   04a1: SLDC 00          Short load constant 0
   04a2: GEQI             Integer TOS-1 >= TOS
   04a3: LAND             Logical AND (TOS & TOS-1)
   04a4: LOD  01 0001     Load word at G1 (SYSCOM)
   04a7: INC  001d        Inc field ptr (TOS+29)
   04a9: SLDC 01          Short load constant 1
   04aa: SLDC 00          Short load constant 0
   04ab: LDP              Load packed field (TOS)
   04ac: LAND             Logical AND (TOS & TOS-1)
   04ad: SRO  0005        Store global word BASE5
   04af: SLDO 05          Short load global BASE5
   04b0: LNOT             Logical NOT (~TOS)
   04b1: FJP  $04cc       Jump if TOS false
   04b3: SLDO 02          Short load global BASE2
   04b4: LAO  0006        Load global BASE6
   04b6: SLDC 00          Short load constant 0
   04b7: SLDC 1a          Short load constant 26
   04b8: SLDC 02          Short load constant 2
   04b9: SLDC 00          Short load constant 0
   04ba: CSP  05          Call standard procedure UNITREAD
   04bc: CSP  22          Call standard procedure IORESULT
   04be: SLDC 00          Short load constant 0
   04bf: EQUI             Integer TOS-1 = TOS
   04c0: FJP  $04cc       Jump if TOS false
   04c2: LDO  0014        Load global word BASE20
   04c4: INC  0003        Inc field ptr (TOS+3)
   04c6: LAO  0009        Load global BASE9
   04c8: EQLSTR           String TOS-1 = TOS
   04ca: SRO  0005        Store global word BASE5
-> 04cc: SLDO 05          Short load global BASE5
   04cd: FJP  $0509       Jump if TOS false
   04cf: LDO  0014        Load global word BASE20
   04d1: SLDC 00          Short load constant 0
   04d2: STO              Store indirect (TOS into TOS-1)
   04d3: SLDO 02          Short load global BASE2
   04d4: SLDO 01          Short load global BASE1
   04d5: SLDC 00          Short load constant 0
   04d6: LDO  0014        Load global word BASE20
   04d8: IND  0008        Static index and load word (TOS+8)
   04da: SLDC 01          Short load constant 1
   04db: ADI              Add integers (TOS + TOS-1)
   04dc: SLDC 1a          Short load constant 26
   04dd: MPI              Multiply integers (TOS * TOS-1)
   04de: SLDC 02          Short load constant 2
   04df: SLDC 00          Short load constant 0
   04e0: CSP  06          Call standard procedure UNITWRITE
   04e2: CSP  22          Call standard procedure IORESULT
   04e4: SLDC 00          Short load constant 0
   04e5: EQUI             Integer TOS-1 = TOS
   04e6: SRO  0005        Store global word BASE5
   04e8: LDO  0014        Load global word BASE20
   04ea: SIND 01          Short index load *TOS+1
   04eb: SLDC 0a          Short load constant 10
   04ec: EQUI             Integer TOS-1 = TOS
   04ed: FJP  $04fe       Jump if TOS false
   04ef: SLDO 02          Short load global BASE2
   04f0: SLDO 01          Short load global BASE1
   04f1: SLDC 00          Short load constant 0
   04f2: LDO  0014        Load global word BASE20
   04f4: IND  0008        Static index and load word (TOS+8)
   04f6: SLDC 01          Short load constant 1
   04f7: ADI              Add integers (TOS + TOS-1)
   04f8: SLDC 1a          Short load constant 26
   04f9: MPI              Multiply integers (TOS * TOS-1)
   04fa: SLDC 06          Short load constant 6
   04fb: SLDC 00          Short load constant 0
   04fc: CSP  06          Call standard procedure UNITWRITE
-> 04fe: SLDO 05          Short load global BASE5
   04ff: FJP  $0509       Jump if TOS false
   0501: LAO  0004        Load global BASE4
   0503: LDO  0014        Load global word BASE20
   0505: INC  0009        Inc field ptr (TOS+9)
   0507: CSP  09          Call standard procedure TIME
-> 0509: SLDO 05          Short load global BASE5
   050a: LNOT             Logical NOT (~TOS)
   050b: FJP  $051c       Jump if TOS false
   050d: LDO  0013        Load global word BASE19
   050f: LSA  00          Load string address: ''
   0511: NOP              No operation
   0512: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0514: LDO  0013        Load global word BASE19
   0516: INC  0005        Inc field ptr (TOS+5)
   0518: LDCI 7fff        Load word 32767
   051b: STO              Store indirect (TOS into TOS-1)
-> 051c: RBP  00          Return from base procedure
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
-> 0528: SLDC 00          Short load constant 0
   0529: SRO  0001        Store global word BASE1
   052b: SLDC 00          Short load constant 0
   052c: SRO  0007        Store global word BASE7
   052e: SLDC 01          Short load constant 1
   052f: SRO  0006        Store global word BASE6
-> 0531: SLDO 06          Short load global BASE6
   0532: SLDO 03          Short load global BASE3
   0533: SLDC 00          Short load constant 0
   0534: IXA  000d        Index array (TOS-1 + TOS * 13)
   0536: IND  0008        Static index and load word (TOS+8)
   0538: LEQI             Integer TOS-1 <= TOS
   0539: SLDO 07          Short load global BASE7
   053a: LNOT             Logical NOT (~TOS)
   053b: LAND             Logical AND (TOS & TOS-1)
   053c: FJP  $0566       Jump if TOS false
   053e: SLDO 03          Short load global BASE3
   053f: SLDO 06          Short load global BASE6
   0540: IXA  000d        Index array (TOS-1 + TOS * 13)
   0542: SRO  0008        Store global word BASE8
   0544: SLDO 08          Short load global BASE8
   0545: INC  0003        Inc field ptr (TOS+3)
   0547: SLDO 05          Short load global BASE5
   0548: EQLSTR           String TOS-1 = TOS
   054a: FJP  $055f       Jump if TOS false
   054c: SLDO 04          Short load global BASE4
   054d: SLDO 08          Short load global BASE8
   054e: INC  000c        Inc field ptr (TOS+12)
   0550: SLDC 07          Short load constant 7
   0551: SLDC 09          Short load constant 9
   0552: LDP              Load packed field (TOS)
   0553: SLDC 64          Short load constant 100
   0554: NEQI             Integer TOS-1 <> TOS
   0555: EQLBOOL          Boolean TOS-1 = TOS
   0557: FJP  $055f       Jump if TOS false
   0559: SLDO 06          Short load global BASE6
   055a: SRO  0001        Store global word BASE1
   055c: SLDC 01          Short load constant 1
   055d: SRO  0007        Store global word BASE7
-> 055f: SLDO 06          Short load global BASE6
   0560: SLDC 01          Short load constant 1
   0561: ADI              Add integers (TOS + TOS-1)
   0562: SRO  0006        Store global word BASE6
   0564: UJP  $0531       Unconditional jump
-> 0566: RBP  01          Return from base procedure
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
-> 0574: LAO  0008        Load global BASE8
   0576: SLDO 07          Short load global BASE7
   0577: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0579: SLDO 06          Short load global BASE6
   057a: NOP              No operation
   057b: LSA  00          Load string address: ''
   057d: SAS  07          String assign (TOS to TOS-1, 7 chars)
   057f: SLDO 05          Short load global BASE5
   0580: NOP              No operation
   0581: LSA  00          Load string address: ''
   0583: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0585: SLDO 04          Short load global BASE4
   0586: SLDC 00          Short load constant 0
   0587: STO              Store indirect (TOS into TOS-1)
   0588: SLDO 03          Short load global BASE3
   0589: SLDC 00          Short load constant 0
   058a: STO              Store indirect (TOS into TOS-1)
   058b: SLDC 00          Short load constant 0
   058c: SRO  0001        Store global word BASE1
   058e: SLDC 01          Short load constant 1
   058f: SRO  0032        Store global word BASE50
-> 0591: LDO  0032        Load global word BASE50
   0593: LAO  0008        Load global BASE8
   0595: SLDC 00          Short load constant 0
   0596: LDB              Load byte at byte ptr TOS-1 + TOS
   0597: LEQI             Integer TOS-1 <= TOS
   0598: FJP  $05cf       Jump if TOS false
   059a: LAO  0008        Load global BASE8
   059c: LDO  0032        Load global word BASE50
   059e: LDB              Load byte at byte ptr TOS-1 + TOS
   059f: SRO  0033        Store global word BASE51
   05a1: LDO  0033        Load global word BASE51
   05a3: SLDC 20          Short load constant 32
   05a4: LEQI             Integer TOS-1 <= TOS
   05a5: FJP  $05b1       Jump if TOS false
   05a7: LAO  0008        Load global BASE8
   05a9: LDO  0032        Load global word BASE50
   05ab: SLDC 01          Short load constant 1
   05ac: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   05af: UJP  $05cd       Unconditional jump
-> 05b1: LDO  0033        Load global word BASE51
   05b3: SLDC 61          Short load constant 97
   05b4: GEQI             Integer TOS-1 >= TOS
   05b5: LDO  0033        Load global word BASE51
   05b7: SLDC 7a          Short load constant 122
   05b8: LEQI             Integer TOS-1 <= TOS
   05b9: LAND             Logical AND (TOS & TOS-1)
   05ba: FJP  $05c7       Jump if TOS false
   05bc: LAO  0008        Load global BASE8
   05be: LDO  0032        Load global word BASE50
   05c0: LDO  0033        Load global word BASE51
   05c2: SLDC 61          Short load constant 97
   05c3: SBI              Subtract integers (TOS-1 - TOS)
   05c4: SLDC 41          Short load constant 65
   05c5: ADI              Add integers (TOS + TOS-1)
   05c6: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 05c7: LDO  0032        Load global word BASE50
   05c9: SLDC 01          Short load constant 1
   05ca: ADI              Add integers (TOS + TOS-1)
   05cb: SRO  0032        Store global word BASE50
-> 05cd: UJP  $0591       Unconditional jump
-> 05cf: LAO  0008        Load global BASE8
   05d1: SLDC 00          Short load constant 0
   05d2: LDB              Load byte at byte ptr TOS-1 + TOS
   05d3: SLDC 00          Short load constant 0
   05d4: GRTI             Integer TOS-1 > TOS
   05d5: FJP  $07b3       Jump if TOS false
   05d7: LAO  0008        Load global BASE8
   05d9: SLDC 01          Short load constant 1
   05da: LDB              Load byte at byte ptr TOS-1 + TOS
   05db: SLDC 2a          Short load constant 42
   05dc: EQUI             Integer TOS-1 = TOS
   05dd: FJP  $05ee       Jump if TOS false
   05df: SLDO 06          Short load global BASE6
   05e0: LDA  01 003f     Load addr G63
   05e3: SAS  07          String assign (TOS to TOS-1, 7 chars)
   05e5: LAO  0008        Load global BASE8
   05e7: SLDC 01          Short load constant 1
   05e8: SLDC 01          Short load constant 1
   05e9: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   05ec: UJP  $0604       Unconditional jump
-> 05ee: LAO  0008        Load global BASE8
   05f0: SLDC 01          Short load constant 1
   05f1: LDB              Load byte at byte ptr TOS-1 + TOS
   05f2: SLDC 25          Short load constant 37
   05f3: EQUI             Integer TOS-1 = TOS
   05f4: FJP  $0604       Jump if TOS false
   05f6: SLDO 06          Short load global BASE6
   05f7: LDA  01 01bc     Load addr G444
   05fb: SAS  07          String assign (TOS to TOS-1, 7 chars)
   05fd: LAO  0008        Load global BASE8
   05ff: SLDC 01          Short load constant 1
   0600: SLDC 01          Short load constant 1
   0601: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0604: NOP              No operation
   0605: LSA  01          Load string address: ':'
   0608: LAO  0008        Load global BASE8
   060a: SLDC 00          Short load constant 0
   060b: SLDC 00          Short load constant 0
   060c: CXP  00 1b       Call external procedure PASCALSY.SPOS
   060f: SRO  0032        Store global word BASE50
   0611: LDO  0032        Load global word BASE50
   0613: SLDC 01          Short load constant 1
   0614: LEQI             Integer TOS-1 <= TOS
   0615: FJP  $0633       Jump if TOS false
   0617: SLDO 06          Short load global BASE6
   0618: SLDC 00          Short load constant 0
   0619: LDB              Load byte at byte ptr TOS-1 + TOS
   061a: SLDC 00          Short load constant 0
   061b: EQUI             Integer TOS-1 = TOS
   061c: FJP  $0624       Jump if TOS false
   061e: SLDO 06          Short load global BASE6
   061f: LDA  01 003b     Load addr G59
   0622: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0624: LDO  0032        Load global word BASE50
   0626: SLDC 01          Short load constant 1
   0627: EQUI             Integer TOS-1 = TOS
   0628: FJP  $0631       Jump if TOS false
   062a: LAO  0008        Load global BASE8
   062c: SLDC 01          Short load constant 1
   062d: SLDC 01          Short load constant 1
   062e: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0631: UJP  $0654       Unconditional jump
-> 0633: LDO  0032        Load global word BASE50
   0635: SLDC 01          Short load constant 1
   0636: SBI              Subtract integers (TOS-1 - TOS)
   0637: SLDC 07          Short load constant 7
   0638: LEQI             Integer TOS-1 <= TOS
   0639: FJP  $0654       Jump if TOS false
   063b: SLDO 06          Short load global BASE6
   063c: LAO  0008        Load global BASE8
   063e: LAO  0035        Load global BASE53
   0640: SLDC 01          Short load constant 1
   0641: LDO  0032        Load global word BASE50
   0643: SLDC 01          Short load constant 1
   0644: SBI              Subtract integers (TOS-1 - TOS)
   0645: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0648: LAO  0035        Load global BASE53
   064a: SAS  07          String assign (TOS to TOS-1, 7 chars)
   064c: LAO  0008        Load global BASE8
   064e: SLDC 01          Short load constant 1
   064f: LDO  0032        Load global word BASE50
   0651: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0654: SLDO 06          Short load global BASE6
   0655: SLDC 00          Short load constant 0
   0656: LDB              Load byte at byte ptr TOS-1 + TOS
   0657: SLDC 00          Short load constant 0
   0658: GRTI             Integer TOS-1 > TOS
   0659: FJP  $07b3       Jump if TOS false
   065b: LSA  01          Load string address: '['
   065e: NOP              No operation
   065f: LAO  0008        Load global BASE8
   0661: SLDC 00          Short load constant 0
   0662: SLDC 00          Short load constant 0
   0663: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0666: SRO  0032        Store global word BASE50
   0668: LDO  0032        Load global word BASE50
   066a: SLDC 00          Short load constant 0
   066b: GRTI             Integer TOS-1 > TOS
   066c: FJP  $0676       Jump if TOS false
   066e: LDO  0032        Load global word BASE50
   0670: SLDC 01          Short load constant 1
   0671: SBI              Subtract integers (TOS-1 - TOS)
   0672: SRO  0032        Store global word BASE50
   0674: UJP  $067c       Unconditional jump
-> 0676: LAO  0008        Load global BASE8
   0678: SLDC 00          Short load constant 0
   0679: LDB              Load byte at byte ptr TOS-1 + TOS
   067a: SRO  0032        Store global word BASE50
-> 067c: LDO  0032        Load global word BASE50
   067e: SLDC 0f          Short load constant 15
   067f: LEQI             Integer TOS-1 <= TOS
   0680: FJP  $07b3       Jump if TOS false
   0682: LDO  0032        Load global word BASE50
   0684: SLDC 00          Short load constant 0
   0685: GRTI             Integer TOS-1 > TOS
   0686: FJP  $069f       Jump if TOS false
   0688: SLDO 05          Short load global BASE5
   0689: LAO  0008        Load global BASE8
   068b: LAO  0035        Load global BASE53
   068d: SLDC 01          Short load constant 1
   068e: LDO  0032        Load global word BASE50
   0690: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0693: LAO  0035        Load global BASE53
   0695: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0697: LAO  0008        Load global BASE8
   0699: SLDC 01          Short load constant 1
   069a: LDO  0032        Load global word BASE50
   069c: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 069f: LAO  0008        Load global BASE8
   06a1: SLDC 00          Short load constant 0
   06a2: LDB              Load byte at byte ptr TOS-1 + TOS
   06a3: SLDC 00          Short load constant 0
   06a4: EQUI             Integer TOS-1 = TOS
   06a5: FJP  $06ac       Jump if TOS false
   06a7: SLDC 01          Short load constant 1
   06a8: SRO  0034        Store global word BASE52
   06aa: UJP  $0723       Unconditional jump
-> 06ac: SLDC 00          Short load constant 0
   06ad: SRO  0034        Store global word BASE52
   06af: LSA  01          Load string address: ']'
   06b2: NOP              No operation
   06b3: LAO  0008        Load global BASE8
   06b5: SLDC 00          Short load constant 0
   06b6: SLDC 00          Short load constant 0
   06b7: CXP  00 1b       Call external procedure PASCALSY.SPOS
   06ba: SRO  0031        Store global word BASE49
   06bc: LDO  0031        Load global word BASE49
   06be: SLDC 02          Short load constant 2
   06bf: EQUI             Integer TOS-1 = TOS
   06c0: FJP  $06c7       Jump if TOS false
   06c2: SLDC 01          Short load constant 1
   06c3: SRO  0034        Store global word BASE52
   06c5: UJP  $0723       Unconditional jump
-> 06c7: LDO  0031        Load global word BASE49
   06c9: SLDC 02          Short load constant 2
   06ca: GRTI             Integer TOS-1 > TOS
   06cb: FJP  $0723       Jump if TOS false
   06cd: SLDC 01          Short load constant 1
   06ce: SRO  0034        Store global word BASE52
   06d0: SLDC 02          Short load constant 2
   06d1: SRO  0032        Store global word BASE50
-> 06d3: LAO  0008        Load global BASE8
   06d5: LDO  0032        Load global word BASE50
   06d7: LDB              Load byte at byte ptr TOS-1 + TOS
   06d8: SRO  0033        Store global word BASE51
   06da: LDO  0033        Load global word BASE51
   06dc: LDA  01 007a     Load addr G122
   06df: LDM  04          Load 4 words from (TOS)
   06e1: SLDC 04          Short load constant 4
   06e2: INN              Set membership (TOS-1 in set TOS)
   06e3: FJP  $06f2       Jump if TOS false
   06e5: SLDO 04          Short load global BASE4
   06e6: SLDO 04          Short load global BASE4
   06e7: SIND 00          Short index load *TOS+0
   06e8: SLDC 0a          Short load constant 10
   06e9: MPI              Multiply integers (TOS * TOS-1)
   06ea: LDO  0033        Load global word BASE51
   06ec: SLDC 30          Short load constant 48
   06ed: SBI              Subtract integers (TOS-1 - TOS)
   06ee: ADI              Add integers (TOS + TOS-1)
   06ef: STO              Store indirect (TOS into TOS-1)
   06f0: UJP  $06f5       Unconditional jump
-> 06f2: SLDC 00          Short load constant 0
   06f3: SRO  0034        Store global word BASE52
-> 06f5: LDO  0032        Load global word BASE50
   06f7: SLDC 01          Short load constant 1
   06f8: ADI              Add integers (TOS + TOS-1)
   06f9: SRO  0032        Store global word BASE50
   06fb: LDO  0032        Load global word BASE50
   06fd: LDO  0031        Load global word BASE49
   06ff: EQUI             Integer TOS-1 = TOS
   0700: LDO  0034        Load global word BASE52
   0702: LNOT             Logical NOT (~TOS)
   0703: LOR              Logical OR (TOS | TOS-1)
   0704: FJP  $06d3       Jump if TOS false
   0706: LDO  0032        Load global word BASE50
   0708: SLDC 03          Short load constant 3
   0709: EQUI             Integer TOS-1 = TOS
   070a: LDO  0031        Load global word BASE49
   070c: SLDC 03          Short load constant 3
   070d: EQUI             Integer TOS-1 = TOS
   070e: LAND             Logical AND (TOS & TOS-1)
   070f: FJP  $0723       Jump if TOS false
   0711: LAO  0008        Load global BASE8
   0713: LDO  0032        Load global word BASE50
   0715: SLDC 01          Short load constant 1
   0716: SBI              Subtract integers (TOS-1 - TOS)
   0717: LDB              Load byte at byte ptr TOS-1 + TOS
   0718: SLDC 2a          Short load constant 42
   0719: EQUI             Integer TOS-1 = TOS
   071a: FJP  $0723       Jump if TOS false
   071c: SLDO 04          Short load global BASE4
   071d: SLDC 01          Short load constant 1
   071e: NGI              Negate integer
   071f: STO              Store indirect (TOS into TOS-1)
   0720: SLDC 01          Short load constant 1
   0721: SRO  0034        Store global word BASE52
-> 0723: LDO  0034        Load global word BASE52
   0725: SRO  0001        Store global word BASE1
   0727: LDO  0034        Load global word BASE52
   0729: SLDO 05          Short load global BASE5
   072a: SLDC 00          Short load constant 0
   072b: LDB              Load byte at byte ptr TOS-1 + TOS
   072c: SLDC 05          Short load constant 5
   072d: GRTI             Integer TOS-1 > TOS
   072e: LAND             Logical AND (TOS & TOS-1)
   072f: FJP  $07b3       Jump if TOS false
   0731: LAO  0008        Load global BASE8
   0733: SLDO 05          Short load global BASE5
   0734: LAO  0035        Load global BASE53
   0736: SLDO 05          Short load global BASE5
   0737: SLDC 00          Short load constant 0
   0738: LDB              Load byte at byte ptr TOS-1 + TOS
   0739: SLDC 04          Short load constant 4
   073a: SBI              Subtract integers (TOS-1 - TOS)
   073b: SLDC 05          Short load constant 5
   073c: CXP  00 19       Call external procedure PASCALSY.SCOPY
   073f: LAO  0035        Load global BASE53
   0741: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0743: LAO  0008        Load global BASE8
   0745: LSA  05          Load string address: '.TEXT'
   074c: NOP              No operation
   074d: EQLSTR           String TOS-1 = TOS
   074f: FJP  $0756       Jump if TOS false
   0751: SLDO 03          Short load global BASE3
   0752: SLDC 03          Short load constant 3
   0753: STO              Store indirect (TOS into TOS-1)
   0754: UJP  $07b3       Unconditional jump
-> 0756: LAO  0008        Load global BASE8
   0758: NOP              No operation
   0759: LSA  05          Load string address: '.CODE'
   0760: EQLSTR           String TOS-1 = TOS
   0762: FJP  $0769       Jump if TOS false
   0764: SLDO 03          Short load global BASE3
   0765: SLDC 02          Short load constant 2
   0766: STO              Store indirect (TOS into TOS-1)
   0767: UJP  $07b3       Unconditional jump
-> 0769: LAO  0008        Load global BASE8
   076b: LSA  05          Load string address: '.BACK'
   0772: NOP              No operation
   0773: EQLSTR           String TOS-1 = TOS
   0775: FJP  $077c       Jump if TOS false
   0777: SLDO 03          Short load global BASE3
   0778: SLDC 03          Short load constant 3
   0779: STO              Store indirect (TOS into TOS-1)
   077a: UJP  $07b3       Unconditional jump
-> 077c: LAO  0008        Load global BASE8
   077e: NOP              No operation
   077f: LSA  05          Load string address: '.INFO'
   0786: EQLSTR           String TOS-1 = TOS
   0788: FJP  $078f       Jump if TOS false
   078a: SLDO 03          Short load global BASE3
   078b: SLDC 04          Short load constant 4
   078c: STO              Store indirect (TOS into TOS-1)
   078d: UJP  $07b3       Unconditional jump
-> 078f: LAO  0008        Load global BASE8
   0791: LSA  05          Load string address: '.GRAF'
   0798: NOP              No operation
   0799: EQLSTR           String TOS-1 = TOS
   079b: FJP  $07a2       Jump if TOS false
   079d: SLDO 03          Short load global BASE3
   079e: SLDC 06          Short load constant 6
   079f: STO              Store indirect (TOS into TOS-1)
   07a0: UJP  $07b3       Unconditional jump
-> 07a2: LAO  0008        Load global BASE8
   07a4: NOP              No operation
   07a5: LSA  05          Load string address: '.FOTO'
   07ac: EQLSTR           String TOS-1 = TOS
   07ae: FJP  $07b3       Jump if TOS false
   07b0: SLDO 03          Short load global BASE3
   07b1: SLDC 07          Short load constant 7
   07b2: STO              Store indirect (TOS into TOS-1)
-> 07b3: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC34(PARAM1; PARAM2) (* P=34 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
  BASE4
  BASE5
BEGIN
-> 07cc: SLDO 01          Short load global BASE1
   07cd: SLDC 00          Short load constant 0
   07ce: IXA  000d        Index array (TOS-1 + TOS * 13)
   07d0: SRO  0004        Store global word BASE4
   07d2: SLDO 02          Short load global BASE2
   07d3: SRO  0003        Store global word BASE3
   07d5: SLDO 04          Short load global BASE4
   07d6: IND  0008        Static index and load word (TOS+8)
   07d8: SLDC 01          Short load constant 1
   07d9: SBI              Subtract integers (TOS-1 - TOS)
   07da: SRO  0005        Store global word BASE5
-> 07dc: SLDO 03          Short load global BASE3
   07dd: SLDO 05          Short load global BASE5
   07de: LEQI             Integer TOS-1 <= TOS
   07df: FJP  $07f4       Jump if TOS false
   07e1: SLDO 01          Short load global BASE1
   07e2: SLDO 03          Short load global BASE3
   07e3: IXA  000d        Index array (TOS-1 + TOS * 13)
   07e5: SLDO 01          Short load global BASE1
   07e6: SLDO 03          Short load global BASE3
   07e7: SLDC 01          Short load constant 1
   07e8: ADI              Add integers (TOS + TOS-1)
   07e9: IXA  000d        Index array (TOS-1 + TOS * 13)
   07eb: MOV  000d        Move 13 words (TOS to TOS-1)
   07ed: SLDO 03          Short load global BASE3
   07ee: SLDC 01          Short load constant 1
   07ef: ADI              Add integers (TOS + TOS-1)
   07f0: SRO  0003        Store global word BASE3
   07f2: UJP  $07dc       Unconditional jump
-> 07f4: SLDO 01          Short load global BASE1
   07f5: SLDO 04          Short load global BASE4
   07f6: IND  0008        Static index and load word (TOS+8)
   07f8: IXA  000d        Index array (TOS-1 + TOS * 13)
   07fa: INC  0003        Inc field ptr (TOS+3)
   07fc: NOP              No operation
   07fd: LSA  00          Load string address: ''
   07ff: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0801: SLDO 04          Short load global BASE4
   0802: INC  0008        Inc field ptr (TOS+8)
   0804: SLDO 04          Short load global BASE4
   0805: IND  0008        Static index and load word (TOS+8)
   0807: SLDC 01          Short load constant 1
   0808: SBI              Subtract integers (TOS-1 - TOS)
   0809: STO              Store indirect (TOS into TOS-1)
-> 080a: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC35(PARAM1; PARAM2; PARAM3) (* P=35 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 0818: SLDO 01          Short load global BASE1
   0819: SLDC 00          Short load constant 0
   081a: IXA  000d        Index array (TOS-1 + TOS * 13)
   081c: SRO  0005        Store global word BASE5
   081e: SLDO 05          Short load global BASE5
   081f: IND  0008        Static index and load word (TOS+8)
   0821: SRO  0004        Store global word BASE4
   0823: SLDO 02          Short load global BASE2
   0824: SRO  0006        Store global word BASE6
-> 0826: SLDO 04          Short load global BASE4
   0827: SLDO 06          Short load global BASE6
   0828: GEQI             Integer TOS-1 >= TOS
   0829: FJP  $083e       Jump if TOS false
   082b: SLDO 01          Short load global BASE1
   082c: SLDO 04          Short load global BASE4
   082d: SLDC 01          Short load constant 1
   082e: ADI              Add integers (TOS + TOS-1)
   082f: IXA  000d        Index array (TOS-1 + TOS * 13)
   0831: SLDO 01          Short load global BASE1
   0832: SLDO 04          Short load global BASE4
   0833: IXA  000d        Index array (TOS-1 + TOS * 13)
   0835: MOV  000d        Move 13 words (TOS to TOS-1)
   0837: SLDO 04          Short load global BASE4
   0838: SLDC 01          Short load constant 1
   0839: SBI              Subtract integers (TOS-1 - TOS)
   083a: SRO  0004        Store global word BASE4
   083c: UJP  $0826       Unconditional jump
-> 083e: SLDO 01          Short load global BASE1
   083f: SLDO 02          Short load global BASE2
   0840: IXA  000d        Index array (TOS-1 + TOS * 13)
   0842: SLDO 03          Short load global BASE3
   0843: MOV  000d        Move 13 words (TOS to TOS-1)
   0845: SLDO 05          Short load global BASE5
   0846: INC  0008        Inc field ptr (TOS+8)
   0848: SLDO 05          Short load global BASE5
   0849: IND  0008        Static index and load word (TOS+8)
   084b: SLDC 01          Short load constant 1
   084c: ADI              Add integers (TOS + TOS-1)
   084d: STO              Store indirect (TOS into TOS-1)
-> 084e: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC36 (* P=36 LL=0 *)
BEGIN
-> 085c: SLDC 04          Short load constant 4
   085d: LOD  01 0001     Load word at G1 (SYSCOM)
   0860: INC  001f        Inc field ptr (TOS+31)
   0862: SLDC 08          Short load constant 8
   0863: SLDC 08          Short load constant 8
   0864: LDP              Load packed field (TOS)
   0865: CBP  34          Call base procedure PASCALSY.52
   0867: LOD  01 0003     Load word at G3 (OUTPUT)
   086a: SLDC 05          Short load constant 5
   086b: SLDC 00          Short load constant 0
   086c: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   086f: LOD  01 0003     Load word at G3 (OUTPUT)
   0872: SLDC 0e          Short load constant 14
   0873: SLDC 00          Short load constant 0
   0874: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 0877: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC37 (* P=37 LL=0 *)
  BASE1
  BASE2
BEGIN
-> 0884: CBP  24          Call base procedure PASCALSY.36
   0886: LOD  01 0001     Load word at G1 (SYSCOM)
   0889: SRO  0001        Store global word BASE1
   088b: SLDO 01          Short load global BASE1
   088c: INC  001f        Inc field ptr (TOS+31)
   088e: SRO  0002        Store global word BASE2
   0890: SLDC 03          Short load constant 3
   0891: CSP  26          Call standard procedure UNITCLEAR
   0893: SLDO 02          Short load global BASE2
   0894: INC  0001        Inc field ptr (TOS+1)
   0896: SLDC 08          Short load constant 8
   0897: SLDC 00          Short load constant 0
   0898: LDP              Load packed field (TOS)
   0899: SLDC 00          Short load constant 0
   089a: NEQI             Integer TOS-1 <> TOS
   089b: FJP  $08a8       Jump if TOS false
   089d: SLDC 03          Short load constant 3
   089e: SLDO 02          Short load global BASE2
   089f: INC  0001        Inc field ptr (TOS+1)
   08a1: SLDC 08          Short load constant 8
   08a2: SLDC 00          Short load constant 0
   08a3: LDP              Load packed field (TOS)
   08a4: CBP  34          Call base procedure PASCALSY.52
   08a6: UJP  $08b1       Unconditional jump
-> 08a8: SLDC 06          Short load constant 6
   08a9: SLDO 02          Short load global BASE2
   08aa: INC  0004        Inc field ptr (TOS+4)
   08ac: SLDC 08          Short load constant 8
   08ad: SLDC 08          Short load constant 8
   08ae: LDP              Load packed field (TOS)
   08af: CBP  34          Call base procedure PASCALSY.52
-> 08b1: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC38 (* P=38 LL=0 *)
  BASE1
  BASE2
  BASE3
  BASE4
BEGIN
-> 08be: LOD  01 0001     Load word at G1 (SYSCOM)
   08c1: SRO  0002        Store global word BASE2
   08c3: SLDO 02          Short load global BASE2
   08c4: INC  001f        Inc field ptr (TOS+31)
   08c6: SRO  0003        Store global word BASE3
   08c8: SLDO 03          Short load global BASE3
   08c9: INC  0001        Inc field ptr (TOS+1)
   08cb: SLDC 08          Short load constant 8
   08cc: SLDC 08          Short load constant 8
   08cd: LDP              Load packed field (TOS)
   08ce: SLDC 00          Short load constant 0
   08cf: NEQI             Integer TOS-1 <> TOS
   08d0: FJP  $08dd       Jump if TOS false
   08d2: SLDC 02          Short load constant 2
   08d3: SLDO 03          Short load global BASE3
   08d4: INC  0001        Inc field ptr (TOS+1)
   08d6: SLDC 08          Short load constant 8
   08d7: SLDC 08          Short load constant 8
   08d8: LDP              Load packed field (TOS)
   08d9: CBP  34          Call base procedure PASCALSY.52
   08db: UJP  $0927       Unconditional jump
-> 08dd: SLDO 03          Short load global BASE3
   08de: INC  0004        Inc field ptr (TOS+4)
   08e0: SLDC 08          Short load constant 8
   08e1: SLDC 00          Short load constant 0
   08e2: LDP              Load packed field (TOS)
   08e3: SLDC 00          Short load constant 0
   08e4: NEQI             Integer TOS-1 <> TOS
   08e5: FJP  $08f2       Jump if TOS false
   08e7: SLDC 07          Short load constant 7
   08e8: SLDO 03          Short load global BASE3
   08e9: INC  0004        Inc field ptr (TOS+4)
   08eb: SLDC 08          Short load constant 8
   08ec: SLDC 00          Short load constant 0
   08ed: LDP              Load packed field (TOS)
   08ee: CBP  34          Call base procedure PASCALSY.52
   08f0: UJP  $0927       Unconditional jump
-> 08f2: SLDO 03          Short load global BASE3
   08f3: INC  0002        Inc field ptr (TOS+2)
   08f5: SLDC 08          Short load constant 8
   08f6: SLDC 08          Short load constant 8
   08f7: LDP              Load packed field (TOS)
   08f8: SLDC 00          Short load constant 0
   08f9: NEQI             Integer TOS-1 <> TOS
   08fa: FJP  $0927       Jump if TOS false
   08fc: SLDC 02          Short load constant 2
   08fd: SRO  0001        Store global word BASE1
   08ff: SLDO 02          Short load global BASE2
   0900: IND  0026        Static index and load word (TOS+38)
   0902: SRO  0004        Store global word BASE4
-> 0904: SLDO 01          Short load global BASE1
   0905: SLDO 04          Short load global BASE4
   0906: LEQI             Integer TOS-1 <= TOS
   0907: FJP  $0918       Jump if TOS false
   0909: LOD  01 0003     Load word at G3 (OUTPUT)
   090c: SLDC 20          Short load constant 32
   090d: SLDC 00          Short load constant 0
   090e: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0911: SLDO 01          Short load global BASE1
   0912: SLDC 01          Short load constant 1
   0913: ADI              Add integers (TOS + TOS-1)
   0914: SRO  0001        Store global word BASE1
   0916: UJP  $0904       Unconditional jump
-> 0918: LOD  01 0003     Load word at G3 (OUTPUT)
   091b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   091e: SLDC 00          Short load constant 0
   091f: SLDO 03          Short load global BASE3
   0920: INC  0002        Inc field ptr (TOS+2)
   0922: SLDC 08          Short load constant 8
   0923: SLDC 08          Short load constant 8
   0924: LDP              Load packed field (TOS)
   0925: CBP  34          Call base procedure PASCALSY.52
-> 0927: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC39 (* P=39 LL=0 *)
BEGIN
-> 0936: CBP  24          Call base procedure PASCALSY.36
   0938: CBP  26          Call base procedure PASCALSY.38
   093a: LOD  01 0003     Load word at G3 (OUTPUT)
   093d: LDA  01 0046     Load addr G70
   0940: SLDC 00          Short load constant 0
   0941: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0944: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC40(PARAM1): RETVAL (* P=40 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
BEGIN
-> 0950: LOD  01 0003     Load word at G3 (OUTPUT)
   0953: LSA  18          Load string address: 'Type <space> to continue'
   096d: NOP              No operation
   096e: SLDC 00          Short load constant 0
   096f: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0972: SLDO 03          Short load global BASE3
   0973: SLDC 00          Short load constant 0
   0974: SLDC 00          Short load constant 0
   0975: CBP  29          Call base procedure PASCALSY.41
   0977: SRO  0004        Store global word BASE4
   0979: LOD  01 0002     Load word at G2 (INPUT)
   097c: SLDC 00          Short load constant 0
   097d: SLDC 00          Short load constant 0
   097e: CXP  00 0b       Call external procedure PASCALSY.FEOLN
   0981: LNOT             Logical NOT (~TOS)
   0982: FJP  $098a       Jump if TOS false
   0984: LOD  01 0003     Load word at G3 (OUTPUT)
   0987: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 098a: CBP  26          Call base procedure PASCALSY.38
   098c: SLDO 04          Short load global BASE4
   098d: SLDC 20          Short load constant 32
   098e: EQUI             Integer TOS-1 = TOS
   098f: SLDO 04          Short load global BASE4
   0990: LOD  01 0001     Load word at G1 (SYSCOM)
   0993: INC  002c        Inc field ptr (TOS+44)
   0995: SLDC 08          Short load constant 8
   0996: SLDC 08          Short load constant 8
   0997: LDP              Load packed field (TOS)
   0998: EQUI             Integer TOS-1 = TOS
   0999: LOR              Logical OR (TOS | TOS-1)
   099a: FJP  $0950       Jump if TOS false
   099c: SLDO 04          Short load global BASE4
   099d: SLDC 20          Short load constant 32
   099e: NEQI             Integer TOS-1 <> TOS
   099f: SRO  0001        Store global word BASE1
-> 09a1: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FUNC41(PARAM1): RETVAL (* P=41 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
BEGIN
-> 09b0: SLDO 03          Short load global BASE3
   09b1: FJP  $09b6       Jump if TOS false
   09b3: SLDC 01          Short load constant 1
   09b4: CSP  26          Call standard procedure UNITCLEAR
-> 09b6: LOD  01 003a     Load word at G58
   09b9: SIND 02          Short index load *TOS+2
   09ba: FJP  $09c0       Jump if TOS false
   09bc: SLDC 00          Short load constant 0
   09bd: SLDC 30          Short load constant 48
   09be: CSP  04          Call standard procedure EXIT
-> 09c0: LOD  01 003a     Load word at G58
   09c3: INC  0003        Inc field ptr (TOS+3)
   09c5: SLDC 01          Short load constant 1
   09c6: STO              Store indirect (TOS into TOS-1)
   09c7: LOD  01 0002     Load word at G2 (INPUT)
   09ca: LAO  0004        Load global BASE4
   09cc: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   09cf: SLDO 04          Short load global BASE4
   09d0: SLDC 61          Short load constant 97
   09d1: GEQI             Integer TOS-1 >= TOS
   09d2: SLDO 04          Short load global BASE4
   09d3: SLDC 7a          Short load constant 122
   09d4: LEQI             Integer TOS-1 <= TOS
   09d5: LAND             Logical AND (TOS & TOS-1)
   09d6: FJP  $09df       Jump if TOS false
   09d8: SLDO 04          Short load global BASE4
   09d9: SLDC 61          Short load constant 97
   09da: SBI              Subtract integers (TOS-1 - TOS)
   09db: SLDC 41          Short load constant 65
   09dc: ADI              Add integers (TOS + TOS-1)
   09dd: SRO  0004        Store global word BASE4
-> 09df: SLDO 04          Short load global BASE4
   09e0: SRO  0001        Store global word BASE1
-> 09e2: RBP  01          Return from base procedure
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
-> 09ee: SLDC 00          Short load constant 0
   09ef: SRO  0001        Store global word BASE1
   09f1: LOD  01 0001     Load word at G1 (SYSCOM)
   09f4: SRO  0007        Store global word BASE7
   09f6: LDA  01 007e     Load addr G126
   09f9: SLDO 03          Short load global BASE3
   09fa: IXA  0006        Index array (TOS-1 + TOS * 6)
   09fc: SRO  0008        Store global word BASE8
   09fe: SLDO 07          Short load global BASE7
   09ff: SIND 04          Short index load *TOS+4
   0a00: LDCN             Load constant NIL
   0a01: EQUI             Integer TOS-1 = TOS
   0a02: FJP  $0a0c       Jump if TOS false
   0a04: SLDO 07          Short load global BASE7
   0a05: INC  0004        Inc field ptr (TOS+4)
   0a07: LDCI 03f6        Load word 1014
   0a0a: CSP  01          Call standard procedure NEW
-> 0a0c: SLDO 03          Short load global BASE3
   0a0d: SLDO 07          Short load global BASE7
   0a0e: SIND 04          Short index load *TOS+4
   0a0f: SLDC 00          Short load constant 0
   0a10: LDCI 07ec        Load word 2028
   0a13: SLDC 02          Short load constant 2
   0a14: SLDC 00          Short load constant 0
   0a15: CSP  05          Call standard procedure UNITREAD
   0a17: SLDO 07          Short load global BASE7
   0a18: SIND 00          Short index load *TOS+0
   0a19: SLDC 00          Short load constant 0
   0a1a: EQUI             Integer TOS-1 = TOS
   0a1b: SRO  0005        Store global word BASE5
   0a1d: SLDO 05          Short load global BASE5
   0a1e: FJP  $0b05       Jump if TOS false
   0a20: SLDO 07          Short load global BASE7
   0a21: SIND 04          Short index load *TOS+4
   0a22: SLDC 00          Short load constant 0
   0a23: IXA  000d        Index array (TOS-1 + TOS * 13)
   0a25: SRO  0009        Store global word BASE9
   0a27: SLDC 00          Short load constant 0
   0a28: SRO  0005        Store global word BASE5
   0a2a: SLDO 09          Short load global BASE9
   0a2b: SIND 00          Short index load *TOS+0
   0a2c: SLDC 00          Short load constant 0
   0a2d: EQUI             Integer TOS-1 = TOS
   0a2e: SLDO 07          Short load global BASE7
   0a2f: INC  001d        Inc field ptr (TOS+29)
   0a31: SLDC 02          Short load constant 2
   0a32: SLDC 07          Short load constant 7
   0a33: LDP              Load packed field (TOS)
   0a34: SLDC 02          Short load constant 2
   0a35: EQUI             Integer TOS-1 = TOS
   0a36: SLDO 07          Short load global BASE7
   0a37: INC  001d        Inc field ptr (TOS+29)
   0a39: SLDC 02          Short load constant 2
   0a3a: SLDC 07          Short load constant 7
   0a3b: LDP              Load packed field (TOS)
   0a3c: SLDC 0a          Short load constant 10
   0a3d: SLDC 01          Short load constant 1
   0a3e: INN              Set membership (TOS-1 in set TOS)
   0a3f: SLDO 09          Short load global BASE9
   0a40: INC  0002        Inc field ptr (TOS+2)
   0a42: SLDC 04          Short load constant 4
   0a43: SLDC 00          Short load constant 0
   0a44: LDP              Load packed field (TOS)
   0a45: SLDC 08          Short load constant 8
   0a46: EQUI             Integer TOS-1 = TOS
   0a47: LAND             Logical AND (TOS & TOS-1)
   0a48: LOR              Logical OR (TOS | TOS-1)
   0a49: SLDO 07          Short load global BASE7
   0a4a: INC  001d        Inc field ptr (TOS+29)
   0a4c: SLDC 02          Short load constant 2
   0a4d: SLDC 07          Short load constant 7
   0a4e: LDP              Load packed field (TOS)
   0a4f: SLDC 00          Short load constant 0
   0a50: EQUI             Integer TOS-1 = TOS
   0a51: SLDO 09          Short load global BASE9
   0a52: INC  0002        Inc field ptr (TOS+2)
   0a54: SLDC 04          Short load constant 4
   0a55: SLDC 00          Short load constant 0
   0a56: LDP              Load packed field (TOS)
   0a57: SLDC 00          Short load constant 0
   0a58: EQUI             Integer TOS-1 = TOS
   0a59: LAND             Logical AND (TOS & TOS-1)
   0a5a: LOR              Logical OR (TOS | TOS-1)
   0a5b: LAND             Logical AND (TOS & TOS-1)
   0a5c: FJP  $0aef       Jump if TOS false
   0a5e: SLDO 09          Short load global BASE9
   0a5f: INC  0003        Inc field ptr (TOS+3)
   0a61: SLDC 00          Short load constant 0
   0a62: LDB              Load byte at byte ptr TOS-1 + TOS
   0a63: SLDC 00          Short load constant 0
   0a64: GRTI             Integer TOS-1 > TOS
   0a65: SLDO 09          Short load global BASE9
   0a66: INC  0003        Inc field ptr (TOS+3)
   0a68: SLDC 00          Short load constant 0
   0a69: LDB              Load byte at byte ptr TOS-1 + TOS
   0a6a: SLDC 07          Short load constant 7
   0a6b: LEQI             Integer TOS-1 <= TOS
   0a6c: LAND             Logical AND (TOS & TOS-1)
   0a6d: SLDO 09          Short load global BASE9
   0a6e: IND  0008        Static index and load word (TOS+8)
   0a70: SLDC 00          Short load constant 0
   0a71: GEQI             Integer TOS-1 >= TOS
   0a72: LAND             Logical AND (TOS & TOS-1)
   0a73: SLDO 09          Short load global BASE9
   0a74: IND  0008        Static index and load word (TOS+8)
   0a76: SLDC 4d          Short load constant 77
   0a77: LEQI             Integer TOS-1 <= TOS
   0a78: LAND             Logical AND (TOS & TOS-1)
   0a79: FJP  $0aef       Jump if TOS false
   0a7b: SLDC 01          Short load constant 1
   0a7c: SRO  0005        Store global word BASE5
   0a7e: SLDO 09          Short load global BASE9
   0a7f: INC  0003        Inc field ptr (TOS+3)
   0a81: SLDO 08          Short load global BASE8
   0a82: NEQSTR           String TOS-1 <> TOS
   0a84: FJP  $0aef       Jump if TOS false
   0a86: SLDC 01          Short load constant 1
   0a87: SRO  0004        Store global word BASE4
-> 0a89: SLDO 04          Short load global BASE4
   0a8a: SLDO 09          Short load global BASE9
   0a8b: IND  0008        Static index and load word (TOS+8)
   0a8d: LEQI             Integer TOS-1 <= TOS
   0a8e: FJP  $0ad6       Jump if TOS false
   0a90: SLDO 07          Short load global BASE7
   0a91: SIND 04          Short index load *TOS+4
   0a92: SLDO 04          Short load global BASE4
   0a93: IXA  000d        Index array (TOS-1 + TOS * 13)
   0a95: SRO  000a        Store global word BASE10
   0a97: SLDO 0a          Short load global BASE10
   0a98: INC  0003        Inc field ptr (TOS+3)
   0a9a: SLDC 00          Short load constant 0
   0a9b: LDB              Load byte at byte ptr TOS-1 + TOS
   0a9c: SLDC 00          Short load constant 0
   0a9d: LEQI             Integer TOS-1 <= TOS
   0a9e: SLDO 0a          Short load global BASE10
   0a9f: INC  0003        Inc field ptr (TOS+3)
   0aa1: SLDC 00          Short load constant 0
   0aa2: LDB              Load byte at byte ptr TOS-1 + TOS
   0aa3: SLDC 0f          Short load constant 15
   0aa4: GRTI             Integer TOS-1 > TOS
   0aa5: LOR              Logical OR (TOS | TOS-1)
   0aa6: SLDO 0a          Short load global BASE10
   0aa7: SIND 01          Short index load *TOS+1
   0aa8: SLDO 0a          Short load global BASE10
   0aa9: SIND 00          Short index load *TOS+0
   0aaa: LESI             Integer TOS-1 < TOS
   0aab: LOR              Logical OR (TOS | TOS-1)
   0aac: SLDO 0a          Short load global BASE10
   0aad: IND  000b        Static index and load word (TOS+11)
   0aaf: LDCI 0200        Load word 512
   0ab2: GRTI             Integer TOS-1 > TOS
   0ab3: LOR              Logical OR (TOS | TOS-1)
   0ab4: SLDO 0a          Short load global BASE10
   0ab5: IND  000b        Static index and load word (TOS+11)
   0ab7: SLDC 00          Short load constant 0
   0ab8: LEQI             Integer TOS-1 <= TOS
   0ab9: LOR              Logical OR (TOS | TOS-1)
   0aba: SLDO 0a          Short load global BASE10
   0abb: INC  000c        Inc field ptr (TOS+12)
   0abd: SLDC 07          Short load constant 7
   0abe: SLDC 09          Short load constant 9
   0abf: LDP              Load packed field (TOS)
   0ac0: SLDC 64          Short load constant 100
   0ac1: GEQI             Integer TOS-1 >= TOS
   0ac2: LOR              Logical OR (TOS | TOS-1)
   0ac3: FJP  $0acf       Jump if TOS false
   0ac5: SLDC 00          Short load constant 0
   0ac6: SRO  0005        Store global word BASE5
   0ac8: SLDO 04          Short load global BASE4
   0ac9: SLDO 07          Short load global BASE7
   0aca: SIND 04          Short index load *TOS+4
   0acb: CBP  22          Call base procedure PASCALSY.34
   0acd: UJP  $0ad4       Unconditional jump
-> 0acf: SLDO 04          Short load global BASE4
   0ad0: SLDC 01          Short load constant 1
   0ad1: ADI              Add integers (TOS + TOS-1)
   0ad2: SRO  0004        Store global word BASE4
-> 0ad4: UJP  $0a89       Unconditional jump
-> 0ad6: SLDO 05          Short load global BASE5
   0ad7: LNOT             Logical NOT (~TOS)
   0ad8: FJP  $0aef       Jump if TOS false
   0ada: SLDO 03          Short load global BASE3
   0adb: SLDO 07          Short load global BASE7
   0adc: SIND 04          Short index load *TOS+4
   0add: SLDC 00          Short load constant 0
   0ade: SLDO 09          Short load global BASE9
   0adf: IND  0008        Static index and load word (TOS+8)
   0ae1: SLDC 01          Short load constant 1
   0ae2: ADI              Add integers (TOS + TOS-1)
   0ae3: SLDC 1a          Short load constant 26
   0ae4: MPI              Multiply integers (TOS * TOS-1)
   0ae5: SLDC 02          Short load constant 2
   0ae6: SLDC 00          Short load constant 0
   0ae7: CSP  06          Call standard procedure UNITWRITE
   0ae9: SLDO 07          Short load global BASE7
   0aea: SIND 00          Short index load *TOS+0
   0aeb: SLDC 00          Short load constant 0
   0aec: EQUI             Integer TOS-1 = TOS
   0aed: SRO  0005        Store global word BASE5
-> 0aef: SLDO 05          Short load global BASE5
   0af0: FJP  $0b05       Jump if TOS false
   0af2: SLDO 08          Short load global BASE8
   0af3: SLDO 09          Short load global BASE9
   0af4: INC  0003        Inc field ptr (TOS+3)
   0af6: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0af8: SLDO 08          Short load global BASE8
   0af9: INC  0005        Inc field ptr (TOS+5)
   0afb: SLDO 09          Short load global BASE9
   0afc: SIND 07          Short index load *TOS+7
   0afd: STO              Store indirect (TOS into TOS-1)
   0afe: LAO  0006        Load global BASE6
   0b00: SLDO 09          Short load global BASE9
   0b01: INC  0009        Inc field ptr (TOS+9)
   0b03: CSP  09          Call standard procedure TIME
-> 0b05: SLDO 05          Short load global BASE5
   0b06: SRO  0001        Store global word BASE1
   0b08: SLDO 05          Short load global BASE5
   0b09: LNOT             Logical NOT (~TOS)
   0b0a: FJP  $0b23       Jump if TOS false
   0b0c: SLDO 08          Short load global BASE8
   0b0d: LSA  00          Load string address: ''
   0b0f: NOP              No operation
   0b10: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0b12: SLDO 08          Short load global BASE8
   0b13: INC  0005        Inc field ptr (TOS+5)
   0b15: LDCI 7fff        Load word 32767
   0b18: STO              Store indirect (TOS into TOS-1)
   0b19: SLDO 07          Short load global BASE7
   0b1a: INC  0004        Inc field ptr (TOS+4)
   0b1c: CSP  21          Call standard procedure RELEASE
   0b1e: SLDO 07          Short load global BASE7
   0b1f: INC  0004        Inc field ptr (TOS+4)
   0b21: LDCN             Load constant NIL
   0b22: STO              Store indirect (TOS into TOS-1)
-> 0b23: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC43(PARAM1; PARAM2; PARAM3) (* P=43 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE294
BEGIN
-> 0b36: SLDC 04          Short load constant 4
   0b37: LAO  0004        Load global BASE4
   0b39: SLDO 03          Short load global BASE3
   0b3a: SLDO 02          Short load global BASE2
   0b3b: LDO  0126        Load global word BASE294
   0b3e: SLDO 01          Short load global BASE1
   0b3f: CXP  06 01       Call external procedure FILEPROC.1
-> 0b42: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC44(PARAM1) (* P=44 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 0b4e: LOD  01 017d     Load word at G381
   0b52: LOD  01 017f     Load word at G383
   0b56: SLDO 01          Short load global BASE1
   0b57: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0b58: LOD  01 017f     Load word at G383
   0b5c: SLDC 01          Short load constant 1
   0b5d: ADI              Add integers (TOS + TOS-1)
   0b5e: STR  01 017f     Store TOS to G383
   0b62: LOD  01 017f     Load word at G383
   0b66: LDCI 01fd        Load word 509
   0b69: GRTI             Integer TOS-1 > TOS
   0b6a: LOD  01 0181     Load word at G385
   0b6e: LAND             Logical AND (TOS & TOS-1)
   0b6f: FJP  $0b7f       Jump if TOS false
   0b71: LOD  01 017d     Load word at G381
   0b75: LOD  01 017f     Load word at G383
   0b79: SLDC 0d          Short load constant 13
   0b7a: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0b7b: CBP  2f          Call base procedure PASCALSY.47
   0b7d: UJP  $0b8b       Unconditional jump
-> 0b7f: LOD  01 017f     Load word at G383
   0b83: LDCI 01ff        Load word 511
   0b86: GRTI             Integer TOS-1 > TOS
   0b87: FJP  $0b8b       Jump if TOS false
   0b89: CBP  2f          Call base procedure PASCALSY.47
-> 0b8b: SLDO 01          Short load global BASE1
   0b8c: LOD  01 018b     Load word at G395
   0b90: EQUI             Integer TOS-1 = TOS
   0b91: FJP  $0ba1       Jump if TOS false
   0b93: LOD  01 018a     Load word at G394
   0b97: LOD  01 018b     Load word at G395
   0b9b: EQUI             Integer TOS-1 = TOS
   0b9c: FJP  $0ba1       Jump if TOS false
   0b9e: SLDC 01          Short load constant 1
   0b9f: CBP  2d          Call base procedure PASCALSY.45
-> 0ba1: SLDO 01          Short load global BASE1
   0ba2: STR  01 018a     Store TOS to G394
-> 0ba6: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC45(PARAM1) (* P=45 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 0bb2: LOD  01 0182     Load word at G386
   0bb6: FJP  $0bc7       Jump if TOS false
   0bb8: SLDC 00          Short load constant 0
   0bb9: STR  01 0182     Store TOS to G386
   0bbd: LDA  01 018c     Load addr G396
   0bc1: SLDC 00          Short load constant 0
   0bc2: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0bc5: UJP  $0bfa       Unconditional jump
-> 0bc7: SLDO 01          Short load global BASE1
   0bc8: FJP  $0bed       Jump if TOS false
   0bca: SLDC 20          Short load constant 32
   0bcb: STR  01 018a     Store TOS to G394
   0bcf: LOD  01 018b     Load word at G395
   0bd3: CBP  2c          Call base procedure PASCALSY.44
   0bd5: SLDC 20          Short load constant 32
   0bd6: STR  01 018a     Store TOS to G394
   0bda: LOD  01 018b     Load word at G395
   0bde: CBP  2c          Call base procedure PASCALSY.44
   0be0: SLDC 0d          Short load constant 13
   0be1: CBP  2c          Call base procedure PASCALSY.44
   0be3: CBP  2f          Call base procedure PASCALSY.47
   0be5: LOD  01 0181     Load word at G385
   0be9: FJP  $0bed       Jump if TOS false
   0beb: CBP  2f          Call base procedure PASCALSY.47
-> 0bed: SLDC 00          Short load constant 0
   0bee: STR  01 0183     Store TOS to G387
   0bf2: LDA  01 018c     Load addr G396
   0bf6: SLDC 01          Short load constant 1
   0bf7: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 0bfa: LOD  01 017e     Load word at G382
   0bfe: STR  01 0036     Store TOS to G54
   0c01: SLDC 01          Short load constant 1
   0c02: STR  01 0187     Store TOS to G391
-> 0c06: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC46 (* P=46 LL=0 *)
BEGIN
-> 0c12: LOD  01 0181     Load word at G385
   0c16: SLDC 01          Short load constant 1
   0c17: ADI              Add integers (TOS + TOS-1)
   0c18: STR  01 0181     Store TOS to G385
   0c1c: LDA  01 018c     Load addr G396
   0c20: LOD  01 017d     Load word at G381
   0c24: SLDC 00          Short load constant 0
   0c25: SLDC 01          Short load constant 1
   0c26: LOD  01 0181     Load word at G385
   0c2a: SLDC 01          Short load constant 1
   0c2b: SLDC 00          Short load constant 0
   0c2c: SLDC 00          Short load constant 0
   0c2d: CXP  00 1c       Call external procedure PASCALSY.FBLOCKIO
   0c30: SLDC 01          Short load constant 1
   0c31: NEQI             Integer TOS-1 <> TOS
   0c32: FJP  $0c66       Jump if TOS false
   0c34: LOD  01 0003     Load word at G3 (OUTPUT)
   0c37: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0c3a: LOD  01 0003     Load word at G3 (OUTPUT)
   0c3d: LSA  17          Load string address: 'Error reading exec file'
   0c56: NOP              No operation
   0c57: SLDC 00          Short load constant 0
   0c58: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c5b: LOD  01 0003     Load word at G3 (OUTPUT)
   0c5e: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0c61: SLDC 01          Short load constant 1
   0c62: CBP  2d          Call base procedure PASCALSY.45
   0c64: UJP  $0c92       Unconditional jump
-> 0c66: SLDC 00          Short load constant 0
   0c67: STR  01 017f     Store TOS to G383
   0c6b: LOD  01 0181     Load word at G385
   0c6f: FJP  $0c8b       Jump if TOS false
   0c71: LDCI 01fe        Load word 510
   0c74: LDCI 01ff        Load word 511
   0c77: NGI              Negate integer
   0c78: SLDC 00          Short load constant 0
   0c79: SLDC 0d          Short load constant 13
   0c7a: LOD  01 017d     Load word at G381
   0c7e: LDCI 01ff        Load word 511
   0c81: SLDC 00          Short load constant 0
   0c82: CSP  0b          Call standard procedure SCAN
   0c84: ADI              Add integers (TOS + TOS-1)
   0c85: STR  01 0180     Store TOS to G384
   0c89: UJP  $0c92       Unconditional jump
-> 0c8b: LDCI 01ff        Load word 511
   0c8e: STR  01 0180     Store TOS to G384
-> 0c92: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC47 (* P=47 LL=0 *)
BEGIN
-> 0c9e: LDA  01 018c     Load addr G396
   0ca2: LOD  01 017d     Load word at G381
   0ca6: SLDC 00          Short load constant 0
   0ca7: SLDC 01          Short load constant 1
   0ca8: LOD  01 0181     Load word at G385
   0cac: SLDC 00          Short load constant 0
   0cad: SLDC 00          Short load constant 0
   0cae: SLDC 00          Short load constant 0
   0caf: CXP  00 1c       Call external procedure PASCALSY.FBLOCKIO
   0cb2: SLDC 01          Short load constant 1
   0cb3: NEQI             Integer TOS-1 <> TOS
   0cb4: FJP  $0ce8       Jump if TOS false
   0cb6: LOD  01 0003     Load word at G3 (OUTPUT)
   0cb9: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0cbc: LOD  01 0003     Load word at G3 (OUTPUT)
   0cbf: LSA  17          Load string address: 'Error writing exec file'
   0cd8: NOP              No operation
   0cd9: SLDC 00          Short load constant 0
   0cda: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0cdd: LOD  01 0003     Load word at G3 (OUTPUT)
   0ce0: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ce3: SLDC 00          Short load constant 0
   0ce4: CBP  2d          Call base procedure PASCALSY.45
   0ce6: UJP  $0d02       Unconditional jump
-> 0ce8: LOD  01 017d     Load word at G381
   0cec: SLDC 00          Short load constant 0
   0ced: LDCI 0200        Load word 512
   0cf0: SLDC 00          Short load constant 0
   0cf1: CSP  0a          Call standard procedure FLCH
   0cf3: SLDC 00          Short load constant 0
   0cf4: STR  01 017f     Store TOS to G383
   0cf8: LOD  01 0181     Load word at G385
   0cfc: SLDC 01          Short load constant 1
   0cfd: ADI              Add integers (TOS + TOS-1)
   0cfe: STR  01 0181     Store TOS to G385
-> 0d02: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC48 (* P=48 LL=0 *)
BEGIN
-> 0d0e: SLDC 00          Short load constant 0
   0d0f: STR  01 0045     Store TOS to G69
   0d12: SLDC 00          Short load constant 0
   0d13: STR  01 0184     Store TOS to G388
-> 0d17: CBP  38          Call base procedure PASCALSY.56
   0d19: CLP  3a          Call local procedure PASCALSY.58
   0d1b: LOD  01 0184     Load word at G388
   0d1f: FJP  $0d26       Jump if TOS false
   0d21: LDCN             Load constant NIL
   0d22: LDCN             Load constant NIL
   0d23: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
-> 0d26: LOD  01 0045     Load word at G69
   0d29: SLDC 00          Short load constant 0
   0d2a: EQUI             Integer TOS-1 = TOS
   0d2b: FJP  $0d17       Jump if TOS false
-> 0d2d: RBP  00          Return from base procedure
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
-> 0d3c: SLDC 01          Short load constant 1
   0d3d: SRO  0001        Store global word BASE1
   0d3f: SLDC 00          Short load constant 0
   0d40: SRO  0005        Store global word BASE5
   0d42: SLDO 03          Short load global BASE3
   0d43: SRO  0009        Store global word BASE9
   0d45: SLDO 09          Short load global BASE9
   0d46: INC  0010        Inc field ptr (TOS+16)
   0d48: SRO  000a        Store global word BASE10
   0d4a: SLDO 0a          Short load global BASE10
   0d4b: INC  0003        Inc field ptr (TOS+3)
   0d4d: SLDC 00          Short load constant 0
   0d4e: LDB              Load byte at byte ptr TOS-1 + TOS
   0d4f: SLDC 00          Short load constant 0
   0d50: GRTI             Integer TOS-1 > TOS
   0d51: FJP  $0e18       Jump if TOS false
   0d53: SLDO 09          Short load global BASE9
   0d54: SIND 07          Short index load *TOS+7
   0d55: SLDO 09          Short load global BASE9
   0d56: INC  0008        Inc field ptr (TOS+8)
   0d58: SLDC 00          Short load constant 0
   0d59: LAO  0008        Load global BASE8
   0d5b: SLDC 00          Short load constant 0
   0d5c: SLDC 00          Short load constant 0
   0d5d: CBP  1e          Call base procedure PASCALSY.30
   0d5f: NEQI             Integer TOS-1 <> TOS
   0d60: FJP  $0d69       Jump if TOS false
   0d62: LOD  01 0001     Load word at G1 (SYSCOM)
   0d65: SLDC 05          Short load constant 5
   0d66: STO              Store indirect (TOS into TOS-1)
   0d67: UJP  $0e18       Unconditional jump
-> 0d69: SLDC 00          Short load constant 0
   0d6a: SRO  0006        Store global word BASE6
   0d6c: SLDC 01          Short load constant 1
   0d6d: SRO  0004        Store global word BASE4
-> 0d6f: SLDO 04          Short load global BASE4
   0d70: SLDO 08          Short load global BASE8
   0d71: SLDC 00          Short load constant 0
   0d72: IXA  000d        Index array (TOS-1 + TOS * 13)
   0d74: IND  0008        Static index and load word (TOS+8)
   0d76: LEQI             Integer TOS-1 <= TOS
   0d77: SLDO 06          Short load global BASE6
   0d78: LNOT             Logical NOT (~TOS)
   0d79: LAND             Logical AND (TOS & TOS-1)
   0d7a: FJP  $0d96       Jump if TOS false
   0d7c: SLDO 08          Short load global BASE8
   0d7d: SLDO 04          Short load global BASE4
   0d7e: IXA  000d        Index array (TOS-1 + TOS * 13)
   0d80: SIND 00          Short index load *TOS+0
   0d81: SLDO 0a          Short load global BASE10
   0d82: SIND 00          Short index load *TOS+0
   0d83: EQUI             Integer TOS-1 = TOS
   0d84: SLDO 08          Short load global BASE8
   0d85: SLDO 04          Short load global BASE4
   0d86: IXA  000d        Index array (TOS-1 + TOS * 13)
   0d88: SIND 01          Short index load *TOS+1
   0d89: SLDO 0a          Short load global BASE10
   0d8a: SIND 01          Short index load *TOS+1
   0d8b: EQUI             Integer TOS-1 = TOS
   0d8c: LAND             Logical AND (TOS & TOS-1)
   0d8d: SRO  0006        Store global word BASE6
   0d8f: SLDO 04          Short load global BASE4
   0d90: SLDC 01          Short load constant 1
   0d91: ADI              Add integers (TOS + TOS-1)
   0d92: SRO  0004        Store global word BASE4
   0d94: UJP  $0d6f       Unconditional jump
-> 0d96: SLDO 06          Short load global BASE6
   0d97: LNOT             Logical NOT (~TOS)
   0d98: FJP  $0da1       Jump if TOS false
   0d9a: LOD  01 0001     Load word at G1 (SYSCOM)
   0d9d: SLDC 06          Short load constant 6
   0d9e: STO              Store indirect (TOS into TOS-1)
   0d9f: UJP  $0e18       Unconditional jump
-> 0da1: SLDO 04          Short load global BASE4
   0da2: SLDO 08          Short load global BASE8
   0da3: SLDC 00          Short load constant 0
   0da4: IXA  000d        Index array (TOS-1 + TOS * 13)
   0da6: IND  0008        Static index and load word (TOS+8)
   0da8: GRTI             Integer TOS-1 > TOS
   0da9: FJP  $0db4       Jump if TOS false
   0dab: SLDO 08          Short load global BASE8
   0dac: SLDC 00          Short load constant 0
   0dad: IXA  000d        Index array (TOS-1 + TOS * 13)
   0daf: SIND 07          Short index load *TOS+7
   0db0: SRO  0007        Store global word BASE7
   0db2: UJP  $0dbb       Unconditional jump
-> 0db4: SLDO 08          Short load global BASE8
   0db5: SLDO 04          Short load global BASE4
   0db6: IXA  000d        Index array (TOS-1 + TOS * 13)
   0db8: SIND 00          Short index load *TOS+0
   0db9: SRO  0007        Store global word BASE7
-> 0dbb: SLDO 0a          Short load global BASE10
   0dbc: SIND 01          Short index load *TOS+1
   0dbd: SLDO 07          Short load global BASE7
   0dbe: LESI             Integer TOS-1 < TOS
   0dbf: SLDO 0a          Short load global BASE10
   0dc0: IND  000b        Static index and load word (TOS+11)
   0dc2: LDCI 0200        Load word 512
   0dc5: LESI             Integer TOS-1 < TOS
   0dc6: LOR              Logical OR (TOS | TOS-1)
   0dc7: FJP  $0e15       Jump if TOS false
   0dc9: SLDO 08          Short load global BASE8
   0dca: SLDO 04          Short load global BASE4
   0dcb: SLDC 01          Short load constant 1
   0dcc: SBI              Subtract integers (TOS-1 - TOS)
   0dcd: IXA  000d        Index array (TOS-1 + TOS * 13)
   0dcf: SRO  000b        Store global word BASE11
   0dd1: SLDO 0b          Short load global BASE11
   0dd2: INC  0001        Inc field ptr (TOS+1)
   0dd4: SLDO 07          Short load global BASE7
   0dd5: STO              Store indirect (TOS into TOS-1)
   0dd6: SLDO 0b          Short load global BASE11
   0dd7: INC  000b        Inc field ptr (TOS+11)
   0dd9: LDCI 0200        Load word 512
   0ddc: STO              Store indirect (TOS into TOS-1)
   0ddd: SLDO 09          Short load global BASE9
   0dde: SIND 07          Short index load *TOS+7
   0ddf: SLDO 08          Short load global BASE8
   0de0: CBP  1f          Call base procedure PASCALSY.31
   0de2: CSP  22          Call standard procedure IORESULT
   0de4: SLDC 00          Short load constant 0
   0de5: NEQI             Integer TOS-1 <> TOS
   0de6: FJP  $0dea       Jump if TOS false
   0de8: UJP  $0e18       Unconditional jump
-> 0dea: SLDO 09          Short load global BASE9
   0deb: INC  0002        Inc field ptr (TOS+2)
   0ded: SLDC 00          Short load constant 0
   0dee: STO              Store indirect (TOS into TOS-1)
   0def: SLDO 09          Short load global BASE9
   0df0: INC  0001        Inc field ptr (TOS+1)
   0df2: SLDC 00          Short load constant 0
   0df3: STO              Store indirect (TOS into TOS-1)
   0df4: SLDO 09          Short load global BASE9
   0df5: SIND 03          Short index load *TOS+3
   0df6: SLDC 00          Short load constant 0
   0df7: NEQI             Integer TOS-1 <> TOS
   0df8: FJP  $0dff       Jump if TOS false
   0dfa: SLDO 09          Short load global BASE9
   0dfb: INC  0003        Inc field ptr (TOS+3)
   0dfd: SLDC 01          Short load constant 1
   0dfe: STO              Store indirect (TOS into TOS-1)
-> 0dff: SLDO 0a          Short load global BASE10
   0e00: INC  0001        Inc field ptr (TOS+1)
   0e02: SLDO 07          Short load global BASE7
   0e03: STO              Store indirect (TOS into TOS-1)
   0e04: SLDO 0a          Short load global BASE10
   0e05: INC  000b        Inc field ptr (TOS+11)
   0e07: LDCI 0200        Load word 512
   0e0a: STO              Store indirect (TOS into TOS-1)
   0e0b: SLDO 0a          Short load global BASE10
   0e0c: INC  000c        Inc field ptr (TOS+12)
   0e0e: SLDC 07          Short load constant 7
   0e0f: SLDC 09          Short load constant 9
   0e10: SLDC 64          Short load constant 100
   0e11: STP              Store packed field (TOS into TOS-1)
   0e12: SLDC 00          Short load constant 0
   0e13: SRO  0001        Store global word BASE1
-> 0e15: SLDC 01          Short load constant 1
   0e16: SRO  0005        Store global word BASE5
-> 0e18: SLDO 05          Short load global BASE5
   0e19: LNOT             Logical NOT (~TOS)
   0e1a: FJP  $0e26       Jump if TOS false
   0e1c: SLDO 03          Short load global BASE3
   0e1d: INC  0002        Inc field ptr (TOS+2)
   0e1f: SLDC 01          Short load constant 1
   0e20: STO              Store indirect (TOS into TOS-1)
   0e21: SLDO 03          Short load global BASE3
   0e22: INC  0001        Inc field ptr (TOS+1)
   0e24: SLDC 01          Short load constant 1
   0e25: STO              Store indirect (TOS into TOS-1)
-> 0e26: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC50 (* P=50 LL=1 *)
  MP1
BEGIN
-> 0e38: LOD  02 0001     Load word at G1 (SYSCOM)
   0e3b: STL  0001        Store TOS into MP1
   0e3d: LOD  02 0003     Load word at G3 (OUTPUT)
   0e40: NOP              No operation
   0e41: LSA  03          Load string address: 'S# '
   0e46: SLDC 00          Short load constant 0
   0e47: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0e4a: LOD  02 0003     Load word at G3 (OUTPUT)
   0e4d: SLDL 01          Short load local MP1
   0e4e: IND  0009        Static index and load word (TOS+9)
   0e50: SLDC 00          Short load constant 0
   0e51: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0e54: LOD  02 0003     Load word at G3 (OUTPUT)
   0e57: LSA  05          Load string address: ', P# '
   0e5e: NOP              No operation
   0e5f: SLDC 00          Short load constant 0
   0e60: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0e63: LOD  02 0003     Load word at G3 (OUTPUT)
   0e66: SLDL 01          Short load local MP1
   0e67: IND  0008        Static index and load word (TOS+8)
   0e69: SLDC 00          Short load constant 0
   0e6a: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0e6d: LOD  02 0003     Load word at G3 (OUTPUT)
   0e70: NOP              No operation
   0e71: LSA  05          Load string address: ', I# '
   0e78: SLDC 00          Short load constant 0
   0e79: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0e7c: LOD  02 0003     Load word at G3 (OUTPUT)
   0e7f: SLDL 01          Short load local MP1
   0e80: IND  000b        Static index and load word (TOS+11)
   0e82: SLDC 00          Short load constant 0
   0e83: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0e86: LOD  02 0003     Load word at G3 (OUTPUT)
   0e89: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0e8c: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC51 (* P=51 LL=1 *)
  MP1
BEGIN
-> 0e98: LOD  02 0001     Load word at G1 (SYSCOM)
   0e9b: STL  0001        Store TOS into MP1
   0e9d: LOD  02 0003     Load word at G3 (OUTPUT)
   0ea0: NOP              No operation
   0ea1: LSA  0b          Load string address: 'Exec err # '
   0eae: SLDC 00          Short load constant 0
   0eaf: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0eb2: LOD  02 0003     Load word at G3 (OUTPUT)
   0eb5: SLDL 01          Short load local MP1
   0eb6: SIND 01          Short index load *TOS+1
   0eb7: SLDC 00          Short load constant 0
   0eb8: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0ebb: LOD  02 0003     Load word at G3 (OUTPUT)
   0ebe: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ec1: SLDL 01          Short load local MP1
   0ec2: SIND 01          Short index load *TOS+1
   0ec3: SLDC 0a          Short load constant 10
   0ec4: EQUI             Integer TOS-1 = TOS
   0ec5: FJP  $0ed9       Jump if TOS false
   0ec7: LOD  02 0003     Load word at G3 (OUTPUT)
   0eca: SLDC 2c          Short load constant 44
   0ecb: SLDC 00          Short load constant 0
   0ecc: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0ecf: LOD  02 0003     Load word at G3 (OUTPUT)
   0ed2: LOD  02 000a     Load word at G10
   0ed5: SLDC 00          Short load constant 0
   0ed6: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
-> 0ed9: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC52(PARAM1; PARAM2) (* P=52 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0ee6: LOD  01 0001     Load word at G1 (SYSCOM)
   0ee9: SRO  0003        Store global word BASE3
   0eeb: SLDO 01          Short load global BASE1
   0eec: SLDC 00          Short load constant 0
   0eed: NEQI             Integer TOS-1 <> TOS
   0eee: FJP  $0f1e       Jump if TOS false
   0ef0: SLDO 03          Short load global BASE3
   0ef1: INC  0024        Inc field ptr (TOS+36)
   0ef3: SLDO 02          Short load global BASE2
   0ef4: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0ef7: LDP              Load packed field (TOS)
   0ef8: FJP  $0f07       Jump if TOS false
   0efa: LOD  01 0003     Load word at G3 (OUTPUT)
   0efd: SLDO 03          Short load global BASE3
   0efe: INC  001f        Inc field ptr (TOS+31)
   0f00: SLDC 08          Short load constant 8
   0f01: SLDC 00          Short load constant 0
   0f02: LDP              Load packed field (TOS)
   0f03: SLDC 00          Short load constant 0
   0f04: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 0f07: LOD  01 0003     Load word at G3 (OUTPUT)
   0f0a: SLDO 01          Short load global BASE1
   0f0b: SLDC 00          Short load constant 0
   0f0c: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0f0f: SLDC 0b          Short load constant 11
   0f10: SLDC 00          Short load constant 0
   0f11: GRTI             Integer TOS-1 > TOS
   0f12: FJP  $0f1e       Jump if TOS false
   0f14: LOD  01 0003     Load word at G3 (OUTPUT)
   0f17: LDA  01 0074     Load addr G116
   0f1a: SLDC 00          Short load constant 0
   0f1b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0f1e: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC53(PARAM1; PARAM2; PARAM3): RETVAL (* P=53 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM3
  BASE4=PARAM2
  BASE5=PARAM1
  BASE6
  BASE7
BEGIN
-> 0f2a: SLDC 00          Short load constant 0
   0f2b: SRO  0001        Store global word BASE1
   0f2d: LOD  01 0001     Load word at G1 (SYSCOM)
   0f30: SRO  0006        Store global word BASE6
   0f32: SLDO 06          Short load global BASE6
   0f33: INC  001f        Inc field ptr (TOS+31)
   0f35: SRO  0007        Store global word BASE7
   0f37: SLDO 05          Short load global BASE5
   0f38: SLDO 06          Short load global BASE6
   0f39: INC  002c        Inc field ptr (TOS+44)
   0f3b: SLDC 08          Short load constant 8
   0f3c: SLDC 00          Short load constant 0
   0f3d: LDP              Load packed field (TOS)
   0f3e: EQUI             Integer TOS-1 = TOS
   0f3f: FJP  $0f70       Jump if TOS false
   0f41: SLDC 01          Short load constant 1
   0f42: SRO  0001        Store global word BASE1
-> 0f44: SLDO 04          Short load global BASE4
   0f45: SIND 00          Short index load *TOS+0
   0f46: SLDC 01          Short load constant 1
   0f47: GRTI             Integer TOS-1 > TOS
   0f48: FJP  $0f65       Jump if TOS false
   0f4a: SLDO 04          Short load global BASE4
   0f4b: SLDO 04          Short load global BASE4
   0f4c: SIND 00          Short index load *TOS+0
   0f4d: SLDC 01          Short load constant 1
   0f4e: SBI              Subtract integers (TOS-1 - TOS)
   0f4f: STO              Store indirect (TOS into TOS-1)
   0f50: SLDO 03          Short load global BASE3
   0f51: SLDO 04          Short load global BASE4
   0f52: SIND 00          Short index load *TOS+0
   0f53: LDB              Load byte at byte ptr TOS-1 + TOS
   0f54: SLDC 20          Short load constant 32
   0f55: GEQI             Integer TOS-1 >= TOS
   0f56: FJP  $0f63       Jump if TOS false
   0f58: LOD  01 0003     Load word at G3 (OUTPUT)
   0f5b: LDA  01 01b4     Load addr G436
   0f5f: SLDC 00          Short load constant 0
   0f60: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0f63: UJP  $0f44       Unconditional jump
-> 0f65: SLDC 02          Short load constant 2
   0f66: SLDO 07          Short load global BASE7
   0f67: INC  0001        Inc field ptr (TOS+1)
   0f69: SLDC 08          Short load constant 8
   0f6a: SLDC 08          Short load constant 8
   0f6b: LDP              Load packed field (TOS)
   0f6c: CBP  34          Call base procedure PASCALSY.52
   0f6e: UJP  $0f9c       Unconditional jump
-> 0f70: SLDO 05          Short load global BASE5
   0f71: SLDO 06          Short load global BASE6
   0f72: INC  002b        Inc field ptr (TOS+43)
   0f74: SLDC 08          Short load constant 8
   0f75: SLDC 00          Short load constant 0
   0f76: LDP              Load packed field (TOS)
   0f77: EQUI             Integer TOS-1 = TOS
   0f78: FJP  $0f9c       Jump if TOS false
   0f7a: SLDC 01          Short load constant 1
   0f7b: SRO  0001        Store global word BASE1
   0f7d: SLDO 04          Short load global BASE4
   0f7e: SIND 00          Short index load *TOS+0
   0f7f: SLDC 01          Short load constant 1
   0f80: GRTI             Integer TOS-1 > TOS
   0f81: FJP  $0f9c       Jump if TOS false
   0f83: SLDO 04          Short load global BASE4
   0f84: SLDO 04          Short load global BASE4
   0f85: SIND 00          Short index load *TOS+0
   0f86: SLDC 01          Short load constant 1
   0f87: SBI              Subtract integers (TOS-1 - TOS)
   0f88: STO              Store indirect (TOS into TOS-1)
   0f89: SLDO 03          Short load global BASE3
   0f8a: SLDO 04          Short load global BASE4
   0f8b: SIND 00          Short index load *TOS+0
   0f8c: LDB              Load byte at byte ptr TOS-1 + TOS
   0f8d: SLDC 20          Short load constant 32
   0f8e: GEQI             Integer TOS-1 >= TOS
   0f8f: FJP  $0f9c       Jump if TOS false
   0f91: LOD  01 0003     Load word at G3 (OUTPUT)
   0f94: LDA  01 01b8     Load addr G440
   0f98: SLDC 00          Short load constant 0
   0f99: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0f9c: RBP  01          Return from base procedure
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
-> 0faa: SLDL 03          Short load local MP3
   0fab: SLDC 3f          Short load constant 63
   0fac: GRTI             Integer TOS-1 > TOS
   0fad: FJP  $0fb4       Jump if TOS false
   0faf: SLDC 3f          Short load constant 63
   0fb0: STL  0008        Store TOS into MP8
   0fb2: UJP  $0fb7       Unconditional jump
-> 0fb4: SLDL 03          Short load local MP3
   0fb5: STL  0008        Store TOS into MP8
-> 0fb7: SLDL 08          Short load local MP8
   0fb8: LDCI 0200        Load word 512
   0fbb: MPI              Multiply integers (TOS * TOS-1)
   0fbc: STL  0007        Store TOS into MP7
-> 0fbe: SLDL 03          Short load local MP3
   0fbf: SLDC 00          Short load constant 0
   0fc0: NEQI             Integer TOS-1 <> TOS
   0fc1: FJP  $1002       Jump if TOS false
   0fc3: SLDL 01          Short load local MP1
   0fc4: FJP  $0fd0       Jump if TOS false
   0fc6: SLDL 06          Short load local MP6
   0fc7: SLDL 05          Short load local MP5
   0fc8: SLDL 04          Short load local MP4
   0fc9: SLDL 07          Short load local MP7
   0fca: SLDL 02          Short load local MP2
   0fcb: SLDC 00          Short load constant 0
   0fcc: CSP  05          Call standard procedure UNITREAD
   0fce: UJP  $0fd8       Unconditional jump
-> 0fd0: SLDL 06          Short load local MP6
   0fd1: SLDL 05          Short load local MP5
   0fd2: SLDL 04          Short load local MP4
   0fd3: SLDL 07          Short load local MP7
   0fd4: SLDL 02          Short load local MP2
   0fd5: SLDC 00          Short load constant 0
   0fd6: CSP  06          Call standard procedure UNITWRITE
-> 0fd8: CSP  22          Call standard procedure IORESULT
   0fda: SLDC 00          Short load constant 0
   0fdb: NEQI             Integer TOS-1 <> TOS
   0fdc: FJP  $0fe2       Jump if TOS false
   0fde: SLDC 00          Short load constant 0
   0fdf: SLDC 36          Short load constant 54
   0fe0: CSP  04          Call standard procedure EXIT
-> 0fe2: SLDL 03          Short load local MP3
   0fe3: SLDL 08          Short load local MP8
   0fe4: SBI              Subtract integers (TOS-1 - TOS)
   0fe5: STL  0003        Store TOS into MP3
   0fe7: SLDL 04          Short load local MP4
   0fe8: SLDL 07          Short load local MP7
   0fe9: ADI              Add integers (TOS + TOS-1)
   0fea: STL  0004        Store TOS into MP4
   0fec: SLDL 02          Short load local MP2
   0fed: SLDL 08          Short load local MP8
   0fee: ADI              Add integers (TOS + TOS-1)
   0fef: STL  0002        Store TOS into MP2
   0ff1: SLDL 03          Short load local MP3
   0ff2: SLDL 08          Short load local MP8
   0ff3: LESI             Integer TOS-1 < TOS
   0ff4: FJP  $1000       Jump if TOS false
   0ff6: SLDL 03          Short load local MP3
   0ff7: STL  0008        Store TOS into MP8
   0ff9: SLDL 08          Short load local MP8
   0ffa: LDCI 0200        Load word 512
   0ffd: MPI              Multiply integers (TOS * TOS-1)
   0ffe: STL  0007        Store TOS into MP7
-> 1000: UJP  $0fbe       Unconditional jump
-> 1002: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC55 (* P=55 LL=1 *)
  BASE11
BEGIN
-> 1010: LOD  02 017d     Load word at G381
   1014: LOD  02 017f     Load word at G383
   1018: LDB              Load byte at byte ptr TOS-1 + TOS
   1019: SRO  000b        Store global word BASE11
   101b: LOD  02 017f     Load word at G383
   101f: SLDC 01          Short load constant 1
   1020: ADI              Add integers (TOS + TOS-1)
   1021: STR  02 017f     Store TOS to G383
   1025: LOD  02 017f     Load word at G383
   1029: LOD  02 0180     Load word at G384
   102d: GRTI             Integer TOS-1 > TOS
   102e: FJP  $1032       Jump if TOS false
   1030: CBP  2e          Call base procedure PASCALSY.46
-> 1032: SLDO 0b          Short load global BASE11
   1033: LOD  02 018b     Load word at G395
   1037: EQUI             Integer TOS-1 = TOS
   1038: LOD  02 017d     Load word at G381
   103c: LOD  02 017f     Load word at G383
   1040: LDB              Load byte at byte ptr TOS-1 + TOS
   1041: LOD  02 018b     Load word at G395
   1045: EQUI             Integer TOS-1 = TOS
   1046: LAND             Logical AND (TOS & TOS-1)
   1047: FJP  $104c       Jump if TOS false
   1049: SLDC 01          Short load constant 1
   104a: CBP  2d          Call base procedure PASCALSY.45
-> 104c: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC56 (* P=56 LL=0 *)
  BASE2
BEGIN
-> 1058: LDA  01 0036     Load addr G54
   105b: CSP  21          Call standard procedure RELEASE
-> 105d: LDA  01 007e     Load addr G126
   1060: LOD  01 0001     Load word at G1 (SYSCOM)
   1063: SIND 02          Short index load *TOS+2
   1064: IXA  0006        Index array (TOS-1 + TOS * 6)
   1066: LDA  01 003f     Load addr G63
   1069: NEQSTR           String TOS-1 <> TOS
   106b: FJP  $10c9       Jump if TOS false
   106d: LDA  01 0046     Load addr G70
   1070: NOP              No operation
   1071: LSA  08          Load string address: 'Put in :'
   107b: SAS  50          String assign (TOS to TOS-1, 80 chars)
   107d: LDA  01 003f     Load addr G63
   1080: LDA  01 0046     Load addr G70
   1083: SLDC 50          Short load constant 80
   1084: SLDC 08          Short load constant 8
   1085: CXP  00 18       Call external procedure PASCALSY.SINSERT
   1088: CBP  27          Call base procedure PASCALSY.39
   108a: LOD  01 0003     Load word at G3 (OUTPUT)
   108d: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1090: LOD  01 0003     Load word at G3 (OUTPUT)
   1093: LSA  11          Load string address: 'then press RETURN'
   10a6: NOP              No operation
   10a7: SLDC 00          Short load constant 0
   10a8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 10ab: LOD  01 0004     Load word at G4 (SYSTERM)
   10ae: LAO  0002        Load global BASE2
   10b0: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   10b3: LOD  01 0004     Load word at G4 (SYSTERM)
   10b6: SLDC 00          Short load constant 0
   10b7: SLDC 00          Short load constant 0
   10b8: CXP  00 0b       Call external procedure PASCALSY.FEOLN
   10bb: FJP  $10ab       Jump if TOS false
   10bd: LOD  01 0001     Load word at G1 (SYSCOM)
   10c0: SIND 02          Short index load *TOS+2
   10c1: SLDC 00          Short load constant 0
   10c2: SLDC 00          Short load constant 0
   10c3: CBP  2a          Call base procedure PASCALSY.42
   10c5: FJP  $10c7       Jump if TOS false
-> 10c7: UJP  $105d       Unconditional jump
-> 10c9: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC57 (* P=57 LL=1 *)
  MP1
BEGIN
-> 10da: UJP  $11b8       Unconditional jump
-> 10dc: LOD  02 0184     Load word at G388
   10e0: LNOT             Logical NOT (~TOS)
   10e1: FJP  $113a       Jump if TOS false
   10e3: CBP  38          Call base procedure PASCALSY.56
   10e5: LOD  02 0045     Load word at G69
   10e8: SLDC 00          Short load constant 0
   10e9: SLDC 00          Short load constant 0
   10ea: CXP  05 01       Call external procedure GETCMD.1
   10ed: STR  02 0045     Store TOS to G69
   10f0: LDA  02 0148     Load addr G328
   10f4: NOP              No operation
   10f5: LSA  00          Load string address: ''
   10f7: SAS  17          String assign (TOS to TOS-1, 23 chars)
   10f9: LOD  02 0045     Load word at G69
   10fc: UJP  $1121       Unconditional jump
   10fe: LOD  02 0186     Load word at G390
   1102: LNOT             Logical NOT (~TOS)
   1103: LOD  02 0188     Load word at G392
   1107: LOR              Logical OR (TOS | TOS-1)
   1108: FJP  $1116       Jump if TOS false
   110a: SLDC 00          Short load constant 0
   110b: STR  02 0188     Store TOS to G392
   110f: LDCN             Load constant NIL
   1110: LDCN             Load constant NIL
   1111: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   1114: UJP  $111f       Unconditional jump
-> 1116: SLDC 01          Short load constant 1
   1117: STR  02 0184     Store TOS to G388
   111b: SLDC 00          Short load constant 0
   111c: SLDC 39          Short load constant 57
   111d: CSP  04          Call standard procedure EXIT
-> 111f: UJP  $113a       Unconditional jump
-> 113a: LOD  02 0045     Load word at G69
   113d: LDCI 07fc        Load word 2044
   1140: SLDC 01          Short load constant 1
   1141: INN              Set membership (TOS-1 in set TOS)
   1142: FJP  $1156       Jump if TOS false
   1144: SLDC 00          Short load constant 0
   1145: STR  02 0184     Store TOS to G388
   1149: SLDC 03          Short load constant 3
   114a: CSP  26          Call standard procedure UNITCLEAR
   114c: LOD  02 0001     Load word at G1 (SYSCOM)
   114f: SIND 02          Short index load *TOS+2
   1150: SLDC 00          Short load constant 0
   1151: SLDC 00          Short load constant 0
   1152: CBP  2a          Call base procedure PASCALSY.42
   1154: FJP  $1156       Jump if TOS false
-> 1156: LOD  02 0045     Load word at G69
   1159: LDCI 00e0        Load word 224
   115c: SLDC 01          Short load constant 1
   115d: INN              Set membership (TOS-1 in set TOS)
   115e: FJP  $1184       Jump if TOS false
   1160: LOD  02 000a     Load word at G10
   1163: SLDC 00          Short load constant 0
   1164: EQUI             Integer TOS-1 = TOS
   1165: FJP  $1184       Jump if TOS false
   1167: LOD  02 0008     Load word at G8
   116a: SLDC 01          Short load constant 1
   116b: CBP  06          Call base procedure PASCALSY.FCLOSE
   116d: CSP  22          Call standard procedure IORESULT
   116f: SLDC 00          Short load constant 0
   1170: NEQI             Integer TOS-1 <> TOS
   1171: FJP  $1184       Jump if TOS false
   1173: CSP  22          Call standard procedure IORESULT
   1175: STL  0001        Store TOS into MP1
   1177: LOD  02 0003     Load word at G3 (OUTPUT)
   117a: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   117d: CBP  26          Call base procedure PASCALSY.38
   117f: SLDC 0a          Short load constant 10
   1180: SLDL 01          Short load local MP1
   1181: CXP  03 01       Call external procedure PRINTERR.PRINTERROR
-> 1184: LOD  02 0045     Load word at G69
   1187: SLDC 0c          Short load constant 12
   1188: SLDC 01          Short load constant 1
   1189: INN              Set membership (TOS-1 in set TOS)
   118a: FJP  $11a0       Jump if TOS false
   118c: LDA  02 0002     Load addr G2 (INPUT)
   118f: SLDC 00          Short load constant 0
   1190: IXA  0001        Index array (TOS-1 + TOS * 1)
   1192: SIND 00          Short index load *TOS+0
   1193: SLDC 00          Short load constant 0
   1194: CBP  06          Call base procedure PASCALSY.FCLOSE
   1196: LDA  02 0002     Load addr G2 (INPUT)
   1199: SLDC 01          Short load constant 1
   119a: IXA  0001        Index array (TOS-1 + TOS * 1)
   119c: SIND 00          Short index load *TOS+0
   119d: SLDC 01          Short load constant 1
   119e: CBP  06          Call base procedure PASCALSY.FCLOSE
-> 11a0: SLDC 01          Short load constant 1
   11a1: CSP  23          Call standard procedure UNITBUSY
   11a3: SLDC 02          Short load constant 2
   11a4: CSP  23          Call standard procedure UNITBUSY
   11a6: LOR              Logical OR (TOS | TOS-1)
   11a7: FJP  $11ac       Jump if TOS false
   11a9: SLDC 01          Short load constant 1
   11aa: CSP  26          Call standard procedure UNITCLEAR
-> 11ac: LOD  02 0045     Load word at G69
   11af: SLDC 00          Short load constant 0
   11b0: EQUI             Integer TOS-1 = TOS
   11b1: FJP  $10dc       Jump if TOS false
-> 11b3: SLDC 06          Short load constant 6
   11b4: CSP  16          Call standard procedure UNLOADSEGMENT
   11b6: UJP  $11bd       Unconditional jump
-> 11b8: SLDC 06          Short load constant 6
   11b9: CSP  15          Call standard procedure LOADSEGMENT
   11bb: UJP  $10dc       Unconditional jump
-> 11bd: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC58 (* P=58 LL=1 *)
BEGIN
-> 11d0: UJP  $11f9       Unconditional jump
-> 11d2: CBP  38          Call base procedure PASCALSY.56
   11d4: CGP  39          Call global procedure PASCALSY.57
   11d6: LOD  02 0185     Load word at G389
   11da: LNOT             Logical NOT (~TOS)
   11db: LOD  02 0184     Load word at G388
   11df: LAND             Logical AND (TOS & TOS-1)
   11e0: FJP  $11e9       Jump if TOS false
   11e2: LDCN             Load constant NIL
   11e3: LDCN             Load constant NIL
   11e4: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   11e7: UJP  $11ed       Unconditional jump
-> 11e9: SLDC 00          Short load constant 0
   11ea: SLDC 3a          Short load constant 58
   11eb: CSP  04          Call standard procedure EXIT
-> 11ed: LOD  02 0045     Load word at G69
   11f0: SLDC 00          Short load constant 0
   11f1: EQUI             Integer TOS-1 = TOS
   11f2: FJP  $11d2       Jump if TOS false
-> 11f4: SLDC 02          Short load constant 2
   11f5: CSP  16          Call standard procedure UNLOADSEGMENT
   11f7: UJP  $11fe       Unconditional jump
-> 11f9: SLDC 02          Short load constant 2
   11fa: CSP  15          Call standard procedure LOADSEGMENT
   11fc: UJP  $11d2       Unconditional jump
-> 11fe: RNP  00          Return from nonbase procedure
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
-> 07b6: UJP  $0c09       Unconditional jump
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
   08b0: ADJ  04          Adjust set to 4 words
   08b2: STM  04          Store 4 words at TOS to TOS-1
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
   0990: LNOT             Logical NOT (~TOS)
   0991: FJP  $0a13       Jump if TOS false
   0993: LOD  01 0003     Load word at G3 (OUTPUT)
   0996: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0999: LOD  01 0003     Load word at G3 (OUTPUT)
   099c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   099f: LOD  01 0003     Load word at G3 (OUTPUT)
   09a2: NOP              No operation
   09a3: LSA  29          Load string address: 'The 128K version of SYSTEM.PASCAL cannot '
   09ce: SLDC 00          Short load constant 0
   09cf: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09d2: LOD  01 0003     Load word at G3 (OUTPUT)
   09d5: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   09d8: LOD  01 0003     Load word at G3 (OUTPUT)
   09db: LSA  28          Load string address: 'run with the 64K version of SYSTEM.APPLE'
   0a05: NOP              No operation
   0a06: SLDC 00          Short load constant 0
   0a07: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a0a: LOD  01 0003     Load word at G3 (OUTPUT)
   0a0d: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0a10: SLDC 00          Short load constant 0
   0a11: FJP  $0a10       Jump if TOS false
-> 0a13: LOD  01 0003     Load word at G3 (OUTPUT)
   0a16: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a19: LOD  01 0189     Load word at G393
   0a1d: FJP  $0bdf       Jump if TOS false
   0a1f: LDO  0037        Load global word BASE55
   0a21: LNOT             Logical NOT (~TOS)
   0a22: FJP  $0bdd       Jump if TOS false
   0a24: LOD  01 0001     Load word at G1 (SYSCOM)
   0a27: SRO  003a        Store global word BASE58
   0a29: LDO  003a        Load global word BASE58
   0a2b: INC  001d        Inc field ptr (TOS+29)
   0a2d: SLDC 01          Short load constant 1
   0a2e: SLDC 03          Short load constant 3
   0a2f: LDP              Load packed field (TOS)
   0a30: FJP  $0a4b       Jump if TOS false
   0a32: SLDC 00          Short load constant 0
   0a33: LDO  003a        Load global word BASE58
   0a35: IND  0025        Static index and load word (TOS+37)
   0a37: SLDC 03          Short load constant 3
   0a38: DVI              Divide integers (TOS-1 / TOS)
   0a39: CXP  00 1d       Call external procedure PASCALSY.FGOTOXY
   0a3c: SLDC 0b          Short load constant 11
   0a3d: SLDC 00          Short load constant 0
   0a3e: GRTI             Integer TOS-1 > TOS
   0a3f: FJP  $0a4b       Jump if TOS false
   0a41: LOD  01 0003     Load word at G3 (OUTPUT)
   0a44: LDA  01 0074     Load addr G116
   0a47: SLDC 00          Short load constant 0
   0a48: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0a4b: LOD  01 0003     Load word at G3 (OUTPUT)
   0a4e: NOP              No operation
   0a4f: LSA  08          Load string address: 'Welcome '
   0a59: SLDC 00          Short load constant 0
   0a5a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a5d: LOD  01 0003     Load word at G3 (OUTPUT)
   0a60: LDA  01 003f     Load addr G63
   0a63: SLDC 00          Short load constant 0
   0a64: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a67: LOD  01 0003     Load word at G3 (OUTPUT)
   0a6a: NOP              No operation
   0a6b: LSA  18          Load string address: ', to Apple II Pascal 1.2'
   0a85: SLDC 00          Short load constant 0
   0a86: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a89: LOD  01 0003     Load word at G3 (OUTPUT)
   0a8c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a8f: LOD  01 0003     Load word at G3 (OUTPUT)
   0a92: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a95: LOD  01 0003     Load word at G3 (OUTPUT)
   0a98: NOP              No operation
   0a99: LSA  19          Load string address: 'Based on UCSD Pascal II.1'
   0ab4: SLDC 00          Short load constant 0
   0ab5: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ab8: LOD  01 0003     Load word at G3 (OUTPUT)
   0abb: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0abe: LOD  01 0003     Load word at G3 (OUTPUT)
   0ac1: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ac4: LOD  01 0003     Load word at G3 (OUTPUT)
   0ac7: LSA  10          Load string address: 'Current date is '
   0ad9: NOP              No operation
   0ada: SLDC 00          Short load constant 0
   0adb: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ade: LOD  01 0003     Load word at G3 (OUTPUT)
   0ae1: LDA  01 0043     Load addr G67
   0ae4: SLDC 05          Short load constant 5
   0ae5: SLDC 04          Short load constant 4
   0ae6: LDP              Load packed field (TOS)
   0ae7: SLDC 00          Short load constant 0
   0ae8: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0aeb: LOD  01 0003     Load word at G3 (OUTPUT)
   0aee: SLDC 2d          Short load constant 45
   0aef: SLDC 00          Short load constant 0
   0af0: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0af3: LOD  01 0003     Load word at G3 (OUTPUT)
   0af6: LAO  0017        Load global BASE23
   0af8: LDA  01 0043     Load addr G67
   0afb: SLDC 04          Short load constant 4
   0afc: SLDC 00          Short load constant 0
   0afd: LDP              Load packed field (TOS)
   0afe: IXA  0002        Index array (TOS-1 + TOS * 2)
   0b00: SLDC 00          Short load constant 0
   0b01: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b04: LOD  01 0003     Load word at G3 (OUTPUT)
   0b07: SLDC 2d          Short load constant 45
   0b08: SLDC 00          Short load constant 0
   0b09: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0b0c: LOD  01 0003     Load word at G3 (OUTPUT)
   0b0f: LDA  01 0043     Load addr G67
   0b12: SLDC 07          Short load constant 7
   0b13: SLDC 09          Short load constant 9
   0b14: LDP              Load packed field (TOS)
   0b15: SLDC 00          Short load constant 0
   0b16: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0b19: SLDC 01          Short load constant 1
   0b1a: SRO  0016        Store global word BASE22
   0b1c: SLDC 03          Short load constant 3
   0b1d: SRO  003b        Store global word BASE59
-> 0b1f: LDO  0016        Load global word BASE22
   0b21: LDO  003b        Load global word BASE59
   0b23: LEQI             Integer TOS-1 <= TOS
   0b24: FJP  $0b34       Jump if TOS false
   0b26: LOD  01 0003     Load word at G3 (OUTPUT)
   0b29: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b2c: LDO  0016        Load global word BASE22
   0b2e: SLDC 01          Short load constant 1
   0b2f: ADI              Add integers (TOS + TOS-1)
   0b30: SRO  0016        Store global word BASE22
   0b32: UJP  $0b1f       Unconditional jump
-> 0b34: LOD  01 0003     Load word at G3 (OUTPUT)
   0b37: LSA  1a          Load string address: 'Pascal system size is 128K'
   0b53: NOP              No operation
   0b54: SLDC 00          Short load constant 0
   0b55: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b58: LOD  01 0003     Load word at G3 (OUTPUT)
   0b5b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b5e: SLDC 01          Short load constant 1
   0b5f: SRO  0016        Store global word BASE22
   0b61: SLDC 03          Short load constant 3
   0b62: SRO  003b        Store global word BASE59
-> 0b64: LDO  0016        Load global word BASE22
   0b66: LDO  003b        Load global word BASE59
   0b68: LEQI             Integer TOS-1 <= TOS
   0b69: FJP  $0b79       Jump if TOS false
   0b6b: LOD  01 0003     Load word at G3 (OUTPUT)
   0b6e: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b71: LDO  0016        Load global word BASE22
   0b73: SLDC 01          Short load constant 1
   0b74: ADI              Add integers (TOS + TOS-1)
   0b75: SRO  0016        Store global word BASE22
   0b77: UJP  $0b64       Unconditional jump
-> 0b79: LOD  01 0003     Load word at G3 (OUTPUT)
   0b7c: NOP              No operation
   0b7d: LSA  27          Load string address: 'Copyright Apple Computer 1979,1980,1983'
   0ba6: SLDC 00          Short load constant 0
   0ba7: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0baa: LOD  01 0003     Load word at G3 (OUTPUT)
   0bad: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0bb0: LOD  01 0003     Load word at G3 (OUTPUT)
   0bb3: LSA  1b          Load string address: 'Copyright U.C. Regents 1979'
   0bd0: NOP              No operation
   0bd1: SLDC 00          Short load constant 0
   0bd2: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0bd5: LOD  01 0003     Load word at G3 (OUTPUT)
   0bd8: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0bdb: UJP  $0bdd       Unconditional jump
-> 0bdd: UJP  $0c04       Unconditional jump
-> 0bdf: LOD  01 0003     Load word at G3 (OUTPUT)
   0be2: NOP              No operation
   0be3: LSA  15          Load string address: 'System re-initialized'
   0bfa: SLDC 00          Short load constant 0
   0bfb: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0bfe: LOD  01 0003     Load word at G3 (OUTPUT)
   0c01: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0c04: SLDC 06          Short load constant 6
   0c05: CSP  16          Call standard procedure UNLOADSEGMENT
   0c07: UJP  $0c0e       Unconditional jump
-> 0c09: SLDC 06          Short load constant 6
   0c0a: CSP  15          Call standard procedure LOADSEGMENT
   0c0c: UJP  $07b8       Unconditional jump
-> 0c0e: RBP  00          Return from base procedure
END

### PROCEDURE INITIALI.INITSYSCOM (* P=2 LL=1 *)
  MP1
  MP42
  MP71
  MP72
  MP73
  MP79
  MP283
  MP288
  MP290
  MP299
  MP573
  MP574
  MP575
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
   00ee: LLA  011b        Load local address MP283
   00f1: LDCN             Load constant NIL
   00f2: SLDC 01          Short load constant 1
   00f3: NGI              Negate integer
   00f4: CXP  00 03       Call external procedure PASCALSY.FINIT
   00f7: LLA  011b        Load local address MP283
   00fa: LLA  0001        Load local address MP1
   00fc: SLDC 01          Short load constant 1
   00fd: LDCN             Load constant NIL
   00fe: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0101: LDL  0120        Load local word MP288
   0104: FJP  $0143       Jump if TOS false
   0106: LDL  0122        Load local word MP290
   0109: LLA  002a        Load local address MP42
   010b: SLDC 00          Short load constant 0
   010c: LDCI 01e0        Load word 480
   010f: LDL  012b        Load local word MP299
   0112: SLDC 00          Short load constant 0
   0113: CSP  05          Call standard procedure UNITREAD
   0115: LOD  02 0001     Load word at G1 (SYSCOM)
   0118: STL  023d        Store TOS into MP573
   011b: LDL  023d        Load local word MP573
   011e: INC  001d        Inc field ptr (TOS+29)
   0120: LLA  0047        Load local address MP71
   0122: MOV  0001        Move 1 words (TOS to TOS-1)
   0124: LDL  023d        Load local word MP573
   0127: INC  001e        Inc field ptr (TOS+30)
   0129: LDL  0048        Load local word MP72
   012b: STO              Store indirect (TOS into TOS-1)
   012c: LDL  023d        Load local word MP573
   012f: INC  001f        Inc field ptr (TOS+31)
   0131: LLA  0049        Load local address MP73
   0133: MOV  0006        Move 6 words (TOS to TOS-1)
   0135: LDL  023d        Load local word MP573
   0138: INC  0025        Inc field ptr (TOS+37)
   013a: LLA  004f        Load local address MP79
   013c: MOV  000b        Move 11 words (TOS to TOS-1)
   013e: LDA  02 0074     Load addr G116
   0141: CLP  03          Call local procedure INITIALI.INIT_FILLER
-> 0143: LLA  011b        Load local address MP283
   0146: SLDC 00          Short load constant 0
   0147: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   014a: SLDC 01          Short load constant 1
   014b: CSP  26          Call standard procedure UNITCLEAR
   014d: LOD  02 0001     Load word at G1 (SYSCOM)
   0150: STL  023d        Store TOS into MP573
   0153: LDL  023d        Load local word MP573
   0156: INC  0001        Inc field ptr (TOS+1)
   0158: SLDC 00          Short load constant 0
   0159: STO              Store indirect (TOS into TOS-1)
   015a: LDL  023d        Load local word MP573
   015d: SLDC 00          Short load constant 0
   015e: STO              Store indirect (TOS into TOS-1)
   015f: LDL  023d        Load local word MP573
   0162: INC  0003        Inc field ptr (TOS+3)
   0164: SLDC 00          Short load constant 0
   0165: STO              Store indirect (TOS into TOS-1)
   0166: LDL  023d        Load local word MP573
   0169: INC  0025        Inc field ptr (TOS+37)
   016b: STL  023e        Store TOS into MP574
   016e: LDA  02 0138     Load addr G312
   0172: LDL  023e        Load local word MP574
   0175: INC  0008        Inc field ptr (TOS+8)
   0177: SLDC 08          Short load constant 8
   0178: SLDC 00          Short load constant 0
   0179: LDP              Load packed field (TOS)
   017a: SGS              Build singleton set [TOS]
   017b: ADJ  10          Adjust set to 16 words
   017d: STM  10          Store 16 words at TOS to TOS-1
   017f: SLDC 00          Short load constant 0
   0180: LDL  023e        Load local word MP574
   0183: INC  0003        Inc field ptr (TOS+3)
   0185: SLDC 08          Short load constant 8
   0186: SLDC 08          Short load constant 8
   0187: LDP              Load packed field (TOS)
   0188: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   018a: SLDC 01          Short load constant 1
   018b: LDL  023e        Load local word MP574
   018e: INC  0003        Inc field ptr (TOS+3)
   0190: SLDC 08          Short load constant 8
   0191: SLDC 00          Short load constant 0
   0192: LDP              Load packed field (TOS)
   0193: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0195: SLDC 03          Short load constant 3
   0196: LDL  023e        Load local word MP574
   0199: INC  0002        Inc field ptr (TOS+2)
   019b: SLDC 08          Short load constant 8
   019c: SLDC 08          Short load constant 8
   019d: LDP              Load packed field (TOS)
   019e: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01a0: SLDC 02          Short load constant 2
   01a1: LDL  023e        Load local word MP574
   01a4: INC  0002        Inc field ptr (TOS+2)
   01a6: SLDC 08          Short load constant 8
   01a7: SLDC 00          Short load constant 0
   01a8: LDP              Load packed field (TOS)
   01a9: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01ab: SLDC 0b          Short load constant 11
   01ac: LDL  023e        Load local word MP574
   01af: INC  0006        Inc field ptr (TOS+6)
   01b1: SLDC 08          Short load constant 8
   01b2: SLDC 00          Short load constant 0
   01b3: LDP              Load packed field (TOS)
   01b4: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01b6: SLDC 08          Short load constant 8
   01b7: LDL  023e        Load local word MP574
   01ba: INC  0004        Inc field ptr (TOS+4)
   01bc: SLDC 08          Short load constant 8
   01bd: SLDC 00          Short load constant 0
   01be: LDP              Load packed field (TOS)
   01bf: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01c1: SLDC 09          Short load constant 9
   01c2: LDL  023e        Load local word MP574
   01c5: INC  0007        Inc field ptr (TOS+7)
   01c7: SLDC 08          Short load constant 8
   01c8: SLDC 08          Short load constant 8
   01c9: LDP              Load packed field (TOS)
   01ca: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01cc: SLDC 0a          Short load constant 10
   01cd: LDL  023e        Load local word MP574
   01d0: INC  0007        Inc field ptr (TOS+7)
   01d2: SLDC 08          Short load constant 8
   01d3: SLDC 00          Short load constant 0
   01d4: LDP              Load packed field (TOS)
   01d5: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01d7: SLDC 0d          Short load constant 13
   01d8: LDL  023e        Load local word MP574
   01db: IND  0009        Static index and load word (TOS+9)
   01dd: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01df: SLDC 0c          Short load constant 12
   01e0: LDL  023e        Load local word MP574
   01e3: INC  0008        Inc field ptr (TOS+8)
   01e5: SLDC 08          Short load constant 8
   01e6: SLDC 08          Short load constant 8
   01e7: LDP              Load packed field (TOS)
   01e8: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01ea: LDL  023d        Load local word MP573
   01ed: INC  001f        Inc field ptr (TOS+31)
   01ef: STL  023e        Store TOS into MP574
   01f2: SLDC 00          Short load constant 0
   01f3: LDL  023e        Load local word MP574
   01f6: INC  0002        Inc field ptr (TOS+2)
   01f8: SLDC 08          Short load constant 8
   01f9: SLDC 08          Short load constant 8
   01fa: LDP              Load packed field (TOS)
   01fb: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   01fd: SLDC 01          Short load constant 1
   01fe: LDL  023e        Load local word MP574
   0201: INC  0002        Inc field ptr (TOS+2)
   0203: SLDC 08          Short load constant 8
   0204: SLDC 00          Short load constant 0
   0205: LDP              Load packed field (TOS)
   0206: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0208: SLDC 02          Short load constant 2
   0209: LDL  023e        Load local word MP574
   020c: INC  0001        Inc field ptr (TOS+1)
   020e: SLDC 08          Short load constant 8
   020f: SLDC 08          Short load constant 8
   0210: LDP              Load packed field (TOS)
   0211: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0213: SLDC 04          Short load constant 4
   0214: LDL  023e        Load local word MP574
   0217: SLDC 08          Short load constant 8
   0218: SLDC 08          Short load constant 8
   0219: LDP              Load packed field (TOS)
   021a: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   021c: SLDC 03          Short load constant 3
   021d: LDL  023e        Load local word MP574
   0220: INC  0001        Inc field ptr (TOS+1)
   0222: SLDC 08          Short load constant 8
   0223: SLDC 00          Short load constant 0
   0224: LDP              Load packed field (TOS)
   0225: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0227: SLDC 05          Short load constant 5
   0228: LDL  023e        Load local word MP574
   022b: INC  0003        Inc field ptr (TOS+3)
   022d: SLDC 08          Short load constant 8
   022e: SLDC 00          Short load constant 0
   022f: LDP              Load packed field (TOS)
   0230: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0232: SLDC 06          Short load constant 6
   0233: LDL  023e        Load local word MP574
   0236: INC  0004        Inc field ptr (TOS+4)
   0238: SLDC 08          Short load constant 8
   0239: SLDC 08          Short load constant 8
   023a: LDP              Load packed field (TOS)
   023b: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   023d: SLDC 07          Short load constant 7
   023e: LDL  023e        Load local word MP574
   0241: INC  0004        Inc field ptr (TOS+4)
   0243: SLDC 08          Short load constant 8
   0244: SLDC 00          Short load constant 0
   0245: LDP              Load packed field (TOS)
   0246: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0248: LDA  02 0138     Load addr G312
   024c: LDA  02 0138     Load addr G312
   0250: LDM  10          Load 16 words from (TOS)
   0252: SLDC 10          Short load constant 16
   0253: LDL  023e        Load local word MP574
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
   0275: LDL  023e        Load local word MP574
   0278: INC  0005        Inc field ptr (TOS+5)
   027a: SLDC 05          Short load constant 5
   027b: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   027e: LDP              Load packed field (TOS)
   027f: FJP  $028f       Jump if TOS false
   0281: LDA  02 01b8     Load addr G440
   0285: SLDC 01          Short load constant 1
   0286: LDL  023e        Load local word MP574
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
   029b: LDL  023e        Load local word MP574
   029e: INC  0003        Inc field ptr (TOS+3)
   02a0: SLDC 08          Short load constant 8
   02a1: SLDC 00          Short load constant 0
   02a2: LDP              Load packed field (TOS)
   02a3: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   02a4: LDA  02 01b8     Load addr G440
   02a8: SLDC 00          Short load constant 0
   02a9: STL  023f        Store TOS into MP575
   02ac: LLA  023f        Load local address MP575
   02af: LDA  02 01b8     Load addr G440
   02b3: SLDC 06          Short load constant 6
   02b4: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   02b7: LLA  023f        Load local address MP575
   02ba: LDA  02 01b8     Load addr G440
   02be: SLDC 0c          Short load constant 12
   02bf: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   02c2: LLA  023f        Load local address MP575
   02c5: SAS  06          String assign (TOS to TOS-1, 6 chars)
   02c7: LDA  02 01b8     Load addr G440
   02cb: SLDC 00          Short load constant 0
   02cc: SLDC 05          Short load constant 5
   02cd: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   02ce: LDA  02 01b4     Load addr G436
   02d2: LDA  02 01b8     Load addr G440
   02d6: SAS  06          String assign (TOS to TOS-1, 6 chars)
   02d8: LDL  023e        Load local word MP574
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
-> 143a: LOD  01 003a     Load word at G58
   143d: INC  0002        Inc field ptr (TOS+2)
   143f: SLDC 00          Short load constant 0
   1440: STO              Store indirect (TOS into TOS-1)
   1441: LOD  01 0039     Load word at G57
   1444: INC  0002        Inc field ptr (TOS+2)
   1446: SLDC 00          Short load constant 0
   1447: STO              Store indirect (TOS into TOS-1)
   1448: LOD  01 0038     Load word at G56
   144b: INC  0002        Inc field ptr (TOS+2)
   144d: SLDC 00          Short load constant 0
   144e: STO              Store indirect (TOS into TOS-1)
   144f: LDA  01 0002     Load addr G2 (INPUT)
   1452: SLDC 00          Short load constant 0
   1453: IXA  0001        Index array (TOS-1 + TOS * 1)
   1455: LOD  01 003a     Load word at G58
   1458: STO              Store indirect (TOS into TOS-1)
   1459: LDA  01 0002     Load addr G2 (INPUT)
   145c: SLDC 01          Short load constant 1
   145d: IXA  0001        Index array (TOS-1 + TOS * 1)
   145f: LOD  01 0039     Load word at G57
   1462: STO              Store indirect (TOS into TOS-1)
   1463: SLDO 03          Short load global BASE3
   1464: SLDC 00          Short load constant 0
   1465: EQUI             Integer TOS-1 = TOS
   1466: FJP  $1497       Jump if TOS false
   1468: LOD  01 0189     Load word at G393
   146c: FJP  $1497       Jump if TOS false
   146e: SLDC 00          Short load constant 0
   146f: STR  01 0189     Store TOS to G393
   1473: LSA  0e          Load string address: '*SYSTEM.ATTACH'
   1483: NOP              No operation
   1484: SLDC 00          Short load constant 0
   1485: SLDC 00          Short load constant 0
   1486: SLDC 00          Short load constant 0
   1487: LAO  0006        Load global BASE6
   1489: SLDC 01          Short load constant 1
   148a: SLDC 00          Short load constant 0
   148b: SLDC 00          Short load constant 0
   148c: CLP  13          Call local procedure GETCMD.19
   148e: FJP  $1497       Jump if TOS false
   1490: SLDC 0a          Short load constant 10
   1491: SRO  0001        Store global word BASE1
   1493: SLDC 05          Short load constant 5
   1494: SLDC 01          Short load constant 1
   1495: CSP  04          Call standard procedure EXIT
-> 1497: SLDO 03          Short load global BASE3
   1498: SLDC 0a          Short load constant 10
   1499: EQUI             Integer TOS-1 = TOS
   149a: FJP  $149f       Jump if TOS false
   149c: SLDC 00          Short load constant 0
   149d: SRO  0003        Store global word BASE3
-> 149f: SLDO 03          Short load global BASE3
   14a0: SLDC 00          Short load constant 0
   14a1: EQUI             Integer TOS-1 = TOS
   14a2: FJP  $14cc       Jump if TOS false
   14a4: NOP              No operation
   14a5: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   14b6: SLDC 00          Short load constant 0
   14b7: SLDC 00          Short load constant 0
   14b8: SLDC 00          Short load constant 0
   14b9: LAO  0006        Load global BASE6
   14bb: SLDC 00          Short load constant 0
   14bc: SLDC 00          Short load constant 0
   14bd: SLDC 00          Short load constant 0
   14be: CLP  13          Call local procedure GETCMD.19
   14c0: FJP  $14cc       Jump if TOS false
   14c2: CXP  00 25       Call external procedure PASCALSY.37
   14c5: SLDC 04          Short load constant 4
   14c6: SRO  0001        Store global word BASE1
   14c8: SLDC 05          Short load constant 5
   14c9: SLDC 01          Short load constant 1
   14ca: CSP  04          Call standard procedure EXIT
-> 14cc: SLDO 03          Short load global BASE3
   14cd: LDCI 00e0        Load word 224
   14d0: SLDC 01          Short load constant 1
   14d1: INN              Set membership (TOS-1 in set TOS)
   14d2: FJP  $14d6       Jump if TOS false
   14d4: CLP  16          Call local procedure GETCMD.22
-> 14d6: SLDO 03          Short load global BASE3
   14d7: LDCI 0300        Load word 768
   14da: SLDC 01          Short load constant 1
   14db: INN              Set membership (TOS-1 in set TOS)
   14dc: FJP  $14e1       Jump if TOS false
   14de: SLDC 00          Short load constant 0
   14df: CLP  02          Call local procedure GETCMD.2
-> 14e1: LOD  01 0001     Load word at G1 (SYSCOM)
   14e4: INC  001d        Inc field ptr (TOS+29)
   14e6: SLDC 02          Short load constant 2
   14e7: SLDC 07          Short load constant 7
   14e8: LDP              Load packed field (TOS)
   14e9: SLDC 01          Short load constant 1
   14ea: EQUI             Integer TOS-1 = TOS
   14eb: FJP  $1505       Jump if TOS false
   14ed: SLDO 03          Short load global BASE3
   14ee: SLDC 00          Short load constant 0
   14ef: EQUI             Integer TOS-1 = TOS
   14f0: FJP  $14fa       Jump if TOS false
   14f2: SLDC 06          Short load constant 6
   14f3: SRO  0003        Store global word BASE3
   14f5: SLDC 01          Short load constant 1
   14f6: CLP  02          Call local procedure GETCMD.2
   14f8: UJP  $1505       Unconditional jump
-> 14fa: LDCN             Load constant NIL
   14fb: STR  01 0036     Store TOS to G54
   14fe: SLDC 00          Short load constant 0
   14ff: SRO  0001        Store global word BASE1
   1501: SLDC 05          Short load constant 5
   1502: SLDC 01          Short load constant 1
   1503: CSP  04          Call standard procedure EXIT
-> 1505: SLDC 00          Short load constant 0
   1506: STR  01 000a     Store TOS to G10
   1509: SLDC 00          Short load constant 0
   150a: STR  01 000b     Store TOS to G11
   150d: SLDC 00          Short load constant 0
   150e: STR  01 000c     Store TOS to G12
   1511: SLDC 00          Short load constant 0
   1512: SRO  0005        Store global word BASE5
   1514: LDA  01 0148     Load addr G328
   1518: SLDC 00          Short load constant 0
   1519: LDB              Load byte at byte ptr TOS-1 + TOS
   151a: SLDC 00          Short load constant 0
   151b: NEQI             Integer TOS-1 <> TOS
   151c: FJP  $1521       Jump if TOS false
   151e: SLDC 01          Short load constant 1
   151f: CLP  19          Call local procedure GETCMD.25
-> 1521: LDA  01 0046     Load addr G70
   1524: NOP              No operation
   1525: LSA  43          Load string address: 'Command: E(dit, R(un, F(ile, C(omp, L(ink, X(ecute, A(ssem, ? [1.2]'
   156a: SAS  50          String assign (TOS to TOS-1, 80 chars)
   156c: CXP  00 27       Call external procedure PASCALSY.39
   156f: SLDO 05          Short load global BASE5
   1570: SLDC 00          Short load constant 0
   1571: SLDC 00          Short load constant 0
   1572: CXP  00 29       Call external procedure PASCALSY.41
   1575: SRO  0004        Store global word BASE4
   1577: CXP  00 25       Call external procedure PASCALSY.37
   157a: SLDO 04          Short load global BASE4
   157b: SLDC 3f          Short load constant 63
   157c: EQUI             Integer TOS-1 = TOS
   157d: FJP  $15d2       Jump if TOS false
   157f: LDA  01 0046     Load addr G70
   1582: NOP              No operation
   1583: LSA  3d          Load string address: 'Command: U(ser restart, I(nitialize, H(alt, S(wap, M(ake exec'
   15c2: SAS  50          String assign (TOS to TOS-1, 80 chars)
   15c4: CXP  00 27       Call external procedure PASCALSY.39
   15c7: SLDO 05          Short load global BASE5
   15c8: SLDC 00          Short load constant 0
   15c9: SLDC 00          Short load constant 0
   15ca: CXP  00 29       Call external procedure PASCALSY.41
   15cd: SRO  0004        Store global word BASE4
   15cf: CXP  00 25       Call external procedure PASCALSY.37
-> 15d2: LOD  01 0187     Load word at G391
   15d6: FJP  $15e2       Jump if TOS false
   15d8: LDA  01 0036     Load addr G54
   15db: CSP  21          Call standard procedure RELEASE
   15dd: SLDC 00          Short load constant 0
   15de: STR  01 0187     Store TOS to G391
-> 15e2: SLDO 04          Short load global BASE4
   15e6: LDC  06          Load multiple-word constant
                         012c336a8000000000000000
   15f2: SLDC 06          Short load constant 6
   15f3: INN              Set membership (TOS-1 in set TOS)
   15f4: LNOT             Logical NOT (~TOS)
   15f5: SRO  0005        Store global word BASE5
   15f7: SLDO 05          Short load global BASE5
   15f8: LNOT             Logical NOT (~TOS)
   15f9: FJP  $172a       Jump if TOS false
   15fb: SLDO 04          Short load global BASE4
   15fc: UJP  $16f3       Unconditional jump
   15fe: LOD  01 0003     Load word at G3 (OUTPUT)
   1601: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1604: SLDC 02          Short load constant 2
   1605: SLDC 01          Short load constant 1
   1606: SLDC 00          Short load constant 0
   1607: SLDC 00          Short load constant 0
   1608: CLP  03          Call local procedure GETCMD.3
   160a: FJP  $1613       Jump if TOS false
   160c: SLDC 04          Short load constant 4
   160d: SRO  0001        Store global word BASE1
   160f: SLDC 05          Short load constant 5
   1610: SLDC 01          Short load constant 1
   1611: CSP  04          Call standard procedure EXIT
-> 1613: UJP  $172a       Unconditional jump
   1615: LOD  01 0003     Load word at G3 (OUTPUT)
   1618: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   161b: SLDC 03          Short load constant 3
   161c: SLDC 01          Short load constant 1
   161d: SLDC 00          Short load constant 0
   161e: SLDC 00          Short load constant 0
   161f: CLP  03          Call local procedure GETCMD.3
   1621: FJP  $162f       Jump if TOS false
   1623: SLDC 04          Short load constant 4
   1624: SRO  0001        Store global word BASE1
   1626: SLDC 01          Short load constant 1
   1627: STR  01 0188     Store TOS to G392
   162b: SLDC 05          Short load constant 5
   162c: SLDC 01          Short load constant 1
   162d: CSP  04          Call standard procedure EXIT
-> 162f: UJP  $172a       Unconditional jump
   1631: LOD  01 0003     Load word at G3 (OUTPUT)
   1634: NOP              No operation
   1635: LSA  0a          Load string address: 'Linking...'
   1641: SLDC 00          Short load constant 0
   1642: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1645: LOD  01 0003     Load word at G3 (OUTPUT)
   1648: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   164b: SLDC 04          Short load constant 4
   164c: SLDC 01          Short load constant 1
   164d: SLDC 00          Short load constant 0
   164e: SLDC 00          Short load constant 0
   164f: CLP  03          Call local procedure GETCMD.3
   1651: FJP  $165a       Jump if TOS false
   1653: SLDC 04          Short load constant 4
   1654: SRO  0001        Store global word BASE1
   1656: SLDC 05          Short load constant 5
   1657: SLDC 01          Short load constant 1
   1658: CSP  04          Call standard procedure EXIT
-> 165a: UJP  $172a       Unconditional jump
   165c: SLDC 00          Short load constant 0
   165d: CLP  19          Call local procedure GETCMD.25
   165f: UJP  $172a       Unconditional jump
   1661: SLDC 05          Short load constant 5
   1662: CLP  14          Call local procedure GETCMD.20
   1664: UJP  $172a       Unconditional jump
   1666: SLDC 08          Short load constant 8
   1667: CLP  14          Call local procedure GETCMD.20
   1669: UJP  $172a       Unconditional jump
   166b: SLDO 03          Short load global BASE3
   166c: SLDC 02          Short load constant 2
   166d: NEQI             Integer TOS-1 <> TOS
   166e: FJP  $1696       Jump if TOS false
   1670: LOD  01 0003     Load word at G3 (OUTPUT)
   1673: LSA  0d          Load string address: 'Restarting...'
   1682: NOP              No operation
   1683: SLDC 00          Short load constant 0
   1684: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1687: LOD  01 0003     Load word at G3 (OUTPUT)
   168a: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   168d: SLDC 04          Short load constant 4
   168e: SRO  0001        Store global word BASE1
   1690: SLDC 05          Short load constant 5
   1691: SLDC 01          Short load constant 1
   1692: CSP  04          Call standard procedure EXIT
   1694: UJP  $16b3       Unconditional jump
-> 1696: LOD  01 0003     Load word at G3 (OUTPUT)
   1699: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   169c: LOD  01 0003     Load word at G3 (OUTPUT)
   169f: LSA  0d          Load string address: 'U not allowed'
   16ae: NOP              No operation
   16af: SLDC 00          Short load constant 0
   16b0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 16b3: UJP  $172a       Unconditional jump
   16b5: SLDC 01          Short load constant 1
   16b6: CLP  02          Call local procedure GETCMD.2
   16b8: UJP  $172a       Unconditional jump
   16ba: LOD  01 0183     Load word at G387
   16be: LOD  01 0182     Load word at G386
   16c2: LOR              Logical OR (TOS | TOS-1)
   16c3: FJP  $16c9       Jump if TOS false
   16c5: SLDC 01          Short load constant 1
   16c6: CXP  00 2d       Call external procedure PASCALSY.45
-> 16c9: SLDC 00          Short load constant 0
   16ca: SRO  0001        Store global word BASE1
   16cc: SLDO 04          Short load global BASE4
   16cd: SLDC 48          Short load constant 72
   16ce: EQUI             Integer TOS-1 = TOS
   16cf: FJP  $16d5       Jump if TOS false
   16d1: LDCN             Load constant NIL
   16d2: STR  01 0036     Store TOS to G54
-> 16d5: SLDC 05          Short load constant 5
   16d6: SLDC 01          Short load constant 1
   16d7: CSP  04          Call standard procedure EXIT
   16d9: UJP  $172a       Unconditional jump
   16db: CLP  1a          Call local procedure GETCMD.26
   16dd: UJP  $172a       Unconditional jump
   16df: LOD  01 0182     Load word at G386
   16e3: LOD  01 0183     Load word at G387
   16e7: LOR              Logical OR (TOS | TOS-1)
   16e8: FJP  $16ef       Jump if TOS false
   16ea: SLDC 01          Short load constant 1
   16eb: CLP  17          Call local procedure GETCMD.23
   16ed: UJP  $16f1       Unconditional jump
-> 16ef: CLP  1b          Call local procedure GETCMD.27
-> 16f1: UJP  $172a       Unconditional jump
-> 172a: SLDC 00          Short load constant 0
   172b: FJP  $1521       Jump if TOS false
-> 172d: RBP  01          Return from base procedure
END

### PROCEDURE GETCMD.PROC2(PARAM1) (* P=2 LL=1 *)
  BASE1
  BASE3
  BASE6
  MP1=PARAM1
  MP2
BEGIN
-> 1070: LOD  02 0010     Load word at G16
   1073: FJP  $10db       Jump if TOS false
   1075: CXP  00 25       Call external procedure PASCALSY.37
   1078: LOD  02 0003     Load word at G3 (OUTPUT)
   107b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   107e: SLDC 00          Short load constant 0
   107f: STL  0002        Store TOS into MP2
   1081: LLA  0002        Load local address MP2
   1083: LDA  02 0012     Load addr G18
   1086: SLDC 07          Short load constant 7
   1087: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   108a: LLA  0002        Load local address MP2
   108c: NOP              No operation
   108d: LSA  01          Load string address: ':'
   1090: SLDC 08          Short load constant 8
   1091: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   1094: LLA  0002        Load local address MP2
   1096: LDA  02 001e     Load addr G30
   1099: SLDC 17          Short load constant 23
   109a: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   109d: LLA  0002        Load local address MP2
   109f: SLDL 01          Short load local MP1
   10a0: SLDC 01          Short load constant 1
   10a1: SLDC 01          Short load constant 1
   10a2: LAO  0006        Load global BASE6
   10a4: SLDC 00          Short load constant 0
   10a5: SLDC 00          Short load constant 0
   10a6: SLDC 00          Short load constant 0
   10a7: CGP  13          Call global procedure GETCMD.19
   10a9: FJP  $10cc       Jump if TOS false
   10ab: LOD  02 0003     Load word at G3 (OUTPUT)
   10ae: NOP              No operation
   10af: LSA  0a          Load string address: 'Running...'
   10bb: SLDC 00          Short load constant 0
   10bc: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   10bf: LOD  02 0003     Load word at G3 (OUTPUT)
   10c2: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   10c5: SLDC 04          Short load constant 4
   10c6: SRO  0001        Store global word BASE1
   10c8: SLDC 05          Short load constant 5
   10c9: SLDC 01          Short load constant 1
   10ca: CSP  04          Call standard procedure EXIT
-> 10cc: SLDO 03          Short load global BASE3
   10cd: LDCI 0300        Load word 768
   10d0: SLDC 01          Short load constant 1
   10d1: INN              Set membership (TOS-1 in set TOS)
   10d2: LNOT             Logical NOT (~TOS)
   10d3: FJP  $10d9       Jump if TOS false
   10d5: SLDC 00          Short load constant 0
   10d6: STR  02 0010     Store TOS to G16
-> 10d9: UJP  $10de       Unconditional jump
-> 10db: SLDC 06          Short load constant 6
   10dc: CGP  14          Call global procedure GETCMD.20
-> 10de: RNP  00          Return from nonbase procedure
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
-> 09c4: LDA  02 00fc     Load addr G252
   09c8: SLDL 04          Short load local MP4
   09c9: IXA  000c        Index array (TOS-1 + TOS * 12)
   09cb: SLDC 00          Short load constant 0
   09cc: SLDC 00          Short load constant 0
   09cd: SLDC 00          Short load constant 0
   09ce: LLA  0020        Load local address MP32
   09d0: SLDL 03          Short load local MP3
   09d1: SLDC 00          Short load constant 0
   09d2: SLDC 00          Short load constant 0
   09d3: CGP  13          Call global procedure GETCMD.19
   09d5: STL  0001        Store TOS into MP1
   09d7: LDL  0020        Load local word MP32
   09d9: SLDC 02          Short load constant 2
   09da: EQUI             Integer TOS-1 = TOS
   09db: FJP  $0a9b       Jump if TOS false
   09dd: LDA  02 00fc     Load addr G252
   09e1: SLDL 04          Short load local MP4
   09e2: IXA  000c        Index array (TOS-1 + TOS * 12)
   09e4: LLA  0005        Load local address MP5
   09e6: LLA  0009        Load local address MP9
   09e8: LLA  0011        Load local address MP17
   09ea: LLA  0012        Load local address MP18
   09ec: SLDC 00          Short load constant 0
   09ed: SLDC 00          Short load constant 0
   09ee: CXP  00 21       Call external procedure PASCALSY.33
   09f1: FJP  $0a9b       Jump if TOS false
   09f3: SLDC 00          Short load constant 0
   09f4: STL  0013        Store TOS into MP19
-> 09f6: LDL  0013        Load local word MP19
   09f8: SLDC 01          Short load constant 1
   09f9: ADI              Add integers (TOS + TOS-1)
   09fa: STL  0013        Store TOS into MP19
   09fc: LDA  02 007e     Load addr G126
   09ff: LDL  0013        Load local word MP19
   0a01: IXA  0006        Index array (TOS-1 + TOS * 6)
   0a03: STL  0021        Store TOS into MP33
   0a05: LDL  0021        Load local word MP33
   0a07: SIND 04          Short index load *TOS+4
   0a08: FJP  $0a70       Jump if TOS false
   0a0a: LDL  0021        Load local word MP33
   0a0c: NOP              No operation
   0a0d: LSA  00          Load string address: ''
   0a0f: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0a11: LDL  0013        Load local word MP19
   0a13: SLDC 00          Short load constant 0
   0a14: SLDC 00          Short load constant 0
   0a15: CXP  00 2a       Call external procedure PASCALSY.42
   0a18: FJP  $0a70       Jump if TOS false
   0a1a: LDL  0021        Load local word MP33
   0a1c: LOD  02 0001     Load word at G1 (SYSCOM)
   0a1f: SIND 04          Short index load *TOS+4
   0a20: SLDC 00          Short load constant 0
   0a21: IXA  000d        Index array (TOS-1 + TOS * 13)
   0a23: INC  0003        Inc field ptr (TOS+3)
   0a25: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0a27: LLA  0014        Load local address MP20
   0a29: SLDC 00          Short load constant 0
   0a2a: STL  0022        Store TOS into MP34
   0a2c: LLA  0022        Load local address MP34
   0a2e: LDL  0021        Load local word MP33
   0a30: SLDC 07          Short load constant 7
   0a31: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0a34: LLA  0022        Load local address MP34
   0a36: NOP              No operation
   0a37: LSA  01          Load string address: ':'
   0a3a: SLDC 08          Short load constant 8
   0a3b: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0a3e: LLA  0022        Load local address MP34
   0a40: LLA  0009        Load local address MP9
   0a42: SLDC 17          Short load constant 23
   0a43: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0a46: LLA  0022        Load local address MP34
   0a48: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0a4a: LLA  0014        Load local address MP20
   0a4c: LDA  02 00fc     Load addr G252
   0a50: SLDL 04          Short load local MP4
   0a51: IXA  000c        Index array (TOS-1 + TOS * 12)
   0a53: NEQSTR           String TOS-1 <> TOS
   0a55: FJP  $0a70       Jump if TOS false
   0a57: LLA  0014        Load local address MP20
   0a59: SLDC 00          Short load constant 0
   0a5a: SLDC 00          Short load constant 0
   0a5b: SLDC 00          Short load constant 0
   0a5c: LLA  0020        Load local address MP32
   0a5e: SLDL 03          Short load local MP3
   0a5f: SLDC 00          Short load constant 0
   0a60: SLDC 00          Short load constant 0
   0a61: CGP  13          Call global procedure GETCMD.19
   0a63: FJP  $0a70       Jump if TOS false
   0a65: LDA  02 00fc     Load addr G252
   0a69: SLDL 04          Short load local MP4
   0a6a: IXA  000c        Index array (TOS-1 + TOS * 12)
   0a6c: LLA  0014        Load local address MP20
   0a6e: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 0a70: LDL  0013        Load local word MP19
   0a72: SLDC 14          Short load constant 20
   0a73: EQUI             Integer TOS-1 = TOS
   0a74: LDL  0020        Load local word MP32
   0a76: SLDC 03          Short load constant 3
   0a77: SLDC 01          Short load constant 1
   0a78: INN              Set membership (TOS-1 in set TOS)
   0a79: LOR              Logical OR (TOS | TOS-1)
   0a7a: FJP  $09f6       Jump if TOS false
   0a7c: LDL  0020        Load local word MP32
   0a7e: SLDC 00          Short load constant 0
   0a7f: EQUI             Integer TOS-1 = TOS
   0a80: STL  0001        Store TOS into MP1
   0a82: LDL  0020        Load local word MP32
   0a84: SLDC 02          Short load constant 2
   0a85: EQUI             Integer TOS-1 = TOS
   0a86: FJP  $0a9b       Jump if TOS false
   0a88: LDA  02 00fc     Load addr G252
   0a8c: SLDL 04          Short load local MP4
   0a8d: IXA  000c        Index array (TOS-1 + TOS * 12)
   0a8f: SLDC 00          Short load constant 0
   0a90: SLDC 00          Short load constant 0
   0a91: SLDC 01          Short load constant 1
   0a92: LLA  0020        Load local address MP32
   0a94: SLDC 00          Short load constant 0
   0a95: SLDC 00          Short load constant 0
   0a96: SLDC 00          Short load constant 0
   0a97: CGP  13          Call global procedure GETCMD.19
   0a99: FJP  $0a9b       Jump if TOS false
-> 0a9b: RNP  01          Return from nonbase procedure
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
   0052: SLDC 3f          Short load constant 63
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

### PROCEDURE GETCMD.PROC7(PARAM1) (* P=7 LL=1 *)
  MP1=PARAM1
  MP2
  MP3
  MP4
BEGIN
-> 00f2: SLDC 00          Short load constant 0
   00f3: STL  0003        Store TOS into MP3
-> 00f5: SLDL 01          Short load local MP1
   00f6: SLDL 03          Short load local MP3
   00f7: SLDC 00          Short load constant 0
   00f8: SLDC 00          Short load constant 0
   00f9: CGP  05          Call global procedure GETCMD.5
   00fb: SLDC 01          Short load constant 1
   00fc: NEQI             Integer TOS-1 <> TOS
   00fd: FJP  $0106       Jump if TOS false
   00ff: SLDL 03          Short load local MP3
   0100: SLDC 01          Short load constant 1
   0101: ADI              Add integers (TOS + TOS-1)
   0102: STL  0003        Store TOS into MP3
   0104: UJP  $00f5       Unconditional jump
-> 0106: SLDL 01          Short load local MP1
   0107: INC  0080        Inc field ptr (TOS+128)
   010a: SLDL 03          Short load local MP3
   010b: IXA  0001        Index array (TOS-1 + TOS * 1)
   010d: SLDC 03          Short load constant 3
   010e: SLDC 0d          Short load constant 13
   010f: LDP              Load packed field (TOS)
   0110: STL  0002        Store TOS into MP2
   0112: SLDL 02          Short load local MP2
   0113: SLDC 01          Short load constant 1
   0114: EQUI             Integer TOS-1 = TOS
   0115: FJP  $011b       Jump if TOS false
   0117: CLP  08          Call local procedure GETCMD.8
   0119: UJP  $014f       Unconditional jump
-> 011b: SLDL 02          Short load local MP2
   011c: SLDC 02          Short load constant 2
   011d: EQUI             Integer TOS-1 = TOS
   011e: FJP  $014f       Jump if TOS false
   0120: LLA  0004        Load local address MP4
   0122: SLDL 01          Short load local MP1
   0123: INC  0090        Inc field ptr (TOS+144)
   0126: LDM  04          Load 4 words from (TOS)
   0128: SLDC 04          Short load constant 4
   0129: ADJ  04          Adjust set to 4 words
   012b: STM  04          Store 4 words at TOS to TOS-1
   012d: LLA  0004        Load local address MP4
   012f: SLDC 02          Short load constant 2
   0130: IXA  0001        Index array (TOS-1 + TOS * 1)
   0132: SIND 00          Short index load *TOS+0
   0133: SLDC 2a          Short load constant 42
   0134: EQUI             Integer TOS-1 = TOS
   0135: LLA  0004        Load local address MP4
   0137: SLDC 03          Short load constant 3
   0138: IXA  0001        Index array (TOS-1 + TOS * 1)
   013a: SIND 00          Short index load *TOS+0
   013b: LDCI 061e        Load word 1566
   013e: EQUI             Integer TOS-1 = TOS
   013f: LLA  0004        Load local address MP4
   0141: SLDC 03          Short load constant 3
   0142: IXA  0001        Index array (TOS-1 + TOS * 1)
   0144: SIND 00          Short index load *TOS+0
   0145: LDCI 061f        Load word 1567
   0148: EQUI             Integer TOS-1 = TOS
   0149: LOR              Logical OR (TOS | TOS-1)
   014a: LAND             Logical AND (TOS & TOS-1)
   014b: FJP  $014f       Jump if TOS false
   014d: CLP  08          Call local procedure GETCMD.8
-> 014f: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC8 (* P=8 LL=2 *)
BEGIN
-> 00c6: LDA  01 0004     Load addr L14
   00c9: SLDC 02          Short load constant 2
   00ca: IXA  0001        Index array (TOS-1 + TOS * 1)
   00cc: SLDC 00          Short load constant 0
   00cd: STO              Store indirect (TOS into TOS-1)
   00ce: LDA  01 0004     Load addr L14
   00d1: SLDC 03          Short load constant 3
   00d2: IXA  0001        Index array (TOS-1 + TOS * 1)
   00d4: SLDC 00          Short load constant 0
   00d5: STO              Store indirect (TOS into TOS-1)
   00d6: LOD  01 0001     Load word at L1_1
   00d9: INC  0090        Inc field ptr (TOS+144)
   00dc: LDA  01 0004     Load addr L14
   00df: LDM  04          Load 4 words from (TOS)
   00e1: SLDC 04          Short load constant 4
   00e2: ADJ  04          Adjust set to 4 words
   00e4: STM  04          Store 4 words at TOS to TOS-1
-> 00e6: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC9(PARAM1; PARAM2) (* P=9 LL=1 *)
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
-> 015e: LOD  02 0001     Load word at G1 (SYSCOM)
   0161: STL  0005        Store TOS into MP5
   0163: SLDL 02          Short load local MP2
   0164: STL  0006        Store TOS into MP6
   0166: SLDL 01          Short load local MP1
   0167: STL  0007        Store TOS into MP7
   0169: SLDL 07          Short load local MP7
   016a: INC  0010        Inc field ptr (TOS+16)
   016c: STL  0008        Store TOS into MP8
   016e: SLDC 00          Short load constant 0
   016f: STL  0003        Store TOS into MP3
   0171: SLDC 0f          Short load constant 15
   0172: STL  0009        Store TOS into MP9
-> 0174: SLDL 03          Short load local MP3
   0175: SLDL 09          Short load local MP9
   0176: LEQI             Integer TOS-1 <= TOS
   0177: FJP  $01d0       Jump if TOS false
   0179: SLDL 06          Short load local MP6
   017a: SLDL 03          Short load local MP3
   017b: IXA  0002        Index array (TOS-1 + TOS * 2)
   017d: STL  000a        Store TOS into MP10
   017f: SLDL 0a          Short load local MP10
   0180: SIND 01          Short index load *TOS+1
   0181: SLDC 00          Short load constant 0
   0182: NEQI             Integer TOS-1 <> TOS
   0183: FJP  $01c9       Jump if TOS false
   0185: SLDL 02          Short load local MP2
   0186: SLDL 03          Short load local MP3
   0187: SLDC 00          Short load constant 0
   0188: SLDC 00          Short load constant 0
   0189: CGP  05          Call global procedure GETCMD.5
   018b: STL  0004        Store TOS into MP4
   018d: SLDL 04          Short load local MP4
   0190: LDC  04          Load multiple-word constant
                         ffffffffffffff82
   0198: SLDC 04          Short load constant 4
   0199: INN              Set membership (TOS-1 in set TOS)
   019a: FJP  $01c9       Jump if TOS false
   019c: SLDL 05          Short load local MP5
   019d: INC  0030        Inc field ptr (TOS+48)
   019f: SLDL 04          Short load local MP4
   01a0: IXA  0003        Index array (TOS-1 + TOS * 3)
   01a2: STL  000b        Store TOS into MP11
   01a4: SLDL 0b          Short load local MP11
   01a5: SLDL 07          Short load local MP7
   01a6: SIND 07          Short index load *TOS+7
   01a7: STO              Store indirect (TOS into TOS-1)
   01a8: SLDL 0b          Short load local MP11
   01a9: INC  0002        Inc field ptr (TOS+2)
   01ab: SLDL 0a          Short load local MP10
   01ac: SIND 01          Short index load *TOS+1
   01ad: STO              Store indirect (TOS into TOS-1)
   01ae: SLDL 06          Short load local MP6
   01af: INC  0060        Inc field ptr (TOS+96)
   01b1: SLDL 03          Short load local MP3
   01b2: IXA  0001        Index array (TOS-1 + TOS * 1)
   01b4: SIND 00          Short index load *TOS+0
   01b5: SLDC 07          Short load constant 7
   01b6: EQUI             Integer TOS-1 = TOS
   01b7: FJP  $01c0       Jump if TOS false
   01b9: SLDL 0b          Short load local MP11
   01ba: INC  0001        Inc field ptr (TOS+1)
   01bc: SLDC 00          Short load constant 0
   01bd: STO              Store indirect (TOS into TOS-1)
   01be: UJP  $01c9       Unconditional jump
-> 01c0: SLDL 0b          Short load local MP11
   01c1: INC  0001        Inc field ptr (TOS+1)
   01c3: SLDL 0a          Short load local MP10
   01c4: SIND 00          Short index load *TOS+0
   01c5: SLDL 08          Short load local MP8
   01c6: SIND 00          Short index load *TOS+0
   01c7: ADI              Add integers (TOS + TOS-1)
   01c8: STO              Store indirect (TOS into TOS-1)
-> 01c9: SLDL 03          Short load local MP3
   01ca: SLDC 01          Short load constant 1
   01cb: ADI              Add integers (TOS + TOS-1)
   01cc: STL  0003        Store TOS into MP3
   01ce: UJP  $0174       Unconditional jump
-> 01d0: RNP  00          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC10(PARAM1; PARAM2; PARAM3): RETVAL (* P=10 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM3
  MP4=PARAM2
  MP5=PARAM1
  MP6
  MP7
  MP8
BEGIN
-> 01de: SLDL 04          Short load local MP4
   01df: SLDC 00          Short load constant 0
   01e0: ADJ  04          Adjust set to 4 words
   01e2: STM  04          Store 4 words at TOS to TOS-1
   01e4: SLDC 01          Short load constant 1
   01e5: STL  0001        Store TOS into MP1
   01e7: SLDL 05          Short load local MP5
   01e8: STL  0007        Store TOS into MP7
   01ea: SLDC 00          Short load constant 0
   01eb: STL  0006        Store TOS into MP6
   01ed: SLDC 0f          Short load constant 15
   01ee: STL  0008        Store TOS into MP8
-> 01f0: SLDL 06          Short load local MP6
   01f1: SLDL 08          Short load local MP8
   01f2: LEQI             Integer TOS-1 <= TOS
   01f3: FJP  $0227       Jump if TOS false
   01f5: SLDL 07          Short load local MP7
   01f6: SLDL 06          Short load local MP6
   01f7: IXA  0002        Index array (TOS-1 + TOS * 2)
   01f9: SIND 01          Short index load *TOS+1
   01fa: SLDC 00          Short load constant 0
   01fb: NEQI             Integer TOS-1 <> TOS
   01fc: FJP  $0220       Jump if TOS false
   01fe: SLDL 07          Short load local MP7
   01ff: INC  0060        Inc field ptr (TOS+96)
   0201: SLDL 06          Short load local MP6
   0202: IXA  0001        Index array (TOS-1 + TOS * 1)
   0204: SIND 00          Short index load *TOS+0
   0205: SLDL 03          Short load local MP3
   0206: SLDC 01          Short load constant 1
   0207: INN              Set membership (TOS-1 in set TOS)
   0208: FJP  $021d       Jump if TOS false
   020a: SLDL 04          Short load local MP4
   020b: SLDL 04          Short load local MP4
   020c: LDM  04          Load 4 words from (TOS)
   020e: SLDC 04          Short load constant 4
   020f: SLDL 05          Short load local MP5
   0210: SLDL 06          Short load local MP6
   0211: SLDC 00          Short load constant 0
   0212: SLDC 00          Short load constant 0
   0213: CGP  05          Call global procedure GETCMD.5
   0215: SGS              Build singleton set [TOS]
   0216: UNI              Set union (TOS OR TOS-1)
   0217: ADJ  04          Adjust set to 4 words
   0219: STM  04          Store 4 words at TOS to TOS-1
   021b: UJP  $0220       Unconditional jump
-> 021d: SLDC 00          Short load constant 0
   021e: STL  0001        Store TOS into MP1
-> 0220: SLDL 06          Short load local MP6
   0221: SLDC 01          Short load constant 1
   0222: ADI              Add integers (TOS + TOS-1)
   0223: STL  0006        Store TOS into MP6
   0225: UJP  $01f0       Unconditional jump
-> 0227: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC11(PARAM1; PARAM2): RETVAL (* P=11 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM2
  MP4=PARAM1
  MP5
  MP58
  MP63
  MP64
  MP65
  MP66
  MP67
  MP68
  MP530
  MP571
  MP902
BEGIN
-> 05ea: LLA  0005        Load local address MP5
   05ec: SLDL 04          Short load local MP4
   05ed: SAS  50          String assign (TOS to TOS-1, 80 chars)
   05ef: SLDC 00          Short load constant 0
   05f0: STL  0042        Store TOS into MP66
   05f2: SLDC 00          Short load constant 0
   05f3: STL  0001        Store TOS into MP1
   05f5: SLDC 00          Short load constant 0
   05f6: STL  003f        Store TOS into MP63
   05f8: LDA  02 01c0     Load addr G448
   05fc: SLDC 00          Short load constant 0
   05fd: ADJ  04          Adjust set to 4 words
   05ff: STM  04          Store 4 words at TOS to TOS-1
   0601: LLA  023b        Load local address MP571
   0604: LLA  0005        Load local address MP5
   0606: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0608: CLP  12          Call local procedure GETCMD.18
   060a: CLP  10          Call local procedure GETCMD.16
   060c: SLDC 00          Short load constant 0
   060d: SLDC 00          Short load constant 0
   060e: CLP  0c          Call local procedure GETCMD.12
   0610: LDL  0042        Load local word MP66
   0612: SLDC 00          Short load constant 0
   0613: GRTI             Integer TOS-1 > TOS
   0614: LAND             Logical AND (TOS & TOS-1)
   0615: FJP  $0639       Jump if TOS false
   0617: SLDC 01          Short load constant 1
   0618: STL  0043        Store TOS into MP67
   061a: LDL  0042        Load local word MP66
   061c: STL  0386        Store TOS into MP902
-> 061f: LDL  0043        Load local word MP67
   0621: LDL  0386        Load local word MP902
   0624: LEQI             Integer TOS-1 <= TOS
   0625: FJP  $0639       Jump if TOS false
   0627: LLA  0044        Load local address MP68
   0629: LDL  0043        Load local word MP67
   062b: SLDC 01          Short load constant 1
   062c: SBI              Subtract integers (TOS-1 - TOS)
   062d: IXA  0029        Index array (TOS-1 + TOS * 41)
   062f: CLP  0e          Call local procedure GETCMD.14
   0631: LDL  0043        Load local word MP67
   0633: SLDC 01          Short load constant 1
   0634: ADI              Add integers (TOS + TOS-1)
   0635: STL  0043        Store TOS into MP67
   0637: UJP  $061f       Unconditional jump
-> 0639: SLDC 00          Short load constant 0
   063a: SLDC 00          Short load constant 0
   063b: CLP  0c          Call local procedure GETCMD.12
   063d: FJP  $065b       Jump if TOS false
   063f: LLA  0212        Load local address MP530
   0642: NOP              No operation
   0643: LSA  0f          Load string address: '*SYSTEM.LIBRARY'
   0654: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0656: LLA  0212        Load local address MP530
   0659: CLP  0e          Call local procedure GETCMD.14
-> 065b: SLDC 01          Short load constant 1
   065c: STL  0001        Store TOS into MP1
   065e: LDL  003f        Load local word MP63
   0660: LNOT             Logical NOT (~TOS)
   0661: FJP  $069d       Jump if TOS false
   0663: LOD  02 0003     Load word at G3 (OUTPUT)
   0666: NOP              No operation
   0667: LSA  2d          Load string address: 'Error: Required library files are not present'
   0696: SLDC 00          Short load constant 0
   0697: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   069a: SLDC 00          Short load constant 0
   069b: STL  0001        Store TOS into MP1
-> 069d: SLDC 00          Short load constant 0
   069e: SLDC 00          Short load constant 0
   069f: CLP  0c          Call local procedure GETCMD.12
   06a1: LDL  003f        Load local word MP63
   06a3: LAND             Logical AND (TOS & TOS-1)
   06a4: FJP  $074d       Jump if TOS false
   06a6: SLDC 00          Short load constant 0
   06a7: STL  0001        Store TOS into MP1
   06a9: LOD  02 0003     Load word at G3 (OUTPUT)
   06ac: NOP              No operation
   06ad: LSA  33          Load string address: 'Error: These required intrinsic(s) not available:  '
   06e2: SLDC 00          Short load constant 0
   06e3: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   06e6: SLDC 00          Short load constant 0
   06e7: STL  0040        Store TOS into MP64
   06e9: LLA  003a        Load local address MP58
   06eb: SLDL 03          Short load local MP3
   06ec: INC  0090        Inc field ptr (TOS+144)
   06ef: LDM  04          Load 4 words from (TOS)
   06f1: SLDC 04          Short load constant 4
   06f2: LDA  02 01c0     Load addr G448
   06f6: LDM  04          Load 4 words from (TOS)
   06f8: SLDC 04          Short load constant 4
   06f9: DIF              Set difference (TOS-1 AND NOT TOS)
   06fa: ADJ  04          Adjust set to 4 words
   06fc: STM  04          Store 4 words at TOS to TOS-1
   06fe: SLDC 01          Short load constant 1
   06ff: STL  0041        Store TOS into MP65
   0701: SLDC 3f          Short load constant 63
   0702: STL  0386        Store TOS into MP902
-> 0705: LDL  0041        Load local word MP65
   0707: LDL  0386        Load local word MP902
   070a: LEQI             Integer TOS-1 <= TOS
   070b: FJP  $074d       Jump if TOS false
   070d: LDL  0041        Load local word MP65
   070f: SLDC 7c          Short load constant 124
   0710: SLDC 01          Short load constant 1
   0711: INN              Set membership (TOS-1 in set TOS)
   0712: LNOT             Logical NOT (~TOS)
   0713: LDL  0041        Load local word MP65
   0715: LLA  003a        Load local address MP58
   0717: LDM  04          Load 4 words from (TOS)
   0719: SLDC 04          Short load constant 4
   071a: INN              Set membership (TOS-1 in set TOS)
   071b: LAND             Logical AND (TOS & TOS-1)
   071c: FJP  $0745       Jump if TOS false
   071e: LOD  02 0003     Load word at G3 (OUTPUT)
   0721: LDL  0041        Load local word MP65
   0723: SLDC 00          Short load constant 0
   0724: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0727: LOD  02 0003     Load word at G3 (OUTPUT)
   072a: NOP              No operation
   072b: LSA  02          Load string address: '  '
   072f: SLDC 00          Short load constant 0
   0730: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0733: LDL  0040        Load local word MP64
   0735: SLDC 01          Short load constant 1
   0736: ADI              Add integers (TOS + TOS-1)
   0737: STL  0040        Store TOS into MP64
   0739: LDL  0040        Load local word MP64
   073b: SLDC 07          Short load constant 7
   073c: EQUI             Integer TOS-1 = TOS
   073d: FJP  $0745       Jump if TOS false
   073f: LOD  02 0003     Load word at G3 (OUTPUT)
   0742: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0745: LDL  0041        Load local word MP65
   0747: SLDC 01          Short load constant 1
   0748: ADI              Add integers (TOS + TOS-1)
   0749: STL  0041        Store TOS into MP65
   074b: UJP  $0705       Unconditional jump
-> 074d: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC12: RETVAL (* P=12 LL=2 *)
  MP1=RETVAL1
BEGIN
-> 0236: LOD  01 0003     Load word at L1_3
   0239: INC  0090        Inc field ptr (TOS+144)
   023c: LDM  04          Load 4 words from (TOS)
   023e: SLDC 04          Short load constant 4
   023f: LDA  03 01c0     Load addr G448
   0243: LDM  04          Load 4 words from (TOS)
   0245: SLDC 04          Short load constant 4
   0246: NEQSET           Set TOS-1 <> TOS
   0248: FJP  $024f       Jump if TOS false
   024a: SLDC 01          Short load constant 1
   024b: STL  0001        Store TOS into MP1
   024d: UJP  $0252       Unconditional jump
-> 024f: SLDC 00          Short load constant 0
   0250: STL  0001        Store TOS into MP1
-> 0252: RNP  01          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC13 (* P=13 LL=2 *)
  MP1
  MP2
  MP3
BEGIN
-> 025e: SLDC 00          Short load constant 0
   025f: STL  0002        Store TOS into MP2
   0261: SLDC 0f          Short load constant 15
   0262: STL  0003        Store TOS into MP3
-> 0264: SLDL 02          Short load local MP2
   0265: SLDL 03          Short load local MP3
   0266: LEQI             Integer TOS-1 <= TOS
   0267: FJP  $02c5       Jump if TOS false
   0269: LDA  01 0111     Load addr L1273
   026d: SLDL 02          Short load local MP2
   026e: SLDC 00          Short load constant 0
   026f: SLDC 00          Short load constant 0
   0270: CGP  05          Call global procedure GETCMD.5
   0272: STL  0001        Store TOS into MP1
   0274: LDA  01 0171     Load addr L1369
   0278: SLDL 02          Short load local MP2
   0279: IXA  0001        Index array (TOS-1 + TOS * 1)
   027b: SIND 00          Short index load *TOS+0
   027c: LDCI 00c0        Load word 192
   027f: SLDC 01          Short load constant 1
   0280: INN              Set membership (TOS-1 in set TOS)
   0281: SLDL 01          Short load local MP1
   0282: LDA  03 01c0     Load addr G448
   0286: LDM  04          Load 4 words from (TOS)
   0288: SLDC 04          Short load constant 4
   0289: INN              Set membership (TOS-1 in set TOS)
   028a: LNOT             Logical NOT (~TOS)
   028b: LAND             Logical AND (TOS & TOS-1)
   028c: SLDL 01          Short load local MP1
   028d: LOD  01 0003     Load word at L1_3
   0290: INC  0090        Inc field ptr (TOS+144)
   0293: LDM  04          Load 4 words from (TOS)
   0295: SLDC 04          Short load constant 4
   0296: INN              Set membership (TOS-1 in set TOS)
   0297: LAND             Logical AND (TOS & TOS-1)
   0298: FJP  $02b3       Jump if TOS false
   029a: LDA  03 01c0     Load addr G448
   029e: LDA  03 01c0     Load addr G448
   02a2: LDM  04          Load 4 words from (TOS)
   02a4: SLDC 04          Short load constant 4
   02a5: SLDL 01          Short load local MP1
   02a6: SGS              Build singleton set [TOS]
   02a7: UNI              Set union (TOS OR TOS-1)
   02a8: ADJ  04          Adjust set to 4 words
   02aa: STM  04          Store 4 words at TOS to TOS-1
   02ac: SLDC 01          Short load constant 1
   02ad: STR  01 0211     Store TOS to L1529
   02b1: UJP  $02be       Unconditional jump
-> 02b3: LDA  01 0111     Load addr L1273
   02b7: SLDL 02          Short load local MP2
   02b8: IXA  0002        Index array (TOS-1 + TOS * 2)
   02ba: INC  0001        Inc field ptr (TOS+1)
   02bc: SLDC 00          Short load constant 0
   02bd: STO              Store indirect (TOS into TOS-1)
-> 02be: SLDL 02          Short load local MP2
   02bf: SLDC 01          Short load constant 1
   02c0: ADI              Add integers (TOS + TOS-1)
   02c1: STL  0002        Store TOS into MP2
   02c3: UJP  $0264       Unconditional jump
-> 02c5: LDA  01 0111     Load addr L1273
   02c9: LDA  01 0264     Load addr L1612
   02cd: CGP  09          Call global procedure GETCMD.9
-> 02cf: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC14(PARAM1) (* P=14 LL=2 *)
  MP1=PARAM1
  MP2
BEGIN
-> 02de: LLA  0002        Load local address MP2
   02e0: SLDL 01          Short load local MP1
   02e1: SAS  50          String assign (TOS to TOS-1, 80 chars)
   02e3: LDA  01 0264     Load addr L1612
   02e7: LDCN             Load constant NIL
   02e8: SLDC 01          Short load constant 1
   02e9: NGI              Negate integer
   02ea: CXP  00 03       Call external procedure PASCALSY.FINIT
   02ed: LDA  01 0264     Load addr L1612
   02f1: LLA  0002        Load local address MP2
   02f3: SLDC 01          Short load constant 1
   02f4: LDCN             Load constant NIL
   02f5: CXP  00 05       Call external procedure PASCALSY.FOPEN
   02f8: SLDC 00          Short load constant 0
   02f9: STR  01 0211     Store TOS to L1529
   02fd: CSP  22          Call standard procedure IORESULT
   02ff: SLDC 00          Short load constant 0
   0300: EQUI             Integer TOS-1 = TOS
   0301: FJP  $0363       Jump if TOS false
   0303: SLDC 01          Short load constant 1
   0304: STR  01 003f     Store TOS to L163
   0307: LOD  01 026b     Load word at L1_619
   030b: LDA  01 0111     Load addr L1273
   030f: SLDC 00          Short load constant 0
   0310: LDCI 0200        Load word 512
   0313: LOD  01 0274     Load word at L1_628
   0317: SLDC 00          Short load constant 0
   0318: CSP  05          Call standard procedure UNITREAD
   031a: CSP  22          Call standard procedure IORESULT
   031c: SLDC 00          Short load constant 0
   031d: EQUI             Integer TOS-1 = TOS
   031e: FJP  $0322       Jump if TOS false
   0320: CIP  0d          Call intermediate procedure 13 GETCMD.13
-> 0322: LOD  01 0211     Load word at L1_529
   0326: LNOT             Logical NOT (~TOS)
   0327: FJP  $0361       Jump if TOS false
   0329: LOD  03 0003     Load word at G3 (OUTPUT)
   032c: NOP              No operation
   032d: LSA  09          Load string address: 'Warning: '
   0338: SLDC 00          Short load constant 0
   0339: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   033c: LOD  03 0003     Load word at G3 (OUTPUT)
   033f: LLA  0002        Load local address MP2
   0341: SLDC 00          Short load constant 0
   0342: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0345: LOD  03 0003     Load word at G3 (OUTPUT)
   0348: NOP              No operation
   0349: LSA  0c          Load string address: ' is not used'
   0357: SLDC 00          Short load constant 0
   0358: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   035b: LOD  03 0003     Load word at G3 (OUTPUT)
   035e: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0361: UJP  $03a2       Unconditional jump
-> 0363: LOD  03 0003     Load word at G3 (OUTPUT)
   0366: NOP              No operation
   0367: LSA  26          Load string address: 'Warning: Cannot open the library file '
   038f: SLDC 00          Short load constant 0
   0390: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0393: LOD  03 0003     Load word at G3 (OUTPUT)
   0396: LLA  0002        Load local address MP2
   0398: SLDC 00          Short load constant 0
   0399: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   039c: LOD  03 0003     Load word at G3 (OUTPUT)
   039f: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 03a2: LDA  01 0264     Load addr L1612
   03a6: SLDC 00          Short load constant 0
   03a7: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 03aa: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC15 (* P=15 LL=2 *)
  MP1
  MP2
  MP3
  MP4
BEGIN
-> 03b6: SLDC 0f          Short load constant 15
   03b7: STL  0002        Store TOS into MP2
   03b9: LDA  01 0111     Load addr L1273
   03bd: SLDL 02          Short load local MP2
   03be: LDB              Load byte at byte ptr TOS-1 + TOS
   03bf: SLDC 10          Short load constant 16
   03c0: EQUI             Integer TOS-1 = TOS
   03c1: FJP  $03c8       Jump if TOS false
   03c3: SLDL 02          Short load local MP2
   03c4: SLDC 02          Short load constant 2
   03c5: ADI              Add integers (TOS + TOS-1)
   03c6: STL  0002        Store TOS into MP2
-> 03c8: SLDC 00          Short load constant 0
   03c9: STL  0001        Store TOS into MP1
   03cb: LDA  01 0111     Load addr L1273
   03cf: SLDL 02          Short load local MP2
   03d0: LDB              Load byte at byte ptr TOS-1 + TOS
   03d1: SLDC 24          Short load constant 36
   03d2: EQUI             Integer TOS-1 = TOS
   03d3: LDA  01 0111     Load addr L1273
   03d7: SLDL 02          Short load local MP2
   03d8: SLDC 01          Short load constant 1
   03d9: ADI              Add integers (TOS + TOS-1)
   03da: LDB              Load byte at byte ptr TOS-1 + TOS
   03db: SLDC 24          Short load constant 36
   03dc: EQUI             Integer TOS-1 = TOS
   03dd: LAND             Logical AND (TOS & TOS-1)
   03de: LNOT             Logical NOT (~TOS)
   03df: FJP  $044a       Jump if TOS false
   03e1: SLDC 01          Short load constant 1
   03e2: STL  0003        Store TOS into MP3
   03e4: SLDC 05          Short load constant 5
   03e5: STL  0004        Store TOS into MP4
-> 03e7: SLDL 03          Short load local MP3
   03e8: SLDL 04          Short load local MP4
   03e9: LEQI             Integer TOS-1 <= TOS
   03ea: FJP  $0444       Jump if TOS false
   03ec: SLDC 50          Short load constant 80
   03ed: SLDC 00          Short load constant 0
   03ee: SLDC 0d          Short load constant 13
   03ef: LDA  01 0111     Load addr L1273
   03f3: SLDL 02          Short load local MP2
   03f4: SLDC 00          Short load constant 0
   03f5: CSP  0b          Call standard procedure SCAN
   03f7: STL  0001        Store TOS into MP1
   03f9: LDA  01 0111     Load addr L1273
   03fd: SLDL 02          Short load local MP2
   03fe: LDA  01 0044     Load addr L168
   0401: SLDL 03          Short load local MP3
   0402: SLDC 01          Short load constant 1
   0403: SBI              Subtract integers (TOS-1 - TOS)
   0404: IXA  0029        Index array (TOS-1 + TOS * 41)
   0406: SLDC 01          Short load constant 1
   0407: SLDL 01          Short load local MP1
   0408: CSP  02          Call standard procedure MOVL
   040a: LDA  01 0044     Load addr L168
   040d: SLDL 03          Short load local MP3
   040e: SLDC 01          Short load constant 1
   040f: SBI              Subtract integers (TOS-1 - TOS)
   0410: IXA  0029        Index array (TOS-1 + TOS * 41)
   0412: SLDC 00          Short load constant 0
   0413: SLDL 01          Short load local MP1
   0414: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0415: SLDL 02          Short load local MP2
   0416: SLDL 01          Short load local MP1
   0417: ADI              Add integers (TOS + TOS-1)
   0418: SLDC 01          Short load constant 1
   0419: ADI              Add integers (TOS + TOS-1)
   041a: STL  0002        Store TOS into MP2
   041c: LDA  01 0111     Load addr L1273
   0420: SLDL 02          Short load local MP2
   0421: LDB              Load byte at byte ptr TOS-1 + TOS
   0422: SLDC 10          Short load constant 16
   0423: EQUI             Integer TOS-1 = TOS
   0424: FJP  $042b       Jump if TOS false
   0426: SLDL 02          Short load local MP2
   0427: SLDC 02          Short load constant 2
   0428: ADI              Add integers (TOS + TOS-1)
   0429: STL  0002        Store TOS into MP2
-> 042b: LDA  01 0111     Load addr L1273
   042f: SLDL 02          Short load local MP2
   0430: LDB              Load byte at byte ptr TOS-1 + TOS
   0431: SLDC 24          Short load constant 36
   0432: EQUI             Integer TOS-1 = TOS
   0433: FJP  $043d       Jump if TOS false
   0435: SLDL 03          Short load local MP3
   0436: STR  01 0042     Store TOS to L166
   0439: SLDC 05          Short load constant 5
   043a: SLDC 0f          Short load constant 15
   043b: CSP  04          Call standard procedure EXIT
-> 043d: SLDL 03          Short load local MP3
   043e: SLDC 01          Short load constant 1
   043f: ADI              Add integers (TOS + TOS-1)
   0440: STL  0003        Store TOS into MP3
   0442: UJP  $03e7       Unconditional jump
-> 0444: SLDC 05          Short load constant 5
   0445: STR  01 0042     Store TOS to L166
   0448: UJP  $044e       Unconditional jump
-> 044a: SLDC 00          Short load constant 0
   044b: STR  01 0042     Store TOS to L166
-> 044e: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC16 (* P=16 LL=2 *)
  MP1
BEGIN
-> 0492: LDA  01 0264     Load addr L1612
   0496: LDCN             Load constant NIL
   0497: SLDC 01          Short load constant 1
   0498: NGI              Negate integer
   0499: CXP  00 03       Call external procedure PASCALSY.FINIT
   049c: LDA  01 0264     Load addr L1612
   04a0: LDA  01 023b     Load addr L1571
   04a4: SLDC 01          Short load constant 1
   04a5: LDCN             Load constant NIL
   04a6: CXP  00 05       Call external procedure PASCALSY.FOPEN
   04a9: CSP  22          Call standard procedure IORESULT
   04ab: SLDC 00          Short load constant 0
   04ac: EQUI             Integer TOS-1 = TOS
   04ad: FJP  $052e       Jump if TOS false
   04af: LOD  01 026b     Load word at L1_619
   04b3: LDA  01 0111     Load addr L1273
   04b7: SLDC 00          Short load constant 0
   04b8: LDCI 0200        Load word 512
   04bb: LOD  01 0274     Load word at L1_628
   04bf: SLDC 02          Short load constant 2
   04c0: ADI              Add integers (TOS + TOS-1)
   04c1: SLDC 00          Short load constant 0
   04c2: CSP  05          Call standard procedure UNITREAD
   04c4: CSP  22          Call standard procedure IORESULT
   04c6: SLDC 00          Short load constant 0
   04c7: EQUI             Integer TOS-1 = TOS
   04c8: FJP  $0510       Jump if TOS false
   04ca: LDA  01 0111     Load addr L1273
   04ce: SLDC 00          Short load constant 0
   04cf: LLA  0001        Load local address MP1
   04d1: SLDC 01          Short load constant 1
   04d2: SLDC 0e          Short load constant 14
   04d3: CSP  02          Call standard procedure MOVL
   04d5: CLP  11          Call local procedure GETCMD.17
   04d7: LLA  0001        Load local address MP1
   04d9: SLDC 01          Short load constant 1
   04da: LDB              Load byte at byte ptr TOS-1 + TOS
   04db: SLDC 4c          Short load constant 76
   04dc: EQUI             Integer TOS-1 = TOS
   04dd: LLA  0001        Load local address MP1
   04df: SLDC 02          Short load constant 2
   04e0: LDB              Load byte at byte ptr TOS-1 + TOS
   04e1: SLDC 49          Short load constant 73
   04e2: EQUI             Integer TOS-1 = TOS
   04e3: LAND             Logical AND (TOS & TOS-1)
   04e4: FJP  $0510       Jump if TOS false
   04e6: LLA  0001        Load local address MP1
   04e8: SLDC 00          Short load constant 0
   04e9: SLDC 0e          Short load constant 14
   04ea: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   04eb: LLA  0001        Load local address MP1
   04ed: LSA  0e          Load string address: 'LIBRARY FILES:'
   04fd: NOP              No operation
   04fe: EQLSTR           String TOS-1 = TOS
   0500: FJP  $0510       Jump if TOS false
   0502: CIP  0f          Call intermediate procedure 15 GETCMD.15
   0504: LDA  01 0264     Load addr L1612
   0508: SLDC 00          Short load constant 0
   0509: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   050c: SLDC 05          Short load constant 5
   050d: SLDC 10          Short load constant 16
   050e: CSP  04          Call standard procedure EXIT
-> 0510: SLDC 01          Short load constant 1
   0511: STR  01 003f     Store TOS to L163
   0514: SLDC 00          Short load constant 0
   0515: STR  01 0211     Store TOS to L1529
   0519: LOD  01 026b     Load word at L1_619
   051d: LDA  01 0111     Load addr L1273
   0521: SLDC 00          Short load constant 0
   0522: LDCI 0200        Load word 512
   0525: LOD  01 0274     Load word at L1_628
   0529: SLDC 00          Short load constant 0
   052a: CSP  05          Call standard procedure UNITREAD
   052c: CIP  0d          Call intermediate procedure 13 GETCMD.13
-> 052e: LDA  01 0264     Load addr L1612
   0532: SLDC 00          Short load constant 0
   0533: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 0536: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC17 (* P=17 LL=3 *)
  MP1
  MP2
BEGIN
-> 045c: SLDC 01          Short load constant 1
   045d: STL  0001        Store TOS into MP1
   045f: SLDC 0d          Short load constant 13
   0460: STL  0002        Store TOS into MP2
-> 0462: SLDL 01          Short load local MP1
   0463: SLDL 02          Short load local MP2
   0464: LEQI             Integer TOS-1 <= TOS
   0465: FJP  $0483       Jump if TOS false
   0467: LDA  01 0001     Load addr L21
   046a: SLDL 01          Short load local MP1
   046b: LDB              Load byte at byte ptr TOS-1 + TOS
   046c: SLDC 61          Short load constant 97
   046d: GEQI             Integer TOS-1 >= TOS
   046e: FJP  $047c       Jump if TOS false
   0470: LDA  01 0001     Load addr L21
   0473: SLDL 01          Short load local MP1
   0474: LDA  01 0001     Load addr L21
   0477: SLDL 01          Short load local MP1
   0478: LDB              Load byte at byte ptr TOS-1 + TOS
   0479: SLDC 20          Short load constant 32
   047a: SBI              Subtract integers (TOS-1 - TOS)
   047b: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 047c: SLDL 01          Short load local MP1
   047d: SLDC 01          Short load constant 1
   047e: ADI              Add integers (TOS + TOS-1)
   047f: STL  0001        Store TOS into MP1
   0481: UJP  $0462       Unconditional jump
-> 0483: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC18 (* P=18 LL=2 *)
  MP1
  MP2
BEGIN
-> 0542: LDA  01 023b     Load addr L1571
   0546: LDA  01 002e     Load addr L146
   0549: LDA  01 0032     Load addr L150
   054c: LLA  0001        Load local address MP1
   054e: LDA  01 003e     Load addr L162
   0551: SLDC 00          Short load constant 0
   0552: SLDC 00          Short load constant 0
   0553: CXP  00 21       Call external procedure PASCALSY.33
   0556: FJP  $0558       Jump if TOS false
-> 0558: LDA  01 0032     Load addr L150
   055b: SLDC 00          Short load constant 0
   055c: SLDC 0f          Short load constant 15
   055d: CXP  00 2b       Call external procedure PASCALSY.43
   0560: LDA  01 0032     Load addr L150
   0563: SLDC 00          Short load constant 0
   0564: LDB              Load byte at byte ptr TOS-1 + TOS
   0565: STL  0001        Store TOS into MP1
   0567: SLDL 01          Short load local MP1
   0568: SLDC 05          Short load constant 5
   0569: GRTI             Integer TOS-1 > TOS
   056a: FJP  $0590       Jump if TOS false
   056c: LDA  01 0032     Load addr L150
   056f: LLA  0002        Load local address MP2
   0571: SLDL 01          Short load local MP1
   0572: SLDC 04          Short load constant 4
   0573: SBI              Subtract integers (TOS-1 - TOS)
   0574: SLDC 05          Short load constant 5
   0575: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0578: LLA  0002        Load local address MP2
   057a: NOP              No operation
   057b: LSA  05          Load string address: '.CODE'
   0582: EQLSTR           String TOS-1 = TOS
   0584: FJP  $0590       Jump if TOS false
   0586: LDA  01 0032     Load addr L150
   0589: SLDL 01          Short load local MP1
   058a: SLDC 04          Short load constant 4
   058b: SBI              Subtract integers (TOS-1 - TOS)
   058c: SLDC 05          Short load constant 5
   058d: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0590: LDA  01 0032     Load addr L150
   0593: SLDC 00          Short load constant 0
   0594: LDB              Load byte at byte ptr TOS-1 + TOS
   0595: SLDC 0b          Short load constant 11
   0596: GRTI             Integer TOS-1 > TOS
   0597: FJP  $05aa       Jump if TOS false
   0599: LDA  01 0032     Load addr L150
   059c: LDA  01 0032     Load addr L150
   059f: LLA  0002        Load local address MP2
   05a1: SLDC 01          Short load constant 1
   05a2: SLDC 0b          Short load constant 11
   05a3: CXP  00 19       Call external procedure PASCALSY.SCOPY
   05a6: LLA  0002        Load local address MP2
   05a8: SAS  0f          String assign (TOS to TOS-1, 15 chars)
-> 05aa: LDA  01 023b     Load addr L1571
   05ae: SLDC 00          Short load constant 0
   05af: STL  0002        Store TOS into MP2
   05b1: LLA  0002        Load local address MP2
   05b3: LDA  01 002e     Load addr L146
   05b6: SLDC 07          Short load constant 7
   05b7: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05ba: LLA  0002        Load local address MP2
   05bc: NOP              No operation
   05bd: LSA  01          Load string address: ':'
   05c0: SLDC 08          Short load constant 8
   05c1: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05c4: LLA  0002        Load local address MP2
   05c6: LDA  01 0032     Load addr L150
   05c9: SLDC 17          Short load constant 23
   05ca: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05cd: LLA  0002        Load local address MP2
   05cf: LSA  04          Load string address: '.LIB'
   05d5: NOP              No operation
   05d6: SLDC 1b          Short load constant 27
   05d7: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05da: LLA  0002        Load local address MP2
   05dc: SAS  50          String assign (TOS to TOS-1, 80 chars)
-> 05de: RNP  00          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC19(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5; PARAM6): RETVAL (* P=19 LL=1 *)
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
  MP310
  MP351
  MP355
  MP359
  MP367
  MP368
  MP369
  MP370
  MP371
  MP372
BEGIN
-> 0760: LLA  0009        Load local address MP9
   0762: SLDL 08          Short load local MP8
   0763: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0765: SLDL 04          Short load local MP4
   0766: SLDC 02          Short load constant 2
   0767: STO              Store indirect (TOS into TOS-1)
   0768: SLDC 00          Short load constant 0
   0769: STL  0001        Store TOS into MP1
   076b: LLA  015f        Load local address MP351
   076e: LDA  02 01bc     Load addr G444
   0772: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0774: LLA  0136        Load local address MP310
   0777: LLA  0009        Load local address MP9
   0779: SAS  50          String assign (TOS to TOS-1, 80 chars)
   077b: LLA  0136        Load local address MP310
   077e: LLA  0163        Load local address MP355
   0781: LLA  0167        Load local address MP359
   0784: LLA  016f        Load local address MP367
   0787: LLA  0170        Load local address MP368
   078a: SLDC 00          Short load constant 0
   078b: SLDC 00          Short load constant 0
   078c: CXP  00 21       Call external procedure PASCALSY.33
   078f: STL  0171        Store TOS into MP369
   0792: LDA  02 01bc     Load addr G444
   0796: LLA  0163        Load local address MP355
   0799: SAS  07          String assign (TOS to TOS-1, 7 chars)
   079b: LDL  0171        Load local word MP369
   079e: LNOT             Logical NOT (~TOS)
   079f: FJP  $07aa       Jump if TOS false
   07a1: LDA  02 01bc     Load addr G444
   07a5: LSA  00          Load string address: ''
   07a7: NOP              No operation
   07a8: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 07aa: LOD  02 0008     Load word at G8
   07ad: LLA  0009        Load local address MP9
   07af: SLDC 01          Short load constant 1
   07b0: LDCN             Load constant NIL
   07b1: CXP  00 05       Call external procedure PASCALSY.FOPEN
   07b4: CSP  22          Call standard procedure IORESULT
   07b6: SLDC 00          Short load constant 0
   07b7: NEQI             Integer TOS-1 <> TOS
   07b8: FJP  $07fd       Jump if TOS false
   07ba: SLDL 05          Short load local MP5
   07bb: FJP  $07fb       Jump if TOS false
   07bd: CSP  22          Call standard procedure IORESULT
   07bf: SLDC 07          Short load constant 7
   07c0: EQUI             Integer TOS-1 = TOS
   07c1: FJP  $07e0       Jump if TOS false
   07c3: LOD  02 0003     Load word at G3 (OUTPUT)
   07c6: NOP              No operation
   07c7: LSA  11          Load string address: 'Illegal file name'
   07da: SLDC 00          Short load constant 0
   07db: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   07de: UJP  $07fb       Unconditional jump
-> 07e0: LOD  02 0003     Load word at G3 (OUTPUT)
   07e3: LSA  08          Load string address: 'No file '
   07ed: NOP              No operation
   07ee: SLDC 00          Short load constant 0
   07ef: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   07f2: LOD  02 0003     Load word at G3 (OUTPUT)
   07f5: LLA  0009        Load local address MP9
   07f7: SLDC 00          Short load constant 0
   07f8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 07fb: UJP  $09a3       Unconditional jump
-> 07fd: SLDL 04          Short load local MP4
   07fe: SLDC 01          Short load constant 1
   07ff: STO              Store indirect (TOS into TOS-1)
   0800: LOD  02 0001     Load word at G1 (SYSCOM)
   0803: STL  0172        Store TOS into MP370
   0806: LOD  02 0008     Load word at G8
   0809: STL  0173        Store TOS into MP371
   080c: LDL  0173        Load local word MP371
   080f: INC  0010        Inc field ptr (TOS+16)
   0811: STL  0174        Store TOS into MP372
   0814: LDL  0174        Load local word MP372
   0817: INC  0002        Inc field ptr (TOS+2)
   0819: SLDC 04          Short load constant 4
   081a: SLDC 00          Short load constant 0
   081b: LDP              Load packed field (TOS)
   081c: SLDC 02          Short load constant 2
   081d: NEQI             Integer TOS-1 <> TOS
   081e: FJP  $0840       Jump if TOS false
   0820: LOD  02 0003     Load word at G3 (OUTPUT)
   0823: LLA  0009        Load local address MP9
   0825: SLDC 00          Short load constant 0
   0826: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0829: LOD  02 0003     Load word at G3 (OUTPUT)
   082c: NOP              No operation
   082d: LSA  09          Load string address: ' not code'
   0838: SLDC 00          Short load constant 0
   0839: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   083c: UJP  $09a3       Unconditional jump
   083e: UJP  $0992       Unconditional jump
-> 0840: LDL  0173        Load local word MP371
   0843: SIND 07          Short index load *TOS+7
   0844: LLA  0032        Load local address MP50
   0846: SLDC 00          Short load constant 0
   0847: LDCI 0200        Load word 512
   084a: LDL  0174        Load local word MP372
   084d: SIND 00          Short index load *TOS+0
   084e: SLDC 00          Short load constant 0
   084f: CSP  05          Call standard procedure UNITREAD
   0851: CSP  22          Call standard procedure IORESULT
   0853: SLDC 00          Short load constant 0
   0854: NEQI             Integer TOS-1 <> TOS
   0855: FJP  $086f       Jump if TOS false
   0857: LOD  02 0003     Load word at G3 (OUTPUT)
   085a: NOP              No operation
   085b: LSA  0c          Load string address: 'Bad block #0'
   0869: SLDC 00          Short load constant 0
   086a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   086d: UJP  $09a3       Unconditional jump
-> 086f: SLDL 03          Short load local MP3
   0870: FJP  $08ad       Jump if TOS false
   0872: LLA  00b2        Load local address MP178
   0875: SLDC 01          Short load constant 1
   0876: IXA  0001        Index array (TOS-1 + TOS * 1)
   0878: SLDC 03          Short load constant 3
   0879: SLDC 0d          Short load constant 13
   087a: LDP              Load packed field (TOS)
   087b: SLDC 05          Short load constant 5
   087c: NEQI             Integer TOS-1 <> TOS
   087d: FJP  $08ad       Jump if TOS false
   087f: LOD  02 0003     Load word at G3 (OUTPUT)
   0882: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0885: LOD  02 0003     Load word at G3 (OUTPUT)
   0888: LLA  0009        Load local address MP9
   088a: SLDC 00          Short load constant 0
   088b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   088e: LOD  02 0003     Load word at G3 (OUTPUT)
   0891: LSA  13          Load string address: ' is not version 1.2'
   08a6: NOP              No operation
   08a7: SLDC 00          Short load constant 0
   08a8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   08ab: UJP  $09a3       Unconditional jump
-> 08ad: SLDL 03          Short load local MP3
   08ae: LNOT             Logical NOT (~TOS)
   08af: FJP  $08b5       Jump if TOS false
   08b1: LLA  0032        Load local address MP50
   08b3: CGP  07          Call global procedure GETCMD.7
-> 08b5: LLA  0032        Load local address MP50
   08b7: LLA  0132        Load local address MP306
   08ba: SLDC 01          Short load constant 1
   08bb: SLDC 01          Short load constant 1
   08bc: ADJ  01          Adjust set to 1 words
   08be: SLDC 00          Short load constant 0
   08bf: SLDC 00          Short load constant 0
   08c0: CGP  0a          Call global procedure GETCMD.10
   08c2: LNOT             Logical NOT (~TOS)
   08c3: FJP  $0927       Jump if TOS false
   08c5: SLDL 07          Short load local MP7
   08c6: FJP  $0902       Jump if TOS false
   08c8: LOD  02 0003     Load word at G3 (OUTPUT)
   08cb: LSA  0a          Load string address: 'Linking...'
   08d7: NOP              No operation
   08d8: SLDC 00          Short load constant 0
   08d9: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   08dc: LOD  02 0003     Load word at G3 (OUTPUT)
   08df: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   08e2: LOD  02 0008     Load word at G8
   08e5: SLDC 00          Short load constant 0
   08e6: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   08e9: SLDC 04          Short load constant 4
   08ea: SLDC 01          Short load constant 1
   08eb: SLDC 00          Short load constant 0
   08ec: SLDC 00          Short load constant 0
   08ed: CGP  03          Call global procedure GETCMD.3
   08ef: FJP  $0900       Jump if TOS false
   08f1: SLDL 06          Short load local MP6
   08f2: FJP  $08f9       Jump if TOS false
   08f4: SLDC 08          Short load constant 8
   08f5: SRO  0001        Store global word BASE1
   08f7: UJP  $08fc       Unconditional jump
-> 08f9: SLDC 09          Short load constant 9
   08fa: SRO  0001        Store global word BASE1
-> 08fc: SLDC 05          Short load constant 5
   08fd: SLDC 01          Short load constant 1
   08fe: CSP  04          Call standard procedure EXIT
-> 0900: UJP  $0925       Unconditional jump
-> 0902: SLDO 03          Short load global BASE3
   0903: LDCI 0300        Load word 768
   0906: SLDC 01          Short load constant 1
   0907: INN              Set membership (TOS-1 in set TOS)
   0908: LNOT             Logical NOT (~TOS)
   0909: FJP  $0925       Jump if TOS false
   090b: LOD  02 0003     Load word at G3 (OUTPUT)
   090e: NOP              No operation
   090f: LSA  10          Load string address: 'Must L(ink first'
   0921: SLDC 00          Short load constant 0
   0922: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0925: UJP  $09a3       Unconditional jump
-> 0927: LLA  0132        Load local address MP306
   092a: LDM  04          Load 4 words from (TOS)
   092c: SLDC 04          Short load constant 4
   092d: LLA  00c2        Load local address MP194
   0930: LDM  04          Load 4 words from (TOS)
   0932: SLDC 04          Short load constant 4
   0933: INT              Set intersection (TOS AND TOS-1)
   0934: SLDC 00          Short load constant 0
   0935: NEQSET           Set TOS-1 <> TOS
   0937: FJP  $0973       Jump if TOS false
   0939: LOD  02 0003     Load word at G3 (OUTPUT)
   093c: NOP              No operation
   093d: LSA  2e          Load string address: 'Conflict between intrinsic and user segment(s)'
   096d: SLDC 00          Short load constant 0
   096e: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0971: UJP  $09a3       Unconditional jump
-> 0973: LLA  00c2        Load local address MP194
   0976: LDM  04          Load 4 words from (TOS)
   0978: SLDC 04          Short load constant 4
   0979: SLDC 00          Short load constant 0
   097a: NEQSET           Set TOS-1 <> TOS
   097c: FJP  $098b       Jump if TOS false
   097e: LLA  0009        Load local address MP9
   0980: LLA  0032        Load local address MP50
   0982: SLDC 00          Short load constant 0
   0983: SLDC 00          Short load constant 0
   0984: CGP  0b          Call global procedure GETCMD.11
   0986: LNOT             Logical NOT (~TOS)
   0987: FJP  $098b       Jump if TOS false
   0989: UJP  $09a3       Unconditional jump
-> 098b: LLA  0032        Load local address MP50
   098d: LOD  02 0008     Load word at G8
   0990: CGP  09          Call global procedure GETCMD.9
-> 0992: SLDL 04          Short load local MP4
   0993: SLDC 00          Short load constant 0
   0994: STO              Store indirect (TOS into TOS-1)
   0995: SLDC 01          Short load constant 1
   0996: STL  0001        Store TOS into MP1
   0998: LOD  02 0008     Load word at G8
   099b: SLDC 00          Short load constant 0
   099c: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   099f: SLDC 05          Short load constant 5
   09a0: SLDC 13          Short load constant 19
   09a1: CSP  04          Call standard procedure EXIT
-> 09a3: LOD  02 0008     Load word at G8
   09a6: SLDC 00          Short load constant 0
   09a7: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   09aa: LDA  02 01bc     Load addr G444
   09ae: LLA  015f        Load local address MP351
   09b1: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 09b3: RNP  01          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC20(PARAM1) (* P=20 LL=1 *)
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
-> 0ada: SLDL 01          Short load local MP1
   0adb: SLDC 08          Short load constant 8
   0adc: EQUI             Integer TOS-1 = TOS
   0add: FJP  $0af5       Jump if TOS false
   0adf: LOD  02 0003     Load word at G3 (OUTPUT)
   0ae2: NOP              No operation
   0ae3: LSA  0a          Load string address: 'Assembling'
   0aef: SLDC 00          Short load constant 0
   0af0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0af3: UJP  $0b08       Unconditional jump
-> 0af5: LOD  02 0003     Load word at G3 (OUTPUT)
   0af8: NOP              No operation
   0af9: LSA  09          Load string address: 'Compiling'
   0b04: SLDC 00          Short load constant 0
   0b05: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0b08: LOD  02 0003     Load word at G3 (OUTPUT)
   0b0b: LSA  03          Load string address: '...'
   0b10: NOP              No operation
   0b11: SLDC 00          Short load constant 0
   0b12: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b15: LOD  02 0003     Load word at G3 (OUTPUT)
   0b18: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b1b: SLDL 01          Short load local MP1
   0b1c: SLDC 08          Short load constant 8
   0b1d: EQUI             Integer TOS-1 = TOS
   0b1e: FJP  $0b25       Jump if TOS false
   0b20: SLDC 00          Short load constant 0
   0b21: STL  0039        Store TOS into MP57
   0b23: UJP  $0b28       Unconditional jump
-> 0b25: SLDC 01          Short load constant 1
   0b26: STL  0039        Store TOS into MP57
-> 0b28: LDL  0039        Load local word MP57
   0b2a: SLDC 01          Short load constant 1
   0b2b: SLDC 00          Short load constant 0
   0b2c: SLDC 00          Short load constant 0
   0b2d: CGP  03          Call global procedure GETCMD.3
   0b2f: FJP  $0d96       Jump if TOS false
   0b31: LOD  02 0011     Load word at G17
   0b34: FJP  $0b5d       Jump if TOS false
   0b36: LLA  0002        Load local address MP2
   0b38: SLDC 00          Short load constant 0
   0b39: STL  003a        Store TOS into MP58
   0b3b: LLA  003a        Load local address MP58
   0b3d: LDA  02 0016     Load addr G22
   0b40: SLDC 07          Short load constant 7
   0b41: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0b44: LLA  003a        Load local address MP58
   0b46: NOP              No operation
   0b47: LSA  01          Load string address: ':'
   0b4a: SLDC 08          Short load constant 8
   0b4b: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0b4e: LLA  003a        Load local address MP58
   0b50: LDA  02 0026     Load addr G38
   0b53: SLDC 17          Short load constant 23
   0b54: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0b57: LLA  003a        Load local address MP58
   0b59: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0b5b: UJP  $0be1       Unconditional jump
-> 0b5d: SLDL 01          Short load local MP1
   0b5e: SLDC 08          Short load constant 8
   0b5f: EQUI             Integer TOS-1 = TOS
   0b60: FJP  $0b76       Jump if TOS false
   0b62: LOD  02 0003     Load word at G3 (OUTPUT)
   0b65: LSA  08          Load string address: 'Assemble'
   0b6f: NOP              No operation
   0b70: SLDC 00          Short load constant 0
   0b71: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b74: UJP  $0b87       Unconditional jump
-> 0b76: LOD  02 0003     Load word at G3 (OUTPUT)
   0b79: LSA  07          Load string address: 'Compile'
   0b82: NOP              No operation
   0b83: SLDC 00          Short load constant 0
   0b84: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0b87: LOD  02 0003     Load word at G3 (OUTPUT)
   0b8a: NOP              No operation
   0b8b: LSA  0c          Load string address: ' what text? '
   0b99: SLDC 00          Short load constant 0
   0b9a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b9d: LOD  02 0002     Load word at G2 (INPUT)
   0ba0: LLA  0002        Load local address MP2
   0ba2: SLDC 28          Short load constant 40
   0ba3: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   0ba6: LOD  02 0002     Load word at G2 (INPUT)
   0ba9: CXP  00 15       Call external procedure PASCALSY.FREADLN
   0bac: CLP  15          Call local procedure GETCMD.21
   0bae: LLA  0002        Load local address MP2
   0bb0: NOP              No operation
   0bb1: LSA  00          Load string address: ''
   0bb3: EQLSTR           String TOS-1 = TOS
   0bb5: FJP  $0bbb       Jump if TOS false
   0bb7: UJP  $0d88       Unconditional jump
   0bb9: UJP  $0be1       Unconditional jump
-> 0bbb: LLA  0002        Load local address MP2
   0bbd: SLDC 01          Short load constant 1
   0bbe: LDB              Load byte at byte ptr TOS-1 + TOS
   0bbf: LOD  02 0001     Load word at G1 (SYSCOM)
   0bc2: INC  002c        Inc field ptr (TOS+44)
   0bc4: SLDC 08          Short load constant 8
   0bc5: SLDC 08          Short load constant 8
   0bc6: LDP              Load packed field (TOS)
   0bc7: EQUI             Integer TOS-1 = TOS
   0bc8: FJP  $0bce       Jump if TOS false
   0bca: UJP  $0d88       Unconditional jump
   0bcc: UJP  $0be1       Unconditional jump
-> 0bce: LLA  0002        Load local address MP2
   0bd0: SLDC 00          Short load constant 0
   0bd1: SLDC 00          Short load constant 0
   0bd2: CGP  06          Call global procedure GETCMD.6
   0bd4: FJP  $0bda       Jump if TOS false
   0bd6: SLDC 05          Short load constant 5
   0bd7: SLDC 14          Short load constant 20
   0bd8: CSP  04          Call standard procedure EXIT
-> 0bda: LLA  0002        Load local address MP2
   0bdc: SLDC 01          Short load constant 1
   0bdd: SLDC 28          Short load constant 40
   0bde: CXP  00 2b       Call external procedure PASCALSY.43
-> 0be1: LLA  0017        Load local address MP23
   0be3: LLA  0002        Load local address MP2
   0be5: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0be7: LSA  05          Load string address: '.TEXT'
   0bee: NOP              No operation
   0bef: LLA  0017        Load local address MP23
   0bf1: SLDC 00          Short load constant 0
   0bf2: SLDC 00          Short load constant 0
   0bf3: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0bf6: STL  0038        Store TOS into MP56
   0bf8: LDL  0038        Load local word MP56
   0bfa: SLDC 00          Short load constant 0
   0bfb: NEQI             Integer TOS-1 <> TOS
   0bfc: LDL  0038        Load local word MP56
   0bfe: LLA  0017        Load local address MP23
   0c00: SLDC 00          Short load constant 0
   0c01: LDB              Load byte at byte ptr TOS-1 + TOS
   0c02: SLDC 04          Short load constant 4
   0c03: SBI              Subtract integers (TOS-1 - TOS)
   0c04: EQUI             Integer TOS-1 = TOS
   0c05: LAND             Logical AND (TOS & TOS-1)
   0c06: FJP  $0c10       Jump if TOS false
   0c08: LLA  0017        Load local address MP23
   0c0a: LDL  0038        Load local word MP56
   0c0c: SLDC 05          Short load constant 5
   0c0d: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0c10: LOD  02 0009     Load word at G9
   0c13: LLA  0002        Load local address MP2
   0c15: SLDC 01          Short load constant 1
   0c16: LDCN             Load constant NIL
   0c17: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0c1a: CSP  22          Call standard procedure IORESULT
   0c1c: SLDC 00          Short load constant 0
   0c1d: NEQI             Integer TOS-1 <> TOS
   0c1e: FJP  $0c44       Jump if TOS false
   0c20: LOD  02 0003     Load word at G3 (OUTPUT)
   0c23: LSA  0b          Load string address: 'Can't find '
   0c30: NOP              No operation
   0c31: SLDC 00          Short load constant 0
   0c32: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c35: LOD  02 0003     Load word at G3 (OUTPUT)
   0c38: LLA  0002        Load local address MP2
   0c3a: SLDC 00          Short load constant 0
   0c3b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c3e: SLDC 00          Short load constant 0
   0c3f: STR  02 0011     Store TOS to G17
   0c42: UJP  $0d88       Unconditional jump
-> 0c44: LLA  0002        Load local address MP2
   0c46: SLDC 00          Short load constant 0
   0c47: STL  003a        Store TOS into MP58
   0c49: LLA  003a        Load local address MP58
   0c4b: LDA  02 00fc     Load addr G252
   0c4f: LDL  0039        Load local word MP57
   0c51: IXA  000c        Index array (TOS-1 + TOS * 12)
   0c53: LLA  00ba        Load local address MP186
   0c56: SLDC 01          Short load constant 1
   0c57: LSA  01          Load string address: ':'
   0c5a: NOP              No operation
   0c5b: LDA  02 00fc     Load addr G252
   0c5f: LDL  0039        Load local word MP57
   0c61: IXA  000c        Index array (TOS-1 + TOS * 12)
   0c63: SLDC 00          Short load constant 0
   0c64: SLDC 00          Short load constant 0
   0c65: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0c68: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0c6b: LLA  00ba        Load local address MP186
   0c6e: SLDC 17          Short load constant 23
   0c6f: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0c72: LLA  003a        Load local address MP58
   0c74: NOP              No operation
   0c75: LSA  0f          Load string address: 'SYSTEM.SWAPDISK'
   0c86: SLDC 26          Short load constant 38
   0c87: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0c8a: LLA  003a        Load local address MP58
   0c8c: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0c8e: LOD  02 0037     Load word at G55
   0c91: LLA  0002        Load local address MP2
   0c93: SLDC 01          Short load constant 1
   0c94: LDCN             Load constant NIL
   0c95: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0c98: LLA  002c        Load local address MP44
   0c9a: NOP              No operation
   0c9b: LSA  13          Load string address: '*SYSTEM.WRK.CODE[*]'
   0cb0: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0cb2: LOD  02 0011     Load word at G17
   0cb5: LNOT             Logical NOT (~TOS)
   0cb6: FJP  $0d3d       Jump if TOS false
   0cb8: LOD  02 0003     Load word at G3 (OUTPUT)
   0cbb: LSA  12          Load string address: 'To what codefile? '
   0ccf: NOP              No operation
   0cd0: SLDC 00          Short load constant 0
   0cd1: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0cd4: LOD  02 0002     Load word at G2 (INPUT)
   0cd7: LLA  0002        Load local address MP2
   0cd9: SLDC 28          Short load constant 40
   0cda: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   0cdd: LOD  02 0002     Load word at G2 (INPUT)
   0ce0: CXP  00 15       Call external procedure PASCALSY.FREADLN
   0ce3: CLP  15          Call local procedure GETCMD.21
   0ce5: LLA  0002        Load local address MP2
   0ce7: LSA  00          Load string address: ''
   0ce9: NOP              No operation
   0cea: NEQSTR           String TOS-1 <> TOS
   0cec: FJP  $0d3d       Jump if TOS false
   0cee: LLA  0002        Load local address MP2
   0cf0: SLDC 01          Short load constant 1
   0cf1: LDB              Load byte at byte ptr TOS-1 + TOS
   0cf2: LOD  02 0001     Load word at G1 (SYSCOM)
   0cf5: INC  002c        Inc field ptr (TOS+44)
   0cf7: SLDC 08          Short load constant 8
   0cf8: SLDC 08          Short load constant 8
   0cf9: LDP              Load packed field (TOS)
   0cfa: EQUI             Integer TOS-1 = TOS
   0cfb: FJP  $0d01       Jump if TOS false
   0cfd: UJP  $0d88       Unconditional jump
   0cff: UJP  $0d3d       Unconditional jump
-> 0d01: LSA  01          Load string address: '$'
   0d04: NOP              No operation
   0d05: LLA  0002        Load local address MP2
   0d07: SLDC 00          Short load constant 0
   0d08: SLDC 00          Short load constant 0
   0d09: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0d0c: STL  0038        Store TOS into MP56
   0d0e: LDL  0038        Load local word MP56
   0d10: SLDC 00          Short load constant 0
   0d11: GRTI             Integer TOS-1 > TOS
   0d12: FJP  $0d26       Jump if TOS false
   0d14: LLA  0002        Load local address MP2
   0d16: LDL  0038        Load local word MP56
   0d18: SLDC 01          Short load constant 1
   0d19: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0d1c: LLA  0017        Load local address MP23
   0d1e: LLA  0002        Load local address MP2
   0d20: SLDC 28          Short load constant 40
   0d21: LDL  0038        Load local word MP56
   0d23: CXP  00 18       Call external procedure PASCALSY.SINSERT
-> 0d26: LLA  0002        Load local address MP2
   0d28: SLDC 00          Short load constant 0
   0d29: SLDC 00          Short load constant 0
   0d2a: CGP  06          Call global procedure GETCMD.6
   0d2c: FJP  $0d30       Jump if TOS false
   0d2e: UJP  $0d88       Unconditional jump
-> 0d30: LLA  0002        Load local address MP2
   0d32: SLDC 00          Short load constant 0
   0d33: SLDC 17          Short load constant 23
   0d34: CXP  00 2b       Call external procedure PASCALSY.43
   0d37: LLA  002c        Load local address MP44
   0d39: LLA  0002        Load local address MP2
   0d3b: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 0d3d: LOD  02 0008     Load word at G8
   0d40: LLA  002c        Load local address MP44
   0d42: SLDC 00          Short load constant 0
   0d43: LDCN             Load constant NIL
   0d44: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0d47: CSP  22          Call standard procedure IORESULT
   0d49: SLDC 00          Short load constant 0
   0d4a: NEQI             Integer TOS-1 <> TOS
   0d4b: FJP  $0d6d       Jump if TOS false
   0d4d: LOD  02 0003     Load word at G3 (OUTPUT)
   0d50: NOP              No operation
   0d51: LSA  0b          Load string address: 'Can't open '
   0d5e: SLDC 00          Short load constant 0
   0d5f: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0d62: LOD  02 0003     Load word at G3 (OUTPUT)
   0d65: LLA  002c        Load local address MP44
   0d67: SLDC 00          Short load constant 0
   0d68: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0d6b: UJP  $0d88       Unconditional jump
-> 0d6d: SLDC 00          Short load constant 0
   0d6e: STR  02 000a     Store TOS to G10
   0d71: SLDC 00          Short load constant 0
   0d72: STR  02 000b     Store TOS to G11
   0d75: SLDC 00          Short load constant 0
   0d76: STR  02 000c     Store TOS to G12
   0d79: SLDL 01          Short load local MP1
   0d7a: SLDC 08          Short load constant 8
   0d7b: EQUI             Integer TOS-1 = TOS
   0d7c: FJP  $0d81       Jump if TOS false
   0d7e: SLDC 05          Short load constant 5
   0d7f: STL  0001        Store TOS into MP1
-> 0d81: SLDL 01          Short load local MP1
   0d82: SRO  0001        Store global word BASE1
   0d84: SLDC 05          Short load constant 5
   0d85: SLDC 01          Short load constant 1
   0d86: CSP  04          Call standard procedure EXIT
-> 0d88: LOD  02 0009     Load word at G9
   0d8b: SLDC 00          Short load constant 0
   0d8c: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0d8f: LOD  02 0037     Load word at G55
   0d92: SLDC 00          Short load constant 0
   0d93: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 0d96: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC21 (* P=21 LL=2 *)
BEGIN
-> 0aae: SLDC 01          Short load constant 1
   0aaf: LDA  01 0002     Load addr L12
   0ab2: SLDC 00          Short load constant 0
   0ab3: LDB              Load byte at byte ptr TOS-1 + TOS
   0ab4: SLDC 01          Short load constant 1
   0ab5: SLDC 20          Short load constant 32
   0ab6: LDA  01 0002     Load addr L12
   0ab9: SLDC 01          Short load constant 1
   0aba: SLDC 00          Short load constant 0
   0abb: CSP  0b          Call standard procedure SCAN
   0abd: ADI              Add integers (TOS + TOS-1)
   0abe: STR  01 0038     Store TOS to L156
   0ac1: LDA  01 0002     Load addr L12
   0ac4: SLDC 01          Short load constant 1
   0ac5: LOD  01 0038     Load word at L1_56
   0ac8: SLDC 01          Short load constant 1
   0ac9: SBI              Subtract integers (TOS-1 - TOS)
   0aca: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0acd: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC22 (* P=22 LL=1 *)
  BASE1
  BASE3
  MP2
  MP10
BEGIN
-> 0daa: LOD  02 0009     Load word at G9
   0dad: SLDC 00          Short load constant 0
   0dae: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0db1: LOD  02 0037     Load word at G55
   0db4: SLDC 00          Short load constant 0
   0db5: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0db8: LOD  02 000a     Load word at G10
   0dbb: SLDC 00          Short load constant 0
   0dbc: GRTI             Integer TOS-1 > TOS
   0dbd: FJP  $0deb       Jump if TOS false
   0dbf: SLDC 00          Short load constant 0
   0dc0: STR  02 0010     Store TOS to G16
   0dc3: LOD  02 0008     Load word at G8
   0dc6: SLDC 02          Short load constant 2
   0dc7: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0dca: LOD  02 000b     Load word at G11
   0dcd: SLDC 00          Short load constant 0
   0dce: GRTI             Integer TOS-1 > TOS
   0dcf: FJP  $0de9       Jump if TOS false
   0dd1: CXP  00 25       Call external procedure PASCALSY.37
   0dd4: LOD  02 0003     Load word at G3 (OUTPUT)
   0dd7: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0dda: SLDC 02          Short load constant 2
   0ddb: SLDC 01          Short load constant 1
   0ddc: SLDC 00          Short load constant 0
   0ddd: SLDC 00          Short load constant 0
   0dde: CGP  03          Call global procedure GETCMD.3
   0de0: FJP  $0de9       Jump if TOS false
   0de2: SLDC 04          Short load constant 4
   0de3: SRO  0001        Store global word BASE1
   0de5: SLDC 05          Short load constant 5
   0de6: SLDC 01          Short load constant 1
   0de7: CSP  04          Call standard procedure EXIT
-> 0de9: UJP  $0e86       Unconditional jump
-> 0deb: LDA  02 001e     Load addr G30
   0dee: NOP              No operation
   0def: LSA  0f          Load string address: 'SYSTEM.WRK.CODE'
   0e00: NEQSTR           String TOS-1 <> TOS
   0e02: FJP  $0e77       Jump if TOS false
   0e04: LDA  02 0012     Load addr G18
   0e07: LOD  02 0008     Load word at G8
   0e0a: INC  0008        Inc field ptr (TOS+8)
   0e0c: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0e0e: LDA  02 001e     Load addr G30
   0e11: LOD  02 0008     Load word at G8
   0e14: INC  0013        Inc field ptr (TOS+19)
   0e16: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0e18: LDA  02 001e     Load addr G30
   0e1b: LSA  0f          Load string address: 'SYSTEM.WRK.CODE'
   0e2c: NOP              No operation
   0e2d: NEQSTR           String TOS-1 <> TOS
   0e2f: FJP  $0e77       Jump if TOS false
   0e31: LDA  02 001a     Load addr G26
   0e34: LDA  02 0012     Load addr G18
   0e37: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0e39: LDA  02 001e     Load addr G30
   0e3c: SLDC 00          Short load constant 0
   0e3d: LDB              Load byte at byte ptr TOS-1 + TOS
   0e3e: SLDC 05          Short load constant 5
   0e3f: GRTI             Integer TOS-1 > TOS
   0e40: FJP  $0e77       Jump if TOS false
   0e42: LDA  02 001e     Load addr G30
   0e45: LLA  0002        Load local address MP2
   0e47: LDA  02 001e     Load addr G30
   0e4a: SLDC 00          Short load constant 0
   0e4b: LDB              Load byte at byte ptr TOS-1 + TOS
   0e4c: SLDC 04          Short load constant 4
   0e4d: SBI              Subtract integers (TOS-1 - TOS)
   0e4e: SLDC 05          Short load constant 5
   0e4f: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0e52: LLA  0002        Load local address MP2
   0e54: NOP              No operation
   0e55: LSA  05          Load string address: '.CODE'
   0e5c: EQLSTR           String TOS-1 = TOS
   0e5e: FJP  $0e77       Jump if TOS false
   0e60: LDA  02 002e     Load addr G46
   0e63: LDA  02 001e     Load addr G30
   0e66: LLA  000a        Load local address MP10
   0e68: SLDC 01          Short load constant 1
   0e69: LDA  02 001e     Load addr G30
   0e6c: SLDC 00          Short load constant 0
   0e6d: LDB              Load byte at byte ptr TOS-1 + TOS
   0e6e: SLDC 05          Short load constant 5
   0e6f: SBI              Subtract integers (TOS-1 - TOS)
   0e70: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0e73: LLA  000a        Load local address MP10
   0e75: SAS  0f          String assign (TOS to TOS-1, 15 chars)
-> 0e77: SLDC 01          Short load constant 1
   0e78: STR  02 0010     Store TOS to G16
   0e7b: SLDO 03          Short load global BASE3
   0e7c: LDCI 00c0        Load word 192
   0e7f: SLDC 01          Short load constant 1
   0e80: INN              Set membership (TOS-1 in set TOS)
   0e81: FJP  $0e86       Jump if TOS false
   0e83: SLDC 01          Short load constant 1
   0e84: CGP  02          Call global procedure GETCMD.2
-> 0e86: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC23(PARAM1) (* P=23 LL=1 *)
  MP1=PARAM1
BEGIN
-> 0e94: LOD  02 0003     Load word at G3 (OUTPUT)
   0e97: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0e9a: SLDL 01          Short load local MP1
   0e9b: SLDC 01          Short load constant 1
   0e9c: EQUI             Integer TOS-1 = TOS
   0e9d: FJP  $0ecd       Jump if TOS false
   0e9f: LOD  02 0003     Load word at G3 (OUTPUT)
   0ea2: NOP              No operation
   0ea3: LSA  1c          Load string address: 'Nested exec commands illegal'
   0ec1: SLDC 00          Short load constant 0
   0ec2: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ec5: LOD  02 0003     Load word at G3 (OUTPUT)
   0ec8: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ecb: UJP  $0eef       Unconditional jump
-> 0ecd: LOD  02 0003     Load word at G3 (OUTPUT)
   0ed0: NOP              No operation
   0ed1: LSA  12          Load string address: 'Error opening exec'
   0ee5: SLDC 00          Short load constant 0
   0ee6: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ee9: LOD  02 0003     Load word at G3 (OUTPUT)
   0eec: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0eef: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC24 (* P=24 LL=1 *)
BEGIN
-> 0efc: SLDC 20          Short load constant 32
   0efd: STR  02 018a     Store TOS to G394
   0f01: LOD  02 0036     Load word at G54
   0f04: STR  02 017e     Store TOS to G382
   0f08: LDA  02 017d     Load addr G381
   0f0c: LDCI 0100        Load word 256
   0f0f: CSP  01          Call standard procedure NEW
   0f11: LDA  02 0036     Load addr G54
   0f14: CSP  20          Call standard procedure MARK
-> 0f16: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC25(PARAM1) (* P=25 LL=1 *)
  BASE1
  BASE6
  MP1=PARAM1
  MP2
  MP43
  MP46
  MP47
  MP48
BEGIN
-> 0f22: SLDL 01          Short load local MP1
   0f23: FJP  $0f2f       Jump if TOS false
   0f25: LLA  0002        Load local address MP2
   0f27: LDA  02 0148     Load addr G328
   0f2b: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0f2d: UJP  $0f7a       Unconditional jump
-> 0f2f: LOD  02 0003     Load word at G3 (OUTPUT)
   0f32: NOP              No operation
   0f33: LSA  07          Load string address: 'Execute'
   0f3c: SLDC 00          Short load constant 0
   0f3d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0f40: LOD  02 0001     Load word at G1 (SYSCOM)
   0f43: INC  001d        Inc field ptr (TOS+29)
   0f45: SLDC 01          Short load constant 1
   0f46: SLDC 04          Short load constant 4
   0f47: LDP              Load packed field (TOS)
   0f48: LNOT             Logical NOT (~TOS)
   0f49: FJP  $0f5f       Jump if TOS false
   0f4b: LOD  02 0003     Load word at G3 (OUTPUT)
   0f4e: NOP              No operation
   0f4f: LSA  0a          Load string address: ' what file'
   0f5b: SLDC 00          Short load constant 0
   0f5c: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0f5f: LOD  02 0003     Load word at G3 (OUTPUT)
   0f62: NOP              No operation
   0f63: LSA  02          Load string address: '? '
   0f67: SLDC 00          Short load constant 0
   0f68: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0f6b: LOD  02 0002     Load word at G2 (INPUT)
   0f6e: LLA  0002        Load local address MP2
   0f70: SLDC 50          Short load constant 80
   0f71: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   0f74: LOD  02 0002     Load word at G2 (INPUT)
   0f77: CXP  00 15       Call external procedure PASCALSY.FREADLN
-> 0f7a: LLA  0002        Load local address MP2
   0f7c: SLDC 00          Short load constant 0
   0f7d: LDB              Load byte at byte ptr TOS-1 + TOS
   0f7e: SLDC 00          Short load constant 0
   0f7f: GRTI             Integer TOS-1 > TOS
   0f80: FJP  $105d       Jump if TOS false
   0f82: LLA  0002        Load local address MP2
   0f84: SLDC 00          Short load constant 0
   0f85: LDB              Load byte at byte ptr TOS-1 + TOS
   0f86: SLDC 05          Short load constant 5
   0f87: GRTI             Integer TOS-1 > TOS
   0f88: FJP  $1041       Jump if TOS false
   0f8a: LLA  002b        Load local address MP43
   0f8c: LLA  0002        Load local address MP2
   0f8e: LLA  0030        Load local address MP48
   0f90: SLDC 01          Short load constant 1
   0f91: SLDC 05          Short load constant 5
   0f92: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0f95: LLA  0030        Load local address MP48
   0f97: SAS  05          String assign (TOS to TOS-1, 5 chars)
   0f99: SLDC 01          Short load constant 1
   0f9a: STL  002e        Store TOS into MP46
   0f9c: SLDC 04          Short load constant 4
   0f9d: STL  0030        Store TOS into MP48
-> 0f9f: LDL  002e        Load local word MP46
   0fa1: LDL  0030        Load local word MP48
   0fa3: LEQI             Integer TOS-1 <= TOS
   0fa4: FJP  $0fc9       Jump if TOS false
   0fa6: LLA  002b        Load local address MP43
   0fa8: LDL  002e        Load local word MP46
   0faa: LDB              Load byte at byte ptr TOS-1 + TOS
   0fab: STL  002f        Store TOS into MP47
   0fad: LDL  002f        Load local word MP47
   0faf: SLDC 61          Short load constant 97
   0fb0: GEQI             Integer TOS-1 >= TOS
   0fb1: LDL  002f        Load local word MP47
   0fb3: SLDC 7a          Short load constant 122
   0fb4: LEQI             Integer TOS-1 <= TOS
   0fb5: LAND             Logical AND (TOS & TOS-1)
   0fb6: FJP  $0fc1       Jump if TOS false
   0fb8: LLA  002b        Load local address MP43
   0fba: LDL  002e        Load local word MP46
   0fbc: LDL  002f        Load local word MP47
   0fbe: SLDC 20          Short load constant 32
   0fbf: SBI              Subtract integers (TOS-1 - TOS)
   0fc0: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0fc1: LDL  002e        Load local word MP46
   0fc3: SLDC 01          Short load constant 1
   0fc4: ADI              Add integers (TOS + TOS-1)
   0fc5: STL  002e        Store TOS into MP46
   0fc7: UJP  $0f9f       Unconditional jump
-> 0fc9: LLA  002b        Load local address MP43
   0fcb: LSA  05          Load string address: 'EXEC/'
   0fd2: NOP              No operation
   0fd3: EQLSTR           String TOS-1 = TOS
   0fd5: FJP  $1041       Jump if TOS false
   0fd7: LOD  02 0183     Load word at G387
   0fdb: LOD  02 0182     Load word at G386
   0fdf: LOR              Logical OR (TOS | TOS-1)
   0fe0: FJP  $0fe7       Jump if TOS false
   0fe2: SLDC 01          Short load constant 1
   0fe3: CGP  17          Call global procedure GETCMD.23
   0fe5: UJP  $103d       Unconditional jump
-> 0fe7: LLA  0002        Load local address MP2
   0fe9: SLDC 01          Short load constant 1
   0fea: SLDC 05          Short load constant 5
   0feb: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0fee: LLA  0002        Load local address MP2
   0ff0: SLDC 00          Short load constant 0
   0ff1: SLDC 00          Short load constant 0
   0ff2: CGP  06          Call global procedure GETCMD.6
   0ff4: FJP  $0ffa       Jump if TOS false
   0ff6: SLDC 05          Short load constant 5
   0ff7: SLDC 19          Short load constant 25
   0ff8: CSP  04          Call standard procedure EXIT
-> 0ffa: LLA  0002        Load local address MP2
   0ffc: SLDC 01          Short load constant 1
   0ffd: SLDC 50          Short load constant 80
   0ffe: CXP  00 2b       Call external procedure PASCALSY.43
   1001: LDA  02 018c     Load addr G396
   1005: LLA  0002        Load local address MP2
   1007: SLDC 01          Short load constant 1
   1008: SLDC 00          Short load constant 0
   1009: CXP  00 05       Call external procedure PASCALSY.FOPEN
   100c: CSP  22          Call standard procedure IORESULT
   100e: SLDC 00          Short load constant 0
   100f: EQUI             Integer TOS-1 = TOS
   1010: FJP  $103a       Jump if TOS false
   1012: CGP  18          Call global procedure GETCMD.24
   1014: SLDC 01          Short load constant 1
   1015: STR  02 0182     Store TOS to G386
   1019: SLDC 01          Short load constant 1
   101a: STR  02 0181     Store TOS to G385
   101e: CXP  00 2e       Call external procedure PASCALSY.46
   1021: LOD  02 017d     Load word at G381
   1025: LOD  02 017f     Load word at G383
   1029: LDB              Load byte at byte ptr TOS-1 + TOS
   102a: STR  02 018b     Store TOS to G395
   102e: LOD  02 017f     Load word at G383
   1032: SLDC 01          Short load constant 1
   1033: ADI              Add integers (TOS + TOS-1)
   1034: STR  02 017f     Store TOS to G383
   1038: UJP  $103d       Unconditional jump
-> 103a: SLDC 02          Short load constant 2
   103b: CGP  17          Call global procedure GETCMD.23
-> 103d: SLDC 05          Short load constant 5
   103e: SLDC 19          Short load constant 25
   103f: CSP  04          Call standard procedure EXIT
-> 1041: LLA  0002        Load local address MP2
   1043: SLDC 00          Short load constant 0
   1044: SLDC 50          Short load constant 80
   1045: CXP  00 2b       Call external procedure PASCALSY.43
   1048: LLA  0002        Load local address MP2
   104a: SLDC 00          Short load constant 0
   104b: SLDC 00          Short load constant 0
   104c: SLDC 01          Short load constant 1
   104d: LAO  0006        Load global BASE6
   104f: SLDC 00          Short load constant 0
   1050: SLDC 00          Short load constant 0
   1051: SLDC 00          Short load constant 0
   1052: CGP  13          Call global procedure GETCMD.19
   1054: FJP  $105d       Jump if TOS false
   1056: SLDC 04          Short load constant 4
   1057: SRO  0001        Store global word BASE1
   1059: SLDC 05          Short load constant 5
   105a: SLDC 01          Short load constant 1
   105b: CSP  04          Call standard procedure EXIT
-> 105d: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC26 (* P=26 LL=1 *)
  MP1
  MP2
BEGIN
-> 10ea: LOD  02 0186     Load word at G390
   10ee: LOD  02 0185     Load word at G389
   10f2: ADI              Add integers (TOS + TOS-1)
   10f3: STL  0002        Store TOS into MP2
   10f5: LOD  02 0003     Load word at G3 (OUTPUT)
   10f8: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   10fb: LOD  02 0003     Load word at G3 (OUTPUT)
   10fe: NOP              No operation
   10ff: LSA  10          Load string address: 'Swapping levels:'
   1111: SLDC 00          Short load constant 0
   1112: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1115: LOD  02 0003     Load word at G3 (OUTPUT)
   1118: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   111b: LOD  02 0003     Load word at G3 (OUTPUT)
   111e: NOP              No operation
   111f: LSA  1b          Load string address: '  0 = system is not swapped'
   113c: SLDC 00          Short load constant 0
   113d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1140: LOD  02 0003     Load word at G3 (OUTPUT)
   1143: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1146: LOD  02 0003     Load word at G3 (OUTPUT)
   1149: LSA  30          Load string address: '  1 = file open and close procedures are swapped'
   117b: NOP              No operation
   117c: SLDC 00          Short load constant 0
   117d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1180: LOD  02 0003     Load word at G3 (OUTPUT)
   1183: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1186: LOD  02 0003     Load word at G3 (OUTPUT)
   1189: LSA  3d          Load string address: '  2 = file open/close and disk get and put procedures swapped'
   11c8: NOP              No operation
   11c9: SLDC 00          Short load constant 0
   11ca: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   11cd: LOD  02 0003     Load word at G3 (OUTPUT)
   11d0: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   11d3: LOD  02 0003     Load word at G3 (OUTPUT)
   11d6: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   11d9: LOD  02 0003     Load word at G3 (OUTPUT)
   11dc: NOP              No operation
   11dd: LSA  16          Load string address: 'Old swapping level is '
   11f5: SLDC 00          Short load constant 0
   11f6: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   11f9: LOD  02 0003     Load word at G3 (OUTPUT)
   11fc: SLDL 02          Short load local MP2
   11fd: SLDC 00          Short load constant 0
   11fe: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   1201: LOD  02 0003     Load word at G3 (OUTPUT)
   1204: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1207: LOD  02 0003     Load word at G3 (OUTPUT)
   120a: NOP              No operation
   120b: LSA  25          Load string address: 'New swapping level (ESCAPE to exit): '
   1232: SLDC 00          Short load constant 0
   1233: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 1236: LOD  02 0004     Load word at G4 (SYSTERM)
   1239: LLA  0001        Load local address MP1
   123b: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   123e: SLDL 01          Short load local MP1
   123f: LOD  02 0001     Load word at G1 (SYSCOM)
   1242: INC  002c        Inc field ptr (TOS+44)
   1244: SLDC 08          Short load constant 8
   1245: SLDC 08          Short load constant 8
   1246: LDP              Load packed field (TOS)
   1247: EQUI             Integer TOS-1 = TOS
   1248: SLDL 01          Short load local MP1
   1249: SLDC 30          Short load constant 48
   124a: EQUI             Integer TOS-1 = TOS
   124b: LOR              Logical OR (TOS | TOS-1)
   124c: SLDL 01          Short load local MP1
   124d: SLDC 31          Short load constant 49
   124e: EQUI             Integer TOS-1 = TOS
   124f: LOR              Logical OR (TOS | TOS-1)
   1250: SLDL 01          Short load local MP1
   1251: SLDC 32          Short load constant 50
   1252: EQUI             Integer TOS-1 = TOS
   1253: LOR              Logical OR (TOS | TOS-1)
   1254: FJP  $1236       Jump if TOS false
   1256: SLDL 01          Short load local MP1
   125a: LDC  04          Load multiple-word constant
                         0007000000000000
   1262: SLDC 04          Short load constant 4
   1263: INN              Set membership (TOS-1 in set TOS)
   1264: FJP  $12d9       Jump if TOS false
   1266: LOD  02 0003     Load word at G3 (OUTPUT)
   1269: SLDL 01          Short load local MP1
   126a: SLDC 00          Short load constant 0
   126b: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   126e: SLDL 01          Short load local MP1
   126f: SLDC 32          Short load constant 50
   1270: EQUI             Integer TOS-1 = TOS
   1271: STR  02 0185     Store TOS to G389
   1275: SLDL 01          Short load local MP1
   1276: SLDC 31          Short load constant 49
   1277: EQUI             Integer TOS-1 = TOS
   1278: LOD  02 0185     Load word at G389
   127c: LOR              Logical OR (TOS | TOS-1)
   127d: STR  02 0186     Store TOS to G390
   1281: LOD  02 0185     Load word at G389
   1285: FJP  $12d9       Jump if TOS false
   1287: LOD  02 0003     Load word at G3 (OUTPUT)
   128a: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   128d: LOD  02 0003     Load word at G3 (OUTPUT)
   1290: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1293: LOD  02 0003     Load word at G3 (OUTPUT)
   1296: NOP              No operation
   1297: LSA  3c          Load string address: 'Warning, programs using GET or PUT to disk will be very slow'
   12d5: SLDC 00          Short load constant 0
   12d6: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 12d9: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC27 (* P=27 LL=1 *)
  MP1
  MP2
  MP23
  MP24
BEGIN
-> 12e8: LOD  02 0003     Load word at G3 (OUTPUT)
   12eb: LSA  0e          Load string address: 'New exec name:'
   12fb: NOP              No operation
   12fc: SLDC 00          Short load constant 0
   12fd: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1300: LOD  02 0002     Load word at G2 (INPUT)
   1303: LLA  0002        Load local address MP2
   1305: SLDC 28          Short load constant 40
   1306: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   1309: LOD  02 0002     Load word at G2 (INPUT)
   130c: CXP  00 15       Call external procedure PASCALSY.FREADLN
   130f: LLA  0002        Load local address MP2
   1311: SLDC 00          Short load constant 0
   1312: LDB              Load byte at byte ptr TOS-1 + TOS
   1313: SLDC 00          Short load constant 0
   1314: GRTI             Integer TOS-1 > TOS
   1315: FJP  $1369       Jump if TOS false
   1317: LLA  0002        Load local address MP2
   1319: LLA  0002        Load local address MP2
   131b: SLDC 00          Short load constant 0
   131c: LDB              Load byte at byte ptr TOS-1 + TOS
   131d: LDB              Load byte at byte ptr TOS-1 + TOS
   131e: SLDC 2e          Short load constant 46
   131f: EQUI             Integer TOS-1 = TOS
   1320: STL  0017        Store TOS into MP23
   1322: LLA  0002        Load local address MP2
   1324: SLDC 00          Short load constant 0
   1325: SLDC 00          Short load constant 0
   1326: CGP  06          Call global procedure GETCMD.6
   1328: FJP  $132e       Jump if TOS false
   132a: SLDC 05          Short load constant 5
   132b: SLDC 1b          Short load constant 27
   132c: CSP  04          Call standard procedure EXIT
-> 132e: LLA  0002        Load local address MP2
   1330: SLDC 01          Short load constant 1
   1331: SLDC 25          Short load constant 37
   1332: CXP  00 2b       Call external procedure PASCALSY.43
   1335: LLA  0002        Load local address MP2
   1337: SLDC 00          Short load constant 0
   1338: LDB              Load byte at byte ptr TOS-1 + TOS
   1339: SLDC 00          Short load constant 0
   133a: GRTI             Integer TOS-1 > TOS
   133b: LDL  0017        Load local word MP23
   133d: LNOT             Logical NOT (~TOS)
   133e: LAND             Logical AND (TOS & TOS-1)
   133f: FJP  $1369       Jump if TOS false
   1341: LLA  0002        Load local address MP2
   1343: LLA  0002        Load local address MP2
   1345: SLDC 00          Short load constant 0
   1346: LDB              Load byte at byte ptr TOS-1 + TOS
   1347: LDB              Load byte at byte ptr TOS-1 + TOS
   1348: SLDC 5d          Short load constant 93
   1349: NEQI             Integer TOS-1 <> TOS
   134a: FJP  $1369       Jump if TOS false
   134c: LLA  0002        Load local address MP2
   134e: SLDC 00          Short load constant 0
   134f: STL  0018        Store TOS into MP24
   1351: LLA  0018        Load local address MP24
   1353: LLA  0002        Load local address MP2
   1355: SLDC 28          Short load constant 40
   1356: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   1359: LLA  0018        Load local address MP24
   135b: LSA  03          Load string address: '[8]'
   1360: NOP              No operation
   1361: SLDC 2b          Short load constant 43
   1362: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   1365: LLA  0018        Load local address MP24
   1367: SAS  28          String assign (TOS to TOS-1, 40 chars)
-> 1369: LDA  02 018c     Load addr G396
   136d: LLA  0002        Load local address MP2
   136f: SLDC 00          Short load constant 0
   1370: SLDC 00          Short load constant 0
   1371: CXP  00 05       Call external procedure PASCALSY.FOPEN
   1374: CSP  22          Call standard procedure IORESULT
   1376: SLDC 00          Short load constant 0
   1377: EQUI             Integer TOS-1 = TOS
   1378: FJP  $1426       Jump if TOS false
   137a: SLDC 25          Short load constant 37
   137b: STR  02 018b     Store TOS to G395
   137f: LOD  02 0003     Load word at G3 (OUTPUT)
   1382: NOP              No operation
   1383: LSA  0b          Load string address: 'Terminator='
   1390: SLDC 00          Short load constant 0
   1391: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1394: LOD  02 0003     Load word at G3 (OUTPUT)
   1397: LOD  02 018b     Load word at G395
   139b: SLDC 00          Short load constant 0
   139c: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   139f: LOD  02 0003     Load word at G3 (OUTPUT)
   13a2: NOP              No operation
   13a3: LSA  0c          Load string address: ', change it?'
   13b1: SLDC 00          Short load constant 0
   13b2: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   13b5: SLDC 00          Short load constant 0
   13b6: SLDC 00          Short load constant 0
   13b7: CGP  04          Call global procedure GETCMD.4
   13b9: FJP  $13e4       Jump if TOS false
   13bb: LOD  02 0003     Load word at G3 (OUTPUT)
   13be: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   13c1: LOD  02 0003     Load word at G3 (OUTPUT)
   13c4: NOP              No operation
   13c5: LSA  0f          Load string address: 'New terminator:'
   13d6: SLDC 00          Short load constant 0
   13d7: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   13da: LOD  02 0002     Load word at G2 (INPUT)
   13dd: LDA  02 018b     Load addr G395
   13e1: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
-> 13e4: CGP  18          Call global procedure GETCMD.24
   13e6: SLDC 01          Short load constant 1
   13e7: STR  02 0183     Store TOS to G387
   13eb: LOD  02 017d     Load word at G381
   13ef: SLDC 00          Short load constant 0
   13f0: LDCI 0200        Load word 512
   13f3: SLDC 00          Short load constant 0
   13f4: CSP  0a          Call standard procedure FLCH
   13f6: SLDC 00          Short load constant 0
   13f7: STR  02 0181     Store TOS to G385
   13fb: SLDC 01          Short load constant 1
   13fc: STL  0001        Store TOS into MP1
   13fe: SLDC 02          Short load constant 2
   13ff: STL  0018        Store TOS into MP24
-> 1401: SLDL 01          Short load local MP1
   1402: LDL  0018        Load local word MP24
   1404: LEQI             Integer TOS-1 <= TOS
   1405: FJP  $1417       Jump if TOS false
   1407: LOD  02 0183     Load word at G387
   140b: FJP  $1410       Jump if TOS false
   140d: CXP  00 2f       Call external procedure PASCALSY.47
-> 1410: SLDL 01          Short load local MP1
   1411: SLDC 01          Short load constant 1
   1412: ADI              Add integers (TOS + TOS-1)
   1413: STL  0001        Store TOS into MP1
   1415: UJP  $1401       Unconditional jump
-> 1417: LOD  02 0183     Load word at G387
   141b: FJP  $1424       Jump if TOS false
   141d: LOD  02 018b     Load word at G395
   1421: CXP  00 2c       Call external procedure PASCALSY.44
-> 1424: UJP  $1429       Unconditional jump
-> 1426: SLDC 02          Short load constant 2
   1427: CGP  17          Call global procedure GETCMD.23
-> 1429: RNP  00          Return from nonbase procedure
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

