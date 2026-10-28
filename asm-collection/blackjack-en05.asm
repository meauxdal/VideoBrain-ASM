;Blackjack - EN05

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/29/2010

org $1000

				db   $aa,$55			;cart signature
				db   $01				;background color
				db   $00,$00,$00
NAME:			db   $2d,$27,$11,$31,$15,$17,$11,$31,$15,$00,$00,$00	;name - BLACKJACK
                
START:          PI   $40d0               ; 1012 28 40 d0
                PI   $22db               ; 1015 28 22 db
                DCI  $08f5               ; 1018 2a 08 f5
                LIS  $2                  ; 101b 72
                ST                       ; 101c 17
                PI   $4762               ; 101d 28 47 62
                LISU 3                   ; 1020 63
                LISL 4                   ; 1021 6c
                LIS  $1                  ; 1022 71
A1023:          LR   (IS)-,A             ; 1023 5e
                BR7  A1023               ; 1024 8f fe
                LR   A,IS                ; 1026 0a
                AI   $08                 ; 1027 24 08
                LR   IS,A                ; 1029 0b
A102a:          CI   $37                 ; 102a 25 37
                LIS  $0                  ; 102c 70
                BF   $4,A1023            ; 102d 94 f5
                DCI  A1703               ; 102f 2a 17 03
                XDC                      ; 1032 2c
                DCI  $0c20               ; 1033 2a 0c 20
                LIS  $f                  ; 1036 7f
                LR   $0,A                ; 1037 50
                PI   A1397               ; 1038 28 13 97
                DCI  A173f               ; 103b 2a 17 3f
                LIS  $5                  ; 103e 75
                LR   $0,A                ; 103f 50
                PI   A134f               ; 1040 28 13 4f
A1043:          LISU 2                   ; 1043 62
                LISL 4                   ; 1044 6c
A1045:          LIS  $2                  ; 1045 72
                LR   (IS),A              ; 1046 5c
                PI   $43d6               ; 1047 28 43 d6
                LR   A,$5                ; 104a 45
                INC                      ; 104b 1f
                LR   $5,A                ; 104c 55
                NOP                      ; 104d 2b
                NOP                      ; 104e 2b
                DCI  A134a               ; 104f 2a 13 4a
A1052:          LIS  $0                  ; 1052 70
                XM                       ; 1053 8c
                BT   4,A1043             ; 1054 84 ee
                XS   $8                  ; 1056 e8
                BF   $4,A1052            ; 1057 94 fa
                LISU 3                   ; 1059 63
                LISL 2                   ; 105a 6a
                LR   A,$8                ; 105b 48
                NI   $10                 ; 105c 21 10
                BF   $4,A1061            ; 105e 94 02
                LR   (IS),A              ; 1060 5c
A1061:          LISU 5                   ; 1061 65
                LIS  $5                  ; 1062 75
                LR   (IS)-,A             ; 1063 5e
                LISL 0                   ; 1064 68
                LR   (IS)-,A             ; 1065 5e
                DCI  $0f00               ; 1066 2a 0f 00
                LI   $11                 ; 1069 20 11
A106b:          ST                       ; 106b 17
                AI   $10                 ; 106c 24 10
                CI   $50                 ; 106e 25 50
                BT   1,A106b             ; 1070 81 fa
                AI   $c1                 ; 1072 24 c1
                CI   $1e                 ; 1074 25 1e
                BF   $4,A106b            ; 1076 94 f4
                DCI  A1762               ; 1078 2a 17 62
                LI   $70                 ; 107b 20 70
                LR   $0,A                ; 107d 50
                XDC                      ; 107e 2c
                DCI  $0f50               ; 107f 2a 0f 50
A1082:          XDC                      ; 1082 2c
                LM                       ; 1083 16
                XDC                      ; 1084 2c
                ST                       ; 1085 17
                DS   $0                  ; 1086 30
                BF   $4,A1082            ; 1087 94 fa
                DCI  $0f50               ; 1089 2a 0f 50
                LI   $10                 ; 108c 20 10
                LR   $0,A                ; 108e 50
                PI   A134f               ; 108f 28 13 4f
A1092:          PI   A136c               ; 1092 28 13 6c
                DCI  A1712               ; 1095 2a 17 12
                PI   A158a               ; 1098 28 15 8a
                LIS  $0                  ; 109b 70
                LR   $2,A                ; 109c 52
A109d:          PI   $41c8               ; 109d 28 41 c8
                PI   $4795               ; 10a0 28 47 95
                AS   $5                  ; 10a3 c5
                NI   $1f                 ; 10a4 21 1f
                INC                      ; 10a6 1f
                LR   $1,A                ; 10a7 51
                DCI  $0f00               ; 10a8 2a 0f 00
                LR   Q,DC                ; 10ab 0e
                ADC                      ; 10ac 8e
                LR   H,DC                ; 10ad 11
A10ae:          LM                       ; 10ae 16
                LR   $0,A                ; 10af 50
                LR   DC,Q                ; 10b0 0f
                LM                       ; 10b1 16
                LR   DC,H                ; 10b2 10
                ST                       ; 10b3 17
                LR   DC,Q                ; 10b4 0f
                LR   A,$0                ; 10b5 40
                ST                       ; 10b6 17
                LR   Q,DC                ; 10b7 0e
                LR   A,QL                ; 10b8 03
                XI   $34                 ; 10b9 23 34
                BT   4,A109d             ; 10bb 84 e1
                LR   A,$b                ; 10bd 4b
                AS   $1                  ; 10be c1
                CI   $33                 ; 10bf 25 33
                BT   1,A10c5             ; 10c1 81 03
                AI   $cd                 ; 10c3 24 cd
A10c5:          LR   $b,A                ; 10c5 5b
                LR   DC,H                ; 10c6 10
                DS   $2                  ; 10c7 32
                BF   $4,A10ae            ; 10c8 94 e5
                PI   A1547               ; 10ca 28 15 47
                PI   A1547               ; 10cd 28 15 47
                LIS  $0                  ; 10d0 70
                LR   $5,A                ; 10d1 55
A10d2:          DCI  A171b               ; 10d2 2a 17 1b
                PI   A158a               ; 10d5 28 15 8a
                LISU 3                   ; 10d8 63
                LISL 0                   ; 10d9 68
A10da:          LR   A,(IS)              ; 10da 4c
                NI   $01                 ; 10db 21 01
                BT   4,A10e1             ; 10dd 84 03
                LIS  $3                  ; 10df 73
                LR   (IS),A              ; 10e0 5c
A10e1:          LR   A,(IS)+             ; 10e1 4d
                LR   A,(IS)+             ; 10e2 4d
                LR   A,IS                ; 10e3 0a
                XI   $1c                 ; 10e4 23 1c
                BF   $4,A10da            ; 10e6 94 f3
                LR   (IS),A              ; 10e8 5c
                LR   $6,A                ; 10e9 56
A10ea:          PI   A1595               ; 10ea 28 15 95
                PI   A16c6               ; 10ed 28 16 c6
                LISU 3                   ; 10f0 63
                XI   $00                 ; 10f1 23 00
                BT   4,A110a             ; 10f3 84 16
                BT   1,A1100             ; 10f5 81 0a
                DCI  A16c4               ; 10f7 2a 16 c4
                PI   A165a               ; 10fa 28 16 5a
                LISL 2                   ; 10fd 6a
                BF   $0,A1107            ; 10fe 90 08
A1100:          DCI  A16bc               ; 1100 2a 16 bc
                PI   A165a               ; 1103 28 16 5a
                LISL 0                   ; 1106 68
A1107:          LIS  $1                  ; 1107 71
                NS   (IS)                ; 1108 fc
                LR   (IS),A              ; 1109 5c
A110a:          LISL 0                   ; 110a 68
                LIS  $2                  ; 110b 72
                NS   (IS)                ; 110c fc
                BT   4,A111d             ; 110d 84 0f
                LIS  $0                  ; 110f 70
                LR   $a,A                ; 1110 5a
                PI   A17d2               ; 1111 28 17 d2
                LISU 4                   ; 1114 64
                LISL 0                   ; 1115 68
                LR   $0,A                ; 1116 50
                PI   A13f3               ; 1117 28 13 f3
                PI   $41c8               ; 111a 28 41 c8
