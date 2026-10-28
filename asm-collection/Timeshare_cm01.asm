;Timeshare - CM01

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;12/20/2011

org $1000

				db	$aa,$55              ; cart signature
				
				db	$06                  ; title background color
				db  $00,$00,$00,$07,$01,$29,$0b,$21,$19,$11,$09,$0b,$00,$00,$00	;name ___TIMESHARE___
                
START:
                DI                       ; 1012 1a
                PI   $41c8               ; 1013 28 41 c8
                LIS  $0                  ; 1016 70
                OUTS 1                   ; 1017 b1			;keyboard rows/joystick buttons
                DCI  $0fde               ; 1018 2a 0f de
                ST                       ; 101b 17
                LR   $6,A                ; 101c 56
                DCI  $08f2               ; 101d 2a 08 f2
                ST                       ; 1020 17
                ST                       ; 1021 17
                ST                       ; 1022 17
                ST                       ; 1023 17
                ST                       ; 1024 17
                ST                       ; 1025 17
                DCI  $0fca               ; 1026 2a 0f ca
                ST                       ; 1029 17
                DCI  $0fea               ; 102a 2a 0f ea	;video mode
                LI   $44                 ; 102d 20 44
                ST                       ; 102f 17
                LI   $40                 ; 1030 20 40
                DCI  $08f7               ; 1032 2a 08 f7
                ST                       ; 1035 17
                LI   $28                 ; 1036 20 28
                LR   $7,A                ; 1038 57
                
                DCI  $0ffa               ; 1039 2a 0f fa
                LIS  $2                  ; 103c 72
                ST                       ; 103d 17
                LIS  $1                  ; 103e 71
                ST                       ; 103f 17
                
                LI   $17                 ; 1040 20 17	;interrupt handler at $17cc
                ST                       ; 1042 17
                LI   $cc                 ; 1043 20 cc
                ST                       ; 1045 17
                
                LI   $17                 ; 1046 20 17
                ST                       ; 1048 17
                LI   $cc                 ; 1049 20 cc
                ST                       ; 104b 17
                
                LIS  $e                  ; 104c 7e
                LR   $5,A                ; 104d 55
A104e:          PI   A12dd               ; 104e 28 12 dd
                DS   $5                  ; 1051 35
                BF   $4,A104e            ; 1052 94 fb
                PI   A12dd               ; 1054 28 12 dd
                DCI  A1112               ; 1057 2a 11 12
                PI   A1103               ; 105a 28 11 03
                
                DCI  $0820               ; 105d 2a 08 20	;copies 96 bytes from $176C to $820
                XDC                      ; 1060 2c
                DCI  A176c               ; 1061 2a 17 6c
                LI   $60                 ; 1064 20 60
                LR   $1,A                ; 1066 51
A1067:          LM                       ; 1067 16
                XDC                      ; 1068 2c
                ST                       ; 1069 17
                XDC                      ; 106a 2c
                DS   $1                  ; 106b 31
                BF   $4,A1067            ; 106c 94 fa
                
                LIS  $1                  ; 106e 71
                LR   $8,A                ; 106f 58
                PI   A1395               ; 1070 28 13 95
                LIS  $f                  ; 1073 7f
                LR   $8,A                ; 1074 58
                DCI  $0fe5               ; 1075 2a 0f e5
                LI   $e8                 ; 1078 20 e8
                ST                       ; 107a 17
                LISU 7                   ; 107b 67
                LISL 6                   ; 107c 6e
                LIS  $a                  ; 107d 7a
                LR   (IS),A              ; 107e 5c
                PI   A1271               ; 107f 28 12 71
A1082:          PI   $4501               ; 1082 28 45 01
                PI   A13c0               ; 1085 28 13 c0
                PI   A1133               ; 1088 28 11 33
                BT   4,A10d0             ; 108b 84 44
                PI   A12f8               ; 108d 28 12 f8
                BF   $0,A1082            ; 1090 90 f1		;branch always
                
A1092:          LIS  $1                  ; 1092 71
                NS   $7                  ; 1093 f7
                BT   4,A109d             ; 1094 84 08
                DCI  $0feb               ; 1096 2a 0f eb
                LIS  $0                  ; 1099 70
                ST                       ; 109a 17
                BF   $0,A10d0            ; 109b 90 34		;branch always
                
A109d:          DCI  A150b               ; 109d 2a 15 0b
                LIS  $c                  ; 10a0 7c
                SL   4                   ; 10a1 15
                NS   $2                  ; 10a2 f2
                BT   4,A10b0             ; 10a3 84 0c
                LI   $24                 ; 10a5 20 24
                ADC                      ; 10a7 8e
                LIS  $4                  ; 10a8 74
                SL   4                   ; 10a9 15
                NS   $2                  ; 10aa f2
                BT   4,A10b0             ; 10ab 84 04
                LI   $24                 ; 10ad 20 24
                ADC                      ; 10af 8e
A10b0:          LI   $3f                 ; 10b0 20 3f
                NS   $2                  ; 10b2 f2
                ADC                      ; 10b3 8e
                LM                       ; 10b4 16
                DCI  $0fcb               ; 10b5 2a 0f cb
                ST                       ; 10b8 17
                LIS  $1                  ; 10b9 71
                LR   J,W                 ; 10ba 1e
                DI                       ; 10bb 1a
                XS   $7                  ; 10bc e7
                LR   $7,A                ; 10bd 57
                LR   W,J                 ; 10be 1d
                LIS  $1                  ; 10bf 71
                SL   4                   ; 10c0 15
                NS   $7                  ; 10c1 f7
                BT   4,A10d0             ; 10c2 84 0d
                LISU 2                   ; 10c4 62
                LISL 4                   ; 10c5 6c
                DCI  $0fcb               ; 10c6 2a 0f cb
                LM                       ; 10c9 16
                SL   1                   ; 10ca 13
                SR   1                   ; 10cb 12
                LR   (IS),A              ; 10cc 5c
                PI   A1115               ; 10cd 28 11 15
A10d0:          LIS  $2                  ; 10d0 72
                NS   $7                  ; 10d1 f7
                BT   4,A10dd             ; 10d2 84 0a
                LISU 3                   ; 10d4 63
                LISL 2                   ; 10d5 6a
                LR   A,(IS)              ; 10d6 4c
                LISU 2                   ; 10d7 62
                LISL 4                   ; 10d8 6c
                LR   (IS),A              ; 10d9 5c
                PI   A1115               ; 10da 28 11 15
