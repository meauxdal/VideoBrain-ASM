;Vice Versa - EN06

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/29/2010

org $1000

				db   $aa,$55			;cart signature
				db   $01				;background color
				db   $00,$00,$2f,$01,$31,$0b,$00,$2f,$0b,$09,$21,$11,$00,$00,$00	;name - VICE VERSA
                
START:          DCI  $08f5               ; 1012 2a 08 f5
                LIS  $0                  ; 1015 70
                ST                       ; 1016 17
                PI   $41d5               ; 1017 28 41 d5
                PI   $22db               ; 101a 28 22 db
                LISU 2                   ; 101d 62
                LISL 6                   ; 101e 6e
                LIS  $0                  ; 101f 70
                XS   (IS)                ; 1020 ec
                BF   $1,A1028            ; 1021 91 06
                LI   $81                 ; 1023 20 81
                LR   (IS)-,A             ; 1025 5e
                LIS  $2                  ; 1026 72
                LR   (IS),A              ; 1027 5c
A1028:          DCI  $0fdf               ; 1028 2a 0f df
                LIS  $0                  ; 102b 70
                ST                       ; 102c 17
                LISL 4                   ; 102d 6c
                LIS  $7                  ; 102e 77
                SL   4                   ; 102f 15
                LR   (IS),A              ; 1030 5c
                DCI  A1566               ; 1031 2a 15 66
                PI   $4205               ; 1034 28 42 05
                PI   A1342               ; 1037 28 13 42
                CI   $1d                 ; 103a 25 1d
                BF   $4,A1049            ; 103c 94 0c
                PI   $41d5               ; 103e 28 41 d5
                LIS  $0                  ; 1041 70
                COM                      ; 1042 18
                DCI  $0f0b               ; 1043 2a 0f 0b
                ST                       ; 1046 17
                BF   $0,A109e            ; 1047 90 56
A1049:          CI   $2d                 ; 1049 25 2d
                BT   4,A1069             ; 104b 84 1d
                CI   $31                 ; 104d 25 31
                BT   4,A1065             ; 104f 84 15
                CI   $1f                 ; 1051 25 1f
                BT   4,A1061             ; 1053 84 0d
                CI   $0b                 ; 1055 25 0b
                BF   $4,A105d            ; 1057 94 05
                LI   $06                 ; 1059 20 06
                BF   $0,A106b            ; 105b 90 0f
A105d:          LI   $02                 ; 105d 20 02
                BF   $0,A106b            ; 105f 90 0b
A1061:          LI   $05                 ; 1061 20 05
                BF   $0,A106b            ; 1063 90 07
A1065:          LI   $04                 ; 1065 20 04
                BF   $0,A106b            ; 1067 90 03
A1069:          LI   $03                 ; 1069 20 03
A106b:          DCI  $0c28               ; 106b 2a 0c 28
                ST                       ; 106e 17
                DCI  $0c29               ; 106f 2a 0c 29
                INC                      ; 1072 1f
                ST                       ; 1073 17
                PI   $41d5               ; 1074 28 41 d5
                LIS  $2                  ; 1077 72
                LR   $0,A                ; 1078 50
                DCI  $0fdf               ; 1079 2a 0f df
                LIS  $2                  ; 107c 72
                SL   4                   ; 107d 15
                ST                       ; 107e 17
                LISL 4                   ; 107f 6c
                LR   (IS),A              ; 1080 5c
                LIS  $5                  ; 1081 75
                COM                      ; 1082 18
                AS   (IS)                ; 1083 cc
                LR   (IS),A              ; 1084 5c
                DCI  A154c               ; 1085 2a 15 4c
                PI   $4205               ; 1088 28 42 05
                PI   A1342               ; 108b 28 13 42
                CI   $2b                 ; 108e 25 2b
                LIS  $0                  ; 1090 70
                BT   4,A1094             ; 1091 84 02
                COM                      ; 1093 18
A1094:          LR   $7,A                ; 1094 57
                PI   $41d5               ; 1095 28 41 d5
                LIS  $0                  ; 1098 70
                DCI  $0f0b               ; 1099 2a 0f 0b
                ST                       ; 109c 17
                LR   A,$7                ; 109d 47
A109e:          LR   $7,A                ; 109e 57
                DCI  $0f0a               ; 109f 2a 0f 0a
                ST                       ; 10a2 17
                DCI  A1723               ; 10a3 2a 17 23
                XDC                      ; 10a6 2c
                DCI  $0ed0               ; 10a7 2a 0e d0
                LIS  $9                  ; 10aa 79
                LISU 2                   ; 10ab 62
                LISL 0                   ; 10ac 68
                LR   (IS),A              ; 10ad 5c
                PI   $43cd               ; 10ae 28 43 cd
                DCI  $0c25               ; 10b1 2a 0c 25
                LIS  $0                  ; 10b4 70
                ST                       ; 10b5 17
                DCI  $0fea               ; 10b6 2a 0f ea
                LI   $65                 ; 10b9 20 65
                ST                       ; 10bb 17
                PI   $4762               ; 10bc 28 47 62
                DCI  $0ffa               ; 10bf 2a 0f fa
                LIS  $3                  ; 10c2 73
                ST                       ; 10c3 17
                LIS  $0                  ; 10c4 70
                ST                       ; 10c5 17
                LI   $16                 ; 10c6 20 16
                ST                       ; 10c8 17
                LI   $4f                 ; 10c9 20 4f
                ST                       ; 10cb 17
                PI   $41c8               ; 10cc 28 41 c8
                LIS  $5                  ; 10cf 75
                LR   (IS),A              ; 10d0 5c
                DCI  A166d               ; 10d1 2a 16 6d
                XDC                      ; 10d4 2c
                DCI  $0ffb               ; 10d5 2a 0f fb
                PI   $43cd               ; 10d8 28 43 cd
                PI   $41c8               ; 10db 28 41 c8
                PI   A16ad               ; 10de 28 16 ad
                LISU 3                   ; 10e1 63
                LISL 7                   ; 10e2 6f
                LIS  $0                  ; 10e3 70
A10e4:          LR   (IS)-,A             ; 10e4 5e
                BR7  A10e4               ; 10e5 8f fe
                LISU 4                   ; 10e7 64
                LISL 7                   ; 10e8 6f
A10e9:          LR   (IS)-,A             ; 10e9 5e
                BR7  A10e9               ; 10ea 8f fe
                LISU 3                   ; 10ec 63
                LISL 3                   ; 10ed 6b
                LIS  $8                  ; 10ee 78
                LR   (IS)+,A             ; 10ef 5d
                LISU 4                   ; 10f0 64
                LR   (IS)-,A             ; 10f1 5e
                LIS  $1                  ; 10f2 71
                SL   4                   ; 10f3 15
                LR   (IS)+,A             ; 10f4 5d
                LISU 3                   ; 10f5 63
                LR   (IS),A              ; 10f6 5c
                DCI  $0e10               ; 10f7 2a 0e 10
                LR   H,DC                ; 10fa 11
                PI   A1701               ; 10fb 28 17 01
                DCI  $0f0c               ; 10fe 2a 0f 0c
                LIS  $0                  ; 1101 70
                ST                       ; 1102 17
                LIS  $3                  ; 1103 73
                ST                       ; 1104 17
                LIS  $0                  ; 1105 70
                ST                       ; 1106 17
                DCI  $0f0f               ; 1107 2a 0f 0f
                ST                       ; 110a 17
                DCI  $0c2a               ; 110b 2a 0c 2a
                LIS  $0                  ; 110e 70
                ST                       ; 110f 17
                DCI  $0f09               ; 1110 2a 0f 09
                ST                       ; 1113 17
                DCI  $0ef0               ; 1114 2a 0e f0
                ST                       ; 1117 17
                ST                       ; 1118 17
                ST                       ; 1119 17
                ST                       ; 111a 17
                XS   $7                  ; 111b e7
                BF   $1,A118d            ; 111c 91 70
                DCI  $0e20               ; 111e 2a 0e 20
                LR   H,DC                ; 1121 11
                PI   A1356               ; 1122 28 13 56
                LISU 2                   ; 1125 62
                LISL 5                   ; 1126 6d
                LIS  $3                  ; 1127 73
                NS   (IS)                ; 1128 fc
                SL   1                   ; 1129 13
                DCI  A1723               ; 112a 2a 17 23
                ADC                      ; 112d 8e
                LM                       ; 112e 16
                LR   $3,A                ; 112f 53
                LM                       ; 1130 16
                LR   $1,A                ; 1131 51
                LI   $0e                 ; 1132 20 0e
                LR   $2,A                ; 1134 52
                DCI  $0e20               ; 1135 2a 0e 20
                LR   H,DC                ; 1138 11
                PI   A1701               ; 1139 28 17 01
                JMP  A1c74               ; 113c 29 1c 74
A113f:          LIS  $6                  ; 113f 76
                BF   $0,A119e            ; 1140 90 5d
A1142:          DCI  $0e10               ; 1142 2a 0e 10
                LR   H,DC                ; 1145 11
                PI   A16de               ; 1146 28 16 de
                DCI  $0f09               ; 1149 2a 0f 09
                LIS  $0                  ; 114c 70
                ST                       ; 114d 17
                LISU 3                   ; 114e 63
                PI   A1713               ; 114f 28 17 13
                LR   A,$0                ; 1152 40
                COM                      ; 1153 18
                INC                      ; 1154 1f
                LR   $4,A                ; 1155 54
                LISU 4                   ; 1156 64
                PI   A1713               ; 1157 28 17 13
                LR   A,$0                ; 115a 40
                COM                      ; 115b 18
                INC                      ; 115c 1f
                LR   $5,A                ; 115d 55
                PI   A1682               ; 115e 28 16 82
                LR   A,$4                ; 1161 44
                AS   $0                  ; 1162 c0
                DCI  $08f5               ; 1163 2a 08 f5
                BF   $4,A116b            ; 1166 94 04
                LIS  $4                  ; 1168 74
                BF   $0,A116f            ; 1169 90 05
A116b:          LIS  $1                  ; 116b 71
                BF   $1,A116f            ; 116c 91 02
                LIS  $2                  ; 116e 72
A116f:          ST                       ; 116f 17
                DCI  $0f0b               ; 1170 2a 0f 0b
                LIS  $0                  ; 1173 70
                AM                       ; 1174 88
                BT   4,A1180             ; 1175 84 0a
                DCI  $0f0a               ; 1177 2a 0f 0a
                LIS  $0                  ; 117a 70
                AM                       ; 117b 88
                LIS  $d                  ; 117c 7d
                BT   4,A1180             ; 117d 84 02
                INC                      ; 117f 1f
A1180:          LR   $0,A                ; 1180 50
                PI   A11ec               ; 1181 28 11 ec
                PI   A1778               ; 1184 28 17 78
                PI   A14ff               ; 1187 28 14 ff
                JMP  A11a2               ; 118a 29 11 a2
A118d:          DCI  $0e10               ; 118d 2a 0e 10
                LR   H,DC                ; 1190 11
                PI   A16de               ; 1191 28 16 de
                PI   A1356               ; 1194 28 13 56
                PI   A1682               ; 1197 28 16 82
                PI   A14ff               ; 119a 28 14 ff
; Colour announcement always selects message 9 (YOU PLAY BLACK),
; even when the player moves second
                LIS  $9                  ; 119d 79
A119e:          LR   $0,A                ; 119e 50
                PI   A11ec               ; 119f 28 11 ec
A11a2:          PI   A13d5               ; 11a2 28 13 d5
                LI   $18                 ; 11a5 20 18
                AS   $4                  ; 11a7 c4
                LR   IS,A                ; 11a8 0b
                LR   A,(IS)              ; 11a9 4c
                LISU 4                   ; 11aa 64
                AS   (IS)                ; 11ab cc
                NS   $3                  ; 11ac f3
                LIS  $5                  ; 11ad 75
                BF   $4,A119e            ; 11ae 94 ef
                LIS  $0                  ; 11b0 70
                LR   $0,A                ; 11b1 50
                DCI  $0ed0               ; 11b2 2a 0e d0
A11b5:          LIS  $0                  ; 11b5 70
                XM                       ; 11b6 8c
                BT   4,A113f             ; 11b7 84 87
                DS   $0                  ; 11b9 30
                NS   $3                  ; 11ba f3
                LM                       ; 11bb 16
                BT   4,A11b5             ; 11bc 84 f8
                XS   $4                  ; 11be e4
                BF   $4,A11b5            ; 11bf 94 f5
                LR   A,$0                ; 11c1 40
                COM                      ; 11c2 18
                DCI  $0c25               ; 11c3 2a 0c 25
                ST                       ; 11c6 17
                DCI  $0c2c               ; 11c7 2a 0c 2c
                LR   A,$3                ; 11ca 43
                ST                       ; 11cb 17
                LR   $3,A                ; 11cc 53
                LR   A,$4                ; 11cd 44
                LR   $1,A                ; 11ce 51
                PI   A1682               ; 11cf 28 16 82
                PI   A14ff               ; 11d2 28 14 ff
                PI   A16ad               ; 11d5 28 16 ad
                DCI  $0e10               ; 11d8 2a 0e 10
                LR   H,DC                ; 11db 11
                DCI  $0c2d               ; 11dc 2a 0c 2d
                LIS  $3                  ; 11df 73
                ST                       ; 11e0 17
                LI   $0e                 ; 11e1 20 0e
                LR   $2,A                ; 11e3 52
                LR   A,$3                ; 11e4 43
                DCI  $0c2c               ; 11e5 2a 0c 2c
                ST                       ; 11e8 17
                JMP  A1cf6               ; 11e9 29 1c f6
; Message printer: R0 indexes three-byte entries at $123D
; (length, address high, address low). Entries 9 and 10 point to
; $12DB (YOU PLAY BLACK) and $12E9 (YOU LPAY WHITE).
; Direct call sites and selected indices:
; $1181: 0,13,14; $119F: 5,6,9; $17D9: 12; $1832: 7,8,17,18;
; $183C: 4; $1ABD: 15,16; $1B07: 3; $1B3A: 2; $1C07: 11; $1C34: 1.
; No caller selects index 10, so YOU LPAY WHITE is never shown
A11ec:          LR   K,P                 ; 11ec 08
                PI   $40a9               ; 11ed 28 40 a9
                DCI  $0872               ; 11f0 2a 08 72
                LI   $82                 ; 11f3 20 82
                ST                       ; 11f5 17
                DCI  $0c26               ; 11f6 2a 0c 26
                LR   A,$a                ; 11f9 4a
                ST                       ; 11fa 17
                LR   A,$b                ; 11fb 4b
                ST                       ; 11fc 17
                PI   A1682               ; 11fd 28 16 82
                DCI  A123d               ; 1200 2a 12 3d
                LR   A,$0                ; 1203 40
                SL   1                   ; 1204 13
                AS   $0                  ; 1205 c0
                ADC                      ; 1206 8e
                LISU 2                   ; 1207 62
                LISL 4                   ; 1208 6c
                LM                       ; 1209 16
                LR   (IS),A              ; 120a 5c
                LM                       ; 120b 16
                LR   QU,A                ; 120c 06
                LM                       ; 120d 16
                LR   QL,A                ; 120e 07
                DCI  $0fdf               ; 120f 2a 0f df
                LIS  $5                  ; 1212 75
                SL   4                   ; 1213 15
                ST                       ; 1214 17
                DCI  $0e5f               ; 1215 2a 0e 5f
                LIS  $7                  ; 1218 77
                SL   4                   ; 1219 15
                LR   $1,A                ; 121a 51
                LIS  $0                  ; 121b 70
A121c:          ST                       ; 121c 17
                DS   $1                  ; 121d 31
                BF   $4,A121c            ; 121e 94 fd
                PI   $41c8               ; 1220 28 41 c8
                DCI  $0872               ; 1223 2a 08 72
                LIS  $2                  ; 1226 72
                ST                       ; 1227 17
                LR   DC,Q                ; 1228 0f
                PI   $4205               ; 1229 28 42 05
                PI   A1682               ; 122c 28 16 82
                DCI  $0c26               ; 122f 2a 0c 26
                LM                       ; 1232 16
                LR   $a,A                ; 1233 5a
                LM                       ; 1234 16
                LR   $b,A                ; 1235 5b
                PI   A16ad               ; 1236 28 16 ad
                PI   $40bc               ; 1239 28 40 bc
                PK                       ; 123c 0c
