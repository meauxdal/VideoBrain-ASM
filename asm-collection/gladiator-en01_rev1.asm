;Gladiator - EN01

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/25/2010
;commented by Kurt Woloch
;5/16/2012 - 6/30/2012
;
;Some of the registers used:
;
;R28... main game variation ($00 to $02 for past, present, future) + index which player gets polled
;       (the players get polled alternatingly while bit 7 of R28 changes from 0 to 1 and back)
;R29... subvariation (0...127)
;R40 through R55... contains X-positions of objects before being written into VLSI, getting built from object list
;
;Usage of segments: 0, 1, 5, 6, 9, a and b
;
;0...barrier (Future) / ? (past)
;1...barrier (Future) / single palisade (past)
;2...lion (past) / Blocker (Scrimmage) / Space mine (future)
;3...player 1 (past)
;4...player 2 (past)
;5...barrier (Future) / single palisade (past)
;6...barrier (Future) / single palisade (past)
;7...row of palisades (past)
;8...row of palisades (past)
;9...barrier (Future) / single palisade (past)
;10...barrier (Future) / single palisade (past)
;11...barrier (Future) / number of spears display (past)
;12...number of spears display (past)
;13...score of player 1
;14...score of player 2
;15...single palisade (past)
;
;Usage of memory:
;$0c20... RAM-list for values that have to refreshed every frame, that is RAM pointers ($0c2x/$0c3x) and object heights ($0c4x)
;$0d5e... object list. Each object in the list occupies 4 bytes, the structure is:
;   Byte 0... x-coord (center of object)
;   Byte 1... width in pixels / 2
;   Byte 2... y-coord. (center of object)
;   Byte 3... height in pixels / 2
;   For Byte 0, There's a special value of $e8 and maybe another one of $d8 for deactivated objects (?)
;$0db6... 2nd object list. In that list, each object occupies 2 bytes of data, structure unknown
;$0f85-$0f95... message to put on result screen
;$0f96... score of player 1 (going up in steps of 7... 0, 7, 14, 21 etc., but displaying 0, 1, 2, 3...)
;$0f97... score of player 2 (going up in steps of 7 as well)
;$0fb0-$0fbe is used as a temporary storage for the interrupt routine to save register values
;
;Note:
;we use the same notation as in the Videobrain patent, e.g. Y is the scanline value, with 0 being the top scanline,
;   and X is the column value, with 0 being the leftmost pixel
;
;The code is a bit confusing because often the flow continues at a different code section,
;and the subroutines are intermingled with parts of the code that jump to each other
;
;Here's a try to do a rough flow chart:
;
;We start with initializing the game, showing title screen and selecting game variation (1012 - 10c6)
;When the game is selected, it starts with common initialization (10c7 - 1139), 
;then specific initialization continues through a jump table:
;Past gladiator: 1143 - 11a2 -> 16a0
;Modern gladiator (Scrimmage): 164f - 169f, continuing at 16a0
;Future gladiator: 1411 - 1439 -> 16a0
;Then we have more common initialization at 16a0 - 174a -> 18e7, where the main game loop starts
;
;Game loop:
;At 18e7, we first generate the X-coordinate list in R40-R55, then copy it over to the VLSI, then jump to 1afd.
;At 1afd, we generate more VLSI lists, then we jump to 15ee.
;At 15ee, we handle the lion / space mine / blocking back and then jump to 17da.
;At 17da, we poll both player's fire buttons and initiate fire if necessary, then we jump to 1481.
;At 1481, we poll either player 1 or 2's joystick and then continue at 1244.
;At 1244, we put object data into working registers R1, R5, R7, R6 and R2 and then enter a jump table at 1b62.
;This jump table probably handles all collisions between objects.
;Depending on that jump table, various actions get executed.
;FOr instance, entries 2, 10 and 18 cause one player to get a point and the game to be reset.
;Most jump table entries, however, eventually end at 1256 where the jump table launch starts anew.
;But some of them also end at 18e7 where the game loop gets executed again.

org $1000

				db   $aa,$55			;cart signature
				db   $01				;background color
				db   $00,$00,$00,$1b,$27,$11,$1f,$01,$11,$07,$13,$09,$00,$00,$00	;name - GLADIATOR

START:
                DCI  $0f85               ; 1012 2a 0f 85 ;point to 0f85
                XDC                      ; 1015 2c       ;with DC1
                DCI  A1d60               ; 1016 2a 1d 60 ;point to 1d60 with DC0
                LI   $10                 ; 1019 20 10    ;load $10 into R7
                LR   $7,A                ; 101b 57
                PI   A11a5               ; 101c 28 11 a5 ;call 11a5 (copy 10 bytes from $1d60 to $0f85 = default message on result screen)
A101f:          DCI  $0f98               ; 101f 2a 0f 98 ;store 0 in 0f98, 0f99 and 0f9a
                LIS  $0                  ; 1022 70
                ST                       ; 1023 17
                ST                       ; 1024 17
                ST                       ; 1025 17
                DI                       ; 1026 1a       ;disable interrupt
                LR   J,W                 ; 1027 1e       ;copy status register into R9
                PI   $45db               ; 1028 28 45 db ;call 45db in RES1 (usual initialization)
                PI   $41c8               ; 102b 28 41 c8 ;call 41c8 (wait for scanline and do clock)
                DCI  A1d70               ; 102e 2a 1d 70 ;point to 1d70
                LI   $30                 ; 1031 20 30    ;load $30 into A
                LISU 2                   ; 1033 62       ;point to R20
                LISL 4                   ; 1034 6c
                LR   (IS),A              ; 1035 5c       ;store $30 in R20
                PI   $4205               ; 1036 28 42 05 ;call 4205 (Print 3 lines from 1d70)
                LI   $50                 ; 1039 20 50    ;store $50 in A
                DCI  $0fdf               ; 103b 2a 0f df ;point to $0fdf (cursor pos.)
                ST                       ; 103e 17       ;store $50 in $0fdf (start of line 6)
                LISL 4                   ; 103f 6c       ;point to R20
                LIS  $c                  ; 1040 7c       ;store $0c in R20
                LR   (IS),A              ; 1041 5c
                DCI  A1da0               ; 1042 2a 1d a0 ;point to 1da0
                PI   $4205               ; 1045 28 42 05 ;call 4205 (Print 1 line from 1da0)
                LI   $46                 ; 1048 20 46    ;store $46 in $0fdf (cursor position)
                DCI  $0fdf               ; 104a 2a 0f df
                ST                       ; 104d 17
                LI   $ff                 ; 104e 20 ff    ;store $ff in R7
                LR   $7,A                ; 1050 57
                LIS  $0                  ; 1051 70       ;store $00 in R5 and R6
                LR   $5,A                ; 1052 55
                LR   $6,A                ; 1053 56
A1054:          LIS  $0                  ; 1054 70       ;store 0 in 0fe2
                DCI  $0fe2               ; 1055 2a 0f e2 
                ST                       ; 1058 17
                PI   A18b3               ; 1059 28 18 b3 ;wait for key being pressed and play music while doing so

                LIS  $a                  ; 105c 7a       ;store $0a in R1
                LR   $1,A                ; 105d 51 
                LR   A,$8                ; 105e 48       ;increment R8 (character to draw)
                INC                      ; 105f 1f
                LR   $8,A                ; 1060 58 
                DCI  $245e               ; 1061 2a 24 5e ;point to 245e (number table in RES2)
                CI   $40                 ; 1064 25 40    ;compare incremented contents of R8 with $40
                BT   4,A108c             ; 1066 84 25    ;if it's zero, branch to 108c
A1068:          CM                       ; 1068 8d       ;compare incremented contents of R8 with byte at $245e+ and increment DC0
                BT   4,A1070             ; 1069 84 06    ;if it's equal, a digit was entered, so branch to 1070
                DS   $1                  ; 106b 31       ;else decrement R1 and branch back to 1068 while not zero
                BF   $4,A1068            ; 106c 94 fb    
                BF   $0,A1054            ; 106e 90 e5    ;unconditional branch back to 1054

A1070:          PI   $40d9               ; 1070 28 40 d9 ;call 40d9 in RES1 (DRAWCHAR)
                PI   $412d               ; 1073 28 41 2d ;call INCCURSOR in RES1
                DCI  $0f98               ; 1076 2a 0f 98 ;point to $0f98
                LR   A,$7                ; 1079 47       ;increment R7 (number of entered digits for game number?)
                INC                      ; 107a 1f
                LR   $7,A                ; 107b 57
                CI   $03                 ; 107c 25 03    ;compare incremented R7 contents with #03
                BT   4,A108f             ; 107e 84 10    ;if equal, branch to 108f (all required digits present, so calculate game number)
                ADC                      ; 1080 8e       ;add incremented R7 contents to DC0
                LR   A,$8                ; 1081 48       ;store contents of R8 at DC0
                ST                       ; 1082 17
                DCI  $0f9c               ; 1083 2a 0f 9c ;point to 0f9c
                LR   A,$7                ; 1086 47       ;add r7 contents to DC0
                ADC                      ; 1087 8e
                LR   A,$1                ; 1088 41       ;store r1 contents at DC0 and increment DC0
                ST                       ; 1089 17
                BF   $0,A1054            ; 108a 90 c9    ;unconditional branch back to 1054

A108c:          LR   A,$7                ; 108c 47       ;increment R7 contents
                INC                      ; 108d 1f
                LR   $7,A                ; 108e 57
A108f:          LIS  $0                  ; 108f 70       ;clear R1 and R2 for calculation of game number out of user entry
                LR   $1,A                ; 1090 51
                LR   $2,A                ; 1091 52
                LIS  $3                  ; 1092 73       ;set R4 to $03
                LR   $4,A                ; 1093 54
A1094:          DS   $4                  ; 1094 34       ;decrement R4 and R7
                DS   $7                  ; 1095 37
                BF   $1,A10b1            ; 1096 91 1a    ;exit loop if R7 negative
                LR   A,$7                ; 1098 47       ;point to $0f9c + R7
                DCI  $0f9c               ; 1099 2a 0f 9c
                ADC                      ; 109c 8e
                LM                       ; 109d 16       ;store contents of that address to R5 -> R5 = ($0f9c + R7)
                LR   $5,A                ; 109e 55
                DCI  A1d5d               ; 109f 2a 1d 5d ;point to $1d5d + R4
                LR   A,$4                ; 10a2 44
                ADC                      ; 10a3 8e
                LM                       ; 10a4 16       ;store contents of that address to R6 -> R6 = ($1d5d + R4)
                LR   $6,A                ; 10a5 56
A10a6:          DS   $5                  ; 10a6 35       ;decrement R5 and branch back to 1094 if zero
                BT   4,A1094             ; 10a7 84 ec
                LR   A,$1                ; 10a9 41       ;add contents of R6 to R1
                AS   $6                  ; 10aa c6
                LR   $1,A                ; 10ab 51
                LR   A,$2                ; 10ac 42       ;increment R2 if carry of addition above (R2 contains high byte of game number)
                LNK                      ; 10ad 19
                LR   $2,A                ; 10ae 52
                BF   $0,A10a6            ; 10af 90 f6    ;unconditional branch back to 10a6
A10b1:          LR   A,$2                ; 10b1 42
                SL   1                   ; 10b2 13       ;shift R2 contents 1 place to the left
                LR   $2,A                ; 10b3 52
                LR   A,$1                ; 10b4 41       ;load R1 contents and shift 7 places right -> most significant bit becomes least significant one
                SR   4                   ; 10b5 14
                SR   1                   ; 10b6 12
                SR   1                   ; 10b7 12
                SR   1                   ; 10b8 12
                XS   $2                  ; 10b9 e2       ;XOR with R2 and store in R2
                LR   $2,A                ; 10ba 52       ;R2 = R2 XOR (R1 / 128)
                CI   $03                 ; 10bb 25 03    ;compare R2 to #03 and branch to 10c2 if not equal
                BF   $4,A10c2            ; 10bd 94 04    ;if R2 = #03, jump to 194e
                JMP  A194e               ; 10bf 29 19 4e

A10c2:          BT   2,A10c7             ; 10c2 82 04    ;if carry set, branch to 10c7
                JMP  A101f               ; 10c4 29 10 1f ;else jump back to start of title screen

;On reaching 10c7, the entry of the game number is finished and has succeded, so we turn off the music and do some initialization common for all variations

A10c7:          LISU 3                   ; 10c7 63       ;point to R28
                LISL 4                   ; 10c8 6c
                LR   (IS)+,A             ; 10c9 5d       ;store A in R28 and point to R29 (R28 probably now contains the main game variation)
                LR   A,$1                ; 10ca 41       ;store R1 in R29 and point to R28 (R29 probably now contains variation inside of main game)
                LR   (IS)-,A             ; 10cb 5e
A10cc:          LIS  $0                  ; 10cc 70       ;clear output ports 0 and 1
                OUTS 0                   ; 10cd b0
                OUTS 1                   ; 10ce b1
                DCI  $0fdd               ; 10cf 2a 0f dd ;clear $0fda, $0fdd and $0fde
                ST                       ; 10d2 17
                ST                       ; 10d3 17
                DCI  $0fda               ; 10d4 2a 0f da
                ST                       ; 10d7 17
                LI   $11                 ; 10d8 20 11   ;set interrupt to $11ae (switching off the music)
                OUTS 12                  ; 10da bc
                LI   $ae                 ; 10db 20 ae
                OUTS 13                  ; 10dd bd
                LI   $ff                 ; 10de 20 ff    ;set $08F0 (Y-interrupt register) to $FF
                DCI  $08f0               ; 10e0 2a 08 f0 
                ST                       ; 10e3 17
                LIS  $1                  ; 10e4 71       ;set output port 14 to $01 (whatever that does...)
                OUTS 14                  ; 10e5 be
                LI   $4c                 ; 10e6 20 4c     ;store $4c in $0fea and $08f7 (command register and video mode shadow register)
                DCI  $0fea               ; 10e8 2a 0f ea
                ST                       ; 10eb 17
                DCI  $08f7               ; 10ec 2a 08 f7
                ST                       ; 10ef 17
                EI                       ; 10f0 1b        ;enable interrupts
                LR   J,W                 ; 10f1 1e        ;store status register in R9
                PI   $22db               ; 10f2 28 22 db  ;call 22db in RES2  (writes values $03, $53, $03, $3f 10 times consecutively to memory $0c00 - $0c28)
                LIS  $0                  ; 10f5 70        ;clear $0f96 and $0f97 (player scores)
                DCI  $0f96               ; 10f6 2a 0f 96
                ST                       ; 10f9 17
                ST                       ; 10fa 17
                DCI  $0f3f               ; 10fb 2a 0f 3f  ;point DC1 to $0f3f
                XDC                      ; 10fe 2c
                LIS  $a                  ; 10ff 7a        ;store $0a in R1
                LR   $1,A                ; 1100 51
                DCI  A1d46               ; 1101 2a 1d 46  ;point DC0 to $1d46