A10dd:          DCI  $0feb               ; 10dd 2a 0f eb
                LIS  $4                  ; 10e0 74
                XM                       ; 10e1 8c
                BT   4,A10eb             ; 10e2 84 08
                LR   J,W                 ; 10e4 1e
                DI                       ; 10e5 1a
                LR   A,$7                ; 10e6 47
                OI   $20                 ; 10e7 22 20
                LR   $7,A                ; 10e9 57
                LR   W,J                 ; 10ea 1d
A10eb:          BF   $0,A1082            ; 10eb 90 96	;branch always

A10ed:          DI                       ; 10ed 1a
                LI   $11                 ; 10ee 20 11
                OUTS 12                  ; 10f0 bc		;3853 interrupt addr vector hi
                LI   $f3                 ; 10f1 20 f3
                OUTS 13                  ; 10f3 bd		;3853 interrupt addr vector lo
                LISU 3                   ; 10f4 63
                LISL 0                   ; 10f5 68
                LIS  $0                  ; 10f6 70
                LR   (IS),A              ; 10f7 5c
                LISL 4                   ; 10f8 6c
                LR   (IS),A              ; 10f9 5c
                LIS  $3                  ; 10fa 73
                COM                      ; 10fb 18
                NS   $7                  ; 10fc f7
                LR   $7,A                ; 10fd 57
                LIS  $1                  ; 10fe 71
                OUTS 14                  ; 10ff be		;3853 interrupt control
                EI                       ; 1100 1b
                LR   J,W                 ; 1101 1e
                POP                      ; 1102 1c
                
A1103:          LR   K,P                 ; 1103 08			;copy 4 bytes in DC0 to $FA0
                XDC                      ; 1104 2c
                DCI  $0fa0               ; 1105 2a 0f a0
                LISU 2                   ; 1108 62
                LISL 4                   ; 1109 6c
                LIS  $4                  ; 110a 74
                LR   (IS),A              ; 110b 5c
                JMP  $43ce               ; 110c 29 43 ce	;COPYMEMTOMEM2 - copy (IS) bytes from DC1 to DC0
                
A110f:			db	$04,$01,$0d          ;4 bytes copied, but only 3 bytes?
A1112:			db	$04,$02,$0d
                
A1115:          LR   K,P                 ; 1115 08
                PI   $40a9               ; 1116 28 40 a9	;PUSHK
                PI   A142d               ; 1119 28 14 2d
                LIS  $c                  ; 111c 7c
                LISU 7                   ; 111d 67
                LISL 6                   ; 111e 6e
                LR   (IS),A              ; 111f 5c
                DCI  $0870               ; 1120 2a 08 70
                LIS  $0                  ; 1123 70
                ST                       ; 1124 17
                LR   A,$6                ; 1125 46
                CI   $17                 ; 1126 25 17
                BT   2,A112f             ; 1128 82 06
                LIS  $0                  ; 112a 70
                LR   $6,A                ; 112b 56
                PI   A1395               ; 112c 28 13 95
A112f:          PI   $40bc               ; 112f 28 40 bc	;POPK
                PK                       ; 1132 0c
                
A1133:          LR   K,P                 ; 1133 08
                DCI  $0fde               ; 1134 2a 0f de
                LM                       ; 1137 16
                OUTS 1                   ; 1138 b1			;keyboard rows/joystick buttons
                LI   $ef                 ; 1139 20 ef
                DCI  $0fea               ; 113b 2a 0f ea	;video mode
                LR   H,DC                ; 113e 11
                LR   J,W                 ; 113f 1e
                DI                       ; 1140 1a
                NM                       ; 1141 8a
                LR   DC,H                ; 1142 10
                ST                       ; 1143 17
                DCI  $08f7               ; 1144 2a 08 f7
                ST                       ; 1147 17
                LR   W,J                 ; 1148 1d
                LIS  $0                  ; 1149 70
                DCI  $0fdd               ; 114a 2a 0f dd
                ST                       ; 114d 17
                OUTS 0                   ; 114e b0			;keyboard columns/joystick pots
                LR   $2,A                ; 114f 52
                LIS  $4                  ; 1150 74
                LR   $3,A                ; 1151 53
                LIS  $8                  ; 1152 78
                LR   $4,A                ; 1153 54
                INS  1                   ; 1154 a1
                SL   4                   ; 1155 15
                SR   1                   ; 1156 12
A1157:          SL   1                   ; 1157 13
                BT   1,A1164             ; 1158 81 0b
                LR   $1,A                ; 115a 51
                LIS  $0                  ; 115b 70
                XS   $2                  ; 115c e2
                BF   $4,A11a6            ; 115d 94 48
                LI   $20                 ; 115f 20 20
                AS   $3                  ; 1161 c3
                LR   $2,A                ; 1162 52
                LR   A,$1                ; 1163 41
A1164:          DS   $3                  ; 1164 33
                BF   $4,A1157            ; 1165 94 f1
                DCI  $0fdd               ; 1167 2a 0f dd
                LIS  $1                  ; 116a 71
                ST                       ; 116b 17
                OUTS 0                   ; 116c b0			;keyboard columns/joystick pots
                DCI  $0fea               ; 116d 2a 0f ea	;video mode
                LIS  $1                  ; 1170 71
                SL   4                   ; 1171 15
                LR   H,DC                ; 1172 11
                LR   J,W                 ; 1173 1e
                DI                       ; 1174 1a
                OM                       ; 1175 8b
                LR   DC,H                ; 1176 10
                ST                       ; 1177 17
                DCI  $08f7               ; 1178 2a 08 f7
                ST                       ; 117b 17
                LR   W,J                 ; 117c 1d
A117d:          LIS  $4                  ; 117d 74
                LR   $3,A                ; 117e 53
                INS  1                   ; 117f a1
                SL   4                   ; 1180 15
                SR   1                   ; 1181 12
A1182:          SL   1                   ; 1182 13
                BF   $1,A11aa            ; 1183 91 26