A111d:          LISU 3                   ; 111d 63
                LISL 2                   ; 111e 6a
                LIS  $2                  ; 111f 72
                NS   (IS)                ; 1120 fc
                BT   4,A1130             ; 1121 84 0e
                LIS  $2                  ; 1123 72
                LR   $a,A                ; 1124 5a
                PI   A17d2               ; 1125 28 17 d2
                LISU 4                   ; 1128 64
                LISL 2                   ; 1129 6a
                LR   $0,A                ; 112a 50
                PI   A13f3               ; 112b 28 13 f3
                BF   $0,A10ea            ; 112e 90 bb
A1130:          LIS  $2                  ; 1130 72
                LISL 0                   ; 1131 68
                NS   (IS)                ; 1132 fc
                BF   $4,A10ea            ; 1133 94 b6
                LR   A,(IS)              ; 1135 4c
                LISL 2                   ; 1136 6a
                AS   (IS)                ; 1137 cc
                BF   $4,A1145            ; 1138 94 0c
                DCI  A1736               ; 113a 2a 17 36
                PI   A158a               ; 113d 28 15 8a
A1140:          PI   $41c8               ; 1140 28 41 c8
                BF   $0,A1140            ; 1143 90 fc
A1145:          PI   A1390               ; 1145 28 13 90
                LIS  $2                  ; 1148 72
                LR   $4,A                ; 1149 54
                LISU 6                   ; 114a 66
                LISL 4                   ; 114b 6c
                LIS  $0                  ; 114c 70
A114d:          LR   (IS)-,A             ; 114d 5e
                BR7  A114d               ; 114e 8f fe
A1150:          LISL 0                   ; 1150 68
                PI   A1423               ; 1151 28 14 23
                LISL 2                   ; 1154 6a
                PI   A1423               ; 1155 28 14 23
                LISL 4                   ; 1158 6c
                PI   A1423               ; 1159 28 14 23
                DS   $4                  ; 115c 34
                BF   $4,A1150            ; 115d 94 f2
A115f:          LISU 3                   ; 115f 63
                LISL 0                   ; 1160 68
A1161:          LR   A,IS                ; 1161 0a
                LR   $7,A                ; 1162 57
                LIS  $1                  ; 1163 71
                NS   (IS)                ; 1164 fc
                BT   4,A11d2             ; 1165 84 6c
                LI   $1c                 ; 1167 20 1c
                NS   (IS)                ; 1169 fc
                BF   $4,A11d2            ; 116a 94 67
                LISL 4                   ; 116c 6c
                PI   A1558               ; 116d 28 15 58
                LR   A,$7                ; 1170 47
                LR   IS,A                ; 1171 0b
                BT   4,A11ee             ; 1172 84 7b
                PI   A1558               ; 1174 28 15 58
                BF   $4,A119d            ; 1177 94 25
                DCI  NAME               ; 1179 2a 10 06
				
                PI   A158a               ; 117c 28 15 8a
                PI   $41c8               ; 117f 28 41 c8
                PI   A1547               ; 1182 28 15 47
                LR   A,$7                ; 1185 47
                LR   IS,A                ; 1186 0b
                LISU 4                   ; 1187 64
                LR   A,(IS)+             ; 1188 4d
                LR   QU,A                ; 1189 06
                LR   A,(IS)-             ; 118a 4e
                LR   QL,A                ; 118b 07
                PI   A1565               ; 118c 28 15 65
                LR   A,(IS)+             ; 118f 4d
                LR   A,QL                ; 1190 03
                AI   $66                 ; 1191 24 66
                ASD  (IS)                ; 1193 dc
                LR   (IS)-,A             ; 1194 5e
                LR   A,QU                ; 1195 02
                LNK                      ; 1196 19
                AI   $66                 ; 1197 24 66
                ASD  (IS)                ; 1199 dc
                LR   (IS),A              ; 119a 5c
                BF   $0,A11cf            ; 119b 90 33
A119d:          LISU 6                   ; 119d 66
                LR   A,(IS)              ; 119e 4c
                NI   $1f                 ; 119f 21 1f
                CI   $15                 ; 11a1 25 15
                BF   $1,A11de            ; 11a3 91 3a
                LISU 3                   ; 11a5 63
                LIS  $2                  ; 11a6 72
                NS   (IS)                ; 11a7 fc
                BT   4,A11d2             ; 11a8 84 29
                LISL 4                   ; 11aa 6c
                LIS  $2                  ; 11ab 72
                NS   (IS)                ; 11ac fc
                BT   4,A11d2             ; 11ad 84 24
                LISU 6                   ; 11af 66
                LR   A,(IS)              ; 11b0 4c
                NI   $1f                 ; 11b1 21 1f
                LR   $0,A                ; 11b3 50
                LR   A,$7                ; 11b4 47
                LR   IS,A                ; 11b5 0b
                LISU 3                   ; 11b6 63
                LI   $20                 ; 11b7 20 20
                NS   (IS)                ; 11b9 fc
                LISU 6                   ; 11ba 66
                BT   4,A11c5             ; 11bb 84 09
                LR   A,(IS)              ; 11bd 4c
                NI   $1f                 ; 11be 21 1f
                CI   $0b                 ; 11c0 25 0b
                BF   $1,A11c6            ; 11c2 91 03
                LIS  $a                  ; 11c4 7a
A11c5:          AS   (IS)                ; 11c5 cc
A11c6:          NI   $1f                 ; 11c6 21 1f
                COM                      ; 11c8 18
                INC                      ; 11c9 1f
                AS   $0                  ; 11ca c0
                BT   4,A11f3             ; 11cb 84 27
                BT   1,A11ea             ; 11cd 81 1c
A11cf:          LIS  $8                  ; 11cf 78
                BF   $0,A11f4            ; 11d0 90 23
A11d2:          PI   $41c8               ; 11d2 28 41 c8
                LR   A,$7                ; 11d5 47
                LR   IS,A                ; 11d6 0b
                CI   $1a                 ; 11d7 25 1a
                LISL 2                   ; 11d9 6a
                BT   4,A1255             ; 11da 84 7a
                BF   $0,A1161            ; 11dc 90 84
A11de:          DCI  A1736               ; 11de 2a 17 36
                PI   A158a               ; 11e1 28 15 8a
                PI   $41c8               ; 11e4 28 41 c8
                PI   A1547               ; 11e7 28 15 47
A11ea:          LI   $10                 ; 11ea 20 10
                BF   $0,A11f4            ; 11ec 90 07
A11ee:          PI   A1558               ; 11ee 28 15 58
                BF   $4,A11ea            ; 11f1 94 f8
A11f3:          LIS  $4                  ; 11f3 74
A11f4:          LR   $0,A                ; 11f4 50
                LR   A,$7                ; 11f5 47
                LR   IS,A                ; 11f6 0b
                LR   A,$0                ; 11f7 40
                AS   (IS)                ; 11f8 cc
                LR   (IS),A              ; 11f9 5c
                LIS  $8                  ; 11fa 78
                NS   (IS)                ; 11fb fc
                BF   $4,A122c            ; 11fc 94 2f
                LIS  $4                  ; 11fe 74
                NS   (IS)                ; 11ff fc
                BF   $4,A1246            ; 1200 94 45
                DCI  A16be               ; 1202 2a 16 be
                PI   A165a               ; 1205 28 16 5a
                LISU 4                   ; 1208 64
                LR   A,(IS)              ; 1209 4c
                COM                      ; 120a 18
                LISU 5                   ; 120b 65
                ASD  (IS)                ; 120c dc
                LR   (IS)+,A             ; 120d 5d
                LISU 4                   ; 120e 64
                LR   A,(IS)              ; 120f 4c
                AI   $66                 ; 1210 24 66
                COM                      ; 1212 18
                INC                      ; 1213 1f
                LR   $0,A                ; 1214 50
                NI   $0f                 ; 1215 21 0f
                CI   $0a                 ; 1217 25 0a
                LR   A,$0                ; 1219 40
                BF   $4,A123b            ; 121a 94 20
                AI   $06                 ; 121c 24 06
                CI   $a0                 ; 121e 25 a0
                BF   $4,A123b            ; 1220 94 1a
                LISU 5                   ; 1222 65
                LR   A,(IS)-             ; 1223 4e
                LI   $67                 ; 1224 20 67
                ASD  (IS)                ; 1226 dc
                LR   (IS)+,A             ; 1227 5d
                LISU 4                   ; 1228 64
                LIS  $0                  ; 1229 70
                BF   $0,A123b            ; 122a 90 10
