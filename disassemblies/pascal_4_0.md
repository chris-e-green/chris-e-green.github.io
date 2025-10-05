#  SYSTEM.PASCAL-04-00.bin 

## Segment Table
| slot |segNum | name | block | length | kind | textAddr | mType | version |
|-----:|------:|------|------:|-------:|------|---------:|-------|--------:|
| 0 | 0 | PASCALSY | 0001 | 3158 | linked | 0000 | 2 | 6 |
| 15 | 15 |  | 0008 | 3360 | linked | 0000 | 0 | 0 |
| 1 | 1 | USERPROG | 000F | 56 | linked | 0000 | 2 | 6 |
| 2 | 2 | FIOPRIMS | 0010 | 796 | linked_intrins | 0000 | 2 | 6 |
| 3 | 3 | PRINTERR | 0012 | 1156 | linked | 0000 | 2 | 6 |
| 4 | 4 | INITIALI | 0015 | 3146 | linked | 0000 | 2 | 6 |
| 5 | 5 | GETCMD | 001C | 5366 | linked | 0000 | 2 | 6 |
| 6 | 6 | FILEPROC | 0027 | 2258 | linked | 0000 | 2 | 6 |

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
-> 04a8: SLDC 01          Short load constant 1
   04a9: SRO  0004        Store global word BASE4
   04ab: LAO  0008        Load global BASE8
   04ad: SLDC 00          Short load constant 0
   04ae: SLDC 0a          Short load constant 10
   04af: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   04b0: SLDC 01          Short load constant 1
   04b1: SRO  0007        Store global word BASE7
   04b3: SLDO 02          Short load global BASE2
   04b4: SLDC 00          Short load constant 0
   04b5: LESI             Integer TOS-1 < TOS
   04b6: FJP  $04df       Jump if TOS false
   04b8: SLDO 02          Short load global BASE2
   04b9: LDCI 7fff        Load word 32767
   04bc: NGI              Negate integer
   04bd: SLDC 01          Short load constant 1
   04be: SBI              Subtract integers (TOS-1 - TOS)
   04bf: EQUI             Integer TOS-1 = TOS
   04c0: FJP  $04d3       Jump if TOS false
   04c2: LAO  0008        Load global BASE8
   04c4: NOP              No operation
   04c5: LSA  06          Load string address: '-32768'
   04cd: SAS  0a          String assign (TOS to TOS-1, 10 chars)
   04cf: UJP  $052f       Unconditional jump
   04d1: UJP  $04df       Unconditional jump
-> 04d3: SLDO 02          Short load global BASE2
   04d4: ABI              Absolute value of integer (TOS)
   04d5: SRO  0002        Store global word BASE2
   04d7: LAO  0008        Load global BASE8
   04d9: SLDC 01          Short load constant 1
   04da: SLDC 2d          Short load constant 45
   04db: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   04dc: SLDC 02          Short load constant 2
   04dd: SRO  0004        Store global word BASE4
-> 04df: SLDC 04          Short load constant 4
   04e0: SRO  0005        Store global word BASE5
   04e2: SLDC 00          Short load constant 0
   04e3: SRO  000e        Store global word BASE14
-> 04e5: SLDO 05          Short load global BASE5
   04e6: SLDO 0e          Short load global BASE14
   04e7: GEQI             Integer TOS-1 >= TOS
   04e8: FJP  $0528       Jump if TOS false
   04ea: SLDO 02          Short load global BASE2
   04eb: LDA  01 006f     Load addr G111
   04ee: SLDO 05          Short load global BASE5
   04ef: IXA  0001        Index array (TOS-1 + TOS * 1)
   04f1: SIND 00          Short index load *TOS+0
   04f2: DVI              Divide integers (TOS-1 / TOS)
   04f3: SLDC 30          Short load constant 48
   04f4: ADI              Add integers (TOS + TOS-1)
   04f5: SRO  0006        Store global word BASE6
   04f7: SLDO 06          Short load global BASE6
   04f8: SLDC 30          Short load constant 48
   04f9: EQUI             Integer TOS-1 = TOS
   04fa: SLDO 05          Short load global BASE5
   04fb: SLDC 00          Short load constant 0
   04fc: GRTI             Integer TOS-1 > TOS
   04fd: LAND             Logical AND (TOS & TOS-1)
   04fe: SLDO 07          Short load global BASE7
   04ff: LAND             Logical AND (TOS & TOS-1)
   0500: FJP  $0504       Jump if TOS false
   0502: UJP  $0521       Unconditional jump
-> 0504: SLDC 00          Short load constant 0
   0505: SRO  0007        Store global word BASE7
   0507: LAO  0008        Load global BASE8
   0509: SLDO 04          Short load global BASE4
   050a: SLDO 06          Short load global BASE6
   050b: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   050c: SLDO 04          Short load global BASE4
   050d: SLDC 01          Short load constant 1
   050e: ADI              Add integers (TOS + TOS-1)
   050f: SRO  0004        Store global word BASE4
   0511: SLDO 06          Short load global BASE6
   0512: SLDC 30          Short load constant 48
   0513: NEQI             Integer TOS-1 <> TOS
   0514: FJP  $0521       Jump if TOS false
   0516: SLDO 02          Short load global BASE2
   0517: LDA  01 006f     Load addr G111
   051a: SLDO 05          Short load global BASE5
   051b: IXA  0001        Index array (TOS-1 + TOS * 1)
   051d: SIND 00          Short index load *TOS+0
   051e: MODI             Modulo integers (TOS-1 % TOS)
   051f: SRO  0002        Store global word BASE2
-> 0521: SLDO 05          Short load global BASE5
   0522: SLDC 01          Short load constant 1
   0523: SBI              Subtract integers (TOS-1 - TOS)
   0524: SRO  0005        Store global word BASE5
   0526: UJP  $04e5       Unconditional jump
-> 0528: LAO  0008        Load global BASE8
   052a: SLDC 00          Short load constant 0
   052b: SLDO 04          Short load global BASE4
   052c: SLDC 01          Short load constant 1
   052d: SBI              Subtract integers (TOS-1 - TOS)
   052e: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 052f: SLDO 01          Short load global BASE1
   0530: LAO  0008        Load global BASE8
   0532: SLDC 00          Short load constant 0
   0533: LDB              Load byte at byte ptr TOS-1 + TOS
   0534: LESI             Integer TOS-1 < TOS
   0535: FJP  $053d       Jump if TOS false
   0537: LAO  0008        Load global BASE8
   0539: SLDC 00          Short load constant 0
   053a: LDB              Load byte at byte ptr TOS-1 + TOS
   053b: SRO  0001        Store global word BASE1
-> 053d: SLDO 03          Short load global BASE3
   053e: LAO  0008        Load global BASE8
   0540: SLDO 01          Short load global BASE1
   0541: CBP  13          Call base procedure PASCALSY.FWRITESTRING
-> 0543: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XREADREAL (* P=14 LL=0 *)
BEGIN
-> 0552: LOD  01 0001     Load word at G1 (SYSCOM)
   0555: INC  0001        Inc field ptr (TOS+1)
   0557: SLDC 0b          Short load constant 11
   0558: STO              Store indirect (TOS into TOS-1)
   0559: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 055b: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XWRITEREAL (* P=15 LL=0 *)