A1185:          DS   $3                  ; 1185 33
                BF   $4,A1182            ; 1186 94 fb
                DCI  $0fdd               ; 1188 2a 0f dd
                LM                       ; 118b 16
                SL   1                   ; 118c 13
                DS   $4                  ; 118d 34
                DCI  $0fdd               ; 118e 2a 0f dd
                ST                       ; 1191 17
                OUTS 0                   ; 1192 b0			;keyboard columns/joystick pots
                BF   $4,A117d            ; 1193 94 e9
                LR   A,$2                ; 1195 42
                NI   $3f                 ; 1196 21 3f
                BT   4,A11a1             ; 1198 84 08
                DCI  $0feb               ; 119a 2a 0f eb
                CM                       ; 119d 8d
                BF   $4,A11a1            ; 119e 94 02
                PK                       ; 11a0 0c
                
A11a1:          DCI  $0feb               ; 11a1 2a 0f eb
                ST                       ; 11a4 17
                PK                       ; 11a5 0c
                
A11a6:          NI   $00                 ; 11a6 21 00
                LR   $2,A                ; 11a8 52
                PK                       ; 11a9 0c
                
A11aa:          LR   $1,A                ; 11aa 51
                LR   A,$4                ; 11ab 44
                SL   1                   ; 11ac 13
                SL   1                   ; 11ad 13
                AS   $3                  ; 11ae c3
                CI   $10                 ; 11af 25 10	;Q
                BT   4,A11c5             ; 11b1 84 13
                CI   $1c                 ; 11b3 25 1c	;G
                LIS  $8                  ; 11b5 78
                BT   4,A11c6             ; 11b6 84 0f
                LI   $3f                 ; 11b8 20 3f
                NS   $2                  ; 11ba f2
                BF   $4,A11a6            ; 11bb 94 ea
                LR   A,$4                ; 11bd 44
                AI   $ff                 ; 11be 24 ff
                SL   1                   ; 11c0 13
                SL   1                   ; 11c1 13
                AS   $3                  ; 11c2 c3
                BF   $0,A11c7            ; 11c3 90 03		;branch always
                
A11c5:          LIS  $4                  ; 11c5 74
A11c6:          SL   4                   ; 11c6 15
A11c7:          XS   $2                  ; 11c7 e2
                LR   $2,A                ; 11c8 52
                LR   A,$1                ; 11c9 41
                BF   $0,A1185            ; 11ca 90 ba		;branch always
                
A11cc:          DI                       ; 11cc 1a
                LR   J,W                 ; 11cd 1e
                LIS  $0                  ; 11ce 70
                OUTS 14                  ; 11cf be			;3853 interrupt control
                LI   $60                 ; 11d0 20 60
                OUTS 1                   ; 11d2 b1			;keyboard rows/joystick buttons
                DCI  $0fea               ; 11d3 2a 0f ea	;video mode
                LIS  $8                  ; 11d6 78
                COM                      ; 11d7 18
                NM                       ; 11d8 8a
                DCI  $0fea               ; 11d9 2a 0f ea	;video mode
                ST                       ; 11dc 17
                DCI  $08f7               ; 11dd 2a 08 f7
                ST                       ; 11e0 17
                POP                      ; 11e1 1c
                
A11e2:          LR   K,P                 ; 11e2 08
A11e3:          BF   $0,A11e3            ; 11e3 90 ff		;branch always

                LIS  $0                  ; 11e5 70
                OUTS 1                   ; 11e6 b1			;keyboard rows/joystick buttons
                INS  1                   ; 11e7 a1
                NI   $20                 ; 11e8 21 20
                BT   4,A11ec             ; 11ea 84 01
A11ec:          LR   A,$3                ; 11ec 43
                SL   4                   ; 11ed 15
                SL   1                   ; 11ee 13
                OUTS 1                   ; 11ef b1			;keyboard rows/joystick buttons
                EI                       ; 11f0 1b
                LR   J,W                 ; 11f1 1e
                PK                       ; 11f2 0c
                
                LR   $0,A                ; 11f3 50		;3853 interrupt vector points here
                LR   J,W                 ; 11f4 1e
                LR   A,IS                ; 11f5 0a
                LISU 4                   ; 11f6 64
                LISL 0                   ; 11f7 68
                LR   (IS)+,A             ; 11f8 5d
                LR   A,QU                ; 11f9 02
                LR   (IS)+,A             ; 11fa 5d
                LR   A,QL                ; 11fb 03
                LR   (IS)+,A             ; 11fc 5d
                LR   Q,DC                ; 11fd 0e
                LI   $bf                 ; 11fe 20 bf
                NS   $7                  ; 1200 f7
                LR   $7,A                ; 1201 57
                INS  1                   ; 1202 a1
                NI   $40                 ; 1203 21 40
                XS   $7                  ; 1205 e7
                LR   $7,A                ; 1206 57
                LISU 3                   ; 1207 63
                LISL 4                   ; 1208 6c
                DS   (IS)                ; 1209 3c
                BF   $1,A1240            ; 120a 91 35
                LIS  $1                  ; 120c 71
                BT   4,A1219             ; 120d 84 0b
                LIS  $9                  ; 120f 79
                XS   (IS)+               ; 1210 ed
                BT   4,A1219             ; 1211 84 07
                LR   A,(IS)+             ; 1213 4d
                LR   (IS)-,A             ; 1214 5e
                SR   1                   ; 1215 12
                LR   (IS)+,A             ; 1216 5d
                LIS  $1                  ; 1217 71
                NS   (IS)+               ; 1218 fd
A1219:          DCI  $0fde               ; 1219 2a 0f de
                SL   4                   ; 121c 15
                SL   1                   ; 121d 13
                NS   $7                  ; 121e f7
                ST                       ; 121f 17
                OUTS 1                   ; 1220 b1			;keyboard rows/joystick buttons
                LISL 0                   ; 1221 68
                DS   (IS)                ; 1222 3c
                BF   $1,A1253            ; 1223 91 2f
                LIS  $0                  ; 1225 70
                XS   (IS)+               ; 1226 ed
                BT   4,A125d             ; 1227 84 35
                LR   A,(IS)              ; 1229 4c
                SR   1                   ; 122a 12
                LR   (IS),A              ; 122b 5c
                LR   A,$7                ; 122c 47
                NI   $40                 ; 122d 21 40
                SL   1                   ; 122f 13
                XS   (IS)                ; 1230 ec
                LR   (IS),A              ; 1231 5c