A123d:          LR   IS,A                ; 123d 0b
                SR   1                   ; 123e 12
                LIS  $6                  ; 123f 76
                LR   A,KL                ; 1240 01
                SR   1                   ; 1241 12
                LIS  $a                  ; 1242 7a
                LR   DC,H                ; 1243 10
                SR   1                   ; 1244 12
                BT   1,A1254             ; 1245 81 0e
                SR   1                   ; 1247 12
                BF   $1,A1254            ; 1248 91 0b
                SR   1                   ; 124a 12
                BF   $f,A125c            ; 124b 9f 10
                SR   1                   ; 124d 12
                INS  10                  ; 124e aa
                LR   Q,DC                ; 124f 0e
                SR   1                   ; 1250 12
                OUTS 10                  ; 1251 ba
                LR   A,IS                ; 1252 0a
                SR   1                   ; 1253 12
A1254:          AS   $8                  ; 1254 c8
                LR   P,K                 ; 1255 09
                SR   1                   ; 1256 12
                ASD  $2                  ; 1257 d2
                LR   Q,DC                ; 1258 0e
                SR   1                   ; 1259 12
                ASD  $b                  ; 125a db
                LR   Q,DC                ; 125b 0e
A125c:          SR   1                   ; 125c 12
                XS   $9                  ; 125d e9
                LR   P,K                 ; 125e 09
                SR   1                   ; 125f 12
                NS   $7                  ; 1260 f7
                PK                       ; 1261 0c
                SL   1                   ; 1262 13
                LR   A,KU                ; 1263 00
                LR   QU,A                ; 1264 06
                SL   1                   ; 1265 13
                PK                       ; 1266 0c
                LR   QU,A                ; 1267 06
                SL   1                   ; 1268 13
                POP                      ; 1269 1c
                LR   DC,H                ; 126a 10
                SL   1                   ; 126b 13
                PK                       ; 126c 0c
                LR   DC,H                ; 126d 10
                SL   1                   ; 126e 13
                POP                      ; 126f 1c
                LR   IS,A                ; 1270 0b
                SL   1                   ; 1271 13
                XDC                      ; 1272 2c
                LR   IS,A                ; 1273 0b
                SL   1                   ; 1274 13
                DS   $7                  ; 1275 37
                LR   KL,A                ; 1276 05
                SL   1                   ; 1277 13
                LR   A,QL                ; 1278 03
                LR   P,K                 ; 1279 09
                LR   A,KU                ; 127a 00
                LR   QL,A                ; 127b 07
                LR   A,QL                ; 127c 03
                LR   P,K                 ; 127d 09
                NOP                      ; 127e 2b
                LR   A,KU                ; 127f 00
                LR   A,KU                ; 1280 00
                LR   KL,A                ; 1281 05
                SL   1                   ; 1282 13
                LR   A,QL                ; 1283 03
                LR   A,KU                ; 1284 00
                DS   $1                  ; 1285 31
                LR   H,DC                ; 1286 11
                NOP                      ; 1287 2b
                LR   A,KU                ; 1288 00
                NOP                      ; 1289 2b
                SL   1                   ; 128a 13
                LR   QL,A                ; 128b 07
                LR   A,KU                ; 128c 00
                CI   $27                 ; 128d 25 27
                LR   H,DC                ; 128f 11
                LR   KL,A                ; 1290 05
                LR   A,KL                ; 1291 01
                LR   A,KU                ; 1292 00
                DS   $1                  ; 1293 31
                LR   H,DC                ; 1294 11
                NOP                      ; 1295 2b
                LR   A,KU                ; 1296 00
                NOP                      ; 1297 2b
                SL   1                   ; 1298 13
                LR   QL,A                ; 1299 07
                LR   A,KU                ; 129a 00
                CI   $27                 ; 129b 25 27
                LR   H,DC                ; 129d 11
                LR   KL,A                ; 129e 05
                LR   A,KL                ; 129f 01
                LR   QL,A                ; 12a0 07
                LR   A,KU                ; 12a1 00
                LR   A,KL                ; 12a2 01
                NI   $00                 ; 12a3 21 00
                LR   H,DC                ; 12a5 11
                LR   A,KU                ; 12a6 00
                LR   QL,A                ; 12a7 07
                LR   A,KL                ; 12a8 01
                LR   IS,A                ; 12a9 0b
                NOP                      ; 12aa 2b
                SL   1                   ; 12ab 13
                NOP                      ; 12ac 2b
                POP                      ; 12ad 1c
                LR   IS,A                ; 12ae 0b
                JMP  $2507               ; 12af 29 25 07
                LR   KL,A                ; 12b2 05
                LR   A,KU                ; 12b3 00
                NI   $0f                 ; 12b4 21 0f
                LR   A,QL                ; 12b6 03
                LR   H,DC                ; 12b7 11
                LR   P,K                 ; 12b8 09
                LR   IS,A                ; 12b9 0b
                INC                      ; 12ba 1f
                SL   1                   ; 12bb 13
                LR   IS,A                ; 12bc 0b
                NI   $00                 ; 12bd 21 00
                NOP                      ; 12bf 2b
                SL   1                   ; 12c0 13
                LR   QL,A                ; 12c1 07
                LR   A,KU                ; 12c2 00
                LR   W,J                 ; 12c3 1d
                OUT  $11                 ; 12c4 27 11
                NOP                      ; 12c6 2b
                SL   4                   ; 12c7 15
                LR   KL,A                ; 12c8 05
                SL   1                   ; 12c9 13
                LR   A,QL                ; 12ca 03
                LR   A,KU                ; 12cb 00
                OUT  $13                 ; 12cc 27 13
                NI   $0b                 ; 12ce 21 0b
                LR   A,KU                ; 12d0 00
                LR   A,KU                ; 12d1 00
                LR   KL,A                ; 12d2 05
                SL   1                   ; 12d3 13
                LR   A,QL                ; 12d4 03
                LR   A,KU                ; 12d5 00
                LR   P0,Q                ; 12d6 0d
                LR   A,KL                ; 12d7 01
                NOP                      ; 12d8 2b
                LR   A,KU                ; 12d9 00
                LR   A,KU                ; 12da 00
                LR   KL,A                ; 12db 05
                SL   1                   ; 12dc 13
                LR   A,QL                ; 12dd 03
                LR   A,KU                ; 12de 00
                CI   $27                 ; 12df 25 27
                LR   H,DC                ; 12e1 11
                LR   KL,A                ; 12e2 05
                LR   A,KU                ; 12e3 00
                db   $2d                 
                OUT  $11                 ; 12e5 27 11
                DS   $1                  ; 12e7 31
                SL   4                   ; 12e8 15
; Unused message 10: YOU LPAY WHITE (sic); see $11EC and the fixed
; selector at $119D
                LR   KL,A                ; 12e9 05
                SL   1                   ; 12ea 13
                LR   A,QL                ; 12eb 03
                LR   A,KU                ; 12ec 00
                OUT  $25                 ; 12ed 27 25
                LR   H,DC                ; 12ef 11
                LR   KL,A                ; 12f0 05
                LR   A,KU                ; 12f1 00
                LR   P0,Q                ; 12f2 0d
                LNK                      ; 12f3 19
                LR   A,KL                ; 12f4 01
                LR   QL,A                ; 12f5 07
                LR   IS,A                ; 12f6 0b
                LR   KL,A                ; 12f7 05
                SL   1                   ; 12f8 13
                LR   A,QL                ; 12f9 03
                LR   A,KU                ; 12fa 00
                LNK                      ; 12fb 19
                LR   H,DC                ; 12fc 11
                db   $2f                 
                LR   IS,A                ; 12fe 0b
                LR   A,KU                ; 12ff 00
                db   $2d                 
                OUT  $13                 ; 1301 27 13
                DS   $1                  ; 1303 31
                SL   4                   ; 1304 15
                LR   IS,A                ; 1305 0b
                INC                      ; 1306 1f
                LR   A,KU                ; 1307 00
                EI                       ; 1308 1b
                LR   H,DC                ; 1309 11
                JMP  $0b0d               ; 130a 29 0b 0d
                LNK                      ; 130d 19
                LR   A,KL                ; 130e 01
                LR   QL,A                ; 130f 07
                LR   IS,A                ; 1310 0b
                LR   A,KU                ; 1311 00
                DS   $1                  ; 1312 31
                LR   H,DC                ; 1313 11
                NOP                      ; 1314 2b
                DS   $9                  ; 1315 39
                LR   QL,A                ; 1316 07
                LR   A,KU                ; 1317 00
                CI   $27                 ; 1318 25 27
                LR   H,DC                ; 131a 11
                LR   KL,A                ; 131b 05
                db   $2d                 
                OUT  $11                 ; 131d 27 11
                DS   $1                  ; 131f 31
                SL   4                   ; 1320 15
                LR   A,KU                ; 1321 00
                DS   $1                  ; 1322 31
                LR   H,DC                ; 1323 11
                NOP                      ; 1324 2b
                DS   $9                  ; 1325 39
                LR   QL,A                ; 1326 07
                LR   A,KU                ; 1327 00
                CI   $27                 ; 1328 25 27
                LR   H,DC                ; 132a 11
                LR   KL,A                ; 132b 05
                LR   P0,Q                ; 132c 0d
                LNK                      ; 132d 19
                LR   A,KL                ; 132e 01
                LR   QL,A                ; 132f 07
                LR   IS,A                ; 1330 0b
                LR   A,KU                ; 1331 00
                LR   P0,Q                ; 1332 0d
                LR   A,KL                ; 1333 01
                NOP                      ; 1334 2b
                NI   $00                 ; 1335 21 00
                db   $2d                 
                OUT  $11                 ; 1338 27 11
                DS   $1                  ; 133a 31
                SL   4                   ; 133b 15
                LR   A,KU                ; 133c 00
                LR   P0,Q                ; 133d 0d
                LR   A,KL                ; 133e 01
                NOP                      ; 133f 2b
                NI   $00                 ; 1340 21 00
A1342:          LR   K,P                 ; 1342 08
                PI   $40a9               ; 1343 28 40 a9
                LISU 2                   ; 1346 62
                LISL 4                   ; 1347 6c
                LIS  $0                  ; 1348 70
                LR   (IS),A              ; 1349 5c
A134a:          PI   $43d6               ; 134a 28 43 d6
                BT   4,A134a             ; 134d 84 fc
                BF   $1,A134a            ; 134f 91 fa
                PI   $40bc               ; 1351 28 40 bc
                LR   A,$8                ; 1354 48
                PK                       ; 1355 0c
A1356:          LR   K,P                 ; 1356 08
                DCI  $0c30               ; 1357 2a 0c 30
                LIS  $2                  ; 135a 72
                LR   $2,A                ; 135b 52
                LIS  $6                  ; 135c 76
A135d:          LR   $0,A                ; 135d 50
A135e:          LIS  $9                  ; 135e 79
                LR   $1,A                ; 135f 51
A1360:          LIS  $7                  ; 1360 77
                LR   $4,A                ; 1361 54
                LIS  $1                  ; 1362 71
A1363:          ST                       ; 1363 17
                DS   $4                  ; 1364 34
                BF   $4,A1363            ; 1365 94 fd
                LIS  $0                  ; 1367 70
                ST                       ; 1368 17
                DS   $1                  ; 1369 31
                BF   $4,A1360            ; 136a 94 f5
                LIS  $7                  ; 136c 77
                LR   $4,A                ; 136d 54
                LIS  $0                  ; 136e 70
                COM                      ; 136f 18
A1370:          ST                       ; 1370 17
                DS   $4                  ; 1371 34
                BF   $4,A1370            ; 1372 94 fd
                LI   $fe                 ; 1374 20 fe
                ST                       ; 1376 17
                DS   $0                  ; 1377 30
                BF   $4,A135e            ; 1378 94 e5
                DS   $2                  ; 137a 32
                BT   4,A1383             ; 137b 84 07
                DCI  $0f10               ; 137d 2a 0f 10
                LIS  $2                  ; 1380 72
                BF   $0,A135d            ; 1381 90 db
A1383:          LISU 3                   ; 1383 63
                LISL 0                   ; 1384 68
                LR   A,$b                ; 1385 4b
                NI   $10                 ; 1386 21 10
                DCI  $0f0a               ; 1388 2a 0f 0a
                LM                       ; 138b 16
                BT   4,A138f             ; 138c 84 02
                COM                      ; 138e 18
A138f:          LR   $4,A                ; 138f 54
                LIS  $1                  ; 1390 71
                LR   $0,A                ; 1391 50
A1392:          LIS  $7                  ; 1392 77
                LR   $1,A                ; 1393 51
A1394:          LIS  $7                  ; 1394 77
                LR   $2,A                ; 1395 52
                DCI  A175c               ; 1396 2a 17 5c
                LR   A,$1                ; 1399 41
                SL   1                   ; 139a 13
                ADC                      ; 139b 8e
                LM                       ; 139c 16
                LR   QU,A                ; 139d 06
                LM                       ; 139e 16
                LR   QL,A                ; 139f 07
                LIS  $0                  ; 13a0 70
                AS   (IS)+               ; 13a1 cd
                BT   4,A13ca             ; 13a2 84 27
                LR   $3,A                ; 13a4 53
A13a5:          NI   $01                 ; 13a5 21 01
                BT   4,A13c2             ; 13a7 84 1a
                LR   A,$2                ; 13a9 42
                LR   DC,Q                ; 13aa 0f
                ADC                      ; 13ab 8e
                XDC                      ; 13ac 2c
                DCI  A1a20               ; 13ad 2a 1a 20
                LIS  $0                  ; 13b0 70
                AS   $4                  ; 13b1 c4
                BT   4,A13b7             ; 13b2 84 04
                DCI  A1a26               ; 13b4 2a 1a 26
A13b7:          LIS  $7                  ; 13b7 77
                LR   $5,A                ; 13b8 55
A13b9:          LM                       ; 13b9 16
                XDC                      ; 13ba 2c
                ST                       ; 13bb 17
                LIS  $7                  ; 13bc 77
                ADC                      ; 13bd 8e
                XDC                      ; 13be 2c
                DS   $5                  ; 13bf 35
                BF   $4,A13b9            ; 13c0 94 f8
A13c2:          LR   A,$3                ; 13c2 43
                SR   1                   ; 13c3 12
                LR   $3,A                ; 13c4 53
                BT   4,A13ca             ; 13c5 84 04
                DS   $2                  ; 13c7 32
                BT   1,A13a5             ; 13c8 81 dc
A13ca:          DS   $1                  ; 13ca 31
                BT   1,A1394             ; 13cb 81 c8
                LR   A,$4                ; 13cd 44
                COM                      ; 13ce 18
                LR   $4,A                ; 13cf 54
                LISU 4                   ; 13d0 64
                DS   $0                  ; 13d1 30
                BT   1,A1392             ; 13d2 81 bf
                PK                       ; 13d4 0c
A13d5:          LR   K,P                 ; 13d5 08
                PI   $40a9               ; 13d6 28 40 a9
                DCI  $0f0c               ; 13d9 2a 0f 0c
                LIS  $7                  ; 13dc 77
                XM                       ; 13dd 8c
                LI   $ff                 ; 13de 20 ff
                BT   4,A13e3             ; 13e0 84 02
                LIS  $1                  ; 13e2 71
A13e3:          LR   $3,A                ; 13e3 53
                DCI  $0f0f               ; 13e4 2a 0f 0f
                LI   $4c                 ; 13e7 20 4c
                CM                       ; 13e9 8d
                LIS  $1                  ; 13ea 71
                BF   $4,A13ef            ; 13eb 94 03
                COM                      ; 13ed 18
                INC                      ; 13ee 1f
A13ef:          LR   $4,A                ; 13ef 54
                BF   $0,A1431            ; 13f0 90 40
A13f2:          PI   A1682               ; 13f2 28 16 82
                DCI  $0f0b               ; 13f5 2a 0f 0b
                LIS  $0                  ; 13f8 70
                AM                       ; 13f9 88
                BT   4,A140c             ; 13fa 84 11
                DCI  $0f0a               ; 13fc 2a 0f 0a
                LIS  $0                  ; 13ff 70
                AM                       ; 1400 88
                BF   $1,A140c            ; 1401 91 0a
                LIS  $3                  ; 1403 73
                LR   $a,A                ; 1404 5a
                PI   $21ad               ; 1405 28 21 ad
                LR   $3,A                ; 1408 53
                LIS  $2                  ; 1409 72
                BF   $0,A1413            ; 140a 90 08
A140c:          LIS  $1                  ; 140c 71
                LR   $a,A                ; 140d 5a
                PI   $21ad               ; 140e 28 21 ad
                LR   $3,A                ; 1411 53
                LIS  $0                  ; 1412 70
A1413:          LR   $a,A                ; 1413 5a
                PI   $21ad               ; 1414 28 21 ad
                LR   $0,A                ; 1417 50
                PI   A153c               ; 1418 28 15 3c
                LR   $4,A                ; 141b 54
                LR   A,$3                ; 141c 43
                LR   $0,A                ; 141d 50
                PI   A153c               ; 141e 28 15 3c
                LR   $3,A                ; 1421 53
                PI   A1682               ; 1422 28 16 82
                LIS  $4                  ; 1425 74
                LR   $0,A                ; 1426 50