BEGIN
-> 0568: LOD  01 0001     Load word at G1 (SYSCOM)
   056b: INC  0001        Inc field ptr (TOS+1)
   056d: SLDC 0b          Short load constant 11
   056e: STO              Store indirect (TOS into TOS-1)
   056f: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 0571: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADCHAR(PARAM1; PARAM2) (* P=16 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 057e: SLDO 02          Short load global BASE2
   057f: SRO  0003        Store global word BASE3
   0581: LOD  01 0001     Load word at G1 (SYSCOM)
   0584: SLDC 00          Short load constant 0
   0585: STO              Store indirect (TOS into TOS-1)
   0586: SLDO 03          Short load global BASE3
   0587: SIND 03          Short index load *TOS+3
   0588: SLDC 01          Short load constant 1
   0589: EQUI             Integer TOS-1 = TOS
   058a: FJP  $058f       Jump if TOS false
   058c: SLDO 02          Short load global BASE2
   058d: CBP  07          Call base procedure PASCALSY.FGET
-> 058f: SLDO 01          Short load global BASE1
   0590: SLDO 03          Short load global BASE3
   0591: SIND 00          Short index load *TOS+0
   0592: SLDC 00          Short load constant 0
   0593: LDB              Load byte at byte ptr TOS-1 + TOS
   0594: STO              Store indirect (TOS into TOS-1)
   0595: SLDO 03          Short load global BASE3
   0596: SIND 03          Short index load *TOS+3
   0597: SLDC 00          Short load constant 0
   0598: EQUI             Integer TOS-1 = TOS
   0599: FJP  $05a0       Jump if TOS false
   059b: SLDO 02          Short load global BASE2
   059c: CBP  07          Call base procedure PASCALSY.FGET
   059e: UJP  $05a5       Unconditional jump
-> 05a0: SLDO 03          Short load global BASE3
   05a1: INC  0003        Inc field ptr (TOS+3)
   05a3: SLDC 01          Short load constant 1
   05a4: STO              Store indirect (TOS into TOS-1)
-> 05a5: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITECHAR(PARAM1; PARAM2; PARAM3) (* P=17 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 05b2: SLDO 03          Short load global BASE3
   05b3: SRO  0004        Store global word BASE4
   05b5: SLDO 04          Short load global BASE4
   05b6: SIND 05          Short index load *TOS+5
   05b7: FJP  $05d7       Jump if TOS false
-> 05b9: SLDO 01          Short load global BASE1
   05ba: SLDC 01          Short load constant 1
   05bb: GRTI             Integer TOS-1 > TOS
   05bc: FJP  $05cd       Jump if TOS false
   05be: SLDO 04          Short load global BASE4
   05bf: SIND 00          Short index load *TOS+0
   05c0: SLDC 00          Short load constant 0
   05c1: SLDC 20          Short load constant 32
   05c2: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   05c3: SLDO 03          Short load global BASE3
   05c4: CBP  08          Call base procedure PASCALSY.FPUT
   05c6: SLDO 01          Short load global BASE1
   05c7: SLDC 01          Short load constant 1
   05c8: SBI              Subtract integers (TOS-1 - TOS)
   05c9: SRO  0001        Store global word BASE1
   05cb: UJP  $05b9       Unconditional jump
-> 05cd: SLDO 04          Short load global BASE4
   05ce: SIND 00          Short index load *TOS+0
   05cf: SLDC 00          Short load constant 0
   05d0: SLDO 02          Short load global BASE2
   05d1: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   05d2: SLDO 03          Short load global BASE3
   05d3: CBP  08          Call base procedure PASCALSY.FPUT
   05d5: UJP  $05dc       Unconditional jump
-> 05d7: LOD  01 0001     Load word at G1 (SYSCOM)
   05da: SLDC 0d          Short load constant 13
   05db: STO              Store indirect (TOS into TOS-1)
-> 05dc: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADSTRING(PARAM1; PARAM2; PARAM3) (* P=18 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 05ea: SLDO 03          Short load global BASE3
   05eb: SRO  0006        Store global word BASE6
   05ed: SLDC 01          Short load constant 1
   05ee: SRO  0004        Store global word BASE4
   05f0: SLDO 06          Short load global BASE6
   05f1: SIND 03          Short index load *TOS+3
   05f2: SLDC 01          Short load constant 1
   05f3: EQUI             Integer TOS-1 = TOS
   05f4: FJP  $05f9       Jump if TOS false
   05f6: SLDO 03          Short load global BASE3
   05f7: CBP  07          Call base procedure PASCALSY.FGET
-> 05f9: SLDO 02          Short load global BASE2
   05fa: SLDC 00          Short load constant 0
   05fb: SLDO 01          Short load global BASE1
   05fc: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 05fd: SLDO 04          Short load global BASE4
   05fe: SLDO 01          Short load global BASE1
   05ff: LEQI             Integer TOS-1 <= TOS
   0600: SLDO 06          Short load global BASE6
   0601: SIND 01          Short index load *TOS+1
   0602: SLDO 06          Short load global BASE6
   0603: SIND 02          Short index load *TOS+2
   0604: LOR              Logical OR (TOS | TOS-1)
   0605: LNOT             Logical NOT (~TOS)
   0606: LAND             Logical AND (TOS & TOS-1)
   0607: FJP  $063a       Jump if TOS false
   0609: SLDO 06          Short load global BASE6
   060a: SIND 00          Short index load *TOS+0
   060b: SLDC 00          Short load constant 0
   060c: LDB              Load byte at byte ptr TOS-1 + TOS
   060d: SRO  0005        Store global word BASE5
   060f: SLDO 06          Short load global BASE6
   0610: SIND 07          Short index load *TOS+7
   0611: SLDC 01          Short load constant 1
   0612: EQUI             Integer TOS-1 = TOS
   0613: FJP  $062c       Jump if TOS false
   0615: SLDO 05          Short load global BASE5
   0616: LAO  0004        Load global BASE4
   0618: SLDO 02          Short load global BASE2
   0619: SLDC 00          Short load constant 0
   061a: SLDC 00          Short load constant 0
   061b: CBP  36          Call base procedure PASCALSY.54
   061d: FJP  $0621       Jump if TOS false
   061f: UJP  $062a       Unconditional jump
-> 0621: SLDO 02          Short load global BASE2
   0622: SLDO 04          Short load global BASE4
   0623: SLDO 05          Short load global BASE5
   0624: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0625: SLDO 04          Short load global BASE4
   0626: SLDC 01          Short load constant 1
   0627: ADI              Add integers (TOS + TOS-1)
   0628: SRO  0004        Store global word BASE4
-> 062a: UJP  $0635       Unconditional jump
-> 062c: SLDO 02          Short load global BASE2
   062d: SLDO 04          Short load global BASE4
   062e: SLDO 05          Short load global BASE5
   062f: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0630: SLDO 04          Short load global BASE4
   0631: SLDC 01          Short load constant 1
   0632: ADI              Add integers (TOS + TOS-1)
   0633: SRO  0004        Store global word BASE4
-> 0635: SLDO 03          Short load global BASE3
   0636: CBP  07          Call base procedure PASCALSY.FGET
   0638: UJP  $05fd       Unconditional jump
-> 063a: SLDO 02          Short load global BASE2
   063b: SLDC 00          Short load constant 0
   063c: SLDO 04          Short load global BASE4
   063d: SLDC 01          Short load constant 1
   063e: SBI              Subtract integers (TOS-1 - TOS)
   063f: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0640: SLDO 06          Short load global BASE6
   0641: SIND 01          Short index load *TOS+1
   0642: LNOT             Logical NOT (~TOS)
   0643: FJP  $064a       Jump if TOS false
   0645: SLDO 03          Short load global BASE3
   0646: CBP  07          Call base procedure PASCALSY.FGET
   0648: UJP  $0640       Unconditional jump
-> 064a: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITESTRING(PARAM1; PARAM2; PARAM3) (* P=19 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 065a: SLDO 01          Short load global BASE1
   065b: SLDC 00          Short load constant 0
   065c: LEQI             Integer TOS-1 <= TOS
   065d: FJP  $0664       Jump if TOS false
   065f: SLDO 02          Short load global BASE2
   0660: SLDC 00          Short load constant 0
   0661: LDB              Load byte at byte ptr TOS-1 + TOS
   0662: SRO  0001        Store global word BASE1
-> 0664: SLDO 03          Short load global BASE3
   0665: SLDO 02          Short load global BASE2
   0666: SLDC 01          Short load constant 1
   0667: ADI              Add integers (TOS + TOS-1)
   0668: SLDO 01          Short load global BASE1
   0669: SLDO 02          Short load global BASE2
   066a: SLDC 00          Short load constant 0
   066b: LDB              Load byte at byte ptr TOS-1 + TOS
   066c: CBP  14          Call base procedure PASCALSY.FWRITEBYTES
-> 066e: RBP  00          Return from base procedure
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
-> 067a: LOD  01 0001     Load word at G1 (SYSCOM)
   067d: SLDC 00          Short load constant 0
   067e: STO              Store indirect (TOS into TOS-1)
   067f: SLDO 04          Short load global BASE4
   0680: SRO  0007        Store global word BASE7
   0682: SLDO 07          Short load global BASE7
   0683: SIND 05          Short index load *TOS+5
   0684: FJP  $06d6       Jump if TOS false
   0686: SLDO 02          Short load global BASE2
   0687: SLDO 01          Short load global BASE1
   0688: GRTI             Integer TOS-1 > TOS
   0689: FJP  $06a7       Jump if TOS false
   068b: SLDO 02          Short load global BASE2
   068c: SLDO 01          Short load global BASE1
   068d: SBI              Subtract integers (TOS-1 - TOS)
   068e: SRO  0006        Store global word BASE6
-> 0690: SLDO 06          Short load global BASE6
   0691: SLDC 00          Short load constant 0
   0692: GRTI             Integer TOS-1 > TOS
   0693: FJP  $06a4       Jump if TOS false
   0695: SLDO 07          Short load global BASE7
   0696: SIND 00          Short index load *TOS+0
   0697: SLDC 00          Short load constant 0
   0698: SLDC 20          Short load constant 32
   0699: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   069a: SLDO 04          Short load global BASE4
   069b: CBP  08          Call base procedure PASCALSY.FPUT
   069d: SLDO 06          Short load global BASE6
   069e: SLDC 01          Short load constant 1
   069f: SBI              Subtract integers (TOS-1 - TOS)
   06a0: SRO  0006        Store global word BASE6
   06a2: UJP  $0690       Unconditional jump
-> 06a4: SLDO 01          Short load global BASE1
   06a5: SRO  0002        Store global word BASE2
-> 06a7: SLDO 07          Short load global BASE7
   06a8: IND  001d        Static index and load word (TOS+29)
   06aa: FJP  $06cb       Jump if TOS false
   06ac: SLDC 00          Short load constant 0
   06ad: SRO  0005        Store global word BASE5
-> 06af: SLDO 05          Short load global BASE5
   06b0: SLDO 02          Short load global BASE2
   06b1: LESI             Integer TOS-1 < TOS
   06b2: SLDO 07          Short load global BASE7
   06b3: SIND 02          Short index load *TOS+2
   06b4: LNOT             Logical NOT (~TOS)
   06b5: LAND             Logical AND (TOS & TOS-1)
   06b6: FJP  $06c9       Jump if TOS false
   06b8: SLDO 07          Short load global BASE7
   06b9: SIND 00          Short index load *TOS+0
   06ba: SLDC 00          Short load constant 0
   06bb: SLDO 03          Short load global BASE3
   06bc: SLDO 05          Short load global BASE5
   06bd: LDB              Load byte at byte ptr TOS-1 + TOS
   06be: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   06bf: SLDO 04          Short load global BASE4
   06c0: CBP  08          Call base procedure PASCALSY.FPUT
   06c2: SLDO 05          Short load global BASE5
   06c3: SLDC 01          Short load constant 1
   06c4: ADI              Add integers (TOS + TOS-1)
   06c5: SRO  0005        Store global word BASE5
   06c7: UJP  $06af       Unconditional jump
-> 06c9: UJP  $06d4       Unconditional jump
-> 06cb: SLDO 07          Short load global BASE7
   06cc: SIND 07          Short index load *TOS+7
   06cd: SLDO 03          Short load global BASE3
   06ce: SLDC 00          Short load constant 0
   06cf: SLDO 02          Short load global BASE2
   06d0: SLDC 00          Short load constant 0
   06d1: SLDC 00          Short load constant 0
   06d2: CSP  06          Call standard procedure UNITWRITE
-> 06d4: UJP  $06db       Unconditional jump
-> 06d6: LOD  01 0001     Load word at G1 (SYSCOM)
   06d9: SLDC 0d          Short load constant 13
   06da: STO              Store indirect (TOS into TOS-1)
-> 06db: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADLN(PARAM1) (* P=21 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 06ec: SLDO 01          Short load global BASE1
   06ed: SIND 01          Short index load *TOS+1
   06ee: LNOT             Logical NOT (~TOS)
   06ef: FJP  $06f6       Jump if TOS false
   06f1: SLDO 01          Short load global BASE1
   06f2: CBP  07          Call base procedure PASCALSY.FGET
   06f4: UJP  $06ec       Unconditional jump
-> 06f6: SLDO 01          Short load global BASE1
   06f7: SIND 03          Short index load *TOS+3
   06f8: SLDC 00          Short load constant 0
   06f9: EQUI             Integer TOS-1 = TOS
   06fa: FJP  $0701       Jump if TOS false
   06fc: SLDO 01          Short load global BASE1
   06fd: CBP  07          Call base procedure PASCALSY.FGET
   06ff: UJP  $070b       Unconditional jump
-> 0701: SLDO 01          Short load global BASE1
   0702: INC  0003        Inc field ptr (TOS+3)
   0704: SLDC 01          Short load constant 1
   0705: STO              Store indirect (TOS into TOS-1)
   0706: SLDO 01          Short load global BASE1
   0707: INC  0001        Inc field ptr (TOS+1)
   0709: SLDC 00          Short load constant 0
   070a: STO              Store indirect (TOS into TOS-1)
-> 070b: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITELN(PARAM1) (* P=22 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 071a: SLDO 01          Short load global BASE1
   071b: SIND 00          Short index load *TOS+0
   071c: SLDC 00          Short load constant 0
   071d: SLDC 0d          Short load constant 13
   071e: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   071f: SLDO 01          Short load global BASE1
   0720: CBP  08          Call base procedure PASCALSY.FPUT
-> 0722: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCONCAT(PARAM1; PARAM2; PARAM3) (* P=23 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 072e: SLDO 02          Short load global BASE2
   072f: SLDC 00          Short load constant 0
   0730: LDB              Load byte at byte ptr TOS-1 + TOS
   0731: SLDO 03          Short load global BASE3
   0732: SLDC 00          Short load constant 0
   0733: LDB              Load byte at byte ptr TOS-1 + TOS
   0734: ADI              Add integers (TOS + TOS-1)
   0735: SLDO 01          Short load global BASE1
   0736: LEQI             Integer TOS-1 <= TOS
   0737: FJP  $0750       Jump if TOS false
   0739: SLDO 02          Short load global BASE2
   073a: SLDC 01          Short load constant 1
   073b: SLDO 03          Short load global BASE3
   073c: SLDO 03          Short load global BASE3
   073d: SLDC 00          Short load constant 0
   073e: LDB              Load byte at byte ptr TOS-1 + TOS
   073f: SLDC 01          Short load constant 1
   0740: ADI              Add integers (TOS + TOS-1)
   0741: SLDO 02          Short load global BASE2
   0742: SLDC 00          Short load constant 0
   0743: LDB              Load byte at byte ptr TOS-1 + TOS
   0744: CSP  02          Call standard procedure MOVL
   0746: SLDO 03          Short load global BASE3
   0747: SLDC 00          Short load constant 0
   0748: SLDO 02          Short load global BASE2
   0749: SLDC 00          Short load constant 0
   074a: LDB              Load byte at byte ptr TOS-1 + TOS
   074b: SLDO 03          Short load global BASE3
   074c: SLDC 00          Short load constant 0
   074d: LDB              Load byte at byte ptr TOS-1 + TOS
   074e: ADI              Add integers (TOS + TOS-1)
   074f: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0750: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SINSERT(PARAM1; PARAM2; PARAM3; PARAM4) (* P=24 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
BEGIN
-> 075c: SLDO 01          Short load global BASE1
   075d: SLDC 00          Short load constant 0
   075e: GRTI             Integer TOS-1 > TOS
   075f: SLDO 04          Short load global BASE4
   0760: SLDC 00          Short load constant 0
   0761: LDB              Load byte at byte ptr TOS-1 + TOS
   0762: SLDC 00          Short load constant 0
   0763: GRTI             Integer TOS-1 > TOS
   0764: LAND             Logical AND (TOS & TOS-1)
   0765: SLDO 04          Short load global BASE4
   0766: SLDC 00          Short load constant 0
   0767: LDB              Load byte at byte ptr TOS-1 + TOS
   0768: SLDO 03          Short load global BASE3
   0769: SLDC 00          Short load constant 0
   076a: LDB              Load byte at byte ptr TOS-1 + TOS
   076b: ADI              Add integers (TOS + TOS-1)
   076c: SLDO 02          Short load global BASE2
   076d: LEQI             Integer TOS-1 <= TOS
   076e: LAND             Logical AND (TOS & TOS-1)
   076f: FJP  $07a5       Jump if TOS false
   0771: SLDO 03          Short load global BASE3
   0772: SLDC 00          Short load constant 0
   0773: LDB              Load byte at byte ptr TOS-1 + TOS
   0774: SLDO 01          Short load global BASE1
   0775: SBI              Subtract integers (TOS-1 - TOS)
   0776: SLDC 01          Short load constant 1
   0777: ADI              Add integers (TOS + TOS-1)
   0778: SRO  0005        Store global word BASE5
   077a: SLDO 05          Short load global BASE5
   077b: SLDC 00          Short load constant 0
   077c: GRTI             Integer TOS-1 > TOS
   077d: FJP  $078d       Jump if TOS false
   077f: SLDO 03          Short load global BASE3
   0780: SLDO 01          Short load global BASE1
   0781: SLDO 03          Short load global BASE3
   0782: SLDO 01          Short load global BASE1
   0783: SLDO 04          Short load global BASE4
   0784: SLDC 00          Short load constant 0
   0785: LDB              Load byte at byte ptr TOS-1 + TOS
   0786: ADI              Add integers (TOS + TOS-1)
   0787: SLDO 05          Short load global BASE5
   0788: CSP  03          Call standard procedure MOVR
   078a: SLDC 00          Short load constant 0
   078b: SRO  0005        Store global word BASE5
-> 078d: SLDO 05          Short load global BASE5
   078e: SLDC 00          Short load constant 0
   078f: EQUI             Integer TOS-1 = TOS
   0790: FJP  $07a5       Jump if TOS false
   0792: SLDO 04          Short load global BASE4
   0793: SLDC 01          Short load constant 1
   0794: SLDO 03          Short load global BASE3
   0795: SLDO 01          Short load global BASE1
   0796: SLDO 04          Short load global BASE4
   0797: SLDC 00          Short load constant 0
   0798: LDB              Load byte at byte ptr TOS-1 + TOS
   0799: CSP  02          Call standard procedure MOVL
   079b: SLDO 03          Short load global BASE3
   079c: SLDC 00          Short load constant 0
   079d: SLDO 03          Short load global BASE3
   079e: SLDC 00          Short load constant 0
   079f: LDB              Load byte at byte ptr TOS-1 + TOS
   07a0: SLDO 04          Short load global BASE4
   07a1: SLDC 00          Short load constant 0
   07a2: LDB              Load byte at byte ptr TOS-1 + TOS
   07a3: ADI              Add integers (TOS + TOS-1)
   07a4: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 07a5: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCOPY(PARAM1; PARAM2; PARAM3; PARAM4) (* P=25 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
BEGIN
-> 07b2: SLDO 03          Short load global BASE3
   07b3: LSA  00          Load string address: ''
   07b5: NOP              No operation
   07b6: SAS  50          String assign (TOS to TOS-1, 80 chars)
   07b8: SLDO 02          Short load global BASE2
   07b9: SLDC 00          Short load constant 0
   07ba: GRTI             Integer TOS-1 > TOS
   07bb: SLDO 01          Short load global BASE1
   07bc: SLDC 00          Short load constant 0
   07bd: GRTI             Integer TOS-1 > TOS
   07be: LAND             Logical AND (TOS & TOS-1)
   07bf: SLDO 02          Short load global BASE2
   07c0: SLDO 01          Short load global BASE1
   07c1: ADI              Add integers (TOS + TOS-1)
   07c2: SLDC 01          Short load constant 1
   07c3: SBI              Subtract integers (TOS-1 - TOS)
   07c4: SLDO 04          Short load global BASE4
   07c5: SLDC 00          Short load constant 0
   07c6: LDB              Load byte at byte ptr TOS-1 + TOS
   07c7: LEQI             Integer TOS-1 <= TOS
   07c8: LAND             Logical AND (TOS & TOS-1)
   07c9: FJP  $07d6       Jump if TOS false
   07cb: SLDO 04          Short load global BASE4
   07cc: SLDO 02          Short load global BASE2
   07cd: SLDO 03          Short load global BASE3
   07ce: SLDC 01          Short load constant 1
   07cf: SLDO 01          Short load global BASE1
   07d0: CSP  02          Call standard procedure MOVL
   07d2: SLDO 03          Short load global BASE3
   07d3: SLDC 00          Short load constant 0
   07d4: SLDO 01          Short load global BASE1
   07d5: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 07d6: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SDELETE(PARAM1; PARAM2; PARAM3) (* P=26 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 07e2: SLDO 02          Short load global BASE2
   07e3: SLDC 00          Short load constant 0
   07e4: GRTI             Integer TOS-1 > TOS
   07e5: SLDO 01          Short load global BASE1
   07e6: SLDC 00          Short load constant 0
   07e7: GRTI             Integer TOS-1 > TOS
   07e8: LAND             Logical AND (TOS & TOS-1)
   07e9: FJP  $0819       Jump if TOS false
   07eb: SLDO 03          Short load global BASE3
   07ec: SLDC 00          Short load constant 0
   07ed: LDB              Load byte at byte ptr TOS-1 + TOS
   07ee: SLDO 02          Short load global BASE2
   07ef: SBI              Subtract integers (TOS-1 - TOS)
   07f0: SLDO 01          Short load global BASE1
   07f1: SBI              Subtract integers (TOS-1 - TOS)
   07f2: SLDC 01          Short load constant 1
   07f3: ADI              Add integers (TOS + TOS-1)
   07f4: SRO  0004        Store global word BASE4
   07f6: SLDO 04          Short load global BASE4
   07f7: SLDC 00          Short load constant 0
   07f8: EQUI             Integer TOS-1 = TOS
   07f9: FJP  $0803       Jump if TOS false
   07fb: SLDO 03          Short load global BASE3
   07fc: SLDC 00          Short load constant 0
   07fd: SLDO 02          Short load global BASE2
   07fe: SLDC 01          Short load constant 1
   07ff: SBI              Subtract integers (TOS-1 - TOS)
   0800: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0801: UJP  $0819       Unconditional jump
-> 0803: SLDO 04          Short load global BASE4
   0804: SLDC 00          Short load constant 0
   0805: GRTI             Integer TOS-1 > TOS
   0806: FJP  $0819       Jump if TOS false
   0808: SLDO 03          Short load global BASE3
   0809: SLDO 02          Short load global BASE2
   080a: SLDO 01          Short load global BASE1
   080b: ADI              Add integers (TOS + TOS-1)
   080c: SLDO 03          Short load global BASE3
   080d: SLDO 02          Short load global BASE2
   080e: SLDO 04          Short load global BASE4
   080f: CSP  02          Call standard procedure MOVL
   0811: SLDO 03          Short load global BASE3
   0812: SLDC 00          Short load constant 0
   0813: SLDO 03          Short load global BASE3
   0814: SLDC 00          Short load constant 0
   0815: LDB              Load byte at byte ptr TOS-1 + TOS
   0816: SLDO 01          Short load global BASE1
   0817: SBI              Subtract integers (TOS-1 - TOS)
   0818: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0819: RBP  00          Return from base procedure
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
-> 0826: SLDC 00          Short load constant 0
   0827: SRO  0001        Store global word BASE1
   0829: SLDO 04          Short load global BASE4
   082a: SLDC 00          Short load constant 0
   082b: LDB              Load byte at byte ptr TOS-1 + TOS
   082c: SLDC 00          Short load constant 0
   082d: GRTI             Integer TOS-1 > TOS
   082e: FJP  $0881       Jump if TOS false
   0830: SLDO 04          Short load global BASE4
   0831: SLDC 01          Short load constant 1
   0832: LDB              Load byte at byte ptr TOS-1 + TOS
   0833: SRO  0007        Store global word BASE7
   0835: SLDC 01          Short load constant 1
   0836: SRO  0006        Store global word BASE6
   0838: SLDO 03          Short load global BASE3
   0839: SLDC 00          Short load constant 0
   083a: LDB              Load byte at byte ptr TOS-1 + TOS
   083b: SLDO 04          Short load global BASE4
   083c: SLDC 00          Short load constant 0
   083d: LDB              Load byte at byte ptr TOS-1 + TOS
   083e: SBI              Subtract integers (TOS-1 - TOS)
   083f: SLDC 01          Short load constant 1
   0840: ADI              Add integers (TOS + TOS-1)
   0841: SRO  0005        Store global word BASE5
   0843: LAO  0008        Load global BASE8
   0845: SLDC 00          Short load constant 0
   0846: SLDO 04          Short load global BASE4
   0847: SLDC 00          Short load constant 0
   0848: LDB              Load byte at byte ptr TOS-1 + TOS
   0849: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 084a: SLDO 06          Short load global BASE6
   084b: SLDO 05          Short load global BASE5
   084c: LEQI             Integer TOS-1 <= TOS
   084d: FJP  $0881       Jump if TOS false
   084f: SLDO 06          Short load global BASE6
   0850: SLDO 05          Short load global BASE5
   0851: SLDO 06          Short load global BASE6
   0852: SBI              Subtract integers (TOS-1 - TOS)
   0853: SLDC 00          Short load constant 0
   0854: SLDO 07          Short load global BASE7
   0855: SLDO 03          Short load global BASE3
   0856: SLDO 06          Short load global BASE6
   0857: SLDC 00          Short load constant 0
   0858: CSP  0b          Call standard procedure SCAN
   085a: ADI              Add integers (TOS + TOS-1)
   085b: SRO  0006        Store global word BASE6
   085d: SLDO 06          Short load global BASE6
   085e: SLDO 05          Short load global BASE5
   085f: GRTI             Integer TOS-1 > TOS
   0860: FJP  $0864       Jump if TOS false
   0862: UJP  $0881       Unconditional jump
-> 0864: SLDO 03          Short load global BASE3
   0865: SLDO 06          Short load global BASE6
   0866: LAO  0008        Load global BASE8
   0868: SLDC 01          Short load constant 1
   0869: SLDO 04          Short load global BASE4
   086a: SLDC 00          Short load constant 0
   086b: LDB              Load byte at byte ptr TOS-1 + TOS
   086c: CSP  02          Call standard procedure MOVL
   086e: LAO  0008        Load global BASE8
   0870: SLDO 04          Short load global BASE4
   0871: EQLSTR           String TOS-1 = TOS
   0873: FJP  $087a       Jump if TOS false
   0875: SLDO 06          Short load global BASE6
   0876: SRO  0001        Store global word BASE1
   0878: UJP  $0881       Unconditional jump
-> 087a: SLDO 06          Short load global BASE6
   087b: SLDC 01          Short load constant 1
   087c: ADI              Add integers (TOS + TOS-1)
   087d: SRO  0006        Store global word BASE6
   087f: UJP  $084a       Unconditional jump
-> 0881: RBP  01          Return from base procedure
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
-> 0890: SLDC 00          Short load constant 0
   0891: SRO  0001        Store global word BASE1
   0893: LOD  01 0001     Load word at G1 (SYSCOM)
   0896: SLDC 00          Short load constant 0
   0897: STO              Store indirect (TOS into TOS-1)
   0898: SLDO 08          Short load global BASE8
   0899: SRO  0009        Store global word BASE9
   089b: SLDO 09          Short load global BASE9
   089c: SIND 05          Short index load *TOS+5
   089d: SLDO 05          Short load global BASE5
   089e: SLDC 00          Short load constant 0
   089f: GEQI             Integer TOS-1 >= TOS
   08a0: LAND             Logical AND (TOS & TOS-1)
   08a1: FJP  $0979       Jump if TOS false
   08a3: SLDO 09          Short load global BASE9
   08a4: SIND 06          Short index load *TOS+6
   08a5: FJP  $092c       Jump if TOS false
   08a7: SLDO 09          Short load global BASE9
   08a8: INC  0010        Inc field ptr (TOS+16)
   08aa: SRO  000a        Store global word BASE10
   08ac: SLDO 04          Short load global BASE4
   08ad: SLDC 00          Short load constant 0
   08ae: LESI             Integer TOS-1 < TOS
   08af: FJP  $08b6       Jump if TOS false
   08b1: SLDO 09          Short load global BASE9
   08b2: IND  000d        Static index and load word (TOS+13)
   08b4: SRO  0004        Store global word BASE4
-> 08b6: SLDO 0a          Short load global BASE10
   08b7: SIND 00          Short index load *TOS+0
   08b8: SLDO 04          Short load global BASE4
   08b9: ADI              Add integers (TOS + TOS-1)
   08ba: SRO  0004        Store global word BASE4
   08bc: SLDO 04          Short load global BASE4
   08bd: SLDO 05          Short load global BASE5
   08be: ADI              Add integers (TOS + TOS-1)
   08bf: SLDO 0a          Short load global BASE10
   08c0: SIND 01          Short index load *TOS+1
   08c1: GRTI             Integer TOS-1 > TOS
   08c2: FJP  $08cf       Jump if TOS false
   08c4: SLDO 03          Short load global BASE3
   08c5: LNOT             Logical NOT (~TOS)
   08c6: FJP  $08cf       Jump if TOS false
   08c8: SLDO 08          Short load global BASE8
   08c9: SLDC 00          Short load constant 0
   08ca: SLDC 00          Short load constant 0
   08cb: CBP  31          Call base procedure PASCALSY.49
   08cd: FJP  $08cf       Jump if TOS false
-> 08cf: SLDO 04          Short load global BASE4
   08d0: SLDO 05          Short load global BASE5
   08d1: ADI              Add integers (TOS + TOS-1)
   08d2: SLDO 0a          Short load global BASE10
   08d3: SIND 01          Short index load *TOS+1
   08d4: GRTI             Integer TOS-1 > TOS
   08d5: FJP  $08dd       Jump if TOS false
   08d7: SLDO 0a          Short load global BASE10
   08d8: SIND 01          Short index load *TOS+1
   08d9: SLDO 04          Short load global BASE4
   08da: SBI              Subtract integers (TOS-1 - TOS)
   08db: SRO  0005        Store global word BASE5
-> 08dd: SLDO 09          Short load global BASE9
   08de: INC  0002        Inc field ptr (TOS+2)
   08e0: SLDO 04          Short load global BASE4
   08e1: SLDO 0a          Short load global BASE10
   08e2: SIND 01          Short index load *TOS+1
   08e3: GEQI             Integer TOS-1 >= TOS
   08e4: STO              Store indirect (TOS into TOS-1)
   08e5: SLDO 09          Short load global BASE9
   08e6: SIND 02          Short index load *TOS+2
   08e7: LNOT             Logical NOT (~TOS)
   08e8: FJP  $092a       Jump if TOS false
   08ea: SLDO 09          Short load global BASE9
   08eb: SIND 07          Short index load *TOS+7
   08ec: SLDO 07          Short load global BASE7
   08ed: SLDO 06          Short load global BASE6
   08ee: SLDO 05          Short load global BASE5
   08ef: SLDO 04          Short load global BASE4
   08f0: SLDO 03          Short load global BASE3
   08f1: CLP  37          Call local procedure PASCALSY.55
   08f3: CSP  22          Call standard procedure IORESULT
   08f5: SLDC 00          Short load constant 0
   08f6: EQUI             Integer TOS-1 = TOS
   08f7: FJP  $092a       Jump if TOS false
   08f9: SLDO 03          Short load global BASE3
   08fa: LNOT             Logical NOT (~TOS)
   08fb: FJP  $0902       Jump if TOS false
   08fd: SLDO 09          Short load global BASE9
   08fe: INC  000f        Inc field ptr (TOS+15)
   0900: SLDC 01          Short load constant 1
   0901: STO              Store indirect (TOS into TOS-1)
-> 0902: SLDO 05          Short load global BASE5
   0903: SRO  0001        Store global word BASE1
   0905: SLDO 04          Short load global BASE4
   0906: SLDO 05          Short load global BASE5
   0907: ADI              Add integers (TOS + TOS-1)
   0908: SRO  0004        Store global word BASE4
   090a: SLDO 09          Short load global BASE9
   090b: INC  0002        Inc field ptr (TOS+2)
   090d: SLDO 04          Short load global BASE4
   090e: SLDO 0a          Short load global BASE10
   090f: SIND 01          Short index load *TOS+1
   0910: EQUI             Integer TOS-1 = TOS
   0911: STO              Store indirect (TOS into TOS-1)
   0912: SLDO 09          Short load global BASE9
   0913: INC  000d        Inc field ptr (TOS+13)
   0915: SLDO 04          Short load global BASE4
   0916: SLDO 0a          Short load global BASE10
   0917: SIND 00          Short index load *TOS+0
   0918: SBI              Subtract integers (TOS-1 - TOS)
   0919: STO              Store indirect (TOS into TOS-1)
   091a: SLDO 09          Short load global BASE9
   091b: IND  000d        Static index and load word (TOS+13)
   091d: SLDO 09          Short load global BASE9
   091e: IND  000c        Static index and load word (TOS+12)
   0920: GRTI             Integer TOS-1 > TOS
   0921: FJP  $092a       Jump if TOS false
   0923: SLDO 09          Short load global BASE9
   0924: INC  000c        Inc field ptr (TOS+12)
   0926: SLDO 09          Short load global BASE9
   0927: IND  000d        Static index and load word (TOS+13)
   0929: STO              Store indirect (TOS into TOS-1)
-> 092a: UJP  $0977       Unconditional jump
-> 092c: SLDO 05          Short load global BASE5
   092d: SRO  0001        Store global word BASE1
   092f: SLDO 09          Short load global BASE9
   0930: SIND 07          Short index load *TOS+7
   0931: SLDO 07          Short load global BASE7
   0932: SLDO 06          Short load global BASE6
   0933: SLDO 05          Short load global BASE5
   0934: SLDO 04          Short load global BASE4
   0935: SLDO 03          Short load global BASE3
   0936: CLP  37          Call local procedure PASCALSY.55
   0938: CSP  22          Call standard procedure IORESULT
   093a: SLDC 00          Short load constant 0
   093b: EQUI             Integer TOS-1 = TOS
   093c: FJP  $0974       Jump if TOS false
   093e: SLDO 03          Short load global BASE3
   093f: FJP  $0972       Jump if TOS false
   0941: SLDO 05          Short load global BASE5
   0942: LDCI 0200        Load word 512
   0945: MPI              Multiply integers (TOS * TOS-1)
   0946: SRO  0004        Store global word BASE4
   0948: SLDO 04          Short load global BASE4
   0949: SLDO 04          Short load global BASE4
   094a: NGI              Negate integer
   094b: SLDC 01          Short load constant 1
   094c: SLDC 00          Short load constant 0
   094d: SLDO 07          Short load global BASE7
   094e: SLDO 06          Short load global BASE6
   094f: SLDO 04          Short load global BASE4
   0950: ADI              Add integers (TOS + TOS-1)
   0951: SLDC 01          Short load constant 1
   0952: SBI              Subtract integers (TOS-1 - TOS)
   0953: SLDC 00          Short load constant 0
   0954: CSP  0b          Call standard procedure SCAN
   0956: ADI              Add integers (TOS + TOS-1)
   0957: SRO  0004        Store global word BASE4
   0959: SLDO 04          Short load global BASE4
   095a: LDCI 0200        Load word 512
   095d: ADI              Add integers (TOS + TOS-1)
   095e: SLDC 01          Short load constant 1
   095f: SBI              Subtract integers (TOS-1 - TOS)
   0960: LDCI 0200        Load word 512
   0963: DVI              Divide integers (TOS-1 / TOS)
   0964: SRO  0004        Store global word BASE4
   0966: SLDO 04          Short load global BASE4
   0967: SRO  0001        Store global word BASE1
   0969: SLDO 09          Short load global BASE9
   096a: INC  0002        Inc field ptr (TOS+2)
   096c: SLDO 04          Short load global BASE4
   096d: SLDO 05          Short load global BASE5
   096e: LESI             Integer TOS-1 < TOS
   096f: STO              Store indirect (TOS into TOS-1)
   0970: UJP  $0972       Unconditional jump
-> 0972: UJP  $0977       Unconditional jump
-> 0974: SLDC 00          Short load constant 0
   0975: SRO  0001        Store global word BASE1
-> 0977: UJP  $097e       Unconditional jump
-> 0979: LOD  01 0001     Load word at G1 (SYSCOM)
   097c: SLDC 0d          Short load constant 13
   097d: STO              Store indirect (TOS into TOS-1)
-> 097e: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.FGOTOXY(PARAM1; PARAM2) (* P=29 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 098e: LOD  01 0001     Load word at G1 (SYSCOM)
   0991: INC  0025        Inc field ptr (TOS+37)
   0993: SRO  0003        Store global word BASE3
   0995: SLDO 02          Short load global BASE2
   0996: SLDC 00          Short load constant 0
   0997: LESI             Integer TOS-1 < TOS
   0998: FJP  $099d       Jump if TOS false
   099a: SLDC 00          Short load constant 0
   099b: SRO  0002        Store global word BASE2
-> 099d: SLDO 02          Short load global BASE2
   099e: SLDO 03          Short load global BASE3
   099f: SIND 01          Short index load *TOS+1
   09a0: GRTI             Integer TOS-1 > TOS
   09a1: FJP  $09a7       Jump if TOS false
   09a3: SLDO 03          Short load global BASE3
   09a4: SIND 01          Short index load *TOS+1
   09a5: SRO  0002        Store global word BASE2
-> 09a7: SLDO 01          Short load global BASE1
   09a8: SLDC 00          Short load constant 0
   09a9: LESI             Integer TOS-1 < TOS
   09aa: FJP  $09af       Jump if TOS false
   09ac: SLDC 00          Short load constant 0
   09ad: SRO  0001        Store global word BASE1
-> 09af: SLDO 01          Short load global BASE1
   09b0: SLDO 03          Short load global BASE3
   09b1: SIND 00          Short index load *TOS+0
   09b2: GRTI             Integer TOS-1 > TOS
   09b3: FJP  $09b9       Jump if TOS false
   09b5: SLDO 03          Short load global BASE3
   09b6: SIND 00          Short index load *TOS+0
   09b7: SRO  0001        Store global word BASE1
-> 09b9: LOD  01 0003     Load word at G3 (OUTPUT)
   09bc: SLDC 1e          Short load constant 30
   09bd: SLDC 00          Short load constant 0
   09be: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   09c1: LOD  01 0003     Load word at G3 (OUTPUT)
   09c4: SLDO 02          Short load global BASE2
   09c5: SLDC 20          Short load constant 32
   09c6: ADI              Add integers (TOS + TOS-1)
   09c7: SLDC 00          Short load constant 0
   09c8: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   09cb: LOD  01 0003     Load word at G3 (OUTPUT)
   09ce: SLDO 01          Short load global BASE1
   09cf: SLDC 20          Short load constant 32
   09d0: ADI              Add integers (TOS + TOS-1)
   09d1: SLDC 00          Short load constant 0
   09d2: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 09d5: RBP  00          Return from base procedure
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
-> 09e2: SLDC 00          Short load constant 0
   09e3: SRO  0001        Store global word BASE1
   09e5: SLDO 03          Short load global BASE3
   09e6: LDCN             Load constant NIL
   09e7: STO              Store indirect (TOS into TOS-1)
   09e8: SLDC 00          Short load constant 0
   09e9: SRO  0008        Store global word BASE8
   09eb: SLDC 00          Short load constant 0
   09ec: SRO  0007        Store global word BASE7
   09ee: SLDO 05          Short load global BASE5
   09ef: SLDC 00          Short load constant 0
   09f0: LDB              Load byte at byte ptr TOS-1 + TOS
   09f1: SLDC 00          Short load constant 0
   09f2: GRTI             Integer TOS-1 > TOS
   09f3: FJP  $0a6c       Jump if TOS false
   09f5: SLDO 05          Short load global BASE5
   09f6: SLDC 01          Short load constant 1
   09f7: LDB              Load byte at byte ptr TOS-1 + TOS
   09f8: SLDC 23          Short load constant 35
   09f9: EQUI             Integer TOS-1 = TOS
   09fa: SLDO 05          Short load global BASE5
   09fb: SLDC 00          Short load constant 0
   09fc: LDB              Load byte at byte ptr TOS-1 + TOS
   09fd: SLDC 01          Short load constant 1
   09fe: GRTI             Integer TOS-1 > TOS
   09ff: LAND             Logical AND (TOS & TOS-1)
   0a00: FJP  $0a47       Jump if TOS false
   0a02: SLDC 01          Short load constant 1
   0a03: SRO  0008        Store global word BASE8
   0a05: SLDC 00          Short load constant 0
   0a06: SRO  0006        Store global word BASE6
   0a08: SLDC 02          Short load constant 2
   0a09: SRO  000a        Store global word BASE10
-> 0a0b: SLDO 05          Short load global BASE5
   0a0c: SLDO 0a          Short load global BASE10
   0a0d: LDB              Load byte at byte ptr TOS-1 + TOS
   0a0e: LDA  01 007a     Load addr G122
   0a11: LDM  04          Load 4 words from (TOS)
   0a13: SLDC 04          Short load constant 4
   0a14: INN              Set membership (TOS-1 in set TOS)
   0a15: FJP  $0a24       Jump if TOS false
   0a17: SLDO 06          Short load global BASE6
   0a18: SLDC 0a          Short load constant 10
   0a19: MPI              Multiply integers (TOS * TOS-1)
   0a1a: SLDO 05          Short load global BASE5
   0a1b: SLDO 0a          Short load global BASE10
   0a1c: LDB              Load byte at byte ptr TOS-1 + TOS
   0a1d: ADI              Add integers (TOS + TOS-1)
   0a1e: SLDC 30          Short load constant 48
   0a1f: SBI              Subtract integers (TOS-1 - TOS)
   0a20: SRO  0006        Store global word BASE6
   0a22: UJP  $0a27       Unconditional jump
-> 0a24: SLDC 00          Short load constant 0
   0a25: SRO  0008        Store global word BASE8
-> 0a27: SLDO 0a          Short load global BASE10
   0a28: SLDC 01          Short load constant 1
   0a29: ADI              Add integers (TOS + TOS-1)
   0a2a: SRO  000a        Store global word BASE10
   0a2c: SLDO 0a          Short load global BASE10
   0a2d: SLDO 05          Short load global BASE5
   0a2e: SLDC 00          Short load constant 0
   0a2f: LDB              Load byte at byte ptr TOS-1 + TOS
   0a30: GRTI             Integer TOS-1 > TOS
   0a31: SLDO 08          Short load global BASE8
   0a32: LNOT             Logical NOT (~TOS)
   0a33: LOR              Logical OR (TOS | TOS-1)
   0a34: FJP  $0a0b       Jump if TOS false
   0a36: SLDO 08          Short load global BASE8
   0a37: SLDO 06          Short load global BASE6
   0a38: SLDC 00          Short load constant 0
   0a39: GRTI             Integer TOS-1 > TOS
   0a3a: LAND             Logical AND (TOS & TOS-1)
   0a3b: SLDO 06          Short load global BASE6
   0a3c: SLDC 14          Short load constant 20
   0a3d: LEQI             Integer TOS-1 <= TOS
   0a3e: LAND             Logical AND (TOS & TOS-1)
   0a3f: SRO  0007        Store global word BASE7
   0a41: SLDO 04          Short load global BASE4
   0a42: SLDO 07          Short load global BASE7
   0a43: LNOT             Logical NOT (~TOS)
   0a44: LAND             Logical AND (TOS & TOS-1)
   0a45: SRO  0004        Store global word BASE4
-> 0a47: SLDO 07          Short load global BASE7
   0a48: LNOT             Logical NOT (~TOS)
   0a49: FJP  $0a6c       Jump if TOS false
   0a4b: SLDC 00          Short load constant 0
   0a4c: SRO  0008        Store global word BASE8
   0a4e: SLDC 14          Short load constant 20
   0a4f: SRO  0006        Store global word BASE6
-> 0a51: SLDO 05          Short load global BASE5
   0a52: LDA  01 007e     Load addr G126
   0a55: SLDO 06          Short load global BASE6
   0a56: IXA  0006        Index array (TOS-1 + TOS * 6)
   0a58: EQLSTR           String TOS-1 = TOS
   0a5a: SRO  0008        Store global word BASE8
   0a5c: SLDO 08          Short load global BASE8
   0a5d: LNOT             Logical NOT (~TOS)
   0a5e: FJP  $0a65       Jump if TOS false
   0a60: SLDO 06          Short load global BASE6
   0a61: SLDC 01          Short load constant 1
   0a62: SBI              Subtract integers (TOS-1 - TOS)
   0a63: SRO  0006        Store global word BASE6
-> 0a65: SLDO 08          Short load global BASE8
   0a66: SLDO 06          Short load global BASE6
   0a67: SLDC 00          Short load constant 0
   0a68: EQUI             Integer TOS-1 = TOS
   0a69: LOR              Logical OR (TOS | TOS-1)
   0a6a: FJP  $0a51       Jump if TOS false
-> 0a6c: SLDO 08          Short load global BASE8
   0a6d: FJP  $0acf       Jump if TOS false
   0a6f: LDA  01 007e     Load addr G126
   0a72: SLDO 06          Short load global BASE6
   0a73: IXA  0006        Index array (TOS-1 + TOS * 6)
   0a75: SIND 04          Short index load *TOS+4
   0a76: FJP  $0acf       Jump if TOS false
   0a78: LOD  01 0001     Load word at G1 (SYSCOM)
   0a7b: SRO  000b        Store global word BASE11
   0a7d: SLDC 00          Short load constant 0
   0a7e: SRO  0008        Store global word BASE8
   0a80: SLDO 0b          Short load global BASE11
   0a81: SIND 04          Short index load *TOS+4
   0a82: LDCN             Load constant NIL
   0a83: NEQI             Integer TOS-1 <> TOS
   0a84: FJP  $0aa7       Jump if TOS false
   0a86: SLDO 05          Short load global BASE5
   0a87: SLDO 0b          Short load global BASE11
   0a88: SIND 04          Short index load *TOS+4
   0a89: SLDC 00          Short load constant 0
   0a8a: IXA  000d        Index array (TOS-1 + TOS * 13)
   0a8c: INC  0003        Inc field ptr (TOS+3)
   0a8e: EQLSTR           String TOS-1 = TOS
   0a90: FJP  $0aa7       Jump if TOS false
   0a92: LAO  000a        Load global BASE10
   0a94: LAO  0009        Load global BASE9
   0a96: CSP  09          Call standard procedure TIME
   0a98: SLDO 09          Short load global BASE9
   0a99: SLDO 0b          Short load global BASE11
   0a9a: SIND 04          Short index load *TOS+4
   0a9b: SLDC 00          Short load constant 0
   0a9c: IXA  000d        Index array (TOS-1 + TOS * 13)
   0a9e: IND  0009        Static index and load word (TOS+9)
   0aa0: SBI              Subtract integers (TOS-1 - TOS)
   0aa1: LDCI 012c        Load word 300
   0aa4: LEQI             Integer TOS-1 <= TOS
   0aa5: SRO  0008        Store global word BASE8
-> 0aa7: SLDO 08          Short load global BASE8
   0aa8: LNOT             Logical NOT (~TOS)
   0aa9: FJP  $0acf       Jump if TOS false
   0aab: SLDO 07          Short load global BASE7
   0aac: SRO  0008        Store global word BASE8
   0aae: SLDO 06          Short load global BASE6
   0aaf: SLDC 00          Short load constant 0
   0ab0: SLDC 00          Short load constant 0
   0ab1: CBP  2a          Call base procedure PASCALSY.42
   0ab3: FJP  $0ac9       Jump if TOS false
   0ab5: SLDO 07          Short load global BASE7
   0ab6: LNOT             Logical NOT (~TOS)
   0ab7: FJP  $0ac7       Jump if TOS false
   0ab9: SLDO 05          Short load global BASE5
   0aba: SLDO 0b          Short load global BASE11
   0abb: SIND 04          Short index load *TOS+4
   0abc: SLDC 00          Short load constant 0
   0abd: IXA  000d        Index array (TOS-1 + TOS * 13)
   0abf: INC  0003        Inc field ptr (TOS+3)
   0ac1: EQLSTR           String TOS-1 = TOS
   0ac3: SRO  0008        Store global word BASE8
   0ac5: UJP  $0ac7       Unconditional jump
-> 0ac7: UJP  $0acf       Unconditional jump
-> 0ac9: CSP  22          Call standard procedure IORESULT
   0acb: SLDC 00          Short load constant 0
   0acc: EQUI             Integer TOS-1 = TOS
   0acd: SRO  0008        Store global word BASE8
-> 0acf: SLDO 08          Short load global BASE8
   0ad0: LNOT             Logical NOT (~TOS)
   0ad1: SLDO 04          Short load global BASE4
   0ad2: LAND             Logical AND (TOS & TOS-1)
   0ad3: FJP  $0b01       Jump if TOS false
   0ad5: SLDC 14          Short load constant 20
   0ad6: SRO  0006        Store global word BASE6
-> 0ad8: LDA  01 007e     Load addr G126
   0adb: SLDO 06          Short load global BASE6
   0adc: IXA  0006        Index array (TOS-1 + TOS * 6)
   0ade: SRO  000b        Store global word BASE11
   0ae0: SLDO 0b          Short load global BASE11
   0ae1: SIND 04          Short index load *TOS+4
   0ae2: FJP  $0af1       Jump if TOS false
   0ae4: SLDO 06          Short load global BASE6
   0ae5: SLDC 00          Short load constant 0
   0ae6: SLDC 00          Short load constant 0
   0ae7: CBP  2a          Call base procedure PASCALSY.42
   0ae9: FJP  $0af1       Jump if TOS false
   0aeb: SLDO 05          Short load global BASE5
   0aec: SLDO 0b          Short load global BASE11
   0aed: EQLSTR           String TOS-1 = TOS
   0aef: SRO  0008        Store global word BASE8
-> 0af1: SLDO 08          Short load global BASE8
   0af2: LNOT             Logical NOT (~TOS)
   0af3: FJP  $0afa       Jump if TOS false
   0af5: SLDO 06          Short load global BASE6
   0af6: SLDC 01          Short load constant 1
   0af7: SBI              Subtract integers (TOS-1 - TOS)
   0af8: SRO  0006        Store global word BASE6
-> 0afa: SLDO 08          Short load global BASE8
   0afb: SLDO 06          Short load global BASE6
   0afc: SLDC 00          Short load constant 0
   0afd: EQUI             Integer TOS-1 = TOS
   0afe: LOR              Logical OR (TOS | TOS-1)
   0aff: FJP  $0ad8       Jump if TOS false
-> 0b01: SLDO 08          Short load global BASE8
   0b02: FJP  $0b36       Jump if TOS false
   0b04: LDA  01 007e     Load addr G126
   0b07: SLDO 06          Short load global BASE6
   0b08: IXA  0006        Index array (TOS-1 + TOS * 6)
   0b0a: SRO  000b        Store global word BASE11
   0b0c: SLDO 06          Short load global BASE6
   0b0d: SRO  0001        Store global word BASE1
   0b0f: SLDO 0b          Short load global BASE11
   0b10: SLDC 00          Short load constant 0
   0b11: LDB              Load byte at byte ptr TOS-1 + TOS
   0b12: SLDC 00          Short load constant 0
   0b13: GRTI             Integer TOS-1 > TOS
   0b14: FJP  $0b1a       Jump if TOS false
   0b16: SLDO 05          Short load global BASE5
   0b17: SLDO 0b          Short load global BASE11
   0b18: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0b1a: SLDO 0b          Short load global BASE11
   0b1b: SIND 04          Short index load *TOS+4
   0b1c: LOD  01 0001     Load word at G1 (SYSCOM)
   0b1f: SIND 04          Short index load *TOS+4
   0b20: LDCN             Load constant NIL
   0b21: NEQI             Integer TOS-1 <> TOS
   0b22: LAND             Logical AND (TOS & TOS-1)
   0b23: FJP  $0b36       Jump if TOS false
   0b25: SLDO 03          Short load global BASE3
   0b26: LOD  01 0001     Load word at G1 (SYSCOM)
   0b29: SIND 04          Short index load *TOS+4
   0b2a: STO              Store indirect (TOS into TOS-1)
   0b2b: LAO  000a        Load global BASE10
   0b2d: SLDO 03          Short load global BASE3
   0b2e: SIND 00          Short index load *TOS+0
   0b2f: SLDC 00          Short load constant 0
   0b30: IXA  000d        Index array (TOS-1 + TOS * 13)
   0b32: INC  0009        Inc field ptr (TOS+9)
   0b34: CSP  09          Call standard procedure TIME
-> 0b36: RBP  01          Return from base procedure
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
-> 0b48: SLDC 00          Short load constant 0
   0b49: SRO  0001        Store global word BASE1
   0b4b: SLDC 00          Short load constant 0
   0b4c: SRO  0007        Store global word BASE7
   0b4e: SLDC 01          Short load constant 1
   0b4f: SRO  0006        Store global word BASE6
-> 0b51: SLDO 06          Short load global BASE6
   0b52: SLDO 03          Short load global BASE3
   0b53: SLDC 00          Short load constant 0
   0b54: IXA  000d        Index array (TOS-1 + TOS * 13)
   0b56: IND  0008        Static index and load word (TOS+8)
   0b58: LEQI             Integer TOS-1 <= TOS
   0b59: SLDO 07          Short load global BASE7
   0b5a: LNOT             Logical NOT (~TOS)
   0b5b: LAND             Logical AND (TOS & TOS-1)
   0b5c: FJP  $0b86       Jump if TOS false
   0b5e: SLDO 03          Short load global BASE3
   0b5f: SLDO 06          Short load global BASE6
   0b60: IXA  000d        Index array (TOS-1 + TOS * 13)
   0b62: SRO  0008        Store global word BASE8
   0b64: SLDO 08          Short load global BASE8
   0b65: INC  0003        Inc field ptr (TOS+3)
   0b67: SLDO 05          Short load global BASE5
   0b68: EQLSTR           String TOS-1 = TOS
   0b6a: FJP  $0b7f       Jump if TOS false
   0b6c: SLDO 04          Short load global BASE4
   0b6d: SLDO 08          Short load global BASE8
   0b6e: INC  000c        Inc field ptr (TOS+12)
   0b70: SLDC 07          Short load constant 7
   0b71: SLDC 09          Short load constant 9
   0b72: LDP              Load packed field (TOS)
   0b73: SLDC 64          Short load constant 100
   0b74: NEQI             Integer TOS-1 <> TOS
   0b75: EQLBOOL          Boolean TOS-1 = TOS
   0b77: FJP  $0b7f       Jump if TOS false
   0b79: SLDO 06          Short load global BASE6
   0b7a: SRO  0001        Store global word BASE1
   0b7c: SLDC 01          Short load constant 1
   0b7d: SRO  0007        Store global word BASE7
-> 0b7f: SLDO 06          Short load global BASE6
   0b80: SLDC 01          Short load constant 1
   0b81: ADI              Add integers (TOS + TOS-1)
   0b82: SRO  0006        Store global word BASE6
   0b84: UJP  $0b51       Unconditional jump
-> 0b86: RBP  01          Return from base procedure
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
-> 0b94: SLDO 01          Short load global BASE1
   0b95: SLDC 00          Short load constant 0
   0b96: IXA  000d        Index array (TOS-1 + TOS * 13)
   0b98: SRO  0004        Store global word BASE4
   0b9a: SLDO 02          Short load global BASE2
   0b9b: SRO  0003        Store global word BASE3
   0b9d: SLDO 04          Short load global BASE4
   0b9e: IND  0008        Static index and load word (TOS+8)
   0ba0: SLDC 01          Short load constant 1
   0ba1: SBI              Subtract integers (TOS-1 - TOS)
   0ba2: SRO  0005        Store global word BASE5
-> 0ba4: SLDO 03          Short load global BASE3
   0ba5: SLDO 05          Short load global BASE5
   0ba6: LEQI             Integer TOS-1 <= TOS
   0ba7: FJP  $0bbc       Jump if TOS false
   0ba9: SLDO 01          Short load global BASE1
   0baa: SLDO 03          Short load global BASE3
   0bab: IXA  000d        Index array (TOS-1 + TOS * 13)
   0bad: SLDO 01          Short load global BASE1
   0bae: SLDO 03          Short load global BASE3
   0baf: SLDC 01          Short load constant 1
   0bb0: ADI              Add integers (TOS + TOS-1)
   0bb1: IXA  000d        Index array (TOS-1 + TOS * 13)
   0bb3: MOV  000d        Move 13 words (TOS to TOS-1)
   0bb5: SLDO 03          Short load global BASE3
   0bb6: SLDC 01          Short load constant 1
   0bb7: ADI              Add integers (TOS + TOS-1)
   0bb8: SRO  0003        Store global word BASE3
   0bba: UJP  $0ba4       Unconditional jump
-> 0bbc: SLDO 01          Short load global BASE1
   0bbd: SLDO 04          Short load global BASE4
   0bbe: IND  0008        Static index and load word (TOS+8)
   0bc0: IXA  000d        Index array (TOS-1 + TOS * 13)
   0bc2: INC  0003        Inc field ptr (TOS+3)
   0bc4: NOP              No operation
   0bc5: LSA  00          Load string address: ''
   0bc7: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0bc9: SLDO 04          Short load global BASE4
   0bca: INC  0008        Inc field ptr (TOS+8)
   0bcc: SLDO 04          Short load global BASE4
   0bcd: IND  0008        Static index and load word (TOS+8)
   0bcf: SLDC 01          Short load constant 1
   0bd0: SBI              Subtract integers (TOS-1 - TOS)
   0bd1: STO              Store indirect (TOS into TOS-1)
-> 0bd2: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC35(PARAM1; PARAM2; PARAM3) (* P=35 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 0324: SLDO 01          Short load global BASE1
   0325: SLDC 00          Short load constant 0
   0326: IXA  000d        Index array (TOS-1 + TOS * 13)
   0328: SRO  0005        Store global word BASE5
   032a: SLDO 05          Short load global BASE5
   032b: IND  0008        Static index and load word (TOS+8)
   032d: SRO  0004        Store global word BASE4
   032f: SLDO 02          Short load global BASE2
   0330: SRO  0006        Store global word BASE6
-> 0332: SLDO 04          Short load global BASE4
   0333: SLDO 06          Short load global BASE6
   0334: GEQI             Integer TOS-1 >= TOS
   0335: FJP  $034a       Jump if TOS false
   0337: SLDO 01          Short load global BASE1
   0338: SLDO 04          Short load global BASE4
   0339: SLDC 01          Short load constant 1
   033a: ADI              Add integers (TOS + TOS-1)
   033b: IXA  000d        Index array (TOS-1 + TOS * 13)
   033d: SLDO 01          Short load global BASE1
   033e: SLDO 04          Short load global BASE4
   033f: IXA  000d        Index array (TOS-1 + TOS * 13)
   0341: MOV  000d        Move 13 words (TOS to TOS-1)
   0343: SLDO 04          Short load global BASE4
   0344: SLDC 01          Short load constant 1
   0345: SBI              Subtract integers (TOS-1 - TOS)
   0346: SRO  0004        Store global word BASE4
   0348: UJP  $0332       Unconditional jump
-> 034a: SLDO 01          Short load global BASE1
   034b: SLDO 02          Short load global BASE2
   034c: IXA  000d        Index array (TOS-1 + TOS * 13)
   034e: SLDO 03          Short load global BASE3
   034f: MOV  000d        Move 13 words (TOS to TOS-1)
   0351: SLDO 05          Short load global BASE5
   0352: INC  0008        Inc field ptr (TOS+8)
   0354: SLDO 05          Short load global BASE5
   0355: IND  0008        Static index and load word (TOS+8)
   0357: SLDC 01          Short load constant 1
   0358: ADI              Add integers (TOS + TOS-1)
   0359: STO              Store indirect (TOS into TOS-1)
-> 035a: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC36 (* P=36 LL=0 *)
BEGIN
-> 0368: SLDC 04          Short load constant 4
   0369: LOD  01 0001     Load word at G1 (SYSCOM)
   036c: INC  001f        Inc field ptr (TOS+31)
   036e: SLDC 08          Short load constant 8
   036f: SLDC 08          Short load constant 8
   0370: LDP              Load packed field (TOS)
   0371: CBP  35          Call base procedure PASCALSY.53
-> 0373: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC37 (* P=37 LL=0 *)
  BASE1
  BASE2
BEGIN
-> 0380: CBP  24          Call base procedure PASCALSY.36
   0382: LOD  01 0001     Load word at G1 (SYSCOM)
   0385: SRO  0001        Store global word BASE1
   0387: SLDO 01          Short load global BASE1
   0388: INC  001f        Inc field ptr (TOS+31)
   038a: SRO  0002        Store global word BASE2
   038c: SLDC 03          Short load constant 3
   038d: CSP  26          Call standard procedure UNITCLEAR
   038f: SLDO 02          Short load global BASE2
   0390: INC  0001        Inc field ptr (TOS+1)
   0392: SLDC 08          Short load constant 8
   0393: SLDC 00          Short load constant 0
   0394: LDP              Load packed field (TOS)
   0395: SLDC 00          Short load constant 0
   0396: NEQI             Integer TOS-1 <> TOS
   0397: FJP  $03a4       Jump if TOS false
   0399: SLDC 03          Short load constant 3
   039a: SLDO 02          Short load global BASE2
   039b: INC  0001        Inc field ptr (TOS+1)
   039d: SLDC 08          Short load constant 8
   039e: SLDC 00          Short load constant 0
   039f: LDP              Load packed field (TOS)
   03a0: CBP  35          Call base procedure PASCALSY.53
   03a2: UJP  $03ad       Unconditional jump
-> 03a4: SLDC 06          Short load constant 6
   03a5: SLDO 02          Short load global BASE2
   03a6: INC  0004        Inc field ptr (TOS+4)
   03a8: SLDC 08          Short load constant 8
   03a9: SLDC 08          Short load constant 8
   03aa: LDP              Load packed field (TOS)
   03ab: CBP  35          Call base procedure PASCALSY.53
-> 03ad: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC38 (* P=38 LL=0 *)
  BASE1
  BASE2
  BASE3
  BASE4
BEGIN
-> 03ba: LOD  01 0001     Load word at G1 (SYSCOM)
   03bd: SRO  0002        Store global word BASE2
   03bf: SLDO 02          Short load global BASE2
   03c0: INC  001f        Inc field ptr (TOS+31)
   03c2: SRO  0003        Store global word BASE3
   03c4: SLDO 03          Short load global BASE3
   03c5: INC  0001        Inc field ptr (TOS+1)
   03c7: SLDC 08          Short load constant 8
   03c8: SLDC 08          Short load constant 8
   03c9: LDP              Load packed field (TOS)
   03ca: SLDC 00          Short load constant 0
   03cb: NEQI             Integer TOS-1 <> TOS
   03cc: FJP  $03d9       Jump if TOS false
   03ce: SLDC 02          Short load constant 2
   03cf: SLDO 03          Short load global BASE3
   03d0: INC  0001        Inc field ptr (TOS+1)
   03d2: SLDC 08          Short load constant 8
   03d3: SLDC 08          Short load constant 8
   03d4: LDP              Load packed field (TOS)
   03d5: CBP  35          Call base procedure PASCALSY.53
   03d7: UJP  $0423       Unconditional jump
-> 03d9: SLDO 03          Short load global BASE3
   03da: INC  0004        Inc field ptr (TOS+4)
   03dc: SLDC 08          Short load constant 8
   03dd: SLDC 00          Short load constant 0
   03de: LDP              Load packed field (TOS)
   03df: SLDC 00          Short load constant 0
   03e0: NEQI             Integer TOS-1 <> TOS
   03e1: FJP  $03ee       Jump if TOS false
   03e3: SLDC 07          Short load constant 7
   03e4: SLDO 03          Short load global BASE3
   03e5: INC  0004        Inc field ptr (TOS+4)
   03e7: SLDC 08          Short load constant 8
   03e8: SLDC 00          Short load constant 0
   03e9: LDP              Load packed field (TOS)
   03ea: CBP  35          Call base procedure PASCALSY.53
   03ec: UJP  $0423       Unconditional jump
-> 03ee: SLDO 03          Short load global BASE3
   03ef: INC  0002        Inc field ptr (TOS+2)
   03f1: SLDC 08          Short load constant 8
   03f2: SLDC 08          Short load constant 8
   03f3: LDP              Load packed field (TOS)
   03f4: SLDC 00          Short load constant 0
   03f5: NEQI             Integer TOS-1 <> TOS
   03f6: FJP  $0423       Jump if TOS false
   03f8: SLDC 02          Short load constant 2
   03f9: SRO  0001        Store global word BASE1
   03fb: SLDO 02          Short load global BASE2
   03fc: IND  0026        Static index and load word (TOS+38)
   03fe: SRO  0004        Store global word BASE4
-> 0400: SLDO 01          Short load global BASE1
   0401: SLDO 04          Short load global BASE4
   0402: LEQI             Integer TOS-1 <= TOS
   0403: FJP  $0414       Jump if TOS false
   0405: LOD  01 0003     Load word at G3 (OUTPUT)
   0408: SLDC 20          Short load constant 32
   0409: SLDC 00          Short load constant 0
   040a: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   040d: SLDO 01          Short load global BASE1
   040e: SLDC 01          Short load constant 1
   040f: ADI              Add integers (TOS + TOS-1)
   0410: SRO  0001        Store global word BASE1
   0412: UJP  $0400       Unconditional jump
-> 0414: LOD  01 0003     Load word at G3 (OUTPUT)
   0417: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   041a: SLDC 00          Short load constant 0
   041b: SLDO 03          Short load global BASE3
   041c: INC  0002        Inc field ptr (TOS+2)
   041e: SLDC 08          Short load constant 8
   041f: SLDC 08          Short load constant 8
   0420: LDP              Load packed field (TOS)
   0421: CBP  35          Call base procedure PASCALSY.53
-> 0423: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC39 (* P=39 LL=0 *)
BEGIN
-> 0432: CBP  24          Call base procedure PASCALSY.36
   0434: CBP  26          Call base procedure PASCALSY.38
   0436: LOD  01 0003     Load word at G3 (OUTPUT)
   0439: LDA  01 0046     Load addr G70
   043c: SLDC 00          Short load constant 0
   043d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0440: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC40(PARAM1): RETVAL (* P=40 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
BEGIN
-> 044c: LOD  01 0003     Load word at G3 (OUTPUT)
   044f: LSA  19          Load string address: 'Press <space> to continue'
   046a: NOP              No operation
   046b: SLDC 00          Short load constant 0
   046c: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   046f: SLDO 03          Short load global BASE3
   0470: SLDC 00          Short load constant 0
   0471: SLDC 00          Short load constant 0
   0472: CBP  29          Call base procedure PASCALSY.41
   0474: SRO  0004        Store global word BASE4
   0476: LOD  01 0002     Load word at G2 (INPUT)
   0479: SLDC 00          Short load constant 0
   047a: SLDC 00          Short load constant 0
   047b: CXP  00 0b       Call external procedure PASCALSY.FEOLN
   047e: LNOT             Logical NOT (~TOS)
   047f: FJP  $0487       Jump if TOS false
   0481: LOD  01 0003     Load word at G3 (OUTPUT)
   0484: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0487: CBP  26          Call base procedure PASCALSY.38
   0489: SLDO 04          Short load global BASE4
   048a: SLDC 20          Short load constant 32
   048b: EQUI             Integer TOS-1 = TOS
   048c: SLDO 04          Short load global BASE4
   048d: SLDC 1b          Short load constant 27
   048e: EQUI             Integer TOS-1 = TOS
   048f: LOR              Logical OR (TOS | TOS-1)
   0490: FJP  $044c       Jump if TOS false
   0492: SLDO 04          Short load global BASE4
   0493: SLDC 20          Short load constant 32
   0494: NEQI             Integer TOS-1 <> TOS
   0495: SRO  0001        Store global word BASE1
-> 0497: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FUNC41(PARAM1): RETVAL (* P=41 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
BEGIN
-> 04a6: SLDO 03          Short load global BASE3
   04a7: FJP  $04ac       Jump if TOS false
   04a9: SLDC 01          Short load constant 1
   04aa: CSP  26          Call standard procedure UNITCLEAR
-> 04ac: LOD  01 003a     Load word at G58
   04af: SIND 02          Short index load *TOS+2
   04b0: FJP  $04b6       Jump if TOS false
   04b2: SLDC 00          Short load constant 0
   04b3: SLDC 30          Short load constant 48
   04b4: CSP  04          Call standard procedure EXIT
-> 04b6: LOD  01 003a     Load word at G58
   04b9: INC  0003        Inc field ptr (TOS+3)
   04bb: SLDC 01          Short load constant 1
   04bc: STO              Store indirect (TOS into TOS-1)
   04bd: LOD  01 0002     Load word at G2 (INPUT)
   04c0: LAO  0004        Load global BASE4
   04c2: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   04c5: SLDO 04          Short load global BASE4
   04c6: SLDC 61          Short load constant 97
   04c7: GEQI             Integer TOS-1 >= TOS
   04c8: SLDO 04          Short load global BASE4
   04c9: SLDC 7a          Short load constant 122
   04ca: LEQI             Integer TOS-1 <= TOS
   04cb: LAND             Logical AND (TOS & TOS-1)
   04cc: FJP  $04d5       Jump if TOS false
   04ce: SLDO 04          Short load global BASE4
   04cf: SLDC 61          Short load constant 97
   04d0: SBI              Subtract integers (TOS-1 - TOS)
   04d1: SLDC 41          Short load constant 65
   04d2: ADI              Add integers (TOS + TOS-1)
   04d3: SRO  0004        Store global word BASE4
-> 04d5: SLDO 04          Short load global BASE4
   04d6: SRO  0001        Store global word BASE1
-> 04d8: RBP  01          Return from base procedure
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
-> 04e4: SLDC 00          Short load constant 0
   04e5: SRO  0001        Store global word BASE1
   04e7: LOD  01 0001     Load word at G1 (SYSCOM)
   04ea: SRO  0007        Store global word BASE7
   04ec: LDA  01 007e     Load addr G126
   04ef: SLDO 03          Short load global BASE3
   04f0: IXA  0006        Index array (TOS-1 + TOS * 6)
   04f2: SRO  0008        Store global word BASE8
   04f4: SLDO 07          Short load global BASE7
   04f5: SIND 04          Short index load *TOS+4
   04f6: LDCN             Load constant NIL
   04f7: EQUI             Integer TOS-1 = TOS
   04f8: FJP  $0502       Jump if TOS false
   04fa: SLDO 07          Short load global BASE7
   04fb: INC  0004        Inc field ptr (TOS+4)
   04fd: LDCI 03f6        Load word 1014
   0500: CSP  01          Call standard procedure NEW
-> 0502: SLDO 03          Short load global BASE3
   0503: SLDO 07          Short load global BASE7
   0504: SIND 04          Short index load *TOS+4
   0505: SLDC 00          Short load constant 0
   0506: LDCI 07ec        Load word 2028
   0509: SLDC 02          Short load constant 2
   050a: SLDC 00          Short load constant 0
   050b: CSP  05          Call standard procedure UNITREAD
   050d: SLDO 07          Short load global BASE7
   050e: SIND 00          Short index load *TOS+0
   050f: SLDC 00          Short load constant 0
   0510: EQUI             Integer TOS-1 = TOS
   0511: SRO  0005        Store global word BASE5
   0513: SLDO 05          Short load global BASE5
   0514: FJP  $05fb       Jump if TOS false
   0516: SLDO 07          Short load global BASE7
   0517: SIND 04          Short index load *TOS+4
   0518: SLDC 00          Short load constant 0
   0519: IXA  000d        Index array (TOS-1 + TOS * 13)
   051b: SRO  0009        Store global word BASE9
   051d: SLDC 00          Short load constant 0
   051e: SRO  0005        Store global word BASE5
   0520: SLDO 09          Short load global BASE9
   0521: SIND 00          Short index load *TOS+0
   0522: SLDC 00          Short load constant 0
   0523: EQUI             Integer TOS-1 = TOS
   0524: SLDO 07          Short load global BASE7
   0525: INC  001d        Inc field ptr (TOS+29)
   0527: SLDC 02          Short load constant 2
   0528: SLDC 07          Short load constant 7
   0529: LDP              Load packed field (TOS)
   052a: SLDC 02          Short load constant 2
   052b: EQUI             Integer TOS-1 = TOS
   052c: SLDO 07          Short load global BASE7
   052d: INC  001d        Inc field ptr (TOS+29)
   052f: SLDC 02          Short load constant 2
   0530: SLDC 07          Short load constant 7
   0531: LDP              Load packed field (TOS)
   0532: SLDC 0a          Short load constant 10
   0533: SLDC 01          Short load constant 1
   0534: INN              Set membership (TOS-1 in set TOS)
   0535: SLDO 09          Short load global BASE9
   0536: INC  0002        Inc field ptr (TOS+2)
   0538: SLDC 04          Short load constant 4
   0539: SLDC 00          Short load constant 0
   053a: LDP              Load packed field (TOS)
   053b: SLDC 08          Short load constant 8
   053c: EQUI             Integer TOS-1 = TOS
   053d: LAND             Logical AND (TOS & TOS-1)
   053e: LOR              Logical OR (TOS | TOS-1)
   053f: SLDO 07          Short load global BASE7
   0540: INC  001d        Inc field ptr (TOS+29)
   0542: SLDC 02          Short load constant 2
   0543: SLDC 07          Short load constant 7
   0544: LDP              Load packed field (TOS)
   0545: SLDC 00          Short load constant 0
   0546: EQUI             Integer TOS-1 = TOS
   0547: SLDO 09          Short load global BASE9
   0548: INC  0002        Inc field ptr (TOS+2)
   054a: SLDC 04          Short load constant 4
   054b: SLDC 00          Short load constant 0
   054c: LDP              Load packed field (TOS)
   054d: SLDC 00          Short load constant 0
   054e: EQUI             Integer TOS-1 = TOS
   054f: LAND             Logical AND (TOS & TOS-1)
   0550: LOR              Logical OR (TOS | TOS-1)
   0551: LAND             Logical AND (TOS & TOS-1)
   0552: FJP  $05e5       Jump if TOS false
   0554: SLDO 09          Short load global BASE9
   0555: INC  0003        Inc field ptr (TOS+3)
   0557: SLDC 00          Short load constant 0
   0558: LDB              Load byte at byte ptr TOS-1 + TOS
   0559: SLDC 00          Short load constant 0
   055a: GRTI             Integer TOS-1 > TOS
   055b: SLDO 09          Short load global BASE9
   055c: INC  0003        Inc field ptr (TOS+3)
   055e: SLDC 00          Short load constant 0
   055f: LDB              Load byte at byte ptr TOS-1 + TOS
   0560: SLDC 07          Short load constant 7
   0561: LEQI             Integer TOS-1 <= TOS
   0562: LAND             Logical AND (TOS & TOS-1)
   0563: SLDO 09          Short load global BASE9
   0564: IND  0008        Static index and load word (TOS+8)
   0566: SLDC 00          Short load constant 0
   0567: GEQI             Integer TOS-1 >= TOS
   0568: LAND             Logical AND (TOS & TOS-1)
   0569: SLDO 09          Short load global BASE9
   056a: IND  0008        Static index and load word (TOS+8)
   056c: SLDC 4d          Short load constant 77
   056d: LEQI             Integer TOS-1 <= TOS
   056e: LAND             Logical AND (TOS & TOS-1)
   056f: FJP  $05e5       Jump if TOS false
   0571: SLDC 01          Short load constant 1
   0572: SRO  0005        Store global word BASE5
   0574: SLDO 09          Short load global BASE9
   0575: INC  0003        Inc field ptr (TOS+3)
   0577: SLDO 08          Short load global BASE8
   0578: NEQSTR           String TOS-1 <> TOS
   057a: FJP  $05e5       Jump if TOS false
   057c: SLDC 01          Short load constant 1
   057d: SRO  0004        Store global word BASE4
-> 057f: SLDO 04          Short load global BASE4
   0580: SLDO 09          Short load global BASE9
   0581: IND  0008        Static index and load word (TOS+8)
   0583: LEQI             Integer TOS-1 <= TOS
   0584: FJP  $05cc       Jump if TOS false
   0586: SLDO 07          Short load global BASE7
   0587: SIND 04          Short index load *TOS+4
   0588: SLDO 04          Short load global BASE4
   0589: IXA  000d        Index array (TOS-1 + TOS * 13)
   058b: SRO  000a        Store global word BASE10
   058d: SLDO 0a          Short load global BASE10
   058e: INC  0003        Inc field ptr (TOS+3)
   0590: SLDC 00          Short load constant 0
   0591: LDB              Load byte at byte ptr TOS-1 + TOS
   0592: SLDC 00          Short load constant 0
   0593: LEQI             Integer TOS-1 <= TOS
   0594: SLDO 0a          Short load global BASE10
   0595: INC  0003        Inc field ptr (TOS+3)
   0597: SLDC 00          Short load constant 0
   0598: LDB              Load byte at byte ptr TOS-1 + TOS
   0599: SLDC 0f          Short load constant 15
   059a: GRTI             Integer TOS-1 > TOS
   059b: LOR              Logical OR (TOS | TOS-1)
   059c: SLDO 0a          Short load global BASE10
   059d: SIND 01          Short index load *TOS+1
   059e: SLDO 0a          Short load global BASE10
   059f: SIND 00          Short index load *TOS+0
   05a0: LESI             Integer TOS-1 < TOS
   05a1: LOR              Logical OR (TOS | TOS-1)
   05a2: SLDO 0a          Short load global BASE10
   05a3: IND  000b        Static index and load word (TOS+11)
   05a5: LDCI 0200        Load word 512
   05a8: GRTI             Integer TOS-1 > TOS
   05a9: LOR              Logical OR (TOS | TOS-1)
   05aa: SLDO 0a          Short load global BASE10
   05ab: IND  000b        Static index and load word (TOS+11)
   05ad: SLDC 00          Short load constant 0
   05ae: LEQI             Integer TOS-1 <= TOS
   05af: LOR              Logical OR (TOS | TOS-1)
   05b0: SLDO 0a          Short load global BASE10
   05b1: INC  000c        Inc field ptr (TOS+12)
   05b3: SLDC 07          Short load constant 7
   05b4: SLDC 09          Short load constant 9
   05b5: LDP              Load packed field (TOS)
   05b6: SLDC 64          Short load constant 100
   05b7: GEQI             Integer TOS-1 >= TOS
   05b8: LOR              Logical OR (TOS | TOS-1)
   05b9: FJP  $05c5       Jump if TOS false
   05bb: SLDC 00          Short load constant 0
   05bc: SRO  0005        Store global word BASE5
   05be: SLDO 04          Short load global BASE4
   05bf: SLDO 07          Short load global BASE7
   05c0: SIND 04          Short index load *TOS+4
   05c1: CBP  22          Call base procedure PASCALSY.34
   05c3: UJP  $05ca       Unconditional jump
-> 05c5: SLDO 04          Short load global BASE4
   05c6: SLDC 01          Short load constant 1
   05c7: ADI              Add integers (TOS + TOS-1)
   05c8: SRO  0004        Store global word BASE4
-> 05ca: UJP  $057f       Unconditional jump
-> 05cc: SLDO 05          Short load global BASE5
   05cd: LNOT             Logical NOT (~TOS)
   05ce: FJP  $05e5       Jump if TOS false
   05d0: SLDO 03          Short load global BASE3
   05d1: SLDO 07          Short load global BASE7
   05d2: SIND 04          Short index load *TOS+4
   05d3: SLDC 00          Short load constant 0
   05d4: SLDO 09          Short load global BASE9
   05d5: IND  0008        Static index and load word (TOS+8)
   05d7: SLDC 01          Short load constant 1
   05d8: ADI              Add integers (TOS + TOS-1)
   05d9: SLDC 1a          Short load constant 26
   05da: MPI              Multiply integers (TOS * TOS-1)
   05db: SLDC 02          Short load constant 2
   05dc: SLDC 00          Short load constant 0
   05dd: CSP  06          Call standard procedure UNITWRITE
   05df: SLDO 07          Short load global BASE7
   05e0: SIND 00          Short index load *TOS+0
   05e1: SLDC 00          Short load constant 0
   05e2: EQUI             Integer TOS-1 = TOS
   05e3: SRO  0005        Store global word BASE5
-> 05e5: SLDO 05          Short load global BASE5
   05e6: FJP  $05fb       Jump if TOS false
   05e8: SLDO 08          Short load global BASE8
   05e9: SLDO 09          Short load global BASE9
   05ea: INC  0003        Inc field ptr (TOS+3)
   05ec: SAS  07          String assign (TOS to TOS-1, 7 chars)
   05ee: SLDO 08          Short load global BASE8
   05ef: INC  0005        Inc field ptr (TOS+5)
   05f1: SLDO 09          Short load global BASE9
   05f2: SIND 07          Short index load *TOS+7
   05f3: STO              Store indirect (TOS into TOS-1)
   05f4: LAO  0006        Load global BASE6
   05f6: SLDO 09          Short load global BASE9
   05f7: INC  0009        Inc field ptr (TOS+9)
   05f9: CSP  09          Call standard procedure TIME
-> 05fb: SLDO 05          Short load global BASE5
   05fc: SRO  0001        Store global word BASE1
   05fe: SLDO 05          Short load global BASE5
   05ff: LNOT             Logical NOT (~TOS)
   0600: FJP  $0619       Jump if TOS false
   0602: SLDO 08          Short load global BASE8
   0603: LSA  00          Load string address: ''
   0605: NOP              No operation
   0606: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0608: SLDO 08          Short load global BASE8
   0609: INC  0005        Inc field ptr (TOS+5)
   060b: LDCI 7fff        Load word 32767
   060e: STO              Store indirect (TOS into TOS-1)
   060f: SLDO 07          Short load global BASE7
   0610: INC  0004        Inc field ptr (TOS+4)
   0612: CSP  21          Call standard procedure RELEASE
   0614: SLDO 07          Short load global BASE7
   0615: INC  0004        Inc field ptr (TOS+4)
   0617: LDCN             Load constant NIL
   0618: STO              Store indirect (TOS into TOS-1)
-> 0619: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC43(PARAM1; PARAM2; PARAM3) (* P=43 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE294
BEGIN
-> 062c: SLDC 04          Short load constant 4
   062d: LAO  0004        Load global BASE4
   062f: SLDO 03          Short load global BASE3
   0630: SLDO 02          Short load global BASE2
   0631: LDO  0126        Load global word BASE294
   0634: SLDO 01          Short load global BASE1
   0635: CXP  06 01       Call external procedure FILEPROC.1
-> 0638: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC44(PARAM1) (* P=44 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 0644: LOD  01 017d     Load word at G381
   0648: LOD  01 017f     Load word at G383
   064c: SLDO 01          Short load global BASE1
   064d: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   064e: LOD  01 017f     Load word at G383
   0652: SLDC 01          Short load constant 1
   0653: ADI              Add integers (TOS + TOS-1)
   0654: STR  01 017f     Store TOS to G383
   0658: LOD  01 017f     Load word at G383
   065c: LDCI 01fd        Load word 509
   065f: GRTI             Integer TOS-1 > TOS
   0660: LOD  01 0181     Load word at G385
   0664: LAND             Logical AND (TOS & TOS-1)
   0665: FJP  $0675       Jump if TOS false
   0667: LOD  01 017d     Load word at G381
   066b: LOD  01 017f     Load word at G383
   066f: SLDC 0d          Short load constant 13
   0670: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0671: CBP  2f          Call base procedure PASCALSY.47
   0673: UJP  $0681       Unconditional jump
-> 0675: LOD  01 017f     Load word at G383
   0679: LDCI 01ff        Load word 511
   067c: GRTI             Integer TOS-1 > TOS
   067d: FJP  $0681       Jump if TOS false
   067f: CBP  2f          Call base procedure PASCALSY.47
-> 0681: SLDO 01          Short load global BASE1
   0682: LOD  01 018b     Load word at G395
   0686: EQUI             Integer TOS-1 = TOS
   0687: FJP  $0697       Jump if TOS false
   0689: LOD  01 018a     Load word at G394
   068d: LOD  01 018b     Load word at G395
   0691: EQUI             Integer TOS-1 = TOS
   0692: FJP  $0697       Jump if TOS false
   0694: SLDC 01          Short load constant 1
   0695: CBP  2d          Call base procedure PASCALSY.45
-> 0697: SLDO 01          Short load global BASE1
   0698: STR  01 018a     Store TOS to G394
-> 069c: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC45(PARAM1) (* P=45 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 06a8: LOD  01 0182     Load word at G386
   06ac: FJP  $06bd       Jump if TOS false
   06ae: SLDC 00          Short load constant 0
   06af: STR  01 0182     Store TOS to G386
   06b3: LDA  01 018c     Load addr G396
   06b7: SLDC 00          Short load constant 0
   06b8: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   06bb: UJP  $06f0       Unconditional jump
-> 06bd: SLDO 01          Short load global BASE1
   06be: FJP  $06e3       Jump if TOS false
   06c0: SLDC 20          Short load constant 32
   06c1: STR  01 018a     Store TOS to G394
   06c5: LOD  01 018b     Load word at G395
   06c9: CBP  2c          Call base procedure PASCALSY.44
   06cb: SLDC 20          Short load constant 32
   06cc: STR  01 018a     Store TOS to G394
   06d0: LOD  01 018b     Load word at G395
   06d4: CBP  2c          Call base procedure PASCALSY.44
   06d6: SLDC 0d          Short load constant 13
   06d7: CBP  2c          Call base procedure PASCALSY.44
   06d9: CBP  2f          Call base procedure PASCALSY.47
   06db: LOD  01 0181     Load word at G385
   06df: FJP  $06e3       Jump if TOS false
   06e1: CBP  2f          Call base procedure PASCALSY.47
-> 06e3: SLDC 00          Short load constant 0
   06e4: STR  01 0183     Store TOS to G387
   06e8: LDA  01 018c     Load addr G396
   06ec: SLDC 01          Short load constant 1
   06ed: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 06f0: LOD  01 017e     Load word at G382
   06f4: STR  01 0036     Store TOS to G54
   06f7: SLDC 01          Short load constant 1
   06f8: STR  01 0187     Store TOS to G391
-> 06fc: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC46 (* P=46 LL=0 *)
BEGIN
-> 0708: LOD  01 0181     Load word at G385
   070c: SLDC 01          Short load constant 1
   070d: ADI              Add integers (TOS + TOS-1)
   070e: STR  01 0181     Store TOS to G385
   0712: LDA  01 018c     Load addr G396
   0716: LOD  01 017d     Load word at G381
   071a: SLDC 00          Short load constant 0
   071b: SLDC 01          Short load constant 1
   071c: LOD  01 0181     Load word at G385
   0720: SLDC 01          Short load constant 1
   0721: SLDC 00          Short load constant 0
   0722: SLDC 00          Short load constant 0
   0723: CXP  00 1c       Call external procedure PASCALSY.FBLOCKIO
   0726: SLDC 01          Short load constant 1
   0727: NEQI             Integer TOS-1 <> TOS
   0728: FJP  $075c       Jump if TOS false
   072a: LOD  01 0003     Load word at G3 (OUTPUT)
   072d: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0730: LOD  01 0003     Load word at G3 (OUTPUT)
   0733: LSA  17          Load string address: 'Error reading exec file'
   074c: NOP              No operation
   074d: SLDC 00          Short load constant 0
   074e: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0751: LOD  01 0003     Load word at G3 (OUTPUT)
   0754: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0757: SLDC 01          Short load constant 1
   0758: CBP  2d          Call base procedure PASCALSY.45
   075a: UJP  $0788       Unconditional jump
-> 075c: SLDC 00          Short load constant 0
   075d: STR  01 017f     Store TOS to G383
   0761: LOD  01 0181     Load word at G385
   0765: FJP  $0781       Jump if TOS false
   0767: LDCI 01fe        Load word 510
   076a: LDCI 01ff        Load word 511
   076d: NGI              Negate integer
   076e: SLDC 00          Short load constant 0
   076f: SLDC 0d          Short load constant 13
   0770: LOD  01 017d     Load word at G381
   0774: LDCI 01ff        Load word 511
   0777: SLDC 00          Short load constant 0
   0778: CSP  0b          Call standard procedure SCAN
   077a: ADI              Add integers (TOS + TOS-1)
   077b: STR  01 0180     Store TOS to G384
   077f: UJP  $0788       Unconditional jump
-> 0781: LDCI 01ff        Load word 511
   0784: STR  01 0180     Store TOS to G384
-> 0788: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC47 (* P=47 LL=0 *)
BEGIN
-> 0794: LDA  01 018c     Load addr G396
   0798: LOD  01 017d     Load word at G381
   079c: SLDC 00          Short load constant 0
   079d: SLDC 01          Short load constant 1
   079e: LOD  01 0181     Load word at G385
   07a2: SLDC 00          Short load constant 0
   07a3: SLDC 00          Short load constant 0
   07a4: SLDC 00          Short load constant 0
   07a5: CXP  00 1c       Call external procedure PASCALSY.FBLOCKIO
   07a8: SLDC 01          Short load constant 1
   07a9: NEQI             Integer TOS-1 <> TOS
   07aa: FJP  $07de       Jump if TOS false
   07ac: LOD  01 0003     Load word at G3 (OUTPUT)
   07af: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   07b2: LOD  01 0003     Load word at G3 (OUTPUT)
   07b5: LSA  17          Load string address: 'Error writing exec file'
   07ce: NOP              No operation
   07cf: SLDC 00          Short load constant 0
   07d0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   07d3: LOD  01 0003     Load word at G3 (OUTPUT)
   07d6: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   07d9: SLDC 00          Short load constant 0
   07da: CBP  2d          Call base procedure PASCALSY.45
   07dc: UJP  $07f8       Unconditional jump
-> 07de: LOD  01 017d     Load word at G381
   07e2: SLDC 00          Short load constant 0
   07e3: LDCI 0200        Load word 512
   07e6: SLDC 00          Short load constant 0
   07e7: CSP  0a          Call standard procedure FLCH
   07e9: SLDC 00          Short load constant 0
   07ea: STR  01 017f     Store TOS to G383
   07ee: LOD  01 0181     Load word at G385
   07f2: SLDC 01          Short load constant 1
   07f3: ADI              Add integers (TOS + TOS-1)
   07f4: STR  01 0181     Store TOS to G385
-> 07f8: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC48 (* P=48 LL=0 *)
BEGIN
-> 0804: SLDC 00          Short load constant 0
   0805: STR  01 0045     Store TOS to G69
   0808: SLDC 00          Short load constant 0
   0809: STR  01 0184     Store TOS to G388
-> 080d: CBP  32          Call base procedure PASCALSY.50
   080f: CLP  3a          Call local procedure PASCALSY.58
   0811: LOD  01 0184     Load word at G388
   0815: FJP  $081c       Jump if TOS false
   0817: LDCN             Load constant NIL
   0818: LDCN             Load constant NIL
   0819: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
-> 081c: LOD  01 0045     Load word at G69
   081f: SLDC 00          Short load constant 0
   0820: EQUI             Integer TOS-1 = TOS
   0821: FJP  $080d       Jump if TOS false
-> 0823: RBP  00          Return from base procedure
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
-> 0832: SLDC 01          Short load constant 1
   0833: SRO  0001        Store global word BASE1
   0835: SLDC 00          Short load constant 0
   0836: SRO  0005        Store global word BASE5
   0838: SLDO 03          Short load global BASE3
   0839: SRO  0009        Store global word BASE9
   083b: SLDO 09          Short load global BASE9
   083c: INC  0010        Inc field ptr (TOS+16)
   083e: SRO  000a        Store global word BASE10
   0840: SLDO 0a          Short load global BASE10
   0841: INC  0003        Inc field ptr (TOS+3)
   0843: SLDC 00          Short load constant 0
   0844: LDB              Load byte at byte ptr TOS-1 + TOS
   0845: SLDC 00          Short load constant 0
   0846: GRTI             Integer TOS-1 > TOS
   0847: FJP  $090e       Jump if TOS false
   0849: SLDO 09          Short load global BASE9
   084a: SIND 07          Short index load *TOS+7
   084b: SLDO 09          Short load global BASE9
   084c: INC  0008        Inc field ptr (TOS+8)
   084e: SLDC 00          Short load constant 0
   084f: LAO  0008        Load global BASE8
   0851: SLDC 00          Short load constant 0
   0852: SLDC 00          Short load constant 0
   0853: CBP  1e          Call base procedure PASCALSY.30
   0855: NEQI             Integer TOS-1 <> TOS
   0856: FJP  $085f       Jump if TOS false
   0858: LOD  01 0001     Load word at G1 (SYSCOM)
   085b: SLDC 05          Short load constant 5
   085c: STO              Store indirect (TOS into TOS-1)
   085d: UJP  $090e       Unconditional jump
-> 085f: SLDC 00          Short load constant 0
   0860: SRO  0006        Store global word BASE6
   0862: SLDC 01          Short load constant 1
   0863: SRO  0004        Store global word BASE4
-> 0865: SLDO 04          Short load global BASE4
   0866: SLDO 08          Short load global BASE8
   0867: SLDC 00          Short load constant 0
   0868: IXA  000d        Index array (TOS-1 + TOS * 13)
   086a: IND  0008        Static index and load word (TOS+8)
   086c: LEQI             Integer TOS-1 <= TOS
   086d: SLDO 06          Short load global BASE6
   086e: LNOT             Logical NOT (~TOS)
   086f: LAND             Logical AND (TOS & TOS-1)
   0870: FJP  $088c       Jump if TOS false
   0872: SLDO 08          Short load global BASE8
   0873: SLDO 04          Short load global BASE4
   0874: IXA  000d        Index array (TOS-1 + TOS * 13)
   0876: SIND 00          Short index load *TOS+0
   0877: SLDO 0a          Short load global BASE10
   0878: SIND 00          Short index load *TOS+0
   0879: EQUI             Integer TOS-1 = TOS
   087a: SLDO 08          Short load global BASE8
   087b: SLDO 04          Short load global BASE4
   087c: IXA  000d        Index array (TOS-1 + TOS * 13)
   087e: SIND 01          Short index load *TOS+1
   087f: SLDO 0a          Short load global BASE10
   0880: SIND 01          Short index load *TOS+1
   0881: EQUI             Integer TOS-1 = TOS
   0882: LAND             Logical AND (TOS & TOS-1)
   0883: SRO  0006        Store global word BASE6
   0885: SLDO 04          Short load global BASE4
   0886: SLDC 01          Short load constant 1
   0887: ADI              Add integers (TOS + TOS-1)
   0888: SRO  0004        Store global word BASE4
   088a: UJP  $0865       Unconditional jump
-> 088c: SLDO 06          Short load global BASE6
   088d: LNOT             Logical NOT (~TOS)
   088e: FJP  $0897       Jump if TOS false
   0890: LOD  01 0001     Load word at G1 (SYSCOM)
   0893: SLDC 06          Short load constant 6
   0894: STO              Store indirect (TOS into TOS-1)
   0895: UJP  $090e       Unconditional jump
-> 0897: SLDO 04          Short load global BASE4
   0898: SLDO 08          Short load global BASE8
   0899: SLDC 00          Short load constant 0
   089a: IXA  000d        Index array (TOS-1 + TOS * 13)
   089c: IND  0008        Static index and load word (TOS+8)
   089e: GRTI             Integer TOS-1 > TOS
   089f: FJP  $08aa       Jump if TOS false
   08a1: SLDO 08          Short load global BASE8
   08a2: SLDC 00          Short load constant 0
   08a3: IXA  000d        Index array (TOS-1 + TOS * 13)
   08a5: SIND 07          Short index load *TOS+7
   08a6: SRO  0007        Store global word BASE7
   08a8: UJP  $08b1       Unconditional jump
-> 08aa: SLDO 08          Short load global BASE8
   08ab: SLDO 04          Short load global BASE4
   08ac: IXA  000d        Index array (TOS-1 + TOS * 13)
   08ae: SIND 00          Short index load *TOS+0
   08af: SRO  0007        Store global word BASE7
-> 08b1: SLDO 0a          Short load global BASE10
   08b2: SIND 01          Short index load *TOS+1
   08b3: SLDO 07          Short load global BASE7
   08b4: LESI             Integer TOS-1 < TOS
   08b5: SLDO 0a          Short load global BASE10
   08b6: IND  000b        Static index and load word (TOS+11)
   08b8: LDCI 0200        Load word 512
   08bb: LESI             Integer TOS-1 < TOS
   08bc: LOR              Logical OR (TOS | TOS-1)
   08bd: FJP  $090b       Jump if TOS false
   08bf: SLDO 08          Short load global BASE8
   08c0: SLDO 04          Short load global BASE4
   08c1: SLDC 01          Short load constant 1
   08c2: SBI              Subtract integers (TOS-1 - TOS)
   08c3: IXA  000d        Index array (TOS-1 + TOS * 13)
   08c5: SRO  000b        Store global word BASE11
   08c7: SLDO 0b          Short load global BASE11
   08c8: INC  0001        Inc field ptr (TOS+1)
   08ca: SLDO 07          Short load global BASE7
   08cb: STO              Store indirect (TOS into TOS-1)
   08cc: SLDO 0b          Short load global BASE11
   08cd: INC  000b        Inc field ptr (TOS+11)
   08cf: LDCI 0200        Load word 512
   08d2: STO              Store indirect (TOS into TOS-1)
   08d3: SLDO 09          Short load global BASE9
   08d4: SIND 07          Short index load *TOS+7
   08d5: SLDO 08          Short load global BASE8
   08d6: CBP  1f          Call base procedure PASCALSY.31
   08d8: CSP  22          Call standard procedure IORESULT
   08da: SLDC 00          Short load constant 0
   08db: NEQI             Integer TOS-1 <> TOS
   08dc: FJP  $08e0       Jump if TOS false
   08de: UJP  $090e       Unconditional jump
-> 08e0: SLDO 09          Short load global BASE9
   08e1: INC  0002        Inc field ptr (TOS+2)
   08e3: SLDC 00          Short load constant 0
   08e4: STO              Store indirect (TOS into TOS-1)
   08e5: SLDO 09          Short load global BASE9
   08e6: INC  0001        Inc field ptr (TOS+1)
   08e8: SLDC 00          Short load constant 0
   08e9: STO              Store indirect (TOS into TOS-1)
   08ea: SLDO 09          Short load global BASE9
   08eb: SIND 03          Short index load *TOS+3
   08ec: SLDC 00          Short load constant 0
   08ed: NEQI             Integer TOS-1 <> TOS
   08ee: FJP  $08f5       Jump if TOS false
   08f0: SLDO 09          Short load global BASE9
   08f1: INC  0003        Inc field ptr (TOS+3)
   08f3: SLDC 01          Short load constant 1
   08f4: STO              Store indirect (TOS into TOS-1)
-> 08f5: SLDO 0a          Short load global BASE10
   08f6: INC  0001        Inc field ptr (TOS+1)
   08f8: SLDO 07          Short load global BASE7
   08f9: STO              Store indirect (TOS into TOS-1)
   08fa: SLDO 0a          Short load global BASE10
   08fb: INC  000b        Inc field ptr (TOS+11)
   08fd: LDCI 0200        Load word 512
   0900: STO              Store indirect (TOS into TOS-1)
   0901: SLDO 0a          Short load global BASE10
   0902: INC  000c        Inc field ptr (TOS+12)
   0904: SLDC 07          Short load constant 7
   0905: SLDC 09          Short load constant 9
   0906: SLDC 64          Short load constant 100
   0907: STP              Store packed field (TOS into TOS-1)
   0908: SLDC 00          Short load constant 0
   0909: SRO  0001        Store global word BASE1
-> 090b: SLDC 01          Short load constant 1
   090c: SRO  0005        Store global word BASE5
-> 090e: SLDO 05          Short load global BASE5
   090f: LNOT             Logical NOT (~TOS)
   0910: FJP  $091c       Jump if TOS false
   0912: SLDO 03          Short load global BASE3
   0913: INC  0002        Inc field ptr (TOS+2)
   0915: SLDC 01          Short load constant 1
   0916: STO              Store indirect (TOS into TOS-1)
   0917: SLDO 03          Short load global BASE3
   0918: INC  0001        Inc field ptr (TOS+1)
   091a: SLDC 01          Short load constant 1
   091b: STO              Store indirect (TOS into TOS-1)
-> 091c: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC50 (* P=50 LL=0 *)
  BASE2
BEGIN
-> 092e: LDA  01 0036     Load addr G54
   0931: CSP  21          Call standard procedure RELEASE
-> 0933: LDA  01 007e     Load addr G126
   0936: LOD  01 0001     Load word at G1 (SYSCOM)
   0939: SIND 02          Short index load *TOS+2
   093a: IXA  0006        Index array (TOS-1 + TOS * 6)
   093c: LDA  01 003f     Load addr G63
   093f: NEQSTR           String TOS-1 <> TOS
   0941: FJP  $09a1       Jump if TOS false
   0943: LDA  01 0046     Load addr G70
   0946: NOP              No operation
   0947: LSA  08          Load string address: 'Put in :'
   0951: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0953: LDA  01 003f     Load addr G63
   0956: LDA  01 0046     Load addr G70
   0959: SLDC 50          Short load constant 80
   095a: SLDC 08          Short load constant 8
   095b: CXP  00 18       Call external procedure PASCALSY.SINSERT
   095e: CBP  27          Call base procedure PASCALSY.39
   0960: LOD  01 0003     Load word at G3 (OUTPUT)
   0963: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0966: CBP  26          Call base procedure PASCALSY.38
   0968: LOD  01 0003     Load word at G3 (OUTPUT)
   096b: LSA  11          Load string address: 'then press RETURN'
   097e: NOP              No operation
   097f: SLDC 00          Short load constant 0
   0980: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0983: LOD  01 0004     Load word at G4 (SYSTERM)
   0986: LAO  0002        Load global BASE2
   0988: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   098b: LOD  01 0004     Load word at G4 (SYSTERM)
   098e: SLDC 00          Short load constant 0
   098f: SLDC 00          Short load constant 0
   0990: CXP  00 0b       Call external procedure PASCALSY.FEOLN
   0993: FJP  $0983       Jump if TOS false
   0995: LOD  01 0001     Load word at G1 (SYSCOM)
   0998: SIND 02          Short index load *TOS+2
   0999: SLDC 00          Short load constant 0
   099a: SLDC 00          Short load constant 0
   099b: CBP  2a          Call base procedure PASCALSY.42
   099d: FJP  $099f       Jump if TOS false
-> 099f: UJP  $0933       Unconditional jump
-> 09a1: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC51 (* P=51 LL=1 *)
  MP1
BEGIN
-> 09b2: LOD  02 0001     Load word at G1 (SYSCOM)
   09b5: STL  0001        Store TOS into MP1
   09b7: LOD  02 0003     Load word at G3 (OUTPUT)
   09ba: NOP              No operation
   09bb: LSA  03          Load string address: 'S# '
   09c0: SLDC 00          Short load constant 0
   09c1: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09c4: LOD  02 0003     Load word at G3 (OUTPUT)
   09c7: SLDL 01          Short load local MP1
   09c8: IND  0009        Static index and load word (TOS+9)
   09ca: SLDC 00          Short load constant 0
   09cb: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   09ce: LOD  02 0003     Load word at G3 (OUTPUT)
   09d1: LSA  05          Load string address: ', P# '
   09d8: NOP              No operation
   09d9: SLDC 00          Short load constant 0
   09da: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09dd: LOD  02 0003     Load word at G3 (OUTPUT)
   09e0: SLDL 01          Short load local MP1
   09e1: IND  0008        Static index and load word (TOS+8)
   09e3: SLDC 00          Short load constant 0
   09e4: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   09e7: LOD  02 0003     Load word at G3 (OUTPUT)
   09ea: NOP              No operation
   09eb: LSA  05          Load string address: ', I# '
   09f2: SLDC 00          Short load constant 0
   09f3: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09f6: LOD  02 0003     Load word at G3 (OUTPUT)
   09f9: SLDL 01          Short load local MP1
   09fa: IND  000b        Static index and load word (TOS+11)
   09fc: SLDC 00          Short load constant 0
   09fd: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0a00: LOD  02 0003     Load word at G3 (OUTPUT)
   0a03: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0a06: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC52 (* P=52 LL=1 *)
  MP1
BEGIN
-> 0a12: LOD  02 0001     Load word at G1 (SYSCOM)
   0a15: STL  0001        Store TOS into MP1
   0a17: LOD  02 0003     Load word at G3 (OUTPUT)
   0a1a: NOP              No operation
   0a1b: LSA  12          Load string address: 'Execution error # '
   0a2f: SLDC 00          Short load constant 0
   0a30: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a33: LOD  02 0003     Load word at G3 (OUTPUT)
   0a36: SLDL 01          Short load local MP1
   0a37: SIND 01          Short index load *TOS+1
   0a38: SLDC 00          Short load constant 0
   0a39: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0a3c: LOD  02 0003     Load word at G3 (OUTPUT)
   0a3f: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a42: SLDL 01          Short load local MP1
   0a43: SIND 01          Short index load *TOS+1
   0a44: SLDC 0a          Short load constant 10
   0a45: EQUI             Integer TOS-1 = TOS
   0a46: FJP  $0a6e       Jump if TOS false
   0a48: LOD  02 0003     Load word at G3 (OUTPUT)
   0a4b: LSA  0c          Load string address: 'I/O error # '
   0a59: NOP              No operation
   0a5a: SLDC 00          Short load constant 0
   0a5b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a5e: LOD  02 0003     Load word at G3 (OUTPUT)
   0a61: LOD  02 000a     Load word at G10
   0a64: SLDC 00          Short load constant 0
   0a65: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0a68: LOD  02 0003     Load word at G3 (OUTPUT)
   0a6b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0a6e: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC53(PARAM1; PARAM2) (* P=53 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0a7a: LOD  01 0001     Load word at G1 (SYSCOM)
   0a7d: SRO  0003        Store global word BASE3
   0a7f: SLDO 01          Short load global BASE1
   0a80: SLDC 00          Short load constant 0
   0a81: NEQI             Integer TOS-1 <> TOS
   0a82: FJP  $0ab2       Jump if TOS false
   0a84: SLDO 03          Short load global BASE3
   0a85: INC  0024        Inc field ptr (TOS+36)
   0a87: SLDO 02          Short load global BASE2
   0a88: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0a8b: LDP              Load packed field (TOS)
   0a8c: FJP  $0a9b       Jump if TOS false
   0a8e: LOD  01 0003     Load word at G3 (OUTPUT)
   0a91: SLDO 03          Short load global BASE3
   0a92: INC  001f        Inc field ptr (TOS+31)
   0a94: SLDC 08          Short load constant 8
   0a95: SLDC 00          Short load constant 0
   0a96: LDP              Load packed field (TOS)
   0a97: SLDC 00          Short load constant 0
   0a98: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 0a9b: LOD  01 0003     Load word at G3 (OUTPUT)
   0a9e: SLDO 01          Short load global BASE1
   0a9f: SLDC 00          Short load constant 0
   0aa0: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0aa3: SLDC 0b          Short load constant 11
   0aa4: SLDC 00          Short load constant 0
   0aa5: GRTI             Integer TOS-1 > TOS
   0aa6: FJP  $0ab2       Jump if TOS false
   0aa8: LOD  01 0003     Load word at G3 (OUTPUT)
   0aab: LDA  01 0074     Load addr G116
   0aae: SLDC 00          Short load constant 0
   0aaf: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0ab2: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC54(PARAM1; PARAM2; PARAM3): RETVAL (* P=54 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM3
  BASE4=PARAM2
  BASE5=PARAM1
  BASE6
  BASE7
BEGIN
-> 0abe: SLDC 00          Short load constant 0
   0abf: SRO  0001        Store global word BASE1
   0ac1: LOD  01 0001     Load word at G1 (SYSCOM)
   0ac4: SRO  0006        Store global word BASE6
   0ac6: SLDO 06          Short load global BASE6
   0ac7: INC  001f        Inc field ptr (TOS+31)
   0ac9: SRO  0007        Store global word BASE7
   0acb: SLDO 05          Short load global BASE5
   0acc: SLDO 06          Short load global BASE6
   0acd: INC  002c        Inc field ptr (TOS+44)
   0acf: SLDC 08          Short load constant 8
   0ad0: SLDC 00          Short load constant 0
   0ad1: LDP              Load packed field (TOS)
   0ad2: EQUI             Integer TOS-1 = TOS
   0ad3: FJP  $0b04       Jump if TOS false
   0ad5: SLDC 01          Short load constant 1
   0ad6: SRO  0001        Store global word BASE1
-> 0ad8: SLDO 04          Short load global BASE4
   0ad9: SIND 00          Short index load *TOS+0
   0ada: SLDC 01          Short load constant 1
   0adb: GRTI             Integer TOS-1 > TOS
   0adc: FJP  $0af9       Jump if TOS false
   0ade: SLDO 04          Short load global BASE4
   0adf: SLDO 04          Short load global BASE4
   0ae0: SIND 00          Short index load *TOS+0
   0ae1: SLDC 01          Short load constant 1
   0ae2: SBI              Subtract integers (TOS-1 - TOS)
   0ae3: STO              Store indirect (TOS into TOS-1)
   0ae4: SLDO 03          Short load global BASE3
   0ae5: SLDO 04          Short load global BASE4
   0ae6: SIND 00          Short index load *TOS+0
   0ae7: LDB              Load byte at byte ptr TOS-1 + TOS
   0ae8: SLDC 20          Short load constant 32
   0ae9: GEQI             Integer TOS-1 >= TOS
   0aea: FJP  $0af7       Jump if TOS false
   0aec: LOD  01 0003     Load word at G3 (OUTPUT)
   0aef: LDA  01 01b4     Load addr G436
   0af3: SLDC 00          Short load constant 0
   0af4: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0af7: UJP  $0ad8       Unconditional jump
-> 0af9: SLDC 02          Short load constant 2
   0afa: SLDO 07          Short load global BASE7
   0afb: INC  0001        Inc field ptr (TOS+1)
   0afd: SLDC 08          Short load constant 8
   0afe: SLDC 08          Short load constant 8
   0aff: LDP              Load packed field (TOS)
   0b00: CBP  35          Call base procedure PASCALSY.53
   0b02: UJP  $0b30       Unconditional jump
-> 0b04: SLDO 05          Short load global BASE5
   0b05: SLDO 06          Short load global BASE6
   0b06: INC  002b        Inc field ptr (TOS+43)
   0b08: SLDC 08          Short load constant 8
   0b09: SLDC 00          Short load constant 0
   0b0a: LDP              Load packed field (TOS)
   0b0b: EQUI             Integer TOS-1 = TOS
   0b0c: FJP  $0b30       Jump if TOS false
   0b0e: SLDC 01          Short load constant 1
   0b0f: SRO  0001        Store global word BASE1
   0b11: SLDO 04          Short load global BASE4
   0b12: SIND 00          Short index load *TOS+0
   0b13: SLDC 01          Short load constant 1
   0b14: GRTI             Integer TOS-1 > TOS
   0b15: FJP  $0b30       Jump if TOS false
   0b17: SLDO 04          Short load global BASE4
   0b18: SLDO 04          Short load global BASE4
   0b19: SIND 00          Short index load *TOS+0
   0b1a: SLDC 01          Short load constant 1
   0b1b: SBI              Subtract integers (TOS-1 - TOS)
   0b1c: STO              Store indirect (TOS into TOS-1)
   0b1d: SLDO 03          Short load global BASE3
   0b1e: SLDO 04          Short load global BASE4
   0b1f: SIND 00          Short index load *TOS+0
   0b20: LDB              Load byte at byte ptr TOS-1 + TOS
   0b21: SLDC 20          Short load constant 32
   0b22: GEQI             Integer TOS-1 >= TOS
   0b23: FJP  $0b30       Jump if TOS false
   0b25: LOD  01 0003     Load word at G3 (OUTPUT)
   0b28: LDA  01 01b8     Load addr G440
   0b2c: SLDC 00          Short load constant 0
   0b2d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0b30: RBP  01          Return from base procedure
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
-> 0b3e: SLDL 03          Short load local MP3
   0b3f: SLDC 3f          Short load constant 63
   0b40: GRTI             Integer TOS-1 > TOS
   0b41: FJP  $0b48       Jump if TOS false
   0b43: SLDC 3f          Short load constant 63
   0b44: STL  0008        Store TOS into MP8
   0b46: UJP  $0b4b       Unconditional jump
-> 0b48: SLDL 03          Short load local MP3
   0b49: STL  0008        Store TOS into MP8
-> 0b4b: SLDL 08          Short load local MP8
   0b4c: LDCI 0200        Load word 512
   0b4f: MPI              Multiply integers (TOS * TOS-1)
   0b50: STL  0007        Store TOS into MP7
-> 0b52: SLDL 03          Short load local MP3
   0b53: SLDC 00          Short load constant 0
   0b54: NEQI             Integer TOS-1 <> TOS
   0b55: FJP  $0b96       Jump if TOS false
   0b57: SLDL 01          Short load local MP1
   0b58: FJP  $0b64       Jump if TOS false
   0b5a: SLDL 06          Short load local MP6
   0b5b: SLDL 05          Short load local MP5
   0b5c: SLDL 04          Short load local MP4
   0b5d: SLDL 07          Short load local MP7
   0b5e: SLDL 02          Short load local MP2
   0b5f: SLDC 00          Short load constant 0
   0b60: CSP  05          Call standard procedure UNITREAD
   0b62: UJP  $0b6c       Unconditional jump
-> 0b64: SLDL 06          Short load local MP6
   0b65: SLDL 05          Short load local MP5
   0b66: SLDL 04          Short load local MP4
   0b67: SLDL 07          Short load local MP7
   0b68: SLDL 02          Short load local MP2
   0b69: SLDC 00          Short load constant 0
   0b6a: CSP  06          Call standard procedure UNITWRITE
-> 0b6c: CSP  22          Call standard procedure IORESULT
   0b6e: SLDC 00          Short load constant 0
   0b6f: NEQI             Integer TOS-1 <> TOS
   0b70: FJP  $0b76       Jump if TOS false
   0b72: SLDC 00          Short load constant 0
   0b73: SLDC 37          Short load constant 55
   0b74: CSP  04          Call standard procedure EXIT
-> 0b76: SLDL 03          Short load local MP3
   0b77: SLDL 08          Short load local MP8
   0b78: SBI              Subtract integers (TOS-1 - TOS)
   0b79: STL  0003        Store TOS into MP3
   0b7b: SLDL 04          Short load local MP4
   0b7c: SLDL 07          Short load local MP7
   0b7d: ADI              Add integers (TOS + TOS-1)
   0b7e: STL  0004        Store TOS into MP4
   0b80: SLDL 02          Short load local MP2
   0b81: SLDL 08          Short load local MP8
   0b82: ADI              Add integers (TOS + TOS-1)
   0b83: STL  0002        Store TOS into MP2
   0b85: SLDL 03          Short load local MP3
   0b86: SLDL 08          Short load local MP8
   0b87: LESI             Integer TOS-1 < TOS
   0b88: FJP  $0b94       Jump if TOS false
   0b8a: SLDL 03          Short load local MP3
   0b8b: STL  0008        Store TOS into MP8
   0b8d: SLDL 08          Short load local MP8
   0b8e: LDCI 0200        Load word 512
   0b91: MPI              Multiply integers (TOS * TOS-1)
   0b92: STL  0007        Store TOS into MP7
-> 0b94: UJP  $0b52       Unconditional jump
-> 0b96: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC56 (* P=56 LL=1 *)
  BASE11
BEGIN
-> 0ba4: LOD  02 017d     Load word at G381
   0ba8: LOD  02 017f     Load word at G383
   0bac: LDB              Load byte at byte ptr TOS-1 + TOS
   0bad: SRO  000b        Store global word BASE11
   0baf: LOD  02 017f     Load word at G383
   0bb3: SLDC 01          Short load constant 1
   0bb4: ADI              Add integers (TOS + TOS-1)
   0bb5: STR  02 017f     Store TOS to G383
   0bb9: LOD  02 017f     Load word at G383
   0bbd: LOD  02 0180     Load word at G384
   0bc1: GRTI             Integer TOS-1 > TOS
   0bc2: FJP  $0bc6       Jump if TOS false
   0bc4: CBP  2e          Call base procedure PASCALSY.46
-> 0bc6: SLDO 0b          Short load global BASE11
   0bc7: LOD  02 018b     Load word at G395
   0bcb: EQUI             Integer TOS-1 = TOS
   0bcc: LOD  02 017d     Load word at G381
   0bd0: LOD  02 017f     Load word at G383
   0bd4: LDB              Load byte at byte ptr TOS-1 + TOS
   0bd5: LOD  02 018b     Load word at G395
   0bd9: EQUI             Integer TOS-1 = TOS
   0bda: LAND             Logical AND (TOS & TOS-1)
   0bdb: FJP  $0be0       Jump if TOS false
   0bdd: SLDC 01          Short load constant 1
   0bde: CBP  2d          Call base procedure PASCALSY.45
-> 0be0: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC57 (* P=57 LL=1 *)
  MP1
BEGIN
-> 0bec: UJP  $0cca       Unconditional jump
-> 0bee: LOD  02 0184     Load word at G388
   0bf2: LNOT             Logical NOT (~TOS)
   0bf3: FJP  $0c4c       Jump if TOS false
   0bf5: CBP  32          Call base procedure PASCALSY.50
   0bf7: LOD  02 0045     Load word at G69
   0bfa: SLDC 00          Short load constant 0
   0bfb: SLDC 00          Short load constant 0
   0bfc: CXP  05 01       Call external procedure GETCMD.1
   0bff: STR  02 0045     Store TOS to G69
   0c02: LDA  02 0148     Load addr G328
   0c06: NOP              No operation
   0c07: LSA  00          Load string address: ''
   0c09: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0c0b: LOD  02 0045     Load word at G69
   0c0e: UJP  $0c33       Unconditional jump
   0c10: LOD  02 0186     Load word at G390
   0c14: LNOT             Logical NOT (~TOS)
   0c15: LOD  02 0188     Load word at G392
   0c19: LOR              Logical OR (TOS | TOS-1)
   0c1a: FJP  $0c28       Jump if TOS false
   0c1c: SLDC 00          Short load constant 0
   0c1d: STR  02 0188     Store TOS to G392
   0c21: LDCN             Load constant NIL
   0c22: LDCN             Load constant NIL
   0c23: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   0c26: UJP  $0c31       Unconditional jump
-> 0c28: SLDC 01          Short load constant 1
   0c29: STR  02 0184     Store TOS to G388
   0c2d: SLDC 00          Short load constant 0
   0c2e: SLDC 39          Short load constant 57
   0c2f: CSP  04          Call standard procedure EXIT
-> 0c31: UJP  $0c4c       Unconditional jump
-> 0c4c: LOD  02 0045     Load word at G69
   0c4f: LDCI 07fc        Load word 2044
   0c52: SLDC 01          Short load constant 1
   0c53: INN              Set membership (TOS-1 in set TOS)
   0c54: FJP  $0c68       Jump if TOS false
   0c56: SLDC 00          Short load constant 0
   0c57: STR  02 0184     Store TOS to G388
   0c5b: SLDC 03          Short load constant 3
   0c5c: CSP  26          Call standard procedure UNITCLEAR
   0c5e: LOD  02 0001     Load word at G1 (SYSCOM)
   0c61: SIND 02          Short index load *TOS+2
   0c62: SLDC 00          Short load constant 0
   0c63: SLDC 00          Short load constant 0
   0c64: CBP  2a          Call base procedure PASCALSY.42
   0c66: FJP  $0c68       Jump if TOS false
-> 0c68: LOD  02 0045     Load word at G69
   0c6b: LDCI 00e0        Load word 224
   0c6e: SLDC 01          Short load constant 1
   0c6f: INN              Set membership (TOS-1 in set TOS)
   0c70: FJP  $0c96       Jump if TOS false
   0c72: LOD  02 000a     Load word at G10
   0c75: SLDC 00          Short load constant 0
   0c76: EQUI             Integer TOS-1 = TOS
   0c77: FJP  $0c96       Jump if TOS false
   0c79: LOD  02 0008     Load word at G8
   0c7c: SLDC 01          Short load constant 1
   0c7d: CBP  06          Call base procedure PASCALSY.FCLOSE
   0c7f: CSP  22          Call standard procedure IORESULT
   0c81: SLDC 00          Short load constant 0
   0c82: NEQI             Integer TOS-1 <> TOS
   0c83: FJP  $0c96       Jump if TOS false
   0c85: CSP  22          Call standard procedure IORESULT
   0c87: STL  0001        Store TOS into MP1
   0c89: LOD  02 0003     Load word at G3 (OUTPUT)
   0c8c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0c8f: CBP  26          Call base procedure PASCALSY.38
   0c91: SLDC 0a          Short load constant 10
   0c92: SLDL 01          Short load local MP1
   0c93: CXP  03 01       Call external procedure PRINTERR.PRINTERROR
-> 0c96: LOD  02 0045     Load word at G69
   0c99: SLDC 0c          Short load constant 12
   0c9a: SLDC 01          Short load constant 1
   0c9b: INN              Set membership (TOS-1 in set TOS)
   0c9c: FJP  $0cb2       Jump if TOS false
   0c9e: LDA  02 0002     Load addr G2 (INPUT)
   0ca1: SLDC 00          Short load constant 0
   0ca2: IXA  0001        Index array (TOS-1 + TOS * 1)
   0ca4: SIND 00          Short index load *TOS+0
   0ca5: SLDC 00          Short load constant 0
   0ca6: CBP  06          Call base procedure PASCALSY.FCLOSE
   0ca8: LDA  02 0002     Load addr G2 (INPUT)
   0cab: SLDC 01          Short load constant 1
   0cac: IXA  0001        Index array (TOS-1 + TOS * 1)
   0cae: SIND 00          Short index load *TOS+0
   0caf: SLDC 01          Short load constant 1
   0cb0: CBP  06          Call base procedure PASCALSY.FCLOSE
-> 0cb2: SLDC 01          Short load constant 1
   0cb3: CSP  23          Call standard procedure UNITBUSY
   0cb5: SLDC 02          Short load constant 2
   0cb6: CSP  23          Call standard procedure UNITBUSY
   0cb8: LOR              Logical OR (TOS | TOS-1)
   0cb9: FJP  $0cbe       Jump if TOS false
   0cbb: SLDC 01          Short load constant 1
   0cbc: CSP  26          Call standard procedure UNITCLEAR
-> 0cbe: LOD  02 0045     Load word at G69
   0cc1: SLDC 00          Short load constant 0
   0cc2: EQUI             Integer TOS-1 = TOS
   0cc3: FJP  $0bee       Jump if TOS false
-> 0cc5: SLDC 06          Short load constant 6
   0cc6: CSP  16          Call standard procedure UNLOADSEGMENT
   0cc8: UJP  $0ccf       Unconditional jump
-> 0cca: SLDC 06          Short load constant 6
   0ccb: CSP  15          Call standard procedure LOADSEGMENT
   0ccd: UJP  $0bee       Unconditional jump
-> 0ccf: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC58 (* P=58 LL=1 *)
BEGIN
-> 0ce2: UJP  $0d0b       Unconditional jump
-> 0ce4: CBP  32          Call base procedure PASCALSY.50
   0ce6: CGP  39          Call global procedure PASCALSY.57
   0ce8: LOD  02 0185     Load word at G389
   0cec: LNOT             Logical NOT (~TOS)
   0ced: LOD  02 0184     Load word at G388
   0cf1: LAND             Logical AND (TOS & TOS-1)
   0cf2: FJP  $0cfb       Jump if TOS false
   0cf4: LDCN             Load constant NIL
   0cf5: LDCN             Load constant NIL
   0cf6: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   0cf9: UJP  $0cff       Unconditional jump
-> 0cfb: SLDC 00          Short load constant 0
   0cfc: SLDC 3a          Short load constant 58
   0cfd: CSP  04          Call standard procedure EXIT
-> 0cff: LOD  02 0045     Load word at G69
   0d02: SLDC 00          Short load constant 0
   0d03: EQUI             Integer TOS-1 = TOS
   0d04: FJP  $0ce4       Jump if TOS false
-> 0d06: SLDC 02          Short load constant 2
   0d07: CSP  16          Call standard procedure UNLOADSEGMENT
   0d09: UJP  $0d10       Unconditional jump
-> 0d0b: SLDC 02          Short load constant 2
   0d0c: CSP  15          Call standard procedure LOADSEGMENT
   0d0e: UJP  $0ce4       Unconditional jump
-> 0d10: RNP  00          Return from nonbase procedure
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
-> 07b6: UJP  $0c0e       Unconditional jump
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
   098d: FJP  $0a0f       Jump if TOS false
   098f: LOD  01 0003     Load word at G3 (OUTPUT)
   0992: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0995: LOD  01 0003     Load word at G3 (OUTPUT)
   0998: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   099b: LOD  01 0003     Load word at G3 (OUTPUT)
   099e: NOP              No operation
   099f: LSA  28          Load string address: 'The 64K version of SYSTEM.PASCAL cannot '
   09c9: SLDC 00          Short load constant 0
   09ca: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09cd: LOD  01 0003     Load word at G3 (OUTPUT)
   09d0: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   09d3: LOD  01 0003     Load word at G3 (OUTPUT)
   09d6: NOP              No operation
   09d7: LSA  29          Load string address: 'run with the 128K version of SYSTEM.APPLE'
   0a02: SLDC 00          Short load constant 0
   0a03: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a06: LOD  01 0003     Load word at G3 (OUTPUT)
   0a09: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0a0c: SLDC 00          Short load constant 0
   0a0d: FJP  $0a0c       Jump if TOS false
-> 0a0f: LOD  01 0003     Load word at G3 (OUTPUT)
   0a12: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a15: LOD  01 0189     Load word at G393
   0a19: FJP  $0be4       Jump if TOS false
   0a1b: LDO  0037        Load global word BASE55
   0a1d: LNOT             Logical NOT (~TOS)
   0a1e: FJP  $0be2       Jump if TOS false
   0a20: LOD  01 0001     Load word at G1 (SYSCOM)
   0a23: SRO  003a        Store global word BASE58
   0a25: LDO  003a        Load global word BASE58
   0a27: INC  001d        Inc field ptr (TOS+29)
   0a29: SLDC 01          Short load constant 1
   0a2a: SLDC 03          Short load constant 3
   0a2b: LDP              Load packed field (TOS)
   0a2c: FJP  $0a47       Jump if TOS false
   0a2e: SLDC 00          Short load constant 0
   0a2f: LDO  003a        Load global word BASE58
   0a31: IND  0025        Static index and load word (TOS+37)
   0a33: SLDC 03          Short load constant 3
   0a34: DVI              Divide integers (TOS-1 / TOS)
   0a35: CXP  00 1d       Call external procedure PASCALSY.FGOTOXY
   0a38: SLDC 0b          Short load constant 11
   0a39: SLDC 00          Short load constant 0
   0a3a: GRTI             Integer TOS-1 > TOS
   0a3b: FJP  $0a47       Jump if TOS false
   0a3d: LOD  01 0003     Load word at G3 (OUTPUT)
   0a40: LDA  01 0074     Load addr G116
   0a43: SLDC 00          Short load constant 0
   0a44: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0a47: LOD  01 0003     Load word at G3 (OUTPUT)
   0a4a: NOP              No operation
   0a4b: LSA  08          Load string address: 'Welcome '
   0a55: SLDC 00          Short load constant 0
   0a56: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a59: LOD  01 0003     Load word at G3 (OUTPUT)
   0a5c: LDA  01 003f     Load addr G63
   0a5f: SLDC 00          Short load constant 0
   0a60: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a63: LOD  01 0003     Load word at G3 (OUTPUT)
   0a66: NOP              No operation
   0a67: LSA  18          Load string address: ', to Apple II Pascal 1.3'
   0a81: SLDC 00          Short load constant 0
   0a82: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a85: LOD  01 0003     Load word at G3 (OUTPUT)
   0a88: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a8b: LOD  01 0003     Load word at G3 (OUTPUT)
   0a8e: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a91: LOD  01 0003     Load word at G3 (OUTPUT)
   0a94: NOP              No operation
   0a95: LSA  19          Load string address: 'Based on UCSD Pascal II.1'
   0ab0: SLDC 00          Short load constant 0
   0ab1: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ab4: LOD  01 0003     Load word at G3 (OUTPUT)
   0ab7: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0aba: LOD  01 0003     Load word at G3 (OUTPUT)
   0abd: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ac0: LOD  01 0003     Load word at G3 (OUTPUT)
   0ac3: LSA  10          Load string address: 'Current date is '
   0ad5: NOP              No operation
   0ad6: SLDC 00          Short load constant 0
   0ad7: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ada: LOD  01 0003     Load word at G3 (OUTPUT)
   0add: LDA  01 0043     Load addr G67
   0ae0: SLDC 05          Short load constant 5
   0ae1: SLDC 04          Short load constant 4
   0ae2: LDP              Load packed field (TOS)
   0ae3: SLDC 00          Short load constant 0
   0ae4: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0ae7: LOD  01 0003     Load word at G3 (OUTPUT)
   0aea: SLDC 2d          Short load constant 45
   0aeb: SLDC 00          Short load constant 0
   0aec: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0aef: LOD  01 0003     Load word at G3 (OUTPUT)
   0af2: LAO  0017        Load global BASE23
   0af4: LDA  01 0043     Load addr G67
   0af7: SLDC 04          Short load constant 4
   0af8: SLDC 00          Short load constant 0
   0af9: LDP              Load packed field (TOS)
   0afa: IXA  0002        Index array (TOS-1 + TOS * 2)
   0afc: SLDC 00          Short load constant 0
   0afd: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b00: LOD  01 0003     Load word at G3 (OUTPUT)
   0b03: SLDC 2d          Short load constant 45
   0b04: SLDC 00          Short load constant 0
   0b05: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0b08: LOD  01 0003     Load word at G3 (OUTPUT)
   0b0b: LDA  01 0043     Load addr G67
   0b0e: SLDC 07          Short load constant 7
   0b0f: SLDC 09          Short load constant 9
   0b10: LDP              Load packed field (TOS)
   0b11: SLDC 00          Short load constant 0
   0b12: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0b15: SLDC 01          Short load constant 1
   0b16: SRO  0016        Store global word BASE22
   0b18: SLDC 03          Short load constant 3
   0b19: SRO  003b        Store global word BASE59
-> 0b1b: LDO  0016        Load global word BASE22
   0b1d: LDO  003b        Load global word BASE59
   0b1f: LEQI             Integer TOS-1 <= TOS
   0b20: FJP  $0b30       Jump if TOS false
   0b22: LOD  01 0003     Load word at G3 (OUTPUT)
   0b25: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b28: LDO  0016        Load global word BASE22
   0b2a: SLDC 01          Short load constant 1
   0b2b: ADI              Add integers (TOS + TOS-1)
   0b2c: SRO  0016        Store global word BASE22
   0b2e: UJP  $0b1b       Unconditional jump
-> 0b30: LOD  01 0003     Load word at G3 (OUTPUT)
   0b33: LSA  19          Load string address: 'Pascal system size is 64K'
   0b4e: NOP              No operation
   0b4f: SLDC 00          Short load constant 0
   0b50: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b53: LOD  01 0003     Load word at G3 (OUTPUT)
   0b56: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b59: SLDC 01          Short load constant 1
   0b5a: SRO  0016        Store global word BASE22
   0b5c: SLDC 03          Short load constant 3
   0b5d: SRO  003b        Store global word BASE59
-> 0b5f: LDO  0016        Load global word BASE22
   0b61: LDO  003b        Load global word BASE59
   0b63: LEQI             Integer TOS-1 <= TOS
   0b64: FJP  $0b74       Jump if TOS false
   0b66: LOD  01 0003     Load word at G3 (OUTPUT)
   0b69: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b6c: LDO  0016        Load global word BASE22
   0b6e: SLDC 01          Short load constant 1
   0b6f: ADI              Add integers (TOS + TOS-1)
   0b70: SRO  0016        Store global word BASE22
   0b72: UJP  $0b5f       Unconditional jump
-> 0b74: LOD  01 0003     Load word at G3 (OUTPUT)
   0b77: LSA  31          Load string address: 'Copyright Apple Computer 1979,1980,1983,1984,1985'
   0baa: NOP              No operation
   0bab: SLDC 00          Short load constant 0
   0bac: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0baf: LOD  01 0003     Load word at G3 (OUTPUT)
   0bb2: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0bb5: LOD  01 0003     Load word at G3 (OUTPUT)
   0bb8: NOP              No operation
   0bb9: LSA  1b          Load string address: 'Copyright U.C. Regents 1979'
   0bd6: SLDC 00          Short load constant 0
   0bd7: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0bda: LOD  01 0003     Load word at G3 (OUTPUT)
   0bdd: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0be0: UJP  $0be2       Unconditional jump
-> 0be2: UJP  $0c09       Unconditional jump
-> 0be4: LOD  01 0003     Load word at G3 (OUTPUT)
   0be7: LSA  15          Load string address: 'System re-initialized'
   0bfe: NOP              No operation
   0bff: SLDC 00          Short load constant 0
   0c00: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c03: LOD  01 0003     Load word at G3 (OUTPUT)
   0c06: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0c09: SLDC 06          Short load constant 6
   0c0a: CSP  16          Call standard procedure UNLOADSEGMENT
   0c0c: UJP  $0c13       Unconditional jump
-> 0c0e: SLDC 06          Short load constant 6
   0c0f: CSP  15          Call standard procedure LOADSEGMENT
   0c11: UJP  $07b8       Unconditional jump
-> 0c13: RBP  00          Return from base procedure
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
-> 115c: LOD  01 003a     Load word at G58
   115f: INC  0002        Inc field ptr (TOS+2)
   1161: SLDC 00          Short load constant 0
   1162: STO              Store indirect (TOS into TOS-1)
   1163: LOD  01 0039     Load word at G57
   1166: INC  0002        Inc field ptr (TOS+2)
   1168: SLDC 00          Short load constant 0
   1169: STO              Store indirect (TOS into TOS-1)
   116a: LOD  01 0038     Load word at G56
   116d: INC  0002        Inc field ptr (TOS+2)
   116f: SLDC 00          Short load constant 0
   1170: STO              Store indirect (TOS into TOS-1)
   1171: LDA  01 0002     Load addr G2 (INPUT)
   1174: SLDC 00          Short load constant 0
   1175: IXA  0001        Index array (TOS-1 + TOS * 1)
   1177: LOD  01 003a     Load word at G58
   117a: STO              Store indirect (TOS into TOS-1)
   117b: LDA  01 0002     Load addr G2 (INPUT)
   117e: SLDC 01          Short load constant 1
   117f: IXA  0001        Index array (TOS-1 + TOS * 1)
   1181: LOD  01 0039     Load word at G57
   1184: STO              Store indirect (TOS into TOS-1)
   1185: SLDO 03          Short load global BASE3
   1186: SLDC 00          Short load constant 0
   1187: EQUI             Integer TOS-1 = TOS
   1188: FJP  $11b9       Jump if TOS false
   118a: LOD  01 0189     Load word at G393
   118e: FJP  $11b9       Jump if TOS false
   1190: SLDC 00          Short load constant 0
   1191: STR  01 0189     Store TOS to G393
   1195: LSA  0e          Load string address: '*SYSTEM.ATTACH'
   11a5: NOP              No operation
   11a6: SLDC 00          Short load constant 0
   11a7: SLDC 00          Short load constant 0
   11a8: SLDC 00          Short load constant 0
   11a9: LAO  0006        Load global BASE6
   11ab: SLDC 01          Short load constant 1
   11ac: SLDC 00          Short load constant 0
   11ad: SLDC 00          Short load constant 0
   11ae: CLP  0d          Call local procedure GETCMD.13
   11b0: FJP  $11b9       Jump if TOS false
   11b2: SLDC 0a          Short load constant 10
   11b3: SRO  0001        Store global word BASE1
   11b5: SLDC 05          Short load constant 5
   11b6: SLDC 01          Short load constant 1
   11b7: CSP  04          Call standard procedure EXIT
-> 11b9: SLDO 03          Short load global BASE3
   11ba: SLDC 0a          Short load constant 10
   11bb: EQUI             Integer TOS-1 = TOS
   11bc: FJP  $11c1       Jump if TOS false
   11be: SLDC 00          Short load constant 0
   11bf: SRO  0003        Store global word BASE3
-> 11c1: SLDO 03          Short load global BASE3
   11c2: SLDC 00          Short load constant 0
   11c3: EQUI             Integer TOS-1 = TOS
   11c4: FJP  $11ee       Jump if TOS false
   11c6: NOP              No operation
   11c7: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   11d8: SLDC 00          Short load constant 0
   11d9: SLDC 00          Short load constant 0
   11da: SLDC 00          Short load constant 0
   11db: LAO  0006        Load global BASE6
   11dd: SLDC 00          Short load constant 0
   11de: SLDC 00          Short load constant 0
   11df: SLDC 00          Short load constant 0
   11e0: CLP  0d          Call local procedure GETCMD.13
   11e2: FJP  $11ee       Jump if TOS false
   11e4: CXP  00 25       Call external procedure PASCALSY.37
   11e7: SLDC 04          Short load constant 4
   11e8: SRO  0001        Store global word BASE1
   11ea: SLDC 05          Short load constant 5
   11eb: SLDC 01          Short load constant 1
   11ec: CSP  04          Call standard procedure EXIT
-> 11ee: SLDO 03          Short load global BASE3
   11ef: LDCI 00e0        Load word 224
   11f2: SLDC 01          Short load constant 1
   11f3: INN              Set membership (TOS-1 in set TOS)
   11f4: FJP  $11f8       Jump if TOS false
   11f6: CLP  10          Call local procedure GETCMD.16
-> 11f8: SLDO 03          Short load global BASE3
   11f9: LDCI 0300        Load word 768
   11fc: SLDC 01          Short load constant 1
   11fd: INN              Set membership (TOS-1 in set TOS)
   11fe: FJP  $1203       Jump if TOS false
   1200: SLDC 00          Short load constant 0
   1201: CLP  02          Call local procedure GETCMD.2
-> 1203: LOD  01 0001     Load word at G1 (SYSCOM)
   1206: INC  001d        Inc field ptr (TOS+29)
   1208: SLDC 02          Short load constant 2
   1209: SLDC 07          Short load constant 7
   120a: LDP              Load packed field (TOS)
   120b: SLDC 01          Short load constant 1
   120c: EQUI             Integer TOS-1 = TOS
   120d: FJP  $1227       Jump if TOS false
   120f: SLDO 03          Short load global BASE3
   1210: SLDC 00          Short load constant 0
   1211: EQUI             Integer TOS-1 = TOS
   1212: FJP  $121c       Jump if TOS false
   1214: SLDC 06          Short load constant 6
   1215: SRO  0003        Store global word BASE3
   1217: SLDC 01          Short load constant 1
   1218: CLP  02          Call local procedure GETCMD.2
   121a: UJP  $1227       Unconditional jump
-> 121c: LDCN             Load constant NIL
   121d: STR  01 0036     Store TOS to G54
   1220: SLDC 00          Short load constant 0
   1221: SRO  0001        Store global word BASE1
   1223: SLDC 05          Short load constant 5
   1224: SLDC 01          Short load constant 1
   1225: CSP  04          Call standard procedure EXIT
-> 1227: SLDC 00          Short load constant 0
   1228: STR  01 000a     Store TOS to G10
   122b: SLDC 00          Short load constant 0
   122c: STR  01 000b     Store TOS to G11
   122f: SLDC 00          Short load constant 0
   1230: STR  01 000c     Store TOS to G12
   1233: SLDC 00          Short load constant 0
   1234: SRO  0005        Store global word BASE5
   1236: LDA  01 0148     Load addr G328
   123a: SLDC 00          Short load constant 0
   123b: LDB              Load byte at byte ptr TOS-1 + TOS
   123c: SLDC 00          Short load constant 0
   123d: NEQI             Integer TOS-1 <> TOS
   123e: FJP  $1243       Jump if TOS false
   1240: SLDC 01          Short load constant 1
   1241: CLP  13          Call local procedure GETCMD.19
-> 1243: LDA  01 0046     Load addr G70
   1246: NOP              No operation
   1247: LSA  44          Load string address: 'Command: F(ile, E(dit, R(un, C(omp, L(ink, X(ecute, A(ssem, ?  [1.3]'
   128d: SAS  50          String assign (TOS to TOS-1, 80 chars)
   128f: CXP  00 27       Call external procedure PASCALSY.39
   1292: SLDO 05          Short load global BASE5
   1293: SLDC 00          Short load constant 0
   1294: SLDC 00          Short load constant 0
   1295: CXP  00 29       Call external procedure PASCALSY.41
   1298: SRO  0004        Store global word BASE4
   129a: CXP  00 25       Call external procedure PASCALSY.37
   129d: SLDO 04          Short load global BASE4
   129e: SLDC 3f          Short load constant 63
   129f: EQUI             Integer TOS-1 = TOS
   12a0: FJP  $12fc       Jump if TOS false
   12a2: LDA  01 0046     Load addr G70
   12a5: LSA  44          Load string address: 'Command: U(ser restart, I(nitialize, S(wap, M(ake exec, Q(uit  [1.3]'
   12eb: NOP              No operation
   12ec: SAS  50          String assign (TOS to TOS-1, 80 chars)
   12ee: CXP  00 27       Call external procedure PASCALSY.39
   12f1: SLDO 05          Short load global BASE5
   12f2: SLDC 00          Short load constant 0
   12f3: SLDC 00          Short load constant 0
   12f4: CXP  00 29       Call external procedure PASCALSY.41
   12f7: SRO  0004        Store global word BASE4
   12f9: CXP  00 25       Call external procedure PASCALSY.37
-> 12fc: LOD  01 0187     Load word at G391
   1300: FJP  $130c       Jump if TOS false
   1302: LDA  01 0036     Load addr G54
   1305: CSP  21          Call standard procedure RELEASE
   1307: SLDC 00          Short load constant 0
   1308: STR  01 0187     Store TOS to G391
-> 130c: SLDO 04          Short load global BASE4
   1310: LDC  06          Load multiple-word constant
                         012e326a8000000000000000
   131c: SLDC 06          Short load constant 6
   131d: INN              Set membership (TOS-1 in set TOS)
   131e: LNOT             Logical NOT (~TOS)
   131f: SRO  0005        Store global word BASE5
   1321: SLDO 05          Short load global BASE5
   1322: LNOT             Logical NOT (~TOS)
   1323: FJP  $14b2       Jump if TOS false
   1325: SLDO 04          Short load global BASE4
   1326: UJP  $147b       Unconditional jump
   1328: LOD  01 0003     Load word at G3 (OUTPUT)
   132b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   132e: SLDC 02          Short load constant 2
   132f: SLDC 01          Short load constant 1
   1330: SLDC 00          Short load constant 0
   1331: SLDC 00          Short load constant 0
   1332: CLP  03          Call local procedure GETCMD.3
   1334: FJP  $133d       Jump if TOS false
   1336: SLDC 04          Short load constant 4
   1337: SRO  0001        Store global word BASE1
   1339: SLDC 05          Short load constant 5
   133a: SLDC 01          Short load constant 1
   133b: CSP  04          Call standard procedure EXIT
-> 133d: UJP  $14b2       Unconditional jump
   133f: LOD  01 0003     Load word at G3 (OUTPUT)
   1342: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1345: SLDC 03          Short load constant 3
   1346: SLDC 01          Short load constant 1
   1347: SLDC 00          Short load constant 0
   1348: SLDC 00          Short load constant 0
   1349: CLP  03          Call local procedure GETCMD.3
   134b: FJP  $1359       Jump if TOS false
   134d: SLDC 04          Short load constant 4
   134e: SRO  0001        Store global word BASE1
   1350: SLDC 01          Short load constant 1
   1351: STR  01 0188     Store TOS to G392
   1355: SLDC 05          Short load constant 5
   1356: SLDC 01          Short load constant 1
   1357: CSP  04          Call standard procedure EXIT
-> 1359: UJP  $14b2       Unconditional jump
   135b: LOD  01 0003     Load word at G3 (OUTPUT)
   135e: NOP              No operation
   135f: LSA  0a          Load string address: 'Linking...'
   136b: SLDC 00          Short load constant 0
   136c: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   136f: LOD  01 0003     Load word at G3 (OUTPUT)
   1372: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1375: SLDC 04          Short load constant 4
   1376: SLDC 01          Short load constant 1
   1377: SLDC 00          Short load constant 0
   1378: SLDC 00          Short load constant 0
   1379: CLP  03          Call local procedure GETCMD.3
   137b: FJP  $1384       Jump if TOS false
   137d: SLDC 04          Short load constant 4
   137e: SRO  0001        Store global word BASE1
   1380: SLDC 05          Short load constant 5
   1381: SLDC 01          Short load constant 1
   1382: CSP  04          Call standard procedure EXIT
-> 1384: UJP  $14b2       Unconditional jump
   1386: SLDC 00          Short load constant 0
   1387: CLP  13          Call local procedure GETCMD.19
   1389: UJP  $14b2       Unconditional jump
   138b: SLDC 05          Short load constant 5
   138c: CLP  0e          Call local procedure GETCMD.14
   138e: UJP  $14b2       Unconditional jump
   1390: SLDC 08          Short load constant 8
   1391: CLP  0e          Call local procedure GETCMD.14
   1393: UJP  $14b2       Unconditional jump
   1395: SLDO 03          Short load global BASE3
   1396: SLDC 02          Short load constant 2
   1397: NEQI             Integer TOS-1 <> TOS
   1398: FJP  $13c0       Jump if TOS false
   139a: LOD  01 0003     Load word at G3 (OUTPUT)
   139d: LSA  0d          Load string address: 'Restarting...'
   13ac: NOP              No operation
   13ad: SLDC 00          Short load constant 0
   13ae: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   13b1: LOD  01 0003     Load word at G3 (OUTPUT)
   13b4: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   13b7: SLDC 04          Short load constant 4
   13b8: SRO  0001        Store global word BASE1
   13ba: SLDC 05          Short load constant 5
   13bb: SLDC 01          Short load constant 1
   13bc: CSP  04          Call standard procedure EXIT
   13be: UJP  $13dd       Unconditional jump
-> 13c0: LOD  01 0003     Load word at G3 (OUTPUT)
   13c3: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   13c6: LOD  01 0003     Load word at G3 (OUTPUT)
   13c9: LSA  0d          Load string address: 'U not allowed'
   13d8: NOP              No operation
   13d9: SLDC 00          Short load constant 0
   13da: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 13dd: UJP  $14b2       Unconditional jump
   13df: SLDC 01          Short load constant 1
   13e0: CLP  02          Call local procedure GETCMD.2
   13e2: UJP  $14b2       Unconditional jump
   13e4: SLDO 04          Short load global BASE4
   13e5: SLDC 51          Short load constant 81
   13e6: EQUI             Integer TOS-1 = TOS
   13e7: FJP  $1439       Jump if TOS false
   13e9: LOD  01 0003     Load word at G3 (OUTPUT)
   13ec: NOP              No operation
   13ed: LSA  2d          Load string address: 'Do you wish to exit the Pascal system? (Y/N) '
   141c: SLDC 00          Short load constant 0
   141d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1420: LOD  01 0002     Load word at G2 (INPUT)
   1423: LAO  0004        Load global BASE4
   1425: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   1428: SLDO 04          Short load global BASE4
   1429: SLDC 59          Short load constant 89
   142a: EQUI             Integer TOS-1 = TOS
   142b: SLDO 04          Short load global BASE4
   142c: SLDC 79          Short load constant 121
   142d: EQUI             Integer TOS-1 = TOS
   142e: LOR              Logical OR (TOS | TOS-1)
   142f: FJP  $1436       Jump if TOS false
   1431: SLDC 51          Short load constant 81
   1432: SRO  0004        Store global word BASE4
   1434: UJP  $1439       Unconditional jump
-> 1436: SLDC 5a          Short load constant 90
   1437: SRO  0004        Store global word BASE4
-> 1439: SLDO 04          Short load global BASE4
   143a: SLDC 51          Short load constant 81
   143b: EQUI             Integer TOS-1 = TOS
   143c: SLDO 04          Short load global BASE4
   143d: SLDC 49          Short load constant 73
   143e: EQUI             Integer TOS-1 = TOS
   143f: LOR              Logical OR (TOS | TOS-1)
   1440: FJP  $1461       Jump if TOS false
   1442: LOD  01 0183     Load word at G387
   1446: LOD  01 0182     Load word at G386
   144a: LOR              Logical OR (TOS | TOS-1)
   144b: FJP  $1451       Jump if TOS false
   144d: SLDC 01          Short load constant 1
   144e: CXP  00 2d       Call external procedure PASCALSY.45
-> 1451: SLDC 00          Short load constant 0
   1452: SRO  0001        Store global word BASE1
   1454: SLDO 04          Short load global BASE4
   1455: SLDC 51          Short load constant 81
   1456: EQUI             Integer TOS-1 = TOS
   1457: FJP  $145d       Jump if TOS false
   1459: LDCN             Load constant NIL
   145a: STR  01 0036     Store TOS to G54
-> 145d: SLDC 05          Short load constant 5
   145e: SLDC 01          Short load constant 1
   145f: CSP  04          Call standard procedure EXIT
-> 1461: UJP  $14b2       Unconditional jump
   1463: CLP  14          Call local procedure GETCMD.20
   1465: UJP  $14b2       Unconditional jump
   1467: LOD  01 0182     Load word at G386
   146b: LOD  01 0183     Load word at G387
   146f: LOR              Logical OR (TOS | TOS-1)
   1470: FJP  $1477       Jump if TOS false
   1472: SLDC 01          Short load constant 1
   1473: CLP  11          Call local procedure GETCMD.17
   1475: UJP  $1479       Unconditional jump
-> 1477: CLP  15          Call local procedure GETCMD.21
-> 1479: UJP  $14b2       Unconditional jump
-> 14b2: SLDC 00          Short load constant 0
   14b3: FJP  $1243       Jump if TOS false
-> 14b5: RBP  01          Return from base procedure
END

### PROCEDURE GETCMD.PROC2(PARAM1) (* P=2 LL=1 *)
  BASE1
  BASE3
  BASE6
  MP1=PARAM1
  MP2
BEGIN
-> 0d9a: LOD  02 0010     Load word at G16
   0d9d: FJP  $0e05       Jump if TOS false
   0d9f: CXP  00 25       Call external procedure PASCALSY.37
   0da2: LOD  02 0003     Load word at G3 (OUTPUT)
   0da5: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0da8: SLDC 00          Short load constant 0
   0da9: STL  0002        Store TOS into MP2
   0dab: LLA  0002        Load local address MP2
   0dad: LDA  02 0012     Load addr G18
   0db0: SLDC 07          Short load constant 7
   0db1: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0db4: LLA  0002        Load local address MP2
   0db6: NOP              No operation
   0db7: LSA  01          Load string address: ':'
   0dba: SLDC 08          Short load constant 8
   0dbb: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0dbe: LLA  0002        Load local address MP2
   0dc0: LDA  02 001e     Load addr G30
   0dc3: SLDC 17          Short load constant 23
   0dc4: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0dc7: LLA  0002        Load local address MP2
   0dc9: SLDL 01          Short load local MP1
   0dca: SLDC 01          Short load constant 1
   0dcb: SLDC 01          Short load constant 1
   0dcc: LAO  0006        Load global BASE6
   0dce: SLDC 00          Short load constant 0
   0dcf: SLDC 00          Short load constant 0
   0dd0: SLDC 00          Short load constant 0
   0dd1: CGP  0d          Call global procedure GETCMD.13
   0dd3: FJP  $0df6       Jump if TOS false
   0dd5: LOD  02 0003     Load word at G3 (OUTPUT)
   0dd8: NOP              No operation
   0dd9: LSA  0a          Load string address: 'Running...'
   0de5: SLDC 00          Short load constant 0
   0de6: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0de9: LOD  02 0003     Load word at G3 (OUTPUT)
   0dec: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0def: SLDC 04          Short load constant 4
   0df0: SRO  0001        Store global word BASE1
   0df2: SLDC 05          Short load constant 5
   0df3: SLDC 01          Short load constant 1
   0df4: CSP  04          Call standard procedure EXIT
-> 0df6: SLDO 03          Short load global BASE3
   0df7: LDCI 0300        Load word 768
   0dfa: SLDC 01          Short load constant 1
   0dfb: INN              Set membership (TOS-1 in set TOS)
   0dfc: LNOT             Logical NOT (~TOS)
   0dfd: FJP  $0e03       Jump if TOS false
   0dff: SLDC 00          Short load constant 0
   0e00: STR  02 0010     Store TOS to G16
-> 0e03: UJP  $0e08       Unconditional jump
-> 0e05: SLDC 06          Short load constant 6
   0e06: CGP  0e          Call global procedure GETCMD.14
-> 0e08: RNP  00          Return from nonbase procedure
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
-> 065a: LDA  02 00fc     Load addr G252
   065e: SLDL 04          Short load local MP4
   065f: IXA  000c        Index array (TOS-1 + TOS * 12)
   0661: SLDC 00          Short load constant 0
   0662: SLDC 00          Short load constant 0
   0663: SLDC 00          Short load constant 0
   0664: LLA  0020        Load local address MP32
   0666: SLDL 03          Short load local MP3
   0667: SLDC 00          Short load constant 0
   0668: SLDC 00          Short load constant 0
   0669: CGP  0d          Call global procedure GETCMD.13
   066b: STL  0001        Store TOS into MP1
   066d: LDL  0020        Load local word MP32
   066f: SLDC 02          Short load constant 2
   0670: EQUI             Integer TOS-1 = TOS
   0671: FJP  $0731       Jump if TOS false
   0673: LDA  02 00fc     Load addr G252
   0677: SLDL 04          Short load local MP4
   0678: IXA  000c        Index array (TOS-1 + TOS * 12)
   067a: LLA  0005        Load local address MP5
   067c: LLA  0009        Load local address MP9
   067e: LLA  0011        Load local address MP17
   0680: LLA  0012        Load local address MP18
   0682: SLDC 00          Short load constant 0
   0683: SLDC 00          Short load constant 0
   0684: CXP  00 21       Call external procedure PASCALSY.33
   0687: FJP  $0731       Jump if TOS false
   0689: SLDC 00          Short load constant 0
   068a: STL  0013        Store TOS into MP19
-> 068c: LDL  0013        Load local word MP19
   068e: SLDC 01          Short load constant 1
   068f: ADI              Add integers (TOS + TOS-1)
   0690: STL  0013        Store TOS into MP19
   0692: LDA  02 007e     Load addr G126
   0695: LDL  0013        Load local word MP19
   0697: IXA  0006        Index array (TOS-1 + TOS * 6)
   0699: STL  0021        Store TOS into MP33
   069b: LDL  0021        Load local word MP33
   069d: SIND 04          Short index load *TOS+4
   069e: FJP  $0706       Jump if TOS false
   06a0: LDL  0021        Load local word MP33
   06a2: NOP              No operation
   06a3: LSA  00          Load string address: ''
   06a5: SAS  07          String assign (TOS to TOS-1, 7 chars)
   06a7: LDL  0013        Load local word MP19
   06a9: SLDC 00          Short load constant 0
   06aa: SLDC 00          Short load constant 0
   06ab: CXP  00 2a       Call external procedure PASCALSY.42
   06ae: FJP  $0706       Jump if TOS false
   06b0: LDL  0021        Load local word MP33
   06b2: LOD  02 0001     Load word at G1 (SYSCOM)
   06b5: SIND 04          Short index load *TOS+4
   06b6: SLDC 00          Short load constant 0
   06b7: IXA  000d        Index array (TOS-1 + TOS * 13)
   06b9: INC  0003        Inc field ptr (TOS+3)
   06bb: SAS  07          String assign (TOS to TOS-1, 7 chars)
   06bd: LLA  0014        Load local address MP20
   06bf: SLDC 00          Short load constant 0
   06c0: STL  0022        Store TOS into MP34
   06c2: LLA  0022        Load local address MP34
   06c4: LDL  0021        Load local word MP33
   06c6: SLDC 07          Short load constant 7
   06c7: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   06ca: LLA  0022        Load local address MP34
   06cc: NOP              No operation
   06cd: LSA  01          Load string address: ':'
   06d0: SLDC 08          Short load constant 8
   06d1: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   06d4: LLA  0022        Load local address MP34
   06d6: LLA  0009        Load local address MP9
   06d8: SLDC 17          Short load constant 23
   06d9: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   06dc: LLA  0022        Load local address MP34
   06de: SAS  17          String assign (TOS to TOS-1, 23 chars)
   06e0: LLA  0014        Load local address MP20
   06e2: LDA  02 00fc     Load addr G252
   06e6: SLDL 04          Short load local MP4
   06e7: IXA  000c        Index array (TOS-1 + TOS * 12)
   06e9: NEQSTR           String TOS-1 <> TOS
   06eb: FJP  $0706       Jump if TOS false
   06ed: LLA  0014        Load local address MP20
   06ef: SLDC 00          Short load constant 0
   06f0: SLDC 00          Short load constant 0
   06f1: SLDC 00          Short load constant 0
   06f2: LLA  0020        Load local address MP32
   06f4: SLDL 03          Short load local MP3
   06f5: SLDC 00          Short load constant 0
   06f6: SLDC 00          Short load constant 0
   06f7: CGP  0d          Call global procedure GETCMD.13
   06f9: FJP  $0706       Jump if TOS false
   06fb: LDA  02 00fc     Load addr G252
   06ff: SLDL 04          Short load local MP4
   0700: IXA  000c        Index array (TOS-1 + TOS * 12)
   0702: LLA  0014        Load local address MP20
   0704: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 0706: LDL  0013        Load local word MP19
   0708: SLDC 14          Short load constant 20
   0709: EQUI             Integer TOS-1 = TOS
   070a: LDL  0020        Load local word MP32
   070c: SLDC 03          Short load constant 3
   070d: SLDC 01          Short load constant 1
   070e: INN              Set membership (TOS-1 in set TOS)
   070f: LOR              Logical OR (TOS | TOS-1)
   0710: FJP  $068c       Jump if TOS false
   0712: LDL  0020        Load local word MP32
   0714: SLDC 00          Short load constant 0
   0715: EQUI             Integer TOS-1 = TOS
   0716: STL  0001        Store TOS into MP1
   0718: LDL  0020        Load local word MP32
   071a: SLDC 02          Short load constant 2
   071b: EQUI             Integer TOS-1 = TOS
   071c: FJP  $0731       Jump if TOS false
   071e: LDA  02 00fc     Load addr G252
   0722: SLDL 04          Short load local MP4
   0723: IXA  000c        Index array (TOS-1 + TOS * 12)
   0725: SLDC 00          Short load constant 0
   0726: SLDC 00          Short load constant 0
   0727: SLDC 01          Short load constant 1
   0728: LLA  0020        Load local address MP32
   072a: SLDC 00          Short load constant 0
   072b: SLDC 00          Short load constant 0
   072c: SLDC 00          Short load constant 0
   072d: CGP  0d          Call global procedure GETCMD.13
   072f: FJP  $0731       Jump if TOS false
-> 0731: RNP  01          Return from nonbase procedure
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
  MP82
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
-> 0393: UJP  $0637       Unconditional jump
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
   03d4: UJP  $0637       Unconditional jump
   03d6: UJP  $0626       Unconditional jump
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
   0405: UJP  $0637       Unconditional jump
-> 0407: SLDL 03          Short load local MP3
   0408: FJP  $0477       Jump if TOS false
   040a: LLA  00b2        Load local address MP178
   040d: SLDC 01          Short load constant 1
   040e: IXA  0001        Index array (TOS-1 + TOS * 1)
   0410: SLDC 03          Short load constant 3
   0411: SLDC 0d          Short load constant 13
   0412: LDP              Load packed field (TOS)
   0413: SLDC 06          Short load constant 6
   0414: NEQI             Integer TOS-1 <> TOS
   0415: FJP  $0477       Jump if TOS false
   0417: LSA  0f          Load string address: 'SYSTEM.COMPILER'
   0428: NOP              No operation
   0429: LLA  0009        Load local address MP9
   042b: SLDC 00          Short load constant 0
   042c: SLDC 00          Short load constant 0
   042d: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0430: SLDC 00          Short load constant 0
   0431: NEQI             Integer TOS-1 <> TOS
   0432: LLA  0052        Load local address MP82
   0434: SLDC 01          Short load constant 1
   0435: IXA  0004        Index array (TOS-1 + TOS * 4)
   0437: NOP              No operation
   0438: LPA  08          Load packed array
                         464f525452414e3a
   0442: EQLBYTE          Byte array (8 long) TOS-1 = TOS
   0445: LAND             Logical AND (TOS & TOS-1)
   0446: LNOT             Logical NOT (~TOS)
   0447: FJP  $0477       Jump if TOS false
   0449: LOD  02 0003     Load word at G3 (OUTPUT)
   044c: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   044f: LOD  02 0003     Load word at G3 (OUTPUT)
   0452: LLA  0009        Load local address MP9
   0454: SLDC 00          Short load constant 0
   0455: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0458: LOD  02 0003     Load word at G3 (OUTPUT)
   045b: LSA  13          Load string address: ' is not version 1.3'
   0470: NOP              No operation
   0471: SLDC 00          Short load constant 0
   0472: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0475: UJP  $0637       Unconditional jump
-> 0477: SLDL 03          Short load local MP3
   0478: LNOT             Logical NOT (~TOS)
   0479: FJP  $047f       Jump if TOS false
   047b: LLA  0032        Load local address MP50
   047d: CGP  08          Call global procedure GETCMD.8
-> 047f: LLA  0032        Load local address MP50
   0481: SLDC 00          Short load constant 0
   0482: SLDC 00          Short load constant 0
   0483: CGP  07          Call global procedure GETCMD.7
   0485: LNOT             Logical NOT (~TOS)
   0486: FJP  $04d0       Jump if TOS false
   0488: LOD  02 0003     Load word at G3 (OUTPUT)
   048b: LSA  3c          Load string address: 'Specified code file must be run under the 128K Pascal system'
   04c9: NOP              No operation
   04ca: SLDC 00          Short load constant 0
   04cb: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   04ce: UJP  $0637       Unconditional jump
-> 04d0: LLA  0032        Load local address MP50
   04d2: LLA  0132        Load local address MP306
   04d5: SLDC 01          Short load constant 1
   04d6: SLDC 01          Short load constant 1
   04d7: ADJ  01          Adjust set to 1 words
   04d9: SLDC 00          Short load constant 0
   04da: SLDC 00          Short load constant 0
   04db: CGP  0b          Call global procedure GETCMD.11
   04dd: LNOT             Logical NOT (~TOS)
   04de: FJP  $0542       Jump if TOS false
   04e0: SLDL 07          Short load local MP7
   04e1: FJP  $051d       Jump if TOS false
   04e3: LOD  02 0003     Load word at G3 (OUTPUT)
   04e6: NOP              No operation
   04e7: LSA  0a          Load string address: 'Linking...'
   04f3: SLDC 00          Short load constant 0
   04f4: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   04f7: LOD  02 0003     Load word at G3 (OUTPUT)
   04fa: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   04fd: LOD  02 0008     Load word at G8
   0500: SLDC 00          Short load constant 0
   0501: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0504: SLDC 04          Short load constant 4
   0505: SLDC 01          Short load constant 1
   0506: SLDC 00          Short load constant 0
   0507: SLDC 00          Short load constant 0
   0508: CGP  03          Call global procedure GETCMD.3
   050a: FJP  $051b       Jump if TOS false
   050c: SLDL 06          Short load local MP6
   050d: FJP  $0514       Jump if TOS false
   050f: SLDC 08          Short load constant 8
   0510: SRO  0001        Store global word BASE1
   0512: UJP  $0517       Unconditional jump
-> 0514: SLDC 09          Short load constant 9
   0515: SRO  0001        Store global word BASE1
-> 0517: SLDC 05          Short load constant 5
   0518: SLDC 01          Short load constant 1
   0519: CSP  04          Call standard procedure EXIT
-> 051b: UJP  $0540       Unconditional jump
-> 051d: SLDO 03          Short load global BASE3
   051e: LDCI 0300        Load word 768
   0521: SLDC 01          Short load constant 1
   0522: INN              Set membership (TOS-1 in set TOS)
   0523: LNOT             Logical NOT (~TOS)
   0524: FJP  $0540       Jump if TOS false
   0526: LOD  02 0003     Load word at G3 (OUTPUT)
   0529: LSA  10          Load string address: 'Must L(ink first'
   053b: NOP              No operation
   053c: SLDC 00          Short load constant 0
   053d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0540: UJP  $0637       Unconditional jump
-> 0542: LLA  0132        Load local address MP306
   0545: LDM  02          Load 2 words from (TOS)
   0547: SLDC 02          Short load constant 2
   0548: LLA  00c2        Load local address MP194
   054b: LDM  02          Load 2 words from (TOS)
   054d: SLDC 02          Short load constant 2
   054e: INT              Set intersection (TOS AND TOS-1)
   054f: SLDC 00          Short load constant 0
   0550: NEQSET           Set TOS-1 <> TOS
   0552: FJP  $058e       Jump if TOS false
   0554: LOD  02 0003     Load word at G3 (OUTPUT)
   0557: LSA  2e          Load string address: 'Conflict between intrinsic and user segment(s)'
   0587: NOP              No operation
   0588: SLDC 00          Short load constant 0
   0589: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   058c: UJP  $0637       Unconditional jump
-> 058e: LLA  00c2        Load local address MP194
   0591: LDM  02          Load 2 words from (TOS)
   0593: SLDC 02          Short load constant 2
   0594: SLDC 00          Short load constant 0
   0595: NEQSET           Set TOS-1 <> TOS
   0597: FJP  $061f       Jump if TOS false
   0599: LSA  0f          Load string address: '*SYSTEM.LIBRARY'
   05aa: NOP              No operation
   05ab: SLDC 00          Short load constant 0
   05ac: SLDC 00          Short load constant 0
   05ad: CGP  0c          Call global procedure GETCMD.12
   05af: LNOT             Logical NOT (~TOS)
   05b0: FJP  $05de       Jump if TOS false
   05b2: LOD  02 0003     Load word at G3 (OUTPUT)
   05b5: LSA  20          Load string address: 'Can't load required intrinsic(s)'
   05d7: NOP              No operation
   05d8: SLDC 00          Short load constant 0
   05d9: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   05dc: UJP  $0637       Unconditional jump
-> 05de: LLA  00c2        Load local address MP194
   05e1: LDM  02          Load 2 words from (TOS)
   05e3: SLDC 02          Short load constant 2
   05e4: LDA  02 01c0     Load addr G448
   05e8: LDM  02          Load 2 words from (TOS)
   05ea: SLDC 02          Short load constant 2
   05eb: LEQSET           Set TOS-1 <= TOS
   05ed: LNOT             Logical NOT (~TOS)
   05ee: FJP  $061f       Jump if TOS false
   05f0: LOD  02 0003     Load word at G3 (OUTPUT)
   05f3: LSA  23          Load string address: 'Required intrinsic(s) not available'
   0618: NOP              No operation
   0619: SLDC 00          Short load constant 0
   061a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   061d: UJP  $0637       Unconditional jump
-> 061f: LLA  0032        Load local address MP50
   0621: LOD  02 0008     Load word at G8
   0624: CGP  0a          Call global procedure GETCMD.10
-> 0626: SLDL 04          Short load local MP4
   0627: SLDC 00          Short load constant 0
   0628: STO              Store indirect (TOS into TOS-1)
   0629: SLDC 01          Short load constant 1
   062a: STL  0001        Store TOS into MP1
   062c: LOD  02 0008     Load word at G8
   062f: SLDC 00          Short load constant 0
   0630: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0633: SLDC 05          Short load constant 5
   0634: SLDC 0d          Short load constant 13
   0635: CSP  04          Call standard procedure EXIT
-> 0637: LOD  02 0008     Load word at G8
   063a: SLDC 00          Short load constant 0
   063b: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   063e: LDA  02 01bc     Load addr G444
   0642: LLA  015d        Load local address MP349
   0645: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0647: RNP  01          Return from nonbase procedure
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
  MP59
  MP60
  MP188
BEGIN
-> 0770: SLDL 01          Short load local MP1
   0771: SLDC 08          Short load constant 8
   0772: EQUI             Integer TOS-1 = TOS
   0773: FJP  $078b       Jump if TOS false
   0775: LOD  02 0003     Load word at G3 (OUTPUT)
   0778: NOP              No operation
   0779: LSA  0a          Load string address: 'Assembling'
   0785: SLDC 00          Short load constant 0
   0786: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0789: UJP  $079e       Unconditional jump
-> 078b: LOD  02 0003     Load word at G3 (OUTPUT)
   078e: NOP              No operation
   078f: LSA  09          Load string address: 'Compiling'
   079a: SLDC 00          Short load constant 0
   079b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 079e: LOD  02 0003     Load word at G3 (OUTPUT)
   07a1: LSA  03          Load string address: '...'
   07a6: NOP              No operation
   07a7: SLDC 00          Short load constant 0
   07a8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   07ab: LOD  02 0003     Load word at G3 (OUTPUT)
   07ae: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   07b1: SLDL 01          Short load local MP1
   07b2: SLDC 08          Short load constant 8
   07b3: EQUI             Integer TOS-1 = TOS
   07b4: FJP  $07bb       Jump if TOS false
   07b6: SLDC 00          Short load constant 0
   07b7: STL  0039        Store TOS into MP57
   07b9: UJP  $07be       Unconditional jump
-> 07bb: SLDC 01          Short load constant 1
   07bc: STL  0039        Store TOS into MP57
-> 07be: LDL  0039        Load local word MP57
   07c0: SLDC 01          Short load constant 1
   07c1: SLDC 00          Short load constant 0
   07c2: SLDC 00          Short load constant 0
   07c3: CGP  03          Call global procedure GETCMD.3
   07c5: FJP  $0ab2       Jump if TOS false
   07c7: LOD  02 0011     Load word at G17
   07ca: FJP  $07f3       Jump if TOS false
   07cc: LLA  0002        Load local address MP2
   07ce: SLDC 00          Short load constant 0
   07cf: STL  003c        Store TOS into MP60
   07d1: LLA  003c        Load local address MP60
   07d3: LDA  02 0016     Load addr G22
   07d6: SLDC 07          Short load constant 7
   07d7: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   07da: LLA  003c        Load local address MP60
   07dc: NOP              No operation
   07dd: LSA  01          Load string address: ':'
   07e0: SLDC 08          Short load constant 8
   07e1: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   07e4: LLA  003c        Load local address MP60
   07e6: LDA  02 0026     Load addr G38
   07e9: SLDC 17          Short load constant 23
   07ea: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   07ed: LLA  003c        Load local address MP60
   07ef: SAS  28          String assign (TOS to TOS-1, 40 chars)
   07f1: UJP  $0885       Unconditional jump
-> 07f3: SLDL 01          Short load local MP1
   07f4: SLDC 08          Short load constant 8
   07f5: EQUI             Integer TOS-1 = TOS
   07f6: FJP  $080c       Jump if TOS false
   07f8: LOD  02 0003     Load word at G3 (OUTPUT)
   07fb: LSA  08          Load string address: 'Assemble'
   0805: NOP              No operation
   0806: SLDC 00          Short load constant 0
   0807: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   080a: UJP  $081d       Unconditional jump
-> 080c: LOD  02 0003     Load word at G3 (OUTPUT)
   080f: LSA  07          Load string address: 'Compile'
   0818: NOP              No operation
   0819: SLDC 00          Short load constant 0
   081a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 081d: LOD  02 0003     Load word at G3 (OUTPUT)
   0820: NOP              No operation
   0821: LSA  21          Load string address: ' what textfile (<ret> to exit) ? '
   0844: SLDC 00          Short load constant 0
   0845: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0848: LOD  02 0002     Load word at G2 (INPUT)
   084b: LLA  0002        Load local address MP2
   084d: SLDC 28          Short load constant 40
   084e: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   0851: LOD  02 0002     Load word at G2 (INPUT)
   0854: CXP  00 15       Call external procedure PASCALSY.FREADLN
   0857: CLP  0f          Call local procedure GETCMD.15
   0859: LLA  0002        Load local address MP2
   085b: LSA  00          Load string address: ''
   085d: NOP              No operation
   085e: EQLSTR           String TOS-1 = TOS
   0860: FJP  $0866       Jump if TOS false
   0862: UJP  $0aa4       Unconditional jump
   0864: UJP  $0885       Unconditional jump
-> 0866: LLA  0002        Load local address MP2
   0868: SLDC 01          Short load constant 1
   0869: LDB              Load byte at byte ptr TOS-1 + TOS
   086a: SLDC 1b          Short load constant 27
   086b: EQUI             Integer TOS-1 = TOS
   086c: FJP  $0872       Jump if TOS false
   086e: UJP  $0aa4       Unconditional jump
   0870: UJP  $0885       Unconditional jump
-> 0872: LLA  0002        Load local address MP2
   0874: SLDC 00          Short load constant 0
   0875: SLDC 00          Short load constant 0
   0876: CGP  06          Call global procedure GETCMD.6
   0878: FJP  $087e       Jump if TOS false
   087a: SLDC 05          Short load constant 5
   087b: SLDC 0e          Short load constant 14
   087c: CSP  04          Call standard procedure EXIT
-> 087e: LLA  0002        Load local address MP2
   0880: SLDC 01          Short load constant 1
   0881: SLDC 28          Short load constant 40
   0882: CXP  00 2b       Call external procedure PASCALSY.43
-> 0885: LLA  0017        Load local address MP23
   0887: LLA  0002        Load local address MP2
   0889: SAS  28          String assign (TOS to TOS-1, 40 chars)
   088b: LSA  05          Load string address: '.TEXT'
   0892: NOP              No operation
   0893: LLA  0017        Load local address MP23
   0895: SLDC 00          Short load constant 0
   0896: SLDC 00          Short load constant 0
   0897: CXP  00 1b       Call external procedure PASCALSY.SPOS
   089a: STL  0038        Store TOS into MP56
   089c: LDL  0038        Load local word MP56
   089e: SLDC 00          Short load constant 0
   089f: NEQI             Integer TOS-1 <> TOS
   08a0: LDL  0038        Load local word MP56
   08a2: LLA  0017        Load local address MP23
   08a4: SLDC 00          Short load constant 0
   08a5: LDB              Load byte at byte ptr TOS-1 + TOS
   08a6: SLDC 04          Short load constant 4
   08a7: SBI              Subtract integers (TOS-1 - TOS)
   08a8: EQUI             Integer TOS-1 = TOS
   08a9: LAND             Logical AND (TOS & TOS-1)
   08aa: FJP  $08b4       Jump if TOS false
   08ac: LLA  0017        Load local address MP23
   08ae: LDL  0038        Load local word MP56
   08b0: SLDC 05          Short load constant 5
   08b1: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 08b4: LOD  02 0009     Load word at G9
   08b7: LLA  0002        Load local address MP2
   08b9: SLDC 01          Short load constant 1
   08ba: LDCN             Load constant NIL
   08bb: CXP  00 05       Call external procedure PASCALSY.FOPEN
   08be: CSP  22          Call standard procedure IORESULT
   08c0: SLDC 00          Short load constant 0
   08c1: NEQI             Integer TOS-1 <> TOS
   08c2: FJP  $08e8       Jump if TOS false
   08c4: LOD  02 0003     Load word at G3 (OUTPUT)
   08c7: LSA  0b          Load string address: 'Can't find '
   08d4: NOP              No operation
   08d5: SLDC 00          Short load constant 0
   08d6: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   08d9: LOD  02 0003     Load word at G3 (OUTPUT)
   08dc: LLA  0002        Load local address MP2
   08de: SLDC 00          Short load constant 0
   08df: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   08e2: SLDC 00          Short load constant 0
   08e3: STR  02 0011     Store TOS to G17
   08e6: UJP  $0aa4       Unconditional jump
-> 08e8: LLA  0002        Load local address MP2
   08ea: SLDC 00          Short load constant 0
   08eb: STL  003c        Store TOS into MP60
   08ed: LLA  003c        Load local address MP60
   08ef: LDA  02 00fc     Load addr G252
   08f3: LDL  0039        Load local word MP57
   08f5: IXA  000c        Index array (TOS-1 + TOS * 12)
   08f7: LLA  00bc        Load local address MP188
   08fa: SLDC 01          Short load constant 1
   08fb: LSA  01          Load string address: ':'
   08fe: NOP              No operation
   08ff: LDA  02 00fc     Load addr G252
   0903: LDL  0039        Load local word MP57
   0905: IXA  000c        Index array (TOS-1 + TOS * 12)
   0907: SLDC 00          Short load constant 0
   0908: SLDC 00          Short load constant 0
   0909: CXP  00 1b       Call external procedure PASCALSY.SPOS
   090c: CXP  00 19       Call external procedure PASCALSY.SCOPY
   090f: LLA  00bc        Load local address MP188
   0912: SLDC 17          Short load constant 23
   0913: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0916: LLA  003c        Load local address MP60
   0918: NOP              No operation
   0919: LSA  0f          Load string address: 'SYSTEM.SWAPDISK'
   092a: SLDC 26          Short load constant 38
   092b: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   092e: LLA  003c        Load local address MP60
   0930: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0932: LOD  02 0037     Load word at G55
   0935: LLA  0002        Load local address MP2
   0937: SLDC 01          Short load constant 1
   0938: LDCN             Load constant NIL
   0939: CXP  00 05       Call external procedure PASCALSY.FOPEN
   093c: LLA  002c        Load local address MP44
   093e: NOP              No operation
   093f: LSA  13          Load string address: '*SYSTEM.WRK.CODE[*]'
   0954: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 0956: SLDC 01          Short load constant 1
   0957: STL  003b        Store TOS into MP59
   0959: LOD  02 0011     Load word at G17
   095c: LNOT             Logical NOT (~TOS)
   095d: FJP  $0a11       Jump if TOS false
   095f: LOD  02 0003     Load word at G3 (OUTPUT)
   0962: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0965: LOD  02 0003     Load word at G3 (OUTPUT)
   0968: NOP              No operation
   0969: LSA  28          Load string address: 'To what codefile (<ret> for workfile) ? '
   0993: SLDC 00          Short load constant 0
   0994: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0997: LOD  02 0002     Load word at G2 (INPUT)
   099a: LLA  0002        Load local address MP2
   099c: SLDC 28          Short load constant 40
   099d: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   09a0: LOD  02 0002     Load word at G2 (INPUT)
   09a3: CXP  00 15       Call external procedure PASCALSY.FREADLN
   09a6: LLA  0002        Load local address MP2
   09a8: NOP              No operation
   09a9: LSA  00          Load string address: ''
   09ab: NEQSTR           String TOS-1 <> TOS
   09ad: FJP  $09be       Jump if TOS false
   09af: LLA  0002        Load local address MP2
   09b1: SLDC 01          Short load constant 1
   09b2: LDB              Load byte at byte ptr TOS-1 + TOS
   09b3: SLDC 10          Short load constant 16
   09b4: EQUI             Integer TOS-1 = TOS
   09b5: FJP  $09be       Jump if TOS false
   09b7: LLA  0002        Load local address MP2
   09b9: SLDC 01          Short load constant 1
   09ba: SLDC 02          Short load constant 2
   09bb: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 09be: CLP  0f          Call local procedure GETCMD.15
   09c0: LLA  0002        Load local address MP2
   09c2: NOP              No operation
   09c3: LSA  00          Load string address: ''
   09c5: NEQSTR           String TOS-1 <> TOS
   09c7: FJP  $0a11       Jump if TOS false
   09c9: LLA  0002        Load local address MP2
   09cb: SLDC 01          Short load constant 1
   09cc: LDB              Load byte at byte ptr TOS-1 + TOS
   09cd: SLDC 1b          Short load constant 27
   09ce: EQUI             Integer TOS-1 = TOS
   09cf: FJP  $09d5       Jump if TOS false
   09d1: UJP  $0aa4       Unconditional jump
   09d3: UJP  $0a11       Unconditional jump
-> 09d5: LSA  01          Load string address: '$'
   09d8: NOP              No operation
   09d9: LLA  0002        Load local address MP2
   09db: SLDC 00          Short load constant 0
   09dc: SLDC 00          Short load constant 0
   09dd: CXP  00 1b       Call external procedure PASCALSY.SPOS
   09e0: STL  0038        Store TOS into MP56
   09e2: LDL  0038        Load local word MP56
   09e4: SLDC 00          Short load constant 0
   09e5: GRTI             Integer TOS-1 > TOS
   09e6: FJP  $09fa       Jump if TOS false
   09e8: LLA  0002        Load local address MP2
   09ea: LDL  0038        Load local word MP56
   09ec: SLDC 01          Short load constant 1
   09ed: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   09f0: LLA  0017        Load local address MP23
   09f2: LLA  0002        Load local address MP2
   09f4: SLDC 28          Short load constant 40
   09f5: LDL  0038        Load local word MP56
   09f7: CXP  00 18       Call external procedure PASCALSY.SINSERT
-> 09fa: LLA  0002        Load local address MP2
   09fc: SLDC 00          Short load constant 0
   09fd: SLDC 00          Short load constant 0
   09fe: CGP  06          Call global procedure GETCMD.6
   0a00: FJP  $0a04       Jump if TOS false
   0a02: UJP  $0aa4       Unconditional jump
-> 0a04: LLA  0002        Load local address MP2
   0a06: SLDC 00          Short load constant 0
   0a07: SLDC 17          Short load constant 23
   0a08: CXP  00 2b       Call external procedure PASCALSY.43
   0a0b: LLA  002c        Load local address MP44
   0a0d: LLA  0002        Load local address MP2
   0a0f: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 0a11: LOD  02 0008     Load word at G8
   0a14: LLA  002c        Load local address MP44
   0a16: SLDC 00          Short load constant 0
   0a17: LDCN             Load constant NIL
   0a18: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0a1b: CSP  22          Call standard procedure IORESULT
   0a1d: SLDC 00          Short load constant 0
   0a1e: NEQI             Integer TOS-1 <> TOS
   0a1f: FJP  $0a85       Jump if TOS false
   0a21: SLDC 00          Short load constant 0
   0a22: STL  003b        Store TOS into MP59
   0a24: CSP  22          Call standard procedure IORESULT
   0a26: STL  003a        Store TOS into MP58
   0a28: LOD  02 0003     Load word at G3 (OUTPUT)
   0a2b: SLDC 07          Short load constant 7
   0a2c: SLDC 00          Short load constant 0
   0a2d: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0a30: LOD  02 0003     Load word at G3 (OUTPUT)
   0a33: LSA  0b          Load string address: 'I/O Error #'
   0a40: NOP              No operation
   0a41: SLDC 00          Short load constant 0
   0a42: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a45: LOD  02 0003     Load word at G3 (OUTPUT)
   0a48: LDL  003a        Load local word MP58
   0a4a: SLDC 00          Short load constant 0
   0a4b: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0a4e: LOD  02 0003     Load word at G3 (OUTPUT)
   0a51: LSA  17          Load string address: ' occured while opening '
   0a6a: NOP              No operation
   0a6b: SLDC 00          Short load constant 0
   0a6c: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a6f: LOD  02 0003     Load word at G3 (OUTPUT)
   0a72: LLA  002c        Load local address MP44
   0a74: SLDC 00          Short load constant 0
   0a75: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a78: LOD  02 0003     Load word at G3 (OUTPUT)
   0a7b: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a7e: LOD  02 0011     Load word at G17
   0a81: FJP  $0a85       Jump if TOS false
   0a83: UJP  $0aa4       Unconditional jump
-> 0a85: LDL  003b        Load local word MP59
   0a87: FJP  $0956       Jump if TOS false
   0a89: SLDC 00          Short load constant 0
   0a8a: STR  02 000a     Store TOS to G10
   0a8d: SLDC 00          Short load constant 0
   0a8e: STR  02 000b     Store TOS to G11
   0a91: SLDC 00          Short load constant 0
   0a92: STR  02 000c     Store TOS to G12
   0a95: SLDL 01          Short load local MP1
   0a96: SLDC 08          Short load constant 8
   0a97: EQUI             Integer TOS-1 = TOS
   0a98: FJP  $0a9d       Jump if TOS false
   0a9a: SLDC 05          Short load constant 5
   0a9b: STL  0001        Store TOS into MP1
-> 0a9d: SLDL 01          Short load local MP1
   0a9e: SRO  0001        Store global word BASE1
   0aa0: SLDC 05          Short load constant 5
   0aa1: SLDC 01          Short load constant 1
   0aa2: CSP  04          Call standard procedure EXIT
-> 0aa4: LOD  02 0009     Load word at G9
   0aa7: SLDC 00          Short load constant 0
   0aa8: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0aab: LOD  02 0037     Load word at G55
   0aae: SLDC 00          Short load constant 0
   0aaf: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 0ab2: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC15 (* P=15 LL=2 *)
BEGIN
-> 0744: SLDC 01          Short load constant 1
   0745: LDA  01 0002     Load addr L12
   0748: SLDC 00          Short load constant 0
   0749: LDB              Load byte at byte ptr TOS-1 + TOS
   074a: SLDC 01          Short load constant 1
   074b: SLDC 20          Short load constant 32
   074c: LDA  01 0002     Load addr L12
   074f: SLDC 01          Short load constant 1
   0750: SLDC 00          Short load constant 0
   0751: CSP  0b          Call standard procedure SCAN
   0753: ADI              Add integers (TOS + TOS-1)
   0754: STR  01 0038     Store TOS to L156
   0757: LDA  01 0002     Load addr L12
   075a: SLDC 01          Short load constant 1
   075b: LOD  01 0038     Load word at L1_56
   075e: SLDC 01          Short load constant 1
   075f: SBI              Subtract integers (TOS-1 - TOS)
   0760: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0763: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC16 (* P=16 LL=1 *)
  BASE1
  BASE3
  MP2
  MP10
BEGIN
-> 0ac8: LOD  02 0009     Load word at G9
   0acb: SLDC 00          Short load constant 0
   0acc: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0acf: LOD  02 0037     Load word at G55
   0ad2: SLDC 00          Short load constant 0
   0ad3: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0ad6: LOD  02 000a     Load word at G10
   0ad9: SLDC 00          Short load constant 0
   0ada: GRTI             Integer TOS-1 > TOS
   0adb: FJP  $0b09       Jump if TOS false
   0add: SLDC 00          Short load constant 0
   0ade: STR  02 0010     Store TOS to G16
   0ae1: LOD  02 0008     Load word at G8
   0ae4: SLDC 02          Short load constant 2
   0ae5: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0ae8: LOD  02 000b     Load word at G11
   0aeb: SLDC 00          Short load constant 0
   0aec: GRTI             Integer TOS-1 > TOS
   0aed: FJP  $0b07       Jump if TOS false
   0aef: CXP  00 25       Call external procedure PASCALSY.37
   0af2: LOD  02 0003     Load word at G3 (OUTPUT)
   0af5: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0af8: SLDC 02          Short load constant 2
   0af9: SLDC 01          Short load constant 1
   0afa: SLDC 00          Short load constant 0
   0afb: SLDC 00          Short load constant 0
   0afc: CGP  03          Call global procedure GETCMD.3
   0afe: FJP  $0b07       Jump if TOS false
   0b00: SLDC 04          Short load constant 4
   0b01: SRO  0001        Store global word BASE1
   0b03: SLDC 05          Short load constant 5
   0b04: SLDC 01          Short load constant 1
   0b05: CSP  04          Call standard procedure EXIT
-> 0b07: UJP  $0ba4       Unconditional jump
-> 0b09: LDA  02 001e     Load addr G30
   0b0c: NOP              No operation
   0b0d: LSA  0f          Load string address: 'SYSTEM.WRK.CODE'
   0b1e: NEQSTR           String TOS-1 <> TOS
   0b20: FJP  $0b95       Jump if TOS false
   0b22: LDA  02 0012     Load addr G18
   0b25: LOD  02 0008     Load word at G8
   0b28: INC  0008        Inc field ptr (TOS+8)
   0b2a: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0b2c: LDA  02 001e     Load addr G30
   0b2f: LOD  02 0008     Load word at G8
   0b32: INC  0013        Inc field ptr (TOS+19)
   0b34: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0b36: LDA  02 001e     Load addr G30
   0b39: LSA  0f          Load string address: 'SYSTEM.WRK.CODE'
   0b4a: NOP              No operation
   0b4b: NEQSTR           String TOS-1 <> TOS
   0b4d: FJP  $0b95       Jump if TOS false
   0b4f: LDA  02 001a     Load addr G26
   0b52: LDA  02 0012     Load addr G18
   0b55: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0b57: LDA  02 001e     Load addr G30
   0b5a: SLDC 00          Short load constant 0
   0b5b: LDB              Load byte at byte ptr TOS-1 + TOS
   0b5c: SLDC 05          Short load constant 5
   0b5d: GRTI             Integer TOS-1 > TOS
   0b5e: FJP  $0b95       Jump if TOS false
   0b60: LDA  02 001e     Load addr G30
   0b63: LLA  0002        Load local address MP2
   0b65: LDA  02 001e     Load addr G30
   0b68: SLDC 00          Short load constant 0
   0b69: LDB              Load byte at byte ptr TOS-1 + TOS
   0b6a: SLDC 04          Short load constant 4
   0b6b: SBI              Subtract integers (TOS-1 - TOS)
   0b6c: SLDC 05          Short load constant 5
   0b6d: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0b70: LLA  0002        Load local address MP2
   0b72: NOP              No operation
   0b73: LSA  05          Load string address: '.CODE'
   0b7a: EQLSTR           String TOS-1 = TOS
   0b7c: FJP  $0b95       Jump if TOS false
   0b7e: LDA  02 002e     Load addr G46
   0b81: LDA  02 001e     Load addr G30
   0b84: LLA  000a        Load local address MP10
   0b86: SLDC 01          Short load constant 1
   0b87: LDA  02 001e     Load addr G30
   0b8a: SLDC 00          Short load constant 0
   0b8b: LDB              Load byte at byte ptr TOS-1 + TOS
   0b8c: SLDC 05          Short load constant 5
   0b8d: SBI              Subtract integers (TOS-1 - TOS)
   0b8e: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0b91: LLA  000a        Load local address MP10
   0b93: SAS  0f          String assign (TOS to TOS-1, 15 chars)
-> 0b95: SLDC 01          Short load constant 1
   0b96: STR  02 0010     Store TOS to G16
   0b99: SLDO 03          Short load global BASE3
   0b9a: LDCI 00c0        Load word 192
   0b9d: SLDC 01          Short load constant 1
   0b9e: INN              Set membership (TOS-1 in set TOS)
   0b9f: FJP  $0ba4       Jump if TOS false
   0ba1: SLDC 01          Short load constant 1
   0ba2: CGP  02          Call global procedure GETCMD.2
-> 0ba4: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC17(PARAM1) (* P=17 LL=1 *)
  MP1=PARAM1
BEGIN
-> 0bb2: LOD  02 0003     Load word at G3 (OUTPUT)
   0bb5: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0bb8: SLDL 01          Short load local MP1
   0bb9: SLDC 01          Short load constant 1
   0bba: EQUI             Integer TOS-1 = TOS
   0bbb: FJP  $0beb       Jump if TOS false
   0bbd: LOD  02 0003     Load word at G3 (OUTPUT)
   0bc0: NOP              No operation
   0bc1: LSA  1c          Load string address: 'Nested exec commands illegal'
   0bdf: SLDC 00          Short load constant 0
   0be0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0be3: LOD  02 0003     Load word at G3 (OUTPUT)
   0be6: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0be9: UJP  $0c0d       Unconditional jump
-> 0beb: LOD  02 0003     Load word at G3 (OUTPUT)
   0bee: NOP              No operation
   0bef: LSA  12          Load string address: 'Error opening exec'
   0c03: SLDC 00          Short load constant 0
   0c04: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c07: LOD  02 0003     Load word at G3 (OUTPUT)
   0c0a: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0c0d: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC18 (* P=18 LL=1 *)
BEGIN
-> 0c1a: SLDC 20          Short load constant 32
   0c1b: STR  02 018a     Store TOS to G394
   0c1f: LOD  02 0036     Load word at G54
   0c22: STR  02 017e     Store TOS to G382
   0c26: LDA  02 017d     Load addr G381
   0c2a: LDCI 0100        Load word 256
   0c2d: CSP  01          Call standard procedure NEW
   0c2f: LDA  02 0036     Load addr G54
   0c32: CSP  20          Call standard procedure MARK
-> 0c34: RNP  00          Return from nonbase procedure
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
-> 0c40: SLDL 01          Short load local MP1
   0c41: FJP  $0c4d       Jump if TOS false
   0c43: LLA  0002        Load local address MP2
   0c45: LDA  02 0148     Load addr G328
   0c49: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0c4b: UJP  $0ca9       Unconditional jump
-> 0c4d: LOD  02 0003     Load word at G3 (OUTPUT)
   0c50: NOP              No operation
   0c51: LSA  07          Load string address: 'Execute'
   0c5a: SLDC 00          Short load constant 0
   0c5b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c5e: LOD  02 0001     Load word at G1 (SYSCOM)
   0c61: INC  001d        Inc field ptr (TOS+29)
   0c63: SLDC 01          Short load constant 1
   0c64: SLDC 04          Short load constant 4
   0c65: LDP              Load packed field (TOS)
   0c66: LNOT             Logical NOT (~TOS)
   0c67: FJP  $0c8e       Jump if TOS false
   0c69: LOD  02 0003     Load word at G3 (OUTPUT)
   0c6c: NOP              No operation
   0c6d: LSA  1b          Load string address: ' what file (<ret> to exit) '
   0c8a: SLDC 00          Short load constant 0
   0c8b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0c8e: LOD  02 0003     Load word at G3 (OUTPUT)
   0c91: LSA  02          Load string address: '? '
   0c95: NOP              No operation
   0c96: SLDC 00          Short load constant 0
   0c97: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c9a: LOD  02 0002     Load word at G2 (INPUT)
   0c9d: LLA  0002        Load local address MP2
   0c9f: SLDC 50          Short load constant 80
   0ca0: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   0ca3: LOD  02 0002     Load word at G2 (INPUT)
   0ca6: CXP  00 15       Call external procedure PASCALSY.FREADLN
-> 0ca9: LLA  0002        Load local address MP2
   0cab: SLDC 00          Short load constant 0
   0cac: LDB              Load byte at byte ptr TOS-1 + TOS
   0cad: SLDC 00          Short load constant 0
   0cae: GRTI             Integer TOS-1 > TOS
   0caf: FJP  $0d87       Jump if TOS false
   0cb1: LLA  0002        Load local address MP2
   0cb3: SLDC 00          Short load constant 0
   0cb4: LDB              Load byte at byte ptr TOS-1 + TOS
   0cb5: SLDC 05          Short load constant 5
   0cb6: GRTI             Integer TOS-1 > TOS
   0cb7: FJP  $0d6b       Jump if TOS false
   0cb9: LLA  002b        Load local address MP43
   0cbb: LLA  0002        Load local address MP2
   0cbd: LLA  0030        Load local address MP48
   0cbf: SLDC 01          Short load constant 1
   0cc0: SLDC 05          Short load constant 5
   0cc1: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0cc4: LLA  0030        Load local address MP48
   0cc6: SAS  05          String assign (TOS to TOS-1, 5 chars)
   0cc8: SLDC 01          Short load constant 1
   0cc9: STL  002e        Store TOS into MP46
   0ccb: SLDC 04          Short load constant 4
   0ccc: STL  0030        Store TOS into MP48
-> 0cce: LDL  002e        Load local word MP46
   0cd0: LDL  0030        Load local word MP48
   0cd2: LEQI             Integer TOS-1 <= TOS
   0cd3: FJP  $0cf8       Jump if TOS false
   0cd5: LLA  002b        Load local address MP43
   0cd7: LDL  002e        Load local word MP46
   0cd9: LDB              Load byte at byte ptr TOS-1 + TOS
   0cda: STL  002f        Store TOS into MP47
   0cdc: LDL  002f        Load local word MP47
   0cde: SLDC 61          Short load constant 97
   0cdf: GEQI             Integer TOS-1 >= TOS
   0ce0: LDL  002f        Load local word MP47
   0ce2: SLDC 7a          Short load constant 122
   0ce3: LEQI             Integer TOS-1 <= TOS
   0ce4: LAND             Logical AND (TOS & TOS-1)
   0ce5: FJP  $0cf0       Jump if TOS false
   0ce7: LLA  002b        Load local address MP43
   0ce9: LDL  002e        Load local word MP46
   0ceb: LDL  002f        Load local word MP47
   0ced: SLDC 20          Short load constant 32
   0cee: SBI              Subtract integers (TOS-1 - TOS)
   0cef: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0cf0: LDL  002e        Load local word MP46
   0cf2: SLDC 01          Short load constant 1
   0cf3: ADI              Add integers (TOS + TOS-1)
   0cf4: STL  002e        Store TOS into MP46
   0cf6: UJP  $0cce       Unconditional jump
-> 0cf8: LLA  002b        Load local address MP43
   0cfa: NOP              No operation
   0cfb: LSA  05          Load string address: 'EXEC/'
   0d02: EQLSTR           String TOS-1 = TOS
   0d04: FJP  $0d6b       Jump if TOS false
   0d06: LOD  02 0183     Load word at G387
   0d0a: FJP  $0d11       Jump if TOS false
   0d0c: SLDC 01          Short load constant 1
   0d0d: CGP  11          Call global procedure GETCMD.17
   0d0f: UJP  $0d67       Unconditional jump
-> 0d11: LLA  0002        Load local address MP2
   0d13: SLDC 01          Short load constant 1
   0d14: SLDC 05          Short load constant 5
   0d15: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0d18: LLA  0002        Load local address MP2
   0d1a: SLDC 00          Short load constant 0
   0d1b: SLDC 00          Short load constant 0
   0d1c: CGP  06          Call global procedure GETCMD.6
   0d1e: FJP  $0d24       Jump if TOS false
   0d20: SLDC 05          Short load constant 5
   0d21: SLDC 13          Short load constant 19
   0d22: CSP  04          Call standard procedure EXIT
-> 0d24: LLA  0002        Load local address MP2
   0d26: SLDC 01          Short load constant 1
   0d27: SLDC 50          Short load constant 80
   0d28: CXP  00 2b       Call external procedure PASCALSY.43
   0d2b: LDA  02 018c     Load addr G396
   0d2f: LLA  0002        Load local address MP2
   0d31: SLDC 01          Short load constant 1
   0d32: SLDC 00          Short load constant 0
   0d33: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0d36: CSP  22          Call standard procedure IORESULT
   0d38: SLDC 00          Short load constant 0
   0d39: EQUI             Integer TOS-1 = TOS
   0d3a: FJP  $0d64       Jump if TOS false
   0d3c: CGP  12          Call global procedure GETCMD.18
   0d3e: SLDC 01          Short load constant 1
   0d3f: STR  02 0182     Store TOS to G386
   0d43: SLDC 01          Short load constant 1
   0d44: STR  02 0181     Store TOS to G385
   0d48: CXP  00 2e       Call external procedure PASCALSY.46
   0d4b: LOD  02 017d     Load word at G381
   0d4f: LOD  02 017f     Load word at G383
   0d53: LDB              Load byte at byte ptr TOS-1 + TOS
   0d54: STR  02 018b     Store TOS to G395
   0d58: LOD  02 017f     Load word at G383
   0d5c: SLDC 01          Short load constant 1
   0d5d: ADI              Add integers (TOS + TOS-1)
   0d5e: STR  02 017f     Store TOS to G383
   0d62: UJP  $0d67       Unconditional jump
-> 0d64: SLDC 02          Short load constant 2
   0d65: CGP  11          Call global procedure GETCMD.17
-> 0d67: SLDC 05          Short load constant 5
   0d68: SLDC 13          Short load constant 19
   0d69: CSP  04          Call standard procedure EXIT
-> 0d6b: LLA  0002        Load local address MP2
   0d6d: SLDC 00          Short load constant 0
   0d6e: SLDC 50          Short load constant 80
   0d6f: CXP  00 2b       Call external procedure PASCALSY.43
   0d72: LLA  0002        Load local address MP2
   0d74: SLDC 00          Short load constant 0
   0d75: SLDC 00          Short load constant 0
   0d76: SLDC 01          Short load constant 1
   0d77: LAO  0006        Load global BASE6
   0d79: SLDC 00          Short load constant 0
   0d7a: SLDC 00          Short load constant 0
   0d7b: SLDC 00          Short load constant 0
   0d7c: CGP  0d          Call global procedure GETCMD.13
   0d7e: FJP  $0d87       Jump if TOS false
   0d80: SLDC 04          Short load constant 4
   0d81: SRO  0001        Store global word BASE1
   0d83: SLDC 05          Short load constant 5
   0d84: SLDC 01          Short load constant 1
   0d85: CSP  04          Call standard procedure EXIT
-> 0d87: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC20 (* P=20 LL=1 *)
  MP1
  MP2
BEGIN
-> 0e14: LOD  02 0186     Load word at G390
   0e18: LOD  02 0185     Load word at G389
   0e1c: ADI              Add integers (TOS + TOS-1)
   0e1d: STL  0002        Store TOS into MP2
   0e1f: LOD  02 0003     Load word at G3 (OUTPUT)
   0e22: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0e25: LOD  02 0003     Load word at G3 (OUTPUT)
   0e28: NOP              No operation
   0e29: LSA  10          Load string address: 'Swapping levels:'
   0e3b: SLDC 00          Short load constant 0
   0e3c: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0e3f: LOD  02 0003     Load word at G3 (OUTPUT)
   0e42: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0e45: LOD  02 0003     Load word at G3 (OUTPUT)
   0e48: NOP              No operation
   0e49: LSA  1b          Load string address: '  0 = system is not swapped'
   0e66: SLDC 00          Short load constant 0
   0e67: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0e6a: LOD  02 0003     Load word at G3 (OUTPUT)
   0e6d: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0e70: LOD  02 0003     Load word at G3 (OUTPUT)
   0e73: LSA  30          Load string address: '  1 = file open and close procedures are swapped'
   0ea5: NOP              No operation
   0ea6: SLDC 00          Short load constant 0
   0ea7: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0eaa: LOD  02 0003     Load word at G3 (OUTPUT)
   0ead: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0eb0: LOD  02 0003     Load word at G3 (OUTPUT)
   0eb3: LSA  3d          Load string address: '  2 = file open/close and disk get/put procedures are swapped'
   0ef2: NOP              No operation
   0ef3: SLDC 00          Short load constant 0
   0ef4: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ef7: LOD  02 0003     Load word at G3 (OUTPUT)
   0efa: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0efd: LOD  02 0003     Load word at G3 (OUTPUT)
   0f00: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0f03: LOD  02 0003     Load word at G3 (OUTPUT)
   0f06: NOP              No operation
   0f07: LSA  16          Load string address: 'Old swapping level is '
   0f1f: SLDC 00          Short load constant 0
   0f20: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0f23: LOD  02 0003     Load word at G3 (OUTPUT)
   0f26: SLDL 02          Short load local MP2
   0f27: SLDC 00          Short load constant 0
   0f28: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0f2b: LOD  02 0003     Load word at G3 (OUTPUT)
   0f2e: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0f31: LOD  02 0003     Load word at G3 (OUTPUT)
   0f34: NOP              No operation
   0f35: LSA  24          Load string address: 'New swapping level (<esc> to exit): '
   0f5b: SLDC 00          Short load constant 0
   0f5c: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0f5f: LOD  02 0004     Load word at G4 (SYSTERM)
   0f62: LLA  0001        Load local address MP1
   0f64: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   0f67: SLDL 01          Short load local MP1
   0f68: SLDC 1b          Short load constant 27
   0f69: EQUI             Integer TOS-1 = TOS
   0f6a: SLDL 01          Short load local MP1
   0f6b: SLDC 30          Short load constant 48
   0f6c: EQUI             Integer TOS-1 = TOS
   0f6d: LOR              Logical OR (TOS | TOS-1)
   0f6e: SLDL 01          Short load local MP1
   0f6f: SLDC 31          Short load constant 49
   0f70: EQUI             Integer TOS-1 = TOS
   0f71: LOR              Logical OR (TOS | TOS-1)
   0f72: SLDL 01          Short load local MP1
   0f73: SLDC 32          Short load constant 50
   0f74: EQUI             Integer TOS-1 = TOS
   0f75: LOR              Logical OR (TOS | TOS-1)
   0f76: FJP  $0f5f       Jump if TOS false
   0f78: SLDL 01          Short load local MP1
   0f7c: LDC  04          Load multiple-word constant
                         0007000000000000
   0f84: SLDC 04          Short load constant 4
   0f85: INN              Set membership (TOS-1 in set TOS)
   0f86: FJP  $0ffb       Jump if TOS false
   0f88: LOD  02 0003     Load word at G3 (OUTPUT)
   0f8b: SLDL 01          Short load local MP1
   0f8c: SLDC 00          Short load constant 0
   0f8d: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0f90: SLDL 01          Short load local MP1
   0f91: SLDC 32          Short load constant 50
   0f92: EQUI             Integer TOS-1 = TOS
   0f93: STR  02 0185     Store TOS to G389
   0f97: SLDL 01          Short load local MP1
   0f98: SLDC 31          Short load constant 49
   0f99: EQUI             Integer TOS-1 = TOS
   0f9a: LOD  02 0185     Load word at G389
   0f9e: LOR              Logical OR (TOS | TOS-1)
   0f9f: STR  02 0186     Store TOS to G390
   0fa3: LOD  02 0185     Load word at G389
   0fa7: FJP  $0ffb       Jump if TOS false
   0fa9: LOD  02 0003     Load word at G3 (OUTPUT)
   0fac: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0faf: LOD  02 0003     Load word at G3 (OUTPUT)
   0fb2: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0fb5: LOD  02 0003     Load word at G3 (OUTPUT)
   0fb8: NOP              No operation
   0fb9: LSA  3c          Load string address: 'Warning: programs using GET or PUT to disk will be very slow'
   0ff7: SLDC 00          Short load constant 0
   0ff8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0ffb: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC21 (* P=21 LL=1 *)
  MP1
  MP2
  MP23
  MP24
BEGIN
-> 100a: LOD  02 0003     Load word at G3 (OUTPUT)
   100d: LSA  0e          Load string address: 'New exec name:'
   101d: NOP              No operation
   101e: SLDC 00          Short load constant 0
   101f: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   1022: LOD  02 0002     Load word at G2 (INPUT)
   1025: LLA  0002        Load local address MP2
   1027: SLDC 28          Short load constant 40
   1028: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   102b: LOD  02 0002     Load word at G2 (INPUT)
   102e: CXP  00 15       Call external procedure PASCALSY.FREADLN
   1031: LLA  0002        Load local address MP2
   1033: SLDC 00          Short load constant 0
   1034: LDB              Load byte at byte ptr TOS-1 + TOS
   1035: SLDC 00          Short load constant 0
   1036: GRTI             Integer TOS-1 > TOS
   1037: FJP  $108b       Jump if TOS false
   1039: LLA  0002        Load local address MP2
   103b: LLA  0002        Load local address MP2
   103d: SLDC 00          Short load constant 0
   103e: LDB              Load byte at byte ptr TOS-1 + TOS
   103f: LDB              Load byte at byte ptr TOS-1 + TOS
   1040: SLDC 2e          Short load constant 46
   1041: EQUI             Integer TOS-1 = TOS
   1042: STL  0017        Store TOS into MP23
   1044: LLA  0002        Load local address MP2
   1046: SLDC 00          Short load constant 0
   1047: SLDC 00          Short load constant 0
   1048: CGP  06          Call global procedure GETCMD.6
   104a: FJP  $1050       Jump if TOS false
   104c: SLDC 05          Short load constant 5
   104d: SLDC 15          Short load constant 21
   104e: CSP  04          Call standard procedure EXIT
-> 1050: LLA  0002        Load local address MP2
   1052: SLDC 01          Short load constant 1
   1053: SLDC 25          Short load constant 37
   1054: CXP  00 2b       Call external procedure PASCALSY.43
   1057: LLA  0002        Load local address MP2
   1059: SLDC 00          Short load constant 0
   105a: LDB              Load byte at byte ptr TOS-1 + TOS
   105b: SLDC 00          Short load constant 0
   105c: GRTI             Integer TOS-1 > TOS
   105d: LDL  0017        Load local word MP23
   105f: LNOT             Logical NOT (~TOS)
   1060: LAND             Logical AND (TOS & TOS-1)
   1061: FJP  $108b       Jump if TOS false
   1063: LLA  0002        Load local address MP2
   1065: LLA  0002        Load local address MP2
   1067: SLDC 00          Short load constant 0
   1068: LDB              Load byte at byte ptr TOS-1 + TOS
   1069: LDB              Load byte at byte ptr TOS-1 + TOS
   106a: SLDC 5d          Short load constant 93
   106b: NEQI             Integer TOS-1 <> TOS
   106c: FJP  $108b       Jump if TOS false
   106e: LLA  0002        Load local address MP2
   1070: SLDC 00          Short load constant 0
   1071: STL  0018        Store TOS into MP24
   1073: LLA  0018        Load local address MP24
   1075: LLA  0002        Load local address MP2
   1077: SLDC 28          Short load constant 40
   1078: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   107b: LLA  0018        Load local address MP24
   107d: LSA  03          Load string address: '[8]'
   1082: NOP              No operation
   1083: SLDC 2b          Short load constant 43
   1084: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   1087: LLA  0018        Load local address MP24
   1089: SAS  28          String assign (TOS to TOS-1, 40 chars)
-> 108b: LDA  02 018c     Load addr G396
   108f: LLA  0002        Load local address MP2
   1091: SLDC 00          Short load constant 0
   1092: SLDC 00          Short load constant 0
   1093: CXP  00 05       Call external procedure PASCALSY.FOPEN
   1096: CSP  22          Call standard procedure IORESULT
   1098: SLDC 00          Short load constant 0
   1099: EQUI             Integer TOS-1 = TOS
   109a: FJP  $1148       Jump if TOS false
   109c: SLDC 25          Short load constant 37
   109d: STR  02 018b     Store TOS to G395
   10a1: LOD  02 0003     Load word at G3 (OUTPUT)
   10a4: NOP              No operation
   10a5: LSA  0b          Load string address: 'Terminator='
   10b2: SLDC 00          Short load constant 0
   10b3: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   10b6: LOD  02 0003     Load word at G3 (OUTPUT)
   10b9: LOD  02 018b     Load word at G395
   10bd: SLDC 00          Short load constant 0
   10be: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   10c1: LOD  02 0003     Load word at G3 (OUTPUT)
   10c4: NOP              No operation
   10c5: LSA  0c          Load string address: ', change it?'
   10d3: SLDC 00          Short load constant 0
   10d4: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   10d7: SLDC 00          Short load constant 0
   10d8: SLDC 00          Short load constant 0
   10d9: CGP  04          Call global procedure GETCMD.4
   10db: FJP  $1106       Jump if TOS false
   10dd: LOD  02 0003     Load word at G3 (OUTPUT)
   10e0: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   10e3: LOD  02 0003     Load word at G3 (OUTPUT)
   10e6: NOP              No operation
   10e7: LSA  0f          Load string address: 'New terminator:'
   10f8: SLDC 00          Short load constant 0
   10f9: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   10fc: LOD  02 0002     Load word at G2 (INPUT)
   10ff: LDA  02 018b     Load addr G395
   1103: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
-> 1106: CGP  12          Call global procedure GETCMD.18
   1108: SLDC 01          Short load constant 1
   1109: STR  02 0183     Store TOS to G387
   110d: LOD  02 017d     Load word at G381
   1111: SLDC 00          Short load constant 0
   1112: LDCI 0200        Load word 512
   1115: SLDC 00          Short load constant 0
   1116: CSP  0a          Call standard procedure FLCH
   1118: SLDC 00          Short load constant 0
   1119: STR  02 0181     Store TOS to G385
   111d: SLDC 01          Short load constant 1
   111e: STL  0001        Store TOS into MP1
   1120: SLDC 02          Short load constant 2
   1121: STL  0018        Store TOS into MP24
-> 1123: SLDL 01          Short load local MP1
   1124: LDL  0018        Load local word MP24
   1126: LEQI             Integer TOS-1 <= TOS
   1127: FJP  $1139       Jump if TOS false
   1129: LOD  02 0183     Load word at G387
   112d: FJP  $1132       Jump if TOS false
   112f: CXP  00 2f       Call external procedure PASCALSY.47
-> 1132: SLDL 01          Short load local MP1
   1133: SLDC 01          Short load constant 1
   1134: ADI              Add integers (TOS + TOS-1)
   1135: STL  0001        Store TOS into MP1
   1137: UJP  $1123       Unconditional jump
-> 1139: LOD  02 0183     Load word at G387
   113d: FJP  $1146       Jump if TOS false
   113f: LOD  02 018b     Load word at G395
   1143: CXP  00 2c       Call external procedure PASCALSY.44
-> 1146: UJP  $114b       Unconditional jump
-> 1148: SLDC 02          Short load constant 2
   1149: CGP  11          Call global procedure GETCMD.17
-> 114b: RNP  00          Return from nonbase procedure
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