A1232:          LISU 4                   ; 1232 64
                LISL 2                   ; 1233 6a
                LR   DC,Q                ; 1234 0f
                LR   A,(IS)-             ; 1235 4e
                LR   QL,A                ; 1236 07
                LR   A,(IS)-             ; 1237 4e
                LR   QU,A                ; 1238 06
                LR   A,(IS)              ; 1239 4c
                LR   IS,A                ; 123a 0b
                LR   A,$0                ; 123b 40
                LR   W,J                 ; 123c 1d
                EI                       ; 123d 1b
                LR   J,W                 ; 123e 1e
                POP                      ; 123f 1c
                
A1240:          LIS  $1                  ; 1240 71
                NS   $7                  ; 1241 f7
                LIS  $0                  ; 1242 70
                BT   4,A124f             ; 1243 84 0b
                LIS  $1                  ; 1245 71
                XS   $7                  ; 1246 e7
                LR   $7,A                ; 1247 57
                LR   A,(IS)+             ; 1248 4d
                DCI  $0fcb               ; 1249 2a 0f cb
                LM                       ; 124c 16
                LR   (IS)-,A             ; 124d 5e
                LIS  $a                  ; 124e 7a
A124f:          LR   (IS),A              ; 124f 5c
                LIS  $1                  ; 1250 71
                BF   $0,A1219            ; 1251 90 c7		;branch always
                
A1253:          LISL 0                   ; 1253 68
                LR   A,$7                ; 1254 47
                SL   1                   ; 1255 13
                LIS  $0                  ; 1256 70
                BF   $1,A125a            ; 1257 91 02
                LIS  $9                  ; 1259 79
A125a:          LR   (IS),A              ; 125a 5c
                BF   $0,A1232            ; 125b 90 d6		;branch always
                
A125d:          LR   A,$7                ; 125d 47
                SL   1                   ; 125e 13
                BT   1,A126b             ; 125f 81 0b
                LR   A,(IS)+             ; 1261 4d
                SL   1                   ; 1262 13
                SR   1                   ; 1263 12
                LR   (IS)+,A             ; 1264 5d
                LR   A,$7                ; 1265 47
                OI   $02                 ; 1266 22 02
                LR   $7,A                ; 1268 57
                BF   $0,A1232            ; 1269 90 c8		;branch always
                
A126b:          LIS  $0                  ; 126b 70
                LR   (IS)-,A             ; 126c 5e
                LIS  $1                  ; 126d 71
                LR   (IS),A              ; 126e 5c
                BF   $0,A1232            ; 126f 90 c2		;branch always
                
A1271:          LR   K,P                 ; 1271 08
                PI   $40a9               ; 1272 28 40 a9	;PUSHK
                PI   A11cc               ; 1275 28 11 cc
                PI   $4501               ; 1278 28 45 01
                PI   A13c0               ; 127b 28 13 c0
                PI   A10ed               ; 127e 28 10 ed
                DCI  $0fea               ; 1281 2a 0f ea	;video mode
                LIS  $4                  ; 1284 74
                COM                      ; 1285 18
                NM                       ; 1286 8a
                DCI  $08f7               ; 1287 2a 08 f7
                ST                       ; 128a 17
                LI   $11                 ; 128b 20 11
                OUTS 12                  ; 128d bc			;3853 interrupt addr vector hi
                LI   $e5                 ; 128e 20 e5
                OUTS 13                  ; 1290 bd			;3853 interrupt addr vector lo
                LI   $40                 ; 1291 20 40
                OUTS 1                   ; 1293 b1			;keyboard rows/joystick buttons
                LIS  $2                  ; 1294 72
                LR   $4,A                ; 1295 54
A1296:          DCI  $0fa0               ; 1296 2a 0f a0
                LR   A,$4                ; 1299 44
                COM                      ; 129a 18
                INC                      ; 129b 1f
                AI   $02                 ; 129c 24 02
                ADC                      ; 129e 8e
                LM                       ; 129f 16
                LR   $2,A                ; 12a0 52
                PI   A12c5               ; 12a1 28 12 c5
                DS   $4                  ; 12a4 34
                BT   1,A1296             ; 12a5 81 f0
                PI   $424a               ; 12a7 28 42 4a
                PI   $424a               ; 12aa 28 42 4a
                PI   A13c0               ; 12ad 28 13 c0
                PI   $4501               ; 12b0 28 45 01
                PI   A13c0               ; 12b3 28 13 c0
                DCI  $0fea               ; 12b6 2a 0f ea	;video mode
                LM                       ; 12b9 16
                DCI  $08f7               ; 12ba 2a 08 f7
                ST                       ; 12bd 17
                PI   A10ed               ; 12be 28 10 ed
                PI   $40bc               ; 12c1 28 40 bc	;POPK
                PK                       ; 12c4 0c
                
A12c5:          LR   K,P                 ; 12c5 08
                PI   $40a9               ; 12c6 28 40 a9	;PUSHK
                LIS  $8                  ; 12c9 78
                LR   $1,A                ; 12ca 51
A12cb:          LR   A,$2                ; 12cb 42
                SR   4                   ; 12cc 14
                SL   1                   ; 12cd 13
                SR   4                   ; 12ce 14
                LR   $3,A                ; 12cf 53
                LR   A,$2                ; 12d0 42
                SL   1                   ; 12d1 13
                LR   $2,A                ; 12d2 52
                PI   A11e2               ; 12d3 28 11 e2
                DS   $1                  ; 12d6 31
                BF   $4,A12cb            ; 12d7 94 f3
                PI   $40bc               ; 12d9 28 40 bc	;POPK
                PK                       ; 12dc 0c
                
A12dd:          LR   K,P                 ; 12dd 08
A12de:          DCI  A1740               ; 12de 2a 17 40
                LR   A,$5                ; 12e1 45
                SL   1                   ; 12e2 13
                ADC                      ; 12e3 8e
                LM                       ; 12e4 16
                LR   QU,A                ; 12e5 06
                LM                       ; 12e6 16
                LR   QL,A                ; 12e7 07
                LR   DC,Q                ; 12e8 0f
                LI   $12                 ; 12e9 20 12
                LR   $1,A                ; 12eb 51
                LIS  $0                  ; 12ec 70
