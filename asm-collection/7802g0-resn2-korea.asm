;RES2

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/25/2010

org $2000

;VLSI registers
;write only
VID_COMMAND:	equ $08F7
VID_BKGCOLOR:	equ $08F5
VID_FINALMOD:	equ $08F2
VID_YINTLOW:	equ $08f0


;read only
VID_XFREEZE	equ $08f8
VID_YFREEZELO	equ $08f9
VID_YFREEZEHI	equ $08fA	;and odd/even frame, and y current hi
VID_CURYLO	equ $08fB


;16 registers in each range, 1 per sprite, read/write
VID_RPL:	equ 0x800	;sprite bitmap low address bits
VID_RPH:	equ 0x810	;sprite bitmap hi address bits and color
VID_DELX:	equ 0x820	;sprite width, intensity, xcopy bit
VID_DELY:	equ 0x830	;sprite height
VID_XV:		equ 0x840	;sprite x-position
VID_YVLA:	equ 0x850	;sprite y-position low list A
VID_YVLB:	equ 0x860	;sprite y-position low list B
VID_YXA:	equ 0x870	;sprite y-position hi and x order list A
VID_YXB:	equ 0x880	;sprite y-position hi and x order list B

;RAM $0C00-$0FFF
TXTBUF: 		equ $0F3F	;TEXT editor buffer - 7x16=112 bytes
CURSORPOS:		equ $0FDF
SHIFTSTATE:		equ $0FE2
VIDEOMODE:		equ $0FEA