A122c:          DCI  A16b6               ; 122c 2a 16 b6
                PI   A165a               ; 122f 28 16 5a
                LISU 4                   ; 1232 64
                LR   A,(IS)              ; 1233 4c
                LISU 5                   ; 1234 65
                AI   $66                 ; 1235 24 66
                ASD  (IS)                ; 1237 dc
                LR   (IS)+,A             ; 1238 5d
                LISU 4                   ; 1239 64
                LR   A,(IS)              ; 123a 4c
A123b:          LISU 5                   ; 123b 65
                AI   $66                 ; 123c 24 66
                ASD  (IS)                ; 123e dc
                LR   (IS)-,A             ; 123f 5e
                BF   $2,A1246            ; 1240 92 05
                LI   $67                 ; 1242 20 67
                ASD  (IS)                ; 1244 dc
                LR   (IS),A              ; 1245 5c
A1246:          LISU 5                   ; 1246 65
                LR   A,(IS)+             ; 1247 4d
                AS   (IS)-               ; 1248 ce
                BF   $4,A124f            ; 1249 94 05
                BT   2,A124f             ; 124b 82 03
                LISU 3                   ; 124d 63
                LR   (IS),A              ; 124e 5c
A124f:          PI   A1595               ; 124f 28 15 95
                JMP  A11d2               ; 1252 29 11 d2
A1255:          LISL 0                   ; 1255 68
A1256:          LR   A,IS                ; 1256 0a
                LR   $7,A                ; 1257 57
                LIS  $1                  ; 1258 71
                NS   (IS)                ; 1259 fc
                BT   4,A12cf             ; 125a 84 74
                LI   $1e                 ; 125c 20 1e
                NS   (IS)                ; 125e fc
                BF   $4,A12cf            ; 125f 94 6f
                LISU 6                   ; 1261 66
                LR   A,(IS)              ; 1262 4c
                CI   $4a                 ; 1263 25 4a
                BT   4,A126b             ; 1265 84 05
                CI   $4b                 ; 1267 25 4b
                BF   $4,A12bb            ; 1269 94 51
A126b:          LISU 4                   ; 126b 64
                LR   A,(IS)              ; 126c 4c
                AI   $66                 ; 126d 24 66
                ASD  (IS)+               ; 126f dd
                LR   $4,A                ; 1270 54
                LR   A,(IS)              ; 1271 4c
                AI   $66                 ; 1272 24 66
                ASD  (IS)-               ; 1274 de
                LR   $3,A                ; 1275 53
                BF   $2,A127c            ; 1276 92 05
                LI   $67                 ; 1278 20 67
                ASD  $4                  ; 127a d4
                LR   $4,A                ; 127b 54
A127c:          LISU 5                   ; 127c 65
                LR   A,$4                ; 127d 44
                COM                      ; 127e 18
                INC                      ; 127f 1f
                BT   4,A1284             ; 1280 84 03
                BT   1,A12b3             ; 1282 81 30
A1284:          AS   (IS)+               ; 1284 cd
                BF   $1,A12bb            ; 1285 91 35
A1287:          BF   $4,A1293            ; 1287 94 0b
                LR   A,$3                ; 1289 43
                COM                      ; 128a 18
                INC                      ; 128b 1f
                BT   4,A1290             ; 128c 84 03
                BT   1,A12b8             ; 128e 81 29
A1290:          AS   (IS)-               ; 1290 ce
                BF   $1,A12bb            ; 1291 91 29
A1293:          DCI  A172d               ; 1293 2a 17 2d
                PI   A158a               ; 1296 28 15 8a
                LISU 3                   ; 1299 63
                PI   A15d3               ; 129a 28 15 d3
                BT   1,A12bb             ; 129d 81 1d
                LISU 4                   ; 129f 64
                LR   A,$4                ; 12a0 44
                LR   (IS)+,A             ; 12a1 5d
                LR   A,$3                ; 12a2 43
                LR   (IS)-,A             ; 12a3 5e
                LISU 6                   ; 12a4 66
                PI   A1423               ; 12a5 28 14 23
                PI   A1595               ; 12a8 28 15 95
                LR   A,$7                ; 12ab 47
                LR   IS,A                ; 12ac 0b
A12ad:          LIS  $2                  ; 12ad 72
                AS   (IS)                ; 12ae cc
                LR   (IS),A              ; 12af 5c
                JMP  A115f               ; 12b0 29 11 5f
A12b3:          AS   (IS)+               ; 12b3 cd
                BT   1,A12bb             ; 12b4 81 06
                BF   $0,A1287            ; 12b6 90 d0
A12b8:          AS   (IS)-               ; 12b8 ce
                BF   $1,A1293            ; 12b9 91 d9
A12bb:          DCI  A1724               ; 12bb 2a 17 24
                PI   A158a               ; 12be 28 15 8a
                LISU 3                   ; 12c1 63
                PI   A15d3               ; 12c2 28 15 d3
                BT   1,A12ad             ; 12c5 81 e7
                LISU 6                   ; 12c7 66
                PI   A1423               ; 12c8 28 14 23
                LISU 3                   ; 12cb 63
                JMP  A115f               ; 12cc 29 11 5f
A12cf:          LR   A,(IS)+             ; 12cf 4d
                LR   A,(IS)+             ; 12d0 4d
                LR   A,IS                ; 12d1 0a
                CI   $1c                 ; 12d2 25 1c
                BF   $4,A1256            ; 12d4 94 81
                LIS  $2                  ; 12d6 72
                NS   (IS)                ; 12d7 fc
                BF   $4,A1339            ; 12d8 94 60
                LI   $12                 ; 12da 20 12
                LR   KU,A                ; 12dc 04
                LI   $ea                 ; 12dd 20 ea
                LR   KL,A                ; 12df 05
                PI   $40a9               ; 12e0 28 40 a9
                LISU 5                   ; 12e3 65
                LR   A,(IS)              ; 12e4 4c
                LR   $3,A                ; 12e5 53
                LISU 6                   ; 12e6 66
                JMP  A1465               ; 12e7 29 14 65
                DCI  $0ee7               ; 12ea 2a 0e e7
                PI   A158a               ; 12ed 28 15 8a
                PI   A1547               ; 12f0 28 15 47
                LISU 3                   ; 12f3 63
                LISL 0                   ; 12f4 68
                LIS  $1                  ; 12f5 71
                NS   (IS)                ; 12f6 fc
                BT   4,A12fe             ; 12f7 84 06
                LI   $1c                 ; 12f9 20 1c
                NS   (IS)                ; 12fb fc
                BT   4,A1308             ; 12fc 84 0b
A12fe:          LISL 2                   ; 12fe 6a
                LIS  $1                  ; 12ff 71
                NS   (IS)                ; 1300 fc
                BT   4,A1339             ; 1301 84 37
                LI   $1c                 ; 1303 20 1c
                NS   (IS)                ; 1305 fc
                BF   $4,A1339            ; 1306 94 32
A1308:          LISU 6                   ; 1308 66
                LISL 4                   ; 1309 6c
                LR   A,(IS)              ; 130a 4c
                NI   $1f                 ; 130b 21 1f
                CI   $15                 ; 130d 25 15
                BT   1,A1316             ; 130f 81 06
                LIS  $0                  ; 1311 70
                LR   (IS),A              ; 1312 5c
A1313:          LISU 3                   ; 1313 63
                BF   $0,A12ad            ; 1314 90 98
A1316:          CI   $10                 ; 1316 25 10
                BF   $1,A1313            ; 1318 91 fa
                LISU 3                   ; 131a 63
                LI   $20                 ; 131b 20 20
                NS   (IS)                ; 131d fc
                LISU 6                   ; 131e 66
                BT   4,A1331             ; 131f 84 11
                LR   A,(IS)              ; 1321 4c
                NI   $1f                 ; 1322 21 1f
                CI   $07                 ; 1324 25 07
                BT   1,A1331             ; 1326 81 0a
                CI   $0b                 ; 1328 25 0b
                BF   $1,A1331            ; 132a 91 06
                LIS  $a                  ; 132c 7a
                AS   (IS)                ; 132d cc
                LR   (IS),A              ; 132e 5c
                BF   $0,A1313            ; 132f 90 e3
A1331:          PI   A1423               ; 1331 28 14 23
                PI   A1547               ; 1334 28 15 47
                BF   $0,A1308            ; 1337 90 d0