A12ed:          ST                       ; 12ed 17
                ST                       ; 12ee 17
                ST                       ; 12ef 17
                ST                       ; 12f0 17
                ST                       ; 12f1 17
                ST                       ; 12f2 17
                ST                       ; 12f3 17
                DS   $1                  ; 12f4 31
                BF   $4,A12ed            ; 12f5 94 f7
                PK                       ; 12f7 0c
                
A12f8:          LR   K,P                 ; 12f8 08
                LR   A,$2                ; 12f9 42
                LISU 4                   ; 12fa 64
                LISL 4                   ; 12fb 6c
                CI   $e2                 ; 12fc 25 e2
                BF   $4,A1310            ; 12fe 94 11
                DCI  A110f               ; 1300 2a 11 0f
A1303:          PI   $40a9               ; 1303 28 40 a9	;PUSHK
                PI   A1103               ; 1306 28 11 03
                PI   A1271               ; 1309 28 12 71
                PI   $40bc               ; 130c 28 40 bc	;POPK
                PK                       ; 130f 0c
                
A1310:          CI   $c7                 ; 1310 25 c7
                BF   $4,A1319            ; 1312 94 06
                DCI  A1112               ; 1314 2a 11 12
                BF   $0,A1303            ; 1317 90 eb		;branch always
                
A1319:          CI   $44                 ; 1319 25 44
                BF   $4,A1325            ; 131b 94 09
                LI   $df                 ; 131d 20 df
                LR   J,W                 ; 131f 1e
                DI                       ; 1320 1a
                NS   $7                  ; 1321 f7
                LR   $7,A                ; 1322 57
                LR   W,J                 ; 1323 1d
                PK                       ; 1324 0c
                
A1325:          DCI  $0fca               ; 1325 2a 0f ca
                LR   H,DC                ; 1328 11
                CI   $cf                 ; 1329 25 cf
                BF   $4,A1338            ; 132b 94 0c
                LM                       ; 132d 16
                INC                      ; 132e 1f
                NI   $07                 ; 132f 21 07
                LR   DC,H                ; 1331 10
                ST                       ; 1332 17
                DCI  $08f5               ; 1333 2a 08 f5
                ST                       ; 1336 17
                PK                       ; 1337 0c
                
A1338:          CI   $c4                 ; 1338 25 c4
                BF   $4,A1344            ; 133a 94 09
                LIS  $4                  ; 133c 74
                COM                      ; 133d 18
                LR   J,W                 ; 133e 1e
                DI                       ; 133f 1a
                NS   $7                  ; 1340 f7
                LR   $7,A                ; 1341 57
                LR   W,J                 ; 1342 1d
                PK                       ; 1343 0c
                
A1344:          CI   $c8                 ; 1344 25 c8
                BF   $4,A1353            ; 1346 94 0c
                LR   J,W                 ; 1348 1e
                DI                       ; 1349 1a
                LR   A,$7                ; 134a 47
                OI   $04                 ; 134b 22 04
                LR   $7,A                ; 134d 57
                LR   W,J                 ; 134e 1d
                PK                       ; 134f 0c
                
A1350:          JMP  A1092               ; 1350 29 10 92
A1353:          CI   $d4                 ; 1353 25 d4
                BF   $4,A137f            ; 1355 94 29
                LIS  $0                  ; 1357 70
                AS   $5                  ; 1358 c5
                AS   $8                  ; 1359 c8
                CI   $0e                 ; 135a 25 0e
                BT   2,A1360             ; 135c 82 03
                AI   $f1                 ; 135e 24 f1
A1360:          LR   $2,A                ; 1360 52
                LIS  $e                  ; 1361 7e
                LR   $5,A                ; 1362 55
A1363:          LIS  $3                  ; 1363 73
                LR   $3,A                ; 1364 53
                PI   $4501               ; 1365 28 45 01
                PI   A13c0               ; 1368 28 13 c0
A136b:          PI   A12dd               ; 136b 28 12 dd
                DS   $5                  ; 136e 35
                BF   $1,A1376            ; 136f 91 06
                DS   $3                  ; 1371 33
                BF   $4,A136b            ; 1372 94 f8
                BF   $0,A1363            ; 1374 90 ee		;branch always
                
A1376:          LR   A,$2                ; 1376 42
                LR   $5,A                ; 1377 55
                LIS  $f                  ; 1378 7f
                LR   $8,A                ; 1379 58
                LIS  $0                  ; 137a 70
                LR   $6,A                ; 137b 56
                JMP  A1082               ; 137c 29 10 82
A137f:          CI   $c6                 ; 137f 25 c6
                BF   $4,A138a            ; 1381 94 08
                LI   $ef                 ; 1383 20 ef
                DI                       ; 1385 1a
                NS   $7                  ; 1386 f7
                LR   $7,A                ; 1387 57
                LR   W,J                 ; 1388 1d
                PK                       ; 1389 0c
                
A138a:          CI   $d2                 ; 138a 25 d2
                BF   $4,A1350            ; 138c 94 c3
                DI                       ; 138e 1a
                LR   A,$7                ; 138f 47
                OI   $10                 ; 1390 22 10
                LR   $7,A                ; 1392 57
                LR   W,J                 ; 1393 1d
                PK                       ; 1394 0c
                
A1395:          LR   K,P                 ; 1395 08
A1396:          LR   A,$5                ; 1396 45
                INC                      ; 1397 1f
                CI   $0e                 ; 1398 25 0e
                BT   2,A139d             ; 139a 82 02
                LIS  $0                  ; 139c 70
A139d:          LR   $5,A                ; 139d 55
                DS   $8                  ; 139e 38
                BF   $4,A13bd            ; 139f 94 1d
                LIS  $1                  ; 13a1 71
                LR   $8,A                ; 13a2 58
                DCI  $0fb0               ; 13a3 2a 0f b0
                XDC                      ; 13a6 2c
                DCI  $0851               ; 13a7 2a 08 51
                LIS  $f                  ; 13aa 7f
                LR   $1,A                ; 13ab 51
A13ac:          LM                       ; 13ac 16
                AI   $f4                 ; 13ad 24 f4
                CI   $2e                 ; 13af 25 2e
                BF   $2,A13b5            ; 13b1 92 03
                AI   $b4                 ; 13b3 24 b4
