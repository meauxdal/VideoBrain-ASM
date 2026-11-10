;VideoBrain Expander I ROM
;F3870, cassette interface, serial ports for modem and printer

;it looks like some code was left over when they made the ROM mask
;for example, $5b7 references $C00 and $12F8, outside of the address space

;there are refences to RAM, video regs and valid subroutines in the RES1 and RES2 ROMs, but the Expander
;was connected via an I/O port, so they do not share memory space
;maybe code is copied to the VB RAM and executed?
;probably not; just left over garbage

;uses interrupts -  vectors maybe 47b/4eb?


Reset:          DI                       ; 0000 1a
                LR   J,W                 ; 0001 1e
                LIS  $0                  ; 0002 70
                LR   $0,A                ; 0003 50
                OUTS 0                   ; 0004 b0
                OUTS 1                   ; 0005 b1
                LR   $1,A                ; 0006 51
                PI   A0562               ; 0007 28 05 62
                BF   $0,A0021            ; 000a 90 16		;always branch

				db   $00,$00,$00,$00,$00,$00			;is this ever referenced?
				db   $70,$56,$57,$b0,$78,$b1,$b2,$a0
				db   $21,$80,$84,$10,$20,$10,$0d

A0021:          LIS  $0                  ; 0021 70
                OUTS 6                   ; 0022 b6		;disable interrupts
                LIS  $1                  ; 0023 71
                OUTS 4                   ; 0024 b4
                OUTS 5                   ; 0025 b5
                LIS  $0                  ; 0026 70
                OUTS 1                   ; 0027 b1
A0028:          INS  1                   ; 0028 a1
                NI   $81                 ; 0029 21 81
                CI   $80                 ; 002b 25 80
                BF   $4,A0028            ; 002d 94 fa
                LI   $91                 ; 002f 20 91	;little time delay
A0031:          INC                      ; 0031 1f
                BF   $4,A0031            ; 0032 94 fe
                LISU 2                   ; 0034 62
                LISL 0                   ; 0035 68
                PI   A00b3               ; 0036 28 00 b3	;read a byte
                LR   (IS)+,A             ; 0039 5d			;store it
                AI   $ff                 ; 003a 24 ff		
                CI   $05                 ; 003c 25 05
                BF   $2,A007c            ; 003e 92 3d
                CI   $04                 ; 0040 25 04
                BF   $2,A0054            ; 0042 92 11
                CI   $02                 ; 0044 25 02
                BF   $2,A004c            ; 0046 92 05
                PI   A00b3               ; 0048 28 00 b3
                LR   (IS)+,A             ; 004b 5d
A004c:          PI   A00b3               ; 004c 28 00 b3
                LR   (IS)+,A             ; 004f 5d
                PI   A00b3               ; 0050 28 00 b3
                LR   (IS)+,A             ; 0053 5d
A0054:          DCI  A0085               ; 0054 2a 00 85
                LISL 0                   ; 0057 68
                LR   A,(IS)              ; 0058 4c
                SL   1                   ; 0059 13
                SL   1                   ; 005a 13
                ADC                      ; 005b 8e
                LM                       ; 005c 16
                LR   QU,A                ; 005d 06
                LM                       ; 005e 16
                LR   QL,A                ; 005f 07
                LM                       ; 0060 16
                LR   $a,A                ; 0061 5a
                LM                       ; 0062 16
                LR   $b,A                ; 0063 5b
                LR   DC,H                ; 0064 10
                LISL 1                   ; 0065 69
                LR   A,(IS)              ; 0066 4c
                SL   1                   ; 0067 13
                ADC                      ; 0068 8e
                LISL 6                   ; 0069 6e
                LM                       ; 006a 16
                LR   (IS)+,A             ; 006b 5d
                LM                       ; 006c 16
                LR   (IS),A              ; 006d 5c
                LISL 0                   ; 006e 68
                LR   A,(IS)              ; 006f 4c
                SL   1                   ; 0070 13
                DCI  A00a5               ; 0071 2a 00 a5
                ADC                      ; 0074 8e
                LM                       ; 0075 16
                LR   KU,A                ; 0076 04
                LM                       ; 0077 16
                LR   KL,A                ; 0078 05
                PK                       ; 0079 0c

                BF   $0,A0080            ; 007a 90 05	;always branch

A007c:          LR   A,$0                ; 007c 40
                OI   $04                 ; 007d 22 04
                LR   $0,A                ; 007f 50
A0080:          PI   A0528               ; 0080 28 05 28
                LIS  $0                  ; 0083 70
A0084:          INC                      ; 0084 1f
A0085:          BF   $4,A0084            ; 0085 94 fe
                BF   $0,A0021            ; 0087 90 99	;always branch

                LR   A,QL                ; 0089 03
                BT   5,0                 ; 008a 85 00
                BF   $7,A008e            ; 008c 97 01
A008e:          INS  0                   ; 008e a0
                LR   A,KU                ; 008f 00
                BF   $b,A0094            ; 0090 9b 03
                BT   5,0                 ; 0092 85 00
A0094:          BF   $7,4                ; 0094 97 04
                DI                       ; 0096 1a
                LR   A,KU                ; 0097 00
                BF   $f,44               ; 0098 9f 2c
                AS   $0                  ; 009a c0
                LR   $8,A                ; 009b 58
                LR   (IS),A              ; 009c 5c
                LR   $8,A                ; 009d 58
                AS   $0                  ; 009e c0
                OUTS 1                   ; 009f b1
                LR   (IS),A              ; 00a0 5c
                AM                       ; 00a1 88
                LR   A,KU                ; 00a2 00
                DS   $1                  ; 00a3 31
                LR   A,KU                ; 00a4 00
A00a5:          PK                       ; 00a5 0c

                LR   A,KU                ; 00a6 00
                LR   A,QU                ; 00a7 02
                LR   W,J                 ; 00a8 1d
                LR   A,KU                ; 00a9 00
                ASD  $4                  ; 00aa d4
                LR   A,QU                ; 00ab 02
                LR   W,J                 ; 00ac 1d
                LR   KU,A                ; 00ad 04
                LR   A,KU                ; 00ae 00
                LR   KU,A                ; 00af 04
                NS   $7                  ; 00b0 f7
                LR   KL,A                ; 00b1 05
                LR   KU,A                ; 00b2 04

;output byte in R4 to port 1 bit 7 one bit at a time, using port 1 bit 1 as data ready flag
;also input byte from port 1 bit 0 one bit at a time, returning byte in R10 and acc with status flags set
A00b3:          LR   K,P                 ; 00b3 08		
                LIS  $0                  ; 00b4 70
                LR   $a,A                ; 00b5 5a		;R10=0
                LIS  $8                  ; 00b6 78		; 8 bits in a byte?
                LR   $b,A                ; 00b7 5b		;R11 is bit index
A00b8:          LR   A,$4                ; 00b8 44		;data in R4
                NI   $80                 ; 00b9 21 80	;isolate MSB
                OI   $02                 ; 00bb 22 02	;turn on bit 1
                OUTS 1                   ; 00bd b1
                NI   $fd                 ; 00be 21 fd	;turn off bit 1
                OUTS 1                   ; 00c0 b1
                LR   A,$4                ; 00c1 44		;shift data 1 bit left
                SL   1                   ; 00c2 13
                LR   $4,A                ; 00c3 54		;and store it back
                LI   $91                 ; 00c4 20 91	;little time delay
A00c6:          INC                      ; 00c6 1f
                BF   $4,A00c6            ; 00c7 94 fe
                INS  1                   ; 00c9 a1		;input byte from port 1
                NI   $01                 ; 00ca 21 01	;isolate LSB
                AS   $a                  ; 00cc ca		;add R10 to acc
                AS   $a                  ; 00cd ca		;add R10 to acc again
                LR   $a,A                ; 00ce 5a		;R10 = acc
                DS   $b                  ; 00cf 3b		;bit index --
                BF   $4,A00b8            ; 00d0 94 e7	;loop if more bits to do
                NS   $a                  ; 00d2 fa		;did 8 bits; set status flags
                PK                       ; 00d3 0c

                LR   K,P                 ; 00d4 08
                PI   A053b               ; 00d5 28 05 3b
                LIS  $0                  ; 00d8 70
                LR   $0,A                ; 00d9 50
                LIS  $2                  ; 00da 72
                OUTS 0                   ; 00db b0
                LR   $1,A                ; 00dc 51
A00dd:          LISU 2                   ; 00dd 62
                LISL 2                   ; 00de 6a
                DS   (IS)+               ; 00df 3d
                BF   $2,A014c            ; 00e0 92 6b
                LR   A,(IS)              ; 00e2 4c
                LR   $6,A                ; 00e3 56
A00e4:          DS   $6                  ; 00e4 36
                BF   $2,A00f3            ; 00e5 92 0d
                LI   $26                 ; 00e7 20 26
                LR   $b,A                ; 00e9 5b
                LIS  $0                  ; 00ea 70
