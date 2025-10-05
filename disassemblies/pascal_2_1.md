#  SYSTEM.PASCAL-02-01.bin 

## Segment Table
| slot |segNum | name | block | length | kind | textAddr | mType | version |
|-----:|------:|------|------:|-------:|------|---------:|-------|--------:|
| 0 | 0 | PASCALSY | 0001 | 3150 | linked | 0000 | 0 | 0 |
| 15 | 15 |  | 0008 | 4226 | linked | 0000 | 0 | 0 |
| 1 | 1 | USERPROG | 0011 | 56 | linked | 0000 | 2 | 2 |
| 2 | 2 | DEBUGGER | 0012 | 62 | linked | 0000 | 2 | 2 |
| 3 | 3 | PRINTERR | 0013 | 1004 | linked | 0000 | 2 | 2 |
| 4 | 4 | INITIALI | 0015 | 2612 | linked | 0000 | 2 | 2 |
| 5 | 5 | GETCMD | 001B | 4214 | linked | 0000 | 2 | 2 |
| 6 | 6 | FILEPROC | 0024 | 2218 | linked | 0000 | 2 | 2 |

intrinsics: []

comment: 

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
G282
G294
G335
G336
G337
G338
G339
G340
G341
G342
G343
G344
G345
G346
G347
G348

## Segment PASCALSY (0)

### PROCEDURE PASCALSY.PASCALSY (* P=1 LL=-1 *)
  G54
  G348
  G648
BEGIN
-> 0000: LLA  015c        Load local address MP348
   0003: LLA  0288        Load local address MP648
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
-> 0027: XIT              Exit the operating system
END

### PROCEDURE PASCALSY.EXECERROR (* P=2 LL=0 *)
  BASE1
BEGIN
-> 003c: LOD  01 0001     Load word at G1 (SYSCOM)
   003f: SRO  0001        Store global word BASE1
   0041: SLDO 01          Short load global BASE1
   0042: SIND 05          Short index load *TOS+5
   0043: INC  0004        Inc field ptr (TOS+4)
   0045: SLDO 01          Short load global BASE1
   0046: IND  000b        Static index and load word (TOS+11)
   0048: STO              Store indirect (TOS into TOS-1)
   0049: SLDO 01          Short load global BASE1
   004a: SIND 03          Short index load *TOS+3
   004b: SLDC 00          Short load constant 0
   004c: NEQI             Integer TOS-1 <> TOS
   004d: FJP  $0059       Jump if TOS false
   004f: CXP  02 01       Call external procedure DEBUGGER.1
   0052: SLDO 01          Short load global BASE1
   0053: INC  0001        Inc field ptr (TOS+1)
   0055: SLDC 00          Short load constant 0
   0056: STO              Store indirect (TOS into TOS-1)
   0057: UJP  $010d       Unconditional jump
-> 0059: LDA  01 0002     Load addr G2 (INPUT)
   005c: SLDC 00          Short load constant 0
   005d: IXA  0001        Index array (TOS-1 + TOS * 1)
   005f: LOD  01 003a     Load word at G58
   0062: STO              Store indirect (TOS into TOS-1)
   0063: LDA  01 0002     Load addr G2 (INPUT)
   0066: SLDC 01          Short load constant 1
   0067: IXA  0001        Index array (TOS-1 + TOS * 1)
   0069: LOD  01 0039     Load word at G57
   006c: STO              Store indirect (TOS into TOS-1)
   006d: SLDO 01          Short load global BASE1
   006e: INC  000b        Inc field ptr (TOS+11)
   0070: CSP  22          Call standard procedure IORESULT
   0072: STO              Store indirect (TOS into TOS-1)
   0073: SLDC 03          Short load constant 3
   0074: CSP  26          Call standard procedure UNITCLEAR
   0076: LOD  01 0038     Load word at G56
   0079: CBP  16          Call base procedure PASCALSY.FWRITELN
   007b: CSP  28          Call standard procedure MEMAVAIL
   007d: LDCI 07ec        Load word 2028
   0080: SLDC 32          Short load constant 50
   0081: ADI              Add integers (TOS + TOS-1)
   0082: LEQI             Integer TOS-1 <= TOS
   0083: FJP  $0089       Jump if TOS false
   0085: CLP  32          Call local procedure PASCALSY.50
   0087: UJP  $00b0       Unconditional jump
-> 0089: SLDO 01          Short load global BASE1
   008a: SIND 02          Short index load *TOS+2
   008b: SLDC 00          Short load constant 0
   008c: SLDC 00          Short load constant 0
   008d: CBP  2a          Call base procedure PASCALSY.42
   008f: LNOT             Logical NOT (~TOS)
   0090: FJP  $0096       Jump if TOS false
   0092: CLP  32          Call local procedure PASCALSY.50
   0094: UJP  $00b0       Unconditional jump
-> 0096: SLDO 01          Short load global BASE1
   0097: SIND 04          Short index load *TOS+4
   0098: SLDC 00          Short load constant 0
   0099: IXA  000d        Index array (TOS-1 + TOS * 13)
   009b: INC  0003        Inc field ptr (TOS+3)
   009d: LDA  01 003f     Load addr G63
   00a0: NEQSTR           String TOS-1 <> TOS
   00a2: FJP  $00a8       Jump if TOS false
   00a4: CLP  32          Call local procedure PASCALSY.50
   00a6: UJP  $00b0       Unconditional jump
-> 00a8: SLDO 01          Short load global BASE1
   00a9: SIND 01          Short index load *TOS+1
   00aa: SLDO 01          Short load global BASE1
   00ab: IND  000b        Static index and load word (TOS+11)
   00ad: CXP  03 01       Call external procedure PRINTERR.PRINTERROR
-> 00b0: CLP  31          Call local procedure PASCALSY.49
   00b2: LOD  01 0154     Load word at G340
   00b6: LOD  01 0155     Load word at G341
   00ba: LOR              Logical OR (TOS | TOS-1)
   00bb: FJP  $00c0       Jump if TOS false
   00bd: SLDC 01          Short load constant 1
   00be: CBP  2d          Call base procedure PASCALSY.45
-> 00c0: SLDO 01          Short load global BASE1
   00c1: SIND 01          Short index load *TOS+1
   00c2: LDCI 6962        Load word 26978
   00c5: SLDC 01          Short load constant 1
   00c6: INN              Set membership (TOS-1 in set TOS)
   00c7: SLDO 01          Short load global BASE1
   00c8: SIND 01          Short index load *TOS+1
   00c9: SLDC 0a          Short load constant 10
   00ca: EQUI             Integer TOS-1 = TOS
   00cb: SLDO 01          Short load global BASE1
   00cc: IND  000b        Static index and load word (TOS+11)
   00d0: LDC  02          Load multiple-word constant
                         0007fffe
   00d4: SLDC 02          Short load constant 2
   00d5: INN              Set membership (TOS-1 in set TOS)
   00d6: LAND             Logical AND (TOS & TOS-1)
   00d7: LOR              Logical OR (TOS | TOS-1)
   00d8: FJP  $00ed       Jump if TOS false
   00da: SLDC 01          Short load constant 1
   00db: SLDC 00          Short load constant 0
   00dc: SLDC 00          Short load constant 0
   00dd: CBP  28          Call base procedure PASCALSY.40
   00df: LNOT             Logical NOT (~TOS)
   00e0: FJP  $00eb       Jump if TOS false
   00e2: LDA  01 0036     Load addr G54
   00e5: CSP  21          Call standard procedure RELEASE
   00e7: SLDC 00          Short load constant 0
   00e8: SLDC 30          Short load constant 48
   00e9: CSP  04          Call standard procedure EXIT
-> 00eb: UJP  $010d       Unconditional jump
-> 00ed: LOD  01 0003     Load word at G3 (OUTPUT)
   00f0: NOP              No operation
   00f1: LSA  0b          Load string address: 'Press RESET'
   00fe: SLDC 00          Short load constant 0
   00ff: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0102: LOD  01 0003     Load word at G3 (OUTPUT)
   0105: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0108: SLDC 01          Short load constant 1
   0109: FJP  $010d       Jump if TOS false
   010b: UJP  $0108       Unconditional jump
-> 010d: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FINIT(PARAM1; PARAM2; PARAM3) (* P=3 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 011e: SLDO 03          Short load global BASE3
   011f: SRO  0004        Store global word BASE4
   0121: SLDO 04          Short load global BASE4
   0122: INC  0003        Inc field ptr (TOS+3)
   0124: SLDC 00          Short load constant 0
   0125: STO              Store indirect (TOS into TOS-1)
   0126: SLDO 04          Short load global BASE4
   0127: INC  0005        Inc field ptr (TOS+5)
   0129: SLDC 00          Short load constant 0
   012a: STO              Store indirect (TOS into TOS-1)
   012b: SLDO 04          Short load global BASE4
   012c: INC  0002        Inc field ptr (TOS+2)
   012e: SLDC 01          Short load constant 1
   012f: STO              Store indirect (TOS into TOS-1)
   0130: SLDO 04          Short load global BASE4
   0131: INC  0001        Inc field ptr (TOS+1)
   0133: SLDC 01          Short load constant 1
   0134: STO              Store indirect (TOS into TOS-1)
   0135: SLDO 04          Short load global BASE4
   0136: SLDO 02          Short load global BASE2
   0137: STO              Store indirect (TOS into TOS-1)
   0138: SLDO 01          Short load global BASE1
   0139: SLDC 00          Short load constant 0
   013a: EQUI             Integer TOS-1 = TOS
   013b: SLDO 01          Short load global BASE1
   013c: SLDC 02          Short load constant 2
   013d: NGI              Negate integer
   013e: EQUI             Integer TOS-1 = TOS
   013f: LOR              Logical OR (TOS | TOS-1)
   0140: FJP  $0158       Jump if TOS false
   0142: SLDO 04          Short load global BASE4
   0143: SIND 00          Short index load *TOS+0
   0144: SLDC 01          Short load constant 1
   0145: SLDC 00          Short load constant 0
   0146: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0147: SLDO 04          Short load global BASE4
   0148: INC  0004        Inc field ptr (TOS+4)
   014a: SLDC 01          Short load constant 1
   014b: STO              Store indirect (TOS into TOS-1)
   014c: SLDO 01          Short load global BASE1
   014d: SLDC 00          Short load constant 0
   014e: EQUI             Integer TOS-1 = TOS
   014f: FJP  $0156       Jump if TOS false
   0151: SLDO 04          Short load global BASE4
   0152: INC  0003        Inc field ptr (TOS+3)
   0154: SLDC 01          Short load constant 1
   0155: STO              Store indirect (TOS into TOS-1)
-> 0156: UJP  $016e       Unconditional jump
-> 0158: SLDO 01          Short load global BASE1
   0159: SLDC 00          Short load constant 0
   015a: LESI             Integer TOS-1 < TOS
   015b: FJP  $0167       Jump if TOS false
   015d: SLDO 04          Short load global BASE4
   015e: LDCN             Load constant NIL
   015f: STO              Store indirect (TOS into TOS-1)
   0160: SLDO 04          Short load global BASE4
   0161: INC  0004        Inc field ptr (TOS+4)
   0163: SLDC 00          Short load constant 0
   0164: STO              Store indirect (TOS into TOS-1)
   0165: UJP  $016e       Unconditional jump
-> 0167: SLDO 04          Short load global BASE4
   0168: INC  0004        Inc field ptr (TOS+4)
   016a: SLDO 01          Short load global BASE1
   016b: SLDO 01          Short load global BASE1
   016c: ADI              Add integers (TOS + TOS-1)
   016d: STO              Store indirect (TOS into TOS-1)
-> 016e: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FRESET(PARAM1) (* P=4 LL=0 *)
  BASE1=PARAM1
  BASE2
  BASE4
  BASE5
  BASE6
BEGIN
-> 017a: SLDC 01          Short load constant 1
   017b: SLDO 01          Short load global BASE1
   017c: LAO  0002        Load global BASE2
   017e: SLDO 04          Short load global BASE4
   017f: SLDO 05          Short load global BASE5
   0180: SLDO 06          Short load global BASE6
   0181: CXP  06 01       Call external procedure FILEPROC.1
-> 0184: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FOPEN(PARAM1; PARAM2; PARAM3; PARAM4) (* P=5 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
BEGIN
-> 0190: SLDC 02          Short load constant 2
   0191: SLDO 04          Short load global BASE4
   0192: SLDO 03          Short load global BASE3
   0193: SLDO 02          Short load global BASE2
   0194: SLDO 01          Short load global BASE1
   0195: SLDO 05          Short load global BASE5
   0196: CXP  06 01       Call external procedure FILEPROC.1
-> 0199: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FCLOSE(PARAM1; PARAM2) (* P=6 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
  BASE5
  BASE6
BEGIN
-> 01a6: SLDC 03          Short load constant 3
   01a7: SLDO 02          Short load global BASE2
   01a8: LAO  0003        Load global BASE3
   01aa: SLDO 05          Short load global BASE5
   01ab: SLDO 06          Short load global BASE6
   01ac: SLDO 01          Short load global BASE1
   01ad: CXP  06 01       Call external procedure FILEPROC.1
-> 01b0: RBP  00          Return from base procedure
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
-> 01bc: LOD  01 0001     Load word at G1 (SYSCOM)
   01bf: SLDC 00          Short load constant 0
   01c0: STO              Store indirect (TOS into TOS-1)
   01c1: SLDO 01          Short load global BASE1
   01c2: SRO  000c        Store global word BASE12
   01c4: SLDO 0c          Short load global BASE12
   01c5: SIND 05          Short index load *TOS+5
   01c6: FJP  $03c0       Jump if TOS false
   01c8: SLDO 0c          Short load global BASE12
   01c9: IND  000e        Static index and load word (TOS+14)
   01cb: SLDC 00          Short load constant 0
   01cc: GRTI             Integer TOS-1 > TOS
   01cd: FJP  $01e1       Jump if TOS false
   01cf: SLDO 0c          Short load global BASE12
   01d0: INC  000e        Inc field ptr (TOS+14)
   01d2: SLDO 0c          Short load global BASE12
   01d3: IND  000e        Static index and load word (TOS+14)
   01d5: SLDC 01          Short load constant 1
   01d6: SBI              Subtract integers (TOS-1 - TOS)
   01d7: STO              Store indirect (TOS into TOS-1)
   01d8: SLDO 0c          Short load global BASE12
   01d9: IND  000e        Static index and load word (TOS+14)
   01db: SLDC 00          Short load constant 0
   01dc: GRTI             Integer TOS-1 > TOS
   01dd: FJP  $01e1       Jump if TOS false
   01df: UJP  $03cf       Unconditional jump
-> 01e1: SLDO 0c          Short load global BASE12
   01e2: IND  001d        Static index and load word (TOS+29)
   01e4: FJP  $02ae       Jump if TOS false
   01e6: SLDO 0c          Short load global BASE12
   01e7: INC  0010        Inc field ptr (TOS+16)
   01e9: SRO  000d        Store global word BASE13
   01eb: SLDO 0c          Short load global BASE12
   01ec: SIND 04          Short index load *TOS+4
   01ed: SRO  0006        Store global word BASE6
   01ef: SLDC 00          Short load constant 0
   01f0: SRO  0005        Store global word BASE5
-> 01f2: SLDO 0c          Short load global BASE12
   01f3: IND  000d        Static index and load word (TOS+13)
   01f5: SLDO 0c          Short load global BASE12
   01f6: IND  000c        Static index and load word (TOS+12)
   01f8: GEQI             Integer TOS-1 >= TOS
   01f9: FJP  $0215       Jump if TOS false
   01fb: SLDO 0c          Short load global BASE12
   01fc: IND  001f        Static index and load word (TOS+31)
   01fe: SLDO 06          Short load global BASE6
   01ff: ADI              Add integers (TOS + TOS-1)
   0200: SLDO 0c          Short load global BASE12
   0201: IND  001e        Static index and load word (TOS+30)
   0203: GRTI             Integer TOS-1 > TOS
   0204: FJP  $020a       Jump if TOS false
   0206: UJP  $03c5       Unconditional jump
   0208: UJP  $0213       Unconditional jump
-> 020a: SLDO 0d          Short load global BASE13
   020b: IND  000b        Static index and load word (TOS+11)
   020d: SLDO 0c          Short load global BASE12
   020e: IND  001f        Static index and load word (TOS+31)
   0210: SBI              Subtract integers (TOS-1 - TOS)
   0211: SRO  0004        Store global word BASE4
-> 0213: UJP  $021e       Unconditional jump
-> 0215: LDCI 0200        Load word 512
   0218: SLDO 0c          Short load global BASE12
   0219: IND  001f        Static index and load word (TOS+31)
   021b: SBI              Subtract integers (TOS-1 - TOS)
   021c: SRO  0004        Store global word BASE4
-> 021e: SLDO 06          Short load global BASE6
   021f: SRO  0003        Store global word BASE3
   0221: SLDO 03          Short load global BASE3
   0222: SLDO 04          Short load global BASE4
   0223: GRTI             Integer TOS-1 > TOS
   0224: FJP  $0229       Jump if TOS false
   0226: SLDO 04          Short load global BASE4
   0227: SRO  0003        Store global word BASE3
-> 0229: SLDO 03          Short load global BASE3
   022a: SLDC 00          Short load constant 0
   022b: GRTI             Integer TOS-1 > TOS
   022c: FJP  $024d       Jump if TOS false
   022e: SLDO 0c          Short load global BASE12
   022f: INC  0021        Inc field ptr (TOS+33)
   0231: SLDO 0c          Short load global BASE12
   0232: IND  001f        Static index and load word (TOS+31)
   0234: SLDO 0c          Short load global BASE12
   0235: SIND 00          Short index load *TOS+0
   0236: SLDO 05          Short load global BASE5
   0237: SLDO 03          Short load global BASE3
   0238: CSP  02          Call standard procedure MOVL
   023a: SLDO 0c          Short load global BASE12
   023b: INC  001f        Inc field ptr (TOS+31)
   023d: SLDO 0c          Short load global BASE12
   023e: IND  001f        Static index and load word (TOS+31)
   0240: SLDO 03          Short load global BASE3
   0241: ADI              Add integers (TOS + TOS-1)
   0242: STO              Store indirect (TOS into TOS-1)
   0243: SLDO 05          Short load global BASE5
   0244: SLDO 03          Short load global BASE3
   0245: ADI              Add integers (TOS + TOS-1)
   0246: SRO  0005        Store global word BASE5
   0248: SLDO 06          Short load global BASE6
   0249: SLDO 03          Short load global BASE3
   024a: SBI              Subtract integers (TOS-1 - TOS)
   024b: SRO  0006        Store global word BASE6
-> 024d: SLDO 06          Short load global BASE6
   024e: SLDC 00          Short load constant 0
   024f: EQUI             Integer TOS-1 = TOS
   0250: SRO  0008        Store global word BASE8
   0252: SLDO 08          Short load global BASE8
   0253: LNOT             Logical NOT (~TOS)
   0254: FJP  $02a9       Jump if TOS false
   0256: SLDO 0c          Short load global BASE12
   0257: IND  0020        Static index and load word (TOS+32)
   0259: FJP  $0279       Jump if TOS false
   025b: SLDO 0c          Short load global BASE12
   025c: INC  0020        Inc field ptr (TOS+32)
   025e: SLDC 00          Short load constant 0
   025f: STO              Store indirect (TOS into TOS-1)
   0260: SLDO 0c          Short load global BASE12
   0261: INC  000f        Inc field ptr (TOS+15)
   0263: SLDC 01          Short load constant 1
   0264: STO              Store indirect (TOS into TOS-1)
   0265: SLDO 0c          Short load global BASE12
   0266: SIND 07          Short index load *TOS+7
   0267: SLDO 0c          Short load global BASE12
   0268: INC  0021        Inc field ptr (TOS+33)
   026a: SLDC 00          Short load constant 0
   026b: LDCI 0200        Load word 512
   026e: SLDO 0d          Short load global BASE13
   026f: SIND 00          Short index load *TOS+0
   0270: SLDO 0c          Short load global BASE12
   0271: IND  000d        Static index and load word (TOS+13)
   0273: ADI              Add integers (TOS + TOS-1)
   0274: SLDC 01          Short load constant 1
   0275: SBI              Subtract integers (TOS-1 - TOS)
   0276: SLDC 00          Short load constant 0
   0277: CSP  06          Call standard procedure UNITWRITE
-> 0279: CSP  22          Call standard procedure IORESULT
   027b: SLDC 00          Short load constant 0
   027c: NEQI             Integer TOS-1 <> TOS
   027d: FJP  $0281       Jump if TOS false
   027f: UJP  $03c5       Unconditional jump
-> 0281: SLDO 0c          Short load global BASE12
   0282: SIND 07          Short index load *TOS+7
   0283: SLDO 0c          Short load global BASE12
   0284: INC  0021        Inc field ptr (TOS+33)
   0286: SLDC 00          Short load constant 0
   0287: LDCI 0200        Load word 512
   028a: SLDO 0d          Short load global BASE13
   028b: SIND 00          Short index load *TOS+0
   028c: SLDO 0c          Short load global BASE12
   028d: IND  000d        Static index and load word (TOS+13)
   028f: ADI              Add integers (TOS + TOS-1)
   0290: SLDC 00          Short load constant 0
   0291: CSP  05          Call standard procedure UNITREAD
   0293: CSP  22          Call standard procedure IORESULT
   0295: SLDC 00          Short load constant 0
   0296: NEQI             Integer TOS-1 <> TOS
   0297: FJP  $029b       Jump if TOS false
   0299: UJP  $03c5       Unconditional jump
-> 029b: SLDO 0c          Short load global BASE12
   029c: INC  000d        Inc field ptr (TOS+13)
   029e: SLDO 0c          Short load global BASE12
   029f: IND  000d        Static index and load word (TOS+13)
   02a1: SLDC 01          Short load constant 1
   02a2: ADI              Add integers (TOS + TOS-1)
   02a3: STO              Store indirect (TOS into TOS-1)
   02a4: SLDO 0c          Short load global BASE12
   02a5: INC  001f        Inc field ptr (TOS+31)
   02a7: SLDC 00          Short load constant 0
   02a8: STO              Store indirect (TOS into TOS-1)
-> 02a9: SLDO 08          Short load global BASE8
   02aa: FJP  $01f2       Jump if TOS false
   02ac: UJP  $0342       Unconditional jump
-> 02ae: SLDO 0c          Short load global BASE12
   02af: SIND 07          Short index load *TOS+7
   02b0: SLDC 01          Short load constant 1
   02b1: EQUI             Integer TOS-1 = TOS
   02b2: SRO  0009        Store global word BASE9
   02b4: SLDO 09          Short load global BASE9
   02b5: FJP  $02bc       Jump if TOS false
   02b7: SLDC 02          Short load constant 2
   02b8: SRO  0007        Store global word BASE7
   02ba: UJP  $02c0       Unconditional jump
-> 02bc: SLDO 0c          Short load global BASE12
   02bd: SIND 07          Short index load *TOS+7
   02be: SRO  0007        Store global word BASE7
-> 02c0: SLDC 01          Short load constant 1
   02c1: SRO  000a        Store global word BASE10
   02c3: SLDC 20          Short load constant 32
   02c4: SRO  000b        Store global word BASE11
   02c6: SLDC 00          Short load constant 0
   02c7: SRO  0002        Store global word BASE2
-> 02c9: SLDO 02          Short load global BASE2
   02ca: SLDO 0c          Short load global BASE12
   02cb: SIND 04          Short index load *TOS+4
   02cc: LESI             Integer TOS-1 < TOS
   02cd: SLDO 0a          Short load global BASE10
   02ce: LAND             Logical AND (TOS & TOS-1)
   02cf: FJP  $0342       Jump if TOS false
   02d1: SLDO 07          Short load global BASE7
   02d2: SLDC 06          Short load constant 6
   02d3: SLDC 01          Short load constant 1
   02d4: INN              Set membership (TOS-1 in set TOS)
   02d5: LOD  01 0154     Load word at G340
   02d9: LAND             Logical AND (TOS & TOS-1)
   02da: FJP  $02de       Jump if TOS false
   02dc: CLP  38          Call local procedure PASCALSY.56
-> 02de: SLDO 07          Short load global BASE7
   02df: SLDC 06          Short load constant 6
   02e0: SLDC 01          Short load constant 1
   02e1: INN              Set membership (TOS-1 in set TOS)
   02e2: LNOT             Logical NOT (~TOS)
   02e3: LOD  01 0154     Load word at G340
   02e7: LNOT             Logical NOT (~TOS)
   02e8: LOR              Logical OR (TOS | TOS-1)
   02e9: FJP  $02fc       Jump if TOS false
   02eb: SLDO 07          Short load global BASE7
   02ec: LAO  000b        Load global BASE11
   02ee: SLDC 00          Short load constant 0
   02ef: SLDC 01          Short load constant 1
   02f0: SLDC 00          Short load constant 0
   02f1: SLDC 00          Short load constant 0
   02f2: CSP  05          Call standard procedure UNITREAD
   02f4: CSP  22          Call standard procedure IORESULT
   02f6: SLDC 00          Short load constant 0
   02f7: NEQI             Integer TOS-1 <> TOS
   02f8: FJP  $02fc       Jump if TOS false
   02fa: UJP  $03c5       Unconditional jump
-> 02fc: LOD  01 0155     Load word at G341
   0300: FJP  $0305       Jump if TOS false
   0302: SLDO 0b          Short load global BASE11
   0303: CBP  2c          Call base procedure PASCALSY.44
-> 0305: SLDO 09          Short load global BASE9
   0306: FJP  $031e       Jump if TOS false
   0308: SLDO 0b          Short load global BASE11
   0309: LDA  01 010a     Load addr G266
   030d: LDM  10          Load 16 words from (TOS)
   030f: SLDC 10          Short load constant 16
   0310: INN              Set membership (TOS-1 in set TOS)
   0311: LNOT             Logical NOT (~TOS)
   0312: FJP  $031e       Jump if TOS false
   0314: SLDO 0c          Short load global BASE12
   0315: SIND 07          Short index load *TOS+7
   0316: LAO  000b        Load global BASE11
   0318: SLDC 00          Short load constant 0
   0319: SLDC 01          Short load constant 1
   031a: SLDC 00          Short load constant 0
   031b: SLDC 00          Short load constant 0
   031c: CSP  06          Call standard procedure UNITWRITE
-> 031e: SLDO 0b          Short load global BASE11
   031f: LOD  01 0001     Load word at G1 (SYSCOM)
   0322: INC  0029        Inc field ptr (TOS+41)
   0324: SLDC 08          Short load constant 8
   0325: SLDC 00          Short load constant 0
   0326: LDP              Load packed field (TOS)
   0327: EQUI             Integer TOS-1 = TOS
   0328: FJP  $0336       Jump if TOS false
   032a: SLDO 0c          Short load global BASE12
   032b: SIND 07          Short index load *TOS+7
   032c: SLDC 01          Short load constant 1
   032d: EQUI             Integer TOS-1 = TOS
   032e: FJP  $0333       Jump if TOS false
   0330: SLDC 00          Short load constant 0
   0331: SRO  000b        Store global word BASE11
-> 0333: SLDC 00          Short load constant 0
   0334: SRO  000a        Store global word BASE10
-> 0336: SLDO 0c          Short load global BASE12
   0337: SIND 00          Short index load *TOS+0
   0338: SLDO 02          Short load global BASE2
   0339: SLDO 0b          Short load global BASE11
   033a: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   033b: SLDO 02          Short load global BASE2
   033c: SLDC 01          Short load constant 1
   033d: ADI              Add integers (TOS + TOS-1)
   033e: SRO  0002        Store global word BASE2
   0340: UJP  $02c9       Unconditional jump
-> 0342: SLDO 0c          Short load global BASE12
   0343: SIND 04          Short index load *TOS+4
   0344: SLDC 01          Short load constant 1
   0345: EQUI             Integer TOS-1 = TOS
   0346: FJP  $03be       Jump if TOS false
   0348: SLDO 0c          Short load global BASE12
   0349: INC  0001        Inc field ptr (TOS+1)
   034b: SLDC 00          Short load constant 0
   034c: STO              Store indirect (TOS into TOS-1)
   034d: SLDO 0c          Short load global BASE12
   034e: SIND 03          Short index load *TOS+3
   034f: SLDC 00          Short load constant 0
   0350: NEQI             Integer TOS-1 <> TOS
   0351: FJP  $0358       Jump if TOS false
   0353: SLDO 0c          Short load global BASE12
   0354: INC  0003        Inc field ptr (TOS+3)
   0356: SLDC 02          Short load constant 2
   0357: STO              Store indirect (TOS into TOS-1)
-> 0358: SLDO 0c          Short load global BASE12
   0359: SIND 00          Short index load *TOS+0
   035a: SLDC 00          Short load constant 0
   035b: LDB              Load byte at byte ptr TOS-1 + TOS
   035c: SLDC 0d          Short load constant 13
   035d: EQUI             Integer TOS-1 = TOS
   035e: FJP  $036c       Jump if TOS false
   0360: SLDO 0c          Short load global BASE12
   0361: SIND 00          Short index load *TOS+0
   0362: SLDC 00          Short load constant 0
   0363: SLDC 20          Short load constant 32
   0364: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0365: SLDO 0c          Short load global BASE12
   0366: INC  0001        Inc field ptr (TOS+1)
   0368: SLDC 01          Short load constant 1
   0369: STO              Store indirect (TOS into TOS-1)
   036a: UJP  $03cf       Unconditional jump
-> 036c: SLDO 0c          Short load global BASE12
   036d: SIND 00          Short index load *TOS+0
   036e: SLDC 00          Short load constant 0
   036f: LDB              Load byte at byte ptr TOS-1 + TOS
   0370: SLDC 10          Short load constant 16
   0371: EQUI             Integer TOS-1 = TOS
   0372: SLDO 0c          Short load global BASE12
   0373: SIND 07          Short index load *TOS+7
   0374: SLDC 02          Short load constant 2
   0375: GRTI             Integer TOS-1 > TOS
   0376: LAND             Logical AND (TOS & TOS-1)
   0377: FJP  $039c       Jump if TOS false
   0379: SLDO 01          Short load global BASE1
   037a: CBP  07          Call base procedure PASCALSY.FGET
   037c: SLDO 0c          Short load global BASE12
   037d: SIND 00          Short index load *TOS+0
   037e: SLDC 00          Short load constant 0
   037f: LDB              Load byte at byte ptr TOS-1 + TOS
   0380: SLDC 20          Short load constant 32
   0381: SBI              Subtract integers (TOS-1 - TOS)
   0382: SRO  0003        Store global word BASE3
   0384: SLDO 03          Short load global BASE3
   0385: SLDC 00          Short load constant 0
   0386: GRTI             Integer TOS-1 > TOS
   0387: SLDO 03          Short load global BASE3
   0388: SLDC 7f          Short load constant 127
   0389: LEQI             Integer TOS-1 <= TOS
   038a: LAND             Logical AND (TOS & TOS-1)
   038b: FJP  $0399       Jump if TOS false
   038d: SLDO 0c          Short load global BASE12
   038e: SIND 00          Short index load *TOS+0
   038f: SLDC 00          Short load constant 0
   0390: SLDC 20          Short load constant 32
   0391: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0392: SLDO 0c          Short load global BASE12
   0393: INC  000e        Inc field ptr (TOS+14)
   0395: SLDO 03          Short load global BASE3
   0396: STO              Store indirect (TOS into TOS-1)
   0397: UJP  $03cf       Unconditional jump
-> 0399: SLDO 01          Short load global BASE1
   039a: CBP  07          Call base procedure PASCALSY.FGET
-> 039c: SLDO 0c          Short load global BASE12
   039d: SIND 00          Short index load *TOS+0
   039e: SLDC 00          Short load constant 0
   039f: LDB              Load byte at byte ptr TOS-1 + TOS
   03a0: SLDC 00          Short load constant 0
   03a1: EQUI             Integer TOS-1 = TOS
   03a2: FJP  $03be       Jump if TOS false
   03a4: SLDO 0c          Short load global BASE12
   03a5: IND  001d        Static index and load word (TOS+29)
   03a7: SLDO 0c          Short load global BASE12
   03a8: INC  0012        Inc field ptr (TOS+18)
   03aa: SLDC 04          Short load constant 4
   03ab: SLDC 00          Short load constant 0
   03ac: LDP              Load packed field (TOS)
   03ad: SLDC 03          Short load constant 3
   03ae: EQUI             Integer TOS-1 = TOS
   03af: LAND             Logical AND (TOS & TOS-1)
   03b0: FJP  $03b7       Jump if TOS false
   03b2: SLDO 01          Short load global BASE1
   03b3: CLP  37          Call local procedure PASCALSY.55
   03b5: UJP  $03be       Unconditional jump
-> 03b7: SLDO 0c          Short load global BASE12
   03b8: SIND 00          Short index load *TOS+0
   03b9: SLDC 00          Short load constant 0
   03ba: SLDC 20          Short load constant 32
   03bb: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   03bc: UJP  $03c5       Unconditional jump
-> 03be: UJP  $03cf       Unconditional jump
-> 03c0: LOD  01 0001     Load word at G1 (SYSCOM)
   03c3: SLDC 0d          Short load constant 13
   03c4: STO              Store indirect (TOS into TOS-1)
-> 03c5: SLDO 0c          Short load global BASE12
   03c6: INC  0002        Inc field ptr (TOS+2)
   03c8: SLDC 01          Short load constant 1
   03c9: STO              Store indirect (TOS into TOS-1)
   03ca: SLDO 0c          Short load global BASE12
   03cb: INC  0001        Inc field ptr (TOS+1)
   03cd: SLDC 01          Short load constant 1
   03ce: STO              Store indirect (TOS into TOS-1)
-> 03cf: RBP  00          Return from base procedure
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
-> 03ea: LOD  01 0001     Load word at G1 (SYSCOM)
   03ed: SLDC 00          Short load constant 0
   03ee: STO              Store indirect (TOS into TOS-1)
   03ef: SLDO 01          Short load global BASE1
   03f0: SRO  0007        Store global word BASE7
   03f2: SLDO 07          Short load global BASE7
   03f3: SIND 05          Short index load *TOS+5
   03f4: FJP  $0544       Jump if TOS false
   03f6: SLDO 07          Short load global BASE7
   03f7: IND  001d        Static index and load word (TOS+29)
   03f9: FJP  $052f       Jump if TOS false
   03fb: SLDO 07          Short load global BASE7
   03fc: INC  0010        Inc field ptr (TOS+16)
   03fe: SRO  0008        Store global word BASE8
   0400: SLDO 07          Short load global BASE7
   0401: SIND 04          Short index load *TOS+4
   0402: SRO  0005        Store global word BASE5
   0404: SLDC 00          Short load constant 0
   0405: SRO  0004        Store global word BASE4
-> 0407: SLDO 08          Short load global BASE8
   0408: SIND 00          Short index load *TOS+0
   0409: SLDO 07          Short load global BASE7
   040a: IND  000d        Static index and load word (TOS+13)
   040c: ADI              Add integers (TOS + TOS-1)
   040d: SLDO 08          Short load global BASE8
   040e: SIND 01          Short index load *TOS+1
   040f: EQUI             Integer TOS-1 = TOS
   0410: FJP  $0443       Jump if TOS false
   0412: SLDO 07          Short load global BASE7
   0413: IND  001f        Static index and load word (TOS+31)
   0415: SLDO 05          Short load global BASE5
   0416: ADI              Add integers (TOS + TOS-1)
   0417: SLDO 08          Short load global BASE8
   0418: IND  000b        Static index and load word (TOS+11)
   041a: GRTI             Integer TOS-1 > TOS
   041b: FJP  $0438       Jump if TOS false
   041d: SLDO 01          Short load global BASE1
   041e: SLDC 00          Short load constant 0
   041f: SLDC 00          Short load constant 0
   0420: CBP  35          Call base procedure PASCALSY.53
   0422: FJP  $042d       Jump if TOS false
   0424: LOD  01 0001     Load word at G1 (SYSCOM)
   0427: SLDC 08          Short load constant 8
   0428: STO              Store indirect (TOS into TOS-1)
   0429: UJP  $0549       Unconditional jump
   042b: UJP  $0436       Unconditional jump
-> 042d: LDCI 0200        Load word 512
   0430: SLDO 07          Short load global BASE7
   0431: IND  001f        Static index and load word (TOS+31)
   0433: SBI              Subtract integers (TOS-1 - TOS)
   0434: SRO  0003        Store global word BASE3
-> 0436: UJP  $0441       Unconditional jump
-> 0438: SLDO 08          Short load global BASE8
   0439: IND  000b        Static index and load word (TOS+11)
   043b: SLDO 07          Short load global BASE7
   043c: IND  001f        Static index and load word (TOS+31)
   043e: SBI              Subtract integers (TOS-1 - TOS)
   043f: SRO  0003        Store global word BASE3
-> 0441: UJP  $044c       Unconditional jump
-> 0443: LDCI 0200        Load word 512
   0446: SLDO 07          Short load global BASE7
   0447: IND  001f        Static index and load word (TOS+31)
   0449: SBI              Subtract integers (TOS-1 - TOS)
   044a: SRO  0003        Store global word BASE3
-> 044c: SLDO 05          Short load global BASE5
   044d: SRO  0002        Store global word BASE2
   044f: SLDO 02          Short load global BASE2
   0450: SLDO 03          Short load global BASE3
   0451: GRTI             Integer TOS-1 > TOS
   0452: FJP  $0457       Jump if TOS false
   0454: SLDO 03          Short load global BASE3
   0455: SRO  0002        Store global word BASE2
-> 0457: SLDO 02          Short load global BASE2
   0458: SLDC 00          Short load constant 0
   0459: GRTI             Integer TOS-1 > TOS
   045a: FJP  $0480       Jump if TOS false
   045c: SLDO 07          Short load global BASE7
   045d: INC  0020        Inc field ptr (TOS+32)
   045f: SLDC 01          Short load constant 1
   0460: STO              Store indirect (TOS into TOS-1)
   0461: SLDO 07          Short load global BASE7
   0462: SIND 00          Short index load *TOS+0
   0463: SLDO 04          Short load global BASE4
   0464: SLDO 07          Short load global BASE7
   0465: INC  0021        Inc field ptr (TOS+33)
   0467: SLDO 07          Short load global BASE7
   0468: IND  001f        Static index and load word (TOS+31)
   046a: SLDO 02          Short load global BASE2
   046b: CSP  02          Call standard procedure MOVL
   046d: SLDO 07          Short load global BASE7
   046e: INC  001f        Inc field ptr (TOS+31)
   0470: SLDO 07          Short load global BASE7
   0471: IND  001f        Static index and load word (TOS+31)
   0473: SLDO 02          Short load global BASE2
   0474: ADI              Add integers (TOS + TOS-1)
   0475: STO              Store indirect (TOS into TOS-1)
   0476: SLDO 04          Short load global BASE4
   0477: SLDO 02          Short load global BASE2
   0478: ADI              Add integers (TOS + TOS-1)
   0479: SRO  0004        Store global word BASE4
   047b: SLDO 05          Short load global BASE5
   047c: SLDO 02          Short load global BASE2
   047d: SBI              Subtract integers (TOS-1 - TOS)
   047e: SRO  0005        Store global word BASE5
-> 0480: SLDO 05          Short load global BASE5
   0481: SLDC 00          Short load constant 0
   0482: EQUI             Integer TOS-1 = TOS
   0483: SRO  0006        Store global word BASE6
   0485: SLDO 06          Short load global BASE6
   0486: LNOT             Logical NOT (~TOS)
   0487: FJP  $04f1       Jump if TOS false
   0489: SLDO 07          Short load global BASE7
   048a: IND  0020        Static index and load word (TOS+32)
   048c: FJP  $04ac       Jump if TOS false
   048e: SLDO 07          Short load global BASE7
   048f: INC  0020        Inc field ptr (TOS+32)
   0491: SLDC 00          Short load constant 0
   0492: STO              Store indirect (TOS into TOS-1)
   0493: SLDO 07          Short load global BASE7
   0494: INC  000f        Inc field ptr (TOS+15)
   0496: SLDC 01          Short load constant 1
   0497: STO              Store indirect (TOS into TOS-1)
   0498: SLDO 07          Short load global BASE7
   0499: SIND 07          Short index load *TOS+7
   049a: SLDO 07          Short load global BASE7
   049b: INC  0021        Inc field ptr (TOS+33)
   049d: SLDC 00          Short load constant 0
   049e: LDCI 0200        Load word 512
   04a1: SLDO 08          Short load global BASE8
   04a2: SIND 00          Short index load *TOS+0
   04a3: SLDO 07          Short load global BASE7
   04a4: IND  000d        Static index and load word (TOS+13)
   04a6: ADI              Add integers (TOS + TOS-1)
   04a7: SLDC 01          Short load constant 1
   04a8: SBI              Subtract integers (TOS-1 - TOS)
   04a9: SLDC 00          Short load constant 0
   04aa: CSP  06          Call standard procedure UNITWRITE
-> 04ac: CSP  22          Call standard procedure IORESULT
   04ae: SLDC 00          Short load constant 0
   04af: NEQI             Integer TOS-1 <> TOS
   04b0: FJP  $04b4       Jump if TOS false
   04b2: UJP  $0549       Unconditional jump
-> 04b4: SLDO 07          Short load global BASE7
   04b5: IND  000d        Static index and load word (TOS+13)
   04b7: SLDO 07          Short load global BASE7
   04b8: IND  000c        Static index and load word (TOS+12)
   04ba: LESI             Integer TOS-1 < TOS
   04bb: FJP  $04d1       Jump if TOS false
   04bd: SLDO 07          Short load global BASE7
   04be: SIND 07          Short index load *TOS+7
   04bf: SLDO 07          Short load global BASE7
   04c0: INC  0021        Inc field ptr (TOS+33)
   04c2: SLDC 00          Short load constant 0
   04c3: LDCI 0200        Load word 512
   04c6: SLDO 08          Short load global BASE8
   04c7: SIND 00          Short index load *TOS+0
   04c8: SLDO 07          Short load global BASE7
   04c9: IND  000d        Static index and load word (TOS+13)
   04cb: ADI              Add integers (TOS + TOS-1)
   04cc: SLDC 00          Short load constant 0
   04cd: CSP  05          Call standard procedure UNITREAD
   04cf: UJP  $04db       Unconditional jump
-> 04d1: SLDO 07          Short load global BASE7
   04d2: INC  0021        Inc field ptr (TOS+33)
   04d4: SLDC 00          Short load constant 0
   04d5: LDCI 0200        Load word 512
   04d8: SLDC 00          Short load constant 0
   04d9: CSP  0a          Call standard procedure FLCH
-> 04db: CSP  22          Call standard procedure IORESULT
   04dd: SLDC 00          Short load constant 0
   04de: NEQI             Integer TOS-1 <> TOS
   04df: FJP  $04e3       Jump if TOS false
   04e1: UJP  $0549       Unconditional jump
-> 04e3: SLDO 07          Short load global BASE7
   04e4: INC  000d        Inc field ptr (TOS+13)
   04e6: SLDO 07          Short load global BASE7
   04e7: IND  000d        Static index and load word (TOS+13)
   04e9: SLDC 01          Short load constant 1
   04ea: ADI              Add integers (TOS + TOS-1)
   04eb: STO              Store indirect (TOS into TOS-1)
   04ec: SLDO 07          Short load global BASE7
   04ed: INC  001f        Inc field ptr (TOS+31)
   04ef: SLDC 00          Short load constant 0
   04f0: STO              Store indirect (TOS into TOS-1)
-> 04f1: SLDO 06          Short load global BASE6
   04f2: FJP  $0407       Jump if TOS false
   04f4: SLDO 07          Short load global BASE7
   04f5: SIND 04          Short index load *TOS+4
   04f6: SLDC 01          Short load constant 1
   04f7: EQUI             Integer TOS-1 = TOS
   04f8: FJP  $052d       Jump if TOS false
   04fa: SLDO 07          Short load global BASE7
   04fb: SIND 00          Short index load *TOS+0
   04fc: SLDC 00          Short load constant 0
   04fd: LDB              Load byte at byte ptr TOS-1 + TOS
   04fe: SLDC 0d          Short load constant 13
   04ff: EQUI             Integer TOS-1 = TOS
   0500: FJP  $052d       Jump if TOS false
   0502: SLDO 08          Short load global BASE8
   0503: INC  0002        Inc field ptr (TOS+2)
   0505: SLDC 04          Short load constant 4
   0506: SLDC 00          Short load constant 0
   0507: LDP              Load packed field (TOS)
   0508: SLDC 03          Short load constant 3
   0509: EQUI             Integer TOS-1 = TOS
   050a: FJP  $052d       Jump if TOS false
   050c: SLDO 07          Short load global BASE7
   050d: IND  001f        Static index and load word (TOS+31)
   050f: LDCI 0200        Load word 512
   0512: SLDC 7f          Short load constant 127
   0513: SBI              Subtract integers (TOS-1 - TOS)
   0514: GEQI             Integer TOS-1 >= TOS
   0515: SLDO 07          Short load global BASE7
   0516: IND  000d        Static index and load word (TOS+13)
   0518: LNOT             Logical NOT (~TOS)
   0519: LAND             Logical AND (TOS & TOS-1)
   051a: FJP  $052d       Jump if TOS false
   051c: SLDO 07          Short load global BASE7
   051d: INC  001f        Inc field ptr (TOS+31)
   051f: LDCI 0200        Load word 512
   0522: SLDC 01          Short load constant 1
   0523: SBI              Subtract integers (TOS-1 - TOS)
   0524: STO              Store indirect (TOS into TOS-1)
   0525: SLDO 07          Short load global BASE7
   0526: SIND 00          Short index load *TOS+0
   0527: SLDC 00          Short load constant 0
   0528: SLDC 00          Short load constant 0
   0529: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   052a: SLDO 01          Short load global BASE1
   052b: CBP  08          Call base procedure PASCALSY.FPUT
-> 052d: UJP  $0542       Unconditional jump
-> 052f: SLDO 07          Short load global BASE7
   0530: SIND 07          Short index load *TOS+7
   0531: SLDO 07          Short load global BASE7
   0532: SIND 00          Short index load *TOS+0
   0533: SLDC 00          Short load constant 0
   0534: SLDO 07          Short load global BASE7
   0535: SIND 04          Short index load *TOS+4
   0536: SLDC 00          Short load constant 0
   0537: SLDC 00          Short load constant 0
   0538: CSP  06          Call standard procedure UNITWRITE
   053a: CSP  22          Call standard procedure IORESULT
   053c: SLDC 00          Short load constant 0
   053d: NEQI             Integer TOS-1 <> TOS
   053e: FJP  $0542       Jump if TOS false
   0540: UJP  $0549       Unconditional jump
-> 0542: UJP  $0553       Unconditional jump
-> 0544: LOD  01 0001     Load word at G1 (SYSCOM)
   0547: SLDC 0d          Short load constant 13
   0548: STO              Store indirect (TOS into TOS-1)
-> 0549: SLDO 07          Short load global BASE7
   054a: INC  0002        Inc field ptr (TOS+2)
   054c: SLDC 01          Short load constant 1
   054d: STO              Store indirect (TOS into TOS-1)
   054e: SLDO 07          Short load global BASE7
   054f: INC  0001        Inc field ptr (TOS+1)
   0551: SLDC 01          Short load constant 1
   0552: STO              Store indirect (TOS into TOS-1)
-> 0553: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XSEEK (* P=9 LL=0 *)
BEGIN
-> 0568: LOD  01 0001     Load word at G1 (SYSCOM)
   056b: INC  0001        Inc field ptr (TOS+1)
   056d: SLDC 0b          Short load constant 11
   056e: STO              Store indirect (TOS into TOS-1)
   056f: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 0571: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FEOF(PARAM1): RETVAL (* P=10 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
BEGIN
-> 057e: SLDO 03          Short load global BASE3
   057f: SIND 02          Short index load *TOS+2
   0580: SRO  0001        Store global word BASE1
-> 0582: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FEOLN(PARAM1): RETVAL (* P=11 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
BEGIN
-> 058e: SLDO 03          Short load global BASE3
   058f: SIND 01          Short index load *TOS+1
   0590: SRO  0001        Store global word BASE1
-> 0592: RBP  01          Return from base procedure
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
-> 059e: SLDO 02          Short load global BASE2
   059f: SRO  0030        Store global word BASE48
   05a1: LDO  0030        Load global word BASE48
   05a3: SIND 07          Short index load *TOS+7
   05a4: SLDC 01          Short load constant 1
   05a5: EQUI             Integer TOS-1 = TOS
   05a6: FJP  $05af       Jump if TOS false
   05a8: LAO  0007        Load global BASE7
   05aa: SLDC 00          Short load constant 0
   05ab: SLDC 51          Short load constant 81
   05ac: SLDC 50          Short load constant 80
   05ad: CSP  0a          Call standard procedure FLCH
-> 05af: SLDO 01          Short load global BASE1
   05b0: SLDC 00          Short load constant 0
   05b1: STO              Store indirect (TOS into TOS-1)
   05b2: SLDC 00          Short load constant 0
   05b3: SRO  0005        Store global word BASE5
   05b5: SLDC 00          Short load constant 0
   05b6: SRO  0004        Store global word BASE4
   05b8: LDO  0030        Load global word BASE48
   05ba: SIND 03          Short index load *TOS+3
   05bb: SLDC 01          Short load constant 1
   05bc: EQUI             Integer TOS-1 = TOS
   05bd: FJP  $05c2       Jump if TOS false
   05bf: SLDO 02          Short load global BASE2
   05c0: CBP  07          Call base procedure PASCALSY.FGET
-> 05c2: LDO  0030        Load global word BASE48
   05c4: SIND 00          Short index load *TOS+0
   05c5: SLDC 00          Short load constant 0
   05c6: LDB              Load byte at byte ptr TOS-1 + TOS
   05c7: SLDC 20          Short load constant 32
   05c8: EQUI             Integer TOS-1 = TOS
   05c9: LDO  0030        Load global word BASE48
   05cb: SIND 02          Short index load *TOS+2
   05cc: LNOT             Logical NOT (~TOS)
   05cd: LAND             Logical AND (TOS & TOS-1)
   05ce: FJP  $05d5       Jump if TOS false
   05d0: SLDO 02          Short load global BASE2
   05d1: CBP  07          Call base procedure PASCALSY.FGET
   05d3: UJP  $05c2       Unconditional jump
-> 05d5: LDO  0030        Load global word BASE48
   05d7: SIND 02          Short index load *TOS+2
   05d8: FJP  $05dc       Jump if TOS false
   05da: UJP  $067e       Unconditional jump
-> 05dc: LDO  0030        Load global word BASE48
   05de: SIND 00          Short index load *TOS+0
   05df: SLDC 00          Short load constant 0
   05e0: LDB              Load byte at byte ptr TOS-1 + TOS
   05e1: SRO  0003        Store global word BASE3
   05e3: SLDO 03          Short load global BASE3
   05e4: SLDC 2b          Short load constant 43
   05e5: EQUI             Integer TOS-1 = TOS
   05e6: SLDO 03          Short load global BASE3
   05e7: SLDC 2d          Short load constant 45
   05e8: EQUI             Integer TOS-1 = TOS
   05e9: LOR              Logical OR (TOS | TOS-1)
   05ea: FJP  $0600       Jump if TOS false
   05ec: SLDC 02          Short load constant 2
   05ed: SRO  0006        Store global word BASE6
   05ef: SLDO 03          Short load global BASE3
   05f0: SLDC 2d          Short load constant 45
   05f1: EQUI             Integer TOS-1 = TOS
   05f2: SRO  0005        Store global word BASE5
   05f4: SLDO 02          Short load global BASE2
   05f5: CBP  07          Call base procedure PASCALSY.FGET
   05f7: LDO  0030        Load global word BASE48
   05f9: SIND 00          Short index load *TOS+0
   05fa: SLDC 00          Short load constant 0
   05fb: LDB              Load byte at byte ptr TOS-1 + TOS
   05fc: SRO  0003        Store global word BASE3
   05fe: UJP  $0603       Unconditional jump
-> 0600: SLDC 01          Short load constant 1
   0601: SRO  0006        Store global word BASE6
-> 0603: SLDO 03          Short load global BASE3
   0604: LDA  01 007a     Load addr G122
   0607: LDM  04          Load 4 words from (TOS)
   0609: SLDC 04          Short load constant 4
   060a: INN              Set membership (TOS-1 in set TOS)
   060b: FJP  $0666       Jump if TOS false
   060d: SLDC 01          Short load constant 1
   060e: SRO  0004        Store global word BASE4
-> 0610: SLDO 01          Short load global BASE1
   0611: SLDO 01          Short load global BASE1
   0612: SIND 00          Short index load *TOS+0
   0613: SLDC 0a          Short load constant 10
   0614: MPI              Multiply integers (TOS * TOS-1)
   0615: SLDO 03          Short load global BASE3
   0616: ADI              Add integers (TOS + TOS-1)
   0617: SLDC 30          Short load constant 48
   0618: SBI              Subtract integers (TOS-1 - TOS)
   0619: STO              Store indirect (TOS into TOS-1)
   061a: SLDO 02          Short load global BASE2
   061b: CBP  07          Call base procedure PASCALSY.FGET
   061d: LDO  0030        Load global word BASE48
   061f: SIND 00          Short index load *TOS+0
   0620: SLDC 00          Short load constant 0
   0621: LDB              Load byte at byte ptr TOS-1 + TOS
   0622: SRO  0003        Store global word BASE3
   0624: SLDO 06          Short load global BASE6
   0625: SLDC 01          Short load constant 1
   0626: ADI              Add integers (TOS + TOS-1)
   0627: SRO  0006        Store global word BASE6
   0629: LDO  0030        Load global word BASE48
   062b: SIND 07          Short index load *TOS+7
   062c: SLDC 01          Short load constant 1
   062d: EQUI             Integer TOS-1 = TOS
   062e: FJP  $0657       Jump if TOS false
-> 0630: SLDO 03          Short load global BASE3
   0631: LAO  0006        Load global BASE6
   0633: LAO  0007        Load global BASE7
   0635: SLDC 00          Short load constant 0
   0636: SLDC 00          Short load constant 0
   0637: CBP  34          Call base procedure PASCALSY.52
   0639: FJP  $0657       Jump if TOS false
   063b: SLDO 06          Short load global BASE6
   063c: SLDC 01          Short load constant 1
   063d: EQUI             Integer TOS-1 = TOS
   063e: FJP  $0645       Jump if TOS false
   0640: SLDO 01          Short load global BASE1
   0641: SLDC 00          Short load constant 0
   0642: STO              Store indirect (TOS into TOS-1)
   0643: UJP  $064b       Unconditional jump
-> 0645: SLDO 01          Short load global BASE1
   0646: SLDO 01          Short load global BASE1
   0647: SIND 00          Short index load *TOS+0
   0648: SLDC 0a          Short load constant 10
   0649: DVI              Divide integers (TOS-1 / TOS)
   064a: STO              Store indirect (TOS into TOS-1)
-> 064b: SLDO 02          Short load global BASE2
   064c: CBP  07          Call base procedure PASCALSY.FGET
   064e: LDO  0030        Load global word BASE48
   0650: SIND 00          Short index load *TOS+0
   0651: SLDC 00          Short load constant 0
   0652: LDB              Load byte at byte ptr TOS-1 + TOS
   0653: SRO  0003        Store global word BASE3
   0655: UJP  $0630       Unconditional jump
-> 0657: SLDO 03          Short load global BASE3
   0658: LDA  01 007a     Load addr G122
   065b: LDM  04          Load 4 words from (TOS)
   065d: SLDC 04          Short load constant 4
   065e: INN              Set membership (TOS-1 in set TOS)
   065f: LNOT             Logical NOT (~TOS)
   0660: LDO  0030        Load global word BASE48
   0662: SIND 01          Short index load *TOS+1
   0663: LOR              Logical OR (TOS | TOS-1)
   0664: FJP  $0610       Jump if TOS false
-> 0666: SLDO 04          Short load global BASE4
   0667: LDO  0030        Load global word BASE48
   0669: SIND 02          Short index load *TOS+2
   066a: LOR              Logical OR (TOS | TOS-1)
   066b: FJP  $0679       Jump if TOS false
   066d: SLDO 05          Short load global BASE5
   066e: FJP  $0677       Jump if TOS false
   0670: SLDO 01          Short load global BASE1
   0671: SLDO 01          Short load global BASE1
   0672: SIND 00          Short index load *TOS+0
   0673: NGI              Negate integer
   0674: STO              Store indirect (TOS into TOS-1)
   0675: UJP  $0677       Unconditional jump
-> 0677: UJP  $067e       Unconditional jump
-> 0679: LOD  01 0001     Load word at G1 (SYSCOM)
   067c: SLDC 0e          Short load constant 14
   067d: STO              Store indirect (TOS into TOS-1)
-> 067e: RBP  00          Return from base procedure
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
-> 0692: SLDC 01          Short load constant 1
   0693: SRO  0004        Store global word BASE4
   0695: LAO  0008        Load global BASE8
   0697: SLDC 00          Short load constant 0
   0698: SLDC 0a          Short load constant 10
   0699: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   069a: SLDC 01          Short load constant 1
   069b: SRO  0007        Store global word BASE7
   069d: SLDO 02          Short load global BASE2
   069e: SLDC 00          Short load constant 0
   069f: LESI             Integer TOS-1 < TOS
   06a0: FJP  $06c9       Jump if TOS false
   06a2: SLDO 02          Short load global BASE2
   06a3: LDCI 7fff        Load word 32767
   06a6: NGI              Negate integer
   06a7: SLDC 01          Short load constant 1
   06a8: SBI              Subtract integers (TOS-1 - TOS)
   06a9: EQUI             Integer TOS-1 = TOS
   06aa: FJP  $06bd       Jump if TOS false
   06ac: LAO  0008        Load global BASE8
   06ae: NOP              No operation
   06af: LSA  06          Load string address: '-32768'
   06b7: SAS  0a          String assign (TOS to TOS-1, 10 chars)
   06b9: UJP  $0719       Unconditional jump
   06bb: UJP  $06c9       Unconditional jump
-> 06bd: SLDO 02          Short load global BASE2
   06be: ABI              Absolute value of integer (TOS)
   06bf: SRO  0002        Store global word BASE2
   06c1: LAO  0008        Load global BASE8
   06c3: SLDC 01          Short load constant 1
   06c4: SLDC 2d          Short load constant 45
   06c5: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   06c6: SLDC 02          Short load constant 2
   06c7: SRO  0004        Store global word BASE4
-> 06c9: SLDC 04          Short load constant 4
   06ca: SRO  0005        Store global word BASE5
   06cc: SLDC 00          Short load constant 0
   06cd: SRO  000e        Store global word BASE14
-> 06cf: SLDO 05          Short load global BASE5
   06d0: SLDO 0e          Short load global BASE14
   06d1: GEQI             Integer TOS-1 >= TOS
   06d2: FJP  $0712       Jump if TOS false
   06d4: SLDO 02          Short load global BASE2
   06d5: LDA  01 006f     Load addr G111
   06d8: SLDO 05          Short load global BASE5
   06d9: IXA  0001        Index array (TOS-1 + TOS * 1)
   06db: SIND 00          Short index load *TOS+0
   06dc: DVI              Divide integers (TOS-1 / TOS)
   06dd: SLDC 30          Short load constant 48
   06de: ADI              Add integers (TOS + TOS-1)
   06df: SRO  0006        Store global word BASE6
   06e1: SLDO 06          Short load global BASE6
   06e2: SLDC 30          Short load constant 48
   06e3: EQUI             Integer TOS-1 = TOS
   06e4: SLDO 05          Short load global BASE5
   06e5: SLDC 00          Short load constant 0
   06e6: GRTI             Integer TOS-1 > TOS
   06e7: LAND             Logical AND (TOS & TOS-1)
   06e8: SLDO 07          Short load global BASE7
   06e9: LAND             Logical AND (TOS & TOS-1)
   06ea: FJP  $06ee       Jump if TOS false
   06ec: UJP  $070b       Unconditional jump
-> 06ee: SLDC 00          Short load constant 0
   06ef: SRO  0007        Store global word BASE7
   06f1: LAO  0008        Load global BASE8
   06f3: SLDO 04          Short load global BASE4
   06f4: SLDO 06          Short load global BASE6
   06f5: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   06f6: SLDO 04          Short load global BASE4
   06f7: SLDC 01          Short load constant 1
   06f8: ADI              Add integers (TOS + TOS-1)
   06f9: SRO  0004        Store global word BASE4
   06fb: SLDO 06          Short load global BASE6
   06fc: SLDC 30          Short load constant 48
   06fd: NEQI             Integer TOS-1 <> TOS
   06fe: FJP  $070b       Jump if TOS false
   0700: SLDO 02          Short load global BASE2
   0701: LDA  01 006f     Load addr G111
   0704: SLDO 05          Short load global BASE5
   0705: IXA  0001        Index array (TOS-1 + TOS * 1)
   0707: SIND 00          Short index load *TOS+0
   0708: MODI             Modulo integers (TOS-1 % TOS)
   0709: SRO  0002        Store global word BASE2
-> 070b: SLDO 05          Short load global BASE5
   070c: SLDC 01          Short load constant 1
   070d: SBI              Subtract integers (TOS-1 - TOS)
   070e: SRO  0005        Store global word BASE5
   0710: UJP  $06cf       Unconditional jump
-> 0712: LAO  0008        Load global BASE8
   0714: SLDC 00          Short load constant 0
   0715: SLDO 04          Short load global BASE4
   0716: SLDC 01          Short load constant 1
   0717: SBI              Subtract integers (TOS-1 - TOS)
   0718: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0719: SLDO 01          Short load global BASE1
   071a: LAO  0008        Load global BASE8
   071c: SLDC 00          Short load constant 0
   071d: LDB              Load byte at byte ptr TOS-1 + TOS
   071e: LESI             Integer TOS-1 < TOS
   071f: FJP  $0727       Jump if TOS false
   0721: LAO  0008        Load global BASE8
   0723: SLDC 00          Short load constant 0
   0724: LDB              Load byte at byte ptr TOS-1 + TOS
   0725: SRO  0001        Store global word BASE1
-> 0727: SLDO 03          Short load global BASE3
   0728: LAO  0008        Load global BASE8
   072a: SLDO 01          Short load global BASE1
   072b: CBP  13          Call base procedure PASCALSY.FWRITESTRING
-> 072d: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XREADREAL (* P=14 LL=0 *)
BEGIN
-> 073c: LOD  01 0001     Load word at G1 (SYSCOM)
   073f: INC  0001        Inc field ptr (TOS+1)
   0741: SLDC 0b          Short load constant 11
   0742: STO              Store indirect (TOS into TOS-1)
   0743: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 0745: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.XWRITEREAL (* P=15 LL=0 *)
BEGIN
-> 0752: LOD  01 0001     Load word at G1 (SYSCOM)
   0755: INC  0001        Inc field ptr (TOS+1)
   0757: SLDC 0b          Short load constant 11
   0758: STO              Store indirect (TOS into TOS-1)
   0759: CBP  02          Call base procedure PASCALSY.EXECERROR
-> 075b: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADCHAR(PARAM1; PARAM2) (* P=16 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0768: SLDO 02          Short load global BASE2
   0769: SRO  0003        Store global word BASE3
   076b: LOD  01 0001     Load word at G1 (SYSCOM)
   076e: SLDC 00          Short load constant 0
   076f: STO              Store indirect (TOS into TOS-1)
   0770: SLDO 03          Short load global BASE3
   0771: SIND 03          Short index load *TOS+3
   0772: SLDC 01          Short load constant 1
   0773: EQUI             Integer TOS-1 = TOS
   0774: FJP  $0779       Jump if TOS false
   0776: SLDO 02          Short load global BASE2
   0777: CBP  07          Call base procedure PASCALSY.FGET
-> 0779: SLDO 01          Short load global BASE1
   077a: SLDO 03          Short load global BASE3
   077b: SIND 00          Short index load *TOS+0
   077c: SLDC 00          Short load constant 0
   077d: LDB              Load byte at byte ptr TOS-1 + TOS
   077e: STO              Store indirect (TOS into TOS-1)
   077f: SLDO 03          Short load global BASE3
   0780: SIND 03          Short index load *TOS+3
   0781: SLDC 00          Short load constant 0
   0782: EQUI             Integer TOS-1 = TOS
   0783: FJP  $078a       Jump if TOS false
   0785: SLDO 02          Short load global BASE2
   0786: CBP  07          Call base procedure PASCALSY.FGET
   0788: UJP  $078f       Unconditional jump
-> 078a: SLDO 03          Short load global BASE3
   078b: INC  0003        Inc field ptr (TOS+3)
   078d: SLDC 01          Short load constant 1
   078e: STO              Store indirect (TOS into TOS-1)
-> 078f: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITECHAR(PARAM1; PARAM2; PARAM3) (* P=17 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 079c: SLDO 03          Short load global BASE3
   079d: SRO  0004        Store global word BASE4
   079f: SLDO 04          Short load global BASE4
   07a0: SIND 05          Short index load *TOS+5
   07a1: FJP  $07f2       Jump if TOS false
   07a3: SLDO 04          Short load global BASE4
   07a4: IND  001d        Static index and load word (TOS+29)
   07a6: FJP  $07c6       Jump if TOS false
-> 07a8: SLDO 01          Short load global BASE1
   07a9: SLDC 01          Short load constant 1
   07aa: GRTI             Integer TOS-1 > TOS
   07ab: FJP  $07bc       Jump if TOS false
   07ad: SLDO 04          Short load global BASE4
   07ae: SIND 00          Short index load *TOS+0
   07af: SLDC 00          Short load constant 0
   07b0: SLDC 20          Short load constant 32
   07b1: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   07b2: SLDO 03          Short load global BASE3
   07b3: CBP  08          Call base procedure PASCALSY.FPUT
   07b5: SLDO 01          Short load global BASE1
   07b6: SLDC 01          Short load constant 1
   07b7: SBI              Subtract integers (TOS-1 - TOS)
   07b8: SRO  0001        Store global word BASE1
   07ba: UJP  $07a8       Unconditional jump
-> 07bc: SLDO 04          Short load global BASE4
   07bd: SIND 00          Short index load *TOS+0
   07be: SLDC 00          Short load constant 0
   07bf: SLDO 02          Short load global BASE2
   07c0: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   07c1: SLDO 03          Short load global BASE3
   07c2: CBP  08          Call base procedure PASCALSY.FPUT
   07c4: UJP  $07f0       Unconditional jump
-> 07c6: SLDO 01          Short load global BASE1
   07c7: SLDC 01          Short load constant 1
   07c8: GRTI             Integer TOS-1 > TOS
   07c9: FJP  $07e1       Jump if TOS false
   07cb: SLDO 04          Short load global BASE4
   07cc: SIND 00          Short index load *TOS+0
   07cd: SLDC 00          Short load constant 0
   07ce: SLDC 20          Short load constant 32
   07cf: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   07d0: SLDO 04          Short load global BASE4
   07d1: SIND 07          Short index load *TOS+7
   07d2: SLDO 04          Short load global BASE4
   07d3: SIND 00          Short index load *TOS+0
   07d4: SLDC 00          Short load constant 0
   07d5: SLDC 01          Short load constant 1
   07d6: SLDC 00          Short load constant 0
   07d7: SLDC 00          Short load constant 0
   07d8: CSP  06          Call standard procedure UNITWRITE
   07da: SLDO 01          Short load global BASE1
   07db: SLDC 01          Short load constant 1
   07dc: SBI              Subtract integers (TOS-1 - TOS)
   07dd: SRO  0001        Store global word BASE1
   07df: UJP  $07c6       Unconditional jump
-> 07e1: SLDO 04          Short load global BASE4
   07e2: SIND 00          Short index load *TOS+0
   07e3: SLDC 00          Short load constant 0
   07e4: SLDO 02          Short load global BASE2
   07e5: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   07e6: SLDO 04          Short load global BASE4
   07e7: SIND 07          Short index load *TOS+7
   07e8: SLDO 04          Short load global BASE4
   07e9: SIND 00          Short index load *TOS+0
   07ea: SLDC 00          Short load constant 0
   07eb: SLDC 01          Short load constant 1
   07ec: SLDC 00          Short load constant 0
   07ed: SLDC 00          Short load constant 0
   07ee: CSP  06          Call standard procedure UNITWRITE
-> 07f0: UJP  $07f7       Unconditional jump
-> 07f2: LOD  01 0001     Load word at G1 (SYSCOM)
   07f5: SLDC 0d          Short load constant 13
   07f6: STO              Store indirect (TOS into TOS-1)
-> 07f7: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADSTRING(PARAM1; PARAM2; PARAM3) (* P=18 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 0808: SLDO 03          Short load global BASE3
   0809: SRO  0006        Store global word BASE6
   080b: SLDC 01          Short load constant 1
   080c: SRO  0004        Store global word BASE4
   080e: SLDO 06          Short load global BASE6
   080f: SIND 03          Short index load *TOS+3
   0810: SLDC 01          Short load constant 1
   0811: EQUI             Integer TOS-1 = TOS
   0812: FJP  $0817       Jump if TOS false
   0814: SLDO 03          Short load global BASE3
   0815: CBP  07          Call base procedure PASCALSY.FGET
-> 0817: SLDO 02          Short load global BASE2
   0818: SLDC 00          Short load constant 0
   0819: SLDO 01          Short load global BASE1
   081a: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 081b: SLDO 04          Short load global BASE4
   081c: SLDO 01          Short load global BASE1
   081d: LEQI             Integer TOS-1 <= TOS
   081e: SLDO 06          Short load global BASE6
   081f: SIND 01          Short index load *TOS+1
   0820: SLDO 06          Short load global BASE6
   0821: SIND 02          Short index load *TOS+2
   0822: LOR              Logical OR (TOS | TOS-1)
   0823: LNOT             Logical NOT (~TOS)
   0824: LAND             Logical AND (TOS & TOS-1)
   0825: FJP  $0858       Jump if TOS false
   0827: SLDO 06          Short load global BASE6
   0828: SIND 00          Short index load *TOS+0
   0829: SLDC 00          Short load constant 0
   082a: LDB              Load byte at byte ptr TOS-1 + TOS
   082b: SRO  0005        Store global word BASE5
   082d: SLDO 06          Short load global BASE6
   082e: SIND 07          Short index load *TOS+7
   082f: SLDC 01          Short load constant 1
   0830: EQUI             Integer TOS-1 = TOS
   0831: FJP  $084a       Jump if TOS false
   0833: SLDO 05          Short load global BASE5
   0834: LAO  0004        Load global BASE4
   0836: SLDO 02          Short load global BASE2
   0837: SLDC 00          Short load constant 0
   0838: SLDC 00          Short load constant 0
   0839: CBP  34          Call base procedure PASCALSY.52
   083b: FJP  $083f       Jump if TOS false
   083d: UJP  $0848       Unconditional jump
-> 083f: SLDO 02          Short load global BASE2
   0840: SLDO 04          Short load global BASE4
   0841: SLDO 05          Short load global BASE5
   0842: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0843: SLDO 04          Short load global BASE4
   0844: SLDC 01          Short load constant 1
   0845: ADI              Add integers (TOS + TOS-1)
   0846: SRO  0004        Store global word BASE4
-> 0848: UJP  $0853       Unconditional jump
-> 084a: SLDO 02          Short load global BASE2
   084b: SLDO 04          Short load global BASE4
   084c: SLDO 05          Short load global BASE5
   084d: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   084e: SLDO 04          Short load global BASE4
   084f: SLDC 01          Short load constant 1
   0850: ADI              Add integers (TOS + TOS-1)
   0851: SRO  0004        Store global word BASE4
-> 0853: SLDO 03          Short load global BASE3
   0854: CBP  07          Call base procedure PASCALSY.FGET
   0856: UJP  $081b       Unconditional jump
-> 0858: SLDO 02          Short load global BASE2
   0859: SLDC 00          Short load constant 0
   085a: SLDO 04          Short load global BASE4
   085b: SLDC 01          Short load constant 1
   085c: SBI              Subtract integers (TOS-1 - TOS)
   085d: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 085e: SLDO 06          Short load global BASE6
   085f: SIND 01          Short index load *TOS+1
   0860: LNOT             Logical NOT (~TOS)
   0861: FJP  $0868       Jump if TOS false
   0863: SLDO 03          Short load global BASE3
   0864: CBP  07          Call base procedure PASCALSY.FGET
   0866: UJP  $085e       Unconditional jump
-> 0868: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITESTRING(PARAM1; PARAM2; PARAM3) (* P=19 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 0878: SLDO 03          Short load global BASE3
   0879: SRO  0005        Store global word BASE5
   087b: SLDO 05          Short load global BASE5
   087c: SIND 05          Short index load *TOS+5
   087d: FJP  $08cc       Jump if TOS false
   087f: SLDO 01          Short load global BASE1
   0880: SLDC 00          Short load constant 0
   0881: LEQI             Integer TOS-1 <= TOS
   0882: FJP  $0889       Jump if TOS false
   0884: SLDO 02          Short load global BASE2
   0885: SLDC 00          Short load constant 0
   0886: LDB              Load byte at byte ptr TOS-1 + TOS
   0887: SRO  0001        Store global word BASE1
-> 0889: SLDO 01          Short load global BASE1
   088a: SLDO 02          Short load global BASE2
   088b: SLDC 00          Short load constant 0
   088c: LDB              Load byte at byte ptr TOS-1 + TOS
   088d: GRTI             Integer TOS-1 > TOS
   088e: FJP  $089e       Jump if TOS false
   0890: SLDO 03          Short load global BASE3
   0891: SLDC 20          Short load constant 32
   0892: SLDO 01          Short load global BASE1
   0893: SLDO 02          Short load global BASE2
   0894: SLDC 00          Short load constant 0
   0895: LDB              Load byte at byte ptr TOS-1 + TOS
   0896: SBI              Subtract integers (TOS-1 - TOS)
   0897: CBP  11          Call base procedure PASCALSY.FWRITECHAR
   0899: SLDO 02          Short load global BASE2
   089a: SLDC 00          Short load constant 0
   089b: LDB              Load byte at byte ptr TOS-1 + TOS
   089c: SRO  0001        Store global word BASE1
-> 089e: SLDO 05          Short load global BASE5
   089f: IND  001d        Static index and load word (TOS+29)
   08a1: FJP  $08c1       Jump if TOS false
   08a3: SLDC 01          Short load constant 1
   08a4: SRO  0004        Store global word BASE4
   08a6: SLDO 01          Short load global BASE1
   08a7: SRO  0006        Store global word BASE6
-> 08a9: SLDO 04          Short load global BASE4
   08aa: SLDO 06          Short load global BASE6
   08ab: LEQI             Integer TOS-1 <= TOS
   08ac: FJP  $08bf       Jump if TOS false
   08ae: SLDO 05          Short load global BASE5
   08af: SIND 00          Short index load *TOS+0
   08b0: SLDC 00          Short load constant 0
   08b1: SLDO 02          Short load global BASE2
   08b2: SLDO 04          Short load global BASE4
   08b3: LDB              Load byte at byte ptr TOS-1 + TOS
   08b4: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   08b5: SLDO 03          Short load global BASE3
   08b6: CBP  08          Call base procedure PASCALSY.FPUT
   08b8: SLDO 04          Short load global BASE4
   08b9: SLDC 01          Short load constant 1
   08ba: ADI              Add integers (TOS + TOS-1)
   08bb: SRO  0004        Store global word BASE4
   08bd: UJP  $08a9       Unconditional jump
-> 08bf: UJP  $08ca       Unconditional jump
-> 08c1: SLDO 05          Short load global BASE5
   08c2: SIND 07          Short index load *TOS+7
   08c3: SLDO 02          Short load global BASE2
   08c4: SLDC 01          Short load constant 1
   08c5: SLDO 01          Short load global BASE1
   08c6: SLDC 00          Short load constant 0
   08c7: SLDC 00          Short load constant 0
   08c8: CSP  06          Call standard procedure UNITWRITE
-> 08ca: UJP  $08d1       Unconditional jump
-> 08cc: LOD  01 0001     Load word at G1 (SYSCOM)
   08cf: SLDC 0d          Short load constant 13
   08d0: STO              Store indirect (TOS into TOS-1)
-> 08d1: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITEBYTES(PARAM1; PARAM2; PARAM3; PARAM4) (* P=20 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
  BASE6
BEGIN
-> 08e0: SLDO 04          Short load global BASE4
   08e1: SRO  0006        Store global word BASE6
   08e3: SLDO 06          Short load global BASE6
   08e4: SIND 05          Short index load *TOS+5
   08e5: FJP  $0925       Jump if TOS false
   08e7: SLDO 02          Short load global BASE2
   08e8: SLDO 01          Short load global BASE1
   08e9: GRTI             Integer TOS-1 > TOS
   08ea: FJP  $08f6       Jump if TOS false
   08ec: SLDO 04          Short load global BASE4
   08ed: SLDC 20          Short load constant 32
   08ee: SLDO 02          Short load global BASE2
   08ef: SLDO 01          Short load global BASE1
   08f0: SBI              Subtract integers (TOS-1 - TOS)
   08f1: CBP  11          Call base procedure PASCALSY.FWRITECHAR
   08f3: SLDO 01          Short load global BASE1
   08f4: SRO  0002        Store global word BASE2
-> 08f6: SLDO 06          Short load global BASE6
   08f7: IND  001d        Static index and load word (TOS+29)
   08f9: FJP  $091a       Jump if TOS false
   08fb: SLDC 00          Short load constant 0
   08fc: SRO  0005        Store global word BASE5
-> 08fe: SLDO 05          Short load global BASE5
   08ff: SLDO 02          Short load global BASE2
   0900: LESI             Integer TOS-1 < TOS
   0901: SLDO 06          Short load global BASE6
   0902: SIND 02          Short index load *TOS+2
   0903: LNOT             Logical NOT (~TOS)
   0904: LAND             Logical AND (TOS & TOS-1)
   0905: FJP  $0918       Jump if TOS false
   0907: SLDO 06          Short load global BASE6
   0908: SIND 00          Short index load *TOS+0
   0909: SLDC 00          Short load constant 0
   090a: SLDO 03          Short load global BASE3
   090b: SLDO 05          Short load global BASE5
   090c: LDB              Load byte at byte ptr TOS-1 + TOS
   090d: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   090e: SLDO 04          Short load global BASE4
   090f: CBP  08          Call base procedure PASCALSY.FPUT
   0911: SLDO 05          Short load global BASE5
   0912: SLDC 01          Short load constant 1
   0913: ADI              Add integers (TOS + TOS-1)
   0914: SRO  0005        Store global word BASE5
   0916: UJP  $08fe       Unconditional jump
-> 0918: UJP  $0923       Unconditional jump
-> 091a: SLDO 06          Short load global BASE6
   091b: SIND 07          Short index load *TOS+7
   091c: SLDO 03          Short load global BASE3
   091d: SLDC 00          Short load constant 0
   091e: SLDO 02          Short load global BASE2
   091f: SLDC 00          Short load constant 0
   0920: SLDC 00          Short load constant 0
   0921: CSP  06          Call standard procedure UNITWRITE
-> 0923: UJP  $092a       Unconditional jump
-> 0925: LOD  01 0001     Load word at G1 (SYSCOM)
   0928: SLDC 0d          Short load constant 13
   0929: STO              Store indirect (TOS into TOS-1)
-> 092a: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FREADLN(PARAM1) (* P=21 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 0938: SLDO 01          Short load global BASE1
   0939: SIND 01          Short index load *TOS+1
   093a: LNOT             Logical NOT (~TOS)
   093b: FJP  $0942       Jump if TOS false
   093d: SLDO 01          Short load global BASE1
   093e: CBP  07          Call base procedure PASCALSY.FGET
   0940: UJP  $0938       Unconditional jump
-> 0942: SLDO 01          Short load global BASE1
   0943: SIND 03          Short index load *TOS+3
   0944: SLDC 00          Short load constant 0
   0945: EQUI             Integer TOS-1 = TOS
   0946: FJP  $094d       Jump if TOS false
   0948: SLDO 01          Short load global BASE1
   0949: CBP  07          Call base procedure PASCALSY.FGET
   094b: UJP  $0957       Unconditional jump
-> 094d: SLDO 01          Short load global BASE1
   094e: INC  0003        Inc field ptr (TOS+3)
   0950: SLDC 01          Short load constant 1
   0951: STO              Store indirect (TOS into TOS-1)
   0952: SLDO 01          Short load global BASE1
   0953: INC  0001        Inc field ptr (TOS+1)
   0955: SLDC 00          Short load constant 0
   0956: STO              Store indirect (TOS into TOS-1)
-> 0957: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.FWRITELN(PARAM1) (* P=22 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 0966: SLDO 01          Short load global BASE1
   0967: SIND 00          Short index load *TOS+0
   0968: SLDC 00          Short load constant 0
   0969: SLDC 0d          Short load constant 13
   096a: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   096b: SLDO 01          Short load global BASE1
   096c: CBP  08          Call base procedure PASCALSY.FPUT
-> 096e: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCONCAT(PARAM1; PARAM2; PARAM3) (* P=23 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
BEGIN
-> 097a: SLDO 02          Short load global BASE2
   097b: SLDC 00          Short load constant 0
   097c: LDB              Load byte at byte ptr TOS-1 + TOS
   097d: SLDO 03          Short load global BASE3
   097e: SLDC 00          Short load constant 0
   097f: LDB              Load byte at byte ptr TOS-1 + TOS
   0980: ADI              Add integers (TOS + TOS-1)
   0981: SLDO 01          Short load global BASE1
   0982: LEQI             Integer TOS-1 <= TOS
   0983: FJP  $099c       Jump if TOS false
   0985: SLDO 02          Short load global BASE2
   0986: SLDC 01          Short load constant 1
   0987: SLDO 03          Short load global BASE3
   0988: SLDO 03          Short load global BASE3
   0989: SLDC 00          Short load constant 0
   098a: LDB              Load byte at byte ptr TOS-1 + TOS
   098b: SLDC 01          Short load constant 1
   098c: ADI              Add integers (TOS + TOS-1)
   098d: SLDO 02          Short load global BASE2
   098e: SLDC 00          Short load constant 0
   098f: LDB              Load byte at byte ptr TOS-1 + TOS
   0990: CSP  02          Call standard procedure MOVL
   0992: SLDO 03          Short load global BASE3
   0993: SLDC 00          Short load constant 0
   0994: SLDO 02          Short load global BASE2
   0995: SLDC 00          Short load constant 0
   0996: LDB              Load byte at byte ptr TOS-1 + TOS
   0997: SLDO 03          Short load global BASE3
   0998: SLDC 00          Short load constant 0
   0999: LDB              Load byte at byte ptr TOS-1 + TOS
   099a: ADI              Add integers (TOS + TOS-1)
   099b: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 099c: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SINSERT(PARAM1; PARAM2; PARAM3; PARAM4) (* P=24 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
  BASE5
BEGIN
-> 09a8: SLDO 01          Short load global BASE1
   09a9: SLDC 00          Short load constant 0
   09aa: GRTI             Integer TOS-1 > TOS
   09ab: SLDO 04          Short load global BASE4
   09ac: SLDC 00          Short load constant 0
   09ad: LDB              Load byte at byte ptr TOS-1 + TOS
   09ae: SLDC 00          Short load constant 0
   09af: GRTI             Integer TOS-1 > TOS
   09b0: LAND             Logical AND (TOS & TOS-1)
   09b1: SLDO 04          Short load global BASE4
   09b2: SLDC 00          Short load constant 0
   09b3: LDB              Load byte at byte ptr TOS-1 + TOS
   09b4: SLDO 03          Short load global BASE3
   09b5: SLDC 00          Short load constant 0
   09b6: LDB              Load byte at byte ptr TOS-1 + TOS
   09b7: ADI              Add integers (TOS + TOS-1)
   09b8: SLDO 02          Short load global BASE2
   09b9: LEQI             Integer TOS-1 <= TOS
   09ba: LAND             Logical AND (TOS & TOS-1)
   09bb: FJP  $09f1       Jump if TOS false
   09bd: SLDO 03          Short load global BASE3
   09be: SLDC 00          Short load constant 0
   09bf: LDB              Load byte at byte ptr TOS-1 + TOS
   09c0: SLDO 01          Short load global BASE1
   09c1: SBI              Subtract integers (TOS-1 - TOS)
   09c2: SLDC 01          Short load constant 1
   09c3: ADI              Add integers (TOS + TOS-1)
   09c4: SRO  0005        Store global word BASE5
   09c6: SLDO 05          Short load global BASE5
   09c7: SLDC 00          Short load constant 0
   09c8: GRTI             Integer TOS-1 > TOS
   09c9: FJP  $09d9       Jump if TOS false
   09cb: SLDO 03          Short load global BASE3
   09cc: SLDO 01          Short load global BASE1
   09cd: SLDO 03          Short load global BASE3
   09ce: SLDO 01          Short load global BASE1
   09cf: SLDO 04          Short load global BASE4
   09d0: SLDC 00          Short load constant 0
   09d1: LDB              Load byte at byte ptr TOS-1 + TOS
   09d2: ADI              Add integers (TOS + TOS-1)
   09d3: SLDO 05          Short load global BASE5
   09d4: CSP  03          Call standard procedure MOVR
   09d6: SLDC 00          Short load constant 0
   09d7: SRO  0005        Store global word BASE5
-> 09d9: SLDO 05          Short load global BASE5
   09da: SLDC 00          Short load constant 0
   09db: EQUI             Integer TOS-1 = TOS
   09dc: FJP  $09f1       Jump if TOS false
   09de: SLDO 04          Short load global BASE4
   09df: SLDC 01          Short load constant 1
   09e0: SLDO 03          Short load global BASE3
   09e1: SLDO 01          Short load global BASE1
   09e2: SLDO 04          Short load global BASE4
   09e3: SLDC 00          Short load constant 0
   09e4: LDB              Load byte at byte ptr TOS-1 + TOS
   09e5: CSP  02          Call standard procedure MOVL
   09e7: SLDO 03          Short load global BASE3
   09e8: SLDC 00          Short load constant 0
   09e9: SLDO 03          Short load global BASE3
   09ea: SLDC 00          Short load constant 0
   09eb: LDB              Load byte at byte ptr TOS-1 + TOS
   09ec: SLDO 04          Short load global BASE4
   09ed: SLDC 00          Short load constant 0
   09ee: LDB              Load byte at byte ptr TOS-1 + TOS
   09ef: ADI              Add integers (TOS + TOS-1)
   09f0: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 09f1: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SCOPY(PARAM1; PARAM2; PARAM3; PARAM4) (* P=25 LL=0 *)
  BASE1=PARAM4
  BASE2=PARAM3
  BASE3=PARAM2
  BASE4=PARAM1
BEGIN
-> 09fe: SLDO 03          Short load global BASE3
   09ff: LSA  00          Load string address: ''
   0a01: NOP              No operation
   0a02: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0a04: SLDO 02          Short load global BASE2
   0a05: SLDC 00          Short load constant 0
   0a06: GRTI             Integer TOS-1 > TOS
   0a07: SLDO 01          Short load global BASE1
   0a08: SLDC 00          Short load constant 0
   0a09: GRTI             Integer TOS-1 > TOS
   0a0a: LAND             Logical AND (TOS & TOS-1)
   0a0b: SLDO 02          Short load global BASE2
   0a0c: SLDO 01          Short load global BASE1
   0a0d: ADI              Add integers (TOS + TOS-1)
   0a0e: SLDC 01          Short load constant 1
   0a0f: SBI              Subtract integers (TOS-1 - TOS)
   0a10: SLDO 04          Short load global BASE4
   0a11: SLDC 00          Short load constant 0
   0a12: LDB              Load byte at byte ptr TOS-1 + TOS
   0a13: LEQI             Integer TOS-1 <= TOS
   0a14: LAND             Logical AND (TOS & TOS-1)
   0a15: FJP  $0a22       Jump if TOS false
   0a17: SLDO 04          Short load global BASE4
   0a18: SLDO 02          Short load global BASE2
   0a19: SLDO 03          Short load global BASE3
   0a1a: SLDC 01          Short load constant 1
   0a1b: SLDO 01          Short load global BASE1
   0a1c: CSP  02          Call standard procedure MOVL
   0a1e: SLDO 03          Short load global BASE3
   0a1f: SLDC 00          Short load constant 0
   0a20: SLDO 01          Short load global BASE1
   0a21: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0a22: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.SDELETE(PARAM1; PARAM2; PARAM3) (* P=26 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
BEGIN
-> 0a2e: SLDO 02          Short load global BASE2
   0a2f: SLDC 00          Short load constant 0
   0a30: GRTI             Integer TOS-1 > TOS
   0a31: SLDO 01          Short load global BASE1
   0a32: SLDC 00          Short load constant 0
   0a33: GRTI             Integer TOS-1 > TOS
   0a34: LAND             Logical AND (TOS & TOS-1)
   0a35: FJP  $0a65       Jump if TOS false
   0a37: SLDO 03          Short load global BASE3
   0a38: SLDC 00          Short load constant 0
   0a39: LDB              Load byte at byte ptr TOS-1 + TOS
   0a3a: SLDO 02          Short load global BASE2
   0a3b: SBI              Subtract integers (TOS-1 - TOS)
   0a3c: SLDO 01          Short load global BASE1
   0a3d: SBI              Subtract integers (TOS-1 - TOS)
   0a3e: SLDC 01          Short load constant 1
   0a3f: ADI              Add integers (TOS + TOS-1)
   0a40: SRO  0004        Store global word BASE4
   0a42: SLDO 04          Short load global BASE4
   0a43: SLDC 00          Short load constant 0
   0a44: EQUI             Integer TOS-1 = TOS
   0a45: FJP  $0a4f       Jump if TOS false
   0a47: SLDO 03          Short load global BASE3
   0a48: SLDC 00          Short load constant 0
   0a49: SLDO 02          Short load global BASE2
   0a4a: SLDC 01          Short load constant 1
   0a4b: SBI              Subtract integers (TOS-1 - TOS)
   0a4c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0a4d: UJP  $0a65       Unconditional jump
-> 0a4f: SLDO 04          Short load global BASE4
   0a50: SLDC 00          Short load constant 0
   0a51: GRTI             Integer TOS-1 > TOS
   0a52: FJP  $0a65       Jump if TOS false
   0a54: SLDO 03          Short load global BASE3
   0a55: SLDO 02          Short load global BASE2
   0a56: SLDO 01          Short load global BASE1
   0a57: ADI              Add integers (TOS + TOS-1)
   0a58: SLDO 03          Short load global BASE3
   0a59: SLDO 02          Short load global BASE2
   0a5a: SLDO 04          Short load global BASE4
   0a5b: CSP  02          Call standard procedure MOVL
   0a5d: SLDO 03          Short load global BASE3
   0a5e: SLDC 00          Short load constant 0
   0a5f: SLDO 03          Short load global BASE3
   0a60: SLDC 00          Short load constant 0
   0a61: LDB              Load byte at byte ptr TOS-1 + TOS
   0a62: SLDO 01          Short load global BASE1
   0a63: SBI              Subtract integers (TOS-1 - TOS)
   0a64: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0a65: RBP  00          Return from base procedure
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
-> 0a72: SLDC 00          Short load constant 0
   0a73: SRO  0001        Store global word BASE1
   0a75: SLDO 04          Short load global BASE4
   0a76: SLDC 00          Short load constant 0
   0a77: LDB              Load byte at byte ptr TOS-1 + TOS
   0a78: SLDC 00          Short load constant 0
   0a79: GRTI             Integer TOS-1 > TOS
   0a7a: FJP  $0acd       Jump if TOS false
   0a7c: SLDO 04          Short load global BASE4
   0a7d: SLDC 01          Short load constant 1
   0a7e: LDB              Load byte at byte ptr TOS-1 + TOS
   0a7f: SRO  0007        Store global word BASE7
   0a81: SLDC 01          Short load constant 1
   0a82: SRO  0006        Store global word BASE6
   0a84: SLDO 03          Short load global BASE3
   0a85: SLDC 00          Short load constant 0
   0a86: LDB              Load byte at byte ptr TOS-1 + TOS
   0a87: SLDO 04          Short load global BASE4
   0a88: SLDC 00          Short load constant 0
   0a89: LDB              Load byte at byte ptr TOS-1 + TOS
   0a8a: SBI              Subtract integers (TOS-1 - TOS)
   0a8b: SLDC 01          Short load constant 1
   0a8c: ADI              Add integers (TOS + TOS-1)
   0a8d: SRO  0005        Store global word BASE5
   0a8f: LAO  0008        Load global BASE8
   0a91: SLDC 00          Short load constant 0
   0a92: SLDO 04          Short load global BASE4
   0a93: SLDC 00          Short load constant 0
   0a94: LDB              Load byte at byte ptr TOS-1 + TOS
   0a95: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0a96: SLDO 06          Short load global BASE6
   0a97: SLDO 05          Short load global BASE5
   0a98: LEQI             Integer TOS-1 <= TOS
   0a99: FJP  $0acd       Jump if TOS false
   0a9b: SLDO 06          Short load global BASE6
   0a9c: SLDO 05          Short load global BASE5
   0a9d: SLDO 06          Short load global BASE6
   0a9e: SBI              Subtract integers (TOS-1 - TOS)
   0a9f: SLDC 00          Short load constant 0
   0aa0: SLDO 07          Short load global BASE7
   0aa1: SLDO 03          Short load global BASE3
   0aa2: SLDO 06          Short load global BASE6
   0aa3: SLDC 00          Short load constant 0
   0aa4: CSP  0b          Call standard procedure SCAN
   0aa6: ADI              Add integers (TOS + TOS-1)
   0aa7: SRO  0006        Store global word BASE6
   0aa9: SLDO 06          Short load global BASE6
   0aaa: SLDO 05          Short load global BASE5
   0aab: GRTI             Integer TOS-1 > TOS
   0aac: FJP  $0ab0       Jump if TOS false
   0aae: UJP  $0acd       Unconditional jump
-> 0ab0: SLDO 03          Short load global BASE3
   0ab1: SLDO 06          Short load global BASE6
   0ab2: LAO  0008        Load global BASE8
   0ab4: SLDC 01          Short load constant 1
   0ab5: SLDO 04          Short load global BASE4
   0ab6: SLDC 00          Short load constant 0
   0ab7: LDB              Load byte at byte ptr TOS-1 + TOS
   0ab8: CSP  02          Call standard procedure MOVL
   0aba: LAO  0008        Load global BASE8
   0abc: SLDO 04          Short load global BASE4
   0abd: EQLSTR           String TOS-1 = TOS
   0abf: FJP  $0ac6       Jump if TOS false
   0ac1: SLDO 06          Short load global BASE6
   0ac2: SRO  0001        Store global word BASE1
   0ac4: UJP  $0acd       Unconditional jump
-> 0ac6: SLDO 06          Short load global BASE6
   0ac7: SLDC 01          Short load constant 1
   0ac8: ADI              Add integers (TOS + TOS-1)
   0ac9: SRO  0006        Store global word BASE6
   0acb: UJP  $0a96       Unconditional jump
-> 0acd: RBP  01          Return from base procedure
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
-> 0adc: SLDC 00          Short load constant 0
   0add: SRO  0001        Store global word BASE1
   0adf: LOD  01 0001     Load word at G1 (SYSCOM)
   0ae2: SLDC 00          Short load constant 0
   0ae3: STO              Store indirect (TOS into TOS-1)
   0ae4: SLDO 08          Short load global BASE8
   0ae5: SRO  0009        Store global word BASE9
   0ae7: SLDO 09          Short load global BASE9
   0ae8: SIND 05          Short index load *TOS+5
   0ae9: SLDO 05          Short load global BASE5
   0aea: SLDC 00          Short load constant 0
   0aeb: GEQI             Integer TOS-1 >= TOS
   0aec: LAND             Logical AND (TOS & TOS-1)
   0aed: FJP  $0bc5       Jump if TOS false
   0aef: SLDO 09          Short load global BASE9
   0af0: SIND 06          Short index load *TOS+6
   0af1: FJP  $0b78       Jump if TOS false
   0af3: SLDO 09          Short load global BASE9
   0af4: INC  0010        Inc field ptr (TOS+16)
   0af6: SRO  000a        Store global word BASE10
   0af8: SLDO 04          Short load global BASE4
   0af9: SLDC 00          Short load constant 0
   0afa: LESI             Integer TOS-1 < TOS
   0afb: FJP  $0b02       Jump if TOS false
   0afd: SLDO 09          Short load global BASE9
   0afe: IND  000d        Static index and load word (TOS+13)
   0b00: SRO  0004        Store global word BASE4
-> 0b02: SLDO 0a          Short load global BASE10
   0b03: SIND 00          Short index load *TOS+0
   0b04: SLDO 04          Short load global BASE4
   0b05: ADI              Add integers (TOS + TOS-1)
   0b06: SRO  0004        Store global word BASE4
   0b08: SLDO 04          Short load global BASE4
   0b09: SLDO 05          Short load global BASE5
   0b0a: ADI              Add integers (TOS + TOS-1)
   0b0b: SLDO 0a          Short load global BASE10
   0b0c: SIND 01          Short index load *TOS+1
   0b0d: GRTI             Integer TOS-1 > TOS
   0b0e: FJP  $0b1b       Jump if TOS false
   0b10: SLDO 03          Short load global BASE3
   0b11: LNOT             Logical NOT (~TOS)
   0b12: FJP  $0b1b       Jump if TOS false
   0b14: SLDO 08          Short load global BASE8
   0b15: SLDC 00          Short load constant 0
   0b16: SLDC 00          Short load constant 0
   0b17: CBP  35          Call base procedure PASCALSY.53
   0b19: FJP  $0b1b       Jump if TOS false
-> 0b1b: SLDO 04          Short load global BASE4
   0b1c: SLDO 05          Short load global BASE5
   0b1d: ADI              Add integers (TOS + TOS-1)
   0b1e: SLDO 0a          Short load global BASE10
   0b1f: SIND 01          Short index load *TOS+1
   0b20: GRTI             Integer TOS-1 > TOS
   0b21: FJP  $0b29       Jump if TOS false
   0b23: SLDO 0a          Short load global BASE10
   0b24: SIND 01          Short index load *TOS+1
   0b25: SLDO 04          Short load global BASE4
   0b26: SBI              Subtract integers (TOS-1 - TOS)
   0b27: SRO  0005        Store global word BASE5
-> 0b29: SLDO 09          Short load global BASE9
   0b2a: INC  0002        Inc field ptr (TOS+2)
   0b2c: SLDO 04          Short load global BASE4
   0b2d: SLDO 0a          Short load global BASE10
   0b2e: SIND 01          Short index load *TOS+1
   0b2f: GEQI             Integer TOS-1 >= TOS
   0b30: STO              Store indirect (TOS into TOS-1)
   0b31: SLDO 09          Short load global BASE9
   0b32: SIND 02          Short index load *TOS+2
   0b33: LNOT             Logical NOT (~TOS)
   0b34: FJP  $0b76       Jump if TOS false
   0b36: SLDO 09          Short load global BASE9
   0b37: SIND 07          Short index load *TOS+7
   0b38: SLDO 07          Short load global BASE7
   0b39: SLDO 06          Short load global BASE6
   0b3a: SLDO 05          Short load global BASE5
   0b3b: SLDO 04          Short load global BASE4
   0b3c: SLDO 03          Short load global BASE3
   0b3d: CLP  36          Call local procedure PASCALSY.54
   0b3f: CSP  22          Call standard procedure IORESULT
   0b41: SLDC 00          Short load constant 0
   0b42: EQUI             Integer TOS-1 = TOS
   0b43: FJP  $0b76       Jump if TOS false
   0b45: SLDO 03          Short load global BASE3
   0b46: LNOT             Logical NOT (~TOS)
   0b47: FJP  $0b4e       Jump if TOS false
   0b49: SLDO 09          Short load global BASE9
   0b4a: INC  000f        Inc field ptr (TOS+15)
   0b4c: SLDC 01          Short load constant 1
   0b4d: STO              Store indirect (TOS into TOS-1)
-> 0b4e: SLDO 05          Short load global BASE5
   0b4f: SRO  0001        Store global word BASE1
   0b51: SLDO 04          Short load global BASE4
   0b52: SLDO 05          Short load global BASE5
   0b53: ADI              Add integers (TOS + TOS-1)
   0b54: SRO  0004        Store global word BASE4
   0b56: SLDO 09          Short load global BASE9
   0b57: INC  0002        Inc field ptr (TOS+2)
   0b59: SLDO 04          Short load global BASE4
   0b5a: SLDO 0a          Short load global BASE10
   0b5b: SIND 01          Short index load *TOS+1
   0b5c: EQUI             Integer TOS-1 = TOS
   0b5d: STO              Store indirect (TOS into TOS-1)
   0b5e: SLDO 09          Short load global BASE9
   0b5f: INC  000d        Inc field ptr (TOS+13)
   0b61: SLDO 04          Short load global BASE4
   0b62: SLDO 0a          Short load global BASE10
   0b63: SIND 00          Short index load *TOS+0
   0b64: SBI              Subtract integers (TOS-1 - TOS)
   0b65: STO              Store indirect (TOS into TOS-1)
   0b66: SLDO 09          Short load global BASE9
   0b67: IND  000d        Static index and load word (TOS+13)
   0b69: SLDO 09          Short load global BASE9
   0b6a: IND  000c        Static index and load word (TOS+12)
   0b6c: GRTI             Integer TOS-1 > TOS
   0b6d: FJP  $0b76       Jump if TOS false
   0b6f: SLDO 09          Short load global BASE9
   0b70: INC  000c        Inc field ptr (TOS+12)
   0b72: SLDO 09          Short load global BASE9
   0b73: IND  000d        Static index and load word (TOS+13)
   0b75: STO              Store indirect (TOS into TOS-1)
-> 0b76: UJP  $0bc3       Unconditional jump
-> 0b78: SLDO 05          Short load global BASE5
   0b79: SRO  0001        Store global word BASE1
   0b7b: SLDO 09          Short load global BASE9
   0b7c: SIND 07          Short index load *TOS+7
   0b7d: SLDO 07          Short load global BASE7
   0b7e: SLDO 06          Short load global BASE6
   0b7f: SLDO 05          Short load global BASE5
   0b80: SLDO 04          Short load global BASE4
   0b81: SLDO 03          Short load global BASE3
   0b82: CLP  36          Call local procedure PASCALSY.54
   0b84: CSP  22          Call standard procedure IORESULT
   0b86: SLDC 00          Short load constant 0
   0b87: EQUI             Integer TOS-1 = TOS
   0b88: FJP  $0bc0       Jump if TOS false
   0b8a: SLDO 03          Short load global BASE3
   0b8b: FJP  $0bbe       Jump if TOS false
   0b8d: SLDO 05          Short load global BASE5
   0b8e: LDCI 0200        Load word 512
   0b91: MPI              Multiply integers (TOS * TOS-1)
   0b92: SRO  0004        Store global word BASE4
   0b94: SLDO 04          Short load global BASE4
   0b95: SLDO 04          Short load global BASE4
   0b96: NGI              Negate integer
   0b97: SLDC 01          Short load constant 1
   0b98: SLDC 00          Short load constant 0
   0b99: SLDO 07          Short load global BASE7
   0b9a: SLDO 06          Short load global BASE6
   0b9b: SLDO 04          Short load global BASE4
   0b9c: ADI              Add integers (TOS + TOS-1)
   0b9d: SLDC 01          Short load constant 1
   0b9e: SBI              Subtract integers (TOS-1 - TOS)
   0b9f: SLDC 00          Short load constant 0
   0ba0: CSP  0b          Call standard procedure SCAN
   0ba2: ADI              Add integers (TOS + TOS-1)
   0ba3: SRO  0004        Store global word BASE4
   0ba5: SLDO 04          Short load global BASE4
   0ba6: LDCI 0200        Load word 512
   0ba9: ADI              Add integers (TOS + TOS-1)
   0baa: SLDC 01          Short load constant 1
   0bab: SBI              Subtract integers (TOS-1 - TOS)
   0bac: LDCI 0200        Load word 512
   0baf: DVI              Divide integers (TOS-1 / TOS)
   0bb0: SRO  0004        Store global word BASE4
   0bb2: SLDO 04          Short load global BASE4
   0bb3: SRO  0001        Store global word BASE1
   0bb5: SLDO 09          Short load global BASE9
   0bb6: INC  0002        Inc field ptr (TOS+2)
   0bb8: SLDO 04          Short load global BASE4
   0bb9: SLDO 05          Short load global BASE5
   0bba: LESI             Integer TOS-1 < TOS
   0bbb: STO              Store indirect (TOS into TOS-1)
   0bbc: UJP  $0bbe       Unconditional jump
-> 0bbe: UJP  $0bc3       Unconditional jump
-> 0bc0: SLDC 00          Short load constant 0
   0bc1: SRO  0001        Store global word BASE1
-> 0bc3: UJP  $0bca       Unconditional jump
-> 0bc5: LOD  01 0001     Load word at G1 (SYSCOM)
   0bc8: SLDC 0d          Short load constant 13
   0bc9: STO              Store indirect (TOS into TOS-1)
-> 0bca: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.FGOTOXY(PARAM1; PARAM2) (* P=29 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0000: LOD  01 0001     Load word at G1 (SYSCOM)
   0003: INC  0025        Inc field ptr (TOS+37)
   0005: SRO  0003        Store global word BASE3
   0007: SLDO 02          Short load global BASE2
   0008: SLDC 00          Short load constant 0
   0009: LESI             Integer TOS-1 < TOS
   000a: FJP  $000f       Jump if TOS false
   000c: SLDC 00          Short load constant 0
   000d: SRO  0002        Store global word BASE2
-> 000f: SLDO 02          Short load global BASE2
   0010: SLDO 03          Short load global BASE3
   0011: SIND 01          Short index load *TOS+1
   0012: GRTI             Integer TOS-1 > TOS
   0013: FJP  $0019       Jump if TOS false
   0015: SLDO 03          Short load global BASE3
   0016: SIND 01          Short index load *TOS+1
   0017: SRO  0002        Store global word BASE2
-> 0019: SLDO 01          Short load global BASE1
   001a: SLDC 00          Short load constant 0
   001b: LESI             Integer TOS-1 < TOS
   001c: FJP  $0021       Jump if TOS false
   001e: SLDC 00          Short load constant 0
   001f: SRO  0001        Store global word BASE1
-> 0021: SLDO 01          Short load global BASE1
   0022: SLDO 03          Short load global BASE3
   0023: SIND 00          Short index load *TOS+0
   0024: GRTI             Integer TOS-1 > TOS
   0025: FJP  $002b       Jump if TOS false
   0027: SLDO 03          Short load global BASE3
   0028: SIND 00          Short index load *TOS+0
   0029: SRO  0001        Store global word BASE1
-> 002b: LOD  01 0003     Load word at G3 (OUTPUT)
   002e: SLDC 1e          Short load constant 30
   002f: SLDC 00          Short load constant 0
   0030: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0033: LOD  01 0003     Load word at G3 (OUTPUT)
   0036: SLDO 02          Short load global BASE2
   0037: SLDC 20          Short load constant 32
   0038: ADI              Add integers (TOS + TOS-1)
   0039: SLDC 00          Short load constant 0
   003a: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   003d: LOD  01 0003     Load word at G3 (OUTPUT)
   0040: SLDO 01          Short load global BASE1
   0041: SLDC 20          Short load constant 32
   0042: ADI              Add integers (TOS + TOS-1)
   0043: SLDC 00          Short load constant 0
   0044: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 0047: RBP  00          Return from base procedure
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
-> 0054: SLDC 00          Short load constant 0
   0055: SRO  0001        Store global word BASE1
   0057: SLDO 03          Short load global BASE3
   0058: LDCN             Load constant NIL
   0059: STO              Store indirect (TOS into TOS-1)
   005a: SLDC 00          Short load constant 0
   005b: SRO  0008        Store global word BASE8
   005d: SLDC 00          Short load constant 0
   005e: SRO  0007        Store global word BASE7
   0060: SLDO 05          Short load global BASE5
   0061: SLDC 00          Short load constant 0
   0062: LDB              Load byte at byte ptr TOS-1 + TOS
   0063: SLDC 00          Short load constant 0
   0064: GRTI             Integer TOS-1 > TOS
   0065: FJP  $00de       Jump if TOS false
   0067: SLDO 05          Short load global BASE5
   0068: SLDC 01          Short load constant 1
   0069: LDB              Load byte at byte ptr TOS-1 + TOS
   006a: SLDC 23          Short load constant 35
   006b: EQUI             Integer TOS-1 = TOS
   006c: SLDO 05          Short load global BASE5
   006d: SLDC 00          Short load constant 0
   006e: LDB              Load byte at byte ptr TOS-1 + TOS
   006f: SLDC 01          Short load constant 1
   0070: GRTI             Integer TOS-1 > TOS
   0071: LAND             Logical AND (TOS & TOS-1)
   0072: FJP  $00b9       Jump if TOS false
   0074: SLDC 01          Short load constant 1
   0075: SRO  0008        Store global word BASE8
   0077: SLDC 00          Short load constant 0
   0078: SRO  0006        Store global word BASE6
   007a: SLDC 02          Short load constant 2
   007b: SRO  000a        Store global word BASE10
-> 007d: SLDO 05          Short load global BASE5
   007e: SLDO 0a          Short load global BASE10
   007f: LDB              Load byte at byte ptr TOS-1 + TOS
   0080: LDA  01 007a     Load addr G122
   0083: LDM  04          Load 4 words from (TOS)
   0085: SLDC 04          Short load constant 4
   0086: INN              Set membership (TOS-1 in set TOS)
   0087: FJP  $0096       Jump if TOS false
   0089: SLDO 06          Short load global BASE6
   008a: SLDC 0a          Short load constant 10
   008b: MPI              Multiply integers (TOS * TOS-1)
   008c: SLDO 05          Short load global BASE5
   008d: SLDO 0a          Short load global BASE10
   008e: LDB              Load byte at byte ptr TOS-1 + TOS
   008f: ADI              Add integers (TOS + TOS-1)
   0090: SLDC 30          Short load constant 48
   0091: SBI              Subtract integers (TOS-1 - TOS)
   0092: SRO  0006        Store global word BASE6
   0094: UJP  $0099       Unconditional jump
-> 0096: SLDC 00          Short load constant 0
   0097: SRO  0008        Store global word BASE8
-> 0099: SLDO 0a          Short load global BASE10
   009a: SLDC 01          Short load constant 1
   009b: ADI              Add integers (TOS + TOS-1)
   009c: SRO  000a        Store global word BASE10
   009e: SLDO 0a          Short load global BASE10
   009f: SLDO 05          Short load global BASE5
   00a0: SLDC 00          Short load constant 0
   00a1: LDB              Load byte at byte ptr TOS-1 + TOS
   00a2: GRTI             Integer TOS-1 > TOS
   00a3: SLDO 08          Short load global BASE8
   00a4: LNOT             Logical NOT (~TOS)
   00a5: LOR              Logical OR (TOS | TOS-1)
   00a6: FJP  $007d       Jump if TOS false
   00a8: SLDO 08          Short load global BASE8
   00a9: SLDO 06          Short load global BASE6
   00aa: SLDC 00          Short load constant 0
   00ab: GRTI             Integer TOS-1 > TOS
   00ac: LAND             Logical AND (TOS & TOS-1)
   00ad: SLDO 06          Short load global BASE6
   00ae: SLDC 0c          Short load constant 12
   00af: LEQI             Integer TOS-1 <= TOS
   00b0: LAND             Logical AND (TOS & TOS-1)
   00b1: SRO  0007        Store global word BASE7
   00b3: SLDO 04          Short load global BASE4
   00b4: SLDO 07          Short load global BASE7
   00b5: LNOT             Logical NOT (~TOS)
   00b6: LAND             Logical AND (TOS & TOS-1)
   00b7: SRO  0004        Store global word BASE4
-> 00b9: SLDO 07          Short load global BASE7
   00ba: LNOT             Logical NOT (~TOS)
   00bb: FJP  $00de       Jump if TOS false
   00bd: SLDC 00          Short load constant 0
   00be: SRO  0008        Store global word BASE8
   00c0: SLDC 0c          Short load constant 12
   00c1: SRO  0006        Store global word BASE6
-> 00c3: SLDO 05          Short load global BASE5
   00c4: LDA  01 007e     Load addr G126
   00c7: SLDO 06          Short load global BASE6
   00c8: IXA  0006        Index array (TOS-1 + TOS * 6)
   00ca: EQLSTR           String TOS-1 = TOS
   00cc: SRO  0008        Store global word BASE8
   00ce: SLDO 08          Short load global BASE8
   00cf: LNOT             Logical NOT (~TOS)
   00d0: FJP  $00d7       Jump if TOS false
   00d2: SLDO 06          Short load global BASE6
   00d3: SLDC 01          Short load constant 1
   00d4: SBI              Subtract integers (TOS-1 - TOS)
   00d5: SRO  0006        Store global word BASE6
-> 00d7: SLDO 08          Short load global BASE8
   00d8: SLDO 06          Short load global BASE6
   00d9: SLDC 00          Short load constant 0
   00da: EQUI             Integer TOS-1 = TOS
   00db: LOR              Logical OR (TOS | TOS-1)
   00dc: FJP  $00c3       Jump if TOS false
-> 00de: SLDO 08          Short load global BASE8
   00df: FJP  $0141       Jump if TOS false
   00e1: LDA  01 007e     Load addr G126
   00e4: SLDO 06          Short load global BASE6
   00e5: IXA  0006        Index array (TOS-1 + TOS * 6)
   00e7: SIND 04          Short index load *TOS+4
   00e8: FJP  $0141       Jump if TOS false
   00ea: LOD  01 0001     Load word at G1 (SYSCOM)
   00ed: SRO  000b        Store global word BASE11
   00ef: SLDC 00          Short load constant 0
   00f0: SRO  0008        Store global word BASE8
   00f2: SLDO 0b          Short load global BASE11
   00f3: SIND 04          Short index load *TOS+4
   00f4: LDCN             Load constant NIL
   00f5: NEQI             Integer TOS-1 <> TOS
   00f6: FJP  $0119       Jump if TOS false
   00f8: SLDO 05          Short load global BASE5
   00f9: SLDO 0b          Short load global BASE11
   00fa: SIND 04          Short index load *TOS+4
   00fb: SLDC 00          Short load constant 0
   00fc: IXA  000d        Index array (TOS-1 + TOS * 13)
   00fe: INC  0003        Inc field ptr (TOS+3)
   0100: EQLSTR           String TOS-1 = TOS
   0102: FJP  $0119       Jump if TOS false
   0104: LAO  000a        Load global BASE10
   0106: LAO  0009        Load global BASE9
   0108: CSP  09          Call standard procedure TIME
   010a: SLDO 09          Short load global BASE9
   010b: SLDO 0b          Short load global BASE11
   010c: SIND 04          Short index load *TOS+4
   010d: SLDC 00          Short load constant 0
   010e: IXA  000d        Index array (TOS-1 + TOS * 13)
   0110: IND  0009        Static index and load word (TOS+9)
   0112: SBI              Subtract integers (TOS-1 - TOS)
   0113: LDCI 012c        Load word 300
   0116: LEQI             Integer TOS-1 <= TOS
   0117: SRO  0008        Store global word BASE8
-> 0119: SLDO 08          Short load global BASE8
   011a: LNOT             Logical NOT (~TOS)
   011b: FJP  $0141       Jump if TOS false
   011d: SLDO 07          Short load global BASE7
   011e: SRO  0008        Store global word BASE8
   0120: SLDO 06          Short load global BASE6
   0121: SLDC 00          Short load constant 0
   0122: SLDC 00          Short load constant 0
   0123: CBP  2a          Call base procedure PASCALSY.42
   0125: FJP  $013b       Jump if TOS false
   0127: SLDO 07          Short load global BASE7
   0128: LNOT             Logical NOT (~TOS)
   0129: FJP  $0139       Jump if TOS false
   012b: SLDO 05          Short load global BASE5
   012c: SLDO 0b          Short load global BASE11
   012d: SIND 04          Short index load *TOS+4
   012e: SLDC 00          Short load constant 0
   012f: IXA  000d        Index array (TOS-1 + TOS * 13)
   0131: INC  0003        Inc field ptr (TOS+3)
   0133: EQLSTR           String TOS-1 = TOS
   0135: SRO  0008        Store global word BASE8
   0137: UJP  $0139       Unconditional jump
-> 0139: UJP  $0141       Unconditional jump
-> 013b: CSP  22          Call standard procedure IORESULT
   013d: SLDC 00          Short load constant 0
   013e: EQUI             Integer TOS-1 = TOS
   013f: SRO  0008        Store global word BASE8
-> 0141: SLDO 08          Short load global BASE8
   0142: LNOT             Logical NOT (~TOS)
   0143: SLDO 04          Short load global BASE4
   0144: LAND             Logical AND (TOS & TOS-1)
   0145: FJP  $0173       Jump if TOS false
   0147: SLDC 0c          Short load constant 12
   0148: SRO  0006        Store global word BASE6
-> 014a: LDA  01 007e     Load addr G126
   014d: SLDO 06          Short load global BASE6
   014e: IXA  0006        Index array (TOS-1 + TOS * 6)
   0150: SRO  000b        Store global word BASE11
   0152: SLDO 0b          Short load global BASE11
   0153: SIND 04          Short index load *TOS+4
   0154: FJP  $0163       Jump if TOS false
   0156: SLDO 06          Short load global BASE6
   0157: SLDC 00          Short load constant 0
   0158: SLDC 00          Short load constant 0
   0159: CBP  2a          Call base procedure PASCALSY.42
   015b: FJP  $0163       Jump if TOS false
   015d: SLDO 05          Short load global BASE5
   015e: SLDO 0b          Short load global BASE11
   015f: EQLSTR           String TOS-1 = TOS
   0161: SRO  0008        Store global word BASE8
-> 0163: SLDO 08          Short load global BASE8
   0164: LNOT             Logical NOT (~TOS)
   0165: FJP  $016c       Jump if TOS false
   0167: SLDO 06          Short load global BASE6
   0168: SLDC 01          Short load constant 1
   0169: SBI              Subtract integers (TOS-1 - TOS)
   016a: SRO  0006        Store global word BASE6
-> 016c: SLDO 08          Short load global BASE8
   016d: SLDO 06          Short load global BASE6
   016e: SLDC 00          Short load constant 0
   016f: EQUI             Integer TOS-1 = TOS
   0170: LOR              Logical OR (TOS | TOS-1)
   0171: FJP  $014a       Jump if TOS false
-> 0173: SLDO 08          Short load global BASE8
   0174: FJP  $01a8       Jump if TOS false
   0176: LDA  01 007e     Load addr G126
   0179: SLDO 06          Short load global BASE6
   017a: IXA  0006        Index array (TOS-1 + TOS * 6)
   017c: SRO  000b        Store global word BASE11
   017e: SLDO 06          Short load global BASE6
   017f: SRO  0001        Store global word BASE1
   0181: SLDO 0b          Short load global BASE11
   0182: SLDC 00          Short load constant 0
   0183: LDB              Load byte at byte ptr TOS-1 + TOS
   0184: SLDC 00          Short load constant 0
   0185: GRTI             Integer TOS-1 > TOS
   0186: FJP  $018c       Jump if TOS false
   0188: SLDO 05          Short load global BASE5
   0189: SLDO 0b          Short load global BASE11
   018a: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 018c: SLDO 0b          Short load global BASE11
   018d: SIND 04          Short index load *TOS+4
   018e: LOD  01 0001     Load word at G1 (SYSCOM)
   0191: SIND 04          Short index load *TOS+4
   0192: LDCN             Load constant NIL
   0193: NEQI             Integer TOS-1 <> TOS
   0194: LAND             Logical AND (TOS & TOS-1)
   0195: FJP  $01a8       Jump if TOS false
   0197: SLDO 03          Short load global BASE3
   0198: LOD  01 0001     Load word at G1 (SYSCOM)
   019b: SIND 04          Short index load *TOS+4
   019c: STO              Store indirect (TOS into TOS-1)
   019d: LAO  000a        Load global BASE10
   019f: SLDO 03          Short load global BASE3
   01a0: SIND 00          Short index load *TOS+0
   01a1: SLDC 00          Short load constant 0
   01a2: IXA  000d        Index array (TOS-1 + TOS * 13)
   01a4: INC  0009        Inc field ptr (TOS+9)
   01a6: CSP  09          Call standard procedure TIME
-> 01a8: RBP  01          Return from base procedure
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
-> 01ba: LDA  01 007e     Load addr G126
   01bd: SLDO 02          Short load global BASE2
   01be: IXA  0006        Index array (TOS-1 + TOS * 6)
   01c0: SRO  0013        Store global word BASE19
   01c2: SLDO 01          Short load global BASE1
   01c3: SLDC 00          Short load constant 0
   01c4: IXA  000d        Index array (TOS-1 + TOS * 13)
   01c6: SRO  0014        Store global word BASE20
   01c8: LDO  0013        Load global word BASE19
   01ca: LDO  0014        Load global word BASE20
   01cc: INC  0003        Inc field ptr (TOS+3)
   01ce: EQLSTR           String TOS-1 = TOS
   01d0: LDO  0014        Load global word BASE20
   01d2: INC  0002        Inc field ptr (TOS+2)
   01d4: SLDC 04          Short load constant 4
   01d5: SLDC 00          Short load constant 0
   01d6: LDP              Load packed field (TOS)
   01d7: SLDC 00          Short load constant 0
   01d8: EQUI             Integer TOS-1 = TOS
   01d9: LDO  0014        Load global word BASE20
   01db: INC  0002        Inc field ptr (TOS+2)
   01dd: SLDC 04          Short load constant 4
   01de: SLDC 00          Short load constant 0
   01df: LDP              Load packed field (TOS)
   01e0: SLDC 08          Short load constant 8
   01e1: EQUI             Integer TOS-1 = TOS
   01e2: LOR              Logical OR (TOS | TOS-1)
   01e3: LAND             Logical AND (TOS & TOS-1)
   01e4: SRO  0005        Store global word BASE5
   01e6: SLDO 05          Short load global BASE5
   01e7: FJP  $0267       Jump if TOS false
   01e9: LAO  0004        Load global BASE4
   01eb: LAO  0003        Load global BASE3
   01ed: CSP  09          Call standard procedure TIME
   01ef: SLDO 03          Short load global BASE3
   01f0: LDO  0014        Load global word BASE20
   01f2: IND  0009        Static index and load word (TOS+9)
   01f4: SBI              Subtract integers (TOS-1 - TOS)
   01f5: LDCI 012c        Load word 300
   01f8: LEQI             Integer TOS-1 <= TOS
   01f9: SLDO 03          Short load global BASE3
   01fa: LDO  0014        Load global word BASE20
   01fc: IND  0009        Static index and load word (TOS+9)
   01fe: SBI              Subtract integers (TOS-1 - TOS)
   01ff: SLDC 00          Short load constant 0
   0200: GEQI             Integer TOS-1 >= TOS
   0201: LAND             Logical AND (TOS & TOS-1)
   0202: LOD  01 0001     Load word at G1 (SYSCOM)
   0205: INC  001d        Inc field ptr (TOS+29)
   0207: SLDC 01          Short load constant 1
   0208: SLDC 00          Short load constant 0
   0209: LDP              Load packed field (TOS)
   020a: LAND             Logical AND (TOS & TOS-1)
   020b: SRO  0005        Store global word BASE5
   020d: SLDO 05          Short load global BASE5
   020e: LNOT             Logical NOT (~TOS)
   020f: FJP  $022a       Jump if TOS false
   0211: SLDO 02          Short load global BASE2
   0212: LAO  0006        Load global BASE6
   0214: SLDC 00          Short load constant 0
   0215: SLDC 1a          Short load constant 26
   0216: SLDC 02          Short load constant 2
   0217: SLDC 00          Short load constant 0
   0218: CSP  05          Call standard procedure UNITREAD
   021a: CSP  22          Call standard procedure IORESULT
   021c: SLDC 00          Short load constant 0
   021d: EQUI             Integer TOS-1 = TOS
   021e: FJP  $022a       Jump if TOS false
   0220: LDO  0014        Load global word BASE20
   0222: INC  0003        Inc field ptr (TOS+3)
   0224: LAO  0009        Load global BASE9
   0226: EQLSTR           String TOS-1 = TOS
   0228: SRO  0005        Store global word BASE5
-> 022a: SLDO 05          Short load global BASE5
   022b: FJP  $0267       Jump if TOS false
   022d: LDO  0014        Load global word BASE20
   022f: SLDC 00          Short load constant 0
   0230: STO              Store indirect (TOS into TOS-1)
   0231: SLDO 02          Short load global BASE2
   0232: SLDO 01          Short load global BASE1
   0233: SLDC 00          Short load constant 0
   0234: LDO  0014        Load global word BASE20
   0236: IND  0008        Static index and load word (TOS+8)
   0238: SLDC 01          Short load constant 1
   0239: ADI              Add integers (TOS + TOS-1)
   023a: SLDC 1a          Short load constant 26
   023b: MPI              Multiply integers (TOS * TOS-1)
   023c: SLDC 02          Short load constant 2
   023d: SLDC 00          Short load constant 0
   023e: CSP  06          Call standard procedure UNITWRITE
   0240: CSP  22          Call standard procedure IORESULT
   0242: SLDC 00          Short load constant 0
   0243: EQUI             Integer TOS-1 = TOS
   0244: SRO  0005        Store global word BASE5
   0246: LDO  0014        Load global word BASE20
   0248: SIND 01          Short index load *TOS+1
   0249: SLDC 0a          Short load constant 10
   024a: EQUI             Integer TOS-1 = TOS
   024b: FJP  $025c       Jump if TOS false
   024d: SLDO 02          Short load global BASE2
   024e: SLDO 01          Short load global BASE1
   024f: SLDC 00          Short load constant 0
   0250: LDO  0014        Load global word BASE20
   0252: IND  0008        Static index and load word (TOS+8)
   0254: SLDC 01          Short load constant 1
   0255: ADI              Add integers (TOS + TOS-1)
   0256: SLDC 1a          Short load constant 26
   0257: MPI              Multiply integers (TOS * TOS-1)
   0258: SLDC 06          Short load constant 6
   0259: SLDC 00          Short load constant 0
   025a: CSP  06          Call standard procedure UNITWRITE
-> 025c: SLDO 05          Short load global BASE5
   025d: FJP  $0267       Jump if TOS false
   025f: LAO  0004        Load global BASE4
   0261: LDO  0014        Load global word BASE20
   0263: INC  0009        Inc field ptr (TOS+9)
   0265: CSP  09          Call standard procedure TIME
-> 0267: SLDO 05          Short load global BASE5
   0268: LNOT             Logical NOT (~TOS)
   0269: FJP  $027a       Jump if TOS false
   026b: LDO  0013        Load global word BASE19
   026d: LSA  00          Load string address: ''
   026f: NOP              No operation
   0270: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0272: LDO  0013        Load global word BASE19
   0274: INC  0005        Inc field ptr (TOS+5)
   0276: LDCI 7fff        Load word 32767
   0279: STO              Store indirect (TOS into TOS-1)
-> 027a: RBP  00          Return from base procedure
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
-> 0286: SLDC 00          Short load constant 0
   0287: SRO  0001        Store global word BASE1
   0289: SLDC 00          Short load constant 0
   028a: SRO  0007        Store global word BASE7
   028c: SLDC 01          Short load constant 1
   028d: SRO  0006        Store global word BASE6
-> 028f: SLDO 06          Short load global BASE6
   0290: SLDO 03          Short load global BASE3
   0291: SLDC 00          Short load constant 0
   0292: IXA  000d        Index array (TOS-1 + TOS * 13)
   0294: IND  0008        Static index and load word (TOS+8)
   0296: LEQI             Integer TOS-1 <= TOS
   0297: SLDO 07          Short load global BASE7
   0298: LNOT             Logical NOT (~TOS)
   0299: LAND             Logical AND (TOS & TOS-1)
   029a: FJP  $02c4       Jump if TOS false
   029c: SLDO 03          Short load global BASE3
   029d: SLDO 06          Short load global BASE6
   029e: IXA  000d        Index array (TOS-1 + TOS * 13)
   02a0: SRO  0008        Store global word BASE8
   02a2: SLDO 08          Short load global BASE8
   02a3: INC  0003        Inc field ptr (TOS+3)
   02a5: SLDO 05          Short load global BASE5
   02a6: EQLSTR           String TOS-1 = TOS
   02a8: FJP  $02bd       Jump if TOS false
   02aa: SLDO 04          Short load global BASE4
   02ab: SLDO 08          Short load global BASE8
   02ac: INC  000c        Inc field ptr (TOS+12)
   02ae: SLDC 07          Short load constant 7
   02af: SLDC 09          Short load constant 9
   02b0: LDP              Load packed field (TOS)
   02b1: SLDC 64          Short load constant 100
   02b2: NEQI             Integer TOS-1 <> TOS
   02b3: EQLBOOL          Boolean TOS-1 = TOS
   02b5: FJP  $02bd       Jump if TOS false
   02b7: SLDO 06          Short load global BASE6
   02b8: SRO  0001        Store global word BASE1
   02ba: SLDC 01          Short load constant 1
   02bb: SRO  0007        Store global word BASE7
-> 02bd: SLDO 06          Short load global BASE6
   02be: SLDC 01          Short load constant 1
   02bf: ADI              Add integers (TOS + TOS-1)
   02c0: SRO  0006        Store global word BASE6
   02c2: UJP  $028f       Unconditional jump
-> 02c4: RBP  01          Return from base procedure
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
-> 02d2: LAO  0008        Load global BASE8
   02d4: SLDO 07          Short load global BASE7
   02d5: SAS  50          String assign (TOS to TOS-1, 80 chars)
   02d7: SLDO 06          Short load global BASE6
   02d8: NOP              No operation
   02d9: LSA  00          Load string address: ''
   02db: SAS  07          String assign (TOS to TOS-1, 7 chars)
   02dd: SLDO 05          Short load global BASE5
   02de: NOP              No operation
   02df: LSA  00          Load string address: ''
   02e1: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   02e3: SLDO 04          Short load global BASE4
   02e4: SLDC 00          Short load constant 0
   02e5: STO              Store indirect (TOS into TOS-1)
   02e6: SLDO 03          Short load global BASE3
   02e7: SLDC 00          Short load constant 0
   02e8: STO              Store indirect (TOS into TOS-1)
   02e9: SLDC 00          Short load constant 0
   02ea: SRO  0001        Store global word BASE1
   02ec: SLDC 01          Short load constant 1
   02ed: SRO  0032        Store global word BASE50
-> 02ef: LDO  0032        Load global word BASE50
   02f1: LAO  0008        Load global BASE8
   02f3: SLDC 00          Short load constant 0
   02f4: LDB              Load byte at byte ptr TOS-1 + TOS
   02f5: LEQI             Integer TOS-1 <= TOS
   02f6: FJP  $032d       Jump if TOS false
   02f8: LAO  0008        Load global BASE8
   02fa: LDO  0032        Load global word BASE50
   02fc: LDB              Load byte at byte ptr TOS-1 + TOS
   02fd: SRO  0033        Store global word BASE51
   02ff: LDO  0033        Load global word BASE51
   0301: SLDC 20          Short load constant 32
   0302: LEQI             Integer TOS-1 <= TOS
   0303: FJP  $030f       Jump if TOS false
   0305: LAO  0008        Load global BASE8
   0307: LDO  0032        Load global word BASE50
   0309: SLDC 01          Short load constant 1
   030a: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   030d: UJP  $032b       Unconditional jump
-> 030f: LDO  0033        Load global word BASE51
   0311: SLDC 61          Short load constant 97
   0312: GEQI             Integer TOS-1 >= TOS
   0313: LDO  0033        Load global word BASE51
   0315: SLDC 7a          Short load constant 122
   0316: LEQI             Integer TOS-1 <= TOS
   0317: LAND             Logical AND (TOS & TOS-1)
   0318: FJP  $0325       Jump if TOS false
   031a: LAO  0008        Load global BASE8
   031c: LDO  0032        Load global word BASE50
   031e: LDO  0033        Load global word BASE51
   0320: SLDC 61          Short load constant 97
   0321: SBI              Subtract integers (TOS-1 - TOS)
   0322: SLDC 41          Short load constant 65
   0323: ADI              Add integers (TOS + TOS-1)
   0324: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0325: LDO  0032        Load global word BASE50
   0327: SLDC 01          Short load constant 1
   0328: ADI              Add integers (TOS + TOS-1)
   0329: SRO  0032        Store global word BASE50
-> 032b: UJP  $02ef       Unconditional jump
-> 032d: LAO  0008        Load global BASE8
   032f: SLDC 00          Short load constant 0
   0330: LDB              Load byte at byte ptr TOS-1 + TOS
   0331: SLDC 00          Short load constant 0
   0332: GRTI             Integer TOS-1 > TOS
   0333: FJP  $04f9       Jump if TOS false
   0335: LAO  0008        Load global BASE8
   0337: SLDC 01          Short load constant 1
   0338: LDB              Load byte at byte ptr TOS-1 + TOS
   0339: SLDC 2a          Short load constant 42
   033a: EQUI             Integer TOS-1 = TOS
   033b: FJP  $034a       Jump if TOS false
   033d: SLDO 06          Short load global BASE6
   033e: LDA  01 003f     Load addr G63
   0341: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0343: LAO  0008        Load global BASE8
   0345: SLDC 01          Short load constant 1
   0346: SLDC 01          Short load constant 1
   0347: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 034a: NOP              No operation
   034b: LSA  01          Load string address: ':'
   034e: LAO  0008        Load global BASE8
   0350: SLDC 00          Short load constant 0
   0351: SLDC 00          Short load constant 0
   0352: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0355: SRO  0032        Store global word BASE50
   0357: LDO  0032        Load global word BASE50
   0359: SLDC 01          Short load constant 1
   035a: LEQI             Integer TOS-1 <= TOS
   035b: FJP  $0379       Jump if TOS false
   035d: SLDO 06          Short load global BASE6
   035e: SLDC 00          Short load constant 0
   035f: LDB              Load byte at byte ptr TOS-1 + TOS
   0360: SLDC 00          Short load constant 0
   0361: EQUI             Integer TOS-1 = TOS
   0362: FJP  $036a       Jump if TOS false
   0364: SLDO 06          Short load global BASE6
   0365: LDA  01 003b     Load addr G59
   0368: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 036a: LDO  0032        Load global word BASE50
   036c: SLDC 01          Short load constant 1
   036d: EQUI             Integer TOS-1 = TOS
   036e: FJP  $0377       Jump if TOS false
   0370: LAO  0008        Load global BASE8
   0372: SLDC 01          Short load constant 1
   0373: SLDC 01          Short load constant 1
   0374: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0377: UJP  $039a       Unconditional jump
-> 0379: LDO  0032        Load global word BASE50
   037b: SLDC 01          Short load constant 1
   037c: SBI              Subtract integers (TOS-1 - TOS)
   037d: SLDC 07          Short load constant 7
   037e: LEQI             Integer TOS-1 <= TOS
   037f: FJP  $039a       Jump if TOS false
   0381: SLDO 06          Short load global BASE6
   0382: LAO  0008        Load global BASE8
   0384: LAO  0035        Load global BASE53
   0386: SLDC 01          Short load constant 1
   0387: LDO  0032        Load global word BASE50
   0389: SLDC 01          Short load constant 1
   038a: SBI              Subtract integers (TOS-1 - TOS)
   038b: CXP  00 19       Call external procedure PASCALSY.SCOPY
   038e: LAO  0035        Load global BASE53
   0390: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0392: LAO  0008        Load global BASE8
   0394: SLDC 01          Short load constant 1
   0395: LDO  0032        Load global word BASE50
   0397: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 039a: SLDO 06          Short load global BASE6
   039b: SLDC 00          Short load constant 0
   039c: LDB              Load byte at byte ptr TOS-1 + TOS
   039d: SLDC 00          Short load constant 0
   039e: GRTI             Integer TOS-1 > TOS
   039f: FJP  $04f9       Jump if TOS false
   03a1: LSA  01          Load string address: '['
   03a4: NOP              No operation
   03a5: LAO  0008        Load global BASE8
   03a7: SLDC 00          Short load constant 0
   03a8: SLDC 00          Short load constant 0
   03a9: CXP  00 1b       Call external procedure PASCALSY.SPOS
   03ac: SRO  0032        Store global word BASE50
   03ae: LDO  0032        Load global word BASE50
   03b0: SLDC 00          Short load constant 0
   03b1: GRTI             Integer TOS-1 > TOS
   03b2: FJP  $03bc       Jump if TOS false
   03b4: LDO  0032        Load global word BASE50
   03b6: SLDC 01          Short load constant 1
   03b7: SBI              Subtract integers (TOS-1 - TOS)
   03b8: SRO  0032        Store global word BASE50
   03ba: UJP  $03c2       Unconditional jump
-> 03bc: LAO  0008        Load global BASE8
   03be: SLDC 00          Short load constant 0
   03bf: LDB              Load byte at byte ptr TOS-1 + TOS
   03c0: SRO  0032        Store global word BASE50
-> 03c2: LDO  0032        Load global word BASE50
   03c4: SLDC 0f          Short load constant 15
   03c5: LEQI             Integer TOS-1 <= TOS
   03c6: FJP  $04f9       Jump if TOS false
   03c8: LDO  0032        Load global word BASE50
   03ca: SLDC 00          Short load constant 0
   03cb: GRTI             Integer TOS-1 > TOS
   03cc: FJP  $03e5       Jump if TOS false
   03ce: SLDO 05          Short load global BASE5
   03cf: LAO  0008        Load global BASE8
   03d1: LAO  0035        Load global BASE53
   03d3: SLDC 01          Short load constant 1
   03d4: LDO  0032        Load global word BASE50
   03d6: CXP  00 19       Call external procedure PASCALSY.SCOPY
   03d9: LAO  0035        Load global BASE53
   03db: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   03dd: LAO  0008        Load global BASE8
   03df: SLDC 01          Short load constant 1
   03e0: LDO  0032        Load global word BASE50
   03e2: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 03e5: LAO  0008        Load global BASE8
   03e7: SLDC 00          Short load constant 0
   03e8: LDB              Load byte at byte ptr TOS-1 + TOS
   03e9: SLDC 00          Short load constant 0
   03ea: EQUI             Integer TOS-1 = TOS
   03eb: FJP  $03f2       Jump if TOS false
   03ed: SLDC 01          Short load constant 1
   03ee: SRO  0034        Store global word BASE52
   03f0: UJP  $0469       Unconditional jump
-> 03f2: SLDC 00          Short load constant 0
   03f3: SRO  0034        Store global word BASE52
   03f5: LSA  01          Load string address: ']'
   03f8: NOP              No operation
   03f9: LAO  0008        Load global BASE8
   03fb: SLDC 00          Short load constant 0
   03fc: SLDC 00          Short load constant 0
   03fd: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0400: SRO  0031        Store global word BASE49
   0402: LDO  0031        Load global word BASE49
   0404: SLDC 02          Short load constant 2
   0405: EQUI             Integer TOS-1 = TOS
   0406: FJP  $040d       Jump if TOS false
   0408: SLDC 01          Short load constant 1
   0409: SRO  0034        Store global word BASE52
   040b: UJP  $0469       Unconditional jump
-> 040d: LDO  0031        Load global word BASE49
   040f: SLDC 02          Short load constant 2
   0410: GRTI             Integer TOS-1 > TOS
   0411: FJP  $0469       Jump if TOS false
   0413: SLDC 01          Short load constant 1
   0414: SRO  0034        Store global word BASE52
   0416: SLDC 02          Short load constant 2
   0417: SRO  0032        Store global word BASE50
-> 0419: LAO  0008        Load global BASE8
   041b: LDO  0032        Load global word BASE50
   041d: LDB              Load byte at byte ptr TOS-1 + TOS
   041e: SRO  0033        Store global word BASE51
   0420: LDO  0033        Load global word BASE51
   0422: LDA  01 007a     Load addr G122
   0425: LDM  04          Load 4 words from (TOS)
   0427: SLDC 04          Short load constant 4
   0428: INN              Set membership (TOS-1 in set TOS)
   0429: FJP  $0438       Jump if TOS false
   042b: SLDO 04          Short load global BASE4
   042c: SLDO 04          Short load global BASE4
   042d: SIND 00          Short index load *TOS+0
   042e: SLDC 0a          Short load constant 10
   042f: MPI              Multiply integers (TOS * TOS-1)
   0430: LDO  0033        Load global word BASE51
   0432: SLDC 30          Short load constant 48
   0433: SBI              Subtract integers (TOS-1 - TOS)
   0434: ADI              Add integers (TOS + TOS-1)
   0435: STO              Store indirect (TOS into TOS-1)
   0436: UJP  $043b       Unconditional jump
-> 0438: SLDC 00          Short load constant 0
   0439: SRO  0034        Store global word BASE52
-> 043b: LDO  0032        Load global word BASE50
   043d: SLDC 01          Short load constant 1
   043e: ADI              Add integers (TOS + TOS-1)
   043f: SRO  0032        Store global word BASE50
   0441: LDO  0032        Load global word BASE50
   0443: LDO  0031        Load global word BASE49
   0445: EQUI             Integer TOS-1 = TOS
   0446: LDO  0034        Load global word BASE52
   0448: LNOT             Logical NOT (~TOS)
   0449: LOR              Logical OR (TOS | TOS-1)
   044a: FJP  $0419       Jump if TOS false
   044c: LDO  0032        Load global word BASE50
   044e: SLDC 03          Short load constant 3
   044f: EQUI             Integer TOS-1 = TOS
   0450: LDO  0031        Load global word BASE49
   0452: SLDC 03          Short load constant 3
   0453: EQUI             Integer TOS-1 = TOS
   0454: LAND             Logical AND (TOS & TOS-1)
   0455: FJP  $0469       Jump if TOS false
   0457: LAO  0008        Load global BASE8
   0459: LDO  0032        Load global word BASE50
   045b: SLDC 01          Short load constant 1
   045c: SBI              Subtract integers (TOS-1 - TOS)
   045d: LDB              Load byte at byte ptr TOS-1 + TOS
   045e: SLDC 2a          Short load constant 42
   045f: EQUI             Integer TOS-1 = TOS
   0460: FJP  $0469       Jump if TOS false
   0462: SLDO 04          Short load global BASE4
   0463: SLDC 01          Short load constant 1
   0464: NGI              Negate integer
   0465: STO              Store indirect (TOS into TOS-1)
   0466: SLDC 01          Short load constant 1
   0467: SRO  0034        Store global word BASE52
-> 0469: LDO  0034        Load global word BASE52
   046b: SRO  0001        Store global word BASE1
   046d: LDO  0034        Load global word BASE52
   046f: SLDO 05          Short load global BASE5
   0470: SLDC 00          Short load constant 0
   0471: LDB              Load byte at byte ptr TOS-1 + TOS
   0472: SLDC 05          Short load constant 5
   0473: GRTI             Integer TOS-1 > TOS
   0474: LAND             Logical AND (TOS & TOS-1)
   0475: FJP  $04f9       Jump if TOS false
   0477: LAO  0008        Load global BASE8
   0479: SLDO 05          Short load global BASE5
   047a: LAO  0035        Load global BASE53
   047c: SLDO 05          Short load global BASE5
   047d: SLDC 00          Short load constant 0
   047e: LDB              Load byte at byte ptr TOS-1 + TOS
   047f: SLDC 04          Short load constant 4
   0480: SBI              Subtract integers (TOS-1 - TOS)
   0481: SLDC 05          Short load constant 5
   0482: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0485: LAO  0035        Load global BASE53
   0487: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0489: LAO  0008        Load global BASE8
   048b: LSA  05          Load string address: '.TEXT'
   0492: NOP              No operation
   0493: EQLSTR           String TOS-1 = TOS
   0495: FJP  $049c       Jump if TOS false
   0497: SLDO 03          Short load global BASE3
   0498: SLDC 03          Short load constant 3
   0499: STO              Store indirect (TOS into TOS-1)
   049a: UJP  $04f9       Unconditional jump
-> 049c: LAO  0008        Load global BASE8
   049e: NOP              No operation
   049f: LSA  05          Load string address: '.CODE'
   04a6: EQLSTR           String TOS-1 = TOS
   04a8: FJP  $04af       Jump if TOS false
   04aa: SLDO 03          Short load global BASE3
   04ab: SLDC 02          Short load constant 2
   04ac: STO              Store indirect (TOS into TOS-1)
   04ad: UJP  $04f9       Unconditional jump
-> 04af: LAO  0008        Load global BASE8
   04b1: LSA  05          Load string address: '.BACK'
   04b8: NOP              No operation
   04b9: EQLSTR           String TOS-1 = TOS
   04bb: FJP  $04c2       Jump if TOS false
   04bd: SLDO 03          Short load global BASE3
   04be: SLDC 03          Short load constant 3
   04bf: STO              Store indirect (TOS into TOS-1)
   04c0: UJP  $04f9       Unconditional jump
-> 04c2: LAO  0008        Load global BASE8
   04c4: NOP              No operation
   04c5: LSA  05          Load string address: '.INFO'
   04cc: EQLSTR           String TOS-1 = TOS
   04ce: FJP  $04d5       Jump if TOS false
   04d0: SLDO 03          Short load global BASE3
   04d1: SLDC 04          Short load constant 4
   04d2: STO              Store indirect (TOS into TOS-1)
   04d3: UJP  $04f9       Unconditional jump
-> 04d5: LAO  0008        Load global BASE8
   04d7: LSA  05          Load string address: '.GRAF'
   04de: NOP              No operation
   04df: EQLSTR           String TOS-1 = TOS
   04e1: FJP  $04e8       Jump if TOS false
   04e3: SLDO 03          Short load global BASE3
   04e4: SLDC 06          Short load constant 6
   04e5: STO              Store indirect (TOS into TOS-1)
   04e6: UJP  $04f9       Unconditional jump
-> 04e8: LAO  0008        Load global BASE8
   04ea: NOP              No operation
   04eb: LSA  05          Load string address: '.FOTO'
   04f2: EQLSTR           String TOS-1 = TOS
   04f4: FJP  $04f9       Jump if TOS false
   04f6: SLDO 03          Short load global BASE3
   04f7: SLDC 07          Short load constant 7
   04f8: STO              Store indirect (TOS into TOS-1)
-> 04f9: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC34(PARAM1; PARAM2) (* P=34 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
  BASE4
  BASE5
BEGIN
-> 0512: SLDO 01          Short load global BASE1
   0513: SLDC 00          Short load constant 0
   0514: IXA  000d        Index array (TOS-1 + TOS * 13)
   0516: SRO  0004        Store global word BASE4
   0518: SLDO 02          Short load global BASE2
   0519: SRO  0003        Store global word BASE3
   051b: SLDO 04          Short load global BASE4
   051c: IND  0008        Static index and load word (TOS+8)
   051e: SLDC 01          Short load constant 1
   051f: SBI              Subtract integers (TOS-1 - TOS)
   0520: SRO  0005        Store global word BASE5
-> 0522: SLDO 03          Short load global BASE3
   0523: SLDO 05          Short load global BASE5
   0524: LEQI             Integer TOS-1 <= TOS
   0525: FJP  $053a       Jump if TOS false
   0527: SLDO 01          Short load global BASE1
   0528: SLDO 03          Short load global BASE3
   0529: IXA  000d        Index array (TOS-1 + TOS * 13)
   052b: SLDO 01          Short load global BASE1
   052c: SLDO 03          Short load global BASE3
   052d: SLDC 01          Short load constant 1
   052e: ADI              Add integers (TOS + TOS-1)
   052f: IXA  000d        Index array (TOS-1 + TOS * 13)
   0531: MOV  000d        Move 13 words (TOS to TOS-1)
   0533: SLDO 03          Short load global BASE3
   0534: SLDC 01          Short load constant 1
   0535: ADI              Add integers (TOS + TOS-1)
   0536: SRO  0003        Store global word BASE3
   0538: UJP  $0522       Unconditional jump
-> 053a: SLDO 01          Short load global BASE1
   053b: SLDO 04          Short load global BASE4
   053c: IND  0008        Static index and load word (TOS+8)
   053e: IXA  000d        Index array (TOS-1 + TOS * 13)
   0540: INC  0003        Inc field ptr (TOS+3)
   0542: NOP              No operation
   0543: LSA  00          Load string address: ''
   0545: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0547: SLDO 04          Short load global BASE4
   0548: INC  0008        Inc field ptr (TOS+8)
   054a: SLDO 04          Short load global BASE4
   054b: IND  0008        Static index and load word (TOS+8)
   054d: SLDC 01          Short load constant 1
   054e: SBI              Subtract integers (TOS-1 - TOS)
   054f: STO              Store indirect (TOS into TOS-1)
-> 0550: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC35(PARAM1; PARAM2; PARAM3) (* P=35 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 055e: SLDO 01          Short load global BASE1
   055f: SLDC 00          Short load constant 0
   0560: IXA  000d        Index array (TOS-1 + TOS * 13)
   0562: SRO  0005        Store global word BASE5
   0564: SLDO 05          Short load global BASE5
   0565: IND  0008        Static index and load word (TOS+8)
   0567: SRO  0004        Store global word BASE4
   0569: SLDO 02          Short load global BASE2
   056a: SRO  0006        Store global word BASE6
-> 056c: SLDO 04          Short load global BASE4
   056d: SLDO 06          Short load global BASE6
   056e: GEQI             Integer TOS-1 >= TOS
   056f: FJP  $0584       Jump if TOS false
   0571: SLDO 01          Short load global BASE1
   0572: SLDO 04          Short load global BASE4
   0573: SLDC 01          Short load constant 1
   0574: ADI              Add integers (TOS + TOS-1)
   0575: IXA  000d        Index array (TOS-1 + TOS * 13)
   0577: SLDO 01          Short load global BASE1
   0578: SLDO 04          Short load global BASE4
   0579: IXA  000d        Index array (TOS-1 + TOS * 13)
   057b: MOV  000d        Move 13 words (TOS to TOS-1)
   057d: SLDO 04          Short load global BASE4
   057e: SLDC 01          Short load constant 1
   057f: SBI              Subtract integers (TOS-1 - TOS)
   0580: SRO  0004        Store global word BASE4
   0582: UJP  $056c       Unconditional jump
-> 0584: SLDO 01          Short load global BASE1
   0585: SLDO 02          Short load global BASE2
   0586: IXA  000d        Index array (TOS-1 + TOS * 13)
   0588: SLDO 03          Short load global BASE3
   0589: MOV  000d        Move 13 words (TOS to TOS-1)
   058b: SLDO 05          Short load global BASE5
   058c: INC  0008        Inc field ptr (TOS+8)
   058e: SLDO 05          Short load global BASE5
   058f: IND  0008        Static index and load word (TOS+8)
   0591: SLDC 01          Short load constant 1
   0592: ADI              Add integers (TOS + TOS-1)
   0593: STO              Store indirect (TOS into TOS-1)
-> 0594: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC36 (* P=36 LL=0 *)
BEGIN
-> 05a2: SLDC 04          Short load constant 4
   05a3: LOD  01 0001     Load word at G1 (SYSCOM)
   05a6: INC  001f        Inc field ptr (TOS+31)
   05a8: SLDC 08          Short load constant 8
   05a9: SLDC 08          Short load constant 8
   05aa: LDP              Load packed field (TOS)
   05ab: CBP  33          Call base procedure PASCALSY.51
-> 05ad: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC37 (* P=37 LL=0 *)
  BASE1
  BASE2
BEGIN
-> 05ba: CBP  24          Call base procedure PASCALSY.36
   05bc: LOD  01 0001     Load word at G1 (SYSCOM)
   05bf: SRO  0001        Store global word BASE1
   05c1: SLDO 01          Short load global BASE1
   05c2: INC  001f        Inc field ptr (TOS+31)
   05c4: SRO  0002        Store global word BASE2
   05c6: SLDC 03          Short load constant 3
   05c7: CSP  26          Call standard procedure UNITCLEAR
   05c9: SLDO 02          Short load global BASE2
   05ca: INC  0001        Inc field ptr (TOS+1)
   05cc: SLDC 08          Short load constant 8
   05cd: SLDC 00          Short load constant 0
   05ce: LDP              Load packed field (TOS)
   05cf: SLDC 00          Short load constant 0
   05d0: NEQI             Integer TOS-1 <> TOS
   05d1: FJP  $05de       Jump if TOS false
   05d3: SLDC 03          Short load constant 3
   05d4: SLDO 02          Short load global BASE2
   05d5: INC  0001        Inc field ptr (TOS+1)
   05d7: SLDC 08          Short load constant 8
   05d8: SLDC 00          Short load constant 0
   05d9: LDP              Load packed field (TOS)
   05da: CBP  33          Call base procedure PASCALSY.51
   05dc: UJP  $05e7       Unconditional jump
-> 05de: SLDC 06          Short load constant 6
   05df: SLDO 02          Short load global BASE2
   05e0: INC  0004        Inc field ptr (TOS+4)
   05e2: SLDC 08          Short load constant 8
   05e3: SLDC 08          Short load constant 8
   05e4: LDP              Load packed field (TOS)
   05e5: CBP  33          Call base procedure PASCALSY.51
-> 05e7: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC38 (* P=38 LL=0 *)
  BASE1
  BASE2
  BASE3
  BASE4
BEGIN
-> 05f4: LOD  01 0001     Load word at G1 (SYSCOM)
   05f7: SRO  0002        Store global word BASE2
   05f9: SLDO 02          Short load global BASE2
   05fa: INC  001f        Inc field ptr (TOS+31)
   05fc: SRO  0003        Store global word BASE3
   05fe: SLDO 03          Short load global BASE3
   05ff: INC  0001        Inc field ptr (TOS+1)
   0601: SLDC 08          Short load constant 8
   0602: SLDC 08          Short load constant 8
   0603: LDP              Load packed field (TOS)
   0604: SLDC 00          Short load constant 0
   0605: NEQI             Integer TOS-1 <> TOS
   0606: FJP  $0613       Jump if TOS false
   0608: SLDC 02          Short load constant 2
   0609: SLDO 03          Short load global BASE3
   060a: INC  0001        Inc field ptr (TOS+1)
   060c: SLDC 08          Short load constant 8
   060d: SLDC 08          Short load constant 8
   060e: LDP              Load packed field (TOS)
   060f: CBP  33          Call base procedure PASCALSY.51
   0611: UJP  $0665       Unconditional jump
-> 0613: SLDO 03          Short load global BASE3
   0614: INC  0004        Inc field ptr (TOS+4)
   0616: SLDC 08          Short load constant 8
   0617: SLDC 00          Short load constant 0
   0618: LDP              Load packed field (TOS)
   0619: SLDC 00          Short load constant 0
   061a: NEQI             Integer TOS-1 <> TOS
   061b: FJP  $0628       Jump if TOS false
   061d: SLDC 07          Short load constant 7
   061e: SLDO 03          Short load global BASE3
   061f: INC  0004        Inc field ptr (TOS+4)
   0621: SLDC 08          Short load constant 8
   0622: SLDC 00          Short load constant 0
   0623: LDP              Load packed field (TOS)
   0624: CBP  33          Call base procedure PASCALSY.51
   0626: UJP  $0665       Unconditional jump
-> 0628: SLDO 02          Short load global BASE2
   0629: INC  001d        Inc field ptr (TOS+29)
   062b: SLDC 01          Short load constant 1
   062c: SLDC 04          Short load constant 4
   062d: LDP              Load packed field (TOS)
   062e: LNOT             Logical NOT (~TOS)
   062f: SLDO 03          Short load global BASE3
   0630: INC  0002        Inc field ptr (TOS+2)
   0632: SLDC 08          Short load constant 8
   0633: SLDC 08          Short load constant 8
   0634: LDP              Load packed field (TOS)
   0635: SLDC 00          Short load constant 0
   0636: NEQI             Integer TOS-1 <> TOS
   0637: LAND             Logical AND (TOS & TOS-1)
   0638: FJP  $0665       Jump if TOS false
   063a: SLDC 02          Short load constant 2
   063b: SRO  0001        Store global word BASE1
   063d: SLDO 02          Short load global BASE2
   063e: IND  0026        Static index and load word (TOS+38)
   0640: SRO  0004        Store global word BASE4
-> 0642: SLDO 01          Short load global BASE1
   0643: SLDO 04          Short load global BASE4
   0644: LEQI             Integer TOS-1 <= TOS
   0645: FJP  $0656       Jump if TOS false
   0647: LOD  01 0003     Load word at G3 (OUTPUT)
   064a: SLDC 20          Short load constant 32
   064b: SLDC 00          Short load constant 0
   064c: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   064f: SLDO 01          Short load global BASE1
   0650: SLDC 01          Short load constant 1
   0651: ADI              Add integers (TOS + TOS-1)
   0652: SRO  0001        Store global word BASE1
   0654: UJP  $0642       Unconditional jump
-> 0656: LOD  01 0003     Load word at G3 (OUTPUT)
   0659: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   065c: SLDC 00          Short load constant 0
   065d: SLDO 03          Short load global BASE3
   065e: INC  0002        Inc field ptr (TOS+2)
   0660: SLDC 08          Short load constant 8
   0661: SLDC 08          Short load constant 8
   0662: LDP              Load packed field (TOS)
   0663: CBP  33          Call base procedure PASCALSY.51
-> 0665: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC39 (* P=39 LL=0 *)
  BASE1
  BASE2
BEGIN
-> 0674: CBP  24          Call base procedure PASCALSY.36
   0676: LOD  01 0001     Load word at G1 (SYSCOM)
   0679: SRO  0002        Store global word BASE2
   067b: CBP  26          Call base procedure PASCALSY.38
   067d: SLDO 02          Short load global BASE2
   067e: INC  001d        Inc field ptr (TOS+29)
   0680: SLDC 01          Short load constant 1
   0681: SLDC 04          Short load constant 4
   0682: LDP              Load packed field (TOS)
   0683: FJP  $06a6       Jump if TOS false
   0685: LDA  01 0046     Load addr G70
   0688: SLDC 00          Short load constant 0
   0689: LDB              Load byte at byte ptr TOS-1 + TOS
   068a: SLDC 00          Short load constant 0
   068b: SLDC 3a          Short load constant 58
   068c: LDA  01 0046     Load addr G70
   068f: SLDC 01          Short load constant 1
   0690: SLDC 00          Short load constant 0
   0691: CSP  0b          Call standard procedure SCAN
   0693: SRO  0001        Store global word BASE1
   0695: SLDO 01          Short load global BASE1
   0696: LDA  01 0046     Load addr G70
   0699: SLDC 00          Short load constant 0
   069a: LDB              Load byte at byte ptr TOS-1 + TOS
   069b: NEQI             Integer TOS-1 <> TOS
   069c: FJP  $06a6       Jump if TOS false
   069e: LDA  01 0046     Load addr G70
   06a1: SLDC 00          Short load constant 0
   06a2: SLDO 01          Short load global BASE1
   06a3: SLDC 01          Short load constant 1
   06a4: ADI              Add integers (TOS + TOS-1)
   06a5: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 06a6: LOD  01 0003     Load word at G3 (OUTPUT)
   06a9: LDA  01 0046     Load addr G70
   06ac: SLDC 00          Short load constant 0
   06ad: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 06b0: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC40(PARAM1): RETVAL (* P=40 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
BEGIN
-> 06bc: LOD  01 0003     Load word at G3 (OUTPUT)
   06bf: LSA  0c          Load string address: 'Type <space>'
   06cd: NOP              No operation
   06ce: SLDC 00          Short load constant 0
   06cf: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   06d2: LOD  01 0001     Load word at G1 (SYSCOM)
   06d5: INC  001d        Inc field ptr (TOS+29)
   06d7: SLDC 01          Short load constant 1
   06d8: SLDC 04          Short load constant 4
   06d9: LDP              Load packed field (TOS)
   06da: LNOT             Logical NOT (~TOS)
   06db: FJP  $06f3       Jump if TOS false
   06dd: LOD  01 0003     Load word at G3 (OUTPUT)
   06e0: NOP              No operation
   06e1: LSA  0c          Load string address: ' to continue'
   06ef: SLDC 00          Short load constant 0
   06f0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 06f3: SLDO 03          Short load global BASE3
   06f4: SLDC 00          Short load constant 0
   06f5: SLDC 00          Short load constant 0
   06f6: CBP  29          Call base procedure PASCALSY.41
   06f8: SRO  0004        Store global word BASE4
   06fa: LOD  01 0002     Load word at G2 (INPUT)
   06fd: SLDC 00          Short load constant 0
   06fe: SLDC 00          Short load constant 0
   06ff: CXP  00 0b       Call external procedure PASCALSY.FEOLN
   0702: LNOT             Logical NOT (~TOS)
   0703: FJP  $070b       Jump if TOS false
   0705: LOD  01 0003     Load word at G3 (OUTPUT)
   0708: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 070b: CBP  26          Call base procedure PASCALSY.38
   070d: SLDO 04          Short load global BASE4
   070e: SLDC 20          Short load constant 32
   070f: EQUI             Integer TOS-1 = TOS
   0710: SLDO 04          Short load global BASE4
   0711: LOD  01 0001     Load word at G1 (SYSCOM)
   0714: INC  002c        Inc field ptr (TOS+44)
   0716: SLDC 08          Short load constant 8
   0717: SLDC 08          Short load constant 8
   0718: LDP              Load packed field (TOS)
   0719: EQUI             Integer TOS-1 = TOS
   071a: LOR              Logical OR (TOS | TOS-1)
   071b: FJP  $06bc       Jump if TOS false
   071d: SLDO 04          Short load global BASE4
   071e: SLDC 20          Short load constant 32
   071f: NEQI             Integer TOS-1 <> TOS
   0720: SRO  0001        Store global word BASE1
-> 0722: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FUNC41(PARAM1): RETVAL (* P=41 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
BEGIN
-> 0730: SLDO 03          Short load global BASE3
   0731: FJP  $0736       Jump if TOS false
   0733: SLDC 01          Short load constant 1
   0734: CSP  26          Call standard procedure UNITCLEAR
-> 0736: LOD  01 003a     Load word at G58
   0739: SIND 02          Short index load *TOS+2
   073a: FJP  $0740       Jump if TOS false
   073c: SLDC 00          Short load constant 0
   073d: SLDC 30          Short load constant 48
   073e: CSP  04          Call standard procedure EXIT
-> 0740: LOD  01 003a     Load word at G58
   0743: INC  0003        Inc field ptr (TOS+3)
   0745: SLDC 01          Short load constant 1
   0746: STO              Store indirect (TOS into TOS-1)
   0747: LOD  01 0002     Load word at G2 (INPUT)
   074a: LAO  0004        Load global BASE4
   074c: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
   074f: SLDO 04          Short load global BASE4
   0750: SLDC 61          Short load constant 97
   0751: GEQI             Integer TOS-1 >= TOS
   0752: SLDO 04          Short load global BASE4
   0753: SLDC 7a          Short load constant 122
   0754: LEQI             Integer TOS-1 <= TOS
   0755: LAND             Logical AND (TOS & TOS-1)
   0756: FJP  $075f       Jump if TOS false
   0758: SLDO 04          Short load global BASE4
   0759: SLDC 61          Short load constant 97
   075a: SBI              Subtract integers (TOS-1 - TOS)
   075b: SLDC 41          Short load constant 65
   075c: ADI              Add integers (TOS + TOS-1)
   075d: SRO  0004        Store global word BASE4
-> 075f: SLDO 04          Short load global BASE4
   0760: SRO  0001        Store global word BASE1
-> 0762: RBP  01          Return from base procedure
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
-> 076e: SLDC 00          Short load constant 0
   076f: SRO  0001        Store global word BASE1
   0771: LOD  01 0001     Load word at G1 (SYSCOM)
   0774: SRO  0007        Store global word BASE7
   0776: LDA  01 007e     Load addr G126
   0779: SLDO 03          Short load global BASE3
   077a: IXA  0006        Index array (TOS-1 + TOS * 6)
   077c: SRO  0008        Store global word BASE8
   077e: SLDO 07          Short load global BASE7
   077f: SIND 04          Short index load *TOS+4
   0780: LDCN             Load constant NIL
   0781: EQUI             Integer TOS-1 = TOS
   0782: FJP  $078c       Jump if TOS false
   0784: SLDO 07          Short load global BASE7
   0785: INC  0004        Inc field ptr (TOS+4)
   0787: LDCI 03f6        Load word 1014
   078a: CSP  01          Call standard procedure NEW
-> 078c: SLDO 03          Short load global BASE3
   078d: SLDO 07          Short load global BASE7
   078e: SIND 04          Short index load *TOS+4
   078f: SLDC 00          Short load constant 0
   0790: LDCI 07ec        Load word 2028
   0793: SLDC 02          Short load constant 2
   0794: SLDC 00          Short load constant 0
   0795: CSP  05          Call standard procedure UNITREAD
   0797: SLDO 07          Short load global BASE7
   0798: SIND 00          Short index load *TOS+0
   0799: SLDC 00          Short load constant 0
   079a: EQUI             Integer TOS-1 = TOS
   079b: SRO  0005        Store global word BASE5
   079d: SLDO 05          Short load global BASE5
   079e: FJP  $0885       Jump if TOS false
   07a0: SLDO 07          Short load global BASE7
   07a1: SIND 04          Short index load *TOS+4
   07a2: SLDC 00          Short load constant 0
   07a3: IXA  000d        Index array (TOS-1 + TOS * 13)
   07a5: SRO  0009        Store global word BASE9
   07a7: SLDC 00          Short load constant 0
   07a8: SRO  0005        Store global word BASE5
   07aa: SLDO 09          Short load global BASE9
   07ab: SIND 00          Short index load *TOS+0
   07ac: SLDC 00          Short load constant 0
   07ad: EQUI             Integer TOS-1 = TOS
   07ae: SLDO 07          Short load global BASE7
   07af: INC  001d        Inc field ptr (TOS+29)
   07b1: SLDC 02          Short load constant 2
   07b2: SLDC 07          Short load constant 7
   07b3: LDP              Load packed field (TOS)
   07b4: SLDC 02          Short load constant 2
   07b5: EQUI             Integer TOS-1 = TOS
   07b6: SLDO 07          Short load global BASE7
   07b7: INC  001d        Inc field ptr (TOS+29)
   07b9: SLDC 02          Short load constant 2
   07ba: SLDC 07          Short load constant 7
   07bb: LDP              Load packed field (TOS)
   07bc: SLDC 0a          Short load constant 10
   07bd: SLDC 01          Short load constant 1
   07be: INN              Set membership (TOS-1 in set TOS)
   07bf: SLDO 09          Short load global BASE9
   07c0: INC  0002        Inc field ptr (TOS+2)
   07c2: SLDC 04          Short load constant 4
   07c3: SLDC 00          Short load constant 0
   07c4: LDP              Load packed field (TOS)
   07c5: SLDC 08          Short load constant 8
   07c6: EQUI             Integer TOS-1 = TOS
   07c7: LAND             Logical AND (TOS & TOS-1)
   07c8: LOR              Logical OR (TOS | TOS-1)
   07c9: SLDO 07          Short load global BASE7
   07ca: INC  001d        Inc field ptr (TOS+29)
   07cc: SLDC 02          Short load constant 2
   07cd: SLDC 07          Short load constant 7
   07ce: LDP              Load packed field (TOS)
   07cf: SLDC 00          Short load constant 0
   07d0: EQUI             Integer TOS-1 = TOS
   07d1: SLDO 09          Short load global BASE9
   07d2: INC  0002        Inc field ptr (TOS+2)
   07d4: SLDC 04          Short load constant 4
   07d5: SLDC 00          Short load constant 0
   07d6: LDP              Load packed field (TOS)
   07d7: SLDC 00          Short load constant 0
   07d8: EQUI             Integer TOS-1 = TOS
   07d9: LAND             Logical AND (TOS & TOS-1)
   07da: LOR              Logical OR (TOS | TOS-1)
   07db: LAND             Logical AND (TOS & TOS-1)
   07dc: FJP  $086f       Jump if TOS false
   07de: SLDO 09          Short load global BASE9
   07df: INC  0003        Inc field ptr (TOS+3)
   07e1: SLDC 00          Short load constant 0
   07e2: LDB              Load byte at byte ptr TOS-1 + TOS
   07e3: SLDC 00          Short load constant 0
   07e4: GRTI             Integer TOS-1 > TOS
   07e5: SLDO 09          Short load global BASE9
   07e6: INC  0003        Inc field ptr (TOS+3)
   07e8: SLDC 00          Short load constant 0
   07e9: LDB              Load byte at byte ptr TOS-1 + TOS
   07ea: SLDC 07          Short load constant 7
   07eb: LEQI             Integer TOS-1 <= TOS
   07ec: LAND             Logical AND (TOS & TOS-1)
   07ed: SLDO 09          Short load global BASE9
   07ee: IND  0008        Static index and load word (TOS+8)
   07f0: SLDC 00          Short load constant 0
   07f1: GEQI             Integer TOS-1 >= TOS
   07f2: LAND             Logical AND (TOS & TOS-1)
   07f3: SLDO 09          Short load global BASE9
   07f4: IND  0008        Static index and load word (TOS+8)
   07f6: SLDC 4d          Short load constant 77
   07f7: LEQI             Integer TOS-1 <= TOS
   07f8: LAND             Logical AND (TOS & TOS-1)
   07f9: FJP  $086f       Jump if TOS false
   07fb: SLDC 01          Short load constant 1
   07fc: SRO  0005        Store global word BASE5
   07fe: SLDO 09          Short load global BASE9
   07ff: INC  0003        Inc field ptr (TOS+3)
   0801: SLDO 08          Short load global BASE8
   0802: NEQSTR           String TOS-1 <> TOS
   0804: FJP  $086f       Jump if TOS false
   0806: SLDC 01          Short load constant 1
   0807: SRO  0004        Store global word BASE4
-> 0809: SLDO 04          Short load global BASE4
   080a: SLDO 09          Short load global BASE9
   080b: IND  0008        Static index and load word (TOS+8)
   080d: LEQI             Integer TOS-1 <= TOS
   080e: FJP  $0856       Jump if TOS false
   0810: SLDO 07          Short load global BASE7
   0811: SIND 04          Short index load *TOS+4
   0812: SLDO 04          Short load global BASE4
   0813: IXA  000d        Index array (TOS-1 + TOS * 13)
   0815: SRO  000a        Store global word BASE10
   0817: SLDO 0a          Short load global BASE10
   0818: INC  0003        Inc field ptr (TOS+3)
   081a: SLDC 00          Short load constant 0
   081b: LDB              Load byte at byte ptr TOS-1 + TOS
   081c: SLDC 00          Short load constant 0
   081d: LEQI             Integer TOS-1 <= TOS
   081e: SLDO 0a          Short load global BASE10
   081f: INC  0003        Inc field ptr (TOS+3)
   0821: SLDC 00          Short load constant 0
   0822: LDB              Load byte at byte ptr TOS-1 + TOS
   0823: SLDC 0f          Short load constant 15
   0824: GRTI             Integer TOS-1 > TOS
   0825: LOR              Logical OR (TOS | TOS-1)
   0826: SLDO 0a          Short load global BASE10
   0827: SIND 01          Short index load *TOS+1
   0828: SLDO 0a          Short load global BASE10
   0829: SIND 00          Short index load *TOS+0
   082a: LESI             Integer TOS-1 < TOS
   082b: LOR              Logical OR (TOS | TOS-1)
   082c: SLDO 0a          Short load global BASE10
   082d: IND  000b        Static index and load word (TOS+11)
   082f: LDCI 0200        Load word 512
   0832: GRTI             Integer TOS-1 > TOS
   0833: LOR              Logical OR (TOS | TOS-1)
   0834: SLDO 0a          Short load global BASE10
   0835: IND  000b        Static index and load word (TOS+11)
   0837: SLDC 00          Short load constant 0
   0838: LEQI             Integer TOS-1 <= TOS
   0839: LOR              Logical OR (TOS | TOS-1)
   083a: SLDO 0a          Short load global BASE10
   083b: INC  000c        Inc field ptr (TOS+12)
   083d: SLDC 07          Short load constant 7
   083e: SLDC 09          Short load constant 9
   083f: LDP              Load packed field (TOS)
   0840: SLDC 64          Short load constant 100
   0841: GEQI             Integer TOS-1 >= TOS
   0842: LOR              Logical OR (TOS | TOS-1)
   0843: FJP  $084f       Jump if TOS false
   0845: SLDC 00          Short load constant 0
   0846: SRO  0005        Store global word BASE5
   0848: SLDO 04          Short load global BASE4
   0849: SLDO 07          Short load global BASE7
   084a: SIND 04          Short index load *TOS+4
   084b: CBP  22          Call base procedure PASCALSY.34
   084d: UJP  $0854       Unconditional jump
-> 084f: SLDO 04          Short load global BASE4
   0850: SLDC 01          Short load constant 1
   0851: ADI              Add integers (TOS + TOS-1)
   0852: SRO  0004        Store global word BASE4
-> 0854: UJP  $0809       Unconditional jump
-> 0856: SLDO 05          Short load global BASE5
   0857: LNOT             Logical NOT (~TOS)
   0858: FJP  $086f       Jump if TOS false
   085a: SLDO 03          Short load global BASE3
   085b: SLDO 07          Short load global BASE7
   085c: SIND 04          Short index load *TOS+4
   085d: SLDC 00          Short load constant 0
   085e: SLDO 09          Short load global BASE9
   085f: IND  0008        Static index and load word (TOS+8)
   0861: SLDC 01          Short load constant 1
   0862: ADI              Add integers (TOS + TOS-1)
   0863: SLDC 1a          Short load constant 26
   0864: MPI              Multiply integers (TOS * TOS-1)
   0865: SLDC 02          Short load constant 2
   0866: SLDC 00          Short load constant 0
   0867: CSP  06          Call standard procedure UNITWRITE
   0869: SLDO 07          Short load global BASE7
   086a: SIND 00          Short index load *TOS+0
   086b: SLDC 00          Short load constant 0
   086c: EQUI             Integer TOS-1 = TOS
   086d: SRO  0005        Store global word BASE5
-> 086f: SLDO 05          Short load global BASE5
   0870: FJP  $0885       Jump if TOS false
   0872: SLDO 08          Short load global BASE8
   0873: SLDO 09          Short load global BASE9
   0874: INC  0003        Inc field ptr (TOS+3)
   0876: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0878: SLDO 08          Short load global BASE8
   0879: INC  0005        Inc field ptr (TOS+5)
   087b: SLDO 09          Short load global BASE9
   087c: SIND 07          Short index load *TOS+7
   087d: STO              Store indirect (TOS into TOS-1)
   087e: LAO  0006        Load global BASE6
   0880: SLDO 09          Short load global BASE9
   0881: INC  0009        Inc field ptr (TOS+9)
   0883: CSP  09          Call standard procedure TIME
-> 0885: SLDO 05          Short load global BASE5
   0886: SRO  0001        Store global word BASE1
   0888: SLDO 05          Short load global BASE5
   0889: LNOT             Logical NOT (~TOS)
   088a: FJP  $08a3       Jump if TOS false
   088c: SLDO 08          Short load global BASE8
   088d: LSA  00          Load string address: ''
   088f: NOP              No operation
   0890: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0892: SLDO 08          Short load global BASE8
   0893: INC  0005        Inc field ptr (TOS+5)
   0895: LDCI 7fff        Load word 32767
   0898: STO              Store indirect (TOS into TOS-1)
   0899: SLDO 07          Short load global BASE7
   089a: INC  0004        Inc field ptr (TOS+4)
   089c: CSP  21          Call standard procedure RELEASE
   089e: SLDO 07          Short load global BASE7
   089f: INC  0004        Inc field ptr (TOS+4)
   08a1: LDCN             Load constant NIL
   08a2: STO              Store indirect (TOS into TOS-1)
-> 08a3: RBP  01          Return from base procedure
END

### PROCEDURE PASCALSY.PROC43(PARAM1; PARAM2; PARAM3) (* P=43 LL=0 *)
  BASE1=PARAM3
  BASE2=PARAM2
  BASE3=PARAM1
  BASE4
  BASE294
BEGIN
-> 08b6: SLDC 04          Short load constant 4
   08b7: LAO  0004        Load global BASE4
   08b9: SLDO 03          Short load global BASE3
   08ba: SLDO 02          Short load global BASE2
   08bb: LDO  0126        Load global word BASE294
   08be: SLDO 01          Short load global BASE1
   08bf: CXP  06 01       Call external procedure FILEPROC.1
-> 08c2: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC44(PARAM1) (* P=44 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 08ce: LOD  01 014f     Load word at G335
   08d2: LOD  01 0151     Load word at G337
   08d6: SLDO 01          Short load global BASE1
   08d7: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   08d8: LOD  01 0151     Load word at G337
   08dc: SLDC 01          Short load constant 1
   08dd: ADI              Add integers (TOS + TOS-1)
   08de: STR  01 0151     Store TOS to G337
   08e2: LOD  01 0151     Load word at G337
   08e6: LDCI 01fd        Load word 509
   08e9: GRTI             Integer TOS-1 > TOS
   08ea: LOD  01 0153     Load word at G339
   08ee: LAND             Logical AND (TOS & TOS-1)
   08ef: FJP  $08ff       Jump if TOS false
   08f1: LOD  01 014f     Load word at G335
   08f5: LOD  01 0151     Load word at G337
   08f9: SLDC 0d          Short load constant 13
   08fa: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   08fb: CBP  2f          Call base procedure PASCALSY.47
   08fd: UJP  $090b       Unconditional jump
-> 08ff: LOD  01 0151     Load word at G337
   0903: LDCI 01ff        Load word 511
   0906: GRTI             Integer TOS-1 > TOS
   0907: FJP  $090b       Jump if TOS false
   0909: CBP  2f          Call base procedure PASCALSY.47
-> 090b: SLDO 01          Short load global BASE1
   090c: LOD  01 015b     Load word at G347
   0910: EQUI             Integer TOS-1 = TOS
   0911: FJP  $0921       Jump if TOS false
   0913: LOD  01 015a     Load word at G346
   0917: LOD  01 015b     Load word at G347
   091b: EQUI             Integer TOS-1 = TOS
   091c: FJP  $0921       Jump if TOS false
   091e: SLDC 01          Short load constant 1
   091f: CBP  2d          Call base procedure PASCALSY.45
-> 0921: SLDO 01          Short load global BASE1
   0922: STR  01 015a     Store TOS to G346
-> 0926: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC45(PARAM1) (* P=45 LL=0 *)
  BASE1=PARAM1
BEGIN
-> 0932: LOD  01 0154     Load word at G340
   0936: FJP  $0947       Jump if TOS false
   0938: SLDC 00          Short load constant 0
   0939: STR  01 0154     Store TOS to G340
   093d: LDA  01 015c     Load addr G348
   0941: SLDC 00          Short load constant 0
   0942: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0945: UJP  $097a       Unconditional jump
-> 0947: SLDO 01          Short load global BASE1
   0948: FJP  $096d       Jump if TOS false
   094a: SLDC 20          Short load constant 32
   094b: STR  01 015a     Store TOS to G346
   094f: LOD  01 015b     Load word at G347
   0953: CBP  2c          Call base procedure PASCALSY.44
   0955: SLDC 20          Short load constant 32
   0956: STR  01 015a     Store TOS to G346
   095a: LOD  01 015b     Load word at G347
   095e: CBP  2c          Call base procedure PASCALSY.44
   0960: SLDC 0d          Short load constant 13
   0961: CBP  2c          Call base procedure PASCALSY.44
   0963: CBP  2f          Call base procedure PASCALSY.47
   0965: LOD  01 0153     Load word at G339
   0969: FJP  $096d       Jump if TOS false
   096b: CBP  2f          Call base procedure PASCALSY.47
-> 096d: SLDC 00          Short load constant 0
   096e: STR  01 0155     Store TOS to G341
   0972: LDA  01 015c     Load addr G348
   0976: SLDC 01          Short load constant 1
   0977: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 097a: LOD  01 0150     Load word at G336
   097e: STR  01 0036     Store TOS to G54
   0981: SLDC 01          Short load constant 1
   0982: STR  01 0157     Store TOS to G343
-> 0986: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC46 (* P=46 LL=0 *)
BEGIN
-> 0992: LOD  01 0153     Load word at G339
   0996: SLDC 01          Short load constant 1
   0997: ADI              Add integers (TOS + TOS-1)
   0998: STR  01 0153     Store TOS to G339
   099c: LDA  01 015c     Load addr G348
   09a0: LOD  01 014f     Load word at G335
   09a4: SLDC 00          Short load constant 0
   09a5: SLDC 01          Short load constant 1
   09a6: LOD  01 0153     Load word at G339
   09aa: SLDC 01          Short load constant 1
   09ab: SLDC 00          Short load constant 0
   09ac: SLDC 00          Short load constant 0
   09ad: CXP  00 1c       Call external procedure PASCALSY.FBLOCKIO
   09b0: SLDC 01          Short load constant 1
   09b1: NEQI             Integer TOS-1 <> TOS
   09b2: FJP  $09e6       Jump if TOS false
   09b4: LOD  01 0003     Load word at G3 (OUTPUT)
   09b7: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   09ba: LOD  01 0003     Load word at G3 (OUTPUT)
   09bd: LSA  17          Load string address: 'Error reading exec file'
   09d6: NOP              No operation
   09d7: SLDC 00          Short load constant 0
   09d8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09db: LOD  01 0003     Load word at G3 (OUTPUT)
   09de: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   09e1: SLDC 01          Short load constant 1
   09e2: CBP  2d          Call base procedure PASCALSY.45
   09e4: UJP  $0a12       Unconditional jump
-> 09e6: SLDC 00          Short load constant 0
   09e7: STR  01 0151     Store TOS to G337
   09eb: LOD  01 0153     Load word at G339
   09ef: FJP  $0a0b       Jump if TOS false
   09f1: LDCI 01fe        Load word 510
   09f4: LDCI 01ff        Load word 511
   09f7: NGI              Negate integer
   09f8: SLDC 00          Short load constant 0
   09f9: SLDC 0d          Short load constant 13
   09fa: LOD  01 014f     Load word at G335
   09fe: LDCI 01ff        Load word 511
   0a01: SLDC 00          Short load constant 0
   0a02: CSP  0b          Call standard procedure SCAN
   0a04: ADI              Add integers (TOS + TOS-1)
   0a05: STR  01 0152     Store TOS to G338
   0a09: UJP  $0a12       Unconditional jump
-> 0a0b: LDCI 01ff        Load word 511
   0a0e: STR  01 0152     Store TOS to G338
-> 0a12: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC47 (* P=47 LL=0 *)
BEGIN
-> 0a1e: LDA  01 015c     Load addr G348
   0a22: LOD  01 014f     Load word at G335
   0a26: SLDC 00          Short load constant 0
   0a27: SLDC 01          Short load constant 1
   0a28: LOD  01 0153     Load word at G339
   0a2c: SLDC 00          Short load constant 0
   0a2d: SLDC 00          Short load constant 0
   0a2e: SLDC 00          Short load constant 0
   0a2f: CXP  00 1c       Call external procedure PASCALSY.FBLOCKIO
   0a32: SLDC 01          Short load constant 1
   0a33: NEQI             Integer TOS-1 <> TOS
   0a34: FJP  $0a68       Jump if TOS false
   0a36: LOD  01 0003     Load word at G3 (OUTPUT)
   0a39: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a3c: LOD  01 0003     Load word at G3 (OUTPUT)
   0a3f: LSA  17          Load string address: 'Error writing exec file'
   0a58: NOP              No operation
   0a59: SLDC 00          Short load constant 0
   0a5a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0a5d: LOD  01 0003     Load word at G3 (OUTPUT)
   0a60: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0a63: SLDC 00          Short load constant 0
   0a64: CBP  2d          Call base procedure PASCALSY.45
   0a66: UJP  $0a82       Unconditional jump
-> 0a68: LOD  01 014f     Load word at G335
   0a6c: SLDC 00          Short load constant 0
   0a6d: LDCI 0200        Load word 512
   0a70: SLDC 00          Short load constant 0
   0a71: CSP  0a          Call standard procedure FLCH
   0a73: SLDC 00          Short load constant 0
   0a74: STR  01 0151     Store TOS to G337
   0a78: LOD  01 0153     Load word at G339
   0a7c: SLDC 01          Short load constant 1
   0a7d: ADI              Add integers (TOS + TOS-1)
   0a7e: STR  01 0153     Store TOS to G339
-> 0a82: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC48 (* P=48 LL=0 *)
  BASE2
BEGIN
-> 0a8e: SLDC 00          Short load constant 0
   0a8f: STR  01 0045     Store TOS to G69
   0a92: SLDC 00          Short load constant 0
   0a93: SRO  0002        Store global word BASE2
-> 0a95: CLP  39          Call local procedure PASCALSY.57
   0a97: SLDO 02          Short load global BASE2
   0a98: FJP  $0a9f       Jump if TOS false
   0a9a: LDCN             Load constant NIL
   0a9b: LDCN             Load constant NIL
   0a9c: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
-> 0a9f: LOD  01 0045     Load word at G69
   0aa2: SLDC 00          Short load constant 0
   0aa3: EQUI             Integer TOS-1 = TOS
   0aa4: FJP  $0a95       Jump if TOS false
-> 0aa6: RBP  00          Return from base procedure
END

### PROCEDURE PASCALSY.PROC49 (* P=49 LL=1 *)
  MP1
  MP2
BEGIN
-> 0ab4: LOD  02 0001     Load word at G1 (SYSCOM)
   0ab7: STL  0001        Store TOS into MP1
   0ab9: LOD  02 0001     Load word at G1 (SYSCOM)
   0abc: SIND 05          Short index load *TOS+5
   0abd: STL  0002        Store TOS into MP2
   0abf: LOD  02 0003     Load word at G3 (OUTPUT)
   0ac2: NOP              No operation
   0ac3: LSA  03          Load string address: 'S# '
   0ac8: SLDC 00          Short load constant 0
   0ac9: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0acc: LOD  02 0003     Load word at G3 (OUTPUT)
   0acf: SLDL 02          Short load local MP2
   0ad0: SIND 03          Short index load *TOS+3
   0ad1: SLDC 00          Short load constant 0
   0ad2: LDB              Load byte at byte ptr TOS-1 + TOS
   0ad3: SLDC 00          Short load constant 0
   0ad4: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0ad7: LOD  02 0003     Load word at G3 (OUTPUT)
   0ada: NOP              No operation
   0adb: LSA  05          Load string address: ', P# '
   0ae2: SLDC 00          Short load constant 0
   0ae3: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ae6: LOD  02 0003     Load word at G3 (OUTPUT)
   0ae9: SLDL 02          Short load local MP2
   0aea: SIND 02          Short index load *TOS+2
   0aeb: SLDC 00          Short load constant 0
   0aec: LDB              Load byte at byte ptr TOS-1 + TOS
   0aed: SLDC 00          Short load constant 0
   0aee: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0af1: LOD  02 0003     Load word at G3 (OUTPUT)
   0af4: NOP              No operation
   0af5: LSA  05          Load string address: ', I# '
   0afc: SLDC 00          Short load constant 0
   0afd: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b00: SLDL 01          Short load local MP1
   0b01: INC  001d        Inc field ptr (TOS+29)
   0b03: SLDC 01          Short load constant 1
   0b04: SLDC 0a          Short load constant 10
   0b05: LDP              Load packed field (TOS)
   0b06: FJP  $0b19       Jump if TOS false
   0b08: LOD  02 0003     Load word at G3 (OUTPUT)
   0b0b: SLDL 02          Short load local MP2
   0b0c: SIND 04          Short index load *TOS+4
   0b0d: SLDC 00          Short load constant 0
   0b0e: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0b11: LOD  02 0003     Load word at G3 (OUTPUT)
   0b14: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b17: UJP  $0b35       Unconditional jump
-> 0b19: LOD  02 0003     Load word at G3 (OUTPUT)
   0b1c: SLDL 02          Short load local MP2
   0b1d: SIND 04          Short index load *TOS+4
   0b1e: SLDL 02          Short load local MP2
   0b1f: SIND 02          Short index load *TOS+2
   0b20: SLDC 02          Short load constant 2
   0b21: SBI              Subtract integers (TOS-1 - TOS)
   0b22: SLDL 02          Short load local MP2
   0b23: SIND 02          Short index load *TOS+2
   0b24: SLDC 01          Short load constant 1
   0b25: NGI              Negate integer
   0b26: IXA  0001        Index array (TOS-1 + TOS * 1)
   0b28: SIND 00          Short index load *TOS+0
   0b29: SBI              Subtract integers (TOS-1 - TOS)
   0b2a: SBI              Subtract integers (TOS-1 - TOS)
   0b2b: SLDC 00          Short load constant 0
   0b2c: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0b2f: LOD  02 0003     Load word at G3 (OUTPUT)
   0b32: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0b35: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC50 (* P=50 LL=1 *)
  MP1
BEGIN
-> 0b42: LOD  02 0001     Load word at G1 (SYSCOM)
   0b45: STL  0001        Store TOS into MP1
   0b47: LOD  02 0003     Load word at G3 (OUTPUT)
   0b4a: NOP              No operation
   0b4b: LSA  0b          Load string address: 'Exec err # '
   0b58: SLDC 00          Short load constant 0
   0b59: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b5c: LOD  02 0003     Load word at G3 (OUTPUT)
   0b5f: SLDL 01          Short load local MP1
   0b60: SIND 01          Short index load *TOS+1
   0b61: SLDC 00          Short load constant 0
   0b62: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0b65: LOD  02 0003     Load word at G3 (OUTPUT)
   0b68: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b6b: SLDL 01          Short load local MP1
   0b6c: SIND 01          Short index load *TOS+1
   0b6d: SLDC 0a          Short load constant 10
   0b6e: EQUI             Integer TOS-1 = TOS
   0b6f: FJP  $0b83       Jump if TOS false
   0b71: LOD  02 0003     Load word at G3 (OUTPUT)
   0b74: SLDC 2c          Short load constant 44
   0b75: SLDC 00          Short load constant 0
   0b76: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0b79: LOD  02 0003     Load word at G3 (OUTPUT)
   0b7c: SLDL 01          Short load local MP1
   0b7d: IND  000b        Static index and load word (TOS+11)
   0b7f: SLDC 00          Short load constant 0
   0b80: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
-> 0b83: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC51(PARAM1; PARAM2) (* P=51 LL=0 *)
  BASE1=PARAM2
  BASE2=PARAM1
  BASE3
BEGIN
-> 0b90: LOD  01 0001     Load word at G1 (SYSCOM)
   0b93: SRO  0003        Store global word BASE3
   0b95: SLDO 01          Short load global BASE1
   0b96: SLDC 00          Short load constant 0
   0b97: NEQI             Integer TOS-1 <> TOS
   0b98: FJP  $0bc8       Jump if TOS false
   0b9a: SLDO 03          Short load global BASE3
   0b9b: INC  0024        Inc field ptr (TOS+36)
   0b9d: SLDO 02          Short load global BASE2
   0b9e: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0ba1: LDP              Load packed field (TOS)
   0ba2: FJP  $0bb1       Jump if TOS false
   0ba4: LOD  01 0003     Load word at G3 (OUTPUT)
   0ba7: SLDO 03          Short load global BASE3
   0ba8: INC  001f        Inc field ptr (TOS+31)
   0baa: SLDC 08          Short load constant 8
   0bab: SLDC 00          Short load constant 0
   0bac: LDP              Load packed field (TOS)
   0bad: SLDC 00          Short load constant 0
   0bae: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 0bb1: LOD  01 0003     Load word at G3 (OUTPUT)
   0bb4: SLDO 01          Short load global BASE1
   0bb5: SLDC 00          Short load constant 0
   0bb6: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0bb9: SLDC 0b          Short load constant 11
   0bba: SLDC 00          Short load constant 0
   0bbb: GRTI             Integer TOS-1 > TOS
   0bbc: FJP  $0bc8       Jump if TOS false
   0bbe: LOD  01 0003     Load word at G3 (OUTPUT)
   0bc1: LDA  01 0074     Load addr G116
   0bc4: SLDC 00          Short load constant 0
   0bc5: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0bc8: RBP  00          Return from base procedure
END

### FUNCTION PASCALSY.FUNC52(PARAM1; PARAM2; PARAM3): RETVAL (* P=52 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM3
  BASE4=PARAM2
  BASE5=PARAM1
  BASE6
  BASE10
  BASE11
  BASE12
BEGIN
-> 0bd4: SLDC 00          Short load constant 0
   0bd5: SRO  0001        Store global word BASE1
   0bd7: LOD  01 0001     Load word at G1 (SYSCOM)
   0bda: SRO  000a        Store global word BASE10
   0bdc: SLDO 0a          Short load global BASE10
   0bdd: INC  001f        Inc field ptr (TOS+31)
   0bdf: SRO  000b        Store global word BASE11
   0be1: SLDO 05          Short load global BASE5
   0be2: SLDO 0a          Short load global BASE10
   0be3: INC  002c        Inc field ptr (TOS+44)
   0be5: SLDC 08          Short load constant 8
   0be6: SLDC 00          Short load constant 0
   0be7: LDP              Load packed field (TOS)
   0be8: EQUI             Integer TOS-1 = TOS
   0be9: FJP  $0c9e       Jump if TOS false
   0beb: SLDC 01          Short load constant 1
   0bec: SRO  0001        Store global word BASE1
   0bee: SLDO 0b          Short load global BASE11
   0bef: INC  0003        Inc field ptr (TOS+3)
   0bf1: SLDC 08          Short load constant 8
   0bf2: SLDC 00          Short load constant 0
   0bf3: LDP              Load packed field (TOS)
   0bf4: SLDC 00          Short load constant 0
   0bf5: EQUI             Integer TOS-1 = TOS
   0bf6: SLDO 0a          Short load global BASE10
   0bf7: INC  001d        Inc field ptr (TOS+29)
   0bf9: SLDC 01          Short load constant 1
   0bfa: SLDC 04          Short load constant 4
   0bfb: LDP              Load packed field (TOS)
   0bfc: LOR              Logical OR (TOS | TOS-1)
   0bfd: FJP  $0c18       Jump if TOS false
   0bff: SLDO 04          Short load global BASE4
   0c00: SLDC 01          Short load constant 1
   0c01: STO              Store indirect (TOS into TOS-1)
   0c02: LOD  01 0003     Load word at G3 (OUTPUT)
   0c05: LSA  04          Load string address: '<DEL'
   0c0b: NOP              No operation
   0c0c: SLDC 00          Short load constant 0
   0c0d: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c10: LOD  01 0003     Load word at G3 (OUTPUT)
   0c13: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0c16: UJP  $0c9c       Unconditional jump
-> 0c18: LAO  0006        Load global BASE6
   0c1a: NOP              No operation
   0c1b: LSA  03          Load string address: '   '
   0c20: SAS  06          String assign (TOS to TOS-1, 6 chars)
   0c22: SLDO 0b          Short load global BASE11
   0c23: INC  0005        Inc field ptr (TOS+5)
   0c25: SLDC 05          Short load constant 5
   0c26: IXP  10 01       Index packed array TOS-1[TOS], 16 elts/word, 1 field width
   0c29: LDP              Load packed field (TOS)
   0c2a: FJP  $0c36       Jump if TOS false
   0c2c: LAO  0006        Load global BASE6
   0c2e: SLDC 01          Short load constant 1
   0c2f: SLDO 0b          Short load global BASE11
   0c30: SLDC 08          Short load constant 8
   0c31: SLDC 00          Short load constant 0
   0c32: LDP              Load packed field (TOS)
   0c33: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0c34: UJP  $0c3b       Unconditional jump
-> 0c36: LAO  0006        Load global BASE6
   0c38: SLDC 01          Short load constant 1
   0c39: SLDC 00          Short load constant 0
   0c3a: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0c3b: LAO  0006        Load global BASE6
   0c3d: SLDC 02          Short load constant 2
   0c3e: SLDO 0b          Short load global BASE11
   0c3f: INC  0003        Inc field ptr (TOS+3)
   0c41: SLDC 08          Short load constant 8
   0c42: SLDC 00          Short load constant 0
   0c43: LDP              Load packed field (TOS)
   0c44: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0c45: LAO  0006        Load global BASE6
   0c47: SLDC 00          Short load constant 0
   0c48: SRO  000c        Store global word BASE12
   0c4a: LAO  000c        Load global BASE12
   0c4c: LAO  0006        Load global BASE6
   0c4e: SLDC 06          Short load constant 6
   0c4f: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0c52: LAO  000c        Load global BASE12
   0c54: LAO  0006        Load global BASE6
   0c56: SLDC 0c          Short load constant 12
   0c57: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0c5a: LAO  000c        Load global BASE12
   0c5c: SAS  06          String assign (TOS to TOS-1, 6 chars)
   0c5e: SLDO 0b          Short load global BASE11
   0c5f: INC  0001        Inc field ptr (TOS+1)
   0c61: SLDC 08          Short load constant 8
   0c62: SLDC 08          Short load constant 8
   0c63: LDP              Load packed field (TOS)
   0c64: SLDC 00          Short load constant 0
   0c65: EQUI             Integer TOS-1 = TOS
   0c66: FJP  $0c6f       Jump if TOS false
   0c68: LAO  0006        Load global BASE6
   0c6a: SLDC 00          Short load constant 0
   0c6b: SLDC 05          Short load constant 5
   0c6c: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
   0c6d: UJP  $0c74       Unconditional jump
-> 0c6f: LAO  0006        Load global BASE6
   0c71: SLDC 00          Short load constant 0
   0c72: SLDC 02          Short load constant 2
   0c73: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0c74: SLDO 04          Short load global BASE4
   0c75: SIND 00          Short index load *TOS+0
   0c76: SLDC 01          Short load constant 1
   0c77: GRTI             Integer TOS-1 > TOS
   0c78: FJP  $0c93       Jump if TOS false
   0c7a: SLDO 04          Short load global BASE4
   0c7b: SLDO 04          Short load global BASE4
   0c7c: SIND 00          Short index load *TOS+0
   0c7d: SLDC 01          Short load constant 1
   0c7e: SBI              Subtract integers (TOS-1 - TOS)
   0c7f: STO              Store indirect (TOS into TOS-1)
   0c80: SLDO 03          Short load global BASE3
   0c81: SLDO 04          Short load global BASE4
   0c82: SIND 00          Short index load *TOS+0
   0c83: LDB              Load byte at byte ptr TOS-1 + TOS
   0c84: SLDC 20          Short load constant 32
   0c85: GEQI             Integer TOS-1 >= TOS
   0c86: FJP  $0c91       Jump if TOS false
   0c88: LOD  01 0003     Load word at G3 (OUTPUT)
   0c8b: LAO  0006        Load global BASE6
   0c8d: SLDC 00          Short load constant 0
   0c8e: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0c91: UJP  $0c74       Unconditional jump
-> 0c93: SLDC 02          Short load constant 2
   0c94: SLDO 0b          Short load global BASE11
   0c95: INC  0001        Inc field ptr (TOS+1)
   0c97: SLDC 08          Short load constant 8
   0c98: SLDC 08          Short load constant 8
   0c99: LDP              Load packed field (TOS)
   0c9a: CBP  33          Call base procedure PASCALSY.51
-> 0c9c: UJP  $0d01       Unconditional jump
-> 0c9e: SLDO 05          Short load global BASE5
   0c9f: SLDO 0a          Short load global BASE10
   0ca0: INC  002b        Inc field ptr (TOS+43)
   0ca2: SLDC 08          Short load constant 8
   0ca3: SLDC 00          Short load constant 0
   0ca4: LDP              Load packed field (TOS)
   0ca5: EQUI             Integer TOS-1 = TOS
   0ca6: FJP  $0d01       Jump if TOS false
   0ca8: SLDC 01          Short load constant 1
   0ca9: SRO  0001        Store global word BASE1
   0cab: SLDO 04          Short load global BASE4
   0cac: SIND 00          Short index load *TOS+0
   0cad: SLDC 01          Short load constant 1
   0cae: GRTI             Integer TOS-1 > TOS
   0caf: FJP  $0d01       Jump if TOS false
   0cb1: SLDO 04          Short load global BASE4
   0cb2: SLDO 04          Short load global BASE4
   0cb3: SIND 00          Short index load *TOS+0
   0cb4: SLDC 01          Short load constant 1
   0cb5: SBI              Subtract integers (TOS-1 - TOS)
   0cb6: STO              Store indirect (TOS into TOS-1)
   0cb7: SLDO 0b          Short load global BASE11
   0cb8: INC  0003        Inc field ptr (TOS+3)
   0cba: SLDC 08          Short load constant 8
   0cbb: SLDC 00          Short load constant 0
   0cbc: LDP              Load packed field (TOS)
   0cbd: SLDC 00          Short load constant 0
   0cbe: EQUI             Integer TOS-1 = TOS
   0cbf: FJP  $0cdf       Jump if TOS false
   0cc1: SLDO 0a          Short load global BASE10
   0cc2: INC  002b        Inc field ptr (TOS+43)
   0cc4: SLDC 08          Short load constant 8
   0cc5: SLDC 00          Short load constant 0
   0cc6: LDP              Load packed field (TOS)
   0cc7: SLDC 20          Short load constant 32
   0cc8: LESI             Integer TOS-1 < TOS
   0cc9: FJP  $0cd5       Jump if TOS false
   0ccb: LOD  01 0003     Load word at G3 (OUTPUT)
   0cce: SLDC 5f          Short load constant 95
   0ccf: SLDC 00          Short load constant 0
   0cd0: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0cd3: UJP  $0cdd       Unconditional jump
-> 0cd5: LOD  01 0003     Load word at G3 (OUTPUT)
   0cd8: SLDO 05          Short load global BASE5
   0cd9: SLDC 00          Short load constant 0
   0cda: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
-> 0cdd: UJP  $0d01       Unconditional jump
-> 0cdf: SLDO 03          Short load global BASE3
   0ce0: SLDO 04          Short load global BASE4
   0ce1: SIND 00          Short index load *TOS+0
   0ce2: LDB              Load byte at byte ptr TOS-1 + TOS
   0ce3: SLDC 20          Short load constant 32
   0ce4: GEQI             Integer TOS-1 >= TOS
   0ce5: FJP  $0d01       Jump if TOS false
   0ce7: SLDC 05          Short load constant 5
   0ce8: SLDO 0b          Short load global BASE11
   0ce9: INC  0003        Inc field ptr (TOS+3)
   0ceb: SLDC 08          Short load constant 8
   0cec: SLDC 00          Short load constant 0
   0ced: LDP              Load packed field (TOS)
   0cee: CBP  33          Call base procedure PASCALSY.51
   0cf0: LOD  01 0003     Load word at G3 (OUTPUT)
   0cf3: SLDC 20          Short load constant 32
   0cf4: SLDC 00          Short load constant 0
   0cf5: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0cf8: SLDC 05          Short load constant 5
   0cf9: SLDO 0b          Short load global BASE11
   0cfa: INC  0003        Inc field ptr (TOS+3)
   0cfc: SLDC 08          Short load constant 8
   0cfd: SLDC 00          Short load constant 0
   0cfe: LDP              Load packed field (TOS)
   0cff: CBP  33          Call base procedure PASCALSY.51
-> 0d01: RBP  01          Return from base procedure
END

### FUNCTION PASCALSY.FUNC53(PARAM1): RETVAL (* P=53 LL=0 *)
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
-> 0d14: SLDC 01          Short load constant 1
   0d15: SRO  0001        Store global word BASE1
   0d17: SLDC 00          Short load constant 0
   0d18: SRO  0005        Store global word BASE5
   0d1a: SLDO 03          Short load global BASE3
   0d1b: SRO  0009        Store global word BASE9
   0d1d: SLDO 09          Short load global BASE9
   0d1e: INC  0010        Inc field ptr (TOS+16)
   0d20: SRO  000a        Store global word BASE10
   0d22: SLDO 0a          Short load global BASE10
   0d23: INC  0003        Inc field ptr (TOS+3)
   0d25: SLDC 00          Short load constant 0
   0d26: LDB              Load byte at byte ptr TOS-1 + TOS
   0d27: SLDC 00          Short load constant 0
   0d28: GRTI             Integer TOS-1 > TOS
   0d29: FJP  $0df0       Jump if TOS false
   0d2b: SLDO 09          Short load global BASE9
   0d2c: SIND 07          Short index load *TOS+7
   0d2d: SLDO 09          Short load global BASE9
   0d2e: INC  0008        Inc field ptr (TOS+8)
   0d30: SLDC 00          Short load constant 0
   0d31: LAO  0008        Load global BASE8
   0d33: SLDC 00          Short load constant 0
   0d34: SLDC 00          Short load constant 0
   0d35: CBP  1e          Call base procedure PASCALSY.30
   0d37: NEQI             Integer TOS-1 <> TOS
   0d38: FJP  $0d41       Jump if TOS false
   0d3a: LOD  01 0001     Load word at G1 (SYSCOM)
   0d3d: SLDC 05          Short load constant 5
   0d3e: STO              Store indirect (TOS into TOS-1)
   0d3f: UJP  $0df0       Unconditional jump
-> 0d41: SLDC 00          Short load constant 0
   0d42: SRO  0006        Store global word BASE6
   0d44: SLDC 01          Short load constant 1
   0d45: SRO  0004        Store global word BASE4
-> 0d47: SLDO 04          Short load global BASE4
   0d48: SLDO 08          Short load global BASE8
   0d49: SLDC 00          Short load constant 0
   0d4a: IXA  000d        Index array (TOS-1 + TOS * 13)
   0d4c: IND  0008        Static index and load word (TOS+8)
   0d4e: LEQI             Integer TOS-1 <= TOS
   0d4f: SLDO 06          Short load global BASE6
   0d50: LNOT             Logical NOT (~TOS)
   0d51: LAND             Logical AND (TOS & TOS-1)
   0d52: FJP  $0d6e       Jump if TOS false
   0d54: SLDO 08          Short load global BASE8
   0d55: SLDO 04          Short load global BASE4
   0d56: IXA  000d        Index array (TOS-1 + TOS * 13)
   0d58: SIND 00          Short index load *TOS+0
   0d59: SLDO 0a          Short load global BASE10
   0d5a: SIND 00          Short index load *TOS+0
   0d5b: EQUI             Integer TOS-1 = TOS
   0d5c: SLDO 08          Short load global BASE8
   0d5d: SLDO 04          Short load global BASE4
   0d5e: IXA  000d        Index array (TOS-1 + TOS * 13)
   0d60: SIND 01          Short index load *TOS+1
   0d61: SLDO 0a          Short load global BASE10
   0d62: SIND 01          Short index load *TOS+1
   0d63: EQUI             Integer TOS-1 = TOS
   0d64: LAND             Logical AND (TOS & TOS-1)
   0d65: SRO  0006        Store global word BASE6
   0d67: SLDO 04          Short load global BASE4
   0d68: SLDC 01          Short load constant 1
   0d69: ADI              Add integers (TOS + TOS-1)
   0d6a: SRO  0004        Store global word BASE4
   0d6c: UJP  $0d47       Unconditional jump
-> 0d6e: SLDO 06          Short load global BASE6
   0d6f: LNOT             Logical NOT (~TOS)
   0d70: FJP  $0d79       Jump if TOS false
   0d72: LOD  01 0001     Load word at G1 (SYSCOM)
   0d75: SLDC 06          Short load constant 6
   0d76: STO              Store indirect (TOS into TOS-1)
   0d77: UJP  $0df0       Unconditional jump
-> 0d79: SLDO 04          Short load global BASE4
   0d7a: SLDO 08          Short load global BASE8
   0d7b: SLDC 00          Short load constant 0
   0d7c: IXA  000d        Index array (TOS-1 + TOS * 13)
   0d7e: IND  0008        Static index and load word (TOS+8)
   0d80: GRTI             Integer TOS-1 > TOS
   0d81: FJP  $0d8c       Jump if TOS false
   0d83: SLDO 08          Short load global BASE8
   0d84: SLDC 00          Short load constant 0
   0d85: IXA  000d        Index array (TOS-1 + TOS * 13)
   0d87: SIND 07          Short index load *TOS+7
   0d88: SRO  0007        Store global word BASE7
   0d8a: UJP  $0d93       Unconditional jump
-> 0d8c: SLDO 08          Short load global BASE8
   0d8d: SLDO 04          Short load global BASE4
   0d8e: IXA  000d        Index array (TOS-1 + TOS * 13)
   0d90: SIND 00          Short index load *TOS+0
   0d91: SRO  0007        Store global word BASE7
-> 0d93: SLDO 0a          Short load global BASE10
   0d94: SIND 01          Short index load *TOS+1
   0d95: SLDO 07          Short load global BASE7
   0d96: LESI             Integer TOS-1 < TOS
   0d97: SLDO 0a          Short load global BASE10
   0d98: IND  000b        Static index and load word (TOS+11)
   0d9a: LDCI 0200        Load word 512
   0d9d: LESI             Integer TOS-1 < TOS
   0d9e: LOR              Logical OR (TOS | TOS-1)
   0d9f: FJP  $0ded       Jump if TOS false
   0da1: SLDO 08          Short load global BASE8
   0da2: SLDO 04          Short load global BASE4
   0da3: SLDC 01          Short load constant 1
   0da4: SBI              Subtract integers (TOS-1 - TOS)
   0da5: IXA  000d        Index array (TOS-1 + TOS * 13)
   0da7: SRO  000b        Store global word BASE11
   0da9: SLDO 0b          Short load global BASE11
   0daa: INC  0001        Inc field ptr (TOS+1)
   0dac: SLDO 07          Short load global BASE7
   0dad: STO              Store indirect (TOS into TOS-1)
   0dae: SLDO 0b          Short load global BASE11
   0daf: INC  000b        Inc field ptr (TOS+11)
   0db1: LDCI 0200        Load word 512
   0db4: STO              Store indirect (TOS into TOS-1)
   0db5: SLDO 09          Short load global BASE9
   0db6: SIND 07          Short index load *TOS+7
   0db7: SLDO 08          Short load global BASE8
   0db8: CBP  1f          Call base procedure PASCALSY.31
   0dba: CSP  22          Call standard procedure IORESULT
   0dbc: SLDC 00          Short load constant 0
   0dbd: NEQI             Integer TOS-1 <> TOS
   0dbe: FJP  $0dc2       Jump if TOS false
   0dc0: UJP  $0df0       Unconditional jump
-> 0dc2: SLDO 09          Short load global BASE9
   0dc3: INC  0002        Inc field ptr (TOS+2)
   0dc5: SLDC 00          Short load constant 0
   0dc6: STO              Store indirect (TOS into TOS-1)
   0dc7: SLDO 09          Short load global BASE9
   0dc8: INC  0001        Inc field ptr (TOS+1)
   0dca: SLDC 00          Short load constant 0
   0dcb: STO              Store indirect (TOS into TOS-1)
   0dcc: SLDO 09          Short load global BASE9
   0dcd: SIND 03          Short index load *TOS+3
   0dce: SLDC 00          Short load constant 0
   0dcf: NEQI             Integer TOS-1 <> TOS
   0dd0: FJP  $0dd7       Jump if TOS false
   0dd2: SLDO 09          Short load global BASE9
   0dd3: INC  0003        Inc field ptr (TOS+3)
   0dd5: SLDC 01          Short load constant 1
   0dd6: STO              Store indirect (TOS into TOS-1)
-> 0dd7: SLDO 0a          Short load global BASE10
   0dd8: INC  0001        Inc field ptr (TOS+1)
   0dda: SLDO 07          Short load global BASE7
   0ddb: STO              Store indirect (TOS into TOS-1)
   0ddc: SLDO 0a          Short load global BASE10
   0ddd: INC  000b        Inc field ptr (TOS+11)
   0ddf: LDCI 0200        Load word 512
   0de2: STO              Store indirect (TOS into TOS-1)
   0de3: SLDO 0a          Short load global BASE10
   0de4: INC  000c        Inc field ptr (TOS+12)
   0de6: SLDC 07          Short load constant 7
   0de7: SLDC 09          Short load constant 9
   0de8: SLDC 64          Short load constant 100
   0de9: STP              Store packed field (TOS into TOS-1)
   0dea: SLDC 00          Short load constant 0
   0deb: SRO  0001        Store global word BASE1
-> 0ded: SLDC 01          Short load constant 1
   0dee: SRO  0005        Store global word BASE5
-> 0df0: SLDO 05          Short load global BASE5
   0df1: LNOT             Logical NOT (~TOS)
   0df2: FJP  $0dfe       Jump if TOS false
   0df4: SLDO 03          Short load global BASE3
   0df5: INC  0002        Inc field ptr (TOS+2)
   0df7: SLDC 01          Short load constant 1
   0df8: STO              Store indirect (TOS into TOS-1)
   0df9: SLDO 03          Short load global BASE3
   0dfa: INC  0001        Inc field ptr (TOS+1)
   0dfc: SLDC 01          Short load constant 1
   0dfd: STO              Store indirect (TOS into TOS-1)
-> 0dfe: RBP  01          Return from base procedure
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
-> 0e10: SLDL 03          Short load local MP3
   0e11: SLDC 3f          Short load constant 63
   0e12: GRTI             Integer TOS-1 > TOS
   0e13: FJP  $0e1a       Jump if TOS false
   0e15: SLDC 3f          Short load constant 63
   0e16: STL  0008        Store TOS into MP8
   0e18: UJP  $0e1d       Unconditional jump
-> 0e1a: SLDL 03          Short load local MP3
   0e1b: STL  0008        Store TOS into MP8
-> 0e1d: SLDL 08          Short load local MP8
   0e1e: LDCI 0200        Load word 512
   0e21: MPI              Multiply integers (TOS * TOS-1)
   0e22: STL  0007        Store TOS into MP7
-> 0e24: SLDL 03          Short load local MP3
   0e25: SLDC 00          Short load constant 0
   0e26: NEQI             Integer TOS-1 <> TOS
   0e27: FJP  $0e68       Jump if TOS false
   0e29: SLDL 01          Short load local MP1
   0e2a: FJP  $0e36       Jump if TOS false
   0e2c: SLDL 06          Short load local MP6
   0e2d: SLDL 05          Short load local MP5
   0e2e: SLDL 04          Short load local MP4
   0e2f: SLDL 07          Short load local MP7
   0e30: SLDL 02          Short load local MP2
   0e31: SLDC 00          Short load constant 0
   0e32: CSP  05          Call standard procedure UNITREAD
   0e34: UJP  $0e3e       Unconditional jump
-> 0e36: SLDL 06          Short load local MP6
   0e37: SLDL 05          Short load local MP5
   0e38: SLDL 04          Short load local MP4
   0e39: SLDL 07          Short load local MP7
   0e3a: SLDL 02          Short load local MP2
   0e3b: SLDC 00          Short load constant 0
   0e3c: CSP  06          Call standard procedure UNITWRITE
-> 0e3e: CSP  22          Call standard procedure IORESULT
   0e40: SLDC 00          Short load constant 0
   0e41: NEQI             Integer TOS-1 <> TOS
   0e42: FJP  $0e48       Jump if TOS false
   0e44: SLDC 00          Short load constant 0
   0e45: SLDC 36          Short load constant 54
   0e46: CSP  04          Call standard procedure EXIT
-> 0e48: SLDL 03          Short load local MP3
   0e49: SLDL 08          Short load local MP8
   0e4a: SBI              Subtract integers (TOS-1 - TOS)
   0e4b: STL  0003        Store TOS into MP3
   0e4d: SLDL 04          Short load local MP4
   0e4e: SLDL 07          Short load local MP7
   0e4f: ADI              Add integers (TOS + TOS-1)
   0e50: STL  0004        Store TOS into MP4
   0e52: SLDL 02          Short load local MP2
   0e53: SLDL 08          Short load local MP8
   0e54: ADI              Add integers (TOS + TOS-1)
   0e55: STL  0002        Store TOS into MP2
   0e57: SLDL 03          Short load local MP3
   0e58: SLDL 08          Short load local MP8
   0e59: LESI             Integer TOS-1 < TOS
   0e5a: FJP  $0e66       Jump if TOS false
   0e5c: SLDL 03          Short load local MP3
   0e5d: STL  0008        Store TOS into MP8
   0e5f: SLDL 08          Short load local MP8
   0e60: LDCI 0200        Load word 512
   0e63: MPI              Multiply integers (TOS * TOS-1)
   0e64: STL  0007        Store TOS into MP7
-> 0e66: UJP  $0e24       Unconditional jump
-> 0e68: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC55(PARAM1) (* P=55 LL=1 *)
  MP1=PARAM1
  MP2
  MP292
BEGIN
-> 0e76: LLA  0002        Load local address MP2
   0e78: SLDL 01          Short load local MP1
   0e79: MOV  0122        Move 290 words (TOS to TOS-1)
   0e7c: SLDL 01          Short load local MP1
   0e7d: STL  0124        Store TOS into MP292
   0e80: LDL  0124        Load local word MP292
   0e83: IND  000d        Static index and load word (TOS+13)
   0e85: FJP  $0e94       Jump if TOS false
   0e87: LDL  0124        Load local word MP292
   0e8a: INC  000d        Inc field ptr (TOS+13)
   0e8c: LDL  0124        Load local word MP292
   0e8f: IND  000d        Static index and load word (TOS+13)
   0e91: SLDC 01          Short load constant 1
   0e92: ADI              Add integers (TOS + TOS-1)
   0e93: STO              Store indirect (TOS into TOS-1)
-> 0e94: LDL  0124        Load local word MP292
   0e97: INC  001f        Inc field ptr (TOS+31)
   0e99: LDCI 0200        Load word 512
   0e9c: STO              Store indirect (TOS into TOS-1)
   0e9d: SLDL 01          Short load local MP1
   0e9e: CBP  07          Call base procedure PASCALSY.FGET
   0ea0: LDL  0124        Load local word MP292
   0ea3: SIND 02          Short index load *TOS+2
   0ea4: FJP  $0ec7       Jump if TOS false
   0ea6: SLDL 01          Short load local MP1
   0ea7: LLA  0002        Load local address MP2
   0ea9: MOV  0122        Move 290 words (TOS to TOS-1)
   0eac: LDL  0124        Load local word MP292
   0eaf: INC  0002        Inc field ptr (TOS+2)
   0eb1: SLDC 01          Short load constant 1
   0eb2: STO              Store indirect (TOS into TOS-1)
   0eb3: LDL  0124        Load local word MP292
   0eb6: INC  0001        Inc field ptr (TOS+1)
   0eb8: SLDC 01          Short load constant 1
   0eb9: STO              Store indirect (TOS into TOS-1)
   0eba: LDL  0124        Load local word MP292
   0ebd: INC  001f        Inc field ptr (TOS+31)
   0ebf: LDL  0124        Load local word MP292
   0ec2: IND  001f        Static index and load word (TOS+31)
   0ec4: SLDC 01          Short load constant 1
   0ec5: SBI              Subtract integers (TOS-1 - TOS)
   0ec6: STO              Store indirect (TOS into TOS-1)
-> 0ec7: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC56 (* P=56 LL=1 *)
  BASE11
BEGIN
-> 0ed4: LOD  02 014f     Load word at G335
   0ed8: LOD  02 0151     Load word at G337
   0edc: LDB              Load byte at byte ptr TOS-1 + TOS
   0edd: SRO  000b        Store global word BASE11
   0edf: LOD  02 0151     Load word at G337
   0ee3: SLDC 01          Short load constant 1
   0ee4: ADI              Add integers (TOS + TOS-1)
   0ee5: STR  02 0151     Store TOS to G337
   0ee9: LOD  02 0151     Load word at G337
   0eed: LOD  02 0152     Load word at G338
   0ef1: GRTI             Integer TOS-1 > TOS
   0ef2: FJP  $0ef6       Jump if TOS false
   0ef4: CBP  2e          Call base procedure PASCALSY.46
-> 0ef6: SLDO 0b          Short load global BASE11
   0ef7: LOD  02 015b     Load word at G347
   0efb: EQUI             Integer TOS-1 = TOS
   0efc: LOD  02 014f     Load word at G335
   0f00: LOD  02 0151     Load word at G337
   0f04: LDB              Load byte at byte ptr TOS-1 + TOS
   0f05: LOD  02 015b     Load word at G347
   0f09: EQUI             Integer TOS-1 = TOS
   0f0a: LAND             Logical AND (TOS & TOS-1)
   0f0b: FJP  $0f10       Jump if TOS false
   0f0d: SLDC 01          Short load constant 1
   0f0e: CBP  2d          Call base procedure PASCALSY.45
-> 0f10: RNP  00          Return from nonbase procedure
END

### PROCEDURE PASCALSY.PROC57 (* P=57 LL=1 *)
  BASE1
  BASE2
  MP1
BEGIN
-> 0f1c: UJP  $1064       Unconditional jump
-> 0f1e: SLDO 02          Short load global BASE2
   0f1f: LNOT             Logical NOT (~TOS)
   0f20: FJP  $0fe8       Jump if TOS false
   0f22: LDA  02 0036     Load addr G54
   0f25: CSP  21          Call standard procedure RELEASE
   0f27: LDA  02 007e     Load addr G126
   0f2a: LOD  02 0001     Load word at G1 (SYSCOM)
   0f2d: SIND 02          Short index load *TOS+2
   0f2e: IXA  0006        Index array (TOS-1 + TOS * 6)
   0f30: LDA  02 003f     Load addr G63
   0f33: NEQSTR           String TOS-1 <> TOS
   0f35: FJP  $0f41       Jump if TOS false
   0f37: LOD  02 0001     Load word at G1 (SYSCOM)
   0f3a: SIND 02          Short index load *TOS+2
   0f3b: SLDC 00          Short load constant 0
   0f3c: SLDC 00          Short load constant 0
   0f3d: CBP  2a          Call base procedure PASCALSY.42
   0f3f: FJP  $0f41       Jump if TOS false
-> 0f41: LDA  02 007e     Load addr G126
   0f44: LOD  02 0001     Load word at G1 (SYSCOM)
   0f47: SIND 02          Short index load *TOS+2
   0f48: IXA  0006        Index array (TOS-1 + TOS * 6)
   0f4a: LDA  02 003f     Load addr G63
   0f4d: NEQSTR           String TOS-1 <> TOS
   0f4f: FJP  $0f8e       Jump if TOS false
   0f51: LDA  02 0046     Load addr G70
   0f54: NOP              No operation
   0f55: LSA  08          Load string address: 'Put in :'
   0f5f: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0f61: LDA  02 003f     Load addr G63
   0f64: LDA  02 0046     Load addr G70
   0f67: SLDC 50          Short load constant 80
   0f68: SLDC 08          Short load constant 8
   0f69: CXP  00 18       Call external procedure PASCALSY.SINSERT
   0f6c: CBP  27          Call base procedure PASCALSY.39
   0f6e: SLDC 00          Short load constant 0
   0f6f: SRO  0001        Store global word BASE1
   0f71: LDCI 0fa0        Load word 4000
   0f74: STL  0001        Store TOS into MP1
-> 0f76: SLDO 01          Short load global BASE1
   0f77: SLDL 01          Short load local MP1
   0f78: LEQI             Integer TOS-1 <= TOS
   0f79: FJP  $0f82       Jump if TOS false
   0f7b: SLDO 01          Short load global BASE1
   0f7c: SLDC 01          Short load constant 1
   0f7d: ADI              Add integers (TOS + TOS-1)
   0f7e: SRO  0001        Store global word BASE1
   0f80: UJP  $0f76       Unconditional jump
-> 0f82: LOD  02 0001     Load word at G1 (SYSCOM)
   0f85: SIND 02          Short index load *TOS+2
   0f86: SLDC 00          Short load constant 0
   0f87: SLDC 00          Short load constant 0
   0f88: CBP  2a          Call base procedure PASCALSY.42
   0f8a: FJP  $0f8c       Jump if TOS false
-> 0f8c: UJP  $0f41       Unconditional jump
-> 0f8e: LOD  02 0045     Load word at G69
   0f91: SLDC 00          Short load constant 0
   0f92: SLDC 00          Short load constant 0
   0f93: CXP  05 01       Call external procedure GETCMD.1
   0f96: STR  02 0045     Store TOS to G69
   0f99: LDA  02 011a     Load addr G282
   0f9d: LSA  00          Load string address: ''
   0f9f: NOP              No operation
   0fa0: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0fa2: LOD  02 0045     Load word at G69
   0fa5: UJP  $0fcd       Unconditional jump
   0fa7: LOD  02 0156     Load word at G342
   0fab: LNOT             Logical NOT (~TOS)
   0fac: LOD  02 0158     Load word at G344
   0fb0: LOR              Logical OR (TOS | TOS-1)
   0fb1: FJP  $0fbf       Jump if TOS false
   0fb3: SLDC 00          Short load constant 0
   0fb4: STR  02 0158     Store TOS to G344
   0fb8: LDCN             Load constant NIL
   0fb9: LDCN             Load constant NIL
   0fba: CXP  01 01       Call external procedure USERPROG.USERPROGRAM
   0fbd: UJP  $0fc6       Unconditional jump
-> 0fbf: SLDC 01          Short load constant 1
   0fc0: SRO  0002        Store global word BASE2
   0fc2: SLDC 00          Short load constant 0
   0fc3: SLDC 39          Short load constant 57
   0fc4: CSP  04          Call standard procedure EXIT
-> 0fc6: UJP  $0fe8       Unconditional jump
   0fc8: CXP  02 01       Call external procedure DEBUGGER.1
   0fcb: UJP  $0fe8       Unconditional jump
-> 0fe8: LOD  02 0045     Load word at G69
   0feb: LDCI 07fc        Load word 2044
   0fee: SLDC 01          Short load constant 1
   0fef: INN              Set membership (TOS-1 in set TOS)
   0ff0: FJP  $1002       Jump if TOS false
   0ff2: SLDC 00          Short load constant 0
   0ff3: SRO  0002        Store global word BASE2
   0ff5: SLDC 03          Short load constant 3
   0ff6: CSP  26          Call standard procedure UNITCLEAR
   0ff8: LOD  02 0001     Load word at G1 (SYSCOM)
   0ffb: SIND 02          Short index load *TOS+2
   0ffc: SLDC 00          Short load constant 0
   0ffd: SLDC 00          Short load constant 0
   0ffe: CBP  2a          Call base procedure PASCALSY.42
   1000: FJP  $1002       Jump if TOS false
-> 1002: LOD  02 0045     Load word at G69
   1005: LDCI 00e0        Load word 224
   1008: SLDC 01          Short load constant 1
   1009: INN              Set membership (TOS-1 in set TOS)
   100a: FJP  $1030       Jump if TOS false
   100c: LOD  02 000a     Load word at G10
   100f: SLDC 00          Short load constant 0
   1010: EQUI             Integer TOS-1 = TOS
   1011: FJP  $1030       Jump if TOS false
   1013: LOD  02 0008     Load word at G8
   1016: SLDC 01          Short load constant 1
   1017: CBP  06          Call base procedure PASCALSY.FCLOSE
   1019: CSP  22          Call standard procedure IORESULT
   101b: SLDC 00          Short load constant 0
   101c: NEQI             Integer TOS-1 <> TOS
   101d: FJP  $1030       Jump if TOS false
   101f: CSP  22          Call standard procedure IORESULT
   1021: SRO  0001        Store global word BASE1
   1023: LOD  02 0003     Load word at G3 (OUTPUT)
   1026: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   1029: CBP  26          Call base procedure PASCALSY.38
   102b: SLDC 0a          Short load constant 10
   102c: SLDO 01          Short load global BASE1
   102d: CXP  03 01       Call external procedure PRINTERR.PRINTERROR
-> 1030: LOD  02 0045     Load word at G69
   1033: SLDC 0c          Short load constant 12
   1034: SLDC 01          Short load constant 1
   1035: INN              Set membership (TOS-1 in set TOS)
   1036: FJP  $104c       Jump if TOS false
   1038: LDA  02 0002     Load addr G2 (INPUT)
   103b: SLDC 00          Short load constant 0
   103c: IXA  0001        Index array (TOS-1 + TOS * 1)
   103e: SIND 00          Short index load *TOS+0
   103f: SLDC 00          Short load constant 0
   1040: CBP  06          Call base procedure PASCALSY.FCLOSE
   1042: LDA  02 0002     Load addr G2 (INPUT)
   1045: SLDC 01          Short load constant 1
   1046: IXA  0001        Index array (TOS-1 + TOS * 1)
   1048: SIND 00          Short index load *TOS+0
   1049: SLDC 01          Short load constant 1
   104a: CBP  06          Call base procedure PASCALSY.FCLOSE
-> 104c: SLDC 01          Short load constant 1
   104d: CSP  23          Call standard procedure UNITBUSY
   104f: SLDC 02          Short load constant 2
   1050: CSP  23          Call standard procedure UNITBUSY
   1052: LOR              Logical OR (TOS | TOS-1)
   1053: FJP  $1058       Jump if TOS false
   1055: SLDC 01          Short load constant 1
   1056: CSP  26          Call standard procedure UNITCLEAR
-> 1058: LOD  02 0045     Load word at G69
   105b: SLDC 00          Short load constant 0
   105c: EQUI             Integer TOS-1 = TOS
   105d: FJP  $0f1e       Jump if TOS false
-> 105f: SLDC 06          Short load constant 6
   1060: CSP  16          Call standard procedure UNLOADSEGMENT
   1062: UJP  $1069       Unconditional jump
-> 1064: SLDC 06          Short load constant 6
   1065: CSP  15          Call standard procedure LOADSEGMENT
   1067: UJP  $0f1e       Unconditional jump
-> 1069: RNP  00          Return from nonbase procedure
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
   001e: UJP  $039e       Unconditional jump
   0020: LAO  0003        Load global BASE3
   0022: NOP              No operation
   0023: LSA  11          Load string address: 'Value range error'
   0036: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0038: UJP  $03c4       Unconditional jump
   003a: LAO  0003        Load global BASE3
   003c: NOP              No operation
   003d: LSA  14          Load string address: 'No proc in seg-table'
   0053: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0055: UJP  $03c4       Unconditional jump
   0057: LAO  0003        Load global BASE3
   0059: LSA  17          Load string address: 'Exit from uncalled proc'
   0072: NOP              No operation
   0073: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0075: UJP  $03c4       Unconditional jump
   0077: LAO  0003        Load global BASE3
   0079: LSA  0e          Load string address: 'Stack overflow'
   0089: NOP              No operation
   008a: SAS  28          String assign (TOS to TOS-1, 40 chars)
   008c: UJP  $03c4       Unconditional jump
   008e: LAO  0003        Load global BASE3
   0090: NOP              No operation
   0091: LSA  10          Load string address: 'Integer overflow'
   00a3: SAS  28          String assign (TOS to TOS-1, 40 chars)
   00a5: UJP  $03c4       Unconditional jump
   00a7: LAO  0003        Load global BASE3
   00a9: LSA  0e          Load string address: 'Divide by zero'
   00b9: NOP              No operation
   00ba: SAS  28          String assign (TOS to TOS-1, 40 chars)
   00bc: UJP  $03c4       Unconditional jump
   00be: LAO  0003        Load global BASE3
   00c0: NOP              No operation
   00c1: LSA  15          Load string address: 'NIL pointer reference'
   00d8: SAS  28          String assign (TOS to TOS-1, 40 chars)
   00da: UJP  $03c4       Unconditional jump
   00dc: LAO  0003        Load global BASE3
   00de: NOP              No operation
   00df: LSA  1b          Load string address: 'Program interrupted by user'
   00fc: SAS  28          String assign (TOS to TOS-1, 40 chars)
   00fe: UJP  $03c4       Unconditional jump
   0100: LAO  0003        Load global BASE3
   0102: NOP              No operation
   0103: LSA  0f          Load string address: 'System IO error'
   0114: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0116: UJP  $03c4       Unconditional jump
   0118: LAO  0003        Load global BASE3
   011a: NOP              No operation
   011b: LSA  0d          Load string address: 'unknown cause'
   012a: SAS  28          String assign (TOS to TOS-1, 40 chars)
   012c: SLDO 01          Short load global BASE1
   012d: UJP  $02cf       Unconditional jump
   012f: LAO  0003        Load global BASE3
   0131: LSA  0c          Load string address: 'parity (CRC)'
   013f: NOP              No operation
   0140: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0142: UJP  $02fa       Unconditional jump
   0144: LAO  0003        Load global BASE3
   0146: NOP              No operation
   0147: LSA  0e          Load string address: 'illegal unit #'
   0157: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0159: UJP  $02fa       Unconditional jump
   015b: LAO  0003        Load global BASE3
   015d: LSA  12          Load string address: 'illegal IO request'
   0171: NOP              No operation
   0172: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0174: UJP  $02fa       Unconditional jump
   0176: LAO  0003        Load global BASE3
   0178: NOP              No operation
   0179: LSA  10          Load string address: 'data-com timeout'
   018b: SAS  28          String assign (TOS to TOS-1, 40 chars)
   018d: UJP  $02fa       Unconditional jump
   018f: LAO  0003        Load global BASE3
   0191: LSA  11          Load string address: 'vol went off-line'
   01a4: NOP              No operation
   01a5: SAS  28          String assign (TOS to TOS-1, 40 chars)
   01a7: UJP  $02fa       Unconditional jump
   01a9: LAO  0003        Load global BASE3
   01ab: LSA  10          Load string address: 'file lost in dir'
   01bd: NOP              No operation
   01be: SAS  28          String assign (TOS to TOS-1, 40 chars)
   01c0: UJP  $02fa       Unconditional jump
   01c2: LAO  0003        Load global BASE3
   01c4: NOP              No operation
   01c5: LSA  0d          Load string address: 'bad file name'
   01d4: SAS  28          String assign (TOS to TOS-1, 40 chars)
   01d6: UJP  $02fa       Unconditional jump
   01d8: LAO  0003        Load global BASE3
   01da: NOP              No operation
   01db: LSA  0e          Load string address: 'no room on vol'
   01eb: SAS  28          String assign (TOS to TOS-1, 40 chars)
   01ed: UJP  $02fa       Unconditional jump
   01ef: LAO  0003        Load global BASE3
   01f1: LSA  0d          Load string address: 'vol not found'
   0200: NOP              No operation
   0201: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0203: UJP  $02fa       Unconditional jump
   0205: LAO  0003        Load global BASE3
   0207: LSA  0e          Load string address: 'file not found'
   0217: NOP              No operation
   0218: SAS  28          String assign (TOS to TOS-1, 40 chars)
   021a: UJP  $02fa       Unconditional jump
   021c: LAO  0003        Load global BASE3
   021e: NOP              No operation
   021f: LSA  0d          Load string address: 'dup dir entry'
   022e: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0230: UJP  $02fa       Unconditional jump
   0232: LAO  0003        Load global BASE3
   0234: NOP              No operation
   0235: LSA  11          Load string address: 'file already open'
   0248: SAS  28          String assign (TOS to TOS-1, 40 chars)
   024a: UJP  $02fa       Unconditional jump
   024c: LAO  0003        Load global BASE3
   024e: NOP              No operation
   024f: LSA  0d          Load string address: 'file not open'
   025e: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0260: UJP  $02fa       Unconditional jump
   0262: LAO  0003        Load global BASE3
   0264: NOP              No operation
   0265: LSA  10          Load string address: 'bad input format'
   0277: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0279: UJP  $02fa       Unconditional jump
   027b: LAO  0003        Load global BASE3
   027d: LSA  14          Load string address: 'disk write protected'
   0293: NOP              No operation
   0294: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0296: UJP  $02fa       Unconditional jump
   0298: LAO  0003        Load global BASE3
   029a: NOP              No operation
   029b: LSA  0f          Load string address: 'illegal block #'
   02ac: SAS  28          String assign (TOS to TOS-1, 40 chars)
   02ae: UJP  $02fa       Unconditional jump
   02b0: LAO  0003        Load global BASE3
   02b2: NOP              No operation
   02b3: LSA  16          Load string address: 'illegal buffer address'
   02cb: SAS  28          String assign (TOS to TOS-1, 40 chars)
   02cd: UJP  $02fa       Unconditional jump
-> 02fa: NOP              No operation
   02fb: LSA  0a          Load string address: 'IO error: '
   0307: LAO  0003        Load global BASE3
   0309: SLDC 28          Short load constant 40
   030a: SLDC 01          Short load constant 1
   030b: CXP  00 18       Call external procedure PASCALSY.SINSERT
   030e: UJP  $03c4       Unconditional jump
   0310: LAO  0003        Load global BASE3
   0312: NOP              No operation
   0313: LSA  19          Load string address: 'Unimplemented instruction'
   032e: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0330: UJP  $03c4       Unconditional jump
   0332: LAO  0003        Load global BASE3
   0334: NOP              No operation
   0335: LSA  14          Load string address: 'Floating point error'
   034b: SAS  28          String assign (TOS to TOS-1, 40 chars)
   034d: UJP  $03c4       Unconditional jump
   034f: LAO  0003        Load global BASE3
   0351: LSA  0f          Load string address: 'String overflow'
   0362: NOP              No operation
   0363: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0365: UJP  $03c4       Unconditional jump
   0367: LAO  0003        Load global BASE3
   0369: LSA  0f          Load string address: 'Programmed HALT'
   037a: NOP              No operation
   037b: SAS  28          String assign (TOS to TOS-1, 40 chars)
   037d: UJP  $03c4       Unconditional jump
   037f: LAO  0003        Load global BASE3
   0381: LSA  16          Load string address: 'Programmed break-point'
   0399: NOP              No operation
   039a: SAS  28          String assign (TOS to TOS-1, 40 chars)
   039c: UJP  $03c4       Unconditional jump
-> 03c4: LOD  01 0003     Load word at G3 (OUTPUT)
   03c7: LAO  0003        Load global BASE3
   03c9: SLDC 00          Short load constant 0
   03ca: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   03cd: LOD  01 0003     Load word at G3 (OUTPUT)
   03d0: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 03d3: RBP  00          Return from base procedure
END

## Segment INITIALI (4)

### PROCEDURE INITIALI.INITIALI (* P=1 LL=0 *)
  BASE22
  BASE23
  BASE55
  BASE56
  BASE57
BEGIN
-> 072c: UJP  $0a00       Unconditional jump
-> 072e: LOD  01 0036     Load word at G54
   0731: LDCN             Load constant NIL
   0732: EQUI             Integer TOS-1 = TOS
   0733: STR  01 0159     Store TOS to G345
   0737: LAO  0017        Load global BASE23
   0739: SLDC 00          Short load constant 0
   073a: IXA  0002        Index array (TOS-1 + TOS * 2)
   073c: NOP              No operation
   073d: LSA  03          Load string address: '???'
   0742: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0744: LAO  0017        Load global BASE23
   0746: SLDC 01          Short load constant 1
   0747: IXA  0002        Index array (TOS-1 + TOS * 2)
   0749: LSA  03          Load string address: 'Jan'
   074e: NOP              No operation
   074f: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0751: LAO  0017        Load global BASE23
   0753: SLDC 02          Short load constant 2
   0754: IXA  0002        Index array (TOS-1 + TOS * 2)
   0756: NOP              No operation
   0757: LSA  03          Load string address: 'Feb'
   075c: SAS  03          String assign (TOS to TOS-1, 3 chars)
   075e: LAO  0017        Load global BASE23
   0760: SLDC 03          Short load constant 3
   0761: IXA  0002        Index array (TOS-1 + TOS * 2)
   0763: LSA  03          Load string address: 'Mar'
   0768: NOP              No operation
   0769: SAS  03          String assign (TOS to TOS-1, 3 chars)
   076b: LAO  0017        Load global BASE23
   076d: SLDC 04          Short load constant 4
   076e: IXA  0002        Index array (TOS-1 + TOS * 2)
   0770: NOP              No operation
   0771: LSA  03          Load string address: 'Apr'
   0776: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0778: LAO  0017        Load global BASE23
   077a: SLDC 05          Short load constant 5
   077b: IXA  0002        Index array (TOS-1 + TOS * 2)
   077d: LSA  03          Load string address: 'May'
   0782: NOP              No operation
   0783: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0785: LAO  0017        Load global BASE23
   0787: SLDC 06          Short load constant 6
   0788: IXA  0002        Index array (TOS-1 + TOS * 2)
   078a: NOP              No operation
   078b: LSA  03          Load string address: 'Jun'
   0790: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0792: LAO  0017        Load global BASE23
   0794: SLDC 07          Short load constant 7
   0795: IXA  0002        Index array (TOS-1 + TOS * 2)
   0797: LSA  03          Load string address: 'Jul'
   079c: NOP              No operation
   079d: SAS  03          String assign (TOS to TOS-1, 3 chars)
   079f: LAO  0017        Load global BASE23
   07a1: SLDC 08          Short load constant 8
   07a2: IXA  0002        Index array (TOS-1 + TOS * 2)
   07a4: NOP              No operation
   07a5: LSA  03          Load string address: 'Aug'
   07aa: SAS  03          String assign (TOS to TOS-1, 3 chars)
   07ac: LAO  0017        Load global BASE23
   07ae: SLDC 09          Short load constant 9
   07af: IXA  0002        Index array (TOS-1 + TOS * 2)
   07b1: LSA  03          Load string address: 'Sep'
   07b6: NOP              No operation
   07b7: SAS  03          String assign (TOS to TOS-1, 3 chars)
   07b9: LAO  0017        Load global BASE23
   07bb: SLDC 0a          Short load constant 10
   07bc: IXA  0002        Index array (TOS-1 + TOS * 2)
   07be: NOP              No operation
   07bf: LSA  03          Load string address: 'Oct'
   07c4: SAS  03          String assign (TOS to TOS-1, 3 chars)
   07c6: LAO  0017        Load global BASE23
   07c8: SLDC 0b          Short load constant 11
   07c9: IXA  0002        Index array (TOS-1 + TOS * 2)
   07cb: LSA  03          Load string address: 'Nov'
   07d0: NOP              No operation
   07d1: SAS  03          String assign (TOS to TOS-1, 3 chars)
   07d3: LAO  0017        Load global BASE23
   07d5: SLDC 0c          Short load constant 12
   07d6: IXA  0002        Index array (TOS-1 + TOS * 2)
   07d8: NOP              No operation
   07d9: LSA  03          Load string address: 'Dec'
   07de: SAS  03          String assign (TOS to TOS-1, 3 chars)
   07e0: LAO  0017        Load global BASE23
   07e2: SLDC 0d          Short load constant 13
   07e3: IXA  0002        Index array (TOS-1 + TOS * 2)
   07e5: LSA  03          Load string address: '???'
   07ea: NOP              No operation
   07eb: SAS  03          String assign (TOS to TOS-1, 3 chars)
   07ed: LAO  0017        Load global BASE23
   07ef: SLDC 0e          Short load constant 14
   07f0: IXA  0002        Index array (TOS-1 + TOS * 2)
   07f2: NOP              No operation
   07f3: LSA  03          Load string address: '???'
   07f8: SAS  03          String assign (TOS to TOS-1, 3 chars)
   07fa: LAO  0017        Load global BASE23
   07fc: SLDC 0f          Short load constant 15
   07fd: IXA  0002        Index array (TOS-1 + TOS * 2)
   07ff: LSA  03          Load string address: '???'
   0804: NOP              No operation
   0805: SAS  03          String assign (TOS to TOS-1, 3 chars)
   0807: LOD  01 0159     Load word at G345
   080b: FJP  $0811       Jump if TOS false
   080d: CLP  08          Call local procedure INITIALI.8
   080f: UJP  $0816       Unconditional jump
-> 0811: LDA  01 0036     Load addr G54
   0814: CSP  21          Call standard procedure RELEASE
-> 0816: CLP  06          Call local procedure INITIALI.INITUNITABLE
   0818: LDA  01 0108     Load addr G264
   081c: SLDC 00          Short load constant 0
   081d: ADJ  02          Adjust set to 2 words
   081f: STM  02          Store 2 words at TOS to TOS-1
   0821: CLP  0b          Call local procedure INITIALI.11
   0823: CLP  02          Call local procedure INITIALI.INITSYSCOM
   0825: CLP  09          Call local procedure INITIALI.9
   0827: LDA  01 011a     Load addr G282
   082b: LSA  00          Load string address: ''
   082d: NOP              No operation
   082e: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0830: LDA  01 0126     Load addr G294
   0834: NOP              No operation
   0835: LSA  00          Load string address: ''
   0837: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0839: SLDC 25          Short load constant 37
   083a: STR  01 015b     Store TOS to G347
   083e: SLDC 00          Short load constant 0
   083f: STR  01 0156     Store TOS to G342
   0843: SLDC 00          Short load constant 0
   0844: STR  01 0154     Store TOS to G340
   0848: SLDC 00          Short load constant 0
   0849: STR  01 0155     Store TOS to G341
   084d: SLDC 00          Short load constant 0
   084e: STR  01 0157     Store TOS to G343
   0852: SLDC 00          Short load constant 0
   0853: STR  01 0158     Store TOS to G344
   0857: CXP  00 25       Call external procedure PASCALSY.37
   085a: LOD  01 0003     Load word at G3 (OUTPUT)
   085d: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0860: LOD  01 0159     Load word at G345
   0864: FJP  $09d6       Jump if TOS false
   0866: LDO  0037        Load global word BASE55
   0868: LNOT             Logical NOT (~TOS)
   0869: FJP  $09d4       Jump if TOS false
   086b: LOD  01 0001     Load word at G1 (SYSCOM)
   086e: SRO  0038        Store global word BASE56
   0870: LDO  0038        Load global word BASE56
   0872: INC  001d        Inc field ptr (TOS+29)
   0874: SLDC 01          Short load constant 1
   0875: SLDC 03          Short load constant 3
   0876: LDP              Load packed field (TOS)
   0877: FJP  $0892       Jump if TOS false
   0879: SLDC 00          Short load constant 0
   087a: LDO  0038        Load global word BASE56
   087c: IND  0025        Static index and load word (TOS+37)
   087e: SLDC 03          Short load constant 3
   087f: DVI              Divide integers (TOS-1 / TOS)
   0880: CXP  00 1d       Call external procedure PASCALSY.FGOTOXY
   0883: SLDC 0b          Short load constant 11
   0884: SLDC 00          Short load constant 0
   0885: GRTI             Integer TOS-1 > TOS
   0886: FJP  $0892       Jump if TOS false
   0888: LOD  01 0003     Load word at G3 (OUTPUT)
   088b: LDA  01 0074     Load addr G116
   088e: SLDC 00          Short load constant 0
   088f: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0892: LOD  01 0003     Load word at G3 (OUTPUT)
   0895: LSA  08          Load string address: 'Welcome '
   089f: NOP              No operation
   08a0: SLDC 00          Short load constant 0
   08a1: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   08a4: LOD  01 0003     Load word at G3 (OUTPUT)
   08a7: LDA  01 003f     Load addr G63
   08aa: SLDC 00          Short load constant 0
   08ab: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   08ae: LOD  01 0003     Load word at G3 (OUTPUT)
   08b1: LSA  18          Load string address: ', to Apple II Pascal 1.1'
   08cb: NOP              No operation
   08cc: SLDC 00          Short load constant 0
   08cd: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   08d0: LOD  01 0003     Load word at G3 (OUTPUT)
   08d3: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   08d6: LOD  01 0003     Load word at G3 (OUTPUT)
   08d9: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   08dc: LOD  01 0003     Load word at G3 (OUTPUT)
   08df: LSA  19          Load string address: 'Based on UCSD Pascal II.1'
   08fa: NOP              No operation
   08fb: SLDC 00          Short load constant 0
   08fc: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   08ff: LOD  01 0003     Load word at G3 (OUTPUT)
   0902: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0905: LOD  01 0003     Load word at G3 (OUTPUT)
   0908: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   090b: LOD  01 0003     Load word at G3 (OUTPUT)
   090e: NOP              No operation
   090f: LSA  10          Load string address: 'Current date is '
   0921: SLDC 00          Short load constant 0
   0922: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0925: LOD  01 0003     Load word at G3 (OUTPUT)
   0928: LDA  01 0043     Load addr G67
   092b: SLDC 05          Short load constant 5
   092c: SLDC 04          Short load constant 4
   092d: LDP              Load packed field (TOS)
   092e: SLDC 00          Short load constant 0
   092f: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0932: LOD  01 0003     Load word at G3 (OUTPUT)
   0935: SLDC 2d          Short load constant 45
   0936: SLDC 00          Short load constant 0
   0937: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   093a: LOD  01 0003     Load word at G3 (OUTPUT)
   093d: LAO  0017        Load global BASE23
   093f: LDA  01 0043     Load addr G67
   0942: SLDC 04          Short load constant 4
   0943: SLDC 00          Short load constant 0
   0944: LDP              Load packed field (TOS)
   0945: IXA  0002        Index array (TOS-1 + TOS * 2)
   0947: SLDC 00          Short load constant 0
   0948: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   094b: LOD  01 0003     Load word at G3 (OUTPUT)
   094e: SLDC 2d          Short load constant 45
   094f: SLDC 00          Short load constant 0
   0950: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0953: LOD  01 0003     Load word at G3 (OUTPUT)
   0956: LDA  01 0043     Load addr G67
   0959: SLDC 07          Short load constant 7
   095a: SLDC 09          Short load constant 9
   095b: LDP              Load packed field (TOS)
   095c: SLDC 00          Short load constant 0
   095d: CXP  00 0d       Call external procedure PASCALSY.FWRITEINT
   0960: SLDC 01          Short load constant 1
   0961: SRO  0016        Store global word BASE22
   0963: SLDC 06          Short load constant 6
   0964: SRO  0039        Store global word BASE57
-> 0966: LDO  0016        Load global word BASE22
   0968: LDO  0039        Load global word BASE57
   096a: LEQI             Integer TOS-1 <= TOS
   096b: FJP  $097b       Jump if TOS false
   096d: LOD  01 0003     Load word at G3 (OUTPUT)
   0970: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0973: LDO  0016        Load global word BASE22
   0975: SLDC 01          Short load constant 1
   0976: ADI              Add integers (TOS + TOS-1)
   0977: SRO  0016        Store global word BASE22
   0979: UJP  $0966       Unconditional jump
-> 097b: LOD  01 0003     Load word at G3 (OUTPUT)
   097e: NOP              No operation
   097f: LSA  22          Load string address: '(C) Apple Computer Inc. 1979, 1980'
   09a3: SLDC 00          Short load constant 0
   09a4: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09a7: LOD  01 0003     Load word at G3 (OUTPUT)
   09aa: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   09ad: LOD  01 0003     Load word at G3 (OUTPUT)
   09b0: NOP              No operation
   09b1: LSA  15          Load string address: '(C) U.C. Regents 1979'
   09c8: SLDC 00          Short load constant 0
   09c9: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09cc: LOD  01 0003     Load word at G3 (OUTPUT)
   09cf: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   09d2: UJP  $09d4       Unconditional jump
-> 09d4: UJP  $09fb       Unconditional jump
-> 09d6: LOD  01 0003     Load word at G3 (OUTPUT)
   09d9: LSA  15          Load string address: 'System re-initialized'
   09f0: NOP              No operation
   09f1: SLDC 00          Short load constant 0
   09f2: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09f5: LOD  01 0003     Load word at G3 (OUTPUT)
   09f8: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 09fb: SLDC 06          Short load constant 6
   09fc: CSP  16          Call standard procedure UNLOADSEGMENT
   09fe: UJP  $0a05       Unconditional jump
-> 0a00: SLDC 06          Short load constant 6
   0a01: CSP  15          Call standard procedure LOADSEGMENT
   0a03: UJP  $072e       Unconditional jump
-> 0a05: RBP  00          Return from base procedure
END

### PROCEDURE INITIALI.INITSYSCOM (* P=2 LL=1 *)
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
   00ee: LLA  00ba        Load local address MP186
   00f1: LDCN             Load constant NIL
   00f2: SLDC 01          Short load constant 1
   00f3: NGI              Negate integer
   00f4: CXP  00 03       Call external procedure PASCALSY.FINIT
   00f7: LLA  00ba        Load local address MP186
   00fa: LLA  0001        Load local address MP1
   00fc: SLDC 01          Short load constant 1
   00fd: LDCN             Load constant NIL
   00fe: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0101: LDL  00bf        Load local word MP191
   0104: FJP  $0143       Jump if TOS false
   0106: LDL  00c1        Load local word MP193
   0109: LLA  002a        Load local address MP42
   010b: SLDC 00          Short load constant 0
   010c: LDCI 0120        Load word 288
   010f: LDL  00ca        Load local word MP202
   0112: SLDC 00          Short load constant 0
   0113: CSP  05          Call standard procedure UNITREAD
   0115: LOD  02 0001     Load word at G1 (SYSCOM)
   0118: STL  01dc        Store TOS into MP476
   011b: LDL  01dc        Load local word MP476
   011e: INC  001d        Inc field ptr (TOS+29)
   0120: LLA  0047        Load local address MP71
   0122: MOV  0001        Move 1 words (TOS to TOS-1)
   0124: LDL  01dc        Load local word MP476
   0127: INC  001e        Inc field ptr (TOS+30)
   0129: LDL  0048        Load local word MP72
   012b: STO              Store indirect (TOS into TOS-1)
   012c: LDL  01dc        Load local word MP476
   012f: INC  001f        Inc field ptr (TOS+31)
   0131: LLA  0049        Load local address MP73
   0133: MOV  0006        Move 6 words (TOS to TOS-1)
   0135: LDL  01dc        Load local word MP476
   0138: INC  0025        Inc field ptr (TOS+37)
   013a: LLA  004f        Load local address MP79
   013c: MOV  000b        Move 11 words (TOS to TOS-1)
   013e: LDA  02 0074     Load addr G116
   0141: CLP  03          Call local procedure INITIALI.INIT_FILLER
-> 0143: LLA  00ba        Load local address MP186
   0146: SLDC 00          Short load constant 0
   0147: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   014a: SLDC 01          Short load constant 1
   014b: CSP  26          Call standard procedure UNITCLEAR
   014d: LOD  02 0001     Load word at G1 (SYSCOM)
   0150: STL  01dc        Store TOS into MP476
   0153: LDL  01dc        Load local word MP476
   0156: INC  0001        Inc field ptr (TOS+1)
   0158: SLDC 00          Short load constant 0
   0159: STO              Store indirect (TOS into TOS-1)
   015a: LDL  01dc        Load local word MP476
   015d: SLDC 00          Short load constant 0
   015e: STO              Store indirect (TOS into TOS-1)
   015f: LDL  01dc        Load local word MP476
   0162: INC  0003        Inc field ptr (TOS+3)
   0164: SLDC 00          Short load constant 0
   0165: STO              Store indirect (TOS into TOS-1)
   0166: LDL  01dc        Load local word MP476
   0169: INC  0025        Inc field ptr (TOS+37)
   016b: STL  01dd        Store TOS into MP477
   016e: LDA  02 010a     Load addr G266
   0172: SLDC 10          Short load constant 16
   0173: SGS              Build singleton set [TOS]
   0174: LDL  01dd        Load local word MP477
   0177: INC  0008        Inc field ptr (TOS+8)
   0179: SLDC 08          Short load constant 8
   017a: SLDC 00          Short load constant 0
   017b: LDP              Load packed field (TOS)
   017c: SGS              Build singleton set [TOS]
   017d: UNI              Set union (TOS OR TOS-1)
   017e: ADJ  10          Adjust set to 16 words
   0180: STM  10          Store 16 words at TOS to TOS-1
   0182: SLDC 00          Short load constant 0
   0183: LDL  01dd        Load local word MP477
   0186: INC  0003        Inc field ptr (TOS+3)
   0188: SLDC 08          Short load constant 8
   0189: SLDC 08          Short load constant 8
   018a: LDP              Load packed field (TOS)
   018b: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   018d: SLDC 01          Short load constant 1
   018e: LDL  01dd        Load local word MP477
   0191: INC  0003        Inc field ptr (TOS+3)
   0193: SLDC 08          Short load constant 8
   0194: SLDC 00          Short load constant 0
   0195: LDP              Load packed field (TOS)
   0196: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   0198: SLDC 03          Short load constant 3
   0199: LDL  01dd        Load local word MP477
   019c: INC  0002        Inc field ptr (TOS+2)
   019e: SLDC 08          Short load constant 8
   019f: SLDC 08          Short load constant 8
   01a0: LDP              Load packed field (TOS)
   01a1: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01a3: SLDC 02          Short load constant 2
   01a4: LDL  01dd        Load local word MP477
   01a7: INC  0002        Inc field ptr (TOS+2)
   01a9: SLDC 08          Short load constant 8
   01aa: SLDC 00          Short load constant 0
   01ab: LDP              Load packed field (TOS)
   01ac: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01ae: SLDC 0b          Short load constant 11
   01af: LDL  01dd        Load local word MP477
   01b2: INC  0006        Inc field ptr (TOS+6)
   01b4: SLDC 08          Short load constant 8
   01b5: SLDC 00          Short load constant 0
   01b6: LDP              Load packed field (TOS)
   01b7: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01b9: SLDC 08          Short load constant 8
   01ba: LDL  01dd        Load local word MP477
   01bd: INC  0004        Inc field ptr (TOS+4)
   01bf: SLDC 08          Short load constant 8
   01c0: SLDC 00          Short load constant 0
   01c1: LDP              Load packed field (TOS)
   01c2: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01c4: SLDC 09          Short load constant 9
   01c5: LDL  01dd        Load local word MP477
   01c8: INC  0007        Inc field ptr (TOS+7)
   01ca: SLDC 08          Short load constant 8
   01cb: SLDC 08          Short load constant 8
   01cc: LDP              Load packed field (TOS)
   01cd: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01cf: SLDC 0a          Short load constant 10
   01d0: LDL  01dd        Load local word MP477
   01d3: INC  0007        Inc field ptr (TOS+7)
   01d5: SLDC 08          Short load constant 8
   01d6: SLDC 00          Short load constant 0
   01d7: LDP              Load packed field (TOS)
   01d8: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01da: SLDC 0d          Short load constant 13
   01db: LDL  01dd        Load local word MP477
   01de: IND  0009        Static index and load word (TOS+9)
   01e0: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01e2: SLDC 0c          Short load constant 12
   01e3: LDL  01dd        Load local word MP477
   01e6: INC  0008        Inc field ptr (TOS+8)
   01e8: SLDC 08          Short load constant 8
   01e9: SLDC 08          Short load constant 8
   01ea: LDP              Load packed field (TOS)
   01eb: CLP  05          Call local procedure INITIALI.SETPREFIXEDCRTINFO
   01ed: LDL  01dc        Load local word MP476
   01f0: INC  001f        Inc field ptr (TOS+31)
   01f2: STL  01dd        Store TOS into MP477
   01f5: SLDC 00          Short load constant 0
   01f6: LDL  01dd        Load local word MP477
   01f9: INC  0002        Inc field ptr (TOS+2)
   01fb: SLDC 08          Short load constant 8
   01fc: SLDC 08          Short load constant 8
   01fd: LDP              Load packed field (TOS)
   01fe: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0200: SLDC 01          Short load constant 1
   0201: LDL  01dd        Load local word MP477
   0204: INC  0002        Inc field ptr (TOS+2)
   0206: SLDC 08          Short load constant 8
   0207: SLDC 00          Short load constant 0
   0208: LDP              Load packed field (TOS)
   0209: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   020b: SLDC 02          Short load constant 2
   020c: LDL  01dd        Load local word MP477
   020f: INC  0001        Inc field ptr (TOS+1)
   0211: SLDC 08          Short load constant 8
   0212: SLDC 08          Short load constant 8
   0213: LDP              Load packed field (TOS)
   0214: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0216: SLDC 04          Short load constant 4
   0217: LDL  01dd        Load local word MP477
   021a: SLDC 08          Short load constant 8
   021b: SLDC 08          Short load constant 8
   021c: LDP              Load packed field (TOS)
   021d: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   021f: SLDC 03          Short load constant 3
   0220: LDL  01dd        Load local word MP477
   0223: INC  0001        Inc field ptr (TOS+1)
   0225: SLDC 08          Short load constant 8
   0226: SLDC 00          Short load constant 0
   0227: LDP              Load packed field (TOS)
   0228: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   022a: SLDC 05          Short load constant 5
   022b: LDL  01dd        Load local word MP477
   022e: INC  0003        Inc field ptr (TOS+3)
   0230: SLDC 08          Short load constant 8
   0231: SLDC 00          Short load constant 0
   0232: LDP              Load packed field (TOS)
   0233: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0235: SLDC 06          Short load constant 6
   0236: LDL  01dd        Load local word MP477
   0239: INC  0004        Inc field ptr (TOS+4)
   023b: SLDC 08          Short load constant 8
   023c: SLDC 08          Short load constant 8
   023d: LDP              Load packed field (TOS)
   023e: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   0240: SLDC 07          Short load constant 7
   0241: LDL  01dd        Load local word MP477
   0244: INC  0004        Inc field ptr (TOS+4)
   0246: SLDC 08          Short load constant 8
   0247: SLDC 00          Short load constant 0
   0248: LDP              Load packed field (TOS)
   0249: CLP  04          Call local procedure INITIALI.SETPREFIXEDCRTCTL
   024b: LDA  02 010a     Load addr G266
   024f: LDA  02 010a     Load addr G266
   0253: LDM  10          Load 16 words from (TOS)
   0255: SLDC 10          Short load constant 16
   0256: LDL  01dd        Load local word MP477
   0259: SLDC 08          Short load constant 8
   025a: SLDC 00          Short load constant 0
   025b: LDP              Load packed field (TOS)
   025c: SGS              Build singleton set [TOS]
   025d: UNI              Set union (TOS OR TOS-1)
   025e: SLDC 0d          Short load constant 13
   025f: SGS              Build singleton set [TOS]
   0260: DIF              Set difference (TOS-1 AND NOT TOS)
   0261: ADJ  10          Adjust set to 16 words
   0263: STM  10          Store 16 words at TOS to TOS-1
-> 0265: RNP  00          Return from nonbase procedure
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
   0045: LDA  03 010a     Load addr G266
   0049: LDA  03 010a     Load addr G266
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
   0071: LDA  03 010a     Load addr G266
   0075: LDA  03 010a     Load addr G266
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
-> 0296: LDA  02 00cc     Load addr G204
   029a: SLDC 00          Short load constant 0
   029b: IXA  000c        Index array (TOS-1 + TOS * 12)
   029d: LSA  10          Load string address: ':SYSTEM.ASSMBLER'
   02af: NOP              No operation
   02b0: SAS  17          String assign (TOS to TOS-1, 23 chars)
   02b2: LDA  02 00cc     Load addr G204
   02b6: SLDC 01          Short load constant 1
   02b7: IXA  000c        Index array (TOS-1 + TOS * 12)
   02b9: LSA  10          Load string address: ':SYSTEM.COMPILER'
   02cb: NOP              No operation
   02cc: SAS  17          String assign (TOS to TOS-1, 23 chars)
   02ce: LDA  02 00cc     Load addr G204
   02d2: SLDC 02          Short load constant 2
   02d3: IXA  000c        Index array (TOS-1 + TOS * 12)
   02d5: LSA  0e          Load string address: ':SYSTEM.EDITOR'
   02e5: NOP              No operation
   02e6: SAS  17          String assign (TOS to TOS-1, 23 chars)
   02e8: LDA  02 00cc     Load addr G204
   02ec: SLDC 03          Short load constant 3
   02ed: IXA  000c        Index array (TOS-1 + TOS * 12)
   02ef: LSA  0d          Load string address: ':SYSTEM.FILER'
   02fe: NOP              No operation
   02ff: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0301: LDA  02 00cc     Load addr G204
   0305: SLDC 04          Short load constant 4
   0306: IXA  000c        Index array (TOS-1 + TOS * 12)
   0308: NOP              No operation
   0309: LSA  0e          Load string address: ':SYSTEM.LINKER'
   0319: SAS  17          String assign (TOS to TOS-1, 23 chars)
   031b: LLA  0126        Load local address MP294
   031e: LDA  02 00cc     Load addr G204
   0322: MOV  003c        Move 60 words (TOS to TOS-1)
   0324: SLDC 1f          Short load constant 31
   0325: SLDC 01          Short load constant 1
   0326: ADJ  01          Adjust set to 1 words
   0328: STL  0162        Store TOS into MP354
   032b: LLA  0003        Load local address MP3
   032d: LDCN             Load constant NIL
   032e: SLDC 01          Short load constant 1
   032f: NGI              Negate integer
   0330: CXP  00 03       Call external procedure PASCALSY.FINIT
   0333: SLDC 00          Short load constant 0
   0334: STL  0001        Store TOS into MP1
   0336: SLDC 0c          Short load constant 12
   0337: STL  0163        Store TOS into MP355
-> 033a: SLDL 01          Short load local MP1
   033b: LDL  0163        Load local word MP355
   033e: LEQI             Integer TOS-1 <= TOS
   033f: FJP  $0448       Jump if TOS false
   0341: LDA  02 007e     Load addr G126
   0344: SLDL 01          Short load local MP1
   0345: IXA  0006        Index array (TOS-1 + TOS * 6)
   0347: STL  0164        Store TOS into MP356
   034a: LDL  0164        Load local word MP356
   034d: LSA  00          Load string address: ''
   034f: NOP              No operation
   0350: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0352: LDL  0164        Load local word MP356
   0355: INC  0004        Inc field ptr (TOS+4)
   0357: SLDL 01          Short load local MP1
   0358: LDCI 1e30        Load word 7728
   035b: SLDC 01          Short load constant 1
   035c: INN              Set membership (TOS-1 in set TOS)
   035d: STO              Store indirect (TOS into TOS-1)
   035e: LDL  0164        Load local word MP356
   0361: SIND 04          Short index load *TOS+4
   0362: FJP  $0441       Jump if TOS false
   0364: LDL  0164        Load local word MP356
   0367: INC  0005        Inc field ptr (TOS+5)
   0369: LDCI 7fff        Load word 32767
   036c: STO              Store indirect (TOS into TOS-1)
   036d: SLDL 01          Short load local MP1
   036e: CSP  26          Call standard procedure UNITCLEAR
   0370: CSP  22          Call standard procedure IORESULT
   0372: SLDC 00          Short load constant 0
   0373: EQUI             Integer TOS-1 = TOS
   0374: FJP  $0441       Jump if TOS false
   0376: SLDL 01          Short load local MP1
   0377: SLDC 00          Short load constant 0
   0378: SLDC 00          Short load constant 0
   0379: CXP  00 2a       Call external procedure PASCALSY.42
   037c: FJP  $0441       Jump if TOS false
   037e: LDL  0164        Load local word MP356
   0381: LOD  02 0001     Load word at G1 (SYSCOM)
   0384: SIND 04          Short index load *TOS+4
   0385: SLDC 00          Short load constant 0
   0386: IXA  000d        Index array (TOS-1 + TOS * 13)
   0388: INC  0003        Inc field ptr (TOS+3)
   038a: SAS  07          String assign (TOS to TOS-1, 7 chars)
   038c: SLDL 01          Short load local MP1
   038d: LOD  02 0001     Load word at G1 (SYSCOM)
   0390: SIND 02          Short index load *TOS+2
   0391: EQUI             Integer TOS-1 = TOS
   0392: FJP  $03c4       Jump if TOS false
   0394: LDA  02 003f     Load addr G63
   0397: LDL  0164        Load local word MP356
   039a: SAS  07          String assign (TOS to TOS-1, 7 chars)
   039c: LAO  0001        Load global BASE1
   039e: NOP              No operation
   039f: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   03b0: SAS  28          String assign (TOS to TOS-1, 40 chars)
   03b2: LLA  0003        Load local address MP3
   03b4: LAO  0001        Load global BASE1
   03b6: SLDC 01          Short load constant 1
   03b7: LDCN             Load constant NIL
   03b8: CXP  00 05       Call external procedure PASCALSY.FOPEN
   03bb: SLDL 08          Short load local MP8
   03bc: SRO  0037        Store global word BASE55
   03be: LLA  0003        Load local address MP3
   03c0: SLDC 00          Short load constant 0
   03c1: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 03c4: SLDC 00          Short load constant 0
   03c5: STL  0125        Store TOS into MP293
   03c8: SLDC 04          Short load constant 4
   03c9: STL  0165        Store TOS into MP357
-> 03cc: LDL  0125        Load local word MP293
   03cf: LDL  0165        Load local word MP357
   03d2: LEQI             Integer TOS-1 <= TOS
   03d3: FJP  $0441       Jump if TOS false
   03d5: SLDL 01          Short load local MP1
   03d6: LOD  02 0001     Load word at G1 (SYSCOM)
   03d9: SIND 02          Short index load *TOS+2
   03da: EQUI             Integer TOS-1 = TOS
   03db: LDL  0125        Load local word MP293
   03de: LDL  0162        Load local word MP354
   03e1: SLDC 01          Short load constant 1
   03e2: INN              Set membership (TOS-1 in set TOS)
   03e3: LOR              Logical OR (TOS | TOS-1)
   03e4: FJP  $0437       Jump if TOS false
   03e6: LAO  0001        Load global BASE1
   03e8: SLDC 00          Short load constant 0
   03e9: STL  0166        Store TOS into MP358
   03ec: LLA  0166        Load local address MP358
   03ef: LDL  0164        Load local word MP356
   03f2: SLDC 07          Short load constant 7
   03f3: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   03f6: LLA  0166        Load local address MP358
   03f9: LLA  0126        Load local address MP294
   03fc: LDL  0125        Load local word MP293
   03ff: IXA  000c        Index array (TOS-1 + TOS * 12)
   0401: SLDC 1e          Short load constant 30
   0402: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0405: LLA  0166        Load local address MP358
   0408: SAS  28          String assign (TOS to TOS-1, 40 chars)
   040a: LLA  0003        Load local address MP3
   040c: LAO  0001        Load global BASE1
   040e: SLDC 01          Short load constant 1
   040f: LDCN             Load constant NIL
   0410: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0413: SLDL 08          Short load local MP8
   0414: FJP  $0431       Jump if TOS false
   0416: LDA  02 00cc     Load addr G204
   041a: LDL  0125        Load local word MP293
   041d: IXA  000c        Index array (TOS-1 + TOS * 12)
   041f: LAO  0001        Load global BASE1
   0421: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0423: LDL  0162        Load local word MP354
   0426: SLDC 01          Short load constant 1
   0427: LDL  0125        Load local word MP293
   042a: SGS              Build singleton set [TOS]
   042b: DIF              Set difference (TOS-1 AND NOT TOS)
   042c: ADJ  01          Adjust set to 1 words
   042e: STL  0162        Store TOS into MP354
-> 0431: LLA  0003        Load local address MP3
   0433: SLDC 00          Short load constant 0
   0434: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 0437: LDL  0125        Load local word MP293
   043a: SLDC 01          Short load constant 1
   043b: ADI              Add integers (TOS + TOS-1)
   043c: STL  0125        Store TOS into MP293
   043f: UJP  $03cc       Unconditional jump
-> 0441: SLDL 01          Short load local MP1
   0442: SLDC 01          Short load constant 1
   0443: ADI              Add integers (TOS + TOS-1)
   0444: STL  0001        Store TOS into MP1
   0446: UJP  $033a       Unconditional jump
-> 0448: LOD  02 0159     Load word at G345
   044c: FJP  $0456       Jump if TOS false
   044e: LDA  02 003b     Load addr G59
   0451: LDA  02 003f     Load addr G63
   0454: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0456: LDA  02 003f     Load addr G63
   0459: SLDC 00          Short load constant 0
   045a: LLA  0002        Load local address MP2
   045c: SLDC 00          Short load constant 0
   045d: SLDC 00          Short load constant 0
   045e: CXP  00 1e       Call external procedure PASCALSY.30
   0461: STL  0001        Store TOS into MP1
   0463: SLDL 02          Short load local MP2
   0464: LDCN             Load constant NIL
   0465: EQUI             Integer TOS-1 = TOS
   0466: FJP  $046a       Jump if TOS false
   0468: CSP  27          Call standard procedure HALT
-> 046a: LDA  02 0043     Load addr G67
   046d: SLDL 02          Short load local MP2
   046e: SLDC 00          Short load constant 0
   046f: IXA  000d        Index array (TOS-1 + TOS * 13)
   0471: INC  000a        Inc field ptr (TOS+10)
   0473: MOV  0001        Move 1 words (TOS to TOS-1)
   0475: SLDC 01          Short load constant 1
   0476: NOP              No operation
   0477: LSA  07          Load string address: 'CONSOLE'
   0480: CLP  07          Call local procedure INITIALI.7
   0482: SLDC 02          Short load constant 2
   0483: LSA  07          Load string address: 'SYSTERM'
   048c: NOP              No operation
   048d: CLP  07          Call local procedure INITIALI.7
   048f: SLDC 03          Short load constant 3
   0490: NOP              No operation
   0491: LSA  07          Load string address: 'GRAPHIC'
   049a: CLP  07          Call local procedure INITIALI.7
   049c: SLDC 06          Short load constant 6
   049d: LSA  07          Load string address: 'PRINTER'
   04a6: NOP              No operation
   04a7: CLP  07          Call local procedure INITIALI.7
   04a9: SLDC 07          Short load constant 7
   04aa: NOP              No operation
   04ab: LSA  05          Load string address: 'REMIN'
   04b2: CLP  07          Call local procedure INITIALI.7
   04b4: SLDC 08          Short load constant 8
   04b5: LSA  06          Load string address: 'REMOUT'
   04bd: NOP              No operation
   04be: CLP  07          Call local procedure INITIALI.7
-> 04c0: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC7(PARAM1; PARAM2) (* P=7 LL=2 *)
  MP1=PARAM2
  MP2=PARAM1
  MP3
BEGIN
-> 0272: LLA  0003        Load local address MP3
   0274: SLDL 01          Short load local MP1
   0275: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0277: SLDL 02          Short load local MP2
   0278: CSP  26          Call standard procedure UNITCLEAR
   027a: CSP  22          Call standard procedure IORESULT
   027c: SLDC 00          Short load constant 0
   027d: EQUI             Integer TOS-1 = TOS
   027e: FJP  $028a       Jump if TOS false
   0280: LDA  03 007e     Load addr G126
   0283: SLDL 02          Short load local MP2
   0284: IXA  0006        Index array (TOS-1 + TOS * 6)
   0286: LLA  0003        Load local address MP3
   0288: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 028a: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC8 (* P=8 LL=1 *)
  MP1
BEGIN
-> 04d8: LOD  02 0001     Load word at G1 (SYSCOM)
   04db: INC  0004        Inc field ptr (TOS+4)
   04dd: LDCN             Load constant NIL
   04de: STO              Store indirect (TOS into TOS-1)
   04df: LDA  02 0037     Load addr G55
   04e2: SLDC 1e          Short load constant 30
   04e3: CSP  01          Call standard procedure NEW
   04e5: LOD  02 0037     Load word at G55
   04e8: LDCN             Load constant NIL
   04e9: SLDC 01          Short load constant 1
   04ea: NGI              Negate integer
   04eb: CXP  00 03       Call external procedure PASCALSY.FINIT
   04ee: LDA  02 003a     Load addr G58
   04f1: SLDC 1e          Short load constant 30
   04f2: CSP  01          Call standard procedure NEW
   04f4: LLA  0001        Load local address MP1
   04f6: SLDC 01          Short load constant 1
   04f7: CSP  01          Call standard procedure NEW
   04f9: LOD  02 003a     Load word at G58
   04fc: SLDL 01          Short load local MP1
   04fd: SLDC 00          Short load constant 0
   04fe: CXP  00 03       Call external procedure PASCALSY.FINIT
   0501: LDA  02 0039     Load addr G57
   0504: SLDC 1e          Short load constant 30
   0505: CSP  01          Call standard procedure NEW
   0507: LLA  0001        Load local address MP1
   0509: SLDC 01          Short load constant 1
   050a: CSP  01          Call standard procedure NEW
   050c: LOD  02 0039     Load word at G57
   050f: SLDL 01          Short load local MP1
   0510: SLDC 00          Short load constant 0
   0511: CXP  00 03       Call external procedure PASCALSY.FINIT
   0514: LDA  02 0038     Load addr G56
   0517: SLDC 1e          Short load constant 30
   0518: CSP  01          Call standard procedure NEW
   051a: LLA  0001        Load local address MP1
   051c: SLDC 01          Short load constant 1
   051d: CSP  01          Call standard procedure NEW
   051f: LOD  02 0038     Load word at G56
   0522: SLDL 01          Short load local MP1
   0523: SLDC 00          Short load constant 0
   0524: CXP  00 03       Call external procedure PASCALSY.FINIT
   0527: LDA  02 0002     Load addr G2 (INPUT)
   052a: SLDC 00          Short load constant 0
   052b: IXA  0001        Index array (TOS-1 + TOS * 1)
   052d: LOD  02 003a     Load word at G58
   0530: STO              Store indirect (TOS into TOS-1)
   0531: LDA  02 0002     Load addr G2 (INPUT)
   0534: SLDC 01          Short load constant 1
   0535: IXA  0001        Index array (TOS-1 + TOS * 1)
   0537: LOD  02 0039     Load word at G57
   053a: STO              Store indirect (TOS into TOS-1)
   053b: LDA  02 0009     Load addr G9
   053e: SLDC 1e          Short load constant 30
   053f: CSP  01          Call standard procedure NEW
   0541: LOD  02 0009     Load word at G9
   0544: LDCN             Load constant NIL
   0545: SLDC 01          Short load constant 1
   0546: NGI              Negate integer
   0547: CXP  00 03       Call external procedure PASCALSY.FINIT
   054a: LDA  02 0008     Load addr G8
   054d: SLDC 1e          Short load constant 30
   054e: CSP  01          Call standard procedure NEW
   0550: LOD  02 0008     Load word at G8
   0553: LDCN             Load constant NIL
   0554: SLDC 01          Short load constant 1
   0555: NGI              Negate integer
   0556: CXP  00 03       Call external procedure PASCALSY.FINIT
   0559: LDA  02 0036     Load addr G54
   055c: CSP  20          Call standard procedure MARK
-> 055e: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC9 (* P=9 LL=1 *)
BEGIN
-> 05d2: SLDC 00          Short load constant 0
   05d3: STR  02 000a     Store TOS to G10
   05d6: SLDC 00          Short load constant 0
   05d7: STR  02 000b     Store TOS to G11
   05da: SLDC 00          Short load constant 0
   05db: STR  02 000c     Store TOS to G12
   05de: LOD  02 0159     Load word at G345
   05e2: FJP  $0614       Jump if TOS false
   05e4: LDA  02 0026     Load addr G38
   05e7: LSA  00          Load string address: ''
   05e9: NOP              No operation
   05ea: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   05ec: LDA  02 001e     Load addr G30
   05ef: LSA  00          Load string address: ''
   05f1: NOP              No operation
   05f2: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   05f4: LDA  02 002e     Load addr G46
   05f7: LSA  00          Load string address: ''
   05f9: NOP              No operation
   05fa: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   05fc: LDA  02 0016     Load addr G22
   05ff: LDA  02 003f     Load addr G63
   0602: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0604: LDA  02 0012     Load addr G18
   0607: LDA  02 003f     Load addr G63
   060a: SAS  07          String assign (TOS to TOS-1, 7 chars)
   060c: LDA  02 001a     Load addr G26
   060f: LDA  02 003f     Load addr G63
   0612: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 0614: LOD  02 0009     Load word at G9
   0617: LSA  10          Load string address: '*SYSTEM.WRK.TEXT'
   0629: NOP              No operation
   062a: LDA  02 0016     Load addr G22
   062d: LDA  02 0026     Load addr G38
   0630: LDA  02 0011     Load addr G17
   0633: CLP  0a          Call local procedure INITIALI.10
   0635: LOD  02 0008     Load word at G8
   0638: NOP              No operation
   0639: LSA  10          Load string address: '*SYSTEM.WRK.CODE'
   064b: LDA  02 0012     Load addr G18
   064e: LDA  02 001e     Load addr G30
   0651: LDA  02 0010     Load addr G16
   0654: CLP  0a          Call local procedure INITIALI.10
   0656: LOD  02 0001     Load word at G1 (SYSCOM)
   0659: INC  002c        Inc field ptr (TOS+44)
   065b: SLDC 08          Short load constant 8
   065c: SLDC 08          Short load constant 8
   065d: LDP              Load packed field (TOS)
   065e: STR  02 000f     Store TOS to G15
   0661: LOD  02 0001     Load word at G1 (SYSCOM)
   0664: INC  001d        Inc field ptr (TOS+29)
   0666: SLDC 01          Short load constant 1
   0667: SLDC 04          Short load constant 4
   0668: LDP              Load packed field (TOS)
   0669: STR  02 000e     Store TOS to G14
   066c: LOD  02 0001     Load word at G1 (SYSCOM)
   066f: INC  001d        Inc field ptr (TOS+29)
   0671: SLDC 01          Short load constant 1
   0672: SLDC 05          Short load constant 5
   0673: LDP              Load packed field (TOS)
   0674: STR  02 000d     Store TOS to G13
-> 0677: RNP  00          Return from nonbase procedure
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
-> 056a: LLA  0006        Load local address MP6
   056c: SLDL 04          Short load local MP4
   056d: SAS  17          String assign (TOS to TOS-1, 23 chars)
   056f: SLDL 05          Short load local MP5
   0570: LLA  0006        Load local address MP6
   0572: SLDC 01          Short load constant 1
   0573: LDCN             Load constant NIL
   0574: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0577: SLDL 05          Short load local MP5
   0578: SIND 05          Short index load *TOS+5
   0579: LNOT             Logical NOT (~TOS)
   057a: FJP  $05ad       Jump if TOS false
   057c: SLDL 02          Short load local MP2
   057d: LSA  00          Load string address: ''
   057f: NOP              No operation
   0580: NEQSTR           String TOS-1 <> TOS
   0582: FJP  $05ad       Jump if TOS false
   0584: LLA  0012        Load local address MP18
   0586: SLDC 00          Short load constant 0
   0587: STL  001e        Store TOS into MP30
   0589: LLA  001e        Load local address MP30
   058b: SLDL 03          Short load local MP3
   058c: SLDC 07          Short load constant 7
   058d: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0590: LLA  001e        Load local address MP30
   0592: NOP              No operation
   0593: LSA  01          Load string address: ':'
   0596: SLDC 08          Short load constant 8
   0597: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   059a: LLA  001e        Load local address MP30
   059c: SLDL 02          Short load local MP2
   059d: SLDC 17          Short load constant 23
   059e: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05a1: LLA  001e        Load local address MP30
   05a3: SAS  17          String assign (TOS to TOS-1, 23 chars)
   05a5: SLDL 05          Short load local MP5
   05a6: LLA  0012        Load local address MP18
   05a8: SLDC 01          Short load constant 1
   05a9: LDCN             Load constant NIL
   05aa: CXP  00 05       Call external procedure PASCALSY.FOPEN
-> 05ad: SLDL 01          Short load local MP1
   05ae: SLDL 05          Short load local MP5
   05af: SIND 05          Short index load *TOS+5
   05b0: STO              Store indirect (TOS into TOS-1)
   05b1: SLDL 01          Short load local MP1
   05b2: SIND 00          Short index load *TOS+0
   05b3: FJP  $05c1       Jump if TOS false
   05b5: SLDL 03          Short load local MP3
   05b6: SLDL 05          Short load local MP5
   05b7: INC  0008        Inc field ptr (TOS+8)
   05b9: SAS  07          String assign (TOS to TOS-1, 7 chars)
   05bb: SLDL 02          Short load local MP2
   05bc: SLDL 05          Short load local MP5
   05bd: INC  0013        Inc field ptr (TOS+19)
   05bf: SAS  0f          String assign (TOS to TOS-1, 15 chars)
-> 05c1: SLDL 05          Short load local MP5
   05c2: SLDC 00          Short load constant 0
   05c3: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 05c6: RNP  00          Return from nonbase procedure
END

### PROCEDURE INITIALI.PROC11 (* P=11 LL=1 *)
  BASE1
BEGIN
-> 0684: LOD  02 0037     Load word at G55
   0687: SLDC 00          Short load constant 0
   0688: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   068b: LOD  02 0009     Load word at G9
   068e: SLDC 00          Short load constant 0
   068f: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0692: LOD  02 0008     Load word at G8
   0695: SLDC 00          Short load constant 0
   0696: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0699: LOD  02 003a     Load word at G58
   069c: SLDC 00          Short load constant 0
   069d: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   06a0: LOD  02 0039     Load word at G57
   06a3: SLDC 00          Short load constant 0
   06a4: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   06a7: LAO  0001        Load global BASE1
   06a9: LSA  08          Load string address: 'CONSOLE:'
   06b3: NOP              No operation
   06b4: SAS  28          String assign (TOS to TOS-1, 40 chars)
   06b6: LOD  02 003a     Load word at G58
   06b9: LAO  0001        Load global BASE1
   06bb: SLDC 01          Short load constant 1
   06bc: LDCN             Load constant NIL
   06bd: CXP  00 05       Call external procedure PASCALSY.FOPEN
   06c0: LOD  02 0039     Load word at G57
   06c3: LAO  0001        Load global BASE1
   06c5: SLDC 01          Short load constant 1
   06c6: LDCN             Load constant NIL
   06c7: CXP  00 05       Call external procedure PASCALSY.FOPEN
   06ca: LOD  02 0159     Load word at G345
   06ce: FJP  $06e9       Jump if TOS false
   06d0: LAO  0001        Load global BASE1
   06d2: NOP              No operation
   06d3: LSA  08          Load string address: 'SYSTERM:'
   06dd: SAS  28          String assign (TOS to TOS-1, 40 chars)
   06df: LOD  02 0038     Load word at G56
   06e2: LAO  0001        Load global BASE1
   06e4: SLDC 01          Short load constant 1
   06e5: LDCN             Load constant NIL
   06e6: CXP  00 05       Call external procedure PASCALSY.FOPEN
-> 06e9: LDA  02 0002     Load addr G2 (INPUT)
   06ec: SLDC 00          Short load constant 0
   06ed: IXA  0001        Index array (TOS-1 + TOS * 1)
   06ef: LOD  02 003a     Load word at G58
   06f2: STO              Store indirect (TOS into TOS-1)
   06f3: LDA  02 0002     Load addr G2 (INPUT)
   06f6: SLDC 01          Short load constant 1
   06f7: IXA  0001        Index array (TOS-1 + TOS * 1)
   06f9: LOD  02 0039     Load word at G57
   06fc: STO              Store indirect (TOS into TOS-1)
   06fd: LDA  02 0002     Load addr G2 (INPUT)
   0700: SLDC 02          Short load constant 2
   0701: IXA  0001        Index array (TOS-1 + TOS * 1)
   0703: LOD  02 0038     Load word at G56
   0706: STO              Store indirect (TOS into TOS-1)
   0707: LDA  02 0002     Load addr G2 (INPUT)
   070a: SLDC 03          Short load constant 3
   070b: IXA  0001        Index array (TOS-1 + TOS * 1)
   070d: LDCN             Load constant NIL
   070e: STO              Store indirect (TOS into TOS-1)
   070f: LDA  02 0002     Load addr G2 (INPUT)
   0712: SLDC 04          Short load constant 4
   0713: IXA  0001        Index array (TOS-1 + TOS * 1)
   0715: LDCN             Load constant NIL
   0716: STO              Store indirect (TOS into TOS-1)
   0717: LDA  02 0002     Load addr G2 (INPUT)
   071a: SLDC 05          Short load constant 5
   071b: IXA  0001        Index array (TOS-1 + TOS * 1)
   071d: LDCN             Load constant NIL
   071e: STO              Store indirect (TOS into TOS-1)
-> 071f: RNP  00          Return from nonbase procedure
END

## Segment GETCMD (5)

### FUNCTION GETCMD.GETCMD(PARAM1): RETVAL (* P=1 LL=0 *)
  BASE1=RETVAL1
  BASE3=PARAM1
  BASE4
  BASE5
  BASE6
BEGIN
-> 0d40: LOD  01 003a     Load word at G58
   0d43: INC  0002        Inc field ptr (TOS+2)
   0d45: SLDC 00          Short load constant 0
   0d46: STO              Store indirect (TOS into TOS-1)
   0d47: LOD  01 0039     Load word at G57
   0d4a: INC  0002        Inc field ptr (TOS+2)
   0d4c: SLDC 00          Short load constant 0
   0d4d: STO              Store indirect (TOS into TOS-1)
   0d4e: LOD  01 0038     Load word at G56
   0d51: INC  0002        Inc field ptr (TOS+2)
   0d53: SLDC 00          Short load constant 0
   0d54: STO              Store indirect (TOS into TOS-1)
   0d55: LDA  01 0002     Load addr G2 (INPUT)
   0d58: SLDC 00          Short load constant 0
   0d59: IXA  0001        Index array (TOS-1 + TOS * 1)
   0d5b: LOD  01 003a     Load word at G58
   0d5e: STO              Store indirect (TOS into TOS-1)
   0d5f: LDA  01 0002     Load addr G2 (INPUT)
   0d62: SLDC 01          Short load constant 1
   0d63: IXA  0001        Index array (TOS-1 + TOS * 1)
   0d65: LOD  01 0039     Load word at G57
   0d68: STO              Store indirect (TOS into TOS-1)
   0d69: SLDO 03          Short load global BASE3
   0d6a: SLDC 00          Short load constant 0
   0d6b: EQUI             Integer TOS-1 = TOS
   0d6c: FJP  $0d9c       Jump if TOS false
   0d6e: LOD  01 0159     Load word at G345
   0d72: FJP  $0d9c       Jump if TOS false
   0d74: SLDC 00          Short load constant 0
   0d75: STR  01 0159     Store TOS to G345
   0d79: LSA  0e          Load string address: '*SYSTEM.ATTACH'
   0d89: NOP              No operation
   0d8a: SLDC 00          Short load constant 0
   0d8b: SLDC 00          Short load constant 0
   0d8c: SLDC 00          Short load constant 0
   0d8d: LAO  0006        Load global BASE6
   0d8f: SLDC 00          Short load constant 0
   0d90: SLDC 00          Short load constant 0
   0d91: CLP  0a          Call local procedure GETCMD.10
   0d93: FJP  $0d9c       Jump if TOS false
   0d95: SLDC 0a          Short load constant 10
   0d96: SRO  0001        Store global word BASE1
   0d98: SLDC 05          Short load constant 5
   0d99: SLDC 01          Short load constant 1
   0d9a: CSP  04          Call standard procedure EXIT
-> 0d9c: SLDO 03          Short load global BASE3
   0d9d: SLDC 0a          Short load constant 10
   0d9e: EQUI             Integer TOS-1 = TOS
   0d9f: FJP  $0da4       Jump if TOS false
   0da1: SLDC 00          Short load constant 0
   0da2: SRO  0003        Store global word BASE3
-> 0da4: SLDO 03          Short load global BASE3
   0da5: SLDC 00          Short load constant 0
   0da6: EQUI             Integer TOS-1 = TOS
   0da7: FJP  $0dd0       Jump if TOS false
   0da9: LSA  0f          Load string address: '*SYSTEM.STARTUP'
   0dba: NOP              No operation
   0dbb: SLDC 00          Short load constant 0
   0dbc: SLDC 00          Short load constant 0
   0dbd: SLDC 00          Short load constant 0
   0dbe: LAO  0006        Load global BASE6
   0dc0: SLDC 00          Short load constant 0
   0dc1: SLDC 00          Short load constant 0
   0dc2: CLP  0a          Call local procedure GETCMD.10
   0dc4: FJP  $0dd0       Jump if TOS false
   0dc6: CXP  00 25       Call external procedure PASCALSY.37
   0dc9: SLDC 04          Short load constant 4
   0dca: SRO  0001        Store global word BASE1
   0dcc: SLDC 05          Short load constant 5
   0dcd: SLDC 01          Short load constant 1
   0dce: CSP  04          Call standard procedure EXIT
-> 0dd0: SLDO 03          Short load global BASE3
   0dd1: LDCI 00e0        Load word 224
   0dd4: SLDC 01          Short load constant 1
   0dd5: INN              Set membership (TOS-1 in set TOS)
   0dd6: FJP  $0dda       Jump if TOS false
   0dd8: CLP  0d          Call local procedure GETCMD.13
-> 0dda: SLDO 03          Short load global BASE3
   0ddb: LDCI 0300        Load word 768
   0dde: SLDC 01          Short load constant 1
   0ddf: INN              Set membership (TOS-1 in set TOS)
   0de0: FJP  $0de8       Jump if TOS false
   0de2: SLDC 00          Short load constant 0
   0de3: SLDO 03          Short load global BASE3
   0de4: SLDC 08          Short load constant 8
   0de5: EQUI             Integer TOS-1 = TOS
   0de6: CLP  02          Call local procedure GETCMD.2
-> 0de8: LOD  01 0001     Load word at G1 (SYSCOM)
   0deb: INC  001d        Inc field ptr (TOS+29)
   0ded: SLDC 02          Short load constant 2
   0dee: SLDC 07          Short load constant 7
   0def: LDP              Load packed field (TOS)
   0df0: SLDC 01          Short load constant 1
   0df1: EQUI             Integer TOS-1 = TOS
   0df2: FJP  $0e0d       Jump if TOS false
   0df4: SLDO 03          Short load global BASE3
   0df5: SLDC 00          Short load constant 0
   0df6: EQUI             Integer TOS-1 = TOS
   0df7: FJP  $0e02       Jump if TOS false
   0df9: SLDC 06          Short load constant 6
   0dfa: SRO  0003        Store global word BASE3
   0dfc: SLDC 01          Short load constant 1
   0dfd: SLDC 01          Short load constant 1
   0dfe: CLP  02          Call local procedure GETCMD.2
   0e00: UJP  $0e0d       Unconditional jump
-> 0e02: LDCN             Load constant NIL
   0e03: STR  01 0036     Store TOS to G54
   0e06: SLDC 00          Short load constant 0
   0e07: SRO  0001        Store global word BASE1
   0e09: SLDC 05          Short load constant 5
   0e0a: SLDC 01          Short load constant 1
   0e0b: CSP  04          Call standard procedure EXIT
-> 0e0d: SLDC 00          Short load constant 0
   0e0e: STR  01 000a     Store TOS to G10
   0e11: SLDC 00          Short load constant 0
   0e12: STR  01 000b     Store TOS to G11
   0e15: SLDC 00          Short load constant 0
   0e16: STR  01 000c     Store TOS to G12
   0e19: SLDC 00          Short load constant 0
   0e1a: SRO  0005        Store global word BASE5
   0e1c: LDA  01 011a     Load addr G282
   0e20: SLDC 00          Short load constant 0
   0e21: LDB              Load byte at byte ptr TOS-1 + TOS
   0e22: SLDC 00          Short load constant 0
   0e23: NEQI             Integer TOS-1 <> TOS
   0e24: FJP  $0e29       Jump if TOS false
   0e26: SLDC 01          Short load constant 1
   0e27: CLP  10          Call local procedure GETCMD.16
-> 0e29: LDA  01 0046     Load addr G70
   0e2c: NOP              No operation
   0e2d: LSA  4a          Load string address: 'Command: E(dit, R(un, F(ile, C(omp, L(ink, X(ecute, A(ssem, D(ebug,? [1.1]'
   0e79: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0e7b: CXP  00 27       Call external procedure PASCALSY.39
   0e7e: SLDO 05          Short load global BASE5
   0e7f: SLDC 00          Short load constant 0
   0e80: SLDC 00          Short load constant 0
   0e81: CXP  00 29       Call external procedure PASCALSY.41
   0e84: SRO  0004        Store global word BASE4
   0e86: CXP  00 25       Call external procedure PASCALSY.37
   0e89: SLDO 04          Short load global BASE4
   0e8a: SLDC 3f          Short load constant 63
   0e8b: EQUI             Integer TOS-1 = TOS
   0e8c: FJP  $0ee1       Jump if TOS false
   0e8e: LDA  01 0046     Load addr G70
   0e91: LSA  3d          Load string address: 'Command: U(ser restart, I(nitialize, H(alt, S(wap, M(ake exec'
   0ed0: NOP              No operation
   0ed1: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0ed3: CXP  00 27       Call external procedure PASCALSY.39
   0ed6: SLDO 05          Short load global BASE5
   0ed7: SLDC 00          Short load constant 0
   0ed8: SLDC 00          Short load constant 0
   0ed9: CXP  00 29       Call external procedure PASCALSY.41
   0edc: SRO  0004        Store global word BASE4
   0ede: CXP  00 25       Call external procedure PASCALSY.37
-> 0ee1: LOD  01 0157     Load word at G343
   0ee5: FJP  $0ef1       Jump if TOS false
   0ee7: LDA  01 0036     Load addr G54
   0eea: CSP  21          Call standard procedure RELEASE
   0eec: SLDC 00          Short load constant 0
   0eed: STR  01 0157     Store TOS to G343
-> 0ef1: SLDO 04          Short load global BASE4
   0ef4: LDC  06          Load multiple-word constant
                         012c337a8000000000000000
   0f00: SLDC 06          Short load constant 6
   0f01: INN              Set membership (TOS-1 in set TOS)
   0f02: LNOT             Logical NOT (~TOS)
   0f03: SRO  0005        Store global word BASE5
   0f05: SLDO 05          Short load global BASE5
   0f06: LNOT             Logical NOT (~TOS)
   0f07: FJP  $1038       Jump if TOS false
   0f09: SLDO 04          Short load global BASE4
   0f0a: UJP  $1001       Unconditional jump
   0f0c: LOD  01 0003     Load word at G3 (OUTPUT)
   0f0f: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0f12: SLDC 02          Short load constant 2
   0f13: SLDC 00          Short load constant 0
   0f14: SLDC 00          Short load constant 0
   0f15: CLP  03          Call local procedure GETCMD.3
   0f17: FJP  $0f20       Jump if TOS false
   0f19: SLDC 04          Short load constant 4
   0f1a: SRO  0001        Store global word BASE1
   0f1c: SLDC 05          Short load constant 5
   0f1d: SLDC 01          Short load constant 1
   0f1e: CSP  04          Call standard procedure EXIT
-> 0f20: UJP  $1038       Unconditional jump
   0f22: LOD  01 0003     Load word at G3 (OUTPUT)
   0f25: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0f28: SLDC 03          Short load constant 3
   0f29: SLDC 00          Short load constant 0
   0f2a: SLDC 00          Short load constant 0
   0f2b: CLP  03          Call local procedure GETCMD.3
   0f2d: FJP  $0f3b       Jump if TOS false
   0f2f: SLDC 04          Short load constant 4
   0f30: SRO  0001        Store global word BASE1
   0f32: SLDC 01          Short load constant 1
   0f33: STR  01 0158     Store TOS to G344
   0f37: SLDC 05          Short load constant 5
   0f38: SLDC 01          Short load constant 1
   0f39: CSP  04          Call standard procedure EXIT
-> 0f3b: UJP  $1038       Unconditional jump
   0f3d: LOD  01 0003     Load word at G3 (OUTPUT)
   0f40: NOP              No operation
   0f41: LSA  0a          Load string address: 'Linking...'
   0f4d: SLDC 00          Short load constant 0
   0f4e: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0f51: LOD  01 0003     Load word at G3 (OUTPUT)
   0f54: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0f57: SLDC 04          Short load constant 4
   0f58: SLDC 00          Short load constant 0
   0f59: SLDC 00          Short load constant 0
   0f5a: CLP  03          Call local procedure GETCMD.3
   0f5c: FJP  $0f65       Jump if TOS false
   0f5e: SLDC 04          Short load constant 4
   0f5f: SRO  0001        Store global word BASE1
   0f61: SLDC 05          Short load constant 5
   0f62: SLDC 01          Short load constant 1
   0f63: CSP  04          Call standard procedure EXIT
-> 0f65: UJP  $1038       Unconditional jump
   0f67: SLDC 00          Short load constant 0
   0f68: CLP  10          Call local procedure GETCMD.16
   0f6a: UJP  $1038       Unconditional jump
   0f6c: SLDC 05          Short load constant 5
   0f6d: CLP  0b          Call local procedure GETCMD.11
   0f6f: UJP  $1038       Unconditional jump
   0f71: SLDC 08          Short load constant 8
   0f72: CLP  0b          Call local procedure GETCMD.11
   0f74: UJP  $1038       Unconditional jump
   0f76: SLDO 03          Short load global BASE3
   0f77: SLDC 02          Short load constant 2
   0f78: NEQI             Integer TOS-1 <> TOS
   0f79: FJP  $0fa1       Jump if TOS false
   0f7b: LOD  01 0003     Load word at G3 (OUTPUT)
   0f7e: NOP              No operation
   0f7f: LSA  0d          Load string address: 'Restarting...'
   0f8e: SLDC 00          Short load constant 0
   0f8f: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0f92: LOD  01 0003     Load word at G3 (OUTPUT)
   0f95: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0f98: SLDC 04          Short load constant 4
   0f99: SRO  0001        Store global word BASE1
   0f9b: SLDC 05          Short load constant 5
   0f9c: SLDC 01          Short load constant 1
   0f9d: CSP  04          Call standard procedure EXIT
   0f9f: UJP  $0fbe       Unconditional jump
-> 0fa1: LOD  01 0003     Load word at G3 (OUTPUT)
   0fa4: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0fa7: LOD  01 0003     Load word at G3 (OUTPUT)
   0faa: NOP              No operation
   0fab: LSA  0d          Load string address: 'U not allowed'
   0fba: SLDC 00          Short load constant 0
   0fbb: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0fbe: UJP  $1038       Unconditional jump
   0fc0: SLDC 01          Short load constant 1
   0fc1: SLDO 04          Short load global BASE4
   0fc2: SLDC 52          Short load constant 82
   0fc3: EQUI             Integer TOS-1 = TOS
   0fc4: CLP  02          Call local procedure GETCMD.2
   0fc6: UJP  $1038       Unconditional jump
   0fc8: LOD  01 0155     Load word at G341
   0fcc: LOD  01 0154     Load word at G340
   0fd0: LOR              Logical OR (TOS | TOS-1)
   0fd1: FJP  $0fd7       Jump if TOS false
   0fd3: SLDC 01          Short load constant 1
   0fd4: CXP  00 2d       Call external procedure PASCALSY.45
-> 0fd7: SLDC 00          Short load constant 0
   0fd8: SRO  0001        Store global word BASE1
   0fda: SLDO 04          Short load global BASE4
   0fdb: SLDC 48          Short load constant 72
   0fdc: EQUI             Integer TOS-1 = TOS
   0fdd: FJP  $0fe3       Jump if TOS false
   0fdf: LDCN             Load constant NIL
   0fe0: STR  01 0036     Store TOS to G54
-> 0fe3: SLDC 05          Short load constant 5
   0fe4: SLDC 01          Short load constant 1
   0fe5: CSP  04          Call standard procedure EXIT
   0fe7: UJP  $1038       Unconditional jump
   0fe9: CLP  11          Call local procedure GETCMD.17
   0feb: UJP  $1038       Unconditional jump
   0fed: LOD  01 0154     Load word at G340
   0ff1: LOD  01 0155     Load word at G341
   0ff5: LOR              Logical OR (TOS | TOS-1)
   0ff6: FJP  $0ffd       Jump if TOS false
   0ff8: SLDC 01          Short load constant 1
   0ff9: CLP  0e          Call local procedure GETCMD.14
   0ffb: UJP  $0fff       Unconditional jump
-> 0ffd: CLP  12          Call local procedure GETCMD.18
-> 0fff: UJP  $1038       Unconditional jump
-> 1038: SLDC 00          Short load constant 0
   1039: FJP  $0e29       Jump if TOS false
-> 103b: RBP  01          Return from base procedure
END

### PROCEDURE GETCMD.PROC2(PARAM1; PARAM2) (* P=2 LL=1 *)
  BASE1
  BASE3
  BASE6
  MP1=PARAM2
  MP2=PARAM1
  MP3
BEGIN
-> 0ae6: LOD  02 0010     Load word at G16
   0ae9: FJP  $0b58       Jump if TOS false
   0aeb: CXP  00 25       Call external procedure PASCALSY.37
   0aee: LOD  02 0003     Load word at G3 (OUTPUT)
   0af1: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0af4: SLDC 00          Short load constant 0
   0af5: STL  0003        Store TOS into MP3
   0af7: LLA  0003        Load local address MP3
   0af9: LDA  02 0012     Load addr G18
   0afc: SLDC 07          Short load constant 7
   0afd: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0b00: LLA  0003        Load local address MP3
   0b02: NOP              No operation
   0b03: LSA  01          Load string address: ':'
   0b06: SLDC 08          Short load constant 8
   0b07: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0b0a: LLA  0003        Load local address MP3
   0b0c: LDA  02 001e     Load addr G30
   0b0f: SLDC 17          Short load constant 23
   0b10: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0b13: LLA  0003        Load local address MP3
   0b15: SLDL 02          Short load local MP2
   0b16: SLDL 01          Short load local MP1
   0b17: SLDC 01          Short load constant 1
   0b18: LAO  0006        Load global BASE6
   0b1a: SLDC 00          Short load constant 0
   0b1b: SLDC 00          Short load constant 0
   0b1c: CGP  0a          Call global procedure GETCMD.10
   0b1e: FJP  $0b49       Jump if TOS false
   0b20: LOD  02 0003     Load word at G3 (OUTPUT)
   0b23: LSA  0a          Load string address: 'Running...'
   0b2f: NOP              No operation
   0b30: SLDC 00          Short load constant 0
   0b31: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b34: LOD  02 0003     Load word at G3 (OUTPUT)
   0b37: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b3a: SLDL 01          Short load local MP1
   0b3b: FJP  $0b42       Jump if TOS false
   0b3d: SLDC 04          Short load constant 4
   0b3e: SRO  0001        Store global word BASE1
   0b40: UJP  $0b45       Unconditional jump
-> 0b42: SLDC 01          Short load constant 1
   0b43: SRO  0001        Store global word BASE1
-> 0b45: SLDC 05          Short load constant 5
   0b46: SLDC 01          Short load constant 1
   0b47: CSP  04          Call standard procedure EXIT
-> 0b49: SLDO 03          Short load global BASE3
   0b4a: LDCI 0300        Load word 768
   0b4d: SLDC 01          Short load constant 1
   0b4e: INN              Set membership (TOS-1 in set TOS)
   0b4f: LNOT             Logical NOT (~TOS)
   0b50: FJP  $0b56       Jump if TOS false
   0b52: SLDC 00          Short load constant 0
   0b53: STR  02 0010     Store TOS to G16
-> 0b56: UJP  $0b63       Unconditional jump
-> 0b58: SLDL 01          Short load local MP1
   0b59: FJP  $0b60       Jump if TOS false
   0b5b: SLDC 06          Short load constant 6
   0b5c: CGP  0b          Call global procedure GETCMD.11
   0b5e: UJP  $0b63       Unconditional jump
-> 0b60: SLDC 07          Short load constant 7
   0b61: CGP  0b          Call global procedure GETCMD.11
-> 0b63: RNP  00          Return from nonbase procedure
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
-> 043e: LDA  02 00cc     Load addr G204
   0442: SLDL 03          Short load local MP3
   0443: IXA  000c        Index array (TOS-1 + TOS * 12)
   0445: SLDC 00          Short load constant 0
   0446: SLDC 00          Short load constant 0
   0447: SLDC 00          Short load constant 0
   0448: LLA  001f        Load local address MP31
   044a: SLDC 00          Short load constant 0
   044b: SLDC 00          Short load constant 0
   044c: CGP  0a          Call global procedure GETCMD.10
   044e: STL  0001        Store TOS into MP1
   0450: LDL  001f        Load local word MP31
   0452: SLDC 02          Short load constant 2
   0453: EQUI             Integer TOS-1 = TOS
   0454: FJP  $0512       Jump if TOS false
   0456: LDA  02 00cc     Load addr G204
   045a: SLDL 03          Short load local MP3
   045b: IXA  000c        Index array (TOS-1 + TOS * 12)
   045d: LLA  0004        Load local address MP4
   045f: LLA  0008        Load local address MP8
   0461: LLA  0010        Load local address MP16
   0463: LLA  0011        Load local address MP17
   0465: SLDC 00          Short load constant 0
   0466: SLDC 00          Short load constant 0
   0467: CXP  00 21       Call external procedure PASCALSY.33
   046a: FJP  $0512       Jump if TOS false
   046c: SLDC 00          Short load constant 0
   046d: STL  0012        Store TOS into MP18
-> 046f: LDL  0012        Load local word MP18
   0471: SLDC 01          Short load constant 1
   0472: ADI              Add integers (TOS + TOS-1)
   0473: STL  0012        Store TOS into MP18
   0475: LDA  02 007e     Load addr G126
   0478: LDL  0012        Load local word MP18
   047a: IXA  0006        Index array (TOS-1 + TOS * 6)
   047c: STL  0020        Store TOS into MP32
   047e: LDL  0020        Load local word MP32
   0480: SIND 04          Short index load *TOS+4
   0481: FJP  $04e8       Jump if TOS false
   0483: LDL  0020        Load local word MP32
   0485: LSA  00          Load string address: ''
   0487: NOP              No operation
   0488: SAS  07          String assign (TOS to TOS-1, 7 chars)
   048a: LDL  0012        Load local word MP18
   048c: SLDC 00          Short load constant 0
   048d: SLDC 00          Short load constant 0
   048e: CXP  00 2a       Call external procedure PASCALSY.42
   0491: FJP  $04e8       Jump if TOS false
   0493: LDL  0020        Load local word MP32
   0495: LOD  02 0001     Load word at G1 (SYSCOM)
   0498: SIND 04          Short index load *TOS+4
   0499: SLDC 00          Short load constant 0
   049a: IXA  000d        Index array (TOS-1 + TOS * 13)
   049c: INC  0003        Inc field ptr (TOS+3)
   049e: SAS  07          String assign (TOS to TOS-1, 7 chars)
   04a0: LLA  0013        Load local address MP19
   04a2: SLDC 00          Short load constant 0
   04a3: STL  0021        Store TOS into MP33
   04a5: LLA  0021        Load local address MP33
   04a7: LDL  0020        Load local word MP32
   04a9: SLDC 07          Short load constant 7
   04aa: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   04ad: LLA  0021        Load local address MP33
   04af: LSA  01          Load string address: ':'
   04b2: NOP              No operation
   04b3: SLDC 08          Short load constant 8
   04b4: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   04b7: LLA  0021        Load local address MP33
   04b9: LLA  0008        Load local address MP8
   04bb: SLDC 17          Short load constant 23
   04bc: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   04bf: LLA  0021        Load local address MP33
   04c1: SAS  17          String assign (TOS to TOS-1, 23 chars)
   04c3: LLA  0013        Load local address MP19
   04c5: LDA  02 00cc     Load addr G204
   04c9: SLDL 03          Short load local MP3
   04ca: IXA  000c        Index array (TOS-1 + TOS * 12)
   04cc: NEQSTR           String TOS-1 <> TOS
   04ce: FJP  $04e8       Jump if TOS false
   04d0: LLA  0013        Load local address MP19
   04d2: SLDC 00          Short load constant 0
   04d3: SLDC 00          Short load constant 0
   04d4: SLDC 00          Short load constant 0
   04d5: LLA  001f        Load local address MP31
   04d7: SLDC 00          Short load constant 0
   04d8: SLDC 00          Short load constant 0
   04d9: CGP  0a          Call global procedure GETCMD.10
   04db: FJP  $04e8       Jump if TOS false
   04dd: LDA  02 00cc     Load addr G204
   04e1: SLDL 03          Short load local MP3
   04e2: IXA  000c        Index array (TOS-1 + TOS * 12)
   04e4: LLA  0013        Load local address MP19
   04e6: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 04e8: LDL  0012        Load local word MP18
   04ea: SLDC 0c          Short load constant 12
   04eb: EQUI             Integer TOS-1 = TOS
   04ec: LDL  001f        Load local word MP31
   04ee: SLDC 03          Short load constant 3
   04ef: SLDC 01          Short load constant 1
   04f0: INN              Set membership (TOS-1 in set TOS)
   04f1: LOR              Logical OR (TOS | TOS-1)
   04f2: FJP  $046f       Jump if TOS false
   04f4: LDL  001f        Load local word MP31
   04f6: SLDC 00          Short load constant 0
   04f7: EQUI             Integer TOS-1 = TOS
   04f8: STL  0001        Store TOS into MP1
   04fa: LDL  001f        Load local word MP31
   04fc: SLDC 02          Short load constant 2
   04fd: EQUI             Integer TOS-1 = TOS
   04fe: FJP  $0512       Jump if TOS false
   0500: LDA  02 00cc     Load addr G204
   0504: SLDL 03          Short load local MP3
   0505: IXA  000c        Index array (TOS-1 + TOS * 12)
   0507: SLDC 00          Short load constant 0
   0508: SLDC 00          Short load constant 0
   0509: SLDC 01          Short load constant 1
   050a: LLA  001f        Load local address MP31
   050c: SLDC 00          Short load constant 0
   050d: SLDC 00          Short load constant 0
   050e: CGP  0a          Call global procedure GETCMD.10
   0510: FJP  $0512       Jump if TOS false
-> 0512: RNP  01          Return from nonbase procedure
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
   004c: UJP  $0054       Unconditional jump
-> 004e: SLDL 05          Short load local MP5
   004f: SLDC 08          Short load constant 8
   0050: SLDC 00          Short load constant 0
   0051: LDP              Load packed field (TOS)
   0052: STL  0001        Store TOS into MP1
-> 0054: RNP  01          Return from nonbase procedure
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
-> 0060: LLA  0004        Load local address MP4
   0062: SLDL 03          Short load local MP3
   0063: SAS  50          String assign (TOS to TOS-1, 80 chars)
   0065: SLDC 00          Short load constant 0
   0066: STL  0001        Store TOS into MP1
   0068: LLA  0004        Load local address MP4
   006a: LLA  002d        Load local address MP45
   006c: LLA  0031        Load local address MP49
   006e: LLA  0039        Load local address MP57
   0070: LLA  003a        Load local address MP58
   0072: SLDC 00          Short load constant 0
   0073: SLDC 00          Short load constant 0
   0074: CXP  00 21       Call external procedure PASCALSY.33
   0077: FJP  $0079       Jump if TOS false
-> 0079: LLA  0031        Load local address MP49
   007b: LSA  00          Load string address: ''
   007d: NOP              No operation
   007e: EQLSTR           String TOS-1 = TOS
   0080: FJP  $00ab       Jump if TOS false
   0082: LOD  02 0003     Load word at G3 (OUTPUT)
   0085: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0088: LOD  02 0003     Load word at G3 (OUTPUT)
   008b: LSA  10          Load string address: 'Illegal filename'
   009d: NOP              No operation
   009e: SLDC 00          Short load constant 0
   009f: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   00a2: LOD  02 0003     Load word at G3 (OUTPUT)
   00a5: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   00a8: SLDC 01          Short load constant 1
   00a9: STL  0001        Store TOS into MP1
-> 00ab: RNP  01          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC7(PARAM1; PARAM2) (* P=7 LL=1 *)
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
-> 00b8: LOD  02 0001     Load word at G1 (SYSCOM)
   00bb: STL  0005        Store TOS into MP5
   00bd: SLDL 02          Short load local MP2
   00be: STL  0006        Store TOS into MP6
   00c0: SLDL 01          Short load local MP1
   00c1: STL  0007        Store TOS into MP7
   00c3: SLDL 07          Short load local MP7
   00c4: INC  0010        Inc field ptr (TOS+16)
   00c6: STL  0008        Store TOS into MP8
   00c8: SLDC 00          Short load constant 0
   00c9: STL  0003        Store TOS into MP3
   00cb: SLDC 0f          Short load constant 15
   00cc: STL  0009        Store TOS into MP9
-> 00ce: SLDL 03          Short load local MP3
   00cf: SLDL 09          Short load local MP9
   00d0: LEQI             Integer TOS-1 <= TOS
   00d1: FJP  $0126       Jump if TOS false
   00d3: SLDL 06          Short load local MP6
   00d4: SLDL 03          Short load local MP3
   00d5: IXA  0002        Index array (TOS-1 + TOS * 2)
   00d7: STL  000a        Store TOS into MP10
   00d9: SLDL 0a          Short load local MP10
   00da: SIND 01          Short index load *TOS+1
   00db: SLDC 00          Short load constant 0
   00dc: NEQI             Integer TOS-1 <> TOS
   00dd: FJP  $011f       Jump if TOS false
   00df: SLDL 02          Short load local MP2
   00e0: SLDL 03          Short load local MP3
   00e1: SLDC 00          Short load constant 0
   00e2: SLDC 00          Short load constant 0
   00e3: CGP  05          Call global procedure GETCMD.5
   00e5: STL  0004        Store TOS into MP4
   00e7: SLDL 04          Short load local MP4
   00ea: LDC  02          Load multiple-word constant
                         ffffff82
   00ee: SLDC 02          Short load constant 2
   00ef: INN              Set membership (TOS-1 in set TOS)
   00f0: FJP  $011f       Jump if TOS false
   00f2: SLDL 05          Short load local MP5
   00f3: INC  0030        Inc field ptr (TOS+48)
   00f5: SLDL 04          Short load local MP4
   00f6: IXA  0003        Index array (TOS-1 + TOS * 3)
   00f8: STL  000b        Store TOS into MP11
   00fa: SLDL 0b          Short load local MP11
   00fb: SLDL 07          Short load local MP7
   00fc: SIND 07          Short index load *TOS+7
   00fd: STO              Store indirect (TOS into TOS-1)
   00fe: SLDL 0b          Short load local MP11
   00ff: INC  0002        Inc field ptr (TOS+2)
   0101: SLDL 0a          Short load local MP10
   0102: SIND 01          Short index load *TOS+1
   0103: STO              Store indirect (TOS into TOS-1)
   0104: SLDL 06          Short load local MP6
   0105: INC  0060        Inc field ptr (TOS+96)
   0107: SLDL 03          Short load local MP3
   0108: IXA  0001        Index array (TOS-1 + TOS * 1)
   010a: SIND 00          Short index load *TOS+0
   010b: SLDC 07          Short load constant 7
   010c: EQUI             Integer TOS-1 = TOS
   010d: FJP  $0116       Jump if TOS false
   010f: SLDL 0b          Short load local MP11
   0110: INC  0001        Inc field ptr (TOS+1)
   0112: SLDC 00          Short load constant 0
   0113: STO              Store indirect (TOS into TOS-1)
   0114: UJP  $011f       Unconditional jump
-> 0116: SLDL 0b          Short load local MP11
   0117: INC  0001        Inc field ptr (TOS+1)
   0119: SLDL 0a          Short load local MP10
   011a: SIND 00          Short index load *TOS+0
   011b: SLDL 08          Short load local MP8
   011c: SIND 00          Short index load *TOS+0
   011d: ADI              Add integers (TOS + TOS-1)
   011e: STO              Store indirect (TOS into TOS-1)
-> 011f: SLDL 03          Short load local MP3
   0120: SLDC 01          Short load constant 1
   0121: ADI              Add integers (TOS + TOS-1)
   0122: STL  0003        Store TOS into MP3
   0124: UJP  $00ce       Unconditional jump
-> 0126: RNP  00          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC8(PARAM1; PARAM2; PARAM3): RETVAL (* P=8 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM3
  MP4=PARAM2
  MP5=PARAM1
  MP6
  MP7
  MP8
BEGIN
-> 0134: SLDL 04          Short load local MP4
   0135: SLDC 00          Short load constant 0
   0136: ADJ  02          Adjust set to 2 words
   0138: STM  02          Store 2 words at TOS to TOS-1
   013a: SLDC 01          Short load constant 1
   013b: STL  0001        Store TOS into MP1
   013d: SLDL 05          Short load local MP5
   013e: STL  0007        Store TOS into MP7
   0140: SLDC 00          Short load constant 0
   0141: STL  0006        Store TOS into MP6
   0143: SLDC 0f          Short load constant 15
   0144: STL  0008        Store TOS into MP8
-> 0146: SLDL 06          Short load local MP6
   0147: SLDL 08          Short load local MP8
   0148: LEQI             Integer TOS-1 <= TOS
   0149: FJP  $017d       Jump if TOS false
   014b: SLDL 07          Short load local MP7
   014c: SLDL 06          Short load local MP6
   014d: IXA  0002        Index array (TOS-1 + TOS * 2)
   014f: SIND 01          Short index load *TOS+1
   0150: SLDC 00          Short load constant 0
   0151: NEQI             Integer TOS-1 <> TOS
   0152: FJP  $0176       Jump if TOS false
   0154: SLDL 07          Short load local MP7
   0155: INC  0060        Inc field ptr (TOS+96)
   0157: SLDL 06          Short load local MP6
   0158: IXA  0001        Index array (TOS-1 + TOS * 1)
   015a: SIND 00          Short index load *TOS+0
   015b: SLDL 03          Short load local MP3
   015c: SLDC 01          Short load constant 1
   015d: INN              Set membership (TOS-1 in set TOS)
   015e: FJP  $0173       Jump if TOS false
   0160: SLDL 04          Short load local MP4
   0161: SLDL 04          Short load local MP4
   0162: LDM  02          Load 2 words from (TOS)
   0164: SLDC 02          Short load constant 2
   0165: SLDL 05          Short load local MP5
   0166: SLDL 06          Short load local MP6
   0167: SLDC 00          Short load constant 0
   0168: SLDC 00          Short load constant 0
   0169: CGP  05          Call global procedure GETCMD.5
   016b: SGS              Build singleton set [TOS]
   016c: UNI              Set union (TOS OR TOS-1)
   016d: ADJ  02          Adjust set to 2 words
   016f: STM  02          Store 2 words at TOS to TOS-1
   0171: UJP  $0176       Unconditional jump
-> 0173: SLDC 00          Short load constant 0
   0174: STL  0001        Store TOS into MP1
-> 0176: SLDL 06          Short load local MP6
   0177: SLDC 01          Short load constant 1
   0178: ADI              Add integers (TOS + TOS-1)
   0179: STL  0006        Store TOS into MP6
   017b: UJP  $0146       Unconditional jump
-> 017d: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC9(PARAM1): RETVAL (* P=9 LL=1 *)
  MP1=RETVAL1
  MP3=PARAM1
  MP4
  MP12
  MP268
  MP275
  MP284
  MP558
BEGIN
-> 018c: LLA  0004        Load local address MP4
   018e: SLDL 03          Short load local MP3
   018f: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   0191: LLA  010c        Load local address MP268
   0194: LDCN             Load constant NIL
   0195: SLDC 01          Short load constant 1
   0196: NGI              Negate integer
   0197: CXP  00 03       Call external procedure PASCALSY.FINIT
   019a: SLDC 00          Short load constant 0
   019b: STL  0001        Store TOS into MP1
   019d: LLA  010c        Load local address MP268
   01a0: LLA  0004        Load local address MP4
   01a2: SLDC 01          Short load constant 1
   01a3: LDCN             Load constant NIL
   01a4: CXP  00 05       Call external procedure PASCALSY.FOPEN
   01a7: CSP  22          Call standard procedure IORESULT
   01a9: SLDC 00          Short load constant 0
   01aa: EQUI             Integer TOS-1 = TOS
   01ab: FJP  $01e6       Jump if TOS false
   01ad: LOD  02 0001     Load word at G1 (SYSCOM)
   01b0: STL  022e        Store TOS into MP558
   01b3: LDL  0113        Load local word MP275
   01b6: LLA  000c        Load local address MP12
   01b8: SLDC 00          Short load constant 0
   01b9: LDCI 0200        Load word 512
   01bc: LDL  011c        Load local word MP284
   01bf: SLDC 00          Short load constant 0
   01c0: CSP  05          Call standard procedure UNITREAD
   01c2: CSP  22          Call standard procedure IORESULT
   01c4: SLDC 00          Short load constant 0
   01c5: NEQI             Integer TOS-1 <> TOS
   01c6: FJP  $01ca       Jump if TOS false
   01c8: UJP  $01e6       Unconditional jump
-> 01ca: LLA  000c        Load local address MP12
   01cc: LDA  02 0108     Load addr G264
   01d0: LDCI 00c0        Load word 192
   01d3: SLDC 01          Short load constant 1
   01d4: ADJ  01          Adjust set to 1 words
   01d6: SLDC 00          Short load constant 0
   01d7: SLDC 00          Short load constant 0
   01d8: CGP  08          Call global procedure GETCMD.8
   01da: FJP  $01dc       Jump if TOS false
-> 01dc: LLA  000c        Load local address MP12
   01de: LLA  010c        Load local address MP268
   01e1: CGP  07          Call global procedure GETCMD.7
   01e3: SLDC 01          Short load constant 1
   01e4: STL  0001        Store TOS into MP1
-> 01e6: LLA  010c        Load local address MP268
   01e9: SLDC 00          Short load constant 0
   01ea: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 01ed: RNP  01          Return from nonbase procedure
END

### FUNCTION GETCMD.FUNC10(PARAM1; PARAM2; PARAM3; PARAM4; PARAM5): RETVAL (* P=10 LL=1 *)
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
  MP305
  MP307
  MP308
  MP309
BEGIN
-> 01fa: LLA  0008        Load local address MP8
   01fc: SLDL 07          Short load local MP7
   01fd: SAS  50          String assign (TOS to TOS-1, 80 chars)
   01ff: SLDL 03          Short load local MP3
   0200: SLDC 02          Short load constant 2
   0201: STO              Store indirect (TOS into TOS-1)
   0202: SLDC 00          Short load constant 0
   0203: STL  0001        Store TOS into MP1
   0205: LOD  02 0008     Load word at G8
   0208: LLA  0008        Load local address MP8
   020a: SLDC 01          Short load constant 1
   020b: LDCN             Load constant NIL
   020c: CXP  00 05       Call external procedure PASCALSY.FOPEN
   020f: CSP  22          Call standard procedure IORESULT
   0211: SLDC 00          Short load constant 0
   0212: NEQI             Integer TOS-1 <> TOS
   0213: FJP  $0258       Jump if TOS false
   0215: SLDL 04          Short load local MP4
   0216: FJP  $0256       Jump if TOS false
   0218: CSP  22          Call standard procedure IORESULT
   021a: SLDC 07          Short load constant 7
   021b: EQUI             Integer TOS-1 = TOS
   021c: FJP  $023b       Jump if TOS false
   021e: LOD  02 0003     Load word at G3 (OUTPUT)
   0221: LSA  11          Load string address: 'Illegal file name'
   0234: NOP              No operation
   0235: SLDC 00          Short load constant 0
   0236: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0239: UJP  $0256       Unconditional jump
-> 023b: LOD  02 0003     Load word at G3 (OUTPUT)
   023e: NOP              No operation
   023f: LSA  08          Load string address: 'No file '
   0249: SLDC 00          Short load constant 0
   024a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   024d: LOD  02 0003     Load word at G3 (OUTPUT)
   0250: LLA  0008        Load local address MP8
   0252: SLDC 00          Short load constant 0
   0253: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0256: UJP  $0425       Unconditional jump
-> 0258: SLDL 03          Short load local MP3
   0259: SLDC 01          Short load constant 1
   025a: STO              Store indirect (TOS into TOS-1)
   025b: LOD  02 0001     Load word at G1 (SYSCOM)
   025e: STL  0133        Store TOS into MP307
   0261: LOD  02 0008     Load word at G8
   0264: STL  0134        Store TOS into MP308
   0267: LDL  0134        Load local word MP308
   026a: INC  0010        Inc field ptr (TOS+16)
   026c: STL  0135        Store TOS into MP309
   026f: LDL  0135        Load local word MP309
   0272: INC  0002        Inc field ptr (TOS+2)
   0274: SLDC 04          Short load constant 4
   0275: SLDC 00          Short load constant 0
   0276: LDP              Load packed field (TOS)
   0277: SLDC 02          Short load constant 2
   0278: NEQI             Integer TOS-1 <> TOS
   0279: FJP  $029b       Jump if TOS false
   027b: LOD  02 0003     Load word at G3 (OUTPUT)
   027e: LLA  0008        Load local address MP8
   0280: SLDC 00          Short load constant 0
   0281: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0284: LOD  02 0003     Load word at G3 (OUTPUT)
   0287: LSA  09          Load string address: ' not code'
   0292: NOP              No operation
   0293: SLDC 00          Short load constant 0
   0294: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0297: UJP  $0425       Unconditional jump
   0299: UJP  $041f       Unconditional jump
-> 029b: LDL  0134        Load local word MP308
   029e: SIND 07          Short index load *TOS+7
   029f: LLA  0031        Load local address MP49
   02a1: SLDC 00          Short load constant 0
   02a2: LDCI 0200        Load word 512
   02a5: LDL  0135        Load local word MP309
   02a8: SIND 00          Short index load *TOS+0
   02a9: SLDC 00          Short load constant 0
   02aa: CSP  05          Call standard procedure UNITREAD
   02ac: CSP  22          Call standard procedure IORESULT
   02ae: SLDC 00          Short load constant 0
   02af: NEQI             Integer TOS-1 <> TOS
   02b0: FJP  $02ca       Jump if TOS false
   02b2: LOD  02 0003     Load word at G3 (OUTPUT)
   02b5: LSA  0c          Load string address: 'Bad block #0'
   02c3: NOP              No operation
   02c4: SLDC 00          Short load constant 0
   02c5: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   02c8: UJP  $0425       Unconditional jump
-> 02ca: LLA  0031        Load local address MP49
   02cc: LLA  0131        Load local address MP305
   02cf: SLDC 01          Short load constant 1
   02d0: SLDC 01          Short load constant 1
   02d1: ADJ  01          Adjust set to 1 words
   02d3: SLDC 00          Short load constant 0
   02d4: SLDC 00          Short load constant 0
   02d5: CGP  08          Call global procedure GETCMD.8
   02d7: LNOT             Logical NOT (~TOS)
   02d8: FJP  $033b       Jump if TOS false
   02da: SLDL 06          Short load local MP6
   02db: FJP  $0316       Jump if TOS false
   02dd: LOD  02 0003     Load word at G3 (OUTPUT)
   02e0: NOP              No operation
   02e1: LSA  0a          Load string address: 'Linking...'
   02ed: SLDC 00          Short load constant 0
   02ee: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   02f1: LOD  02 0003     Load word at G3 (OUTPUT)
   02f4: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   02f7: LOD  02 0008     Load word at G8
   02fa: SLDC 00          Short load constant 0
   02fb: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   02fe: SLDC 04          Short load constant 4
   02ff: SLDC 00          Short load constant 0
   0300: SLDC 00          Short load constant 0
   0301: CGP  03          Call global procedure GETCMD.3
   0303: FJP  $0314       Jump if TOS false
   0305: SLDL 05          Short load local MP5
   0306: FJP  $030d       Jump if TOS false
   0308: SLDC 08          Short load constant 8
   0309: SRO  0001        Store global word BASE1
   030b: UJP  $0310       Unconditional jump
-> 030d: SLDC 09          Short load constant 9
   030e: SRO  0001        Store global word BASE1
-> 0310: SLDC 05          Short load constant 5
   0311: SLDC 01          Short load constant 1
   0312: CSP  04          Call standard procedure EXIT
-> 0314: UJP  $0339       Unconditional jump
-> 0316: SLDO 03          Short load global BASE3
   0317: LDCI 0300        Load word 768
   031a: SLDC 01          Short load constant 1
   031b: INN              Set membership (TOS-1 in set TOS)
   031c: LNOT             Logical NOT (~TOS)
   031d: FJP  $0339       Jump if TOS false
   031f: LOD  02 0003     Load word at G3 (OUTPUT)
   0322: NOP              No operation
   0323: LSA  10          Load string address: 'Must L(ink first'
   0335: SLDC 00          Short load constant 0
   0336: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 0339: UJP  $0425       Unconditional jump
-> 033b: LLA  0131        Load local address MP305
   033e: LDM  02          Load 2 words from (TOS)
   0340: SLDC 02          Short load constant 2
   0341: LLA  00c1        Load local address MP193
   0344: LDM  02          Load 2 words from (TOS)
   0346: SLDC 02          Short load constant 2
   0347: INT              Set intersection (TOS AND TOS-1)
   0348: SLDC 00          Short load constant 0
   0349: NEQSET           Set TOS-1 <> TOS
   034b: FJP  $0387       Jump if TOS false
   034d: LOD  02 0003     Load word at G3 (OUTPUT)
   0350: NOP              No operation
   0351: LSA  2e          Load string address: 'Conflict between intrinsic and user segment(s)'
   0381: SLDC 00          Short load constant 0
   0382: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0385: UJP  $0425       Unconditional jump
-> 0387: LLA  00c1        Load local address MP193
   038a: LDM  02          Load 2 words from (TOS)
   038c: SLDC 02          Short load constant 2
   038d: SLDC 00          Short load constant 0
   038e: NEQSET           Set TOS-1 <> TOS
   0390: FJP  $0418       Jump if TOS false
   0392: NOP              No operation
   0393: LSA  0f          Load string address: '*SYSTEM.LIBRARY'
   03a4: SLDC 00          Short load constant 0
   03a5: SLDC 00          Short load constant 0
   03a6: CGP  09          Call global procedure GETCMD.9
   03a8: LNOT             Logical NOT (~TOS)
   03a9: FJP  $03d7       Jump if TOS false
   03ab: LOD  02 0003     Load word at G3 (OUTPUT)
   03ae: NOP              No operation
   03af: LSA  20          Load string address: 'Can't load required intrinsic(s)'
   03d1: SLDC 00          Short load constant 0
   03d2: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   03d5: UJP  $0425       Unconditional jump
-> 03d7: LLA  00c1        Load local address MP193
   03da: LDM  02          Load 2 words from (TOS)
   03dc: SLDC 02          Short load constant 2
   03dd: LDA  02 0108     Load addr G264
   03e1: LDM  02          Load 2 words from (TOS)
   03e3: SLDC 02          Short load constant 2
   03e4: LEQSET           Set TOS-1 <= TOS
   03e6: LNOT             Logical NOT (~TOS)
   03e7: FJP  $0418       Jump if TOS false
   03e9: LOD  02 0003     Load word at G3 (OUTPUT)
   03ec: NOP              No operation
   03ed: LSA  23          Load string address: 'Required intrinsic(s) not available'
   0412: SLDC 00          Short load constant 0
   0413: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0416: UJP  $0425       Unconditional jump
-> 0418: LLA  0031        Load local address MP49
   041a: LOD  02 0008     Load word at G8
   041d: CGP  07          Call global procedure GETCMD.7
-> 041f: SLDL 03          Short load local MP3
   0420: SLDC 00          Short load constant 0
   0421: STO              Store indirect (TOS into TOS-1)
   0422: SLDC 01          Short load constant 1
   0423: STL  0001        Store TOS into MP1
-> 0425: LOD  02 0008     Load word at G8
   0428: SLDC 00          Short load constant 0
   0429: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 042c: RNP  01          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC11(PARAM1) (* P=11 LL=1 *)
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
-> 0550: SLDL 01          Short load local MP1
   0551: SLDC 08          Short load constant 8
   0552: EQUI             Integer TOS-1 = TOS
   0553: FJP  $056b       Jump if TOS false
   0555: LOD  02 0003     Load word at G3 (OUTPUT)
   0558: NOP              No operation
   0559: LSA  0a          Load string address: 'Assembling'
   0565: SLDC 00          Short load constant 0
   0566: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0569: UJP  $057e       Unconditional jump
-> 056b: LOD  02 0003     Load word at G3 (OUTPUT)
   056e: NOP              No operation
   056f: LSA  09          Load string address: 'Compiling'
   057a: SLDC 00          Short load constant 0
   057b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 057e: LOD  02 0003     Load word at G3 (OUTPUT)
   0581: LSA  03          Load string address: '...'
   0586: NOP              No operation
   0587: SLDC 00          Short load constant 0
   0588: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   058b: LOD  02 0003     Load word at G3 (OUTPUT)
   058e: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0591: SLDL 01          Short load local MP1
   0592: SLDC 08          Short load constant 8
   0593: EQUI             Integer TOS-1 = TOS
   0594: FJP  $059b       Jump if TOS false
   0596: SLDC 00          Short load constant 0
   0597: STL  0039        Store TOS into MP57
   0599: UJP  $059e       Unconditional jump
-> 059b: SLDC 01          Short load constant 1
   059c: STL  0039        Store TOS into MP57
-> 059e: LDL  0039        Load local word MP57
   05a0: SLDC 00          Short load constant 0
   05a1: SLDC 00          Short load constant 0
   05a2: CGP  03          Call global procedure GETCMD.3
   05a4: FJP  $080b       Jump if TOS false
   05a6: LOD  02 0011     Load word at G17
   05a9: FJP  $05d2       Jump if TOS false
   05ab: LLA  0002        Load local address MP2
   05ad: SLDC 00          Short load constant 0
   05ae: STL  003a        Store TOS into MP58
   05b0: LLA  003a        Load local address MP58
   05b2: LDA  02 0016     Load addr G22
   05b5: SLDC 07          Short load constant 7
   05b6: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05b9: LLA  003a        Load local address MP58
   05bb: LSA  01          Load string address: ':'
   05be: NOP              No operation
   05bf: SLDC 08          Short load constant 8
   05c0: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05c3: LLA  003a        Load local address MP58
   05c5: LDA  02 0026     Load addr G38
   05c8: SLDC 17          Short load constant 23
   05c9: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   05cc: LLA  003a        Load local address MP58
   05ce: SAS  28          String assign (TOS to TOS-1, 40 chars)
   05d0: UJP  $0656       Unconditional jump
-> 05d2: SLDL 01          Short load local MP1
   05d3: SLDC 08          Short load constant 8
   05d4: EQUI             Integer TOS-1 = TOS
   05d5: FJP  $05eb       Jump if TOS false
   05d7: LOD  02 0003     Load word at G3 (OUTPUT)
   05da: NOP              No operation
   05db: LSA  08          Load string address: 'Assemble'
   05e5: SLDC 00          Short load constant 0
   05e6: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   05e9: UJP  $05fc       Unconditional jump
-> 05eb: LOD  02 0003     Load word at G3 (OUTPUT)
   05ee: NOP              No operation
   05ef: LSA  07          Load string address: 'Compile'
   05f8: SLDC 00          Short load constant 0
   05f9: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 05fc: LOD  02 0003     Load word at G3 (OUTPUT)
   05ff: LSA  0c          Load string address: ' what text? '
   060d: NOP              No operation
   060e: SLDC 00          Short load constant 0
   060f: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0612: LOD  02 0002     Load word at G2 (INPUT)
   0615: LLA  0002        Load local address MP2
   0617: SLDC 28          Short load constant 40
   0618: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   061b: LOD  02 0002     Load word at G2 (INPUT)
   061e: CXP  00 15       Call external procedure PASCALSY.FREADLN
   0621: CLP  0c          Call local procedure GETCMD.12
   0623: LLA  0002        Load local address MP2
   0625: LSA  00          Load string address: ''
   0627: NOP              No operation
   0628: EQLSTR           String TOS-1 = TOS
   062a: FJP  $0630       Jump if TOS false
   062c: UJP  $07fd       Unconditional jump
   062e: UJP  $0656       Unconditional jump
-> 0630: LLA  0002        Load local address MP2
   0632: SLDC 01          Short load constant 1
   0633: LDB              Load byte at byte ptr TOS-1 + TOS
   0634: LOD  02 0001     Load word at G1 (SYSCOM)
   0637: INC  002c        Inc field ptr (TOS+44)
   0639: SLDC 08          Short load constant 8
   063a: SLDC 08          Short load constant 8
   063b: LDP              Load packed field (TOS)
   063c: EQUI             Integer TOS-1 = TOS
   063d: FJP  $0643       Jump if TOS false
   063f: UJP  $07fd       Unconditional jump
   0641: UJP  $0656       Unconditional jump
-> 0643: LLA  0002        Load local address MP2
   0645: SLDC 00          Short load constant 0
   0646: SLDC 00          Short load constant 0
   0647: CGP  06          Call global procedure GETCMD.6
   0649: FJP  $064f       Jump if TOS false
   064b: SLDC 05          Short load constant 5
   064c: SLDC 0b          Short load constant 11
   064d: CSP  04          Call standard procedure EXIT
-> 064f: LLA  0002        Load local address MP2
   0651: SLDC 01          Short load constant 1
   0652: SLDC 28          Short load constant 40
   0653: CXP  00 2b       Call external procedure PASCALSY.43
-> 0656: LLA  0017        Load local address MP23
   0658: LLA  0002        Load local address MP2
   065a: SAS  28          String assign (TOS to TOS-1, 40 chars)
   065c: NOP              No operation
   065d: LSA  05          Load string address: '.TEXT'
   0664: LLA  0017        Load local address MP23
   0666: SLDC 00          Short load constant 0
   0667: SLDC 00          Short load constant 0
   0668: CXP  00 1b       Call external procedure PASCALSY.SPOS
   066b: STL  0038        Store TOS into MP56
   066d: LDL  0038        Load local word MP56
   066f: SLDC 00          Short load constant 0
   0670: NEQI             Integer TOS-1 <> TOS
   0671: LDL  0038        Load local word MP56
   0673: LLA  0017        Load local address MP23
   0675: SLDC 00          Short load constant 0
   0676: LDB              Load byte at byte ptr TOS-1 + TOS
   0677: SLDC 04          Short load constant 4
   0678: SBI              Subtract integers (TOS-1 - TOS)
   0679: EQUI             Integer TOS-1 = TOS
   067a: LAND             Logical AND (TOS & TOS-1)
   067b: FJP  $0685       Jump if TOS false
   067d: LLA  0017        Load local address MP23
   067f: LDL  0038        Load local word MP56
   0681: SLDC 05          Short load constant 5
   0682: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0685: LOD  02 0009     Load word at G9
   0688: LLA  0002        Load local address MP2
   068a: SLDC 01          Short load constant 1
   068b: LDCN             Load constant NIL
   068c: CXP  00 05       Call external procedure PASCALSY.FOPEN
   068f: CSP  22          Call standard procedure IORESULT
   0691: SLDC 00          Short load constant 0
   0692: NEQI             Integer TOS-1 <> TOS
   0693: FJP  $06b9       Jump if TOS false
   0695: LOD  02 0003     Load word at G3 (OUTPUT)
   0698: NOP              No operation
   0699: LSA  0b          Load string address: 'Can't find '
   06a6: SLDC 00          Short load constant 0
   06a7: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   06aa: LOD  02 0003     Load word at G3 (OUTPUT)
   06ad: LLA  0002        Load local address MP2
   06af: SLDC 00          Short load constant 0
   06b0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   06b3: SLDC 00          Short load constant 0
   06b4: STR  02 0011     Store TOS to G17
   06b7: UJP  $07fd       Unconditional jump
-> 06b9: LLA  0002        Load local address MP2
   06bb: SLDC 00          Short load constant 0
   06bc: STL  003a        Store TOS into MP58
   06be: LLA  003a        Load local address MP58
   06c0: LDA  02 00cc     Load addr G204
   06c4: LDL  0039        Load local word MP57
   06c6: IXA  000c        Index array (TOS-1 + TOS * 12)
   06c8: LLA  00ba        Load local address MP186
   06cb: SLDC 01          Short load constant 1
   06cc: NOP              No operation
   06cd: LSA  01          Load string address: ':'
   06d0: LDA  02 00cc     Load addr G204
   06d4: LDL  0039        Load local word MP57
   06d6: IXA  000c        Index array (TOS-1 + TOS * 12)
   06d8: SLDC 00          Short load constant 0
   06d9: SLDC 00          Short load constant 0
   06da: CXP  00 1b       Call external procedure PASCALSY.SPOS
   06dd: CXP  00 19       Call external procedure PASCALSY.SCOPY
   06e0: LLA  00ba        Load local address MP186
   06e3: SLDC 17          Short load constant 23
   06e4: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   06e7: LLA  003a        Load local address MP58
   06e9: LSA  0f          Load string address: 'SYSTEM.SWAPDISK'
   06fa: NOP              No operation
   06fb: SLDC 26          Short load constant 38
   06fc: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   06ff: LLA  003a        Load local address MP58
   0701: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0703: LOD  02 0037     Load word at G55
   0706: LLA  0002        Load local address MP2
   0708: SLDC 01          Short load constant 1
   0709: LDCN             Load constant NIL
   070a: CXP  00 05       Call external procedure PASCALSY.FOPEN
   070d: LLA  002c        Load local address MP44
   070f: LSA  13          Load string address: '*SYSTEM.WRK.CODE[*]'
   0724: NOP              No operation
   0725: SAS  17          String assign (TOS to TOS-1, 23 chars)
   0727: LOD  02 0011     Load word at G17
   072a: LNOT             Logical NOT (~TOS)
   072b: FJP  $07b2       Jump if TOS false
   072d: LOD  02 0003     Load word at G3 (OUTPUT)
   0730: NOP              No operation
   0731: LSA  12          Load string address: 'To what codefile? '
   0745: SLDC 00          Short load constant 0
   0746: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0749: LOD  02 0002     Load word at G2 (INPUT)
   074c: LLA  0002        Load local address MP2
   074e: SLDC 28          Short load constant 40
   074f: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   0752: LOD  02 0002     Load word at G2 (INPUT)
   0755: CXP  00 15       Call external procedure PASCALSY.FREADLN
   0758: CLP  0c          Call local procedure GETCMD.12
   075a: LLA  0002        Load local address MP2
   075c: NOP              No operation
   075d: LSA  00          Load string address: ''
   075f: NEQSTR           String TOS-1 <> TOS
   0761: FJP  $07b2       Jump if TOS false
   0763: LLA  0002        Load local address MP2
   0765: SLDC 01          Short load constant 1
   0766: LDB              Load byte at byte ptr TOS-1 + TOS
   0767: LOD  02 0001     Load word at G1 (SYSCOM)
   076a: INC  002c        Inc field ptr (TOS+44)
   076c: SLDC 08          Short load constant 8
   076d: SLDC 08          Short load constant 8
   076e: LDP              Load packed field (TOS)
   076f: EQUI             Integer TOS-1 = TOS
   0770: FJP  $0776       Jump if TOS false
   0772: UJP  $07fd       Unconditional jump
   0774: UJP  $07b2       Unconditional jump
-> 0776: NOP              No operation
   0777: LSA  01          Load string address: '$'
   077a: LLA  0002        Load local address MP2
   077c: SLDC 00          Short load constant 0
   077d: SLDC 00          Short load constant 0
   077e: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0781: STL  0038        Store TOS into MP56
   0783: LDL  0038        Load local word MP56
   0785: SLDC 00          Short load constant 0
   0786: GRTI             Integer TOS-1 > TOS
   0787: FJP  $079b       Jump if TOS false
   0789: LLA  0002        Load local address MP2
   078b: LDL  0038        Load local word MP56
   078d: SLDC 01          Short load constant 1
   078e: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0791: LLA  0017        Load local address MP23
   0793: LLA  0002        Load local address MP2
   0795: SLDC 28          Short load constant 40
   0796: LDL  0038        Load local word MP56
   0798: CXP  00 18       Call external procedure PASCALSY.SINSERT
-> 079b: LLA  0002        Load local address MP2
   079d: SLDC 00          Short load constant 0
   079e: SLDC 00          Short load constant 0
   079f: CGP  06          Call global procedure GETCMD.6
   07a1: FJP  $07a5       Jump if TOS false
   07a3: UJP  $07fd       Unconditional jump
-> 07a5: LLA  0002        Load local address MP2
   07a7: SLDC 00          Short load constant 0
   07a8: SLDC 17          Short load constant 23
   07a9: CXP  00 2b       Call external procedure PASCALSY.43
   07ac: LLA  002c        Load local address MP44
   07ae: LLA  0002        Load local address MP2
   07b0: SAS  17          String assign (TOS to TOS-1, 23 chars)
-> 07b2: LOD  02 0008     Load word at G8
   07b5: LLA  002c        Load local address MP44
   07b7: SLDC 00          Short load constant 0
   07b8: LDCN             Load constant NIL
   07b9: CXP  00 05       Call external procedure PASCALSY.FOPEN
   07bc: CSP  22          Call standard procedure IORESULT
   07be: SLDC 00          Short load constant 0
   07bf: NEQI             Integer TOS-1 <> TOS
   07c0: FJP  $07e2       Jump if TOS false
   07c2: LOD  02 0003     Load word at G3 (OUTPUT)
   07c5: LSA  0b          Load string address: 'Can't open '
   07d2: NOP              No operation
   07d3: SLDC 00          Short load constant 0
   07d4: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   07d7: LOD  02 0003     Load word at G3 (OUTPUT)
   07da: LLA  002c        Load local address MP44
   07dc: SLDC 00          Short load constant 0
   07dd: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   07e0: UJP  $07fd       Unconditional jump
-> 07e2: SLDC 00          Short load constant 0
   07e3: STR  02 000a     Store TOS to G10
   07e6: SLDC 00          Short load constant 0
   07e7: STR  02 000b     Store TOS to G11
   07ea: SLDC 00          Short load constant 0
   07eb: STR  02 000c     Store TOS to G12
   07ee: SLDL 01          Short load local MP1
   07ef: SLDC 08          Short load constant 8
   07f0: EQUI             Integer TOS-1 = TOS
   07f1: FJP  $07f6       Jump if TOS false
   07f3: SLDC 05          Short load constant 5
   07f4: STL  0001        Store TOS into MP1
-> 07f6: SLDL 01          Short load local MP1
   07f7: SRO  0001        Store global word BASE1
   07f9: SLDC 05          Short load constant 5
   07fa: SLDC 01          Short load constant 1
   07fb: CSP  04          Call standard procedure EXIT
-> 07fd: LOD  02 0009     Load word at G9
   0800: SLDC 00          Short load constant 0
   0801: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0804: LOD  02 0037     Load word at G55
   0807: SLDC 00          Short load constant 0
   0808: CXP  00 06       Call external procedure PASCALSY.FCLOSE
-> 080b: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC12 (* P=12 LL=2 *)
BEGIN
-> 0524: SLDC 01          Short load constant 1
   0525: LDA  01 0002     Load addr L12
   0528: SLDC 00          Short load constant 0
   0529: LDB              Load byte at byte ptr TOS-1 + TOS
   052a: SLDC 01          Short load constant 1
   052b: SLDC 20          Short load constant 32
   052c: LDA  01 0002     Load addr L12
   052f: SLDC 01          Short load constant 1
   0530: SLDC 00          Short load constant 0
   0531: CSP  0b          Call standard procedure SCAN
   0533: ADI              Add integers (TOS + TOS-1)
   0534: STR  01 0038     Store TOS to L156
   0537: LDA  01 0002     Load addr L12
   053a: SLDC 01          Short load constant 1
   053b: LOD  01 0038     Load word at L1_56
   053e: SLDC 01          Short load constant 1
   053f: SBI              Subtract integers (TOS-1 - TOS)
   0540: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0543: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC13 (* P=13 LL=1 *)
  BASE1
  BASE3
  MP2
BEGIN
-> 0820: LOD  02 0009     Load word at G9
   0823: SLDC 00          Short load constant 0
   0824: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0827: LOD  02 0037     Load word at G55
   082a: SLDC 00          Short load constant 0
   082b: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   082e: LOD  02 000a     Load word at G10
   0831: SLDC 00          Short load constant 0
   0832: GRTI             Integer TOS-1 > TOS
   0833: FJP  $0860       Jump if TOS false
   0835: SLDC 00          Short load constant 0
   0836: STR  02 0010     Store TOS to G16
   0839: LOD  02 0008     Load word at G8
   083c: SLDC 02          Short load constant 2
   083d: CXP  00 06       Call external procedure PASCALSY.FCLOSE
   0840: LOD  02 000b     Load word at G11
   0843: SLDC 00          Short load constant 0
   0844: GRTI             Integer TOS-1 > TOS
   0845: FJP  $085e       Jump if TOS false
   0847: CXP  00 25       Call external procedure PASCALSY.37
   084a: LOD  02 0003     Load word at G3 (OUTPUT)
   084d: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0850: SLDC 02          Short load constant 2
   0851: SLDC 00          Short load constant 0
   0852: SLDC 00          Short load constant 0
   0853: CGP  03          Call global procedure GETCMD.3
   0855: FJP  $085e       Jump if TOS false
   0857: SLDC 04          Short load constant 4
   0858: SRO  0001        Store global word BASE1
   085a: SLDC 05          Short load constant 5
   085b: SLDC 01          Short load constant 1
   085c: CSP  04          Call standard procedure EXIT
-> 085e: UJP  $08fe       Unconditional jump
-> 0860: LDA  02 001e     Load addr G30
   0863: LSA  0f          Load string address: 'SYSTEM.WRK.CODE'
   0874: NOP              No operation
   0875: NEQSTR           String TOS-1 <> TOS
   0877: FJP  $08ec       Jump if TOS false
   0879: LDA  02 0012     Load addr G18
   087c: LOD  02 0008     Load word at G8
   087f: INC  0008        Inc field ptr (TOS+8)
   0881: SAS  07          String assign (TOS to TOS-1, 7 chars)
   0883: LDA  02 001e     Load addr G30
   0886: LOD  02 0008     Load word at G8
   0889: INC  0013        Inc field ptr (TOS+19)
   088b: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   088d: LDA  02 001e     Load addr G30
   0890: NOP              No operation
   0891: LSA  0f          Load string address: 'SYSTEM.WRK.CODE'
   08a2: NEQSTR           String TOS-1 <> TOS
   08a4: FJP  $08ec       Jump if TOS false
   08a6: LDA  02 001a     Load addr G26
   08a9: LDA  02 0012     Load addr G18
   08ac: SAS  07          String assign (TOS to TOS-1, 7 chars)
   08ae: LDA  02 001e     Load addr G30
   08b1: SLDC 00          Short load constant 0
   08b2: LDB              Load byte at byte ptr TOS-1 + TOS
   08b3: SLDC 05          Short load constant 5
   08b4: GRTI             Integer TOS-1 > TOS
   08b5: FJP  $08ec       Jump if TOS false
   08b7: LDA  02 001e     Load addr G30
   08ba: LLA  0002        Load local address MP2
   08bc: LDA  02 001e     Load addr G30
   08bf: SLDC 00          Short load constant 0
   08c0: LDB              Load byte at byte ptr TOS-1 + TOS
   08c1: SLDC 04          Short load constant 4
   08c2: SBI              Subtract integers (TOS-1 - TOS)
   08c3: SLDC 05          Short load constant 5
   08c4: CXP  00 19       Call external procedure PASCALSY.SCOPY
   08c7: LLA  0002        Load local address MP2
   08c9: LSA  05          Load string address: '.CODE'
   08d0: NOP              No operation
   08d1: EQLSTR           String TOS-1 = TOS
   08d3: FJP  $08ec       Jump if TOS false
   08d5: LDA  02 002e     Load addr G46
   08d8: LDA  02 001e     Load addr G30
   08db: LLA  0002        Load local address MP2
   08dd: SLDC 01          Short load constant 1
   08de: LDA  02 001e     Load addr G30
   08e1: SLDC 00          Short load constant 0
   08e2: LDB              Load byte at byte ptr TOS-1 + TOS
   08e3: SLDC 05          Short load constant 5
   08e4: SBI              Subtract integers (TOS-1 - TOS)
   08e5: CXP  00 19       Call external procedure PASCALSY.SCOPY
   08e8: LLA  0002        Load local address MP2
   08ea: SAS  0f          String assign (TOS to TOS-1, 15 chars)
-> 08ec: SLDC 01          Short load constant 1
   08ed: STR  02 0010     Store TOS to G16
   08f0: SLDO 03          Short load global BASE3
   08f1: LDCI 00c0        Load word 192
   08f4: SLDC 01          Short load constant 1
   08f5: INN              Set membership (TOS-1 in set TOS)
   08f6: FJP  $08fe       Jump if TOS false
   08f8: SLDC 01          Short load constant 1
   08f9: SLDO 03          Short load global BASE3
   08fa: SLDC 06          Short load constant 6
   08fb: EQUI             Integer TOS-1 = TOS
   08fc: CGP  02          Call global procedure GETCMD.2
-> 08fe: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC14(PARAM1) (* P=14 LL=1 *)
  MP1=PARAM1
BEGIN
-> 090c: LOD  02 0003     Load word at G3 (OUTPUT)
   090f: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0912: SLDL 01          Short load local MP1
   0913: SLDC 01          Short load constant 1
   0914: EQUI             Integer TOS-1 = TOS
   0915: FJP  $0945       Jump if TOS false
   0917: LOD  02 0003     Load word at G3 (OUTPUT)
   091a: NOP              No operation
   091b: LSA  1c          Load string address: 'Nested exec commands illegal'
   0939: SLDC 00          Short load constant 0
   093a: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   093d: LOD  02 0003     Load word at G3 (OUTPUT)
   0940: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0943: UJP  $0967       Unconditional jump
-> 0945: LOD  02 0003     Load word at G3 (OUTPUT)
   0948: NOP              No operation
   0949: LSA  12          Load string address: 'Error opening exec'
   095d: SLDC 00          Short load constant 0
   095e: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0961: LOD  02 0003     Load word at G3 (OUTPUT)
   0964: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0967: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC15 (* P=15 LL=1 *)
BEGIN
-> 0974: SLDC 20          Short load constant 32
   0975: STR  02 015a     Store TOS to G346
   0979: LOD  02 0036     Load word at G54
   097c: STR  02 0150     Store TOS to G336
   0980: LDA  02 014f     Load addr G335
   0984: LDCI 0100        Load word 256
   0987: CSP  01          Call standard procedure NEW
   0989: LDA  02 0036     Load addr G54
   098c: CSP  20          Call standard procedure MARK
-> 098e: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC16(PARAM1) (* P=16 LL=1 *)
  BASE1
  BASE6
  MP1=PARAM1
  MP2
  MP43
  MP46
  MP47
  MP48
BEGIN
-> 099a: SLDL 01          Short load local MP1
   099b: FJP  $09a7       Jump if TOS false
   099d: LLA  0002        Load local address MP2
   099f: LDA  02 011a     Load addr G282
   09a3: SAS  50          String assign (TOS to TOS-1, 80 chars)
   09a5: UJP  $09f2       Unconditional jump
-> 09a7: LOD  02 0003     Load word at G3 (OUTPUT)
   09aa: NOP              No operation
   09ab: LSA  07          Load string address: 'Execute'
   09b4: SLDC 00          Short load constant 0
   09b5: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09b8: LOD  02 0001     Load word at G1 (SYSCOM)
   09bb: INC  001d        Inc field ptr (TOS+29)
   09bd: SLDC 01          Short load constant 1
   09be: SLDC 04          Short load constant 4
   09bf: LDP              Load packed field (TOS)
   09c0: LNOT             Logical NOT (~TOS)
   09c1: FJP  $09d7       Jump if TOS false
   09c3: LOD  02 0003     Load word at G3 (OUTPUT)
   09c6: NOP              No operation
   09c7: LSA  0a          Load string address: ' what file'
   09d3: SLDC 00          Short load constant 0
   09d4: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
-> 09d7: LOD  02 0003     Load word at G3 (OUTPUT)
   09da: NOP              No operation
   09db: LSA  02          Load string address: '? '
   09df: SLDC 00          Short load constant 0
   09e0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   09e3: LOD  02 0002     Load word at G2 (INPUT)
   09e6: LLA  0002        Load local address MP2
   09e8: SLDC 50          Short load constant 80
   09e9: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   09ec: LOD  02 0002     Load word at G2 (INPUT)
   09ef: CXP  00 15       Call external procedure PASCALSY.FREADLN
-> 09f2: LLA  0002        Load local address MP2
   09f4: SLDC 00          Short load constant 0
   09f5: LDB              Load byte at byte ptr TOS-1 + TOS
   09f6: SLDC 00          Short load constant 0
   09f7: GRTI             Integer TOS-1 > TOS
   09f8: FJP  $0ad4       Jump if TOS false
   09fa: LLA  0002        Load local address MP2
   09fc: SLDC 00          Short load constant 0
   09fd: LDB              Load byte at byte ptr TOS-1 + TOS
   09fe: SLDC 05          Short load constant 5
   09ff: GRTI             Integer TOS-1 > TOS
   0a00: FJP  $0ab9       Jump if TOS false
   0a02: LLA  002b        Load local address MP43
   0a04: LLA  0002        Load local address MP2
   0a06: LLA  0030        Load local address MP48
   0a08: SLDC 01          Short load constant 1
   0a09: SLDC 05          Short load constant 5
   0a0a: CXP  00 19       Call external procedure PASCALSY.SCOPY
   0a0d: LLA  0030        Load local address MP48
   0a0f: SAS  05          String assign (TOS to TOS-1, 5 chars)
   0a11: SLDC 01          Short load constant 1
   0a12: STL  002e        Store TOS into MP46
   0a14: SLDC 04          Short load constant 4
   0a15: STL  0030        Store TOS into MP48
-> 0a17: LDL  002e        Load local word MP46
   0a19: LDL  0030        Load local word MP48
   0a1b: LEQI             Integer TOS-1 <= TOS
   0a1c: FJP  $0a41       Jump if TOS false
   0a1e: LLA  002b        Load local address MP43
   0a20: LDL  002e        Load local word MP46
   0a22: LDB              Load byte at byte ptr TOS-1 + TOS
   0a23: STL  002f        Store TOS into MP47
   0a25: LDL  002f        Load local word MP47
   0a27: SLDC 61          Short load constant 97
   0a28: GEQI             Integer TOS-1 >= TOS
   0a29: LDL  002f        Load local word MP47
   0a2b: SLDC 7a          Short load constant 122
   0a2c: LEQI             Integer TOS-1 <= TOS
   0a2d: LAND             Logical AND (TOS & TOS-1)
   0a2e: FJP  $0a39       Jump if TOS false
   0a30: LLA  002b        Load local address MP43
   0a32: LDL  002e        Load local word MP46
   0a34: LDL  002f        Load local word MP47
   0a36: SLDC 20          Short load constant 32
   0a37: SBI              Subtract integers (TOS-1 - TOS)
   0a38: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0a39: LDL  002e        Load local word MP46
   0a3b: SLDC 01          Short load constant 1
   0a3c: ADI              Add integers (TOS + TOS-1)
   0a3d: STL  002e        Store TOS into MP46
   0a3f: UJP  $0a17       Unconditional jump
-> 0a41: LLA  002b        Load local address MP43
   0a43: LSA  05          Load string address: 'EXEC/'
   0a4a: NOP              No operation
   0a4b: EQLSTR           String TOS-1 = TOS
   0a4d: FJP  $0ab9       Jump if TOS false
   0a4f: LOD  02 0155     Load word at G341
   0a53: LOD  02 0154     Load word at G340
   0a57: LOR              Logical OR (TOS | TOS-1)
   0a58: FJP  $0a5f       Jump if TOS false
   0a5a: SLDC 01          Short load constant 1
   0a5b: CGP  0e          Call global procedure GETCMD.14
   0a5d: UJP  $0ab5       Unconditional jump
-> 0a5f: LLA  0002        Load local address MP2
   0a61: SLDC 01          Short load constant 1
   0a62: SLDC 05          Short load constant 5
   0a63: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   0a66: LLA  0002        Load local address MP2
   0a68: SLDC 00          Short load constant 0
   0a69: SLDC 00          Short load constant 0
   0a6a: CGP  06          Call global procedure GETCMD.6
   0a6c: FJP  $0a72       Jump if TOS false
   0a6e: SLDC 05          Short load constant 5
   0a6f: SLDC 10          Short load constant 16
   0a70: CSP  04          Call standard procedure EXIT
-> 0a72: LLA  0002        Load local address MP2
   0a74: SLDC 01          Short load constant 1
   0a75: SLDC 50          Short load constant 80
   0a76: CXP  00 2b       Call external procedure PASCALSY.43
   0a79: LDA  02 015c     Load addr G348
   0a7d: LLA  0002        Load local address MP2
   0a7f: SLDC 01          Short load constant 1
   0a80: SLDC 00          Short load constant 0
   0a81: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0a84: CSP  22          Call standard procedure IORESULT
   0a86: SLDC 00          Short load constant 0
   0a87: EQUI             Integer TOS-1 = TOS
   0a88: FJP  $0ab2       Jump if TOS false
   0a8a: CGP  0f          Call global procedure GETCMD.15
   0a8c: SLDC 01          Short load constant 1
   0a8d: STR  02 0154     Store TOS to G340
   0a91: SLDC 01          Short load constant 1
   0a92: STR  02 0153     Store TOS to G339
   0a96: CXP  00 2e       Call external procedure PASCALSY.46
   0a99: LOD  02 014f     Load word at G335
   0a9d: LOD  02 0151     Load word at G337
   0aa1: LDB              Load byte at byte ptr TOS-1 + TOS
   0aa2: STR  02 015b     Store TOS to G347
   0aa6: LOD  02 0151     Load word at G337
   0aaa: SLDC 01          Short load constant 1
   0aab: ADI              Add integers (TOS + TOS-1)
   0aac: STR  02 0151     Store TOS to G337
   0ab0: UJP  $0ab5       Unconditional jump
-> 0ab2: SLDC 02          Short load constant 2
   0ab3: CGP  0e          Call global procedure GETCMD.14
-> 0ab5: SLDC 05          Short load constant 5
   0ab6: SLDC 10          Short load constant 16
   0ab7: CSP  04          Call standard procedure EXIT
-> 0ab9: LLA  0002        Load local address MP2
   0abb: SLDC 00          Short load constant 0
   0abc: SLDC 50          Short load constant 80
   0abd: CXP  00 2b       Call external procedure PASCALSY.43
   0ac0: LLA  0002        Load local address MP2
   0ac2: SLDC 00          Short load constant 0
   0ac3: SLDC 00          Short load constant 0
   0ac4: SLDC 01          Short load constant 1
   0ac5: LAO  0006        Load global BASE6
   0ac7: SLDC 00          Short load constant 0
   0ac8: SLDC 00          Short load constant 0
   0ac9: CGP  0a          Call global procedure GETCMD.10
   0acb: FJP  $0ad4       Jump if TOS false
   0acd: SLDC 04          Short load constant 4
   0ace: SRO  0001        Store global word BASE1
   0ad0: SLDC 05          Short load constant 5
   0ad1: SLDC 01          Short load constant 1
   0ad2: CSP  04          Call standard procedure EXIT
-> 0ad4: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC17 (* P=17 LL=1 *)
BEGIN
-> 0b70: LOD  02 0003     Load word at G3 (OUTPUT)
   0b73: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0b76: LOD  02 0003     Load word at G3 (OUTPUT)
   0b79: LSA  0c          Load string address: 'Swapping is '
   0b87: NOP              No operation
   0b88: SLDC 00          Short load constant 0
   0b89: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b8c: LOD  02 0156     Load word at G342
   0b90: FJP  $0ba6       Jump if TOS false
   0b92: LOD  02 0003     Load word at G3 (OUTPUT)
   0b95: LSA  02          Load string address: 'on'
   0b99: NOP              No operation
   0b9a: SLDC 00          Short load constant 0
   0b9b: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0b9e: LOD  02 0003     Load word at G3 (OUTPUT)
   0ba1: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0ba4: UJP  $0bb9       Unconditional jump
-> 0ba6: LOD  02 0003     Load word at G3 (OUTPUT)
   0ba9: LSA  03          Load string address: 'off'
   0bae: NOP              No operation
   0baf: SLDC 00          Short load constant 0
   0bb0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0bb3: LOD  02 0003     Load word at G3 (OUTPUT)
   0bb6: CXP  00 16       Call external procedure PASCALSY.FWRITELN
-> 0bb9: LOD  02 0003     Load word at G3 (OUTPUT)
   0bbc: NOP              No operation
   0bbd: LSA  10          Load string address: 'Toggle swapping?'
   0bcf: SLDC 00          Short load constant 0
   0bd0: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0bd3: SLDC 00          Short load constant 0
   0bd4: SLDC 00          Short load constant 0
   0bd5: CGP  04          Call global procedure GETCMD.4
   0bd7: FJP  $0be2       Jump if TOS false
   0bd9: LOD  02 0156     Load word at G342
   0bdd: LNOT             Logical NOT (~TOS)
   0bde: STR  02 0156     Store TOS to G342
-> 0be2: RNP  00          Return from nonbase procedure
END

### PROCEDURE GETCMD.PROC18 (* P=18 LL=1 *)
  MP1
  MP2
  MP23
  MP24
BEGIN
-> 0bee: LOD  02 0003     Load word at G3 (OUTPUT)
   0bf1: LSA  0e          Load string address: 'New exec name:'
   0c01: NOP              No operation
   0c02: SLDC 00          Short load constant 0
   0c03: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c06: LOD  02 0002     Load word at G2 (INPUT)
   0c09: LLA  0002        Load local address MP2
   0c0b: SLDC 28          Short load constant 40
   0c0c: CXP  00 12       Call external procedure PASCALSY.FREADSTRING
   0c0f: LOD  02 0002     Load word at G2 (INPUT)
   0c12: CXP  00 15       Call external procedure PASCALSY.FREADLN
   0c15: LLA  0002        Load local address MP2
   0c17: SLDC 00          Short load constant 0
   0c18: LDB              Load byte at byte ptr TOS-1 + TOS
   0c19: SLDC 00          Short load constant 0
   0c1a: GRTI             Integer TOS-1 > TOS
   0c1b: FJP  $0c6f       Jump if TOS false
   0c1d: LLA  0002        Load local address MP2
   0c1f: LLA  0002        Load local address MP2
   0c21: SLDC 00          Short load constant 0
   0c22: LDB              Load byte at byte ptr TOS-1 + TOS
   0c23: LDB              Load byte at byte ptr TOS-1 + TOS
   0c24: SLDC 2e          Short load constant 46
   0c25: EQUI             Integer TOS-1 = TOS
   0c26: STL  0017        Store TOS into MP23
   0c28: LLA  0002        Load local address MP2
   0c2a: SLDC 00          Short load constant 0
   0c2b: SLDC 00          Short load constant 0
   0c2c: CGP  06          Call global procedure GETCMD.6
   0c2e: FJP  $0c34       Jump if TOS false
   0c30: SLDC 05          Short load constant 5
   0c31: SLDC 12          Short load constant 18
   0c32: CSP  04          Call standard procedure EXIT
-> 0c34: LLA  0002        Load local address MP2
   0c36: SLDC 01          Short load constant 1
   0c37: SLDC 25          Short load constant 37
   0c38: CXP  00 2b       Call external procedure PASCALSY.43
   0c3b: LLA  0002        Load local address MP2
   0c3d: SLDC 00          Short load constant 0
   0c3e: LDB              Load byte at byte ptr TOS-1 + TOS
   0c3f: SLDC 00          Short load constant 0
   0c40: GRTI             Integer TOS-1 > TOS
   0c41: LDL  0017        Load local word MP23
   0c43: LNOT             Logical NOT (~TOS)
   0c44: LAND             Logical AND (TOS & TOS-1)
   0c45: FJP  $0c6f       Jump if TOS false
   0c47: LLA  0002        Load local address MP2
   0c49: LLA  0002        Load local address MP2
   0c4b: SLDC 00          Short load constant 0
   0c4c: LDB              Load byte at byte ptr TOS-1 + TOS
   0c4d: LDB              Load byte at byte ptr TOS-1 + TOS
   0c4e: SLDC 5d          Short load constant 93
   0c4f: NEQI             Integer TOS-1 <> TOS
   0c50: FJP  $0c6f       Jump if TOS false
   0c52: LLA  0002        Load local address MP2
   0c54: SLDC 00          Short load constant 0
   0c55: STL  0018        Store TOS into MP24
   0c57: LLA  0018        Load local address MP24
   0c59: LLA  0002        Load local address MP2
   0c5b: SLDC 28          Short load constant 40
   0c5c: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0c5f: LLA  0018        Load local address MP24
   0c61: LSA  03          Load string address: '[8]'
   0c66: NOP              No operation
   0c67: SLDC 2b          Short load constant 43
   0c68: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0c6b: LLA  0018        Load local address MP24
   0c6d: SAS  28          String assign (TOS to TOS-1, 40 chars)
-> 0c6f: LDA  02 015c     Load addr G348
   0c73: LLA  0002        Load local address MP2
   0c75: SLDC 00          Short load constant 0
   0c76: SLDC 00          Short load constant 0
   0c77: CXP  00 05       Call external procedure PASCALSY.FOPEN
   0c7a: CSP  22          Call standard procedure IORESULT
   0c7c: SLDC 00          Short load constant 0
   0c7d: EQUI             Integer TOS-1 = TOS
   0c7e: FJP  $0d2c       Jump if TOS false
   0c80: SLDC 25          Short load constant 37
   0c81: STR  02 015b     Store TOS to G347
   0c85: LOD  02 0003     Load word at G3 (OUTPUT)
   0c88: NOP              No operation
   0c89: LSA  0b          Load string address: 'Terminator='
   0c96: SLDC 00          Short load constant 0
   0c97: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0c9a: LOD  02 0003     Load word at G3 (OUTPUT)
   0c9d: LOD  02 015b     Load word at G347
   0ca1: SLDC 00          Short load constant 0
   0ca2: CXP  00 11       Call external procedure PASCALSY.FWRITECHAR
   0ca5: LOD  02 0003     Load word at G3 (OUTPUT)
   0ca8: NOP              No operation
   0ca9: LSA  0c          Load string address: ', change it?'
   0cb7: SLDC 00          Short load constant 0
   0cb8: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0cbb: SLDC 00          Short load constant 0
   0cbc: SLDC 00          Short load constant 0
   0cbd: CGP  04          Call global procedure GETCMD.4
   0cbf: FJP  $0cea       Jump if TOS false
   0cc1: LOD  02 0003     Load word at G3 (OUTPUT)
   0cc4: CXP  00 16       Call external procedure PASCALSY.FWRITELN
   0cc7: LOD  02 0003     Load word at G3 (OUTPUT)
   0cca: NOP              No operation
   0ccb: LSA  0f          Load string address: 'New terminator:'
   0cdc: SLDC 00          Short load constant 0
   0cdd: CXP  00 13       Call external procedure PASCALSY.FWRITESTRING
   0ce0: LOD  02 0002     Load word at G2 (INPUT)
   0ce3: LDA  02 015b     Load addr G347
   0ce7: CXP  00 10       Call external procedure PASCALSY.FREADCHAR
-> 0cea: CGP  0f          Call global procedure GETCMD.15
   0cec: SLDC 01          Short load constant 1
   0ced: STR  02 0155     Store TOS to G341
   0cf1: LOD  02 014f     Load word at G335
   0cf5: SLDC 00          Short load constant 0
   0cf6: LDCI 0200        Load word 512
   0cf9: SLDC 00          Short load constant 0
   0cfa: CSP  0a          Call standard procedure FLCH
   0cfc: SLDC 00          Short load constant 0
   0cfd: STR  02 0153     Store TOS to G339
   0d01: SLDC 01          Short load constant 1
   0d02: STL  0001        Store TOS into MP1
   0d04: SLDC 02          Short load constant 2
   0d05: STL  0018        Store TOS into MP24
-> 0d07: SLDL 01          Short load local MP1
   0d08: LDL  0018        Load local word MP24
   0d0a: LEQI             Integer TOS-1 <= TOS
   0d0b: FJP  $0d1d       Jump if TOS false
   0d0d: LOD  02 0155     Load word at G341
   0d11: FJP  $0d16       Jump if TOS false
   0d13: CXP  00 2f       Call external procedure PASCALSY.47
-> 0d16: SLDL 01          Short load local MP1
   0d17: SLDC 01          Short load constant 1
   0d18: ADI              Add integers (TOS + TOS-1)
   0d19: STL  0001        Store TOS into MP1
   0d1b: UJP  $0d07       Unconditional jump
-> 0d1d: LOD  02 0155     Load word at G341
   0d21: FJP  $0d2a       Jump if TOS false
   0d23: LOD  02 015b     Load word at G347
   0d27: CXP  00 2c       Call external procedure PASCALSY.44
-> 0d2a: UJP  $0d2f       Unconditional jump
-> 0d2c: SLDC 02          Short load constant 2
   0d2d: CGP  0e          Call global procedure GETCMD.14
-> 0d2f: RNP  00          Return from nonbase procedure
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
-> 083a: SLDO 06          Short load global BASE6
   083b: UJP  $087d       Unconditional jump
   083d: SLDO 05          Short load global BASE5
   083e: CLP  03          Call local procedure FILEPROC.3
   0840: UJP  $088c       Unconditional jump
   0842: SLDO 05          Short load global BASE5
   0843: SLDO 04          Short load global BASE4
   0844: SLDO 03          Short load global BASE3
   0845: SLDO 02          Short load global BASE2
   0846: CLP  04          Call local procedure FILEPROC.4
   0848: UJP  $088c       Unconditional jump
   084a: SLDO 01          Short load global BASE1
   084b: UJP  $0861       Unconditional jump
   084d: SLDC 00          Short load constant 0
   084e: SRO  0007        Store global word BASE7
   0850: UJP  $0870       Unconditional jump
   0852: SLDC 01          Short load constant 1
   0853: SRO  0007        Store global word BASE7
   0855: UJP  $0870       Unconditional jump
   0857: SLDC 02          Short load constant 2
   0858: SRO  0007        Store global word BASE7
   085a: UJP  $0870       Unconditional jump
   085c: SLDC 03          Short load constant 3
   085d: SRO  0007        Store global word BASE7
   085f: UJP  $0870       Unconditional jump
-> 0870: SLDO 05          Short load global BASE5
   0871: SLDO 07          Short load global BASE7
   0872: CLP  07          Call local procedure FILEPROC.7
   0874: UJP  $088c       Unconditional jump
   0876: SLDO 04          Short load global BASE4
   0877: SLDO 03          Short load global BASE3
   0878: SLDO 01          Short load global BASE1
   0879: CLP  08          Call local procedure FILEPROC.8
   087b: UJP  $088c       Unconditional jump
-> 088c: RBP  00          Return from base procedure
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
   0049: GRTI             Integer TOS-1 > TOS
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
   0272: UJP  $0533       Unconditional jump
-> 0274: SLDL 03          Short load local MP3
   0275: LLA  000e        Load local address MP14
   0277: LLA  0012        Load local address MP18
   0279: LLA  0009        Load local address MP9
   027b: LLA  000a        Load local address MP10
   027d: SLDC 00          Short load constant 0
   027e: SLDC 00          Short load constant 0
   027f: CXP  00 21       Call external procedure PASCALSY.33
   0282: FJP  $052e       Jump if TOS false
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
   0311: UJP  $0500       Unconditional jump
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
   0375: UJP  $04e6       Unconditional jump
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
   038f: UJP  $04e6       Unconditional jump
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
   03e5: UJP  $04e6       Unconditional jump
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
-> 03fc: UJP  $044e       Unconditional jump
-> 03fe: LDL  001a        Load local word MP26
   0400: INC  0010        Inc field ptr (TOS+16)
   0402: STL  001c        Store TOS into MP28
   0404: LDL  001c        Load local word MP28
   0406: SLDC 00          Short load constant 0
   0407: STO              Store indirect (TOS into TOS-1)
   0408: LDL  001c        Load local word MP28
   040a: INC  0001        Inc field ptr (TOS+1)
   040c: LDCI 7fff        Load word 32767
   040f: STO              Store indirect (TOS into TOS-1)
   0410: LDL  001b        Load local word MP27
   0412: SIND 04          Short index load *TOS+4
   0413: FJP  $041d       Jump if TOS false
   0415: LDL  001c        Load local word MP28
   0417: INC  0001        Inc field ptr (TOS+1)
   0419: LDL  001b        Load local word MP27
   041b: SIND 05          Short index load *TOS+5
   041c: STO              Store indirect (TOS into TOS-1)
-> 041d: LDL  001c        Load local word MP28
   041f: INC  0002        Inc field ptr (TOS+2)
   0421: SLDC 04          Short load constant 4
   0422: SLDC 00          Short load constant 0
   0423: SLDL 0a          Short load local MP10
   0424: STP              Store packed field (TOS into TOS-1)
   0425: LDL  001c        Load local word MP28
   0427: INC  0003        Inc field ptr (TOS+3)
   0429: LSA  00          Load string address: ''
   042b: NOP              No operation
   042c: SAS  0f          String assign (TOS to TOS-1, 15 chars)
   042e: LDL  001c        Load local word MP28
   0430: INC  000b        Inc field ptr (TOS+11)
   0432: LDCI 0200        Load word 512
   0435: STO              Store indirect (TOS into TOS-1)
   0436: LDL  001c        Load local word MP28
   0438: INC  000c        Inc field ptr (TOS+12)
   043a: STL  001d        Store TOS into MP29
   043c: LDL  001d        Load local word MP29
   043e: SLDC 04          Short load constant 4
   043f: SLDC 00          Short load constant 0
   0440: SLDC 00          Short load constant 0
   0441: STP              Store packed field (TOS into TOS-1)
   0442: LDL  001d        Load local word MP29
   0444: SLDC 05          Short load constant 5
   0445: SLDC 04          Short load constant 4
   0446: SLDC 00          Short load constant 0
   0447: STP              Store packed field (TOS into TOS-1)
   0448: LDL  001d        Load local word MP29
   044a: SLDC 07          Short load constant 7
   044b: SLDC 09          Short load constant 9
   044c: SLDC 00          Short load constant 0
   044d: STP              Store packed field (TOS into TOS-1)
-> 044e: SLDL 02          Short load local MP2
   044f: FJP  $0461       Jump if TOS false
   0451: LDL  001a        Load local word MP26
   0453: INC  000c        Inc field ptr (TOS+12)
   0455: LDL  001a        Load local word MP26
   0457: IND  0011        Static index and load word (TOS+17)
   0459: LDL  001a        Load local word MP26
   045b: IND  0010        Static index and load word (TOS+16)
   045d: SBI              Subtract integers (TOS-1 - TOS)
   045e: STO              Store indirect (TOS into TOS-1)
   045f: UJP  $0467       Unconditional jump
-> 0461: LDL  001a        Load local word MP26
   0463: INC  000c        Inc field ptr (TOS+12)
   0465: SLDC 00          Short load constant 0
   0466: STO              Store indirect (TOS into TOS-1)
-> 0467: LDL  001a        Load local word MP26
   0469: IND  001d        Static index and load word (TOS+29)
   046b: FJP  $04db       Jump if TOS false
   046d: LDL  001a        Load local word MP26
   046f: INC  001f        Inc field ptr (TOS+31)
   0471: LDCI 0200        Load word 512
   0474: STO              Store indirect (TOS into TOS-1)
   0475: LDL  001a        Load local word MP26
   0477: INC  0020        Inc field ptr (TOS+32)
   0479: SLDC 00          Short load constant 0
   047a: STO              Store indirect (TOS into TOS-1)
   047b: SLDL 02          Short load local MP2
   047c: FJP  $0489       Jump if TOS false
   047e: LDL  001a        Load local word MP26
   0480: INC  001e        Inc field ptr (TOS+30)
   0482: LDL  001a        Load local word MP26
   0484: IND  001b        Static index and load word (TOS+27)
   0486: STO              Store indirect (TOS into TOS-1)
   0487: UJP  $0491       Unconditional jump
-> 0489: LDL  001a        Load local word MP26
   048b: INC  001e        Inc field ptr (TOS+30)
   048d: LDCI 0200        Load word 512
   0490: STO              Store indirect (TOS into TOS-1)
-> 0491: LDL  001a        Load local word MP26
   0493: INC  0010        Inc field ptr (TOS+16)
   0495: STL  001c        Store TOS into MP28
   0497: LDL  001c        Load local word MP28
   0499: INC  0002        Inc field ptr (TOS+2)
   049b: SLDC 04          Short load constant 4
   049c: SLDC 00          Short load constant 0
   049d: LDP              Load packed field (TOS)
   049e: SLDC 03          Short load constant 3
   049f: EQUI             Integer TOS-1 = TOS
   04a0: FJP  $04db       Jump if TOS false
   04a2: LDL  001a        Load local word MP26
   04a4: INC  000d        Inc field ptr (TOS+13)
   04a6: SLDC 02          Short load constant 2
   04a7: STO              Store indirect (TOS into TOS-1)
   04a8: SLDL 02          Short load local MP2
   04a9: LNOT             Logical NOT (~TOS)
   04aa: FJP  $04db       Jump if TOS false
   04ac: LDL  001a        Load local word MP26
   04ae: INC  0021        Inc field ptr (TOS+33)
   04b0: SLDC 00          Short load constant 0
   04b1: LDCI 0202        Load word 514
   04b4: SLDC 00          Short load constant 0
   04b5: CSP  0a          Call standard procedure FLCH
   04b7: LDL  001a        Load local word MP26
   04b9: SIND 07          Short index load *TOS+7
   04ba: LDL  001a        Load local word MP26
   04bc: INC  0021        Inc field ptr (TOS+33)
   04be: SLDC 00          Short load constant 0
   04bf: LDCI 0200        Load word 512
   04c2: LDL  001c        Load local word MP28
   04c4: SIND 00          Short index load *TOS+0
   04c5: SLDC 00          Short load constant 0
   04c6: CSP  06          Call standard procedure UNITWRITE
   04c8: LDL  001a        Load local word MP26
   04ca: SIND 07          Short index load *TOS+7
   04cb: LDL  001a        Load local word MP26
   04cd: INC  0021        Inc field ptr (TOS+33)
   04cf: SLDC 00          Short load constant 0
   04d0: LDCI 0200        Load word 512
   04d3: LDL  001c        Load local word MP28
   04d5: SIND 00          Short index load *TOS+0
   04d6: SLDC 01          Short load constant 1
   04d7: ADI              Add integers (TOS + TOS-1)
   04d8: SLDC 00          Short load constant 0
   04d9: CSP  06          Call standard procedure UNITWRITE
-> 04db: SLDL 02          Short load local MP2
   04dc: FJP  $04e3       Jump if TOS false
   04de: SLDL 04          Short load local MP4
   04df: CGP  03          Call global procedure FILEPROC.3
   04e1: UJP  $04e6       Unconditional jump
-> 04e3: SLDL 04          Short load local MP4
   04e4: CGP  02          Call global procedure FILEPROC.2
-> 04e6: LOD  02 0001     Load word at G1 (SYSCOM)
   04e9: SIND 00          Short index load *TOS+0
   04ea: SLDC 00          Short load constant 0
   04eb: NEQI             Integer TOS-1 <> TOS
   04ec: FJP  $0500       Jump if TOS false
   04ee: LDL  001a        Load local word MP26
   04f0: INC  0005        Inc field ptr (TOS+5)
   04f2: SLDC 00          Short load constant 0
   04f3: STO              Store indirect (TOS into TOS-1)
   04f4: LDL  001a        Load local word MP26
   04f6: INC  0002        Inc field ptr (TOS+2)
   04f8: SLDC 01          Short load constant 1
   04f9: STO              Store indirect (TOS into TOS-1)
   04fa: LDL  001a        Load local word MP26
   04fc: INC  0001        Inc field ptr (TOS+1)
   04fe: SLDC 01          Short load constant 1
   04ff: STO              Store indirect (TOS into TOS-1)
-> 0500: SLDL 0c          Short load local MP12
   0501: FJP  $052c       Jump if TOS false
   0503: LLA  000b        Load local address MP11
   0505: CSP  21          Call standard procedure RELEASE
   0507: LOD  02 0001     Load word at G1 (SYSCOM)
   050a: INC  0004        Inc field ptr (TOS+4)
   050c: LDCN             Load constant NIL
   050d: STO              Store indirect (TOS into TOS-1)
   050e: LOD  02 0001     Load word at G1 (SYSCOM)
   0511: SIND 00          Short index load *TOS+0
   0512: STL  000d        Store TOS into MP13
   0514: LOD  02 0037     Load word at G55
   0517: SIND 07          Short index load *TOS+7
   0518: LOD  02 0036     Load word at G54
   051b: SLDC 00          Short load constant 0
   051c: LDCI 07ec        Load word 2028
   051f: LOD  02 0037     Load word at G55
   0522: IND  0010        Static index and load word (TOS+16)
   0524: SLDC 00          Short load constant 0
   0525: CSP  05          Call standard procedure UNITREAD
   0527: LOD  02 0001     Load word at G1 (SYSCOM)
   052a: SLDL 0d          Short load local MP13
   052b: STO              Store indirect (TOS into TOS-1)
-> 052c: UJP  $0533       Unconditional jump
-> 052e: LOD  02 0001     Load word at G1 (SYSCOM)
   0531: SLDC 07          Short load constant 7
   0532: STO              Store indirect (TOS into TOS-1)
-> 0533: RNP  00          Return from nonbase procedure
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
-> 054a: LOD  02 0001     Load word at G1 (SYSCOM)
   054d: SLDC 00          Short load constant 0
   054e: STO              Store indirect (TOS into TOS-1)
   054f: SLDL 02          Short load local MP2
   0550: STL  0007        Store TOS into MP7
   0552: SLDL 07          Short load local MP7
   0553: SIND 05          Short index load *TOS+5
   0554: SLDL 07          Short load local MP7
   0555: SIND 00          Short index load *TOS+0
   0556: LOD  02 0038     Load word at G56
   0559: SIND 00          Short index load *TOS+0
   055a: NEQI             Integer TOS-1 <> TOS
   055b: LAND             Logical AND (TOS & TOS-1)
   055c: FJP  $06db       Jump if TOS false
   055e: SLDL 07          Short load local MP7
   055f: SIND 06          Short index load *TOS+6
   0560: FJP  $06b2       Jump if TOS false
   0562: SLDL 07          Short load local MP7
   0563: INC  0010        Inc field ptr (TOS+16)
   0565: STL  0008        Store TOS into MP8
   0567: SLDL 08          Short load local MP8
   0568: INC  0003        Inc field ptr (TOS+3)
   056a: SLDC 00          Short load constant 0
   056b: LDB              Load byte at byte ptr TOS-1 + TOS
   056c: SLDC 00          Short load constant 0
   056d: GRTI             Integer TOS-1 > TOS
   056e: FJP  $06b2       Jump if TOS false
   0570: SLDL 01          Short load local MP1
   0571: SLDC 03          Short load constant 3
   0572: EQUI             Integer TOS-1 = TOS
   0573: FJP  $0592       Jump if TOS false
   0575: SLDL 07          Short load local MP7
   0576: INC  000c        Inc field ptr (TOS+12)
   0578: SLDL 07          Short load local MP7
   0579: IND  000d        Static index and load word (TOS+13)
   057b: STO              Store indirect (TOS into TOS-1)
   057c: SLDL 08          Short load local MP8
   057d: INC  000c        Inc field ptr (TOS+12)
   057f: SLDC 07          Short load constant 7
   0580: SLDC 09          Short load constant 9
   0581: SLDC 64          Short load constant 100
   0582: STP              Store packed field (TOS into TOS-1)
   0583: SLDC 01          Short load constant 1
   0584: STL  0001        Store TOS into MP1
   0586: SLDL 07          Short load local MP7
   0587: IND  001d        Static index and load word (TOS+29)
   0589: FJP  $0592       Jump if TOS false
   058b: SLDL 07          Short load local MP7
   058c: INC  001e        Inc field ptr (TOS+30)
   058e: SLDL 07          Short load local MP7
   058f: IND  001f        Static index and load word (TOS+31)
   0591: STO              Store indirect (TOS into TOS-1)
-> 0592: SLDL 02          Short load local MP2
   0593: CGP  02          Call global procedure FILEPROC.2
   0595: SLDL 07          Short load local MP7
   0596: IND  000f        Static index and load word (TOS+15)
   0598: SLDL 08          Short load local MP8
   0599: INC  000c        Inc field ptr (TOS+12)
   059b: SLDC 07          Short load constant 7
   059c: SLDC 09          Short load constant 9
   059d: LDP              Load packed field (TOS)
   059e: SLDC 64          Short load constant 100
   059f: EQUI             Integer TOS-1 = TOS
   05a0: LOR              Logical OR (TOS | TOS-1)
   05a1: SLDL 01          Short load local MP1
   05a2: SLDC 02          Short load constant 2
   05a3: EQUI             Integer TOS-1 = TOS
   05a4: LOR              Logical OR (TOS | TOS-1)
   05a5: FJP  $06b2       Jump if TOS false
   05a7: SLDL 07          Short load local MP7
   05a8: SIND 07          Short index load *TOS+7
   05a9: SLDL 07          Short load local MP7
   05aa: INC  0008        Inc field ptr (TOS+8)
   05ac: SLDC 00          Short load constant 0
   05ad: LLA  0005        Load local address MP5
   05af: SLDC 00          Short load constant 0
   05b0: SLDC 00          Short load constant 0
   05b1: CXP  00 1e       Call external procedure PASCALSY.30
   05b4: NEQI             Integer TOS-1 <> TOS
   05b5: FJP  $05be       Jump if TOS false
   05b7: LOD  02 0001     Load word at G1 (SYSCOM)
   05ba: SLDC 05          Short load constant 5
   05bb: STO              Store indirect (TOS into TOS-1)
   05bc: UJP  $06cc       Unconditional jump
-> 05be: SLDC 01          Short load constant 1
   05bf: STL  0004        Store TOS into MP4
   05c1: SLDC 00          Short load constant 0
   05c2: STL  0006        Store TOS into MP6
-> 05c4: SLDL 04          Short load local MP4
   05c5: SLDL 05          Short load local MP5
   05c6: SLDC 00          Short load constant 0
   05c7: IXA  000d        Index array (TOS-1 + TOS * 13)
   05c9: IND  0008        Static index and load word (TOS+8)
   05cb: LEQI             Integer TOS-1 <= TOS
   05cc: SLDL 06          Short load local MP6
   05cd: LNOT             Logical NOT (~TOS)
   05ce: LAND             Logical AND (TOS & TOS-1)
   05cf: FJP  $05eb       Jump if TOS false
   05d1: SLDL 05          Short load local MP5
   05d2: SLDL 04          Short load local MP4
   05d3: IXA  000d        Index array (TOS-1 + TOS * 13)
   05d5: SIND 00          Short index load *TOS+0
   05d6: SLDL 08          Short load local MP8
   05d7: SIND 00          Short index load *TOS+0
   05d8: EQUI             Integer TOS-1 = TOS
   05d9: SLDL 05          Short load local MP5
   05da: SLDL 04          Short load local MP4
   05db: IXA  000d        Index array (TOS-1 + TOS * 13)
   05dd: SIND 01          Short index load *TOS+1
   05de: SLDL 08          Short load local MP8
   05df: SIND 01          Short index load *TOS+1
   05e0: EQUI             Integer TOS-1 = TOS
   05e1: LAND             Logical AND (TOS & TOS-1)
   05e2: STL  0006        Store TOS into MP6
   05e4: SLDL 04          Short load local MP4
   05e5: SLDC 01          Short load constant 1
   05e6: ADI              Add integers (TOS + TOS-1)
   05e7: STL  0004        Store TOS into MP4
   05e9: UJP  $05c4       Unconditional jump
-> 05eb: SLDL 06          Short load local MP6
   05ec: LNOT             Logical NOT (~TOS)
   05ed: FJP  $05f6       Jump if TOS false
   05ef: LOD  02 0001     Load word at G1 (SYSCOM)
   05f2: SLDC 06          Short load constant 6
   05f3: STO              Store indirect (TOS into TOS-1)
   05f4: UJP  $06cc       Unconditional jump
-> 05f6: SLDL 04          Short load local MP4
   05f7: SLDC 01          Short load constant 1
   05f8: SBI              Subtract integers (TOS-1 - TOS)
   05f9: STL  0004        Store TOS into MP4
   05fb: SLDL 01          Short load local MP1
   05fc: SLDC 00          Short load constant 0
   05fd: EQUI             Integer TOS-1 = TOS
   05fe: SLDL 05          Short load local MP5
   05ff: SLDL 04          Short load local MP4
   0600: IXA  000d        Index array (TOS-1 + TOS * 13)
   0602: INC  000c        Inc field ptr (TOS+12)
   0604: SLDC 07          Short load constant 7
   0605: SLDC 09          Short load constant 9
   0606: LDP              Load packed field (TOS)
   0607: SLDC 64          Short load constant 100
   0608: EQUI             Integer TOS-1 = TOS
   0609: LAND             Logical AND (TOS & TOS-1)
   060a: SLDL 01          Short load local MP1
   060b: SLDC 02          Short load constant 2
   060c: EQUI             Integer TOS-1 = TOS
   060d: LOR              Logical OR (TOS | TOS-1)
   060e: FJP  $0617       Jump if TOS false
   0610: SLDL 04          Short load local MP4
   0611: SLDL 05          Short load local MP5
   0612: CXP  00 22       Call external procedure PASCALSY.34
   0615: UJP  $06ac       Unconditional jump
-> 0617: SLDL 08          Short load local MP8
   0618: INC  0003        Inc field ptr (TOS+3)
   061a: SLDC 01          Short load constant 1
   061b: SLDL 05          Short load local MP5
   061c: SLDC 00          Short load constant 0
   061d: SLDC 00          Short load constant 0
   061e: CXP  00 20       Call external procedure PASCALSY.32
   0621: STL  0003        Store TOS into MP3
   0623: SLDL 03          Short load local MP3
   0624: SLDC 00          Short load constant 0
   0625: NEQI             Integer TOS-1 <> TOS
   0626: SLDL 03          Short load local MP3
   0627: SLDL 04          Short load local MP4
   0628: NEQI             Integer TOS-1 <> TOS
   0629: LAND             Logical AND (TOS & TOS-1)
   062a: FJP  $063b       Jump if TOS false
   062c: SLDL 03          Short load local MP3
   062d: SLDL 05          Short load local MP5
   062e: CXP  00 22       Call external procedure PASCALSY.34
   0631: SLDL 03          Short load local MP3
   0632: SLDL 04          Short load local MP4
   0633: LESI             Integer TOS-1 < TOS
   0634: FJP  $063b       Jump if TOS false
   0636: SLDL 04          Short load local MP4
   0637: SLDC 01          Short load constant 1
   0638: SBI              Subtract integers (TOS-1 - TOS)
   0639: STL  0004        Store TOS into MP4
-> 063b: SLDL 05          Short load local MP5
   063c: SLDL 04          Short load local MP4
   063d: IXA  000d        Index array (TOS-1 + TOS * 13)
   063f: INC  000c        Inc field ptr (TOS+12)
   0641: SLDC 07          Short load constant 7
   0642: SLDC 09          Short load constant 9
   0643: LDP              Load packed field (TOS)
   0644: SLDC 64          Short load constant 100
   0645: EQUI             Integer TOS-1 = TOS
   0646: FJP  $065e       Jump if TOS false
   0648: SLDL 08          Short load local MP8
   0649: INC  000c        Inc field ptr (TOS+12)
   064b: SLDC 07          Short load constant 7
   064c: SLDC 09          Short load constant 9
   064d: LDP              Load packed field (TOS)
   064e: SLDC 64          Short load constant 100
   064f: EQUI             Integer TOS-1 = TOS
   0650: FJP  $065c       Jump if TOS false
   0652: SLDL 08          Short load local MP8
   0653: INC  000c        Inc field ptr (TOS+12)
   0655: LDA  02 0043     Load addr G67
   0658: MOV  0001        Move 1 words (TOS to TOS-1)
   065a: UJP  $065c       Unconditional jump
-> 065c: UJP  $0681       Unconditional jump
-> 065e: SLDL 07          Short load local MP7
   065f: IND  000f        Static index and load word (TOS+15)
   0661: LDA  02 0043     Load addr G67
   0664: SLDC 04          Short load constant 4
   0665: SLDC 00          Short load constant 0
   0666: LDP              Load packed field (TOS)
   0667: SLDC 00          Short load constant 0
   0668: NEQI             Integer TOS-1 <> TOS
   0669: LAND             Logical AND (TOS & TOS-1)
   066a: FJP  $0676       Jump if TOS false
   066c: SLDL 08          Short load local MP8
   066d: INC  000c        Inc field ptr (TOS+12)
   066f: LDA  02 0043     Load addr G67
   0672: MOV  0001        Move 1 words (TOS to TOS-1)
   0674: UJP  $0681       Unconditional jump
-> 0676: SLDL 08          Short load local MP8
   0677: INC  000c        Inc field ptr (TOS+12)
   0679: SLDL 05          Short load local MP5
   067a: SLDL 04          Short load local MP4
   067b: IXA  000d        Index array (TOS-1 + TOS * 13)
   067d: INC  000c        Inc field ptr (TOS+12)
   067f: MOV  0001        Move 1 words (TOS to TOS-1)
-> 0681: SLDL 08          Short load local MP8
   0682: INC  0001        Inc field ptr (TOS+1)
   0684: SLDL 08          Short load local MP8
   0685: SIND 00          Short index load *TOS+0
   0686: SLDL 07          Short load local MP7
   0687: IND  000c        Static index and load word (TOS+12)
   0689: ADI              Add integers (TOS + TOS-1)
   068a: STO              Store indirect (TOS into TOS-1)
   068b: SLDL 07          Short load local MP7
   068c: IND  001d        Static index and load word (TOS+29)
   068e: FJP  $0697       Jump if TOS false
   0690: SLDL 08          Short load local MP8
   0691: INC  000b        Inc field ptr (TOS+11)
   0693: SLDL 07          Short load local MP7
   0694: IND  001e        Static index and load word (TOS+30)
   0696: STO              Store indirect (TOS into TOS-1)
-> 0697: SLDL 07          Short load local MP7
   0698: INC  0012        Inc field ptr (TOS+18)
   069a: SLDC 0c          Short load constant 12
   069b: SLDC 04          Short load constant 4
   069c: SLDC 00          Short load constant 0
   069d: STP              Store packed field (TOS into TOS-1)
   069e: SLDL 07          Short load local MP7
   069f: INC  000f        Inc field ptr (TOS+15)
   06a1: SLDC 00          Short load constant 0
   06a2: STO              Store indirect (TOS into TOS-1)
   06a3: SLDL 05          Short load local MP5
   06a4: SLDL 04          Short load local MP4
   06a5: IXA  000d        Index array (TOS-1 + TOS * 13)
   06a7: SLDL 07          Short load local MP7
   06a8: INC  0010        Inc field ptr (TOS+16)
   06aa: MOV  000d        Move 13 words (TOS to TOS-1)
-> 06ac: SLDL 07          Short load local MP7
   06ad: SIND 07          Short index load *TOS+7
   06ae: SLDL 05          Short load local MP5
   06af: CXP  00 1f       Call external procedure PASCALSY.31
-> 06b2: SLDL 01          Short load local MP1
   06b3: SLDC 02          Short load constant 2
   06b4: EQUI             Integer TOS-1 = TOS
   06b5: FJP  $06cc       Jump if TOS false
   06b7: SLDL 07          Short load local MP7
   06b8: INC  0013        Inc field ptr (TOS+19)
   06ba: SLDC 00          Short load constant 0
   06bb: LDB              Load byte at byte ptr TOS-1 + TOS
   06bc: SLDC 00          Short load constant 0
   06bd: EQUI             Integer TOS-1 = TOS
   06be: FJP  $06cc       Jump if TOS false
   06c0: LDA  02 007e     Load addr G126
   06c3: SLDL 07          Short load local MP7
   06c4: SIND 07          Short index load *TOS+7
   06c5: IXA  0006        Index array (TOS-1 + TOS * 6)
   06c7: LSA  00          Load string address: ''
   06c9: NOP              No operation
   06ca: SAS  07          String assign (TOS to TOS-1, 7 chars)
-> 06cc: SLDL 07          Short load local MP7
   06cd: INC  0002        Inc field ptr (TOS+2)
   06cf: SLDC 01          Short load constant 1
   06d0: STO              Store indirect (TOS into TOS-1)
   06d1: SLDL 07          Short load local MP7
   06d2: INC  0001        Inc field ptr (TOS+1)
   06d4: SLDC 01          Short load constant 1
   06d5: STO              Store indirect (TOS into TOS-1)
   06d6: SLDL 07          Short load local MP7
   06d7: INC  0005        Inc field ptr (TOS+5)
   06d9: SLDC 00          Short load constant 0
   06da: STO              Store indirect (TOS into TOS-1)
-> 06db: RNP  00          Return from nonbase procedure
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
-> 06f6: NOP              No operation
   06f7: LSA  01          Load string address: ' '
   06fa: SLDL 03          Short load local MP3
   06fb: SLDC 00          Short load constant 0
   06fc: SLDC 00          Short load constant 0
   06fd: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0700: STL  0005        Store TOS into MP5
-> 0702: SLDL 05          Short load local MP5
   0703: SLDC 00          Short load constant 0
   0704: GRTI             Integer TOS-1 > TOS
   0705: FJP  $071b       Jump if TOS false
   0707: SLDL 03          Short load local MP3
   0708: SLDL 05          Short load local MP5
   0709: SLDC 01          Short load constant 1
   070a: CXP  00 1a       Call external procedure PASCALSY.SDELETE
   070d: LSA  01          Load string address: ' '
   0710: NOP              No operation
   0711: SLDL 03          Short load local MP3
   0712: SLDC 00          Short load constant 0
   0713: SLDC 00          Short load constant 0
   0714: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0717: STL  0005        Store TOS into MP5
   0719: UJP  $0702       Unconditional jump
-> 071b: SLDL 03          Short load local MP3
   071c: SLDC 00          Short load constant 0
   071d: LDB              Load byte at byte ptr TOS-1 + TOS
   071e: STL  0004        Store TOS into MP4
   0720: SLDL 04          Short load local MP4
   0721: SLDC 00          Short load constant 0
   0722: GRTI             Integer TOS-1 > TOS
   0723: FJP  $0822       Jump if TOS false
   0725: SLDL 03          Short load local MP3
   0726: SLDL 04          Short load local MP4
   0727: LDB              Load byte at byte ptr TOS-1 + TOS
   0728: SLDC 2e          Short load constant 46
   0729: NEQI             Integer TOS-1 <> TOS
   072a: FJP  $081c       Jump if TOS false
   072c: LLA  0006        Load local address MP6
   072e: NOP              No operation
   072f: LSA  00          Load string address: ''
   0731: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0733: LLA  001e        Load local address MP30
   0735: LLA  0006        Load local address MP6
   0737: SAS  05          String assign (TOS to TOS-1, 5 chars)
   0739: LSA  01          Load string address: '['
   073c: NOP              No operation
   073d: SLDL 03          Short load local MP3
   073e: SLDC 00          Short load constant 0
   073f: SLDC 00          Short load constant 0
   0740: CXP  00 1b       Call external procedure PASCALSY.SPOS
   0743: STL  0005        Store TOS into MP5
   0745: SLDL 05          Short load local MP5
   0746: SLDC 00          Short load constant 0
   0747: GRTI             Integer TOS-1 > TOS
   0748: FJP  $0767       Jump if TOS false
   074a: SLDL 03          Short load local MP3
   074b: SLDC 00          Short load constant 0
   074c: LDB              Load byte at byte ptr TOS-1 + TOS
   074d: SLDL 05          Short load local MP5
   074e: SBI              Subtract integers (TOS-1 - TOS)
   074f: SLDC 01          Short load constant 1
   0750: ADI              Add integers (TOS + TOS-1)
   0751: STL  0004        Store TOS into MP4
   0753: LLA  0006        Load local address MP6
   0755: SLDL 03          Short load local MP3
   0756: LLA  0021        Load local address MP33
   0758: SLDL 05          Short load local MP5
   0759: SLDL 04          Short load local MP4
   075a: CXP  00 19       Call external procedure PASCALSY.SCOPY
   075d: LLA  0021        Load local address MP33
   075f: SAS  28          String assign (TOS to TOS-1, 40 chars)
   0761: SLDL 03          Short load local MP3
   0762: SLDL 05          Short load local MP5
   0763: SLDL 04          Short load local MP4
   0764: CXP  00 1a       Call external procedure PASCALSY.SDELETE
-> 0767: SLDL 03          Short load local MP3
   0768: SLDC 00          Short load constant 0
   0769: LDB              Load byte at byte ptr TOS-1 + TOS
   076a: STL  0004        Store TOS into MP4
   076c: SLDL 04          Short load local MP4
   076d: SLDC 00          Short load constant 0
   076e: GRTI             Integer TOS-1 > TOS
   076f: FJP  $0803       Jump if TOS false
   0771: SLDL 03          Short load local MP3
   0772: SLDL 04          Short load local MP4
   0773: LDB              Load byte at byte ptr TOS-1 + TOS
   0774: SLDC 3a          Short load constant 58
   0775: NEQI             Integer TOS-1 <> TOS
   0776: FJP  $0803       Jump if TOS false
   0778: SLDL 02          Short load local MP2
   0779: FJP  $0789       Jump if TOS false
   077b: LLA  001b        Load local address MP27
   077d: LSA  05          Load string address: '.TEXT'
   0784: NOP              No operation
   0785: SAS  05          String assign (TOS to TOS-1, 5 chars)
   0787: UJP  $0795       Unconditional jump
-> 0789: LLA  001b        Load local address MP27
   078b: LSA  05          Load string address: '.CODE'
   0792: NOP              No operation
   0793: SAS  05          String assign (TOS to TOS-1, 5 chars)
-> 0795: SLDC 01          Short load constant 1
   0796: STL  0005        Store TOS into MP5
   0798: SLDL 04          Short load local MP4
   0799: STL  0021        Store TOS into MP33
-> 079b: SLDL 05          Short load local MP5
   079c: LDL  0021        Load local word MP33
   079e: LEQI             Integer TOS-1 <= TOS
   079f: FJP  $07c9       Jump if TOS false
   07a1: SLDL 03          Short load local MP3
   07a2: SLDL 05          Short load local MP5
   07a3: LDB              Load byte at byte ptr TOS-1 + TOS
   07a6: LDC  08          Load multiple-word constant
                         07fffffe000000000000000000000000
   07b6: SLDC 08          Short load constant 8
   07b7: INN              Set membership (TOS-1 in set TOS)
   07b8: FJP  $07c2       Jump if TOS false
   07ba: SLDL 03          Short load local MP3
   07bb: SLDL 05          Short load local MP5
   07bc: SLDL 03          Short load local MP3
   07bd: SLDL 05          Short load local MP5
   07be: LDB              Load byte at byte ptr TOS-1 + TOS
   07bf: SLDC 20          Short load constant 32
   07c0: SBI              Subtract integers (TOS-1 - TOS)
   07c1: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 07c2: SLDL 05          Short load local MP5
   07c3: SLDC 01          Short load constant 1
   07c4: ADI              Add integers (TOS + TOS-1)
   07c5: STL  0005        Store TOS into MP5
   07c7: UJP  $079b       Unconditional jump
-> 07c9: SLDL 04          Short load local MP4
   07ca: SLDC 05          Short load constant 5
   07cb: GRTI             Integer TOS-1 > TOS
   07cc: FJP  $07e0       Jump if TOS false
   07ce: LLA  001e        Load local address MP30
   07d0: SLDL 03          Short load local MP3
   07d1: LLA  0021        Load local address MP33
   07d3: SLDL 04          Short load local MP4
   07d4: SLDC 05          Short load constant 5
   07d5: SBI              Subtract integers (TOS-1 - TOS)
   07d6: SLDC 01          Short load constant 1
   07d7: ADI              Add integers (TOS + TOS-1)
   07d8: SLDC 05          Short load constant 5
   07d9: CXP  00 19       Call external procedure PASCALSY.SCOPY
   07dc: LLA  0021        Load local address MP33
   07de: SAS  05          String assign (TOS to TOS-1, 5 chars)
-> 07e0: LLA  001e        Load local address MP30
   07e2: LLA  001b        Load local address MP27
   07e4: NEQSTR           String TOS-1 <> TOS
   07e6: SLDL 04          Short load local MP4
   07e7: LLA  0006        Load local address MP6
   07e9: SLDC 00          Short load constant 0
   07ea: LDB              Load byte at byte ptr TOS-1 + TOS
   07eb: ADI              Add integers (TOS + TOS-1)
   07ec: SLDL 01          Short load local MP1
   07ed: SLDC 05          Short load constant 5
   07ee: SBI              Subtract integers (TOS-1 - TOS)
   07ef: LEQI             Integer TOS-1 <= TOS
   07f0: LAND             Logical AND (TOS & TOS-1)
   07f1: FJP  $0803       Jump if TOS false
   07f3: LLA  001b        Load local address MP27
   07f5: SLDC 01          Short load constant 1
   07f6: SLDL 03          Short load local MP3
   07f7: SLDL 04          Short load local MP4
   07f8: SLDC 01          Short load constant 1
   07f9: ADI              Add integers (TOS + TOS-1)
   07fa: SLDC 05          Short load constant 5
   07fb: CSP  02          Call standard procedure MOVL
   07fd: SLDL 03          Short load local MP3
   07fe: SLDC 00          Short load constant 0
   07ff: SLDL 04          Short load local MP4
   0800: SLDC 05          Short load constant 5
   0801: ADI              Add integers (TOS + TOS-1)
   0802: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0803: SLDL 03          Short load local MP3
   0804: SLDC 00          Short load constant 0
   0805: STL  0021        Store TOS into MP33
   0807: LLA  0021        Load local address MP33
   0809: SLDL 03          Short load local MP3
   080a: SLDC 50          Short load constant 80
   080b: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   080e: LLA  0021        Load local address MP33
   0810: LLA  0006        Load local address MP6
   0812: SLDC 78          Short load constant 120
   0813: CXP  00 17       Call external procedure PASCALSY.SCONCAT
   0816: LLA  0021        Load local address MP33
   0818: SAS  50          String assign (TOS to TOS-1, 80 chars)
   081a: UJP  $0822       Unconditional jump
-> 081c: SLDL 03          Short load local MP3
   081d: SLDC 00          Short load constant 0
   081e: SLDL 04          Short load local MP4
   081f: SLDC 01          Short load constant 1
   0820: SBI              Subtract integers (TOS-1 - TOS)
   0821: STB              Store byte at TOS to byte ptr TOS-2 + TOS-1
-> 0822: RNP  00          Return from nonbase procedure
END