A1339:          LR   A,$5                ; 1339 45
                CI   $28                 ; 133a 25 28
                BT   1,A1347             ; 133c 81 0a
A133e:          PI   A1547               ; 133e 28 15 47
                DS   $2                  ; 1341 32
                BF   $4,A133e            ; 1342 94 fb
                JMP  A1092               ; 1344 29 10 92
A1347:          JMP  A10d2               ; 1347 29 10 d2
A134a:          AI   $34                 ; 134a 24 34
                XI   $33                 ; 134c 23 33
                LR   A,KU                ; 134e 00
A134f:          LR   A,$0                ; 134f 40
                LR   Q,DC                ; 1350 0e
                DCI  $0ffa               ; 1351 2a 0f fa
                ST                       ; 1354 17
                LIS  $0                  ; 1355 70
                ST                       ; 1356 17
                LR   K,P                 ; 1357 08
                PI   $40a9               ; 1358 28 40 a9
                LR   A,QU                ; 135b 02
                ST                       ; 135c 17
                LR   A,QL                ; 135d 03
                ST                       ; 135e 17
                LR   A,QU                ; 135f 02
                ST                       ; 1360 17
                LR   A,QL                ; 1361 03
                ST                       ; 1362 17
                PI   $41c8               ; 1363 28 41 c8
                PI   $424a               ; 1366 28 42 4a
                JMP  A1554               ; 1369 29 15 54
A136c:          DCI  $0c20               ; 136c 2a 0c 20
                LIS  $4                  ; 136f 74
                LR   $1,A                ; 1370 51
A1371:          LR   K,P                 ; 1371 08
                PI   $40a9               ; 1372 28 40 a9
A1375:          LI   $b5                 ; 1375 20 b5
                LR   $0,A                ; 1377 50
                LIS  $0                  ; 1378 70
A1379:          ST                       ; 1379 17
                DS   $0                  ; 137a 30
                BF   $4,A1379            ; 137b 94 fd
                LR   Q,DC                ; 137d 0e
                LR   A,QU                ; 137e 02
                LR   $3,A                ; 137f 53
                LR   A,QL                ; 1380 03
                LR   $4,A                ; 1381 54
                PI   $41c8               ; 1382 28 41 c8
                LR   A,$3                ; 1385 43
                LR   QU,A                ; 1386 06
                LR   A,$4                ; 1387 44
                LR   QL,A                ; 1388 07
                LR   DC,Q                ; 1389 0f
                DS   $1                  ; 138a 31
                BF   $4,A1375            ; 138b 94 e9
                JMP  A1554               ; 138d 29 15 54
A1390:          DCI  $0ce0               ; 1390 2a 0c e0
                LIS  $3                  ; 1393 73
                LR   $1,A                ; 1394 51
                BF   $0,A1371            ; 1395 90 db
A1397:          LIS  $0                  ; 1397 70
                LR   $2,A                ; 1398 52
                XDC                      ; 1399 2c
                LR   Q,DC                ; 139a 0e
A139b:          LR   A,$0                ; 139b 40
                LR   $1,A                ; 139c 51
A139d:          LM                       ; 139d 16
                LR   $8,A                ; 139e 58
                LR   H,DC                ; 139f 11
                LIS  $0                  ; 13a0 70
                AS   $8                  ; 13a1 c8
                BT   1,A13ac             ; 13a2 81 09
                NI   $0f                 ; 13a4 21 0f
                LR   $8,A                ; 13a6 58
                DCI  A16e0               ; 13a7 2a 16 e0
                BF   $0,A13af            ; 13aa 90 04
A13ac:          DCI  $2010               ; 13ac 2a 20 10
A13af:          LR   A,$8                ; 13af 48
                ADC                      ; 13b0 8e
                SL   1                   ; 13b1 13
                ADC                      ; 13b2 8e
                ADC                      ; 13b3 8e
                ADC                      ; 13b4 8e
                LR   A,$2                ; 13b5 42
                ADC                      ; 13b6 8e
                LM                       ; 13b7 16
                XDC                      ; 13b8 2c
                ST                       ; 13b9 17
                XDC                      ; 13ba 2c
                LR   DC,H                ; 13bb 10
                DS   $1                  ; 13bc 31
                BF   $4,A139d            ; 13bd 94 df
                LR   DC,Q                ; 13bf 0f
                LR   A,$2                ; 13c0 42
                INC                      ; 13c1 1f
                LR   $2,A                ; 13c2 52
                CI   $07                 ; 13c3 25 07
                BF   $4,A139b            ; 13c5 94 d5
                POP                      ; 13c7 1c
A13c8:          XDC                      ; 13c8 2c
                LIS  $2                  ; 13c9 72
                LR   $0,A                ; 13ca 50
A13cb:          LR   A,(IS)              ; 13cb 4c
                SR   4                   ; 13cc 14
                DCI  A13e5               ; 13cd 2a 13 e5
                ADC                      ; 13d0 8e
                LM                       ; 13d1 16
                XDC                      ; 13d2 2c
                ST                       ; 13d3 17
                XDC                      ; 13d4 2c
                LR   A,(IS)+             ; 13d5 4d
                SL   4                   ; 13d6 15
                SR   4                   ; 13d7 14
                DCI  A13e5               ; 13d8 2a 13 e5
                ADC                      ; 13db 8e
                LM                       ; 13dc 16
                XDC                      ; 13dd 2c
                ST                       ; 13de 17
                XDC                      ; 13df 2c
                DS   $0                  ; 13e0 30
                BF   $4,A13cb            ; 13e1 94 e9
                XDC                      ; 13e3 2c
                POP                      ; 13e4 1c
A13e5:          DS   $6                  ; 13e5 36
                AI   $34                 ; 13e6 24 34
                DS   $2                  ; 13e8 32
                OI   $20                 ; 13e9 22 20
                LR   J,W                 ; 13eb 1e
                LR   Q,DC                ; 13ec 0e
                PK                       ; 13ed 0c
                LR   A,IS                ; 13ee 0a
                LR   A,KU                ; 13ef 00
                ST                       ; 13f0 17
                LR   DC,Q                ; 13f1 0f
                SL   4                   ; 13f2 15
A13f3:          LR   A,$0                ; 13f3 40
                SR   1                   ; 13f4 12
                SR   1                   ; 13f5 12
                SR   1                   ; 13f6 12
                LR   $0,A                ; 13f7 50
                LIS  $0                  ; 13f8 70
                LR   (IS)+,A             ; 13f9 5d
                LR   (IS),A              ; 13fa 5c
A13fb:          LI   $76                 ; 13fb 20 76
                ASD  (IS)                ; 13fd dc
                LR   (IS),A              ; 13fe 5c
                BF   $2,A1406            ; 13ff 92 06
                LIS  $0                  ; 1401 70
                LR   (IS)-,A             ; 1402 5e
                LR   A,(IS)              ; 1403 4c
                INC                      ; 1404 1f
                LR   (IS)+,A             ; 1405 5d
A1406:          DS   $0                  ; 1406 30
                BT   1,A13fb             ; 1407 81 f3
                LR   A,(IS)-             ; 1409 4e
                LR   $0,A                ; 140a 50
                LR   A,(IS)              ; 140b 4c
                LR   $1,A                ; 140c 51
                LISU 5                   ; 140d 65
                LR   A,(IS)              ; 140e 4c
                COM                      ; 140f 18
                INC                      ; 1410 1f
                AS   $1                  ; 1411 c1
                BF   $1,A1422            ; 1412 91 0f
                LR   A,(IS)              ; 1414 4c
                LISU 4                   ; 1415 64
                LR   (IS)+,A             ; 1416 5d
                LISU 5                   ; 1417 65
                LR   A,$0                ; 1418 40
                BF   $4,A141f            ; 1419 94 05
                COM                      ; 141b 18
                ASD  (IS)                ; 141c dc
                BT   2,A1422             ; 141d 82 04
A141f:          LR   A,(IS)              ; 141f 4c
                LISU 4                   ; 1420 64
                LR   (IS)-,A             ; 1421 5e
A1422:          POP                      ; 1422 1c
A1423:          LR   K,P                 ; 1423 08
                PI   $40a9               ; 1424 28 40 a9
                LISU 6                   ; 1427 66
                LR   A,IS                ; 1428 0a
                CI   $34                 ; 1429 25 34
                BT   4,A1459             ; 142b 84 2d
                LISU 3                   ; 142d 63
                LIS  $1                  ; 142e 71
                NS   (IS)                ; 142f fc
                LISU 6                   ; 1430 66
                BF   $4,A1436            ; 1431 94 04
                JMP  A1539               ; 1433 29 15 39