;RES1 $4000-$47FF
PUSHK: 			equ $40A9
POPK: 			equ $40BC
SETUPSTACK: 	equ $40D0
DRAWCHAR: 		equ $40D9
BACKSPACE:		equ $4122
INCCURSOR:		equ $412D
CLRSCREEN: 		EQU $41D5
PRINT:			equ $4205
READKBJOY: 		equ $4361
COPYMEMTOMEM: 	equ $43CD
GETKEY: 		equ $43D6
SPECIAL: 		equ $442A

                db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;2000
                db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;2008
                
                ;FONT - this strange order is how the keys are read from the keyboard
                db   $00,$00,$00,$00,$00,$00,$00   ;2010 <SPACE>
                db   $7C,$10,$10,$10,$10,$10,$7C   ;2017 I
                db   $28,$28,$00,$00,$00,$00,$00   ;201E "
                db   $82,$82,$82,$82,$82,$82,$7C   ;2025 U
                db   $38,$38,$38,$38,$00,$38,$38   ;202C !
                db   $82,$44,$28,$10,$10,$10,$10   ;2033 Y
                db   $00,$10,$00,$7C,$00,$10,$00   ;203A ÷
                db   $FE,$10,$10,$10,$10,$10,$10   ;2041 T
                db   $00,$44,$28,$10,$28,$44,$00   ;2048 x
                db   $FC,$82,$82,$FC,$88,$84,$82   ;204F R
                db   $7C,$82,$82,$7E,$02,$04,$78   ;2056 9
                db   $FE,$80,$80,$F8,$80,$80,$FE   ;205D E
                db   $7C,$82,$82,$7C,$82,$82,$7C   ;2064 8
                db   $82,$82,$82,$92,$92,$54,$28   ;206B W
                db   $7E,$02,$04,$08,$10,$10,$10   ;2072 7
                db   $7C,$82,$82,$82,$8A,$84,$7A   ;2079 Q
                db   $C2,$C4,$08,$10,$20,$46,$86   ;2080 %
                db   $7C,$82,$82,$FE,$82,$82,$82   ;2087 A
                db   $00,$00,$00,$00,$00,$30,$30   ;208E .
                db   $7C,$82,$82,$82,$82,$82,$7C   ;2095 O (letter)
                db   $00,$24,$66,$00,$00,$66,$24   ;209C #
                db   $84,$88,$90,$E0,$90,$88,$84   ;20A3 K
                db   $80,$40,$20,$20,$20,$40,$80   ;20AA )
                db   $02,$02,$02,$02,$02,$82,$7C   ;20B1 J
                db   $02,$04,$08,$08,$08,$04,$02   ;20B8 (
                db   $82,$82,$82,$FE,$82,$82,$82   ;20BF H
                db   $02,$04,$08,$10,$20,$40,$80   ;20C6 /
                db   $7E,$80,$80,$8E,$82,$82,$7C   ;20CD G
                db   $00,$00,$00,$7C,$00,$00,$00   ;20D4 -
                db   $FE,$80,$80,$F8,$80,$80,$80   ;20DB F
                db   $3C,$40,$80,$FC,$82,$82,$7C   ;20E2 6
                db   $FC,$42,$42,$42,$42,$42,$FC   ;20E9 D
                db   $FC,$80,$80,$FC,$04,$84,$7C   ;20F0 5
                db   $7C,$82,$80,$7C,$02,$82,$7C   ;20f7 S
                db   $28,$48,$88,$FE,$08,$08,$08   ;20FE 4
                db   $FE,$04,$08,$10,$20,$40,$FE   ;2105 Z
                db   $10,$30,$10,$10,$10,$10,$7C   ;210C 1
                db   $FC,$82,$82,$FC,$80,$80,$80   ;2113 P
                db   $00,$10,$7C,$50,$50,$7C,$10   ;211A ¢
                db   $80,$80,$80,$80,$80,$80,$FE   ;2121 L
                db   $10,$7C,$50,$7C,$34,$7C,$10   ;2128 $
                db   $82,$C6,$AA,$92,$82,$82,$82   ;212F M
                db   $00,$18,$18,$00,$18,$18,$00   ;2136 :
                db   $82,$C2,$A2,$92,$8A,$86,$82   ;213D N
                db   $00,$00,$00,$18,$18,$08,$10   ;2144 ' (apostrophe)
                db   $FC,$82,$82,$FC,$82,$82,$FC   ;214B D
                db   $00,$00,$7C,$00,$7C,$00,$00   ;2152 =
                db   $82,$44,$44,$28,$28,$10,$10   ;2159 V
                db   $00,$10,$10,$7C,$10,$10,$00   ;2160 +
                db   $7C,$82,$80,$80,$80,$82,$7C   ;2167 C
                db   $7C,$82,$02,$1C,$02,$82,$7C   ;216E 3
                db   $82,$44,$28,$10,$28,$44,$82   ;2175 X
                db   $7C,$82,$02,$7C,$80,$80,$FE   ;217C 2
                db   $3C,$42,$02,$1C,$10,$00,$10   ;2183 ?
                db   $18,$24,$24,$24,$24,$24,$18   ;218A 0 (number)
                db   $18,$18,$00,$18,$18,$08,$10   ;2191 ;
                db   $00,$00,$FE,$44,$44,$44,$44   ;2198 <PI>
                db   $04,$08,$10,$20,$00,$00,$00   ;219F , (comma)
                db   $00,$10,$38,$7C,$38,$10,$00   ;21A6 * (asterisk)
                
A21AD:            
                LR   K,P                 ; 21ad 08
                PI   PUSHK               ; 21ae 28 40 a9
                LR   A,$a                ; 21b1 4a
                LISU 2                   ; 21b2 62
                LISL 0                   ; 21b3 68
                LR   (IS)+,A             ; 21b4 5d
                LIS  $1                  ; 21b5 71
A21b6:          DS   $a                  ; 21b6 3a
                BF   $1,A21bc            ; 21b7 91 04
                SL   1                   ; 21b9 13
A21ba:          BF   $0,A21b6            ; 21ba 90 fb

A21bc:          OUTS 0                   ; 21bc b0		;keyboard columns/joystick pots
                LIS  $8                  ; 21bd 78
                SL   4                   ; 21be 15
                DCI  $0fde               ; 21bf 2a 0f de
                LR   H,DC                ; 21c2 11
                DI                       ; 21c3 1a
                OM                       ; 21c4 8b
                LR   DC,H                ; 21c5 10
                ST                       ; 21c6 17
                LR   $8,A                ; 21c7 58
                DCI  $08fb               ; 21c8 2a 08 fb
                LR   Q,DC                ; 21cb 0e
                LM                       ; 21cc 16
A21cd:          LR   DC,Q                ; 21cd 0f
                CM                       ; 21ce 8d
                BT   4,A21cd             ; 21cf 84 fd
                INC                      ; 21d1 1f
                LR   (IS),A              ; 21d2 5c
                LR   A,$8                ; 21d3 48
                OUTS 1                   ; 21d4 b1		;keyboard rows/joystick buttons
                LIS  $2                  ; 21d5 72
                DCI  VIDEOMODE           ; 21d6 2a 0f ea
                OM                       ; 21d9 8b
                NI   $f7                 ; 21da 21 f7
                DCI  VID_COMMAND       ; 21dc 2a 08 f7
                ST                       ; 21df 17
                DCI  VIDEOMODE           ; 21e0 2a 0f ea
                ST                       ; 21e3 17
                LR   W,J                 ; 21e4 1d
                LIS  $d                  ; 21e5 7d
                AS   (IS)                ; 21e6 cc
A21e7:          LR   DC,Q                ; 21e7 0f
                CM                       ; 21e8 8d
A21e9:          BF   $2,A21e7            ; 21e9 92 fd
                LR   DC,H                ; 21eb 10
                DI                       ; 21ec 1a
                LM                       ; 21ed 16
                NI   $7f                 ; 21ee 21 7f
A21f0:          OUTS 1                   ; 21f0 b1		;keyboard rows/joystick buttons
                LR   DC,H                ; 21f1 10
                ST                       ; 21f2 17
                LR   W,J                 ; 21f3 1d
                LIS  $0                  ; 21f4 70
                LR   QU,A                ; 21f5 06
                LR   QL,A                ; 21f6 07
                LR   $a,A                ; 21f7 5a
A21f8:          LI   $e4                 ; 21f8 20 e4
                LR   $b,A                ; 21fa 5b
                LR   A,(IS)              ; 21fb 4c
                COM                      ; 21fc 18
                INC                      ; 21fd 1f
                DCI  $08f9               ; 21fe 2a 08 f9
                AM                       ; 2201 88
                LR   (IS),A              ; 2202 5c
                CI   $0d                 ; 2203 25 0d
                BF   $2,A2237            ; 2205 92 31
A2207:          PI   A22cd               ; 2207 28 22 cd
                DS   (IS)                ; 220a 3c
                BF   $4,A2207            ; 220b 94 fb
                DCI  $08f8               ; 220d 2a 08 f8
                LM                       ; 2210 16
                LR   $b,A                ; 2211 5b
                PI   A22cd               ; 2212 28 22 cd
                LI   $26                 ; 2215 20 26
                LR   $b,A                ; 2217 5b
                PI   A22bf               ; 2218 28 22 bf
                LR   A,QU                ; 221b 02
                LR   (IS)+,A             ; 221c 5d
                LR   A,QL                ; 221d 03
                LR   (IS)-,A             ; 221e 5e
                LR   A,(IS)-             ; 221f 4e
                LR   A,(IS)+             ; 2220 4d
                SL   1                   ; 2221 13
                SL   1                   ; 2222 13
                DCI  $0c00               ; 2223 2a 0c 00
                ADC                      ; 2226 8e
                LM                       ; 2227 16
                LR   $a,A                ; 2228 5a
                LM                       ; 2229 16
                LR   $b,A                ; 222a 5b
                PI   A22bf               ; 222b 28 22 bf
                BF   $2,A2239            ; 222e 92 0a
                LI   $fe                 ; 2230 20 fe
                ADC                      ; 2232 8e
                LR   A,(IS)+             ; 2233 4d
                ST                       ; 2234 17
                LR   A,(IS)-             ; 2235 4e
                ST                       ; 2236 17
A2237:          BF   $0,A22ab            ; 2237 90 73

A2239:          LR   A,(IS)+             ; 2239 4d
                LR   QU,A                ; 223a 06
                LR   A,(IS)-             ; 223b 4e
                LR   QL,A                ; 223c 07
                LM                       ; 223d 16
                LR   $a,A                ; 223e 5a
                LM                       ; 223f 16
                LR   $b,A                ; 2240 5b
                PI   A22bf               ; 2241 28 22 bf
                BT   2,A2250             ; 2244 82 0b
                LI   $fe                 ; 2246 20 fe
                ADC                      ; 2248 8e
                LR   A,(IS)+             ; 2249 4d
                ST                       ; 224a 17
                LR   A,(IS)-             ; 224b 4e
                ST                       ; 224c 17
                LIS  $0                  ; 224d 70
                BF   $0,A22ad            ; 224e 90 5e
                
A2250:          LR   A,QU                ; 2250 02
                LR   (IS)+,A             ; 2251 5d
                LR   A,QL                ; 2252 03
                LR   (IS)-,A             ; 2253 5e
                LI   $fc                 ; 2254 20 fc
                ADC                      ; 2256 8e
                LM                       ; 2257 16
                LR   QU,A                ; 2258 06
                LM                       ; 2259 16
                LR   QL,A                ; 225a 07
                PI   A22cd               ; 225b 28 22 cd
                DCI  $0535               ; 225e 2a 05 35
                LR   H,DC                ; 2261 11
                PI   A22bf               ; 2262 28 22 bf
                BT   2,A226a             ; 2265 82 04
                LIS  $8                  ; 2267 78
                BF   $0,A228d            ; 2268 90 24
                
A226a:          LIS  $1                  ; 226a 71
                LR   $a,A                ; 226b 5a
                LIS  $a                  ; 226c 7a
                LR   $b,A                ; 226d 5b
                PI   A22bf               ; 226e 28 22 bf
                BT   2,A2276             ; 2271 82 04
                LIS  $6                  ; 2273 76
                BF   $0,A228d            ; 2274 90 18
                
A2276:          LIS  $1                  ; 2276 71
                LR   $a,A                ; 2277 5a
                LIS  $c                  ; 2278 7c
                LR   $b,A                ; 2279 5b
                PI   A22bf               ; 227a 28 22 bf
                BT   2,A2282             ; 227d 82 04
                LIS  $4                  ; 227f 74
                BF   $0,A228d            ; 2280 90 0c
                
A2282:          DCI  $0214               ; 2282 2a 02 14
                LR   H,DC                ; 2285 11
                PI   A22bf               ; 2286 28 22 bf
                LIS  $3                  ; 2289 73
                BF   $2,A228d            ; 228a 92 02
                LIS  $2                  ; 228c 72
A228d:          LISL 0                   ; 228d 68
                LR   (IS)+,A             ; 228e 5d
                LIS  $0                  ; 228f 70
                LR   QU,A                ; 2290 06
                LR   QL,A                ; 2291 07
                LR   A,(IS)+             ; 2292 4d
                LR   $a,A                ; 2293 5a
                LR   A,(IS)-             ; 2294 4e
                LR   $b,A                ; 2295 5b
                LISL 0                   ; 2296 68
A2297:          PI   A22cd               ; 2297 28 22 cd
                DS   (IS)                ; 229a 3c
                BF   $4,A2297            ; 229b 94 fb
                LR   A,QU                ; 229d 02
                SR   4                   ; 229e 14
                BF   $4,A22ab            ; 229f 94 0b
                LR   A,QU                ; 22a1 02
                SL   4                   ; 22a2 15
                LR   (IS),A              ; 22a3 5c
                LR   A,QL                ; 22a4 03
                SR   4                   ; 22a5 14
                XS   (IS)                ; 22a6 ec
                CI   $c7                 ; 22a7 25 c7
                BT   2,A22ad             ; 22a9 82 03
A22ab:          LI   $c7                 ; 22ab 20 c7
A22ad:          LR   (IS),A              ; 22ad 5c
                LIS  $2                  ; 22ae 72
                DCI  VIDEOMODE           ; 22af 2a 0f ea
                LR   H,DC                ; 22b2 11
                XM                       ; 22b3 8c
                LR   DC,H                ; 22b4 10
                ST                       ; 22b5 17
                DCI  VID_COMMAND       ; 22b6 2a 08 f7
                ST                       ; 22b9 17
                PI   POPK                ; 22ba 28 40 bc
                LR   A,(IS)-             ; 22bd 4e
                PK                       ; 22be 0c

A22bf:          LR   K,P                 ; 22bf 08
                LR   A,$a                ; 22c0 4a
                COM                      ; 22c1 18
                LR   $a,A                ; 22c2 5a
                LR   A,$b                ; 22c3 4b
                COM                      ; 22c4 18
                INC                      ; 22c5 1f
                LR   $b,A                ; 22c6 5b
                LR   A,$a                ; 22c7 4a
                LNK                      ; 22c8 19
                LR   $a,A                ; 22c9 5a
                LR   A,QU                ; 22ca 02
                BT   2,A22d7             ; 22cb 82 0b

A22cd:          LR   K,P                 ; 22cd 08
                LR   A,QL                ; 22ce 03
                AS   $b                  ; 22cf cb
                LR   QL,A                ; 22d0 07
                LR   A,QU                ; 22d1 02
                LNK                      ; 22d2 19
                BT   2,A22d8             ; 22d3 82 04
                AS   $a                  ; 22d5 ca
                LR   QU,A                ; 22d6 06
A22d7:          PK                       ; 22d7 0c

A22d8:          LR   A,$a                ; 22d8 4a
                LR   QU,A                ; 22d9 06
                PK                       ; 22da 0c

                LR   K,P                 ; 22db 08
                DCI  $0c00               ; 22dc 2a 0c 00
                LIS  $8                  ; 22df 78
                LR   $a,A                ; 22e0 5a
A22e1:          LIS  $3                  ; 22e1 73
                ST                       ; 22e2 17
                LI   $53                 ; 22e3 20 53
                ST                       ; 22e5 17
                LIS  $3                  ; 22e6 73
                ST                       ; 22e7 17
                LI   $3f                 ; 22e8 20 3f
                ST                       ; 22ea 17
                DS   $a                  ; 22eb 3a
                BF   $4,A22e1            ; 22ec 94 f4
                PK                       ; 22ee 0c

A22ef:          PI   SETUPSTACK          ; 22ef 28 40 d0
                PI   $45db               ; 22f2 28 45 db
                DCI  $0fe0               ; 22f5 2a 0f e0
                LIS  $0                  ; 22f8 70
                XM                       ; 22f9 8c
                BT   4,A2334             ; 22fa 84 39
                LISL 4                   ; 22fc 6c
                LIS  $7                  ; 22fd 77
                SL   4                   ; 22fe 15
                LR   (IS),A              ; 22ff 5c
                DCI  TXTBUF              ; 2300 2a 0f 3f
                PI   PRINT               ; 2303 28 42 05
                PI   $4501               ; 2306 28 45 01
A2309:          PI   $424d               ; 2309 28 42 4d
                PI   READKBJOY           ; 230c 28 43 61
                LR   A,$8                ; 230f 48
                SL   1                   ; 2310 13
                BT   4,A2318             ; 2311 84 06
                LIS  $0                  ; 2313 70
                LR   $3,A                ; 2314 53
                JMP  $452b               ; 2315 29 45 2b
A2318:          LIS  $0                  ; 2318 70
                LR   $8,A                ; 2319 58
A231a:          DCI  $08fb               ; 231a 2a 08 fb
                LM                       ; 231d 16
                DCI  $0fe5               ; 231e 2a 0f e5
                CM                       ; 2321 8d
                BF   $2,A2309            ; 2322 92 e6
                LR   A,$8                ; 2324 48
                COM                      ; 2325 18
                LR   $8,A                ; 2326 58
                OUTS 0                   ; 2327 b0		;keyboard columns/joystick pots
                DCI  $0fdd               ; 2328 2a 0f dd
                ST                       ; 232b 17
                LIS  $1                  ; 232c 71
                SL   4                   ; 232d 15
                OUTS 1                   ; 232e b1		;keyboard rows/joystick buttons
                ST                       ; 232f 17
                LIS  $0                  ; 2330 70
                OUTS 1                   ; 2331 b1		;keyboard rows/joystick buttons
                BF   $0,A231a            ; 2332 90 e7
                
A2334:          LIS  $1                  ; 2334 71
                SL   4                   ; 2335 15
                LR   $3,A                ; 2336 53
                DCI  $0ff2               ; 2337 2a 0f f2
                PI   $413f               ; 233a 28 41 3f
                PI   $4501               ; 233d 28 45 01
                BF   $0,A2309            ; 2340 90 c8

                DCI  $0fe6               ; 2342 2a 0f e6	;TEXT hit from main menu
                LI   $23                 ; 2345 20 23
                ST                       ; 2347 17
                LI   $54                 ; 2348 20 54
                ST                       ; 234a 17
                DCI  VIDEOMODE           ; 234b 2a 0f ea
                LR   H,DC                ; 234e 11
                LI   $40                 ; 234f 20 40
                OM                       ; 2351 8b
                LR   DC,H                ; 2352 10
                ST                       ; 2353 17
A2354:          PI   SETUPSTACK          ; 2354 28 40 d0
                PI   $45db               ; 2357 28 45 db
                DCI  $0877               ; 235a 2a 08 77
                LIS  $7                  ; 235d 77
                ST                       ; 235e 17
                PI   $45b0               ; 235f 28 45 b0
                DCI  $0fe0               ; 2362 2a 0f e0
                LIS  $0                  ; 2365 70
                XM                       ; 2366 8c
                DCI  TXTBUF              ; 2367 2a 0f 3f
                LISL 4                   ; 236a 6c
                LI   $70                 ; 236b 20 70
                LR   (IS),A              ; 236d 5c
                BF   $4,A2377            ; 236e 94 08
                LIS  $0                  ; 2370 70
A2371:          ST                       ; 2371 17
                DS   (IS)                ; 2372 3c
                BF   $4,A2371            ; 2373 94 fd
                BF   $0,A237a            ; 2375 90 04
                
A2377:          PI   PRINT               ; 2377 28 42 05
A237a:          LISL 4                   ; 237a 6c
                LIS  $0                  ; 237b 70
                LR   (IS),A              ; 237c 5c
                PI   GETKEY              ; 237d 28 43 d6
                BT   4,A237a             ; 2380 84 f9
                BF   $1,A237a            ; 2382 91 f7
                LR   A,$8                ; 2384 48
                CI   $41                 ; 2385 25 41		;SPECIAL
                BF   $4,A238e            ; 2387 94 06
                PI   SPECIAL             ; 2389 28 44 2a
                BF   $0,A2354            ; 238c 90 c7
                
A238e:          CI   $3a                 ; 238e 25 3a		;*
                BF   $2,A23ac            ; 2390 92 1b
                DCI  $0fe0               ; 2392 2a 0f e0
                LIS  $1                  ; 2395 71
                ST                       ; 2396 17
                DCI  CURSORPOS           ; 2397 2a 0f df
                LM                       ; 239a 16
                DCI  TXTBUF              ; 239b 2a 0f 3f
                ADC                      ; 239e 8e
                LR   A,$8                ; 239f 48
                ST                       ; 23a0 17
                PI   DRAWCHAR            ; 23a1 28 40 d9
A23a4:          PI   INCCURSOR           ; 23a4 28 41 2d
A23a7:          PI   $45b0               ; 23a7 28 45 b0
                BF   $0,A237a            ; 23aa 90 cf
                
A23ac:          CI   $3f                 ; 23ac 25 3f		;space
                BT   4,A23a4             ; 23ae 84 f5
                CI   $47                 ; 23b0 25 47		;back
                BF   $4,A23b9            ; 23b2 94 06
                PI   BACKSPACE           ; 23b4 28 41 22
                BF   $0,A23a7            ; 23b7 90 ef
         
A23b9:          CI   $43                 ; 23b9 25 43		;next
                BF   $4,A23d3            ; 23bb 94 17
                LIS  $1                  ; 23bd 71
                SL   4                   ; 23be 15
A23bf:          DCI  CURSORPOS           ; 23bf 2a 0f df
                LR   H,DC                ; 23c2 11
                AM                       ; 23c3 88
                SR   4                   ; 23c4 14
                SL   4                   ; 23c5 15
                BT   1,A23c9             ; 23c6 81 02
                LIS  $0                  ; 23c8 70
A23c9:          CI   $70                 ; 23c9 25 70
                BF   $4,A23cf            ; 23cb 94 03
                LIS  $6                  ; 23cd 76
                SL   4                   ; 23ce 15
A23cf:          LR   DC,H                ; 23cf 10
                ST                       ; 23d0 17
                BF   $0,A23a7            ; 23d1 90 d5
      
A23d3:          CI   $45                 ; 23d3 25 45		;previous
                BF   $4,A23db            ; 23d5 94 05
                LI   $ff                 ; 23d7 20 ff
                BF   $0,A23bf            ; 23d9 90 e5
                
A23db:          CI   $3d                 ; 23db 25 3d		;erase
                BF   $4,A237a            ; 23dd 94 9c
                DCI  CURSORPOS           ; 23df 2a 0f df
                LM                       ; 23e2 16
                DCI  TXTBUF              ; 23e3 2a 0f 3f
                ADC                      ; 23e6 8e
                LIS  $0                  ; 23e7 70
                ST                       ; 23e8 17
                LR   $8,A                ; 23e9 58
                PI   DRAWCHAR            ; 23ea 28 40 d9
                BF   $0,A237a            ; 23ed 90 8c

SELKEYTEXT:
          		;SELECT KEY				;23F2
				;B, F, R, V
				;ERASE, SPECIAL
				db   $00,$00,$00
				DB   $21,$0B,$27,$0B,$31,$07,$00,$15
				DB   $0B,$05,$00,$00,$00,$00,$00,$00
				DB   $2D,$2C,$00,$1D,$2C,$00,$09,$2C
				DB   $00,$2F,$00,$00,$00,$00,$0B,$09
				DB   $11,$21,$0B,$2C,$00,$21,$25,$0B
				DB   $31,$01,$11,$27,00
				
				;AM PM					;241F
				db   $11,$29,$00,$25,$29,$00
                
                ;SUNSATFRITHUWEDTUEMON	;2425
                db   $21,$03,$2B, $21,$11,$07, $1D,$09,$01, $07,$19,$03, $0D,$0B,$1F, $07,$03,$0B
MONTEXT:        db	 $29,$13,$2B

				;DECNOVOCTSEPAUGJULJUNMAYAPRMARFEBJAN	;243A
				db   $1F,$0B,$31, $2B,$13,$2F, $13,$31,$07, $21,$0B,$25, $11,$03,$1B, $17,$03,$27
				db   $17,$03,$2B, $29,$11,$05, $11,$25,$09, $29,$11,$09, $1D,$0B,$2D
JANTEXT:		db   $17,$11,$2B
				
NUMBERS:        db   $0a,$0c,$0e,$1e,$20,$22,$32,$34,$24,$36	;9, 8, 7, 6, 5, 4, 3, 2, 1, 0

PRINTWRKEY:     LR   K,P                 ; 2468 08
                PI   PUSHK               ; 2469 28 40 a9
                PI   CLRSCREEN           ; 246c 28 41 d5
                DCI  CURSORPOS           ; 246f 2a 0f df
                LI   $33                 ; 2472 20 33
                ST                       ; 2474 17
                LISU 2                   ; 2475 62
                LISL 4                   ; 2476 6c
                LIS  $a                  ; 2477 7a
                DCI  WRONGTEXT           ; 2478 2a 27 ea
                LR   (IS),A              ; 247b 5c
                PI   PRINT               ; 247c 28 42 05
                LI   $78                 ; 247f 20 78
                LR   (IS),A              ; 2481 5c
A2482:          PI   $41c8               ; 2482 28 41 c8
                LISL 4                   ; 2485 6c
                DS   (IS)                ; 2486 3c
                BF   $4,A2482            ; 2487 94 fa
                PI   POPK                ; 2489 28 40 bc
                PK                       ; 248c 0c

SETALARM:
                DCI  $0fe6               ; 248d 2a 0f e6	;ALARM hit from main menu
                LI   $24                 ; 2490 20 24
                ST                       ; 2492 17
                LI   $96                 ; 2493 20 96
                ST                       ; 2495 17
                LIS  $1                  ; 2496 71
                SL   4                   ; 2497 15
                LR   $3,A                ; 2498 53
                PI   SETUPSTACK          ; 2499 28 40 d0
                PI   $45db               ; 249c 28 45 db
                LISL 6                   ; 249f 6e
                LR   A,(IS)              ; 24a0 4c
                SL   1                   ; 24a1 13
                BT   1,A24cf             ; 24a2 81 2c
                
A24a4:          DCI  $0ff2               ; 24a4 2a 0f f2
                PI   $413f               ; 24a7 28 41 3f
A24aa:          LISL 4                   ; 24aa 6c
                LI   $3c                 ; 24ab 20 3c
                LR   (IS),A              ; 24ad 5c
                PI   GETKEY              ; 24ae 28 43 d6
                BT   4,A24aa             ; 24b1 84 f8
                BF   $1,A24aa            ; 24b3 91 f6
                
                LR   A,$8                ; 24b5 48
                CI   $41                 ; 24b6 25 41	;SPECIAL
                BF   $4,A24bf            ; 24b8 94 06
                PI   SPECIAL             ; 24ba 28 44 2a
                BF   $0,A24a4            ; 24bd 90 e6
                
A24bf:          CI   $21                 ; 24bf 25 21	;S
                BT   4,A24cf             ; 24c1 84 0d
                CI   $3d                 ; 24c3 25 3d	;erase
                BT   4,A24ea             ; 24c5 84 24
                PI   PRINTWRKEY          ; 24c7 28 24 68
                PI   CLRSCREEN           ; 24ca 28 41 d5
                BF   $0,A24a4            ; 24cd 90 d6
                
A24cf:          LI   $bf                 ; 24cf 20 bf			;S was hit
                LR   $8,A                ; 24d1 58
                PI   A24f8               ; 24d2 28 24 f8
                PI   CLRSCREEN           ; 24d5 28 41 d5
                DCI  $0ff2               ; 24d8 2a 0f f2
                LR   H,DC                ; 24db 11
                PI   $46aa               ; 24dc 28 46 aa
                LR   DC,H                ; 24df 10
                PI   $413f               ; 24e0 28 41 3f
                LISL 6                   ; 24e3 6e
                LIS  $4                  ; 24e4 74
                SL   4                   ; 24e5 15
                XS   (IS)                ; 24e6 ec
                LR   (IS),A              ; 24e7 5c
                BF   $0,A24a4            ; 24e8 90 bb
                
A24ea:          LISL 6                   ; 24ea 6e				;erase was hit
                LI   $bf                 ; 24eb 20 bf
                NS   (IS)                ; 24ed fc
                LR   (IS),A              ; 24ee 5c
                PI   $41c8               ; 24ef 28 41 c8
                PI   CLRSCREEN           ; 24f2 28 41 d5
                JMP  $403c               ; 24f5 29 40 3c

A24f8:          LR   K,P                 ; 24f8 08
                PI   PUSHK               ; 24f9 28 40 a9
                LISL 6                   ; 24fc 6e
                LR   A,$8                ; 24fd 48
                NS   (IS)                ; 24fe fc
                LR   (IS),A              ; 24ff 5c
A2500:          PI   CLRSCREEN           ; 2500 28 41 d5

                LIS  $6                  ; 2503 76
                LR   $5,A                ; 2504 55
                LIS  $3                  ; 2505 73
                LR   $6,A                ; 2506 56
                LISU 2                   ; 2507 62
                DCI  SETCLKTXT           ; 2508 2a 25 d3
                LR   A,$3                ; 250b 43
                ADC                      ; 250c 8e
                LISL 4                   ; 250d 6c
                LIS  $1                  ; 250e 71
                SL   4                   ; 250f 15
                LR   (IS),A              ; 2510 5c
                PI   PRINT               ; 2511 28 42 05
                
                LIS  $2                  ; 2514 72
                LR   $4,A                ; 2515 54
                DCI  YRMNDTTXT           ; 2516 2a 25 b3
A2519:          LIS  $1                  ; 2519 71
                SL   4                   ; 251a 15
                LR   (IS),A              ; 251b 5c
                PI   PRINT               ; 251c 28 42 05
                
                XDC                      ; 251f 2c
                DCI  CURSORPOS           ; 2520 2a 0f df
                LR   Q,DC                ; 2523 0e
                LI   $30                 ; 2524 20 30
                ST                       ; 2526 17
                XDC                      ; 2527 2c
                DS   $4                  ; 2528 34
                BF   $4,A2519            ; 2529 94 ef
                LR   DC,Q                ; 252b 0f
                LI   $20                 ; 252c 20 20
                ST                       ; 252e 17
A252f:          LISU 3                   ; 252f 63
                LISL 3                   ; 2530 6b
                LIS  $0                  ; 2531 70
A2532:          LR   (IS)-,A             ; 2532 5e
                BR7  A2532               ; 2533 8f fe
A2535:          LISU 2                   ; 2535 62
                PI   GETKEY              ; 2536 28 43 d6
                BT   4,A2535             ; 2539 84 fb
                BF   $1,A2535            ; 253b 91 f9
                DCI  NUMBERS             ; 253d 2a 24 5e
                LIS  $9                  ; 2540 79
                LR   (IS),A              ; 2541 5c
                LR   A,$8                ; 2542 48
A2543:          CM                       ; 2543 8d
                BT   4,A254e             ; 2544 84 09
                DS   (IS)                ; 2546 3c
                BT   1,A2543             ; 2547 81 fb
                
A2549:          PI   PRINTWRKEY          ; 2549 28 24 68	;not a #
                BF   $0,A2500            ; 254c 90 b3
                
A254e:          LR   A,(IS)              ; 254e 4c			;0-9 entered
                LR   $7,A                ; 254f 57
                PI   DRAWCHAR            ; 2550 28 40 d9
                PI   INCCURSOR           ; 2553 28 41 2d
                LI   $18                 ; 2556 20 18
                AS   $6                  ; 2558 c6
                LR   IS,A                ; 2559 0b
                LR   A,$7                ; 255a 47
                LR   (IS),A              ; 255b 5c
                DS   $6                  ; 255c 36
                BT   1,A2535             ; 255d 81 d7
                LIS  $1                  ; 255f 71
                LR   $6,A                ; 2560 56
                DCI  $0fcc               ; 2561 2a 0f cc
                LR   A,$5                ; 2564 45
                ADC                      ; 2565 8e
                LISU 3                   ; 2566 63
                LISL 1                   ; 2567 69
                LR   A,(IS)-             ; 2568 4e
                SL   4                   ; 2569 15
                AS   (IS)                ; 256a cc
                LR   (IS),A              ; 256b 5c
                LIS  $6                  ; 256c 76
                XS   $5                  ; 256d e5
                BF   $4,A2578            ; 256e 94 09
                LR   A,(IS)+             ; 2570 4d
                LR   (IS),A              ; 2571 5c
                LISL 3                   ; 2572 6b
                LR   A,(IS)-             ; 2573 4e
                SL   4                   ; 2574 15
                AS   (IS)                ; 2575 cc
                LISL 0                   ; 2576 68
                LR   (IS)+,A             ; 2577 5d
A2578:          LR   A,(IS)-             ; 2578 4e
                ST                       ; 2579 17
                BR7  A2578               ; 257a 8f fd
                DS   $5                  ; 257c 35
                BF   $1,A2594            ; 257d 91 16
                
                LI   $1a                 ; 257f 20 1a	/ character
                LR   $8,A                ; 2581 58
                PI   DRAWCHAR            ; 2582 28 40 d9
                PI   INCCURSOR           ; 2585 28 41 2d
                
                LIS  $3                  ; 2588 73
                XS   $5                  ; 2589 e5
                BF   $4,A252f            ; 258a 94 a4
                DCI  CURSORPOS           ; 258c 2a 0f df
                LI   $40                 ; 258f 20 40
                ST                       ; 2591 17
                BF   $0,A252f            ; 2592 90 9c
                
A2594:          DCI  $0fcf               ; 2594 2a 0f cf
                LIS  $0                  ; 2597 70
                XM                       ; 2598 8c
                BT   4,A2549             ; 2599 84 af	if 0, say "wrong key"
                
                CI   $07                 ; 259b 25 07	if >7 say "wrong key"
                BF   $2,A2549            ; 259d 92 ab
                
                LM                       ; 259f 16		$fd0
                LIS  $0                  ; 25a0 70
                XM                       ; 25a1 8c
                BT   4,A2549             ; 25a2 84 a6	if 0 say "wrong key"
                
                CI   $12                 ; 25a4 25 12
                BF   $2,A2549            ; 25a6 92 a2	if > 12 say "wrong key"
                
                LISU 2                   ; 25a8 62
                LISL 4                   ; 25a9 6c
                LI   $78                 ; 25aa 20 78
                LR   (IS),A              ; 25ac 5c
                PI   GETKEY              ; 25ad 28 43 d6
                JMP  $41cc               ; 25b0 29 41 cc
                
                ;YEAR/MONTH/DATE	;25B3
YRMNDTTXT:      db   $05,$0B,$11,$09,$1A,$29,$13,$2B,$07,$19,$1A,$1F,$11,$07,$0B,$00
                
                ;DAY/HOUR/MIN/SEC	;25C3
                db   $1F,$11,$05,$1A,$19,$13,$03,$09,$1A,$29,$01,$2B,$1A,$21,$0B,$31                
                
                ;SET CLOCK			;25D3
SETCLKTXT:      db   $00,$00,$00,$21,$0B,$07,$00,$31,$27,$13,$31,$15,$00,$00,$00,$00
                
                ;SET ALARM			;25E3
SETALMTXT:      db   $00,$00,$00,$21,$0B,$07,$00,$11,$27,$11,$09,$29,$00,$00,$00,$00
                
A25f3:          PI   SETUPSTACK          ; 25f3 28 40 d0	;COLOR hit from main menu

                DCI  VID_COMMAND       ; 25f6 2a 08 f7
                LIS  $0                  ; 25f9 70		;disable video chips
                ST                       ; 25fa 17
                
                DCI  SHIFTSTATE          ; 25fb 2a 0f e2	;clear shift flag
                ST                       ; 25fe 17
                
                DCI  $0fc2               ; 25ff 2a 0f c2
                ST                       ; 2602 17
                
                PI   $41c8               ; 2603 28 41 c8
                
								;set up video registers
								;first, copy 0 to $80x, 0 to $81x, 0xDA to $82x, 0x06 to $83x, 0x0A to $84x
                DCI  A2661               ; 2606 2a 26 61
                XDC                      ; 2609 2c
                DCI  $0800               ; 260a 2a 08 00
                LIS  $5                  ; 260d 75		;copy 5 bytes at $2661
                LR   $8,A                ; 260e 58
A260f:          LIS  $f                  ; 260f 7f		
                LR   (IS),A              ; 2610 5c
                XDC                      ; 2611 2c
                LM                       ; 2612 16
                XDC                      ; 2613 2c
A2614:          ST                       ; 2614 17		;copy same byte 16 times
A2615:          DS   (IS)                ; 2615 3c
                BT   1,A2614             ; 2616 81 fd		;BP
                DS   $8                  ; 2618 38
                BF   $4,A260f            ; 2619 94 f5		;BNZ
                
                LI   $10                 ; 261b 20 10		;copy 16 bytes from $2666 to $850 (Y Value Low Order List A)
                LR   (IS),A              ; 261d 5c
                PI   COPYMEMTOMEM        ; 261e 28 43 cd	
                
                DCI  $0870               ; 2621 2a 08 70	;$870-$87F = f, e, d, ... 0 (X Order List A)
                LIS  $f                  ; 2624 7f		
                LR   $8,A                ; 2625 58
A2626:          LR   A,$8                ; 2626 48
                ST                       ; 2627 17
                DS   $8                  ; 2628 38
                BT   1,A2626             ; 2629 81 fc		;BP
                
                LIS  $8                  ; 262b 78		;last 8 colors, invert intensity
                LR   $8,A                ; 262c 58
                DCI  $0828               ; 262d 2a 08 28
A2630:          LR   H,DC                ; 2630 11
                LI   $60                 ; 2631 20 60
                XM                       ; 2633 8c
                LR   DC,H                ; 2634 10
                ST                       ; 2635 17
                DS   $8                  ; 2636 38
                BF   $4,A2630            ; 2637 94 f8		;BNZ
                
                DCI  A2676               ; 2639 2a 26 76
                XDC                      ; 263c 2c
                DCI  $0ffa               ; 263d 2a 0f fa
                LIS  $6                  ; 2640 76
                LR   (IS),A              ; 2641 5c
                PI   COPYMEMTOMEM        ; 2642 28 43 cd	;copy 6 bytes from 2676 to ffa: $10,$01,$26,$7C,$26,$7C	 (guess: 16 sprites, list A, info at $267C)
                						;note: $267C immediately follows        ^^^^^^^^^^^^^^
                
                DCI  VIDEOMODE           ; 2645 2a 0f ea
                LI   $64                 ; 2648 20 64		;list A active, y-zoom, enable
                ST                       ; 264a 17
                DCI  VID_COMMAND       ; 264b 2a 08 f7
                ST                       ; 264e 17
                
A264f:          PI   GETKEY              ; 264f 28 43 d6
                BT   4,A264f             ; 2652 84 fc		;loop until key
                BF   $1,A264f            ; 2654 91 fa		;ignore timeout
                
                LR   A,$8                ; 2656 48
                CI   $41                 ; 2657 25 41		;is it the SPECIAL key?
                BF   $4,A264f            ; 2659 94 f5		;nope, keep looping
                PI   SPECIAL             ; 265b 28 44 2a	;yes, set up color bars again
                JMP  A25f3               ; 265e 29 25 f3

					 ;75 bytes of data
A2661:		db   $00,$00,$da,$06,$0a,  $20,$2c,$38,$44,$50,$5c,$68,$74,$80,$8c,$98,$a4,$b0,$bc,$c8,$d4

A2676:          db   $10,$01,$26,$7C,$26,$7C
                
					;16 bytes of 0, 16 bytes of colors, 16 bytes of 6
					;in hex dump, $80x was 6, $81x was colors from below
                db   $00,$00   ;267c
                db   $00,$00,$00,$00,$00,$00,$00,$00   ;267E
                db   $00,$00,$00,$00,$00,$00, $20,$40   ;2686
                db   $60,$80,$A0,$C0,$E0,$00,$20,$40   ;268E
                db   $60,$80,$A0,$C0,$E0,$00,$06,$06   ;2696
                db   $06,$06,$06,$06,$06,$06,$06,$06   ;269E
                db   $06,$06,$06,$06,$06,$06   ;26A6

A26ac:          LR   K,P                 ; 26ac 08
                COM                      ; 26ad 18
                LISL 3                   ; 26ae 6b
A26af:          LISU 4                   ; 26af 64
                LR   A,(IS)              ; 26b0 4c
                LNK                      ; 26b1 19
                LR   J,W                 ; 26b2 1e
                LISU 3                   ; 26b3 63
                AS   (IS)                ; 26b4 cc
                LR   (IS)-,A             ; 26b5 5e
                LR   A,$9                ; 26b6 49
                LR   J,W                 ; 26b7 1e
                NI   $0a                 ; 26b8 21 0a
                XS   $9                  ; 26ba e9
                LR   $9,A                ; 26bb 59
                LR   W,J                 ; 26bc 1d
                BR7  A26af               ; 26bd 8f f1
                PK                       ; 26bf 0c

A26c0:          LR   K,P                 ; 26c0 08
                LI   $ff                 ; 26c1 20 ff
                INC                      ; 26c3 1f
                LR   J,W                 ; 26c4 1e
                LISL 3                   ; 26c5 6b
A26c6:          LISU 4                   ; 26c6 64
                LR   A,(IS)              ; 26c7 4c
                COM                      ; 26c8 18
                LR   W,J                 ; 26c9 1d
                LNK                      ; 26ca 19
                LR   J,W                 ; 26cb 1e
                LISU 3                   ; 26cc 63
                AS   (IS)                ; 26cd cc
                LR   (IS)-,A             ; 26ce 5e
                LR   A,$9                ; 26cf 49
                LR   J,W                 ; 26d0 1e
                NI   $0a                 ; 26d1 21 0a
                XS   $9                  ; 26d3 e9
                LR   $9,A                ; 26d4 59
                BR7  A26c6               ; 26d5 8f f0
                LR   W,J                 ; 26d7 1d
                PK                       ; 26d8 0c

                LR   K,P                 ; 26d9 08
                PI   PUSHK               ; 26da 28 40 a9
                LISU 3                   ; 26dd 63
                LISL 0                   ; 26de 68
                LR   A,(IS)              ; 26df 4c
                NI   $80                 ; 26e0 21 80
                LR   $a,A                ; 26e2 5a
                SR   1                   ; 26e3 12
                XS   $a                  ; 26e4 ea
                LR   $a,A                ; 26e5 5a
                BT   4,A26ee             ; 26e6 84 07
                LIS  $8                  ; 26e8 78
                LR   $8,A                ; 26e9 58
                LISL 7                   ; 26ea 6f
                PI   A27b7               ; 26eb 28 27 b7
A26ee:          LISU 4                   ; 26ee 64
                LISL 0                   ; 26ef 68
                LR   A,(IS)              ; 26f0 4c
                NI   $80                 ; 26f1 21 80
                XS   $a                  ; 26f3 ea
                LR   $a,A                ; 26f4 5a
                LIS  $0                  ; 26f5 70
                XS   (IS)                ; 26f6 ec
                BT   4,A26ff             ; 26f7 84 07
                LIS  $4                  ; 26f9 74
                LR   $8,A                ; 26fa 58
                LISL 3                   ; 26fb 6b
                PI   A27b7               ; 26fc 28 27 b7
A26ff:          PI   A26c0               ; 26ff 28 26 c0
                BT   2,A2719             ; 2702 82 16
                PI   A26ac               ; 2704 28 26 ac
                LI   $1f                 ; 2707 20 1f
                LR   $b,A                ; 2709 5b
                LISU 4                   ; 270a 64
A270b:          LISL 0                   ; 270b 68
                LR   A,(IS)              ; 270c 4c
                SL   1                   ; 270d 13
                BF   $1,A271e            ; 270e 91 0f
                DS   $b                  ; 2710 3b
                BT   4,A2719             ; 2711 84 07
                LISL 3                   ; 2713 6b
                PI   A27c6               ; 2714 28 27 c6
                BF   $0,A270b            ; 2717 90 f3
                
A2719:          LIS  $8                  ; 2719 78
                XS   $a                  ; 271a ea
                LR   $a,A                ; 271b 5a
                BF   $0,A2779            ; 271c 90 5c
                
A271e:          LR   A,$b                ; 271e 4b
                COM                      ; 271f 18
                AI   $20                 ; 2720 24 20
                LR   QU,A                ; 2722 06
                AI   $21                 ; 2723 24 21
                LR   $b,A                ; 2725 5b
A2726:          PI   A26c0               ; 2726 28 26 c0
                LISL 0                   ; 2729 68
                LIS  $0                  ; 272a 70
                XS   (IS)-               ; 272b ee
                BT   1,A2733             ; 272c 81 06
                PI   A26ac               ; 272e 28 26 ac
                BF   $0,A2736            ; 2731 90 04
                
A2733:          LIS  $1                  ; 2733 71
                XS   (IS)                ; 2734 ec
                LR   (IS),A              ; 2735 5c
A2736:          DS   $b                  ; 2736 3b
                BT   4,A273f             ; 2737 84 07
                LISL 7                   ; 2739 6f
                PI   A27c6               ; 273a 28 27 c6
                BF   $0,A2726            ; 273d 90 e8
                
A273f:          LISL 4                   ; 273f 6c
                LIS  $0                  ; 2740 70
                XS   (IS)                ; 2741 ec
                BF   $1,A2719            ; 2742 91 d6
                LR   A,QU                ; 2744 02
                LR   $b,A                ; 2745 5b
A2746:          LISL 3                   ; 2746 6b
                PI   A27d3               ; 2747 28 27 d3
                DS   $b                  ; 274a 3b
                BF   $4,A2746            ; 274b 94 fa
                LR   A,QU                ; 274d 02
                LR   $b,A                ; 274e 5b
                LISU 4                   ; 274f 64
A2750:          LISL 3                   ; 2750 6b
                PI   A27d3               ; 2751 28 27 d3
                DS   $b                  ; 2754 3b
                BF   $4,A2750            ; 2755 94 fa
                LR   A,$a                ; 2757 4a
                NI   $40                 ; 2758 21 40
                SL   1                   ; 275a 13
                XS   $a                  ; 275b ea
                BT   1,A2765             ; 275c 81 08
                LIS  $4                  ; 275e 74
                LR   $8,A                ; 275f 58
                LISL 3                   ; 2760 6b
                PI   A27b7               ; 2761 28 27 b7
                LISU 3                   ; 2764 63
A2765:          LR   A,$a                ; 2765 4a
                SL   1                   ; 2766 13
                BT   1,A276f             ; 2767 81 07
                LIS  $4                  ; 2769 74
                LR   $8,A                ; 276a 58
                LISL 3                   ; 276b 6b
                PI   A27b7               ; 276c 28 27 b7
A276f:          LIS  $0                  ; 276f 70
                XS   $a                  ; 2770 ea
                BT   1,A2779             ; 2771 81 07
                LIS  $4                  ; 2773 74
                LR   $8,A                ; 2774 58
                LISL 7                   ; 2775 6f
                PI   A27b7               ; 2776 28 27 b7
A2779:          LR   A,$a                ; 2779 4a
                LR   $9,A                ; 277a 59
                LR   W,J                 ; 277b 1d
                BF   $0,A27b3            ; 277c 90 36
                
                LR   K,P                 ; 277e 08
                PI   PUSHK               ; 277f 28 40 a9
                LIS  $0                  ; 2782 70
                LISU 3                   ; 2783 63
                LISL 3                   ; 2784 6b
A2785:          LR   (IS)-,A             ; 2785 5e
                BR7  A2785               ; 2786 8f fe
                LI   $1f                 ; 2788 20 1f
                LR   $a,A                ; 278a 5a
A278b:          PI   A27a0               ; 278b 28 27 a0
                BT   4,A2793             ; 278e 84 04
                PI   A26ac               ; 2790 28 26 ac
A2793:          DS   $a                  ; 2793 3a
                BF   $4,A278b            ; 2794 94 f6
                PI   A27a0               ; 2796 28 27 a0
                BT   4,A279e             ; 2799 84 04
                PI   A26c0               ; 279b 28 26 c0
A279e:          BF   $0,A27a4            ; 279e 90 05

A27a0:          LR   K,P                 ; 27a0 08
                PI   PUSHK               ; 27a1 28 40 a9
A27a4:          LISL 7                   ; 27a4 6f
                LIS  $1                  ; 27a5 71
                NS   (IS)                ; 27a6 fc
                LR   J,W                 ; 27a7 1e
                PI   A27d3               ; 27a8 28 27 d3
                LISL 0                   ; 27ab 68
                LIS  $4                  ; 27ac 74
                SL   4                   ; 27ad 15
                NS   (IS)                ; 27ae fc
                SL   1                   ; 27af 13
                XS   (IS)                ; 27b0 ec
                LR   (IS)-,A             ; 27b1 5e
                LR   W,J                 ; 27b2 1d
A27b3:          PI   POPK                ; 27b3 28 40 bc
                PK                       ; 27b6 0c

A27b7:          LR   K,P                 ; 27b7 08
                LI   $ff                 ; 27b8 20 ff
                INC                      ; 27ba 1f
                LR   J,W                 ; 27bb 1e
A27bc:          LR   A,(IS)              ; 27bc 4c
                COM                      ; 27bd 18
                LR   W,J                 ; 27be 1d
                LNK                      ; 27bf 19
                LR   J,W                 ; 27c0 1e
                LR   (IS)-,A             ; 27c1 5e
A27c2:          DS   $8                  ; 27c2 38
                BF   $4,A27bc            ; 27c3 94 f8
                PK                       ; 27c5 0c

A27c6:          LR   K,P                 ; 27c6 08
                COM                      ; 27c7 18
A27c8:          LR   A,(IS)              ; 27c8 4c
                LNK                      ; 27c9 19
                LR   J,W                 ; 27ca 1e
                AS   (IS)                ; 27cb cc
A27cc:          LR   (IS)-,A             ; 27cc 5e
                BT   2,A27d0             ; 27cd 82 02
A27cf:          LR   W,J                 ; 27cf 1d
A27d0:          BR7  A27c8               ; 27d0 8f f7
                PK                       ; 27d2 0c

a27d3:          LR   K,P                 ; 27d3 08
A27d4:          LR   A,(IS)              ; 27d4 4c
                SR   1                   ; 27d5 12
                LR   (IS)-,A             ; 27d6 5e
                BR7  A27da               ; 27d7 8f 02
                PK                       ; 27d9 0c

A27da:          LR   A,(IS)+             ; 27da 4d
                SL   4                   ; 27db 15
                SL   1                   ; 27dc 13
A27dd:          SL   1                   ; 27dd 13
A27de:          SL   1                   ; 27de 13
A27df:          XS   (IS)                ; 27df ec
A27e0:          LR   (IS)-,A             ; 27e0 5e
                BF   $0,A27d4            ; 27e1 90 f2

				db   $04,$05,$06,$02,$03,$01,$07	;27e3 DCI in RES1                

WRONGTEXT:		;WRONG KEY!
				db   $0D,$09,$13,$2B,$1B,$00,$15,$0B,$05,$04

				db   0,0,0,0,0,0
A27fa:
				db   0,0,0,0,0,0