A1427:          PI   A1682               ; 1427 28 16 82
                DS   $0                  ; 142a 30
                BF   $4,A1427            ; 142b 94 fb
                LIS  $0                  ; 142d 70
                XS   $3                  ; 142e e3
                BT   4,A1479             ; 142f 84 49
A1431:          DCI  $0f0c               ; 1431 2a 0f 0c
                LM                       ; 1434 16
                LR   $1,A                ; 1435 51
                LISU 2                   ; 1436 62
                LISL 0                   ; 1437 68
                LIS  $0                  ; 1438 70
                LR   (IS)+,A             ; 1439 5d
                LM                       ; 143a 16
                LR   (IS)+,A             ; 143b 5d
                LM                       ; 143c 16
                LR   (IS),A              ; 143d 5c
                LIS  $0                  ; 143e 70
                XS   $3                  ; 143f e3
                BF   $1,A1451            ; 1440 91 10
                PI   $27d3               ; 1442 28 27 d3
                LIS  $7                  ; 1445 77
                XS   $1                  ; 1446 e1
                BF   $4,A146c            ; 1447 94 24
                LISL 2                   ; 1449 6a
                XS   (IS)                ; 144a ec
                BT   4,A146c             ; 144b 84 20
A144d:          LIS  $0                  ; 144d 70
                LR   $3,A                ; 144e 53
                BF   $0,A1479            ; 144f 90 29
A1451:          PI   $27c6               ; 1451 28 27 c6
                LIS  $0                  ; 1454 70
                XS   $1                  ; 1455 e1
                BF   $4,A145c            ; 1456 94 05
                LISL 0                   ; 1458 68
                XS   (IS)                ; 1459 ec
                BF   $4,A144d            ; 145a 94 f2
A145c:          LISL 0                   ; 145c 68
                LIS  $0                  ; 145d 70
                XS   (IS)                ; 145e ec
                BT   4,A1479             ; 145f 84 19
                LISL 1                   ; 1461 69
                LR   A,(IS)+             ; 1462 4d
                LR   (IS),A              ; 1463 5c
                LISL 0                   ; 1464 68
                LR   A,(IS)+             ; 1465 4d
                LR   (IS)-,A             ; 1466 5e
                LIS  $0                  ; 1467 70
                LR   (IS),A              ; 1468 5c
                DS   $1                  ; 1469 31
                BF   $0,A1479            ; 146a 90 0e
A146c:          LISL 1                   ; 146c 69
                LIS  $0                  ; 146d 70
                XS   (IS)                ; 146e ec
                BF   $4,A1479            ; 146f 94 09
                LISL 2                   ; 1471 6a
                LR   A,(IS)-             ; 1472 4e
                LR   (IS)+,A             ; 1473 5d
                LIS  $0                  ; 1474 70
                LR   (IS)-,A             ; 1475 5e
                LIS  $1                  ; 1476 71
                AS   $1                  ; 1477 c1
                LR   $1,A                ; 1478 51
A1479:          LIS  $0                  ; 1479 70
                XS   $4                  ; 147a e4
                BT   4,A148c             ; 147b 84 10
                DCI  $0f0f               ; 147d 2a 0f 0f
                AM                       ; 1480 88
                BF   $1,A1487            ; 1481 91 05
                CI   $4c                 ; 1483 25 4c
                BT   2,A148b             ; 1485 82 05
A1487:          LIS  $0                  ; 1487 70
                LR   $4,A                ; 1488 54
                BF   $0,A148c            ; 1489 90 02
A148b:          LR   $2,A                ; 148b 52
A148c:          LR   A,$4                ; 148c 44
                SL   1                   ; 148d 13
                XS   $3                  ; 148e e3
                BT   4,A14ae             ; 148f 84 1e
                PI   A14ff               ; 1491 28 14 ff
                LIS  $0                  ; 1494 70
                XS   $4                  ; 1495 e4
                BT   4,A14a1             ; 1496 84 0a
                DCI  $0f0f               ; 1498 2a 0f 0f
                LR   A,$2                ; 149b 42
                ST                       ; 149c 17
                LIS  $0                  ; 149d 70
                XS   $3                  ; 149e e3
                BT   4,A14ab             ; 149f 84 0b
A14a1:          DCI  $0f0c               ; 14a1 2a 0f 0c
                LR   A,$1                ; 14a4 41
                ST                       ; 14a5 17
                LISL 1                   ; 14a6 69
                LR   A,(IS)+             ; 14a7 4d
                ST                       ; 14a8 17
                LR   A,(IS)              ; 14a9 4c
                ST                       ; 14aa 17
A14ab:          PI   A14ff               ; 14ab 28 14 ff
A14ae:          LIS  $0                  ; 14ae 70
                OUTS 1                   ; 14af b1
                NOP                      ; 14b0 2b
                NOP                      ; 14b1 2b
                NOP                      ; 14b2 2b
                DCI  $0f0b               ; 14b3 2a 0f 0b
                LIS  $0                  ; 14b6 70
                AM                       ; 14b7 88
                BT   4,A14c6             ; 14b8 84 0d
                DCI  $0f0a               ; 14ba 2a 0f 0a
                LIS  $0                  ; 14bd 70
                AM                       ; 14be 88
                BF   $4,A14c6            ; 14bf 94 06
                INS  1                   ; 14c1 a1
                NI   $02                 ; 14c2 21 02
                BF   $0,A14c9            ; 14c4 90 04
A14c6:          INS  1                   ; 14c6 a1
                NI   $01                 ; 14c7 21 01
A14c9:          DCI  $0c20               ; 14c9 2a 0c 20
                LIS  $0                  ; 14cc 70
                BF   $4,A14d3            ; 14cd 94 05
                ST                       ; 14cf 17
A14d0:          JMP  A13f2               ; 14d0 29 13 f2
A14d3:          LR   Q,DC                ; 14d3 0e
                XM                       ; 14d4 8c
                BF   $4,A14d0            ; 14d5 94 fa
                LIS  $1                  ; 14d7 71
                LR   DC,Q                ; 14d8 0f
                ST                       ; 14d9 17
                LIS  $0                  ; 14da 70
                LR   $0,A                ; 14db 50
A14dc:          LR   A,$2                ; 14dc 42
                CI   $09                 ; 14dd 25 09
                BT   2,A14ea             ; 14df 82 0a
                LR   A,$0                ; 14e1 40
                INC                      ; 14e2 1f
                LR   $0,A                ; 14e3 50
                LI   $f6                 ; 14e4 20 f6
                AS   $2                  ; 14e6 c2
                LR   $2,A                ; 14e7 52
                BF   $0,A14dc            ; 14e8 90 f3
A14ea:          LR   A,$0                ; 14ea 40
                LR   $4,A                ; 14eb 54
                LIS  $8                  ; 14ec 78
                SL   4                   ; 14ed 15
A14ee:          DS   $1                  ; 14ee 31
                BF   $1,A14f4            ; 14ef 91 04
                SR   1                   ; 14f1 12
                BF   $0,A14ee            ; 14f2 90 fb
A14f4:          LR   $3,A                ; 14f4 53
                PI   A1682               ; 14f5 28 16 82
                PI   A16ad               ; 14f8 28 16 ad
                PI   $40bc               ; 14fb 28 40 bc
                PK                       ; 14fe 0c
A14ff:          LR   K,P                 ; 14ff 08
                DCI  $0f0c               ; 1500 2a 0f 0c
                LM                       ; 1503 16
                LR   $0,A                ; 1504 50
                LISU 2                   ; 1505 62
                LISL 3                   ; 1506 6b
                LM                       ; 1507 16
                LR   (IS)+,A             ; 1508 5d
                LM                       ; 1509 16
                LR   (IS)-,A             ; 150a 5e
                DCI  $0f0f               ; 150b 2a 0f 0f
                LM                       ; 150e 16
                DCI  $0c30               ; 150f 2a 0c 30
                ADC                      ; 1512 8e
                ADC                      ; 1513 8e
                ADC                      ; 1514 8e
                ADC                      ; 1515 8e
                ADC                      ; 1516 8e
                ADC                      ; 1517 8e
                ADC                      ; 1518 8e
                ADC                      ; 1519 8e
                LR   A,$0                ; 151a 40
                ADC                      ; 151b 8e
                LIS  $3                  ; 151c 73
                LR   $0,A                ; 151d 50
A151e:          LR   Q,DC                ; 151e 0e
                LR   A,QU                ; 151f 02
                CI   $0e                 ; 1520 25 0e
                BF   $4,A152c            ; 1522 94 09
                LR   A,QL                ; 1524 03
                CI   $0f                 ; 1525 25 0f
                BT   2,A152c             ; 1527 82 04
                LIS  $f                  ; 1529 7f
                LR   QU,A                ; 152a 06
                LR   DC,Q                ; 152b 0f
A152c:          LR   A,(IS)+             ; 152c 4d
                LR   Q,DC                ; 152d 0e
                XM                       ; 152e 8c
                LR   DC,Q                ; 152f 0f
                ST                       ; 1530 17
                LR   Q,DC                ; 1531 0e
                LR   A,(IS)-             ; 1532 4e
                XM                       ; 1533 8c
                LR   DC,Q                ; 1534 0f
                ST                       ; 1535 17
                LIS  $6                  ; 1536 76
                ADC                      ; 1537 8e
                DS   $0                  ; 1538 30
                BF   $4,A151e            ; 1539 94 e4
                PK                       ; 153b 0c
A153c:          LR   A,$0                ; 153c 40
                CI   $40                 ; 153d 25 40
                BF   $2,A1545            ; 153f 92 05
                LIS  $0                  ; 1541 70
                COM                      ; 1542 18
                BF   $0,A154b            ; 1543 90 07
A1545:          CI   $c0                 ; 1545 25 c0
                LIS  $0                  ; 1547 70
                BT   2,A154b             ; 1548 82 02
                LIS  $1                  ; 154a 71
A154b:          POP                      ; 154b 1c
A154c:          LR   KL,A                ; 154c 05
                SL   1                   ; 154d 13
                LR   A,QL                ; 154e 03
                LR   A,KU                ; 154f 00
                CI   $27                 ; 1550 25 27
                LR   H,DC                ; 1552 11
                LR   KL,A                ; 1553 05
                LR   A,KU                ; 1554 00
                LR   W,J                 ; 1555 1d
                LR   A,KL                ; 1556 01
                LR   P,K                 ; 1557 09
                NI   $07                 ; 1558 21 07
                LR   A,KU                ; 155a 00
                DS   $5                  ; 155b 35
                LR   A,KU                ; 155c 00
                LR   A,KU                ; 155d 00
                LR   A,KU                ; 155e 00
                LR   A,KU                ; 155f 00
                LR   KL,A                ; 1560 05
                LR   A,KU                ; 1561 00
                SL   1                   ; 1562 13
                LR   P,K                 ; 1563 09
                LR   A,KU                ; 1564 00
                NOP                      ; 1565 2b
; Opponent-selection menu: ABE, BETTY, CHARLIE, DOROTHY, ERNEST and
; A FRIEND
A1566:          LR   QL,A                ; 1566 07
                SL   1                   ; 1567 13
                LR   A,KU                ; 1568 00
                CI   $27                 ; 1569 25 27
                LR   H,DC                ; 156b 11
                LR   KL,A                ; 156c 05
                LR   A,KU                ; 156d 00
                LR   A,KU                ; 156e 00
                LR   A,KU                ; 156f 00
                LR   A,KU                ; 1570 00
                LR   A,KU                ; 1571 00
                LR   QL,A                ; 1572 07
                LR   KL,A                ; 1573 05
                CI   $0b                 ; 1574 25 0b
                LR   A,KU                ; 1576 00
                LR   A,KU                ; 1577 00
                LR   A,KU                ; 1578 00
                LR   H,DC                ; 1579 11
                db   $2d                 
                LR   IS,A                ; 157b 0b
                LR   A,KU                ; 157c 00
                LR   A,KU                ; 157d 00
                LR   A,KU                ; 157e 00
                LR   A,KU                ; 157f 00
                LR   A,KU                ; 1580 00
                LR   A,KU                ; 1581 00
                LR   A,KU                ; 1582 00
                LR   A,KU                ; 1583 00
                LR   H,DC                ; 1584 11
                LR   A,KU                ; 1585 00
                LR   A,KU                ; 1586 00
                LR   A,KU                ; 1587 00
                LR   A,KU                ; 1588 00
                db   $2d                 
                LR   IS,A                ; 158a 0b
                LR   QL,A                ; 158b 07
                LR   QL,A                ; 158c 07
                LR   KL,A                ; 158d 05
                LR   A,KU                ; 158e 00
                LR   A,KU                ; 158f 00
                LR   A,KU                ; 1590 00
                LR   A,KU                ; 1591 00
                LR   A,KU                ; 1592 00
                LR   A,KU                ; 1593 00
                db   $2d                 
                LR   A,KU                ; 1595 00
                LR   A,KU                ; 1596 00
                LR   A,KU                ; 1597 00
                LR   A,KU                ; 1598 00
                DS   $1                  ; 1599 31
                LNK                      ; 159a 19
                LR   H,DC                ; 159b 11
                LR   P,K                 ; 159c 09
                OUT  $01                 ; 159d 27 01
                LR   IS,A                ; 159f 0b
                LR   A,KU                ; 15a0 00
                LR   A,KU                ; 15a1 00
                LR   A,KU                ; 15a2 00
                LR   A,KU                ; 15a3 00
                DS   $1                  ; 15a4 31
                LR   A,KU                ; 15a5 00
                LR   A,KU                ; 15a6 00
                LR   A,KU                ; 15a7 00
                LR   A,KU                ; 15a8 00
                INC                      ; 15a9 1f
                SL   1                   ; 15aa 13
                LR   P,K                 ; 15ab 09
                SL   1                   ; 15ac 13
                LR   QL,A                ; 15ad 07
                LNK                      ; 15ae 19
                LR   KL,A                ; 15af 05
                LR   A,KU                ; 15b0 00
                LR   A,KU                ; 15b1 00
                LR   A,KU                ; 15b2 00
                LR   A,KU                ; 15b3 00
                INC                      ; 15b4 1f
                LR   A,KU                ; 15b5 00
                LR   A,KU                ; 15b6 00
                LR   A,KU                ; 15b7 00
                LR   A,KU                ; 15b8 00
                LR   IS,A                ; 15b9 0b
                LR   P,K                 ; 15ba 09
                NOP                      ; 15bb 2b
                LR   IS,A                ; 15bc 0b
                NI   $07                 ; 15bd 21 07
                LR   A,KU                ; 15bf 00
                LR   A,KU                ; 15c0 00
                LR   A,KU                ; 15c1 00
                LR   A,KU                ; 15c2 00
                LR   A,KU                ; 15c3 00
                LR   IS,A                ; 15c4 0b
                LR   A,KU                ; 15c5 00
                LR   A,KU                ; 15c6 00
                LR   A,KU                ; 15c7 00
                LR   A,KU                ; 15c8 00
                LR   H,DC                ; 15c9 11
                LR   A,KU                ; 15ca 00
                LR   W,J                 ; 15cb 1d
                LR   P,K                 ; 15cc 09
                LR   A,KL                ; 15cd 01
                LR   IS,A                ; 15ce 0b
                NOP                      ; 15cf 2b
                INC                      ; 15d0 1f
                LR   A,KU                ; 15d1 00
                LR   A,KU                ; 15d2 00
                LR   A,KU                ; 15d3 00
                LR   W,J                 ; 15d4 1d
                LR   A,KU                ; 15d5 00
                LR   $8,A                ; 15d6 58
                LR   A,IS                ; 15d7 0a
                LISU 6                   ; 15d8 66
                LISL 0                   ; 15d9 68
                LR   (IS)+,A             ; 15da 5d
                LR   A,$a                ; 15db 4a
                LR   (IS)+,A             ; 15dc 5d
                LR   A,$b                ; 15dd 4b
                LR   (IS)+,A             ; 15de 5d
                LR   A,$9                ; 15df 49
                LR   (IS)+,A             ; 15e0 5d
                LR   H,DC                ; 15e1 11
                DCI  $0fc8               ; 15e2 2a 0f c8
                LR   A,$a                ; 15e5 4a
                ST                       ; 15e6 17
                LR   A,$b                ; 15e7 4b
                ST                       ; 15e8 17
                XDC                      ; 15e9 2c
                LR   H,DC                ; 15ea 11
                XDC                      ; 15eb 2c
                LR   A,$a                ; 15ec 4a
                ST                       ; 15ed 17
                LR   A,$b                ; 15ee 4b
                ST                       ; 15ef 17
                LR   A,KU                ; 15f0 00
                ST                       ; 15f1 17
                LR   A,KL                ; 15f2 01
                ST                       ; 15f3 17
                LR   K,P                 ; 15f4 08
                LR   A,KU                ; 15f5 00
                ST                       ; 15f6 17
                LR   A,KL                ; 15f7 01
                ST                       ; 15f8 17
                LR   J,W                 ; 15f9 1e
                LISU 2                   ; 15fa 62
                LISL 3                   ; 15fb 6b