A00eb:          INC                      ; 00eb 1f
                BF   $4,A00eb            ; 00ec 94 fe
                DS   $b                  ; 00ee 3b
                BF   $4,A00eb            ; 00ef 94 fb
                BF   $0,A00e4            ; 00f1 90 f2 ;always branch

A00f3:          LIS  $0                  ; 00f3 70
                LR   $5,A                ; 00f4 55
                LI   $10                 ; 00f5 20 10
                LR   $6,A                ; 00f7 56
A00f8:          LI   $ff                 ; 00f8 20 ff
                LR   $4,A                ; 00fa 54
                PI   A0155               ; 00fb 28 01 55
                DS   $6                  ; 00fe 36
                BF   $4,A00f8            ; 00ff 94 f8
                LIS  $1                  ; 0101 71
                LR   $4,A                ; 0102 54
                PI   A0155               ; 0103 28 01 55
                LIS  $2                  ; 0106 72
                LR   $5,A                ; 0107 55
                LI   $cd                 ; 0108 20 cd
                LR   $4,A                ; 010a 54
                PI   A0155               ; 010b 28 01 55
                LIS  $0                  ; 010e 70
                LR   $2,A                ; 010f 52
                LR   $3,A                ; 0110 53
                PI   A0155               ; 0111 28 01 55
                LR   $6,A                ; 0114 56
                PI   A0513               ; 0115 28 05 13
                PI   A0155               ; 0118 28 01 55
                LR   $7,A                ; 011b 57
                PI   A0513               ; 011c 28 05 13
A011f:          DS   $7                  ; 011f 37
                BT   2,A0125             ; 0120 82 04
                DS   $6                  ; 0122 36
                BF   $2,A012d            ; 0123 92 09
A0125:          PI   A0155               ; 0125 28 01 55
                PI   A0513               ; 0128 28 05 13
                BF   $0,A011f            ; 012b 90 f3	;always branch

A012d:          PI   A0155               ; 012d 28 01 55
                XS   $2                  ; 0130 e2
                BT   4,A0137             ; 0131 84 05
                LR   A,$0                ; 0133 40
                OI   $02                 ; 0134 22 02
                LR   $0,A                ; 0136 50
A0137:          LIS  $5                  ; 0137 75
                LR   $5,A                ; 0138 55
                PI   A0155               ; 0139 28 01 55
                XS   $3                  ; 013c e3
                BT   4,A0143             ; 013d 84 05
                LR   A,$0                ; 013f 40
                OI   $02                 ; 0140 22 02
                LR   $0,A                ; 0142 50
A0143:          LIS  $8                  ; 0143 78
                LR   $5,A                ; 0144 55
                LIS  $0                  ; 0145 70
                LR   $4,A                ; 0146 54
                PI   A0155               ; 0147 28 01 55
                BF   $0,A00dd            ; 014a 90 92	;always branch


A014c:          LI   $fd                 ; 014c 20 fd
                NS   $1                  ; 014e f1
                OUTS 0                   ; 014f b0
                LR   $1,A                ; 0150 51
                PI   A054e               ; 0151 28 05 4e
                PK                       ; 0154 0c

A0155:          LR   K,P                 ; 0155 08
                PI   A053b               ; 0156 28 05 3b
                LIS  $0                  ; 0159 70
                LR   $a,A                ; 015a 5a
                LIS  $2                  ; 015b 72
                OUTS 5                   ; 015c b5
                LIS  $0                  ; 015d 70
                OUTS 5                   ; 015e b5
                LIS  $7                  ; 015f 77
                LR   $b,A                ; 0160 5b
A0161:          LR   A,$4                ; 0161 44
                SR   1                   ; 0162 12
                SR   1                   ; 0163 12
                SR   1                   ; 0164 12
                SR   4                   ; 0165 14
                LR   $8,A                ; 0166 58
                PI   A0194               ; 0167 28 01 94
                AS   $a                  ; 016a ca
                AS   $a                  ; 016b ca
                LR   $a,A                ; 016c 5a
                LR   A,$4                ; 016d 44
                SL   1                   ; 016e 13
                LR   $4,A                ; 016f 54
                DS   $b                  ; 0170 3b
                BF   $4,A0161            ; 0171 94 ef
                LR   A,$5                ; 0173 45
                CI   $02                 ; 0174 25 02
                BT   4,A0180             ; 0176 84 09
                CI   $05                 ; 0178 25 05
                BT   4,A0180             ; 017a 84 05
                CI   $08                 ; 017c 25 08
                BF   $4,A0182            ; 017e 94 03
A0180:          INC                      ; 0180 1f
                LR   $5,A                ; 0181 55
A0182:          LR   A,$4                ; 0182 44
                SR   1                   ; 0183 12
                SR   1                   ; 0184 12
                SR   1                   ; 0185 12
                SR   4                   ; 0186 14
                LR   $8,A                ; 0187 58
                PI   A0194               ; 0188 28 01 94
                AS   $a                  ; 018b ca
                AS   $a                  ; 018c ca
                LR   $a,A                ; 018d 5a
                PI   A054e               ; 018e 28 05 4e
                LIS  $0                  ; 0191 70
                XS   $a                  ; 0192 ea
                PK                       ; 0193 0c

A0194:          LR   K,P                 ; 0194 08
                LIS  $0                  ; 0195 70
                XS   $5                  ; 0196 e5
                BF   $4,A019d            ; 0197 94 05
                LIS  $1                  ; 0199 71
                LR   $5,A                ; 019a 55
                BF   $0,A01a0            ; 019b 90 04	;always branch

A019d:          EI                       ; 019d 1b
A019e:          BF   $0,A019e            ; 019e 90 ff	;sit here until interrupt

A01a0:          LR   A,$5                ; 01a0 45
                CI   $08                 ; 01a1 25 08
                BF   $2,A01ac            ; 01a3 92 08
                LISL 6                   ; 01a5 6e
                LR   A,(IS)              ; 01a6 4c
                OUTS 7                   ; 01a7 b7		;set timer register
                LI   $aa                 ; 01a8 20 aa
                BF   $0,A01ad            ; 01aa 90 02	;always branch

A01ac:          LIS  $0                  ; 01ac 70
A01ad:          OUTS 6                   ; 01ad b6		;disable interrupts
                LR   A,$5                ; 01ae 45
                AI   $fc                 ; 01af 24 fc
                CI   $02                 ; 01b1 25 02
                BF   $2,A01b9            ; 01b3 92 05
                INS  1                   ; 01b5 a1
                NI   $01                 ; 01b6 21 01
                LR   $8,A                ; 01b8 58
A01b9:          LR   A,$5                ; 01b9 45
                AI   $fd                 ; 01ba 24 fd
                CI   $02                 ; 01bc 25 02
                BF   $2,A01c4            ; 01be 92 05
                LIS  $2                  ; 01c0 72
                OUTS 1                   ; 01c1 b1
                LIS  $0                  ; 01c2 70
                OUTS 1                   ; 01c3 b1
A01c4:          LR   A,$5                ; 01c4 45
                CI   $03                 ; 01c5 25 03
                BT   4,A01d1             ; 01c7 84 09
                CI   $06                 ; 01c9 25 06
                BT   4,A01d1             ; 01cb 84 05
                CI   $09                 ; 01cd 25 09
                BF   $4,A01d8            ; 01cf 94 08
A01d1:          INC                      ; 01d1 1f
                CI   $09                 ; 01d2 25 09
                BT   2,A01d7             ; 01d4 82 02
                LIS  $0                  ; 01d6 70
A01d7:          LR   $5,A                ; 01d7 55
A01d8:          LI   $f3                 ; 01d8 20 f3
                NS   $1                  ; 01da f1
                OI   $04                 ; 01db 22 04
                LR   $1,A                ; 01dd 51
                PI   A01f3               ; 01de 28 01 f3
                LISL 7                   ; 01e1 6f
                LR   A,(IS)              ; 01e2 4c
A01e3:          INC                      ; 01e3 1f
                BF   $4,A01e3            ; 01e4 94 fe
                LR   A,$8                ; 01e6 48
                SL   1                   ; 01e7 13
                SL   1                   ; 01e8 13
                AS   $1                  ; 01e9 c1
                AI   $fc                 ; 01ea 24 fc
                LR   $1,A                ; 01ec 51
                PI   A01f3               ; 01ed 28 01 f3
                LIS  $1                  ; 01f0 71
                NS   $8                  ; 01f1 f8
                PK                       ; 01f2 0c

A01f3:          LR   A,$1                ; 01f3 41
                OUTS 0                   ; 01f4 b0
                LISU 2                   ; 01f5 62
                LISL 5                   ; 01f6 6d
                LIS  $4                  ; 01f7 74
                LR   (IS),A              ; 01f8 5c
A01f9:          INS  0                   ; 01f9 a0
                BT   1,A01ff             ; 01fa 81 04
                DS   $4                  ; 01fc 34
                BF   $0,A0202            ; 01fd 90 04	;always branch