A13b5:          XDC                      ; 13b5 2c
                ST                       ; 13b6 17
                XDC                      ; 13b7 2c
                DS   $1                  ; 13b8 31
                BF   $4,A13ac            ; 13b9 94 f2
                LIS  $1                  ; 13bb 71
                LR   $8,A                ; 13bc 58
A13bd:          JMP  A12de               ; 13bd 29 12 de
A13c0:          LR   K,P                 ; 13c0 08
                DCI  $0832               ; 13c1 2a 08 32
                LIS  $2                  ; 13c4 72
                LR   $1,A                ; 13c5 51
                LIS  $7                  ; 13c6 77
A13c7:          ST                       ; 13c7 17
                ST                       ; 13c8 17
                ST                       ; 13c9 17
                ST                       ; 13ca 17
                ST                       ; 13cb 17
                ST                       ; 13cc 17
                ST                       ; 13cd 17
                DS   $1                  ; 13ce 31
                BF   $4,A13c7            ; 13cf 94 f7
                DCI  $0802               ; 13d1 2a 08 02
                LIS  $2                  ; 13d4 72
                LR   $1,A                ; 13d5 51
                LIS  $0                  ; 13d6 70
A13d7:          ST                       ; 13d7 17
                ST                       ; 13d8 17
                ST                       ; 13d9 17
                ST                       ; 13da 17
                ST                       ; 13db 17
                ST                       ; 13dc 17
                ST                       ; 13dd 17
                LI   $80                 ; 13de 20 80
                DS   $1                  ; 13e0 31
                BF   $4,A13d7            ; 13e1 94 f5
                LIS  $e                  ; 13e3 7e
                LR   $1,A                ; 13e4 51
                DCI  $0812               ; 13e5 2a 08 12
                XDC                      ; 13e8 2c
                DCI  $175e               ; 13e9 2a 17 5e
A13ec:          LM                       ; 13ec 16
                XDC                      ; 13ed 2c
                ST                       ; 13ee 17
                XDC                      ; 13ef 2c
                DS   $1                  ; 13f0 31
                BF   $4,A13ec            ; 13f1 94 fa
                DCI  $0851               ; 13f3 2a 08 51
                XDC                      ; 13f6 2c
                DCI  $0fb0               ; 13f7 2a 0f b0
                LIS  $f                  ; 13fa 7f
                LR   $1,A                ; 13fb 51
A13fc:          LM                       ; 13fc 16
                XDC                      ; 13fd 2c
                ST                       ; 13fe 17
                XDC                      ; 13ff 2c
                DS   $1                  ; 1400 31
                BF   $4,A13fc            ; 1401 94 fa
                LR   A,$8                ; 1403 48
                COM                      ; 1404 18
                LR   $1,A                ; 1405 51
                SL   1                   ; 1406 13
                AS   $1                  ; 1407 c1
                SL   1                   ; 1408 13
                SL   1                   ; 1409 13
                AI   $f8                 ; 140a 24 f8
                DCI  $0850               ; 140c 2a 08 50
                ST                       ; 140f 17
                LR   A,$6                ; 1410 46
                SL   1                   ; 1411 13
                AS   $6                  ; 1412 c6
                SL   1                   ; 1413 13
                AI   $17                 ; 1414 24 17
                DCI  $0840               ; 1416 2a 08 40
                ST                       ; 1419 17
                LISU 7                   ; 141a 67
                LISL 6                   ; 141b 6e
                DS   (IS)                ; 141c 3c
                BF   $4,A142a            ; 141d 94 0c
                LIS  $c                  ; 141f 7c
                LR   (IS),A              ; 1420 5c
                DCI  $0870               ; 1421 2a 08 70
                LR   H,DC                ; 1424 11
                LIS  $8                  ; 1425 78
                SL   4                   ; 1426 15
                XM                       ; 1427 8c
                LR   DC,H                ; 1428 10
                ST                       ; 1429 17
A142a:          JMP  $424e               ; 142a 29 42 4e
A142d:          LR   K,P                 ; 142d 08
                LI   $7d                 ; 142e 20 7d
                LR   J,W                 ; 1430 1e
                DI                       ; 1431 1a
                NS   $7                  ; 1432 f7
                LR   $7,A                ; 1433 57
                LR   W,J                 ; 1434 1d
                LISU 2                   ; 1435 62
                LISL 4                   ; 1436 6c
                LIS  $0                  ; 1437 70
                XS   (IS)                ; 1438 ec
                BF   $4,A143c            ; 1439 94 02
                PK                       ; 143b 0c
                
A143c:          CI   $0a                 ; 143c 25 0a	;R
                BF   $4,A1443            ; 143e 94 04
                JMP  A1396               ; 1440 29 13 96
A1443:          CI   $0d                 ; 1443 25 0d	;8
                BF   $4,A144a            ; 1445 94 04
                LIS  $0                  ; 1447 70
                LR   $6,A                ; 1448 56
                PK                       ; 1449 0c
                
A144a:          CI   $07                 ; 144a 25 07	;division
                BF   $4,A144f            ; 144c 94 02
                PK                       ; 144e 0c
                
A144f:          CI   $08                 ; 144f 25 08	;T
                BF   $4,A145c            ; 1451 94 0a
                DS   $6                  ; 1453 36
                BT   1,A1459             ; 1454 81 04
                LI   $17                 ; 1456 20 17
                LR   $6,A                ; 1458 56
A1459:          LIS  $0                  ; 1459 70
                BF   $0,A1476            ; 145a 90 1b		;branch always
                
A145c:          CI   $5f                 ; 145c 25 5f
                BT   2,A1462             ; 145e 82 03
                AI   $e0                 ; 1460 24 e0
A1462:          AI   $e0                 ; 1462 24 e0
                BT   1,A1476             ; 1464 81 11
                AI   $40                 ; 1466 24 40
                LR   $1,A                ; 1468 51
                LIS  $4                  ; 1469 74
                NS   $7                  ; 146a f7
                BF   $4,A146e            ; 146b 94 02
                PK                       ; 146d 0c
                
A146e:          LIS  $8                  ; 146e 78
                SL   4                   ; 146f 15
                LR   J,W                 ; 1470 1e
                DI                       ; 1471 1a
                XS   $7                  ; 1472 e7
                LR   $7,A                ; 1473 57
                LR   W,J                 ; 1474 1d
                LR   A,$1                ; 1475 41