A15fc:          LR   A,(IS)-             ; 15fc 4e
                ST                       ; 15fd 17
                BR7  A15fc               ; 15fe 8f fd
                DCI  $0fea               ; 1600 2a 0f ea
                LI   $01                 ; 1603 20 01
                XM                       ; 1605 8c
                DCI  $08f7               ; 1606 2a 08 f7
                ST                       ; 1609 17
                PI   $424d               ; 160a 28 42 4d
                LI   $34                 ; 160d 20 34
A160f:          DCI  $08fb               ; 160f 2a 08 fb
                CM                       ; 1612 8d
                BF   $4,A160f            ; 1613 94 fb
                DCI  $0fea               ; 1615 2a 0f ea
                LM                       ; 1618 16
                DCI  $08f7               ; 1619 2a 08 f7
                ST                       ; 161c 17
                DCI  $0fc8               ; 161d 2a 0f c8
                LM                       ; 1620 16
                LR   $a,A                ; 1621 5a
                LM                       ; 1622 16
                LR   $b,A                ; 1623 5b
                XDC                      ; 1624 2c
                LR   DC,H                ; 1625 10
                XDC                      ; 1626 2c
                LM                       ; 1627 16
                LR   $a,A                ; 1628 5a
                LM                       ; 1629 16
                LR   $b,A                ; 162a 5b
                LIS  $2                  ; 162b 72
                ADC                      ; 162c 8e
                LM                       ; 162d 16
                LR   KU,A                ; 162e 04
                LM                       ; 162f 16
                LR   KL,A                ; 1630 05
                LR   P,K                 ; 1631 09
                LISU 2                   ; 1632 62
                LISL 3                   ; 1633 6b
A1634:          LM                       ; 1634 16
                LR   (IS)-,A             ; 1635 5e
                BR7  A1634               ; 1636 8f fd
                DCI  $0fcc               ; 1638 2a 0f cc
                LM                       ; 163b 16
                LR   KU,A                ; 163c 04
                LM                       ; 163d 16
                LR   KL,A                ; 163e 05
                LR   DC,H                ; 163f 10
                XDC                      ; 1640 2c
                LR   W,J                 ; 1641 1d
                LISU 6                   ; 1642 66
                LISL 3                   ; 1643 6b
                LR   A,(IS)-             ; 1644 4e
                LR   $9,A                ; 1645 59
                LR   A,(IS)-             ; 1646 4e
                LR   $b,A                ; 1647 5b
                LR   A,(IS)-             ; 1648 4e
                LR   $a,A                ; 1649 5a
                LR   A,(IS)-             ; 164a 4e
                LR   IS,A                ; 164b 0b
                LR   A,$8                ; 164c 48
                EI                       ; 164d 1b
                POP                      ; 164e 1c
                DS   $0                  ; 164f 30
                LR   DC,H                ; 1650 10
                db   $5f                 
                XS   (IS)                ; 1652 ec
                db   $ef                 
                XS   (IS)-               ; 1654 ee
                LR   A,$8                ; 1655 48
                LR   A,$8                ; 1656 48
                LIS  $0                  ; 1657 70
                DS   (IS)                ; 1658 3c
                SL   1                   ; 1659 13
                LR   QL,A                ; 165a 07
                LR   P0,Q                ; 165b 0d
                LR   P0,Q                ; 165c 0d
                POP                      ; 165d 1c
                LR   A,$8                ; 165e 48
                AS   $0                  ; 165f c0
                IN   $00                 ; 1660 26 00
                LR   A,KL                ; 1662 01
;                BT   2,48                ; 1663 82 30
				db   $82,$30
                LR   DC,H                ; 1665 10
                db   $5f                 
                XS   (IS)                ; 1667 ec
                db   $ef                 
                XS   (IS)-               ; 1669 ee
                DS   (IS)                ; 166a 3c
                SL   1                   ; 166b 13
                LR   QL,A                ; 166c 07
A166d:          LR   A,KL                ; 166d 01
                LM                       ; 166e 16
                LISU 4                   ; 166f 64
                LM                       ; 1670 16
                LISU 4                   ; 1671 64
                PK                       ; 1672 0c
                DS   $0                  ; 1673 30
                PK                       ; 1674 0c
                BT   0,A1682             ; 1675 80 0c
                ASD  $0                  ; 1677 d0
                LR   P0,Q                ; 1678 0d
                LI   $0d                 ; 1679 20 0d
                LIS  $0                  ; 167b 70
                LR   P0,Q                ; 167c 0d
                AS   $0                  ; 167d c0
                LR   DC,Q                ; 167e 0f
                LR   DC,H                ; 167f 10
                LR   DC,Q                ; 1680 0f
                LISU 0                   ; 1681 60
A1682:          LR   K,P                 ; 1682 08
                PI   $40a9               ; 1683 28 40 a9
                PI   A16cb               ; 1686 28 16 cb
                PI   $4501               ; 1689 28 45 01
                DCI  $0fea               ; 168c 2a 0f ea
                LI   $01                 ; 168f 20 01
                XM                       ; 1691 8c
                DCI  $08f7               ; 1692 2a 08 f7
                ST                       ; 1695 17
                PI   $424d               ; 1696 28 42 4d
                LI   $34                 ; 1699 20 34
A169b:          DCI  $08fb               ; 169b 2a 08 fb
                CM                       ; 169e 8d
                BF   $4,A169b            ; 169f 94 fb
                DCI  $0fea               ; 16a1 2a 0f ea
                LM                       ; 16a4 16
                DCI  $08f7               ; 16a5 2a 08 f7
                ST                       ; 16a8 17
                PI   $40bc               ; 16a9 28 40 bc
                PK                       ; 16ac 0c
A16ad:          LI   $15                 ; 16ad 20 15
                OUTS 12                  ; 16af bc
                LI   $d6                 ; 16b0 20 d6
                OUTS 13                  ; 16b2 bd
                DCI  $08f0               ; 16b3 2a 08 f0
                LI   $f5                 ; 16b6 20 f5
                ST                       ; 16b8 17
                DCI  $0fea               ; 16b9 2a 0f ea
                LIS  $8                  ; 16bc 78
                OM                       ; 16bd 8b
                DCI  $0fea               ; 16be 2a 0f ea
                ST                       ; 16c1 17
                DCI  $08f7               ; 16c2 2a 08 f7
                ST                       ; 16c5 17
                LIS  $1                  ; 16c6 71
                OUTS 14                  ; 16c7 be
                EI                       ; 16c8 1b
                LR   J,W                 ; 16c9 1e
                POP                      ; 16ca 1c
A16cb:          DI                       ; 16cb 1a
                LR   J,W                 ; 16cc 1e
                DCI  $0fea               ; 16cd 2a 0f ea
                LIS  $8                  ; 16d0 78
                COM                      ; 16d1 18
                NM                       ; 16d2 8a
                DCI  $0fea               ; 16d3 2a 0f ea
                ST                       ; 16d6 17
                DCI  $08f7               ; 16d7 2a 08 f7
                ST                       ; 16da 17
                LIS  $0                  ; 16db 70
                OUTS 14                  ; 16dc be
                POP                      ; 16dd 1c
A16de:          LR   K,P                 ; 16de 08
                LISU 3                   ; 16df 63
                LISL 0                   ; 16e0 68
A16e1:          LM                       ; 16e1 16
                LR   (IS)+,A             ; 16e2 5d
                BR7  A16e1               ; 16e3 8f fd
                LM                       ; 16e5 16
                LR   (IS)+,A             ; 16e6 5d
                LISU 4                   ; 16e7 64
A16e8:          LM                       ; 16e8 16
                LR   (IS)+,A             ; 16e9 5d
                BR7  A16e8               ; 16ea 8f fd
                LM                       ; 16ec 16
                LR   (IS)+,A             ; 16ed 5d
                PK                       ; 16ee 0c
A16ef:          LR   K,P                 ; 16ef 08
                LISU 4                   ; 16f0 64
                LISL 0                   ; 16f1 68
A16f2:          LR   A,(IS)+             ; 16f2 4d
                ST                       ; 16f3 17
                BR7  A16f2               ; 16f4 8f fd
                LR   A,(IS)+             ; 16f6 4d
                ST                       ; 16f7 17
                LISU 3                   ; 16f8 63
                LISL 0                   ; 16f9 68
A16fa:          LR   A,(IS)+             ; 16fa 4d
                ST                       ; 16fb 17
                BR7  A16fa               ; 16fc 8f fd
                LR   A,(IS)+             ; 16fe 4d
                ST                       ; 16ff 17
                PK                       ; 1700 0c
A1701:          LR   K,P                 ; 1701 08
                LISU 3                   ; 1702 63
                LISL 0                   ; 1703 68
A1704:          LR   A,(IS)+             ; 1704 4d
                ST                       ; 1705 17
                BR7  A1704               ; 1706 8f fd
                LR   A,(IS)+             ; 1708 4d
                ST                       ; 1709 17
                LISU 4                   ; 170a 64
                LISL 0                   ; 170b 68
A170c:          LR   A,(IS)+             ; 170c 4d
                ST                       ; 170d 17
                BR7  A170c               ; 170e 8f fd
                LR   A,(IS)+             ; 1710 4d
                ST                       ; 1711 17
                PK                       ; 1712 0c
A1713:          LR   K,P                 ; 1713 08
                LISL 7                   ; 1714 6f
                LIS  $0                  ; 1715 70
                LR   $0,A                ; 1716 50
A1717:          AS   (IS)-               ; 1717 ce
                BT   1,A171b             ; 1718 81 02
A171a:          DS   $0                  ; 171a 30
A171b:          SL   1                   ; 171b 13
                BF   $1,A171a            ; 171c 91 fd
                BF   $4,A171b            ; 171e 94 fc
                BR7  A1717               ; 1720 8f f6
                PK                       ; 1722 0c
A1723:          LR   DC,H                ; 1723 10
                LR   A,QU                ; 1724 02
                LI   $03                 ; 1725 20 03
                LR   KU,A                ; 1727 04
                LR   KU,A                ; 1728 04
                LR   K,P                 ; 1729 08
                LR   KL,A                ; 172a 05
                LR   A,KU                ; 172b 00
A172c:          LI   $02                 ; 172c 20 02
                LI   $02                 ; 172e 20 02
                LR   K,P                 ; 1730 08
                LR   A,QU                ; 1731 02
                LI   $04                 ; 1732 20 04
                LR   K,P                 ; 1734 08
                LR   A,QU                ; 1735 02
                LI   $02                 ; 1736 20 02
                LI   $02                 ; 1738 20 02
                LI   $04                 ; 173a 20 04
                LR   KU,A                ; 173c 04
                LR   A,QL                ; 173d 03
                LR   KU,A                ; 173e 04
                LR   KL,A                ; 173f 05
                LR   KU,A                ; 1740 04
                LR   KL,A                ; 1741 05
                LR   DC,H                ; 1742 10
                LR   KL,A                ; 1743 05
                LR   KU,A                ; 1744 04
                LR   A,QL                ; 1745 03
                LR   KU,A                ; 1746 04
                LR   KL,A                ; 1747 05
                LR   KU,A                ; 1748 04
                LR   KL,A                ; 1749 05
                LR   DC,H                ; 174a 10
                LR   KL,A                ; 174b 05
A174c:          db   $ff                 
                db   $ff                 
                db   $ff                 
                LR   A,KU                ; 174f 00
                db   $ff                 
                LR   A,KL                ; 1751 01
                LR   A,KU                ; 1752 00
                db   $ff                 
                LR   A,KU                ; 1754 00
                LR   A,KL                ; 1755 01
                LR   A,KL                ; 1756 01
                db   $ff                 
                LR   A,KL                ; 1758 01
                LR   A,KU                ; 1759 00
                LR   A,KL                ; 175a 01
                LR   A,KL                ; 175b 01
A175c:          LR   DC,Q                ; 175c 0f
                LISL 0                   ; 175d 68
                LR   DC,Q                ; 175e 0f
                COM                      ; 175f 18
                LR   P0,Q                ; 1760 0d
                AS   $8                  ; 1761 c8
                LR   P0,Q                ; 1762 0d
                LIS  $8                  ; 1763 78
                LR   P0,Q                ; 1764 0d
                PI   $0cd8               ; 1765 28 0c d8
                PK                       ; 1768 0c
                AM                       ; 1769 88
                PK                       ; 176a 0c
                DS   $8                  ; 176b 38
A176c:          LR   K,P                 ; 176c 08
                LIS  $f                  ; 176d 7f
                LR   $1,A                ; 176e 51
A176f:          LIS  $0                  ; 176f 70
                LR   $2,A                ; 1770 52
A1771:          DS   $2                  ; 1771 32
                BF   $4,A1771            ; 1772 94 fe
                DS   $1                  ; 1774 31
                BF   $4,A176f            ; 1775 94 f9
                PK                       ; 1777 0c
A1778:          LR   K,P                 ; 1778 08
                PI   $40a9               ; 1779 28 40 a9
                LR   A,$4                ; 177c 44
                LR   $6,A                ; 177d 56
A177e:          PI   A1682               ; 177e 28 16 82
                LIS  $0                  ; 1781 70
                LR   $8,A                ; 1782 58
                LR   A,$6                ; 1783 46
A1784:          CI   $09                 ; 1784 25 09
                BT   1,A178d             ; 1786 81 06
                AI   $f6                 ; 1788 24 f6
                DS   $8                  ; 178a 38
                BF   $0,A1784            ; 178b 90 f8
A178d:          LR   $6,A                ; 178d 56
                LR   A,$8                ; 178e 48
                COM                      ; 178f 18
                INC                      ; 1790 1f
                BT   4,A17a0             ; 1791 84 0e
                LR   $8,A                ; 1793 58
                PI   $4105               ; 1794 28 41 05
                DCI  $0fdf               ; 1797 2a 0f df
                LM                       ; 179a 16
                INC                      ; 179b 1f
                DCI  $0fdf               ; 179c 2a 0f df
                ST                       ; 179f 17
A17a0:          LR   A,$6                ; 17a0 46
                LR   $8,A                ; 17a1 58
                PI   $4105               ; 17a2 28 41 05
                DCI  $0fdf               ; 17a5 2a 0f df
                LM                       ; 17a8 16
                INC                      ; 17a9 1f
                DCI  $0fdf               ; 17aa 2a 0f df
                ST                       ; 17ad 17
                LIS  $0                  ; 17ae 70
                AS   $4                  ; 17af c4
                BF   $1,A17c8            ; 17b0 91 17
                LIS  $0                  ; 17b2 70
                COM                      ; 17b3 18
                LR   $4,A                ; 17b4 54
                LI   $1c                 ; 17b5 20 1c
                LR   $8,A                ; 17b7 58
                PI   $40d9               ; 17b8 28 40 d9
                DCI  $0fdf               ; 17bb 2a 0f df
                LM                       ; 17be 16
                INC                      ; 17bf 1f
                DCI  $0fdf               ; 17c0 2a 0f df
                ST                       ; 17c3 17
                LR   A,$5                ; 17c4 45
                LR   $6,A                ; 17c5 56
                BF   $0,A177e            ; 17c6 90 b7
A17c8:          PI   A1682               ; 17c8 28 16 82
                PI   A16ad               ; 17cb 28 16 ad
                PI   $40bc               ; 17ce 28 40 bc
                PK                       ; 17d1 0c
A17d2:          DCI  $08f5               ; 17d2 2a 08 f5
                LIS  $0                  ; 17d5 70
                ST                       ; 17d6 17
                LIS  $c                  ; 17d7 7c
                LR   $0,A                ; 17d8 50
                PI   A11ec               ; 17d9 28 11 ec
                LI   $70                 ; 17dc 20 70
                LR   $0,A                ; 17de 50
A17df:          PI   A1682               ; 17df 28 16 82
                DS   $0                  ; 17e2 30
                BF   $4,A17df            ; 17e3 94 fb
                PI   A16ad               ; 17e5 28 16 ad