A01ff:          NOP                      ; 01ff 2b
                BF   $0,A0202            ; 0200 90 01	;always branch
	
A0202:          DS   (IS)                ; 0202 3c
                BF   $4,A01f9            ; 0203 94 f5
                LIS  $4                  ; 0205 74
                AS   $1                  ; 0206 c1
                NI   $fb                 ; 0207 21 fb
                OUTS 0                   ; 0209 b0
                LIS  $4                  ; 020a 74
                LR   (IS),A              ; 020b 5c
A020c:          INS  0                   ; 020c a0
                BT   1,A0212             ; 020d 81 04
                DS   $4                  ; 020f 34
                BF   $0,A0215            ; 0210 90 04	;always branch

A0212:          NOP                      ; 0212 2b
                BF   $0,A0215            ; 0213 90 01	;always branch

A0215:          DS   (IS)                ; 0215 3c
                BF   $4,A020c            ; 0216 94 f5
                LI   $f3                 ; 0218 20 f3
                NS   $1                  ; 021a f1
                OUTS 0                   ; 021b b0
                POP                      ; 021c 1c

                LR   K,P                 ; 021d 08
                PI   A053b               ; 021e 28 05 3b
                LIS  $0                  ; 0221 70
                LR   $0,A                ; 0222 50
                LR   $1,A                ; 0223 51
                LISL 2                   ; 0224 6a
                LIS  $0                  ; 0225 70
                XS   (IS)                ; 0226 ec
                LISU 3                   ; 0227 63
                BT   4,A022f             ; 0228 84 06
                LIS  $0                  ; 022a 70
                LR   (IS)+,A             ; 022b 5d
                LR   (IS)+,A             ; 022c 5d
                BF   $0,A0241            ; 022d 90 13	;always branch

A022f:          PI   A00b3               ; 022f 28 00 b3	;read a byte
                LR   (IS)+,A             ; 0232 5d			;store it
                PI   A00b3               ; 0233 28 00 b3	;read a byte
                LR   (IS)+,A             ; 0236 5d			;store it
                LR   $8,A                ; 0237 58
A0238:          DS   $8                  ; 0238 38			;loop 8 times
                BF   $2,A0241            ; 0239 92 07
                PI   A00b3               ; 023b 28 00 b3	;read a byte
                LR   (IS)+,A             ; 023e 5d			;store it
                BF   $0,A0238            ; 023f 90 f8	;always branch

A0241:          LISU 2                   ; 0241 62
                LISL 0                   ; 0242 68
                LIS  $3                  ; 0243 73
                XS   (IS)                ; 0244 ec
                BF   $4,A024b            ; 0245 94 05
                LIS  $2                  ; 0247 72
                OUTS 0                   ; 0248 b0
                LR   $1,A                ; 0249 51
                NOP                      ; 024a 2b
A024b:          LIS  $1                  ; 024b 71
                XS   $1                  ; 024c e1
                OUTS 0                   ; 024d b0
                LR   $1,A                ; 024e 51
                LI   $7f                 ; 024f 20 7f
                NS   $5                  ; 0251 f5
                LR   $5,A                ; 0252 55
                LI   $fe                 ; 0253 20 fe
                NS   $0                  ; 0255 f0
                LR   $0,A                ; 0256 50
A0257:          LIS  $1                  ; 0257 71
                LR   $5,A                ; 0258 55
                PI   A0337               ; 0259 28 03 37
                LIS  $0                  ; 025c 70
                LR   $5,A                ; 025d 55
                LIS  $0                  ; 025e 70
A025f:          CI   $09                 ; 025f 25 09
                BT   4,A0272             ; 0261 84 10
                DCI  A02ed               ; 0263 2a 02 ed
                ADC                      ; 0266 8e
                PI   A0337               ; 0267 28 03 37
                LM                       ; 026a 16
                BF   $4,A026e            ; 026b 94 02
                SR   4                   ; 026d 14
A026e:          SL   4                   ; 026e 15
                SR   4                   ; 026f 14
                BF   $0,A025f            ; 0270 90 ee	;always branch

A0272:          LISU 2                   ; 0272 62
                LISL 3                   ; 0273 6b
                LR   A,(IS)-             ; 0274 4e
                CI   $01                 ; 0275 25 01
                BT   4,A0281             ; 0277 84 09
                CI   $02                 ; 0279 25 02
                BF   $4,A0284            ; 027b 94 08
                LIS  $1                  ; 027d 71
                XS   (IS)                ; 027e ec
                BF   $4,A0284            ; 027f 94 04
A0281:          LIS  $4                  ; 0281 74
                XS   $5                  ; 0282 e5
                LR   $5,A                ; 0283 55
A0284:          LIS  $0                  ; 0284 70
                LR   $2,A                ; 0285 52
                LR   $3,A                ; 0286 53
                PI   A02f6               ; 0287 28 02 f6
                LR   $6,A                ; 028a 56
                PI   A0513               ; 028b 28 05 13
                PI   A02f6               ; 028e 28 02 f6
                LR   $7,A                ; 0291 57
                PI   A0513               ; 0292 28 05 13
                BF   $4,A029e            ; 0295 94 08
                XS   $6                  ; 0297 e6
                BF   $4,A029e            ; 0298 94 05
                LR   A,$0                ; 029a 40
                OI   $01                 ; 029b 22 01
                LR   $0,A                ; 029d 50
A029e:          DS   $7                  ; 029e 37
                BT   2,A02a4             ; 029f 82 04
                DS   $6                  ; 02a1 36
                BF   $2,A02ac            ; 02a2 92 09
A02a4:          PI   A02f6               ; 02a4 28 02 f6
                PI   A0513               ; 02a7 28 05 13
                BF   $0,A029e            ; 02aa 90 f3	;always branch

A02ac:          PI   A02f6               ; 02ac 28 02 f6
                XS   $2                  ; 02af e2
                BT   4,A02b6             ; 02b0 84 05
                LR   A,$0                ; 02b2 40
                OI   $02                 ; 02b3 22 02
                LR   $0,A                ; 02b5 50
A02b6:          PI   A02f6               ; 02b6 28 02 f6
                XS   $3                  ; 02b9 e3
                BT   4,A02c0             ; 02ba 84 05
                LR   A,$0                ; 02bc 40
                OI   $02                 ; 02bd 22 02
                LR   $0,A                ; 02bf 50
A02c0:          LI   $fb                 ; 02c0 20 fb
                NS   $5                  ; 02c2 f5
                LR   $5,A                ; 02c3 55
                LIS  $7                  ; 02c4 77
                LR   $b,A                ; 02c5 5b
A02c6:          PI   A0337               ; 02c6 28 03 37
                DS   $b                  ; 02c9 3b
                BF   $4,A02c6            ; 02ca 94 fb
                LIS  $2                  ; 02cc 72
                LR   $5,A                ; 02cd 55
                PI   A0337               ; 02ce 28 03 37
                LISU 2                   ; 02d1 62
                LISL 2                   ; 02d2 6a
                LIS  $0                  ; 02d3 70
                XS   (IS)                ; 02d4 ec
                BT   4,A02da             ; 02d5 84 04
                DS   (IS)                ; 02d7 3c
                BT   4,A02e4             ; 02d8 84 0b
A02da:          LIS  $1                  ; 02da 71
                NS   $0                  ; 02db f0
                BF   $4,A02e4            ; 02dc 94 07
                XS   $5                  ; 02de e5
                BF   $1,A02e4            ; 02df 91 04
                JMP  A0257               ; 02e1 29 02 57

A02e4:          LI   $fc                 ; 02e4 20 fc
                NS   $1                  ; 02e6 f1
                OUTS 0                   ; 02e7 b0
                LR   $1,A                ; 02e8 51
                PI   A054e               ; 02e9 28 05 4e
                PK                       ; 02ec 0c

A02ed:          LR   A,KL                ; 02ed 01
                LR   A,QU                ; 02ee 02
                LR   A,QL                ; 02ef 03
                LR   A,$0                ; 02f0 40
                LR   $0,A                ; 02f1 50
                LR   QU,A                ; 02f2 06
                LR   QL,A                ; 02f3 07
                BT   0,A02fe             ; 02f4 80 09	;nop
A02f6:          LR   K,P                 ; 02f6 08
                PI   A053b               ; 02f7 28 05 3b
                LIS  $2                  ; 02fa 72
                OUTS 5                   ; 02fb b5
                LIS  $0                  ; 02fc 70
                OUTS 5                   ; 02fd b5
A02fe:          LIS  $8                  ; 02fe 78
                LR   $b,A                ; 02ff 5b
                LIS  $0                  ; 0300 70
A0301:          SL   1                   ; 0301 13
                LR   $a,A                ; 0302 5a
                PI   A0337               ; 0303 28 03 37
                AS   $a                  ; 0306 ca
                DS   $b                  ; 0307 3b
                BF   $4,A0301            ; 0308 94 f8
                LR   $a,A                ; 030a 5a
                LISU 3                   ; 030b 63
                LISL 0                   ; 030c 68
                LIS  $0                  ; 030d 70
                XS   (IS)                ; 030e ec
                BT   4,A0314             ; 030f 84 04
                DS   (IS)                ; 0311 3c
                BF   $0,A0331            ; 0312 90 1e	;always branch