A1476:          DCI  A1580               ; 1476 2a 15 80
                ADC                      ; 1479 8e
                SL   1                   ; 147a 13
                ADC                      ; 147b 8e
                ADC                      ; 147c 8e
                ADC                      ; 147d 8e
                XDC                      ; 147e 2c
                LR   A,$6                ; 147f 46
                SL   1                   ; 1480 13
                AS   $6                  ; 1481 c6
                LR   $1,A                ; 1482 51
                SR   1                   ; 1483 12
                SR   1                   ; 1484 12
                LR   $2,A                ; 1485 52
                SL   1                   ; 1486 13
                SL   1                   ; 1487 13
                COM                      ; 1488 18
                INC                      ; 1489 1f
                AS   $1                  ; 148a c1
                LR   $4,A                ; 148b 54
                DCI  A1740               ; 148c 2a 17 40
                LR   A,$5                ; 148f 45
                SL   1                   ; 1490 13
                ADC                      ; 1491 8e
                LM                       ; 1492 16
                LR   QU,A                ; 1493 06
                LM                       ; 1494 16
                LR   QL,A                ; 1495 07
                LR   DC,Q                ; 1496 0f
                LR   A,$2                ; 1497 42
                ADC                      ; 1498 8e
                LR   H,DC                ; 1499 11
                DCI  A1578               ; 149a 2a 15 78
                LR   A,$4                ; 149d 44
                SL   1                   ; 149e 13
                ADC                      ; 149f 8e
                LM                       ; 14a0 16
                LR   $2,A                ; 14a1 52
                LM                       ; 14a2 16
                LR   $3,A                ; 14a3 53
                XDC                      ; 14a4 2c
                LR   Q,DC                ; 14a5 0e
                LISU 5                   ; 14a6 65
                LISL 0                   ; 14a7 68
                LIS  $8                  ; 14a8 78
                SL   4                   ; 14a9 15
                NS   $7                  ; 14aa f7
                LI   $f8                 ; 14ab 20 f8
                BF   $4,A14b0            ; 14ad 94 02
                LIS  $0                  ; 14af 70
A14b0:          LR   $1,A                ; 14b0 51
A14b1:          LR   A,$1                ; 14b1 41
                XM                       ; 14b2 8c
                LR   (IS)+,A             ; 14b3 5d
                BR7  A14b1               ; 14b4 8f fc
                LR   A,$4                ; 14b6 44
                INC                      ; 14b7 1f
                LR   $1,A                ; 14b8 51
A14b9:          LISL 0                   ; 14b9 68
                DS   $1                  ; 14ba 31
                BT   4,A14c5             ; 14bb 84 09
A14bd:          LR   A,(IS)              ; 14bd 4c
                SR   1                   ; 14be 12
                SR   1                   ; 14bf 12
                LR   (IS)+,A             ; 14c0 5d
                BR7  A14bd               ; 14c1 8f fb
                BF   $0,A14b9            ; 14c3 90 f5		;branch always
                
A14c5:          LISL 0                   ; 14c5 68
                LR   DC,Q                ; 14c6 0f
                XDC                      ; 14c7 2c
                LR   DC,H                ; 14c8 10
A14c9:          LR   Q,DC                ; 14c9 0e
                LR   A,$2                ; 14ca 42
                NM                       ; 14cb 8a
                XS   (IS)+               ; 14cc ed
                LR   DC,Q                ; 14cd 0f
                ST                       ; 14ce 17
                LI   $11                 ; 14cf 20 11
                ADC                      ; 14d1 8e
                BR7  A14c9               ; 14d2 8f f6
                LISL 0                   ; 14d4 68
                XDC                      ; 14d5 2c
                LIS  $8                  ; 14d6 78
                SL   4                   ; 14d7 15
                NS   $7                  ; 14d8 f7
                LI   $f8                 ; 14d9 20 f8
                BF   $4,A14de            ; 14db 94 02
                LIS  $0                  ; 14dd 70
A14de:          LR   $1,A                ; 14de 51
A14df:          LR   A,$1                ; 14df 41
                XM                       ; 14e0 8c
                LR   (IS)+,A             ; 14e1 5d
                BR7  A14df               ; 14e2 8f fc
A14e4:          LISL 0                   ; 14e4 68
                LIS  $4                  ; 14e5 74
                COM                      ; 14e6 18
                AS   $4                  ; 14e7 c4
                COM                      ; 14e8 18
                LR   $1,A                ; 14e9 51
A14ea:          LISL 0                   ; 14ea 68
A14eb:          LR   A,(IS)              ; 14eb 4c
                SL   1                   ; 14ec 13
                SL   1                   ; 14ed 13
                LR   (IS)+,A             ; 14ee 5d
                BR7  A14eb               ; 14ef 8f fb
                DS   $1                  ; 14f1 31
                BF   $4,A14ea            ; 14f2 94 f7
                LISL 0                   ; 14f4 68
                LR   DC,H                ; 14f5 10
                LM                       ; 14f6 16
A14f7:          LR   Q,DC                ; 14f7 0e
A14f8:          LR   A,$3                ; 14f8 43
                NM                       ; 14f9 8a
                XS   (IS)+               ; 14fa ed
                LR   DC,Q                ; 14fb 0f
                ST                       ; 14fc 17
                LI   $11                 ; 14fd 20 11
                ADC                      ; 14ff 8e
                BR7  A14f7               ; 1500 8f f6
                LISU 2                   ; 1502 62
                LISL 4                   ; 1503 6c
                LIS  $8                  ; 1504 78
                XS   (IS)                ; 1505 ec
                BT   4,A150b             ; 1506 84 04
                LR   A,$6                ; 1508 46
                INC                      ; 1509 1f
                LR   $6,A                ; 150a 56
A150b:          PK                       ; 150b 0c

				db $D1,$53,$D8,$1B,$D7,$44,$C3,$DB
				db $C5,$C6,$56,$00,$D2,$47,$42,$20
				db $D4,$48,$4E,$8D,$59,$CA,$4D,$00
				db $55,$4B,$CC,$27,$C9,$CF,$50,$BB
				db $41,$5A,$BF,$88,$A5,$B4,$B2,$FF
				db $B7,$35,$33,$DD,$B8,$36,$2B,$00
				db $39,$2D,$BD,$A0,$3C,$AF,$AC,$8D
				db $BE,$28,$3A,$00,$21,$A9,$24,$AA
				db $22,$A3,$C0,$A6,$2E,$B1,$30,$88
				db $11,$93,$18,$80,$17,$84,$03,$00
				db $05,$06,$16,$00,$12,$87,$82,$A0
				db $14,$88,$8E,$8D,$99,$0A,$8D,$00
				db $95,$8B,$0C,$5C,$09,$0F,$90,$5F
				db $81,$9A,$DE,$08
				