A1436:          LR   A,(IS)              ; 1436 4c
                AI   $20                 ; 1437 24 20
                LR   (IS),A              ; 1439 5c
                SR   4                   ; 143a 14
                SR   1                   ; 143b 12
                AI   $ff                 ; 143c 24 ff
                SL   1                   ; 143e 13
                CI   $0a                 ; 143f 25 0a
                BT   1,A1448             ; 1441 81 06
                LR   A,(IS)              ; 1443 4c
                NI   $3f                 ; 1444 21 3f
                LR   (IS),A              ; 1446 5c
                LIS  $0                  ; 1447 70
A1448:          DCI  A153b               ; 1448 2a 15 3b
                ADC                      ; 144b 8e
                LM                       ; 144c 16
                LR   QU,A                ; 144d 06
                LM                       ; 144e 16
                LR   QL,A                ; 144f 07
                LR   DC,Q                ; 1450 0f
                LR   A,IS                ; 1451 0a
                CI   $30                 ; 1452 25 30
                BT   4,A1459             ; 1454 84 04
                LI   $2a                 ; 1456 20 2a
                ADC                      ; 1458 8e
A1459:          XDC                      ; 1459 2c
                LIS  $1                  ; 145a 71
                LR   $0,A                ; 145b 50
                DCI  $0f00               ; 145c 2a 0f 00
                LR   A,$5                ; 145f 45
                ADC                      ; 1460 8e
                INC                      ; 1461 1f
                LR   $5,A                ; 1462 55
                LM                       ; 1463 16
                LR   $3,A                ; 1464 53
A1465:          LR   A,$3                ; 1465 43
                SL   4                   ; 1466 15
                SR   4                   ; 1467 14
                DCI  A170c               ; 1468 2a 17 0c
                CI   $01                 ; 146b 25 01
                BT   4,A147a             ; 146d 84 0c
                DCI  $14aa               ; 146f 2a 14 aa
                CI   $0a                 ; 1472 25 0a
                BT   4,A147a             ; 1474 84 05
                DCI  A13e5               ; 1476 2a 13 e5
                ADC                      ; 1479 8e
A147a:          LR   A,IS                ; 147a 0a
                CI   $34                 ; 147b 25 34
                BF   $4,A14e2            ; 147d 94 64
                LM                       ; 147f 16
                LR   $1,A                ; 1480 51
                LR   A,(IS)              ; 1481 4c
                AI   $20                 ; 1482 24 20
                LR   (IS),A              ; 1484 5c
                NI   $e0                 ; 1485 21 e0
                CI   $40                 ; 1487 25 40
                BF   $4,A1491            ; 1489 94 07
                LISU 5                   ; 148b 65
                LR   A,$3                ; 148c 43
                LR   (IS),A              ; 148d 5c
                LISU 6                   ; 148e 66
                BF   $0,A14f4            ; 148f 90 64
A1491:          DCI  $0ec3               ; 1491 2a 0e c3
                LR   A,$3                ; 1494 43
                NI   $20                 ; 1495 21 20
                BT   4,A149b             ; 1497 84 03
                LIS  $9                  ; 1499 79
                ADC                      ; 149a 8e
A149b:          LR   Q,DC                ; 149b 0e
                LIS  $0                  ; 149c 70
                OM                       ; 149d 8b
                LM                       ; 149e 16
                BF   $4,A149b            ; 149f 94 fb
                LR   DC,Q                ; 14a1 0f
                LR   A,$1                ; 14a2 41
                ST                       ; 14a3 17
                LI   $11                 ; 14a4 20 11
                ADC                      ; 14a6 8e
                LR   A,$3                ; 14a7 43
                SR   4                   ; 14a8 14
                AI   $80                 ; 14a9 24 80
                ST                       ; 14ab 17
                LIS  $9                  ; 14ac 79
                LR   $0,A                ; 14ad 50
                DCI  $0ec3               ; 14ae 2a 0e c3
                XDC                      ; 14b1 2c
                DCI  $0ce0               ; 14b2 2a 0c e0
                PI   A1397               ; 14b5 28 13 97
                LR   A,IS                ; 14b8 0a
                LR   $6,A                ; 14b9 56
                PI   $41c8               ; 14ba 28 41 c8
                DCI  $0ed5               ; 14bd 2a 0e d5
                XDC                      ; 14c0 2c
                DCI  $0d1f               ; 14c1 2a 0d 1f
                PI   A1397               ; 14c4 28 13 97
                PI   $41c8               ; 14c7 28 41 c8
                DCI  $0ecc               ; 14ca 2a 0e cc
                XDC                      ; 14cd 2c
                DCI  $0d5e               ; 14ce 2a 0d 5e
                PI   A1397               ; 14d1 28 13 97
                PI   $41c8               ; 14d4 28 41 c8
                DCI  $0ede               ; 14d7 2a 0e de
                LR   A,$6                ; 14da 46
                LR   IS,A                ; 14db 0b
                XDC                      ; 14dc 2c
                DCI  $0d9d               ; 14dd 2a 0d 9d
                BF   $0,A14f1            ; 14e0 90 10
A14e2:          XDC                      ; 14e2 2c
                PI   A1397               ; 14e3 28 13 97
                LR   A,$3                ; 14e6 43
                SR   4                   ; 14e7 14
                AI   $80                 ; 14e8 24 80
                DCI  $0f34               ; 14ea 2a 0f 34
                LR   Q,DC                ; 14ed 0e
                ST                       ; 14ee 17
                LR   DC,Q                ; 14ef 0f
                XDC                      ; 14f0 2c
A14f1:          PI   A1397               ; 14f1 28 13 97
A14f4:          LR   A,IS                ; 14f4 0a
                CI   $32                 ; 14f5 25 32
                BT   1,A1502             ; 14f7 81 0a
                LR   A,(IS)              ; 14f9 4c
                NI   $60                 ; 14fa 21 60
                CI   $60                 ; 14fc 25 60
                BT   4,A1535             ; 14fe 84 36
                BF   $0,A1521            ; 1500 90 20
A1502:          LIS  $0                  ; 1502 70
                DCI  $0f63               ; 1503 2a 0f 63
                BF   $4,A1509            ; 1506 94 02
                LIS  $3                  ; 1508 73
A1509:          ADC                      ; 1509 8e
                LR   A,(IS)              ; 150a 4c
                SR   4                   ; 150b 14
                SR   1                   ; 150c 12
                CI   $03                 ; 150d 25 03
                BT   1,A1513             ; 150f 81 03
                AI   $03                 ; 1511 24 03
A1513:          ADC                      ; 1513 8e
                LR   A,$3                ; 1514 43
                SL   1                   ; 1515 13
                SL   1                   ; 1516 13
                NI   $80                 ; 1517 21 80
                LR   $1,A                ; 1519 51
                LR   Q,DC                ; 151a 0e
                LM                       ; 151b 16
                NI   $7f                 ; 151c 21 7f
                AS   $1                  ; 151e c1
                LR   DC,Q                ; 151f 0f
                ST                       ; 1520 17
A1521:          LR   A,$3                ; 1521 43
                SL   4                   ; 1522 15
                SR   4                   ; 1523 14
                LR   $3,A                ; 1524 53
                CI   $0a                 ; 1525 25 0a
                BT   1,A152a             ; 1527 81 02
                LIS  $a                  ; 1529 7a
A152a:          AS   (IS)                ; 152a cc
                LR   (IS),A              ; 152b 5c
                LIS  $1                  ; 152c 71
                XS   $3                  ; 152d e3
                BF   $4,A1535            ; 152e 94 06
                LISU 3                   ; 1530 63
                LR   A,(IS)              ; 1531 4c
                OI   $20                 ; 1532 22 20
                LR   (IS),A              ; 1534 5c
A1535:          PI   A1547               ; 1535 28 15 47
                LISU 6                   ; 1538 66
A1539:          BF   $0,A1554            ; 1539 90 1a
A153b:          LR   Q,DC                ; 153b 0e
                EI                       ; 153c 1b
                LR   Q,DC                ; 153d 0e
                JMP  $0e37               ; 153e 29 0e 37
                LR   Q,DC                ; 1541 0e
                LISL 7                   ; 1542 6f
                LR   Q,DC                ; 1543 0e
                LIS  $d                  ; 1544 7d
                LR   Q,DC                ; 1545 0e
                OM                       ; 1546 8b