A0314:          LISL 1                   ; 0314 69
                XS   (IS)                ; 0315 ec
                BT   4,A0331             ; 0316 84 1a
                COM                      ; 0318 18
                LISL 3                   ; 0319 6b
                AS   (IS)                ; 031a cc
                AI   $1d                 ; 031b 24 1d
                LR   IS,A                ; 031d 0b
                LR   A,(IS)              ; 031e 4c
                XS   $a                  ; 031f ea
                BT   4,A0326             ; 0320 84 05
                LR   A,$5                ; 0322 45
                NI   $f7                 ; 0323 21 f7
                LR   $5,A                ; 0325 55
A0326:          LISU 3                   ; 0326 63
                LISL 1                   ; 0327 69
                DS   (IS)                ; 0328 3c
                BF   $4,A0331            ; 0329 94 07
                LR   A,$5                ; 032b 45
                NI   $04                 ; 032c 21 04
                SL   4                   ; 032e 15
                XS   $5                  ; 032f e5
                LR   $5,A                ; 0330 55
A0331:          PI   A054e               ; 0331 28 05 4e
                LIS  $0                  ; 0334 70
                XS   $a                  ; 0335 ea
                PK                       ; 0336 0c

A0337:          LR   K,P                 ; 0337 08
                LIS  $2                  ; 0338 72
                NS   $5                  ; 0339 f5
                BF   $4,A034e            ; 033a 94 13
                LIS  $2                  ; 033c 72
                LR   $4,A                ; 033d 54
A033e:          INS  0                   ; 033e a0
                BF   $1,A033e            ; 033f 91 fe
                DS   $4                  ; 0341 34
                BF   $4,A033e            ; 0342 94 fb
                LIS  $2                  ; 0344 72
                LR   $4,A                ; 0345 54
A0346:          INS  0                   ; 0346 a0
                BT   1,A0346             ; 0347 81 fe
                DS   $4                  ; 0349 34
                BF   $4,A0346            ; 034a 94 fb
                BF   $0,A0354            ; 034c 90 07	;always branch

A034e:          LISU 2                   ; 034e 62
                LISL 7                   ; 034f 6f
                LR   A,(IS)              ; 0350 4c
A0351:          INC                      ; 0351 1f
                BF   $4,A0351            ; 0352 94 fe
A0354:          LIS  $4                  ; 0354 74
                OUTS 5                   ; 0355 b5
                LIS  $0                  ; 0356 70
                OUTS 5                   ; 0357 b5
                LISU 2                   ; 0358 62
                LISL 6                   ; 0359 6e
                LR   A,(IS)              ; 035a 4c
                OUTS 7                   ; 035b b7		;set timer register
                LI   $aa                 ; 035c 20 aa	;enable external interrupt and timer, ext on rising edge, timer running with prescaler 8
                OUTS 6                   ; 035e b6
                LIS  $1                  ; 035f 71
                NS   $5                  ; 0360 f5
                BF   $4,A036a            ; 0361 94 08
                LI   $f3                 ; 0363 20 f3
                NS   $1                  ; 0365 f1
                OI   $04                 ; 0366 22 04
                BF   $0,A036d            ; 0368 90 04	;always branch

A036a:          LI   $f3                 ; 036a 20 f3
                NS   $1                  ; 036c f1
A036d:          LR   $1,A                ; 036d 51
                PI   A01f3               ; 036e 28 01 f3
                LIS  $0                  ; 0371 70
                LR   $4,A                ; 0372 54
                LI   $f3                 ; 0373 20 f3
                NS   $1                  ; 0375 f1
                LR   $1,A                ; 0376 51
                PI   A01f3               ; 0377 28 01 f3
                LIS  $4                  ; 037a 74
                OUTS 5                   ; 037b b5
                LIS  $0                  ; 037c 70
                OUTS 5                   ; 037d b5
                EI                       ; 037e 1b
A037f:          INS  0                   ; 037f a0
                BT   1,A037f             ; 0380 81 fe
                DS   $4                  ; 0382 34
                BF   $0,A037f            ; 0383 90 fb	;always branch

                LIS  $0                  ; 0385 70		;disable interrupts
                OUTS 6                   ; 0386 b6
                LI   $f3                 ; 0387 20 f3
                NS   $1                  ; 0389 f1
                LR   $1,A                ; 038a 51
                LIS  $1                  ; 038b 71
                NS   $5                  ; 038c f5
                BF   $4,A0394            ; 038d 94 06
                LR   A,$8                ; 038f 48
                SL   1                   ; 0390 13
                SL   1                   ; 0391 13
                XS   $1                  ; 0392 e1
                LR   $1,A                ; 0393 51
A0394:          PI   A01f3               ; 0394 28 01 f3
                LIS  $4                  ; 0397 74
                OUTS 5                   ; 0398 b5
                LIS  $0                  ; 0399 70
                OUTS 5                   ; 039a b5
                LIS  $0                  ; 039b 70
                XS   $4                  ; 039c e4
                BT   4,A03a3             ; 039d 84 05
                CI   $fe                 ; 039f 25 fe
                LIS  $0                  ; 03a1 70
                LNK                      ; 03a2 19
A03a3:          LR   $8,A                ; 03a3 58
                LIS  $4                  ; 03a4 74
                NS   $5                  ; 03a5 f5
                BT   4,A03b3             ; 03a6 84 0c
                LR   A,$8                ; 03a8 48
                SL   4                   ; 03a9 15
                SL   1                   ; 03aa 13
                SL   1                   ; 03ab 13
                SL   1                   ; 03ac 13
                OI   $02                 ; 03ad 22 02
                OUTS 1                   ; 03af b1
                NI   $80                 ; 03b0 21 80
                OUTS 1                   ; 03b2 b1
A03b3:          LIS  $0                  ; 03b3 70
                XS   $8                  ; 03b4 e8
                PK                       ; 03b5 0c

                LR   A,KU                ; 03b6 00
                LR   A,KU                ; 03b7 00
                LR   A,KU                ; 03b8 00
                LR   A,KU                ; 03b9 00
                LR   A,KU                ; 03ba 00
                LR   A,KU                ; 03bb 00
                LR   A,KU                ; 03bc 00
                LR   A,KU                ; 03bd 00
                LR   A,KU                ; 03be 00
                LR   A,KU                ; 03bf 00
                LR   A,KU                ; 03c0 00
                LR   A,KU                ; 03c1 00
                LR   A,KU                ; 03c2 00
                LR   A,KU                ; 03c3 00
                LR   A,KU                ; 03c4 00
                LR   A,KU                ; 03c5 00
                LR   A,KU                ; 03c6 00
                LR   A,KU                ; 03c7 00
                LR   A,KU                ; 03c8 00
                LR   A,KU                ; 03c9 00
                LR   A,KU                ; 03ca 00
                LR   A,KU                ; 03cb 00
                LR   A,KU                ; 03cc 00
                LR   A,KU                ; 03cd 00
                LR   A,KU                ; 03ce 00
                LR   A,KU                ; 03cf 00
                LR   A,KU                ; 03d0 00
                LR   A,KU                ; 03d1 00
                LR   A,KU                ; 03d2 00
                LR   A,KU                ; 03d3 00
                LR   A,KU                ; 03d4 00
                LR   A,KU                ; 03d5 00
                LR   A,KU                ; 03d6 00
                LR   A,KU                ; 03d7 00
                LR   A,KU                ; 03d8 00
                LR   A,KU                ; 03d9 00
                LR   A,KU                ; 03da 00
                LR   A,KU                ; 03db 00
                LR   A,KU                ; 03dc 00
                LR   A,KU                ; 03dd 00
                LR   A,KU                ; 03de 00
                LR   A,KU                ; 03df 00
                AS   $3                  ; 03e0 c3
                AS   $3                  ; 03e1 c3
                AS   $3                  ; 03e2 c3
                AS   $3                  ; 03e3 c3
                AS   $3                  ; 03e4 c3
                AS   $3                  ; 03e5 c3
                AS   $3                  ; 03e6 c3
                AS   $3                  ; 03e7 c3
                AS   $3                  ; 03e8 c3
                AS   $3                  ; 03e9 c3
                AS   $3                  ; 03ea c3
                AS   $3                  ; 03eb c3
                AS   $3                  ; 03ec c3
                AS   $3                  ; 03ed c3
                AS   $3                  ; 03ee c3
                AS   $3                  ; 03ef c3
                AS   $3                  ; 03f0 c3
                AS   $3                  ; 03f1 c3
                AS   $3                  ; 03f2 c3
                AS   $3                  ; 03f3 c3
                AS   $3                  ; 03f4 c3
                AS   $3                  ; 03f5 c3
                AS   $3                  ; 03f6 c3
                AS   $3                  ; 03f7 c3
                AS   $3                  ; 03f8 c3
                AS   $3                  ; 03f9 c3
                AS   $3                  ; 03fa c3
                AS   $3                  ; 03fb c3
                AS   $3                  ; 03fc c3
                AS   $3                  ; 03fd c3
                AS   $3                  ; 03fe c3
                AS   $3                  ; 03ff c3
                
                LR   K,P                 ; 0400 08
                LIS  $1                  ; 0401 71
                OUTS 5                   ; 0402 b5
                OUTS 4                   ; 0403 b4
                LISL 6                   ; 0404 6e
                LR   A,(IS)              ; 0405 4c
                OUTS 7                   ; 0406 b7		;set timer register
                LI   $aa                 ; 0407 20 aa	;enable external interrupt and timer, ext on rising edge, timer running with prescaler 8
                OUTS 6                   ; 0409 b6
                LIS  $0                  ; 040a 70
                LR   $0,A                ; 040b 50
                LR   $8,A                ; 040c 58
                LR   $2,A                ; 040d 52
                LR   $3,A                ; 040e 53
                LR   $5,A                ; 040f 55
                LR   $6,A                ; 0410 56
                LR   $7,A                ; 0411 57
                EI                       ; 0412 1b
