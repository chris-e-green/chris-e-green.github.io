### PROCEDURE PASCALCOMPILER.IDSEARCH(SYMCURSOR:0..1023; SYMBUF:PACKED ARRAY[0..1023] OF CHAR) (* P=2, LL=0, D=0 *)
; ASSEMBLER PROCEDURE
-> 11f2: 68      PLA
   11f3: 85 7e   STA $7e {ReturnLo}
   11f5: 68      PLA
   11f6: 85 7f   STA $7f {ReturnHi}
   11f8: 68      PLA	 {lo}
   11f9: a8      TAY	 Y={symcursorLo}
   11fa: 68      PLA     {hi}
   11fb: aa      TAX	 X={symcursorHi}
   11fc: 68      PLA     {lo}
   11fd: 85 94   STA $94 {symbufLo}
   11ff: 68      PLA 	 {hi}
   1200: 85 95   STA $95 {symbufHi}
   1202: 98      TYA	 A=symcursorLo
   1203: a0 00   LDY #$00    ; Y=0
   1205: 18      CLC
   1206: 71 94   ADC ($94),Y ; add symcursorLo to symbuf[0]
   1208: 85 96   STA $96     ; store in tempLo
   120a: 8a      TXA	     ; A=symcursorHi
   120b: c8      INY	     ; Y=1
   120c: 71 94   ADC ($94),Y ; add symcursorHi to symbuf[1]
   120e: 85 97   STA $97     ; store in tempHi
; clear buffer at $88-$8f to ' '
   1210: a9 20   LDA #$20
   1212: a2 07   LDX #$07
-> 1214: 95 88   STA $88,X   ; set buffer[0-7]=' '
   1216: ca      DEX
   1217: d0 1214 BNE $1214 {$FB}
; store uppercased temp[0] to buffer[0]
   1219: 88      DEY		; Y=0
   121a: b1 96   LDA ($96),Y	; get temp[0]
   121c: c9 61   CMP #$61	; 'a'
   121e: 90 1227 BCC $1227 {$07}
   1220: c9 7b   CMP #$7b	; 'z'+1
   1222: b0 1227 BCS $1227 {$03}
   1224: 38      SEC
   1225: e9 20   SBC #$20	; ' '
-> 1227: 85 88   STA $88	; buffer[0]=upper(temp[0])
; next char
-> 1229: c8      INY
   122a: b1 96   LDA ($96),Y 	; get temp[Y]
   122c: c9 7b   CMP #$7b	; 'z'+1
   122e: b0 1234 BCS $1234 {$04} ; A >= 'z'+1, keep checking
   1230: c9 61   CMP #$61	; 'a'
   1232: b0 124a BCS $124a {$16} ; 'a' <= A <= 'z', make uppercase
-> 1234: c9 30   CMP #$30	; '0'
   1236: 90 123c BCC $123c {$04} ; A < '0', keep checking
   1238: c9 3a   CMP #$3a	; '9'+1
   123a: 90 124c BCC $124c {$10} ; '0' >= A >= '9', leave alone
-> 123c: c9 41   CMP #$41	; 'A'
   123e: 90 1255 BCC $1255 {$15} ; A < 'A', finished
   1240: c9 5b   CMP #$5b	; 'Z'+1
   1242: 90 124c BCC $124c {$08} ; A >= 'A', A < 'Z'+1, keep 
   1244: c9 5f   CMP #$5f	; '_' 
   1246: d0 1255 BNE $1255 {$0d} ; not underscore, finished
   1248: f0 1229 BEQ $1229 {$df} ; underscore, next char
; make uppercase
-> 124a: e9 20   SBC #$20
; store char in buffer[X]
-> 124c: e8      INX
   124d: e0 08   CPX #$08
   124f: b0 1229 BCS $1229 {$d8} ; X >= 8, loop
   1251: 95 88   STA $88,X 	; buffer[X]=char
   1253: 90 1229 BCC $1229 {$d4} ; loop
