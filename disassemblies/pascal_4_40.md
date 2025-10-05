#  SYSTEM.PASCAL-04-40.bin 

## Segment Table
| slot |segNum | name | block | length | kind | textAddr | mType | version |
|-----:|------:|------|------:|-------:|------|---------:|-------|--------:|
| 0 | 0 | PASCALSY | 0001 | 1438 | linked | 0000 | 2 | 6 |
| 15 | 15 |  | 0004 | 5080 | linked | 0000 | 0 | 0 |
| 1 | 1 | USERPROG | 000E | 56 | linked | 0000 | 2 | 6 |
| 2 | 2 | FIOPRIMS | 000F | 796 | linked_intrins | 0000 | 2 | 6 |
| 3 | 3 | PRINTERR | 0011 | 1156 | linked | 0000 | 2 | 6 |
| 4 | 4 | INITIALI | 0014 | 3148 | linked | 0000 | 2 | 6 |
| 5 | 5 | GETCMD | 001B | 6302 | linked | 0000 | 2 | 6 |
| 6 | 6 | FILEPROC | 0028 | 2258 | linked | 0000 | 2 | 6 |

intrinsics: [2]

comment: COPYRIGHT 1979,1980,1983-1985 APPLE COMPUTER, INC. ALL RIGHTS RESERVED

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
   006c: CLP  34          Call local procedure PASCALSY.52
   006e: UJP  $0097       Unconditional jump
-> 0070: SLDO 02          Short load global BASE2
   0071: SIND 02          Short index load *TOS+2
   0072: SLDC 00          Short load constant 0
   0073: SLDC 00          Short load constant 0
   0074: CBP  2a          Call base procedure PASCALSY.42
   0076: LNOT             Logical NOT (~TOS)
   0077: FJP  $007d       Jump if TOS false
   0079: CLP  34          Call local procedure PASCALSY.52
   007b: UJP  $0097       Unconditional jump
-> 007d: SLDO 02          Short load global BASE2
   007e: SIND 04          Short index load *TOS+4
   007f: SLDC 00          Short load constant 0
   0080: IXA  000d        Index array (TOS-1 + TOS * 13)
   0082: INC  0003        Inc field ptr (TOS+3)
   0084: LDA  01 003f     Load addr G63
   0087: NEQSTR           String TOS-1 <> TOS
   0089: FJP  $008f       Jump if TOS false
   008b: CLP  34          Call local procedure PASCALSY.52
   008d: UJP  $0097       Unconditional jump
-> 008f: SLDO 02          Short load global BASE2
   0090: SIND 01          Short index load *TOS+1
   0091: LOD  01 000a     Load word at G10
   0094: CXP  03 01       Call external procedure PRINTERR.PRINTERROR
-> 0097: CLP  33          Call local procedure PASCALSY.51
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
   00c0: FJP  $0100       Jump if TOS false
   00c2: SLDC 01          Short load constant 1
   00c3: SLDC 00          Short load constant 0
   00c4: SLDC 00          Short load constant 0
   00c5: CBP  28          Call base procedure PASCALSY.40
   00c7: LNOT             Logical NOT (~TOS)
   00c8: FJP  $00fe       Jump if TOS false
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
-> 00f8: CBP  32          Call base procedure PASCALSY.50
   00fa: SLDC 00          Short load constant 0
   00fb: SLDC 30          Short load constant 48
   00fc: CSP  04          Call standard procedure EXIT
-> 00fe: UJP  $0128       Unconditional jump
-> 0100: LOD  01 0003     Load word at G3 (OUTPUT)
   0103: LSA  13          Load string address: 'Press CONTROL-RESET'
   0118: NOP              No operation
   0119: SLDC 00          Short load constant 0
   011a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   011d: LOD  01 0003     Load word at G3 (OUTPUT)
   0120: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0123: SLDC 01          Short load constant 1
   0124: FJP  $0128       Jump if TOS false
   0126: UJP  $0123       Unconditional jump