A17e8:          LISU 4                   ; 17e8 64
                PI   A1713               ; 17e9 28 17 13
                LR   A,$0                ; 17ec 40
                COM                      ; 17ed 18
                INC                      ; 17ee 1f
                LR   $4,A                ; 17ef 54
                LISU 3                   ; 17f0 63
                PI   A1713               ; 17f1 28 17 13
                LR   A,$0                ; 17f4 40
                COM                      ; 17f5 18
                INC                      ; 17f6 1f
                LR   $5,A                ; 17f7 55
                DCI  $08f5               ; 17f8 2a 08 f5
                LIS  $0                  ; 17fb 70
                ST                       ; 17fc 17
                DCI  $0f0b               ; 17fd 2a 0f 0b
                LIS  $0                  ; 1800 70
                AM                       ; 1801 88
                BT   4,A1825             ; 1802 84 22
                LR   A,$4                ; 1804 44
                AS   $0                  ; 1805 c0
                BT   4,A183a             ; 1806 84 33
                BT   1,A1819             ; 1808 81 10
                LR   A,$4                ; 180a 44
                LR   $0,A                ; 180b 50
                LR   A,$5                ; 180c 45
                LR   $4,A                ; 180d 54
                LR   A,$0                ; 180e 40
                LR   $5,A                ; 180f 55
                DCI  $0f0a               ; 1810 2a 0f 0a
                LM                       ; 1813 16
                COM                      ; 1814 18
                DCI  $0f0a               ; 1815 2a 0f 0a
                ST                       ; 1818 17
A1819:          DCI  $0f0a               ; 1819 2a 0f 0a
                LIS  $0                  ; 181c 70
                AM                       ; 181d 88
                LI   $11                 ; 181e 20 11
                BF   $4,A182d            ; 1820 94 0c
                INC                      ; 1822 1f
                BF   $0,A182d            ; 1823 90 09
A1825:          LR   A,$4                ; 1825 44
                AS   $0                  ; 1826 c0
                BT   4,A183a             ; 1827 84 12
                LIS  $7                  ; 1829 77
                BF   $1,A182d            ; 182a 91 02
                INC                      ; 182c 1f
A182d:          LR   $0,A                ; 182d 50
                LR   $6,A                ; 182e 56
                PI   A1682               ; 182f 28 16 82
                PI   A11ec               ; 1832 28 11 ec
                PI   A1778               ; 1835 28 17 78
                BF   $0,A183f            ; 1838 90 06
A183a:          LIS  $4                  ; 183a 74
                LR   $0,A                ; 183b 50
                PI   A11ec               ; 183c 28 11 ec
A183f:          PI   A1682               ; 183f 28 16 82
                PI   A16ad               ; 1842 28 16 ad
                LIS  $7                  ; 1845 77
                SL   4                   ; 1846 15
                LR   $3,A                ; 1847 53
A1848:          PI   A176c               ; 1848 28 17 6c
                DS   $3                  ; 184b 33
                BF   $4,A1848            ; 184c 94 fb
                PI   A1682               ; 184e 28 16 82
                DCI  $0872               ; 1851 2a 08 72
                LI   $82                 ; 1854 20 82
                ST                       ; 1856 17
                LR   A,$0                ; 1857 40
                LR   $6,A                ; 1858 56
                CI   $07                 ; 1859 25 07
                LI   $15                 ; 185b 20 15
                BT   4,A1861             ; 185d 84 03
                LI   $11                 ; 185f 20 11
A1861:          LR   $1,A                ; 1861 51
A1862:          LIS  $7                  ; 1862 77
                XS   $6                  ; 1863 e6
                DCI  A1f37               ; 1864 2a 1f 37
                BF   $4,A186c            ; 1867 94 04
                DCI  $1f6d               ; 1869 2a 1f 6d
A186c:          LR   A,$1                ; 186c 41
                SL   1                   ; 186d 13
                AS   $1                  ; 186e c1
                ADC                      ; 186f 8e
                LISU 4                   ; 1870 64
                LISL 4                   ; 1871 6c
                LM                       ; 1872 16
                LR   (IS)-,A             ; 1873 5e
                LM                       ; 1874 16
                LR   (IS),A              ; 1875 5c
                LM                       ; 1876 16
                LR   $5,A                ; 1877 55
                DS   $5                  ; 1878 35
                PI   $46d6               ; 1879 28 46 d6
A187c:          PI   $41c8               ; 187c 28 41 c8
                DS   $5                  ; 187f 35
                BF   $4,A187c            ; 1880 94 fb
                PI   A1682               ; 1882 28 16 82
                DS   $1                  ; 1885 31
                BT   1,A1862             ; 1886 81 db
                LIS  $6                  ; 1888 76
                SL   4                   ; 1889 15
                LR   $1,A                ; 188a 51
A188b:          PI   A1682               ; 188b 28 16 82
                DS   $1                  ; 188e 31
                BF   $4,A188b            ; 188f 94 fb
                JMP  $4000               ; 1891 29 40 00
A1894:          DCI  $0c2d               ; 1894 2a 0c 2d
                LR   Q,DC                ; 1897 0e
                LM                       ; 1898 16
                INC                      ; 1899 1f
                LR   DC,Q                ; 189a 0f
                ST                       ; 189b 17
                DCI  $0c2b               ; 189c 2a 0c 2b
                LR   A,$b                ; 189f 4b
                SL   1                   ; 18a0 13
                ST                       ; 18a1 17
                PI   A1a3a               ; 18a2 28 1a 3a
                LI   $18                 ; 18a5 20 18
                AS   $1                  ; 18a7 c1
                LR   IS,A                ; 18a8 0b
                LR   A,(IS)              ; 18a9 4c
                XS   $3                  ; 18aa e3
                LR   (IS),A              ; 18ab 5c
                LR   A,$1                ; 18ac 41
                SL   1                   ; 18ad 13
                DCI  A1a10               ; 18ae 2a 1a 10
                ADC                      ; 18b1 8e
                LM                       ; 18b2 16
                LR   QU,A                ; 18b3 06
                LM                       ; 18b4 16
                LR   QL,A                ; 18b5 07
                LIS  $0                  ; 18b6 70
                COM                      ; 18b7 18
                LR   $7,A                ; 18b8 57
                LIS  $0                  ; 18b9 70
                AS   $3                  ; 18ba c3
                BF   $1,A18c1            ; 18bb 91 05
A18bd:          DS   $7                  ; 18bd 37
                SL   1                   ; 18be 13
                BT   1,A18bd             ; 18bf 81 fd
A18c1:          LR   A,$7                ; 18c1 47
                COM                      ; 18c2 18
                LR   DC,Q                ; 18c3 0f
                ADC                      ; 18c4 8e
                LR   Q,DC                ; 18c5 0e
                XDC                      ; 18c6 2c
                LR   A,$a                ; 18c7 4a
                DCI  $0c26               ; 18c8 2a 0c 26
                ST                       ; 18cb 17
                LR   A,$b                ; 18cc 4b
                ST                       ; 18cd 17
                NI   $10                 ; 18ce 21 10
                DCI  $0f0a               ; 18d0 2a 0f 0a
                LM                       ; 18d3 16
                BT   4,A18d7             ; 18d4 84 02
                COM                      ; 18d6 18
A18d7:          NI   $ff                 ; 18d7 21 ff
                DCI  A1a20               ; 18d9 2a 1a 20
                BT   4,A18e1             ; 18dc 84 04
                DCI  A1a26               ; 18de 2a 1a 26
A18e1:          LR   A,$3                ; 18e1 43
                NI   $01                 ; 18e2 21 01
                BT   4,A18e8             ; 18e4 84 03
                LIS  $d                  ; 18e6 7d
                ADC                      ; 18e7 8e
A18e8:          LR   H,DC                ; 18e8 11
                DCI  $0ece               ; 18e9 2a 0e ce
                LR   A,$a                ; 18ec 4a
                ST                       ; 18ed 17
                LR   A,$b                ; 18ee 4b
                ST                       ; 18ef 17
                LIS  $5                  ; 18f0 75
                LR   $0,A                ; 18f1 50
                PI   A1682               ; 18f2 28 16 82
                BF   $0,A1911            ; 18f5 90 1b
A18f7:          LIS  $7                  ; 18f7 77
                LR   $7,A                ; 18f8 57
                LR   DC,Q                ; 18f9 0f
                LR   A,$3                ; 18fa 43
                COM                      ; 18fb 18
                NI   $01                 ; 18fc 21 01
A18fe:          ST                       ; 18fe 17
                CM                       ; 18ff 8d
                CM                       ; 1900 8d
                CM                       ; 1901 8d
                CM                       ; 1902 8d
                CM                       ; 1903 8d
                CM                       ; 1904 8d
                CM                       ; 1905 8d
                DS   $7                  ; 1906 37
                BF   $4,A18fe            ; 1907 94 f6
                LIS  $6                  ; 1909 76
                LR   $7,A                ; 190a 57
A190b:          PI   A1682               ; 190b 28 16 82
                DS   $7                  ; 190e 37
                BF   $4,A190b            ; 190f 94 fb
A1911:          LIS  $7                  ; 1911 77
                LR   $7,A                ; 1912 57
                LR   DC,Q                ; 1913 0f
                XDC                      ; 1914 2c
                DCI  $0ece               ; 1915 2a 0e ce
                LM                       ; 1918 16
                LR   $a,A                ; 1919 5a
                LM                       ; 191a 16
                LR   $b,A                ; 191b 5b
                LR   DC,H                ; 191c 10
A191d:          LM                       ; 191d 16
                XDC                      ; 191e 2c
                ST                       ; 191f 17
                LIS  $7                  ; 1920 77
                ADC                      ; 1921 8e
                XDC                      ; 1922 2c
                DS   $7                  ; 1923 37
                BF   $4,A191d            ; 1924 94 f8
                LR   DC,H                ; 1926 10
                LIS  $6                  ; 1927 76
                LR   $7,A                ; 1928 57
A1929:          PI   A1682               ; 1929 28 16 82
                DS   $7                  ; 192c 37
                BF   $4,A1929            ; 192d 94 fb
                DS   $0                  ; 192f 30
                BF   $4,A18f7            ; 1930 94 c6
                PI   A1682               ; 1932 28 16 82
                PI   A16ad               ; 1935 28 16 ad
                DCI  $0c26               ; 1938 2a 0c 26
                LM                       ; 193b 16
                LR   $a,A                ; 193c 5a
                LM                       ; 193d 16
                LR   $b,A                ; 193e 5b
A193f:          DS   $6                  ; 193f 36
A1940:          DCI  $0c2b               ; 1940 2a 0c 2b
                LI   $10                 ; 1943 20 10
                ST                       ; 1945 17
                PI   A1a3a               ; 1946 28 1a 3a
                LIS  $0                  ; 1949 70
                AS   $4                  ; 194a c4
                BT   4,A1952             ; 194b 84 06
                LR   A,$6                ; 194d 46
                BT   1,A1952             ; 194e 81 03
                COM                      ; 1950 18
                INC                      ; 1951 1f
A1952:          AS   $1                  ; 1952 c1
                LR   $0,A                ; 1953 50
                SL   1                   ; 1954 13
                DCI  A1a10               ; 1955 2a 1a 10
                ADC                      ; 1958 8e
                LM                       ; 1959 16
                LR   QU,A                ; 195a 06
                LM                       ; 195b 16
                LR   QL,A                ; 195c 07
                LR   A,$0                ; 195d 40
                AI   $18                 ; 195e 24 18
                LR   IS,A                ; 1960 0b
                LR   A,$6                ; 1961 46
                LR   $0,A                ; 1962 50
                LIS  $0                  ; 1963 70
                XS   $5                  ; 1964 e5
                DCI  $0c2c               ; 1965 2a 0c 2c
                LM                       ; 1968 16
                BT   4,A1977             ; 1969 84 0d
                BF   $1,A1973            ; 196b 91 07
A196d:          SL   1                   ; 196d 13
                DS   $0                  ; 196e 30
                BF   $4,A196d            ; 196f 94 fd
                BF   $0,A1977            ; 1971 90 05
A1973:          SR   1                   ; 1973 12
                DS   $0                  ; 1974 30
                BF   $4,A1973            ; 1975 94 fd
A1977:          LR   $0,A                ; 1977 50
                XS   (IS)                ; 1978 ec
                LR   (IS),A              ; 1979 5c
                LISU 4                   ; 197a 64
                LR   A,$0                ; 197b 40
                XS   (IS)                ; 197c ec
                LR   (IS),A              ; 197d 5c
                LIS  $0                  ; 197e 70
                COM                      ; 197f 18
                LR   $7,A                ; 1980 57
                LIS  $0                  ; 1981 70
                AS   $0                  ; 1982 c0
                BF   $1,A1989            ; 1983 91 05
A1985:          DS   $7                  ; 1985 37
                SL   1                   ; 1986 13
                BT   1,A1985             ; 1987 81 fd
A1989:          LR   A,$7                ; 1989 47
                COM                      ; 198a 18
                AI   $08                 ; 198b 24 08
                LR   DC,Q                ; 198d 0f
                ADC                      ; 198e 8e
                LR   Q,DC                ; 198f 0e
                DCI  $0c26               ; 1990 2a 0c 26
                LR   A,$a                ; 1993 4a
                ST                       ; 1994 17
                LR   A,$b                ; 1995 4b
                ST                       ; 1996 17
                NI   $10                 ; 1997 21 10
                DCI  $0f0a               ; 1999 2a 0f 0a
                LM                       ; 199c 16
                BT   4,A19a0             ; 199d 84 02
                COM                      ; 199f 18
A19a0:          NI   $ff                 ; 19a0 21 ff
                DCI  A19ff               ; 19a2 2a 19 ff
                BT   4,A19aa             ; 19a5 84 04
                DCI  A19fe               ; 19a7 2a 19 fe
A19aa:          LR   A,$0                ; 19aa 40
                NI   $01                 ; 19ab 21 01
                BT   4,A19b1             ; 19ad 84 03
                LIS  $8                  ; 19af 78
                ADC                      ; 19b0 8e
A19b1:          LR   H,DC                ; 19b1 11
                DCI  $0ece               ; 19b2 2a 0e ce
                LR   A,$a                ; 19b5 4a
                ST                       ; 19b6 17
                LR   A,$b                ; 19b7 4b
                ST                       ; 19b8 17
                LIS  $7                  ; 19b9 77
                LR   $0,A                ; 19ba 50
                PI   A1682               ; 19bb 28 16 82
A19be:          LIS  $5                  ; 19be 75
                LR   $7,A                ; 19bf 57
                LR   DC,Q                ; 19c0 0f
                XDC                      ; 19c1 2c
                DCI  $0ece               ; 19c2 2a 0e ce
                LM                       ; 19c5 16
                LR   $a,A                ; 19c6 5a
                LM                       ; 19c7 16
                LR   $b,A                ; 19c8 5b
                LR   DC,H                ; 19c9 10
                LM                       ; 19ca 16
                XDC                      ; 19cb 2c
A19cc:          ST                       ; 19cc 17
                CM                       ; 19cd 8d
                CM                       ; 19ce 8d
                CM                       ; 19cf 8d
                CM                       ; 19d0 8d
                CM                       ; 19d1 8d
                CM                       ; 19d2 8d
                CM                       ; 19d3 8d
                DS   $7                  ; 19d4 37
                BF   $4,A19cc            ; 19d5 94 f6
                XDC                      ; 19d7 2c
                LR   H,DC                ; 19d8 11
                DCI  $0ece               ; 19d9 2a 0e ce
                LR   A,$a                ; 19dc 4a
                ST                       ; 19dd 17
                LR   A,$b                ; 19de 4b
                ST                       ; 19df 17
                LIS  $6                  ; 19e0 76
                LR   $7,A                ; 19e1 57
A19e2:          PI   A1682               ; 19e2 28 16 82
                DS   $7                  ; 19e5 37
                BF   $4,A19e2            ; 19e6 94 fb
                DS   $0                  ; 19e8 30
                BF   $4,A19be            ; 19e9 94 d4
                PI   A16ad               ; 19eb 28 16 ad
                DCI  $0c26               ; 19ee 2a 0c 26
                LM                       ; 19f1 16
                LR   $a,A                ; 19f2 5a
                LM                       ; 19f3 16
                LR   $b,A                ; 19f4 5b
                DS   $6                  ; 19f5 36
                BF   $4,A19fb            ; 19f6 94 04
                JMP  A1d3c               ; 19f8 29 1d 3c
A19fb:          JMP  A1940               ; 19fb 29 19 40
A19fe:          LIS  $d                  ; 19fe 7d
A19ff:          LR   A,$5                ; 19ff 45
                LIS  $d                  ; 1a00 7d
                LR   A,$5                ; 1a01 45
                LIS  $d                  ; 1a02 7d
                LR   A,$5                ; 1a03 45
                LIS  $d                  ; 1a04 7d
                LR   A,$5                ; 1a05 45
                LIS  $c                  ; 1a06 7c
                LR   A,$4                ; 1a07 44
                LIS  $c                  ; 1a08 7c
                LR   A,$4                ; 1a09 44
                LIS  $c                  ; 1a0a 7c
                LR   A,$4                ; 1a0b 44
                LIS  $c                  ; 1a0c 7c
                LR   A,$4                ; 1a0d 44
                LIS  $c                  ; 1a0e 7c
                LR   A,$4                ; 1a0f 44