A1547:          LR   K,P                 ; 1547 08
                PI   $40a9               ; 1548 28 40 a9
                LI   $30                 ; 154b 20 30
                LR   $0,A                ; 154d 50
A154e:          PI   $41c8               ; 154e 28 41 c8
                DS   $0                  ; 1551 30
                BF   $4,A154e            ; 1552 94 fb
A1554:          PI   $40bc               ; 1554 28 40 bc
                PK                       ; 1557 0c
A1558:          LI   $20                 ; 1558 20 20
                NS   (IS)                ; 155a fc
                BF   $4,A155f            ; 155b 94 03
                COM                      ; 155d 18
                POP                      ; 155e 1c
A155f:          LISU 6                   ; 155f 66
                LI   $4b                 ; 1560 20 4b
                XS   (IS)                ; 1562 ec
                LISU 3                   ; 1563 63
                POP                      ; 1564 1c
A1565:          LR   A,(IS)+             ; 1565 4d
                LR   A,(IS)              ; 1566 4c
                SR   1                   ; 1567 12
                LR   (IS),A              ; 1568 5c
                NI   $08                 ; 1569 21 08
                BT   4,A1571             ; 156b 84 05
                LR   A,(IS)              ; 156d 4c
                AI   $fd                 ; 156e 24 fd
                LR   (IS),A              ; 1570 5c
A1571:          LR   A,(IS)-             ; 1571 4e
                LR   A,(IS)              ; 1572 4c
                NI   $01                 ; 1573 21 01
                BF   $4,A1583            ; 1575 94 0d
A1577:          LR   A,(IS)              ; 1577 4c
                SR   1                   ; 1578 12
                LR   (IS),A              ; 1579 5c
                NI   $08                 ; 157a 21 08
                BT   4,A1582             ; 157c 84 05
                LR   A,(IS)              ; 157e 4c
                AI   $fd                 ; 157f 24 fd
                LR   (IS),A              ; 1581 5c
A1582:          POP                      ; 1582 1c
A1583:          LR   A,(IS)+             ; 1583 4d
                LI   $b6                 ; 1584 20 b6
                ASD  (IS)                ; 1586 dc
                LR   (IS)-,A             ; 1587 5e
                BF   $0,A1577            ; 1588 90 ee
A158a:          LR   K,P                 ; 158a 08
                XDC                      ; 158b 2c
                DCI  $0ddc               ; 158c 2a 0d dc
                LIS  $9                  ; 158f 79
                LR   $0,A                ; 1590 50
                PI   A1397               ; 1591 28 13 97
A1594:          PK                       ; 1594 0c
A1595:          LR   K,P                 ; 1595 08
                PI   $40a9               ; 1596 28 40 a9
                LISU 5                   ; 1599 65
                LISL 0                   ; 159a 68
                DCI  $0f34               ; 159b 2a 0f 34
                PI   A13c8               ; 159e 28 13 c8
                LIS  $0                  ; 15a1 70
                ST                       ; 15a2 17
                ST                       ; 15a3 17
                ST                       ; 15a4 17
                PI   A13c8               ; 15a5 28 13 c8
                LISU 4                   ; 15a8 64
                LISL 0                   ; 15a9 68
                PI   A13c8               ; 15aa 28 13 c8
                LIS  $0                  ; 15ad 70
                ST                       ; 15ae 17
                ST                       ; 15af 17
                ST                       ; 15b0 17
                PI   A13c8               ; 15b1 28 13 c8
                PI   $41c8               ; 15b4 28 41 c8
                DCI  $0f34               ; 15b7 2a 0f 34
                XDC                      ; 15ba 2c
                DCI  $0c20               ; 15bb 2a 0c 20
                LIS  $b                  ; 15be 7b
                LR   $0,A                ; 15bf 50
                PI   A1397               ; 15c0 28 13 97
                PI   $41c8               ; 15c3 28 41 c8
                DCI  $0f3f               ; 15c6 2a 0f 3f
                XDC                      ; 15c9 2c
                DCI  $0c83               ; 15ca 2a 0c 83
                PI   A1397               ; 15cd 28 13 97
                JMP  $41cc               ; 15d0 29 41 cc
A15d3:          LR   K,P                 ; 15d3 08
                PI   $40a9               ; 15d4 28 40 a9
                LR   A,IS                ; 15d7 0a
                LR   $6,A                ; 15d8 56
                LISU 6                   ; 15d9 66
                LISL 4                   ; 15da 6c
                LR   A,(IS)+             ; 15db 4d
                LISU 5                   ; 15dc 65
                LR   (IS),A              ; 15dd 5c
                LR   A,$6                ; 15de 46
                LR   IS,A                ; 15df 0b
                LIS  $0                  ; 15e0 70
                LR   $6,A                ; 15e1 56
                LI   $1e                 ; 15e2 20 1e
                LR   $8,A                ; 15e4 58
A15e5:          PI   $41c8               ; 15e5 28 41 c8
                DS   $8                  ; 15e8 38
                BF   $4,A160f            ; 15e9 94 25
                DCI  $0fb4               ; 15eb 2a 0f b4
                LIS  $2                  ; 15ee 72
                NS   $7                  ; 15ef f7
                BT   4,A15f4             ; 15f0 84 03
                INC                      ; 15f2 1f
                ADC                      ; 15f3 8e
A15f4:          LR   Q,DC                ; 15f4 0e
                XDC                      ; 15f5 2c
                LR   DC,Q                ; 15f6 0f
                LIS  $1                  ; 15f7 71
                LR   $1,A                ; 15f8 51
A15f9:          LIS  $3                  ; 15f9 73
                LR   $0,A                ; 15fa 50
A15fb:          LI   $80                 ; 15fb 20 80
                XM                       ; 15fd 8c
                XDC                      ; 15fe 2c
                ST                       ; 15ff 17
                XDC                      ; 1600 2c
                DS   $0                  ; 1601 30
                BF   $4,A15fb            ; 1602 94 f8
                LIS  $3                  ; 1604 73
                ADC                      ; 1605 8e
                LR   Q,DC                ; 1606 0e
                XDC                      ; 1607 2c
                LR   DC,Q                ; 1608 0f
                DS   $1                  ; 1609 31
                BT   4,A15f9             ; 160a 84 ee
                LI   $14                 ; 160c 20 14
                LR   $8,A                ; 160e 58
A160f:          PI   A16c6               ; 160f 28 16 c6
                XI   $00                 ; 1612 23 00
                BT   4,A15e5             ; 1614 84 d0
                BF   $1,A1620            ; 1616 91 09
                LIS  $2                  ; 1618 72
                NS   $7                  ; 1619 f7
                BF   $4,A15e5            ; 161a 94 ca
                LISL 0                   ; 161c 68
                LR   $a,A                ; 161d 5a
                BF   $0,A1627            ; 161e 90 08
A1620:          LIS  $6                  ; 1620 76
                NS   $7                  ; 1621 f7
                BT   4,A15e5             ; 1622 84 c2
                LISL 2                   ; 1624 6a
                LIS  $2                  ; 1625 72
                LR   $a,A                ; 1626 5a
A1627:          LISU 3                   ; 1627 63
                LR   A,IS                ; 1628 0a
                LR   $2,A                ; 1629 52
                PI   A17d2               ; 162a 28 17 d2
                LR   $1,A                ; 162d 51
                LR   A,$2                ; 162e 42
                LR   IS,A                ; 162f 0b
                LIS  $0                  ; 1630 70
                LR   $6,A                ; 1631 56
                DCI  $0fb4               ; 1632 2a 0f b4
                LIS  $4                  ; 1635 74
A1636:          ST                       ; 1636 17
                INC                      ; 1637 1f
                CI   $10                 ; 1638 25 10
                BF   $4,A1636            ; 163a 94 fb
                DCI  A16bc               ; 163c 2a 16 bc
                LR   A,$1                ; 163f 41
                AI   $9c                 ; 1640 24 9c
                BF   $1,A1647            ; 1642 91 04
                DCI  A16c4               ; 1644 2a 16 c4