A0413:          XS   $5                  ; 0413 e5
                BT   4,A0413             ; 0414 84 fe
                DI                       ; 0416 1a
                LIS  $0                  ; 0417 70	;disable interrupts
                OUTS 6                   ; 0418 b6
                PK                       ; 0419 0c

                NOP                      ; 041a 2b
                NOP                      ; 041b 2b
                NOP                      ; 041c 2b
                NOP                      ; 041d 2b
                NOP                      ; 041e 2b
                LR   A,$3                ; 041f 43
                INC                      ; 0420 1f
                CI   $03                 ; 0421 25 03
                BF   $4,A0426            ; 0423 94 02
                LIS  $0                  ; 0425 70
A0426:          LR   $3,A                ; 0426 53
                LISL 2                   ; 0427 6a
                LIS  $c                  ; 0428 7c
                NS   (IS)                ; 0429 fc
                BT   4,A0453             ; 042a 84 28
                LIS  $0                  ; 042c 70
                XS   $2                  ; 042d e2
                BF   $4,A043f            ; 042e 94 10
                INS  5                   ; 0430 a5
                BF   $1,A043d            ; 0431 91 0b
                LR   A,$3                ; 0433 43
                INC                      ; 0434 1f
                CI   $03                 ; 0435 25 03
                BF   $4,A043a            ; 0437 94 02
                LIS  $0                  ; 0439 70
A043a:          LR   $4,A                ; 043a 54
                LIS  $a                  ; 043b 7a
                LR   $2,A                ; 043c 52
A043d:          BF   $0,A0453            ; 043d 90 15	;always branch

A043f:          LR   A,$4                ; 043f 44
                XS   $3                  ; 0440 e3
                BF   $4,A0453            ; 0441 94 11
                LIS  $a                  ; 0443 7a
                XS   $2                  ; 0444 e2
                BF   $4,A044e            ; 0445 94 08
                INS  5                   ; 0447 a5
                BT   1,A044e             ; 0448 81 05
                LIS  $0                  ; 044a 70
                LR   $2,A                ; 044b 52
                BF   $0,A0453            ; 044c 90 06	;always branch

A044e:          INS  5                   ; 044e a5
                NI   $80                 ; 044f 21 80
                LR   $8,A                ; 0451 58
                DS   $2                  ; 0452 32
A0453:          LISL 2                   ; 0453 6a
                LI   $30                 ; 0454 20 30
                NS   (IS)                ; 0456 fc
                BT   4,A0480             ; 0457 84 28
                LIS  $0                  ; 0459 70
                XS   $6                  ; 045a e6
                BF   $4,A046c            ; 045b 94 10
                INS  4                   ; 045d a4
                BF   $1,A046a            ; 045e 91 0b
                LR   A,$3                ; 0460 43
                INC                      ; 0461 1f
                CI   $03                 ; 0462 25 03
                BF   $4,A0467            ; 0464 94 02
                LIS  $0                  ; 0466 70
A0467:          LR   $1,A                ; 0467 51
                LIS  $a                  ; 0468 7a
                LR   $6,A                ; 0469 56
A046a:          BF   $0,A0480            ; 046a 90 15	;always branch

A046c:          LR   A,$1                ; 046c 41
                XS   $3                  ; 046d e3
                BF   $4,A0480            ; 046e 94 11
                LIS  $a                  ; 0470 7a
                XS   $6                  ; 0471 e6
                BF   $4,A047b            ; 0472 94 08
                INS  4                   ; 0474 a4
                BT   1,A047b             ; 0475 81 05
                LIS  $0                  ; 0477 70
                LR   $6,A                ; 0478 56
                BF   $0,A0480            ; 0479 90 06	;always branch

A047b:          INS  4                   ; 047b a4
                NI   $80                 ; 047c 21 80
                LR   $7,A                ; 047e 57
                DS   $6                  ; 047f 36
A0480:          LIS  $0                  ; 0480 70
                XS   $3                  ; 0481 e3
                BF   $4,A04f3            ; 0482 94 70
                LIS  $0                  ; 0484 70
                OUTS 1                   ; 0485 b1
                INS  1                   ; 0486 a1
                NI   $81                 ; 0487 21 81
                CI   $81                 ; 0489 25 81
                BF   $4,A0492            ; 048b 94 06
                LIS  $0                  ; 048d 70		;disable interrupts
                OUTS 6                   ; 048e b6
                COM                      ; 048f 18
                LR   $5,A                ; 0490 55
                POP                      ; 0491 1c

A0492:          LISL 2                   ; 0492 6a
                LI   $20                 ; 0493 20 20
                NS   (IS)                ; 0495 fc
                BT   4,A04a6             ; 0496 84 0f
                LR   A,$6                ; 0498 46
                AI   $ff                 ; 0499 24 ff
                CI   $08                 ; 049b 25 08
                BF   $2,A04a6            ; 049d 92 08
                LR   A,$7                ; 049f 47
                SR   1                   ; 04a0 12
                SR   1                   ; 04a1 12
                SR   1                   ; 04a2 12
                SR   4                   ; 04a3 14
                BF   $0,A04b0            ; 04a4 90 0b	;always branch

A04a6:          LIS  $1                  ; 04a6 71
                NS   (IS)                ; 04a7 fc
                BT   4,A04af             ; 04a8 84 06
                INS  1                   ; 04aa a1
                NI   $01                 ; 04ab 21 01
                BF   $0,A04b0            ; 04ad 90 02	;always branch

A04af:          LIS  $1                  ; 04af 71
A04b0:          OUTS 5                   ; 04b0 b5
                LISL 2                   ; 04b1 6a
                LIS  $8                  ; 04b2 78
                NS   (IS)                ; 04b3 fc
                BT   4,A04c4             ; 04b4 84 0f
                LR   A,$2                ; 04b6 42
                AI   $ff                 ; 04b7 24 ff
                CI   $08                 ; 04b9 25 08
                BF   $2,A04c4            ; 04bb 92 08
                LR   A,$8                ; 04bd 48
                SR   1                   ; 04be 12
                SR   1                   ; 04bf 12
                SR   1                   ; 04c0 12
                SR   4                   ; 04c1 14
                BF   $0,A04ce            ; 04c2 90 0b	;always branch

A04c4:          LIS  $2                  ; 04c4 72
                NS   (IS)                ; 04c5 fc
                BT   4,A04cd             ; 04c6 84 06
                INS  1                   ; 04c8 a1
                NI   $01                 ; 04c9 21 01
                BF   $0,A04ce            ; 04cb 90 02	;always branch

A04cd:          LIS  $1                  ; 04cd 71
A04ce:          OUTS 4                   ; 04ce b4
                LISL 2                   ; 04cf 6a
                LIS  $4                  ; 04d0 74
                NS   (IS)                ; 04d1 fc
                BT   4,A04de             ; 04d2 84 0b
                LR   A,$2                ; 04d4 42
                AI   $ff                 ; 04d5 24 ff
                CI   $09                 ; 04d7 25 09
                BF   $2,A04de            ; 04d9 92 04
                LR   A,$8                ; 04db 48
                BF   $0,A04ed            ; 04dc 90 10	;always branch

A04de:          LI   $10                 ; 04de 20 10
                NS   (IS)                ; 04e0 fc
                BT   4,A04eb             ; 04e1 84 09
                LR   A,$6                ; 04e3 46
                AI   $ff                 ; 04e4 24 ff
                BF   $2,A04eb            ; 04e6 92 04
                LR   A,$7                ; 04e8 47
                BF   $0,A04ed            ; 04e9 90 03	;always branch

A04eb:          LI   $80                 ; 04eb 20 80	;output a 1 bit
A04ed:          OI   $02                 ; 04ed 22 02	;output a bit
                OUTS 1                   ; 04ef b1
                NI   $80                 ; 04f0 21 80
                OUTS 1                   ; 04f2 b1