-> 0128: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FINIT(PARAM1; PARAM2; PARAM3) (* P=3 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 013a: SLDO 03          Short load global BASE3
   013b: SRO  0004        Store global word BASE4
   013d: SLDO 04          Short load global BASE4
   013e: INC  0003        Inc field ptr (TOS+3)
   0140: SLDC 00          Short load constant 0
   0141: STO              Store indirect (TOS into TOS-1)
   0142: SLDO 04          Short load global BASE4
   0143: INC  0005        Inc field ptr (TOS+5)
   0145: SLDC 00          Short load constant 0
   0146: STO              Store indirect (TOS into TOS-1)
   0147: SLDO 04          Short load global BASE4
   0148: INC  0002        Inc field ptr (TOS+2)
   014a: SLDC 01          Short load constant 1
   014b: STO              Store indirect (TOS into TOS-1)
   014c: SLDO 04          Short load global BASE4
   014d: INC  0001        Inc field ptr (TOS+1)
   014f: SLDC 01          Short load constant 1
   0150: STO              Store indirect (TOS into TOS-1)
   0151: SLDO 04          Short load global BASE4
   0152: SLDO 02          Short load global BASE2
   0153: STO              Store indirect (TOS into TOS-1)
   0154: SLDO 01          Short load global BASE1
   0155: SLDC 00          Short load constant 0
   0156: EQUI             Integer TOS-1 = TOS
   0157: SLDO 01          Short load global BASE1
   0158: SLDC 02          Short load constant 2
   0159: NGI              Negate integer
   015a: EQUI             Integer TOS-1 = TOS
   015b: LOR              Logical OR (TOS | TOS-1)
   015c: FJP  $0174       Jump if TOS false
   015e: SLDO 04          Short load global BASE4
   015f: SIND 00          Short index load *TOS+0
   0160: SLDC 01          Short load constant 1
   0161: SLDC 00          Short load constant 0
   0162: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0163: SLDO 04          Short load global BASE4
   0164: INC  0004        Inc field ptr (TOS+4)
   0166: SLDC 01          Short load constant 1
   0167: STO              Store indirect (TOS into TOS-1)
   0168: SLDO 01          Short load global BASE1
   0169: SLDC 00          Short load constant 0
   016a: EQUI             Integer TOS-1 = TOS
   016b: FJP  $0172       Jump if TOS false
   016d: SLDO 04          Short load global BASE4
   016e: INC  0003        Inc field ptr (TOS+3)
   0170: SLDC 01          Short load constant 1
   0171: STO              Store indirect (TOS into TOS-1)
-> 0172: UJP  $018a       Unconditional jump
-> 0174: SLDO 01          Short load global BASE1
   0175: SLDC 00          Short load constant 0
   0176: LESI             Integer TOS-1 < TOS
   0177: FJP  $0183       Jump if TOS false
   0179: SLDO 04          Short load global BASE4
   017a: LDCN             Load constant NIL
   017b: STO              Store indirect (TOS into TOS-1)
   017c: SLDO 04          Short load global BASE4
   017d: INC  0004        Inc field ptr (TOS+4)
   017f: SLDC 00          Short load constant 0
   0180: STO              Store indirect (TOS into TOS-1)
   0181: UJP  $018a       Unconditional jump
-> 0183: SLDO 04          Short load global BASE4
   0184: INC  0004        Inc field ptr (TOS+4)
   0186: SLDO 01          Short load global BASE1
   0187: SLDO 01          Short load global BASE1
   0188: ADI              Add integers (TOS + TOS-1)
   0189: STO              Store indirect (TOS into TOS-1)
-> 018a: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FRESET(PARAM1) (* P=4 LL=0 *)
  BASE1=PARAM1
  BASE2
  BASE4
  BASE5
  BASE6
BEGIN
-> 0196: SLDC 01          Short load constant 1
   0197: SLDO 01          Short load global BASE1
   0198: LAO  0002        Load global BASE2
   019a: SLDO 04          Short load global BASE4
   019b: SLDO 05          Short load global BASE5
   019c: SLDO 06          Short load global BASE6
   019d: CXP  06 01       Call external procedure FILEPROC.1
-> 01a0: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FOPEN(PARAM1; PARAM2; PARAM3; PARAM4) (* P=5 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
BEGIN
-> 01ac: SLDC 02          Short load constant 2
   01ad: SLDO 04          Short load global BASE4
   01ae: SLDO 03          Short load global BASE3
   01af: SLDO 02          Short load global BASE2
   01b0: SLDO 01          Short load global BASE1
   01b1: SLDO 05          Short load global BASE5
   01b2: CXP  06 01       Call external procedure FILEPROC.1
-> 01b5: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FCLOSE(PARAM1; PARAM2) (* P=6 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
  BASE5
  BASE6
BEGIN
-> 01c2: SLDC 03          Short load constant 3
   01c3: SLDO 02          Short load global BASE2
   01c4: LAO  0003        Load global BASE3
   01c6: SLDO 05          Short load global BASE5
   01c7: SLDO 06          Short load global BASE6
   01c8: SLDO 01          Short load global BASE1
   01c9: CXP  06 01       Call external procedure FILEPROC.1
-> 01cc: RBP  00          Return from base procedure
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
-> 01d8: LOD  01 0001     Load word at G1 (SYSCOM)
   01db: SLDC 00          Short load constant 0
   01dc: STO              Store indirect (TOS into TOS-1)
   01dd: SLDO 01          Short load global BASE1
   01de: SRO  000c        Store global word BASE12
   01e0: SLDO 0c          Short load global BASE12
   01e1: SIND 05          Short index load *TOS+5
   01e2: FJP  $030b       Jump if TOS false
   01e4: SLDO 0c          Short load global BASE12
   01e5: IND  000e        Static index and load word (TOS+14)
   01e7: SLDC 00          Short load constant 0
   01e8: GRTI             Integer TOS-1 > TOS
   01e9: FJP  $01fd       Jump if TOS false
   01eb: SLDO 0c          Short load global BASE12
   01ec: INC  000e        Inc field ptr (TOS+14)
   01ee: SLDO 0c          Short load global BASE12
   01ef: IND  000e        Static index and load word (TOS+14)
   01f1: SLDC 01          Short load constant 1
   01f2: SBI              Subtract integers (TOS-1 - TOS)
   01f3: STO              Store indirect (TOS into TOS-1)
   01f4: SLDO 0c          Short load global BASE12
   01f5: IND  000e        Static index and load word (TOS+14)
   01f7: SLDC 00          Short load constant 0
   01f8: GRTI             Integer TOS-1 > TOS
   01f9: FJP  $01fd       Jump if TOS false
   01fb: UJP  $031a       Unconditional jump
-> 01fd: SLDO 0c          Short load global BASE12
   01fe: IND  001d        Static index and load word (TOS+29)
   0200: FJP  $020e       Jump if TOS false
   0202: SLDO 01          Short load global BASE1
   0203: SLDC 00          Short load constant 0
   0204: SLDC 00          Short load constant 0
   0205: CXP  02 02       Call external procedure FIOPRIMS.2
   0208: FJP  $020c       Jump if TOS false
   020a: UJP  $0310       Unconditional jump
-> 020c: UJP  $02a2       Unconditional jump
-> 020e: SLDO 0c          Short load global BASE12
   020f: SIND 07          Short index load *TOS+7
   0210: SLDC 01          Short load constant 1
   0211: EQUI             Integer TOS-1 = TOS
   0212: SRO  0009        Store global word BASE9
   0214: SLDO 09          Short load global BASE9
   0215: FJP  $021c       Jump if TOS false
   0217: SLDC 02          Short load constant 2
   0218: SRO  0007        Store global word BASE7
   021a: UJP  $0220       Unconditional jump
-> 021c: SLDO 0c          Short load global BASE12
   021d: SIND 07          Short index load *TOS+7
   021e: SRO  0007        Store global word BASE7
-> 0220: SLDC 01          Short load constant 1
   0221: SRO  000a        Store global word BASE10
   0223: SLDC 20          Short load constant 32
   0224: SRO  000b        Store global word BASE11
   0226: SLDC 00          Short load constant 0
   0227: SRO  0002        Store global word BASE2
-> 0229: SLDO 02          Short load global BASE2
   022a: SLDO 0c          Short load global BASE12
   022b: SIND 04          Short index load *TOS+4
   022c: LESI             Integer TOS-1 < TOS
   022d: SLDO 0a          Short load global BASE10
   022e: LAND             Logical AND (TOS & TOS-1)
   022f: FJP  $02a2       Jump if TOS false
   0231: SLDO 07          Short load global BASE7
   0232: SLDC 06          Short load constant 6
   0233: SLDC 01          Short load constant 1
   0234: INN              Set membership (TOS-1 in set TOS)
   0235: LOD  01 0182     Load word at G386
   0239: LAND             Logical AND (TOS & TOS-1)
   023a: FJP  $023e       Jump if TOS false
   023c: CLP  38          Call local procedure PASCALSY.56
-> 023e: SLDO 07          Short load global BASE7
   023f: SLDC 06          Short load constant 6
   0240: SLDC 01          Short load constant 1
   0241: INN              Set membership (TOS-1 in set TOS)
   0242: LNOT             Logical NOT (~TOS)
   0243: LOD  01 0182     Load word at G386
   0247: LNOT             Logical NOT (~TOS)
   0248: LOR              Logical OR (TOS | TOS-1)
   0249: FJP  $025c       Jump if TOS false
   024b: SLDO 07          Short load global BASE7
   024c: LAO  000b        Load global BASE11
   024e: SLDC 00          Short load constant 0
   024f: SLDC 01          Short load constant 1
   0250: SLDC 00          Short load constant 0
   0251: SLDC 00          Short load constant 0
   0252: CSP  05          Call standard procedure UNITREAD
   0254: CSP  22          Call standard procedure IORESULT
   0256: SLDC 00          Short load constant 0
   0257: NEQI             Integer TOS-1 <> TOS
   0258: FJP  $025c       Jump if TOS false
   025a: UJP  $0310       Unconditional jump
-> 025c: LOD  01 0183     Load word at G387
   0260: FJP  $0265       Jump if TOS false
   0262: SLDO 0b          Short load global BASE11
   0263: CBP  2c          Call base procedure PASCALSY.44
-> 0265: SLDO 09          Short load global BASE9
   0266: FJP  $027e       Jump if TOS false
   0268: SLDO 0b          Short load global BASE11
   0269: LDA  01 0138     Load addr G312
   026d: LDM  10          Load 16 words from (TOS)
   026f: SLDC 10          Short load constant 16
   0270: INN              Set membership (TOS-1 in set TOS)
   0271: LNOT             Logical NOT (~TOS)
   0272: FJP  $027e       Jump if TOS false
   0274: SLDO 0c          Short load global BASE12
   0275: SIND 07          Short index load *TOS+7
   0276: LAO  000b        Load global BASE11
   0278: SLDC 00          Short load constant 0
   0279: SLDC 01          Short load constant 1
   027a: SLDC 00          Short load constant 0
   027b: SLDC 00          Short load constant 0
   027c: CSP  06          Call standard procedure UNITWRITE
-> 027e: SLDO 0b          Short load global BASE11
   027f: LOD  01 0001     Load word at G1 (SYSCOM)
   0282: INC  0029        Inc field ptr (TOS+41)
   0284: SLDC 08          Short load constant 8
   0285: SLDC 00          Short load constant 0
   0286: LDP              Load packed field (TOS)
   0287: EQUI             Integer TOS-1 = TOS
   0288: FJP  $0296       Jump if TOS false
   028a: SLDO 0c          Short load global BASE12
   028b: SIND 07          Short index load *TOS+7
   028c: SLDC 01          Short load constant 1
   028d: EQUI             Integer TOS-1 = TOS
   028e: FJP  $0293       Jump if TOS false
   0290: SLDC 00          Short load constant 0
   0291: SRO  000b        Store global word BASE11
-> 0293: SLDC 00          Short load constant 0
   0294: SRO  000a        Store global word BASE10
-> 0296: SLDO 0c          Short load global BASE12
   0297: SIND 00          Short index load *TOS+0
   0298: SLDO 02          Short load global BASE2
   0299: SLDO 0b          Short load global BASE11
   029a: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   029b: SLDO 02          Short load global BASE2
   029c: SLDC 01          Short load constant 1
   029d: ADI              Add integers (TOS + TOS-1)
   029e: SRO  0002        Store global word BASE2
   02a0: UJP  $0229       Unconditional jump
-> 02a2: SLDO 0c          Short load global BASE12
   02a3: SIND 04          Short index load *TOS+4
   02a4: SLDC 01          Short load constant 1
   02a5: EQUI             Integer TOS-1 = TOS
   02a6: FJP  $0309       Jump if TOS false
   02a8: SLDO 0c          Short load global BASE12
   02a9: INC  0001        Inc field ptr (TOS+1)
   02ab: SLDC 00          Short load constant 0
   02ac: STO              Store indirect (TOS into TOS-1)
   02ad: SLDO 0c          Short load global BASE12
   02ae: SIND 03          Short index load *TOS+3
   02af: SLDC 00          Short load constant 0
   02b0: NEQI             Integer TOS-1 <> TOS
   02b1: FJP  $02b8       Jump if TOS false
   02b3: SLDO 0c          Short load global BASE12
   02b4: INC  0003        Inc field ptr (TOS+3)
   02b6: SLDC 02          Short load constant 2
   02b7: STO              Store indirect (TOS into TOS-1)
-> 02b8: SLDO 0c          Short load global BASE12
   02b9: SIND 00          Short index load *TOS+0
   02ba: SLDC 00          Short load constant 0
   02bb: LDB              Load byte at byte ptr TOS-1 + TOS
   02bc: SLDC 0d          Short load constant 13
   02bd: EQUI             Integer TOS-1 = TOS
   02be: FJP  $02cc       Jump if TOS false
   02c0: SLDO 0c          Short load global BASE12
   02c1: SIND 00          Short index load *TOS+0
   02c2: SLDC 00          Short load constant 0
   02c3: SLDC 20          Short load constant 32
   02c4: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   02c5: SLDO 0c          Short load global BASE12
   02c6: INC  0001        Inc field ptr (TOS+1)
   02c8: SLDC 01          Short load constant 1
   02c9: STO              Store indirect (TOS into TOS-1)
   02ca: UJP  $031a       Unconditional jump
-> 02cc: SLDO 0c          Short load global BASE12
   02cd: SIND 07          Short index load *TOS+7
   02ce: SLDC 02          Short load constant 2
   02cf: GRTI             Integer TOS-1 > TOS
   02d0: FJP  $02e6       Jump if TOS false
   02d2: SLDO 0c          Short load global BASE12
   02d3: SIND 00          Short index load *TOS+0
   02d4: SLDC 00          Short load constant 0
   02d5: LDB              Load byte at byte ptr TOS-1 + TOS
   02d6: SLDC 10          Short load constant 16
   02d7: EQUI             Integer TOS-1 = TOS
   02d8: FJP  $02e6       Jump if TOS false
   02da: SLDO 01          Short load global BASE1
   02db: SLDC 00          Short load constant 0
   02dc: SLDC 00          Short load constant 0
   02dd: CXP  02 03       Call external procedure FIOPRIMS.3
   02e0: FJP  $02e6       Jump if TOS false
   02e2: SLDC 00          Short load constant 0
   02e3: SLDC 07          Short load constant 7
   02e4: CSP  04          Call standard procedure EXIT
-> 02e6: SLDO 0c          Short load global BASE12
   02e7: SIND 00          Short index load *TOS+0
   02e8: SLDC 00          Short load constant 0
   02e9: LDB              Load byte at byte ptr TOS-1 + TOS
   02ea: SLDC 00          Short load constant 0
   02eb: EQUI             Integer TOS-1 = TOS
   02ec: FJP  $0309       Jump if TOS false
   02ee: SLDO 0c          Short load global BASE12
   02ef: IND  001d        Static index and load word (TOS+29)
   02f1: SLDO 0c          Short load global BASE12
   02f2: INC  0012        Inc field ptr (TOS+18)
   02f4: SLDC 04          Short load constant 4
   02f5: SLDC 00          Short load constant 0
   02f6: LDP              Load packed field (TOS)
   02f7: SLDC 03          Short load constant 3
   02f8: EQUI             Integer TOS-1 = TOS
   02f9: LAND             Logical AND (TOS & TOS-1)
   02fa: FJP  $0302       Jump if TOS false
   02fc: SLDO 01          Short load global BASE1
   02fd: CXP  02 04       Call external procedure FIOPRIMS.4
   0300: UJP  $0309       Unconditional jump
-> 0302: SLDO 0c          Short load global BASE12
   0303: SIND 00          Short index load *TOS+0
   0304: SLDC 00          Short load constant 0
   0305: SLDC 20          Short load constant 32
   0306: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0307: UJP  $0310       Unconditional jump
-> 0309: UJP  $031a       Unconditional jump
-> 030b: LOD  01 0001     Load word at G1 (SYSCOM)
   030e: SLDC 0d          Short load constant 13
   030f: STO              Store indirect (TOS into TOS-1)
-> 0310: SLDO 0c          Short load global BASE12
   0311: INC  0002        Inc field ptr (TOS+2)
   0313: SLDC 01          Short load constant 1
   0314: STO              Store indirect (TOS into TOS-1)
   0315: SLDO 0c          Short load global BASE12
   0316: INC  0001        Inc field ptr (TOS+1)
   0318: SLDC 01          Short load constant 1
   0319: STO              Store indirect (TOS into TOS-1)
-> 031a: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FPUT(PARAM1) (* P=8 LL=0 *)
  BASE1=PARAM1
  BASE7
BEGIN
-> 0330: LOD  01 0001     Load word at G1 (SYSCOM)
   0333: SLDC 00          Short load constant 0
   0334: STO              Store indirect (TOS into TOS-1)
   0335: SLDO 01          Short load global BASE1
   0336: SRO  0007        Store global word BASE7
   0338: SLDO 07          Short load global BASE7
   0339: SIND 05          Short index load *TOS+5
   033a: FJP  $0362       Jump if TOS false
   033c: SLDO 07          Short load global BASE7
   033d: IND  001d        Static index and load word (TOS+29)
   033f: FJP  $034d       Jump if TOS false
   0341: SLDO 01          Short load global BASE1
   0342: SLDC 00          Short load constant 0
   0343: SLDC 00          Short load constant 0
   0344: CXP  02 05       Call external procedure FIOPRIMS.5
   0347: FJP  $034b       Jump if TOS false
   0349: UJP  $0367       Unconditional jump
-> 034b: UJP  $0360       Unconditional jump
-> 034d: SLDO 07          Short load global BASE7
   034e: SIND 07          Short index load *TOS+7
   034f: SLDO 07          Short load global BASE7
   0350: SIND 00          Short index load *TOS+0
   0351: SLDC 00          Short load constant 0
   0352: SLDO 07          Short load global BASE7
   0353: SIND 04          Short index load *TOS+4
   0354: SLDC 00          Short load constant 0
   0355: SLDC 00          Short load constant 0
   0356: CSP  06          Call standard procedure UNITWRITE
   0358: CSP  22          Call standard procedure IORESULT
   035a: SLDC 00          Short load constant 0
   035b: NEQI             Integer TOS-1 <> TOS
   035c: FJP  $0360       Jump if TOS false
   035e: UJP  $0367       Unconditional jump
-> 0360: UJP  $0371       Unconditional jump
-> 0362: LOD  01 0001     Load word at G1 (SYSCOM)
   0365: SLDC 0d          Short load constant 13
   0366: STO              Store indirect (TOS into TOS-1)
-> 0367: SLDO 07          Short load global BASE7
   0368: INC  0002        Inc field ptr (TOS+2)
   036a: SLDC 01          Short load constant 1
   036b: STO              Store indirect (TOS into TOS-1)
   036c: SLDO 07          Short load global BASE7
   036d: INC  0001        Inc field ptr (TOS+1)
   036f: SLDC 01          Short load constant 1
   0370: STO              Store indirect (TOS into TOS-1)
-> 0371: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XSEEK (* P=9 LL=0 *)
BEGIN
-> 037e: LOD  01 0001     Load word at G1 (SYSCOM)
   0381: INC  0001        Inc field ptr (TOS+1)
   0383: SLDC 0b          Short load constant 11
   0384: STO              Store indirect (TOS into TOS-1)
   0385: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 0387: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FEOF(PARAM1): RETVAL (* P=10 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
BEGIN
-> 0394: SLDO 03          Short load global BASE3
   0395: SIND 02          Short index load *TOS+2
   0396: SRO  0001        Store global word BASE1
-> 0398: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FEOLN(PARAM1): RETVAL (* P=11 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
BEGIN
-> 03a4: SLDO 03          Short load global BASE3
   03a5: SIND 01          Short index load *TOS+1
   03a6: SRO  0001        Store global word BASE1
-> 03a8: RBP  01          Return from base procedure
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
-> 03b4: SLDO 02          Short load global BASE2
   03b5: SRO  0030        Store global word BASE48
   03b7: LDO  0030        Load global word BASE48
   03b9: SIND 07          Short index load *TOS+7
   03ba: SLDC 01          Short load constant 1
   03bb: EQUI             Integer TOS-1 = TOS
   03bc: FJP  $03c5       Jump if TOS false
   03be: LAO  0007        Load global BASE7
   03c0: SLDC 00          Short load constant 0
   03c1: SLDC 51          Short load constant 81
   03c2: SLDC 50          Short load constant 80
   03c3: CSP  0a          Call standard procedure FLCH
-> 03c5: SLDO 01          Short load global BASE1
   03c6: SLDC 00          Short load constant 0
   03c7: STO              Store indirect (TOS into TOS-1)
   03c8: SLDC 00          Short load constant 0
   03c9: SRO  0005        Store global word BASE5
   03cb: SLDC 00          Short load constant 0
   03cc: SRO  0004        Store global word BASE4
   03ce: LDO  0030        Load global word BASE48
   03d0: SIND 03          Short index load *TOS+3
   03d1: SLDC 01          Short load constant 1
   03d2: EQUI             Integer TOS-1 = TOS
   03d3: FJP  $03d8       Jump if TOS false
   03d5: SLDO 02          Short load global BASE2
   03d6: CBP  07          Call base procedure PASCALSY.FGET
-> 03d8: LDO  0030        Load global word BASE48
   03da: SIND 00          Short index load *TOS+0
   03db: SLDC 00          Short load constant 0
   03dc: LDB              Load byte at byte ptr TOS-1 + TOS
   03dd: SLDC 20          Short load constant 32
   03de: EQUI             Integer TOS-1 = TOS
   03df: LDO  0030        Load global word BASE48
   03e1: SIND 02          Short index load *TOS+2
   03e2: LNOT             Logical NOT (~TOS)
   03e3: LAND             Logical AND (TOS & TOS-1)
   03e4: FJP  $03eb       Jump if TOS false
   03e6: SLDO 02          Short load global BASE2
   03e7: CBP  07          Call base procedure PASCALSY.FGET
   03e9: UJP  $03d8       Unconditional jump
-> 03eb: LDO  0030        Load global word BASE48
   03ed: SIND 02          Short index load *TOS+2
   03ee: FJP  $03f2       Jump if TOS false
   03f0: UJP  $0494       Unconditional jump
-> 03f2: LDO  0030        Load global word BASE48
   03f4: SIND 00          Short index load *TOS+0
   03f5: SLDC 00          Short load constant 0
   03f6: LDB              Load byte at byte ptr TOS-1 + TOS
   03f7: SRO  0003        Store global word BASE3
   03f9: SLDO 03          Short load global BASE3
   03fa: SLDC 2b          Short load constant 43
   03fb: EQUI             Integer TOS-1 = TOS
   03fc: SLDO 03          Short load global BASE3
   03fd: SLDC 2d          Short load constant 45
   03fe: EQUI             Integer TOS-1 = TOS
   03ff: LOR              Logical OR (TOS | TOS-1)
   0400: FJP  $0416       Jump if TOS false
   0402: SLDC 02          Short load constant 2
   0403: SRO  0006        Store global word BASE6
   0405: SLDO 03          Short load global BASE3
   0406: SLDC 2d          Short load constant 45
   0407: EQUI             Integer TOS-1 = TOS
   0408: SRO  0005        Store global word BASE5
   040a: SLDO 02          Short load global BASE2
   040b: CBP  07          Call base procedure PASCALSY.FGET
   040d: LDO  0030        Load global word BASE48
   040f: SIND 00          Short index load *TOS+0
   0410: SLDC 00          Short load constant 0
   0411: LDB              Load byte at byte ptr TOS-1 + TOS
   0412: SRO  0003        Store global word BASE3
   0414: UJP  $0419       Unconditional jump
-> 0416: SLDC 01          Short load constant 1
   0417: SRO  0006        Store global word BASE6
-> 0419: SLDO 03          Short load global BASE3
   041a: LDA  01 007a     Load addr G122
   041d: LDM  04          Load 4 words from (TOS)
   041f: SLDC 04          Short load constant 4
   0420: INN              Set membership (TOS-1 in set TOS)
   0421: FJP  $047c       Jump if TOS false
   0423: SLDC 01          Short load constant 1
   0424: SRO  0004        Store global word BASE4
-> 0426: SLDO 01          Short load global BASE1
   0427: SLDO 01          Short load global BASE1
   0428: SIND 00          Short index load *TOS+0
   0429: SLDC 0a          Short load constant 10
   042a: MPI              Multiply integers (TOS * TOS-1)
   042b: SLDO 03          Short load global BASE3
   042c: ADI              Add integers (TOS + TOS-1)
   042d: SLDC 30          Short load constant 48
   042e: SBI              Subtract integers (TOS-1 - TOS)
   042f: STO              Store indirect (TOS into TOS-1)
   0430: SLDO 02          Short load global BASE2
   0431: CBP  07          Call base procedure PASCALSY.FGET
   0433: LDO  0030        Load global word BASE48
   0435: SIND 00          Short index load *TOS+0
   0436: SLDC 00          Short load constant 0
   0437: LDB              Load byte at byte ptr TOS-1 + TOS
   0438: SRO  0003        Store global word BASE3
   043a: SLDO 06          Short load global BASE6
   043b: SLDC 01          Short load constant 1
   043c: ADI              Add integers (TOS + TOS-1)
   043d: SRO  0006        Store global word BASE6
   043f: LDO  0030        Load global word BASE48
   0441: SIND 07          Short index load *TOS+7
   0442: SLDC 01          Short load constant 1
   0443: EQUI             Integer TOS-1 = TOS
   0444: FJP  $046d       Jump if TOS false
-> 0446: SLDO 03          Short load global BASE3
   0447: LAO  0006        Load global BASE6
   0449: LAO  0007        Load global BASE7
   044b: SLDC 00          Short load constant 0
   044c: SLDC 00          Short load constant 0
   044d: CBP  36          Call base procedure PASCALSY.54
   044f: FJP  $046d       Jump if TOS false
   0451: SLDO 06          Short load global BASE6
   0452: SLDC 01          Short load constant 1
   0453: EQUI             Integer TOS-1 = TOS
   0454: FJP  $045b       Jump if TOS false
   0456: SLDO 01          Short load global BASE1
   0457: SLDC 00          Short load constant 0
   0458: STO              Store indirect (TOS into TOS-1)
   0459: UJP  $0461       Unconditional jump
-> 045b: SLDO 01          Short load global BASE1
   045c: SLDO 01          Short load global BASE1
   045d: SIND 00          Short index load *TOS+0
   045e: SLDC 0a          Short load constant 10
   045f: DVI              Divide integers (TOS-1 / TOS)
   0460: STO              Store indirect (TOS into TOS-1)
-> 0461: SLDO 02          Short load global BASE2
   0462: CBP  07          Call base procedure PASCALSY.FGET
   0464: LDO  0030        Load global word BASE48
   0466: SIND 00          Short index load *TOS+0
   0467: SLDC 00          Short load constant 0
   0468: LDB              Load byte at byte ptr TOS-1 + TOS
   0469: SRO  0003        Store global word BASE3
   046b: UJP  $0446       Unconditional jump
-> 046d: SLDO 03          Short load global BASE3
   046e: LDA  01 007a     Load addr G122
   0471: LDM  04          Load 4 words from (TOS)
   0473: SLDC 04          Short load constant 4
   0474: INN              Set membership (TOS-1 in set TOS)
   0475: LNOT             Logical NOT (~TOS)
   0476: LDO  0030        Load global word BASE48
   0478: SIND 01          Short index load *TOS+1
   0479: LOR              Logical OR (TOS | TOS-1)
   047a: FJP  $0426       Jump if TOS false
-> 047c: SLDO 04          Short load global BASE4
   047d: LDO  0030        Load global word BASE48
   047f: SIND 02          Short index load *TOS+2
   0480: LOR              Logical OR (TOS | TOS-1)
   0481: FJP  $048f       Jump if TOS false
   0483: SLDO 05          Short load global BASE5
   0484: FJP  $048d       Jump if TOS false
   0486: SLDO 01          Short load global BASE1
   0487: SLDO 01          Short load global BASE1
   0488: SIND 00          Short index load *TOS+0
   0489: NGI              Negate integer
   048a: STO              Store indirect (TOS into TOS-1)
   048b: UJP  $048d       Unconditional jump
-> 048d: UJP  $0494       Unconditional jump
-> 048f: LOD  01 0001     Load word at G1 (SYSCOM)
   0492: SLDC 0e          Short load constant 14
   0493: STO              Store indirect (TOS into TOS-1)
-> 0494: RBP  00          Return from base procedure
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
-> 0000: SLDC 01          Short load constant 1
   0001: SRO  0004        Store global word BASE4
   0003: LAO  0008        Load global BASE8
   0005: SLDC 00          Short load constant 0
   0006: SLDC 0a          Short load constant 10
   0007: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0008: SLDC 01          Short load constant 1
   0009: SRO  0007        Store global word BASE7
   000b: SLDO 02          Short load global BASE2
   000c: SLDC 00          Short load constant 0
   000d: LESI             Integer TOS-1 < TOS
   000e: FJP  $0037       Jump if TOS false
   0010: SLDO 02          Short load global BASE2
   0011: LDCI 7fff        Load word 32767
   0014: NGI              Negate integer
   0015: SLDC 01          Short load constant 1
   0016: SBI              Subtract integers (TOS-1 - TOS)
   0017: EQUI             Integer TOS-1 = TOS
   0018: FJP  $002b       Jump if TOS false
   001a: LAO  0008        Load global BASE8
   001c: NOP              No operation
   001d: LSA  06          Load string address: '-32768'
   0025: SAS  0a          String assign (TOS to TOS-1, 10 chars)
   0027: UJP  $0087       Unconditional jump
   0029: UJP  $0037       Unconditional jump
-> 002b: SLDO 02          Short load global BASE2
   002c: ABI              Absolute value of integer (TOS)
   002d: SRO  0002        Store global word BASE2
   002f: LAO  0008        Load global BASE8
   0031: SLDC 01          Short load constant 1
   0032: SLDC 2d          Short load constant 45
   0033: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0034: SLDC 02          Short load constant 2
   0035: SRO  0004        Store global word BASE4
-> 0037: SLDC 04          Short load constant 4
   0038: SRO  0005        Store global word BASE5
   003a: SLDC 00          Short load constant 0
   003b: SRO  000e        Store global word BASE14
-> 003d: SLDO 05          Short load global BASE5
   003e: SLDO 0e          Short load global BASE14
   003f: GEQI             Integer TOS-1 >= TOS
   0040: FJP  $0080       Jump if TOS false
   0042: SLDO 02          Short load global BASE2
   0043: LDA  01 006f     Load addr G111
   0046: SLDO 05          Short load global BASE5
   0047: IXA  0001        Index array (TOS-1 + TOS * 1)
   0049: SIND 00          Short index load *TOS+0
   004a: DVI              Divide integers (TOS-1 / TOS)
   004b: SLDC 30          Short load constant 48
   004c: ADI              Add integers (TOS + TOS-1)
   004d: SRO  0006        Store global word BASE6
   004f: SLDO 06          Short load global BASE6
   0050: SLDC 30          Short load constant 48
   0051: EQUI             Integer TOS-1 = TOS
   0052: SLDO 05          Short load global BASE5
   0053: SLDC 00          Short load constant 0
   0054: GRTI             Integer TOS-1 > TOS
   0055: LAND             Logical AND (TOS & TOS-1)
   0056: SLDO 07          Short load global BASE7
   0057: LAND             Logical AND (TOS & TOS-1)
   0058: FJP  $005c       Jump if TOS false
   005a: UJP  $0079       Unconditional jump
-> 005c: SLDC 00          Short load constant 0
   005d: SRO  0007        Store global word BASE7
   005f: LAO  0008        Load global BASE8
   0061: SLDO 04          Short load global BASE4
   0062: SLDO 06          Short load global BASE6
   0063: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0064: SLDO 04          Short load global BASE4
   0065: SLDC 01          Short load constant 1
   0066: ADI              Add integers (TOS + TOS-1)
   0067: SRO  0004        Store global word BASE4
   0069: SLDO 06          Short load global BASE6
   006a: SLDC 30          Short load constant 48
   006b: NEQI             Integer TOS-1 <> TOS
   006c: FJP  $0079       Jump if TOS false
   006e: SLDO 02          Short load global BASE2
   006f: LDA  01 006f     Load addr G111
   0072: SLDO 05          Short load global BASE5
   0073: IXA  0001        Index array (TOS-1 + TOS * 1)
   0075: SIND 00          Short index load *TOS+0
   0076: MODI             Modulo integers (TOS-1 % TOS)
   0077: SRO  0002        Store global word BASE2
-> 0079: SLDO 05          Short load global BASE5
   007a: SLDC 01          Short load constant 1
   007b: SBI              Subtract integers (TOS-1 - TOS)
   007c: SRO  0005        Store global word BASE5
   007e: UJP  $003d       Unconditional jump
-> 0080: LAO  0008        Load global BASE8
   0082: SLDC 00          Short load constant 0
   0083: SLDO 04          Short load global BASE4
   0084: SLDC 01          Short load constant 1
   0085: SBI              Subtract integers (TOS-1 - TOS)
   0086: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0087: SLDO 01          Short load global BASE1
   0088: LAO  0008        Load global BASE8
   008a: SLDC 00          Short load constant 0
   008b: LDB              Load byte at byte ptr TOS-1 + TOS
   008c: LESI             Integer TOS-1 < TOS
   008d: FJP  $0095       Jump if TOS false
   008f: LAO  0008        Load global BASE8
   0091: SLDC 00          Short load constant 0
   0092: LDB              Load byte at byte ptr TOS-1 + TOS
   0093: SRO  0001        Store global word BASE1
-> 0095: SLDO 03          Short load global BASE3
   0096: LAO  0008        Load global BASE8
   0098: SLDO 01          Short load global BASE1
   0099: CBP  13          Call base procedure PASCALSY.FWRITESTRING
-> 009b: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XREADREAL (* P=14 LL=0 *)
BEGIN
-> 04a8: LOD  01 0001     Load word at G1 (SYSCOM)
   04ab: INC  0001        Inc field ptr (TOS+1)
   04ad: SLDC 0b          Short load constant 11
   04ae: STO              Store indirect (TOS into TOS-1)
   04af: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 04b1: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XWRITEREAL (* P=15 LL=0 *)
BEGIN
-> 04be: LOD  01 0001     Load word at G1 (SYSCOM)
   04c1: INC  0001        Inc field ptr (TOS+1)
   04c3: SLDC 0b          Short load constant 11
   04c4: STO              Store indirect (TOS into TOS-1)
   04c5: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 04c7: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADCHAR(PARAM1; PARAM2) (* P=16 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 04d4: SLDO 02          Short load global BASE2
   04d5: SRO  0003        Store global word BASE3
   04d7: LOD  01 0001     Load word at G1 (SYSCOM)
   04da: SLDC 00          Short load constant 0
   04db: STO              Store indirect (TOS into TOS-1)
   04dc: SLDO 03          Short load global BASE3
   04dd: SIND 03          Short index load *TOS+3
   04de: SLDC 01          Short load constant 1
   04df: EQUI             Integer TOS-1 = TOS
   04e0: FJP  $04e5       Jump if TOS false
   04e2: SLDO 02          Short load global BASE2
   04e3: CBP  07          Call base procedure PASCALSY.FGET
-> 04e5: SLDO 01          Short load global BASE1
   04e6: SLDO 03          Short load global BASE3
   04e7: SIND 00          Short index load *TOS+0
   04e8: SLDC 00          Short load constant 0
   04e9: LDB              Load byte at byte ptr TOS-1 + TOS
   04ea: STO              Store indirect (TOS into TOS-1)
   04eb: SLDO 03          Short load global BASE3
   04ec: SIND 03          Short index load *TOS+3
   04ed: SLDC 00          Short load constant 0
   04ee: EQUI             Integer TOS-1 = TOS
   04ef: FJP  $04f6       Jump if TOS false
   04f1: SLDO 02          Short load global BASE2
   04f2: CBP  07          Call base procedure PASCALSY.FGET
   04f4: UJP  $04fb       Unconditional jump
-> 04f6: SLDO 03          Short load global BASE3
   04f7: INC  0003        Inc field ptr (TOS+3)
   04f9: SLDC 01          Short load constant 1
   04fa: STO              Store indirect (TOS into TOS-1)
-> 04fb: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITECHAR(PARAM1; PARAM2; PARAM3) (* P=17 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 00aa: SLDO 03          Short load global BASE3
   00ab: SRO  0004        Store global word BASE4
   00ad: SLDO 04          Short load global BASE4
   00ae: SIND 05          Short index load *TOS+5
   00af: FJP  $00cf       Jump if TOS false
-> 00b1: SLDO 01          Short load global BASE1
   00b2: SLDC 01          Short load constant 1
   00b3: GRTI             Integer TOS-1 > TOS
   00b4: FJP  $00c5       Jump if TOS false
   00b6: SLDO 04          Short load global BASE4
   00b7: SIND 00          Short index load *TOS+0
   00b8: SLDC 00          Short load constant 0
   00b9: SLDC 20          Short load constant 32
   00ba: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   00bb: SLDO 03          Short load global BASE3
   00bc: CBP  08          Call base procedure PASCALSY.FPUT
   00be: SLDO 01          Short load global BASE1
   00bf: SLDC 01          Short load constant 1
   00c0: SBI              Subtract integers (TOS-1 - TOS)
   00c1: SRO  0001        Store global word BASE1
   00c3: UJP  $00b1       Unconditional jump
-> 00c5: SLDO 04          Short load global BASE4
   00c6: SIND 00          Short index load *TOS+0
   00c7: SLDC 00          Short load constant 0
   00c8: SLDO 02          Short load global BASE2
   00c9: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   00ca: SLDO 03          Short load global BASE3
   00cb: CBP  08          Call base procedure PASCALSY.FPUT
   00cd: UJP  $00d4       Unconditional jump
-> 00cf: LOD  01 0001     Load word at G1 (SYSCOM)
   00d2: SLDC 0d          Short load constant 13
   00d3: STO              Store indirect (TOS into TOS-1)
-> 00d4: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADSTRING(PARAM1; PARAM2; PARAM3) (* P=18 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 00e2: SLDO 03          Short load global BASE3
   00e3: SRO  0006        Store global word BASE6
   00e5: SLDC 01          Short load constant 1
   00e6: SRO  0004        Store global word BASE4
   00e8: SLDO 06          Short load global BASE6
   00e9: SIND 03          Short index load *TOS+3
   00ea: SLDC 01          Short load constant 1
   00eb: EQUI             Integer TOS-1 = TOS
   00ec: FJP  $00f1       Jump if TOS false
   00ee: SLDO 03          Short load global BASE3
   00ef: CBP  07          Call base procedure PASCALSY.FGET
-> 00f1: SLDO 02          Short load global BASE2
   00f2: SLDC 00          Short load constant 0
   00f3: SLDO 01          Short load global BASE1
   00f4: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 00f5: SLDO 04          Short load global BASE4
   00f6: SLDO 01          Short load global BASE1
   00f7: LEQI             Integer TOS-1 <= TOS
   00f8: SLDO 06          Short load global BASE6
   00f9: SIND 01          Short index load *TOS+1
   00fa: SLDO 06          Short load global BASE6
   00fb: SIND 02          Short index load *TOS+2
   00fc: LOR              Logical OR (TOS | TOS-1)
   00fd: LNOT             Logical NOT (~TOS)
   00fe: LAND             Logical AND (TOS & TOS-1)
   00ff: FJP  $0132       Jump if TOS false
   0101: SLDO 06          Short load global BASE6
   0102: SIND 00          Short index load *TOS+0
   0103: SLDC 00          Short load constant 0
   0104: LDB              Load byte at byte ptr TOS-1 + TOS
   0105: SRO  0005        Store global word BASE5
   0107: SLDO 06          Short load global BASE6
   0108: SIND 07          Short index load *TOS+7
   0109: SLDC 01          Short load constant 1
   010a: EQUI             Integer TOS-1 = TOS
   010b: FJP  $0124       Jump if TOS false
   010d: SLDO 05          Short load global BASE5
   010e: LAO  0004        Load global BASE4
   0110: SLDO 02          Short load global BASE2
   0111: SLDC 00          Short load constant 0
   0112: SLDC 00          Short load constant 0
   0113: CBP  36          Call base procedure PASCALSY.54
   0115: FJP  $0119       Jump if TOS false
   0117: UJP  $0122       Unconditional jump
-> 0119: SLDO 02          Short load global BASE2
   011a: SLDO 04          Short load global BASE4
   011b: SLDO 05          Short load global BASE5
   011c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   011d: SLDO 04          Short load global BASE4
   011e: SLDC 01          Short load constant 1
   011f: ADI              Add integers (TOS + TOS-1)
   0120: SRO  0004        Store global word BASE4
-> 0122: UJP  $012d       Unconditional jump
-> 0124: SLDO 02          Short load global BASE2
   0125: SLDO 04          Short load global BASE4
   0126: SLDO 05          Short load global BASE5
   0127: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0128: SLDO 04          Short load global BASE4
   0129: SLDC 01          Short load constant 1
   012a: ADI              Add integers (TOS + TOS-1)
   012b: SRO  0004        Store global word BASE4
-> 012d: SLDO 03          Short load global BASE3
   012e: CBP  07          Call base procedure PASCALSY.FGET
   0130: UJP  $00f5       Unconditional jump
-> 0132: SLDO 02          Short load global BASE2
   0133: SLDC 00          Short load constant 0
   0134: SLDO 04          Short load global BASE4
   0135: SLDC 01          Short load constant 1
   0136: SBI              Subtract integers (TOS-1 - TOS)
   0137: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0138: SLDO 06          Short load global BASE6
   0139: SIND 01          Short index load *TOS+1
   013a: LNOT             Logical NOT (~TOS)
   013b: FJP  $0142       Jump if TOS false
   013d: SLDO 03          Short load global BASE3
   013e: CBP  07          Call base procedure PASCALSY.FGET
   0140: UJP  $0138       Unconditional jump
-> 0142: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITESTRING(PARAM1; PARAM2; PARAM3) (* P=19 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 0508: SLDO 01          Short load global BASE1
   0509: SLDC 00          Short load constant 0
   050a: LEQI             Integer TOS-1 <= TOS
   050b: FJP  $0512       Jump if TOS false
   050d: SLDO 02          Short load global BASE2
   050e: SLDC 00          Short load constant 0
   050f: LDB              Load byte at byte ptr TOS-1 + TOS
   0510: SRO  0001        Store global word BASE1
-> 0512: SLDO 03          Short load global BASE3
   0513: SLDO 02          Short load global BASE2
   0514: SLDC 01          Short load constant 1
   0515: ADI              Add integers (TOS + TOS-1)
   0516: SLDO 01          Short load global BASE1
   0517: SLDO 02          Short load global BASE2
   0518: SLDC 00          Short load constant 0
   0519: LDB              Load byte at byte ptr TOS-1 + TOS
   051a: CBP  14          Call base procedure PASCALSY.FWRITEBYTES
-> 051c: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITEBYTES(PARAM1; PARAM2; PARAM3; PARAM4) (* P=20 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
  BASE6
  BASE7
BEGIN
-> 0152: LOD  01 0001     Load word at G1 (SYSCOM)
   0155: SLDC 00          Short load constant 0
   0156: STO              Store indirect (TOS into TOS-1)
   0157: SLDO 04          Short load global BASE4
   0158: SRO  0007        Store global word BASE7
   015a: SLDO 07          Short load global BASE7
   015b: SIND 05          Short index load *TOS+5
   015c: FJP  $01ae       Jump if TOS false
   015e: SLDO 02          Short load global BASE2
   015f: SLDO 01          Short load global BASE1
   0160: GRTI             Integer TOS-1 > TOS
   0161: FJP  $017f       Jump if TOS false
   0163: SLDO 02          Short load global BASE2
   0164: SLDO 01          Short load global BASE1
   0165: SBI              Subtract integers (TOS-1 - TOS)
   0166: SRO  0006        Store global word BASE6
-> 0168: SLDO 06          Short load global BASE6
   0169: SLDC 00          Short load constant 0
   016a: GRTI             Integer TOS-1 > TOS
   016b: FJP  $017c       Jump if TOS false
   016d: SLDO 07          Short load global BASE7
   016e: SIND 00          Short index load *TOS+0
   016f: SLDC 00          Short load constant 0
   0170: SLDC 20          Short load constant 32
   0171: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0172: SLDO 04          Short load global BASE4
   0173: CBP  08          Call base procedure PASCALSY.FPUT
   0175: SLDO 06          Short load global BASE6
   0176: SLDC 01          Short load constant 1
   0177: SBI              Subtract integers (TOS-1 - TOS)
   0178: SRO  0006        Store global word BASE6
   017a: UJP  $0168       Unconditional jump
-> 017c: SLDO 01          Short load global BASE1
   017d: SRO  0002        Store global word BASE2
-> 017f: SLDO 07          Short load global BASE7
   0180: IND  001d        Static index and load word (TOS+29)
   0182: FJP  $01a3       Jump if TOS false
   0184: SLDC 00          Short load constant 0
   0185: SRO  0005        Store global word BASE5
-> 0187: SLDO 05          Short load global BASE5
   0188: SLDO 02          Short load global BASE2
   0189: LESI             Integer TOS-1 < TOS
   018a: SLDO 07          Short load global BASE7
   018b: SIND 02          Short index load *TOS+2
   018c: LNOT             Logical NOT (~TOS)
   018d: LAND             Logical AND (TOS & TOS-1)
   018e: FJP  $01a1       Jump if TOS false
   0190: SLDO 07          Short load global BASE7
   0191: SIND 00          Short index load *TOS+0
   0192: SLDC 00          Short load constant 0
   0193: SLDO 03          Short load global BASE3
   0194: SLDO 05          Short load global BASE5
   0195: LDB              Load byte at byte ptr TOS-1 + TOS
   0196: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0197: SLDO 04          Short load global BASE4
   0198: CBP  08          Call base procedure PASCALSY.FPUT
   019a: SLDO 05          Short load global BASE5
   019b: SLDC 01          Short load constant 1
   019c: ADI              Add integers (TOS + TOS-1)
   019d: SRO  0005        Store global word BASE5
   019f: UJP  $0187       Unconditional jump
-> 01a1: UJP  $01ac       Unconditional jump
-> 01a3: SLDO 07          Short load global BASE7
   01a4: SIND 07          Short index load *TOS+7
   01a5: SLDO 03          Short load global BASE3
   01a6: SLDC 00          Short load constant 0
   01a7: SLDO 02          Short load global BASE2
   01a8: SLDC 00          Short load constant 0
   01a9: SLDC 00          Short load constant 0
   01aa: CSP  06          Call standard procedure UNITWRITE
-> 01ac: UJP  $01b3       Unconditional jump
-> 01ae: LOD  01 0001     Load word at G1 (SYSCOM)
   01b1: SLDC 0d          Short load constant 13
   01b2: STO              Store indirect (TOS into TOS-1)
-> 01b3: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADLN(PARAM1) (* P=21 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 01c4: SLDO 01          Short load global BASE1
   01c5: SIND 01          Short index load *TOS+1
   01c6: LNOT             Logical NOT (~TOS)
   01c7: FJP  $01ce       Jump if TOS false
   01c9: SLDO 01          Short load global BASE1
   01ca: CBP  07          Call base procedure PASCALSY.FGET
   01cc: UJP  $01c4       Unconditional jump
-> 01ce: SLDO 01          Short load global BASE1
   01cf: SIND 03          Short index load *TOS+3
   01d0: SLDC 00          Short load constant 0
   01d1: EQUI             Integer TOS-1 = TOS
   01d2: FJP  $01d9       Jump if TOS false
   01d4: SLDO 01          Short load global BASE1
   01d5: CBP  07          Call base procedure PASCALSY.FGET
   01d7: UJP  $01e3       Unconditional jump
-> 01d9: SLDO 01          Short load global BASE1
   01da: INC  0003        Inc field ptr (TOS+3)
   01dc: SLDC 01          Short load constant 1
   01dd: STO              Store indirect (TOS into TOS-1)
   01de: SLDO 01          Short load global BASE1
   01df: INC  0001        Inc field ptr (TOS+1)
   01e1: SLDC 00          Short load constant 0
   01e2: STO              Store indirect (TOS into TOS-1)
-> 01e3: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITELN(PARAM1) (* P=22 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 01f2: SLDO 01          Short load global BASE1
   01f3: SIND 00          Short index load *TOS+0
   01f4: SLDC 00          Short load constant 0
   01f5: SLDC 0d          Short load constant 13
   01f6: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   01f7: SLDO 01          Short load global BASE1
   01f8: CBP  08          Call base procedure PASCALSY.FPUT
-> 01fa: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCONCAT(PARAM1; PARAM2; PARAM3) (* P=23 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 0206: SLDO 02          Short load global BASE2
   0207: SLDC 00          Short load constant 0
   0208: LDB              Load byte at byte ptr TOS-1 + TOS
   0209: SLDO 03          Short load global BASE3
   020a: SLDC 00          Short load constant 0
   020b: LDB              Load byte at byte ptr TOS-1 + TOS
   020c: ADI              Add integers (TOS + TOS-1)
   020d: SLDO 01          Short load global BASE1
   020e: LEQI             Integer TOS-1 <= TOS
   020f: FJP  $0228       Jump if TOS false
   0211: SLDO 02          Short load global BASE2
   0212: SLDC 01          Short load constant 1
   0213: SLDO 03          Short load global BASE3
   0214: SLDO 03          Short load global BASE3
   0215: SLDC 00          Short load constant 0
   0216: LDB              Load byte at byte ptr TOS-1 + TOS
   0217: SLDC 01          Short load constant 1
   0218: ADI              Add integers (TOS + TOS-1)
   0219: SLDO 02          Short load global BASE2
   021a: SLDC 00          Short load constant 0
   021b: LDB              Load byte at byte ptr TOS-1 + TOS
   021c: CSP  02          Call standard procedure MOVL
   021e: SLDO 03          Short load global BASE3
   021f: SLDC 00          Short load constant 0
   0220: SLDO 02          Short load global BASE2
   0221: SLDC 00          Short load constant 0
   0222: LDB              Load byte at byte ptr TOS-1 + TOS
   0223: SLDO 03          Short load global BASE3
   0224: SLDC 00          Short load constant 0
   0225: LDB              Load byte at byte ptr TOS-1 + TOS
   0226: ADI              Add integers (TOS + TOS-1)
   0227: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0228: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SINSERT(PARAM1; PARAM2; PARAM3; PARAM4) (* P=24 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
BEGIN
-> 0234: SLDO 01          Short load global BASE1
   0235: SLDC 00          Short load constant 0
   0236: GRTI             Integer TOS-1 > TOS
   0237: SLDO 04          Short load global BASE4
   0238: SLDC 00          Short load constant 0
   0239: LDB              Load byte at byte ptr TOS-1 + TOS
   023a: SLDC 00          Short load constant 0
   023b: GRTI             Integer TOS-1 > TOS
   023c: LAND             Logical AND (TOS & TOS-1)
   023d: SLDO 04          Short load global BASE4
   023e: SLDC 00          Short load constant 0
   023f: LDB              Load byte at byte ptr TOS-1 + TOS
   0240: SLDO 03          Short load global BASE3
   0241: SLDC 00          Short load constant 0
   0242: LDB              Load byte at byte ptr TOS-1 + TOS
   0243: ADI              Add integers (TOS + TOS-1)
   0244: SLDO 02          Short load global BASE2
   0245: LEQI             Integer TOS-1 <= TOS
   0246: LAND             Logical AND (TOS & TOS-1)
   0247: FJP  $027d       Jump if TOS false
   0249: SLDO 03          Short load global BASE3
   024a: SLDC 00          Short load constant 0
   024b: LDB              Load byte at byte ptr TOS-1 + TOS
   024c: SLDO 01          Short load global BASE1
   024d: SBI              Subtract integers (TOS-1 - TOS)
   024e: SLDC 01          Short load constant 1
   024f: ADI              Add integers (TOS + TOS-1)
   0250: SRO  0005        Store global word BASE5
   0252: SLDO 05          Short load global BASE5
   0253: SLDC 00          Short load constant 0
   0254: GRTI             Integer TOS-1 > TOS
   0255: FJP  $0265       Jump if TOS false
   0257: SLDO 03          Short load global BASE3
   0258: SLDO 01          Short load global BASE1
   0259: SLDO 03          Short load global BASE3
   025a: SLDO 01          Short load global BASE1
   025b: SLDO 04          Short load global BASE4
   025c: SLDC 00          Short load constant 0
   025d: LDB              Load byte at byte ptr TOS-1 + TOS
   025e: ADI              Add integers (TOS + TOS-1)
   025f: SLDO 05          Short load global BASE5
   0260: CSP  03          Call standard procedure MOVR
   0262: SLDC 00          Short load constant 0
   0263: SRO  0005        Store global word BASE5
-> 0265: SLDO 05          Short load global BASE5
   0266: SLDC 00          Short load constant 0
   0267: EQUI             Integer TOS-1 = TOS
   0268: FJP  $027d       Jump if TOS false
   026a: SLDO 04          Short load global BASE4
   026b: SLDC 01          Short load constant 1
   026c: SLDO 03          Short load global BASE3
   026d: SLDO 01          Short load global BASE1
   026e: SLDO 04          Short load global BASE4
   026f: SLDC 00          Short load constant 0
   0270: LDB              Load byte at byte ptr TOS-1 + TOS
   0271: CSP  02          Call standard procedure MOVL
   0273: SLDO 03          Short load global BASE3
   0274: SLDC 00          Short load constant 0
   0275: SLDO 03          Short load global BASE3
   0276: SLDC 00          Short load constant 0
   0277: LDB              Load byte at byte ptr TOS-1 + TOS
   0278: SLDO 04          Short load global BASE4
   0279: SLDC 00          Short load constant 0
   027a: LDB              Load byte at byte ptr TOS-1 + TOS
   027b: ADI              Add integers (TOS + TOS-1)
   027c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 027d: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCOPY(PARAM1; PARAM2; PARAM3; PARAM4) (* P=25 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
BEGIN
-> 028a: SLDO 03          Short load global BASE3
   028b: LSA  00          Load string address: ''
   028d: NOP              No operation
   028e: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0290: SLDO 02          Short load global BASE2
   0291: SLDC 00          Short load constant 0
   0292: GRTI             Integer TOS-1 > TOS
   0293: SLDO 01          Short load global BASE1
   0294: SLDC 00          Short load constant 0
   0295: GRTI             Integer TOS-1 > TOS
   0296: LAND             Logical AND (TOS & TOS-1)
   0297: SLDO 02          Short load global BASE2
   0298: SLDO 01          Short load global BASE1
   0299: ADI              Add integers (TOS + TOS-1)
   029a: SLDC 01          Short load constant 1
   029b: SBI              Subtract integers (TOS-1 - TOS)
   029c: SLDO 04          Short load global BASE4
   029d: SLDC 00          Short load constant 0
   029e: LDB              Load byte at byte ptr TOS-1 + TOS
   029f: LEQI             Integer TOS-1 <= TOS
   02a0: LAND             Logical AND (TOS & TOS-1)
   02a1: FJP  $02ae       Jump if TOS false
   02a3: SLDO 04          Short load global BASE4
   02a4: SLDO 02          Short load global BASE2
   02a5: SLDO 03          Short load global BASE3
   02a6: SLDC 01          Short load constant 1
   02a7: SLDO 01          Short load global BASE1
   02a8: CSP  02          Call standard procedure MOVL
   02aa: SLDO 03          Short load global BASE3
   02ab: SLDC 00          Short load constant 0
   02ac: SLDO 01          Short load global BASE1
   02ad: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 02ae: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SDELETE(PARAM1; PARAM2; PARAM3) (* P=26 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 02ba: SLDO 02          Short load global BASE2
   02bb: SLDC 00          Short load constant 0
   02bc: GRTI             Integer TOS-1 > TOS
   02bd: SLDO 01          Short load global BASE1
   02be: SLDC 00          Short load constant 0
   02bf: GRTI             Integer TOS-1 > TOS
   02c0: LAND             Logical AND (TOS & TOS-1)
   02c1: FJP  $02f1       Jump if TOS false
   02c3: SLDO 03          Short load global BASE3
   02c4: SLDC 00          Short load constant 0
   02c5: LDB              Load byte at byte ptr TOS-1 + TOS
   02c6: SLDO 02          Short load global BASE2
   02c7: SBI              Subtract integers (TOS-1 - TOS)
   02c8: SLDO 01          Short load global BASE1
   02c9: SBI              Subtract integers (TOS-1 - TOS)
   02ca: SLDC 01          Short load constant 1
   02cb: ADI              Add integers (TOS + TOS-1)
   02cc: SRO  0004        Store global word BASE4
   02ce: SLDO 04          Short load global BASE4
   02cf: SLDC 00          Short load constant 0
   02d0: EQUI             Integer TOS-1 = TOS
   02d1: FJP  $02db       Jump if TOS false
   02d3: SLDO 03          Short load global BASE3
   02d4: SLDC 00          Short load constant 0
   02d5: SLDO 02          Short load global BASE2
   02d6: SLDC 01          Short load constant 1
   02d7: SBI              Subtract integers (TOS-1 - TOS)
   02d8: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   02d9: UJP  $02f1       Unconditional jump
-> 02db: SLDO 04          Short load global BASE4
   02dc: SLDC 00          Short load constant 0
   02dd: GRTI             Integer TOS-1 > TOS
   02de: FJP  $02f1       Jump if TOS false
   02e0: SLDO 03          Short load global BASE3
   02e1: SLDO 02          Short load global BASE2
   02e2: SLDO 01          Short load global BASE1
   02e3: ADI              Add integers (TOS + TOS-1)
   02e4: SLDO 03          Short load global BASE3
   02e5: SLDO 02          Short load global BASE2
   02e6: SLDO 04          Short load global BASE4
   02e7: CSP  02          Call standard procedure MOVL
   02e9: SLDO 03          Short load global BASE3
   02ea: SLDC 00          Short load constant 0
   02eb: SLDO 03          Short load global BASE3
   02ec: SLDC 00          Short load constant 0
   02ed: LDB              Load byte at byte ptr TOS-1 + TOS
   02ee: SLDO 01          Short load global BASE1
   02ef: SBI              Subtract integers (TOS-1 - TOS)
   02f0: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 02f1: RBP  00          Return from base procedure
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
-> 02fe: SLDC 00          Short load constant 0
   02ff: SRO  0001        Store global word BASE1
   0301: SLDO 04          Short load global BASE4
   0302: SLDC 00          Short load constant 0
   0303: LDB              Load byte at byte ptr TOS-1 + TOS
   0304: SLDC 00          Short load constant 0
   0305: GRTI             Integer TOS-1 > TOS
   0306: FJP  $0359       Jump if TOS false
   0308: SLDO 04          Short load global BASE4
   0309: SLDC 01          Short load constant 1
   030a: LDB              Load byte at byte ptr TOS-1 + TOS
   030b: SRO  0007        Store global word BASE7
   030d: SLDC 01          Short load constant 1
   030e: SRO  0006        Store global word BASE6
   0310: SLDO 03          Short load global BASE3
   0311: SLDC 00          Short load constant 0
   0312: LDB              Load byte at byte ptr TOS-1 + TOS
   0313: SLDO 04          Short load global BASE4
   0314: SLDC 00          Short load constant 0
   0315: LDB              Load byte at byte ptr TOS-1 + TOS
   0316: SBI              Subtract integers (TOS-1 - TOS)
   0317: SLDC 01          Short load constant 1
   0318: ADI              Add integers (TOS + TOS-1)
   0319: SRO  0005        Store global word BASE5
   031b: LAO  0008        Load global BASE8
   031d: SLDC 00          Short load constant 0
   031e: SLDO 04          Short load global BASE4
   031f: SLDC 00          Short load constant 0
   0320: LDB              Load byte at byte ptr TOS-1 + TOS
   0321: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0322: SLDO 06          Short load global BASE6
   0323: SLDO 05          Short load global BASE5
   0324: LEQI             Integer TOS-1 <= TOS
   0325: FJP  $0359       Jump if TOS false
   0327: SLDO 06          Short load global BASE6
   0328: SLDO 05          Short load global BASE5
   0329: SLDO 06          Short load global BASE6
   032a: SBI              Subtract integers (TOS-1 - TOS)
   032b: SLDC 00          Short load constant 0
   032c: SLDO 07          Short load global BASE7
   032d: SLDO 03          Short load global BASE3
   032e: SLDO 06          Short load global BASE6
   032f: SLDC 00          Short load constant 0
   0330: CSP  0b          Call standard procedure SCAN
   0332: ADI              Add integers (TOS + TOS-1)
   0333: SRO  0006        Store global word BASE6
   0335: SLDO 06          Short load global BASE6
   0336: SLDO 05          Short load global BASE5
   0337: GRTI             Integer TOS-1 > TOS
   0338: FJP  $033c       Jump if TOS false
   033a: UJP  $0359       Unconditional jump
-> 033c: SLDO 03          Short load global BASE3
   033d: SLDO 06          Short load global BASE6
   033e: LAO  0008        Load global BASE8
   0340: SLDC 01          Short load constant 1
   0341: SLDO 04          Short load global BASE4
   0342: SLDC 00          Short load constant 0
   0343: LDB              Load byte at byte ptr TOS-1 + TOS
   0344: CSP  02          Call standard procedure MOVL
   0346: LAO  0008        Load global BASE8
   0348: SLDO 04          Short load global BASE4
   0349: EQLSTR           String TOS-1 = TOS
   034b: FJP  $0352       Jump if TOS false
   034d: SLDO 06          Short load global BASE6
   034e: SRO  0001        Store global word BASE1
   0350: UJP  $0359       Unconditional jump
-> 0352: SLDO 06          Short load global BASE6
   0353: SLDC 01          Short load constant 1
   0354: ADI              Add integers (TOS + TOS-1)
   0355: SRO  0006        Store global word BASE6
   0357: UJP  $0322       Unconditional jump
-> 0359: RBP  01          Return from base procedure
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
-> 0368: SLDC 00          Short load constant 0
   0369: SRO  0001        Store global word BASE1
   036b: LOD  01 0001     Load word at G1 (SYSCOM)
   036e: SLDC 00          Short load constant 0
   036f: STO              Store indirect (TOS into TOS-1)
   0370: SLDO 08          Short load global BASE8
   0371: SRO  0009        Store global word BASE9
   0373: SLDO 09          Short load global BASE9
   0374: SIND 05          Short index load *TOS+5
   0375: SLDO 05          Short load global BASE5
   0376: SLDC 00          Short load constant 0
   0377: GEQI             Integer TOS-1 >= TOS
   0378: LAND             Logical AND (TOS & TOS-1)
   0379: FJP  $0451       Jump if TOS false
   037b: SLDO 09          Short load global BASE9
   037c: SIND 06          Short index load *TOS+6
   037d: FJP  $0404       Jump if TOS false
   037f: SLDO 09          Short load global BASE9
   0380: INC  0010        Inc field ptr (TOS+16)
   0382: SRO  000a        Store global word BASE10
   0384: SLDO 04          Short load global BASE4
   0385: SLDC 00          Short load constant 0
   0386: LESI             Integer TOS-1 < TOS
   0387: FJP  $038e       Jump if TOS false
   0389: SLDO 09          Short load global BASE9
   038a: IND  000d        Static index and load word (TOS+13)
   038c: SRO  0004        Store global word BASE4
-> 038e: SLDO 0a          Short load global BASE10
   038f: SIND 00          Short index load *TOS+0
   0390: SLDO 04          Short load global BASE4
   0391: ADI              Add integers (TOS + TOS-1)
   0392: SRO  0004        Store global word BASE4
   0394: SLDO 04          Short load global BASE4
   0395: SLDO 05          Short load global BASE5
   0396: ADI              Add integers (TOS + TOS-1)
   0397: SLDO 0a          Short load global BASE10
   0398: SIND 01          Short index load *TOS+1
   0399: GRTI             Integer TOS-1 > TOS
   039a: FJP  $03a7       Jump if TOS false
   039c: SLDO 03          Short load global BASE3
   039d: LNOT             Logical NOT (~TOS)
   039e: FJP  $03a7       Jump if TOS false
   03a0: SLDO 08          Short load global BASE8
   03a1: SLDC 00          Short load constant 0
   03a2: SLDC 00          Short load constant 0
   03a3: CBP  31          Call base procedure PASCALSY.49
   03a5: FJP  $03a7       Jump if TOS false
-> 03a7: SLDO 04          Short load global BASE4
   03a8: SLDO 05          Short load global BASE5
   03a9: ADI              Add integers (TOS + TOS-1)
   03aa: SLDO 0a          Short load global BASE10
   03ab: SIND 01          Short index load *TOS+1
   03ac: GRTI             Integer TOS-1 > TOS
   03ad: FJP  $03b5       Jump if TOS false
   03af: SLDO 0a          Short load global BASE10
   03b0: SIND 01          Short index load *TOS+1
   03b1: SLDO 04          Short load global BASE4
   03b2: SBI              Subtract integers (TOS-1 - TOS)
   03b3: SRO  0005        Store global word BASE5
-> 03b5: SLDO 09          Short load global BASE9
   03b6: INC  0002        Inc field ptr (TOS+2)
   03b8: SLDO 04          Short load global BASE4
   03b9: SLDO 0a          Short load global BASE10
   03ba: SIND 01          Short index load *TOS+1
   03bb: GEQI             Integer TOS-1 >= TOS
   03bc: STO              Store indirect (TOS into TOS-1)
   03bd: SLDO 09          Short load global BASE9
   03be: SIND 02          Short index load *TOS+2
   03bf: LNOT             Logical NOT (~TOS)
   03c0: FJP  $0402       Jump if TOS false
   03c2: SLDO 09          Short load global BASE9
   03c3: SIND 07          Short index load *TOS+7
   03c4: SLDO 07          Short load global BASE7
   03c5: SLDO 06          Short load global BASE6
   03c6: SLDO 05          Short load global BASE5
   03c7: SLDO 04          Short load global BASE4
   03c8: SLDO 03          Short load global BASE3
   03c9: CLP  37          Call local procedure PASCALSY.55
   03cb: CSP  22          Call standard procedure IORESULT
   03cd: SLDC 00          Short load constant 0
   03ce: EQUI             Integer TOS-1 = TOS
   03cf: FJP  $0402       Jump if TOS false
   03d1: SLDO 03          Short load global BASE3
   03d2: LNOT             Logical NOT (~TOS)
   03d3: FJP  $03da       Jump if TOS false
   03d5: SLDO 09          Short load global BASE9
   03d6: INC  000f        Inc field ptr (TOS+15)
   03d8: SLDC 01          Short load constant 1
   03d9: STO              Store indirect (TOS into TOS-1)
-> 03da: SLDO 05          Short load global BASE5
   03db: SRO  0001        Store global word BASE1
   03dd: SLDO 04          Short load global BASE4
   03de: SLDO 05          Short load global BASE5
   03df: ADI              Add integers (TOS + TOS-1)
   03e0: SRO  0004        Store global word BASE4
   03e2: SLDO 09          Short load global BASE9
   03e3: INC  0002        Inc field ptr (TOS+2)
   03e5: SLDO 04          Short load global BASE4
   03e6: SLDO 0a          Short load global BASE10
   03e7: SIND 01          Short index load *TOS+1
   03e8: EQUI             Integer TOS-1 = TOS
   03e9: STO              Store indirect (TOS into TOS-1)
   03ea: SLDO 09          Short load global BASE9
   03eb: INC  000d        Inc field ptr (TOS+13)
   03ed: SLDO 04          Short load global BASE4
   03ee: SLDO 0a          Short load global BASE10
   03ef: SIND 00          Short index load *TOS+0
   03f0: SBI              Subtract integers (TOS-1 - TOS)
   03f1: STO              Store indirect (TOS into TOS-1)
   03f2: SLDO 09          Short load global BASE9
   03f3: IND  000d        Static index and load word (TOS+13)
   03f5: SLDO 09          Short load global BASE9
   03f6: IND  000c        Static index and load word (TOS+12)
   03f8: GRTI             Integer TOS-1 > TOS
   03f9: FJP  $0402       Jump if TOS false
   03fb: SLDO 09          Short load global BASE9
   03fc: INC  000c        Inc field ptr (TOS+12)
   03fe: SLDO 09          Short load global BASE9
   03ff: IND  000d        Static index and load word (TOS+13)
   0401: STO              Store indirect (TOS into TOS-1)
-> 0402: UJP  $044f       Unconditional jump
-> 0404: SLDO 05          Short load global BASE5
   0405: SRO  0001        Store global word BASE1
   0407: SLDO 09          Short load global BASE9
   0408: SIND 07          Short index load *TOS+7
   0409: SLDO 07          Short load global BASE7
   040a: SLDO 06          Short load global BASE6
   040b: SLDO 05          Short load global BASE5
   040c: SLDO 04          Short load global BASE4
   040d: SLDO 03          Short load global BASE3
   040e: CLP  37          Call local procedure PASCALSY.55
   0410: CSP  22          Call standard procedure IORESULT
   0412: SLDC 00          Short load constant 0
   0413: EQUI             Integer TOS-1 = TOS
   0414: FJP  $044c       Jump if TOS false
   0416: SLDO 03          Short load global BASE3
   0417: FJP  $044a       Jump if TOS false
   0419: SLDO 05          Short load global BASE5
   041a: LDCI 0200        Load word 512
   041d: MPI              Multiply integers (TOS * TOS-1)
   041e: SRO  0004        Store global word BASE4
   0420: SLDO 04          Short load global BASE4
   0421: SLDO 04          Short load global BASE4
   0422: NGI              Negate integer
   0423: SLDC 01          Short load constant 1
   0424: SLDC 00          Short load constant 0
   0425: SLDO 07          Short load global BASE7
   0426: SLDO 06          Short load global BASE6
   0427: SLDO 04          Short load global BASE4
   0428: ADI              Add integers (TOS + TOS-1)
   0429: SLDC 01          Short load constant 1
   042a: SBI              Subtract integers (TOS-1 - TOS)
   042b: SLDC 00          Short load constant 0
   042c: CSP  0b          Call standard procedure SCAN
   042e: ADI              Add integers (TOS + TOS-1)
   042f: SRO  0004        Store global word BASE4
   0431: SLDO 04          Short load global BASE4
   0432: LDCI 0200        Load word 512
   0435: ADI              Add integers (TOS + TOS-1)
   0436: SLDC 01          Short load constant 1
   0437: SBI              Subtract integers (TOS-1 - TOS)
   0438: LDCI 0200        Load word 512
   043b: DVI              Divide integers (TOS-1 / TOS)
   043c: SRO  0004        Store global word BASE4
   043e: SLDO 04          Short load global BASE4
   043f: SRO  0001        Store global word BASE1
   0441: SLDO 09          Short load global BASE9
   0442: INC  0002        Inc field ptr (TOS+2)
   0444: SLDO 04          Short load global BASE4
   0445: SLDO 05          Short load global BASE5
   0446: LESI             Integer TOS-1 < TOS
   0447: STO              Store indirect (TOS into TOS-1)
   0448: UJP  $044a       Unconditional jump
-> 044a: UJP  $044f       Unconditional jump
-> 044c: SLDC 00          Short load constant 0
   044d: SRO  0001        Store global word BASE1
-> 044f: UJP  $0456       Unconditional jump
-> 0451: LOD  01 0001     Load word at G1 (SYSCOM)
   0454: SLDC 0d          Short load constant 13
   0455: STO              Store indirect (TOS into TOS-1)
-> 0456: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.FGOTOXY(PARAM1; PARAM2) (* P=29 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0466: LOD  01 0001     Load word at G1 (SYSCOM)
   0469: INC  0025        Inc field ptr (TOS+37)
   046b: SRO  0003        Store global word BASE3
   046d: SLDO 02          Short load global BASE2
   046e: SLDC 00          Short load constant 0
   046f: LESI             Integer TOS-1 < TOS
   0470: FJP  $0475       Jump if TOS false
   0472: SLDC 00          Short load constant 0
   0473: SRO  0002        Store global word BASE2
-> 0475: SLDO 02          Short load global BASE2
   0476: SLDO 03          Short load global BASE3
   0477: SIND 01          Short index load *TOS+1
   0478: GRTI             Integer TOS-1 > TOS
   0479: FJP  $047f       Jump if TOS false
   047b: SLDO 03          Short load global BASE3
   047c: SIND 01          Short index load *TOS+1
   047d: SRO  0002        Store global word BASE2
-> 047f: SLDO 01          Short load global BASE1
   0480: SLDC 00          Short load constant 0
   0481: LESI             Integer TOS-1 < TOS
   0482: FJP  $0487       Jump if TOS false
   0484: SLDC 00          Short load constant 0
   0485: SRO  0001        Store global word BASE1
-> 0487: SLDO 01          Short load global BASE1
   0488: SLDO 03          Short load global BASE3
   0489: SIND 00          Short index load *TOS+0
   048a: GRTI             Integer TOS-1 > TOS
   048b: FJP  $0491       Jump if TOS false
   048d: SLDO 03          Short load global BASE3
   048e: SIND 00          Short index load *TOS+0
   048f: SRO  0001        Store global word BASE1
-> 0491: LOD  01 0003     Load word at G3 (OUTPUT)
   0494: SLDC 1e          Short load constant 30
   0495: SLDC 00          Short load constant 0
   0496: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0499: LOD  01 0003     Load word at G3 (OUTPUT)
   049c: SLDO 02          Short load global BASE2
   049d: SLDC 20          Short load constant 32
   049e: ADI              Add integers (TOS + TOS-1)
   049f: SLDC 00          Short load constant 0
   04a0: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   04a3: LOD  01 0003     Load word at G3 (OUTPUT)
   04a6: SLDO 01          Short load global BASE1
   04a7: SLDC 20          Short load constant 32
   04a8: ADI              Add integers (TOS + TOS-1)
   04a9: SLDC 00          Short load constant 0
   04aa: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 04ad: RBP  00          Return from base procedure
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
-> 04ba: SLDC 00          Short load constant 0
   04bb: SRO  0001        Store global word BASE1
   04bd: SLDO 03          Short load global BASE3
   04be: LDCN             Load constant NIL
   04bf: STO              Store indirect (TOS into TOS-1)
   04c0: SLDC 00          Short load constant 0
   04c1: SRO  0008        Store global word BASE8
   04c3: SLDC 00          Short load constant 0
   04c4: SRO  0007        Store global word BASE7
   04c6: SLDO 05          Short load global BASE5
   04c7: SLDC 00          Short load constant 0
   04c8: LDB              Load byte at byte ptr TOS-1 + TOS
   04c9: SLDC 00          Short load constant 0
   04ca: GRTI             Integer TOS-1 > TOS
   04cb: FJP  $0544       Jump if TOS false
   04cd: SLDO 05          Short load global BASE5
   04ce: SLDC 01          Short load constant 1
   04cf: LDB              Load byte at byte ptr TOS-1 + TOS
   04d0: SLDC 23          Short load constant 35
   04d1: EQUI             Integer TOS-1 = TOS
   04d2: SLDO 05          Short load global BASE5
   04d3: SLDC 00          Short load constant 0
   04d4: LDB              Load byte at byte ptr TOS-1 + TOS
   04d5: SLDC 01          Short load constant 1
   04d6: GRTI             Integer TOS-1 > TOS
   04d7: LAND             Logical AND (TOS & TOS-1)
   04d8: FJP  $051f       Jump if TOS false
   04da: SLDC 01          Short load constant 1
   04db: SRO  0008        Store global word BASE8
   04dd: SLDC 00          Short load constant 0
   04de: SRO  0006        Store global word BASE6
   04e0: SLDC 02          Short load constant 2
   04e1: SRO  000a        Store global word BASE10
-> 04e3: SLDO 05          Short load global BASE5
   04e4: SLDO 0a          Short load global BASE10
   04e5: LDB              Load byte at byte ptr TOS-1 + TOS
   04e6: LDA  01 007a     Load addr G122
   04e9: LDM  04          Load 4 words from (TOS)
   04eb: SLDC 04          Short load constant 4
   04ec: INN              Set membership (TOS-1 in set TOS)
   04ed: FJP  $04fc       Jump if TOS false
   04ef: SLDO 06          Short load global BASE6
   04f0: SLDC 0a          Short load constant 10
   04f1: MPI              Multiply integers (TOS * TOS-1)
   04f2: SLDO 05          Short load global BASE5
   04f3: SLDO 0a          Short load global BASE10
   04f4: LDB              Load byte at byte ptr TOS-1 + TOS
   04f5: ADI              Add integers (TOS + TOS-1)
   04f6: SLDC 30          Short load constant 48
   04f7: SBI              Subtract integers (TOS-1 - TOS)
   04f8: SRO  0006        Store global word BASE6
   04fa: UJP  $04ff       Unconditional jump
-> 04fc: SLDC 00          Short load constant 0
   04fd: SRO  0008        Store global word BASE8
-> 04ff: SLDO 0a          Short load global BASE10
   0500: SLDC 01          Short load constant 1
   0501: ADI              Add integers (TOS + TOS-1)
   0502: SRO  000a        Store global word BASE10
   0504: SLDO 0a          Short load global BASE10
   0505: SLDO 05          Short load global BASE5
   0506: SLDC 00          Short load constant 0
   0507: LDB              Load byte at byte ptr TOS-1 + TOS
   0508: GRTI             Integer TOS-1 > TOS
   0509: SLDO 08          Short load global BASE8
   050a: LNOT             Logical NOT (~TOS)
   050b: LOR              Logical OR (TOS | TOS-1)
   050c: FJP  $04e3       Jump if TOS false
   050e: SLDO 08          Short load global BASE8
   050f: SLDO 06          Short load global BASE6
   0510: SLDC 00          Short load constant 0
   0511: GRTI             Integer TOS-1 > TOS
   0512: LAND             Logical AND (TOS & TOS-1)
   0513: SLDO 06          Short load global BASE6
   0514: SLDC 14          Short load constant 20
   0515: LEQI             Integer TOS-1 <= TOS
   0516: LAND             Logical AND (TOS & TOS-1)
   0517: SRO  0007        Store global word BASE7
   0519: SLDO 04          Short load global BASE4
   051a: SLDO 07          Short load global BASE7
   051b: LNOT             Logical NOT (~TOS)
   051c: LAND             Logical AND (TOS & TOS-1)
   051d: SRO  0004        Store global word BASE4
-> 051f: SLDO 07          Short load global BASE7
   0520: LNOT             Logical NOT (~TOS)
   0521: FJP  $0544       Jump if TOS false
   0523: SLDC 00          Short load constant 0
   0524: SRO  0008        Store global word BASE8
   0526: SLDC 14          Short load constant 20
   0527: SRO  0006        Store global word BASE6
-> 0529: SLDO 05          Short load global BASE5
   052a: LDA  01 007e     Load addr G126
   052d: SLDO 06          Short load global BASE6
   052e: IXA  0006        Index array (TOS-1 + TOS * 6)
   0530: EQLSTR           String TOS-1 = TOS
   0532: SRO  0008        Store global word BASE8
   0534: SLDO 08          Short load global BASE8
   0535: LNOT             Logical NOT (~TOS)
   0536: FJP  $053d       Jump if TOS false
   0538: SLDO 06          Short load global BASE6
   0539: SLDC 01          Short load constant 1
   053a: SBI              Subtract integers (TOS-1 - TOS)
   053b: SRO  0006        Store global word BASE6
-> 053d: SLDO 08          Short load global BASE8
   053e: SLDO 06          Short load global BASE6
   053f: SLDC 00          Short load constant 0
   0540: EQUI             Integer TOS-1 = TOS
   0541: LOR              Logical OR (TOS | TOS-1)
   0542: FJP  $0529       Jump if TOS false
-> 0544: SLDO 08          Short load global BASE8
   0545: FJP  $05a7       Jump if TOS false
   0547: LDA  01 007e     Load addr G126
   054a: SLDO 06          Short load global BASE6
   054b: IXA  0006        Index array (TOS-1 + TOS * 6)
   054d: SIND 04          Short index load *TOS+4
   054e: FJP  $05a7       Jump if TOS false
   0550: LOD  01 0001     Load word at G1 (SYSCOM)
   0553: SRO  000b        Store global word BASE11
   0555: SLDC 00          Short load constant 0
   0556: SRO  0008        Store global word BASE8
   0558: SLDO 0b          Short load global BASE11
   0559: SIND 04          Short index load *TOS+4
   055a: LDCN             Load constant NIL
   055b: NEQI             Integer TOS-1 <> TOS
   055c: FJP  $057f       Jump if TOS false
   055e: SLDO 05          Short load global BASE5
   055f: SLDO 0b          Short load global BASE11
   0560: SIND 04          Short index load *TOS+4
   0561: SLDC 00          Short load constant 0
   0562: IXA  000d        Index array (TOS-1 + TOS * 13)
   0564: INC  0003        Inc field ptr (TOS+3)
   0566: EQLSTR           String TOS-1 = TOS
   0568: FJP  $057f       Jump if TOS false
   056a: LAO  000a        Load global BASE10
   056c: LAO  0009        Load global BASE9
   056e: CSP  09          Call standard procedure TIME
   0570: SLDO 09          Short load global BASE9
   0571: SLDO 0b          Short load global BASE11
   0572: SIND 04          Short index load *TOS+4
   0573: SLDC 00          Short load constant 0
   0574: IXA  000d        Index array (TOS-1 + TOS * 13)
   0576: IND  0009        Static index and load word (TOS+9)
   0578: SBI              Subtract integers (TOS-1 - TOS)
   0579: LDCI 012c        Load word 300
   057c: LEQI             Integer TOS-1 <= TOS
   057d: SRO  0008        Store global word BASE8
-> 057f: SLDO 08          Short load global BASE8
   0580: LNOT             Logical NOT (~TOS)
   0581: FJP  $05a7       Jump if TOS false
   0583: SLDO 07          Short load global BASE7
   0584: SRO  0008        Store global word BASE8
   0586: SLDO 06          Short load global BASE6
   0587: SLDC 00          Short load constant 0
   0588: SLDC 00          Short load constant 0
   0589: CBP  2a          Call base procedure PASCALSY.42
   058b: FJP  $05a1       Jump if TOS false
   058d: SLDO 07          Short load global BASE7
   058e: LNOT             Logical NOT (~TOS)
   058f: FJP  $059f       Jump if TOS false
   0591: SLDO 05          Short load global BASE5
   0592: SLDO 0b          Short load global BASE11
   0593: SIND 04          Short index load *TOS+4
   0594: SLDC 00          Short load constant 0
   0595: IXA  000d        Index array (TOS-1 + TOS * 13)
   0597: INC  0003        Inc field ptr (TOS+3)
   0599: EQLSTR           String TOS-1 = TOS
   059b: SRO  0008        Store global word BASE8
   059d: UJP  $059f       Unconditional jump
-> 059f: UJP  $05a7       Unconditional jump
-> 05a1: CSP  22          Call standard procedure IORESULT
   05a3: SLDC 00          Short load constant 0
   05a4: EQUI             Integer TOS-1 = TOS
   05a5: SRO  0008        Store global word BASE8
-> 05a7: SLDO 08          Short load global BASE8
   05a8: LNOT             Logical NOT (~TOS)
   05a9: SLDO 04          Short load global BASE4
   05aa: LAND             Logical AND (TOS & TOS-1)
   05ab: FJP  $05d9       Jump if TOS false
   05ad: SLDC 14          Short load constant 20
   05ae: SRO  0006        Store global word BASE6
-> 05b0: LDA  01 007e     Load addr G126
   05b3: SLDO 06          Short load global BASE6
   05b4: IXA  0006        Index array (TOS-1 + TOS * 6)
   05b6: SRO  000b        Store global word BASE11
   05b8: SLDO 0b          Short load global BASE11
   05b9: SIND 04          Short index load *TOS+4
   05ba: FJP  $05c9       Jump if TOS false
   05bc: SLDO 06          Short load global BASE6
   05bd: SLDC 00          Short load constant 0
   05be: SLDC 00          Short load constant 0
   05bf: CBP  2a          Call base procedure PASCALSY.42
   05c1: FJP  $05c9       Jump if TOS false
   05c3: SLDO 05          Short load global BASE5
   05c4: SLDO 0b          Short load global BASE11
   05c5: EQLSTR           String TOS-1 = TOS
   05c7: SRO  0008        Store global word BASE8
-> 05c9: SLDO 08          Short load global BASE8
   05ca: LNOT             Logical NOT (~TOS)
   05cb: FJP  $05d2       Jump if TOS false
   05cd: SLDO 06          Short load global BASE6
   05ce: SLDC 01          Short load constant 1
   05cf: SBI              Subtract integers (TOS-1 - TOS)
   05d0: SRO  0006        Store global word BASE6
-> 05d2: SLDO 08          Short load global BASE8
   05d3: SLDO 06          Short load global BASE6
   05d4: SLDC 00          Short load constant 0
   05d5: EQUI             Integer TOS-1 = TOS
   05d6: LOR              Logical OR (TOS | TOS-1)
   05d7: FJP  $05b0       Jump if TOS false
-> 05d9: SLDO 08          Short load global BASE8
   05da: FJP  $060e       Jump if TOS false
   05dc: LDA  01 007e     Load addr G126
   05df: SLDO 06          Short load global BASE6
   05e0: IXA  0006        Index array (TOS-1 + TOS * 6)
   05e2: SRO  000b        Store global word BASE11
   05e4: SLDO 06          Short load global BASE6
   05e5: SRO  0001        Store global word BASE1
   05e7: SLDO 0b          Short load global BASE11
   05e8: SLDC 00          Short load constant 0
   05e9: LDB              Load byte at byte ptr TOS-1 + TOS
   05ea: SLDC 00          Short load constant 0
   05eb: GRTI             Integer TOS-1 > TOS
   05ec: FJP  $05f2       Jump if TOS false
   05ee: SLDO 05          Short load global BASE5
   05ef: SLDO 0b          Short load global BASE11
   05f0: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 05f2: SLDO 0b          Short load global BASE11
   05f3: SIND 04          Short index load *TOS+4
   05f4: LOD  01 0001     Load word at G1 (SYSCOM)
   05f7: SIND 04          Short index load *TOS+4
   05f8: LDCN             Load constant NIL
   05f9: NEQI             Integer TOS-1 <> TOS
   05fa: LAND             Logical AND (TOS & TOS-1)
   05fb: FJP  $060e       Jump if TOS false
   05fd: SLDO 03          Short load global BASE3
   05fe: LOD  01 0001     Load word at G1 (SYSCOM)
   0601: SIND 04          Short index load *TOS+4
   0602: STO              Store indirect (TOS into TOS-1)
   0603: LAO  000a        Load global BASE10
   0605: SLDO 03          Short load global BASE3
   0606: SIND 00          Short index load *TOS+0
   0607: SLDC 00          Short load constant 0
   0608: IXA  000d        Index array (TOS-1 + TOS * 13)
   060a: INC  0009        Inc field ptr (TOS+9)
   060c: CSP  09          Call standard procedure TIME
-> 060e: RBP  01          Return from base procedure
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
-> 0620: LDA  01 007e     Load addr G126
   0623: SLDO 02          Short load global BASE2
   0624: IXA  0006        Index array (TOS-1 + TOS * 6)
   0626: SRO  0013        Store global word BASE19
   0628: SLDO 01          Short load global BASE1
   0629: SLDC 00          Short load constant 0
   062a: IXA  000d        Index array (TOS-1 + TOS * 13)
   062c: SRO  0014        Store global word BASE20
   062e: LDO  0013        Load global word BASE19
   0630: LDO  0014        Load global word BASE20
   0632: INC  0003        Inc field ptr (TOS+3)
   0634: EQLSTR           String TOS-1 = TOS
   0636: LDO  0014        Load global word BASE20
   0638: INC  0002        Inc field ptr (TOS+2)
   063a: SLDC 04          Short load constant 4
   063b: SLDC 00          Short load constant 0
   063c: LDP              Load packed field (TOS)
   063d: SLDC 00          Short load constant 0
   063e: EQUI             Integer TOS-1 = TOS
   063f: LDO  0014        Load global word BASE20
   0641: INC  0002        Inc field ptr (TOS+2)
   0643: SLDC 04          Short load constant 4
   0644: SLDC 00          Short load constant 0
   0645: LDP              Load packed field (TOS)
   0646: SLDC 08          Short load constant 8
   0647: EQUI             Integer TOS-1 = TOS
   0648: LOR              Logical OR (TOS | TOS-1)
   0649: LAND             Logical AND (TOS & TOS-1)
   064a: SRO  0005        Store global word BASE5
   064c: SLDO 05          Short load global BASE5
   064d: FJP  $06cd       Jump if TOS false
   064f: LAO  0004        Load global BASE4
   0651: LAO  0003        Load global BASE3
   0653: CSP  09          Call standard procedure TIME
   0655: SLDO 03          Short load global BASE3
   0656: LDO  0014        Load global word BASE20
   0658: IND  0009        Static index and load word (TOS+9)
   065a: SBI              Subtract integers (TOS-1 - TOS)
   065b: LDCI 012c        Load word 300
   065e: LEQI             Integer TOS-1 <= TOS
   065f: SLDO 03          Short load global BASE3
   0660: LDO  0014        Load global word BASE20
   0662: IND  0009        Static index and load word (TOS+9)
   0664: SBI              Subtract integers (TOS-1 - TOS)
   0665: SLDC 00          Short load constant 0
   0666: GEQI             Integer TOS-1 >= TOS
   0667: LAND             Logical AND (TOS & TOS-1)
   0668: LOD  01 0001     Load word at G1 (SYSCOM)
   066b: INC  001d        Inc field ptr (TOS+29)
   066d: SLDC 01          Short load constant 1
   066e: SLDC 00          Short load constant 0
   066f: LDP              Load packed field (TOS)
   0670: LAND             Logical AND (TOS & TOS-1)
   0671: SRO  0005        Store global word BASE5
   0673: SLDO 05          Short load global BASE5
   0674: LNOT             Logical NOT (~TOS)
   0675: FJP  $0690       Jump if TOS false
   0677: SLDO 02          Short load global BASE2
   0678: LAO  0006        Load global BASE6
   067a: SLDC 00          Short load constant 0
   067b: SLDC 1a          Short load constant 26
   067c: SLDC 02          Short load constant 2
   067d: SLDC 00          Short load constant 0
   067e: CSP  05          Call standard procedure UNITREAD
   0680: CSP  22          Call standard procedure IORESULT
   0682: SLDC 00          Short load constant 0
   0683: EQUI             Integer TOS-1 = TOS
   0684: FJP  $0690       Jump if TOS false
   0686: LDO  0014        Load global word BASE20
   0688: INC  0003        Inc field ptr (TOS+3)
   068a: LAO  0009        Load global BASE9
   068c: EQLSTR           String TOS-1 = TOS
   068e: SRO  0005        Store global word BASE5
-> 0690: SLDO 05          Short load global BASE5
   0691: FJP  $06cd       Jump if TOS false
   0693: LDO  0014        Load global word BASE20
   0695: SLDC 00          Short load constant 0
   0696: STO              Store indirect (TOS into TOS-1)
   0697: SLDO 02          Short load global BASE2
   0698: SLDO 01          Short load global BASE1
   0699: SLDC 00          Short load constant 0
   069a: LDO  0014        Load global word BASE20
   069c: IND  0008        Static index and load word (TOS+8)
   069e: SLDC 01          Short load constant 1
   069f: ADI              Add integers (TOS + TOS-1)
   06a0: SLDC 1a          Short load constant 26
   06a1: MPI              Multiply integers (TOS * TOS-1)
   06a2: SLDC 02          Short load constant 2
   06a3: SLDC 00          Short load constant 0
   06a4: CSP  06          Call standard procedure UNITWRITE
   06a6: CSP  22          Call standard procedure IORESULT
   06a8: SLDC 00          Short load constant 0
   06a9: EQUI             Integer TOS-1 = TOS
   06aa: SRO  0005        Store global word BASE5
   06ac: LDO  0014        Load global word BASE20
   06ae: SIND 01          Short index load *TOS+1
   06af: SLDC 0a          Short load constant 10
   06b0: EQUI             Integer TOS-1 = TOS
   06b1: FJP  $06c2       Jump if TOS false
   06b3: SLDO 02          Short load global BASE2
   06b4: SLDO 01          Short load global BASE1
   06b5: SLDC 00          Short load constant 0
   06b6: LDO  0014        Load global word BASE20
   06b8: IND  0008        Static index and load word (TOS+8)
   06ba: SLDC 01          Short load constant 1
   06bb: ADI              Add integers (TOS + TOS-1)
   06bc: SLDC 1a          Short load constant 26
   06bd: MPI              Multiply integers (TOS * TOS-1)
   06be: SLDC 06          Short load constant 6
   06bf: SLDC 00          Short load constant 0
   06c0: CSP  06          Call standard procedure UNITWRITE
-> 06c2: SLDO 05          Short load global BASE5
   06c3: FJP  $06cd       Jump if TOS false
   06c5: LAO  0004        Load global BASE4
   06c7: LDO  0014        Load global word BASE20
   06c9: INC  0009        Inc field ptr (TOS+9)
   06cb: CSP  09          Call standard procedure TIME
-> 06cd: SLDO 05          Short load global BASE5
   06ce: LNOT             Logical NOT (~TOS)
   06cf: FJP  $06e0       Jump if TOS false
   06d1: LDO  0013        Load global word BASE19
   06d3: LSA  00          Load string address: ''
   06d5: NOP              No operation
   06d6: SAS  07          String assign (TOS to TOS-1, 7 chars)
   06d8: LDO  0013        Load global word BASE19
   06da: INC  0005        Inc field ptr (TOS+5)
   06dc: LDCI 7fff        Load word 32767
   06df: STO              Store indirect (TOS into TOS-1)
-> 06e0: RBP  00          Return from base procedure
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
-> 06ec: SLDC 00          Short load constant 0
   06ed: SRO  0001        Store global word BASE1
   06ef: SLDC 00          Short load constant 0
   06f0: SRO  0007        Store global word BASE7
   06f2: SLDC 01          Short load constant 1
   06f3: SRO  0006        Store global word BASE6
-> 06f5: SLDO 06          Short load global BASE6
   06f6: SLDO 03          Short load global BASE3
   06f7: SLDC 00          Short load constant 0
   06f8: IXA  000d        Index array (TOS-1 + TOS * 13)
   06fa: IND  0008        Static index and load word (TOS+8)
   06fc: LEQI             Integer TOS-1 <= TOS
   06fd: SLDO 07          Short load global BASE7
   06fe: LNOT             Logical NOT (~TOS)
   06ff: LAND             Logical AND (TOS & TOS-1)
   0700: FJP  $072a       Jump if TOS false
   0702: SLDO 03          Short load global BASE3
   0703: SLDO 06          Short load global BASE6
   0704: IXA  000d        Index array (TOS-1 + TOS * 13)
   0706: SRO  0008        Store global word BASE8
   0708: SLDO 08          Short load global BASE8
   0709: INC  0003        Inc field ptr (TOS+3)
   070b: SLDO 05          Short load global BASE5
   070c: EQLSTR           String TOS-1 = TOS
   070e: FJP  $0723       Jump if TOS false
   0710: SLDO 04          Short load global BASE4
   0711: SLDO 08          Short load global BASE8
   0712: INC  000c        Inc field ptr (TOS+12)
   0714: SLDC 07          Short load constant 7
   0715: SLDC 09          Short load constant 9
   0716: LDP              Load packed field (TOS)
   0717: SLDC 64          Short load constant 100
   0718: NEQI             Integer TOS-1 <> TOS
   0719: EQLBOOL          Boolean TOS-1 = TOS
   071b: FJP  $0723       Jump if TOS false
   071d: SLDO 06          Short load global BASE6
   071e: SRO  0001        Store global word BASE1
   0720: SLDC 01          Short load constant 1
   0721: SRO  0007        Store global word BASE7
-> 0723: SLDO 06          Short load global BASE6
   0724: SLDC 01          Short load constant 1
   0725: ADI              Add integers (TOS + TOS-1)
   0726: SRO  0006        Store global word BASE6
   0728: UJP  $06f5       Unconditional jump
-> 072a: RBP  01          Return from base procedure
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
-> 0738: LAO  0008        Load global BASE8
   073a: SLDO 07          Short load global BASE7
   073b: SAS  50          String assign (TOS to TOS-1, 80 chars)
   073d: SLDO 06          Short load global BASE6
   073e: NOP              No operation
   073f: LSA  00          Load string address: ''
   0741: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0743: SLDO 05          Short load global BASE5
   0744: NOP              No operation
   0745: LSA  00          Load string address: ''
   0747: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0749: SLDO 04          Short load global BASE4
   074a: SLDC 00          Short load constant 0
   074b: STO              Store indirect (TOS into TOS-1)
   074c: SLDO 03          Short load global BASE3
   074d: SLDC 00          Short load constant 0
   074e: STO              Store indirect (TOS into TOS-1)
   074f: SLDC 00          Short load constant 0
   0750: SRO  0001        Store global word BASE1
   0752: SLDC 01          Short load constant 1
   0753: SRO  0032        Store global word BASE50
-> 0755: LDO  0032        Load global word BASE50
   0757: LAO  0008        Load global BASE8
   0759: SLDC 00          Short load constant 0
   075a: LDB              Load byte at byte ptr TOS-1 + TOS
   075b: LEQI             Integer TOS-1 <= TOS
   075c: FJP  $0793       Jump if TOS false
   075e: LAO  0008        Load global BASE8
   0760: LDO  0032        Load global word BASE50
   0762: LDB              Load byte at byte ptr TOS-1 + TOS
   0763: SRO  0033        Store global word BASE51
   0765: LDO  0033        Load global word BASE51
   0767: SLDC 20          Short load constant 32
   0768: LEQI             Integer TOS-1 <= TOS
   0769: FJP  $0775       Jump if TOS false
   076b: LAO  0008        Load global BASE8
   076d: LDO  0032        Load global word BASE50
   076f: SLDC 01          Short load constant 1
   0770: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0773: UJP  $0791       Unconditional jump
-> 0775: LDO  0033        Load global word BASE51
   0777: SLDC 61          Short load constant 97
   0778: GEQI             Integer TOS-1 >= TOS
   0779: LDO  0033        Load global word BASE51
   077b: SLDC 7a          Short load constant 122
   077c: LEQI             Integer TOS-1 <= TOS
   077d: LAND             Logical AND (TOS & TOS-1)
   077e: FJP  $078b       Jump if TOS false
   0780: LAO  0008        Load global BASE8
   0782: LDO  0032        Load global word BASE50
   0784: LDO  0033        Load global word BASE51
   0786: SLDC 61          Short load constant 97
   0787: SBI              Subtract integers (TOS-1 - TOS)
   0788: SLDC 41          Short load constant 65
   0789: ADI              Add integers (TOS + TOS-1)
   078a: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 078b: LDO  0032        Load global word BASE50
   078d: SLDC 01          Short load constant 1
   078e: ADI              Add integers (TOS + TOS-1)
   078f: SRO  0032        Store global word BASE50
-> 0791: UJP  $0755       Unconditional jump
-> 0793: LAO  0008        Load global BASE8
   0795: SLDC 00          Short load constant 0
   0796: LDB              Load byte at byte ptr TOS-1 + TOS
   0797: SLDC 00          Short load constant 0
   0798: GRTI             Integer TOS-1 > TOS
   0799: FJP  $0977       Jump if TOS false
   079b: LAO  0008        Load global BASE8
   079d: SLDC 01          Short load constant 1
   079e: LDB              Load byte at byte ptr TOS-1 + TOS
   079f: SLDC 2a          Short load constant 42
   07a0: EQUI             Integer TOS-1 = TOS
   07a1: FJP  $07b2       Jump if TOS false
   07a3: SLDO 06          Short load global BASE6
   07a4: LDA  01 003f     Load addr G63
   07a7: SAS  07          String assign (TOS to TOS-1, 7 chars)
   07a9: LAO  0008        Load global BASE8
   07ab: SLDC 01          Short load constant 1
   07ac: SLDC 01          Short load constant 1
   07ad: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   07b0: UJP  $07c8       Unconditional jump
-> 07b2: LAO  0008        Load global BASE8
   07b4: SLDC 01          Short load constant 1
   07b5: LDB              Load byte at byte ptr TOS-1 + TOS
   07b6: SLDC 25          Short load constant 37
   07b7: EQUI             Integer TOS-1 = TOS
   07b8: FJP  $07c8       Jump if TOS false
   07ba: SLDO 06          Short load global BASE6
   07bb: LDA  01 01bc     Load addr G444
   07bf: SAS  07          String assign (TOS to TOS-1, 7 chars)
   07c1: LAO  0008        Load global BASE8
   07c3: SLDC 01          Short load constant 1
   07c4: SLDC 01          Short load constant 1
   07c5: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 07c8: NOP              No operation
   07c9: LSA  01          Load string address: ':'
   07cc: LAO  0008        Load global BASE8
   07ce: SLDC 00          Short load constant 0
   07cf: SLDC 00          Short load constant 0
   07d0: CXP  00 1b       Call external procedure PASCALSY.SPOS
   07d3: SRO  0032        Store global word BASE50
   07d5: LDO  0032        Load global word BASE50
   07d7: SLDC 01          Short load constant 1
   07d8: LEQI             Integer TOS-1 <= TOS
   07d9: FJP  $07f7       Jump if TOS false
   07db: SLDO 06          Short load global BASE6
   07dc: SLDC 00          Short load constant 0
   07dd: LDB              Load byte at byte ptr TOS-1 + TOS
   07de: SLDC 00          Short load constant 0
   07df: EQUI             Integer TOS-1 = TOS
   07e0: FJP  $07e8       Jump if TOS false
   07e2: SLDO 06          Short load global BASE6
   07e3: LDA  01 003b     Load addr G59
   07e6: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 07e8: LDO  0032        Load global word BASE50
   07ea: SLDC 01          Short load constant 1
   07eb: EQUI             Integer TOS-1 = TOS
   07ec: FJP  $07f5       Jump if TOS false
   07ee: LAO  0008        Load global BASE8
   07f0: SLDC 01          Short load constant 1
   07f1: SLDC 01          Short load constant 1
   07f2: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 07f5: UJP  $0818       Unconditional jump
-> 07f7: LDO  0032        Load global word BASE50
   07f9: SLDC 01          Short load constant 1
   07fa: SBI              Subtract integers (TOS-1 - TOS)
   07fb: SLDC 07          Short load constant 7
   07fc: LEQI             Integer TOS-1 <= TOS
   07fd: FJP  $0818       Jump if TOS false
   07ff: SLDO 06          Short load global BASE6
   0800: LAO  0008        Load global BASE8
   0802: LAO  0035        Load global BASE53
   0804: SLDC 01          Short load constant 1
   0805: LDO  0032        Load global word BASE50
   0807: SLDC 01          Short load constant 1
   0808: SBI              Subtract integers (TOS-1 - TOS)
   0809: CXP  00 19       Call external procedure PASCALSY.SCOPY
   080c: LAO  0035        Load global BASE53
   080e: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0810: LAO  0008        Load global BASE8
   0812: SLDC 01          Short load constant 1
   0813: LDO  0032        Load global word BASE50
   0815: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0818: SLDO 06          Short load global BASE6
   0819: SLDC 00          Short load constant 0
   081a: LDB              Load byte at byte ptr TOS-1 + TOS
   081b: SLDC 00          Short load constant 0
   081c: GRTI             Integer TOS-1 > TOS
   081d: FJP  $0977       Jump if TOS false
   081f: LSA  01          Load string address: '['
   0822: NOP              No operation
   0823: LAO  0008        Load global BASE8
   0825: SLDC 00          Short load constant 0
   0826: SLDC 00          Short load constant 0
   0827: CXP  00 1b       Call external procedure PASCALSY.SPOS
   082a: SRO  0032        Store global word BASE50
   082c: LDO  0032        Load global word BASE50
   082e: SLDC 00          Short load constant 0
   082f: GRTI             Integer TOS-1 > TOS
   0830: FJP  $083a       Jump if TOS false
   0832: LDO  0032        Load global word BASE50
   0834: SLDC 01          Short load constant 1
   0835: SBI              Subtract integers (TOS-1 - TOS)
   0836: SRO  0032        Store global word BASE50
   0838: UJP  $0840       Unconditional jump
-> 083a: LAO  0008        Load global BASE8
   083c: SLDC 00          Short load constant 0
   083d: LDB              Load byte at byte ptr TOS-1 + TOS
   083e: SRO  0032        Store global word BASE50
-> 0840: LDO  0032        Load global word BASE50
   0842: SLDC 0f          Short load constant 15
   0843: LEQI             Integer TOS-1 <= TOS
   0844: FJP  $0977       Jump if TOS false
   0846: LDO  0032        Load global word BASE50
   0848: SLDC 00          Short load constant 0
   0849: GRTI             Integer TOS-1 > TOS
   084a: FJP  $0863       Jump if TOS false
   084c: SLDO 05          Short load global BASE5
   084d: LAO  0008        Load global BASE8
   084f: LAO  0035        Load global BASE53
   0851: SLDC 01          Short load constant 1
   0852: LDO  0032        Load global word BASE50
   0854: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0857: LAO  0035        Load global BASE53
   0859: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   085b: LAO  0008        Load global BASE8
   085d: SLDC 01          Short load constant 1
   085e: LDO  0032        Load global word BASE50
   0860: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0863: LAO  0008        Load global BASE8
   0865: SLDC 00          Short load constant 0
   0866: LDB              Load byte at byte ptr TOS-1 + TOS
   0867: SLDC 00          Short load constant 0
   0868: EQUI             Integer TOS-1 = TOS
   0869: FJP  $0870       Jump if TOS false
   086b: SLDC 01          Short load constant 1
   086c: SRO  0034        Store global word BASE52
   086e: UJP  $08e7       Unconditional jump
-> 0870: SLDC 00          Short load constant 0
   0871: SRO  0034        Store global word BASE52
   0873: LSA  01          Load string address: ']'
   0876: NOP              No operation
   0877: LAO  0008        Load global BASE8
   0879: SLDC 00          Short load constant 0
   087a: SLDC 00          Short load constant 0
   087b: CXP  00 1b       Call external procedure PASCALSY.SPOS
   087e: SRO  0031        Store global word BASE49
   0880: LDO  0031        Load global word BASE49
   0882: SLDC 02          Short load constant 2
   0883: EQUI             Integer TOS-1 = TOS
   0884: FJP  $088b       Jump if TOS false
   0886: SLDC 01          Short load constant 1
   0887: SRO  0034        Store global word BASE52
   0889: UJP  $08e7       Unconditional jump
-> 088b: LDO  0031        Load global word BASE49
   088d: SLDC 02          Short load constant 2
   088e: GRTI             Integer TOS-1 > TOS
   088f: FJP  $08e7       Jump if TOS false
   0891: SLDC 01          Short load constant 1
   0892: SRO  0034        Store global word BASE52
   0894: SLDC 02          Short load constant 2
   0895: SRO  0032        Store global word BASE50
-> 0897: LAO  0008        Load global BASE8
   0899: LDO  0032        Load global word BASE50
   089b: LDB              Load byte at byte ptr TOS-1 + TOS
   089c: SRO  0033        Store global word BASE51
   089e: LDO  0033        Load global word BASE51
   08a0: LDA  01 007a     Load addr G122
   08a3: LDM  04          Load 4 words from (TOS)
   08a5: SLDC 04          Short load constant 4
   08a6: INN              Set membership (TOS-1 in set TOS)
   08a7: FJP  $08b6       Jump if TOS false
   08a9: SLDO 04          Short load global BASE4
   08aa: SLDO 04          Short load global BASE4
   08ab: SIND 00          Short index load *TOS+0
   08ac: SLDC 0a          Short load constant 10
   08ad: MPI              Multiply integers (TOS * TOS-1)
   08ae: LDO  0033        Load global word BASE51
   08b0: SLDC 30          Short load constant 48
   08b1: SBI              Subtract integers (TOS-1 - TOS)
   08b2: ADI              Add integers (TOS + TOS-1)
   08b3: STO              Store indirect (TOS into TOS-1)
   08b4: UJP  $08b9       Unconditional jump
-> 08b6: SLDC 00          Short load constant 0
   08b7: SRO  0034        Store global word BASE52
-> 08b9: LDO  0032        Load global word BASE50
   08bb: SLDC 01          Short load constant 1
   08bc: ADI              Add integers (TOS + TOS-1)
   08bd: SRO  0032        Store global word BASE50
   08bf: LDO  0032        Load global word BASE50
   08c1: LDO  0031        Load global word BASE49
   08c3: EQUI             Integer TOS-1 = TOS
   08c4: LDO  0034        Load global word BASE52
   08c6: LNOT             Logical NOT (~TOS)
   08c7: LOR              Logical OR (TOS | TOS-1)
   08c8: FJP  $0897       Jump if TOS false
   08ca: LDO  0032        Load global word BASE50
   08cc: SLDC 03          Short load constant 3
   08cd: EQUI             Integer TOS-1 = TOS
   08ce: LDO  0031        Load global word BASE49
   08d0: SLDC 03          Short load constant 3
   08d1: EQUI             Integer TOS-1 = TOS
   08d2: LAND             Logical AND (TOS & TOS-1)
   08d3: FJP  $08e7       Jump if TOS false
   08d5: LAO  0008        Load global BASE8
   08d7: LDO  0032        Load global word BASE50
   08d9: SLDC 01          Short load constant 1
   08da: SBI              Subtract integers (TOS-1 - TOS)
   08db: LDB              Load byte at byte ptr TOS-1 + TOS
   08dc: SLDC 2a          Short load constant 42
   08dd: EQUI             Integer TOS-1 = TOS
   08de: FJP  $08e7       Jump if TOS false
   08e0: SLDO 04          Short load global BASE4
   08e1: SLDC 01          Short load constant 1
   08e2: NGI              Negate integer
   08e3: STO              Store indirect (TOS into TOS-1)
   08e4: SLDC 01          Short load constant 1
   08e5: SRO  0034        Store global word BASE52
-> 08e7: LDO  0034        Load global word BASE52
   08e9: SRO  0001        Store global word BASE1
   08eb: LDO  0034        Load global word BASE52
   08ed: SLDO 05          Short load global BASE5
   08ee: SLDC 00          Short load constant 0
   08ef: LDB              Load byte at byte ptr TOS-1 + TOS
   08f0: SLDC 05          Short load constant 5
   08f1: GRTI             Integer TOS-1 > TOS
   08f2: LAND             Logical AND (TOS & TOS-1)
   08f3: FJP  $0977       Jump if TOS false
   08f5: LAO  0008        Load global BASE8
   08f7: SLDO 05          Short load global BASE5
   08f8: LAO  0035        Load global BASE53
   08fa: SLDO 05          Short load global BASE5
   08fb: SLDC 00          Short load constant 0
   08fc: LDB              Load byte at byte ptr TOS-1 + TOS
   08fd: SLDC 04          Short load constant 4
   08fe: SBI              Subtract integers (TOS-1 - TOS)
   08ff: SLDC 05          Short load constant 5
   0900: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0903: LAO  0035        Load global BASE53
   0905: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0907: LAO  0008        Load global BASE8
   0909: LSA  05          Load string address: '.TEXT'
   0910: NOP              No operation
   0911: EQLSTR           String TOS-1 = TOS
   0913: FJP  $091a       Jump if TOS false
   0915: SLDO 03          Short load global BASE3
   0916: SLDC 03          Short load constant 3
   0917: STO              Store indirect (TOS into TOS-1)
   0918: UJP  $0977       Unconditional jump
-> 091a: LAO  0008        Load global BASE8
   091c: NOP              No operation
   091d: LSA  05          Load string address: '.CODE'
   0924: EQLSTR           String TOS-1 = TOS
   0926: FJP  $092d       Jump if TOS false
   0928: SLDO 03          Short load global BASE3
   0929: SLDC 02          Short load constant 2
   092a: STO              Store indirect (TOS into TOS-1)
   092b: UJP  $0977       Unconditional jump
-> 092d: LAO  0008        Load global BASE8
   092f: LSA  05          Load string address: '.BACK'
   0936: NOP              No operation
   0937: EQLSTR           String TOS-1 = TOS
   0939: FJP  $0940       Jump if TOS false
   093b: SLDO 03          Short load global BASE3
   093c: SLDC 03          Short load constant 3
   093d: STO              Store indirect (TOS into TOS-1)
   093e: UJP  $0977       Unconditional jump
-> 0940: LAO  0008        Load global BASE8
   0942: NOP              No operation
   0943: LSA  05          Load string address: '.INFO'
   094a: EQLSTR           String TOS-1 = TOS
   094c: FJP  $0953       Jump if TOS false
   094e: SLDO 03          Short load global BASE3
   094f: SLDC 04          Short load constant 4
   0950: STO              Store indirect (TOS into TOS-1)
   0951: UJP  $0977       Unconditional jump
-> 0953: LAO  0008        Load global BASE8
   0955: LSA  05          Load string address: '.GRAF'
   095c: NOP              No operation
   095d: EQLSTR           String TOS-1 = TOS
   095f: FJP  $0966       Jump if TOS false
   0961: SLDO 03          Short load global BASE3
   0962: SLDC 06          Short load constant 6
   0963: STO              Store indirect (TOS into TOS-1)
   0964: UJP  $0977       Unconditional jump
-> 0966: LAO  0008        Load global BASE8
   0968: NOP              No operation
   0969: LSA  05          Load string address: '.FOTO'
   0970: EQLSTR           String TOS-1 = TOS
   0972: FJP  $0977       Jump if TOS false
   0974: SLDO 03          Short load global BASE3
   0975: SLDC 07          Short load constant 7
   0976: STO              Store indirect (TOS into TOS-1)
-> 0977: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC34(PARAM1; PARAM2) (* P=34 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
  BASE4
  BASE5
BEGIN
-> 0990: SLDO 01          Short load global BASE1
   0991: SLDC 00          Short load constant 0
   0992: IXA  000d        Index array (TOS-1 + TOS * 13)
   0994: SRO  0004        Store global word BASE4
   0996: SLDO 02          Short load global BASE2
   0997: SRO  0003        Store global word BASE3
   0999: SLDO 04          Short load global BASE4
   099a: IND  0008        Static index and load word (TOS+8)
   099c: SLDC 01          Short load constant 1
   099d: SBI              Subtract integers (TOS-1 - TOS)
   099e: SRO  0005        Store global word BASE5
-> 09a0: SLDO 03          Short load global BASE3
   09a1: SLDO 05          Short load global BASE5
   09a2: LEQI             Integer TOS-1 <= TOS
   09a3: FJP  $09b8       Jump if TOS false
   09a5: SLDO 01          Short load global BASE1
   09a6: SLDO 03          Short load global BASE3
   09a7: IXA  000d        Index array (TOS-1 + TOS * 13)
   09a9: SLDO 01          Short load global BASE1
   09aa: SLDO 03          Short load global BASE3
   09ab: SLDC 01          Short load constant 1
   09ac: ADI              Add integers (TOS + TOS-1)
   09ad: IXA  000d        Index array (TOS-1 + TOS * 13)
   09af: MOV  000d        Move 13 words (TOS to TOS-1)
   09b1: SLDO 03          Short load global BASE3
   09b2: SLDC 01          Short load constant 1
   09b3: ADI              Add integers (TOS + TOS-1)
   09b4: SRO  0003        Store global word BASE3
   09b6: UJP  $09a0       Unconditional jump
-> 09b8: SLDO 01          Short load global BASE1
   09b9: SLDO 04          Short load global BASE4
   09ba: IND  0008        Static index and load word (TOS+8)
   09bc: IXA  000d        Index array (TOS-1 + TOS * 13)
   09be: INC  0003        Inc field ptr (TOS+3)
   09c0: NOP              No operation
   09c1: LSA  00          Load string address: ''
   09c3: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   09c5: SLDO 04          Short load global BASE4
   09c6: INC  0008        Inc field ptr (TOS+8)
   09c8: SLDO 04          Short load global BASE4
   09c9: IND  0008        Static index and load word (TOS+8)
   09cb: SLDC 01          Short load constant 1
   09cc: SBI              Subtract integers (TOS-1 - TOS)
   09cd: STO              Store indirect (TOS into TOS-1)
-> 09ce: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC35(PARAM1; PARAM2; PARAM3) (* P=35 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 09dc: SLDO 01          Short load global BASE1
   09dd: SLDC 00          Short load constant 0
   09de: IXA  000d        Index array (TOS-1 + TOS * 13)
   09e0: SRO  0005        Store global word BASE5
   09e2: SLDO 05          Short load global BASE5
   09e3: IND  0008        Static index and load word (TOS+8)
   09e5: SRO  0004        Store global word BASE4
   09e7: SLDO 02          Short load global BASE2
   09e8: SRO  0006        Store global word BASE6
-> 09ea: SLDO 04          Short load global BASE4
   09eb: SLDO 06          Short load global BASE6
   09ec: GEQI             Integer TOS-1 >= TOS
   09ed: FJP  $0a02       Jump if TOS false
   09ef: SLDO 01          Short load global BASE1
   09f0: SLDO 04          Short load global BASE4
   09f1: SLDC 01          Short load constant 1
   09f2: ADI              Add integers (TOS + TOS-1)
   09f3: IXA  000d        Index array (TOS-1 + TOS * 13)
   09f5: SLDO 01          Short load global BASE1
   09f6: SLDO 04          Short load global BASE4
   09f7: IXA  000d        Index array (TOS-1 + TOS * 13)
   09f9: MOV  000d        Move 13 words (TOS to TOS-1)
   09fb: SLDO 04          Short load global BASE4
   09fc: SLDC 01          Short load constant 1
   09fd: SBI              Subtract integers (TOS-1 - TOS)
   09fe: SRO  0004        Store global word BASE4
   0a00: UJP  $09ea       Unconditional jump
-> 0a02: SLDO 01          Short load global BASE1
   0a03: SLDO 02          Short load global BASE2
   0a04: IXA  000d        Index array (TOS-1 + TOS * 13)
   0a06: SLDO 03          Short load global BASE3
   0a07: MOV  000d        Move 13 words (TOS to TOS-1)
   0a09: SLDO 05          Short load global BASE5
   0a0a: INC  0008        Inc field ptr (TOS+8)
   0a0c: SLDO 05          Short load global BASE5
   0a0d: IND  0008        Static index and load word (TOS+8)
   0a0f: SLDC 01          Short load constant 1
   0a10: ADI              Add integers (TOS + TOS-1)
   0a11: STO              Store indirect (TOS into TOS-1)
-> 0a12: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC36 (* P=36 LL=0 *)
BEGIN
-> 0a20: SLDC 04          Short load constant 4
   0a21: LOD  01 0001     Load word at G1 (SYSCOM)
   0a24: INC  001f        Inc field ptr (TOS+31)
   0a26: SLDC 08          Short load constant 8
   0a27: SLDC 08          Short load constant 8
   0a28: LDP              Load packed field (TOS)
   0a29: CBP  35          Call base procedure PASCALSY.53
-> 0a2b: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC37 (* P=37 LL=0 *)
  BASE1
  BASE2
BEGIN
-> 0a38: CBP  24          Call base procedure PASCALSY.36
   0a3a: LOD  01 0001     Load word at G1 (SYSCOM)
   0a3d: SRO  0001        Store global word BASE1
   0a3f: SLDO 01          Short load global BASE1
   0a40: INC  001f        Inc field ptr (TOS+31)
   0a42: SRO  0002        Store global word BASE2
   0a44: SLDC 03          Short load constant 3
   0a45: CSP  26          Call standard procedure UNITCLEAR
   0a47: SLDO 02          Short load global BASE2
   0a48: INC  0001        Inc field ptr (TOS+1)
   0a4a: SLDC 08          Short load constant 8
   0a4b: SLDC 00          Short load constant 0
   0a4c: LDP              Load packed field (TOS)
   0a4d: SLDC 00          Short load constant 0
   0a4e: NEQI             Integer TOS-1 <> TOS
   0a4f: FJP  $0a5c       Jump if TOS false
   0a51: SLDC 03          Short load constant 3
   0a52: SLDO 02          Short load global BASE2
   0a53: INC  0001        Inc field ptr (TOS+1)
   0a55: SLDC 08          Short load constant 8
   0a56: SLDC 00          Short load constant 0
   0a57: LDP              Load packed field (TOS)
   0a58: CBP  35          Call base procedure PASCALSY.53
   0a5a: UJP  $0a65       Unconditional jump
-> 0a5c: SLDC 06          Short load constant 6
   0a5d: SLDO 02          Short load global BASE2
   0a5e: INC  0004        Inc field ptr (TOS+4)
   0a60: SLDC 08          Short load constant 8
   0a61: SLDC 08          Short load constant 8
   0a62: LDP              Load packed field (TOS)
   0a63: CBP  35          Call base procedure PASCALSY.53
-> 0a65: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC38 (* P=38 LL=0 *)
  BASE1
  BASE2
  BASE3
  BASE4
BEGIN
-> 0a72: LOD  01 0001     Load word at G1 (SYSCOM)
   0a75: SRO  0002        Store global word BASE2
   0a77: SLDO 02          Short load global BASE2
   0a78: INC  001f        Inc field ptr (TOS+31)
   0a7a: SRO  0003        Store global word BASE3
   0a7c: SLDO 03          Short load global BASE3
   0a7d: INC  0001        Inc field ptr (TOS+1)
   0a7f: SLDC 08          Short load constant 8
   0a80: SLDC 08          Short load constant 8
   0a81: LDP              Load packed field (TOS)
   0a82: SLDC 00          Short load constant 0
   0a83: NEQI             Integer TOS-1 <> TOS
   0a84: FJP  $0a91       Jump if TOS false
   0a86: SLDC 02          Short load constant 2
   0a87: SLDO 03          Short load global BASE3
   0a88: INC  0001        Inc field ptr (TOS+1)
   0a8a: SLDC 08          Short load constant 8
   0a8b: SLDC 08          Short load constant 8
   0a8c: LDP              Load packed field (TOS)
   0a8d: CBP  35          Call base procedure PASCALSY.53
   0a8f: UJP  $0adb       Unconditional jump
-> 0a91: SLDO 03          Short load global BASE3
   0a92: INC  0004        Inc field ptr (TOS+4)
   0a94: SLDC 08          Short load constant 8
   0a95: SLDC 00          Short load constant 0
   0a96: LDP              Load packed field (TOS)
   0a97: SLDC 00          Short load constant 0
   0a98: NEQI             Integer TOS-1 <> TOS
   0a99: FJP  $0aa6       Jump if TOS false
   0a9b: SLDC 07          Short load constant 7
   0a9c: SLDO 03          Short load global BASE3
   0a9d: INC  0004        Inc field ptr (TOS+4)
   0a9f: SLDC 08          Short load constant 8
   0aa0: SLDC 00          Short load constant 0
   0aa1: LDP              Load packed field (TOS)
   0aa2: CBP  35          Call base procedure PASCALSY.53
   0aa4: UJP  $0adb       Unconditional jump
-> 0aa6: SLDO 03          Short load global BASE3
   0aa7: INC  0002        Inc field ptr (TOS+2)
   0aa9: SLDC 08          Short load constant 8
   0aaa: SLDC 08          Short load constant 8
   0aab: LDP              Load packed field (TOS)
   0aac: SLDC 00          Short load constant 0
   0aad: NEQI             Integer TOS-1 <> TOS
   0aae: FJP  $0adb       Jump if TOS false
   0ab0: SLDC 02          Short load constant 2
   0ab1: SRO  0001        Store global word BASE1
   0ab3: SLDO 02          Short load global BASE2
   0ab4: IND  0026        Static index and load word (TOS+38)
   0ab6: SRO  0004        Store global word BASE4
-> 0ab8: SLDO 01          Short load global BASE1
   0ab9: SLDO 04          Short load global BASE4
   0aba: LEQI             Integer TOS-1 <= TOS
   0abb: FJP  $0acc       Jump if TOS false
   0abd: LOD  01 0003     Load word at G3 (OUTPUT)
   0ac0: SLDC 20          Short load constant 32
   0ac1: SLDC 00          Short load constant 0
   0ac2: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0ac5: SLDO 01          Short load global BASE1
   0ac6: SLDC 01          Short load constant 1
   0ac7: ADI              Add integers (TOS + TOS-1)
   0ac8: SRO  0001        Store global word BASE1
   0aca: UJP  $0ab8       Unconditional jump
-> 0acc: LOD  01 0003     Load word at G3 (OUTPUT)
   0acf: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ad2: SLDC 00          Short load constant 0
   0ad3: SLDO 03          Short load global BASE3
   0ad4: INC  0002        Inc field ptr (TOS+2)
   0ad6: SLDC 08          Short load constant 8
   0ad7: SLDC 08          Short load constant 8
   0ad8: LDP              Load packed field (TOS)
   0ad9: CBP  35          Call base procedure PASCALSY.53
-> 0adb: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC39 (* P=39 LL=0 *)
BEGIN
-> 0aea: CBP  24          Call base procedure PASCALSY.36
   0aec: CBP  26          Call base procedure PASCALSY.38
   0aee: LOD  01 0003     Load word at G3 (OUTPUT)
   0af1: LDA  01 0046     Load addr G70
   0af4: SLDC 00          Short load constant 0
   0af5: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0af8: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC40(PARAM1): RETVAL (* P=40 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
BEGIN
-> 0b04: LOD  01 0003     Load word at G3 (OUTPUT)
   0b07: LSA  19          Load string address: 'Press <space> to continue'
   0b22: NOP              No operation
   0b23: SLDC 00          Short load constant 0
   0b24: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b27: SLDO 03          Short load global BASE3
   0b28: SLDC 00          Short load constant 0
   0b29: SLDC 00          Short load constant 0
   0b2a: CBP  29          Call base procedure PASCALSY.41
   0b2c: SRO  0004        Store global word BASE4
   0b2e: LOD  01 0002     Load word at G2 (INPUT)
   0b31: SLDC 00          Short load constant 0
   0b32: SLDC 00          Short load constant 0
   0b33: CXP  00 0b       Call external procedure PASCALSY.FEOLN
   0b36: LNOT             Logical NOT (~TOS)
   0b37: FJP  $0b3f       Jump if TOS false
   0b39: LOD  01 0003     Load word at G3 (OUTPUT)
   0b3c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0b3f: CBP  26          Call base procedure PASCALSY.38
   0b41: SLDO 04          Short load global BASE4
   0b42: SLDC 20          Short load constant 32
   0b43: EQUI             Integer TOS-1 = TOS
   0b44: SLDO 04          Short load global BASE4
   0b45: SLDC 1b          Short load constant 27
   0b46: EQUI             Integer TOS-1 = TOS
   0b47: LOR              Logical OR (TOS | TOS-1)
   0b48: FJP  $0b04       Jump if TOS false
   0b4a: SLDO 04          Short load global BASE4
   0b4b: SLDC 20          Short load constant 32
   0b4c: NEQI             Integer TOS-1 <> TOS
   0b4d: SRO  0001        Store global word BASE1
-> 0b4f: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FUNC41(PARAM1): RETVAL (* P=41 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
BEGIN
-> 0b5e: SLDO 03          Short load global BASE3
   0b5f: FJP  $0b64       Jump if TOS false
   0b61: SLDC 01          Short load constant 1
   0b62: CSP  26          Call standard procedure UNITCLEAR
-> 0b64: LOD  01 003a     Load word at G58
   0b67: SIND 02          Short index load *TOS+2
   0b68: FJP  $0b6e       Jump if TOS false
   0b6a: SLDC 00          Short load constant 0
   0b6b: SLDC 30          Short load constant 48
   0b6c: CSP  04          Call standard procedure EXIT
-> 0b6e: LOD  01 003a     Load word at G58
   0b71: INC  0003        Inc field ptr (TOS+3)
   0b73: SLDC 01          Short load constant 1
   0b74: STO              Store indirect (TOS into TOS-1)
   0b75: LOD  01 0002     Load word at G2 (INPUT)
   0b78: LAO  0004        Load global BASE4
   0b7a: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   0b7d: SLDO 04          Short load global BASE4
   0b7e: SLDC 61          Short load constant 97
   0b7f: GEQI             Integer TOS-1 >= TOS
   0b80: SLDO 04          Short load global BASE4
   0b81: SLDC 7a          Short load constant 122
   0b82: LEQI             Integer TOS-1 <= TOS
   0b83: LAND             Logical AND (TOS & TOS-1)
   0b84: FJP  $0b8d       Jump if TOS false
   0b86: SLDO 04          Short load global BASE4
   0b87: SLDC 61          Short load constant 97
   0b88: SBI              Subtract integers (TOS-1 - TOS)
   0b89: SLDC 41          Short load constant 65
   0b8a: ADI              Add integers (TOS + TOS-1)
   0b8b: SRO  0004        Store global word BASE4
-> 0b8d: SLDO 04          Short load global BASE4
   0b8e: SRO  0001        Store global word BASE1
-> 0b90: RBP  01          Return from base procedure
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
-> 0b9c: SLDC 00          Short load constant 0
   0b9d: SRO  0001        Store global word BASE1
   0b9f: LOD  01 0001     Load word at G1 (SYSCOM)
   0ba2: SRO  0007        Store global word BASE7
   0ba4: LDA  01 007e     Load addr G126
   0ba7: SLDO 03          Short load global BASE3
   0ba8: IXA  0006        Index array (TOS-1 + TOS * 6)
   0baa: SRO  0008        Store global word BASE8
   0bac: SLDO 07          Short load global BASE7
   0bad: SIND 04          Short index load *TOS+4
   0bae: LDCN             Load constant NIL
   0baf: EQUI             Integer TOS-1 = TOS
   0bb0: FJP  $0bba       Jump if TOS false
   0bb2: SLDO 07          Short load global BASE7
   0bb3: INC  0004        Inc field ptr (TOS+4)
   0bb5: LDCI 03f6        Load word 1014
   0bb8: CSP  01          Call standard procedure NEW
-> 0bba: SLDO 03          Short load global BASE3
   0bbb: SLDO 07          Short load global BASE7
   0bbc: SIND 04          Short index load *TOS+4
   0bbd: SLDC 00          Short load constant 0
   0bbe: LDCI 07ec        Load word 2028
   0bc1: SLDC 02          Short load constant 2
   0bc2: SLDC 00          Short load constant 0
   0bc3: CSP  05          Call standard procedure UNITREAD
   0bc5: SLDO 07          Short load global BASE7
   0bc6: SIND 00          Short index load *TOS+0
   0bc7: SLDC 00          Short load constant 0
   0bc8: EQUI             Integer TOS-1 = TOS
   0bc9: SRO  0005        Store global word BASE5
   0bcb: SLDO 05          Short load global BASE5
   0bcc: FJP  $0cb3       Jump if TOS false
   0bce: SLDO 07          Short load global BASE7
   0bcf: SIND 04          Short index load *TOS+4
   0bd0: SLDC 00          Short load constant 0
   0bd1: IXA  000d        Index array (TOS-1 + TOS * 13)
   0bd3: SRO  0009        Store global word BASE9
   0bd5: SLDC 00          Short load constant 0
   0bd6: SRO  0005        Store global word BASE5
   0bd8: SLDO 09          Short load global BASE9
   0bd9: SIND 00          Short index load *TOS+0
   0bda: SLDC 00          Short load constant 0
   0bdb: EQUI             Integer TOS-1 = TOS
   0bdc: SLDO 07          Short load global BASE7
   0bdd: INC  001d        Inc field ptr (TOS+29)
   0bdf: SLDC 02          Short load constant 2
   0be0: SLDC 07          Short load constant 7
   0be1: LDP              Load packed field (TOS)
   0be2: SLDC 02          Short load constant 2
   0be3: EQUI             Integer TOS-1 = TOS
   0be4: SLDO 07          Short load global BASE7
   0be5: INC  001d        Inc field ptr (TOS+29)
   0be7: SLDC 02          Short load constant 2
   0be8: SLDC 07          Short load constant 7
   0be9: LDP              Load packed field (TOS)
   0bea: SLDC 0a          Short load constant 10
   0beb: SLDC 01          Short load constant 1
   0bec: INN              Set membership (TOS-1 in set TOS)
   0bed: SLDO 09          Short load global BASE9
   0bee: INC  0002        Inc field ptr (TOS+2)
   0bf0: SLDC 04          Short load constant 4
   0bf1: SLDC 00          Short load constant 0
   0bf2: LDP              Load packed field (TOS)
   0bf3: SLDC 08          Short load constant 8
   0bf4: EQUI             Integer TOS-1 = TOS
   0bf5: LAND             Logical AND (TOS & TOS-1)
   0bf6: LOR              Logical OR (TOS | TOS-1)
   0bf7: SLDO 07          Short load global BASE7
   0bf8: INC  001d        Inc field ptr (TOS+29)
   0bfa: SLDC 02          Short load constant 2
   0bfb: SLDC 07          Short load constant 7
   0bfc: LDP              Load packed field (TOS)
   0bfd: SLDC 00          Short load constant 0
   0bfe: EQUI             Integer TOS-1 = TOS
   0bff: SLDO 09          Short load global BASE9
   0c00: INC  0002        Inc field ptr (TOS+2)
   0c02: SLDC 04          Short load constant 4
   0c03: SLDC 00          Short load constant 0
   0c04: LDP              Load packed field (TOS)
   0c05: SLDC 00          Short load constant 0
   0c06: EQUI             Integer TOS-1 = TOS
   0c07: LAND             Logical AND (TOS & TOS-1)
   0c08: LOR              Logical OR (TOS | TOS-1)
   0c09: LAND             Logical AND (TOS & TOS-1)
   0c0a: FJP  $0c9d       Jump if TOS false
   0c0c: SLDO 09          Short load global BASE9
   0c0d: INC  0003        Inc field ptr (TOS+3)
   0c0f: SLDC 00          Short load constant 0
   0c10: LDB              Load byte at byte ptr TOS-1 + TOS
   0c11: SLDC 00          Short load constant 0
   0c12: GRTI             Integer TOS-1 > TOS
   0c13: SLDO 09          Short load global BASE9
   0c14: INC  0003        Inc field ptr (TOS+3)
   0c16: SLDC 00          Short load constant 0
   0c17: LDB              Load byte at byte ptr TOS-1 + TOS
   0c18: SLDC 07          Short load constant 7
   0c19: LEQI             Integer TOS-1 <= TOS
   0c1a: LAND             Logical AND (TOS & TOS-1)
   0c1b: SLDO 09          Short load global BASE9
   0c1c: IND  0008        Static index and load word (TOS+8)
   0c1e: SLDC 00          Short load constant 0
   0c1f: GEQI             Integer TOS-1 >= TOS
   0c20: LAND             Logical AND (TOS & TOS-1)
   0c21: SLDO 09          Short load global BASE9
   0c22: IND  0008        Static index and load word (TOS+8)
   0c24: SLDC 4d          Short load constant 77
   0c25: LEQI             Integer TOS-1 <= TOS
   0c26: LAND             Logical AND (TOS & TOS-1)
   0c27: FJP  $0c9d       Jump if TOS false
   0c29: SLDC 01          Short load constant 1
   0c2a: SRO  0005        Store global word BASE5
   0c2c: SLDO 09          Short load global BASE9
   0c2d: INC  0003        Inc field ptr (TOS+3)
   0c2f: SLDO 08          Short load global BASE8
   0c30: NEQSTR           String TOS-1 <> TOS
   0c32: FJP  $0c9d       Jump if TOS false
   0c34: SLDC 01          Short load constant 1
   0c35: SRO  0004        Store global word BASE4
-> 0c37: SLDO 04          Short load global BASE4
   0c38: SLDO 09          Short load global BASE9
   0c39: IND  0008        Static index and load word (TOS+8)
   0c3b: LEQI             Integer TOS-1 <= TOS
   0c3c: FJP  $0c84       Jump if TOS false
   0c3e: SLDO 07          Short load global BASE7
   0c3f: SIND 04          Short index load *TOS+4
   0c40: SLDO 04          Short load global BASE4
   0c41: IXA  000d        Index array (TOS-1 + TOS * 13)
   0c43: SRO  000a        Store global word BASE10
   0c45: SLDO 0a          Short load global BASE10
   0c46: INC  0003        Inc field ptr (TOS+3)
   0c48: SLDC 00          Short load constant 0
   0c49: LDB              Load byte at byte ptr TOS-1 + TOS
   0c4a: SLDC 00          Short load constant 0
   0c4b: LEQI             Integer TOS-1 <= TOS
   0c4c: SLDO 0a          Short load global BASE10
   0c4d: INC  0003        Inc field ptr (TOS+3)
   0c4f: SLDC 00          Short load constant 0
   0c50: LDB              Load byte at byte ptr TOS-1 + TOS
   0c51: SLDC 0f          Short load constant 15
   0c52: GRTI             Integer TOS-1 > TOS
   0c53: LOR              Logical OR (TOS | TOS-1)
   0c54: SLDO 0a          Short load global BASE10
   0c55: SIND 01          Short index load *TOS+1
   0c56: SLDO 0a          Short load global BASE10
   0c57: SIND 00          Short index load *TOS+0
   0c58: LESI             Integer TOS-1 < TOS
   0c59: LOR              Logical OR (TOS | TOS-1)
   0c5a: SLDO 0a          Short load global BASE10
   0c5b: IND  000b        Static index and load word (TOS+11)
   0c5d: LDCI 0200        Load word 512
   0c60: GRTI             Integer TOS-1 > TOS
   0c61: LOR              Logical OR (TOS | TOS-1)
   0c62: SLDO 0a          Short load global BASE10
   0c63: IND  000b        Static index and load word (TOS+11)
   0c65: SLDC 00          Short load constant 0
   0c66: LEQI             Integer TOS-1 <= TOS
   0c67: LOR              Logical OR (TOS | TOS-1)
   0c68: SLDO 0a          Short load global BASE10
   0c69: INC  000c        Inc field ptr (TOS+12)
   0c6b: SLDC 07          Short load constant 7
   0c6c: SLDC 09          Short load constant 9
   0c6d: LDP              Load packed field (TOS)
   0c6e: SLDC 64          Short load constant 100
   0c6f: GEQI             Integer TOS-1 >= TOS
   0c70: LOR              Logical OR (TOS | TOS-1)
   0c71: FJP  $0c7d       Jump if TOS false
   0c73: SLDC 00          Short load constant 0
   0c74: SRO  0005        Store global word BASE5
   0c76: SLDO 04          Short load global BASE4
   0c77: SLDO 07          Short load global BASE7
   0c78: SIND 04          Short index load *TOS+4
   0c79: CBP  22          Call base procedure PASCALSY.34
   0c7b: UJP  $0c82       Unconditional jump
-> 0c7d: SLDO 04          Short load global BASE4
   0c7e: SLDC 01          Short load constant 1
   0c7f: ADI              Add integers (TOS + TOS-1)
   0c80: SRO  0004        Store global word BASE4
-> 0c82: UJP  $0c37       Unconditional jump
-> 0c84: SLDO 05          Short load global BASE5
   0c85: LNOT             Logical NOT (~TOS)
   0c86: FJP  $0c9d       Jump if TOS false
   0c88: SLDO 03          Short load global BASE3
   0c89: SLDO 07          Short load global BASE7
   0c8a: SIND 04          Short index load *TOS+4
   0c8b: SLDC 00          Short load constant 0
   0c8c: SLDO 09          Short load global BASE9
   0c8d: IND  0008        Static index and load word (TOS+8)
   0c8f: SLDC 01          Short load constant 1
   0c90: ADI              Add integers (TOS + TOS-1)
   0c91: SLDC 1a          Short load constant 26
   0c92: MPI              Multiply integers (TOS * TOS-1)
   0c93: SLDC 02          Short load constant 2
   0c94: SLDC 00          Short load constant 0
   0c95: CSP  06          Call standard procedure UNITWRITE
   0c97: SLDO 07          Short load global BASE7
   0c98: SIND 00          Short index load *TOS+0
   0c99: SLDC 00          Short load constant 0
   0c9a: EQUI             Integer TOS-1 = TOS
   0c9b: SRO  0005        Store global word BASE5
-> 0c9d: SLDO 05          Short load global BASE5
   0c9e: FJP  $0cb3       Jump if TOS false
   0ca0: SLDO 08          Short load global BASE8
   0ca1: SLDO 09          Short load global BASE9
   0ca2: INC  0003        Inc field ptr (TOS+3)
   0ca4: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0ca6: SLDO 08          Short load global BASE8
   0ca7: INC  0005        Inc field ptr (TOS+5)
   0ca9: SLDO 09          Short load global BASE9
   0caa: SIND 07          Short index load *TOS+7
   0cab: STO              Store indirect (TOS into TOS-1)
   0cac: LAO  0006        Load global BASE6
   0cae: SLDO 09          Short load global BASE9
   0caf: INC  0009        Inc field ptr (TOS+9)
   0cb1: CSP  09          Call standard procedure TIME
-> 0cb3: SLDO 05          Short load global BASE5
   0cb4: SRO  0001        Store global word BASE1
   0cb6: SLDO 05          Short load global BASE5
   0cb7: LNOT             Logical NOT (~TOS)
   0cb8: FJP  $0cd1       Jump if TOS false
   0cba: SLDO 08          Short load global BASE8
   0cbb: LSA  00          Load string address: ''
   0cbd: NOP              No operation
   0cbe: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0cc0: SLDO 08          Short load global BASE8
   0cc1: INC  0005        Inc field ptr (TOS+5)
   0cc3: LDCI 7fff        Load word 32767
   0cc6: STO              Store indirect (TOS into TOS-1)
   0cc7: SLDO 07          Short load global BASE7
   0cc8: INC  0004        Inc field ptr (TOS+4)
   0cca: CSP  21          Call standard procedure RELEASE
   0ccc: SLDO 07          Short load global BASE7
   0ccd: INC  0004        Inc field ptr (TOS+4)
   0ccf: LDCN             Load constant NIL
   0cd0: STO              Store indirect (TOS into TOS-1)
-> 0cd1: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC43(PARAM1; PARAM2; PARAM3) (* P=43 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE294
BEGIN
-> 0ce4: SLDC 04          Short load constant 4
   0ce5: LAO  0004        Load global BASE4
   0ce7: SLDO 03          Short load global BASE3
   0ce8: SLDO 02          Short load global BASE2
   0ce9: LDO  0126        Load global word BASE294
   0cec: SLDO 01          Short load global BASE1
   0ced: CXP  06 01       Call external procedure FILEPROC.1
-> 0cf0: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC44(PARAM1) (* P=44 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 0cfc: LOD  01 017d     Load word at G381
   0d00: LOD  01 017f     Load word at G383
   0d04: SLDO 01          Short load global BASE1
   0d05: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0d06: LOD  01 017f     Load word at G383
   0d0a: SLDC 01          Short load constant 1
   0d0b: ADI              Add integers (TOS + TOS-1)
   0d0c: STR  01 017f     Store TOS to G383
   0d10: LOD  01 017f     Load word at G383
   0d14: LDCI 01fd        Load word 509
   0d17: GRTI             Integer TOS-1 > TOS
   0d18: LOD  01 0181     Load word at G385
   0d1c: LAND             Logical AND (TOS & TOS-1)
   0d1d: FJP  $0d2d       Jump if TOS false
   0d1f: LOD  01 017d     Load word at G381
   0d23: LOD  01 017f     Load word at G383
   0d27: SLDC 0d          Short load constant 13
   0d28: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0d29: CBP  2f          Call base procedure PASCALSY.47
   0d2b: UJP  $0d39       Unconditional jump
-> 0d2d: LOD  01 017f     Load word at G383
   0d31: LDCI 01ff        Load word 511
   0d34: GRTI             Integer TOS-1 > TOS
   0d35: FJP  $0d39       Jump if TOS false
   0d37: CBP  2f          Call base procedure PASCALSY.47
-> 0d39: SLDO 01          Short load global BASE1
   0d3a: LOD  01 018b     Load word at G395
   0d3e: EQUI             Integer TOS-1 = TOS
   0d3f: FJP  $0d4f       Jump if TOS false
   0d41: LOD  01 018a     Load word at G394
   0d45: LOD  01 018b     Load word at G395
   0d49: EQUI             Integer TOS-1 = TOS
   0d4a: FJP  $0d4f       Jump if TOS false
   0d4c: SLDC 01          Short load constant 1
   0d4d: CBP  2d          Call base procedure PASCALSY.45
-> 0d4f: SLDO 01          Short load global BASE1
   0d50: STR  01 018a     Store TOS to G394
-> 0d54: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC45(PARAM1) (* P=45 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 0d60: LOD  01 0182     Load word at G386
   0d64: FJP  $0d75       Jump if TOS false
   0d66: SLDC 00          Short load constant 0
   0d67: STR  01 0182     Store TOS to G386
   0d6b: LDA  01 018c     Load addr G396
   0d6f: SLDC 00          Short load constant 0
   0d70: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0d73: UJP  $0da8       Unconditional jump
-> 0d75: SLDO 01          Short load global BASE1
   0d76: FJP  $0d9b       Jump if TOS false
   0d78: SLDC 20          Short load constant 32
   0d79: STR  01 018a     Store TOS to G394
   0d7d: LOD  01 018b     Load word at G395
   0d81: CBP  2c          Call base procedure PASCALSY.44
   0d83: SLDC 20          Short load constant 32
   0d84: STR  01 018a     Store TOS to G394
   0d88: LOD  01 018b     Load word at G395
   0d8c: CBP  2c          Call base procedure PASCALSY.44
   0d8e: SLDC 0d          Short load constant 13
   0d8f: CBP  2c          Call base procedure PASCALSY.44
   0d91: CBP  2f          Call base procedure PASCALSY.47
   0d93: LOD  01 0181     Load word at G385
   0d97: FJP  $0d9b       Jump if TOS false
   0d99: CBP  2f          Call base procedure PASCALSY.47
-> 0d9b: SLDC 00          Short load constant 0
   0d9c: STR  01 0183     Store TOS to G387
   0da0: LDA  01 018c     Load addr G396
   0da4: SLDC 01          Short load constant 1
   0da5: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 0da8: LOD  01 017e     Load word at G382
   0dac: STR  01 0036     Store TOS to G54
   0daf: SLDC 01          Short load constant 1
   0db0: STR  01 0187     Store TOS to G391
-> 0db4: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC46 (* P=46 LL=0 *)
BEGIN
-> 0dc0: LOD  01 0181     Load word at G385
   0dc4: SLDC 01          Short load constant 1
   0dc5: ADI              Add integers (TOS + TOS-1)
   0dc6: STR  01 0181     Store TOS to G385
   0dca: LDA  01 018c     Load addr G396
   0dce: LOD  01 017d     Load word at G381
   0dd2: SLDC 00          Short load constant 0
   0dd3: SLDC 01          Short load constant 1
   0dd4: LOD  01 0181     Load word at G385
   0dd8: SLDC 01          Short load constant 1
   0dd9: SLDC 00          Short load constant 0
   0dda: SLDC 00          Short load constant 0
   0ddb: CXP  00 1c       Call external procedure PASCALSY.FBLOCKIO
   0dde: SLDC 01          Short load constant 1
   0ddf: NEQI             Integer TOS-1 <> TOS
   0de0: FJP  $0e14       Jump if TOS false
   0de2: LOD  01 0003     Load word at G3 (OUTPUT)
   0de5: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0de8: LOD  01 0003     Load word at G3 (OUTPUT)
   0deb: LSA  17          Load string address: 'Error reading exec file'
   0e04: NOP              No operation
   0e05: SLDC 00          Short load constant 0
   0e06: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0e09: LOD  01 0003     Load word at G3 (OUTPUT)
   0e0c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0e0f: SLDC 01          Short load constant 1
   0e10: CBP  2d          Call base procedure PASCALSY.45
   0e12: UJP  $0e40       Unconditional jump
-> 0e14: SLDC 00          Short load constant 0
   0e15: STR  01 017f     Store TOS to G383
   0e19: LOD  01 0181     Load word at G385
   0e1d: FJP  $0e39       Jump if TOS false
   0e1f: LDCI 01fe        Load word 510
   0e22: LDCI 01ff        Load word 511
   0e25: NGI              Negate integer
   0e26: SLDC 00          Short load constant 0
   0e27: SLDC 0d          Short load constant 13
   0e28: LOD  01 017d     Load word at G381
   0e2c: LDCI 01ff        Load word 511
   0e2f: SLDC 00          Short load constant 0
   0e30: CSP  0b          Call standard procedure SCAN
   0e32: ADI              Add integers (TOS + TOS-1)
   0e33: STR  01 0180     Store TOS to G384
   0e37: UJP  $0e40       Unconditional jump
-> 0e39: LDCI 01ff        Load word 511
   0e3c: STR  01 0180     Store TOS to G384
-> 0e40: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC47 (* P=47 LL=0 *)
BEGIN
-> 0e4c: LDA  01 018c     Load addr G396
   0e50: LOD  01 017d     Load word at G381
   0e54: SLDC 00          Short load constant 0
   0e55: SLDC 01          Short load constant 1
   0e56: LOD  01 0181     Load word at G385
   0e5a: SLDC 00          Short load constant 0
   0e5b: SLDC 00          Short load constant 0
   0e5c: SLDC 00          Short load constant 0
   0e5d: CXP  00 1c       Call external procedure PASCALSY.FBLOCKIO
   0e60: SLDC 01          Short load constant 1
   0e61: NEQI             Integer TOS-1 <> TOS
   0e62: FJP  $0e96       Jump if TOS false
   0e64: LOD  01 0003     Load word at G3 (OUTPUT)
   0e67: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0e6a: LOD  01 0003     Load word at G3 (OUTPUT)
   0e6d: LSA  17          Load string address: 'Error writing exec file'
   0e86: NOP              No operation
   0e87: SLDC 00          Short load constant 0
   0e88: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0e8b: LOD  01 0003     Load word at G3 (OUTPUT)
   0e8e: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0e91: SLDC 00          Short load constant 0
   0e92: CBP  2d          Call base procedure PASCALSY.45
   0e94: UJP  $0eb0       Unconditional jump
-> 0e96: LOD  01 017d     Load word at G381
   0e9a: SLDC 00          Short load constant 0
   0e9b: LDCI 0200        Load word 512
   0e9e: SLDC 00          Short load constant 0
   0e9f: CSP  0a          Call standard procedure FLCH
   0ea1: SLDC 00          Short load constant 0
   0ea2: STR  01 017f     Store TOS to G383
   0ea6: LOD  01 0181     Load word at G385
   0eaa: SLDC 01          Short load constant 1
   0eab: ADI              Add integers (TOS + TOS-1)
   0eac: STR  01 0181     Store TOS to G385
-> 0eb0: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC48 (* P=48 LL=0 *)
BEGIN
-> 0ebc: SLDC 00          Short load constant 0
   0ebd: STR  01 0045     Store TOS to G69
   0ec0: SLDC 00          Short load constant 0
   0ec1: STR  01 0184     Store TOS to G388
-> 0ec5: CBP  32          Call base procedure PASCALSY.50
   0ec7: CLP  3a          Call local procedure PASCALSY.58
   0ec9: LOD  01 0184     Load word at G388
   0ecd: FJP  $0ed4       Jump if TOS false
   0ecf: LDCN             Load constant NIL
   0ed0: LDCN             Load constant NIL
   0ed1: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
-> 0ed4: LOD  01 0045     Load word at G69
   0ed7: SLDC 00          Short load constant 0
   0ed8: EQUI             Integer TOS-1 = TOS
   0ed9: FJP  $0ec5       Jump if TOS false
-> 0edb: RBP  00          Return from base procedure
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
-> 0eea: SLDC 01          Short load constant 1
   0eeb: SRO  0001        Store global word BASE1
   0eed: SLDC 00          Short load constant 0
   0eee: SRO  0005        Store global word BASE5
   0ef0: SLDO 03          Short load global BASE3
   0ef1: SRO  0009        Store global word BASE9
   0ef3: SLDO 09          Short load global BASE9
   0ef4: INC  0010        Inc field ptr (TOS+16)
   0ef6: SRO  000a        Store global word BASE10
   0ef8: SLDO 0a          Short load global BASE10
   0ef9: INC  0003        Inc field ptr (TOS+3)
   0efb: SLDC 00          Short load constant 0
   0efc: LDB              Load byte at byte ptr TOS-1 + TOS
   0efd: SLDC 00          Short load constant 0
   0efe: GRTI             Integer TOS-1 > TOS
   0eff: FJP  $0fc6       Jump if TOS false
   0f01: SLDO 09          Short load global BASE9
   0f02: SIND 07          Short index load *TOS+7
   0f03: SLDO 09          Short load global BASE9
   0f04: INC  0008        Inc field ptr (TOS+8)
   0f06: SLDC 00          Short load constant 0
   0f07: LAO  0008        Load global BASE8
   0f09: SLDC 00          Short load constant 0
   0f0a: SLDC 00          Short load constant 0
   0f0b: CBP  1e          Call base procedure PASCALSY.30
   0f0d: NEQI             Integer TOS-1 <> TOS
   0f0e: FJP  $0f17       Jump if TOS false
   0f10: LOD  01 0001     Load word at G1 (SYSCOM)
   0f13: SLDC 05          Short load constant 5
   0f14: STO              Store indirect (TOS into TOS-1)
   0f15: UJP  $0fc6       Unconditional jump
-> 0f17: SLDC 00          Short load constant 0
   0f18: SRO  0006        Store global word BASE6
   0f1a: SLDC 01          Short load constant 1
   0f1b: SRO  0004        Store global word BASE4
-> 0f1d: SLDO 04          Short load global BASE4
   0f1e: SLDO 08          Short load global BASE8
   0f1f: SLDC 00          Short load constant 0
   0f20: IXA  000d        Index array (TOS-1 + TOS * 13)
   0f22: IND  0008        Static index and load word (TOS+8)
   0f24: LEQI             Integer TOS-1 <= TOS
   0f25: SLDO 06          Short load global BASE6
   0f26: LNOT             Logical NOT (~TOS)
   0f27: LAND             Logical AND (TOS & TOS-1)
   0f28: FJP  $0f44       Jump if TOS false
   0f2a: SLDO 08          Short load global BASE8
   0f2b: SLDO 04          Short load global BASE4
   0f2c: IXA  000d        Index array (TOS-1 + TOS * 13)
   0f2e: SIND 00          Short index load *TOS+0
   0f2f: SLDO 0a          Short load global BASE10
   0f30: SIND 00          Short index load *TOS+0
   0f31: EQUI             Integer TOS-1 = TOS
   0f32: SLDO 08          Short load global BASE8
   0f33: SLDO 04          Short load global BASE4
   0f34: IXA  000d        Index array (TOS-1 + TOS * 13)
   0f36: SIND 01          Short index load *TOS+1
   0f37: SLDO 0a          Short load global BASE10
   0f38: SIND 01          Short index load *TOS+1
   0f39: EQUI             Integer TOS-1 = TOS
   0f3a: LAND             Logical AND (TOS & TOS-1)
   0f3b: SRO  0006        Store global word BASE6
   0f3d: SLDO 04          Short load global BASE4
   0f3e: SLDC 01          Short load constant 1
   0f3f: ADI              Add integers (TOS + TOS-1)
   0f40: SRO  0004        Store global word BASE4
   0f42: UJP  $0f1d       Unconditional jump
-> 0f44: SLDO 06          Short load global BASE6
   0f45: LNOT             Logical NOT (~TOS)
   0f46: FJP  $0f4f       Jump if TOS false
   0f48: LOD  01 0001     Load word at G1 (SYSCOM)
   0f4b: SLDC 06          Short load constant 6
   0f4c: STO              Store indirect (TOS into TOS-1)
   0f4d: UJP  $0fc6       Unconditional jump
-> 0f4f: SLDO 04          Short load global BASE4
   0f50: SLDO 08          Short load global BASE8
   0f51: SLDC 00          Short load constant 0
   0f52: IXA  000d        Index array (TOS-1 + TOS * 13)
   0f54: IND  0008        Static index and load word (TOS+8)
   0f56: GRTI             Integer TOS-1 > TOS
   0f57: FJP  $0f62       Jump if TOS false
   0f59: SLDO 08          Short load global BASE8
   0f5a: SLDC 00          Short load constant 0
   0f5b: IXA  000d        Index array (TOS-1 + TOS * 13)
   0f5d: SIND 07          Short index load *TOS+7
   0f5e: SRO  0007        Store global word BASE7
   0f60: UJP  $0f69       Unconditional jump
-> 0f62: SLDO 08          Short load global BASE8
   0f63: SLDO 04          Short load global BASE4
   0f64: IXA  000d        Index array (TOS-1 + TOS * 13)
   0f66: SIND 00          Short index load *TOS+0
   0f67: SRO  0007        Store global word BASE7
-> 0f69: SLDO 0a          Short load global BASE10
   0f6a: SIND 01          Short index load *TOS+1
   0f6b: SLDO 07          Short load global BASE7
   0f6c: LESI             Integer TOS-1 < TOS
   0f6d: SLDO 0a          Short load global BASE10
   0f6e: IND  000b        Static index and load word (TOS+11)
   0f70: LDCI 0200        Load word 512
   0f73: LESI             Integer TOS-1 < TOS
   0f74: LOR              Logical OR (TOS | TOS-1)
   0f75: FJP  $0fc3       Jump if TOS false
   0f77: SLDO 08          Short load global BASE8
   0f78: SLDO 04          Short load global BASE4
   0f79: SLDC 01          Short load constant 1
   0f7a: SBI              Subtract integers (TOS-1 - TOS)
   0f7b: IXA  000d        Index array (TOS-1 + TOS * 13)
   0f7d: SRO  000b        Store global word BASE11
   0f7f: SLDO 0b          Short load global BASE11
   0f80: INC  0001        Inc field ptr (TOS+1)
   0f82: SLDO 07          Short load global BASE7
   0f83: STO              Store indirect (TOS into TOS-1)
   0f84: SLDO 0b          Short load global BASE11
   0f85: INC  000b        Inc field ptr (TOS+11)
   0f87: LDCI 0200        Load word 512
   0f8a: STO              Store indirect (TOS into TOS-1)
   0f8b: SLDO 09          Short load global BASE9
   0f8c: SIND 07          Short index load *TOS+7
   0f8d: SLDO 08          Short load global BASE8
   0f8e: CBP  1f          Call base procedure PASCALSY.31
   0f90: CSP  22          Call standard procedure IORESULT
   0f92: SLDC 00          Short load constant 0
   0f93: NEQI             Integer TOS-1 <> TOS
   0f94: FJP  $0f98       Jump if TOS false
   0f96: UJP  $0fc6       Unconditional jump
-> 0f98: SLDO 09          Short load global BASE9
   0f99: INC  0002        Inc field ptr (TOS+2)
   0f9b: SLDC 00          Short load constant 0
   0f9c: STO              Store indirect (TOS into TOS-1)
   0f9d: SLDO 09          Short load global BASE9
   0f9e: INC  0001        Inc field ptr (TOS+1)
   0fa0: SLDC 00          Short load constant 0
   0fa1: STO              Store indirect (TOS into TOS-1)
   0fa2: SLDO 09          Short load global BASE9
   0fa3: SIND 03          Short index load *TOS+3
   0fa4: SLDC 00          Short load constant 0
   0fa5: NEQI             Integer TOS-1 <> TOS
   0fa6: FJP  $0fad       Jump if TOS false
   0fa8: SLDO 09          Short load global BASE9
   0fa9: INC  0003        Inc field ptr (TOS+3)
   0fab: SLDC 01          Short load constant 1
   0fac: STO              Store indirect (TOS into TOS-1)
-> 0fad: SLDO 0a          Short load global BASE10
   0fae: INC  0001        Inc field ptr (TOS+1)
   0fb0: SLDO 07          Short load global BASE7
   0fb1: STO              Store indirect (TOS into TOS-1)
   0fb2: SLDO 0a          Short load global BASE10
   0fb3: INC  000b        Inc field ptr (TOS+11)
   0fb5: LDCI 0200        Load word 512
   0fb8: STO              Store indirect (TOS into TOS-1)
   0fb9: SLDO 0a          Short load global BASE10
   0fba: INC  000c        Inc field ptr (TOS+12)
   0fbc: SLDC 07          Short load constant 7
   0fbd: SLDC 09          Short load constant 9
   0fbe: SLDC 64          Short load constant 100
   0fbf: STP              Store packed field (TOS into TOS-1)
   0fc0: SLDC 00          Short load constant 0
   0fc1: SRO  0001        Store global word BASE1
-> 0fc3: SLDC 01          Short load constant 1
   0fc4: SRO  0005        Store global word BASE5
-> 0fc6: SLDO 05          Short load global BASE5
   0fc7: LNOT             Logical NOT (~TOS)
   0fc8: FJP  $0fd4       Jump if TOS false
   0fca: SLDO 03          Short load global BASE3
   0fcb: INC  0002        Inc field ptr (TOS+2)
   0fcd: SLDC 01          Short load constant 1
   0fce: STO              Store indirect (TOS into TOS-1)
   0fcf: SLDO 03          Short load global BASE3
   0fd0: INC  0001        Inc field ptr (TOS+1)
   0fd2: SLDC 01          Short load constant 1
   0fd3: STO              Store indirect (TOS into TOS-1)
-> 0fd4: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC50 (* P=50 LL=0 *)
  BASE2
BEGIN
-> 0fe6: LDA  01 0036     Load addr G54
   0fe9: CSP  21          Call standard procedure RELEASE
-> 0feb: LDA  01 007e     Load addr G126
   0fee: LOD  01 0001     Load word at G1 (SYSCOM)
   0ff1: SIND 02          Short index load *TOS+2
   0ff2: IXA  0006        Index array (TOS-1 + TOS * 6)
   0ff4: LDA  01 003f     Load addr G63
   0ff7: NEQSTR           String TOS-1 <> TOS
   0ff9: FJP  $1059       Jump if TOS false
   0ffb: LDA  01 0046     Load addr G70
   0ffe: NOP              No operation
   0fff: LSA  08          Load string address: 'Put in :'
   1009: SAS  50          String assign (TOS to TOS-1, 80 chars)
   100b: LDA  01 003f     Load addr G63
   100e: LDA  01 0046     Load addr G70
   1011: SLDC 50          Short load constant 80
   1012: SLDC 08          Short load constant 8
   1013: CXP  00 18       Call external procedure PASCALSY.SINSERT
   1016: CBP  27          Call base procedure PASCALSY.39
   1018: LOD  01 0003     Load word at G3 (OUTPUT)
   101b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   101e: CBP  26          Call base procedure PASCALSY.38
   1020: LOD  01 0003     Load word at G3 (OUTPUT)
   1023: LSA  11          Load string address: 'then press RETURN'
   1036: NOP              No operation
   1037: SLDC 00          Short load constant 0
   1038: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 103b: LOD  01 0004     Load word at G4 (SYSTERM)
   103e: LAO  0002        Load global BASE2
   1040: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   1043: LOD  01 0004     Load word at G4 (SYSTERM)
   1046: SLDC 00          Short load constant 0
   1047: SLDC 00          Short load constant 0
   1048: CXP  00 0b       Call external procedure PASCALSY.FEOLN
   104b: FJP  $103b       Jump if TOS false
   104d: LOD  01 0001     Load word at G1 (SYSCOM)
   1050: SIND 02          Short index load *TOS+2
   1051: SLDC 00          Short load constant 0
   1052: SLDC 00          Short load constant 0
   1053: CBP  2a          Call base procedure PASCALSY.42
   1055: FJP  $1057       Jump if TOS false
-> 1057: UJP  $0feb       Unconditional jump
-> 1059: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC51 (* P=51 LL=1 *)
  MP1
BEGIN
-> 106a: LOD  02 0001     Load word at G1 (SYSCOM)
   106d: STL  0001        Store TOS into MP1
   106f: LOD  02 0003     Load word at G3 (OUTPUT)
   1072: NOP              No operation
   1073: LSA  03          Load string address: 'S# '
   1078: SLDC 00          Short load constant 0
   1079: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   107c: LOD  02 0003     Load word at G3 (OUTPUT)
   107f: SLDL 01          Short load local MP1
   1080: IND  0009        Static index and load word (TOS+9)
   1082: SLDC 00          Short load constant 0
   1083: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   1086: LOD  02 0003     Load word at G3 (OUTPUT)
   1089: LSA  05          Load string address: ', P# '
   1090: NOP              No operation
   1091: SLDC 00          Short load constant 0
   1092: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1095: LOD  02 0003     Load word at G3 (OUTPUT)
   1098: SLDL 01          Short load local MP1
   1099: IND  0008        Static index and load word (TOS+8)
   109b: SLDC 00          Short load constant 0
   109c: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   109f: LOD  02 0003     Load word at G3 (OUTPUT)
   10a2: NOP              No operation
   10a3: LSA  05          Load string address: ', I# '
   10aa: SLDC 00          Short load constant 0
   10ab: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   10ae: LOD  02 0003     Load word at G3 (OUTPUT)
   10b1: SLDL 01          Short load local MP1
   10b2: IND  000b        Static index and load word (TOS+11)
   10b4: SLDC 00          Short load constant 0
   10b5: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   10b8: LOD  02 0003     Load word at G3 (OUTPUT)
   10bb: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 10be: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC52 (* P=52 LL=1 *)
  MP1
BEGIN
-> 10ca: LOD  02 0001     Load word at G1 (SYSCOM)
   10cd: STL  0001        Store TOS into MP1
   10cf: LOD  02 0003     Load word at G3 (OUTPUT)
   10d2: NOP              No operation
   10d3: LSA  12          Load string address: 'Execution error # '
   10e7: SLDC 00          Short load constant 0
   10e8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   10eb: LOD  02 0003     Load word at G3 (OUTPUT)
   10ee: SLDL 01          Short load local MP1
   10ef: SIND 01          Short index load *TOS+1
   10f0: SLDC 00          Short load constant 0
   10f1: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   10f4: LOD  02 0003     Load word at G3 (OUTPUT)
   10f7: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   10fa: SLDL 01          Short load local MP1
   10fb: SIND 01          Short index load *TOS+1
   10fc: SLDC 0a          Short load constant 10
   10fd: EQUI             Integer TOS-1 = TOS
   10fe: FJP  $1126       Jump if TOS false
   1100: LOD  02 0003     Load word at G3 (OUTPUT)
   1103: LSA  0c          Load string address: 'I/O error # '
   1111: NOP              No operation
   1112: SLDC 00          Short load constant 0
   1113: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1116: LOD  02 0003     Load word at G3 (OUTPUT)
   1119: LOD  02 000a     Load word at G10
   111c: SLDC 00          Short load constant 0
   111d: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   1120: LOD  02 0003     Load word at G3 (OUTPUT)
   1123: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 1126: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC53(PARAM1; PARAM2) (* P=53 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 1132: LOD  01 0001     Load word at G1 (SYSCOM)
   1135: SRO  0003        Store global word BASE3
   1137: SLDO 01          Short load global BASE1
   1138: SLDC 00          Short load constant 0
   1139: NEQI             Integer TOS-1 <> TOS
   113a: FJP  $116a       Jump if TOS false
   113c: SLDO 03          Short load global BASE3
   113d: INC  0024        Inc field ptr (TOS+36)
   113f: SLDO 02          Short load global BASE2
   1140: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   1143: LDP              Load packed field (TOS)
   1144: FJP  $1153       Jump if TOS false
   1146: LOD  01 0003     Load word at G3 (OUTPUT)
   1149: SLDO 03          Short load global BASE3
   114a: INC  001f        Inc field ptr (TOS+31)
   114c: SLDC 08          Short load constant 8
   114d: SLDC 00          Short load constant 0
   114e: LDP              Load packed field (TOS)
   114f: SLDC 00          Short load constant 0
   1150: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 1153: LOD  01 0003     Load word at G3 (OUTPUT)
   1156: SLDO 01          Short load global BASE1
   1157: SLDC 00          Short load constant 0
   1158: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   115b: SLDC 0b          Short load constant 11
   115c: SLDC 00          Short load constant 0
   115d: GRTI             Integer TOS-1 > TOS
   115e: FJP  $116a       Jump if TOS false
   1160: LOD  01 0003     Load word at G3 (OUTPUT)
   1163: LDA  01 0074     Load addr G116
   1166: SLDC 00          Short load constant 0
   1167: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 116a: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC54(PARAM1; PARAM2; PARAM3): RETVAL (* P=54 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM3
  BASE4=PARAM2
  BASE5=PARAM1
  BASE6
  BASE7
BEGIN
-> 1176: SLDC 00          Short load constant 0
   1177: SRO  0001        Store global word BASE1
   1179: LOD  01 0001     Load word at G1 (SYSCOM)
   117c: SRO  0006        Store global word BASE6
   117e: SLDO 06          Short load global BASE6
   117f: INC  001f        Inc field ptr (TOS+31)
   1181: SRO  0007        Store global word BASE7
   1183: SLDO 05          Short load global BASE5
   1184: SLDO 06          Short load global BASE6
   1185: INC  002c        Inc field ptr (TOS+44)
   1187: SLDC 08          Short load constant 8
   1188: SLDC 00          Short load constant 0
   1189: LDP              Load packed field (TOS)
   118a: EQUI             Integer TOS-1 = TOS
   118b: FJP  $11bc       Jump if TOS false
   118d: SLDC 01          Short load constant 1
   118e: SRO  0001        Store global word BASE1
-> 1190: SLDO 04          Short load global BASE4
   1191: SIND 00          Short index load *TOS+0
   1192: SLDC 01          Short load constant 1
   1193: GRTI             Integer TOS-1 > TOS
   1194: FJP  $11b1       Jump if TOS false
   1196: SLDO 04          Short load global BASE4
   1197: SLDO 04          Short load global BASE4
   1198: SIND 00          Short index load *TOS+0
   1199: SLDC 01          Short load constant 1
   119a: SBI              Subtract integers (TOS-1 - TOS)
   119b: STO              Store indirect (TOS into TOS-1)
   119c: SLDO 03          Short load global BASE3
   119d: SLDO 04          Short load global BASE4
   119e: SIND 00          Short index load *TOS+0
   119f: LDB              Load byte at byte ptr TOS-1 + TOS
   11a0: SLDC 20          Short load constant 32
   11a1: GEQI             Integer TOS-1 >= TOS
   11a2: FJP  $11af       Jump if TOS false
   11a4: LOD  01 0003     Load word at G3 (OUTPUT)
   11a7: LDA  01 01b4     Load addr G436
   11ab: SLDC 00          Short load constant 0
   11ac: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 11af: UJP  $1190       Unconditional jump
-> 11b1: SLDC 02          Short load constant 2
   11b2: SLDO 07          Short load global BASE7
   11b3: INC  0001        Inc field ptr (TOS+1)
   11b5: SLDC 08          Short load constant 8
   11b6: SLDC 08          Short load constant 8
   11b7: LDP              Load packed field (TOS)
   11b8: CBP  35          Call base procedure PASCALSY.53
   11ba: UJP  $11e8       Unconditional jump
-> 11bc: SLDO 05          Short load global BASE5
   11bd: SLDO 06          Short load global BASE6
   11be: INC  002b        Inc field ptr (TOS+43)
   11c0: SLDC 08          Short load constant 8
   11c1: SLDC 00          Short load constant 0
   11c2: LDP              Load packed field (TOS)
   11c3: EQUI             Integer TOS-1 = TOS
   11c4: FJP  $11e8       Jump if TOS false
   11c6: SLDC 01          Short load constant 1
   11c7: SRO  0001        Store global word BASE1
   11c9: SLDO 04          Short load global BASE4
   11ca: SIND 00          Short index load *TOS+0
   11cb: SLDC 01          Short load constant 1
   11cc: GRTI             Integer TOS-1 > TOS
   11cd: FJP  $11e8       Jump if TOS false
   11cf: SLDO 04          Short load global BASE4
   11d0: SLDO 04          Short load global BASE4
   11d1: SIND 00          Short index load *TOS+0
   11d2: SLDC 01          Short load constant 1
   11d3: SBI              Subtract integers (TOS-1 - TOS)
   11d4: STO              Store indirect (TOS into TOS-1)
   11d5: SLDO 03          Short load global BASE3
   11d6: SLDO 04          Short load global BASE4
   11d7: SIND 00          Short index load *TOS+0
   11d8: LDB              Load byte at byte ptr TOS-1 + TOS
   11d9: SLDC 20          Short load constant 32
   11da: GEQI             Integer TOS-1 >= TOS
   11db: FJP  $11e8       Jump if TOS false
   11dd: LOD  01 0003     Load word at G3 (OUTPUT)
   11e0: LDA  01 01b8     Load addr G440
   11e4: SLDC 00          Short load constant 0
   11e5: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 11e8: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC55(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5; PARAM6) (* P=55 LL=1 *)
  MP1=PARAM6
  MP2=PARAM5
  MP3=PARAM4
  MP4=PARAM3
  MP5=PARAM2
  MP6=PARAM1
  MP7
  MP8
BEGIN
-> 11f6: SLDL 03          Short load local MP3
   11f7: SLDC 3f          Short load constant 63
   11f8: GRTI             Integer TOS-1 > TOS
   11f9: FJP  $1200       Jump if TOS false
   11fb: SLDC 3f          Short load constant 63
   11fc: STL  0008        Store TOS into MP8
   11fe: UJP  $1203       Unconditional jump
-> 1200: SLDL 03          Short load local MP3
   1201: STL  0008        Store TOS into MP8
-> 1203: SLDL 08          Short load local MP8
   1204: LDCI 0200        Load word 512
   1207: MPI              Multiply integers (TOS * TOS-1)
   1208: STL  0007        Store TOS into MP7
-> 120a: SLDL 03          Short load local MP3
   120b: SLDC 00          Short load constant 0
   120c: NEQI             Integer TOS-1 <> TOS
   120d: FJP  $124e       Jump if TOS false
   120f: SLDL 01          Short load local MP1
   1210: FJP  $121c       Jump if TOS false
   1212: SLDL 06          Short load local MP6
   1213: SLDL 05          Short load local MP5
   1214: SLDL 04          Short load local MP4
   1215: SLDL 07          Short load local MP7
   1216: SLDL 02          Short load local MP2
   1217: SLDC 00          Short load constant 0
   1218: CSP  05          Call standard procedure UNITREAD
   121a: UJP  $1224       Unconditional jump
-> 121c: SLDL 06          Short load local MP6
   121d: SLDL 05          Short load local MP5
   121e: SLDL 04          Short load local MP4
   121f: SLDL 07          Short load local MP7
   1220: SLDL 02          Short load local MP2
   1221: SLDC 00          Short load constant 0
   1222: CSP  06          Call standard procedure UNITWRITE
-> 1224: CSP  22          Call standard procedure IORESULT
   1226: SLDC 00          Short load constant 0
   1227: NEQI             Integer TOS-1 <> TOS
   1228: FJP  $122e       Jump if TOS false
   122a: SLDC 00          Short load constant 0
   122b: SLDC 37          Short load constant 55
   122c: CSP  04          Call standard procedure EXIT
-> 122e: SLDL 03          Short load local MP3
   122f: SLDL 08          Short load local MP8
   1230: SBI              Subtract integers (TOS-1 - TOS)
   1231: STL  0003        Store TOS into MP3
   1233: SLDL 04          Short load local MP4
   1234: SLDL 07          Short load local MP7
   1235: ADI              Add integers (TOS + TOS-1)
   1236: STL  0004        Store TOS into MP4
   1238: SLDL 02          Short load local MP2
   1239: SLDL 08          Short load local MP8
   123a: ADI              Add integers (TOS + TOS-1)
   123b: STL  0002        Store TOS into MP2
   123d: SLDL 03          Short load local MP3
   123e: SLDL 08          Short load local MP8
   123f: LESI             Integer TOS-1 < TOS
   1240: FJP  $124c       Jump if TOS false
   1242: SLDL 03          Short load local MP3
   1243: STL  0008        Store TOS into MP8
   1245: SLDL 08          Short load local MP8
   1246: LDCI 0200        Load word 512
   1249: MPI              Multiply integers (TOS * TOS-1)
   124a: STL  0007        Store TOS into MP7
-> 124c: UJP  $120a       Unconditional jump
-> 124e: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC56 (* P=56 LL=1 *)
  BASE11
BEGIN
-> 125c: LOD  02 017d     Load word at G381
   1260: LOD  02 017f     Load word at G383
   1264: LDB              Load byte at byte ptr TOS-1 + TOS
   1265: SRO  000b        Store global word BASE11
   1267: LOD  02 017f     Load word at G383
   126b: SLDC 01          Short load constant 1
   126c: ADI              Add integers (TOS + TOS-1)
   126d: STR  02 017f     Store TOS to G383
   1271: LOD  02 017f     Load word at G383
   1275: LOD  02 0180     Load word at G384
   1279: GRTI             Integer TOS-1 > TOS
   127a: FJP  $127e       Jump if TOS false
   127c: CBP  2e          Call base procedure PASCALSY.46
-> 127e: SLDO 0b          Short load global BASE11
   127f: LOD  02 018b     Load word at G395
   1283: EQUI             Integer TOS-1 = TOS
   1284: LOD  02 017d     Load word at G381
   1288: LOD  02 017f     Load word at G383
   128c: LDB              Load byte at byte ptr TOS-1 + TOS
   128d: LOD  02 018b     Load word at G395
   1291: EQUI             Integer TOS-1 = TOS
   1292: LAND             Logical AND (TOS & TOS-1)
   1293: FJP  $1298       Jump if TOS false
   1295: SLDC 01          Short load constant 1
   1296: CBP  2d          Call base procedure PASCALSY.45
-> 1298: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC57 (* P=57 LL=1 *)
  MP1
BEGIN
-> 12a4: UJP  $1382       Unconditional jump
-> 12a6: LOD  02 0184     Load word at G388
   12aa: LNOT             Logical NOT (~TOS)
   12ab: FJP  $1304       Jump if TOS false
   12ad: CBP  32          Call base procedure PASCALSY.50
   12af: LOD  02 0045     Load word at G69
   12b2: SLDC 00          Short load constant 0
   12b3: SLDC 00          Short load constant 0
   12b4: CXP  05 01       Call external procedure GETCMD.1
   12b7: STR  02 0045     Store TOS to G69
   12ba: LDA  02 0148     Load addr G328
   12be: NOP              No operation
   12bf: LSA  00          Load string address: ''
   12c1: SAS  17          String assign (TOS to TOS-1, 23 chars)
   12c3: LOD  02 0045     Load word at G69
   12c6: UJP  $12eb       Unconditional jump
   12c8: LOD  02 0186     Load word at G390
   12cc: LNOT             Logical NOT (~TOS)
   12cd: LOD  02 0188     Load word at G392
   12d1: LOR              Logical OR (TOS | TOS-1)
   12d2: FJP  $12e0       Jump if TOS false
   12d4: SLDC 00          Short load constant 0
   12d5: STR  02 0188     Store TOS to G392
   12d9: LDCN             Load constant NIL
   12da: LDCN             Load constant NIL
   12db: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   12de: UJP  $12e9       Unconditional jump
-> 12e0: SLDC 01          Short load constant 1
   12e1: STR  02 0184     Store TOS to G388
   12e5: SLDC 00          Short load constant 0
   12e6: SLDC 39          Short load constant 57
   12e7: CSP  04          Call standard procedure EXIT
-> 12e9: UJP  $1304       Unconditional jump
-> 1304: LOD  02 0045     Load word at G69
   1307: LDCI 07fc        Load word 2044
   130a: SLDC 01          Short load constant 1
   130b: INN              Set membership (TOS-1 in set TOS)
   130c: FJP  $1320       Jump if TOS false
   130e: SLDC 00          Short load constant 0
   130f: STR  02 0184     Store TOS to G388
   1313: SLDC 03          Short load constant 3
   1314: CSP  26          Call standard procedure UNITCLEAR
   1316: LOD  02 0001     Load word at G1 (SYSCOM)
   1319: SIND 02          Short index load *TOS+2
   131a: SLDC 00          Short load constant 0
   131b: SLDC 00          Short load constant 0
   131c: CBP  2a          Call base procedure PASCALSY.42
   131e: FJP  $1320       Jump if TOS false
-> 1320: LOD  02 0045     Load word at G69
   1323: LDCI 00e0        Load word 224
   1326: SLDC 01          Short load constant 1
   1327: INN              Set membership (TOS-1 in set TOS)
   1328: FJP  $134e       Jump if TOS false
   132a: LOD  02 000a     Load word at G10
   132d: SLDC 00          Short load constant 0
   132e: EQUI             Integer TOS-1 = TOS
   132f: FJP  $134e       Jump if TOS false
   1331: LOD  02 0008     Load word at G8
   1334: SLDC 01          Short load constant 1
   1335: CBP  06          Call base procedure PASCALSY.FCLOSE
   1337: CSP  22          Call standard procedure IORESULT
   1339: SLDC 00          Short load constant 0
   133a: NEQI             Integer TOS-1 <> TOS
   133b: FJP  $134e       Jump if TOS false
   133d: CSP  22          Call standard procedure IORESULT
   133f: STL  0001        Store TOS into MP1
   1341: LOD  02 0003     Load word at G3 (OUTPUT)
   1344: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1347: CBP  26          Call base procedure PASCALSY.38
   1349: SLDC 0a          Short load constant 10
   134a: SLDL 01          Short load local MP1
   134b: CXP  03 01       Call external procedure PRINTERR.PRINTERROR
-> 134e: LOD  02 0045     Load word at G69
   1351: SLDC 0c          Short load constant 12
   1352: SLDC 01          Short load constant 1
   1353: INN              Set membership (TOS-1 in set TOS)
   1354: FJP  $136a       Jump if TOS false
   1356: LDA  02 0002     Load addr G2 (INPUT)
   1359: SLDC 00          Short load constant 0
   135a: IXA  0001        Index array (TOS-1 + TOS * 1)
   135c: SIND 00          Short index load *TOS+0
   135d: SLDC 00          Short load constant 0
   135e: CBP  06          Call base procedure PASCALSY.FCLOSE
   1360: LDA  02 0002     Load addr G2 (INPUT)
   1363: SLDC 01          Short load constant 1
   1364: IXA  0001        Index array (TOS-1 + TOS * 1)
   1366: SIND 00          Short index load *TOS+0
   1367: SLDC 01          Short load constant 1
   1368: CBP  06          Call base procedure PASCALSY.FCLOSE
-> 136a: SLDC 01          Short load constant 1
   136b: CSP  23          Call standard procedure UNITBUSY
   136d: SLDC 02          Short load constant 2
   136e: CSP  23          Call standard procedure UNITBUSY
   1370: LOR              Logical OR (TOS | TOS-1)
   1371: FJP  $1376       Jump if TOS false
   1373: SLDC 01          Short load constant 1
   1374: CSP  26          Call standard procedure UNITCLEAR
-> 1376: LOD  02 0045     Load word at G69
   1379: SLDC 00          Short load constant 0
   137a: EQUI             Integer TOS-1 = TOS
   137b: FJP  $12a6       Jump if TOS false
-> 137d: SLDC 06          Short load constant 6
   137e: CSP  16          Call standard procedure UNLOADSEGMENT
   1380: UJP  $1387       Unconditional jump
-> 1382: SLDC 06          Short load constant 6
   1383: CSP  15          Call standard procedure LOADSEGMENT
   1385: UJP  $12a6       Unconditional jump
-> 1387: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC58 (* P=58 LL=1 *)
BEGIN
-> 139a: UJP  $13c3       Unconditional jump
-> 139c: CBP  32          Call base procedure PASCALSY.50
   139e: CGP  39          Call global procedure PASCALSY.57
   13a0: LOD  02 0185     Load word at G389
   13a4: LNOT             Logical NOT (~TOS)
   13a5: LOD  02 0184     Load word at G388
   13a9: LAND             Logical AND (TOS & TOS-1)
   13aa: FJP  $13b3       Jump if TOS false
   13ac: LDCN             Load constant NIL
   13ad: LDCN             Load constant NIL
   13ae: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   13b1: UJP  $13b7       Unconditional jump
-> 13b3: SLDC 00          Short load constant 0
   13b4: SLDC 3a          Short load constant 58
   13b5: CSP  04          Call standard procedure EXIT
-> 13b7: LOD  02 0045     Load word at G69
   13ba: SLDC 00          Short load constant 0
   13bb: EQUI             Integer TOS-1 = TOS
   13bc: FJP  $139c       Jump if TOS false
-> 13be: SLDC 02          Short load constant 2
   13bf: CSP  16          Call standard procedure UNLOADSEGMENT
   13c1: UJP  $13c8       Unconditional jump
-> 13c3: SLDC 02          Short load constant 2
   13c4: CSP  15          Call standard procedure LOADSEGMENT
   13c6: UJP  $139c       Unconditional jump
-> 13c8: RNP  00          Return from nonbase procedure
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
-> 0304: RNP  00          Return from nonbase procedure
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
BEGIN
-> 00e0: SLDL 03          Short load local MP3
   00e1: CXP  00 07       Call external procedure PASCALSY.FGET
   00e4: SLDL 03          Short load local MP3
   00e5: STL  0004        Store TOS into MP4
   00e7: SLDL 04          Short load local MP4
   00e8: SIND 00          Short index load *TOS+0
   00e9: SLDC 00          Short load constant 0
   00ea: LDB              Load byte at byte ptr TOS-1 + TOS
   00eb: SLDC 20          Short load constant 32
   00ec: GRTI             Integer TOS-1 > TOS
   00ed: FJP  $0103       Jump if TOS false
   00ef: SLDL 04          Short load local MP4
   00f0: INC  000e        Inc field ptr (TOS+14)
   00f2: SLDL 04          Short load local MP4
   00f3: SIND 00          Short index load *TOS+0
   00f4: SLDC 00          Short load constant 0
   00f5: LDB              Load byte at byte ptr TOS-1 + TOS
   00f6: SLDC 20          Short load constant 32
   00f7: SBI              Subtract integers (TOS-1 - TOS)
   00f8: STO              Store indirect (TOS into TOS-1)
   00f9: SLDL 04          Short load local MP4
   00fa: SIND 00          Short index load *TOS+0
   00fb: SLDC 00          Short load constant 0
   00fc: SLDC 20          Short load constant 32
   00fd: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   00fe: SLDC 01          Short load constant 1
   00ff: STL  0001        Store TOS into MP1
   0101: UJP  $010a       Unconditional jump
-> 0103: SLDL 03          Short load local MP3
   0104: CXP  00 07       Call external procedure PASCALSY.FGET
   0107: SLDC 00          Short load constant 0
   0108: STL  0001        Store TOS into MP1
-> 010a: RNP  01          Return from nonbase procedure
END

### PROCEDURE FIOPRIMS.PROC4(PARAM1) (* P=4 LL=1 *)
  MP1=PARAM1
  MP2
  MP292
BEGIN
-> 0116: LLA  0002        Load local address MP2
   0118: SLDL 01          Short load local MP1
   0119: MOV  0122        Move 290 words (TOS to TOS-1)
   011c: SLDL 01          Short load local MP1
   011d: STL  0124        Store TOS into MP292
   0120: LDL  0124        Load local word MP292
   0123: IND  000d        Static index and load word (TOS+13)
   0125: FJP  $0134       Jump if TOS false
   0127: LDL  0124        Load local word MP292
   012a: INC  000d        Inc field ptr (TOS+13)
   012c: LDL  0124        Load local word MP292
   012f: IND  000d        Static index and load word (TOS+13)
   0131: SLDC 01          Short load constant 1
   0132: ADI              Add integers (TOS + TOS-1)
   0133: STO              Store indirect (TOS into TOS-1)
-> 0134: LDL  0124        Load local word MP292
   0137: INC  001f        Inc field ptr (TOS+31)
   0139: LDCI 0200        Load word 512
   013c: STO              Store indirect (TOS into TOS-1)
   013d: SLDL 01          Short load local MP1
   013e: CXP  00 07       Call external procedure PASCALSY.FGET
   0141: LDL  0124        Load local word MP292
   0144: SIND 02          Short index load *TOS+2
   0145: FJP  $0168       Jump if TOS false
   0147: SLDL 01          Short load local MP1
   0148: LLA  0002        Load local address MP2
   014a: MOV  0122        Move 290 words (TOS to TOS-1)
   014d: LDL  0124        Load local word MP292
   0150: INC  0002        Inc field ptr (TOS+2)
   0152: SLDC 01          Short load constant 1
   0153: STO              Store indirect (TOS into TOS-1)
   0154: LDL  0124        Load local word MP292
   0157: INC  0001        Inc field ptr (TOS+1)
   0159: SLDC 01          Short load constant 1
   015a: STO              Store indirect (TOS into TOS-1)
   015b: LDL  0124        Load local word MP292
   015e: INC  001f        Inc field ptr (TOS+31)
   0160: LDL  0124        Load local word MP292
   0163: IND  001f        Static index and load word (TOS+31)
   0165: SLDC 01          Short load constant 1
   0166: SBI              Subtract integers (TOS-1 - TOS)
   0167: STO              Store indirect (TOS into TOS-1)
-> 0168: RNP  00          Return from nonbase procedure
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
-> 0174: SLDC 01          Short load constant 1
   0175: STL  0001        Store TOS into MP1
   0177: SLDL 03          Short load local MP3
   0178: STL  0009        Store TOS into MP9
   017a: SLDL 09          Short load local MP9
   017b: INC  0010        Inc field ptr (TOS+16)
   017d: STL  000a        Store TOS into MP10
   017f: SLDL 09          Short load local MP9
   0180: SIND 04          Short index load *TOS+4
   0181: STL  0007        Store TOS into MP7
   0183: SLDC 00          Short load constant 0
   0184: STL  0006        Store TOS into MP6
-> 0186: SLDL 0a          Short load local MP10
   0187: SIND 00          Short index load *TOS+0
   0188: SLDL 09          Short load local MP9
   0189: IND  000d        Static index and load word (TOS+13)
   018b: ADI              Add integers (TOS + TOS-1)
   018c: SLDL 0a          Short load local MP10
   018d: SIND 01          Short index load *TOS+1
   018e: EQUI             Integer TOS-1 = TOS
   018f: SLDL 09          Short load local MP9
   0190: IND  001f        Static index and load word (TOS+31)
   0192: SLDL 07          Short load local MP7
   0193: ADI              Add integers (TOS + TOS-1)
   0194: SLDL 0a          Short load local MP10
   0195: IND  000b        Static index and load word (TOS+11)
   0197: GRTI             Integer TOS-1 > TOS
   0198: LAND             Logical AND (TOS & TOS-1)
   0199: FJP  $01aa       Jump if TOS false
   019b: SLDL 03          Short load local MP3
   019c: SLDC 00          Short load constant 0
   019d: SLDC 00          Short load constant 0
   019e: CXP  00 31       Call external procedure PASCALSY.49
   01a1: FJP  $01aa       Jump if TOS false
   01a3: LOD  02 0001     Load word at G1 (SYSCOM)
   01a6: SLDC 08          Short load constant 8
   01a7: STO              Store indirect (TOS into TOS-1)
   01a8: UJP  $02f3       Unconditional jump
-> 01aa: SLDL 0a          Short load local MP10
   01ab: SIND 00          Short index load *TOS+0
   01ac: SLDL 09          Short load local MP9
   01ad: IND  000d        Static index and load word (TOS+13)
   01af: ADI              Add integers (TOS + TOS-1)
   01b0: SLDL 0a          Short load local MP10
   01b1: SIND 01          Short index load *TOS+1
   01b2: EQUI             Integer TOS-1 = TOS
   01b3: FJP  $01d4       Jump if TOS false
   01b5: SLDL 09          Short load local MP9
   01b6: IND  001f        Static index and load word (TOS+31)
   01b8: SLDL 07          Short load local MP7
   01b9: ADI              Add integers (TOS + TOS-1)
   01ba: SLDL 0a          Short load local MP10
   01bb: IND  000b        Static index and load word (TOS+11)
   01bd: GRTI             Integer TOS-1 > TOS
   01be: FJP  $01c9       Jump if TOS false
   01c0: LOD  02 0001     Load word at G1 (SYSCOM)
   01c3: SLDC 08          Short load constant 8
   01c4: STO              Store indirect (TOS into TOS-1)
   01c5: UJP  $02f3       Unconditional jump
   01c7: UJP  $01d2       Unconditional jump
-> 01c9: SLDL 0a          Short load local MP10
   01ca: IND  000b        Static index and load word (TOS+11)
   01cc: SLDL 09          Short load local MP9
   01cd: IND  001f        Static index and load word (TOS+31)
   01cf: SBI              Subtract integers (TOS-1 - TOS)
   01d0: STL  0005        Store TOS into MP5
-> 01d2: UJP  $01dd       Unconditional jump
-> 01d4: LDCI 0200        Load word 512
   01d7: SLDL 09          Short load local MP9
   01d8: IND  001f        Static index and load word (TOS+31)
   01da: SBI              Subtract integers (TOS-1 - TOS)
   01db: STL  0005        Store TOS into MP5
-> 01dd: SLDL 07          Short load local MP7
   01de: STL  0004        Store TOS into MP4
   01e0: SLDL 04          Short load local MP4
   01e1: SLDL 05          Short load local MP5
   01e2: GRTI             Integer TOS-1 > TOS
   01e3: FJP  $01e8       Jump if TOS false
   01e5: SLDL 05          Short load local MP5
   01e6: STL  0004        Store TOS into MP4
-> 01e8: SLDL 04          Short load local MP4
   01e9: SLDC 00          Short load constant 0
   01ea: GRTI             Integer TOS-1 > TOS
   01eb: FJP  $0211       Jump if TOS false
   01ed: SLDL 09          Short load local MP9
   01ee: INC  0020        Inc field ptr (TOS+32)
   01f0: SLDC 01          Short load constant 1
   01f1: STO              Store indirect (TOS into TOS-1)
   01f2: SLDL 09          Short load local MP9
   01f3: SIND 00          Short index load *TOS+0
   01f4: SLDL 06          Short load local MP6
   01f5: SLDL 09          Short load local MP9
   01f6: INC  0021        Inc field ptr (TOS+33)
   01f8: SLDL 09          Short load local MP9
   01f9: IND  001f        Static index and load word (TOS+31)
   01fb: SLDL 04          Short load local MP4
   01fc: CSP  02          Call standard procedure MOVL
   01fe: SLDL 09          Short load local MP9
   01ff: INC  001f        Inc field ptr (TOS+31)
   0201: SLDL 09          Short load local MP9
   0202: IND  001f        Static index and load word (TOS+31)
   0204: SLDL 04          Short load local MP4
   0205: ADI              Add integers (TOS + TOS-1)
   0206: STO              Store indirect (TOS into TOS-1)
   0207: SLDL 06          Short load local MP6
   0208: SLDL 04          Short load local MP4
   0209: ADI              Add integers (TOS + TOS-1)
   020a: STL  0006        Store TOS into MP6
   020c: SLDL 07          Short load local MP7
   020d: SLDL 04          Short load local MP4
   020e: SBI              Subtract integers (TOS-1 - TOS)
   020f: STL  0007        Store TOS into MP7
-> 0211: SLDL 07          Short load local MP7
   0212: SLDC 00          Short load constant 0
   0213: EQUI             Integer TOS-1 = TOS
   0214: STL  0008        Store TOS into MP8
   0216: SLDL 08          Short load local MP8
   0217: LNOT             Logical NOT (~TOS)
   0218: FJP  $0282       Jump if TOS false
   021a: SLDL 09          Short load local MP9
   021b: IND  0020        Static index and load word (TOS+32)
   021d: FJP  $023d       Jump if TOS false
   021f: SLDL 09          Short load local MP9
   0220: INC  0020        Inc field ptr (TOS+32)
   0222: SLDC 00          Short load constant 0
   0223: STO              Store indirect (TOS into TOS-1)
   0224: SLDL 09          Short load local MP9
   0225: INC  000f        Inc field ptr (TOS+15)
   0227: SLDC 01          Short load constant 1
   0228: STO              Store indirect (TOS into TOS-1)
   0229: SLDL 09          Short load local MP9
   022a: SIND 07          Short index load *TOS+7
   022b: SLDL 09          Short load local MP9
   022c: INC  0021        Inc field ptr (TOS+33)
   022e: SLDC 00          Short load constant 0
   022f: LDCI 0200        Load word 512
   0232: SLDL 0a          Short load local MP10
   0233: SIND 00          Short index load *TOS+0
   0234: SLDL 09          Short load local MP9
   0235: IND  000d        Static index and load word (TOS+13)
   0237: ADI              Add integers (TOS + TOS-1)
   0238: SLDC 01          Short load constant 1
   0239: SBI              Subtract integers (TOS-1 - TOS)
   023a: SLDC 00          Short load constant 0
   023b: CSP  06          Call standard procedure UNITWRITE
-> 023d: CSP  22          Call standard procedure IORESULT
   023f: SLDC 00          Short load constant 0
   0240: NEQI             Integer TOS-1 <> TOS
   0241: FJP  $0245       Jump if TOS false
   0243: UJP  $02f3       Unconditional jump
-> 0245: SLDL 09          Short load local MP9
   0246: IND  000d        Static index and load word (TOS+13)
   0248: SLDL 09          Short load local MP9
   0249: IND  000c        Static index and load word (TOS+12)
   024b: LESI             Integer TOS-1 < TOS
   024c: FJP  $0262       Jump if TOS false
   024e: SLDL 09          Short load local MP9
   024f: SIND 07          Short index load *TOS+7
   0250: SLDL 09          Short load local MP9
   0251: INC  0021        Inc field ptr (TOS+33)
   0253: SLDC 00          Short load constant 0
   0254: LDCI 0200        Load word 512
   0257: SLDL 0a          Short load local MP10
   0258: SIND 00          Short index load *TOS+0
   0259: SLDL 09          Short load local MP9
   025a: IND  000d        Static index and load word (TOS+13)
   025c: ADI              Add integers (TOS + TOS-1)
   025d: SLDC 00          Short load constant 0
   025e: CSP  05          Call standard procedure UNITREAD
   0260: UJP  $026c       Unconditional jump
-> 0262: SLDL 09          Short load local MP9
   0263: INC  0021        Inc field ptr (TOS+33)
   0265: SLDC 00          Short load constant 0
   0266: LDCI 0200        Load word 512
   0269: SLDC 00          Short load constant 0
   026a: CSP  0a          Call standard procedure FLCH
-> 026c: CSP  22          Call standard procedure IORESULT
   026e: SLDC 00          Short load constant 0
   026f: NEQI             Integer TOS-1 <> TOS
   0270: FJP  $0274       Jump if TOS false
   0272: UJP  $02f3       Unconditional jump
-> 0274: SLDL 09          Short load local MP9
   0275: INC  000d        Inc field ptr (TOS+13)
   0277: SLDL 09          Short load local MP9
   0278: IND  000d        Static index and load word (TOS+13)
   027a: SLDC 01          Short load constant 1
   027b: ADI              Add integers (TOS + TOS-1)
   027c: STO              Store indirect (TOS into TOS-1)
   027d: SLDL 09          Short load local MP9
   027e: INC  001f        Inc field ptr (TOS+31)
   0280: SLDC 00          Short load constant 0
   0281: STO              Store indirect (TOS into TOS-1)
-> 0282: SLDL 08          Short load local MP8
   0283: FJP  $0186       Jump if TOS false
   0285: SLDL 09          Short load local MP9
   0286: IND  000d        Static index and load word (TOS+13)
   0288: SLDL 09          Short load local MP9
   0289: IND  000c        Static index and load word (TOS+12)
   028b: GRTI             Integer TOS-1 > TOS
   028c: FJP  $029e       Jump if TOS false
   028e: SLDL 09          Short load local MP9
   028f: INC  001e        Inc field ptr (TOS+30)
   0291: SLDL 09          Short load local MP9
   0292: IND  001f        Static index and load word (TOS+31)
   0294: STO              Store indirect (TOS into TOS-1)
   0295: SLDL 09          Short load local MP9
   0296: INC  000c        Inc field ptr (TOS+12)
   0298: SLDL 09          Short load local MP9
   0299: IND  000d        Static index and load word (TOS+13)
   029b: STO              Store indirect (TOS into TOS-1)
   029c: UJP  $02b6       Unconditional jump
-> 029e: SLDL 09          Short load local MP9
   029f: IND  000d        Static index and load word (TOS+13)
   02a1: SLDL 09          Short load local MP9
   02a2: IND  000c        Static index and load word (TOS+12)
   02a4: EQUI             Integer TOS-1 = TOS
   02a5: SLDL 09          Short load local MP9
   02a6: IND  001f        Static index and load word (TOS+31)
   02a8: SLDL 09          Short load local MP9
   02a9: IND  001e        Static index and load word (TOS+30)
   02ab: GRTI             Integer TOS-1 > TOS
   02ac: LAND             Logical AND (TOS & TOS-1)
   02ad: FJP  $02b6       Jump if TOS false
   02af: SLDL 09          Short load local MP9
   02b0: INC  001e        Inc field ptr (TOS+30)
   02b2: SLDL 09          Short load local MP9
   02b3: IND  001f        Static index and load word (TOS+31)
   02b5: STO              Store indirect (TOS into TOS-1)
-> 02b6: SLDL 09          Short load local MP9
   02b7: SIND 04          Short index load *TOS+4
   02b8: SLDC 01          Short load constant 1
   02b9: EQUI             Integer TOS-1 = TOS
   02ba: FJP  $02f0       Jump if TOS false
   02bc: SLDL 09          Short load local MP9
   02bd: SIND 00          Short index load *TOS+0
   02be: SLDC 00          Short load constant 0
   02bf: LDB              Load byte at byte ptr TOS-1 + TOS
   02c0: SLDC 0d          Short load constant 13
   02c1: EQUI             Integer TOS-1 = TOS
   02c2: FJP  $02f0       Jump if TOS false
   02c4: SLDL 0a          Short load local MP10
   02c5: INC  0002        Inc field ptr (TOS+2)
   02c7: SLDC 04          Short load constant 4
   02c8: SLDC 00          Short load constant 0
   02c9: LDP              Load packed field (TOS)
   02ca: SLDC 03          Short load constant 3
   02cb: EQUI             Integer TOS-1 = TOS
   02cc: FJP  $02f0       Jump if TOS false
   02ce: SLDL 09          Short load local MP9
   02cf: IND  001f        Static index and load word (TOS+31)
   02d1: LDCI 0200        Load word 512
   02d4: SLDC 7f          Short load constant 127
   02d5: SBI              Subtract integers (TOS-1 - TOS)
   02d6: GEQI             Integer TOS-1 >= TOS
   02d7: SLDL 09          Short load local MP9
   02d8: IND  000d        Static index and load word (TOS+13)
   02da: LNOT             Logical NOT (~TOS)
   02db: LAND             Logical AND (TOS & TOS-1)
   02dc: FJP  $02f0       Jump if TOS false
   02de: SLDL 09          Short load local MP9
   02df: INC  001f        Inc field ptr (TOS+31)
   02e1: LDCI 0200        Load word 512
   02e4: SLDC 01          Short load constant 1
   02e5: SBI              Subtract integers (TOS-1 - TOS)
   02e6: STO              Store indirect (TOS into TOS-1)
   02e7: SLDL 09          Short load local MP9
   02e8: SIND 00          Short index load *TOS+0
   02e9: SLDC 00          Short load constant 0
   02ea: SLDC 00          Short load constant 0
   02eb: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   02ec: SLDL 03          Short load local MP3
   02ed: CXP  00 08       Call external procedure PASCALSY.FPUT
-> 02f0: SLDC 00          Short load constant 0
   02f1: STL  0001        Store TOS into MP1
-> 02f3: RNP  01          Return from nonbase procedure
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
   001e: UJP  $0434       Unconditional jump
   0020: LAO  0003        Load global BASE3
   0022: NOP              No operation
   0023: LSA  11          Load string address: 'Value range error'
   0036: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0038: UJP  $045c       Unconditional jump
   003a: LAO  0003        Load global BASE3
   003c: NOP              No operation
   003d: LSA  1d          Load string address: 'No procedure in segment-table'
   005c: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   005e: UJP  $045c       Unconditional jump
   0060: LAO  0003        Load global BASE3
   0062: NOP              No operation
   0063: LSA  1c          Load string address: 'Exit from uncalled procedure'
   0081: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0083: UJP  $045c       Unconditional jump
   0085: LAO  0003        Load global BASE3
   0087: LSA  0e          Load string address: 'Stack overflow'
   0097: NOP              No operation
   0098: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   009a: UJP  $045c       Unconditional jump
   009c: LAO  0003        Load global BASE3
   009e: NOP              No operation
   009f: LSA  10          Load string address: 'Integer overflow'
   00b1: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   00b3: UJP  $045c       Unconditional jump
   00b5: LAO  0003        Load global BASE3
   00b7: LSA  0e          Load string address: 'Divide by zero'
   00c7: NOP              No operation
   00c8: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   00ca: UJP  $045c       Unconditional jump
   00cc: LAO  0003        Load global BASE3
   00ce: NOP              No operation
   00cf: LSA  15          Load string address: 'NIL pointer reference'
   00e6: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   00e8: UJP  $045c       Unconditional jump
   00ea: LAO  0003        Load global BASE3
   00ec: NOP              No operation
   00ed: LSA  1b          Load string address: 'Program interrupted by user'
   010a: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   010c: UJP  $045c       Unconditional jump
   010e: LAO  0003        Load global BASE3
   0110: NOP              No operation
   0111: LSA  10          Load string address: 'System I/O error'
   0123: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0125: UJP  $045c       Unconditional jump
   0127: LAO  0003        Load global BASE3
   0129: LSA  0d          Load string address: 'unknown cause'
   0138: NOP              No operation
   0139: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   013b: SLDO 01          Short load global BASE1
   013c: UJP  $0344       Unconditional jump
   013e: LAO  0003        Load global BASE3
   0140: NOP              No operation
   0141: LSA  0c          Load string address: 'parity (CRC)'
   014f: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0151: UJP  $0374       Unconditional jump
   0153: LAO  0003        Load global BASE3
   0155: LSA  10          Load string address: 'illegal volume #'
   0167: NOP              No operation
   0168: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   016a: UJP  $0374       Unconditional jump
   016c: LAO  0003        Load global BASE3
   016e: NOP              No operation
   016f: LSA  13          Load string address: 'illegal I/O request'
   0184: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0186: UJP  $0374       Unconditional jump
   0188: LAO  0003        Load global BASE3
   018a: NOP              No operation
   018b: LSA  10          Load string address: 'data-com timeout'
   019d: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   019f: UJP  $0374       Unconditional jump
   01a1: LAO  0003        Load global BASE3
   01a3: LSA  14          Load string address: 'volume went off-line'
   01b9: NOP              No operation
   01ba: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   01bc: UJP  $0374       Unconditional jump
   01be: LAO  0003        Load global BASE3
   01c0: NOP              No operation
   01c1: LSA  16          Load string address: 'file lost in directory'
   01d9: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   01db: UJP  $0374       Unconditional jump
   01dd: LAO  0003        Load global BASE3
   01df: LSA  0d          Load string address: 'bad file name'
   01ee: NOP              No operation
   01ef: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   01f1: UJP  $0374       Unconditional jump
   01f3: LAO  0003        Load global BASE3
   01f5: LSA  11          Load string address: 'no room on volume'
   0208: NOP              No operation
   0209: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   020b: UJP  $0374       Unconditional jump
   020d: LAO  0003        Load global BASE3
   020f: LSA  10          Load string address: 'volume not found'
   0221: NOP              No operation
   0222: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0224: UJP  $0374       Unconditional jump
   0226: LAO  0003        Load global BASE3
   0228: NOP              No operation
   0229: LSA  0e          Load string address: 'file not found'
   0239: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   023b: UJP  $0374       Unconditional jump
   023d: LAO  0003        Load global BASE3
   023f: LSA  19          Load string address: 'duplicate directory entry'
   025a: NOP              No operation
   025b: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   025d: UJP  $0374       Unconditional jump
   025f: LAO  0003        Load global BASE3
   0261: LSA  11          Load string address: 'file already open'
   0274: NOP              No operation
   0275: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0277: UJP  $0374       Unconditional jump
   0279: LAO  0003        Load global BASE3
   027b: LSA  0d          Load string address: 'file not open'
   028a: NOP              No operation
   028b: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   028d: UJP  $0374       Unconditional jump
   028f: LAO  0003        Load global BASE3
   0291: LSA  10          Load string address: 'bad input format'
   02a3: NOP              No operation
   02a4: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   02a6: UJP  $0374       Unconditional jump
   02a8: LAO  0003        Load global BASE3
   02aa: NOP              No operation
   02ab: LSA  14          Load string address: 'disk write protected'
   02c1: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   02c3: UJP  $0374       Unconditional jump
   02c5: LAO  0003        Load global BASE3
   02c7: LSA  0f          Load string address: 'illegal block #'
   02d8: NOP              No operation
   02d9: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   02db: UJP  $0374       Unconditional jump
   02dd: LAO  0003        Load global BASE3
   02df: LSA  16          Load string address: 'illegal buffer address'
   02f7: NOP              No operation
   02f8: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   02fa: UJP  $0374       Unconditional jump
   02fc: LAO  0003        Load global BASE3
   02fe: NOP              No operation
   02ff: LSA  21          Load string address: 'must read a multiple of 512 bytes'
   0322: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0324: UJP  $0374       Unconditional jump
   0326: LAO  0003        Load global BASE3
   0328: NOP              No operation
   0329: LSA  15          Load string address: 'unknown ProFile error'
   0340: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0342: UJP  $0374       Unconditional jump
-> 0374: NOP              No operation
   0375: LSA  0b          Load string address: 'I/O error: '
   0382: LAO  0003        Load global BASE3
   0384: SLDC 2d          Short load constant 45
   0385: SLDC 01          Short load constant 1
   0386: CXP  00 18       Call external procedure PASCALSY.SINSERT
   0389: UJP  $045c       Unconditional jump
   038b: LAO  0003        Load global BASE3
   038d: LSA  19          Load string address: 'Unimplemented instruction'
   03a8: NOP              No operation
   03a9: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   03ab: UJP  $045c       Unconditional jump
   03ad: LAO  0003        Load global BASE3
   03af: LSA  14          Load string address: 'Floating point error'
   03c5: NOP              No operation
   03c6: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   03c8: UJP  $045c       Unconditional jump
   03ca: LAO  0003        Load global BASE3
   03cc: NOP              No operation
   03cd: LSA  0f          Load string address: 'String overflow'
   03de: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   03e0: UJP  $045c       Unconditional jump
   03e2: LAO  0003        Load global BASE3
   03e4: NOP              No operation
   03e5: LSA  0f          Load string address: 'Programmed HALT'
   03f6: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   03f8: UJP  $045c       Unconditional jump
   03fa: LAO  0003        Load global BASE3
   03fc: NOP              No operation
   03fd: LSA  16          Load string address: 'Programmed break-point'
   0415: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0417: UJP  $045c       Unconditional jump
   0419: LAO  0003        Load global BASE3
   041b: LSA  12          Load string address: 'Codespace overflow'
   042f: NOP              No operation
   0430: SAS  2d          String assign (TOS to TOS-1, 45 chars)
   0432: UJP  $045c       Unconditional jump
-> 045c: LOD  01 0003     Load word at G3 (OUTPUT)
   045f: LAO  0003        Load global BASE3
   0461: SLDC 00          Short load constant 0
   0462: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0465: LOD  01 0003     Load word at G3 (OUTPUT)
   0468: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 046b: RBP  00          Return from base procedure
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
-> 07b6: UJP  $0c10       Unconditional jump
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
   08fc: SLDC 04          Short load constant 4
   08fd: NEQI             Integer TOS-1 <> TOS
   08fe: FJP  $097c       Jump if TOS false
   0900: LOD  01 0003     Load word at G3 (OUTPUT)
   0903: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0906: LOD  01 0003     Load word at G3 (OUTPUT)
   0909: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   090c: LOD  01 0003     Load word at G3 (OUTPUT)
   090f: LSA  27          Load string address: 'Version 1.3 of SYSTEM.PASCAL cannot run'
   0938: NOP              No operation
   0939: SLDC 00          Short load constant 0
   093a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   093d: LOD  01 0003     Load word at G3 (OUTPUT)
   0940: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0943: LOD  01 0003     Load word at G3 (OUTPUT)
   0946: NOP              No operation
   0947: LSA  26          Load string address: 'with a non-1.3 version of SYSTEM.APPLE'
   096f: SLDC 00          Short load constant 0
   0970: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0973: LOD  01 0003     Load word at G3 (OUTPUT)
   0976: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0979: SLDC 00          Short load constant 0
   097a: FJP  $0979       Jump if TOS false
-> 097c: LDCI 40de        Load word 16606
   097f: NGI              Negate integer
   0980: SRO  0039        Store global word BASE57
   0982: LDO  0039        Load global word BASE57
   0984: SLDC 06          Short load constant 6
   0985: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0988: LDP              Load packed field (TOS)
   0989: SRO  0038        Store global word BASE56
   098b: LDO  0038        Load global word BASE56
   098d: LNOT             Logical NOT (~TOS)
   098e: FJP  $0a10       Jump if TOS false
   0990: LOD  01 0003     Load word at G3 (OUTPUT)
   0993: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0996: LOD  01 0003     Load word at G3 (OUTPUT)
   0999: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   099c: LOD  01 0003     Load word at G3 (OUTPUT)
   099f: LSA  29          Load string address: 'The 128K version of SYSTEM.PASCAL cannot '
   09ca: NOP              No operation
   09cb: SLDC 00          Short load constant 0
   09cc: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09cf: LOD  01 0003     Load word at G3 (OUTPUT)
   09d2: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   09d5: LOD  01 0003     Load word at G3 (OUTPUT)
   09d8: NOP              No operation
   09d9: LSA  28          Load string address: 'run with the 64K version of SYSTEM.APPLE'
   0a03: SLDC 00          Short load constant 0
   0a04: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a07: LOD  01 0003     Load word at G3 (OUTPUT)
   0a0a: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0a0d: SLDC 00          Short load constant 0
   0a0e: FJP  $0a0d       Jump if TOS false
-> 0a10: LOD  01 0003     Load word at G3 (OUTPUT)
   0a13: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a16: LOD  01 0189     Load word at G393
   0a1a: FJP  $0be6       Jump if TOS false
   0a1c: LDO  0037        Load global word BASE55
   0a1e: LNOT             Logical NOT (~TOS)
   0a1f: FJP  $0be4       Jump if TOS false
   0a21: LOD  01 0001     Load word at G1 (SYSCOM)
   0a24: SRO  003a        Store global word BASE58
   0a26: LDO  003a        Load global word BASE58
   0a28: INC  001d        Inc field ptr (TOS+29)
   0a2a: SLDC 01          Short load constant 1
   0a2b: SLDC 03          Short load constant 3
   0a2c: LDP              Load packed field (TOS)
   0a2d: FJP  $0a48       Jump if TOS false
   0a2f: SLDC 00          Short load constant 0
   0a30: LDO  003a        Load global word BASE58
   0a32: IND  0025        Static index and load word (TOS+37)
   0a34: SLDC 03          Short load constant 3
   0a35: DVI              Divide integers (TOS-1 / TOS)
   0a36: CXP  00 1d       Call external procedure PASCALSY.FGOTOXY
   0a39: SLDC 0b          Short load constant 11
   0a3a: SLDC 00          Short load constant 0
   0a3b: GRTI             Integer TOS-1 > TOS
   0a3c: FJP  $0a48       Jump if TOS false
   0a3e: LOD  01 0003     Load word at G3 (OUTPUT)
   0a41: LDA  01 0074     Load addr G116
   0a44: SLDC 00          Short load constant 0
   0a45: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0a48: LOD  01 0003     Load word at G3 (OUTPUT)
   0a4b: LSA  08          Load string address: 'Welcome '
   0a55: NOP              No operation
   0a56: SLDC 00          Short load constant 0
   0a57: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a5a: LOD  01 0003     Load word at G3 (OUTPUT)
   0a5d: LDA  01 003f     Load addr G63
   0a60: SLDC 00          Short load constant 0
   0a61: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a64: LOD  01 0003     Load word at G3 (OUTPUT)
   0a67: LSA  18          Load string address: ', to Apple II Pascal 1.3'
   0a81: NOP              No operation
   0a82: SLDC 00          Short load constant 0
   0a83: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a86: LOD  01 0003     Load word at G3 (OUTPUT)
   0a89: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a8c: LOD  01 0003     Load word at G3 (OUTPUT)
   0a8f: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a92: LOD  01 0003     Load word at G3 (OUTPUT)
   0a95: LSA  19          Load string address: 'Based on UCSD Pascal II.1'
   0ab0: NOP              No operation
   0ab1: SLDC 00          Short load constant 0
   0ab2: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ab5: LOD  01 0003     Load word at G3 (OUTPUT)
   0ab8: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0abb: LOD  01 0003     Load word at G3 (OUTPUT)
   0abe: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ac1: LOD  01 0003     Load word at G3 (OUTPUT)
   0ac4: NOP              No operation
   0ac5: LSA  10          Load string address: 'Current date is '
   0ad7: SLDC 00          Short load constant 0
   0ad8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0adb: LOD  01 0003     Load word at G3 (OUTPUT)
   0ade: LDA  01 0043     Load addr G67
   0ae1: SLDC 05          Short load constant 5
   0ae2: SLDC 04          Short load constant 4
   0ae3: LDP              Load packed field (TOS)
   0ae4: SLDC 00          Short load constant 0
   0ae5: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0ae8: LOD  01 0003     Load word at G3 (OUTPUT)
   0aeb: SLDC 2d          Short load constant 45
   0aec: SLDC 00          Short load constant 0
   0aed: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0af0: LOD  01 0003     Load word at G3 (OUTPUT)
   0af3: LAO  0017        Load global BASE23
   0af5: LDA  01 0043     Load addr G67
   0af8: SLDC 04          Short load constant 4
   0af9: SLDC 00          Short load constant 0
   0afa: LDP              Load packed field (TOS)
   0afb: IXA  0002        Index array (TOS-1 + TOS * 2)
   0afd: SLDC 00          Short load constant 0
   0afe: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b01: LOD  01 0003     Load word at G3 (OUTPUT)
   0b04: SLDC 2d          Short load constant 45
   0b05: SLDC 00          Short load constant 0
   0b06: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0b09: LOD  01 0003     Load word at G3 (OUTPUT)
   0b0c: LDA  01 0043     Load addr G67
   0b0f: SLDC 07          Short load constant 7
   0b10: SLDC 09          Short load constant 9
   0b11: LDP              Load packed field (TOS)
   0b12: SLDC 00          Short load constant 0
   0b13: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0b16: SLDC 01          Short load constant 1
   0b17: SRO  0016        Store global word BASE22
   0b19: SLDC 03          Short load constant 3
   0b1a: SRO  003b        Store global word BASE59
-> 0b1c: LDO  0016        Load global word BASE22
   0b1e: LDO  003b        Load global word BASE59
   0b20: LEQI             Integer TOS-1 <= TOS
   0b21: FJP  $0b31       Jump if TOS false
   0b23: LOD  01 0003     Load word at G3 (OUTPUT)
   0b26: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b29: LDO  0016        Load global word BASE22
   0b2b: SLDC 01          Short load constant 1
   0b2c: ADI              Add integers (TOS + TOS-1)
   0b2d: SRO  0016        Store global word BASE22
   0b2f: UJP  $0b1c       Unconditional jump
-> 0b31: LOD  01 0003     Load word at G3 (OUTPUT)
   0b34: NOP              No operation
   0b35: LSA  1a          Load string address: 'Pascal system size is 128K'
   0b51: SLDC 00          Short load constant 0
   0b52: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b55: LOD  01 0003     Load word at G3 (OUTPUT)
   0b58: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b5b: SLDC 01          Short load constant 1
   0b5c: SRO  0016        Store global word BASE22
   0b5e: SLDC 03          Short load constant 3
   0b5f: SRO  003b        Store global word BASE59
-> 0b61: LDO  0016        Load global word BASE22
   0b63: LDO  003b        Load global word BASE59
   0b65: LEQI             Integer TOS-1 <= TOS
   0b66: FJP  $0b76       Jump if TOS false
   0b68: LOD  01 0003     Load word at G3 (OUTPUT)
   0b6b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b6e: LDO  0016        Load global word BASE22
   0b70: SLDC 01          Short load constant 1
   0b71: ADI              Add integers (TOS + TOS-1)
   0b72: SRO  0016        Store global word BASE22
   0b74: UJP  $0b61       Unconditional jump
-> 0b76: LOD  01 0003     Load word at G3 (OUTPUT)
   0b79: LSA  31          Load string address: 'Copyright Apple Computer 1979,1980,1983,1984,1985'
   0bac: NOP              No operation
   0bad: SLDC 00          Short load constant 0
   0bae: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0bb1: LOD  01 0003     Load word at G3 (OUTPUT)
   0bb4: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0bb7: LOD  01 0003     Load word at G3 (OUTPUT)
   0bba: NOP              No operation
   0bbb: LSA  1b          Load string address: 'Copyright U.C. Regents 1979'
   0bd8: SLDC 00          Short load constant 0
   0bd9: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0bdc: LOD  01 0003     Load word at G3 (OUTPUT)
   0bdf: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0be2: UJP  $0be4       Unconditional jump
-> 0be4: UJP  $0c0b       Unconditional jump
-> 0be6: LOD  01 0003     Load word at G3 (OUTPUT)
   0be9: LSA  15          Load string address: 'System re-initialized'
   0c00: NOP              No operation
   0c01: SLDC 00          Short load constant 0
   0c02: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c05: LOD  01 0003     Load word at G3 (OUTPUT)
   0c08: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0c0b: SLDC 06          Short load constant 6
   0c0c: CSP  16          Call standard procedure UNLOADSEGMENT
   0c0e: UJP  $0c15       Unconditional jump
-> 0c10: SLDC 06          Short load constant 6
   0c11: CSP  15          Call standard procedure LOADSEGMENT
   0c13: UJP  $07b8       Unconditional jump
-> 0c15: RBP  00          Return from base procedure
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
-> 14f8: LOD  01 003a     Load word at G58
   14fb: INC  0002        Inc field ptr (TOS+2)
   14fd: SLDC 00          Short load constant 0
   14fe: STO              Store indirect (TOS into TOS-1)
   14ff: LOD  01 0039     Load word at G57
   1502: INC  0002        Inc field ptr (TOS+2)
   1504: SLDC 00          Short load constant 0
   1505: STO              Store indirect (TOS into TOS-1)
   1506: LOD  01 0038     Load word at G56
   1509: INC  0002        Inc field ptr (TOS+2)
   150b: SLDC 00          Short load constant 0
   150c: STO              Store indirect (TOS into TOS-1)
   150d: LDA  01 0002     Load addr G2 (INPUT)
   1510: SLDC 00          Short load constant 0
   1511: IXA  0001        Index array (TOS-1 + TOS * 1)
   1513: LOD  01 003a     Load word at G58
   1516: STO              Store indirect (TOS into TOS-1)
   1517: LDA  01 0002     Load addr G2 (INPUT)
   151a: SLDC 01          Short load constant 1
   151b: IXA  0001        Index array (TOS-1 + TOS * 1)
   151d: LOD  01 0039     Load word at G57
   1520: STO              Store indirect (TOS into TOS-1)
   1521: SLDO 03          Short load global BASE3
   1522: SLDC 00          Short load constant 0
   1523: EQUI             Integer TOS-1 = TOS
   1524: FJP  $1555       Jump if TOS false
   1526: LOD  01 0189     Load word at G393
   152a: FJP  $1555       Jump if TOS false
   152c: SLDC 00          Short load constant 0
   152d: STR  01 0189     Store TOS to G393
   1531: LSA  0e          Load string address: '*SYSTEM.ATTACH'
   1541: NOP              No operation
   1542: SLDC 00          Short load constant 0
   1543: SLDC 00          Short load constant 0
   1544: SLDC 00          Short load constant 0
   1545: LAO  0006        Load global BASE6
   1547: SLDC 01          Short load constant 1
   1548: SLDC 00          Short load constant 0
   1549: SLDC 00          Short load constant 0
   154a: CLP  13          Call local procedure GETCMD.19
   154c: FJP  $1555       Jump if TOS false
   154e: SLDC 0a          Short load constant 10
   154f: SRO  0001        Store global word BASE1
   1551: SLDC 05          Short load constant 5
   1552: SLDC 01          Short load constant 1
   1553: CSP  04          Call standard procedure EXIT
-> 1555: SLDO 03          Short load global BASE3
   1556: SLDC 0a          Short load constant 10
   1557: EQUI             Integer TOS-1 = TOS
   1558: FJP  $155d       Jump if TOS false
   155a: SLDC 00          Short load constant 0
   155b: SRO  0003        Store global word BASE3
-> 155d: SLDO 03          Short load global BASE3
   155e: SLDC 00          Short load constant 0
   155f: EQUI             Integer TOS-1 = TOS
   1560: FJP  $158a       Jump if TOS false
   1562: NOP              No operation
   1563: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   1574: SLDC 00          Short load constant 0
   1575: SLDC 00          Short load constant 0
   1576: SLDC 00          Short load constant 0
   1577: LAO  0006        Load global BASE6
   1579: SLDC 00          Short load constant 0
   157a: SLDC 00          Short load constant 0
   157b: SLDC 00          Short load constant 0
   157c: CLP  13          Call local procedure GETCMD.19
   157e: FJP  $158a       Jump if TOS false
   1580: CXP  00 25       Call external procedure PASCALSY.37
   1583: SLDC 04          Short load constant 4
   1584: SRO  0001        Store global word BASE1
   1586: SLDC 05          Short load constant 5
   1587: SLDC 01          Short load constant 1
   1588: CSP  04          Call standard procedure EXIT
-> 158a: SLDO 03          Short load global BASE3
   158b: LDCI 00e0        Load word 224
   158e: SLDC 01          Short load constant 1
   158f: INN              Set membership (TOS-1 in set TOS)
   1590: FJP  $1594       Jump if TOS false
   1592: CLP  16          Call local procedure GETCMD.22
-> 1594: SLDO 03          Short load global BASE3
   1595: LDCI 0300        Load word 768
   1598: SLDC 01          Short load constant 1
   1599: INN              Set membership (TOS-1 in set TOS)
   159a: FJP  $159f       Jump if TOS false
   159c: SLDC 00          Short load constant 0
   159d: CLP  02          Call local procedure GETCMD.2
-> 159f: LOD  01 0001     Load word at G1 (SYSCOM)
   15a2: INC  001d        Inc field ptr (TOS+29)
   15a4: SLDC 02          Short load constant 2
   15a5: SLDC 07          Short load constant 7
   15a6: LDP              Load packed field (TOS)
   15a7: SLDC 01          Short load constant 1
   15a8: EQUI             Integer TOS-1 = TOS
   15a9: FJP  $15c3       Jump if TOS false
   15ab: SLDO 03          Short load global BASE3
   15ac: SLDC 00          Short load constant 0
   15ad: EQUI             Integer TOS-1 = TOS
   15ae: FJP  $15b8       Jump if TOS false
   15b0: SLDC 06          Short load constant 6
   15b1: SRO  0003        Store global word BASE3
   15b3: SLDC 01          Short load constant 1
   15b4: CLP  02          Call local procedure GETCMD.2
   15b6: UJP  $15c3       Unconditional jump
-> 15b8: LDCN             Load constant NIL
   15b9: STR  01 0036     Store TOS to G54
   15bc: SLDC 00          Short load constant 0
   15bd: SRO  0001        Store global word BASE1
   15bf: SLDC 05          Short load constant 5
   15c0: SLDC 01          Short load constant 1
   15c1: CSP  04          Call standard procedure EXIT
-> 15c3: SLDC 00          Short load constant 0
   15c4: STR  01 000a     Store TOS to G10
   15c7: SLDC 00          Short load constant 0
   15c8: STR  01 000b     Store TOS to G11
   15cb: SLDC 00          Short load constant 0
   15cc: STR  01 000c     Store TOS to G12
   15cf: SLDC 00          Short load constant 0
   15d0: SRO  0005        Store global word BASE5
   15d2: LDA  01 0148     Load addr G328
   15d6: SLDC 00          Short load constant 0
   15d7: LDB              Load byte at byte ptr TOS-1 + TOS
   15d8: SLDC 00          Short load constant 0
   15d9: NEQI             Integer TOS-1 <> TOS
   15da: FJP  $15df       Jump if TOS false
   15dc: SLDC 01          Short load constant 1
   15dd: CLP  19          Call local procedure GETCMD.25
-> 15df: LDA  01 0046     Load addr G70
   15e2: NOP              No operation
   15e3: LSA  44          Load string address: 'Command: F(ile, E(dit, R(un, C(omp, L(ink, X(ecute, A(ssem, ?  [1.3]'
   1629: SAS  50          String assign (TOS to TOS-1, 80 chars)
   162b: CXP  00 27       Call external procedure PASCALSY.39
   162e: SLDO 05          Short load global BASE5
   162f: SLDC 00          Short load constant 0
   1630: SLDC 00          Short load constant 0
   1631: CXP  00 29       Call external procedure PASCALSY.41
   1634: SRO  0004        Store global word BASE4
   1636: CXP  00 25       Call external procedure PASCALSY.37
   1639: SLDO 04          Short load global BASE4
   163a: SLDC 3f          Short load constant 63
   163b: EQUI             Integer TOS-1 = TOS
   163c: FJP  $1698       Jump if TOS false
   163e: LDA  01 0046     Load addr G70
   1641: LSA  44          Load string address: 'Command: U(ser restart, I(nitialize, S(wap, M(ake exec, Q(uit  [1.3]'
   1687: NOP              No operation
   1688: SAS  50          String assign (TOS to TOS-1, 80 chars)
   168a: CXP  00 27       Call external procedure PASCALSY.39
   168d: SLDO 05          Short load global BASE5
   168e: SLDC 00          Short load constant 0
   168f: SLDC 00          Short load constant 0
   1690: CXP  00 29       Call external procedure PASCALSY.41
   1693: SRO  0004        Store global word BASE4
   1695: CXP  00 25       Call external procedure PASCALSY.37
-> 1698: LOD  01 0187     Load word at G391
   169c: FJP  $16a8       Jump if TOS false
   169e: LDA  01 0036     Load addr G54
   16a1: CSP  21          Call standard procedure RELEASE
   16a3: SLDC 00          Short load constant 0
   16a4: STR  01 0187     Store TOS to G391
-> 16a8: SLDO 04          Short load global BASE4
   16ac: LDC  06          Load multiple-word constant
                         012e326a8000000000000000
   16b8: SLDC 06          Short load constant 6
   16b9: INN              Set membership (TOS-1 in set TOS)
   16ba: LNOT             Logical NOT (~TOS)
   16bb: SRO  0005        Store global word BASE5
   16bd: SLDO 05          Short load global BASE5
   16be: LNOT             Logical NOT (~TOS)
   16bf: FJP  $184e       Jump if TOS false
   16c1: SLDO 04          Short load global BASE4
   16c2: UJP  $1817       Unconditional jump
   16c4: LOD  01 0003     Load word at G3 (OUTPUT)
   16c7: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   16ca: SLDC 02          Short load constant 2
   16cb: SLDC 01          Short load constant 1
   16cc: SLDC 00          Short load constant 0
   16cd: SLDC 00          Short load constant 0
   16ce: CLP  03          Call local procedure GETCMD.3
   16d0: FJP  $16d9       Jump if TOS false
   16d2: SLDC 04          Short load constant 4
   16d3: SRO  0001        Store global word BASE1
   16d5: SLDC 05          Short load constant 5
   16d6: SLDC 01          Short load constant 1
   16d7: CSP  04          Call standard procedure EXIT
-> 16d9: UJP  $184e       Unconditional jump
   16db: LOD  01 0003     Load word at G3 (OUTPUT)
   16de: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   16e1: SLDC 03          Short load constant 3
   16e2: SLDC 01          Short load constant 1
   16e3: SLDC 00          Short load constant 0
   16e4: SLDC 00          Short load constant 0
   16e5: CLP  03          Call local procedure GETCMD.3
   16e7: FJP  $16f5       Jump if TOS false
   16e9: SLDC 04          Short load constant 4
   16ea: SRO  0001        Store global word BASE1
   16ec: SLDC 01          Short load constant 1
   16ed: STR  01 0188     Store TOS to G392
   16f1: SLDC 05          Short load constant 5
   16f2: SLDC 01          Short load constant 1
   16f3: CSP  04          Call standard procedure EXIT
-> 16f5: UJP  $184e       Unconditional jump
   16f7: LOD  01 0003     Load word at G3 (OUTPUT)
   16fa: NOP              No operation
   16fb: LSA  0a          Load string address: 'Linking...'
   1707: SLDC 00          Short load constant 0
   1708: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   170b: LOD  01 0003     Load word at G3 (OUTPUT)
   170e: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1711: SLDC 04          Short load constant 4
   1712: SLDC 01          Short load constant 1
   1713: SLDC 00          Short load constant 0
   1714: SLDC 00          Short load constant 0
   1715: CLP  03          Call local procedure GETCMD.3
   1717: FJP  $1720       Jump if TOS false
   1719: SLDC 04          Short load constant 4
   171a: SRO  0001        Store global word BASE1
   171c: SLDC 05          Short load constant 5
   171d: SLDC 01          Short load constant 1
   171e: CSP  04          Call standard procedure EXIT
-> 1720: UJP  $184e       Unconditional jump
   1722: SLDC 00          Short load constant 0
   1723: CLP  19          Call local procedure GETCMD.25
   1725: UJP  $184e       Unconditional jump
   1727: SLDC 05          Short load constant 5
   1728: CLP  14          Call local procedure GETCMD.20
   172a: UJP  $184e       Unconditional jump
   172c: SLDC 08          Short load constant 8
   172d: CLP  14          Call local procedure GETCMD.20
   172f: UJP  $184e       Unconditional jump
   1731: SLDO 03          Short load global BASE3
   1732: SLDC 02          Short load constant 2
   1733: NEQI             Integer TOS-1 <> TOS
   1734: FJP  $175c       Jump if TOS false
   1736: LOD  01 0003     Load word at G3 (OUTPUT)
   1739: LSA  0d          Load string address: 'Restarting...'
   1748: NOP              No operation
   1749: SLDC 00          Short load constant 0
   174a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   174d: LOD  01 0003     Load word at G3 (OUTPUT)
   1750: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1753: SLDC 04          Short load constant 4
   1754: SRO  0001        Store global word BASE1
   1756: SLDC 05          Short load constant 5
   1757: SLDC 01          Short load constant 1
   1758: CSP  04          Call standard procedure EXIT
   175a: UJP  $1779       Unconditional jump
-> 175c: LOD  01 0003     Load word at G3 (OUTPUT)
   175f: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1762: LOD  01 0003     Load word at G3 (OUTPUT)
   1765: LSA  0d          Load string address: 'U not allowed'
   1774: NOP              No operation
   1775: SLDC 00          Short load constant 0
   1776: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 1779: UJP  $184e       Unconditional jump
   177b: SLDC 01          Short load constant 1
   177c: CLP  02          Call local procedure GETCMD.2
   177e: UJP  $184e       Unconditional jump
   1780: SLDO 04          Short load global BASE4
   1781: SLDC 51          Short load constant 81
   1782: EQUI             Integer TOS-1 = TOS
   1783: FJP  $17d5       Jump if TOS false
   1785: LOD  01 0003     Load word at G3 (OUTPUT)
   1788: NOP              No operation
   1789: LSA  2d          Load string address: 'Do you wish to exit the Pascal system? (Y/N) '
   17b8: SLDC 00          Short load constant 0
   17b9: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   17bc: LOD  01 0002     Load word at G2 (INPUT)
   17bf: LAO  0004        Load global BASE4
   17c1: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   17c4: SLDO 04          Short load global BASE4
   17c5: SLDC 59          Short load constant 89
   17c6: EQUI             Integer TOS-1 = TOS
   17c7: SLDO 04          Short load global BASE4
   17c8: SLDC 79          Short load constant 121
   17c9: EQUI             Integer TOS-1 = TOS
   17ca: LOR              Logical OR (TOS | TOS-1)
   17cb: FJP  $17d2       Jump if TOS false
   17cd: SLDC 51          Short load constant 81
   17ce: SRO  0004        Store global word BASE4
   17d0: UJP  $17d5       Unconditional jump
-> 17d2: SLDC 5a          Short load constant 90
   17d3: SRO  0004        Store global word BASE4
-> 17d5: SLDO 04          Short load global BASE4
   17d6: SLDC 51          Short load constant 81
   17d7: EQUI             Integer TOS-1 = TOS
   17d8: SLDO 04          Short load global BASE4
   17d9: SLDC 49          Short load constant 73
   17da: EQUI             Integer TOS-1 = TOS
   17db: LOR              Logical OR (TOS | TOS-1)
   17dc: FJP  $17fd       Jump if TOS false
   17de: LOD  01 0183     Load word at G387
   17e2: LOD  01 0182     Load word at G386
   17e6: LOR              Logical OR (TOS | TOS-1)
   17e7: FJP  $17ed       Jump if TOS false
   17e9: SLDC 01          Short load constant 1
   17ea: CXP  00 2d       Call external procedure PASCALSY.45
-> 17ed: SLDC 00          Short load constant 0
   17ee: SRO  0001        Store global word BASE1
   17f0: SLDO 04          Short load global BASE4
   17f1: SLDC 51          Short load constant 81
   17f2: EQUI             Integer TOS-1 = TOS
   17f3: FJP  $17f9       Jump if TOS false
   17f5: LDCN             Load constant NIL
   17f6: STR  01 0036     Store TOS to G54
-> 17f9: SLDC 05          Short load constant 5
   17fa: SLDC 01          Short load constant 1
   17fb: CSP  04          Call standard procedure EXIT
-> 17fd: UJP  $184e       Unconditional jump
   17ff: CLP  1a          Call local procedure GETCMD.26
   1801: UJP  $184e       Unconditional jump
   1803: LOD  01 0182     Load word at G386
   1807: LOD  01 0183     Load word at G387
   180b: LOR              Logical OR (TOS | TOS-1)
   180c: FJP  $1813       Jump if TOS false
   180e: SLDC 01          Short load constant 1
   180f: CLP  17          Call local procedure GETCMD.23
   1811: UJP  $1815       Unconditional jump
-> 1813: CLP  1b          Call local procedure GETCMD.27
-> 1815: UJP  $184e       Unconditional jump
-> 184e: SLDC 00          Short load constant 0
   184f: FJP  $15df       Jump if TOS false
-> 1851: RBP  01          Return from base procedure
END

### PROCEDURE GETCMD.PROC2(PARAM1) (* P=2 LL=1 *)
  BASE1
  BASE3
  BASE6
  MP1=PARAM1
  MP2
BEGIN
-> 1136: LOD  02 0010     Load word at G16
   1139: FJP  $11a1       Jump if TOS false
   113b: CXP  00 25       Call external procedure PASCALSY.37
   113e: LOD  02 0003     Load word at G3 (OUTPUT)
   1141: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1144: SLDC 00          Short load constant 0
   1145: STL  0002        Store TOS into MP2
   1147: LLA  0002        Load local address MP2
   1149: LDA  02 0012     Load addr G18
   114c: SLDC 07          Short load constant 7
   114d: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   1150: LLA  0002        Load local address MP2
   1152: NOP              No operation
   1153: LSA  01          Load string address: ':'
   1156: SLDC 08          Short load constant 8
   1157: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   115a: LLA  0002        Load local address MP2
   115c: LDA  02 001e     Load addr G30
   115f: SLDC 17          Short load constant 23
   1160: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   1163: LLA  0002        Load local address MP2
   1165: SLDL 01          Short load local MP1
   1166: SLDC 01          Short load constant 1
   1167: SLDC 01          Short load constant 1
   1168: LAO  0006        Load global BASE6
   116a: SLDC 00          Short load constant 0
   116b: SLDC 00          Short load constant 0
   116c: SLDC 00          Short load constant 0
   116d: CGP  13          Call global procedure GETCMD.19
   116f: FJP  $1192       Jump if TOS false
   1171: LOD  02 0003     Load word at G3 (OUTPUT)
   1174: NOP              No operation
   1175: LSA  0a          Load string address: 'Running...'
   1181: SLDC 00          Short load constant 0
   1182: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1185: LOD  02 0003     Load word at G3 (OUTPUT)
   1188: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   118b: SLDC 04          Short load constant 4
   118c: SRO  0001        Store global word BASE1
   118e: SLDC 05          Short load constant 5
   118f: SLDC 01          Short load constant 1
   1190: CSP  04          Call standard procedure EXIT
-> 1192: SLDO 03          Short load global BASE3
   1193: LDCI 0300        Load word 768
   1196: SLDC 01          Short load constant 1
   1197: INN              Set membership (TOS-1 in set TOS)
   1198: LNOT             Logical NOT (~TOS)
   1199: FJP  $119f       Jump if TOS false
   119b: SLDC 00          Short load constant 0
   119c: STR  02 0010     Store TOS to G16
-> 119f: UJP  $11a4       Unconditional jump
-> 11a1: SLDC 06          Short load constant 6
   11a2: CGP  14          Call global procedure GETCMD.20
-> 11a4: RNP  00          Return from nonbase procedure
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
-> 09f6: LDA  02 00fc     Load addr G252
   09fa: SLDL 04          Short load local MP4
   09fb: IXA  000c        Index array (TOS-1 + TOS * 12)
   09fd: SLDC 00          Short load constant 0
   09fe: SLDC 00          Short load constant 0
   09ff: SLDC 00          Short load constant 0
   0a00: LLA  0020        Load local address MP32
   0a02: SLDL 03          Short load local MP3
   0a03: SLDC 00          Short load constant 0
   0a04: SLDC 00          Short load constant 0
   0a05: CGP  13          Call global procedure GETCMD.19
   0a07: STL  0001        Store TOS into MP1
   0a09: LDL  0020        Load local word MP32
   0a0b: SLDC 02          Short load constant 2
   0a0c: EQUI             Integer TOS-1 = TOS
   0a0d: FJP  $0acd       Jump if TOS false
   0a0f: LDA  02 00fc     Load addr G252
   0a13: SLDL 04          Short load local MP4
   0a14: IXA  000c        Index array (TOS-1 + TOS * 12)
   0a16: LLA  0005        Load local address MP5
   0a18: LLA  0009        Load local address MP9
   0a1a: LLA  0011        Load local address MP17
   0a1c: LLA  0012        Load local address MP18
   0a1e: SLDC 00          Short load constant 0
   0a1f: SLDC 00          Short load constant 0
   0a20: CXP  00 21       Call external procedure PASCALSY.33
   0a23: FJP  $0acd       Jump if TOS false
   0a25: SLDC 00          Short load constant 0
   0a26: STL  0013        Store TOS into MP19
-> 0a28: LDL  0013        Load local word MP19
   0a2a: SLDC 01          Short load constant 1
   0a2b: ADI              Add integers (TOS + TOS-1)
   0a2c: STL  0013        Store TOS into MP19
   0a2e: LDA  02 007e     Load addr G126
   0a31: LDL  0013        Load local word MP19
   0a33: IXA  0006        Index array (TOS-1 + TOS * 6)
   0a35: STL  0021        Store TOS into MP33
   0a37: LDL  0021        Load local word MP33
   0a39: SIND 04          Short index load *TOS+4
   0a3a: FJP  $0aa2       Jump if TOS false
   0a3c: LDL  0021        Load local word MP33
   0a3e: NOP              No operation
   0a3f: LSA  00          Load string address: ''
   0a41: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0a43: LDL  0013        Load local word MP19
   0a45: SLDC 00          Short load constant 0
   0a46: SLDC 00          Short load constant 0
   0a47: CXP  00 2a       Call external procedure PASCALSY.42
   0a4a: FJP  $0aa2       Jump if TOS false
   0a4c: LDL  0021        Load local word MP33
   0a4e: LOD  02 0001     Load word at G1 (SYSCOM)
   0a51: SIND 04          Short index load *TOS+4
   0a52: SLDC 00          Short load constant 0
   0a53: IXA  000d        Index array (TOS-1 + TOS * 13)
   0a55: INC  0003        Inc field ptr (TOS+3)
   0a57: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0a59: LLA  0014        Load local address MP20
   0a5b: SLDC 00          Short load constant 0
   0a5c: STL  0022        Store TOS into MP34
   0a5e: LLA  0022        Load local address MP34
   0a60: LDL  0021        Load local word MP33
   0a62: SLDC 07          Short load constant 7
   0a63: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0a66: LLA  0022        Load local address MP34
   0a68: NOP              No operation
   0a69: LSA  01          Load string address: ':'
   0a6c: SLDC 08          Short load constant 8
   0a6d: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0a70: LLA  0022        Load local address MP34
   0a72: LLA  0009        Load local address MP9
   0a74: SLDC 17          Short load constant 23
   0a75: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0a78: LLA  0022        Load local address MP34
   0a7a: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0a7c: LLA  0014        Load local address MP20
   0a7e: LDA  02 00fc     Load addr G252
   0a82: SLDL 04          Short load local MP4
   0a83: IXA  000c        Index array (TOS-1 + TOS * 12)
   0a85: NEQSTR           String TOS-1 <> TOS
   0a87: FJP  $0aa2       Jump if TOS false
   0a89: LLA  0014        Load local address MP20
   0a8b: SLDC 00          Short load constant 0
   0a8c: SLDC 00          Short load constant 0
   0a8d: SLDC 00          Short load constant 0
   0a8e: LLA  0020        Load local address MP32
   0a90: SLDL 03          Short load local MP3
   0a91: SLDC 00          Short load constant 0
   0a92: SLDC 00          Short load constant 0
   0a93: CGP  13          Call global procedure GETCMD.19
   0a95: FJP  $0aa2       Jump if TOS false
   0a97: LDA  02 00fc     Load addr G252
   0a9b: SLDL 04          Short load local MP4
   0a9c: IXA  000c        Index array (TOS-1 + TOS * 12)
   0a9e: LLA  0014        Load local address MP20
   0aa0: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 0aa2: LDL  0013        Load local word MP19
   0aa4: SLDC 14          Short load constant 20
   0aa5: EQUI             Integer TOS-1 = TOS
   0aa6: LDL  0020        Load local word MP32
   0aa8: SLDC 03          Short load constant 3
   0aa9: SLDC 01          Short load constant 1
   0aaa: INN              Set membership (TOS-1 in set TOS)
   0aab: LOR              Logical OR (TOS | TOS-1)
   0aac: FJP  $0a28       Jump if TOS false
   0aae: LDL  0020        Load local word MP32
   0ab0: SLDC 00          Short load constant 0
   0ab1: EQUI             Integer TOS-1 = TOS
   0ab2: STL  0001        Store TOS into MP1
   0ab4: LDL  0020        Load local word MP32
   0ab6: SLDC 02          Short load constant 2
   0ab7: EQUI             Integer TOS-1 = TOS
   0ab8: FJP  $0acd       Jump if TOS false
   0aba: LDA  02 00fc     Load addr G252
   0abe: SLDL 04          Short load local MP4
   0abf: IXA  000c        Index array (TOS-1 + TOS * 12)
   0ac1: SLDC 00          Short load constant 0
   0ac2: SLDC 00          Short load constant 0
   0ac3: SLDC 01          Short load constant 1
   0ac4: LLA  0020        Load local address MP32
   0ac6: SLDC 00          Short load constant 0
   0ac7: SLDC 00          Short load constant 0
   0ac8: SLDC 00          Short load constant 0
   0ac9: CGP  13          Call global procedure GETCMD.19
   0acb: FJP  $0acd       Jump if TOS false
-> 0acd: RNP  01          Return from nonbase procedure
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
-> 07fb: UJP  $09d5       Unconditional jump
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
   083c: UJP  $09d5       Unconditional jump
   083e: UJP  $09c4       Unconditional jump
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
   086d: UJP  $09d5       Unconditional jump
-> 086f: SLDL 03          Short load local MP3
   0870: FJP  $08df       Jump if TOS false
   0872: LLA  00b2        Load local address MP178
   0875: SLDC 01          Short load constant 1
   0876: IXA  0001        Index array (TOS-1 + TOS * 1)
   0878: SLDC 03          Short load constant 3
   0879: SLDC 0d          Short load constant 13
   087a: LDP              Load packed field (TOS)
   087b: SLDC 06          Short load constant 6
   087c: NEQI             Integer TOS-1 <> TOS
   087d: FJP  $08df       Jump if TOS false
   087f: LSA  0f          Load string address: 'SYSTEM.COMPILER'
   0890: NOP              No operation
   0891: LLA  0009        Load local address MP9
   0893: SLDC 00          Short load constant 0
   0894: SLDC 00          Short load constant 0
   0895: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0898: SLDC 00          Short load constant 0
   0899: NEQI             Integer TOS-1 <> TOS
   089a: LLA  0052        Load local address MP82
   089c: SLDC 01          Short load constant 1
   089d: IXA  0004        Index array (TOS-1 + TOS * 4)
   089f: NOP              No operation
   08a0: LPA  08          Load packed array
                         464f525452414e3a
   08aa: EQLBYTE          Byte array (8 long) TOS-1 = TOS
   08ad: LAND             Logical AND (TOS & TOS-1)
   08ae: LNOT             Logical NOT (~TOS)
   08af: FJP  $08df       Jump if TOS false
   08b1: LOD  02 0003     Load word at G3 (OUTPUT)
   08b4: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   08b7: LOD  02 0003     Load word at G3 (OUTPUT)
   08ba: LLA  0009        Load local address MP9
   08bc: SLDC 00          Short load constant 0
   08bd: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   08c0: LOD  02 0003     Load word at G3 (OUTPUT)
   08c3: LSA  13          Load string address: ' is not version 1.3'
   08d8: NOP              No operation
   08d9: SLDC 00          Short load constant 0
   08da: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   08dd: UJP  $09d5       Unconditional jump
-> 08df: SLDL 03          Short load local MP3
   08e0: LNOT             Logical NOT (~TOS)
   08e1: FJP  $08e7       Jump if TOS false
   08e3: LLA  0032        Load local address MP50
   08e5: CGP  07          Call global procedure GETCMD.7
-> 08e7: LLA  0032        Load local address MP50
   08e9: LLA  0132        Load local address MP306
   08ec: SLDC 01          Short load constant 1
   08ed: SLDC 01          Short load constant 1
   08ee: ADJ  01          Adjust set to 1 words
   08f0: SLDC 00          Short load constant 0
   08f1: SLDC 00          Short load constant 0
   08f2: CGP  0a          Call global procedure GETCMD.10
   08f4: LNOT             Logical NOT (~TOS)
   08f5: FJP  $0959       Jump if TOS false
   08f7: SLDL 07          Short load local MP7
   08f8: FJP  $0934       Jump if TOS false
   08fa: LOD  02 0003     Load word at G3 (OUTPUT)
   08fd: LSA  0a          Load string address: 'Linking...'
   0909: NOP              No operation
   090a: SLDC 00          Short load constant 0
   090b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   090e: LOD  02 0003     Load word at G3 (OUTPUT)
   0911: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0914: LOD  02 0008     Load word at G8
   0917: SLDC 00          Short load constant 0
   0918: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   091b: SLDC 04          Short load constant 4
   091c: SLDC 01          Short load constant 1
   091d: SLDC 00          Short load constant 0
   091e: SLDC 00          Short load constant 0
   091f: CGP  03          Call global procedure GETCMD.3
   0921: FJP  $0932       Jump if TOS false
   0923: SLDL 06          Short load local MP6
   0924: FJP  $092b       Jump if TOS false
   0926: SLDC 08          Short load constant 8
   0927: SRO  0001        Store global word BASE1
   0929: UJP  $092e       Unconditional jump
-> 092b: SLDC 09          Short load constant 9
   092c: SRO  0001        Store global word BASE1
-> 092e: SLDC 05          Short load constant 5
   092f: SLDC 01          Short load constant 1
   0930: CSP  04          Call standard procedure EXIT
-> 0932: UJP  $0957       Unconditional jump
-> 0934: SLDO 03          Short load global BASE3
   0935: LDCI 0300        Load word 768
   0938: SLDC 01          Short load constant 1
   0939: INN              Set membership (TOS-1 in set TOS)
   093a: LNOT             Logical NOT (~TOS)
   093b: FJP  $0957       Jump if TOS false
   093d: LOD  02 0003     Load word at G3 (OUTPUT)
   0940: NOP              No operation
   0941: LSA  10          Load string address: 'Must L(ink first'
   0953: SLDC 00          Short load constant 0
   0954: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0957: UJP  $09d5       Unconditional jump
-> 0959: LLA  0132        Load local address MP306
   095c: LDM  04          Load 4 words from (TOS)
   095e: SLDC 04          Short load constant 4
   095f: LLA  00c2        Load local address MP194
   0962: LDM  04          Load 4 words from (TOS)
   0964: SLDC 04          Short load constant 4
   0965: INT              Set intersection (TOS AND TOS-1)
   0966: SLDC 00          Short load constant 0
   0967: NEQSET           Set TOS-1 <> TOS
   0969: FJP  $09a5       Jump if TOS false
   096b: LOD  02 0003     Load word at G3 (OUTPUT)
   096e: NOP              No operation
   096f: LSA  2e          Load string address: 'Conflict between intrinsic and user segment(s)'
   099f: SLDC 00          Short load constant 0
   09a0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09a3: UJP  $09d5       Unconditional jump
-> 09a5: LLA  00c2        Load local address MP194
   09a8: LDM  04          Load 4 words from (TOS)
   09aa: SLDC 04          Short load constant 4
   09ab: SLDC 00          Short load constant 0
   09ac: NEQSET           Set TOS-1 <> TOS
   09ae: FJP  $09bd       Jump if TOS false
   09b0: LLA  0009        Load local address MP9
   09b2: LLA  0032        Load local address MP50
   09b4: SLDC 00          Short load constant 0
   09b5: SLDC 00          Short load constant 0
   09b6: CGP  0b          Call global procedure GETCMD.11
   09b8: LNOT             Logical NOT (~TOS)
   09b9: FJP  $09bd       Jump if TOS false
   09bb: UJP  $09d5       Unconditional jump
-> 09bd: LLA  0032        Load local address MP50
   09bf: LOD  02 0008     Load word at G8
   09c2: CGP  09          Call global procedure GETCMD.9
-> 09c4: SLDL 04          Short load local MP4
   09c5: SLDC 00          Short load constant 0
   09c6: STO              Store indirect (TOS into TOS-1)
   09c7: SLDC 01          Short load constant 1
   09c8: STL  0001        Store TOS into MP1
   09ca: LOD  02 0008     Load word at G8
   09cd: SLDC 00          Short load constant 0
   09ce: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   09d1: SLDC 05          Short load constant 5
   09d2: SLDC 13          Short load constant 19
   09d3: CSP  04          Call standard procedure EXIT
-> 09d5: LOD  02 0008     Load word at G8
   09d8: SLDC 00          Short load constant 0
   09d9: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   09dc: LDA  02 01bc     Load addr G444
   09e0: LLA  015f        Load local address MP351
   09e3: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 09e5: RNP  01          Return from nonbase procedure
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
  MP59
  MP60
  MP188
BEGIN
-> 0b0c: SLDL 01          Short load local MP1
   0b0d: SLDC 08          Short load constant 8
   0b0e: EQUI             Integer TOS-1 = TOS
   0b0f: FJP  $0b27       Jump if TOS false
   0b11: LOD  02 0003     Load word at G3 (OUTPUT)
   0b14: NOP              No operation
   0b15: LSA  0a          Load string address: 'Assembling'
   0b21: SLDC 00          Short load constant 0
   0b22: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b25: UJP  $0b3a       Unconditional jump
-> 0b27: LOD  02 0003     Load word at G3 (OUTPUT)
   0b2a: NOP              No operation
   0b2b: LSA  09          Load string address: 'Compiling'
   0b36: SLDC 00          Short load constant 0
   0b37: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0b3a: LOD  02 0003     Load word at G3 (OUTPUT)
   0b3d: LSA  03          Load string address: '...'
   0b42: NOP              No operation
   0b43: SLDC 00          Short load constant 0
   0b44: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b47: LOD  02 0003     Load word at G3 (OUTPUT)
   0b4a: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b4d: SLDL 01          Short load local MP1
   0b4e: SLDC 08          Short load constant 8
   0b4f: EQUI             Integer TOS-1 = TOS
   0b50: FJP  $0b57       Jump if TOS false
   0b52: SLDC 00          Short load constant 0
   0b53: STL  0039        Store TOS into MP57
   0b55: UJP  $0b5a       Unconditional jump
-> 0b57: SLDC 01          Short load constant 1
   0b58: STL  0039        Store TOS into MP57
-> 0b5a: LDL  0039        Load local word MP57
   0b5c: SLDC 01          Short load constant 1
   0b5d: SLDC 00          Short load constant 0
   0b5e: SLDC 00          Short load constant 0
   0b5f: CGP  03          Call global procedure GETCMD.3
   0b61: FJP  $0e4e       Jump if TOS false
   0b63: LOD  02 0011     Load word at G17
   0b66: FJP  $0b8f       Jump if TOS false
   0b68: LLA  0002        Load local address MP2
   0b6a: SLDC 00          Short load constant 0
   0b6b: STL  003c        Store TOS into MP60
   0b6d: LLA  003c        Load local address MP60
   0b6f: LDA  02 0016     Load addr G22
   0b72: SLDC 07          Short load constant 7
   0b73: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0b76: LLA  003c        Load local address MP60
   0b78: NOP              No operation
   0b79: LSA  01          Load string address: ':'
   0b7c: SLDC 08          Short load constant 8
   0b7d: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0b80: LLA  003c        Load local address MP60
   0b82: LDA  02 0026     Load addr G38
   0b85: SLDC 17          Short load constant 23
   0b86: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0b89: LLA  003c        Load local address MP60
   0b8b: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0b8d: UJP  $0c21       Unconditional jump
-> 0b8f: SLDL 01          Short load local MP1
   0b90: SLDC 08          Short load constant 8
   0b91: EQUI             Integer TOS-1 = TOS
   0b92: FJP  $0ba8       Jump if TOS false
   0b94: LOD  02 0003     Load word at G3 (OUTPUT)
   0b97: LSA  08          Load string address: 'Assemble'
   0ba1: NOP              No operation
   0ba2: SLDC 00          Short load constant 0
   0ba3: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ba6: UJP  $0bb9       Unconditional jump
-> 0ba8: LOD  02 0003     Load word at G3 (OUTPUT)
   0bab: LSA  07          Load string address: 'Compile'
   0bb4: NOP              No operation
   0bb5: SLDC 00          Short load constant 0
   0bb6: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0bb9: LOD  02 0003     Load word at G3 (OUTPUT)
   0bbc: NOP              No operation
   0bbd: LSA  21          Load string address: ' what textfile (<ret> to exit) ? '
   0be0: SLDC 00          Short load constant 0
   0be1: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0be4: LOD  02 0002     Load word at G2 (INPUT)
   0be7: LLA  0002        Load local address MP2
   0be9: SLDC 28          Short load constant 40
   0bea: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   0bed: LOD  02 0002     Load word at G2 (INPUT)
   0bf0: CXP  00 15       Call external procedure PASCALSY.FREADLN
   0bf3: CLP  15          Call local procedure GETCMD.21
   0bf5: LLA  0002        Load local address MP2
   0bf7: LSA  00          Load string address: ''
   0bf9: NOP              No operation
   0bfa: EQLSTR           String TOS-1 = TOS
   0bfc: FJP  $0c02       Jump if TOS false
   0bfe: UJP  $0e40       Unconditional jump
   0c00: UJP  $0c21       Unconditional jump
-> 0c02: LLA  0002        Load local address MP2
   0c04: SLDC 01          Short load constant 1
   0c05: LDB              Load byte at byte ptr TOS-1 + TOS
   0c06: SLDC 1b          Short load constant 27
   0c07: EQUI             Integer TOS-1 = TOS
   0c08: FJP  $0c0e       Jump if TOS false
   0c0a: UJP  $0e40       Unconditional jump
   0c0c: UJP  $0c21       Unconditional jump
-> 0c0e: LLA  0002        Load local address MP2
   0c10: SLDC 00          Short load constant 0
   0c11: SLDC 00          Short load constant 0
   0c12: CGP  06          Call global procedure GETCMD.6
   0c14: FJP  $0c1a       Jump if TOS false
   0c16: SLDC 05          Short load constant 5
   0c17: SLDC 14          Short load constant 20
   0c18: CSP  04          Call standard procedure EXIT
-> 0c1a: LLA  0002        Load local address MP2
   0c1c: SLDC 01          Short load constant 1
   0c1d: SLDC 28          Short load constant 40
   0c1e: CXP  00 2b       Call external procedure PASCALSY.43
-> 0c21: LLA  0017        Load local address MP23
   0c23: LLA  0002        Load local address MP2
   0c25: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0c27: LSA  05          Load string address: '.TEXT'
   0c2e: NOP              No operation
   0c2f: LLA  0017        Load local address MP23
   0c31: SLDC 00          Short load constant 0
   0c32: SLDC 00          Short load constant 0
   0c33: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0c36: STL  0038        Store TOS into MP56
   0c38: LDL  0038        Load local word MP56
   0c3a: SLDC 00          Short load constant 0
   0c3b: NEQI             Integer TOS-1 <> TOS
   0c3c: LDL  0038        Load local word MP56
   0c3e: LLA  0017        Load local address MP23
   0c40: SLDC 00          Short load constant 0
   0c41: LDB              Load byte at byte ptr TOS-1 + TOS
   0c42: SLDC 04          Short load constant 4
   0c43: SBI              Subtract integers (TOS-1 - TOS)
   0c44: EQUI             Integer TOS-1 = TOS
   0c45: LAND             Logical AND (TOS & TOS-1)
   0c46: FJP  $0c50       Jump if TOS false
   0c48: LLA  0017        Load local address MP23
   0c4a: LDL  0038        Load local word MP56
   0c4c: SLDC 05          Short load constant 5
   0c4d: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0c50: LOD  02 0009     Load word at G9
   0c53: LLA  0002        Load local address MP2
   0c55: SLDC 01          Short load constant 1
   0c56: LDCN             Load constant NIL
   0c57: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0c5a: CSP  22          Call standard procedure IORESULT
   0c5c: SLDC 00          Short load constant 0
   0c5d: NEQI             Integer TOS-1 <> TOS
   0c5e: FJP  $0c84       Jump if TOS false
   0c60: LOD  02 0003     Load word at G3 (OUTPUT)
   0c63: LSA  0b          Load string address: 'Can't find '
   0c70: NOP              No operation
   0c71: SLDC 00          Short load constant 0
   0c72: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c75: LOD  02 0003     Load word at G3 (OUTPUT)
   0c78: LLA  0002        Load local address MP2
   0c7a: SLDC 00          Short load constant 0
   0c7b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c7e: SLDC 00          Short load constant 0
   0c7f: STR  02 0011     Store TOS to G17
   0c82: UJP  $0e40       Unconditional jump
-> 0c84: LLA  0002        Load local address MP2
   0c86: SLDC 00          Short load constant 0
   0c87: STL  003c        Store TOS into MP60
   0c89: LLA  003c        Load local address MP60
   0c8b: LDA  02 00fc     Load addr G252
   0c8f: LDL  0039        Load local word MP57
   0c91: IXA  000c        Index array (TOS-1 + TOS * 12)
   0c93: LLA  00bc        Load local address MP188
   0c96: SLDC 01          Short load constant 1
   0c97: LSA  01          Load string address: ':'
   0c9a: NOP              No operation
   0c9b: LDA  02 00fc     Load addr G252
   0c9f: LDL  0039        Load local word MP57
   0ca1: IXA  000c        Index array (TOS-1 + TOS * 12)
   0ca3: SLDC 00          Short load constant 0
   0ca4: SLDC 00          Short load constant 0
   0ca5: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0ca8: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0cab: LLA  00bc        Load local address MP188
   0cae: SLDC 17          Short load constant 23
   0caf: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0cb2: LLA  003c        Load local address MP60
   0cb4: NOP              No operation
   0cb5: LSA  0f          Load string address: 'SYSTEM.SWAPDISK'
   0cc6: SLDC 26          Short load constant 38
   0cc7: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0cca: LLA  003c        Load local address MP60
   0ccc: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0cce: LOD  02 0037     Load word at G55
   0cd1: LLA  0002        Load local address MP2
   0cd3: SLDC 01          Short load constant 1
   0cd4: LDCN             Load constant NIL
   0cd5: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0cd8: LLA  002c        Load local address MP44
   0cda: NOP              No operation
   0cdb: LSA  13          Load string address: '*SYSTEM.WRK.CODE[*]'
   0cf0: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 0cf2: SLDC 01          Short load constant 1
   0cf3: STL  003b        Store TOS into MP59
   0cf5: LOD  02 0011     Load word at G17
   0cf8: LNOT             Logical NOT (~TOS)
   0cf9: FJP  $0dad       Jump if TOS false
   0cfb: LOD  02 0003     Load word at G3 (OUTPUT)
   0cfe: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0d01: LOD  02 0003     Load word at G3 (OUTPUT)
   0d04: NOP              No operation
   0d05: LSA  28          Load string address: 'To what codefile (<ret> for workfile) ? '
   0d2f: SLDC 00          Short load constant 0
   0d30: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0d33: LOD  02 0002     Load word at G2 (INPUT)
   0d36: LLA  0002        Load local address MP2
   0d38: SLDC 28          Short load constant 40
   0d39: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   0d3c: LOD  02 0002     Load word at G2 (INPUT)
   0d3f: CXP  00 15       Call external procedure PASCALSY.FREADLN
   0d42: LLA  0002        Load local address MP2
   0d44: NOP              No operation
   0d45: LSA  00          Load string address: ''
   0d47: NEQSTR           String TOS-1 <> TOS
   0d49: FJP  $0d5a       Jump if TOS false
   0d4b: LLA  0002        Load local address MP2
   0d4d: SLDC 01          Short load constant 1
   0d4e: LDB              Load byte at byte ptr TOS-1 + TOS
   0d4f: SLDC 10          Short load constant 16
   0d50: EQUI             Integer TOS-1 = TOS
   0d51: FJP  $0d5a       Jump if TOS false
   0d53: LLA  0002        Load local address MP2
   0d55: SLDC 01          Short load constant 1
   0d56: SLDC 02          Short load constant 2
   0d57: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0d5a: CLP  15          Call local procedure GETCMD.21
   0d5c: LLA  0002        Load local address MP2
   0d5e: NOP              No operation
   0d5f: LSA  00          Load string address: ''
   0d61: NEQSTR           String TOS-1 <> TOS
   0d63: FJP  $0dad       Jump if TOS false
   0d65: LLA  0002        Load local address MP2
   0d67: SLDC 01          Short load constant 1
   0d68: LDB              Load byte at byte ptr TOS-1 + TOS
   0d69: SLDC 1b          Short load constant 27
   0d6a: EQUI             Integer TOS-1 = TOS
   0d6b: FJP  $0d71       Jump if TOS false
   0d6d: UJP  $0e40       Unconditional jump
   0d6f: UJP  $0dad       Unconditional jump
-> 0d71: LSA  01          Load string address: '$'
   0d74: NOP              No operation
   0d75: LLA  0002        Load local address MP2
   0d77: SLDC 00          Short load constant 0
   0d78: SLDC 00          Short load constant 0
   0d79: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0d7c: STL  0038        Store TOS into MP56
   0d7e: LDL  0038        Load local word MP56
   0d80: SLDC 00          Short load constant 0
   0d81: GRTI             Integer TOS-1 > TOS
   0d82: FJP  $0d96       Jump if TOS false
   0d84: LLA  0002        Load local address MP2
   0d86: LDL  0038        Load local word MP56
   0d88: SLDC 01          Short load constant 1
   0d89: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0d8c: LLA  0017        Load local address MP23
   0d8e: LLA  0002        Load local address MP2
   0d90: SLDC 28          Short load constant 40
   0d91: LDL  0038        Load local word MP56
   0d93: CXP  00 18       Call external procedure PASCALSY.SINSERT
-> 0d96: LLA  0002        Load local address MP2
   0d98: SLDC 00          Short load constant 0
   0d99: SLDC 00          Short load constant 0
   0d9a: CGP  06          Call global procedure GETCMD.6
   0d9c: FJP  $0da0       Jump if TOS false
   0d9e: UJP  $0e40       Unconditional jump
-> 0da0: LLA  0002        Load local address MP2
   0da2: SLDC 00          Short load constant 0
   0da3: SLDC 17          Short load constant 23
   0da4: CXP  00 2b       Call external procedure PASCALSY.43
   0da7: LLA  002c        Load local address MP44
   0da9: LLA  0002        Load local address MP2
   0dab: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 0dad: LOD  02 0008     Load word at G8
   0db0: LLA  002c        Load local address MP44
   0db2: SLDC 00          Short load constant 0
   0db3: LDCN             Load constant NIL
   0db4: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0db7: CSP  22          Call standard procedure IORESULT
   0db9: SLDC 00          Short load constant 0
   0dba: NEQI             Integer TOS-1 <> TOS
   0dbb: FJP  $0e21       Jump if TOS false
   0dbd: SLDC 00          Short load constant 0
   0dbe: STL  003b        Store TOS into MP59
   0dc0: CSP  22          Call standard procedure IORESULT
   0dc2: STL  003a        Store TOS into MP58
   0dc4: LOD  02 0003     Load word at G3 (OUTPUT)
   0dc7: SLDC 07          Short load constant 7
   0dc8: SLDC 00          Short load constant 0
   0dc9: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0dcc: LOD  02 0003     Load word at G3 (OUTPUT)
   0dcf: LSA  0b          Load string address: 'I/O Error #'
   0ddc: NOP              No operation
   0ddd: SLDC 00          Short load constant 0
   0dde: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0de1: LOD  02 0003     Load word at G3 (OUTPUT)
   0de4: LDL  003a        Load local word MP58
   0de6: SLDC 00          Short load constant 0
   0de7: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0dea: LOD  02 0003     Load word at G3 (OUTPUT)
   0ded: LSA  17          Load string address: ' occured while opening '
   0e06: NOP              No operation
   0e07: SLDC 00          Short load constant 0
   0e08: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0e0b: LOD  02 0003     Load word at G3 (OUTPUT)
   0e0e: LLA  002c        Load local address MP44
   0e10: SLDC 00          Short load constant 0
   0e11: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0e14: LOD  02 0003     Load word at G3 (OUTPUT)
   0e17: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0e1a: LOD  02 0011     Load word at G17
   0e1d: FJP  $0e21       Jump if TOS false
   0e1f: UJP  $0e40       Unconditional jump
-> 0e21: LDL  003b        Load local word MP59
   0e23: FJP  $0cf2       Jump if TOS false
   0e25: SLDC 00          Short load constant 0
   0e26: STR  02 000a     Store TOS to G10
   0e29: SLDC 00          Short load constant 0
   0e2a: STR  02 000b     Store TOS to G11
   0e2d: SLDC 00          Short load constant 0
   0e2e: STR  02 000c     Store TOS to G12
   0e31: SLDL 01          Short load local MP1
   0e32: SLDC 08          Short load constant 8
   0e33: EQUI             Integer TOS-1 = TOS
   0e34: FJP  $0e39       Jump if TOS false
   0e36: SLDC 05          Short load constant 5
   0e37: STL  0001        Store TOS into MP1
-> 0e39: SLDL 01          Short load local MP1
   0e3a: SRO  0001        Store global word BASE1
   0e3c: SLDC 05          Short load constant 5
   0e3d: SLDC 01          Short load constant 1
   0e3e: CSP  04          Call standard procedure EXIT
-> 0e40: LOD  02 0009     Load word at G9
   0e43: SLDC 00          Short load constant 0
   0e44: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0e47: LOD  02 0037     Load word at G55
   0e4a: SLDC 00          Short load constant 0
   0e4b: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 0e4e: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC21 (* P=21 LL=2 *)
BEGIN
-> 0ae0: SLDC 01          Short load constant 1
   0ae1: LDA  01 0002     Load addr L12
   0ae4: SLDC 00          Short load constant 0
   0ae5: LDB              Load byte at byte ptr TOS-1 + TOS
   0ae6: SLDC 01          Short load constant 1
   0ae7: SLDC 20          Short load constant 32
   0ae8: LDA  01 0002     Load addr L12
   0aeb: SLDC 01          Short load constant 1
   0aec: SLDC 00          Short load constant 0
   0aed: CSP  0b          Call standard procedure SCAN
   0aef: ADI              Add integers (TOS + TOS-1)
   0af0: STR  01 0038     Store TOS to L156
   0af3: LDA  01 0002     Load addr L12
   0af6: SLDC 01          Short load constant 1
   0af7: LOD  01 0038     Load word at L1_56
   0afa: SLDC 01          Short load constant 1
   0afb: SBI              Subtract integers (TOS-1 - TOS)
   0afc: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0aff: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC22 (* P=22 LL=1 *)
  BASE1
  BASE3
  MP2
  MP10
BEGIN
-> 0e64: LOD  02 0009     Load word at G9
   0e67: SLDC 00          Short load constant 0
   0e68: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0e6b: LOD  02 0037     Load word at G55
   0e6e: SLDC 00          Short load constant 0
   0e6f: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0e72: LOD  02 000a     Load word at G10
   0e75: SLDC 00          Short load constant 0
   0e76: GRTI             Integer TOS-1 > TOS
   0e77: FJP  $0ea5       Jump if TOS false
   0e79: SLDC 00          Short load constant 0
   0e7a: STR  02 0010     Store TOS to G16
   0e7d: LOD  02 0008     Load word at G8
   0e80: SLDC 02          Short load constant 2
   0e81: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0e84: LOD  02 000b     Load word at G11
   0e87: SLDC 00          Short load constant 0
   0e88: GRTI             Integer TOS-1 > TOS
   0e89: FJP  $0ea3       Jump if TOS false
   0e8b: CXP  00 25       Call external procedure PASCALSY.37
   0e8e: LOD  02 0003     Load word at G3 (OUTPUT)
   0e91: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0e94: SLDC 02          Short load constant 2
   0e95: SLDC 01          Short load constant 1
   0e96: SLDC 00          Short load constant 0
   0e97: SLDC 00          Short load constant 0
   0e98: CGP  03          Call global procedure GETCMD.3
   0e9a: FJP  $0ea3       Jump if TOS false
   0e9c: SLDC 04          Short load constant 4
   0e9d: SRO  0001        Store global word BASE1
   0e9f: SLDC 05          Short load constant 5
   0ea0: SLDC 01          Short load constant 1
   0ea1: CSP  04          Call standard procedure EXIT
-> 0ea3: UJP  $0f40       Unconditional jump
-> 0ea5: LDA  02 001e     Load addr G30
   0ea8: NOP              No operation
   0ea9: LSA  0f          Load string address: 'SYSTEM.WRK.CODE'
   0eba: NEQSTR           String TOS-1 <> TOS
   0ebc: FJP  $0f31       Jump if TOS false
   0ebe: LDA  02 0012     Load addr G18
   0ec1: LOD  02 0008     Load word at G8
   0ec4: INC  0008        Inc field ptr (TOS+8)
   0ec6: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0ec8: LDA  02 001e     Load addr G30
   0ecb: LOD  02 0008     Load word at G8
   0ece: INC  0013        Inc field ptr (TOS+19)
   0ed0: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0ed2: LDA  02 001e     Load addr G30
   0ed5: LSA  0f          Load string address: 'SYSTEM.WRK.CODE'
   0ee6: NOP              No operation
   0ee7: NEQSTR           String TOS-1 <> TOS
   0ee9: FJP  $0f31       Jump if TOS false
   0eeb: LDA  02 001a     Load addr G26
   0eee: LDA  02 0012     Load addr G18
   0ef1: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0ef3: LDA  02 001e     Load addr G30
   0ef6: SLDC 00          Short load constant 0
   0ef7: LDB              Load byte at byte ptr TOS-1 + TOS
   0ef8: SLDC 05          Short load constant 5
   0ef9: GRTI             Integer TOS-1 > TOS
   0efa: FJP  $0f31       Jump if TOS false
   0efc: LDA  02 001e     Load addr G30
   0eff: LLA  0002        Load local address MP2
   0f01: LDA  02 001e     Load addr G30
   0f04: SLDC 00          Short load constant 0
   0f05: LDB              Load byte at byte ptr TOS-1 + TOS
   0f06: SLDC 04          Short load constant 4
   0f07: SBI              Subtract integers (TOS-1 - TOS)
   0f08: SLDC 05          Short load constant 5
   0f09: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0f0c: LLA  0002        Load local address MP2
   0f0e: NOP              No operation
   0f0f: LSA  05          Load string address: '.CODE'
   0f16: EQLSTR           String TOS-1 = TOS
   0f18: FJP  $0f31       Jump if TOS false
   0f1a: LDA  02 002e     Load addr G46
   0f1d: LDA  02 001e     Load addr G30
   0f20: LLA  000a        Load local address MP10
   0f22: SLDC 01          Short load constant 1
   0f23: LDA  02 001e     Load addr G30
   0f26: SLDC 00          Short load constant 0
   0f27: LDB              Load byte at byte ptr TOS-1 + TOS
   0f28: SLDC 05          Short load constant 5
   0f29: SBI              Subtract integers (TOS-1 - TOS)
   0f2a: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0f2d: LLA  000a        Load local address MP10
   0f2f: SAS  0f          String assign (TOS to TOS-1, 15 chars)
-> 0f31: SLDC 01          Short load constant 1
   0f32: STR  02 0010     Store TOS to G16
   0f35: SLDO 03          Short load global BASE3
   0f36: LDCI 00c0        Load word 192
   0f39: SLDC 01          Short load constant 1
   0f3a: INN              Set membership (TOS-1 in set TOS)
   0f3b: FJP  $0f40       Jump if TOS false
   0f3d: SLDC 01          Short load constant 1
   0f3e: CGP  02          Call global procedure GETCMD.2
-> 0f40: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC23(PARAM1) (* P=23 LL=1 *)
  MP1=PARAM1
BEGIN
-> 0f4e: LOD  02 0003     Load word at G3 (OUTPUT)
   0f51: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0f54: SLDL 01          Short load local MP1
   0f55: SLDC 01          Short load constant 1
   0f56: EQUI             Integer TOS-1 = TOS
   0f57: FJP  $0f87       Jump if TOS false
   0f59: LOD  02 0003     Load word at G3 (OUTPUT)
   0f5c: NOP              No operation
   0f5d: LSA  1c          Load string address: 'Nested exec commands illegal'
   0f7b: SLDC 00          Short load constant 0
   0f7c: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0f7f: LOD  02 0003     Load word at G3 (OUTPUT)
   0f82: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0f85: UJP  $0fa9       Unconditional jump
-> 0f87: LOD  02 0003     Load word at G3 (OUTPUT)
   0f8a: NOP              No operation
   0f8b: LSA  12          Load string address: 'Error opening exec'
   0f9f: SLDC 00          Short load constant 0
   0fa0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0fa3: LOD  02 0003     Load word at G3 (OUTPUT)
   0fa6: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0fa9: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC24 (* P=24 LL=1 *)
BEGIN
-> 0fb6: SLDC 20          Short load constant 32
   0fb7: STR  02 018a     Store TOS to G394
   0fbb: LOD  02 0036     Load word at G54
   0fbe: STR  02 017e     Store TOS to G382
   0fc2: LDA  02 017d     Load addr G381
   0fc6: LDCI 0100        Load word 256
   0fc9: CSP  01          Call standard procedure NEW
   0fcb: LDA  02 0036     Load addr G54
   0fce: CSP  20          Call standard procedure MARK
-> 0fd0: RNP  00          Return from nonbase procedure
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
-> 0fdc: SLDL 01          Short load local MP1
   0fdd: FJP  $0fe9       Jump if TOS false
   0fdf: LLA  0002        Load local address MP2
   0fe1: LDA  02 0148     Load addr G328
   0fe5: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0fe7: UJP  $1045       Unconditional jump
-> 0fe9: LOD  02 0003     Load word at G3 (OUTPUT)
   0fec: NOP              No operation
   0fed: LSA  07          Load string address: 'Execute'
   0ff6: SLDC 00          Short load constant 0
   0ff7: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ffa: LOD  02 0001     Load word at G1 (SYSCOM)
   0ffd: INC  001d        Inc field ptr (TOS+29)
   0fff: SLDC 01          Short load constant 1
   1000: SLDC 04          Short load constant 4
   1001: LDP              Load packed field (TOS)
   1002: LNOT             Logical NOT (~TOS)
   1003: FJP  $102a       Jump if TOS false
   1005: LOD  02 0003     Load word at G3 (OUTPUT)
   1008: NOP              No operation
   1009: LSA  1b          Load string address: ' what file (<ret> to exit) '
   1026: SLDC 00          Short load constant 0
   1027: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 102a: LOD  02 0003     Load word at G3 (OUTPUT)
   102d: LSA  02          Load string address: '? '
   1031: NOP              No operation
   1032: SLDC 00          Short load constant 0
   1033: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1036: LOD  02 0002     Load word at G2 (INPUT)
   1039: LLA  0002        Load local address MP2
   103b: SLDC 50          Short load constant 80
   103c: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   103f: LOD  02 0002     Load word at G2 (INPUT)
   1042: CXP  00 15       Call external procedure PASCALSY.FREADLN
-> 1045: LLA  0002        Load local address MP2
   1047: SLDC 00          Short load constant 0
   1048: LDB              Load byte at byte ptr TOS-1 + TOS
   1049: SLDC 00          Short load constant 0
   104a: GRTI             Integer TOS-1 > TOS
   104b: FJP  $1123       Jump if TOS false
   104d: LLA  0002        Load local address MP2
   104f: SLDC 00          Short load constant 0
   1050: LDB              Load byte at byte ptr TOS-1 + TOS
   1051: SLDC 05          Short load constant 5
   1052: GRTI             Integer TOS-1 > TOS
   1053: FJP  $1107       Jump if TOS false
   1055: LLA  002b        Load local address MP43
   1057: LLA  0002        Load local address MP2
   1059: LLA  0030        Load local address MP48
   105b: SLDC 01          Short load constant 1
   105c: SLDC 05          Short load constant 5
   105d: CXP  00 19       Call external procedure PASCALSY.SCOPY
   1060: LLA  0030        Load local address MP48
   1062: SAS  05          String assign (TOS to TOS-1, 5 chars)
   1064: SLDC 01          Short load constant 1
   1065: STL  002e        Store TOS into MP46
   1067: SLDC 04          Short load constant 4
   1068: STL  0030        Store TOS into MP48
-> 106a: LDL  002e        Load local word MP46
   106c: LDL  0030        Load local word MP48
   106e: LEQI             Integer TOS-1 <= TOS
   106f: FJP  $1094       Jump if TOS false
   1071: LLA  002b        Load local address MP43
   1073: LDL  002e        Load local word MP46
   1075: LDB              Load byte at byte ptr TOS-1 + TOS
   1076: STL  002f        Store TOS into MP47
   1078: LDL  002f        Load local word MP47
   107a: SLDC 61          Short load constant 97
   107b: GEQI             Integer TOS-1 >= TOS
   107c: LDL  002f        Load local word MP47
   107e: SLDC 7a          Short load constant 122
   107f: LEQI             Integer TOS-1 <= TOS
   1080: LAND             Logical AND (TOS & TOS-1)
   1081: FJP  $108c       Jump if TOS false
   1083: LLA  002b        Load local address MP43
   1085: LDL  002e        Load local word MP46
   1087: LDL  002f        Load local word MP47
   1089: SLDC 20          Short load constant 32
   108a: SBI              Subtract integers (TOS-1 - TOS)
   108b: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 108c: LDL  002e        Load local word MP46
   108e: SLDC 01          Short load constant 1
   108f: ADI              Add integers (TOS + TOS-1)
   1090: STL  002e        Store TOS into MP46
   1092: UJP  $106a       Unconditional jump
-> 1094: LLA  002b        Load local address MP43
   1096: NOP              No operation
   1097: LSA  05          Load string address: 'EXEC/'
   109e: EQLSTR           String TOS-1 = TOS
   10a0: FJP  $1107       Jump if TOS false
   10a2: LOD  02 0183     Load word at G387
   10a6: FJP  $10ad       Jump if TOS false
   10a8: SLDC 01          Short load constant 1
   10a9: CGP  17          Call global procedure GETCMD.23
   10ab: UJP  $1103       Unconditional jump
-> 10ad: LLA  0002        Load local address MP2
   10af: SLDC 01          Short load constant 1
   10b0: SLDC 05          Short load constant 5
   10b1: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   10b4: LLA  0002        Load local address MP2
   10b6: SLDC 00          Short load constant 0
   10b7: SLDC 00          Short load constant 0
   10b8: CGP  06          Call global procedure GETCMD.6
   10ba: FJP  $10c0       Jump if TOS false
   10bc: SLDC 05          Short load constant 5
   10bd: SLDC 19          Short load constant 25
   10be: CSP  04          Call standard procedure EXIT
-> 10c0: LLA  0002        Load local address MP2
   10c2: SLDC 01          Short load constant 1
   10c3: SLDC 50          Short load constant 80
   10c4: CXP  00 2b       Call external procedure PASCALSY.43
   10c7: LDA  02 018c     Load addr G396
   10cb: LLA  0002        Load local address MP2
   10cd: SLDC 01          Short load constant 1
   10ce: SLDC 00          Short load constant 0
   10cf: CXP  00 05       Call external procedure PASCALSY.FOPEN
   10d2: CSP  22          Call standard procedure IORESULT
   10d4: SLDC 00          Short load constant 0
   10d5: EQUI             Integer TOS-1 = TOS
   10d6: FJP  $1100       Jump if TOS false
   10d8: CGP  18          Call global procedure GETCMD.24
   10da: SLDC 01          Short load constant 1
   10db: STR  02 0182     Store TOS to G386
   10df: SLDC 01          Short load constant 1
   10e0: STR  02 0181     Store TOS to G385
   10e4: CXP  00 2e       Call external procedure PASCALSY.46
   10e7: LOD  02 017d     Load word at G381
   10eb: LOD  02 017f     Load word at G383
   10ef: LDB              Load byte at byte ptr TOS-1 + TOS
   10f0: STR  02 018b     Store TOS to G395
   10f4: LOD  02 017f     Load word at G383
   10f8: SLDC 01          Short load constant 1
   10f9: ADI              Add integers (TOS + TOS-1)
   10fa: STR  02 017f     Store TOS to G383
   10fe: UJP  $1103       Unconditional jump
-> 1100: SLDC 02          Short load constant 2
   1101: CGP  17          Call global procedure GETCMD.23
-> 1103: SLDC 05          Short load constant 5
   1104: SLDC 19          Short load constant 25
   1105: CSP  04          Call standard procedure EXIT
-> 1107: LLA  0002        Load local address MP2
   1109: SLDC 00          Short load constant 0
   110a: SLDC 50          Short load constant 80
   110b: CXP  00 2b       Call external procedure PASCALSY.43
   110e: LLA  0002        Load local address MP2
   1110: SLDC 00          Short load constant 0
   1111: SLDC 00          Short load constant 0
   1112: SLDC 01          Short load constant 1
   1113: LAO  0006        Load global BASE6
   1115: SLDC 00          Short load constant 0
   1116: SLDC 00          Short load constant 0
   1117: SLDC 00          Short load constant 0
   1118: CGP  13          Call global procedure GETCMD.19
   111a: FJP  $1123       Jump if TOS false
   111c: SLDC 04          Short load constant 4
   111d: SRO  0001        Store global word BASE1
   111f: SLDC 05          Short load constant 5
   1120: SLDC 01          Short load constant 1
   1121: CSP  04          Call standard procedure EXIT
-> 1123: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC26 (* P=26 LL=1 *)
  MP1
  MP2
BEGIN
-> 11b0: LOD  02 0186     Load word at G390
   11b4: LOD  02 0185     Load word at G389
   11b8: ADI              Add integers (TOS + TOS-1)
   11b9: STL  0002        Store TOS into MP2
   11bb: LOD  02 0003     Load word at G3 (OUTPUT)
   11be: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   11c1: LOD  02 0003     Load word at G3 (OUTPUT)
   11c4: NOP              No operation
   11c5: LSA  10          Load string address: 'Swapping levels:'
   11d7: SLDC 00          Short load constant 0
   11d8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   11db: LOD  02 0003     Load word at G3 (OUTPUT)
   11de: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   11e1: LOD  02 0003     Load word at G3 (OUTPUT)
   11e4: NOP              No operation
   11e5: LSA  1b          Load string address: '  0 = system is not swapped'
   1202: SLDC 00          Short load constant 0
   1203: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1206: LOD  02 0003     Load word at G3 (OUTPUT)
   1209: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   120c: LOD  02 0003     Load word at G3 (OUTPUT)
   120f: LSA  30          Load string address: '  1 = file open and close procedures are swapped'
   1241: NOP              No operation
   1242: SLDC 00          Short load constant 0
   1243: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1246: LOD  02 0003     Load word at G3 (OUTPUT)
   1249: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   124c: LOD  02 0003     Load word at G3 (OUTPUT)
   124f: LSA  3d          Load string address: '  2 = file open/close and disk get/put procedures are swapped'
   128e: NOP              No operation
   128f: SLDC 00          Short load constant 0
   1290: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1293: LOD  02 0003     Load word at G3 (OUTPUT)
   1296: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1299: LOD  02 0003     Load word at G3 (OUTPUT)
   129c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   129f: LOD  02 0003     Load word at G3 (OUTPUT)
   12a2: NOP              No operation
   12a3: LSA  16          Load string address: 'Old swapping level is '
   12bb: SLDC 00          Short load constant 0
   12bc: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   12bf: LOD  02 0003     Load word at G3 (OUTPUT)
   12c2: SLDL 02          Short load local MP2
   12c3: SLDC 00          Short load constant 0
   12c4: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   12c7: LOD  02 0003     Load word at G3 (OUTPUT)
   12ca: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   12cd: LOD  02 0003     Load word at G3 (OUTPUT)
   12d0: NOP              No operation
   12d1: LSA  24          Load string address: 'New swapping level (<esc> to exit): '
   12f7: SLDC 00          Short load constant 0
   12f8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 12fb: LOD  02 0004     Load word at G4 (SYSTERM)
   12fe: LLA  0001        Load local address MP1
   1300: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   1303: SLDL 01          Short load local MP1
   1304: SLDC 1b          Short load constant 27
   1305: EQUI             Integer TOS-1 = TOS
   1306: SLDL 01          Short load local MP1
   1307: SLDC 30          Short load constant 48
   1308: EQUI             Integer TOS-1 = TOS
   1309: LOR              Logical OR (TOS | TOS-1)
   130a: SLDL 01          Short load local MP1
   130b: SLDC 31          Short load constant 49
   130c: EQUI             Integer TOS-1 = TOS
   130d: LOR              Logical OR (TOS | TOS-1)
   130e: SLDL 01          Short load local MP1
   130f: SLDC 32          Short load constant 50
   1310: EQUI             Integer TOS-1 = TOS
   1311: LOR              Logical OR (TOS | TOS-1)
   1312: FJP  $12fb       Jump if TOS false
   1314: SLDL 01          Short load local MP1
   1318: LDC  04          Load multiple-word constant
                         0007000000000000
   1320: SLDC 04          Short load constant 4
   1321: INN              Set membership (TOS-1 in set TOS)
   1322: FJP  $1397       Jump if TOS false
   1324: LOD  02 0003     Load word at G3 (OUTPUT)
   1327: SLDL 01          Short load local MP1
   1328: SLDC 00          Short load constant 0
   1329: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   132c: SLDL 01          Short load local MP1
   132d: SLDC 32          Short load constant 50
   132e: EQUI             Integer TOS-1 = TOS
   132f: STR  02 0185     Store TOS to G389
   1333: SLDL 01          Short load local MP1
   1334: SLDC 31          Short load constant 49
   1335: EQUI             Integer TOS-1 = TOS
   1336: LOD  02 0185     Load word at G389
   133a: LOR              Logical OR (TOS | TOS-1)
   133b: STR  02 0186     Store TOS to G390
   133f: LOD  02 0185     Load word at G389
   1343: FJP  $1397       Jump if TOS false
   1345: LOD  02 0003     Load word at G3 (OUTPUT)
   1348: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   134b: LOD  02 0003     Load word at G3 (OUTPUT)
   134e: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1351: LOD  02 0003     Load word at G3 (OUTPUT)
   1354: NOP              No operation
   1355: LSA  3c          Load string address: 'Warning: programs using GET or PUT to disk will be very slow'
   1393: SLDC 00          Short load constant 0
   1394: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 1397: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC27 (* P=27 LL=1 *)
  MP1
  MP2
  MP23
  MP24
BEGIN
-> 13a6: LOD  02 0003     Load word at G3 (OUTPUT)
   13a9: LSA  0e          Load string address: 'New exec name:'
   13b9: NOP              No operation
   13ba: SLDC 00          Short load constant 0
   13bb: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   13be: LOD  02 0002     Load word at G2 (INPUT)
   13c1: LLA  0002        Load local address MP2
   13c3: SLDC 28          Short load constant 40
   13c4: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   13c7: LOD  02 0002     Load word at G2 (INPUT)
   13ca: CXP  00 15       Call external procedure PASCALSY.FREADLN
   13cd: LLA  0002        Load local address MP2
   13cf: SLDC 00          Short load constant 0
   13d0: LDB              Load byte at byte ptr TOS-1 + TOS
   13d1: SLDC 00          Short load constant 0
   13d2: GRTI             Integer TOS-1 > TOS
   13d3: FJP  $1427       Jump if TOS false
   13d5: LLA  0002        Load local address MP2
   13d7: LLA  0002        Load local address MP2
   13d9: SLDC 00          Short load constant 0
   13da: LDB              Load byte at byte ptr TOS-1 + TOS
   13db: LDB              Load byte at byte ptr TOS-1 + TOS
   13dc: SLDC 2e          Short load constant 46
   13dd: EQUI             Integer TOS-1 = TOS
   13de: STL  0017        Store TOS into MP23
   13e0: LLA  0002        Load local address MP2
   13e2: SLDC 00          Short load constant 0
   13e3: SLDC 00          Short load constant 0
   13e4: CGP  06          Call global procedure GETCMD.6
   13e6: FJP  $13ec       Jump if TOS false
   13e8: SLDC 05          Short load constant 5
   13e9: SLDC 1b          Short load constant 27
   13ea: CSP  04          Call standard procedure EXIT
-> 13ec: LLA  0002        Load local address MP2
   13ee: SLDC 01          Short load constant 1
   13ef: SLDC 25          Short load constant 37
   13f0: CXP  00 2b       Call external procedure PASCALSY.43
   13f3: LLA  0002        Load local address MP2
   13f5: SLDC 00          Short load constant 0
   13f6: LDB              Load byte at byte ptr TOS-1 + TOS
   13f7: SLDC 00          Short load constant 0
   13f8: GRTI             Integer TOS-1 > TOS
   13f9: LDL  0017        Load local word MP23
   13fb: LNOT             Logical NOT (~TOS)
   13fc: LAND             Logical AND (TOS & TOS-1)
   13fd: FJP  $1427       Jump if TOS false
   13ff: LLA  0002        Load local address MP2
   1401: LLA  0002        Load local address MP2
   1403: SLDC 00          Short load constant 0
   1404: LDB              Load byte at byte ptr TOS-1 + TOS
   1405: LDB              Load byte at byte ptr TOS-1 + TOS
   1406: SLDC 5d          Short load constant 93
   1407: NEQI             Integer TOS-1 <> TOS
   1408: FJP  $1427       Jump if TOS false
   140a: LLA  0002        Load local address MP2
   140c: SLDC 00          Short load constant 0
   140d: STL  0018        Store TOS into MP24
   140f: LLA  0018        Load local address MP24
   1411: LLA  0002        Load local address MP2
   1413: SLDC 28          Short load constant 40
   1414: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   1417: LLA  0018        Load local address MP24
   1419: LSA  03          Load string address: '[8]'
   141e: NOP              No operation
   141f: SLDC 2b          Short load constant 43
   1420: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   1423: LLA  0018        Load local address MP24
   1425: SAS  28          String assign (TOS to TOS-1, 40 chars)
-> 1427: LDA  02 018c     Load addr G396
   142b: LLA  0002        Load local address MP2
   142d: SLDC 00          Short load constant 0
   142e: SLDC 00          Short load constant 0
   142f: CXP  00 05       Call external procedure PASCALSY.FOPEN
   1432: CSP  22          Call standard procedure IORESULT
   1434: SLDC 00          Short load constant 0
   1435: EQUI             Integer TOS-1 = TOS
   1436: FJP  $14e4       Jump if TOS false
   1438: SLDC 25          Short load constant 37
   1439: STR  02 018b     Store TOS to G395
   143d: LOD  02 0003     Load word at G3 (OUTPUT)
   1440: NOP              No operation
   1441: LSA  0b          Load string address: 'Terminator='
   144e: SLDC 00          Short load constant 0
   144f: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1452: LOD  02 0003     Load word at G3 (OUTPUT)
   1455: LOD  02 018b     Load word at G395
   1459: SLDC 00          Short load constant 0
   145a: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   145d: LOD  02 0003     Load word at G3 (OUTPUT)
   1460: NOP              No operation
   1461: LSA  0c          Load string address: ', change it?'
   146f: SLDC 00          Short load constant 0
   1470: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1473: SLDC 00          Short load constant 0
   1474: SLDC 00          Short load constant 0
   1475: CGP  04          Call global procedure GETCMD.4
   1477: FJP  $14a2       Jump if TOS false
   1479: LOD  02 0003     Load word at G3 (OUTPUT)
   147c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   147f: LOD  02 0003     Load word at G3 (OUTPUT)
   1482: NOP              No operation
   1483: LSA  0f          Load string address: 'New terminator:'
   1494: SLDC 00          Short load constant 0
   1495: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1498: LOD  02 0002     Load word at G2 (INPUT)
   149b: LDA  02 018b     Load addr G395
   149f: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
-> 14a2: CGP  18          Call global procedure GETCMD.24
   14a4: SLDC 01          Short load constant 1
   14a5: STR  02 0183     Store TOS to G387
   14a9: LOD  02 017d     Load word at G381
   14ad: SLDC 00          Short load constant 0
   14ae: LDCI 0200        Load word 512
   14b1: SLDC 00          Short load constant 0
   14b2: CSP  0a          Call standard procedure FLCH
   14b4: SLDC 00          Short load constant 0
   14b5: STR  02 0181     Store TOS to G385
   14b9: SLDC 01          Short load constant 1
   14ba: STL  0001        Store TOS into MP1
   14bc: SLDC 02          Short load constant 2
   14bd: STL  0018        Store TOS into MP24
-> 14bf: SLDL 01          Short load local MP1
   14c0: LDL  0018        Load local word MP24
   14c2: LEQI             Integer TOS-1 <= TOS
   14c3: FJP  $14d5       Jump if TOS false
   14c5: LOD  02 0183     Load word at G387
   14c9: FJP  $14ce       Jump if TOS false
   14cb: CXP  00 2f       Call external procedure PASCALSY.47
-> 14ce: SLDL 01          Short load local MP1
   14cf: SLDC 01          Short load constant 1
   14d0: ADI              Add integers (TOS + TOS-1)
   14d1: STL  0001        Store TOS into MP1
   14d3: UJP  $14bf       Unconditional jump
-> 14d5: LOD  02 0183     Load word at G387
   14d9: FJP  $14e2       Jump if TOS false
   14db: LOD  02 018b     Load word at G395
   14df: CXP  00 2c       Call external procedure PASCALSY.44
-> 14e2: UJP  $14e7       Unconditional jump
-> 14e4: SLDC 02          Short load constant 2
   14e5: CGP  17          Call global procedure GETCMD.23
-> 14e7: RNP  00          Return from nonbase procedure
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
-> 0862: SLDO 06          Short load global BASE6
   0863: UJP  $08a5       Unconditional jump
   0865: SLDO 05          Short load global BASE5
   0866: CLP  03          Call local procedure FILEPROC.3
   0868: UJP  $08b4       Unconditional jump
   086a: SLDO 05          Short load global BASE5
   086b: SLDO 04          Short load global BASE4
   086c: SLDO 03          Short load global BASE3
   086d: SLDO 02          Short load global BASE2
   086e: CLP  04          Call local procedure FILEPROC.4
   0870: UJP  $08b4       Unconditional jump
   0872: SLDO 01          Short load global BASE1
   0873: UJP  $0889       Unconditional jump
   0875: SLDC 00          Short load constant 0
   0876: SRO  0007        Store global word BASE7
   0878: UJP  $0898       Unconditional jump
   087a: SLDC 01          Short load constant 1
   087b: SRO  0007        Store global word BASE7
   087d: UJP  $0898       Unconditional jump
   087f: SLDC 02          Short load constant 2
   0880: SRO  0007        Store global word BASE7
   0882: UJP  $0898       Unconditional jump
   0884: SLDC 03          Short load constant 3
   0885: SRO  0007        Store global word BASE7
   0887: UJP  $0898       Unconditional jump
-> 0898: SLDO 05          Short load global BASE5
   0899: SLDO 07          Short load global BASE7
   089a: CLP  07          Call local procedure FILEPROC.7
   089c: UJP  $08b4       Unconditional jump
   089e: SLDO 04          Short load global BASE4
   089f: SLDO 03          Short load global BASE3
   08a0: SLDO 01          Short load global BASE1
   08a1: CLP  08          Call local procedure FILEPROC.8
   08a3: UJP  $08b4       Unconditional jump
-> 08b4: RBP  00          Return from base procedure
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
   073f: FJP  $0849       Jump if TOS false
   0741: SLDL 03          Short load local MP3
   0742: SLDL 04          Short load local MP4
   0743: LDB              Load byte at byte ptr TOS-1 + TOS
   0744: SLDC 2e          Short load constant 46
   0745: NEQI             Integer TOS-1 <> TOS
   0746: FJP  $0843       Jump if TOS false
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
   078b: FJP  $082a       Jump if TOS false
   078d: SLDL 03          Short load local MP3
   078e: SLDL 04          Short load local MP4
   078f: LDB              Load byte at byte ptr TOS-1 + TOS
   0790: SLDC 3a          Short load constant 58
   0791: NEQI             Integer TOS-1 <> TOS
   0792: FJP  $082a       Jump if TOS false
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
   07bb: FJP  $07f0       Jump if TOS false
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
-> 07de: SLDL 03          Short load local MP3
   07df: SLDL 05          Short load local MP5
   07e0: LDB              Load byte at byte ptr TOS-1 + TOS
   07e1: SLDC 20          Short load constant 32
   07e2: LESI             Integer TOS-1 < TOS
   07e3: FJP  $07e9       Jump if TOS false
   07e5: SLDL 03          Short load local MP3
   07e6: SLDL 05          Short load local MP5
   07e7: SLDC 3f          Short load constant 63
   07e8: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 07e9: SLDL 05          Short load local MP5
   07ea: SLDC 01          Short load constant 1
   07eb: ADI              Add integers (TOS + TOS-1)
   07ec: STL  0005        Store TOS into MP5
   07ee: UJP  $07b7       Unconditional jump
-> 07f0: SLDL 04          Short load local MP4
   07f1: SLDC 05          Short load constant 5
   07f2: GRTI             Integer TOS-1 > TOS
   07f3: FJP  $0807       Jump if TOS false
   07f5: LLA  001e        Load local address MP30
   07f7: SLDL 03          Short load local MP3
   07f8: LLA  0021        Load local address MP33
   07fa: SLDL 04          Short load local MP4
   07fb: SLDC 05          Short load constant 5
   07fc: SBI              Subtract integers (TOS-1 - TOS)
   07fd: SLDC 01          Short load constant 1
   07fe: ADI              Add integers (TOS + TOS-1)
   07ff: SLDC 05          Short load constant 5
   0800: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0803: LLA  0021        Load local address MP33
   0805: SAS  05          String assign (TOS to TOS-1, 5 chars)
-> 0807: LLA  001e        Load local address MP30
   0809: LLA  001b        Load local address MP27
   080b: NEQSTR           String TOS-1 <> TOS
   080d: SLDL 04          Short load local MP4
   080e: LLA  0006        Load local address MP6
   0810: SLDC 00          Short load constant 0
   0811: LDB              Load byte at byte ptr TOS-1 + TOS
   0812: ADI              Add integers (TOS + TOS-1)
   0813: SLDL 01          Short load local MP1
   0814: SLDC 05          Short load constant 5
   0815: SBI              Subtract integers (TOS-1 - TOS)
   0816: LEQI             Integer TOS-1 <= TOS
   0817: LAND             Logical AND (TOS & TOS-1)
   0818: FJP  $082a       Jump if TOS false
   081a: LLA  001b        Load local address MP27
   081c: SLDC 01          Short load constant 1
   081d: SLDL 03          Short load local MP3
   081e: SLDL 04          Short load local MP4
   081f: SLDC 01          Short load constant 1
   0820: ADI              Add integers (TOS + TOS-1)
   0821: SLDC 05          Short load constant 5
   0822: CSP  02          Call standard procedure MOVL
   0824: SLDL 03          Short load local MP3
   0825: SLDC 00          Short load constant 0
   0826: SLDL 04          Short load local MP4
   0827: SLDC 05          Short load constant 5
   0828: ADI              Add integers (TOS + TOS-1)
   0829: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 082a: SLDL 03          Short load local MP3
   082b: SLDC 00          Short load constant 0
   082c: STL  0021        Store TOS into MP33
   082e: LLA  0021        Load local address MP33
   0830: SLDL 03          Short load local MP3
   0831: SLDC 50          Short load constant 80
   0832: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0835: LLA  0021        Load local address MP33
   0837: LLA  0006        Load local address MP6
   0839: SLDC 78          Short load constant 120
   083a: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   083d: LLA  0021        Load local address MP33
   083f: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0841: UJP  $0849       Unconditional jump
-> 0843: SLDL 03          Short load local MP3
   0844: SLDC 00          Short load constant 0
   0845: SLDL 04          Short load local MP4
   0846: SLDC 01          Short load constant 1
   0847: SBI              Subtract integers (TOS-1 - TOS)
   0848: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0849: RNP  00          Return from nonbase procedure
END