A1a10:          PK                       ; 1a10 0c
                DS   $8                  ; 1a11 38
                PK                       ; 1a12 0c
                AM                       ; 1a13 88
                PK                       ; 1a14 0c
                ASD  $8                  ; 1a15 d8
                LR   P0,Q                ; 1a16 0d
                PI   $0d78               ; 1a17 28 0d 78
                LR   P0,Q                ; 1a1a 0d
                AS   $8                  ; 1a1b c8
                LR   DC,Q                ; 1a1c 0f
                COM                      ; 1a1d 18
                LR   DC,Q                ; 1a1e 0f
                LISL 0                   ; 1a1f 68
A1a20:          DS   $9                  ; 1a20 39
                LR   A,$5                ; 1a21 45
                LR   A,$5                ; 1a22 45
                LR   A,$5                ; 1a23 45
                LR   A,$5                ; 1a24 45
                LR   A,$5                ; 1a25 45
A1a26:          DS   $9                  ; 1a26 39
                LIS  $d                  ; 1a27 7d
                LIS  $d                  ; 1a28 7d
                LIS  $d                  ; 1a29 7d
                LIS  $d                  ; 1a2a 7d
                LIS  $d                  ; 1a2b 7d
                DS   $9                  ; 1a2c 39
                DS   $8                  ; 1a2d 38
                LR   A,$4                ; 1a2e 44
                LR   A,$4                ; 1a2f 44
                LR   A,$4                ; 1a30 44
                LR   A,$4                ; 1a31 44
                LR   A,$4                ; 1a32 44
                DS   $8                  ; 1a33 38
                LIS  $c                  ; 1a34 7c
                LIS  $c                  ; 1a35 7c
                LIS  $c                  ; 1a36 7c
                LIS  $c                  ; 1a37 7c
                LIS  $c                  ; 1a38 7c
                DS   $8                  ; 1a39 38
A1a3a:          LR   K,P                 ; 1a3a 08
                PI   $40a9               ; 1a3b 28 40 a9
                DCI  $0c26               ; 1a3e 2a 0c 26
                LR   A,$a                ; 1a41 4a
                ST                       ; 1a42 17
                LR   A,$b                ; 1a43 4b
                ST                       ; 1a44 17
                DCI  $0ea0               ; 1a45 2a 0e a0
                LISU 4                   ; 1a48 64
                LISL 7                   ; 1a49 6f
A1a4a:          LR   A,(IS)-             ; 1a4a 4e
                ST                       ; 1a4b 17
                BR7  A1a4a               ; 1a4c 8f fd
                PI   A1682               ; 1a4e 28 16 82
                DCI  $0872               ; 1a51 2a 08 72
                LI   $82                 ; 1a54 20 82
                ST                       ; 1a56 17
                DCI  $0c2b               ; 1a57 2a 0c 2b
                LISU 4                   ; 1a5a 64
                LISL 4                   ; 1a5b 6c
                LM                       ; 1a5c 16
                LR   (IS)-,A             ; 1a5d 5e
                LIS  $3                  ; 1a5e 73
                LR   (IS),A              ; 1a5f 5c
                PI   $46d6               ; 1a60 28 46 d6
                LIS  $f                  ; 1a63 7f
                LR   $7,A                ; 1a64 57
A1a65:          PI   $41c8               ; 1a65 28 41 c8
                DS   $7                  ; 1a68 37
                BF   $4,A1a65            ; 1a69 94 fb
                PI   A1682               ; 1a6b 28 16 82
                PI   A16ad               ; 1a6e 28 16 ad
                DCI  $0c26               ; 1a71 2a 0c 26
                LM                       ; 1a74 16
                LR   $a,A                ; 1a75 5a
                LM                       ; 1a76 16
                LR   $b,A                ; 1a77 5b
                DCI  $0ea0               ; 1a78 2a 0e a0
                LISU 4                   ; 1a7b 64
                LISL 7                   ; 1a7c 6f
A1a7d:          LM                       ; 1a7d 16
                LR   (IS)-,A             ; 1a7e 5e
                BR7  A1a7d               ; 1a7f 8f fd
                PI   $40bc               ; 1a81 28 40 bc
                PK                       ; 1a84 0c
A1a85:          DCI  $0f0b               ; 1a85 2a 0f 0b
                LIS  $0                  ; 1a88 70
                AM                       ; 1a89 88
                BT   4,A1ada             ; 1a8a 84 4f
                DCI  $0ed0               ; 1a8c 2a 0e d0
                LIS  $0                  ; 1a8f 70
                AM                       ; 1a90 88
                BT   4,A1a96             ; 1a91 84 04
                JMP  A1142               ; 1a93 29 11 42
A1a96:          DCI  $0c2a               ; 1a96 2a 0c 2a
                LM                       ; 1a99 16
                CI   $3c                 ; 1a9a 25 3c
                BF   $4,A1aa1            ; 1a9c 94 04
                JMP  A17e8               ; 1a9e 29 17 e8
A1aa1:          DCI  $0f09               ; 1aa1 2a 0f 09
                LM                       ; 1aa4 16
                COM                      ; 1aa5 18
                DCI  $0f09               ; 1aa6 2a 0f 09
                ST                       ; 1aa9 17
                BF   $4,A1aaf            ; 1aaa 94 04
                JMP  A17d2               ; 1aac 29 17 d2
A1aaf:          DCI  $0f0a               ; 1aaf 2a 0f 0a
                LM                       ; 1ab2 16
                COM                      ; 1ab3 18
                DCI  $0f0a               ; 1ab4 2a 0f 0a
                ST                       ; 1ab7 17
                LIS  $f                  ; 1ab8 7f
                BF   $4,A1abc            ; 1ab9 94 02
                INC                      ; 1abb 1f
A1abc:          LR   $0,A                ; 1abc 50
                PI   A11ec               ; 1abd 28 11 ec
                LI   $80                 ; 1ac0 20 80
                LR   $0,A                ; 1ac2 50
A1ac3:          PI   A1682               ; 1ac3 28 16 82
                DS   $0                  ; 1ac6 30
                BF   $4,A1ac3            ; 1ac7 94 fb
                PI   A16ad               ; 1ac9 28 16 ad
                DCI  $0e10               ; 1acc 2a 0e 10
                LR   H,DC                ; 1acf 11
                PI   A16ef               ; 1ad0 28 16 ef
                LR   DC,H                ; 1ad3 10
                PI   A16de               ; 1ad4 28 16 de
                JMP  A1ee2               ; 1ad7 29 1e e2
A1ada:          DCI  $0c22               ; 1ada 2a 0c 22
                LM                       ; 1add 16
                LR   $3,A                ; 1ade 53
                LM                       ; 1adf 16
                LM                       ; 1ae0 16
                LR   $1,A                ; 1ae1 51
                SR   4                   ; 1ae2 14
                LR   $2,A                ; 1ae3 52
                LIS  $f                  ; 1ae4 7f
                NS   $1                  ; 1ae5 f1
                LR   $1,A                ; 1ae6 51
                DCI  $0c2c               ; 1ae7 2a 0c 2c
                LIS  $0                  ; 1aea 70
                AS   $3                  ; 1aeb c3
                ST                       ; 1aec 17
                BT   4,A1afe             ; 1aed 84 10
                DCI  $0e20               ; 1aef 2a 0e 20
                LR   H,DC                ; 1af2 11
                PI   A16de               ; 1af3 28 16 de
                DCI  $0c2d               ; 1af6 2a 0c 2d
                LIS  $3                  ; 1af9 73
                ST                       ; 1afa 17
                JMP  A1cf6               ; 1afb 29 1c f6
A1afe:          DCI  $0ed0               ; 1afe 2a 0e d0
                LIS  $0                  ; 1b01 70
                AM                       ; 1b02 88
                BT   4,A1b19             ; 1b03 84 15
                LIS  $3                  ; 1b05 73
                LR   $0,A                ; 1b06 50
                PI   A11ec               ; 1b07 28 11 ec
                LI   $80                 ; 1b0a 20 80
                LR   $0,A                ; 1b0c 50
A1b0d:          PI   A1682               ; 1b0d 28 16 82
                DS   $0                  ; 1b10 30
                BF   $4,A1b0d            ; 1b11 94 fb
                PI   A16ad               ; 1b13 28 16 ad
                JMP  A1142               ; 1b16 29 11 42
A1b19:          DCI  $0e20               ; 1b19 2a 0e 20
                LR   H,DC                ; 1b1c 11
                PI   A16de               ; 1b1d 28 16 de
                JMP  A17d2               ; 1b20 29 17 d2
A1b23:          DCI  $0ed0               ; 1b23 2a 0e d0
                LIS  $0                  ; 1b26 70
                XM                       ; 1b27 8c
                BT   4,A1b2d             ; 1b28 84 04
                JMP  A1142               ; 1b2a 29 11 42
A1b2d:          DCI  $0c2a               ; 1b2d 2a 0c 2a
                LM                       ; 1b30 16
                CI   $3c                 ; 1b31 25 3c
                BF   $4,A1b38            ; 1b33 94 04
                JMP  A17e8               ; 1b35 29 17 e8
A1b38:          LIS  $2                  ; 1b38 72
                LR   $0,A                ; 1b39 50
                PI   A11ec               ; 1b3a 28 11 ec
                LI   $80                 ; 1b3d 20 80
                LR   $7,A                ; 1b3f 57
A1b40:          PI   A1682               ; 1b40 28 16 82
                DS   $7                  ; 1b43 37
                BF   $4,A1b40            ; 1b44 94 fb
                PI   A16ad               ; 1b46 28 16 ad
                DCI  $0e10               ; 1b49 2a 0e 10
                LR   H,DC                ; 1b4c 11
                PI   A16de               ; 1b4d 28 16 de
                JMP  A1c32               ; 1b50 29 1c 32
A1b53:          DCI  $0ebf               ; 1b53 2a 0e bf
                LR   A,$b                ; 1b56 4b
                SR   4                   ; 1b57 14
                ADC                      ; 1b58 8e
                XDC                      ; 1b59 2c
                DCI  $0c2e               ; 1b5a 2a 0c 2e
                LM                       ; 1b5d 16
                XDC                      ; 1b5e 2c
                AM                       ; 1b5f 88
                COM                      ; 1b60 18
                INC                      ; 1b61 1f
                LR   $0,A                ; 1b62 50
                ST                       ; 1b63 17
                LR   A,$b                ; 1b64 4b
                SR   4                   ; 1b65 14
                CI   $02                 ; 1b66 25 02
                BT   1,A1bbe             ; 1b68 81 55
                DCI  $0c29               ; 1b6a 2a 0c 29
                CM                       ; 1b6d 8d
                BT   1,A1bab             ; 1b6e 81 3c
                DCI  $0fae               ; 1b70 2a 0f ae
                ADC                      ; 1b73 8e
                XDC                      ; 1b74 2c
                DCI  $0eaf               ; 1b75 2a 0e af
                ADC                      ; 1b78 8e
                LM                       ; 1b79 16
                COM                      ; 1b7a 18
                INC                      ; 1b7b 1f
                AS   $0                  ; 1b7c c0
                XDC                      ; 1b7d 2c
                CM                       ; 1b7e 8d
                BF   $1,A1b87            ; 1b7f 91 07
                LIS  $f                  ; 1b81 7f
                SL   4                   ; 1b82 15
                AS   $b                  ; 1b83 cb
                LR   $b,A                ; 1b84 5b
                BF   $0,A1ba8            ; 1b85 90 22
A1b87:          LR   Q,DC                ; 1b87 0e
                COM                      ; 1b88 18
                INC                      ; 1b89 1f
                CM                       ; 1b8a 8d
                BT   1,A1ba8             ; 1b8b 81 1c
                LR   DC,Q                ; 1b8d 0f
                ST                       ; 1b8e 17
                LR   A,$b                ; 1b8f 4b
                CI   $30                 ; 1b90 25 30
                BF   $4,A1ba8            ; 1b92 94 15
                LR   DC,H                ; 1b94 10
                XDC                      ; 1b95 2c
                DCI  $0e10               ; 1b96 2a 0e 10
                LISU 2                   ; 1b99 62
                LISL 0                   ; 1b9a 68
                LIS  $1                  ; 1b9b 71
                SL   4                   ; 1b9c 15
                LR   (IS),A              ; 1b9d 5c
                PI   $43cd               ; 1b9e 28 43 cd
                DCI  $0c21               ; 1ba1 2a 0c 21
                LM                       ; 1ba4 16
                ST                       ; 1ba5 17
                LM                       ; 1ba6 16
                ST                       ; 1ba7 17
A1ba8:          JMP  A1cb5               ; 1ba8 29 1c b5
A1bab:          LIS  $1                  ; 1bab 71
                SL   4                   ; 1bac 15
                AS   $b                  ; 1bad cb
                LR   $b,A                ; 1bae 5b
                SR   4                   ; 1baf 14
                DCI  $0fad               ; 1bb0 2a 0f ad
                ADC                      ; 1bb3 8e
                LM                       ; 1bb4 16
                CM                       ; 1bb5 8d
                ST                       ; 1bb6 17
                LR   DC,H                ; 1bb7 10
                PI   A16ef               ; 1bb8 28 16 ef
                JMP  A1cd9               ; 1bbb 29 1c d9
A1bbe:          BF   $4,A1bc3            ; 1bbe 94 04
                JMP  A1c97               ; 1bc0 29 1c 97
A1bc3:          NOP                      ; 1bc3 2b
                NOP                      ; 1bc4 2b
                NOP                      ; 1bc5 2b
                DCI  $0f0b               ; 1bc6 2a 0f 0b
                LIS  $0                  ; 1bc9 70
                AM                       ; 1bca 88
                BT   4,A1be0             ; 1bcb 84 14
                DCI  $0f0a               ; 1bcd 2a 0f 0a
                LM                       ; 1bd0 16
                COM                      ; 1bd1 18
                DCI  $0f0a               ; 1bd2 2a 0f 0a
                ST                       ; 1bd5 17
                DCI  $0e10               ; 1bd6 2a 0e 10
                LR   H,DC                ; 1bd9 11
                PI   A16ef               ; 1bda 28 16 ef
                JMP  A1ed3               ; 1bdd 29 1e d3
A1be0:          LISU 3                   ; 1be0 63
                PI   A1713               ; 1be1 28 17 13
                LR   A,$0                ; 1be4 40
                COM                      ; 1be5 18
                INC                      ; 1be6 1f
                LR   $4,A                ; 1be7 54
                LISU 4                   ; 1be8 64
                PI   A1713               ; 1be9 28 17 13
                LR   A,$0                ; 1bec 40
                COM                      ; 1bed 18
                INC                      ; 1bee 1f
                LR   $5,A                ; 1bef 55
                PI   A1682               ; 1bf0 28 16 82
                LR   A,$4                ; 1bf3 44
                AS   $0                  ; 1bf4 c0
                DCI  $08f5               ; 1bf5 2a 08 f5
                BF   $4,A1bfd            ; 1bf8 94 04
                LIS  $4                  ; 1bfa 74
                BF   $0,A1c01            ; 1bfb 90 05
A1bfd:          LIS  $1                  ; 1bfd 71
                BF   $1,A1c01            ; 1bfe 91 02
                LIS  $2                  ; 1c00 72
A1c01:          ST                       ; 1c01 17
                PI   A1682               ; 1c02 28 16 82
                LIS  $b                  ; 1c05 7b
                LR   $0,A                ; 1c06 50
                PI   A11ec               ; 1c07 28 11 ec
                PI   A1778               ; 1c0a 28 17 78
                LI   $80                 ; 1c0d 20 80
                LR   $0,A                ; 1c0f 50
A1c10:          PI   A1682               ; 1c10 28 16 82
                DS   $0                  ; 1c13 30
                BF   $4,A1c10            ; 1c14 94 fb
                DCI  $08f5               ; 1c16 2a 08 f5
                LIS  $4                  ; 1c19 74
                ST                       ; 1c1a 17
                PI   A1682               ; 1c1b 28 16 82
                PI   A16ad               ; 1c1e 28 16 ad
                DCI  $0c2a               ; 1c21 2a 0c 2a
                LR   Q,DC                ; 1c24 0e
                LM                       ; 1c25 16
                INC                      ; 1c26 1f
                LR   DC,Q                ; 1c27 0f
                ST                       ; 1c28 17
                CI   $05                 ; 1c29 25 05
                BT   1,A1c32             ; 1c2b 81 06
                DCI  $0c28               ; 1c2d 2a 0c 28
                LM                       ; 1c30 16
                ST                       ; 1c31 17