A04f3:          NI   $00                 ; 04f3 21 00
                EI                       ; 04f5 1b
                POP                      ; 04f6 1c

                LIS  $0                  ; 04f7 70
                LR   $0,A                ; 04f8 50
                LISU 2                   ; 04f9 62
                LISL 1                   ; 04fa 69
                LIS  $0                  ; 04fb 70
                XS   (IS)+               ; 04fc ed
                LR   A,(IS)              ; 04fd 4c
                BF   $4,A0502            ; 04fe 94 03
                OUTS 0                   ; 0500 b0
                POP                      ; 0501 1c

A0502:          OUTS 1                   ; 0502 b1
                POP                      ; 0503 1c

                LR   K,P                 ; 0504 08
                PI   A053b               ; 0505 28 05 3b
                LR   A,$0                ; 0508 40
                LR   $4,A                ; 0509 54
                PI   A00b3               ; 050a 28 00 b3	;send a byte
                LIS  $0                  ; 050d 70
                LR   $0,A                ; 050e 50
                PI   A054e               ; 050f 28 05 4e
                PK                       ; 0512 0c

A0513:          LR   A,$a                ; 0513 4a
                XS   $3                  ; 0514 e3
                LR   $b,A                ; 0515 5b
                SR   4                   ; 0516 14
                XS   $b                  ; 0517 eb
A0518:          LR   $b,A                ; 0518 5b
                SL   4                   ; 0519 15
                XS   $2                  ; 051a e2
                LR   $3,A                ; 051b 53
                LR   A,$b                ; 051c 4b
                SR   1                   ; 051d 12
                SR   1                   ; 051e 12
                SR   1                   ; 051f 12
                XS   $3                  ; 0520 e3
                LR   $3,A                ; 0521 53
                LR   A,$b                ; 0522 4b
                SL   4                   ; 0523 15
                SL   1                   ; 0524 13
                XS   $b                  ; 0525 eb
                LR   $2,A                ; 0526 52
                POP                      ; 0527 1c

A0528:          LIS  $0                  ; 0528 70
A0529:          INC                      ; 0529 1f
                BF   $4,A0529            ; 052a 94 fe
                XS   $0                  ; 052c e0
                BF   $4,A0534            ; 052d 94 06
                LIS  $3                  ; 052f 73
                OUTS 1                   ; 0530 b1
                LIS  $1                  ; 0531 71
                BF   $0,A0539            ; 0532 90 06	;always branch

A0534:          LI   $83                 ; 0534 20 83
                OUTS 1                   ; 0536 b1
                LI   $81                 ; 0537 20 81
A0539:          OUTS 1                   ; 0539 b1
                POP                      ; 053a 1c

A053b:          DI                       ; 053b 1a
                LR   A,IS                ; 053c 0a
                LISU 7                   ; 053d 67
                LISL 5                   ; 053e 6d
                LR   (IS)-,A             ; 053f 5e
                LR   A,(IS)              ; 0540 4c
                LR   IS,A                ; 0541 0b
                LR   A,KL                ; 0542 01
                LR   (IS)-,A             ; 0543 5e
                LR   A,KU                ; 0544 00
                LR   (IS),A              ; 0545 5c
                LISU 7                   ; 0546 67
                LISL 4                   ; 0547 6c
                DS   (IS)                ; 0548 3c
                DS   (IS)+               ; 0549 3d
                LR   A,(IS)              ; 054a 4c
                LR   IS,A                ; 054b 0b
                LR   W,J                 ; 054c 1d
                POP                      ; 054d 1c

A054e:          DI                       ; 054e 1a
                LR   A,IS                ; 054f 0a
                LISU 7                   ; 0550 67
                LISL 5                   ; 0551 6d
                LR   (IS)-,A             ; 0552 5e
                LR   A,(IS)              ; 0553 4c
                INC                      ; 0554 1f
                LR   IS,A                ; 0555 0b
                LR   A,(IS)+             ; 0556 4d
                LR   KU,A                ; 0557 04
                LR   A,(IS)              ; 0558 4c
                LR   KL,A                ; 0559 05
                LR   A,IS                ; 055a 0a
                LISU 7                   ; 055b 67
                LISL 4                   ; 055c 6c
                LR   (IS)+,A             ; 055d 5d
                LR   A,(IS)              ; 055e 4c
                LR   IS,A                ; 055f 0b
                LR   W,J                 ; 0560 1d
                POP                      ; 0561 1c

A0562:          LR   K,P                 ; 0562 08
                LISU 7                   ; 0563 67
                LISL 4                   ; 0564 6c
                LI   $3b                 ; 0565 20 3b
                LR   (IS),A              ; 0567 5c
                PK                       ; 0568 0c

                LR   A,KU                ; 0569 00
                LR   A,KU                ; 056a 00
                LR   A,KU                ; 056b 00
                LR   A,KU                ; 056c 00
                LR   A,KU                ; 056d 00
                LR   A,KU                ; 056e 00
                LR   A,KU                ; 056f 00
                LI   $20                 ; 0570 20 20
                LI   $20                 ; 0572 20 20
                LI   $20                 ; 0574 20 20
                LI   $20                 ; 0576 20 20
                LI   $20                 ; 0578 20 20
                LR   A,$8                ; 057a 48
                LR   $9,A                ; 057b 59
                LISU 1                   ; 057c 61
                LIS  $2                  ; 057d 72
                LIS  $b                  ; 057e 7b
                BT   4,-112              ; 057f 84 90
                LR   A,$8                ; 0581 48
                LR   A,$8                ; 0582 48
                LR   $8,A                ; 0583 58
                LISU 0                   ; 0584 60
                LIS  $3                  ; 0585 73
                LIS  $d                  ; 0586 7d
                BT   5,A0518             ; 0587 85 90
                LIS  $0                  ; 0589 70
                DS   $0                  ; 058a 30
                DS   $0                  ; 058b 30
                DS   $0                  ; 058c 30
                DS   $0                  ; 058d 30
                DS   $0                  ; 058e 30
                DS   $0                  ; 058f 30
                DS   $0                  ; 0590 30
                LIS  $0                  ; 0591 70
                OUTS 0                   ; 0592 b0
                OUTS 0                   ; 0593 b0
                OUTS 0                   ; 0594 b0
                OUTS 0                   ; 0595 b0
                OUTS 0                   ; 0596 b0
                OUTS 0                   ; 0597 b0
                OUTS 0                   ; 0598 b0
                LIS  $0                  ; 0599 70
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                LR   A,KU                ; 05aa 00
                LR   A,KL                ; 05ab 01
                LR   A,QU                ; 05ac 02
                LR   A,QL                ; 05ad 03
                LR   KU,A                ; 05ae 04
                LR   KL,A                ; 05af 05
                LR   QU,A                ; 05b0 06
                LR   QL,A                ; 05b1 07
                LR   K,P                 ; 05b2 08
                LR   P,K                 ; 05b3 09
                LR   A,IS                ; 05b4 0a
                LR   IS,A                ; 05b5 0b
                PK                       ; 05b6 0c

;this looks like leftover code

; Copies $16 bytes from $12F8 to $0C00 and jumps to $0C00
; Nearby code accesses video register $08FB
                LR   P0,Q                ; 05b7 0d
                LR   Q,DC                ; 05b8 0e
                LR   DC,Q                ; 05b9 0f
                DCI  $0c00               ; 05ba 2a 0c 00
                XDC                      ; 05bd 2c
                DCI  $12f8               ; 05be 2a 12 f8
                LI   $16                 ; 05c1 20 16
                LR   $0,A                ; 05c3 50
A05c4:          LM                       ; 05c4 16
                XDC                      ; 05c5 2c
                ST                       ; 05c6 17
                XDC                      ; 05c7 2c
                DS   $0                  ; 05c8 30
                BF   $4,A05c4            ; 05c9 94 fa
                JMP  $0c00               ; 05cb 29 0c 00

A05ce:          LM                       ; 05ce 16
                LR   $8,A                ; 05cf 58
                LR   Q,DC                ; 05d0 0e
                XDC                      ; 05d1 2c
                LR   H,DC                ; 05d2 11
                LI   $77                 ; 05d3 20 77
                ADC                      ; 05d5 8e
                LI   $64                 ; 05d6 20 64
                ST                       ; 05d8 17
                LR   DC,H                ; 05d9 10
                LI   $80                 ; 05da 20 80
                ADC                      ; 05dc 8e
                LR   H,DC                ; 05dd 11
                XDC                      ; 05de 2c
                PI   $12db               ; 05df 28 12 db