; finished copying
-> 1255: 88      DEY 		; Y=chars_copied-1
   1256: 98      TYA		; A=chars_copied-1
   1257: a0 00   LDY #$00	; Y=0
   1259: 18      CLC
   125a: 71 94   ADC ($94),Y	; add chars copied to symbuf[0]
   125c: 91 94   STA ($94),Y	; store in symbuf[0]
   125e: c8      INY		; Y=1
   125f: b1 94   LDA ($94),Y	; get symbuf[0]_high
   1261: 69 00   ADC #$00	; add carry
   1263: 91 94   STA ($94),Y	; update symbuf[0]_high
   1265: a5 88   LDA $88	; A=buffer[0]
   1267: 0a      ASL A		; double it
   1268: a8      TAY		; Y=buffer[0]*2
   1269: b9 125e LDA $125e,Y {$006c} ; alpha_index_low
   126c: 85 92   STA $92	; curr_index_lo
   126e: b9 125f LDA $125f,Y {$006d}
   1271: 85 93   STA $93	; curr_index_hi
   1273: a0 00   LDY #$00
   1275: b1 92   LDA ($92),Y	; curr_index[0]
   1277: 85 90   STA $90	; entry_count
-> 1279: a2 00   LDX #$00	; X=0
   127b: a0 01   LDY #$01	; Y=1
-> 127d: e8      INX		; X=1
   127e: c8      INY		; Y=2
   127f: b1 92   LDA ($92),Y	; curr_index[Y]
   1281: d5 88   CMP $88,X	; matches buffer[X]?
   1283: f0 1296 BEQ $1296 {$11} ; yes
   1285: c6 90   DEC $90	; reduce entry_count
   1287: f0 12bb BEQ $12bb {$32} ; if 0, not found
   1289: a5 92   LDA $92	; get curr_index_lo
   128b: 18      CLC
   128c: 69 0a   ADC #$0a	; add 10
   128e: 85 92   STA $92	; update curr_index_lo
   1290: 90 1294 BCC $1294 {$02} ; if didn't carry
   1292: e6 93   INC $93	; carry, inc curr_index_hi
-> 1294: d0 1279 BNE $1279 {$e3} ; search next entry
-> 1296: e0 07   CPX #$07	; matched, if not checked all, 
   1298: d0 127d BNE $127d {$e3} ; ... check next
   129a: c8      INY		; checked all
   129b: b1 92   LDA ($92),Y	; get val after identifier
   129d: 85 86   STA $86	; store in token_lo
   129f: c8      INY		; get next val
   12a0: b1 92   LDA ($92),Y	; 
   12a2: 85 87   STA $87	; store in token_hi
   12a4: a0 02   LDY #$02	; Y=2
   12a6: a5 86   LDA $86	; A=token_lo
   12a8: 91 94   STA ($94),Y	; symbuf[2]=token_lo
   12aa: c8      INY		; Y=3
   12ab: a9 00   LDA #$00	; A=0
   12ad: 91 94   STA ($94),Y	; symbuf[3]=0
   12af: c8      INY		; Y=4
   12b0: a5 87   LDA $87	; A=token_hi
   12b2: 91 94   STA ($94),Y	; symbuf[4]=token_hi
   12b4: c8      INY		; Y=5
   12b5: a9 00   LDA #$00	; A=0
   12b7: 91 94   STA ($94),Y	; symbuf[5]=0
   12b9: f0 12d9 BEQ $12d9 {$1e}; jump to return
; not found
-> 12bb: a9 00   LDA #$00	; A=0
   12bd: a0 02   LDY #$02	; Y=2
   12bf: 91 94   STA ($94),Y	; symbuf[2]=0
   12c1: c8      INY		; Y=3
   12c2: 91 94   STA ($94),Y	; symbuf[3]=0
   12c4: c8      INY		; Y=4
   12c5: c8      INY		; Y=5
   12c6: 91 94   STA ($94),Y	; symbuf[5]=0
   12c8: 88      DEY		; Y=4
   12c9: a9 15   LDA #$15	; A=$15
   12cb: 91 94   STA ($94),Y	; symbuf[4]=$15
   12cd: a0 0e   LDY #$0e	; Y=$0e
   12cf: a2 07   LDX #$07	; X=7
-> 12d1: 88      DEY		; Y=$0d
   12d2: b5 88   LDA $88,X	; A=buffer[X]
   12d4: 91 94   STA ($94),Y	; symbuf[6-13]=buffer[0-7]
   12d6: ca      DEX		; X=6
   12d7: 10 12d1 BPL $12d1 {$f8} ; loop until 8 copied