A1c32:          LIS  $1                  ; 1c32 71
                LR   $0,A                ; 1c33 50
                PI   A11ec               ; 1c34 28 11 ec
                DCI  $0fb0               ; 1c37 2a 0f b0
                LI   $c1                 ; 1c3a 20 c1
                ST                       ; 1c3c 17
                ST                       ; 1c3d 17
                ST                       ; 1c3e 17
                DCI  $0e20               ; 1c3f 2a 0e 20
                LR   H,DC                ; 1c42 11
                PI   A16ef               ; 1c43 28 16 ef
                NOP                      ; 1c46 2b
                NOP                      ; 1c47 2b
                NOP                      ; 1c48 2b
                NOP                      ; 1c49 2b
                LIS  $0                  ; 1c4a 70
                DCI  $0ec1               ; 1c4b 2a 0e c1
                ST                       ; 1c4e 17
                DCI  $0eb0               ; 1c4f 2a 0e b0
                ST                       ; 1c52 17
                ST                       ; 1c53 17
                DCI  $0c2a               ; 1c54 2a 0c 2a
                LM                       ; 1c57 16
                CI   $01                 ; 1c58 25 01
                BT   4,A1c5f             ; 1c5a 84 04
                JMP  A1cd9               ; 1c5c 29 1c d9
A1c5f:          LISU 2                   ; 1c5f 62
                LISL 5                   ; 1c60 6d
                LIS  $3                  ; 1c61 73
                NS   (IS)                ; 1c62 fc
                LR   $0,A                ; 1c63 50
                DCI  $0c25               ; 1c64 2a 0c 25
                LM                       ; 1c67 16
                SL   1                   ; 1c68 13
                SL   1                   ; 1c69 13
                AS   $0                  ; 1c6a c0
                SL   1                   ; 1c6b 13
                DCI  A172c               ; 1c6c 2a 17 2c
                ADC                      ; 1c6f 8e
                LM                       ; 1c70 16
                LR   $3,A                ; 1c71 53
                LM                       ; 1c72 16
                LR   $1,A                ; 1c73 51
A1c74:          DCI  $0c2c               ; 1c74 2a 0c 2c
                LR   A,$3                ; 1c77 43
                ST                       ; 1c78 17
                DCI  $0c22               ; 1c79 2a 0c 22
                ST                       ; 1c7c 17
                CM                       ; 1c7d 8d
                LIS  $e                  ; 1c7e 7e
                SL   4                   ; 1c7f 15
                AS   $1                  ; 1c80 c1
                ST                       ; 1c81 17
                DCI  $0ef0               ; 1c82 2a 0e f0
                LIS  $0                  ; 1c85 70
                ST                       ; 1c86 17
                ST                       ; 1c87 17
                LR   DC,H                ; 1c88 10
                PI   A16de               ; 1c89 28 16 de
                DCI  $0c2d               ; 1c8c 2a 0c 2d
                LIS  $0                  ; 1c8f 70
                INC                      ; 1c90 1f
                ST                       ; 1c91 17
                LIS  $e                  ; 1c92 7e
                LR   $2,A                ; 1c93 52
                JMP  A1cf6               ; 1c94 29 1c f6
A1c97:          DCI  $0c2a               ; 1c97 2a 0c 2a
                LR   Q,DC                ; 1c9a 0e
                LM                       ; 1c9b 16
                CI   $01                 ; 1c9c 25 01
                BF   $1,A1cb2            ; 1c9e 91 13
                INC                      ; 1ca0 1f
                LR   DC,Q                ; 1ca1 0f
                ST                       ; 1ca2 17
                DCI  $0e10               ; 1ca3 2a 0e 10
                LR   H,DC                ; 1ca6 11
                PI   A16ef               ; 1ca7 28 16 ef
                DCI  $0ed0               ; 1caa 2a 0e d0
                LIS  $0                  ; 1cad 70
                ST                       ; 1cae 17
                LIS  $2                  ; 1caf 72
                BF   $0,A1cdb            ; 1cb0 90 2a
A1cb2:          JMP  A1bab               ; 1cb2 29 1b ab
A1cb5:          LR   A,$b                ; 1cb5 4b
                SR   4                   ; 1cb6 14
                SL   1                   ; 1cb7 13
                DCI  $0eee               ; 1cb8 2a 0e ee
                ADC                      ; 1cbb 8e
                LM                       ; 1cbc 16
                LR   $3,A                ; 1cbd 53
                LM                       ; 1cbe 16
                LR   $1,A                ; 1cbf 51
                SR   4                   ; 1cc0 14
                LR   $2,A                ; 1cc1 52
                LIS  $f                  ; 1cc2 7f
                NS   $1                  ; 1cc3 f1
                LR   $1,A                ; 1cc4 51
                LR   DC,H                ; 1cc5 10
                PI   A16de               ; 1cc6 28 16 de
                DCI  $0c2d               ; 1cc9 2a 0c 2d
                LIS  $0                  ; 1ccc 70
                COM                      ; 1ccd 18
                ST                       ; 1cce 17
                LIS  $0                  ; 1ccf 70
                XS   $3                  ; 1cd0 e3
                BF   $4,A1cf2            ; 1cd1 94 20
A1cd3:          DS   $1                  ; 1cd3 31
                BT   1,A1ce5             ; 1cd4 81 10
                JMP  A1e59               ; 1cd6 29 1e 59
A1cd9:          LIS  $0                  ; 1cd9 70
                INC                      ; 1cda 1f
A1cdb:          DCI  $0c2d               ; 1cdb 2a 0c 2d
                ST                       ; 1cde 17
                LR   DC,H                ; 1cdf 10
                PI   A16de               ; 1ce0 28 16 de
                LIS  $7                  ; 1ce3 77
                LR   $1,A                ; 1ce4 51
A1ce5:          LIS  $e                  ; 1ce5 7e
                LR   $2,A                ; 1ce6 52
                LI   $18                 ; 1ce7 20 18
                AS   $1                  ; 1ce9 c1
                LR   IS,A                ; 1cea 0b
                LR   A,(IS)              ; 1ceb 4c
                LISU 4                   ; 1cec 64
                AS   (IS)                ; 1ced cc
                COM                      ; 1cee 18
                BT   4,A1cd3             ; 1cef 84 e3
                LR   $3,A                ; 1cf1 53
A1cf2:          DCI  $0c2c               ; 1cf2 2a 0c 2c
                ST                       ; 1cf5 17
A1cf6:          LR   A,$2                ; 1cf6 42
                DCI  A174c               ; 1cf7 2a 17 4c
                ADC                      ; 1cfa 8e
                LM                       ; 1cfb 16
                LR   $5,A                ; 1cfc 55
                LM                       ; 1cfd 16
                LR   $4,A                ; 1cfe 54
                DCI  $0c2c               ; 1cff 2a 0c 2c
                LM                       ; 1d02 16
                LR   $3,A                ; 1d03 53
                LIS  $1                  ; 1d04 71
                LR   $6,A                ; 1d05 56
                LI   $20                 ; 1d06 20 20
A1d08:          LR   $7,A                ; 1d08 57
                LIS  $0                  ; 1d09 70
                AS   $4                  ; 1d0a c4
                BT   4,A1d12             ; 1d0b 84 06
                LR   A,$6                ; 1d0d 46
                BT   1,A1d12             ; 1d0e 81 03
                COM                      ; 1d10 18
                INC                      ; 1d11 1f
A1d12:          AS   $1                  ; 1d12 c1
                BF   $1,A1d3c            ; 1d13 91 28
                CI   $07                 ; 1d15 25 07
                BF   $1,A1d3c            ; 1d17 91 24
                AS   $7                  ; 1d19 c7
                LR   IS,A                ; 1d1a 0b
A1d1b:          LR   A,$6                ; 1d1b 46
                LR   $0,A                ; 1d1c 50
                LIS  $0                  ; 1d1d 70
                XS   $5                  ; 1d1e e5
                LR   A,(IS)              ; 1d1f 4c
                BT   4,A1d2e             ; 1d20 84 0d
                BF   $1,A1d2a            ; 1d22 91 07
A1d24:          SR   1                   ; 1d24 12
                DS   $0                  ; 1d25 30
                BF   $4,A1d24            ; 1d26 94 fd
                BF   $0,A1d2e            ; 1d28 90 05
A1d2a:          SL   1                   ; 1d2a 13
                DS   $0                  ; 1d2b 30
                BF   $4,A1d2a            ; 1d2c 94 fd
A1d2e:          NS   $3                  ; 1d2e f3
                BF   $4,A1d56            ; 1d2f 94 26
                LR   A,$7                ; 1d31 47
                CI   $18                 ; 1d32 25 18
                BF   $4,A1d3c            ; 1d34 94 07
                LI   $20                 ; 1d36 20 20
                LR   $7,A                ; 1d38 57
                LISU 4                   ; 1d39 64
                BF   $0,A1d1b            ; 1d3a 90 e0
A1d3c:          DS   $2                  ; 1d3c 32
                DS   $2                  ; 1d3d 32
                BT   1,A1cf6             ; 1d3e 81 b7
                DCI  $0c2d               ; 1d40 2a 0c 2d
                LIS  $0                  ; 1d43 70
                XM                       ; 1d44 8c
                BT   4,A1d53             ; 1d45 84 0d
                CI   $02                 ; 1d47 25 02
                BT   1,A1cd3             ; 1d49 81 89
                LR   A,$b                ; 1d4b 4b
                CI   $10                 ; 1d4c 25 10
                BT   4,A1d53             ; 1d4e 84 04
                JMP  A1b23               ; 1d50 29 1b 23
A1d53:          JMP  A1b53               ; 1d53 29 1b 53
A1d56:          LR   $3,A                ; 1d56 53
                LR   A,$7                ; 1d57 47
                CI   $18                 ; 1d58 25 18
                BT   4,A1d81             ; 1d5a 84 26
                LR   A,$6                ; 1d5c 46
                INC                      ; 1d5d 1f
                LR   $6,A                ; 1d5e 56
                LI   $18                 ; 1d5f 20 18
                BF   $0,A1d08            ; 1d61 90 a6
A1d63:          DCI  $0ed0               ; 1d63 2a 0e d0
A1d66:          LR   Q,DC                ; 1d66 0e
                LIS  $0                  ; 1d67 70
                AM                       ; 1d68 88
                LM                       ; 1d69 16
                BF   $4,A1d66            ; 1d6a 94 fb
                LR   DC,Q                ; 1d6c 0f
                LR   A,$3                ; 1d6d 43
                ST                       ; 1d6e 17
                LR   A,$1                ; 1d6f 41
                ST                       ; 1d70 17
                LIS  $0                  ; 1d71 70
                ST                       ; 1d72 17
                DCI  $0c2c               ; 1d73 2a 0c 2c
                LR   A,$3                ; 1d76 43
                XM                       ; 1d77 8c
                BT   4,A1d3c             ; 1d78 84 c3
                DCI  $0c2c               ; 1d7a 2a 0c 2c
                ST                       ; 1d7d 17
                JMP  A1cf6               ; 1d7e 29 1c f6
A1d81:          LI   $ff                 ; 1d81 20 ff
                AS   $3                  ; 1d83 c3
                NS   $3                  ; 1d84 f3
                XS   $3                  ; 1d85 e3
                LR   $3,A                ; 1d86 53
                DCI  $0c2d               ; 1d87 2a 0c 2d
                LIS  $0                  ; 1d8a 70
                XM                       ; 1d8b 8c
                BF   $4,A1d91            ; 1d8c 94 04
                JMP  A1e14               ; 1d8e 29 1e 14
A1d91:          CI   $01                 ; 1d91 25 01
                BT   1,A1da1             ; 1d93 81 0d
                CI   $03                 ; 1d95 25 03
                BT   4,A1d9e             ; 1d97 84 06
                BT   1,A1d63             ; 1d99 81 c9
                JMP  A193f               ; 1d9b 29 19 3f
A1d9e:          JMP  A1894               ; 1d9e 29 18 94
A1da1:          LI   $18                 ; 1da1 20 18
                AS   $1                  ; 1da3 c1
                LR   IS,A                ; 1da4 0b
                LR   A,(IS)              ; 1da5 4c
                AS   $3                  ; 1da6 c3
                LR   (IS),A              ; 1da7 5c
                DCI  $0c2d               ; 1da8 2a 0c 2d
                LIS  $0                  ; 1dab 70
                ST                       ; 1dac 17
                DCI  $0c2c               ; 1dad 2a 0c 2c
                LR   Q,DC                ; 1db0 0e
                LR   A,$3                ; 1db1 43
                XM                       ; 1db2 8c
                LR   $0,A                ; 1db3 50
                LR   DC,Q                ; 1db4 0f
                LR   A,$3                ; 1db5 43
                ST                       ; 1db6 17
                LR   A,$b                ; 1db7 4b
                SR   4                   ; 1db8 14
                SL   1                   ; 1db9 13
                DCI  $0eee               ; 1dba 2a 0e ee
                ADC                      ; 1dbd 8e
                LR   A,$0                ; 1dbe 40
                ST                       ; 1dbf 17
                LR   A,$2                ; 1dc0 42
                SL   4                   ; 1dc1 15
                AS   $1                  ; 1dc2 c1
                ST                       ; 1dc3 17
                DCI  $0c2e               ; 1dc4 2a 0c 2e
                LIS  $0                  ; 1dc7 70
                INC                      ; 1dc8 1f
                ST                       ; 1dc9 17
                LR   A,$3                ; 1dca 43
                NI   $42                 ; 1dcb 21 42
                BF   $4,A1df7            ; 1dcd 94 29
                LR   A,$1                ; 1dcf 41
                CI   $01                 ; 1dd0 25 01
                BT   4,A1df7             ; 1dd2 84 24
                CI   $06                 ; 1dd4 25 06
                BT   4,A1df7             ; 1dd6 84 20
                SR   1                   ; 1dd8 12
                SR   1                   ; 1dd9 12
                XS   $1                  ; 1dda e1
                COM                      ; 1ddb 18
                NI   $01                 ; 1ddc 21 01
                BT   4,A1df9             ; 1dde 84 1a
                LR   A,$3                ; 1de0 43
                NI   $a5                 ; 1de1 21 a5
                BT   4,A1df9             ; 1de3 84 15
                NI   $81                 ; 1de5 21 81
                BT   4,A1df4             ; 1de7 84 0c
                LIS  $0                  ; 1de9 70
                AS   $1                  ; 1dea c1
                BT   4,A1df2             ; 1deb 84 06
                CI   $07                 ; 1ded 25 07
                LIS  $0                  ; 1def 70
                BF   $4,A1df4            ; 1df0 94 03
A1df2:          INC                      ; 1df2 1f
                INC                      ; 1df3 1f
A1df4:          INC                      ; 1df4 1f
                BF   $0,A1df9            ; 1df5 90 03
A1df7:          LIS  $1                  ; 1df7 71
                COM                      ; 1df8 18
A1df9:          LR   $0,A                ; 1df9 50
                LR   A,$b                ; 1dfa 4b
                SR   4                   ; 1dfb 14
                DCI  $0eae               ; 1dfc 2a 0e ae
                ADC                      ; 1dff 8e
                LM                       ; 1e00 16
                COM                      ; 1e01 18
                INC                      ; 1e02 1f
                AS   $0                  ; 1e03 c0
                ST                       ; 1e04 17
                LR   A,$b                ; 1e05 4b
                CI   $20                 ; 1e06 25 20
                BF   $4,A1e14            ; 1e08 94 0b
                DCI  $0c21               ; 1e0a 2a 0c 21
                LR   A,$3                ; 1e0d 43
                ST                       ; 1e0e 17
                CM                       ; 1e0f 8d
                LR   A,$2                ; 1e10 42
                SL   4                   ; 1e11 15
                AS   $1                  ; 1e12 c1
                ST                       ; 1e13 17
A1e14:          DS   $6                  ; 1e14 36
                DCI  $0c2e               ; 1e15 2a 0c 2e
                LM                       ; 1e18 16
                AS   $6                  ; 1e19 c6
                DCI  $0c2e               ; 1e1a 2a 0c 2e
                ST                       ; 1e1d 17
                LR   A,$b                ; 1e1e 4b
                SR   4                   ; 1e1f 14
                DCI  $0c28               ; 1e20 2a 0c 28
                CM                       ; 1e23 8d
                BT   1,A1e29             ; 1e24 81 04
                JMP  A1d3c               ; 1e26 29 1d 3c
A1e29:          LIS  $0                  ; 1e29 70
                AS   $4                  ; 1e2a c4
                BT   4,A1e32             ; 1e2b 84 06
                LR   A,$6                ; 1e2d 46
                BT   1,A1e32             ; 1e2e 81 03
                COM                      ; 1e30 18
                INC                      ; 1e31 1f