A05e2:          LI   $f0                 ; 05e2 20 f0
A05e4:          DCI  $08fb               ; 05e4 2a 08 fb
                CM                       ; 05e7 8d
                BF   $2,A05e4            ; 05e8 92 fb
                LR   DC,H                ; 05ea 10
                XDC                      ; 05eb 2c
                LR   DC,Q                ; 05ec 0f
                PI   $12df               ; 05ed 28 12 df
                PI   $10bc               ; 05f0 28 10 bc
                BF   $0,A05e2            ; 05f3 90 ee	;always branch

                DCI  $0880               ; 05f5 2a 08 80
                LR   H,DC                ; 05f8 11
                LI   $90                 ; 05f9 20 90
A05fb:          LR   $0,A                ; 05fb 50
                LI   $80                 ; 05fc 20 80
                ADC                      ; 05fe 8e
                LI   $ff                 ; 05ff 20 ff
A0601:          ST                       ; 0601 17
                DS   $0                  ; 0602 30
                BF   $4,A0601            ; 0603 94 fd
                LIS  $8                  ; 0605 78
                LR   $0,A                ; 0606 50
                LI   $aa                 ; 0607 20 aa
                DCI  $0c00               ; 0609 2a 0c 00
A060c:          ST                       ; 060c 17
                DS   $0                  ; 060d 30
                BF   $4,A060c            ; 060e 94 fd
                LIS  $8                  ; 0610 78
                LR   $0,A                ; 0611 50
                LI   $ff                 ; 0612 20 ff
A0614:          ST                       ; 0614 17
                DS   $0                  ; 0615 30
                BF   $4,A0614            ; 0616 94 fd
                LR   DC,H                ; 0618 10
                XDC                      ; 0619 2c
                DCI  $321f               ; 061a 2a 32 1f
                BF   $0,A05ce            ; 061d 90 b0	;always branch

                LR   KU,A                ; 061f 04
                LR   A,KU                ; 0620 00
                LR   A,KU                ; 0621 00
                LR   A,KU                ; 0622 00
                LR   A,KU                ; 0623 00
                XM                       ; 0624 8c
                LR   A,(IS)              ; 0625 4c
                XDC                      ; 0626 2c
                PK                       ; 0627 0c

                AM                       ; 0628 88
                AM                       ; 0629 88
                AM                       ; 062a 88
                AS   $8                  ; 062b c8
                LR   DC,H                ; 062c 10
                LR   DC,H                ; 062d 10
                LR   DC,H                ; 062e 10
                LR   DC,H                ; 062f 10
                LR   A,$0                ; 0630 40
                LR   A,$0                ; 0631 40
                LR   A,$0                ; 0632 40
                LR   A,$0                ; 0633 40
                DS   $4                  ; 0634 34
                LISU 4                   ; 0635 64
                BF   $4,A05fb            ; 0636 94 c4
                LR   A,KU                ; 0638 00
                LR   A,KU                ; 0639 00
                LR   A,KU                ; 063a 00
                LR   A,KU                ; 063b 00
                LR   A,KU                ; 063c 00
                LR   A,KL                ; 063d 01
                LR   A,QU                ; 063e 02
                LR   A,QL                ; 063f 03
                LIS  $0                  ; 0640 70
A0641:          LR   $9,A                ; 0641 59
                JMP  $303b               ; 0642 29 30 3b

                LIS  $1                  ; 0645 71
                BF   $0,A0641            ; 0646 90 fa	;always branch

                LIS  $2                  ; 0648 72
                BF   $0,A0641            ; 0649 90 f7	;always branch

                LIS  $3                  ; 064b 73
                BF   $0,A0641            ; 064c 90 f4	;always branch

                LI   $10                 ; 064e 20 10
                LR   $8,A                ; 0650 58
                PI   $1216               ; 0651 28 12 16
A0654:          JMP  $109c               ; 0654 29 10 9c

                LI   $20                 ; 0657 20 20
                LR   $8,A                ; 0659 58
                PI   $1216               ; 065a 28 12 16
                BF   $0,A0654            ; 065d 90 f6	;always branch

A065f:          PI   $10bc               ; 065f 28 10 bc
                BF   $0,A065f            ; 0662 90 fc	;always branch

                SR   1                   ; 0664 12
                NS   $8                  ; 0665 f8
                DS   $0                  ; 0666 30
                LR   A,KU                ; 0667 00
                SL   1                   ; 0668 13
                LR   Q,DC                ; 0669 0e
                SL   1                   ; 066a 13
                LR   A,(IS)+             ; 066b 4d
                SL   1                   ; 066c 13
                DS   $a                  ; 066d 3a
                SL   1                   ; 066e 13
                LISL 2                   ; 066f 6a
                SL   1                   ; 0670 13
                LISU 5                   ; 0671 65
                SL   1                   ; 0672 13
                LISU 0                   ; 0673 60
                SR   1                   ; 0674 12
                NS   $8                  ; 0675 f8
                SL   1                   ; 0676 13
                LIS  $0                  ; 0677 70
                DS   $1                  ; 0678 31
                OUTS 10                  ; 0679 ba
                DS   $0                  ; 067a 30
                XS   $3                  ; 067b e3
                SR   1                   ; 067c 12
                db   $5f                 
                LR   H,DC                ; 067e 11
                INS  10                  ; 067f aa
                DS   $2                  ; 0680 32
                BF   $4,A06b2            ; 0681 94 30
                NS   (IS)                ; 0683 fc
                DS   $1                  ; 0684 31
                NS   $5                  ; 0685 f5
                DS   $2                  ; 0686 32
                LR   A,$0                ; 0687 40
                DS   $2                  ; 0688 32
                LR   A,$5                ; 0689 45
                DS   $2                  ; 068a 32
                LR   A,$8                ; 068b 48
                DS   $2                  ; 068c 32
                LR   A,$b                ; 068d 4b
                DS   $2                  ; 068e 32
                LR   A,(IS)-             ; 068f 4e
                DS   $2                  ; 0690 32
                LR   $7,A                ; 0691 57
                DS   $2                  ; 0692 32
                db   $5f                 
                LISU 4                   ; 0694 64
                LISL 0                   ; 0695 68
                LI   $80                 ; 0696 20 80
                LR   $8,A                ; 0698 58
                LI   $a5                 ; 0699 20 a5
                LR   (IS)+,A             ; 069b 5d
                LI   $de                 ; 069c 20 de
                LR   (IS)-,A             ; 069e 5e
                DCI  $1000               ; 069f 2a 10 00
                PI   $10f0               ; 06a2 28 10 f0
                BF   $4,A06c5            ; 06a5 94 1f
                LI   $32                 ; 06a7 20 32
                SL   4                   ; 06a9 15
                SL   1                   ; 06aa 13
A06ab:          LR   $0,A                ; 06ab 50
                LI   $c5                 ; 06ac 20 c5
                SR   1                   ; 06ae 12
                SR   1                   ; 06af 12
                SR   1                   ; 06b0 12
                XS   $0                  ; 06b1 e0
A06b2:          LR   $8,A                ; 06b2 58
                DCI  $32d7               ; 06b3 2a 32 d7
                LM                       ; 06b6 16
                LR   (IS)+,A             ; 06b7 5d
                LM                       ; 06b8 16
                LR   (IS)-,A             ; 06b9 5e
                DCI  $3000               ; 06ba 2a 30 00
                PI   $10f0               ; 06bd 28 10 f0
                BF   $4,A06c5            ; 06c0 94 04
                JMP  $109c               ; 06c2 29 10 9c

A06c5:          LI   $23                 ; 06c5 20 23
                LR   $1,A                ; 06c7 51
A06c8:          DS   $0                  ; 06c8 30
                BF   $4,A06c8            ; 06c9 94 fe
                DS   $1                  ; 06cb 31
                BF   $4,A06c8            ; 06cc 94 fb
                LR   A,$4                ; 06ce 44
                XI   $40                 ; 06cf 23 40
                LR   $4,A                ; 06d1 54
                PI   $10bc               ; 06d2 28 10 bc
                BF   $0,A06c5            ; 06d5 90 ef	;always branch

                BF   $e,A06ab            ; 06d7 9e d3
                LR   A,KU                ; 06d9 00
                LR   A,KU                ; 06da 00
                LR   A,KU                ; 06db 00
                LR   A,KU                ; 06dc 00
                LR   A,KU                ; 06dd 00
                LR   A,KU                ; 06de 00
                LR   A,KU                ; 06df 00
; Matches with Money_Minder_vb1000mm.asm: $06E0-$06FB = $16E4-$16FF
                PI   $40a9               ; 06e0 28 40 a9
                LISU 3                   ; 06e3 63
                LISL 3                   ; 06e4 6b
                LIS  $0                  ; 06e5 70
A06e6:          LR   (IS)-,A             ; 06e6 5e
                BR7  A06e6               ; 06e7 8f fe
                LR   H,DC                ; 06e9 11
A06ea:          LISU 4                   ; 06ea 64
                LISL 0                   ; 06eb 68
                LIS  $4                  ; 06ec 74
                LR   $1,A                ; 06ed 51
                LR   DC,H                ; 06ee 10