; return
-> 12d9: a5 7f   LDA $7f {ReturnHigh}
   12db: 48      PHA
   12dc: a5 7e   LDA $7e {ReturnLow}
   12de: 48      PHA
   12df: 60      RTS {TODO:why/how is this being inserted at $12d0...}

   12e0:  {A} *1317 {B} *132c {C} *1337 {D} *134c - {E} *136b {F} *138a {G} *13b3 {H} *1314 
   12f0:  {I} *13be {J} *1314 {K} *1314 {L} *13e7 - {M} *13f2 {N} *13fd {O} *1408 {P} *1427
   1300:  {Q} *1314 {R} *1446 {S} *145b {T} *1470 - {U} *148f {V} *14ae {W} *14b9 {X} *1314
   1310:  {Y} *1314 {Z} *1314 
   1314:  01 '@' 23
   1317:  02 'AND     ' 27 02
   1321:     'ARRAY   ' 2c 00 
   132c:  01 'BEGIN   ' 13 00 
   1337:  02 'CASE    ' 15 00 
   1342:     'CONST   ' 1c 00 
   134c:  03 'DO      ' 06 00
   1350:     'DIV     ' 27 03
   1360:     'DOWNTO  ' 08 00 
   136b:  03 'END     ' 09 00
   1370:     'ELSE    ' 0d 00 
   1380:     'EXTERNAL' 35 00 
   138a:  04 'FOR     ' 18 00
   1390:     'FUNCTION' 20 00
   139f:     'FILE    ' 2e 00
   13a0:     'FORWARD ' 22 00 
   13b3:  01 'GOTO    ' 1a 00
   13be:  04 'IF      ' 14 00
   13c0:     'IN      ' 29 0e 
   13d0:     'IMPLEMEN' 34 00 
   13dd:     'INTERFAC' 33 00
   13e7:  01 'LABEL   ' 1b 00
   13f2:  01 'MOD     ' 27 04
   13fd:  01 'NOT     ' 26 00
   1408:  03 'OF      ' 0b 00
   1413:     'OR      ' 28 07
   141d:     'OTHERWIS' 36 00
   1427:  03 'PROCEDUR' 1f 00
   1432:     'PACKED  ' 2b 00
   143c:     'PROGRAM ' 21 00
   1446:  02 'REPEAT  ' 16 00
   1450:     'RECORD  ' 2d 00
   145b:  02 'SET     ' 2a 00
   1466:     'SEGMENT ' 21 00
   1470:  03 'THEN    ' 0c 00
   147b:     'TO      ' 07 00
   1485:     'TYPE    ' 1d 00
   148f:  03 'UNTIL   ' 0a 00
   149a:     'USES    ' 31 00
   14a4:     'UNIT    ' 32 00
   14ae:  01 'VAR     ' 1e 00
   14b9:  02 'WHILE   ' 17 00
   14c0:     'WITH    ' 19 00 
END

   'DO      ' 06 00 (6)
   'TO      ' 07 00 (7)
   'DOWNTO  ' 08 00 (8)
   'END     ' 09 00 (9)
   'UNTIL   ' 0a 00 (10)
   'OF      ' 0b 00 (11)
   'THEN    ' 0c 00 (12)
   'ELSE    ' 0d 00 (13)
   'BEGIN   ' 13 00 (19)
   'IF      ' 14 00 (20)
   'CASE    ' 15 00 (21)
   'REPEAT  ' 16 00 (22)
   'WHILE   ' 17 00 (23)
   'FOR     ' 18 00 (24)
   'WITH    ' 19 00 (25)
   'GOTO    ' 1a 00 (26)
   'LABEL   ' 1b 00 (27)
   'CONST   ' 1c 00 (28)
   'TYPE    ' 1d 00 (29)
   'VAR     ' 1e 00 (30)
   'PROCEDUR' 1f 00 (31)
   'FUNCTION' 20 00 (32)
   'PROGRAM ' 21 00 (33)
   'SEGMENT ' 21 00 (33)
   'FORWARD ' 22 00 (34)
   '@'        23    (35)
   'NOT     ' 26 00 (38)
   'AND     ' 27 02 (39,2)
   'DIV     ' 27 03 (39,3)
   'MOD     ' 27 04 (39,4)
   'OR      ' 28 07 (40,7)
   'IN      ' 29 0e (41,14)
   'SET     ' 2a 00 (42)
   'PACKED  ' 2b 00 (43)
   'ARRAY   ' 2c 00 (44)
   'RECORD  ' 2d 00 (45)
   'FILE    ' 2e 00 (46)
   'USES    ' 31 00 (49)
   'UNIT    ' 32 00 (50)
   'INTERFAC' 33 00 (51)
   'IMPLEMEN' 34 00 (52)
   'EXTERNAL' 35 00 (53)
   'OTHERWIS' 36 00 (54)