A1647:          PI   A165a               ; 1647 28 16 5a
                LR   A,IS                ; 164a 0a
                LR   $6,A                ; 164b 56
                LISU 5                   ; 164c 65
                LISL 5                   ; 164d 6d
                LR   A,(IS)-             ; 164e 4e
                LISU 6                   ; 164f 66
                LR   (IS),A              ; 1650 5c
                LR   A,$6                ; 1651 46
                LR   IS,A                ; 1652 0b
                PI   $40bc               ; 1653 28 40 bc
                LR   A,$1                ; 1656 41
                AI   $9c                 ; 1657 24 9c
                PK                       ; 1659 0c
A165a:          LR   K,P                 ; 165a 08
                PI   $40a9               ; 165b 28 40 a9
                LR   A,IS                ; 165e 0a
                LISU 4                   ; 165f 64
                LISL 5                   ; 1660 6d
                LR   (IS)+,A             ; 1661 5d
                LR   Q,DC                ; 1662 0e
                LR   A,QU                ; 1663 02
                LR   (IS)+,A             ; 1664 5d
                LR   A,QL                ; 1665 03
                LR   (IS),A              ; 1666 5c
                LIS  $0                  ; 1667 70
                DCI  $0fdd               ; 1668 2a 0f dd
                ST                       ; 166b 17
                ST                       ; 166c 17
                DCI  $0ef8               ; 166d 2a 0e f8
A1670:          LR   A,(IS)-             ; 1670 4e
                ST                       ; 1671 17
A1672:          BR7  A1670               ; 1672 8f fd
A1674:          DCI  $0ef8               ; 1674 2a 0e f8
                LM                       ; 1677 16
                LR   QL,A                ; 1678 07
                LM                       ; 1679 16
                LR   QU,A                ; 167a 06
                LR   DC,Q                ; 167b 0f
                LM                       ; 167c 16
                CI   $00                 ; 167d 25 00
                BF   $4,A1692            ; 167f 94 12
                LIS  $0                  ; 1681 70
                OUTS 14                  ; 1682 be
                DCI  $0ef8               ; 1683 2a 0e f8
                LISU 4                   ; 1686 64
                LISL 7                   ; 1687 6f
A1688:          LM                       ; 1688 16
                LR   (IS)-,A             ; 1689 5e
                BR7  A1688               ; 168a 8f fd
                LISL 5                   ; 168c 6d
                LR   A,(IS)              ; 168d 4c
                LR   IS,A                ; 168e 0b
                JMP  A1554               ; 168f 29 15 54
A1692:          LR   $2,A                ; 1692 52
                LISL 4                   ; 1693 6c
                LISU 2                   ; 1694 62
                NI   $03                 ; 1695 21 03
                LR   (IS),A              ; 1697 5c
                LISU 4                   ; 1698 64
                LR   A,$2                ; 1699 42
                SR   1                   ; 169a 12
                SR   1                   ; 169b 12
                LR   (IS)-,A             ; 169c 5e
                LIS  $3                  ; 169d 73
                LR   (IS),A              ; 169e 5c
                LR   Q,DC                ; 169f 0e
                DCI  $0ef8               ; 16a0 2a 0e f8
                LR   A,QL                ; 16a3 03
                ST                       ; 16a4 17
                LR   A,QU                ; 16a5 02
                ST                       ; 16a6 17
                PI   $46d6               ; 16a7 28 46 d6
                LISU 2                   ; 16aa 62
                LISL 4                   ; 16ab 6c
                LR   A,(IS)              ; 16ac 4c
                INC                      ; 16ad 1f
                SL   1                   ; 16ae 13
                SL   1                   ; 16af 13
                LR   (IS),A              ; 16b0 5c
                PI   $43d6               ; 16b1 28 43 d6
                BF   $0,A1674            ; 16b4 90 bf
A16b6:          LISL 5                   ; 16b6 6d
                LISL 1                   ; 16b7 69
                LISU 5                   ; 16b8 65
                LISU 1                   ; 16b9 61
                LR   (IS)+,A             ; 16ba 5d
                LR   $9,A                ; 16bb 59
A16bc:          LR   $5,A                ; 16bc 55
                LR   A,KU                ; 16bd 00
A16be:
;          BT   2,-98               ; 16be 82 9e
				db   $82,$9e
                db   $a2                 
                OUTS 14                  ; 16c1 be
                AS   $2                  ; 16c2 c2
                ASD  (IS)-               ; 16c3 de
A16c4:          XS   (IS)+               ; 16c4 ed
                LR   A,KU                ; 16c5 00
A16c6:          LIS  $0                  ; 16c6 70
                OUTS 1                   ; 16c7 b1
                INS  1                   ; 16c8 a1
                NI   $03                 ; 16c9 21 03
                XS   $6                  ; 16cb e6
                LR   $0,A                ; 16cc 50
                BT   4,A16d7             ; 16cd 84 09
                XS   $6                  ; 16cf e6
                LR   $6,A                ; 16d0 56
                BF   $4,A16d8            ; 16d1 94 06
                LR   A,$0                ; 16d3 40
                SL   4                   ; 16d4 15
                SL   1                   ; 16d5 13
                SL   1                   ; 16d6 13
A16d7:          POP                      ; 16d7 1c
A16d8:          LR   A,$0                ; 16d8 40
                CI   $03                 ; 16d9 25 03
                BF   $4,A16de            ; 16db 94 02
                LR   $6,A                ; 16dd 56
A16de:          LIS  $0                  ; 16de 70
                POP                      ; 16df 1c
A16e0:          XM                       ; 16e0 8c
                BF   $2,A1674            ; 16e1 92 92
;                BF   $2,-110             ; 16e3 92 92
				db   $92,$92
                BF   $2,A1672            ; 16e5 92 8c
                LR   DC,H                ; 16e7 10
                DS   $8                  ; 16e8 38
                LIS  $c                  ; 16e9 7c
                NS   (IS)-               ; 16ea fe
                LIS  $c                  ; 16eb 7c
                LR   DC,H                ; 16ec 10
                DS   $8                  ; 16ed 38
                LR   DC,H                ; 16ee 10
                DS   $8                  ; 16ef 38
                LIS  $c                  ; 16f0 7c
                NS   (IS)-               ; 16f1 fe
                LIS  $c                  ; 16f2 7c
                DS   $8                  ; 16f3 38
                LR   DC,H                ; 16f4 10
                LR   A,KU                ; 16f5 00
                AS   $6                  ; 16f6 c6
                XS   (IS)-               ; 16f7 ee
                NS   (IS)-               ; 16f8 fe
                LIS  $c                  ; 16f9 7c
                LIS  $c                  ; 16fa 7c
                DS   $8                  ; 16fb 38
                DS   $8                  ; 16fc 38
                DS   $8                  ; 16fd 38
                ASD  $6                  ; 16fe d6
                NS   (IS)-               ; 16ff fe
                ASD  $6                  ; 1700 d6
                LR   DC,H                ; 1701 10
                DS   $8                  ; 1702 38
A1703:          AI   $00                 ; 1703 24 00
                SL   1                   ; 1705 13
                LR   P,K                 ; 1706 09
                LR   A,KU                ; 1707 00
                DS   $4                  ; 1708 34
                LR   A,KU                ; 1709 00
                CI   $27                 ; 170a 25 27
A170c:          LR   H,DC                ; 170c 11
                LR   KL,A                ; 170d 05
                LR   IS,A                ; 170e 0b
                LR   P,K                 ; 170f 09
                NI   $35                 ; 1710 21 35
A1712:          NI   $19                 ; 1712 21 19
                LR   A,QL                ; 1714 03
                LR   W,J                 ; 1715 1d
                LR   W,J                 ; 1716 1d
A1717:          OUT  $01                 ; 1717 27 01
                NOP                      ; 1719 2b
                EI                       ; 171a 1b
A171b:          CI   $27                 ; 171b 25 27
                LR   H,DC                ; 171d 11
                DS   $1                  ; 171e 31
                LR   IS,A                ; 171f 0b
                LR   A,KU                ; 1720 00
                db   $2d                 
                LR   IS,A                ; 1722 0b
                LR   QL,A                ; 1723 07
A1724:          LR   A,KU                ; 1724 00
                LR   A,KU                ; 1725 00
                LR   A,KU                ; 1726 00
                LNK                      ; 1727 19
                LR   A,KL                ; 1728 01
                LR   QL,A                ; 1729 07
                DS   $5                  ; 172a 35
                LR   A,KU                ; 172b 00
                LR   A,KU                ; 172c 00