A06ef:          LM                       ; 06ef 16
                LR   (IS)+,A             ; 06f0 5d
                DS   $1                  ; 06f1 31
                BF   $4,A06ef            ; 06f2 94 fc
                LR   H,DC                ; 06f4 11
                PI   $26ac               ; 06f5 28 26 ac
                DS   $0                  ; 06f8 30
                BF   $4,A06ea            ; 06f9 94 f0
                PI   $41c8               ; 06fb 28 41 c8
                PI   $1772               ; 06fe 28 17 72
                JMP  $31ad               ; 0701 29 31 ad

; Matches with Money_Minder_vb1000mm.asm $1708-$1771
                LR   K,P                 ; 0704 08
                PI   $40a9               ; 0705 28 40 a9
                LISU 3                   ; 0708 63
                LISL 0                   ; 0709 68
                LIS  $9                  ; 070a 79
                LR   $0,A                ; 070b 50
                LIS  $0                  ; 070c 70
                LR   $3,A                ; 070d 53
A070e:          LR   (IS)+,A             ; 070e 5d
                BR7  A070e               ; 070f 8f fe
                LISL 3                   ; 0711 6b
                LM                       ; 0712 16
                LR   $2,A                ; 0713 52
                NI   $0f                 ; 0714 21 0f
                LR   (IS),A              ; 0716 5c
                BT   4,A0737             ; 0717 84 1f
                DS   $3                  ; 0719 33
A071a:          LISL 3                   ; 071a 6b
                LIS  $1                  ; 071b 71
                XS   $0                  ; 071c e0
                BT   4,A0760             ; 071d 84 42
                PI   $27c6               ; 071f 28 27 c6
                LISL 3                   ; 0722 6b
A0723:          LISU 3                   ; 0723 63
                LR   A,(IS)              ; 0724 4c
                LISU 4                   ; 0725 64
                LR   (IS)-,A             ; 0726 5e
                BR7  A0723               ; 0727 8f fb
                LISU 4                   ; 0729 64
                LISL 3                   ; 072a 6b
                PI   $27c6               ; 072b 28 27 c6
                LISL 3                   ; 072e 6b
                PI   $27c6               ; 072f 28 27 c6
                XDC                      ; 0732 2c
                PI   $26ac               ; 0733 28 26 ac
                XDC                      ; 0736 2c
A0737:          DS   $0                  ; 0737 30
                BT   4,A0760             ; 0738 84 27
                BF   $1,A0760            ; 073a 91 25
                LIS  $1                  ; 073c 71
                NS   $0                  ; 073d f0
                BF   $4,A0745            ; 073e 94 06
                LM                       ; 0740 16
                LR   $1,A                ; 0741 51
                SR   4                   ; 0742 14
                BF   $0,A0747            ; 0743 90 03	;always branch

A0745:          LIS  $f                  ; 0745 7f
                NS   $1                  ; 0746 f1
A0747:          BF   $4,A074f            ; 0747 94 07
                LR   A,$3                ; 0749 43
                NS   $3                  ; 074a f3
                BT   4,A0737             ; 074b 84 eb
                BF   $0,A071a            ; 074d 90 cc	;always branch

A074f:          DS   $3                  ; 074f 33
                LISU 3                   ; 0750 63
                LISL 3                   ; 0751 6b
                AS   (IS)                ; 0752 cc
                BF   $2,A075d            ; 0753 92 09
A0755:          LR   (IS)-,A             ; 0755 5e
                LR   A,(IS)              ; 0756 4c
                LNK                      ; 0757 19
                LR   (IS),A              ; 0758 5c
                BF   $2,A071a            ; 0759 92 c0
                BR7  A0755               ; 075b 8f f9
A075d:          LR   (IS),A              ; 075d 5c
                BF   $0,A071a            ; 075e 90 bb	;always branch

A0760:          LIS  $0                  ; 0760 70
                XS   $2                  ; 0761 e2
                BT   1,A076e             ; 0762 81 0b
                LR   A,$8                ; 0764 48
                LR   $0,A                ; 0765 50
                LIS  $4                  ; 0766 74
                LR   $8,A                ; 0767 58
                LISL 3                   ; 0768 6b
                PI   $27b7               ; 0769 28 27 b7
                LR   A,$0                ; 076c 40
                LR   $8,A                ; 076d 58
A076e:          PI   $40bc               ; 076e 28 40 bc
                PK                       ; 0771 0c

; Matches Money_Minder_vb1000mm.asm $1775-$17FF through $07FC
                LR   K,P                 ; 0772 08
                PI   $40a9               ; 0773 28 40 a9
                PI   $41c8               ; 0776 28 41 c8
                LISL 3                   ; 0779 6b
A077a:          LISU 3                   ; 077a 63
                LR   A,(IS)              ; 077b 4c
                LISU 5                   ; 077c 65
                LR   (IS)-,A             ; 077d 5e
                BR7  A077a               ; 077e 8f fb
                LI   $1f                 ; 0780 20 1f
                LR   $0,A                ; 0782 50
                LISU 4                   ; 0783 64
                LISL 4                   ; 0784 6c
                LIS  $0                  ; 0785 70
A0786:          LR   (IS)-,A             ; 0786 5e
                BR7  A0786               ; 0787 8f fe
                LR   $1,A                ; 0789 51
                LISU 5                   ; 078a 65
                LISL 0                   ; 078b 68
                LR   A,(IS)              ; 078c 4c
                NS   (IS)                ; 078d fc
                BT   1,A079d             ; 078e 81 0e
                LI   $f0                 ; 0790 20 f0
                LR   $1,A                ; 0792 51
                LR   A,$8                ; 0793 48
                LR   $2,A                ; 0794 52
                LISL 3                   ; 0795 6b
                LIS  $4                  ; 0796 74
                LR   $8,A                ; 0797 58
                PI   $27b7               ; 0798 28 27 b7
                LR   A,$2                ; 079b 42
                LR   $8,A                ; 079c 58
A079d:          LISL 3                   ; 079d 6b
                LISU 5                   ; 079e 65
                PI   $27c6               ; 079f 28 27 c6
                LISL 0                   ; 07a2 68
                LI   $80                 ; 07a3 20 80
                NS   (IS)                ; 07a5 fc
                BF   $4,A07ad            ; 07a6 94 06
                DS   $0                  ; 07a8 30
                BF   $4,A079d            ; 07a9 94 f3
                BF   $0,A07f3            ; 07ab 90 47	;always branch

A07ad:          LISL 3                   ; 07ad 6b
                LISU 5                   ; 07ae 65
                PI   $27c6               ; 07af 28 27 c6
                LIS  $0                  ; 07b2 70
                LNK                      ; 07b3 19
                LR   $2,A                ; 07b4 52
                LISU 4                   ; 07b5 64
                LISL 4                   ; 07b6 6c
                PI   $27c6               ; 07b7 28 27 c6
                LISL 4                   ; 07ba 6c
                LR   A,(IS)              ; 07bb 4c
                AS   $2                  ; 07bc c2
                LR   (IS),A              ; 07bd 5c
                DS   $0                  ; 07be 30
                BT   4,A07e2             ; 07bf 84 22
                LIS  $8                  ; 07c1 78
                NS   $0                  ; 07c2 f0
                BT   4,A07c8             ; 07c3 84 04
                PI   $41c8               ; 07c5 28 41 c8
A07c8:          LISL 4                   ; 07c8 6c
                LISU 4                   ; 07c9 64
A07ca:          LIS  $f                  ; 07ca 7f
                NS   (IS)                ; 07cb fc
                CI   $04                 ; 07cc 25 04
                BT   1,A07d2             ; 07ce 81 03
                AI   $03                 ; 07d0 24 03
A07d2:          LR   $2,A                ; 07d2 52
                LR   A,(IS)              ; 07d3 4c
                SR   4                   ; 07d4 14
                CI   $04                 ; 07d5 25 04
                BT   1,A07db             ; 07d7 81 03
                AI   $03                 ; 07d9 24 03
A07db:          SL   4                   ; 07db 15
                AS   $2                  ; 07dc c2
                LR   (IS)-,A             ; 07dd 5e
                BR7  A07ca               ; 07de 8f eb
                BF   $0,A07ad            ; 07e0 90 cc	;always branch

A07e2:          LISL 0                   ; 07e2 68
                LI   $f0                 ; 07e3 20 f0
                NS   (IS)                ; 07e5 fc
                BT   4,A07f0             ; 07e6 84 09
                LI   $99                 ; 07e8 20 99
                LISL 4                   ; 07ea 6c
A07eb:          LR   (IS)-,A             ; 07eb 5e
                BR7  A07eb               ; 07ec 8f fe
                BF   $0,A07f3            ; 07ee 90 04	;always branch

A07f0:          LR   A,$1                ; 07f0 41
                AS   (IS)                ; 07f1 cc
                LR   (IS),A              ; 07f2 5c
A07f3:          PI   $41c8               ; 07f3 28 41 c8
                PI   $40bc               ; 07f6 28 40 bc
                PK                       ; 07f9 0c

				db   $00,$00,$00,$00,$00,$00