A1578:			db   $03,$ff,$c0,$ff,$f0,$3f,$fc,$0f

A1580:			db	$00,$00,$00,$00,$00,$00,$00,$60
				db $60,$60,$60,$00,$60,$60,$50,$50
				db $00,$00,$00,$00,$00,$00,$50,$D8
				db $00,$D8,$50,$00,$70,$A8,$A0,$70
				db $28,$A8,$70,$C0,$C8,$10,$20,$40
				db $98,$18,$40,$A0,$A0,$40,$A8,$90
				db $68,$10,$20,$40,$00,$00,$00,$00
				db $08,$10,$20,$20,$20,$10,$08,$80
				db $40,$20,$20,$20,$40,$80,$00,$20
				db $70,$F8,$70,$20,$00,$00,$20,$20
				db $F8,$20,$20,$00,$00,$00,$00,$60
				db $60,$20,$40,$00,$00,$00,$F8,$00
				db $00,$00,$00,$00,$00,$00,$00,$60
				db $60,$00,$08,$10,$20,$40,$80,$00
				db $30,$48,$48,$48,$48,$48,$30,$20
				db $60,$20,$20,$20,$20,$70,$70,$88
				db $08,$70,$80,$80,$F8,$70,$88,$08
				db $30,$08,$88,$70,$10,$30,$50,$90
				db $F8,$10,$10,$F8,$80,$F0,$08,$08
				db $88,$70,$30,$40,$80,$F0,$88,$88
				db $70,$F8,$08,$10,$20,$40,$40,$40
				db $70,$88,$88,$70,$88,$88,$70,$70
				db $88,$88,$78,$08,$10,$60,$00,$60
				db $60,$00,$60,$60,$00,$60,$60,$00
				db $60,$60,$20,$40,$08,$10,$20,$40
				db $20,$10,$08,$00,$00,$F8,$00,$F8
				db $00,$00,$80,$40,$20,$10,$20,$40
				db $80,$70,$88,$10,$20,$20,$00,$20
				db $70,$88,$08,$68,$A8,$B0,$60,$70
				db $88,$88,$F8,$88,$88,$88,$F0,$48
				db $48,$70,$48,$48,$F0,$70,$88,$80
				db $80,$80,$88,$70,$F0,$48,$48,$48
				db $48,$48,$F0,$F8,$80,$80,$F0,$80
				db $80,$F8,$F8,$80,$80,$F0,$80,$80
				db $80,$78,$80,$80,$B8,$88,$88,$70
				db $88,$88,$88,$F8,$88,$88,$88,$70
				db $20,$20,$20,$20,$20,$70,$08,$08
				db $08,$08,$08,$88,$70,$88,$90,$A0
				db $C0,$A0,$90,$88,$80,$80,$80,$80
				db $80,$80,$F8,$88,$D8,$A8,$A8,$88
				db $88,$88,$88,$C8,$A8,$98,$88,$88
				db $88,$F8,$88,$88,$88,$88,$88,$F8
				db $F0,$88,$88,$F0,$80,$80,$80,$70
				db $88,$88,$88,$A8,$90,$68,$F0,$88
				db $88,$F0,$A0,$90,$88,$70,$88,$40
				db $20,$10,$88,$70,$F8,$20,$20,$20
				db $20,$20,$20,$88,$88,$88,$88,$88
				db $88,$70,$88,$88,$88,$50,$50,$20
				db $20,$88,$88,$88,$A8,$A8,$A8,$50
				db $88,$88,$50,$20,$50,$88,$88,$88
				db $88,$50,$20,$20,$20,$20,$F8,$08
				db $10,$20,$40,$80,$F8,$38,$20,$20
				db $20,$20,$20,$38,$00,$80,$40,$20
				db $10,$08,$00,$E0,$20,$20,$20,$20
				db $20,$E0,$20,$50,$88,$00,$00,$00
				db $00,$00,$00,$00,$00,$00,$00,$F8

A1740:			db	$1b,$00,$1a,$00,$19,$00,$18,$00
				db	$0f,$00,$0e,$00,$0d,$00,$0c,$00
				db	$1b,$80,$1a,$80,$19,$80,$18,$80
				db	$0e,$80,$0d,$80,$0c,$80
				
A175E:			db	$fa,$f9,$f8,$ef,$ee,$ed,$ec,$fb
				db	$fa,$f9,$f8,$ee,$ed,$ec	
                
                ;next 96 bytes copied to $820
A176c:			db   $41,$52,$52,$52,$52,$52,$52,$52
				db   $52,$52,$52,$52,$52,$52,$52,$52
				db   $01,$07,$07,$07,$07,$07,$07,$07
				db   $07,$07,$07,$07,$07,$07,$07,$07
				db   $17,$17,$17,$17,$17,$17,$17,$17
				db   $17,$17,$17,$17,$17,$17,$17,$17
				db   $38,$30,$3c,$48,$54,$60,$6c,$78
				db   $84,$90,$9c,$a8,$b4,$c0,$cc,$d8                
                db   $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
                db   $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff           
                db   $00,$01,$02,$03,$04,$05,$06,$07
                db	 $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
                                
                LISU 0                   ; 17cc 60		;interrupt handler
                LR   A,KU                ; 17cd 00
                XS   $0                  ; 17ce e0
                NS   $b                  ; 17cf fb
                LR   A,KL                ; 17d0 01
                LR   QL,A                ; 17d1 07
                
				db   $00,$00,$00,$00,$00,$00,$00,$00
				db   $00,$00,$00,$00,$00,$00,$00,$00
				db   $00,$00,$00,$00,$00,$00,$00,$00
				db   $00,$00,$00,$00,$00,$00,$00,$00
				db   $00,$00,$00,$00,$00,$00,$00,$00
				db   $00,$00,$00,$00,$00,$00