A172d:          LR   A,KU                ; 172d 00
                INC                      ; 172e 1f
                SL   1                   ; 172f 13
                LR   A,QL                ; 1730 03
                db   $2d                 
                OUT  $0b                 ; 1732 27 0b
                DS   $5                  ; 1734 35
                LR   A,KU                ; 1735 00
A1736:          LR   A,KU                ; 1736 00
                LR   A,KU                ; 1737 00
                db   $2d                 
                LR   A,QL                ; 1739 03
                NI   $07                 ; 173a 21 07
                LR   IS,A                ; 173c 0b
                INC                      ; 173d 1f
                LR   A,KU                ; 173e 00
A173f:          XS   $7                  ; 173f e7
                XS   (IS)-               ; 1740 ee
                NS   $5                  ; 1741 f5
                NS   (IS)                ; 1742 fc
                LI   $16                 ; 1743 20 16
;                BF   $6,-106             ; 1745 96 96
				db   $96,$96
A1747:          LM                       ; 1747 16
                PK                       ; 1748 0c
;                BF   $2,-110             ; 1749 92 92
				db   $92,$92
                BF   $2,A16de            ; 174b 92 92
A174d:          LR   DC,Q                ; 174d 0f
                LR   QL,A                ; 174e 07
                LR   QL,A                ; 174f 07
                LR   QL,A                ; 1750 07
                LR   QL,A                ; 1751 07
                LR   QL,A                ; 1752 07
                SR   4                   ; 1753 14
                SR   4                   ; 1754 14
                SR   4                   ; 1755 14
                SR   4                   ; 1756 14
                POP                      ; 1757 1c
                db   $2e                 
                LR   A,$0                ; 1759 40
                OUTS 14                  ; 175a be
                ASD  $0                  ; 175b d0
                LIS  $8                  ; 175c 78
                LR   A,KU                ; 175d 00
                LR   A,KL                ; 175e 01
                LR   A,QU                ; 175f 02
                LR   A,QL                ; 1760 03
                LR   KU,A                ; 1761 04
A1762:          LI   $e0                 ; 1762 20 e0
                LR   (IS)-,A             ; 1764 5e
                ASD  (IS)                ; 1765 dc
A1766:          EI                       ; 1766 1b
                JMP  $3745               ; 1767 29 37 45
                LR   $3,A                ; 176a 53
                LISU 1                   ; 176b 61
                LISL 7                   ; 176c 6f
                LIS  $d                  ; 176d 7d
                OM                       ; 176e 8b
                BF   $9,A1717            ; 176f 99 a7
                OUTS 5                   ; 1771 b5
                PK                       ; 1772 0c
                PK                       ; 1773 0c
                CM                       ; 1774 8d
                CM                       ; 1775 8d
                LR   Q,DC                ; 1776 0e
                LR   Q,DC                ; 1777 0e
                LR   Q,DC                ; 1778 0e
                LR   Q,DC                ; 1779 0e
                LR   Q,DC                ; 177a 0e
                LR   Q,DC                ; 177b 0e
                LR   Q,DC                ; 177c 0e
                LR   Q,DC                ; 177d 0e
                LR   Q,DC                ; 177e 0e
                LR   Q,DC                ; 177f 0e
                LR   Q,DC                ; 1780 0e
                LR   Q,DC                ; 1781 0e
                LR   IS,A                ; 1782 0b
                LR   P,K                 ; 1783 09
                LR   P,K                 ; 1784 09
                LR   P,K                 ; 1785 09
                LR   A,KL                ; 1786 01
                LR   A,KL                ; 1787 01
                LR   A,KL                ; 1788 01
                LR   A,KL                ; 1789 01
                LR   A,KL                ; 178a 01
                LR   A,KL                ; 178b 01
                LR   A,KL                ; 178c 01
                LR   A,KL                ; 178d 01
                LR   A,KL                ; 178e 01
                LR   A,KL                ; 178f 01
                LR   A,KL                ; 1790 01
                LR   A,KL                ; 1791 01
                LR   DC,H                ; 1792 10
                LR   Q,DC                ; 1793 0e
A1794:          LR   Q,DC                ; 1794 0e
                LR   QL,A                ; 1795 07
                LR   Q,DC                ; 1796 0e
                LR   Q,DC                ; 1797 0e
                LR   Q,DC                ; 1798 0e
                LR   Q,DC                ; 1799 0e
                LR   Q,DC                ; 179a 0e
                LR   Q,DC                ; 179b 0e
                LR   Q,DC                ; 179c 0e
                LR   Q,DC                ; 179d 0e
                LR   Q,DC                ; 179e 0e
                LR   Q,DC                ; 179f 0e
                LR   Q,DC                ; 17a0 0e
                LR   Q,DC                ; 17a1 0e
                DS   $4                  ; 17a2 34
                LR   A,$0                ; 17a3 40
                LR   A,$0                ; 17a4 40
                DS   $a                  ; 17a5 3a
                DI                       ; 17a6 1a
                DS   $0                  ; 17a7 30
                LR   A,$6                ; 17a8 46
                LIS  $0                  ; 17a9 70
                BT   6,A1747             ; 17aa 86 9c
                DI                       ; 17ac 1a
                DS   $0                  ; 17ad 30
                LR   A,$6                ; 17ae 46
                LIS  $0                  ; 17af 70
                BT   6,A174d             ; 17b0 86 9c
                XDC                      ; 17b2 2c
                LR   $0,A                ; 17b3 50
                LIS  $0                  ; 17b4 70
                BF   $0,A1766            ; 17b5 90 b0
                OUTS 0                   ; 17b7 b0
                OUTS 0                   ; 17b8 b0
                OUTS 0                   ; 17b9 b0
                OUTS 0                   ; 17ba b0
                OUTS 0                   ; 17bb b0
                ASD  $0                  ; 17bc d0
                ASD  $0                  ; 17bd d0
                ASD  $0                  ; 17be d0
                ASD  $0                  ; 17bf d0
                ASD  $0                  ; 17c0 d0
                ASD  $0                  ; 17c1 d0
                LR   A,KU                ; 17c2 00
                LR   A,KL                ; 17c3 01
                LR   A,QU                ; 17c4 02
                LR   A,QL                ; 17c5 03
                LR   KU,A                ; 17c6 04
                LR   KL,A                ; 17c7 05
                LR   QU,A                ; 17c8 06
                LR   QL,A                ; 17c9 07
                LR   K,P                 ; 17ca 08
                LR   P,K                 ; 17cb 09
                LR   A,IS                ; 17cc 0a
                LR   IS,A                ; 17cd 0b
                PK                       ; 17ce 0c
                LR   P0,Q                ; 17cf 0d
                LR   Q,DC                ; 17d0 0e
                LR   DC,Q                ; 17d1 0f
A17d2:          LR   K,P                 ; 17d2 08
                PI   $40a9               ; 17d3 28 40 a9
                LR   A,$a                ; 17d6 4a
                LISU 2                   ; 17d7 62
                LISL 0                   ; 17d8 68
                LR   (IS)+,A             ; 17d9 5d
                LIS  $1                  ; 17da 71
A17db:          DS   $a                  ; 17db 3a
                BF   $1,A17e1            ; 17dc 91 04
                SL   1                   ; 17de 13
                BF   $0,A17db            ; 17df 90 fb
A17e1:          OUTS 0                   ; 17e1 b0
                LIS  $8                  ; 17e2 78
                SL   4                   ; 17e3 15
                DCI  $0fde               ; 17e4 2a 0f de
                LR   H,DC                ; 17e7 11
                DI                       ; 17e8 1a
                LR   $8,A                ; 17e9 58
                DCI  $08fb               ; 17ea 2a 08 fb
                LR   Q,DC                ; 17ed 0e
                LM                       ; 17ee 16
                LR   (IS),A              ; 17ef 5c
A17f0:          LR   DC,Q                ; 17f0 0f
                CM                       ; 17f1 8d
                BT   4,A17f0             ; 17f2 84 fd
                LR   A,$8                ; 17f4 48
                OUTS 1                   ; 17f5 b1
                LR   A,(IS)              ; 17f6 4c
                INC                      ; 17f7 1f
                LR   (IS),A              ; 17f8 5c
                JMP  $21d5               ; 17f9 29 21 d5
A17fc:          LR   A,KU                ; 17fc 00
                LR   A,KU                ; 17fd 00
                LR   A,KU                ; 17fe 00
                LR   A,KU                ; 17ff 00