A1e32:          AS   $1                  ; 1e32 c1
                AI   $18                 ; 1e33 24 18
                LR   IS,A                ; 1e35 0b
                LR   A,$6                ; 1e36 46
                LR   $0,A                ; 1e37 50
                LIS  $0                  ; 1e38 70
                XS   $5                  ; 1e39 e5
                DCI  $0c2c               ; 1e3a 2a 0c 2c
                LM                       ; 1e3d 16
                BT   4,A1e4c             ; 1e3e 84 0d
                BF   $1,A1e48            ; 1e40 91 07
A1e42:          SL   1                   ; 1e42 13
                DS   $0                  ; 1e43 30
                BF   $4,A1e42            ; 1e44 94 fd
                BF   $0,A1e4c            ; 1e46 90 05
A1e48:          SR   1                   ; 1e48 12
                DS   $0                  ; 1e49 30
                BF   $4,A1e48            ; 1e4a 94 fd
A1e4c:          LR   $0,A                ; 1e4c 50
                XS   (IS)                ; 1e4d ec
                LR   (IS),A              ; 1e4e 5c
                LISU 4                   ; 1e4f 64
                LR   A,$0                ; 1e50 40
                XS   (IS)                ; 1e51 ec
                LR   (IS),A              ; 1e52 5c
                DS   $6                  ; 1e53 36
                BF   $4,A1e29            ; 1e54 94 d4
                JMP  A1d3c               ; 1e56 29 1d 3c
A1e59:          DCI  $0c2d               ; 1e59 2a 0c 2d
                LIS  $0                  ; 1e5c 70
                AM                       ; 1e5d 88
                BF   $1,A1ecd            ; 1e5e 91 6e
                CI   $01                 ; 1e60 25 01
                BT   1,A1e67             ; 1e62 81 04
                JMP  A1a85               ; 1e64 29 1a 85
A1e67:          LR   A,$b                ; 1e67 4b
                CI   $20                 ; 1e68 25 20
                BT   4,A1e98             ; 1e6a 84 2d
                DCI  $0eee               ; 1e6c 2a 0e ee
                SR   4                   ; 1e6f 14
                SL   1                   ; 1e70 13
                ADC                      ; 1e71 8e
                LIS  $0                  ; 1e72 70
                ST                       ; 1e73 17
                ST                       ; 1e74 17
                DCI  $0c2e               ; 1e75 2a 0c 2e
                LIS  $0                  ; 1e78 70
                ST                       ; 1e79 17
                DCI  $0f09               ; 1e7a 2a 0f 09
                LM                       ; 1e7d 16
                COM                      ; 1e7e 18
                DCI  $0f09               ; 1e7f 2a 0f 09
                ST                       ; 1e82 17
                BT   4,A1e88             ; 1e83 84 04
                JMP  A1b53               ; 1e85 29 1b 53
A1e88:          DCI  $0faf               ; 1e88 2a 0f af
                LR   A,$b                ; 1e8b 4b
                SR   4                   ; 1e8c 14
                ADC                      ; 1e8d 8e
                XDC                      ; 1e8e 2c
                DCI  $0ebf               ; 1e8f 2a 0e bf
                ADC                      ; 1e92 8e
                LM                       ; 1e93 16
                XDC                      ; 1e94 2c
                ST                       ; 1e95 17
                BF   $0,A1ecd            ; 1e96 90 36
A1e98:          DCI  $0c2a               ; 1e98 2a 0c 2a
                LM                       ; 1e9b 16
                CI   $3c                 ; 1e9c 25 3c
                BF   $4,A1ea3            ; 1e9e 94 04
                JMP  A17e8               ; 1ea0 29 17 e8
A1ea3:          DCI  $0c21               ; 1ea3 2a 0c 21
                LIS  $0                  ; 1ea6 70
                ST                       ; 1ea7 17
                ST                       ; 1ea8 17
                DCI  $0ed0               ; 1ea9 2a 0e d0
                LIS  $0                  ; 1eac 70
                AM                       ; 1ead 88
                BF   $4,A1eb3            ; 1eae 94 04
                JMP  A17d2               ; 1eb0 29 17 d2
A1eb3:          DCI  $0ed0               ; 1eb3 2a 0e d0
                LIS  $0                  ; 1eb6 70
                ST                       ; 1eb7 17
                DCI  $0e10               ; 1eb8 2a 0e 10
                LR   H,DC                ; 1ebb 11
                PI   A16ef               ; 1ebc 28 16 ef
                LR   DC,H                ; 1ebf 10
                PI   A16de               ; 1ec0 28 16 de
                DCI  $0c2d               ; 1ec3 2a 0c 2d
                LIS  $2                  ; 1ec6 72
A1ec7:          ST                       ; 1ec7 17
                LIS  $7                  ; 1ec8 77
                LR   $1,A                ; 1ec9 51
                JMP  A1ce5               ; 1eca 29 1c e5
A1ecd:          LR   A,$b                ; 1ecd 4b
                SR   4                   ; 1ece 14
                CI   $02                 ; 1ecf 25 02
                BF   $4,A1eed            ; 1ed1 94 1b
A1ed3:          DCI  $0e10               ; 1ed3 2a 0e 10
                LR   H,DC                ; 1ed6 11
                PI   A16de               ; 1ed7 28 16 de
                DCI  $0c2a               ; 1eda 2a 0c 2a
                LR   Q,DC                ; 1edd 0e
                LM                       ; 1ede 16
                INC                      ; 1edf 1f
                LR   DC,Q                ; 1ee0 0f
                ST                       ; 1ee1 17
A1ee2:          DCI  $0ed0               ; 1ee2 2a 0e d0
                LIS  $0                  ; 1ee5 70
                ST                       ; 1ee6 17
                DCI  $0c2d               ; 1ee7 2a 0c 2d
                LIS  $2                  ; 1eea 72
                BF   $0,A1ec7            ; 1eeb 90 db
A1eed:          DCI  $0faf               ; 1eed 2a 0f af
                ADC                      ; 1ef0 8e
                LR   Q,DC                ; 1ef1 0e
                LM                       ; 1ef2 16
                LR   $0,A                ; 1ef3 50
                LR   A,$b                ; 1ef4 4b
                CI   $30                 ; 1ef5 25 30
                BT   4,A1f04             ; 1ef7 84 0c
                LR   DC,Q                ; 1ef9 0f
                LIS  $1                  ; 1efa 71
                COM                      ; 1efb 18
                ADC                      ; 1efc 8e
                LR   A,$0                ; 1efd 40
                CM                       ; 1efe 8d
                BF   $1,A1f04            ; 1eff 91 04
                LIS  $e                  ; 1f01 7e
                BF   $0,A1f2c            ; 1f02 90 29
A1f04:          LIS  $0                  ; 1f04 70
                COM                      ; 1f05 18
                LR   DC,Q                ; 1f06 0f
                ADC                      ; 1f07 8e
                LR   Q,DC                ; 1f08 0e
                LR   A,$0                ; 1f09 40
                COM                      ; 1f0a 18
                INC                      ; 1f0b 1f
                LR   $0,A                ; 1f0c 50
                CM                       ; 1f0d 8d
                BT   1,A1f2b             ; 1f0e 81 1c
                LR   DC,Q                ; 1f10 0f
                ST                       ; 1f11 17
                LR   A,$b                ; 1f12 4b
                CI   $30                 ; 1f13 25 30
                BF   $4,A1f2b            ; 1f15 94 15
                LR   DC,H                ; 1f17 10
                XDC                      ; 1f18 2c
                DCI  $0e10               ; 1f19 2a 0e 10
                LISU 2                   ; 1f1c 62
                LISL 0                   ; 1f1d 68
                LIS  $1                  ; 1f1e 71
                SL   4                   ; 1f1f 15
                LR   (IS),A              ; 1f20 5c
                PI   $43cd               ; 1f21 28 43 cd
                DCI  $0c21               ; 1f24 2a 0c 21
                LM                       ; 1f27 16
                ST                       ; 1f28 17
                LM                       ; 1f29 16
                ST                       ; 1f2a 17
A1f2b:          LIS  $f                  ; 1f2b 7f
A1f2c:          SL   4                   ; 1f2c 15
                AS   $b                  ; 1f2d cb
                LR   $b,A                ; 1f2e 5b
                DCI  $0f09               ; 1f2f 2a 0f 09
                LIS  $0                  ; 1f32 70
                ST                       ; 1f33 17
                JMP  A1cb5               ; 1f34 29 1c b5
A1f37:          LI   $03                 ; 1f37 20 03
                LR   A,$0                ; 1f39 40
                SL   4                   ; 1f3a 15
                LR   IS,A                ; 1f3b 0b
                LR   K,P                 ; 1f3c 08
                POP                      ; 1f3d 1c
                LR   IS,A                ; 1f3e 0b
                COM                      ; 1f3f 18
                COM                      ; 1f40 18
                LR   A,QL                ; 1f41 03
                LI   $13                 ; 1f42 20 13
                LR   A,QL                ; 1f44 03
                LR   A,$0                ; 1f45 40
                LR   DC,H                ; 1f46 10
                LR   A,QL                ; 1f47 03
                LR   K,P                 ; 1f48 08
                SL   4                   ; 1f49 15
                LR   IS,A                ; 1f4a 0b
                COM                      ; 1f4b 18
                SR   1                   ; 1f4c 12
                LR   A,QL                ; 1f4d 03
                LI   $13                 ; 1f4e 20 13
                LR   A,QL                ; 1f50 03
                LR   A,$0                ; 1f51 40
                SR   1                   ; 1f52 12
                LR   A,QL                ; 1f53 03
                LR   K,P                 ; 1f54 08
                SL   1                   ; 1f55 13
                LR   A,QL                ; 1f56 03
                COM                      ; 1f57 18
                SL   4                   ; 1f58 15
                LR   IS,A                ; 1f59 0b
                LR   K,P                 ; 1f5a 08
                SL   1                   ; 1f5b 13
                LR   A,QL                ; 1f5c 03
                COM                      ; 1f5d 18
                SL   1                   ; 1f5e 13
                LR   A,QL                ; 1f5f 03
                LI   $13                 ; 1f60 20 13
                LR   A,QL                ; 1f62 03
                LI   $10                 ; 1f63 20 10
                LR   A,QL                ; 1f65 03
                LR   K,P                 ; 1f66 08
                LR   Q,DC                ; 1f67 0e
                LR   A,QL                ; 1f68 03
                COM                      ; 1f69 18
                LR   DC,H                ; 1f6a 10
                LR   A,QL                ; 1f6b 03
                LI   $16                 ; 1f6c 20 16
                LR   IS,A                ; 1f6e 0b
                LIS  $8                  ; 1f6f 78
                LM                       ; 1f70 16
                LR   IS,A                ; 1f71 0b
                LR   DC,Q                ; 1f72 0f
                LM                       ; 1f73 16
                LR   IS,A                ; 1f74 0b
                db   $2d                 
                LM                       ; 1f76 16
                LR   IS,A                ; 1f77 0b
                LR   DC,Q                ; 1f78 0f
                SR   4                   ; 1f79 14
                LR   A,QL                ; 1f7a 03
                db   $2d                 
                SR   4                   ; 1f7c 14
                LR   A,QL                ; 1f7d 03
                LR   DC,Q                ; 1f7e 0f
                SR   1                   ; 1f7f 12
                LR   A,QL                ; 1f80 03
                db   $2d                 
                LM                       ; 1f82 16
                LR   IS,A                ; 1f83 0b
                DS   (IS)                ; 1f84 3c
                LM                       ; 1f85 16
                LR   IS,A                ; 1f86 0b
                LR   DC,Q                ; 1f87 0f
                LM                       ; 1f88 16
                LR   IS,A                ; 1f89 0b
                db   $2d                 
                LM                       ; 1f8b 16
                LR   IS,A                ; 1f8c 0b
                DS   (IS)                ; 1f8d 3c
                EI                       ; 1f8e 1b
                LR   A,QL                ; 1f8f 03
                LIS  $8                  ; 1f90 78
                EI                       ; 1f91 1b
                LR   A,QL                ; 1f92 03
                LR   DC,Q                ; 1f93 0f
                EI                       ; 1f94 1b
                LR   A,QL                ; 1f95 03
                db   $2d                 
                EI                       ; 1f97 1b
                LR   A,QL                ; 1f98 03
                LR   DC,Q                ; 1f99 0f
                COM                      ; 1f9a 18
                LR   A,QL                ; 1f9b 03
                db   $2d                 
                COM                      ; 1f9d 18
                LR   A,QL                ; 1f9e 03
                LR   DC,Q                ; 1f9f 0f
                LM                       ; 1fa0 16
                LR   IS,A                ; 1fa1 0b
                db   $2d                 
                EI                       ; 1fa3 1b
                LR   A,QL                ; 1fa4 03
                DS   (IS)                ; 1fa5 3c
                EI                       ; 1fa6 1b
                LR   A,QL                ; 1fa7 03
                LR   DC,Q                ; 1fa8 0f
                EI                       ; 1fa9 1b
                LR   A,QL                ; 1faa 03
                db   $2d                 
                EI                       ; 1fac 1b
                LR   A,QL                ; 1fad 03
                DS   (IS)                ; 1fae 3c
                LR   A,KU                ; 1faf 00
                LR   A,KU                ; 1fb0 00
                LR   A,KU                ; 1fb1 00
                LR   A,KU                ; 1fb2 00
                LR   A,KU                ; 1fb3 00
                LR   A,KU                ; 1fb4 00
                LR   A,KU                ; 1fb5 00
                LR   A,KU                ; 1fb6 00
                LR   A,KU                ; 1fb7 00
                LR   A,KU                ; 1fb8 00
                LR   A,KU                ; 1fb9 00
                LR   A,KU                ; 1fba 00
                LR   A,KU                ; 1fbb 00
                LR   A,KU                ; 1fbc 00
                LR   A,KU                ; 1fbd 00
                LR   A,KU                ; 1fbe 00
                LR   A,KU                ; 1fbf 00
                LR   A,KU                ; 1fc0 00
                LR   A,KU                ; 1fc1 00
                LR   A,KU                ; 1fc2 00
                LR   A,KU                ; 1fc3 00
                LR   A,KU                ; 1fc4 00
                LR   A,KU                ; 1fc5 00
                LR   A,KU                ; 1fc6 00
                LR   A,KU                ; 1fc7 00
                LR   A,KU                ; 1fc8 00
                LR   A,KU                ; 1fc9 00
                LR   A,KU                ; 1fca 00
                LR   A,KU                ; 1fcb 00
                LR   A,KU                ; 1fcc 00
                LR   A,KU                ; 1fcd 00
                LR   A,KU                ; 1fce 00
                LR   A,KU                ; 1fcf 00
                LR   A,KU                ; 1fd0 00
                LR   A,KU                ; 1fd1 00
                LR   A,KU                ; 1fd2 00
                LR   A,KU                ; 1fd3 00
                LR   A,KU                ; 1fd4 00
                LR   A,KU                ; 1fd5 00
                LR   A,KU                ; 1fd6 00
                LR   A,KU                ; 1fd7 00
                LR   A,KU                ; 1fd8 00
                LR   A,KU                ; 1fd9 00
                LR   A,KU                ; 1fda 00
                LR   A,KU                ; 1fdb 00
                LR   A,KU                ; 1fdc 00
                LR   A,KU                ; 1fdd 00
                LR   A,KU                ; 1fde 00
                LR   A,KU                ; 1fdf 00
                LR   A,KU                ; 1fe0 00
                LR   A,KU                ; 1fe1 00
                LR   A,KU                ; 1fe2 00
                LR   A,KU                ; 1fe3 00
                LR   A,KU                ; 1fe4 00
                LR   A,KU                ; 1fe5 00
                LR   A,KU                ; 1fe6 00
                LR   A,KU                ; 1fe7 00
                LR   A,KU                ; 1fe8 00
                LR   A,KU                ; 1fe9 00
                LR   A,KU                ; 1fea 00
                LR   A,KU                ; 1feb 00
                LR   A,KU                ; 1fec 00
                LR   A,KU                ; 1fed 00
                LR   A,KU                ; 1fee 00
                LR   A,KU                ; 1fef 00
                LR   A,KU                ; 1ff0 00
                LR   A,KU                ; 1ff1 00
                LR   A,KU                ; 1ff2 00
                LR   A,KU                ; 1ff3 00
                LR   A,KU                ; 1ff4 00
                LR   A,KU                ; 1ff5 00
                LR   A,KU                ; 1ff6 00
                LR   A,KU                ; 1ff7 00
                LR   A,KU                ; 1ff8 00
                LR   A,KU                ; 1ff9 00
                LR   A,KU                ; 1ffa 00
                LR   A,KU                ; 1ffb 00
                LR   A,KU                ; 1ffc 00
                LR   A,KU                ; 1ffd 00
                LR   A,KU                ; 1ffe 00
                LR   A,KU                ; 1fff 00