A1104:          LM                       ; 1104 16        ;load from DC0
                LR   Q,DC                ; 1105 0e        ;save DC0 in Q
                DCI  $2010               ; 1106 2a 20 10  ;point to $2010 + (previous DC0) * 7
                ADC                      ; 1109 8e
                SL   1                   ; 110a 13
                ADC                      ; 110b 8e
                ADC                      ; 110c 8e
                ADC                      ; 110d 8e
                LIS  $7                  ; 110e 77        ;set R7 to $07
                LR   $7,A                ; 110f 57
                PI   A11a5               ; 1110 28 11 a5  ;call 11a5 (copy 7 bytes from ($2010 + (previous DC0) * 7) - probably character
                DS   $1                  ; 1113 31        ;decrement R1
                LR   DC,Q                ; 1114 0f        ;load Q back into DC0
                BF   $4,A1104            ; 1115 94 ee     ;if R1 is not zero, loop back to 1104

                DCI  $0dda               ; 1117 2a 0d da  ;point to $0dda
                LI   $98                 ; 111a 20 98     ;store $98 in R1 -> clear $98 bytes from $0dda upwards
                LR   $1,A                ; 111c 51
                LIS  $0                  ; 111d 70        ;load $00
A111e:          ST                       ; 111e 17        ;store in $0dda+ 
                DS   $1                  ; 111f 31        ;decrement R1
                BF   $4,A111e            ; 1120 94 fd     ;if not zero, loop back
                LI   $24                 ; 1122 20 24
                LR   $0,A                ; 1124 50        ;store $24 in R0
                LIS  $0                  ; 1125 70
                DCI  $0db6               ; 1126 2a 0d b6  ;point to $0db6 and clear $24 bytes upwards from there
A1129:          ST                       ; 1129 17
                DS   $0                  ; 112a 30
                BF   $4,A1129            ; 112b 94 fd     ;end of loop

                DCI  $08f5               ; 112d 2a 08 f5  ;point to $08f5 ()
                ST                       ; 1130 17        ;clear it
                LR   A,(IS)              ; 1131 4c        ;load A from register pointed to by ISAR (should be R28)
                DCI  A113a               ; 1132 2a 11 3a  ;point to 113a (just below here)
                ADC                      ; 1135 8e        ;add A*3 to DC0
                ADC                      ; 1136 8e
                ADC                      ; 1137 8e
                LR   Q,DC                ; 1138 0e        ;copy DC0 to Q
                LR   P0,Q                ; 1139 0d        ;copy Q to Program Counter (jumping to one of the three destinations, depending on R28)

;Jump table for the three main game variations

A113a:          JMP  A1143               ; 113a 29 11 43  ;initialization routine for Past Gladiator
                JMP  A164f               ; 113d 29 16 4f  ;initialization routine for Present Gladiator
                JMP  A1411               ; 1140 29 14 11  ;initialization routine for Future Gladiator

;Initialization routine for Past Gladiator

A1143:          DCI  $0c6d               ; 1143 2a 0c 6d  ;point to $0c6d (destination in RAM)
                XDC                      ; 1146 2c
                DCI  A1bb2               ; 1147 2a 1b b2  ;point to $1bb2 (source in cartridge)
                LISU 2                   ; 114a 62        ;point to R16
                LISL 0                   ; 114b 68
                LIS  $1                  ; 114c 71        ;store $01 in R16 and R17
                LR   (IS)+,A             ; 114d 5d
                LR   (IS)+,A             ; 114e 5d
                LI   $16                 ; 114f 20 16     ;store $16 in R18
                LR   (IS),A              ; 1151 5c
                PI   $4686               ; 1152 28 46 86  ;call $4686 in RES1 (weird MEMCOPY)
                DCI  $0c6c               ; 1155 2a 0c 6c  ;point to $0c6c (destination in RAM)
                XDC                      ; 1158 2c
                DCI  A1bb3               ; 1159 2a 1b b3  ;point to $1bb3 (source in cartridge)
                LI   $16                 ; 115c 20 16     ;store $16 in R18 (still R18?)
                LR   (IS),A              ; 115e 5c
                PI   $4686               ; 115f 28 46 86  ;another weird MEMCOPY
                DCI  $0d38               ; 1162 2a 0d 38  ;point to $0d38 (destination in RAM)
                XDC                      ; 1165 2c       
                DCI  A1bde               ; 1166 2a 1b de  ;point to $1bde (source in cartridge)
                LISL 0                   ; 1169 68        ;point to R16
                LIS  $0                  ; 116a 70
                LR   (IS)+,A             ; 116b 5d        ;clear R16 and R17
                LR   (IS)+,A             ; 116c 5d
                LI   $26                 ; 116d 20 26
                LR   (IS),A              ; 116f 5c        ;store $26 in R18
                PI   $4686               ; 1170 28 46 86  ;another weird MEMCOPY
                DCI  $0ce8               ; 1173 2a 0c e8  ;point to $0ce8 (destination in RAM)
                XDC                      ; 1176 2c
                DCI  A1c05               ; 1177 2a 1c 05  ;point to $1c05 (source in cartridge)
                LI   $50                 ; 117a 20 50     ;store $50 in R18
                LR   (IS),A              ; 117c 5c
                PI   $4686               ; 117d 28 46 86  ;another weird MEMCOPY
                DCI  $0c98               ; 1180 2a 0c 98  ;point to $0c98 (destination in RAM)
                XDC                      ; 1183 2c
                DCI  A1c05               ; 1184 2a 1c 05  ;point to $1c05 (source in cartridge)
                LI   $50                 ; 1187 20 50     ;store $50 in R7
                LR   $7,A                ; 1189 57
                PI   A11a5               ; 118a 28 11 a5  ;call MEMCOPY below (copy 80 bytes from 1c05 to 0c98)
                DCI  $0e72               ; 118d 2a 0e 72  ;point to $0e72 (destination in RAM)
                XDC                      ; 1190 2c
                DCI  A1bde               ; 1191 2a 1b de  ;point to $1bde (source in cartridge)
                LI   $26                 ; 1194 20 26
                LR   $7,A                ; 1196 57        ;store $26 in R7
                PI   A11a5               ; 1197 28 11 a5  ;copy 38 bytes from 1bde to 0e72
                LI   $10                 ; 119a 20 10
                LR   $7,A                ; 119c 57        ;store $10 in R7
                LIS  $0                  ; 119d 70
                DCI  $08f5               ; 119e 2a 08 f5  ;clear $08f5
                ST                       ; 11a1 17
                JMP  A16a0               ; 11a2 29 16 a0  ;jump to common game routine

;Subroutine for memory copying
;Parameters: DC0... source address
;            DC1... destination address
;            R7... number of bytes to copy

A11a5:          LR   K,P                 ; 11a5 08       ;save return address
A11a6:          LM                       ; 11a6 16       ;load from address at DC0
                XDC                      ; 11a7 2c       ; swap DC's
                ST                       ; 11a8 17       ;store to address at DC0 (entered as DC1)
                XDC                      ; 11a9 2c       ; swap DC's again
                DS   $7                  ; 11aa 37       ; decrement R7
                BF   $4,A11a6            ; 11ab 94 fa    ; branch back if not zero
                PK                       ; 11ad 0c       ;return
                
;Interrupt routine
;This is where the interrupt points at when no music is playing
;Basically this saves certain registers, then calls clock processing and segment refresh
;and, for Future Gladiator, stores the value of $0e9d + 10 in $0e9d and some segment-related registers (all pointers to RAM)
;This, I think, creates the "buzzing" effect of the barriers in Future Gladiator.

                LR   $3,A                ; 11ae 53       ;save everything in memory area of $0fb0-$0fbe
                LR   A,IS                ; 11af 0
                LISU 4                   ; 11b0 64
                LISL 0                   ; 11b1 68
                LR   (IS)+,A             ; 11b2 5d
                LR   A,QU                ; 11b3 02
                LR   (IS)+,A             ; 11b4 5d
                LR   A,QL                ; 11b5 03
                LR   (IS)+,A             ; 11b6 5d
                LR   A,$9                ; 11b7 49
                LR   (IS)+,A             ; 11b8 5d
                XDC                      ; 11b9 2c
                LR   Q,DC                ; 11ba 0e
                DCI  $0fb0               ; 11bb 2a 0f b0
                LISU 2                   ; 11be 62
                LISL 0                   ; 11bf 68
                LR   A,(IS)+             ; 11c0 4d
                ST                       ; 11c1 17
                LR   A,(IS)+             ; 11c2 4d
                ST                       ; 11c3 17
                LR   A,(IS)+             ; 11c4 4d
                ST                       ; 11c5 17
                LR   A,(IS)+             ; 11c6 4d
                ST                       ; 11c7 17
                LR   A,QU                ; 11c8 02
                ST                       ; 11c9 17
                LR   A,QL                ; 11ca 03
                ST                       ; 11cb 17
                XDC                      ; 11cc 2c
                LR   Q,DC                ; 11cd 0e
                XDC                      ; 11ce 2c
                LR   A,KU                ; 11cf 00
                ST                       ; 11d0 17
                LR   A,KL                ; 11d1 01
                ST                       ; 11d2 17
                LR   A,$a                ; 11d3 4a
                ST                       ; 11d4 17
                LR   A,$b                ; 11d5 4b
                ST                       ; 11d6 17
                LR   J,W                 ; 11d7 1e
                LR   A,$9                ; 11d8 49
                ST                       ; 11d9 17
                LR   K,P                 ; 11da 08
                LR   A,KU                ; 11db 00
                ST                       ; 11dc 17
                LR   A,KL                ; 11dd 01
                ST                       ; 11de 17
                LR   A,QU                ; 11df 02
                ST                       ; 11e0 17
                LR   A,QL                ; 11e1 03
                ST                       ; 11e2 17

                PI   $424d               ; 11e3 28 42 4d ;call clock processing and segment refresh
                LISU 3                   ; 11e6 63       ;point to R28
                LISL 4                   ; 11e7 6c
                LIS  $2                  ; 11e8 72       ;A = (R28) EOR $02
                XS   (IS)                ; 11e9 ec
                BF   $4,A1209            ; 11ea 94 1e    ;skip remaining routine if R28 EOR $02 is not zero (= if variation is not Future Gladiator)
                DCI  $0e9d               ; 11ec 2a 0e 9d ;store ($0e9d) + 10 to $0e9d, $0800, $0801, $0805, $0806, $0809, $080a and $080b
                LM                       ; 11ef 16       ;this means that objects 0, 1, 5, 6, 9, a and b are barriers, that leaves
                AI   $0a                 ; 11f0 24 0a    ;objects 2, 3, 4, 7, 8, c, d, e and f for the players, satellites, score etc.
                DCI  $0e9d               ; 11f2 2a 0e 9d ;
                ST                       ; 11f5 17
                DCI  $0800               ; 11f6 2a 08 00
                ST                       ; 11f9 17
                ST                       ; 11fa 17
                DCI  $0805               ; 11fb 2a 08 05
                ST                       ; 11fe 17
                ST                       ; 11ff 17
                DCI  $0809               ; 1200 2a 08 09
                ST                       ; 1203 17
                ST                       ; 1204 17
                DCI  $080f               ; 1205 2a 08 0f
                ST                       ; 1208 17

A1209:          DCI  $0fb0               ; 1209 2a 0f b0 ;fetch everything back
                LISU 2                   ; 120c 62
                LISL 0                   ; 120d 68
                LM                       ; 120e 16
                LR   (IS)+,A             ; 120f 5d
                LM                       ; 1210 16
                LR   (IS)+,A             ; 1211 5d
                LM                       ; 1212 16
                LR   (IS)+,A             ; 1213 5d
                LM                       ; 1214 16
                LR   (IS)+,A             ; 1215 5d
                LM                       ; 1216 16
                LR   QU,A                ; 1217 06
                LM                       ; 1218 16
                LR   QL,A                ; 1219 07
                XDC                      ; 121a 2c
                LR   DC,Q                ; 121b 0f
                XDC                      ; 121c 2c
                LIS  $2                  ; 121d 72
                ADC                      ; 121e 8e
                LM                       ; 121f 16
                LR   $a,A                ; 1220 5a
                LM                       ; 1221 16
                LR   $b,A                ; 1222 5b
                LM                       ; 1223 16
                LR   $9,A                ; 1224 59
                LR   W,J                 ; 1225 1d
                LM                       ; 1226 16
                LR   KU,A                ; 1227 04
                LM                       ; 1228 16
                LR   KL,A                ; 1229 05
                LR   P,K                 ; 122a 09
                LM                       ; 122b 16
                LR   QU,A                ; 122c 06
                LM                       ; 122d 16
                LR   QL,A                ; 122e 07
                DCI  $0fb6               ; 122f 2a 0f b6
                LM                       ; 1232 16
                LR   KU,A                ; 1233 04
                LM                       ; 1234 16
                LR   KL,A                ; 1235 05
                LR   DC,Q                ; 1236 0f
                LISU 4                   ; 1237 64
                LISL 3                   ; 1238 6b
                LR   A,(IS)-             ; 1239 4e
                LR   $9,A                ; 123a 59
                LR   A,(IS)-             ; 123b 4e
                LR   QL,A                ; 123c 07
                LR   A,(IS)-             ; 123d 4e
                LR   QU,A                ; 123e 06
                LR   A,(IS)-             ; 123f 4e
                LR   IS,A                ; 1240 0b
                LR   A,$3                ; 1241 43
                EI                       ; 1242 1b
                POP                      ; 1243 1c        ;end of interrupt routine

;The following processes some tables in ROM, at 1d50, 1f50 and 1fed, depending on main variation.
;When it gets executed, IS points to R28 (main game variation)
;For Past Gladiator, point to $1d50
;For Scrimmage, point to $1f50
;For Future Gladiator, point to $1fed
;
;This gets executed right after processing one of the players

A1244:          LIS  $1                  ; 1244 71        ;load $01 into A
                XS   (IS)                ; 1245 ec        ;EOR with (IS)
                DCI  A1d50               ; 1246 2a 1d 50  ;point to 1D50
                BF   $4,A124e            ; 1249 94 04     ;if (IS) is not $01, branch
                DCI  A1f50               ; 124b 2a 1f 50  ;else point to 1F50 instead
A124e:          LIS  $2                  ; 124e 72        ;load $02 into A     
                XS   (IS)                ; 124f ec        ;EOR with (IS)
                BF   $4,A1255            ; 1250 94 04     ;if (IS) is not $02, branch
                DCI  A1fed               ; 1252 2a 1f ed  ;else point to 1fed instead
A1255:          LR   H,DC                ; 1255 11        ;store DC in H

;The following label gets jumped to pretty often, also 5th entry of jump table
;At this point, H should contain $1d50, $1f50 or $1fed, depending on main variation - at least when this is first executed in the game loop.
;Each of the addresses contain a new address, which is $1cf6 for past Gladiator, $1ef0 for Scrimmage and $0c98 for Future Gladiator
;But since this label gets jumped to quite often, it's possible that it contains a different address when jumped to from somewhere else
;
;THe lists seem to work as follows:
;Actually, there are two lists, object list 1 and object list 2. Object list 1 gets pointed to above.
;
;The first two bytes contain an address which gets stored in Q, which is the start of object list 2 for that object.
;The next byte contains an object number to fetch for a collision check
;The address at Q contains the index of a second object which is checked for collision with the first one,
;followed by an index into the jump table at 1b62
;Only if a collision occured or not occured, but not in the other case, we branch to the address given in the jump table
;Otherwise, if R4 is positive, we branch back to 1268 where we continue reading at the address at Q in order to check more objects to collide
;with the same first object.
;There is also a special case where we fall through to 1279. This happens if the second object number is negative.
;In this case, we continue to read list 1 for a new first object to check and a new address for another list 2.
;There are a few slight glitches in this... a negative object number still gets checked, but is actually there to trigger
;the end of list 2 and continuing to read list 1. Due to that glitch, only collisions are able to trigger the jump table, not non-collisions

A1256:          LR   DC,H                ; 1256 10        ;bring back original DC
                LM                       ; 1257 16        ;load from memory
                CI   $ff                 ; 1258 25 ff     ;compare to $FF
                BF   $4,A125f            ; 125a 94 04     ;if memory content is not $FF, skip jump
                JMP  A18e7               ; 125c 29 18 e7  ;else jump to 18e7 (start of game loop)

A125f:          LR   QU,A                ; 125f 06        ;store A in Q (loaded from memory set above, either to 1d50, 1f50 or 1fed)
                LM                       ; 1260 16        ;load next byte from memory
                LR   QL,A                ; 1261 07        ;2nd part of store in Q
                LM                       ; 1262 16        ;load next byte from memory
                LR   $0,A                ; 1263 50        ;store in R0 (object number to fetch for collision check)
                LR   H,DC                ; 1264 11        ;store DC0 in H
                PI   A1632               ; 1265 28 16 32  ;put object data into working registers R1, R5, R7, R6 and R2
A1268:          LR   DC,Q                ; 1268 0f        ;load DC0 from previously loaded address (now points to either $1cf6, $1ef0 or $0c98)
                LM                       ; 1269 16        ;load byte from there, store in R4 (index of object to check collision for)
                LR   $4,A                ; 126a 54        ;
                LR   Q,DC                ; 126b 0e        ;put DC back in Q (now increased by 1)
                PI   A145b               ; 126c 28 14 5b  ;Check for collision (-> A = either $00 or $80)
                XS   $4                  ; 126f e4        ;XOR R4
                LR   DC,Q                ; 1270 0f        ;load Q into DC0
                LM                       ; 1271 16        ;load from memory (A now contains pointer to jump table in case it gets used)
                LR   Q,DC                ; 1272 0e        ;put new incremented DC0 into Q
                BF   $1,A1284            ; 1273 91 10     ;branch on negative (acts on XOR R4) to 1284 (launch jump table at 1b62)
A1275:          LIS  $0                  ; 1275 70
                XS   $4                  ; 1276 e4        ;test R4
                BT   1,A1268             ; 1277 81 f0     ;if R4 is positive, branch back to 1268
A1279:          XDC                      ; 1279 2c        ;swap data pointers; this gets also jumped to from the clear routine when lion is concerned
                LI   $fc                 ; 127a 20 fc
                ADC                      ; 127c 8e        ;subtract 4 from data pointer
                LR   A,$1                ; 127d 41        ;store R1 contents at DC0
                ST                       ; 127e 17
                LM                       ; 127f 16        ;advance data pointer by 1
                LR   A,$2                ; 1280 42        ;store R2 contents at DC0 (2 higher than previous store)
                ST                       ; 1281 17
                BF   $0,A1256            ; 1282 90 d3     ;jump back to 1256

;The following code jumps to various locations according to the jump table at 1b62 depending on the value of A (unless A = $06)

A1284:          CI   $06                 ; 1284 25 06     ;compare to $06
                BT   4,A1292             ; 1286 84 0b     ;skip forward to 1292 if zero (A is $06)
                DCI  A1b62               ; 1288 2a 1b 62  ;point to 1b62 + A * 2
                ADC                      ; 128b 8e
                ADC                      ; 128c 8e
                LM                       ; 128d 16        ;load from memory into QU and QL (prepare for jump)
                LR   QU,A                ; 128e 06
                LM                       ; 128f 16
                LR   QL,A                ; 1290 07
                LR   P0,Q                ; 1291 0d        ;load Program Counter with Q -> jump to address just read

;The following code gets executed when Player 1 hits a palisade in Past Gladiator

A1292:          LR   A,$1                ; 1292 41        ;7th entry of jump table; transfer R1 into R7
                LR   $7,A                ; 1293 57
                DCI  $0d5e               ; 1294 2a 0d 5e  ;point to object table + (R0 * 4) (x-coord.)
                LR   A,$0                ; 1297 40
                SL   1                   ; 1298 13
                SL   1                   ; 1299 13
                ADC                      ; 129a 8e
                LM                       ; 129b 16        ;load from there and store in R1
                LR   $1,A                ; 129c 51
                CM                       ; 129d 8d        ;compare to increase pointer
                LM                       ; 129e 16        ;load 3rd byte from object list and store in R9
                LR   $9,A                ; 129f 59
                PI   A145b               ; 12a0 28 14 5b  ;Check for collision (leaves either $80 or $00 in A)
                XS   $4                  ; 12a3 e4        ;EOR R4
                BT   1,A12b4             ; 12a4 81 0f     ;branch if positive (0 through 127) to 12b4
                LR   A,$7                ; 12a6 47        ;else load contents of R7 to R1 and contents of R9 to R2
                LR   $1,A                ; 12a7 51
                LR   A,$9                ; 12a8 49
                LR   $2,A                ; 12a9 52
                PI   A145b               ; 12aa 28 14 5b  ;Check for collision
                XS   $4                  ; 12ad e4        ;EOR R4 again
                BT   1,A12b4             ; 12ae 81 05     ;branch if positive (0 through 127) to 12b4
                LR   J,W                 ; 12b0 1e        ;else store status register in R9 and jump back to 1256
                JMP  A1256               ; 12b1 29 12 56  

A12b4:          LR   J,W                 ; 12b4 1e        ;store status register in R9
                BF   $0,A1275            ; 12b5 90 bf     ;jump to 1275

;The following entry point gets jumped to if the lion collides with a palisade

                PI   A12bd               ; 12b7 28 12 bd  ;6th entry of jump table: swap object properties 2nd list
                JMP  A1256               ; 12ba 29 12 56  ;jump back to 1256

;Subroutine for swapping the object properties of 2nd list for an object

A12bd:          LR   K,P                 ; 12bd 08        ;save return address
                DCI  $0db6               ; 12be 2a 0d b6  ;point to $0db6 + R0 * 2 (2nd object table)
                LR   A,$0                ; 12c1 40
                SL   1                   ; 12c2 13
                ADC                      ; 12c3 8e
                LM                       ; 12c4 16        ;store first byte in R1
                LR   $1,A                ; 12c5 51
                LM                       ; 12c6 16        ;store second byte in R2
                LR   $2,A                ; 12c7 52
                LI   $fe                 ; 12c8 20 fe     ;subtract 2 from DC0
                ADC                      ; 12ca 8e
                LR   A,$2                ; 12cb 42        ;store 2nd byte from R2 where first one was
                ST                       ; 12cc 17
                LR   A,$1                ; 12cd 41        ;store 1st byte from R1 where second one was
                ST                       ; 12ce 17
                PK                       ; 12cf 0c        ;return
                
                LIS  $0                  ; 12d0 70        ;3rd target of jump table - clear R0
                LR   $0,A                ; 12d1 50
                PI   A13c4               ; 12d2 28 13 c4  ;call Subroutine for doing something with object table(s)
                DCI  A12dc               ; 12d5 2a 12 dc  ;point to 12dc and store DC0 in Q
                LR   Q,DC                ; 12d8 0e
                PI   $4795               ; 12d9 28 47 95  ;shift 16-bit number 4 places to the left
A12dc:          SL   4                   ; 12dc 15        ;shift 4 places left
                LR   J,W                 ; 12dd 1e        ;store status register in R9 (result from left shift)
                LISL 5                   ; 12de 6d        ;load lower ISAR to 5 (what ist the higher one here?)
                LIS  $8                  ; 12df 78        ;A = $08 AND (ISAR)
                NS   (IS)-               ; 12e0 fe        
                LI   $fe                 ; 12e1 20 fe     ;load A with $fe
                BT   4,A12e6             ; 12e3 84 02     ;if last AND yielded zero (bit 3=0), branch to 12e6
                SL   1                   ; 12e5 13        ;make it $fc
A12e6:          DCI  A1bb2               ; 12e6 2a 1b b2  ;point to 1bb2
                LR   W,J                 ; 12e9 1d        ;bring back status register from R9
                BF   $1,A12f1            ; 12ea 91 06     ;branch on negative (on result from left shift before) to 12f1
                DCI  $0c6c               ; 12ec 2a 0c 6c  ;point to $0c6c
                COM                      ; 12ef 18        ;A = (255-A)+1
                INC                      ; 12f0 1f
A12f1:          XDC                      ; 12f1 2c        ;exchange data counters -> DC1 now points to 1bbc or 0c6c
                DCI  $0dba               ; 12f2 2a 0d ba  ;point to $0dba
                ST                       ; 12f5 17        ;store A here
                LIS  $0                  ; 12f6 70        ;clear $0dbb
                ST                       ; 12f7 17
                XDC                      ; 12f8 2c        ;exchange data counters again -> DC0 now points to 1bbc or 0c6c
                LIS  $2                  ; 12f9 72        ;A = (IS) EOR 2
                XS   (IS)                ; 12fa ec
                BF   $4,A1300            ; 12fb 94 04     ;if that operation gave not zero ((IS) was 2), skip next instruction
                DCI  A1f71               ; 12fd 2a 1f 71  ;else point to 1f71 instead
A1300:          LIS  $2                  ; 1300 72        ;load $02 in R0 as an object index (object 2 is the lion) 
                LR   $0,A                ; 1301 50
                PI   A1780               ; 1302 28 17 80  ;stores RAM address given in DC0 as RAM pointer to object number 
                PI   A17cb               ; 1305 28 17 cb  ;prepare graphics data pointer MSB for that object -> lion becomes red
                PI   A1883               ; 1308 28 18 83  ;do sound effect
                JMP  A18e7               ; 130b 29 18 e7  ;go to start of game loop ?

                LR   A,$0                ; 130e 40        ;jump table target - object 0
                BF   $0,A1318            ; 130f 90 08
A1311:          LIS  $2                  ; 1311 72        ;object 2; jump table entry
                BF   $0,A1318            ; 1312 90 05
                LIS  $3                  ; 1314 73        ;object 3 (player 1); jump table entry
                BF   $0,A1318            ; 1315 90 02
                LIS  $4                  ; 1317 74        ;object 4 (player 2); jump table target
A1318:          LR   $0,A                ; 1318 50
                PI   A17cb               ; 1319 28 17 cb  ;prepare graphics data pointer MSB for that object -> becomes red
                LR   A,$0                ; 131c 40
                DCI  $0f9d               ; 131d 2a 0f 9d  ;point to 0f9d + R0
                ADC                      ; 1320 8e
                LIS  $1                  ; 1321 71        ;store $01 there
                ST                       ; 1322 17
                LIS  $0                  ; 1323 70        ;clear A and R0
                LR   $0,A                ; 1324 50
                JMP  A13ef               ; 1325 29 13 ef  ;on at 13ef

A1328:          LIS  $f                  ; 1328 7f        ;jump target for other main variations than scrimmage, also jump table entry
                LR   $8,A                ; 1329 58
A132a:          PI   A1880               ; 132a 28 18 80  ;do sound effect 10 times with descending period from $0F to 0
                DS   $8                  ; 132d 38        ;happens in present Gladiator when ball goes out of screen
                BF   $4,A132a            ; 132e 94 fb
                JMP  A169e               ; 1330 29 16 9e  ;on at 169e (basically restart game without resetting score)

;The following passage prints the results screen

A1333:          PI   $40d0               ; 1333 28 40 d0  ;setup stack for subroutines
                PI   A1a98               ; 1336 28 1a 98  ;wait for scanline $24 or $34 and clear output port 14
                PI   $45db               ; 1339 28 45 db  ;load rows of text segments with $FF (initialization)
                LIS  $4                  ; 133c 74        ;store $04 at $08f5 (background color = dark blue - winning screen)
                DCI  $08f5               ; 133d 2a 08 f5
                ST                       ; 1340 17
                LI   $64                 ; 1341 20 64     ;store $64 at $0fea and $08f7 (Command register) -> use List A, Y-Zoom on, interrupt at scanline 0,
                DCI  $0fea               ; 1343 2a 0f ea  ;   KBD 0ff, disable Interrupt on FRZ, enable video chip, FRZ clear, no X-Zoom
                ST                       ; 1346 17
                DCI  $08f7               ; 1347 2a 08 f7
                ST                       ; 134a 17
                DCI  A1dee               ; 134b 2a 1d ee  ;point to 1dee (String)
                LI   $1b                 ; 134e 20 1b     ;1b bytes to print
                LISU 2                   ; 1350 62        ;store in R20
                LISL 4                   ; 1351 6c
                LR   (IS),A              ; 1352 5c
                PI   $4205               ; 1353 28 42 05  ;print string
                PI   $41c8               ; 1356 28 41 c8  ;do clock
                DCI  $0f96               ; 1359 2a 0f 96  ;point to $0f96 and load R1 and R2 from there (player scores)
                LM                       ; 135c 16
                LR   $1,A                ; 135d 51
                LM                       ; 135e 16
                LR   $2,A                ; 135f 52
                COM                      ; 1360 18        ;complement last value (R2), increase it and add R1
                INC                      ; 1361 1f
                AS   $1                  ; 1362 c1
                DCI  $0fdf               ; 1363 2a 0f df  ;store R9 in $0fdf (cursor position)
                LI   $09                 ; 1366 20 09
                ST                       ; 1368 17
                LR   A,$1                ; 1369 41        ;copy R1 into R4
                LR   $4,A                ; 136a 54
                LI   $34                 ; 136b 20 34     ;load $34 (character no. for "1")
                BF   $1,A1373            ; 136d 91 05     ;branch on negative (255-R2+R1+1 = 128 through 255, or simply R1-R2 or R1 < R2)
                LR   A,$2                ; 136f 42        ;copy R2 into R4 and load $24 (character no. for "2")
                LR   $4,A                ; 1370 54
                LI   $24                 ; 1371 20 24
A1373:          LR   $8,A                ; 1373 58        ;load character number in R8
                PI   $40d9               ; 1374 28 40 d9  ;draw character (display wich player has won)
                DCI  $0ca4               ; 1377 2a 0c a4  ;point to 0ca4 (destination)
                XDC                      ; 137a 2c
                DCI  $0f3f               ; 137b 2a 0f 3f  ;point to 0f3f (source) + R4
                LR   A,$4                ; 137e 44
                ADC                      ; 137f 8e
                LIS  $7                  ; 1380 77        ;7 = number of lines to draw on character
                LR   (IS),A              ; 1381 5c
                PI   A13c0               ; 1382 28 13 c0  ;draw character (apparently, from 0f3f, not from ROM charset)
                DCI  $0fdf               ; 1385 2a 0f df  ;store $1c in $0fdf (cursor position)
                LI   $1c                 ; 1388 20 1c
                ST                       ; 138a 17
                DCI  $0f98               ; 138b 2a 0f 98  ;point to $0f98 (string position)
                LIS  $3                  ; 138e 73
                LISL 4                   ; 138f 6c        ;point to R20 and store $03 there (3 characters to draw)
                LR   (IS),A              ; 1390 5c
                PI   $4205               ; 1391 28 42 05  ;print string
                DCI  $0fdf               ; 1394 2a 0f df  ;set cursor position to start of 4th line
                LI   $30                 ; 1397 20 30
                ST                       ; 1399 17
                DCI  $0f85               ; 139a 2a 0f 85  ;print string from $0f85, $10 (16) characters
                LI   $10                 ; 139d 20 10
                LISL 4                   ; 139f 6c
                LR   (IS),A              ; 13a0 5c
                PI   $4205               ; 13a1 28 42 05  ;print string subroutine
                LIS  $0                  ; 13a4 70        ;clear R5 and R6
                LR   $5,A                ; 13a5 55
                LR   $6,A                ; 13a6 56
A13a7:          LIS  $0                  ; 13a7 70        ;clear $0fe2
                DCI  $0fe2               ; 13a8 2a 0f e2
                ST                       ; 13ab 17
                PI   A18b3               ; 13ac 28 18 b3  ;handle title music (subroutine comes back with keycode in R8)
                LR   A,$8                ; 13af 48        ;compare R8 (keycode) with $3F and branch to 13bb if equal
                CI   $3f                 ; 13b0 25 3f
                BT   4,A13bb             ; 13b2 84 08     
                CI   $43                 ; 13b4 25 43     ;compare R8 (keycode) with $43 and branch to 13a7 if not equal
                BF   $4,A13a7            ; 13b6 94 f0
                JMP  A101f               ; 13b8 29 10 1f  ;jump back to start of title screen
A13bb:          LISU 3                   ; 13bb 63        ;point to R28
                LISL 4                   ; 13bc 6c
                JMP  A10cc               ; 13bd 29 10 cc  ;play same game variation once again, skipping the title screen

A13c0:          LR   K,P                 ; 13c0 08        ;save return address
                JMP  $40fb               ; 13c1 29 40 fb  ;jump to $40fb in RES1, which is part of the DRAWCHAR subroutine and prints the character

;Subroutine for doing something with object table(s)
;I think this should invalidate an object
;Parameters:
;R0... object number
;R1... ?
;R2... ?
;
;
;Trashes: K, A, S, R7, DC0
;
;For objects other than no. 2 (lion / space mine / blocker), store $e8 as new x-coordinate and clear 2-byte block for object
;For lion etc., R1 and R2 get checked. If R2 is less or equal to $89 and R1 is $5e, jump to 1279,
;Otherwise, otherwise $d8 is the lion's new x-coordinate and its 2-byte block gets cleared as well.


A13c4:          LR   K,P                 ; 13c4 08        ;subroutine - save return address
                LR   A,$0                ; 13c5 40        ;load R0 in A (object number)
                CI   $02                 ; 13c6 25 02     ;compare with $02
                LI   $e8                 ; 13c8 20 e8     ;load $e8
                BF   $4,A13d8            ; 13ca 94 0d     ;branch if not zero (if R0 was not $02) to 13d8
                LR   A,$2                ; 13cc 42        ;else load R2, compare with $89
                CI   $89                 ; 13cd 25 89
                BF   $2,A13d6            ; 13cf 92 06     ;and branch to 13d6 if no carry (R2 is bigger than $89)
                LR   A,$1                ; 13d1 41        ;compare R1 with $5e
                CI   $5e                 ; 13d2 25 5e
                BT   4,A13ec             ; 13d4 84 17     ;and branch if zero (R1 = $5e) to 13ec, where a jump to 1279 occurs
A13d6:          LI   $d8                 ; 13d6 20 d8     ;load $d8
A13d8:          LR   $7,A                ; 13d8 57        ;store to R7 ($d8 for object 2, otherwise $e8)
                DCI  $0d5e               ; 13d9 2a 0d 5e  ;point to object table + (R0 * 4) (x-coord.)
                LR   A,$0                ; 13dc 40        
                SL   1                   ; 13dd 13
                SL   1                   ; 13de 13
                ADC                      ; 13df 8e       
                LR   A,$7                ; 13e0 47        ;load R7 and store into object table + (R0 * 4) -> new x-coordinate
                ST                       ; 13e1 17
                DCI  $0db6               ; 13e2 2a 0d b6  ;point to $0db6 + (R0 * 2) (2nd object table?)
                LR   A,$0                ; 13e5 40
                SL   1                   ; 13e6 13
                ADC                      ; 13e7 8e
                LIS  $0                  ; 13e8 70        ;clear $0db6 + (R0 * 2), $0db7 + (R0 * 2) (both bytes of the object)
                ST                       ; 13e9 17
                ST                       ; 13ea 17
                PK                       ; 13eb 0c        ;return
                
A13ec:          JMP  A1279               ; 13ec 29 12 79
A13ef:          PI   A13c4               ; 13ef 28 13 c4  ;4nd target of jump table & Target for scrimmage
                JMP  A1256               ; 13f2 29 12 56  ;call subroutine for doing something with object table(s) and jump to 1256

;Subroutine for generating X-coordinate list in R40-R55
;R0 and R2 seem to be loop variables
;reads from object table at $0d5e upwards
;and stores in Rxx with the following formula:
;R1 = (object data 1)
;A = 255 - (256 - (object data 2) + R1) = 255 - 256 + object data 2 - R1 = -1 + object data 2 - R1 = (object data 2 - object data 1) - 1
;final data in Rxx = (object data 2 - object data 1) - 1
;object data 3 and 4 remain unused for this routine

A13f5:          LR   K,P                 ; 13f5 08       ;save return address
                LISU 5                   ; 13f6 65       ;point to R47
                LISL 7                   ; 13f7 6f
                DCI  $0d5e               ; 13f8 2a 0d 5e  ;point to 0d5e (contains object data in spacing of 4 bytes?)
                LI   $10                 ; 13fb 20 10    ;Load $10 into R0
                LR   $0,A                ; 13fd 50
                LIS  $2                  ; 13fe 72       ;load $02 into R2
                LR   $2,A                ; 13ff 52
A1400:          LM                       ; 1400 16       ;load from memory (0d5e upwards = Object table)
                LR   $1,A                ; 1401 51       ;store in R1
                LM                       ; 1402 16       ;load from memory (next byte)
                COM                      ; 1403 18       ;complement
                INC                      ; 1404 1f       ;increment accumulator
                AS   $1                  ; 1405 c1       ;add R1
                COM                      ; 1406 18       ;complement
                LR   (IS)+,A             ; 1407 5d       ;store in R40+ (gets used for X-coordinates of segments)
                BR7  A140b               ; 1408 8f 02
                LISU 6                   ; 140a 66       ;order: R47,40-46,55,48-54 (gets read out in same order)
A140b:          LR   A,$2                ; 140b 42       ;add R2 (= $02) to DC0
                ADC                      ; 140c 8e
                DS   $0                  ; 140d 30       ;decrement R0 and loop back if not zero
                BF   $4,A1400            ; 140e 94 f1
                PK                       ; 1410 0c       ;return

;Initialization routine for Future Gladiator
                
A1411:          DCI  $0c98               ; 1411 2a 0c 98  ;destination
                XDC                      ; 1414 2c
                DCI  A1cf6               ; 1415 2a 1c f6  ;source
                LI   $50                 ; 1418 20 50
                LR   $7,A                ; 141a 57        ;$50 bytes to copy
                PI   A11a5               ; 141b 28 11 a5  ;memcopy $50 bytes from $1cf6 to $0c98
                DCI  $0caa               ; 141e 2a 0c aa  ;store $94 at $0caa
                LI   $94                 ; 1421 20 94
                ST                       ; 1423 17
                LI   $13                 ; 1424 20 13     ;store $13 in R0 and add $13 to DCO, now pointing at $0cbe
                LR   $0,A                ; 1426 50
                ADC                      ; 1427 8e
                LI   $95                 ; 1428 20 95     ;store $95 in $0cbe and in R1
                ST                       ; 142a 17
                LR   $1,A                ; 142b 51        
                LR   A,$0                ; 142c 40        ;add $13 to DC0, making it $0cd2
                ADC                      ; 142d 8e
                LR   A,$1                ; 142e 41        ;store $95 in $0cd2
                ST                       ; 142f 17
                LR   A,$0                ; 1430 40        ;add $13 to DC0, making it $0ce6
                ADC                      ; 1431 8e
                LR   A,$1                ; 1432 41        ;store $95 in $0ce6
                ST                       ; 1433 17
                LI   $10                 ; 1434 20 10     ;load R7 with $10
                LR   $7,A                ; 1436 57
                JMP  A16a0               ; 1437 29 16 a0  ;jump to 16a0 (common game initialization routine)

;another subroutine, does something with objects, probably
;Pseudocode in BASIC:
;
;If ($0f9d + R0) = 0 Then 
;   If ($0f9e) <> 0 Then 1256
;   If ($0fa2) = 0 Then A = 4 else A = 3
;   If A <> R0 Then 1256
;End IF

A143a:          LR   K,P                 ; 143a 08        ;save return address
                DCI  $0f9d               ; 143b 2a 0f 9d  ;point at $0f9d + R0
                LR   A,$0                ; 143e 40
                ADC                      ; 143f 8e
                LIS  $0                  ; 1440 70        ;check that address for zero
                XM                       ; 1441 8c
                BF   $4,A145a            ; 1442 94 17     ;return if not zero
                DCI  $0f9e               ; 1444 2a 0f 9e  ;point at $0f9e and check for zero
                LIS  $0                  ; 1447 70
                XM                       ; 1448 8c
                BF   $4,A1457            ; 1449 94 0d     ;if not zero, jump to 1256 (out of subroutine)
                DCI  $0fa2               ; 144b 2a 0f a2  ;point at $0fa2 and check for zero
                LIS  $0                  ; 144e 70
                XM                       ; 144f 8c
                LIS  $3                  ; 1450 73
                BT   4,A1454             ; 1451 84 02     ;if zero, load A with $04, else with $03
                LIS  $4                  ; 1453 74
A1454:          XS   $0                  ; 1454 e0        ;compare to R0
                BT   4,A145a             ; 1455 84 04     ;if equal, return, else jump to 1256 (out of subroutine)
A1457:          JMP  A1256               ; 1457 29 12 56
A145a:          PK                       ; 145a 0c

;----------------------------------------------------------
;Subroutine Check Collisions
;I suppose this is checking for collisions between two objects.
;One object is given as working variables in R1, R2, R5 and R6,
;the other object is read from the object table with R4 being the index into the table.
;
;R8 is obviously a temporary variable
;Parameters:
;R4 = index into object table (object number)
;R1 = x-cooord. + ?
;R5 = object width / 2
;R2 = y-coord. (center) + ?
;R6 = object height / 2
;
;A contains the return value - 

;trashes: K, A, R8, DC0
;returns with either $80 or $00 in A - $80 if the two objects collide, $00 if they don't.

A145b:          LR   K,P                 ; 145b 08        ;save return address
                DCI  $0d5e               ; 145c 2a 0d 5e  ;point to $0d5e + (R4 * 4) (object table) (x-coord.)
                LR   A,$4                ; 145f 44        
                SL   1                   ; 1460 13
                SL   1                   ; 1461 13
                ADC                      ; 1462 8e
                LM                       ; 1463 16        ;load from memory (x-coord. of object), complement and add R1
                COM                      ; 1464 18
                AS   $1                  ; 1465 c1
                BF   $1,A1469            ; 1466 91 02     ;branch on negative (if (R1-1-x-coord.) = 128 through 255) - skip next instruction
                COM                      ; 1468 18        ;complement again
A1469:          LR   $8,A                ; 1469 58        ;store in R8 -> R8 = R1-x-coord.-1 if that's positive, else x-coord.-R1
                LR   A,$5                ; 146a 45        ;A = (object width/2) + R5 (object width of other object / 2)
                AM                       ; 146b 88
                AS   $8                  ; 146c c8        ;A = A + R8
                BF   $2,A147f            ; 146d 92 11     ;if the addition of R8 doesn't invoke carry, branch to 147f (return with 0 in A)
                LM                       ; 146f 16        ;load from memory 3rd byte of object table
                COM                      ; 1470 18        
                AS   $2                  ; 1471 c2        ;A = 255 - (y-coord. of pointed object) + R2
                BF   $1,A1475            ; 1472 91 02     ;If the result is negative (128 through 255), skip next instruction,
                COM                      ; 1474 18        ;else complement again
A1475:          LR   $8,A                ; 1475 58        ;store in R8 -> R8 = (255-y-coord. of pointed object)+R2 if that's positive, else y-coord.-R2
                LM                       ; 1476 16        ;load 4th byte of object table (object height / 2) from memory
                AS   $6                  ; 1477 c6        ;add R6 and R8
                AS   $8                  ; 1478 c8
                BF   $2,A147f            ; 1479 92 05     ;if addition of R8 doesn't invoke carry, branch to 147f where A gets cleared
                LI   $80                 ; 147b 20 80     ;else A gets set to $80
                BF   $0,A1480            ; 147d 90 02     ;could have written PK here - would have been 1 byte shorter

A147f:          LIS  $0                  ; 147f 70        ;clear A
A1480:          PK                       ; 1480 0c        ;return

;------------------------------------
; The following routine reads the joystick pots and does something with that data
;
; First we decide if player 1 or player 2 gets polled

A1481:          LISL 6                   ; 1481 6e        ;targeted from another part of the code
                LI   $80                 ; 1482 20 80     ;A = (IS) EOR $80
                XS   (IS)                ; 1484 ec
                LR   (IS)-,A             ; 1485 5e        ;put that value into (IS)
                BT   1,A14c3             ; 1486 81 3c     ;if positive (new value is 0 through 127), branch to 14c3 (poll player 2 instead)

;The following polls joystick 1 and stores the according values

                LIS  $1                  ; 1488 71        ;store $01 in R10 (read axis 1)
                LR   $a,A                ; 1489 5a
                PI   A1a98               ; 148a 28 1a 98  ;wait for scanline $24 or $34 and clear output port 14
                PI   $21ad               ; 148d 28 21 ad  ;read joystick of player 1
                LISU 3                   ; 1490 63        ;point to R29 (sub variation)
                LISL 5                   ; 1491 6d
                LR   $2,A                ; 1492 52        ;store A (return value of read) in R2
                DCI  $0dda               ; 1493 2a 0d da  ;point to $0dda
                XDC                      ; 1496 2c        ;A = A EOR ($0dda) (mainly for setting flags)
                LIS  $0                  ; 1497 70        ;clear R4 (offset into object table = 0)
                LR   $4,A                ; 1498 54
                LI   $10                 ; 1499 20 10     ;A = $10 AND (IS)
                NS   (IS)-               ; 149b fe
                LIS  $2                  ; 149c 72        ;load $02 into A
                BT   4,A14a0             ; 149d 84 02     ;branch if zero (bit 4 in (IS) clear = subvariation "player 1 fast" not engaged) to 14a0
                LIS  $3                  ; 149f 73        ;else load $03 into A instead
A14a0:          LR   $5,A                ; 14a0 55        ;store in R5
                PI   A1525               ; 14a1 28 15 25  ;call 1525 (process joystick values and write into object tables)
                LIS  $0                  ; 14a4 70        ;set bit 0 to read
                LR   $a,A                ; 14a5 5a
                PI   $21ad               ; 14a6 28 21 ad  ;read joystick of player 1
                LISU 3                   ; 14a9 63        ;point to R29 (sub variation)
                LISL 5                   ; 14aa 6d
                LR   $2,A                ; 14ab 52
                PI   A1aab               ; 14ac 28 1a ab  ;store $4c in command register and $0fea, set output port 14 to 1, clear $0fdd and $0fde
                DCI  $0dda               ; 14af 2a 0d da  ;point to $0dda
                XDC                      ; 14b2 2c        ;swap data counters
                LI   $10                 ; 14b3 20 10
                NS   (IS)                ; 14b5 fc        ;A = R29 AND $10 (for checking flags) - subvariation "player 1 fast"
                LI   $fe                 ; 14b6 20 fe     ;load $fe
                BT   4,A14bc             ; 14b8 84 03     ;branch if zero (bit 4 in (IS) clear) to 14bc
                LI   $fd                 ; 14ba 20 fd     ;else load $fd into A instead
A14bc:          LR   $5,A                ; 14bc 55        ;store $fe or $fd (depending on (IS) status) in R5
                PI   A1575               ; 14bd 28 15 75  ;call 1575
                JMP  A1244               ; 14c0 29 12 44  ;jump back to 1244

;The following part polls player 2. Apparently, either player 1 or 2 gets polled, but not both at a time.

A14c3:          LIS  $8                  ; 14c3 78        ;A = ($08) AND R29
                NS   (IS)                ; 14c4 fc
                LR   J,W                 ; 14c5 1e        ;store status register in R9
                BT   4,A14d7             ; 14c6 84 10     ;branch to 14d7 if zero (bit 3 in (IS) is clear) - subvariation "computer plays player 2" clear
                DCI  $0d6a               ; 14c8 2a 0d 6a  ;load from $0d6a and compare with $0d6e
                LM                       ; 14cb 16
                DCI  $0d6e               ; 14cc 2a 0d 6e
                CM                       ; 14cf 8d
                LI   $c8                 ; 14d0 20 c8     ;load $c8 in A
                BF   $2,A14d5            ; 14d2 92 02     ;branch if no carry ($0d6e is not bigger than $0d6a)
                LIS  $0                  ; 14d4 70        ;else load $00 instead
A14d5:          BF   $0,A14e1            ; 14d5 90 0b     ;jump to 14e1, skipping joystick readout for player 2

A14d7:          LIS  $3                  ; 14d7 73        ;this only gets executed if bit 3 in (IS) is clear: set bit 3 to read
                LR   $a,A                ; 14d8 5a
                PI   A1a98               ; 14d9 28 1a 98  ;wait for scanline $24 or $34 and clear output port 14
                PI   $21ad               ; 14dc 28 21 ad  ;read joystick of player 2
                LISU 3                   ; 14df 63        ;point to R29 (sub variation)
                LISL 5                   ; 14e0 6d
A14e1:          LR   $2,A                ; 14e1 52        ;store return value in R2
                DCI  $0e26               ; 14e2 2a 0e 26  ;point to $0e26
                XDC                      ; 14e5 2c        ;swap data pointers
                LIS  $2                  ; 14e6 72        ;load $02 into R4 (offset into object table)
                LR   $4,A                ; 14e7 54
                LI   $20                 ; 14e8 20 20     ;A = (IS) AND $20 -> check subvariation for "fast player 2"
                NS   (IS)                ; 14ea fc
                LIS  $2                  ; 14eb 72        ;load $02 in A
                BT   4,A14ef             ; 14ec 84 02     ;branch if zero -> skip next instruction if player 2 is set to slow
                LIS  $3                  ; 14ee 73        ;load $03 in A for fast player 2
A14ef:          LR   $5,A                ; 14ef 55        ;store in R5
                PI   A1525               ; 14f0 28 15 25  ;call 1525 (process joystick values and write into object tables)
                LIS  $8                  ; 14f3 78        
                NS   (IS)                ; 14f4 fc        ;A = (IS) AND $08 -> check subvariation "computer opponent"
                BT   4,A1506             ; 14f5 84 10     ;branch if zero -> if computer opponent is disengaged (player 2 active)
                DCI  $0d6c               ; 14f7 2a 0d 6c  ;else compare $0d6c with $0d70
                LM                       ; 14fa 16
                DCI  $0d70               ; 14fb 2a 0d 70
                CM                       ; 14fe 8d
                LI   $c8                 ; 14ff 20 c8     ;load $c8
                BF   $2,A1504            ; 1501 92 02     ;if no carry ($0d70 not bigger than $0d6c), skip next instruction
                LIS  $0                  ; 1503 70        ;otherwise load $00 instead
A1504:          BF   $0,A150d            ; 1504 90 08     ;jump to $150d (skip joystick readout for player 2)
A1506:          LIS  $2                  ; 1506 72        ;set bit 2 to read
                LR   $a,A                ; 1507 5a
                PI   $21ad               ; 1508 28 21 ad  ;read joystick of player 2
                LISU 3                   ; 150b 63        ;point to R29 (Subvariation) again
                LISL 5                   ; 150c 6d
A150d:          LR   $2,A                ; 150d 52        ;store joystick readout in R2
                PI   A1aab               ; 150e 28 1a ab  ;store $4c in command register and $0fea, set output port 14 to 1, clear $0fdd and $0fde
                DCI  $0e26               ; 1511 2a 0e 26  ;point to $0e26
                XDC                      ; 1514 2c        ;swap data pointers
                LI   $20                 ; 1515 20 20     ;A = $20 AND R29
                NS   (IS)                ; 1517 fc
                LI   $fe                 ; 1518 20 fe     ;load $FE
                BT   4,A151e             ; 151a 84 03     ;branch on zero -> if game variation 32 (player 2 fast) not active, skip next instruction
                LI   $fd                 ; 151c 20 fd     ;for fast player 2, load $FD instead
A151e:          LR   $5,A                ; 151e 55
                PI   A1575               ; 151f 28 15 75  ;call 1575
                JMP  A1244               ; 1522 29 12 44  ;jump to 1244 (part of main game loop, probably)

;Subroutine that gets called twice in main loop - apparently, once for each player
;
;Parameters:
;R5... $02 for slow or $03 for fast player 1/2 depending on which one is on (?)
;R4... offset into object table (?)
;R2... return value of the joystick (analog, from $00 through $c8)
;Trashes: K, A, R1, R2, R6, R7, DC0, J, W, ISAR
;
;Return values are generally given in object list pointed to at R4... offsets from $0dbc (speed), $0c65 ($05/$00), $0c69 ($01/$00)
;but those values are also given in R7, R6 and R1.

A1525:          LR   K,P                 ; 1525 08        ;save return address
                PI   $40a9               ; 1526 28 40 a9  ;push return address
                LR   A,$2                ; 1529 42        ;compare R2 (joystick value) with $B4
                CI   $b4                 ; 152a 25 b4
                DCI  $0e72               ; 152c 2a 0e 72  ;point to $0e72
                LIS  $0                  ; 152f 70        ;clear R1 and R6
                LR   $6,A                ; 1530 56
                LR   $1,A                ; 1531 51
                LR   A,$5                ; 1532 45        ;load R5 into A
                BF   $2,A154f            ; 1533 92 1b     ;branch if no carry, that is, if R2 (joystick value) bigger than $B4
                LR   A,$2                ; 1535 42        ;load R2 (joystick value) into A instead and compare with $14
                CI   $14                 ; 1536 25 14     ;this result is later stored in R9
                DCI  $0d38               ; 1538 2a 0d 38  ;point to $0d38
                LIS  $5                  ; 153b 75        ;store $05 in R6 and $01 in R1
                LR   $6,A                ; 153c 56
                LIS  $1                  ; 153d 71 
                LR   $1,A                ; 153e 51
                LR   A,$5                ; 153f 45        ;load R5 into A again
                LR   J,W                 ; 1540 1e        ;store status register in R9
                COM                      ; 1541 18        ;complement previous R5 contents and increase by 1
                INC                      ; 1542 1f
                LR   W,J                 ; 1543 1d        ;bring back status register from R9 (comparison of joystick and $14)
                BT   2,A154f             ; 1544 82 0a     ;branch on carry (if joystick value is lower than $14) to 154f
                DCI  $0dbc               ; 1546 2a 0d bc  ;if no carry, point to ($0dbc + R4)
                LR   A,$4                ; 1549 44
                ADC                      ; 154a 8e
                LIS  $0                  ; 154b 70        ;clear ($0dbc + R4) and jump forward to 156f
                ST                       ; 154c 17
                BF   $0,A156f            ; 154d 90 21

;The following part gets executed if the joystick value is either bigger than $B4 or smaller than $14.
;If the value was bigger than $B4, R1 and R6 are clear, and A has the value of R5
;If it's smaller than $14, R1 has $01, R6 has $05, and A has negative value of R5.

A154f:          LR   $7,A                ; 154f 57        ;store R5 or -R5 from above into R7
                LI   $26                 ; 1550 20 26     ;store $26 into R2
                LR   $2,A                ; 1552 52
                XDC                      ; 1553 2c        ;swap data pointers (DC0 now where DC1 was supplied on call)
                LR   A,$1                ; 1554 41        ;add R1 to DC0
                ADC                      ; 1555 8e
                XDC                      ; 1556 2c        ;swap data pointers again
                PI   A1628               ; 1557 28 16 28  ;memcopy with interleave 2 (maybe to mirror player if necessary?)
                LR   A,$4                ; 155a 44
                DCI  $0dbc               ; 155b 2a 0d bc  ;point to $0dbc + R4
                ADC                      ; 155e 8e
                LR   A,$7                ; 155f 47        ;store contents of R7 there (probably speed which can also be negative)
                ST                       ; 1560 17
                DCI  $0c65               ; 1561 2a 0c 65  ;point to $0c65 + R4 
                LR   A,$4                ; 1564 44
                ADC                      ; 1565 8e
                LR   A,$6                ; 1566 46        ;store contents of R6 there ($05 for small value, $00 for big one)
                ST                       ; 1567 17
                DCI  $0c69               ; 1568 2a 0c 69  ;point to $0c69 + R4 
                LR   A,$4                ; 156b 44
                ADC                      ; 156c 8e
                LR   A,$1                ; 156d 41        ;store contents of R1 there ($01 for small value, $00 for big one)
                ST                       ; 156e 17
A156f:          PI   $40bc               ; 156f 28 40 bc  ;pop back return address
                LISU 3                   ; 1572 63        ;point to R29 (sub game variation)
                LISL 5                   ; 1573 6d
                PK                       ; 1574 0c        ;return

;The following subroutine gets called twice in the main loop - apparently once for each player - just before jumping back to 1244
;It probably has to do with displaying the aim of the past gladiators and also guides the guided shots if they are active
;
;Parameters:
;R2 contains joystick readout for that player
;R5 contains $fe for slow or $fd for fast player 1/2 depending on which one is on (?) 
;R4 probably contains pointer into object table at $0dbd              
;DC1 supplies a data pointer which gets used later
;
;trashes: K, A, R1, R2, R5, R7, J, W
;and also processes the object table 

A1575:          LR   K,P                 ; 1575 08        ;save return address
                PI   $40a9               ; 1576 28 40 a9  ;push return address
                LR   A,$2                ; 1579 42
                SR   4                   ; 157a 14
                DCI  A1c55               ; 157b 2a 1c 55  ;point to 1c55 + (R2 / 16) (contains values from 0 to 5 depending on position)
                ADC                      ; 157e 8e        ;(probably aim on gladiator for past gladiator)
                LIS  $0                  ; 157f 70        ;clear A and XOR with that address (effectively load it into A, setting flags)
                XM                       ; 1580 8c
                LR   $7,A                ; 1581 57        ;store aim value from 0 to 5 in R7 and point to $0dbd + R4
                DCI  $0dbd               ; 1582 2a 0d bd
                LR   A,$4                ; 1585 44
                ADC                      ; 1586 8e
                LR   A,$5                ; 1587 45        ;load R5 in A
                BT   4,A1594             ; 1588 84 0b     ;branch forward to 1594 if zero (data at (1c55 + (R2/16)) is equal to 0)
                LR   J,W                 ; 158a 1e        ;store status register in R9, complement A and increase it by 1
                COM                      ; 158b 18
                INC                      ; 158c 1f
                LR   W,J                 ; 158d 1d        ;bring back status register from R9
                BF   $1,A1594            ; 158e 91 05     ;branch on negative (data at (1c55 + (R2/16)) is $80 through $FF)
                LIS  $0                  ; 1590 70        ;if not branched, store $00 at (0dbd + R4) and jump to 159a
                ST                       ; 1591 17
                BF   $0,A159a            ; 1592 90 07

A1594:          ST                       ; 1594 17        ;else store data at A at (0dbd + R4)
                LR   A,$7                ; 1595 47        ;R7 = (R7 AND $7F) + 1 -> aim value gets complimented
                SL   1                   ; 1596 13
                SR   1                   ; 1597 12
                INC                      ; 1598 1f
                LR   $7,A                ; 1599 57
A159a:          DCI  $0c65               ; 159a 2a 0c 65  ;point to $0c65 + R4
                LR   A,$4                ; 159d 44
                ADC                      ; 159e 8e
                DS   $7                  ; 159f 37        ;decrement R7
                LM                       ; 15a0 16        ;($0c66 + R4) = ($0c65 + R4) + aim value
                AS   $7                  ; 15a1 c7
                ST                       ; 15a2 17
                LR   $7,A                ; 15a3 57        ;also put that value into R7; new value = ($0c65 + R4 + aim value)
                DCI  $0c69               ; 15a4 2a 0c 69  ;point to $0c69 + R4
                LR   A,$4                ; 15a7 44
                ADC                      ; 15a8 8e
                LM                       ; 15a9 16        ;R1 = ($0c69 + R4)
                LR   $1,A                ; 15aa 51
                LR   A,$7                ; 15ab 47        ;load from R7
                DCI  $0c98               ; 15ac 2a 0c 98  ;point to $0c98 + (R7 * 8)
                SL   4                   ; 15af 15
                SR   1                   ; 15b0 12
                ADC                      ; 15b1 8e
                ADC                      ; 15b2 8e
                LI   $10                 ; 15b3 20 10     ;store $10 in R2
                LR   $2,A                ; 15b5 52
                XDC                      ; 15b6 2c        ;exchange data pointers; DC0 is now DC1 from call
                LIS  $1                  ; 15b7 71        ;A = $01 EOR R1
                XS   $1                  ; 15b8 e1
                ADC                      ; 15b9 8e        ;add that to current pointer
                LIS  $3                  ; 15ba 73
                LR   $5,A                ; 15bb 55        ;store $03 in R5 (clear 3 bytes)
                LIS  $0                  ; 15bc 70        ;clear memory at pointer supplied on call + ($01 EOR R1)
A15bd:          ST                       ; 15bd 17
                CM                       ; 15be 8d        ;compare with next byte
                DS   $5                  ; 15bf 35        ;decrement R5
                BF   $4,A15bd            ; 15c0 94 fc     ;if not zero yet, branch back to A15bd and clear further byte
                XDC                      ; 15c2 2c
                PI   A1628               ; 15c3 28 16 28  ;memcopy with interleave 2
                XDC                      ; 15c6 2c
                LI   $13                 ; 15c7 20 13     ;load $13 ($13 bytes to clear)
                LR   $5,A                ; 15c9 55        ;store in R5
                LIS  $0                  ; 15ca 70        ;store $00 in memory
A15cb:          ST                       ; 15cb 17
                CM                       ; 15cc 8d        ;compare just to advance pointer
                DS   $5                  ; 15cd 35        ;decrement R5
                BF   $4,A15cb            ; 15ce 94 fc     ;branch back if another byte to clear
                LISU 3                   ; 15d0 63        ;point to R29 (main game variation)
                LISL 5                   ; 15d1 6d
                LIS  $2                  ; 15d2 72        ;load $02, and with game variation
                NS   (IS)-               ; 15d3 fe
                BT   4,A15e8             ; 15d4 84 13     ;if zero (game variation $02 - guided shots - not set), branch forward to A15e8
                DCI  $0e9e               ; 15d6 2a 0e 9e  ;else process guided shots: point to $0e9e and load byte from there
                LM                       ; 15d9 16
                XS   $4                  ; 15da e4        ;EOR R4
                BF   $4,A15e8            ; 15db 94 0c     ;branch forward to A15e8 if not zero (byte EOR R4 <> zero)
                DCI  A1ce3               ; 15dd 2a 1c e3  ;point to 1ce3 + R7 * 2
                LR   A,$7                ; 15e0 47
                ADC                      ; 15e1 8e
                ADC                      ; 15e2 8e
                LM                       ; 15e3 16        ;load byte from there and store in $0db7
                DCI  $0db7               ; 15e4 2a 0d b7
                ST                       ; 15e7 17
A15e8:          PI   $40bc               ; 15e8 28 40 bc  ;pop back return address
                LISU 3                   ; 15eb 63        ;point to R28 (main game variation)
                LISL 4                   ; 15ec 6c
                PK                       ; 15ed 0c        ;return
                
;the following routine handles something about the lion, blocking back or space mine, depending on variation

A15ee:          PI   $4795               ; 15ee 28 47 95  ;shift 16-bit number 4 places to the left
                LR   $7,A                ; 15f1 57        ;store A into R7
                LISL 5                   ; 15f2 6d        ;point to R29 (upper reg. should be 3 at this point) = subgame variation
                LI   $40                 ; 15f3 20 40     ;A = (IS) AND $40 (check game variation "No lion / blocking back / space mine")
                NS   (IS)-               ; 15f5 fe
                BF   $4,A1625            ; 15f6 94 2e     ;if not zero (game variation is set = no enemy), branch forward to $1625
                LIS  $1                  ; 15f8 71        ;check for main game $01 (Scrimmage = Modern Gladiator)
                XS   (IS)                ; 15f9 ec        ;A = R28 EOR $01
                BT   4,A1625             ; 15fa 84 2a     ;branch if zero (subgame variation Scrimmage)
                DCI  $0d66               ; 15fc 2a 0d 66  ;compare location $0d66 to $d8, branch if not equal to 1625
                LM                       ; 15ff 16
                CI   $d8                 ; 1600 25 d8
                BF   $4,A1625            ; 1602 94 22
                LR   A,$7                ; 1604 47        ;compare R7 (Shifted 16-bit number) with $02, branch if no carry (R7 <= $02) to 1625
                CI   $02                 ; 1605 25 02
                BF   $2,A1625            ; 1607 92 1d
                DCI  $1c88               ; 1609 2a 1c 88  ;point to 1c88
                LIS  $2                  ; 160c 72
                XS   (IS)                ; 160d ec        ;A = R28 EOR $02
                BF   $4,A1613            ; 160e 94 04     ;if this is not zero (game variation is not Future Gladiator), branch forward to 1613
                DCI  A1f99               ; 1610 2a 1f 99  ;for Future Gladiator, point to 1f99 instead
A1613:          LIS  $2                  ; 1613 72
                LR   $0,A                ; 1614 50
                PI   A174b               ; 1615 28 17 4b  ;store object properties of object R0 = object 2 (lion in ancient Gladiator)
                DCI  $0d66               ; 1618 2a 0d 66  ;store $5e in $0d66, $00 in $0dba and $02 in $0dbb
                LI   $5e                 ; 161b 20 5e
                ST                       ; 161d 17
                DCI  $0dba               ; 161e 2a 0d ba
                LIS  $0                  ; 1621 70
                ST                       ; 1622 17
                LIS  $2                  ; 1623 72
                ST                       ; 1624 17
A1625:          JMP  A17da               ; 1625 29 17 da  ;on at 17da

;--------------------------------------------
;Another memcopy subroutine
;This one copies from DC0 to DC1, but DC1 gets increased by two instead of one for each iteration
;
;Parameters:
;DC0 = source address
;DC1 = destination address
;R2 = number of bytes to be copied

A1628:          LR   K,P                 ; 1628 08        ;save return address
A1629:          LM                       ; 1629 16        ;load from DC0
                XDC                      ; 162a 2c
                ST                       ; 162b 17        ;store at DC0
                CM                       ; 162c 8d        ;compare memory to accumulator (-> increment destination one more time)
                XDC                      ; 162d 2c
                DS   $2                  ; 162e 32        ;decrement R2 and loop back while greater than zero
                BF   $4,A1629            ; 162f 94 f9
                PK                       ; 1631 0c        ;return

;subroutine acts on R0 and memory areas at $0db6 / $0d5e (object table)
;R0 is probably the object number, this routine puts the data of the object into R1, R5, R7 and R6
;and data from the 2nd object number, mixed with data of the first one, in R2 (don't know what this is for yet)
;only gets called once, from 1265
;Pseudocode:
;R1 = ($0db6 + 2*R0) + ($0d5e + 4*R0) = x-cooord. + ?
;R5 = ($0d5f + 4*R0) = object width / 2
;R7 = ($0d60 + 4*R0) = y-coord. (center)
;R6 = ($0d61 + 4*R0) = object height / 2
;R2 = ($0db7 + 2*R0) + ($0d60 + 4*R0) = y-coord. (center) + ?
;trashes: K, DC0, A, R1, R5, R7, R6, R2

A1632:          LR   K,P                 ; 1632 08        ;save return address
                DCI  $0d5e               ; 1633 2a 0d 5e  ;point at $0d5e + (R0 * 4) (object table; R0 then must be object number)
                LR   A,$0                ; 1636 40        
                SL   1                   ; 1637 13
                SL   1                   ; 1638 13
                ADC                      ; 1639 8e
                XDC                      ; 163a 2c        ;swap DC's
                DCI  $0db6               ; 163b 2a 0d b6  ;point to $0db6 + (R0 * 2) (2nd object table)
                SR   1                   ; 163e 12
                ADC                      ; 163f 8e
                LM                       ; 1640 16        ;load from $0db6 + (R0 * 2) (2nd object table)
                XDC                      ; 1641 2c
                AM                       ; 1642 88        ;add $0d5e + (R0 * 4) (object table + object number) (X-coord.)
                LR   $1,A                ; 1643 51        ;store in R1
                LM                       ; 1644 16        ;store ($0d5f + (R0 * 4)) in R5
                LR   $5,A                ; 1645 55
                LM                       ; 1646 16        ;store ($0d60 + (R0 * 4)) in R7
                LR   $7,A                ; 1647 57
                LM                       ; 1648 16        ;store ($0d61 + (R0 * 4)) in R6
                LR   $6,A                ; 1649 56
                XDC                      ; 164a 2c        ;dc0 now points to $0db7 + (R0 * 2)
                LR   A,$7                ; 164b 47
                AM                       ; 164c 88        ;a = R7 + ($0db7 + (R0 * 2))
                LR   $2,A                ; 164d 52        ;store ($0db7 + (R0 * 2) + R7 in R2
                PK                       ; 164e 0c        ;return
                
;Initialization routine for Present Gladiator

A164f:          DCI  $0d38               ; 164f 2a 0d 38  ;point to $0d38 (destination in RAM)
                XDC                      ; 1652 2c
                DCI  $1e09               ; 1653 2a 1e 09  ;point to $1e09 (source in cartridge)
                LISU 2                   ; 1656 62        ;point to R16
                LISL 0                   ; 1657 68
                LIS  $0                  ; 1658 70
                LR   (IS)+,A             ; 1659 5d        ;clear R16 and R17
                LR   (IS)+,A             ; 165a 5d
                LI   $26                 ; 165b 20 26     ;store $26 in R18
                LR   (IS),A              ; 165d 5c
                PI   $4686               ; 165e 28 46 86  ;Weird Memcopy
                DCI  $0ce8               ; 1661 2a 0c e8  ;point to $0ce8 (destination in RAM)
                XDC                      ; 1664 2c
                DCI  A1e2f               ; 1665 2a 1e 2f  ;point to $1e2f (source in cartridge)
                LI   $50                 ; 1668 20 50     ;store $50 in R18
                LR   (IS),A              ; 166a 5c
                PI   $4686               ; 166b 28 46 86  ;weird memcopy
                DCI  $0c98               ; 166e 2a 0c 98  ;point to $0c98 (destination in RAM)
                XDC                      ; 1671 2c
                DCI  A1e2f               ; 1672 2a 1e 2f  ;point to $1e2f (source in cartridge)
                LI   $50                 ; 1675 20 50     ;store $50 in R7
                LR   $7,A                ; 1677 57
                PI   A11a5               ; 1678 28 11 a5  ;copy $50 bytes from $1e2f to $0c98
                DCI  $0e72               ; 167b 2a 0e 72  ;point to $0e72 (destination in RAM)
                XDC                      ; 167e 2c
                DCI  $1e09               ; 167f 2a 1e 09  ;point to $1e09 (source in cartridge)
                LI   $26                 ; 1682 20 26     ;store $26 in R7
                LR   $7,A                ; 1684 57
                PI   A11a5               ; 1685 28 11 a5  ;copy $26 bytes from $1e09 to $0e72
                LI   $10                 ; 1688 20 10     ;store $10 in R7
                LR   $7,A                ; 168a 57
                PI   A11a5               ; 168b 28 11 a5  ;copy $10 more bytes
                LI   $10                 ; 168e 20 10     ;store $10 in R7
                LR   $7,A                ; 1690 57
                DCI  $0fa2               ; 1691 2a 0f a2  ;store $01 in $0fa2
                LIS  $1                  ; 1694 71
                ST                       ; 1695 17
                LI   $12                 ; 1696 20 12     ;store $12 in $08f5 (background color)
                DCI  $08f5               ; 1698 2a 08 f5
                ST                       ; 169b 17
                BF   $0,A16a0            ; 169c 90 03     ;jump to 16a0 (common game initialization routine)

A169e:          LIS  $d                  ; 169e 7d
                LR   $7,A                ; 169f 57

;common game initialization routine

A16a0:          LISU 3                   ; 16a0 63        ;point to R28 (main game variation)
                LISL 4                   ; 16a1 6c
                LIS  $1                  ; 16a2 71
                XS   (IS)                ; 16a3 ec        ;A = R28 EOR $01
                DCI  A1c7c               ; 16a4 2a 1c 7c  ;point to 1c7c to read initial object properties from (for past Gladiator)
                BF   $4,A16ac            ; 16a7 94 04     ;branch if not zero (R28 is not 1) to 16ac
                DCI  A1e8a               ; 16a9 2a 1e 8a  ;point to 1e8a instead (for present Gladiator)
A16ac:          LIS  $2                  ; 16ac 72        ;check for main game variation 2 (Future Gladiator)
                XS   (IS)                ; 16ad ec
                BF   $4,A16b3            ; 16ae 94 04     ;if main game variation is not 2, on with 16b3
                DCI  A1f8d               ; 16b0 2a 1f 8d  ;point to 1f8d instead (for future Gladiator)
A16b3:          LIS  $0                  ; 16b3 70        ;start with object R0
                LR   $0,A                ; 16b4 50
A16b5:          PI   A174b               ; 16b5 28 17 4b  ;store object properties of object no. R0 (out of 5 bytes of table)
                LR   A,$0                ; 16b8 40        ;increment pointer to object
                INC                      ; 16b9 1f
                LR   $0,A                ; 16ba 50
                DS   $7                  ; 16bb 37        ;decrement R7
                BF   $4,A16b5            ; 16bc 94 f8     ;if not zero, store properties of next object read from DC0
                DCI  $0d9e               ; 16be 2a 0d 9e  ;point to $0d9e (source)
                XDC                      ; 16c1 2c
                DCI  $1c64               ; 16c2 2a 1c 64  ;point to $1c64 (destination)
                LI   $18                 ; 16c5 20 18     ;$18 bytes to copy
                LR   $7,A                ; 16c7 57
                PI   A11a5               ; 16c8 28 11 a5  ;memcopy $18 bytes from $1c64 to $09de
                LIS  $1                  ; 16cb 71        ;check R28 for main game variation 1 (present Gladiator)
                XS   (IS)                ; 16cc ec
                BF   $4,A171a            ; 16cd 94 4c     ;if other game variation, branch to 171a
                DCI  $0fa2               ; 16cf 2a 0f a2  ;EOR $0fa2 with $01
                LM                       ; 16d2 16
                XI   $01                 ; 16d3 23 01
                DCI  $0fa2               ; 16d5 2a 0f a2
                ST                       ; 16d8 17
                LIS  $1                  ; 16d9 71        ;store $01 in R1, R3 and R4
                LR   $4,A                ; 16da 54
                LR   $1,A                ; 16db 51
                LR   $3,A                ; 16dc 53
                LI   $c1                 ; 16dd 20 c1     ;store $c1 in R2
                LR   $2,A                ; 16df 52
                LIS  $0                  ; 16e0 70        ;clear R5
                LR   $5,A                ; 16e1 55
                BT   4,A16f7             ; 16e2 84 14     ;branch if $0fa2 now is $00 to $16f7
                DCI  $1eea               ; 16e4 2a 1e ea  ;point at 1eea storing new object data for lion
                LIS  $2                  ; 16e7 72        ;set R0 to 2 (object no. of lion)
                LR   $0,A                ; 16e8 50
                PI   A174b               ; 16e9 28 17 4b  ;store object properties of object 2 (lion / ?)
                LI   $ff                 ; 16ec 20 ff     ;store $ff in R1 and R5
                LR   $5,A                ; 16ee 55
                LR   $1,A                ; 16ef 51
                LI   $c1                 ; 16f0 20 c1     ;store $c1 in R3 and $01 in R2
                LR   $3,A                ; 16f2 53
                LIS  $1                  ; 16f3 71
                LR   $2,A                ; 16f4 52
                LIS  $0                  ; 16f5 70        ;clear R4
                LR   $4,A                ; 16f6 54
A16f7:          DCI  $0f9f               ; 16f7 2a 0f 9f  ;point to $0f9f and clear it (A is 0 in both cases)
                ST                       ; 16fa 17
                LR   A,$4                ; 16fb 44        ;store R4 in $0fa0
                ST                       ; 16fc 17
                LR   A,$5                ; 16fd 45        ;store R5 in $0fa1
                ST                       ; 16fe 17        
                DCI  $082b               ; 16ff 2a 08 2b  ;point to $082b (segment width, intensity and xcopy for object 11 - number of spears display)
                LR   A,$2                ; 1702 42        ;store R2 there
                ST                       ; 1703 17
                LR   A,$3                ; 1704 43        ;store R3 in segment width, intensity and xcopy for object 12
                ST                       ; 1705 17
                LI   $40                 ; 1706 20 40     ;load $40
                LISL 5                   ; 1708 6d        ;point to R29
                NS   (IS)-               ; 1709 fe        ;A = R29 and $40
                LR   A,$1                ; 170a 41        ;load A from R1
                BT   4,A1714             ; 170b 84 08     ;if R29 and $40 = zero, branch to 1714
                DCI  $0d66               ; 170d 2a 0d 66  ;else point to $0d66 and store $d8 into that cell, then clear A
                LI   $d8                 ; 1710 20 d8
                ST                       ; 1712 17
                LIS  $0                  ; 1713 70
A1714:          DCI  $0dba               ; 1714 2a 0d ba  ;store A in $0dba
                ST                       ; 1717 17
                LIS  $0                  ; 1718 70        ;clear $0dbb
                ST                       ; 1719 17
A171a:          LIS  $0                  ; 171a 70        ;clear $0c65 and $0c66 (this is done for all game variations)
                DCI  $0c65               ; 171b 2a 0c 65
                ST                       ; 171e 17
                ST                       ; 171f 17
                LIS  $5                  ; 1720 75        ;store $05 in $0c67 and $0c68
                ST                       ; 1721 17
                ST                       ; 1722 17
                PI   $40d0               ; 1723 28 40 d0  ;setup stack
                DCI  $0dda               ; 1726 2a 0d da  ;point to $0dda (destination)
                XDC                      ; 1729 2c
                DCI  $0e72               ; 172a 2a 0e 72  ;point to $0e72 (source)
                LI   $26                 ; 172d 20 26     ;$26 bytes to copy
                LR   $2,A                ; 172f 52
                PI   A1628               ; 1730 28 16 28  ;memcopy with interleave 2
                DCI  $0e27               ; 1733 2a 0e 27  ;point to $0e27 (destination)
                XDC                      ; 1736 2c
                DCI  $0d38               ; 1737 2a 0d 38  ;point to $0d38 (source)
                LI   $26                 ; 173a 20 26     ;$26 bytes to copy
                LR   $2,A                ; 173c 52
                PI   A1628               ; 173d 28 16 28  ;memcopy with interleave 2
                DCI  $0c69               ; 1740 2a 0c 69
                LIS  $0                  ; 1743 70        ;clear $0c69 and $0c70
                ST                       ; 1744 17
                ST                       ; 1745 17
                INC                      ; 1746 1f
                ST                       ; 1747 17        ;set $0c71 to $01
                JMP  A18e7               ; 1748 29 18 e7  ;continue at 18e7 (start of game loop?)

;subroutine to store some object properties
;R0 = object number
;DC0 = pointer to internal object list
;from memory at DC0, 5 bytes get read and copied. These are:
;1. height of object
;2. segment width, intensity and XCOPY
;3. 1st byte of object table = XCoord.1 (2nd bytes get set to segment width * 4)
;4. graphics data pointer LSB for list A
;5. graphics data pointer MSB and color for list A (?)

;works roughly as follows:
;

A174b:          LR   K,P                 ; 174b 08        ;save return address
                XDC                      ; 174c 2c
                DCI  $0c40               ; 174d 2a 0c 40  ;point to (list of object heights + R0)
                LR   A,$0                ; 1750 40        
                ADC                      ; 1751 8e
                XDC                      ; 1752 2c        ;DC0 is now DC0 from call
                LM                       ; 1753 16        ;load memory from there
                XDC                      ; 1754 2c        ;DC0 = $0c4x, DC1 = DC0 from call + 1
                ST                       ; 1755 17        ;store in object height
                SR   1                   ; 1756 12        ;divide by 2 and store in R1
                LR   $1,A                ; 1757 51
                DCI  $0820               ; 1758 2a 08 20  ;point to (list of segment widths, intensities and Xcopy + R0) in VLSI
                LR   A,$0                ; 175b 40
                ADC                      ; 175c 8e
                XDC                      ; 175d 2c        ;DC0 is now DC0 from call + 1, DC1 = $082x
                LM                       ; 175e 16        ;fetch next byte (= segment width, intensity and XCOPY
                XDC                      ; 175f 2c        ;DC0 is now $082x, DC1 is DC0 from call + 2
                ST                       ; 1760 17        ;store in $082x (video register for that)
                SL   1                   ; 1761 13        ;multiply by 4 and store in R2
                SL   1                   ; 1762 13
                LR   $2,A                ; 1763 52
                DCI  $0d5e               ; 1764 2a 0d 5e  ;point to object table + R0*4 = object R0, x-coord.
                LR   A,$0                ; 1767 40
                SL   1                   ; 1768 13
                SL   1                   ; 1769 13
                ADC                      ; 176a 8e
                LIS  $2                  ; 176b 72        ;store $02 in R4
                LR   $4,A                ; 176c 54
A176d:          XDC                      ; 176d 2c        ;DC0 now contains DC0 from call + 2, DC0 = pointer to object table
                LM                       ; 176e 16        ;load byte from parameter area
                XDC                      ; 176f 2c        ;swap again, DC1 = now DC0 from call + 3
                ST                       ; 1770 17        ;store byte in object table
                LR   A,$2                ; 1771 42        ;store R2 in 2nd byte of object table
                ST                       ; 1772 17
                LR   A,$1                ; 1773 41        ;transfer R1 to R2
                LR   $2,A                ; 1774 52
                DS   $4                  ; 1775 34        ;decrement R4 and loop back to 176d as long as not zero
                BF   $4,A176d            ; 1776 94 f6
                XDC                      ; 1778 2c        ;dc0 now contains DC1 from call + 3, DC1 = object table pointer
                LM                       ; 1779 16        ;load next two bytes from call parameter area and store in QU and QL
                LR   QU,A                ; 177a 06
                LM                       ; 177b 16
                LR   QL,A                ; 177c 07
                XDC                      ; 177d 2c        ;DC1 = now parameter area, DC0 = object table pointer 
                BF   $0,A1782            ; 177e 90 03     ;jump to 1782

;Entering at the following entry point stores RAM address given in DC0 as RAM pointer to object number R0 in the list at $0c20 / $0c30

A1780:          LR   K,P                 ; 1780 08        ;another entry point - save return address
                LR   Q,DC                ; 1781 0e        ;copy DC to Q
A1782:          DCI  $0c20               ; 1782 2a 0c 20  ;set DC to list of RAM pointers (followed by object heights) + R0
                LR   A,$0                ; 1785 40
                ADC                      ; 1786 8e
                LR   A,QL                ; 1787 03        ;load A from QL and store in list of RAM pointers
                ST                       ; 1788 17
                LIS  $f                  ; 1789 7f        ;add 15 to DC0 (point to list of RAM pointers MSB's)
                ADC                      ; 178a 8e
                LR   A,QU                ; 178b 02        ;load A from QL and store in list of RAM Pointer MSB's
                ST                       ; 178c 17
                XDC                      ; 178d 2c        ;swap data pointers again
                PK                       ; 178e 0c        ;return
                
                DCI  $0d5e               ; 178f 2a 0d 5e  ;last entry to jump table; point to object table, load from there and compare to $e8
                LM                       ; 1792 16        ;get X-position of object 0 (?!)
                CI   $e8                 ; 1793 25 e8
                BT   4,A179a             ; 1795 84 04     ;if address $0d5e = $e8, jump to 1256 (unneccesarily complicated)
                JMP  A179d               ; 1797 29 17 9d
A179a:          JMP  A1256               ; 179a 29 12 56

A179d:          LISL 5                   ; 179d 6d        ;entry point from jump table; point to R29 (game subvariation)
                LIS  $1                  ; 179e 71        ;A = R29 AND $01 (subvariation bouncing shots)
                NS   (IS)-               ; 179f fe
                BF   $4,A17ac            ; 17a0 94 0b     ;if not zero (subvariation is set), branch to 17ac
A17a2:          LIS  $1                  ; 17a2 71        ;else A = R28 (main variation) EOR $01
                XS   (IS)                ; 17a3 ec
                BF   $4,A17a9            ; 17a4 94 04     ;if zero (main variation = Scrimmage), jump to 13ef, else to 1328
                JMP  A1328               ; 17a6 29 13 28
A17a9:          JMP  A13ef               ; 17a9 29 13 ef

A17ac:          LISU 3                   ; 17ac 63        ;point to R24, dcrement R24 and point to R28
                LISL 0                   ; 17ad 68
                DS   (IS)                ; 17ae 3c
                LISU 3                   ; 17af 63
                LISL 4                   ; 17b0 6c
                BT   4,A17a2             ; 17b1 84 f0     ;if R24 = zero, branch back to 17a2
                DCI  $0d5e               ; 17b3 2a 0d 5e  ;point to object table, store x-coord. from there in R1
                LM                       ; 17b6 16
                LR   $1,A                ; 17b7 51
                PI   A145b               ; 17b8 28 14 5b  ;Check for collision
                XS   $4                  ; 17bb e4        ;A = A EOR R4
                DCI  $0db6               ; 17bc 2a 0d b6  ;point to 2nd object table
                BT   1,A17c2             ; 17bf 81 02     ;branch to 17c2 if positive (A EOR R4 = $00 through $7F)
                CM                       ; 17c1 8d        ;else compare (A EOR R4) to value at $0db6
A17c2:          LR   Q,DC                ; 17c2 0e        :store DC0 in Q
                LM                       ; 17c3 16        ;load next byte from memory
                COM                      ; 17c4 18        ;complement and increase by 1 (-> A = 
                INC                      ; 17c5 1f        ;bring back previous DC0
                LR   DC,Q                ; 17c6 0f
                ST                       ; 17c7 17        ;store back complemented and increased value (DC0 = (256- DC0))
                JMP  A1256               ; 17c8 29 12 56  ;jump to A1256

;another short subroutine, prepares the graphics data (cartridge) pointer MSB.
;Before calling this subroutine, only bits 4 through 0 contain the upper 5 bits of the address of the graphics data.
;This subroutine makes sure bits 5 through 7 are clear and then sets bit 7, effectively setting the object color to red.

A17cb:          LR   K,P                 ; 17cb 08        ;save return address
                DCI  $0c30               ; 17cc 2a 0c 30  ;point to $0c30 + R0 (R0 = probably object number)
                LR   A,$0                ; 17cf 40
                ADC                      ; 17d0 8e
                LR   Q,DC                ; 17d1 0e        ;save DC in Q
                LM                       ; 17d2 16        ;load byte from DC
                NI   $1f                 ; 17d3 21 1f     ;and with $1F and EOR with $80
                XI   $80                 ; 17d5 23 80
                LR   DC,Q                ; 17d7 0f        ;restore DC
                ST                       ; 17d8 17        ;and store back -> byte = byte AND $1F EOR $80
                PK                       ; 17d9 0c        ;return

;The following routine is jumped to after handling the lion or similar object 
;This routine polls the joystick fire buttons and fires if applicable.
          
A17da:          DCI  $0d5e               ; 17da 2a 0d 5e  ;point to object table
                LM                       ; 17dd 16        ;load x-coord. from there and compare to $e8
                CI   $e8                 ; 17de 25 e8
                BF   $4,A1817            ; 17e0 94 36     ;if not zero (if it's not equal to $e8), branch to 18e7
                DCI  $0e9a               ; 17e2 2a 0e 9a  ;else $0e9a = $0e9a EOR $80
                LM                       ; 17e5 16
                XI   $80                 ; 17e6 23 80
                DCI  $0e9a               ; 17e8 2a 0e 9a
                ST                       ; 17eb 17
                BT   1,A17fa             ; 17ec 81 0d     ;branch if new value at $0e9a is positive ($00 through $7f) to 17fa
                LIS  $0                  ; 17ee 70        ;else clear output port 1 and poll input port 1 (Probably for player 1)
                OUTS 1                   ; 17ef b1
                INS  1                   ; 17f0 a1
                NI   $01                 ; 17f1 21 01     ;if port 1 AND $01 is zero (fire button of player 1 not pressed), branch to 17fa
                BT   4,A17fa             ; 17f3 84 06
                PI   A19c0               ; 17f5 28 19 c0  ;else call 19c0 and jump forward to 1817
                BF   $0,A1817            ; 17f8 90 1e
A17fa:          LISL 5                   ; 17fa 6d        ;point to $29 (probably), A = R29 AND $08 (game variation "Computer plays Player 2")
                LIS  $8                  ; 17fb 78
                NS   (IS)-               ; 17fc fe
                BT   4,A180d             ; 17fd 84 0f     ;if this variation is not set, branch to 180d, else play player 2 as follows:
                PI   $4795               ; 17ff 28 47 95  ;shift 16-bit number 4 places to the left
                CI   $10                 ; 1802 25 10     ;compare to $10 and branch if no carry (A <= $10) to 1817
                BF   $2,A1817            ; 1804 92 12
                DCI  $0c68               ; 1806 2a 0c 68  ;else store $07 at $0c68 and jump to $1814
                LIS  $7                  ; 1809 77
                ST                       ; 180a 17
                BF   $0,A1814            ; 180b 90 08
A180d:          LIS  $0                  ; 180d 70        ;clear output port 1 and poll input port 1 (probably for player 2)
                OUTS 1                   ; 180e b1
                INS  1                   ; 180f a1
                NI   $02                 ; 1810 21 02     ;and with $02 (fire button for player 2?)
                BT   4,A1817             ; 1812 84 04     ;if zero (button not pressed?), skip next call
A1814:          PI   A1a7d               ; 1814 28 1a 7d  ;on button pressed, call 1a7d
A1817:          JMP  A1481               ; 1817 29 14 81  ;back to 1481 (where joystick pots get read)

;Next are some jump table targets. All of them end in a player turning red and the other player getting a point
;if 9 points are reached, the results screen gets displayed, otherwise the game gets restarted

                PI   A143a               ; 181a 28 14 3a  ;18th entry in jump table - call 143a (does something with objects)
                BF   $0,A1823            ; 181d 90 05     ;jump to 1823 where 0 gets loaded in A

                LI   $ff                 ; 181f 20 ff     ;10th entry in jump table; gets jumped to if object 0 (shot?) hits palisades
                BF   $0,A1824            ; 1821 90 02     ;load $ff in A and jump to 1824

A1823:          LIS  $0                  ; 1823 70        ;2nd target of jump table
A1824:          DCI  $0e9b               ; 1824 2a 0e 9b  ;store value of A (either $00 or $FF) in $0e9b
                ST                       ; 1827 17
                LIS  $4                  ; 1828 74        ;store $04 in R1 (player 2)
                LR   $1,A                ; 1829 51
                DCI  $0f96               ; 182a 2a 0f 96  ;score of player 1
                LR   H,DC                ; 182d 11        ;backup DC0 in H
                LIS  $d                  ; 182e 7d        ;store $0d in R8 (score of player 1) and jump to 184a
                LR   $8,A                ; 182f 58
                BF   $0,A184a            ; 1830 90 19

                PI   A143a               ; 1832 28 14 3a  ;Entry 13 in jump table; call 143a (does something with objects)
                BF   $0,A183b            ; 1835 90 05     ;and jump to 183b where A gets cleared

                LI   $ff                 ; 1837 20 ff     ;Entry 9 in jump table; load $FF in A and skip next load 
                BF   $0,A183c            ; 1839 90 02
A183b:          LIS  $0                  ; 183b 70        ;1st target of jump table; clear A
A183c:          DCI  $0e9b               ; 183c 2a 0e 9b  ;store A (either $00 or $FF) in $0e9b
                ST                       ; 183f 17
                LIS  $3                  ; 1840 73        ;store $03 in R1 (player 1)
                LR   $1,A                ; 1841 51
                DCI  $0f97               ; 1842 2a 0f 97  ;score of player 2
                LR   H,DC                ; 1845 11        ;backup DC0 in H
                LIS  $e                  ; 1846 7e        ;store $0e in R8 (score of player 2) and jump to 184a
                LR   $8,A                ; 1847 58
                BF   $0,A184a            ; 1848 90 01

A184a:          DCI  $0c30               ; 184a 2a 0c 30  ;here R8 is $0d or $0e and R1 is $04 or $03; ($0c30) = ($0c30) AND $1f
                LM                       ; 184d 16
                NI   $1f                 ; 184e 21 1f
                DCI  $0c30               ; 1850 2a 0c 30
                ST                       ; 1853 17
                LR   A,$1                ; 1854 41        ;copy R1 (player object no.) into R0 and call 17cb (set object, in this case, player 1 or 2, red)
                LR   $0,A                ; 1855 50
                PI   A17cb               ; 1856 28 17 cb
                LR   DC,H                ; 1859 10        ;bring back DC0 (pointer to score of winning player)
                LM                       ; 185a 16        ;load value from there and add $07, then store in R6
                AI   $07                 ; 185b 24 07
                LR   $6,A                ; 185d 56
                LR   DC,H                ; 185e 10        ;and in score byte
                ST                       ; 185f 17
                DCI  $ef3f               ; 1860 2a ef 3f  ;point to $ef3f + score (can't be to memory because it's way off)
                ADC                      ; 1863 8e
                LR   A,$8                ; 1864 48        ;copy R8 to R0 and call 1780
                LR   $0,A                ; 1865 50        ; (stores $ef3f + score as RAM pointer to object number R0 in the list at $0c20 / $0c30)
                PI   A1780               ; 1866 28 17 80  ;-> essentially display score from $0f3f + score in object $d or $e, which is player 1/2's score
                PI   A1abf               ; 1869 28 1a bf  ;commented subroutine with unknown purpose
                LR   A,$6                ; 186c 46        ;load R6 and compare with $3f (= decimal 9 * 7 -> 9 points of score reached)
                CI   $3f                 ; 186d 25 3f
                BT   4,A1874             ; 186f 84 04     ;branch if R6 = $3f to results screen
                JMP  A169e               ; 1871 29 16 9e  ;restart game

A1874:          JMP  A1333               ; 1874 29 13 33  ;show results screen

;The following is a routine for emitting sound effects which, as it seems, is able to do different effects,
;depending on which entry point gets used.
;This probably is for in-game effects and, in contrast to the title music, doesn't use the interrupt which
;at this point is used for the segment refresh, but holds up the CPU while the sound effect is running.
;But like the music routine, it's still using the scanline number for delay and then banging the port.

A1877:          LR   K,P                 ; 1877 08        ;start of subroutine - save return address
                LI   $f7                 ; 1878 20 f7     ;store $f7 in R7
                LR   $7,A                ; 187a 57
                LI   $30                 ; 187b 20 30     ;store $30 in R8
                LR   $8,A                ; 187d 58
                BF   $0,A1888            ; 187e 90 09     ;immediate jump to 1888

A1880:          LR   K,P                 ; 1880 08        ;another entry point - save return address and jump to 1886
                BF   $0,A1886            ; 1881 90 04     ;(where $07 gets put in R7)

A1883:          LR   K,P                 ; 1883 08        ;yet another entry point - save return address
                LIS  $8                  ; 1884 78        ;store $08 in R8 and $07 in R7
                LR   $8,A                ; 1885 58
A1886:          LIS  $7                  ; 1886 77
                LR   $7,A                ; 1887 57
A1888:          LI   $30                 ; 1888 20 30
A188a:          DCI  $08fb               ; 188a 2a 08 fb  ;point to 08fb (Current scanline) -> wait for scanline $30
                CM                       ; 188d 8d        ;compare to $30
                BF   $4,A188a            ; 188e 94 fb     ;branch back if not reached (this where most of the time gets spent)
A1890:          DCI  $08fb               ; 1890 2a 08 fb  ;1892 would be entry of jump table (?)
                LR   H,DC                ; 1893 11
                LM                       ; 1894 16        ;load current scanline
                AS   $8                  ; 1895 c8        ;add R8 to it
                CI   $d0                 ; 1896 25 d0     ;compare to $d0
                BT   2,A189b             ; 1898 82 02     ;branch on carry (if scanline + R8 < $D0)
A189a:          PK                       ; 189a 0c        ;return

;The following loop generates some kind of sound. R8 contains the number of scanlines between each sound period (1 or 0)
;This gets decremented on each iteration, thus the sound gets higher and higher

A189b:          LR   DC,H                ; 189b 10        ;get DC from H
                CM                       ; 189c 8d        ;compare (scanline + R8) with memory location at DC0
                BF   $2,A189b            ; 189d 92 fd     ;loop if no carry (if scanline + R8 >= memory location at DC0)
                LI   $10                 ; 189f 20 10     ;put out $10 at output port 1 - this puts bits 0 and 1 (?) from port 0 to the sound line
                OUTS 1                   ; 18a1 b1
                LR   A,$7                ; 18a2 47        ;R7 = R7 EOR $07 (this holds the value for the port)
                XI   $07                 ; 18a3 23 07     ;affects the status bits for branch below
                LR   $7,A                ; 18a5 57
                OUTS 0                   ; 18a6 b0        ;put out R7 value at port 0
                LIS  $0                  ; 18a7 70
                OUTS 1                   ; 18a8 b1        ;clear port 1
                BT   1,A1890             ; 18a9 81 e6     ;branch if positive back to 1890 (acting on result of R7 EOR $07 from above)

                DS   $8                  ; 18ab 38        ;decrement R8
                BT   4,A189a             ; 18ac 84 ed     ;branch if zero back to 189a (return)
                LR   DC,H                ; 18ae 10        ;get DC from H
                LM                       ; 18af 16        ;calculate (scanline value + R8) as the next scanline to wait for
                AS   $8                  ; 18b0 c8
                BF   $0,A189b            ; 18b1 90 e9     ;unconditional loop back to 189b

;subroutine that gets called near title screen (before game starts) and handles the title music
;This subroutine plays the song until a key gets pressed, then it returns leaving the keycode in R8

A18b3:          LR   K,P                 ; 18b3 08        ;save return address
                PI   $40a9               ; 18b4 28 40 a9  ;call 40a9 (Push return address)
A18b7:          LR   A,$5                ; 18b7 45        ;load R5 into A - this starts a loop which is run once per note
                INC                      ; 18b8 1f        ;add 3 to A (R5 contains offset to start of music)
                INC                      ; 18b9 1f
                INC                      ; 18ba 1f
                LR   $5,A                ; 18bb 55        ;and store increased value again
                DCI  A1dc9               ; 18bc 2a 1d c9  ;point to 1dc9
                ADC                      ; 18bf 8e        ;add increased value (R5 * 3) to DC0; series actually starts at $1dcc
                LIS  $0                  ; 18c0 70        ;clear A
                XM                       ; 18c1 8c        ;XOR A with DC0 value (what's that value?)
                BF   $1,A18e3            ; 18c2 91 20     ;branch on negative (memory location) to 18e3 - end song when FF value comes up
                LISU 4                   ; 18c4 64        ;point to R35
                LISL 3                   ; 18c5 6b
                LR   (IS)+,A             ; 18c6 5d        ;store A in R35 (unknown parameter for music)
                LM                       ; 18c7 16        ;get next memory location (period of that note)
                LR   (IS)+,A             ; 18c8 5d        ;store in R36
                LM                       ; 18c9 16        ;get next memory location
                LISU 2                   ; 18ca 62        ;point to R20
                LISL 4                   ; 18cb 6c
                LR   (IS),A              ; 18cc 5c        ;store A in R20 (number of frames for that note)
                LIS  $0                  ; 18cd 70        ;clear A and write out 0 to ports 0 and 1
                OUTS 0                   ; 18ce b0
                OUTS 1                   ; 18cf b1
                DCI  $0fdd               ; 18d0 2a 0f dd  ;clear $0fdd and $0fde
                ST                       ; 18d3 17
                ST                       ; 18d4 17
                PI   $46d6               ; 18d5 28 46 d6  ;call 46d6 (setup sound interrupt to $46f7)
                PI   $43d6               ; 18d8 28 43 d6  ;call GETKEY (get a keypress or time out - Timeout when note should end)
                BF   $1,A18b7            ; 18db 91 db     ;if returning negative, back to 18b7
                BT   4,A18b7             ; 18dd 84 d9     ;if zero, back to 18b7 as well
                PI   $40bc               ; 18df 28 40 bc  ;call 40bc in RES1 (POP return address)
                PK                       ; 18e2 0c        ;return with keycode
                
A18e3:          LR   A,$6                ; 18e3 46        ;end of song reached - copy R6 into R5 and jump back to start of song
                LR   $5,A                ; 18e4 55
                BF   $0,A18b7            ; 18e5 90 d1

;is this the start of the game loop?

A18e7:          PI   A13f5               ; 18e7 28 13 f5  ;call subroutine for generating X-coordinate list in R40-R55
                LI   $10                 ; 18ea 20 10     ;load $10 into R5 (counter for loop iterations)
                LR   $5,A                ; 18ec 55
                DCI  $0880               ; 18ed 2a 08 80  ;point to $0880 (segment starting row MSB and X order for list B)
A18f0:          LISU 5                   ; 18f0 65        ;point to R47
                LISL 7                   ; 18f1 6f
                LIS  $2                  ; 18f2 72        ;store $02 in R2 and $ff in R7
                LR   $2,A                ; 18f3 52
                LI   $ff                 ; 18f4 20 ff
                LR   $7,A                ; 18f6 57
A18f7:          LR   A,$7                ; 18f7 47        ;A = R7 + (IS)
                AS   (IS)+               ; 18f8 cd        
                BT   2,A1918             ; 18f9 82 1e     ;Branch on carry (from addition R7 + (IS)) to A1918
A18fb:          BR7  A18f7               ; 18fb 8f fb     ;Branch if lower ISAR is not 7 back to 18f7
                LISU 6                   ; 18fd 66        ;point to R55 (was R47)
                DS   $2                  ; 18fe 32        ;decrement R2 and loop back if not zero to $18f7
                BF   $4,A18f7            ; 18ff 94 f7
                LR   A,$4                ; 1901 44        ;load ISAR from R4 and store 0 in (IS)
                LR   IS,A                ; 1902 0b
                LIS  $0                  ; 1903 70        
                LR   (IS),A              ; 1904 5c
                LR   A,IS                ; 1905 0a        ;load ISAR value and 
                BR7  A190c               ; 1906 8f 05     ;if lower ISAR is not 7 store IS+$d9 at memory location, else store IS+$d1 there
                AI   $d1                 ; 1908 24 d1     ;else add $d1 (dec. 209) and on at 190e
                BF   $0,A190e            ; 190a 90 03
A190c:          AI   $d9                 ; 190c 24 d9
A190e:          ST                       ; 190e 17
                DS   $5                  ; 190f 35        ;decrement R5 and loop back to 18f0 if not 0 yet (another loop iteration)
                BF   $4,A18f0            ; 1910 94 df
                PI   A13f5               ; 1912 28 13 f5  ;call subroutine for generating X-coordinate list in R40-R55 again
                JMP  A1afd               ; 1915 29 1a fd  ;and on at 1afd

A1918:          LR   A,(IS)-             ; 1918 4e        ;decrement ISAR and store ISAR value into R4
                LR   A,IS                ; 1919 0a
                LR   $4,A                ; 191a 54
                LR   A,(IS)+             ; 191b 4d        ;load A from specified register, complement and store in R7
                COM                      ; 191c 18
                LR   $7,A                ; 191d 57
                BF   $0,A18fb            ; 191e 90 dc     ;jump back to 18db

                LIS  $2                  ; 1920 72        ;19th target of jump table
                BF   $0,A1927            ; 1921 90 05     
                LIS  $3                  ; 1923 73        ;20th target of jump table
                BF   $0,A1927            ; 1924 90 02    
                LIS  $4                  ; 1926 74        ;21st target of jump table
A1927:          LR   $1,A                ; 1927 51        ;store into R1
                LIS  $2                  ; 1928 72        ;store $02 in R2
                LR   $2,A                ; 1929 52
                LR   A,$1                ; 192a 41        ;point to ($0f9d + R1)
A192b:          DCI  $0f9d               ; 192b 2a 0f 9d
                ADC                      ; 192e 8e
                LIS  $0                  ; 192f 70        ;check memory at this location
                XM                       ; 1930 8c
                BF   $4,A1939            ; 1931 94 07     ;branch forward to 1939 if not equal (0)
                LR   A,$0                ; 1933 40        ;load R0 into A
                DS   $2                  ; 1934 32        ;decrement R2 and loop back to 192b if not zero yet
                BF   $4,A192b            ; 1935 94 f5
                BF   $0,A194b            ; 1937 90 13     ;else jump forward to 194b -> 1256
A1939:          LR   A,$0                ; 1939 40        ;R1 = R1 EOR R0
                XS   $1                  ; 193a e1
                LR   $1,A                ; 193b 51
                DCI  $0dba               ; 193c 2a 0d ba  ;point to $0dba
                LIS  $0                  ; 193f 70        ;if value at $0dba is positive ($00-$7F), load $01 EOR R1, else load $06 EOR R1
                XM                       ; 1940 8c
                LIS  $1                  ; 1941 71
                BT   1,A1945             ; 1942 81 02
                LIS  $6                  ; 1944 76
A1945:          XS   $1                  ; 1945 e1
                BT   4,A194b             ; 1946 84 04     ;if R1 EOR $01 / $06 is zero, jump to 1256, else jump to 1328
                JMP  A1328               ; 1948 29 13 28
A194b:          JMP  A1256               ; 194b 29 12 56

;The following routine handles input of the message to appear at the result screen

A194e:          PI   $41d5               ; 194e 28 41 d5  ;clear screen
                PI   $41c8               ; 1951 28 41 c8  ;wait for scanline and do clock
                DCI  $1dac               ; 1954 2a 1d ac  ;prepare string writing
                LISU 2                   ; 1957 62        ;point to R20
                LISL 4                   ; 1958 6c
                LI   $20                 ; 1959 20 20     ;2 lines to write from $1dac
                LR   (IS),A              ; 195b 5c
                PI   $4205               ; 195c 28 42 05  ;print string
                DCI  A1da0               ; 195f 2a 1d a0  ;another string to write
                LIS  $c                  ; 1962 7c        ;12 characters to write from $1da0
                LR   (IS),A              ; 1963 5c
                PI   $4205               ; 1964 28 42 05  ;print string
                LI   $10                 ; 1967 20 10
                DCI  $0fdf               ; 1969 2a 0f df  ;set cursor position to start of 2nd line
                ST                       ; 196c 17
                LIS  $0                  ; 196d 70        ;reset R1, $0fe2, R5 and R6 to 0
                LR   $1,A                ; 196e 51
                LIS  $0                  ; 196f 70      
                DCI  $0fe2               ; 1970 2a 0f e2
                ST                       ; 1973 17
                LR   $5,A                ; 1974 55
                LR   $6,A                ; 1975 56
A1976:          PI   A18b3               ; 1976 28 18 b3  ;play music and wait for keypress
                DCI  $0f85               ; 1979 2a 0f 85  ;point to ($0f85 + R1)
                LR   A,$1                ; 197c 41
                ADC                      ; 197d 8e
                INC                      ; 197e 1f        ;increment R1 and compare to $11
                LR   $1,A                ; 197f 51
                CI   $11                 ; 1980 25 11
                BF   $4,A198e            ; 1982 94 0b     ;if R1 is not $11, process next letter from input (?)
A1984:          LIS  $f                  ; 1984 7f        ;if R1 is $11, store $0f in R1 and store $00 in ($0f85 + R1)
                LR   $1,A                ; 1985 51
                LIS  $0                  ; 1986 70
A1987:          ST                       ; 1987 17
                DS   $1                  ; 1988 31        ;decrement R1 (number of remaining letters?) and loop back in 1987 if more letters to be done
                BF   $4,A1987            ; 1989 94 fd
                JMP  A101f               ; 198b 29 10 1f  ;then jump to 101f (start of program)

A198e:          LR   A,$8                ; 198e 48        ;load R8 (keycode) and compare to $40
                CI   $40                 ; 198f 25 40
                BT   4,A1984             ; 1991 84 f2     ;if keycode $40, branch back to 1984
                CI   $3f                 ; 1993 25 3f     ;if keycode not $3f, skip following sequence
                BF   $4,A199b            ; 1995 94 05
                LIS  $0                  ; 1997 70        ;for keycode $3f, clear R8 and on at 19ae
                LR   $8,A                ; 1998 58
                BF   $0,A19ae            ; 1999 90 14
A199b:          CI   $47                 ; 199b 25 47     ;if keycode not $47, skip following sequence
                BF   $4,A19ae            ; 199d 94 10     ;for keycode $47, store $12 in R8, decrement R1 and back to loop if zero
                LI   $12                 ; 199f 20 12
                LR   $8,A                ; 19a1 58
                DS   $1                  ; 19a2 31
                BT   4,A1976             ; 19a3 84 d2
                PI   $4122               ; 19a5 28 41 22  ;backspace
                DS   $1                  ; 19a8 31        ;decrement R1
                PI   $40d9               ; 19a9 28 40 d9  ;draw character
                BF   $0,A1976            ; 19ac 90 c9     ;and back to loop

A19ae:          LIS  $0                  ; 19ae 70        ;compare R8 to $3a
                XS   $8                  ; 19af e8
                CI   $3a                 ; 19b0 25 3a
                BT   6,A19b7             ; 19b2 86 04     ;branch if zero or carry (R8 <= $3a)
                DS   $1                  ; 19b4 31        ;else decrement R1 and jump back to loop
                BF   $0,A1976            ; 19b5 90 c0

A19b7:          ST                       ; 19b7 17        ;store entered character
                PI   $40d9               ; 19b8 28 40 d9  ;draw character
                PI   $412d               ; 19bb 28 41 2d  ;increment cursor
                BF   $0,A1976            ; 19be 90 b7     ;and back to loop

;subroutine with yet unknown purpose (still uncommented) - maybe handles fire button press for player 1?

A19c0:          LR   K,P                 ; 19c0 08        ;save return address
                PI   $40a9               ; 19c1 28 40 a9  ;push return address
                DCI  $0d6a               ; 19c4 2a 0d 6a  ;point to $0d6a (byte in object list)
                LR   H,DC                ; 19c7 11        ;and save $0d6a in H
                DCI  $0c66               ; 19c8 2a 0c 66  ;now load value from $0c66 and store in R2
                LM                       ; 19cb 16
                LR   $2,A                ; 19cc 52
                LIS  $b                  ; 19cd 7b        ;store $0b in R4 and clear R7
                LR   $4,A                ; 19ce 54
                LIS  $0                  ; 19cf 70
                LR   $7,A                ; 19d0 57
                DCI  $082b               ; 19d1 2a 08 2b  ;point to $082b (segment width, intensity and Xcopy of object 11 - number of spears display) 
                LR   Q,DC                ; 19d4 0e        ;load DC from Q
                LIS  $0                  ; 19d5 70        ;clear R6
                LR   $6,A                ; 19d6 56
A19d7:          LISU 3                   ; 19d7 63        ;store $03 in R24
                LISL 0                   ; 19d8 68
                LIS  $3                  ; 19d9 73
                LR   (IS),A              ; 19da 5c
                LISU 3                   ; 19db 63        ;point at main game variation
                LISL 4                   ; 19dc 6c
                LIS  $2                  ; 19dd 72
                XS   (IS)                ; 19de ec        ;compare it with $02 and branch forward to 1a16
                BT   4,A1a16             ; 19df 84 36     ;branch if zero (game variation = Future) to 1a16
                LR   DC,Q                ; 19e1 0f        ;else bring back DC from Q ($082b) and check on 0
                LIS  $0                  ; 19e2 70
                XM                       ; 19e3 8c
                BF   $1,A19f9            ; 19e4 91 14     ;if negative (bit 7 of $082b is set -> XCOPY), on with 19ef
                LR   A,$7                ; 19e6 47        ;add R7 to DC0 -> now points to $082b + R7
                ADC                      ; 19e7 8e
                LIS  $0                  ; 19e8 70        ;check ($082b + R7) if bit 7 (XCOPY) is set there
                XM                       ; 19e9 8c
                BT   1,A19ef             ; 19ea 81 04     ;if positive (bit 7 is set -> XCOPY), on with 19ef
                JMP  A1a77               ; 19ec 29 1a 77  ;else jump to 1a77
A19ef:          LIS  $1                  ; 19ef 71        ;A = $01 EOR (IS) (IS still points to R28 - main game variation)
                XS   (IS)+               ; 19f0 ed
                BF   $4,A19f6            ; 19f1 94 04     ;skip next jump if not zero -> game variation is not Future Clariator
                JMP  A1a77               ; 19f3 29 1a 77
A19f6:          JMP  A169e               ; 19f6 29 16 9e  ;restart game

A19f9:          NI   $1f                 ; 19f9 21 1f     ;R1 = (A AND $1F) - 1
                LR   $1,A                ; 19fb 51
                DS   $1                  ; 19fc 31
                LR   DC,Q                ; 19fd 0f        ;load DC from Q (-> $082b) and load memory from there
                LM                       ; 19fe 16
                BF   $4,A1a11            ; 19ff 94 11     ;branch if not zero to 1a11
                LI   $61                 ; 1a01 20 61     ;else load $61 and store into $082b (which was previously zero)
                LR   DC,Q                ; 1a03 0f
                ST                       ; 1a04 17
                DCI  $0d5e               ; 1a05 2a 0d 5e  ;point to object table + R4*4
                LR   A,$4                ; 1a08 44
                SL   1                   ; 1a09 13
                SL   1                   ; 1a0a 13
                ADC                      ; 1a0b 8e
                LI   $e8                 ; 1a0c 20 e8     ;store $e8 at that address (x-coord.) (switch off object?)
                ST                       ; 1a0e 17
                BF   $0,A1a16            ; 1a0f 90 06     ;jump to 1a16
A1a11:          NI   $e0                 ; 1a11 21 e0     ;A = (A AND $e0) EOR R1
                XS   $1                  ; 1a13 e1
                LR   DC,Q                ; 1a14 0f        ;store A in $082b
                ST                       ; 1a15 17
A1a16:          LR   A,$2                ; 1a16 42        ;check address ($1ce2 + R2 * 2) for 0
                DCI  $1ce2               ; 1a17 2a 1c e2
                SL   1                   ; 1a1a 13
                ADC                      ; 1a1b 8e
                LIS  $0                  ; 1a1c 70
                XM                       ; 1a1d 8c
                LR   $5,A                ; 1a1e 55        ;store contents of ($1ce2 + R2 * 2) in R5
                LR   J,W                 ; 1a1f 1e        ;save status register in scratchpad register J (R9)
                XDC                      ; 1a20 2c        ;exchange data counters
                LISL 5                   ; 1a21 6d        ;point to R29 (subgame variation)
                LIS  $4                  ; 1a22 74        ;A = $04 AND (R29)
                NS   (IS)-               ; 1a23 fe
                LR   A,$5                ; 1a24 45        ;load R5 in A...
                BT   4,A1a28             ; 1a25 84 02     ;if ($04 and (R29)) = 0 (subvariation "Fast shots" not set), on with 1a28
                SL   1                   ; 1a27 13        ;else shift A one place to the left, making it R5 * 2
A1a28:          DCI  $0db6               ; 1a28 2a 0d b6  ;point to 2nd object table
                ST                       ; 1a2b 17        ;store A there (either R5 or R5*2 -> speed of object?)
                XDC                      ; 1a2c 2c        ;swap DC's (DC0 is now ($1ce3 + R2 * 2)
                LM                       ; 1a2d 16        ;load byte from ($1ce3 + R2 * 2)
                BT   4,A1a31             ; 1a2e 84 02     ;branch if zero (again "Fast shots" not set) to 1a31
                SL   1                   ; 1a30 13        ;else it becomes ($1ce3 + R2 * 2) * 2
A1a31:          XDC                      ; 1a31 2c        ;swap DC's (DC0 is now $0db7)
                ST                       ; 1a32 17        ;store value at $0db7
                DCI  $0e9e               ; 1a33 2a 0e 9e  ;store R6 at $0e9e
                LR   A,$6                ; 1a36 46
                ST                       ; 1a37 17
                DCI  $0fa0               ; 1a38 2a 0f a0  ;clear $0fa0 and $0fa1
                LIS  $0                  ; 1a3b 70
                ST                       ; 1a3c 17
                ST                       ; 1a3d 17
                DCI  $0d5e               ; 1a3e 2a 0d 5e  ;Point to object table (x-coord. of object 0)
                XDC                      ; 1a41 2c        ;swap DC's
                LR   DC,H                ; 1a42 10        ;load DC0 from H
                LIS  $d                  ; 1a43 7d        ;load $0d in A
                LR   W,J                 ; 1a44 1d        ;bring back status register from R9 (from check address ($1ce2 + R2 * 2) for 0 at $1a16)
                BT   1,A1a49             ; 1a45 81 03     ;branch if positive (bit 7 of ($1ce2 + R2 * 2) is clear) to 1a49 
                COM                      ; 1a47 18        ;either complement -> F2
                INC                      ; 1a48 1f        ;and increase to F3
A1a49:          AM                       ; 1a49 88        ;add to it value from (H)
                CM                       ; 1a4a 8d        ;compare with value from (H+1)
                XDC                      ; 1a4b 2c        ;exchange DC's -> DC0 is now $0d5e (x-coord. of object 0)
                ST                       ; 1a4c 17        ;store new x-coord. for object 0
                CM                       ; 1a4d 8d        ;compare with next value (width of object 0)
                XDC                      ; 1a4e 2c        ;exchange DC's again
                LI   $f8                 ; 1a4f 20 f8     ;A = $f8 + value from (H+2)
                AM                       ; 1a51 88
                XDC                      ; 1a52 2c        ;DC0 is now 3rd byte of object 0
                ST                       ; 1a53 17        ;store $f8 + value from (H+2) there
                LIS  $2                  ; 1a54 72        ;A = $02 EOR R28
                XS   (IS)                ; 1a55 ec
                BF   $4,A1a5d            ; 1a56 94 06     ;branch if not zero (main game variation not "Future Gladiator") to 1a5d
                PI   A1877               ; 1a58 28 18 77  ;do sound effect and on at 1a6f
                BF   $0,A1a6f            ; 1a5b 90 13
A1a5d:          PI   A1883               ; 1a5d 28 18 83  ;do different sound effect
                LIS  $1                  ; 1a60 71        ;A = $01 EOR R28
                XS   (IS)                ; 1a61 ec
                DCI  $9e80               ; 1a62 2a 9e 80  ;this can't be memory!
                BT   4,A1a72             ; 1a65 84 0c     ;if zero (main game variation = Scrimmage), branch forward to 1a72
                DCI  $9b8c               ; 1a67 2a 9b 8c  ;else point at $9b8c instead,
                LR   A,$2                ; 1a6a 42        ;compare R2 to $04
                CI   $04                 ; 1a6b 25 04
                BT   2,A1a72             ; 1a6d 82 04     ;if carry set (R2 < $04), skip next instruction
A1a6f:          DCI  $9b90               ; 1a6f 2a 9b 90  ;else point to $9b90 instead
A1a72:          LIS  $0                  ; 1a72 70        ;clear R0
                LR   $0,A                ; 1a73 50
                PI   A1780               ; 1a74 28 17 80  ;call 1780 (stores DC0 as RAM pointer to object number R0 in the list at $0c20 / $0c30)
A1a77:          PI   $40bc               ; 1a77 28 40 bc  ;pop back return address
                LISU 3                   ; 1a7a 63        ;point to R28 (main game variation)
                LISL 4                   ; 1a7b 6c
                PK                       ; 1a7c 0c        ;return
                
A1a7d:          LR   K,P                 ; 1a7d 08        ;save return address
                PI   $40a9               ; 1a7e 28 40 a9  ;push return address
                DCI  $0d6e               ; 1a81 2a 0d 6e  ;point to $0d6e and store it in H
                LR   H,DC                ; 1a84 11
                DCI  $0c68               ; 1a85 2a 0c 68  ;load byte from $0c68 and store in R2
                LM                       ; 1a88 16
                LR   $2,A                ; 1a89 52
                LI   $fe                 ; 1a8a 20 fe     ;store in $fe in R7 and $0c in R4
                LR   $7,A                ; 1a8c 57
                LIS  $c                  ; 1a8d 7c
                LR   $4,A                ; 1a8e 54
                DCI  $082c               ; 1a8f 2a 08 2c  ;point to $082c (segment width, intensity and XCopy for object 12 - spear number display)
                LR   Q,DC                ; 1a92 0e        ;store $082c at Q and load $02 in R6
                LIS  $2                  ; 1a93 72
                LR   $6,A                ; 1a94 56
                JMP  A19d7               ; 1a95 29 19 d7  ;on at 19d7

;the following subroutine waits for scanline $24 or $34 (depending on if R10 is $10 or not) and then clears output port 14

A1a98:          LR   K,P                 ; 1a98 08        ;save return address
                LR   A,$a                ; 1a99 4a        ;compare R10 to $03
                CI   $03                 ; 1a9a 25 03
                LI   $24                 ; 1a9c 20 24
                BF   $4,A1aa2            ; 1a9e 94 03     ;if not zero (R10 <> $03), branch forward (leave $24 in A)
                LI   $34                 ; 1aa0 20 34     ;otherwise load $34 in A
A1aa2:          DCI  $08fb               ; 1aa2 2a 08 fb  ;compare with value at $08fb (scanline no.)
                CM                       ; 1aa5 8d
                BF   $4,A1aa2            ; 1aa6 94 fb     ;if not equal, loop back to 1aa2 (-> wait for scanline $24 or $34)
                LIS  $0                  ; 1aa8 70        ;clear output port 14
                OUTS 14                  ; 1aa9 be
                PK                       ; 1aaa 0c        ;return
                
;THe following subroutine stores $4c in $08f7 (command register) and $0fea, sets the output port 14 to 1, clears $0fdd and $0fde and returns

A1aab:          LR   K,P                 ; 1aab 08        ;save return address
                LI   $4c                 ; 1aac 20 4c     ;store $4c in $0fea and $08f7 (Command register)
                DCI  $0fea               ; 1aae 2a 0f ea
                ST                       ; 1ab1 17
                DCI  $08f7               ; 1ab2 2a 08 f7
                ST                       ; 1ab5 17
                LIS  $1                  ; 1ab6 71        ;set output port 14 to 1
                OUTS 14                  ; 1ab7 be
                LIS  $0                  ; 1ab8 70        ;clear $0fdd and $0fde
                DCI  $0fdd               ; 1ab9 2a 0f dd
                ST                       ; 1abc 17
                ST                       ; 1abd 17
                PK                       ; 1abe 0c        ;return

;Purpose of following subroutine yet unknown
                
A1abf:          LR   K,P                 ; 1abf 08        ;save return address
                PI   $40a9               ; 1ac0 28 40 a9  ;push return address
                LISU 3                   ; 1ac3 63        ;point to R28 (main game variation)
                LISL 4                   ; 1ac4 6c
                LIS  $2                  ; 1ac5 72        ;check main game variation - if 2 (future), load $78 into A, else $28
                XS   (IS)                ; 1ac6 ec
                LI   $78                 ; 1ac7 20 78
                BF   $4,A1acd            ; 1ac9 94 03     ;branch if zero (game variation = 2)
                LI   $28                 ; 1acb 20 28
A1acd:          LR   $5,A                ; 1acd 55        ;store $78 or $28 in R5
A1ace:          DS   $5                  ; 1ace 35        ;decrement R5
                BT   4,A1af7             ; 1acf 84 27     ;branch if not zero forward to 1af7 (exit loop from 1ace to 1af5)
                LR   A,$5                ; 1ad1 45        ;load R5 into A
                SL   4                   ; 1ad2 15        ;shift left 6 places
                SL   1                   ; 1ad3 13        
                SL   1                   ; 1ad4 13
                BF   $4,A1af2            ; 1ad5 94 1c     ;branch if zero (lower 2 bits of R5 are 0) to 1af2
                DCI  $0e9b               ; 1ad7 2a 0e 9b  ;check $0e9b
                LIS  $0                  ; 1ada 70
                XM                       ; 1adb 8c
                LR   $2,A                ; 1adc 52        ;store A in R2 before conditionally branching
                BT   1,A1aeb             ; 1add 81 0d     ;branch is positive ($0e9b = $00 through $7F) to a1eb
                DCI  $0c40               ; 1adf 2a 0c 40  ;point to $0c40 + R1 (object height for object R1)
                LR   A,$1                ; 1ae2 41
                ADC                      ; 1ae3 8e
                LR   H,DC                ; 1ae4 11        ;store DC0 in H
                LM                       ; 1ae5 16        ;load from $0c40 + R1 (object height for object R1)
                AS   $2                  ; 1ae6 c2        ;add R2 to that value
                LR   DC,H                ; 1ae7 10        ;bring back DC0
                ST                       ; 1ae8 17        ;store in $0c40 + R1 -> object height has increased by value of R2
                BF   $0,A1af2            ; 1ae9 90 08     ;unconditional jump to 1af2

A1aeb:          DCI  $0c30               ; 1aeb 2a 0c 30  ;point to $0c30 + R1
                LR   A,$1                ; 1aee 41
                ADC                      ; 1aef 8e
                LR   H,DC                ; 1af0 11        ;store DC0 in H
                LM                       ; 1af1 16        ;load value from $0c30 + R1
A1af2:          PI   A1883               ; 1af2 28 18 83  ;do sound effect
                BF   $0,A1ace            ; 1af5 90 d8     ;branch back to 1ace

A1af7:          PI   $40bc               ; 1af7 28 40 bc  ;pop back return address
                LISU 3                   ; 1afa 63        ;point to R28 (main game variation)
                LISL 4                   ; 1afb 6c
                PK                       ; 1afc 0c        ;return

;The following part probably manages the X-order list
;The table at $0d60 and following probably contains intended starting rows

                
A1afd:          LI   $c0                 ; 1afd 20 c0     ;this gets jumped to after generating coordinates in R40-R55
A1aff:          DCI  $08fb               ; 1aff 2a 08 fb  ;point to current Y (scanline) LSB
                CM                       ; 1b02 8d        ;wait until current scanline has reached $c0
                BF   $4,A1aff            ; 1b03 94 fb
                DCI  $0860               ; 1b05 2a 08 60  ;segment starting rows LSB list B
                XDC                      ; 1b08 2c
                DCI  $0880               ; 1b09 2a 08 80  ;segment starting row MSB and X Order List B
                LI   $10                 ; 1b0c 20 10     ;load $10 in R1 (probably loop counter)
                LR   $1,A                ; 1b0e 51
A1b0f:          LM                       ; 1b0f 16        ;load from $088x
                NI   $0f                 ; 1b10 21 0f     ;and with $0f (leaves only X Order bits)
                LR   H,DC                ; 1b12 11        ;store counter in H
                SL   1                   ; 1b13 13        ;A = X-order * 4
                SL   1                   ; 1b14 13
                DCI  $0d60               ; 1b15 2a 0d 60
                ADC                      ; 1b18 8e        ;add this to data counter -> DC0 is now $0d60 + (X-Order) * 4
                LM                       ; 1b19 16        
                LR   $2,A                ; 1b1a 52        ;store value from DC0 in R2
                LM                       ; 1b1b 16        
                COM                      ; 1b1c 18        ;A = - ($0d61 + (X-Order) * 4) + ($0d60 + (X-Order) * 4)
                INC                      ; 1b1d 1f
                AS   $2                  ; 1b1e c2
                XDC                      ; 1b1f 2c        ;swap data pointers -> DC0 is now $088x
                ST                       ; 1b20 17        ;store A value computed above in $088x (segment starting row MSB and X Order List B)
                XDC                      ; 1b21 2c
                LR   DC,H                ; 1b22 10        ;bring back unincremented counter value
                DS   $1                  ; 1b23 31        ;decrement R1 and loop back if another iteration necessary
                BF   $4,A1b0f            ; 1b24 94 ea

;now fill segment starting columns from R40 through R55

                LISU 5                   ; 1b26 65        ;point to R47
                LISL 7                   ; 1b27 6f
                DCI  $0840               ; 1b28 2a 08 40  ;point to segment starting columns
                LI   $10                 ; 1b2b 20 10
                LR   $0,A                ; 1b2d 50        ;store $10 in R0
A1b2e:          LR   A,(IS)+             ; 1b2e 4d        ;load content of R47+ (wrapping around to 0?), order: reg. 47,40,41,42,43,44,45,46,55,48
                COM                      ; 1b2f 18        ;complement
                ST                       ; 1b30 17        ;store to $0840+ (-> fill segment starting columns from R40 through R55)
                BR7  A1b34               ; 1b31 8f 02     ;branch if isar does not end on 7
                LISU 6                   ; 1b33 66        ;point to 48+
A1b34:          DS   $0                  ; 1b34 30        ;decrement R0 and loop back if not zero
                BF   $4,A1b2e            ; 1b35 94 f8

;finally memcopy segment starting rows MSB and LSB bytes from List A into List B and refill segment refresh control

                DCI  $0850               ; 1b37 2a 08 50  ;Point to segment starting rows LSB List A (ordered by starting columns)
                XDC                      ; 1b3a 2c
                DCI  $0860               ; 1b3b 2a 08 60  ;ditto List B
                LI   $10                 ; 1b3e 20 10     ;load $10 into R7
                LR   $7,A                ; 1b40 57
                PI   A11a5               ; 1b41 28 11 a5  ;memcopy List A into List B
                DCI  $0870               ; 1b44 2a 08 70  ;point to segment starting row MSB and X order for list A
                XDC                      ; 1b47 2c
                DCI  $0880               ; 1b48 2a 08 80  ;ditto List B
                LI   $10                 ; 1b4b 20 10     ;load $10 into R7
                LR   $7,A                ; 1b4d 57
                PI   A11a5               ; 1b4e 28 11 a5  ;memcopy List A into List B
                DCI  $0ffa               ; 1b51 2a 0f fa  ;point to address for segment refresh control
                XDC                      ; 1b54 2c        
                DCI  $1cdc               ; 1b55 2a 1c dc  ;point to 1cdc (buffer for segment refresh control)
                LIS  $6                  ; 1b58 76
                LR   $7,A                ; 1b59 57
                PI   A11a5               ; 1b5a 28 11 a5   ;memcopy $6 bytes from $1cdc to $0ffa (segment refresh control)
                LISU 3                   ; 1b5d 63         ;point to R28 (main game variation)
                LISL 4                   ; 1b5e 6c
                JMP  A15ee               ; 1b5f 29 15 ee   ;jump to 15ee where the lion, space mine or blocking back gets handled

;--------------------------------------
;End of code - the remaining section of the cartridge contains only data
;--------------------------------------

A1b62:          COM                      ; 1b62 18         ;jump table starts here - $183b, $1823, $12d0, $13ef, $1256, $12b7, $1292, $1892, $1837, $181f,
                DS   $b                  ; 1b63 3b         ;                         $179d, $130e, $1832, $1328, $1311, $1314, $1317, $181a, $1920, $1923,
                COM                      ; 1b64 18         ;                         $1926, $178f (probably the end of jump table)
                XI   $12                 ; 1b65 23 12
                ASD  $0                  ; 1b67 d0
                SL   1                   ; 1b68 13
                db   $ef                 
                SR   1                   ; 1b6a 12
                LR   $6,A                ; 1b6b 56
                SR   1                   ; 1b6c 12
                OUTS 7                   ; 1b6d b7
                SR   1                   ; 1b6e 12
;                BF   $2,24               ; 1b6f 92 18
				db   $92,$18
                DS   $7                  ; 1b71 37
                COM                      ; 1b72 18
                INC                      ; 1b73 1f
                ST                       ; 1b74 17
                BF   $d,A1b89            ; 1b75 9d 13
                LR   Q,DC                ; 1b77 0e
                COM                      ; 1b78 18
                DS   $2                  ; 1b79 32
                SL   1                   ; 1b7a 13
                PI   A1311               ; 1b7b 28 13 11
                SL   1                   ; 1b7e 13
                SR   4                   ; 1b7f 14
                SL   1                   ; 1b80 13
                ST                       ; 1b81 17
                COM                      ; 1b82 18
                DI                       ; 1b83 1a
                LNK                      ; 1b84 19
                LI   $19                 ; 1b85 20 19
A1b87:          XI   $19                 ; 1b87 23 19
A1b89:          IN   $17                 ; 1b89 26 17
                BR7  A1b8e               ; 1b8b 8f 02
                LIS  $f                  ; 1b8d 7f
A1b8e:          LR   A,QU                ; 1b8e 02
                LR   A,KU                ; 1b8f 00
                LR   A,$0                ; 1b90 40
                NS   (IS)-               ; 1b91 fe
                LR   A,$0                ; 1b92 40
                LR   A,KU                ; 1b93 00
                LIS  $f                  ; 1b94 7f    ;image of palisade for ancient gladiator
                LR   (IS)+,A             ; 1b95 5d
                POP                      ; 1b96 1c
                POP                      ; 1b97 1c
                POP                      ; 1b98 1c
                POP                      ; 1b99 1c
                POP                      ; 1b9a 1c
                POP                      ; 1b9b 1c
                POP                      ; 1b9c 1c
                POP                      ; 1b9d 1c
                POP                      ; 1b9e 1c
                POP                      ; 1b9f 1c
                POP                      ; 1ba0 1c
                POP                      ; 1ba1 1c
                POP                      ; 1ba2 1c
                POP                      ; 1ba3 1c
                POP                      ; 1ba4 1c
                POP                      ; 1ba5 1c
                POP                      ; 1ba6 1c
                POP                      ; 1ba7 1c
                POP                      ; 1ba8 1c
                POP                      ; 1ba9 1c
                POP                      ; 1baa 1c
                POP                      ; 1bab 1c
                POP                      ; 1bac 1c
                POP                      ; 1bad 1c
                POP                      ; 1bae 1c
                DS   (IS)-               ; 1baf 3e
                DS   (IS)-               ; 1bb0 3e
                LIS  $f                  ; 1bb1 7f
A1bb2:          INC                      ; 1bb2 1f    ;source for weird MEMCOPY
A1bb3:          LR   A,KU                ; 1bb3 00    ;another source for weird MEMCOPY
                db   $3f                 
                BT   1,A1c35             ; 1bb5 81 7f
                AS   $2                  ; 1bb7 c2
                OUTS 1                   ; 1bb8 b1
                INS  1                   ; 1bb9 a1
                LISU 0                   ; 1bba 60
                AS   $1                  ; 1bbb c1
                XS   $a                  ; 1bbc ea
                XS   $1                  ; 1bbd e1
                AI   $81                 ; 1bbe 24 81
                XS   (IS)-               ; 1bc0 ee
                XS   $1                  ; 1bc1 e1
                LISL 6                   ; 1bc2 6e
                AS   $1                  ; 1bc3 c1
                XS   $4                  ; 1bc4 e4
                db   $ff                 
                DS   $1                  ; 1bc6 31
                db   $ff                 
                db   $ff                 
                db   $ff                 
                LIS  $f                  ; 1bca 7f
                db   $ff                 
                OUTS 15                  ; 1bcc bf
                db   $ff                 
                LIS  $f                  ; 1bce 7f
                db   $ff                 
                INC                      ; 1bd0 1f
                db   $ff                 
                INC                      ; 1bd2 1f
                db   $ff                 
                LNK                      ; 1bd4 19
                db   $b3                 
                LNK                      ; 1bd6 19
                db   $b3                 
                LNK                      ; 1bd8 19
                db   $b3                 
                DS   $0                  ; 1bda 30
                AS   $3                  ; 1bdb c3
                DS   $0                  ; 1bdc 30
                AS   $0                  ; 1bdd c0
A1bde:          POP                      ; 1bde 1c
                DS   (IS)-               ; 1bdf 3e
                DS   (IS)-               ; 1be0 3e
                DS   (IS)                ; 1be1 3c
                db   $3f                 
                DS   (IS)-               ; 1be3 3e
                DS   (IS)-               ; 1be4 3e
                LR   J,W                 ; 1be5 1e
A1be6:          POP                      ; 1be6 1c
                LIS  $f                  ; 1be7 7f
                db   $ff                 
                NS   $7                  ; 1be9 f7
                AS   $1                  ; 1bea c1
                XS   $3                  ; 1beb e3
                NS   $7                  ; 1bec f7
                XS   $b                  ; 1bed eb
                db   $ff                 
                db   $ff                 
                db   $ff                 
                NS   $7                  ; 1bf1 f7
                AS   $1                  ; 1bf2 c1
                NS   $7                  ; 1bf3 f7
                OUTS 15                  ; 1bf4 bf
                OUTS 15                  ; 1bf5 bf
                db   $3f                 
                DS   (IS)-               ; 1bf7 3e
                DS   $6                  ; 1bf8 36
                DS   $6                  ; 1bf9 36
                DS   $6                  ; 1bfa 36
                DS   $6                  ; 1bfb 36
                DS   $6                  ; 1bfc 36
                NS   $6                  ; 1bfd f6
                NS   $6                  ; 1bfe f6
                NS   $6                  ; 1bff f6
                BT   6,A1b87             ; 1c00 86 86
                BT   6,A1c0a             ; 1c02 86 07
                LR   QL,A                ; 1c04 07
A1c05:          LR   A,$0                ; 1c05 40
                LI   $1c                 ; 1c06 20 1c
                PK                       ; 1c08 0c
                
                POP                      ; 1c09 1c
A1c0a:          DS   $2                  ; 1c0a 32
                XS   $1                  ; 1c0b e1
                AS   $0                  ; 1c0c c0
A1c0d:          LR   A,KU                ; 1c0d 00
                LR   A,KU                ; 1c0e 00
                LR   A,KU                ; 1c0f 00
                LR   A,KU                ; 1c10 00
                LR   A,KU                ; 1c11 00
                LR   A,KU                ; 1c12 00
                LR   A,KU                ; 1c13 00
                LR   A,KU                ; 1c14 00
                LR   DC,H                ; 1c15 10
                LR   DC,H                ; 1c16 10
                LR   DC,H                ; 1c17 10
                LR   K,P                 ; 1c18 08
                LR   K,P                 ; 1c19 08
                LR   Q,DC                ; 1c1a 0e
                NS   $6                  ; 1c1b f6
                NS   (IS)-               ; 1c1c fe
                LR   KU,A                ; 1c1d 04
                LR   A,QU                ; 1c1e 02
                LR   A,QU                ; 1c1f 02
                LR   A,QU                ; 1c20 02
                LR   A,KL                ; 1c21 01
                LR   A,KL                ; 1c22 01
                LR   A,KL                ; 1c23 01
                LR   A,KU                ; 1c24 00
                LR   KU,A                ; 1c25 04
                LR   KU,A                ; 1c26 04
                LR   KU,A                ; 1c27 04
                LR   KU,A                ; 1c28 04
                LR   KU,A                ; 1c29 04
                LR   KU,A                ; 1c2a 04
                NS   (IS)-               ; 1c2b fe
                NS   (IS)-               ; 1c2c fe
                LR   KU,A                ; 1c2d 04
                LR   KU,A                ; 1c2e 04
                LR   KU,A                ; 1c2f 04
                LR   KU,A                ; 1c30 04
                LR   KU,A                ; 1c31 04
                LR   KU,A                ; 1c32 04
                LR   KU,A                ; 1c33 04
                LR   A,KU                ; 1c34 00
A1c35:          LR   A,KU                ; 1c35 00
                LR   A,KL                ; 1c36 01
                LR   A,KL                ; 1c37 01
                LR   A,KL                ; 1c38 01
A1c39:          LR   A,QU                ; 1c39 02
                LR   A,QU                ; 1c3a 02
                LR   A,QU                ; 1c3b 02
                BT   4,A1c39             ; 1c3c 84 fc
                LIS  $6                  ; 1c3e 76
                LR   Q,DC                ; 1c3f 0e
                LR   K,P                 ; 1c40 08
                LR   K,P                 ; 1c41 08
                LR   DC,H                ; 1c42 10
                LR   DC,H                ; 1c43 10
                LR   DC,H                ; 1c44 10
                LR   A,KU                ; 1c45 00
                LR   A,KU                ; 1c46 00
                LR   A,KU                ; 1c47 00
                LR   A,KU                ; 1c48 00
                LR   A,KU                ; 1c49 00
                LR   A,KU                ; 1c4a 00
                LR   A,KU                ; 1c4b 00
                BT   0,A1c0d             ; 1c4c 80 c0
                LISU 1                   ; 1c4e 61
A1c4f:          DS   $2                  ; 1c4f 32
                POP                      ; 1c50 1c
                PK                       ; 1c51 0c
                
                POP                      ; 1c52 1c
                LI   $40                 ; 1c53 20 40
A1c55:          LR   A,KU                ; 1c55 00     ;this is a table based on the low nybble of R2 (Joystick value)
                LR   A,KU                ; 1c56 00
                LR   A,KU                ; 1c57 00
                LR   A,KL                ; 1c58 01
A1c59:          LR   A,KL                ; 1c59 01
                LR   A,QU                ; 1c5a 02
                LR   A,QU                ; 1c5b 02
                LR   A,QL                ; 1c5c 03
                LR   A,QL                ; 1c5d 03
                LR   KU,A                ; 1c5e 04
                LR   KU,A                ; 1c5f 04
                LR   KL,A                ; 1c60 05
                BT   4,A1be6             ; 1c61 84 84
                BT   4,A1cc0             ; 1c63 84 5c  ;starting with 1c64, $18 bytes get memcopied to $09de
                LR   A,$8                ; 1c65 48
                INS  8                   ; 1c66 a8
                LR   $4,A                ; 1c67 54
                LR   (IS),A              ; 1c68 5c
                DS   (IS)                ; 1c69 3c
                INS  4                   ; 1c6a a4
                XDC                      ; 1c6b 2c
                LR   (IS),A              ; 1c6c 5c
                LR   A,$6                ; 1c6d 46
                INS  0                   ; 1c6e a0
                DS   $2                  ; 1c6f 32
                LR   (IS),A              ; 1c70 5c
                DS   (IS)                ; 1c71 3c
                BF   $2,A1cab            ; 1c72 92 38
                LR   (IS),A              ; 1c74 5c
                LR   A,$8                ; 1c75 48
                BF   $0,A1cdb            ; 1c76 90 64
                LR   (IS),A              ; 1c78 5c
                LR   A,$0                ; 1c79 40
                BF   $0,A1cc7            ; 1c7a 90 4c
A1c7c:          LR   KU,A                ; 1c7c 04     ;initial object properties for past Gladiator
                LR   A,KL                ; 1c7d 01
                XS   $8                  ; 1c7e e8
                LISU 0                   ; 1c7f 60
                BF   $b,A1c0d            ; 1c80 9b 8c
                LR   J,W                 ; 1c82 1e
                LR   A,$1                ; 1c83 41
                INS  6                   ; 1c84 a6
                LISU 2                   ; 1c85 62
                NS   $b                  ; 1c86 fb
                BF   $4,A1c9e            ; 1c87 94 16
                LR   A,QU                ; 1c89 02
                ASD  $8                  ; 1c8a d8
                LR   A,$0                ; 1c8b 40
                ASD  $b                  ; 1c8c db
                db   $b2                 
                IN   $42                 ; 1c8e 26 42
                DS   $5                  ; 1c90 35
                db   $a2                 
                AS   (IS)+               ; 1c92 cd
                ASD  $a                  ; 1c93 da
                IN   $02                 ; 1c94 26 02
                XM                       ; 1c96 8c
                db   $a2                 
                LR   A,(IS)-             ; 1c98 4e
                IN   $1e                 ; 1c99 26 1e
                LR   A,$1                ; 1c9b 41
                LM                       ; 1c9c 16
                LISU 2                   ; 1c9d 62
A1c9e:          NS   $b                  ; 1c9e fb
;                BF   $4,30               ; 1c9f 94 1e
				db   $94,$1e
                LR   A,$1                ; 1ca1 41
                INS  6                   ; 1ca2 a6
                XS   $0                  ; 1ca3 e0
                NS   $b                  ; 1ca4 fb
                BF   $4,A1cc4            ; 1ca5 94 1e
                AS   $7                  ; 1ca7 c7
                db   $2e                 
                DS   (IS)-               ; 1ca9 3e
                NS   $b                  ; 1caa fb
A1cab:          BF   $4,A1cca            ; 1cab 94 1e
                AS   $7                  ; 1cad c7
                ADC                      ; 1cae 8e
                DS   (IS)-               ; 1caf 3e
                NS   $b                  ; 1cb0 fb
                BF   $4,A1cd0            ; 1cb1 94 1e
                LR   A,$1                ; 1cb3 41
                LIS  $0                  ; 1cb4 70
                INS  0                   ; 1cb5 a0
                NS   $b                  ; 1cb6 fb
                BF   $4,A1cd6            ; 1cb7 94 1e
                LR   A,$1                ; 1cb9 41
                LR   A,(IS)              ; 1cba 4c
                INS  0                   ; 1cbb a0
                NS   $b                  ; 1cbc fb
                BF   $4,A1cc2            ; 1cbd 94 04
                AS   $7                  ; 1cbf c7
A1cc0:          db   $2e                 
                LR   $0,A                ; 1cc1 50
A1cc2:          BF   $b,A1c4f            ; 1cc2 9b 8c
A1cc4:          LR   KU,A                ; 1cc4 04
                AS   $7                  ; 1cc5 c7
                ADC                      ; 1cc6 8e
A1cc7:          LR   $0,A                ; 1cc7 50
                BF   $b,A1c59            ; 1cc8 9b 90
A1cca:          LR   QL,A                ; 1cca 07
                LR   A,KL                ; 1ccb 01
                LR   $0,A                ; 1ccc 50
                LR   A,$b                ; 1ccd 4b
                LR   DC,Q                ; 1cce 0f
                db   $3f                 
A1cd0:          LR   QL,A                ; 1cd0 07
                LR   A,KL                ; 1cd1 01
                LISL 5                   ; 1cd2 6d
                LR   A,$b                ; 1cd3 4b
                LR   DC,Q                ; 1cd4 0f
                db   $3f                 
A1cd6:          LR   J,W                 ; 1cd6 1e
                LR   A,$1                ; 1cd7 41
                LM                       ; 1cd8 16
                XS   $0                  ; 1cd9 e0
                NS   $b                  ; 1cda fb
A1cdb:          BF   $4,A1cec            ; 1cdb 94 10 ;1cdc starts data for memory refresh control, which is 10 01 0c 20 0c 20
                LR   A,KL                ; 1cdd 01    ;and gets copied from $0ffa through $0fff where the BIOS picks it up
                PK                       ; 1cde 0c    ;This means that 10 is the number of objects, and the list gets copied into the VLSI from $0c20.
                
                LI   $0c                 ; 1cdf 20 0c
                LI   $03                 ; 1ce1 20 03
A1ce3:          NS   $a                  ; 1ce3 fa     ;this is data
                LR   A,QL                ; 1ce4 03
                NS   (IS)-               ; 1ce5 fe
                LR   A,QL                ; 1ce6 03
                LR   A,KU                ; 1ce7 00
                LR   A,QL                ; 1ce8 03
                LR   A,QU                ; 1ce9 02
                LR   A,QL                ; 1cea 03
                LR   QU,A                ; 1ceb 06
A1cec:          NS   (IS)+               ; 1cec fd   ;this is data
                NS   $a                  ; 1ced fa
                NS   (IS)+               ; 1cee fd
                NS   (IS)-               ; 1cef fe
                NS   (IS)+               ; 1cf0 fd
                LR   A,KU                ; 1cf1 00
                NS   (IS)+               ; 1cf2 fd
                LR   A,QU                ; 1cf3 02
                NS   (IS)+               ; 1cf4 fd
                LR   QU,A                ; 1cf5 06
A1cf6:          LR   P,K                 ; 1cf6 09  ;This is a list of object collisions to check with object 0 (unknown object) in past Gladiator
                LR   P,K                 ; 1cf7 09  
                LR   A,IS                ; 1cf8 0a  ;on collision with object 9, 10, 1 or 15, go to jump table 9 (all palisades)
                LR   P,K                 ; 1cf9 09
                LR   A,KL                ; 1cfa 01
                LR   P,K                 ; 1cfb 09
                LR   DC,Q                ; 1cfc 0f
                LR   P,K                 ; 1cfd 09
                LR   A,QU                ; 1cfe 02  ;on collision with object 2 (lion), go to jump table 2
                LR   A,QU                ; 1cff 02
                LR   A,QL                ; 1d00 03  ;on collision with object 3 (player 1), go to jump table 0
                LR   A,KU                ; 1d01 00
                LR   KU,A                ; 1d02 04  ;on collision with object 4 (player 2), go to jump table 1
                LR   A,KL                ; 1d03 01
                LR   KL,A                ; 1d04 05  ;on collision with object 5 or 6, go to jump table 9 (more palisades)
                LR   P,K                 ; 1d05 09
                LR   QU,A                ; 1d06 06  
                LR   P,K                 ; 1d07 09
                BF   $0,A1d12            ; 1d08 90 09    ;the 90 donates the end of this list.

                LR   A,KU                ; 1d0a 00      ;start of collision checks for object 3 in list 1 (player 1 in past Gladiator)
                LR   A,KU                ; 1d0b 00      ;on collision with object 0, go to jump table 0 (shot?)
                LR   KU,A                ; 1d0c 04      ;on collision with object 4, go to jump table 4 (player 2)
                LR   KU,A                ; 1d0d 04
                LR   P,K                 ; 1d0e 09      ;on collision with object 9, 10 or 1, go to jump table 6 (palisades)
                LR   QU,A                ; 1d0f 06
                LR   A,IS                ; 1d10 0a
                LR   QU,A                ; 1d11 06  
A1d12:          LR   A,KL                ; 1d12 01       
                LR   QU,A                ; 1d13 06
                LR   A,QU                ; 1d14 02      ;on collision with object 2, go to jump table 7 (lion)
                LR   QL,A                ; 1d15 07
                LR   DC,Q                ; 1d16 0f      ;on collision with objects 15, 5 or 6, go to jump table 6 (palisades)
                LR   QU,A                ; 1d17 06
                LR   KL,A                ; 1d18 05      
                LR   QU,A                ; 1d19 06
                LR   QU,A                ; 1d1a 06
                LR   QU,A                ; 1d1b 06
                BF   $1,A1d23            ; 1d1c 91 06   ;the 91 denotes the end of this list.

                LR   A,KU                ; 1d1e 00    ;collision list for object 4 (player 2): on collision with object 0 (shot), go to jump table 1
                LR   A,KL                ; 1d1f 01
                LR   A,QL                ; 1d20 03    ;on collision with object 3 (player 1), go to jump table 4
                LR   KU,A                ; 1d21 04
                LR   P,K                 ; 1d22 09    ;on collision with object 9, 10 or 1, go to jump table 6
A1d23:          LR   QU,A                ; 1d23 06    ;this is data
                LR   A,IS                ; 1d24 0a
                LR   QU,A                ; 1d25 06
                LR   A,KL                ; 1d26 01
                LR   QU,A                ; 1d27 06
                LR   A,QU                ; 1d28 02    ;on collision with object 2 (lion), go to jump table 8
                LR   K,P                 ; 1d29 08
                LR   DC,Q                ; 1d2a 0f    ;on collision with objects 15, 5 or 6, fo to jump table 6
                LR   QU,A                ; 1d2b 06
                LR   KL,A                ; 1d2c 05
                LR   QU,A                ; 1d2d 06
                LR   QU,A                ; 1d2e 06
                LR   QU,A                ; 1d2f 06    
                BF   $1,A1d37            ; 1d30 91 06 ;end of list
                LR   A,KU                ; 1d32 00    ;collision table for object 2 (lion)
                LR   A,QU                ; 1d33 02    ;on collision with object 0 (shot), go to jump table 2
                LR   A,QL                ; 1d34 03    ;on collision with object 3 (player 1), go to jump table 7
                LR   QL,A                ; 1d35 07
                LR   KU,A                ; 1d36 04    ;on collision with object 4 (player 2), go to jump table 8
A1d37:          LR   K,P                 ; 1d37 08   ;this is data
                LR   P,K                 ; 1d38 09    ;on collisions with object 9, 10, 1, 15, 5 or 6 (obstacles), go to jump table 5
                LR   KL,A                ; 1d39 05
                LR   A,IS                ; 1d3a 0a
                LR   KL,A                ; 1d3b 05
                LR   A,KL                ; 1d3c 01
                LR   KL,A                ; 1d3d 05
                LR   DC,Q                ; 1d3e 0f
                LR   KL,A                ; 1d3f 05
                LR   KL,A                ; 1d40 05
                LR   KL,A                ; 1d41 05
                LR   QU,A                ; 1d42 06
                LR   KL,A                ; 1d43 05
;                BF   $2,3                ; 1d44 92 03  ;end of list
				db   $92,$03            ;end of memcopied data for future Gladiator
A1d46:          DS   $6                  ; 1d46 36      ;this is data
                AI   $34                 ; 1d47 24 34
                DS   $2                  ; 1d49 32
                OI   $20                 ; 1d4a 22 20
                LR   J,W                 ; 1d4c 1e
                LR   Q,DC                ; 1d4d 0e
                PK                       ; 1d4e 0c
                
                LR   A,IS                ; 1d4f 0a

;The following is a table that contains some addresses and data. There are three such tables, at 1d50, 1f50 and 1fed.

A1d50:          POP                      ; 1d50 1c   ;preparation of jump table for Past Gladiator - load address $1cf6 and object no. 0 (shot?)
                NS   $6                  ; 1d51 f6
                LR   A,KU                ; 1d52 00
                LR   W,J                 ; 1d53 1d   ;then compare collisions for object 3 (player 1) with list at 1d0a
                LR   A,IS                ; 1d54 0a
                LR   A,QL                ; 1d55 03
                LR   W,J                 ; 1d56 1d   ;then collisions for object 4 (player 2) with list at 1d1e
                LR   J,W                 ; 1d57 1e
                LR   KU,A                ; 1d58 04
                LR   W,J                 ; 1d59 1d   ;then collisions for object 2 (lion) with list at 1d32
                DS   $2                  ; 1d5a 32
                LR   A,QU                ; 1d5b 02
                db   $ff                              ;end of this list
A1d5d:          LISU 4                   ; 1d5d 64    ;this is data
                LR   A,IS                ; 1d5e 0a
                LR   A,KL                ; 1d5f 01
A1d60:          EI                       ; 1d60 1b    ;this is data - 16 bytes get copied to 0f85
                SL   1                   ; 1d61 13    ;right at startup
                LR   A,KU                ; 1d62 00
                LR   A,KU                ; 1d63 00
                EI                       ; 1d64 1b
                OUT  $11                 ; 1d65 27 11
                INC                      ; 1d67 1f
                LR   A,KL                ; 1d68 01
                LR   H,DC                ; 1d69 11
                LR   QL,A                ; 1d6a 07
                SL   1                   ; 1d6b 13
                LR   P,K                 ; 1d6c 09
                NI   $04                 ; 1d6d 21 04
                LR   A,KU                ; 1d6f 00
A1d70:          NI   $0b                 ; 1d70 21 0b  ;text of title screen (3 lines):
                OUT  $0b                 ; 1d72 27 0b  ;SELECT A GAME BY
                DS   $1                  ; 1d74 31
                LR   QL,A                ; 1d75 07
                LR   A,KU                ; 1d76 00
                LR   H,DC                ; 1d77 11
                LR   A,KU                ; 1d78 00
                EI                       ; 1d79 1b
                LR   H,DC                ; 1d7a 11
                JMP  $0b00               ; 1d7b 29 0b 00
                db   $2d                 
                LR   KL,A                ; 1d7f 05
                LR   QL,A                ; 1d80 07
                LR   KL,A                ; 1d81 05
                CI   $01                 ; 1d82 25 01  ;TYPING A NUMBER BETWEEN
                NOP                      ; 1d84 2b
                EI                       ; 1d85 1b
                LR   A,KU                ; 1d86 00
                LR   H,DC                ; 1d87 11
                LR   A,KU                ; 1d88 00
                NOP                      ; 1d89 2b
                LR   A,QL                ; 1d8a 03
                JMP  $2d0b               ; 1d8b 29 2d 0b
                LR   P,K                 ; 1d8e 09
                LR   A,KU                ; 1d8f 00
                db   $2d                 
                LR   IS,A                ; 1d91 0b
                LR   QL,A                ; 1d92 07
                LR   P0,Q                ; 1d93 0d
                LR   IS,A                ; 1d94 0b
                LR   IS,A                ; 1d95 0b
                NOP                      ; 1d96 2b
                LR   A,KU                ; 1d97 00
                DS   $6                  ; 1d98 36    ;0 - 384
                LR   A,KU                ; 1d99 00
                POP                      ; 1d9a 1c
                LR   A,KU                ; 1d9b 00
                DS   $2                  ; 1d9c 32
                PK                       ; 1d9d 0c
                
                OI   $00                 ; 1d9e 22 00
A1da0:          SL   4                   ; 1da0 15      ;this is data (one more line getting drawn on title screen)
                LR   IS,A                ; 1da1 0b      ;KEY RUN/STOP
                LR   KL,A                ; 1da2 05
                LR   A,KU                ; 1da3 00
                LR   P,K                 ; 1da4 09
                LR   A,QL                ; 1da5 03
                NOP                      ; 1da6 2b
                DI                       ; 1da7 1a
                NI   $07                 ; 1da8 21 07
                SL   1                   ; 1daa 13
                CI   $07                 ; 1dab 25 07   ;TYPE IN MESSAGE
                LR   KL,A                ; 1dad 05
                CI   $0b                 ; 1dae 25 0b
                LR   A,KU                ; 1db0 00
                LR   A,KL                ; 1db1 01
                NOP                      ; 1db2 2b
                LR   A,KU                ; 1db3 00
                JMP  $0b21               ; 1db4 29 0b 21
                NI   $11                 ; 1db7 21 11
                EI                       ; 1db9 1b
                LR   IS,A                ; 1dba 0b
                LR   A,KU                ; 1dbb 00
                SR   1                   ; 1dbc 12      ;16 dots
                SR   1                   ; 1dbd 12
                SR   1                   ; 1dbe 12
                SR   1                   ; 1dbf 12
                SR   1                   ; 1dc0 12
                SR   1                   ; 1dc1 12
                SR   1                   ; 1dc2 12
                SR   1                   ; 1dc3 12
                SR   1                   ; 1dc4 12
                SR   1                   ; 1dc5 12
                SR   1                   ; 1dc6 12
                SR   1                   ; 1dc7 12
                SR   1                   ; 1dc8 12
A1dc9:          SR   1                   ; 1dc9 12  ;this is data read in groups of 3 bytes (?), gets stored in R35, R36 and R20 respectively
                SR   1                   ; 1dca 12  ;actually starting at 1dcc
                SR   1                   ; 1dcb 12  ;looks like it's the title music; each note is 3 bytes - ??, period, length?
                LR   A,QL                ; 1dcc 03  036080 034080 033080 0b1210 0b13a0 036014 038014 036014 038014 036014 038014 ff (ff denotes end)
                LISU 0                   ; 1dcd 60
;                BT   0,3                 ; 1dce 80 03
				db   $80,$03
                LR   A,$0                ; 1dd0 40
;                BT   0,3                 ; 1dd1 80 03
				db   $80,$03
                DS   $0                  ; 1dd3 30
;                BT   0,11                ; 1dd4 80 0b
				db   $80,$0b
                SR   1                   ; 1dd6 12
                LR   DC,H                ; 1dd7 10
                LR   IS,A                ; 1dd8 0b
                SL   1                   ; 1dd9 13
                INS  0                   ; 1dda a0
                LR   A,QL                ; 1ddb 03
                LISU 0                   ; 1ddc 60
                SR   4                   ; 1ddd 14
                LR   A,QL                ; 1dde 03
                BT   0,A1df4             ; 1ddf 80 14
                LR   A,QL                ; 1de1 03
                LISU 0                   ; 1de2 60
                SR   4                   ; 1de3 14
                LR   A,QL                ; 1de4 03
                BT   0,A1dfa             ; 1de5 80 14
                LR   A,QL                ; 1de7 03
                LISU 0                   ; 1de8 60
                SR   4                   ; 1de9 14
                LR   A,QL                ; 1dea 03
                BT   0,A1e00             ; 1deb 80 14
                db   $ff                                 ;end of melody
A1dee:          CI   $27                 ; 1dee 25 27    ;text to be printed on result screen
                LR   H,DC                ; 1df0 11      ;PLAYER # X WON!
                LR   KL,A                ; 1df1 05
                LR   IS,A                ; 1df2 0b
                LR   P,K                 ; 1df3 09
A1df4:          LR   A,KU                ; 1df4 00     ;this is data
                SR   4                   ; 1df5 14
                LR   A,KU                ; 1df6 00
                AI   $00                 ; 1df7 24 00
                LR   P0,Q                ; 1df9 0d
A1dfa:          SL   1                   ; 1dfa 13   ;this is data
                NOP                      ; 1dfb 2b
                LR   KU,A                ; 1dfc 04
                LR   A,KU                ; 1dfd 00
                LR   A,IS                ; 1dfe 0a  ;X TO X GAME
                LR   A,KU                ; 1dff 00
A1e00:          LR   QL,A                ; 1e00 07  ;this is data
                SL   1                   ; 1e01 13
                LR   A,KU                ; 1e02 00
                DS   $6                  ; 1e03 36
                LR   A,KU                ; 1e04 00  ;Collision table for collisions with object 4 (player 2) in Past Gladiator
                EI                       ; 1e05 1b  ;on collision with object 0 (shot?) go to Jump Table entry 27
                LR   H,DC                ; 1e06 11  ;is this really the correct collision table???
                JMP  $0b0e               ; 1e07 29 0b 0e
                INC                      ; 1e0a 1f
                LR   W,J                 ; 1e0b 1d
                EI                       ; 1e0c 1b
                LR   J,W                 ; 1e0d 1e
                DI                       ; 1e0e 1a
                INC                      ; 1e0f 1f
                LR   J,W                 ; 1e10 1e
                LR   Q,DC                ; 1e11 0e
                db   $3f                 
                LIS  $f                  ; 1e13 7f
                LIS  $b                  ; 1e14 7b
                LIS  $5                  ; 1e15 75
                LIS  $5                  ; 1e16 75
                LIS  $b                  ; 1e17 7b
                LIS  $5                  ; 1e18 75
                LIS  $5                  ; 1e19 75
                LIS  $b                  ; 1e1a 7b
                LIS  $f                  ; 1e1b 7f
                LIS  $f                  ; 1e1c 7f
                db   $3f                 
                db   $5f                 
                LR   $0,A                ; 1e1f 50
                LR   $3,A                ; 1e20 53
                DS   $3                  ; 1e21 33
                DS   $3                  ; 1e22 33
                DS   $3                  ; 1e23 33
                DS   $7                  ; 1e24 37
                DS   $7                  ; 1e25 37
                DS   $7                  ; 1e26 37
                DS   $7                  ; 1e27 37
A1e28:          DS   $4                  ; 1e28 34        :this is data
                DS   $4                  ; 1e29 34
                DS   $0                  ; 1e2a 30
                DS   $0                  ; 1e2b 30
                DS   $0                  ; 1e2c 30
                DS   $0                  ; 1e2d 30
                DS   $8                  ; 1e2e 38
A1e2f:          LR   A,$0                ; 1e2f 40       ;this is data
                LR   A,$0                ; 1e30 40
                LISU 0                   ; 1e31 60
                LISU 0                   ; 1e32 60
                LISU 0                   ; 1e33 60
                LISU 0                   ; 1e34 60
                XS   $0                  ; 1e35 e0
                XS   $0                  ; 1e36 e0
                XS   $0                  ; 1e37 e0
                BT   0,0                 ; 1e38 80 00
A1e3a:          LR   A,KU                ; 1e3a 00        ;this is data
                LR   A,KU                ; 1e3b 00
                LR   A,KU                ; 1e3c 00
                LR   A,KU                ; 1e3d 00
                LR   A,KU                ; 1e3e 00
                LR   A,KU                ; 1e3f 00
                LR   KU,A                ; 1e40 04
                PK                       ; 1e41 0c
                
                POP                      ; 1e42 1c
                DS   $8                  ; 1e43 38
                LIS  $8                  ; 1e44 78
                NS   $0                  ; 1e45 f0
                XS   $0                  ; 1e46 e0
                AS   $0                  ; 1e47 c0
                BT   0,0                 ; 1e48 80 00
                LR   A,KU                ; 1e4a 00
                LR   A,KU                ; 1e4b 00
                LR   A,KU                ; 1e4c 00
                LR   A,KU                ; 1e4d 00
                LR   A,KU                ; 1e4e 00
                LR   A,KU                ; 1e4f 00
                LR   A,KU                ; 1e50 00
                LR   A,KU                ; 1e51 00
                LR   A,KU                ; 1e52 00
                LR   A,KU                ; 1e53 00
                LR   A,KU                ; 1e54 00
                NS   (IS)                ; 1e55 fc
                NS   (IS)                ; 1e56 fc
                NS   $8                  ; 1e57 f8
                LR   A,KU                ; 1e58 00
                LR   A,KU                ; 1e59 00
                LR   A,KU                ; 1e5a 00
                LR   A,KU                ; 1e5b 00
                LR   A,KU                ; 1e5c 00
                LR   A,KU                ; 1e5d 00
                LR   A,KU                ; 1e5e 00
                LR   A,KU                ; 1e5f 00
                LR   A,KU                ; 1e60 00
                LR   A,KU                ; 1e61 00
                LR   A,KU                ; 1e62 00
                LR   A,KU                ; 1e63 00
                LR   A,KU                ; 1e64 00
                LR   A,KU                ; 1e65 00
                LR   A,KU                ; 1e66 00
                BT   0,A1e28             ; 1e67 80 c0
                XS   $0                  ; 1e69 e0
                XS   $0                  ; 1e6a e0
                LIS  $0                  ; 1e6b 70
                DS   $8                  ; 1e6c 38
                COM                      ; 1e6d 18
                LR   A,KU                ; 1e6e 00
                LR   A,KU                ; 1e6f 00
                LR   A,KU                ; 1e70 00
                LR   A,KU                ; 1e71 00
                LR   A,KU                ; 1e72 00
                LR   A,KU                ; 1e73 00
                LR   A,KU                ; 1e74 00
                LR   A,KU                ; 1e75 00
                LR   A,KU                ; 1e76 00
;                BT   0,-128              ; 1e77 80 80
				db   $80,$80
                BT   0,A1e3a             ; 1e79 80 c0
                XS   $0                  ; 1e7b e0
                XS   $0                  ; 1e7c e0
                LIS  $0                  ; 1e7d 70
                DS   $8                  ; 1e7e 38
                COM                      ; 1e7f 18
                COM                      ; 1e80 18
                DS   (IS)                ; 1e81 3c
                LIS  $e                  ; 1e82 7e
                LIS  $e                  ; 1e83 7e
                DS   (IS)                ; 1e84 3c
                COM                      ; 1e85 18
                db   $ff                 
;                BT   1,-127              ; 1e87 81 81
				db   $81,$81
                db   $ff                 
A1e8a:          LR   QU,A                ; 1e8a 06    ;object properties for present Gladiator
                LR   A,KL                ; 1e8b 01
                XS   $8                  ; 1e8c e8
                LISU 0                   ; 1e8d 60
                ASD  (IS)-               ; 1e8e de
                BT   0,A1eb6             ; 1e8f 80 26
                LR   A,KL                ; 1e91 01
                LI   $50                 ; 1e92 20 50
                db   $2e                 
                LIS  $2                  ; 1e95 72
                IN   $01                 ; 1e96 26 01
                DS   (IS)                ; 1e98 3c
                OUTS 0                   ; 1e99 b0
                AS   (IS)-               ; 1e9a ce
                LIS  $2                  ; 1e9b 72
                IN   $02                 ; 1e9c 26 02
                db   $2e                 
                db   $a2                 
                AS   (IS)+               ; 1ea0 cd
                ASD  $a                  ; 1ea1 da
                IN   $02                 ; 1ea2 26 02
                XM                       ; 1ea4 8c
                db   $a2                 
                db   $2e                 
                IN   $26                 ; 1ea7 26 26
                LR   A,KL                ; 1ea9 01
                INS  4                   ; 1eaa a4
                LR   $0,A                ; 1eab 50
                AS   (IS)+               ; 1eac cd
                DS   $8                  ; 1ead 38
                LR   A,$0                ; 1eae 40
                LR   A,$1                ; 1eaf 41
                LI   $d0                 ; 1eb0 20 d0
                LR   $0,A                ; 1eb2 50
                LR   A,KU                ; 1eb3 00
                LR   A,$0                ; 1eb4 40
                LR   A,$1                ; 1eb5 41
A1eb6:          LI   $90                 ; 1eb6 20 90    this is data
                LR   $0,A                ; 1eb8 50
                LR   A,KU                ; 1eb9 00
                LR   A,$0                ; 1eba 40
                LR   A,$1                ; 1ebb 41
                INS  4                   ; 1ebc a4
                BF   $0,A1f0e            ; 1ebd 90 50
                LR   A,KU                ; 1ebf 00
                LR   A,$0                ; 1ec0 40
                LR   A,$1                ; 1ec1 41
                INS  4                   ; 1ec2 a4
                ASD  $0                  ; 1ec3 d0
                LR   $0,A                ; 1ec4 50
                LR   A,KU                ; 1ec5 00
                LR   A,QL                ; 1ec6 03
                BF   $0,A1f28            ; 1ec7 90 60
                NS   $1                  ; 1ec9 f1
                LR   J,W                 ; 1eca 1e
                BT   7,A1ecf             ; 1ecb 87 03
                AS   $1                  ; 1ecd c1
                XS   $0                  ; 1ece e0
A1ecf:          LR   A,$0                ; 1ecf 40     ;this is data
                LR   J,W                 ; 1ed0 1e
                BT   0,A1ed5             ; 1ed1 80 03
                AS   $1                  ; 1ed3 c1
                ASD  $8                  ; 1ed4 d8
A1ed5:          LR   A,$0                ; 1ed5 40            this is data (probably)
                LR   J,W                 ; 1ed6 1e
                BT   0,A1edf             ; 1ed7 80 07
                LR   A,KL                ; 1ed9 01
                DS   $0                  ; 1eda 30
                PI   $0f3f               ; 1edb 28 0f 3f
                LR   QL,A                ; 1ede 07
A1edf:          LR   A,KL                ; 1edf 01     this is data
                BT   0,A1f09             ; 1ee0 80 28
                LR   DC,Q                ; 1ee2 0f
                db   $3f                 
                LR   A,QL                ; 1ee4 03
                BF   $0,A1f46            ; 1ee5 90 60
                DS   $2                  ; 1ee7 32
                LR   J,W                 ; 1ee8 1e
                BT   6,A1f10             ; 1ee9 86 26
                LR   A,KL                ; 1eeb 01
;                BT   0,-80               ; 1eec 80 b0
				db   $80,$b0
                db   $2d                 
                DS   $8                  ; 1eef 38
                LR   A,KL                ; 1ef0 01
                LR   A,KU                ; 1ef1 00
                LR   A,QU                ; 1ef2 02
                LR   P0,Q                ; 1ef3 0d
                LR   A,QL                ; 1ef4 03
                LR   Q,DC                ; 1ef5 0e
A1ef6:          LR   KU,A                ; 1ef6 04   this is data
                LR   DC,Q                ; 1ef7 0f
                LR   KL,A                ; 1ef8 05
                LR   A,KL                ; 1ef9 01
                LR   QU,A                ; 1efa 06
                LR   P,K                 ; 1efb 09
                LR   QL,A                ; 1efc 07
                LR   P,K                 ; 1efd 09
                LR   K,P                 ; 1efe 08
                LR   P,K                 ; 1eff 09
                LR   P,K                 ; 1f00 09
                LR   P,K                 ; 1f01 09
                LR   A,IS                ; 1f02 0a
                LR   P,K                 ; 1f03 09
                LR   DC,Q                ; 1f04 0f
                LR   P,K                 ; 1f05 09
                BF   $4,A1f1b            ; 1f06 94 14
                LR   A,KU                ; 1f08 00
A1f09:          LR   A,IS                ; 1f09 0a     this is data
                LR   A,KL                ; 1f0a 01
                LR   IS,A                ; 1f0b 0b
                LR   A,QL                ; 1f0c 03
                SR   1                   ; 1f0d 12
A1f0e:          LR   KU,A                ; 1f0e 04     this is data
                SL   1                   ; 1f0f 13
A1f10:          LR   KL,A                ; 1f10 05   this is data
                LR   DC,H                ; 1f11 10
                LR   QU,A                ; 1f12 06
                LR   IS,A                ; 1f13 0b
                LR   QL,A                ; 1f14 07
                LR   IS,A                ; 1f15 0b
                LR   K,P                 ; 1f16 08
                LR   DC,H                ; 1f17 10
                LR   P,K                 ; 1f18 09
                LR   DC,H                ; 1f19 10
                LR   A,IS                ; 1f1a 0a
A1f1b:          LR   QU,A                ; 1f1b 06     this is data
                LR   DC,Q                ; 1f1c 0f
                LR   QU,A                ; 1f1d 06
                BF   $3,A1f25            ; 1f1e 93 06
                LR   A,KU                ; 1f20 00
                LR   A,IS                ; 1f21 0a
                LR   A,KL                ; 1f22 01
                LR   QU,A                ; 1f23 06
                LR   A,QU                ; 1f24 02
A1f25:          LR   H,DC                ; 1f25 11       this is data
                LR   KU,A                ; 1f26 04
                SL   1                   ; 1f27 13
A1f28:          LR   KL,A                ; 1f28 05      this is data
                LR   DC,H                ; 1f29 10
                LR   QU,A                ; 1f2a 06
                LR   QU,A                ; 1f2b 06
                LR   QL,A                ; 1f2c 07
                LR   QU,A                ; 1f2d 06
                LR   K,P                 ; 1f2e 08
                LR   DC,H                ; 1f2f 10
                LR   P,K                 ; 1f30 09
                LR   DC,H                ; 1f31 10
                LR   A,IS                ; 1f32 0a
                LR   QU,A                ; 1f33 06
                LR   DC,Q                ; 1f34 0f
                LR   QU,A                ; 1f35 06
                BF   $3,A1f3d            ; 1f36 93 06
                LR   A,KU                ; 1f38 00
                LR   A,IS                ; 1f39 0a
                LR   A,KL                ; 1f3a 01
                LR   IS,A                ; 1f3b 0b
                LR   A,QU                ; 1f3c 02
A1f3d:          LR   H,DC                ; 1f3d 11   this is data
                LR   A,QL                ; 1f3e 03
                SR   1                   ; 1f3f 12
                LR   KL,A                ; 1f40 05
                LR   QU,A                ; 1f41 06
                LR   QU,A                ; 1f42 06
                LR   IS,A                ; 1f43 0b
                LR   QL,A                ; 1f44 07
                LR   IS,A                ; 1f45 0b
A1f46:          LR   K,P                 ; 1f46 08   this is data
                LR   QU,A                ; 1f47 06
                LR   P,K                 ; 1f48 09
A1f49:          LR   QU,A                ; 1f49 06   this is data
                LR   A,IS                ; 1f4a 0a
                LR   QU,A                ; 1f4b 06
                LR   DC,Q                ; 1f4c 0f
                LR   QU,A                ; 1f4d 06
;                BF   $3,6                ; 1f4e 93 06
				db   $93,$06

;The following is a table that contains some addresses and data. There are three such tables, at 1d50, 1f50 and 1fed.

A1f50:          LR   J,W                 ; 1f50 1e  this is data - address $1ef0 / get object # 00
                NS   $0                  ; 1f51 f0
                LR   A,KU                ; 1f52 00
                INC                      ; 1f53 1f
                LI   $03                 ; 1f54 20 03
                INC                      ; 1f56 1f
                DS   $8                  ; 1f57 38
                LR   KU,A                ; 1f58 04
                INC                      ; 1f59 1f
                LR   K,P                 ; 1f5a 08
                LR   A,QU                ; 1f5b 02
                db   $ff                 
                LR   A,KL                ; 1f5d 01
                BT   0,A1f62             ; 1f5e 80 03
                AS   $0                  ; 1f60 c0
                INC                      ; 1f61 1f
A1f62:          NS   $8                  ; 1f62 f8   this is data
                db   $ff                 
                db   $ff                 
                INS  10                  ; 1f65 aa
                LR   $5,A                ; 1f66 55
                db   $ff                 
                db   $ff                 
                INC                      ; 1f69 1f
                NS   $8                  ; 1f6a f8
                LR   A,QL                ; 1f6b 03
                AS   $0                  ; 1f6c c0
                LR   A,KL                ; 1f6d 01
                BT   0,0                 ; 1f6e 80 00
                LR   A,KU                ; 1f70 00
A1f71:          LR   A,KL                ; 1f71 01         this is data
                BT   0,A1ef6             ; 1f72 80 83
                AS   $1                  ; 1f74 c1
                LR   A,$7                ; 1f75 47
                XS   $2                  ; 1f76 e2
                db   $2f                 
                NS   $4                  ; 1f78 f4
                INC                      ; 1f79 1f
                NS   $8                  ; 1f7a f8
                LIS  $5                  ; 1f7b 75
                INS  14                  ; 1f7c ae
                db   $df                 
                NS   $b                  ; 1f7e fb
                LIS  $5                  ; 1f7f 75
                INS  14                  ; 1f80 ae
                INC                      ; 1f81 1f
                NS   $8                  ; 1f82 f8
                db   $2f                 
                NS   $4                  ; 1f84 f4
                LR   A,$7                ; 1f85 47
                XS   $2                  ; 1f86 e2
                BT   3,A1f49             ; 1f87 83 c1
                LR   A,KL                ; 1f89 01
                BT   0,0                 ; 1f8a 80 00
                LR   A,KU                ; 1f8c 00
A1f8d:          LR   A,QU                ; 1f8d 02          ;object properties for future Gladiator
                LR   A,KL                ; 1f8e 01
                XS   $8                  ; 1f8f e8
                LISU 0                   ; 1f90 60
                BF   $0,0                ; 1f91 90 00
                PI   $0148               ; 1f93 28 01 48
                AS   $4                  ; 1f96 c4
                ASD  $0                  ; 1f97 d0
                LR   A,KU                ; 1f98 00
A1f99:          LR   Q,DC                ; 1f99 0e        This is data
                LR   A,$2                ; 1f9a 42
                ASD  $8                  ; 1f9b d8
                LR   A,$0                ; 1f9c 40
                db   $df                 
                LIS  $1                  ; 1f9e 71
                LR   A,IS                ; 1f9f 0a
                LR   A,$2                ; 1fa0 42
                LM                       ; 1fa1 16
                XM                       ; 1fa2 8c
                db   $5f                 
                LR   (IS)+,A             ; 1fa4 5d
                LR   A,IS                ; 1fa5 0a
                LR   A,$2                ; 1fa6 42
                db   $a2                 
                XM                       ; 1fa8 8c
                OUTS 15                  ; 1fa9 bf
                LR   (IS)+,A             ; 1faa 5d
                PK                       ; 1fab 0c
                
                LR   KU,A                ; 1fac 04
                BF   $4,A1ffa            ; 1fad 94 4c
                OUTS 0                   ; 1faf b0
                LR   A,KU                ; 1fb0 00
                DS   $0                  ; 1fb1 30
                LR   A,$1                ; 1fb2 41
                DCI  $8c30               ; 1fb3 2a 8c 30
                LR   A,KU                ; 1fb6 00
                LR   P,K                 ; 1fb7 09
                LR   A,KL                ; 1fb8 01
                AS   $8                  ; 1fb9 c8
                DS   $5                  ; 1fba 35
                LR   DC,H                ; 1fbb 10
                LR   A,KU                ; 1fbc 00
                LR   P,K                 ; 1fbd 09
                LR   A,KL                ; 1fbe 01
                AS   $8                  ; 1fbf c8
                XS   $0                  ; 1fc0 e0
                LR   DC,H                ; 1fc1 10
                LR   A,KU                ; 1fc2 00
                PI   $016c               ; 1fc3 28 01 6c
                LR   $8,A                ; 1fc6 58
                LIS  $0                  ; 1fc7 70
                LR   A,KU                ; 1fc8 00
                PK                       ; 1fc9 0c
                
                LR   A,$4                ; 1fca 44
                OI   $cc                 ; 1fcb 22 cc
                ASD  $0                  ; 1fcd d0
                LR   A,KU                ; 1fce 00
                LR   A,QU                ; 1fcf 02
                LR   A,KL                ; 1fd0 01
                AS   $8                  ; 1fd1 c8
                LISU 0                   ; 1fd2 60
                LR   DC,H                ; 1fd3 10
                LR   A,KU                ; 1fd4 00
                LR   A,QU                ; 1fd5 02
                LR   A,KL                ; 1fd6 01
                AS   $8                  ; 1fd7 c8
                BT   0,A1fe9             ; 1fd8 80 10
                LR   A,KU                ; 1fda 00
                LR   QL,A                ; 1fdb 07
                LR   A,KL                ; 1fdc 01
                DS   $0                  ; 1fdd 30
                XDC                      ; 1fde 2c
                LR   DC,Q                ; 1fdf 0f
                db   $3f                 
                LR   QL,A                ; 1fe1 07
                LR   A,KL                ; 1fe2 01
;                BT   0,44                ; 1fe3 80 2c
				db   $80,$2c
                LR   DC,Q                ; 1fe5 0f
                db   $3f                 
                DS   $0                  ; 1fe7 30
                LR   A,$1                ; 1fe8 41
A1fe9:          XM                       ; 1fe9 8c
                AM                       ; 1fea 88
                OUTS 0                   ; 1feb b0
                LR   A,KU                ; 1fec 00

;The following is a table that contains some addresses and data. There are three such tables, at 1d50, 1f50 and 1fed.

A1fed:          PK                       ; 1fed 0c ;address $0c98; get object data from 00

                BF   $8,0                ; 1fee 98 00
                PK                       ; 1ff0 0c
                
                INS  12                  ; 1ff1 ac
                LR   A,QL                ; 1ff2 03
                PK                       ; 1ff3 0c
                
                AS   $0                  ; 1ff4 c0
                LR   KU,A                ; 1ff5 04
                PK                       ; 1ff6 0c
                
                ASD  $4                  ; 1ff7 d4
                LR   A,QU                ; 1ff8 02
                db   $ff                 
A1ffa:          LR   A,KU                ; 1ffa 00
                LR   A,KU                ; 1ffb 00
                LR   A,KU                ; 1ffc 00
                LR   A,KU                ; 1ffd 00
                LR   A,KU                ; 1ffe 00
                LR   A,KU                ; 1fff 00
