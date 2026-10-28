;Lemonade Stand - ED06

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/29/2010

org $1000

				db   $aa,$55			;cart signature
				db   $04				;background color
				db   $27,$0b,$29,$13,$2b,$11,$1f,$0b,$00,$21,$07,$11,$2b,$1f,$00	;name - LEMONADE STAND
                
START:          LI   $44                 ; 1012 20 44
                DCI  $08f7               ; 1014 2a 08 f7
                ST                       ; 1017 17
                DCI  $0fea               ; 1018 2a 0f ea
                ST                       ; 101b 17
                LI   $2f                 ; 101c 20 2f
                LR   $0,A                ; 101e 50
                DCI  $0c00               ; 101f 2a 0c 00
                PI   A19b1               ; 1022 28 19 b1
                LISU 5                   ; 1025 65
                PI   A1b77               ; 1026 28 1b 77
                DCI  A1e5f               ; 1029 2a 1e 5f
                PI   A1b86               ; 102c 28 1b 86
A102f:          LIS  $5                  ; 102f 75
                LR   $0,A                ; 1030 50
                LIS  $4                  ; 1031 74
                LR   $1,A                ; 1032 51
                DCI  $0c2a               ; 1033 2a 0c 2a
                ST                       ; 1036 17
                PI   A1aa6               ; 1037 28 1a a6
                LIS  $0                  ; 103a 70
                XS   $3                  ; 103b e3
                BF   $1,A102f            ; 103c 91 f2
                BT   4,A102f             ; 103e 84 f0
                DCI  $0c26               ; 1040 2a 0c 26
                ST                       ; 1043 17
                LR   $8,A                ; 1044 58
                PI   A1863               ; 1045 28 18 63
                PI   $4105               ; 1048 28 41 05
                PI   A1867               ; 104b 28 18 67
A104e:          LIS  $1                  ; 104e 71
                DCI  $0c00               ; 104f 2a 0c 00
                ST                       ; 1052 17
                LIS  $6                  ; 1053 76
                LR   $0,A                ; 1054 50
                LIS  $3                  ; 1055 73
                LR   $1,A                ; 1056 51
                PI   A1aa6               ; 1057 28 1a a6
                LIS  $0                  ; 105a 70
                XS   $3                  ; 105b e3
                BF   $1,A104e            ; 105c 91 f1
                BT   4,A104e             ; 105e 84 ef
                DCI  $0c29               ; 1060 2a 0c 29
                ST                       ; 1063 17
                LR   $8,A                ; 1064 58
                PI   $4105               ; 1065 28 41 05
                DCI  $0c21               ; 1068 2a 0c 21
                LIS  $2                  ; 106b 72
A106c:          ST                       ; 106c 17
                CM                       ; 106d 8d
                DS   $3                  ; 106e 33
                BF   $4,A106c            ; 106f 94 fc
                DCI  $0c00               ; 1071 2a 0c 00
                LIS  $0                  ; 1074 70
                ST                       ; 1075 17
                PI   A1a9c               ; 1076 28 1a 9c
                LR   A,$3                ; 1079 43
                INC                      ; 107a 1f
                BF   $4,START            ; 107b 94 96
A107d:          PI   $4795               ; 107d 28 47 95
                NI   $07                 ; 1080 21 07
                BT   4,A107d             ; 1082 84 fa
                CI   $04                 ; 1084 25 04
                BF   $2,A107d            ; 1086 92 f6
                DCI  $0c27               ; 1088 2a 0c 27
                ST                       ; 108b 17
A108c:          DCI  $0c01               ; 108c 2a 0c 01
                PI   A187a               ; 108f 28 18 7a
                SR   1                   ; 1092 12
                BF   $4,A10e8            ; 1093 94 54
                DCI  $0c26               ; 1095 2a 0c 26
                LM                       ; 1098 16
                CI   $04                 ; 1099 25 04
                BF   $4,A10dd            ; 109b 94 41
A109d:          DCI  A1e8c               ; 109d 2a 1e 8c
                PI   A1b86               ; 10a0 28 1b 86
A10a3:          LIS  $8                  ; 10a3 78
                LR   $1,A                ; 10a4 51
                LIS  $1                  ; 10a5 71
                LR   $0,A                ; 10a6 50
                DCI  $08f5               ; 10a7 2a 08 f5
                ST                       ; 10aa 17
                PI   A1aa6               ; 10ab 28 1a a6
                LIS  $0                  ; 10ae 70
                XS   $3                  ; 10af e3
                BF   $1,A10a3            ; 10b0 91 f2
                LR   $8,A                ; 10b2 58
                DCI  $0c27               ; 10b3 2a 0c 27
                ST                       ; 10b6 17
                PI   A1863               ; 10b7 28 18 63
                PI   $4105               ; 10ba 28 41 05
A10bd:          LIS  $4                  ; 10bd 74
                LR   $0,A                ; 10be 50
                LIS  $5                  ; 10bf 75
                LR   $1,A                ; 10c0 51
                PI   A1aa6               ; 10c1 28 1a a6
                LIS  $0                  ; 10c4 70
                XS   $3                  ; 10c5 e3
                BF   $1,A10bd            ; 10c6 91 f6
                LR   $8,A                ; 10c8 58
                DCI  $0c2b               ; 10c9 2a 0c 2b
                ST                       ; 10cc 17
                PI   A1867               ; 10cd 28 18 67
                PI   $4105               ; 10d0 28 41 05
                PI   A1a9c               ; 10d3 28 1a 9c
                LR   A,$3                ; 10d6 43
                INC                      ; 10d7 1f
                BF   $4,A109d            ; 10d8 94 c4
A10da:          JMP  A117e               ; 10da 29 11 7e
A10dd:          DCI  $0c2b               ; 10dd 2a 0c 2b
                CI   $03                 ; 10e0 25 03
                BF   $4,A10da            ; 10e2 94 f7
                LIS  $2                  ; 10e4 72
                ST                       ; 10e5 17
                BF   $0,A10da            ; 10e6 90 f3
A10e8:          PI   A1b77               ; 10e8 28 1b 77
                PI   $4795               ; 10eb 28 47 95
                LR   $1,A                ; 10ee 51
                LIS  $0                  ; 10ef 70
                XS   $1                  ; 10f0 e1
                BF   $1,A1136            ; 10f1 91 44
                NI   $01                 ; 10f3 21 01
                DCI  $0c2a               ; 10f5 2a 0c 2a
                LR   H,DC                ; 10f8 11
                LI   $10                 ; 10f9 20 10
                BT   4,A1113             ; 10fb 84 17
                CM                       ; 10fd 8d
                LR   DC,H                ; 10fe 10
                BF   $4,A1105            ; 10ff 94 05
                LIS  $9                  ; 1101 79
                ST                       ; 1102 17
                BF   $0,A1136            ; 1103 90 32
A1105:          LM                       ; 1105 16
                LR   $7,A                ; 1106 57
                CI   $04                 ; 1107 25 04
                BT   4,A1136             ; 1109 84 2c
                DS   $7                  ; 110b 37
                LR   A,$7                ; 110c 47
                LR   DC,H                ; 110d 10
                ST                       ; 110e 17
                LI   $1c                 ; 110f 20 1c
                BF   $0,A111c            ; 1111 90 0a
A1113:          CM                       ; 1113 8d
                BT   4,A1136             ; 1114 84 21
                LR   DC,H                ; 1116 10
                PI   A187a               ; 1117 28 18 7a
                LI   $30                 ; 111a 20 30
A111c:          LR   $7,A                ; 111c 57
                DCI  A1f9f               ; 111d 2a 1f 9f
                PI   A1b86               ; 1120 28 1b 86
                LR   A,$7                ; 1123 47
                LR   $8,A                ; 1124 58
                LIS  $3                  ; 1125 73
                DCI  $08f5               ; 1126 2a 08 f5
                ST                       ; 1129 17
                LI   $49                 ; 112a 20 49
                DCI  $0fdf               ; 112c 2a 0f df
                ST                       ; 112f 17
                PI   $40d9               ; 1130 28 40 d9
                PI   A1a8f               ; 1133 28 1a 8f
A1136:          PI   $4795               ; 1136 28 47 95
                LR   A,$8                ; 1139 48
                SR   4                   ; 113a 14
                DCI  A1d76               ; 113b 2a 1d 76
                ADC                      ; 113e 8e
                LM                       ; 113f 16
                DCI  $0c2c               ; 1140 2a 0c 2c
                ST                       ; 1143 17
                CI   $04                 ; 1144 25 04
                BF   $2,A117e            ; 1146 92 37
                BF   $4,A114b            ; 1148 94 02
                LIS  $3                  ; 114a 73
A114b:          DCI  $08f5               ; 114b 2a 08 f5
                ST                       ; 114e 17
                CI   $03                 ; 114f 25 03
                BT   4,A1165             ; 1151 84 13
                CI   $02                 ; 1153 25 02
                BT   4,A1160             ; 1155 84 0a
                CI   $01                 ; 1157 25 01
                BF   $4,A117e            ; 1159 94 24
                DCI  A1f62               ; 115b 2a 1f 62
                BF   $0,A1168            ; 115e 90 09
A1160:          DCI  A1f6d               ; 1160 2a 1f 6d
                BF   $0,A1168            ; 1163 90 04
A1165:          DCI  A1f73               ; 1165 2a 1f 73
A1168:          PI   A1b86               ; 1168 28 1b 86
                DCI  $1f7b               ; 116b 2a 1f 7b
                PI   A1b86               ; 116e 28 1b 86
                LIS  $2                  ; 1171 72
                LR   $7,A                ; 1172 57
A1173:          LIS  $6                  ; 1173 76
                LR   $6,A                ; 1174 56
                PI   A1be7               ; 1175 28 1b e7
                DS   $7                  ; 1178 37
                BF   $4,A1173            ; 1179 94 f9
                PI   A1a8f               ; 117b 28 1a 8f
A117e:          DCI  $0c02               ; 117e 2a 0c 02
                LI   $1e                 ; 1181 20 1e
                LR   $0,A                ; 1183 50
                PI   A19b1               ; 1184 28 19 b1
                PI   A1ccf               ; 1187 28 1c cf
                DCI  $0c28               ; 118a 2a 0c 28
                LIS  $1                  ; 118d 71
                ST                       ; 118e 17
A118f:          DCI  $1eb1               ; 118f 2a 1e b1
                PI   A1b86               ; 1192 28 1b 86
                DCI  A1d8b               ; 1195 2a 1d 8b
                PI   A1c6f               ; 1198 28 1c 6f
                PI   A1cb8               ; 119b 28 1c b8
                DCI  $0f9c               ; 119e 2a 0f 9c
                LIS  $1                  ; 11a1 71
                ST                       ; 11a2 17
                DCI  $0f7c               ; 11a3 2a 0f 7c
                LIS  $0                  ; 11a6 70
                ST                       ; 11a7 17
                DCI  $0f8c               ; 11a8 2a 0f 8c
                ST                       ; 11ab 17
A11ac:          PI   A19ac               ; 11ac 28 19 ac
                DCI  $0c1c               ; 11af 2a 0c 1c
                PI   A1bdf               ; 11b2 28 1b df
                LR   H,DC                ; 11b5 11
                DCI  $0c2a               ; 11b6 2a 0c 2a
                LM                       ; 11b9 16
                DCI  $0f52               ; 11ba 2a 0f 52
                LR   Q,DC                ; 11bd 0e
                CM                       ; 11be 8d
                ST                       ; 11bf 17
                LR   DC,Q                ; 11c0 0f
                PI   A1913               ; 11c1 28 19 13
                BT   1,A11e8             ; 11c4 81 23
                LR   DC,H                ; 11c6 10
                CM                       ; 11c7 8d
                LIS  $0                  ; 11c8 70
                ST                       ; 11c9 17
                DCI  $08f5               ; 11ca 2a 08 f5
                ST                       ; 11cd 17
                PI   A1b77               ; 11ce 28 1b 77
                DCI  A1f4d               ; 11d1 2a 1f 4d
                PI   A1b86               ; 11d4 28 1b 86
                DCI  $0c28               ; 11d7 2a 0c 28
                LM                       ; 11da 16
                LR   $8,A                ; 11db 58
                LI   $3a                 ; 11dc 20 3a
                DCI  $0fdf               ; 11de 2a 0f df
                ST                       ; 11e1 17
                PI   $4105               ; 11e2 28 41 05
                JMP  A1363               ; 11e5 29 13 63
A11e8:          DCI  $0c01               ; 11e8 2a 0c 01
                LM                       ; 11eb 16
                LR   (IS),A              ; 11ec 5c
                DCI  $0fdf               ; 11ed 2a 0f df
                LIS  $4                  ; 11f0 74
                ST                       ; 11f1 17
                PI   $421e               ; 11f2 28 42 1e
                DCI  $0c28               ; 11f5 2a 0c 28
                LM                       ; 11f8 16
                LR   $8,A                ; 11f9 58
                DCI  A1f95               ; 11fa 2a 1f 95
                ADC                      ; 11fd 8e
                LM                       ; 11fe 16
                DCI  $08f5               ; 11ff 2a 08 f5
                ST                       ; 1202 17
                DCI  $0fdf               ; 1203 2a 0f df
                LI   $26                 ; 1206 20 26
                ST                       ; 1208 17
                PI   $4105               ; 1209 28 41 05
                DCI  $0c2a               ; 120c 2a 0c 2a
                LM                       ; 120f 16
                LR   (IS),A              ; 1210 5c
                DCI  $0fdf               ; 1211 2a 0f df
                LI   $15                 ; 1214 20 15
                ST                       ; 1216 17
                PI   $421e               ; 1217 28 42 1e
                LIS  $6                  ; 121a 76
                LR   $0,A                ; 121b 50
A121c:          DCI  A1f8f               ; 121c 2a 1f 8f
                LR   A,$0                ; 121f 40
                ADC                      ; 1220 8e
                AI   $17                 ; 1221 24 17
                LR   IS,A                ; 1223 0b
                LM                       ; 1224 16
                LR   (IS),A              ; 1225 5c
                DCI  $0fdf               ; 1226 2a 0f df
                ST                       ; 1229 17
                LIS  $0                  ; 122a 70
                LR   $8,A                ; 122b 58
                LISU 5                   ; 122c 65
                LR   (IS)+,A             ; 122d 5d
                PI   $40d9               ; 122e 28 40 d9
                DS   $0                  ; 1231 30
                BF   $4,A121c            ; 1232 94 e9
                DCI  A1ee6               ; 1234 2a 1e e6
                PI   A1b4f               ; 1237 28 1b 4f
                DCI  $0fdf               ; 123a 2a 0f df
                LI   $6b                 ; 123d 20 6b
                ST                       ; 123f 17
                DCI  $0c1d               ; 1240 2a 0c 1d
                PI   A1bdf               ; 1243 28 1b df
                PI   A1aed               ; 1246 28 1a ed
A1249:          LIS  $0                  ; 1249 70
                LR   $5,A                ; 124a 55
A124b:          PI   A12ae               ; 124b 28 12 ae
                LR   A,$5                ; 124e 45
                AI   $18                 ; 124f 24 18
                LR   IS,A                ; 1251 0b
                LR   A,(IS)              ; 1252 4c
                DCI  $0fdf               ; 1253 2a 0f df
                ST                       ; 1256 17
                LR   $8,A                ; 1257 58
                SL   4                   ; 1258 15
                SR   1                   ; 1259 12
                AI   $28                 ; 125a 24 28
                DCI  $084d               ; 125c 2a 08 4d
                ST                       ; 125f 17
                LR   A,$8                ; 1260 48
                SR   4                   ; 1261 14
                DCI  $4781               ; 1262 2a 47 81
                ADC                      ; 1265 8e
                LM                       ; 1266 16
                DCI  $085d               ; 1267 2a 08 5d
                ST                       ; 126a 17
                DCI  $087d               ; 126b 2a 08 7d
                LIS  $d                  ; 126e 7d
                ST                       ; 126f 17
A1270:          PI   A1a9c               ; 1270 28 1a 9c
                LIS  $0                  ; 1273 70
                XS   $3                  ; 1274 e3
                BF   $1,A1290            ; 1275 91 1a
                LR   $8,A                ; 1277 58
                PI   $4105               ; 1278 28 41 05
                LR   A,$5                ; 127b 45
                AI   $28                 ; 127c 24 28
                LR   IS,A                ; 127e 0b
                LR   A,$3                ; 127f 43
                LR   (IS),A              ; 1280 5c
                LR   A,$5                ; 1281 45
                CI   $05                 ; 1282 25 05
                BT   4,A12c9             ; 1284 84 44
                INC                      ; 1286 1f
A1287:          LR   $5,A                ; 1287 55
                PI   A12a0               ; 1288 28 12 a0
                BF   $4,A124b            ; 128b 94 bf
                LIS  $4                  ; 128d 74
                BF   $0,A1287            ; 128e 90 f8
A1290:          LR   A,$3                ; 1290 43
                INC                      ; 1291 1f
                INC                      ; 1292 1f
                BF   $4,A1270            ; 1293 94 dc
                DS   $5                  ; 1295 35
                BF   $1,A1249            ; 1296 91 b2
                PI   A12a0               ; 1298 28 12 a0
                BF   $4,A124b            ; 129b 94 af
                LR   $5,A                ; 129d 55
                BF   $0,A124b            ; 129e 90 ac
A12a0:          LR   A,$5                ; 12a0 45
                SR   1                   ; 12a1 12
A12a2:          DCI  $0c26               ; 12a2 2a 0c 26
                CM                       ; 12a5 8d
                BF   $4,A12aa            ; 12a6 94 03
                CI   $01                 ; 12a8 25 01
A12aa:          POP                      ; 12aa 1c
A12ab:          LR   A,$7                ; 12ab 47
                BF   $0,A12a2            ; 12ac 90 f5
A12ae:          LR   K,P                 ; 12ae 08
                LIS  $9                  ; 12af 79
                LR   $6,A                ; 12b0 56
                PI   A12a0               ; 12b1 28 12 a0
A12b4:          BT   4,A12c0             ; 12b4 84 0b
                DCI  $0870               ; 12b6 2a 08 70
                LR   H,DC                ; 12b9 11
                ADC                      ; 12ba 8e
                ST                       ; 12bb 17
                AS   $6                  ; 12bc c6
                LR   DC,H                ; 12bd 10
                ADC                      ; 12be 8e
                ST                       ; 12bf 17
A12c0:          PK                       ; 12c0 0c
A12c1:          LR   K,P                 ; 12c1 08
                LIS  $6                  ; 12c2 76
                LR   $6,A                ; 12c3 56
                PI   A12ab               ; 12c4 28 12 ab
                BF   $0,A12b4            ; 12c7 90 ec
A12c9:          PI   A1a9c               ; 12c9 28 1a 9c
                LIS  $0                  ; 12cc 70
                XS   $3                  ; 12cd e3
                BT   1,A12c9             ; 12ce 81 fa
                INC                      ; 12d0 1f
                BF   $4,A1290            ; 12d1 94 be
                DCI  $087d               ; 12d3 2a 08 7d
                LI   $8d                 ; 12d6 20 8d
                ST                       ; 12d8 17
                PI   A19ac               ; 12d9 28 19 ac
                LIS  $3                  ; 12dc 73
                LR   $0,A                ; 12dd 50
                LISL 0                   ; 12de 68
                LISU 5                   ; 12df 65
                DCI  $0c00               ; 12e0 2a 0c 00
                PI   A1bd6               ; 12e3 28 1b d6
                LR   H,DC                ; 12e6 11
A12e7:          LR   A,(IS)+             ; 12e7 4d
                SL   4                   ; 12e8 15
                XS   (IS)+               ; 12e9 ed
                ST                       ; 12ea 17
                LIS  $2                  ; 12eb 72
                ADC                      ; 12ec 8e
                DS   $0                  ; 12ed 30
                BF   $4,A12e7            ; 12ee 94 f8
                LISU 4                   ; 12f0 64
                LR   DC,H                ; 12f1 10
                LM                       ; 12f2 16
                DCI  $0f53               ; 12f3 2a 0f 53
                ST                       ; 12f6 17
                DCI  $0c2a               ; 12f7 2a 0c 2a
                LM                       ; 12fa 16
                DCI  $0f56               ; 12fb 2a 0f 56
                ST                       ; 12fe 17
                PI   A1a12               ; 12ff 28 1a 12
                DCI  $0c0b               ; 1302 2a 0c 0b
                PI   A1bdf               ; 1305 28 1b df
                PI   A1bab               ; 1308 28 1b ab
                PI   A19ac               ; 130b 28 19 ac
                DCI  $0c04               ; 130e 2a 0c 04
                PI   A1bd6               ; 1311 28 1b d6
                DCI  $0f53               ; 1314 2a 0f 53
                ST                       ; 1317 17
                LI   $15                 ; 1318 20 15
                DCI  $0f56               ; 131a 2a 0f 56
                ST                       ; 131d 17
                PI   A1a12               ; 131e 28 1a 12
                DCI  $0f53               ; 1321 2a 0f 53
                PI   A1bab               ; 1324 28 1b ab
                LIS  $0                  ; 1327 70
                ST                       ; 1328 17
                DCI  $0c0b               ; 1329 2a 0c 0b
                PI   A1bdf               ; 132c 28 1b df
                PI   A1bb1               ; 132f 28 1b b1
                PI   A19c5               ; 1332 28 19 c5
                DCI  $0c0a               ; 1335 2a 0c 0a
                PI   A1bdf               ; 1338 28 1b df
                LR   Q,DC                ; 133b 0e
                LM                       ; 133c 16
                PI   A1bab               ; 133d 28 1b ab
                PI   A19ac               ; 1340 28 19 ac
                DCI  $0c1c               ; 1343 2a 0c 1c
                PI   A1bdf               ; 1346 28 1b df
                LR   H,DC                ; 1349 11
                LR   DC,Q                ; 134a 0f
                PI   A1913               ; 134b 28 19 13
                BF   $1,A1378            ; 134e 91 29
                DCI  A1eef               ; 1350 2a 1e ef
                PI   A1b4f               ; 1353 28 1b 4f
                LR   H,DC                ; 1356 11
                PI   A186b               ; 1357 28 18 6b
                DCI  $0c0b               ; 135a 2a 0c 0b
                PI   A1bdf               ; 135d 28 1b df
                PI   A1aed               ; 1360 28 1a ed
A1363:          PI   A1a8f               ; 1363 28 1a 8f
                PI   A1bc4               ; 1366 28 1b c4
                BT   4,A1388             ; 1369 84 1e
                DCI  $0ffa               ; 136b 2a 0f fa
                LM                       ; 136e 16
                SL   4                   ; 136f 15
                BT   4,A1375             ; 1370 84 04
                JMP  A118f               ; 1372 29 11 8f
A1375:          JMP  A11ac               ; 1375 29 11 ac
A1378:          DCI  A1efa               ; 1378 2a 1e fa
                PI   A1b4f               ; 137b 28 1b 4f
                LIS  $4                  ; 137e 74
                LR   $6,A                ; 137f 56
                PI   A1be7               ; 1380 28 1b e7
                PI   A1a8f               ; 1383 28 1a 8f
                BF   $0,A1375            ; 1386 90 ee
A1388:          DCI  $0c2c               ; 1388 2a 0c 2c
                LIS  $0                  ; 138b 70
                XM                       ; 138c 8c
                BT   4,A139f             ; 138d 84 11
                LR   $7,A                ; 138f 57
                PI   A1ccf               ; 1390 28 1c cf
                PI   A1b68               ; 1393 28 1b 68
                LR   A,$7                ; 1396 47
                DCI  A1cdc               ; 1397 2a 1c dc
                ADC                      ; 139a 8e
                ADC                      ; 139b 8e
                JMP  $4420               ; 139c 29 44 20
A139f:          DCI  $0f3f               ; 139f 2a 0f 3f
                LI   $22                 ; 13a2 20 22
                LR   $0,A                ; 13a4 50
                PI   A19b1               ; 13a5 28 19 b1
A13a8:          PI   A19ac               ; 13a8 28 19 ac
                DCI  $0c26               ; 13ab 2a 0c 26
                LR   H,DC                ; 13ae 11
                LIS  $1                  ; 13af 71
                CM                       ; 13b0 8d
                LR   DC,H                ; 13b1 10
                BT   4,A13b8             ; 13b2 84 05
                LIS  $4                  ; 13b4 74
                CM                       ; 13b5 8d
                BF   $4,A13b9            ; 13b6 94 02
A13b8:          LIS  $0                  ; 13b8 70
A13b9:          AI   $6a                 ; 13b9 24 6a
                AMD                      ; 13bb 89
                NOP                      ; 13bc 2b
                DCI  $0f53               ; 13bd 2a 0f 53
                ST                       ; 13c0 17
                DCI  $0c07               ; 13c1 2a 0c 07
                PI   A1bd6               ; 13c4 28 1b d6
                DCI  $0f56               ; 13c7 2a 0f 56
                ST                       ; 13ca 17
                PI   A19c5               ; 13cb 28 19 c5
                DCI  $0f53               ; 13ce 2a 0f 53
                PI   A1bab               ; 13d1 28 1b ab
                DCI  $0c04               ; 13d4 2a 0c 04
                PI   A1bd6               ; 13d7 28 1b d6
                CI   $04                 ; 13da 25 04
                BF   $2,A13e5            ; 13dc 92 08
                CI   $00                 ; 13de 25 00
                BT   4,A13e6             ; 13e0 84 05
                INC                      ; 13e2 1f
                BF   $0,A13e6            ; 13e3 90 02
A13e5:          LIS  $6                  ; 13e5 76
A13e6:          DCI  $0f56               ; 13e6 2a 0f 56
                ST                       ; 13e9 17
                PI   A192e               ; 13ea 28 19 2e
                BT   1,A13fc             ; 13ed 81 0e
                DCI  $0f4f               ; 13ef 2a 0f 4f
                LIS  $0                  ; 13f2 70
                ST                       ; 13f3 17
                ST                       ; 13f4 17
                DCI  $0f53               ; 13f5 2a 0f 53
                ST                       ; 13f8 17
                ST                       ; 13f9 17
                BF   $0,A1405            ; 13fa 90 0a
A13fc:          PI   A19ea               ; 13fc 28 19 ea
                DCI  $0f4f               ; 13ff 2a 0f 4f
                PI   A1bab               ; 1402 28 1b ab
A1405:          DCI  $0f56               ; 1405 2a 0f 56
                PI   A1bab               ; 1408 28 1b ab
                LI   $18                 ; 140b 20 18
                DCI  $0f53               ; 140d 2a 0f 53
                ST                       ; 1410 17
                PI   A192e               ; 1411 28 19 2e
                LI   $37                 ; 1414 20 37
                LR   $6,A                ; 1416 56
                LIS  $1                  ; 1417 71
                LR   $1,A                ; 1418 51
                BF   $1,A1430            ; 1419 91 16
                DCI  $0f53               ; 141b 2a 0f 53
                LI   $12                 ; 141e 20 12
                ST                       ; 1420 17
                PI   A192e               ; 1421 28 19 2e
                LI   $54                 ; 1424 20 54
                LR   $6,A                ; 1426 56
                LIS  $2                  ; 1427 72
                LR   $1,A                ; 1428 51
                BF   $1,A1430            ; 1429 91 06
                LI   $90                 ; 142b 20 90
                LR   $6,A                ; 142d 56
                LIS  $5                  ; 142e 75
                LR   $1,A                ; 142f 51
A1430:          PI   A19ac               ; 1430 28 19 ac
                DCI  $0f4f               ; 1433 2a 0f 4f
                PI   A1bbe               ; 1436 28 1b be
                LR   A,$1                ; 1439 41
                DCI  $0f56               ; 143a 2a 0f 56
                ST                       ; 143d 17
                PI   A1a12               ; 143e 28 1a 12
                DCI  $0f56               ; 1441 2a 0f 56
                PI   A1bab               ; 1444 28 1b ab
                LIS  $0                  ; 1447 70
                ST                       ; 1448 17
                DCI  $0f53               ; 1449 2a 0f 53
                LR   A,$6                ; 144c 46
                ST                       ; 144d 17
                LIS  $0                  ; 144e 70
                ST                       ; 144f 17
                ST                       ; 1450 17
                PI   A192e               ; 1451 28 19 2e
                BT   1,A1478             ; 1454 81 23
                DCI  $0f56               ; 1456 2a 0f 56
                LR   H,DC                ; 1459 11
                LM                       ; 145a 16
                LR   $0,A                ; 145b 50
                LR   A,$6                ; 145c 46
                LR   DC,H                ; 145d 10
                ST                       ; 145e 17
                DCI  $0f53               ; 145f 2a 0f 53
                LR   A,$0                ; 1462 40
                ST                       ; 1463 17
                PI   A19ea               ; 1464 28 19 ea
                DCI  $0f56               ; 1467 2a 0f 56
                LIS  $0                  ; 146a 70
                ST                       ; 146b 17
                XDC                      ; 146c 2c
                DCI  $0f59               ; 146d 2a 0f 59
                LM                       ; 1470 16
                XDC                      ; 1471 2c
                ST                       ; 1472 17
                LI   $80                 ; 1473 20 80
                ST                       ; 1475 17
                BF   $0,A1483            ; 1476 90 0c
A1478:          PI   A19ea               ; 1478 28 19 ea
                DCI  $0f56               ; 147b 2a 0f 56
                LIS  $0                  ; 147e 70
                ST                       ; 147f 17
                PI   A1bab               ; 1480 28 1b ab
A1483:          DCI  $0f53               ; 1483 2a 0f 53
                LIS  $0                  ; 1486 70
                ST                       ; 1487 17
                LR   Q,DC                ; 1488 0e
                DCI  $0c03               ; 1489 2a 0c 03
                PI   A1bd6               ; 148c 28 1b d6
                LR   H,DC                ; 148f 11
                LM                       ; 1490 16
                CI   $01                 ; 1491 25 01
                BF   $2,A149a            ; 1493 92 06
                BF   $4,A14a8            ; 1495 94 12
                LIS  $3                  ; 1497 73
                BF   $0,A14a8            ; 1498 90 0f
A149a:          LR   DC,H                ; 149a 10
                LM                       ; 149b 16
                SR   4                   ; 149c 14
                LR   $0,A                ; 149d 50
                LR   DC,H                ; 149e 10
                LM                       ; 149f 16
                SL   4                   ; 14a0 15
                DCI  $0f53               ; 14a1 2a 0f 53
                ST                       ; 14a4 17
                LI   $6a                 ; 14a5 20 6a
                ASD  $0                  ; 14a7 d0
A14a8:          LR   DC,Q                ; 14a8 0f
                ST                       ; 14a9 17
                DCI  $0f58               ; 14aa 2a 0f 58
                LR   H,DC                ; 14ad 11
                LIS  $0                  ; 14ae 70
                XM                       ; 14af 8c
                BT   1,A14c8             ; 14b0 81 17
                SL   1                   ; 14b2 13
                SR   1                   ; 14b3 12
                LR   DC,H                ; 14b4 10
                ST                       ; 14b5 17
                PI   A192e               ; 14b6 28 19 2e
                BF   $1,A14c0            ; 14b9 91 06
                PI   A19ea               ; 14bb 28 19 ea
                BF   $0,A14cb            ; 14be 90 0c
A14c0:          DCI  $0f59               ; 14c0 2a 0f 59
                LIS  $0                  ; 14c3 70
                ST                       ; 14c4 17
                ST                       ; 14c5 17
                BF   $0,A14cb            ; 14c6 90 04
A14c8:          PI   A19c5               ; 14c8 28 19 c5
A14cb:          DCI  $0f56               ; 14cb 2a 0f 56
                PI   A1bab               ; 14ce 28 1b ab
                PI   A1a6f               ; 14d1 28 1a 6f
                DCI  $0f56               ; 14d4 2a 0f 56
                XDC                      ; 14d7 2c
                DCI  $0f4d               ; 14d8 2a 0f 4d
                LR   H,DC                ; 14db 11
                PI   A1bb5               ; 14dc 28 1b b5
                PI   A19ac               ; 14df 28 19 ac
                DCI  $0c2c               ; 14e2 2a 0c 2c
                LM                       ; 14e5 16
                DCI  A1f99               ; 14e6 2a 1f 99
                ADC                      ; 14e9 8e
                LM                       ; 14ea 16
                DCI  $0f53               ; 14eb 2a 0f 53
                ST                       ; 14ee 17
                LR   DC,H                ; 14ef 10
                PI   A1bb1               ; 14f0 28 1b b1
                PI   A1a12               ; 14f3 28 1a 12
                DCI  $0f53               ; 14f6 2a 0f 53
                LI   $50                 ; 14f9 20 50
                ST                       ; 14fb 17
                LIS  $0                  ; 14fc 70
                ST                       ; 14fd 17
                ST                       ; 14fe 17
                PI   A19c5               ; 14ff 28 19 c5
                DCI  $0f3c               ; 1502 2a 0f 3c
                PI   A1bdf               ; 1505 28 1b df
                XDC                      ; 1508 2c
                DCI  $0f5a               ; 1509 2a 0f 5a
                PI   A1bb6               ; 150c 28 1b b6
                PI   A1659               ; 150f 28 16 59
                DCI  $0f43               ; 1512 2a 0f 43
                PI   A1bd6               ; 1515 28 1b d6
                LR   A,$7                ; 1518 47
                ST                       ; 1519 17
                PI   A1bc4               ; 151a 28 1b c4
                BT   4,A1522             ; 151d 84 04
                JMP  A13a8               ; 151f 29 13 a8
A1522:          DCI  $0c2b               ; 1522 2a 0c 2b
                CM                       ; 1525 8d
                BF   $4,A152b            ; 1526 94 04
                JMP  A15b7               ; 1528 29 15 b7
A152b:          DCI  $0f51               ; 152b 2a 0f 51
                LIS  $0                  ; 152e 70
                ST                       ; 152f 17
                ST                       ; 1530 17
                DCI  $0c29               ; 1531 2a 0c 29
                LM                       ; 1534 16
                LR   $5,A                ; 1535 55
A1536:          PI   A19ac               ; 1536 28 19 ac
                DCI  $0c28               ; 1539 2a 0c 28
                LR   A,$5                ; 153c 45
                CM                       ; 153d 8d
                BT   4,A155d             ; 153e 84 1e
                DCI  $0f44               ; 1540 2a 0f 44
                ADC                      ; 1543 8e
                LM                       ; 1544 16
                DCI  $0f56               ; 1545 2a 0f 56
                ST                       ; 1548 17
                LIS  $0                  ; 1549 70
                ST                       ; 154a 17
                ST                       ; 154b 17
                DCI  $0f51               ; 154c 2a 0f 51
                PI   A1bbe               ; 154f 28 1b be
                LIS  $0                  ; 1552 70
                ST                       ; 1553 17
                PI   A19c5               ; 1554 28 19 c5
                DCI  $0f51               ; 1557 2a 0f 51
                PI   A1bab               ; 155a 28 1b ab
A155d:          DS   $5                  ; 155d 35
                BF   $4,A1536            ; 155e 94 d7
                PI   A19ac               ; 1560 28 19 ac
                DCI  $0f51               ; 1563 2a 0f 51
                PI   A1bbe               ; 1566 28 1b be
                DCI  $0c2b               ; 1569 2a 0c 2b
                LM                       ; 156c 16
                SL   4                   ; 156d 15
                DCI  $0f56               ; 156e 2a 0f 56
                ST                       ; 1571 17
                PI   A1a12               ; 1572 28 1a 12
                DCI  $0f56               ; 1575 2a 0f 56
                PI   A1bab               ; 1578 28 1b ab
                LIS  $0                  ; 157b 70
                ST                       ; 157c 17
                DCI  $0f3c               ; 157d 2a 0f 3c
                PI   A1bdf               ; 1580 28 1b df
                XDC                      ; 1583 2c
                DCI  $0f53               ; 1584 2a 0f 53
                LIS  $0                  ; 1587 70
                ST                       ; 1588 17
                PI   A1bb5               ; 1589 28 1b b5
                PI   A19ea               ; 158c 28 19 ea
                LR   A,$9                ; 158f 49
                LR   $4,A                ; 1590 54
                DCI  $0f53               ; 1591 2a 0f 53
                PI   A1bab               ; 1594 28 1b ab
                LIS  $0                  ; 1597 70
                ST                       ; 1598 17
                LI   $50                 ; 1599 20 50
                DCI  $0f56               ; 159b 2a 0f 56
                ST                       ; 159e 17
                LIS  $0                  ; 159f 70
                ST                       ; 15a0 17
                ST                       ; 15a1 17
                PI   A19c5               ; 15a2 28 19 c5
                LIS  $0                  ; 15a5 70
                XS   $4                  ; 15a6 e4
                BF   $4,A15ac            ; 15a7 94 04
                PI   A19ac               ; 15a9 28 19 ac
A15ac:          PI   A1659               ; 15ac 28 16 59
                PI   A1bc4               ; 15af 28 1b c4
                BT   4,A15b7             ; 15b2 84 04
                JMP  A152b               ; 15b4 29 15 2b
A15b7:          PI   A19ac               ; 15b7 28 19 ac
                DCI  $0c0a               ; 15ba 2a 0c 0a
                PI   A1bd6               ; 15bd 28 1b d6
                DCI  $0f53               ; 15c0 2a 0f 53
                ST                       ; 15c3 17
                DCI  $0c07               ; 15c4 2a 0c 07
                PI   A1bd6               ; 15c7 28 1b d6
                DCI  $0f56               ; 15ca 2a 0f 56
                ST                       ; 15cd 17
                PI   A1a12               ; 15ce 28 1a 12
                DCI  $0c11               ; 15d1 2a 0c 11
                PI   A1bdf               ; 15d4 28 1b df
                LR   H,DC                ; 15d7 11
                PI   A1bab               ; 15d8 28 1b ab
                PI   A19ac               ; 15db 28 19 ac
                LIS  $0                  ; 15de 70
                LR   $7,A                ; 15df 57
                LR   DC,H                ; 15e0 10
                PI   A1bbe               ; 15e1 28 1b be
                DCI  $0c0b               ; 15e4 2a 0c 0b
A15e7:          PI   A1bdf               ; 15e7 28 1b df
                PI   A1bb1               ; 15ea 28 1b b1
                PI   A192e               ; 15ed 28 19 2e
                BF   $1,A164b            ; 15f0 91 5a
                PI   A19ea               ; 15f2 28 19 ea
                DCI  $0f5a               ; 15f5 2a 0f 5a
                LR   H,DC                ; 15f8 11
                LR   A,$7                ; 15f9 47
                OM                       ; 15fa 8b
                LR   DC,H                ; 15fb 10
                ST                       ; 15fc 17
                DCI  $0c17               ; 15fd 2a 0c 17
                PI   A1bdf               ; 1600 28 1b df
                LR   H,DC                ; 1603 11
                PI   A1bab               ; 1604 28 1b ab
                DCI  $0c1d               ; 1607 2a 0c 1d
                PI   A1bdf               ; 160a 28 1b df
                PI   A1bbe               ; 160d 28 1b be
                LR   DC,H                ; 1610 10
                LM                       ; 1611 16
                XDC                      ; 1612 2c
                DCI  $0f56               ; 1613 2a 0f 56
                ST                       ; 1616 17
                XDC                      ; 1617 2c
                LR   H,DC                ; 1618 11
                LI   $7f                 ; 1619 20 7f
                NM                       ; 161b 8a
                XDC                      ; 161c 2c
                ST                       ; 161d 17
                LR   DC,H                ; 161e 10
                LIS  $0                  ; 161f 70
                XM                       ; 1620 8c
                BF   $1,A1628            ; 1621 91 06
                PI   A19c5               ; 1623 28 19 c5
                BF   $0,A162f            ; 1626 90 08
A1628:          PI   A19ea               ; 1628 28 19 ea
                LIS  $0                  ; 162b 70
                XS   $9                  ; 162c e9
                BT   4,A1640             ; 162d 84 12
A162f:          DCI  $0c1d               ; 162f 2a 0c 1d
                PI   A1bdf               ; 1632 28 1b df
                PI   A1bab               ; 1635 28 1b ab
A1638:          PI   A1bc4               ; 1638 28 1b c4
                BT   4,A1686             ; 163b 84 4a
                JMP  A15b7               ; 163d 29 15 b7
A1640:          DCI  $0c1d               ; 1640 2a 0c 1d
                PI   A1bdf               ; 1643 28 1b df
                LIS  $0                  ; 1646 70
                ST                       ; 1647 17
                ST                       ; 1648 17
                BF   $0,A1638            ; 1649 90 ee
A164b:          DCI  $0f56               ; 164b 2a 0f 56
                PI   A1bbe               ; 164e 28 1b be
                DCI  $0c11               ; 1651 2a 0c 11
                LI   $80                 ; 1654 20 80
                LR   $7,A                ; 1656 57
                BF   $0,A15e7            ; 1657 90 8f
A1659:          LR   K,P                 ; 1659 08
                DCI  $0c01               ; 165a 2a 0c 01
                PI   A1bd6               ; 165d 28 1b d6
                DCI  $0f52               ; 1660 2a 0f 52
                LR   H,DC                ; 1663 11
                CM                       ; 1664 8d
                ST                       ; 1665 17
                LIS  $0                  ; 1666 70
                ST                       ; 1667 17
                DCI  $0f59               ; 1668 2a 0f 59
                LR   Q,DC                ; 166b 0e
                LM                       ; 166c 16
                LIS  $0                  ; 166d 70
                OM                       ; 166e 8b
                OM                       ; 166f 8b
                BT   4,A167c             ; 1670 84 0b
                LR   DC,Q                ; 1672 0f
                PI   A1913               ; 1673 28 19 13
                LR   DC,H                ; 1676 10
                BF   $1,A167a            ; 1677 91 02
                LR   DC,Q                ; 1679 0f
A167a:          LM                       ; 167a 16
                LM                       ; 167b 16
A167c:          LR   $7,A                ; 167c 57
                DCI  $0c09               ; 167d 2a 0c 09
                PI   A1bd6               ; 1680 28 1b d6
                LR   A,$7                ; 1683 47
                ST                       ; 1684 17
                PK                       ; 1685 0c
A1686:          DCI  $0c2c               ; 1686 2a 0c 2c
                CM                       ; 1689 8d
                BT   4,A168f             ; 168a 84 04
                PI   A1a8f               ; 168c 28 1a 8f
A168f:          PI   A1ccf               ; 168f 28 1c cf
                PI   A1b68               ; 1692 28 1b 68
                DCI  $0fdf               ; 1695 2a 0f df
                LIS  $2                  ; 1698 72
                ST                       ; 1699 17
                DCI  $08f5               ; 169a 2a 08 f5
                ST                       ; 169d 17
                DCI  $0c29               ; 169e 2a 0c 29
                LM                       ; 16a1 16
                LR   $1,A                ; 16a2 51
                DCI  $0c02               ; 16a3 2a 0c 02
                LR   Q,DC                ; 16a6 0e
A16a7:          LIS  $4                  ; 16a7 74
                LR   $0,A                ; 16a8 50
A16a9:          LR   DC,Q                ; 16a9 0f
                LM                       ; 16aa 16
                SR   4                   ; 16ab 14
                BT   4,A16b2             ; 16ac 84 05
                LR   $8,A                ; 16ae 58
                PI   $4105               ; 16af 28 41 05
A16b2:          PI   $412d               ; 16b2 28 41 2d
                LR   DC,Q                ; 16b5 0f
                LIS  $f                  ; 16b6 7f
                LR   $2,A                ; 16b7 52
                NM                       ; 16b8 8a
                LR   $8,A                ; 16b9 58
                LIS  $2                  ; 16ba 72
                ADC                      ; 16bb 8e
                LR   Q,DC                ; 16bc 0e
                PI   $4105               ; 16bd 28 41 05
                DS   $0                  ; 16c0 30
                BT   4,A16c8             ; 16c1 84 06
                PI   A1859               ; 16c3 28 18 59
                BF   $0,A16a9            ; 16c6 90 e2
A16c8:          PI   $41c8               ; 16c8 28 41 c8
                DS   $1                  ; 16cb 31
                BT   4,A16df             ; 16cc 84 12
                DCI  $0fdf               ; 16ce 2a 0f df
                LR   H,DC                ; 16d1 11
                LIS  $4                  ; 16d2 74
                AM                       ; 16d3 88
                SL   4                   ; 16d4 15
                SR   4                   ; 16d5 14
                LR   DC,H                ; 16d6 10
                ST                       ; 16d7 17
                LR   DC,Q                ; 16d8 0f
                LI   $f5                 ; 16d9 20 f5
                ADC                      ; 16db 8e
                LR   Q,DC                ; 16dc 0e
                BF   $0,A16a7            ; 16dd 90 c9
A16df:          DCI  $0fdf               ; 16df 2a 0f df
                LI   $41                 ; 16e2 20 41
                ST                       ; 16e4 17
                DCI  $0c29               ; 16e5 2a 0c 29
                LM                       ; 16e8 16
                LR   $1,A                ; 16e9 51
                DCI  $0c14               ; 16ea 2a 0c 14
                LR   Q,DC                ; 16ed 0e
A16ee:          LIS  $3                  ; 16ee 73
                LR   $0,A                ; 16ef 50
A16f0:          PI   $41c8               ; 16f0 28 41 c8
                LR   DC,Q                ; 16f3 0f
                LM                       ; 16f4 16
                LM                       ; 16f5 16
                CI   $09                 ; 16f6 25 09
                BF   $2,A1733            ; 16f8 92 3a
A16fa:          LI   $12                 ; 16fa 20 12
                LR   $8,A                ; 16fc 58
                PI   $40d9               ; 16fd 28 40 d9
                PI   $412d               ; 1700 28 41 2d
                LR   DC,Q                ; 1703 0f
                LM                       ; 1704 16
                LR   Q,DC                ; 1705 0e
                LR   (IS),A              ; 1706 5c
                PI   $421e               ; 1707 28 42 1e
                PI   A1876               ; 170a 28 18 76
                LR   DC,Q                ; 170d 0f
                LIS  $f                  ; 170e 7f
                NM                       ; 170f 8a
                BT   4,A1716             ; 1710 84 05
                LR   $8,A                ; 1712 58
                PI   $4105               ; 1713 28 41 05
A1716:          LR   DC,Q                ; 1716 0f
A1717:          LIS  $5                  ; 1717 75
                ADC                      ; 1718 8e
                LR   Q,DC                ; 1719 0e
                LI   $11                 ; 171a 20 11
                LR   $2,A                ; 171c 52
                PI   A1859               ; 171d 28 18 59
                DS   $0                  ; 1720 30
                BF   $4,A16f0            ; 1721 94 ce
                DS   $1                  ; 1723 31
                BT   4,A1755             ; 1724 84 30
                LI   $d5                 ; 1726 20 d5
                LR   $2,A                ; 1728 52
                PI   A1859               ; 1729 28 18 59
                LR   DC,Q                ; 172c 0f
                LI   $f0                 ; 172d 20 f0
                ADC                      ; 172f 8e
                LR   Q,DC                ; 1730 0e
                BF   $0,A16ee            ; 1731 90 bc
A1733:          XI   $80                 ; 1733 23 80
                BT   4,A1747             ; 1735 84 11
                PI   A186f               ; 1737 28 18 6f
                LI   $3a                 ; 173a 20 3a
                LR   $8,A                ; 173c 58
                PI   $40d9               ; 173d 28 40 d9
                PI   A1872               ; 1740 28 18 72
                LR   DC,Q                ; 1743 0f
                LM                       ; 1744 16
                BF   $0,A1717            ; 1745 90 d1
A1747:          PI   $4122               ; 1747 28 41 22
                LI   $1c                 ; 174a 20 1c
                LR   $8,A                ; 174c 58
                PI   $40d9               ; 174d 28 40 d9
                PI   $412d               ; 1750 28 41 2d
                BF   $0,A16fa            ; 1753 90 a6
A1755:          DCI  A1d8b               ; 1755 2a 1d 8b
                PI   A1c6f               ; 1758 28 1c 6f
                LIS  $0                  ; 175b 70
                LR   $7,A                ; 175c 57
A175d:          SL   1                   ; 175d 13
                SL   1                   ; 175e 13
                AS   $7                  ; 175f c7
                AS   $7                  ; 1760 c7
                AS   $7                  ; 1761 c7
                DCI  A1f09               ; 1762 2a 1f 09
                ADC                      ; 1765 8e
                PI   A1b4f               ; 1766 28 1b 4f
                PI   A12c1               ; 1769 28 12 c1
                LIS  $0                  ; 176c 70
                DCI  $0c2c               ; 176d 2a 0c 2c
                ST                       ; 1770 17
                XS   $7                  ; 1771 e7
                BF   $4,A1779            ; 1772 94 06
                LIS  $6                  ; 1774 76
                LR   $6,A                ; 1775 56
                PI   A1be7               ; 1776 28 1b e7
A1779:          PI   A1a8f               ; 1779 28 1a 8f
                LR   A,$7                ; 177c 47
                CI   $03                 ; 177d 25 03
                BT   2,A17c0             ; 177f 82 40
A1781:          LI   $fc                 ; 1781 20 fc
                AS   $7                  ; 1783 c7
                DCI  $0c11               ; 1784 2a 0c 11
                SL   1                   ; 1787 13
                ADC                      ; 1788 8e
                SL   1                   ; 1789 13
                ADC                      ; 178a 8e
                PI   A1bdf               ; 178b 28 1b df
                LR   H,DC                ; 178e 11
                LM                       ; 178f 16
                LIS  $0                  ; 1790 70
                XM                       ; 1791 8c
                BF   $1,A1797            ; 1792 91 04
                SR   4                   ; 1794 14
                BF   $4,A179a            ; 1795 94 04
A1797:          SL   4                   ; 1797 15
                BT   4,A17bb             ; 1798 84 22
A179a:          PI   A186b               ; 179a 28 18 6b
                LR   DC,H                ; 179d 10
                PI   A1aed               ; 179e 28 1a ed
                LI   $67                 ; 17a1 20 67
                DCI  $0fdf               ; 17a3 2a 0f df
                ST                       ; 17a6 17
                LI   $14                 ; 17a7 20 14
                LR   $8,A                ; 17a9 58
                PI   $40d9               ; 17aa 28 40 d9
                PI   $412d               ; 17ad 28 41 2d
                DCI  $0c28               ; 17b0 2a 0c 28
                LM                       ; 17b3 16
                LR   $8,A                ; 17b4 58
                PI   $4105               ; 17b5 28 41 05
                PI   A1a8f               ; 17b8 28 1a 8f
A17bb:          PI   A1bc4               ; 17bb 28 1b c4
                BF   $4,A1781            ; 17be 94 c2
A17c0:          LR   A,$7                ; 17c0 47
A17c1:          INC                      ; 17c1 1f
                LR   $7,A                ; 17c2 57
                PI   A12ab               ; 17c3 28 12 ab
                BT   4,A17c1             ; 17c6 84 fa
                CI   $06                 ; 17c8 25 06
                BF   $4,A175d            ; 17ca 94 92
                DCI  $0c1f               ; 17cc 2a 0c 1f
                LR   H,DC                ; 17cf 11
                LIS  $2                  ; 17d0 72
                ADC                      ; 17d1 8e
                PI   A1913               ; 17d2 28 19 13
                BF   $1,A17ef            ; 17d5 91 19
                LR   DC,H                ; 17d7 10
                LIS  $4                  ; 17d8 74
                ADC                      ; 17d9 8e
                PI   A1913               ; 17da 28 19 13
                BT   1,A17fb             ; 17dd 81 1d
A17df:          LIS  $3                  ; 17df 73
A17e0:          DCI  $0c28               ; 17e0 2a 0c 28
                ST                       ; 17e3 17
                DCI  $0c1f               ; 17e4 2a 0c 1f
                SL   1                   ; 17e7 13
                ADC                      ; 17e8 8e
                LI   $10                 ; 17e9 20 10
                CM                       ; 17eb 8d
                LR   J,W                 ; 17ec 1e
                BF   $0,A17fe            ; 17ed 90 10
A17ef:          LR   DC,Q                ; 17ef 0f
                LR   H,DC                ; 17f0 11
                LIS  $2                  ; 17f1 72
                ADC                      ; 17f2 8e
                PI   A1913               ; 17f3 28 19 13
                BF   $1,A17df            ; 17f6 91 e8
                LIS  $2                  ; 17f8 72
                BF   $0,A17e0            ; 17f9 90 e6
A17fb:          LIS  $1                  ; 17fb 71
                BF   $0,A17e0            ; 17fc 90 e3
A17fe:          PI   A1b77               ; 17fe 28 1b 77
                DCI  A1f33               ; 1801 2a 1f 33
                PI   A1b86               ; 1804 28 1b 86
                LR   W,J                 ; 1807 1d
                BF   $2,A1810            ; 1808 92 07
                DCI  A1f47               ; 180a 2a 1f 47
                PI   A1b86               ; 180d 28 1b 86
A1810:          DCI  $0c28               ; 1810 2a 0c 28
                LR   H,DC                ; 1813 11
                LM                       ; 1814 16
                LR   $8,A                ; 1815 58
                LR   DC,H                ; 1816 10
                LIS  $1                  ; 1817 71
                LR   $6,A                ; 1818 56
                ST                       ; 1819 17
                LI   $17                 ; 181a 20 17
                DCI  $0fdf               ; 181c 2a 0f df
                ST                       ; 181f 17
                PI   $4105               ; 1820 28 41 05
A1823:          DCI  $0c28               ; 1823 2a 0c 28
                LM                       ; 1826 16
                LR   $8,A                ; 1827 58
                SL   4                   ; 1828 15
                LR   $0,A                ; 1829 50
                AI   $33                 ; 182a 24 33
                DCI  $0fdf               ; 182c 2a 0f df
                ST                       ; 182f 17
                PI   $4105               ; 1830 28 41 05
                LI   $39                 ; 1833 20 39
                AS   $0                  ; 1835 c0
                DCI  $0fdf               ; 1836 2a 0f df
                ST                       ; 1839 17
                DCI  $0c1d               ; 183a 2a 0c 1d
                PI   A1bdf               ; 183d 28 1b df
                PI   A1aed               ; 1840 28 1a ed
                PI   A1bc4               ; 1843 28 1b c4
                BF   $4,A1823            ; 1846 94 dc
                LR   W,J                 ; 1848 1d
                BF   $2,A1853            ; 1849 92 09
                PI   A1be7               ; 184b 28 1b e7
A184e:          PI   $41c8               ; 184e 28 41 c8
                BF   $0,A184e            ; 1851 90 fc
A1853:          PI   A1a8f               ; 1853 28 1a 8f
                JMP  A108c               ; 1856 29 10 8c
A1859:          LR   A,$2                ; 1859 42
A185a:          DCI  $0fdf               ; 185a 2a 0f df
                AM                       ; 185d 88
A185e:          DCI  $0fdf               ; 185e 2a 0f df
                ST                       ; 1861 17
                POP                      ; 1862 1c
A1863:          LI   $2f                 ; 1863 20 2f
                BF   $0,A185e            ; 1865 90 f8
A1867:          LI   $3f                 ; 1867 20 3f
                BF   $0,A185e            ; 1869 90 f4
A186b:          LI   $6d                 ; 186b 20 6d
                BF   $0,A185e            ; 186d 90 f0
A186f:          LIS  $2                  ; 186f 72
                BF   $0,A185a            ; 1870 90 e9
A1872:          LI   $fd                 ; 1872 20 fd
                BF   $0,A185a            ; 1874 90 e5
A1876:          LI   $fc                 ; 1876 20 fc
                BF   $0,A185a            ; 1878 90 e1
A187a:          LR   H,DC                ; 187a 11
                LI   $67                 ; 187b 20 67
                AMD                      ; 187d 89
                LR   DC,H                ; 187e 10
                ST                       ; 187f 17
                POP                      ; 1880 1c
                DCI  $1e1c               ; 1881 2a 1e 1c
                PI   A1c6f               ; 1884 28 1c 6f
                BF   $0,A1892            ; 1887 90 0a
                PI   A1b77               ; 1889 28 1b 77
                DCI  A1f85               ; 188c 2a 1f 85
                PI   A1b86               ; 188f 28 1b 86
A1892:          LIS  $1                  ; 1892 71
                BF   $0,A18a5            ; 1893 90 11
                PI   A1945               ; 1895 28 19 45
                PI   A193b               ; 1898 28 19 3b
                PI   A1977               ; 189b 28 19 77
                DCI  $0850               ; 189e 2a 08 50
                LI   $c8                 ; 18a1 20 c8
                ST                       ; 18a3 17
                LIS  $4                  ; 18a4 74
A18a5:          DCI  $08f5               ; 18a5 2a 08 f5
                ST                       ; 18a8 17
                DCI  $0c2c               ; 18a9 2a 0c 2c
                LM                       ; 18ac 16
                LR   $6,A                ; 18ad 56
                ST                       ; 18ae 17
                PI   A1be7               ; 18af 28 1b e7
A18b2:          JMP  A139f               ; 18b2 29 13 9f
                PI   A1938               ; 18b5 28 19 38
                LIS  $f                  ; 18b8 7f
                LR   (IS),A              ; 18b9 5c
                DCI  $0c84               ; 18ba 2a 0c 84
A18bd:          LR   H,DC                ; 18bd 11
                LIS  $1                  ; 18be 71
                OM                       ; 18bf 8b
                LR   DC,H                ; 18c0 10
                ST                       ; 18c1 17
                LIS  $3                  ; 18c2 73
                ADC                      ; 18c3 8e
                DS   (IS)                ; 18c4 3c
                BF   $4,A18bd            ; 18c5 94 f7
                LR   (IS),A              ; 18c7 5c
                DCI  $0c77               ; 18c8 2a 0c 77
                XDC                      ; 18cb 2c
                DCI  A1e45               ; 18cc 2a 1e 45
                PI   A1908               ; 18cf 28 19 08
                PI   A1977               ; 18d2 28 19 77
                LIS  $4                  ; 18d5 74
                LR   (IS),A              ; 18d6 5c
                DCI  $0cbf               ; 18d7 2a 0c bf
                XDC                      ; 18da 2c
                DCI  A1e4b               ; 18db 2a 1e 4b
                PI   A1908               ; 18de 28 19 08
                DCI  $0c2c               ; 18e1 2a 0c 2c
                LIS  $2                  ; 18e4 72
                CM                       ; 18e5 8d
                LR   $4,A                ; 18e6 54
                LIS  $0                  ; 18e7 70
                BT   4,A18a5             ; 18e8 84 bc
                DCI  $08f5               ; 18ea 2a 08 f5
                ST                       ; 18ed 17
A18ee:          LIS  $5                  ; 18ee 75
                LR   $6,A                ; 18ef 56
                PI   A1be7               ; 18f0 28 1b e7
                LIS  $3                  ; 18f3 73
                LR   $7,A                ; 18f4 57
A18f5:          LI   $13                 ; 18f5 20 13
                LR   $2,A                ; 18f7 52
                PI   A1cc2               ; 18f8 28 1c c2
                LIS  $0                  ; 18fb 70
                LR   $2,A                ; 18fc 52
                PI   A1cc2               ; 18fd 28 1c c2
                DS   $7                  ; 1900 37
                BF   $4,A18f5            ; 1901 94 f3
                DS   $4                  ; 1903 34
                BF   $4,A18ee            ; 1904 94 e9
                BF   $0,A18b2            ; 1906 90 ab
A1908:          LR   K,P                 ; 1908 08
A1909:          PI   A1bb6               ; 1909 28 1b b6
                LIS  $2                  ; 190c 72
                ADC                      ; 190d 8e
                XDC                      ; 190e 2c
                DS   (IS)                ; 190f 3c
                BF   $4,A1909            ; 1910 94 f8
                PK                       ; 1912 0c
A1913:          LIS  $2                  ; 1913 72
A1914:          LR   $0,A                ; 1914 50
                LR   Q,DC                ; 1915 0e
A1916:          LR   DC,Q                ; 1916 0f
                LR   A,$0                ; 1917 40
                ADC                      ; 1918 8e
                XDC                      ; 1919 2c
                LR   DC,H                ; 191a 10
                ADC                      ; 191b 8e
                LM                       ; 191c 16
                XDC                      ; 191d 2c
                CM                       ; 191e 8d
                BF   $2,A1926            ; 191f 92 06
                BF   $4,A1928            ; 1921 94 06
                DS   $0                  ; 1923 30
                BF   $4,A1916            ; 1924 94 f1
A1926:          BF   $0,A192b            ; 1926 90 04
A1928:          LI   $ff                 ; 1928 20 ff
                LR   $0,A                ; 192a 50
A192b:          LIS  $0                  ; 192b 70
                XS   $0                  ; 192c e0
A192d:          POP                      ; 192d 1c
A192e:          DCI  $0f52               ; 192e 2a 0f 52
                LR   H,DC                ; 1931 11
                DCI  $0f55               ; 1932 2a 0f 55
                LIS  $3                  ; 1935 73
                BF   $0,A1914            ; 1936 90 dd
A1938:          LIS  $a                  ; 1938 7a
                BF   $0,A1946            ; 1939 90 0c
A193b:          LI   $f8                 ; 193b 20 f8
                LR   $1,A                ; 193d 51
                LIS  $b                  ; 193e 7b
                LR   $0,A                ; 193f 50
                DCI  $0cd3               ; 1940 2a 0c d3
                BF   $0,A194c            ; 1943 90 08
A1945:          LIS  $b                  ; 1945 7b
A1946:          LR   $0,A                ; 1946 50
                LIS  $0                  ; 1947 70
                LR   $1,A                ; 1948 51
                DCI  $0c2f               ; 1949 2a 0c 2f
A194c:          XDC                      ; 194c 2c
                LIS  $0                  ; 194d 70
                LR   $3,A                ; 194e 53
                LR   $4,A                ; 194f 54
                DCI  A1e3a               ; 1950 2a 1e 3a
                XDC                      ; 1953 2c
A1954:          DS   $0                  ; 1954 30
                BF   $1,A192d            ; 1955 91 d7
                XDC                      ; 1957 2c
                LM                       ; 1958 16
                LR   $2,A                ; 1959 52
                XDC                      ; 195a 2c
                LIS  $0                  ; 195b 70
                XS   $4                  ; 195c e4
                BF   $1,A1964            ; 195d 91 06
                SL   1                   ; 195f 13
                INC                      ; 1960 1f
                LR   $4,A                ; 1961 54
                BF   $0,A1968            ; 1962 90 05
A1964:          LR   A,$3                ; 1964 43
                SL   1                   ; 1965 13
                INC                      ; 1966 1f
                LR   $3,A                ; 1967 53
A1968:          DS   $2                  ; 1968 32
                BT   1,A196d             ; 1969 81 03
                BF   $0,A1954            ; 196b 90 e8
A196d:          LR   A,$3                ; 196d 43
                ST                       ; 196e 17
                LR   A,$4                ; 196f 44
                ST                       ; 1970 17
                LIS  $2                  ; 1971 72
                ADC                      ; 1972 8e
                LR   A,$1                ; 1973 41
                ADC                      ; 1974 8e
                BF   $0,A1968            ; 1975 90 f2
A1977:          LR   K,P                 ; 1977 08
                PI   $40a9               ; 1978 28 40 a9
                DCI  $0c32               ; 197b 2a 0c 32
                XDC                      ; 197e 2c
                DCI  $0c2f               ; 197f 2a 0c 2f
                PI   A1998               ; 1982 28 19 98
                DCI  $0c31               ; 1985 2a 0c 31
                XDC                      ; 1988 2c
                DCI  $0c30               ; 1989 2a 0c 30
                PI   A1998               ; 198c 28 19 98
                DCI  A1e32               ; 198f 2a 1e 32
                PI   A1c6f               ; 1992 28 1c 6f
A1995:          JMP  A1a57               ; 1995 29 1a 57
A1998:          LR   K,P                 ; 1998 08
                PI   $40a9               ; 1999 28 40 a9
                LISU 2                   ; 199c 62
                LISL 0                   ; 199d 68
                LIS  $3                  ; 199e 73
                LR   (IS)+,A             ; 199f 5d
                LR   (IS)+,A             ; 19a0 5d
                LI   $2a                 ; 19a1 20 2a
                LR   (IS),A              ; 19a3 5c
                PI   $4686               ; 19a4 28 46 86
                PI   $41c8               ; 19a7 28 41 c8
                BF   $0,A1995            ; 19aa 90 ea
A19ac:          DCI  $0f53               ; 19ac 2a 0f 53
                LIS  $f                  ; 19af 7f
                LR   $0,A                ; 19b0 50
A19b1:          LIS  $0                  ; 19b1 70
A19b2:          ST                       ; 19b2 17
                DS   $0                  ; 19b3 30
                BF   $4,A19b2            ; 19b4 94 fd
                POP                      ; 19b6 1c
A19b7:          DCI  $0f59               ; 19b7 2a 0f 59
                LR   Q,DC                ; 19ba 0e
                DCI  $0f53               ; 19bb 2a 0f 53
                XDC                      ; 19be 2c
                DCI  $0f56               ; 19bf 2a 0f 56
                LIS  $3                  ; 19c2 73
                LR   $0,A                ; 19c3 50
                POP                      ; 19c4 1c
A19c5:          LR   K,P                 ; 19c5 08
                PI   $40a9               ; 19c6 28 40 a9
                PI   A19b7               ; 19c9 28 19 b7
                LIS  $1                  ; 19cc 71
                LR   $7,A                ; 19cd 57
                COM                      ; 19ce 18
                LR   J,W                 ; 19cf 1e
A19d0:          LM                       ; 19d0 16
                AI   $66                 ; 19d1 24 66
                LR   W,J                 ; 19d3 1d
                BF   $2,A19da            ; 19d4 92 05
                ASD  $7                  ; 19d6 d7
                LR   J,W                 ; 19d7 1e
                AI   $66                 ; 19d8 24 66
A19da:          XDC                      ; 19da 2c
                AMD                      ; 19db 89
                XDC                      ; 19dc 2c
                LR   H,DC                ; 19dd 11
                LR   DC,Q                ; 19de 0f
                ST                       ; 19df 17
                LR   Q,DC                ; 19e0 0e
                LR   DC,H                ; 19e1 10
                BF   $2,A19e5            ; 19e2 92 02
                LR   J,W                 ; 19e4 1e
A19e5:          DS   $0                  ; 19e5 30
                BF   $4,A19d0            ; 19e6 94 e9
                BF   $0,A1a0d            ; 19e8 90 24
A19ea:          LR   K,P                 ; 19ea 08
                PI   $40a9               ; 19eb 28 40 a9
                PI   A19b7               ; 19ee 28 19 b7
                LI   $66                 ; 19f1 20 66
                LR   $2,A                ; 19f3 52
                LIS  $1                  ; 19f4 71
A19f5:          LR   $8,A                ; 19f5 58
                LM                       ; 19f6 16
                COM                      ; 19f7 18
                XDC                      ; 19f8 2c
                AMD                      ; 19f9 89
                LR   J,W                 ; 19fa 1e
                AS   $8                  ; 19fb c8
                ASD  $2                  ; 19fc d2
                BF   $2,A1a00            ; 19fd 92 02
                LR   J,W                 ; 19ff 1e
A1a00:          XDC                      ; 1a00 2c
                LR   H,DC                ; 1a01 11
                LR   DC,Q                ; 1a02 0f
                ST                       ; 1a03 17
                LR   Q,DC                ; 1a04 0e
                LR   DC,H                ; 1a05 10
                LIS  $2                  ; 1a06 72
                NS   $9                  ; 1a07 f9
                SR   1                   ; 1a08 12
                LR   $9,A                ; 1a09 59
                DS   $0                  ; 1a0a 30
                BF   $4,A19f5            ; 1a0b 94 e9
A1a0d:          PI   $41c8               ; 1a0d 28 41 c8
                BF   $0,A1a57            ; 1a10 90 46
A1a12:          LR   K,P                 ; 1a12 08
                PI   $40a9               ; 1a13 28 40 a9
                LIS  $2                  ; 1a16 72
                LR   $1,A                ; 1a17 51
                DCI  $0f5c               ; 1a18 2a 0f 5c
                XDC                      ; 1a1b 2c
                DCI  $0f56               ; 1a1c 2a 0f 56
A1a1f:          LM                       ; 1a1f 16
                LR   $2,A                ; 1a20 52
                NI   $0f                 ; 1a21 21 0f
                XDC                      ; 1a23 2c
                ST                       ; 1a24 17
                LR   A,$2                ; 1a25 42
                SR   4                   ; 1a26 14
                ST                       ; 1a27 17
                XDC                      ; 1a28 2c
                DS   $1                  ; 1a29 31
                BF   $4,A1a1f            ; 1a2a 94 f4
                LIS  $4                  ; 1a2c 74
                LR   $1,A                ; 1a2d 51
                LIS  $0                  ; 1a2e 70
                LR   $2,A                ; 1a2f 52
A1a30:          DCI  $0f5c               ; 1a30 2a 0f 5c
                DS   $2                  ; 1a33 32
                LR   A,$2                ; 1a34 42
                COM                      ; 1a35 18
                ADC                      ; 1a36 8e
                LM                       ; 1a37 16
                LR   $3,A                ; 1a38 53
A1a39:          DCI  $0f59               ; 1a39 2a 0f 59
                XDC                      ; 1a3c 2c
                DCI  $0f56               ; 1a3d 2a 0f 56
                LIS  $3                  ; 1a40 73
                LR   (IS),A              ; 1a41 5c
                PI   $43cd               ; 1a42 28 43 cd
                DS   $3                  ; 1a45 33
                BF   $1,A1a4d            ; 1a46 91 06
                PI   A19c5               ; 1a48 28 19 c5
                BF   $0,A1a39            ; 1a4b 90 ed
A1a4d:          DCI  $0f53               ; 1a4d 2a 0f 53
                LR   H,DC                ; 1a50 11
                PI   A1a5b               ; 1a51 28 1a 5b
                DS   $1                  ; 1a54 31
                BF   $4,A1a30            ; 1a55 94 da
A1a57:          PI   $40bc               ; 1a57 28 40 bc
                PK                       ; 1a5a 0c
A1a5b:          LIS  $3                  ; 1a5b 73
                LR   $3,A                ; 1a5c 53
                LIS  $0                  ; 1a5d 70
                LR   $4,A                ; 1a5e 54
                LR   DC,H                ; 1a5f 10
                XDC                      ; 1a60 2c
                LR   DC,H                ; 1a61 10
A1a62:          LM                       ; 1a62 16
                LR   $5,A                ; 1a63 55
                SL   4                   ; 1a64 15
                XS   $4                  ; 1a65 e4
                XDC                      ; 1a66 2c
                ST                       ; 1a67 17
                LR   A,$5                ; 1a68 45
                SR   4                   ; 1a69 14
                LR   $4,A                ; 1a6a 54
                DS   $3                  ; 1a6b 33
                BF   $4,A1a62            ; 1a6c 94 f5
                POP                      ; 1a6e 1c
A1a6f:          LR   K,P                 ; 1a6f 08
                LIS  $3                  ; 1a70 73
                LR   $3,A                ; 1a71 53
                DCI  $0f58               ; 1a72 2a 0f 58
                XDC                      ; 1a75 2c
                DCI  $0f58               ; 1a76 2a 0f 58
                LI   $fe                 ; 1a79 20 fe
                LR   $6,A                ; 1a7b 56
                LIS  $0                  ; 1a7c 70
                LR   $4,A                ; 1a7d 54
A1a7e:          LM                       ; 1a7e 16
                LR   $5,A                ; 1a7f 55
                SR   4                   ; 1a80 14
                XS   $4                  ; 1a81 e4
                XDC                      ; 1a82 2c
                ST                       ; 1a83 17
                LR   A,$5                ; 1a84 45
                SL   4                   ; 1a85 15
                LR   $4,A                ; 1a86 54
                LR   A,$6                ; 1a87 46
                ADC                      ; 1a88 8e
                XDC                      ; 1a89 2c
                ADC                      ; 1a8a 8e
                DS   $3                  ; 1a8b 33
                BF   $4,A1a7e            ; 1a8c 94 f1
                PK                       ; 1a8e 0c
A1a8f:          LR   K,P                 ; 1a8f 08
                PI   $40a9               ; 1a90 28 40 a9
A1a93:          PI   A1a9c               ; 1a93 28 1a 9c
                LR   A,$3                ; 1a96 43
                INC                      ; 1a97 1f
                BF   $4,A1a93            ; 1a98 94 fa
A1a9a:          BF   $0,A1a57            ; 1a9a 90 bc
A1a9c:          LR   K,P                 ; 1a9c 08
                PI   $40a9               ; 1a9d 28 40 a9
                LIS  $0                  ; 1aa0 70
                LR   $0,A                ; 1aa1 50
                LIS  $9                  ; 1aa2 79
                LR   $1,A                ; 1aa3 51
                BF   $0,A1aab            ; 1aa4 90 06
A1aa6:          LR   K,P                 ; 1aa6 08
                PI   $40a9               ; 1aa7 28 40 a9
                LR   A,$1                ; 1aaa 41
A1aab:          LR   $2,A                ; 1aab 52
                BF   $0,A1adf            ; 1aac 90 32
A1aae:          DS   (IS)                ; 1aae 3c
A1aaf:          LISU 2                   ; 1aaf 62
                LISL 4                   ; 1ab0 6c
                DCI  $0c00               ; 1ab1 2a 0c 00
                LM                       ; 1ab4 16
                LR   (IS),A              ; 1ab5 5c
                DCI  $0fe2               ; 1ab6 2a 0f e2
                LIS  $0                  ; 1ab9 70
                ST                       ; 1aba 17
                PI   $43d6               ; 1abb 28 43 d6
                LISU 4                   ; 1abe 64
                BF   $1,A1aae            ; 1abf 91 ee
                BT   4,A1aae             ; 1ac1 84 ec
                LIS  $0                  ; 1ac3 70
                DCI  $0c00               ; 1ac4 2a 0c 00
                CM                       ; 1ac7 8d
                BT   4,A1ad1             ; 1ac8 84 08
                DCI  $0fdb               ; 1aca 2a 0f db
                AS   (IS)                ; 1acd cc
                ST                       ; 1ace 17
                AS   (IS)+               ; 1acf cd
                ST                       ; 1ad0 17
A1ad1:          DCI  A1e53               ; 1ad1 2a 1e 53
                LR   A,$0                ; 1ad4 40
                ADC                      ; 1ad5 8e
                LR   A,$8                ; 1ad6 48
                INC                      ; 1ad7 1f
A1ad8:          CM                       ; 1ad8 8d
                BT   4,A1ae6             ; 1ad9 84 0c
                DS   $3                  ; 1adb 33
                DS   $1                  ; 1adc 31
                BT   6,A1ad8             ; 1add 86 fa
A1adf:          LR   A,$2                ; 1adf 42
                LR   $3,A                ; 1ae0 53
                INC                      ; 1ae1 1f
                INC                      ; 1ae2 1f
                LR   $1,A                ; 1ae3 51
                BF   $0,A1aaf            ; 1ae4 90 ca
A1ae6:          LIS  $0                  ; 1ae6 70
                LR   $6,A                ; 1ae7 56
                PI   A1be7               ; 1ae8 28 1b e7
A1aeb:          BF   $0,A1a9a            ; 1aeb 90 ae
A1aed:          LR   K,P                 ; 1aed 08
                PI   $40a9               ; 1aee 28 40 a9
                LM                       ; 1af1 16
                LR   H,DC                ; 1af2 11
                LR   (IS),A              ; 1af3 5c
                PI   $421e               ; 1af4 28 42 1e
                LIS  $0                  ; 1af7 70
                LR   DC,H                ; 1af8 10
                XM                       ; 1af9 8c
                BT   1,A1b04             ; 1afa 81 09
                BT   4,A1b21             ; 1afc 84 24
                LI   $1c                 ; 1afe 20 1c
                LR   $8,A                ; 1b00 58
                PI   $40d9               ; 1b01 28 40 d9
A1b04:          PI   A1872               ; 1b04 28 18 72
                LI   $12                 ; 1b07 20 12
                LR   $8,A                ; 1b09 58
                PI   $40d9               ; 1b0a 28 40 d9
                PI   $4122               ; 1b0d 28 41 22
                LR   DC,H                ; 1b10 10
                LI   $7f                 ; 1b11 20 7f
                NM                       ; 1b13 8a
                BT   4,A1b21             ; 1b14 84 0c
                CI   $09                 ; 1b16 25 09
                BF   $2,A1b29            ; 1b18 92 10
                LR   $8,A                ; 1b1a 58
                PI   $4105               ; 1b1b 28 41 05
                PI   $4122               ; 1b1e 28 41 22
A1b21:          LI   $28                 ; 1b21 20 28
                LR   $8,A                ; 1b23 58
                PI   $40d9               ; 1b24 28 40 d9
A1b27:          BF   $0,A1aeb            ; 1b27 90 c3
A1b29:          LR   (IS),A              ; 1b29 5c
                PI   $4122               ; 1b2a 28 41 22
                PI   $421e               ; 1b2d 28 42 1e
                PI   A1872               ; 1b30 28 18 72
                BF   $0,A1b21            ; 1b33 90 ed
                LR   K,P                 ; 1b35 08
                PI   $40a9               ; 1b36 28 40 a9
A1b39:          PI   $41c8               ; 1b39 28 41 c8
                LISU 2                   ; 1b3c 62
                LISL 4                   ; 1b3d 6c
                LI   $70                 ; 1b3e 20 70
                LR   (IS),A              ; 1b40 5c
                LIS  $0                  ; 1b41 70
A1b42:          DCI  $0fdf               ; 1b42 2a 0f df
                ST                       ; 1b45 17
                DCI  $0f3f               ; 1b46 2a 0f 3f
                ADC                      ; 1b49 8e
                PI   $4205               ; 1b4a 28 42 05
                BF   $0,A1b27            ; 1b4d 90 d9
A1b4f:          LR   K,P                 ; 1b4f 08
                PI   $40a9               ; 1b50 28 40 a9
                LM                       ; 1b53 16
                LR   (IS),A              ; 1b54 5c
                XDC                      ; 1b55 2c
                DCI  $0f9f               ; 1b56 2a 0f 9f
                PI   A1b97               ; 1b59 28 1b 97
                PI   $41c8               ; 1b5c 28 41 c8
                LISU 2                   ; 1b5f 62
                LISL 4                   ; 1b60 6c
                LI   $10                 ; 1b61 20 10
                LR   (IS),A              ; 1b63 5c
                LI   $60                 ; 1b64 20 60
                BF   $0,A1b42            ; 1b66 90 db
A1b68:          LR   K,P                 ; 1b68 08
                PI   $40a9               ; 1b69 28 40 a9
A1b6c:          DCI  $0f3f               ; 1b6c 2a 0f 3f
                LI   $70                 ; 1b6f 20 70
                LR   $0,A                ; 1b71 50
                PI   A19b1               ; 1b72 28 19 b1
                BF   $0,A1b39            ; 1b75 90 c3
A1b77:          LR   K,P                 ; 1b77 08
                PI   $40a9               ; 1b78 28 40 a9
                PI   $45db               ; 1b7b 28 45 db
                DCI  $0878               ; 1b7e 2a 08 78
                LI   $88                 ; 1b81 20 88
                ST                       ; 1b83 17
                BF   $0,A1b6c            ; 1b84 90 e7
A1b86:          LR   K,P                 ; 1b86 08
                PI   $40a9               ; 1b87 28 40 a9
                LM                       ; 1b8a 16
                LR   (IS),A              ; 1b8b 5c
                LM                       ; 1b8c 16
                XDC                      ; 1b8d 2c
                DCI  $0f3f               ; 1b8e 2a 0f 3f
                ADC                      ; 1b91 8e
                PI   A1b97               ; 1b92 28 1b 97
                BF   $0,A1b39            ; 1b95 90 a3
A1b97:          XDC                      ; 1b97 2c
                LIS  $0                  ; 1b98 70
                XM                       ; 1b99 8c
                XDC                      ; 1b9a 2c
                BF   $1,A1ba2            ; 1b9b 91 06
                ST                       ; 1b9d 17
A1b9e:          DS   (IS)                ; 1b9e 3c
                BF   $4,A1b97            ; 1b9f 94 f7
                POP                      ; 1ba1 1c
A1ba2:          COM                      ; 1ba2 18
                LR   $0,A                ; 1ba3 50
                LIS  $0                  ; 1ba4 70
A1ba5:          ST                       ; 1ba5 17
                DS   $0                  ; 1ba6 30
                BF   $4,A1ba5            ; 1ba7 94 fd
                BF   $0,A1b9e            ; 1ba9 90 f4
A1bab:          XDC                      ; 1bab 2c
                DCI  $0f59               ; 1bac 2a 0f 59
                BF   $0,A1bb6            ; 1baf 90 06
A1bb1:          XDC                      ; 1bb1 2c
                DCI  $0f56               ; 1bb2 2a 0f 56
A1bb5:          XDC                      ; 1bb5 2c
A1bb6:          LM                       ; 1bb6 16
                XDC                      ; 1bb7 2c
                ST                       ; 1bb8 17
                XDC                      ; 1bb9 2c
                LM                       ; 1bba 16
                XDC                      ; 1bbb 2c
                ST                       ; 1bbc 17
                POP                      ; 1bbd 1c
A1bbe:          XDC                      ; 1bbe 2c
                DCI  $0f53               ; 1bbf 2a 0f 53
                BF   $0,A1bb5            ; 1bc2 90 f2
A1bc4:          LR   K,P                 ; 1bc4 08
                DCI  $0c28               ; 1bc5 2a 0c 28
                LR   H,DC                ; 1bc8 11
                LM                       ; 1bc9 16
                CM                       ; 1bca 8d
                LR   DC,H                ; 1bcb 10
                BT   4,A1bd2             ; 1bcc 84 05
                PI   A187a               ; 1bce 28 18 7a
                PK                       ; 1bd1 0c
A1bd2:          LIS  $1                  ; 1bd2 71
                ST                       ; 1bd3 17
                LIS  $0                  ; 1bd4 70
                PK                       ; 1bd5 0c
A1bd6:          XDC                      ; 1bd6 2c
                DCI  $0c28               ; 1bd7 2a 0c 28
                LM                       ; 1bda 16
A1bdb:          XDC                      ; 1bdb 2c
                ADC                      ; 1bdc 8e
                LM                       ; 1bdd 16
                POP                      ; 1bde 1c
A1bdf:          XDC                      ; 1bdf 2c
                DCI  $0c28               ; 1be0 2a 0c 28
                LM                       ; 1be3 16
                SL   1                   ; 1be4 13
                BF   $0,A1bdb            ; 1be5 90 f5
A1be7:          LR   K,P                 ; 1be7 08
                PI   $40a9               ; 1be8 28 40 a9
                DCI  A1fa8               ; 1beb 2a 1f a8
                LR   A,$6                ; 1bee 46
                SL   1                   ; 1bef 13
                ADC                      ; 1bf0 8e
                LM                       ; 1bf1 16
                LR   $6,A                ; 1bf2 56
                LIS  $0                  ; 1bf3 70
                XM                       ; 1bf4 8c
                BT   4,A1bfa             ; 1bf5 84 04
                LR   $5,A                ; 1bf7 55
                BF   $0,A1bff            ; 1bf8 90 06
A1bfa:          DCI  A1fb6               ; 1bfa 2a 1f b6
                BF   $0,A1c07            ; 1bfd 90 09
A1bff:          DCI  A1fb6               ; 1bff 2a 1f b6
                LR   A,$5                ; 1c02 45
                ADC                      ; 1c03 8e
                ADC                      ; 1c04 8e
                INC                      ; 1c05 1f
                LR   $5,A                ; 1c06 55
A1c07:          LISU 4                   ; 1c07 64
                LISL 4                   ; 1c08 6c
                LIS  $0                  ; 1c09 70
                XM                       ; 1c0a 8c
                LR   J,W                 ; 1c0b 1e
                SL   1                   ; 1c0c 13
                SR   1                   ; 1c0d 12
                LR   (IS)-,A             ; 1c0e 5e
                LR   W,J                 ; 1c0f 1d
                BF   $1,A1c15            ; 1c10 91 04
                LIS  $3                  ; 1c12 73
                BF   $0,A1c16            ; 1c13 90 02
A1c15:          LIS  $b                  ; 1c15 7b
A1c16:          LR   (IS)+,A             ; 1c16 5d
                LISU 2                   ; 1c17 62
                LISL 4                   ; 1c18 6c
                LM                       ; 1c19 16
                LR   (IS),A              ; 1c1a 5c
                LIS  $0                  ; 1c1b 70
                LR   $1,A                ; 1c1c 51
                OUTS 0                   ; 1c1d b0
                OUTS 1                   ; 1c1e b1
                DCI  $0fdd               ; 1c1f 2a 0f dd
                ST                       ; 1c22 17
                ST                       ; 1c23 17
                PI   $46d6               ; 1c24 28 46 d6
A1c27:          PI   $41c8               ; 1c27 28 41 c8
                DCI  $0c2c               ; 1c2a 2a 0c 2c
                LM                       ; 1c2d 16
                LR   $2,A                ; 1c2e 52
                CM                       ; 1c2f 8d
                BF   $4,A1c4f            ; 1c30 94 1e
                CI   $01                 ; 1c32 25 01
                BT   4,A1c40             ; 1c34 84 0b
                CI   $03                 ; 1c36 25 03
                BF   $4,A1c4f            ; 1c38 94 16
                DCI  $0840               ; 1c3a 2a 08 40
                LIS  $1                  ; 1c3d 71
                BF   $0,A1c46            ; 1c3e 90 07
A1c40:          DCI  $0850               ; 1c40 2a 08 50
                LI   $ff                 ; 1c43 20 ff
                XS   $1                  ; 1c45 e1
A1c46:          LR   $1,A                ; 1c46 51
A1c47:          LR   H,DC                ; 1c47 11
                LM                       ; 1c48 16
                AS   $1                  ; 1c49 c1
                LR   DC,H                ; 1c4a 10
                ST                       ; 1c4b 17
                DS   $2                  ; 1c4c 32
                BF   $4,A1c47            ; 1c4d 94 f9
A1c4f:          LISU 2                   ; 1c4f 62
                LISL 4                   ; 1c50 6c
                DS   (IS)                ; 1c51 3c
                BF   $4,A1c27            ; 1c52 94 d4
                DS   $6                  ; 1c54 36
                BF   $4,A1bff            ; 1c55 94 a9
                DI                       ; 1c57 1a
                LR   J,W                 ; 1c58 1e
                LIS  $0                  ; 1c59 70
                OUTS 14                  ; 1c5a be
                DCI  $0fea               ; 1c5b 2a 0f ea
                LR   H,DC                ; 1c5e 11
                LIS  $8                  ; 1c5f 78
                COM                      ; 1c60 18
                NM                       ; 1c61 8a
                LR   DC,H                ; 1c62 10
                ST                       ; 1c63 17
                DCI  $08f7               ; 1c64 2a 08 f7
                ST                       ; 1c67 17
                DCI  $0c2d               ; 1c68 2a 0c 2d
                ST                       ; 1c6b 17
                JMP  A1a57               ; 1c6c 29 1a 57
A1c6f:          LR   K,P                 ; 1c6f 08
                PI   $40a9               ; 1c70 28 40 a9
A1c73:          LM                       ; 1c73 16
                LR   $2,A                ; 1c74 52
A1c75:          LR   Q,DC                ; 1c75 0e
                PI   A1ccf               ; 1c76 28 1c cf
                DCI  A1d86               ; 1c79 2a 1d 86
                XDC                      ; 1c7c 2c
                DCI  $0ffa               ; 1c7d 2a 0f fa
                LR   A,$2                ; 1c80 42
                ST                       ; 1c81 17
                LISU 2                   ; 1c82 62
                LISL 0                   ; 1c83 68
                LIS  $5                  ; 1c84 75
                LR   (IS),A              ; 1c85 5c
                PI   $43cd               ; 1c86 28 43 cd
                LR   A,$2                ; 1c89 42
                SL   1                   ; 1c8a 13
                AS   $2                  ; 1c8b c2
                LR   (IS),A              ; 1c8c 5c
                LR   DC,Q                ; 1c8d 0f
                XDC                      ; 1c8e 2c
                DCI  $0f6f               ; 1c8f 2a 0f 6f
                PI   $43cd               ; 1c92 28 43 cd
                DCI  $0820               ; 1c95 2a 08 20
                LR   A,$2                ; 1c98 42
                LR   (IS),A              ; 1c99 5c
                PI   $43cd               ; 1c9a 28 43 cd
                DCI  $0840               ; 1c9d 2a 08 40
                LR   A,$2                ; 1ca0 42
                LR   (IS),A              ; 1ca1 5c
                PI   $43cd               ; 1ca2 28 43 cd
A1ca5:          DCI  $0850               ; 1ca5 2a 08 50
                LR   A,$2                ; 1ca8 42
                LR   (IS),A              ; 1ca9 5c
                PI   $43cd               ; 1caa 28 43 cd
                DCI  $0870               ; 1cad 2a 08 70
                LR   A,$2                ; 1cb0 42
                LR   (IS),A              ; 1cb1 5c
                PI   $43cd               ; 1cb2 28 43 cd
A1cb5:          JMP  A1a57               ; 1cb5 29 1a 57
A1cb8:          LR   K,P                 ; 1cb8 08
                PI   $40a9               ; 1cb9 28 40 a9
                DCI  A1dfc               ; 1cbc 2a 1d fc
                XDC                      ; 1cbf 2c
                BF   $0,A1ca5            ; 1cc0 90 e4
A1cc2:          LR   K,P                 ; 1cc2 08
                LR   A,$2                ; 1cc3 42
                DCI  $08f5               ; 1cc4 2a 08 f5
                ST                       ; 1cc7 17
                LISU 2                   ; 1cc8 62
                LISL 4                   ; 1cc9 6c
                LIS  $4                  ; 1cca 74
                LR   (IS),A              ; 1ccb 5c
                JMP  $43d7               ; 1ccc 29 43 d7
A1ccf:          LR   K,P                 ; 1ccf 08
                PI   $40a9               ; 1cd0 28 40 a9
                PI   $41c8               ; 1cd3 28 41 c8
                PI   $4762               ; 1cd6 28 47 62
                PI   $41c8               ; 1cd9 28 41 c8
A1cdc:          BF   $0,A1cb5            ; 1cdc 90 d8
                COM                      ; 1cde 18
                BF   $5,A1cf8            ; 1cdf 95 18
                OUTS 5                   ; 1ce1 b5
                COM                      ; 1ce2 18
                BT   1,A1cfc             ; 1ce3 81 18
                AMD                      ; 1ce5 89
                COM                      ; 1ce6 18
                OUTS 5                   ; 1ce7 b5
                LR   KU,A                ; 1ce8 04
                LR   A,IS                ; 1ce9 0a
                LR   H,DC                ; 1cea 11
                NS   (IS)-               ; 1ceb fe
                db   $a2                 
                AS   $2                  ; 1ced c2
;                BT   2,-126              ; 1cee 82 82
				db   $82,$82
                BT   2,A1c73             ; 1cf0 82 82
                BT   2,A1c75             ; 1cf2 82 82
                LR   A,$4                ; 1cf4 44
                PI   $3838               ; 1cf5 28 38 38
A1cf8:          NS   (IS)-               ; 1cf8 fe
                NS   (IS)-               ; 1cf9 fe
                NS   (IS)-               ; 1cfa fe
                NS   (IS)-               ; 1cfb fe
A1cfc:          NS   (IS)-               ; 1cfc fe
                NS   (IS)-               ; 1cfd fe
                LR   DC,H                ; 1cfe 10
                LR   DC,H                ; 1cff 10
A1d00:          LR   DC,H                ; 1d00 10
                LR   DC,H                ; 1d01 10
                LR   DC,H                ; 1d02 10
                LR   DC,H                ; 1d03 10
                LR   DC,H                ; 1d04 10
                LR   DC,H                ; 1d05 10
A1d06:          LIS  $c                  ; 1d06 7c
                LR   DC,H                ; 1d07 10
                LR   DC,H                ; 1d08 10
                LR   A,KU                ; 1d09 00
                LR   A,KU                ; 1d0a 00
                LIS  $c                  ; 1d0b 7c
                LR   DC,H                ; 1d0c 10
                LIS  $c                  ; 1d0d 7c
                NS   (IS)-               ; 1d0e fe
                LR   A,KU                ; 1d0f 00
                NS   (IS)-               ; 1d10 fe
                NS   (IS)-               ; 1d11 fe
                XS   (IS)-               ; 1d12 ee
                BT   2,A1cc2             ; 1d13 82 ae
                BT   2,A1d00             ; 1d15 82 ea
                BT   2,A1d06             ; 1d17 82 ee
                NS   (IS)-               ; 1d19 fe
                LR   A,KL                ; 1d1a 01
                LR   A,QU                ; 1d1b 02
                LR   KU,A                ; 1d1c 04
                LR   K,P                 ; 1d1d 08
                LR   DC,H                ; 1d1e 10
                NS   (IS)-               ; 1d1f fe
                AS   $2                  ; 1d20 c2
                NS   (IS)-               ; 1d21 fe
                NS   (IS)-               ; 1d22 fe
                NS   (IS)-               ; 1d23 fe
                NS   (IS)-               ; 1d24 fe
                NS   (IS)-               ; 1d25 fe
                NS   (IS)-               ; 1d26 fe
                LIS  $c                  ; 1d27 7c
                DS   $8                  ; 1d28 38
                DS   $8                  ; 1d29 38
                DS   $8                  ; 1d2a 38
                NS   (IS)-               ; 1d2b fe
                LR   A,KU                ; 1d2c 00
                XS   $0                  ; 1d2d e0
                BT   0,A1d32             ; 1d2e 80 03
                NS   $1                  ; 1d30 f1
                AS   $0                  ; 1d31 c0
A1d32:          LR   QL,A                ; 1d32 07
                NS   $b                  ; 1d33 fb
                XS   $0                  ; 1d34 e0
                LR   DC,Q                ; 1d35 0f
                NS   (IS)+               ; 1d36 fd
                NS   $0                  ; 1d37 f0
                INC                      ; 1d38 1f
                NS   (IS)+               ; 1d39 fd
                OUTS 0                   ; 1d3a b0
                db   $3f                 
                NS   (IS)+               ; 1d3c fd
                NS   $0                  ; 1d3d f0
                db   $3f                 
                NS   (IS)+               ; 1d3f fd
                NS   $0                  ; 1d40 f0
                LIS  $f                  ; 1d41 7f
                NS   $b                  ; 1d42 fb
                NS   $0                  ; 1d43 f0
                LIS  $f                  ; 1d44 7f
                NS   $7                  ; 1d45 f7
                NS   $0                  ; 1d46 f0
                LIS  $f                  ; 1d47 7f
                db   $ff                 
                NS   $0                  ; 1d49 f0
                LIS  $f                  ; 1d4a 7f
                db   $ff                 
                NS   $0                  ; 1d4c f0
                LIS  $f                  ; 1d4d 7f
                db   $ff                 
                ASD  $8                  ; 1d4f d8
                LIS  $f                  ; 1d50 7f
                db   $ff                 
                LIS  $c                  ; 1d52 7c
                LIS  $f                  ; 1d53 7f
                NS   (IS)-               ; 1d54 fe
                DS   $0                  ; 1d55 30
                LIS  $f                  ; 1d56 7f
                NS   (IS)                ; 1d57 fc
                LR   DC,H                ; 1d58 10
                LIS  $f                  ; 1d59 7f
                NS   (IS)                ; 1d5a fc
                LR   DC,H                ; 1d5b 10
                LIS  $f                  ; 1d5c 7f
                NS   (IS)                ; 1d5d fc
                LR   DC,H                ; 1d5e 10
                OUTS 14                  ; 1d5f be
                DS   (IS)                ; 1d60 3c
                LR   DC,H                ; 1d61 10
                DS   (IS)                ; 1d62 3c
                POP                      ; 1d63 1c
                LR   DC,H                ; 1d64 10
                DS   (IS)                ; 1d65 3c
                POP                      ; 1d66 1c
                SR   4                   ; 1d67 14
                DS   (IS)                ; 1d68 3c
                POP                      ; 1d69 1c
                LR   K,P                 ; 1d6a 08
                DS   (IS)                ; 1d6b 3c
                POP                      ; 1d6c 1c
                LR   A,KU                ; 1d6d 00
A1d6e:          DS   (IS)                ; 1d6e 3c
                POP                      ; 1d6f 1c
                LR   A,KU                ; 1d70 00
                DS   (IS)                ; 1d71 3c
A1d72:          POP                      ; 1d72 1c
                LR   A,KU                ; 1d73 00
                DS   (IS)                ; 1d74 3c
                POP                      ; 1d75 1c
A1d76:          LR   A,KU                ; 1d76 00
                LR   A,KU                ; 1d77 00
                LR   A,KU                ; 1d78 00
                LR   KU,A                ; 1d79 04
A1d7a:          LR   A,KU                ; 1d7a 00
                LR   A,QL                ; 1d7b 03
                LR   A,KU                ; 1d7c 00
                LR   KL,A                ; 1d7d 05
                LR   A,KU                ; 1d7e 00
                LR   A,KL                ; 1d7f 01
                LR   A,KU                ; 1d80 00
                LR   A,QU                ; 1d81 02
                LR   A,KU                ; 1d82 00
                LR   A,KU                ; 1d83 00
                LR   A,KU                ; 1d84 00
                LR   A,KU                ; 1d85 00
A1d86:          LR   A,KL                ; 1d86 01
                LR   DC,Q                ; 1d87 0f
                LISL 7                   ; 1d88 6f
                LR   DC,Q                ; 1d89 0f
                LISL 7                   ; 1d8a 6f
A1d8b:          LR   DC,H                ; 1d8b 10
                DI                       ; 1d8c 1a
                NS   $8                  ; 1d8d f8
A1d8e:          DI                       ; 1d8e 1a
                XS   $8                  ; 1d8f e8
A1d90:          PK                       ; 1d90 0c
                LR   KU,A                ; 1d91 04
A1d92:          db   $2f                 
                BF   $f,A1da3            ; 1d93 9f 0f
                LIS  $f                  ; 1d95 7f
A1d96:          db   $ef                 
                db   $5f                 
                db   $cf                 
                PK                       ; 1d99 0c
                LIS  $c                  ; 1d9a 7c
                LISL 6                   ; 1d9b 6e
                ASD  (IS)+               ; 1d9c dd
                BF   $c,A1ddf            ; 1d9d 9c 41
                NS   (IS)                ; 1d9f fc
                LR   (IS)+,A             ; 1da0 5d
                LR   W,J                 ; 1da1 1d
A1da2:          XS   (IS)                ; 1da2 ec
A1da3:          XS   (IS)                ; 1da3 ec
                XS   (IS)+               ; 1da4 ed
                XS   (IS)+               ; 1da5 ed
                XS   (IS)+               ; 1da6 ed
                XS   (IS)-               ; 1da7 ee
                LR   Q,DC                ; 1da8 0e
                NI   $21                 ; 1da9 21 21
                NI   $13                 ; 1dab 21 13
                LR   Q,DC                ; 1dad 0e
                LR   QL,A                ; 1dae 07
A1daf:          LR   H,DC                ; 1daf 11
                LR   Q,DC                ; 1db0 0e
                LR   K,P                 ; 1db1 08
                LR   QL,A                ; 1db2 07
                LR   QL,A                ; 1db3 07
                LR   QL,A                ; 1db4 07
                LR   QL,A                ; 1db5 07
                LR   QL,A                ; 1db6 07
                LR   QL,A                ; 1db7 07
                LR   QL,A                ; 1db8 07
                LR   QL,A                ; 1db9 07
                LR   QL,A                ; 1dba 07
                LR   QL,A                ; 1dbb 07
                LISU 1                   ; 1dbc 61
                LR   A,KL                ; 1dbd 01
                LISU 1                   ; 1dbe 61
                LISU 1                   ; 1dbf 61
                LISU 1                   ; 1dc0 61
                LR   A,KL                ; 1dc1 01
                LIS  $0                  ; 1dc2 70
                LIS  $0                  ; 1dc3 70
                LIS  $0                  ; 1dc4 70
                LIS  $0                  ; 1dc5 70
                LIS  $0                  ; 1dc6 70
                LIS  $0                  ; 1dc7 70
                DS   $0                  ; 1dc8 30
                LISU 1                   ; 1dc9 61
                LISU 1                   ; 1dca 61
                LISU 1                   ; 1dcb 61
                COM                      ; 1dcc 18
                COM                      ; 1dcd 18
                COM                      ; 1dce 18
                COM                      ; 1dcf 18
                COM                      ; 1dd0 18
                COM                      ; 1dd1 18
                PI   $2828               ; 1dd2 28 28 28
                PI   $2828               ; 1dd5 28 28 28
                PI   $4068               ; 1dd8 28 40 68
                BF   $0,A1e24            ; 1ddb 90 48
                LISU 4                   ; 1ddd 64
                LIS  $e                  ; 1dde 7e
A1ddf:          OM                       ; 1ddf 8b
                INS  4                   ; 1de0 a4
                AS   $0                  ; 1de1 c0
                LR   $4,A                ; 1de2 54
                LISL 2                   ; 1de3 6a
                LIS  $e                  ; 1de4 7e
                BF   $4,A1d90            ; 1de5 94 aa
                AS   $0                  ; 1de7 c0
                ASD  $6                  ; 1de8 d6
                DS   (IS)                ; 1de9 3c
                DS   (IS)                ; 1dea 3c
                DS   (IS)                ; 1deb 3c
                BT   0,A1d6e             ; 1dec 80 81
                BT   2,A1d72             ; 1dee 82 83
                BT   4,A1d76             ; 1df0 84 85
                BT   6,A1d7a             ; 1df2 86 87
                AM                       ; 1df4 88
                AMD                      ; 1df5 89
                NM                       ; 1df6 8a
                OM                       ; 1df7 8b
                PK                       ; 1df8 0c
                LR   P0,Q                ; 1df9 0d
                LR   Q,DC                ; 1dfa 0e
                LR   DC,Q                ; 1dfb 0f
A1dfc:          LIS  $b                  ; 1dfc 7b
                BF   $6,A1daf            ; 1dfd 96 b1
                OM                       ; 1dff 8b
                INS  4                   ; 1e00 a4
                AS   $0                  ; 1e01 c0
                LR   A,$6                ; 1e02 46
                LR   (IS),A              ; 1e03 5c
                LIS  $0                  ; 1e04 70
                BT   6,A1da2             ; 1e05 86 9c
                db   $b2                 
                AS   $8                  ; 1e08 c8
                ASD  $0                  ; 1e09 d0
                DS   (IS)                ; 1e0a 3c
                DS   (IS)                ; 1e0b 3c
                BT   0,A1d8e             ; 1e0c 80 81
                BT   2,A1d92             ; 1e0e 82 83
                BT   4,A1d96             ; 1e10 84 85
                LR   QU,A                ; 1e12 06
                LR   QL,A                ; 1e13 07
                LR   K,P                 ; 1e14 08
                AMD                      ; 1e15 89
                NM                       ; 1e16 8a
                OM                       ; 1e17 8b
                PK                       ; 1e18 0c
                CM                       ; 1e19 8d
                ADC                      ; 1e1a 8e
                BR7  A1e1f               ; 1e1b 8f 03
                XDC                      ; 1e1d 2c
                XDC                      ; 1e1e 2c
A1e1f:          XDC                      ; 1e1f 2c
                NS   (IS)+               ; 1e20 fd
                NS   (IS)+               ; 1e21 fd
                NS   (IS)+               ; 1e22 fd
                LNK                      ; 1e23 19
A1e24:          LNK                      ; 1e24 19
                LNK                      ; 1e25 19
                LISU 3                   ; 1e26 63
                LISU 3                   ; 1e27 63
                LISU 3                   ; 1e28 63
                LR   A,KU                ; 1e29 00
                COM                      ; 1e2a 18
                DS   $0                  ; 1e2b 30
                OUTS 0                   ; 1e2c b0
                OUTS 0                   ; 1e2d b0
                OUTS 0                   ; 1e2e b0
                LR   A,KU                ; 1e2f 00
                LR   A,KL                ; 1e30 01
                LR   A,QU                ; 1e31 02
A1e32:          LR   A,KL                ; 1e32 01
                db   $2f                 
                XM                       ; 1e34 8c
                DCI  $0430               ; 1e35 2a 04 30
                LR   $0,A                ; 1e38 50
                LR   A,KU                ; 1e39 00
A1e3a:          LR   A,KL                ; 1e3a 01
                LR   A,KU                ; 1e3b 00
                LR   A,KL                ; 1e3c 01
                LR   A,KL                ; 1e3d 01
                LR   A,KL                ; 1e3e 01
                LR   A,QU                ; 1e3f 02
                LR   A,QU                ; 1e40 02
                LR   A,QL                ; 1e41 03
                LR   A,QL                ; 1e42 03
                LR   KU,A                ; 1e43 04
                LR   A,QL                ; 1e44 03
A1e45:          LR   DC,Q                ; 1e45 0f
                db   $ff                 
                PK                       ; 1e47 0c
                XS   $7                  ; 1e48 e7
                LR   K,P                 ; 1e49 08
                LR   A,$6                ; 1e4a 46
A1e4b:          LR   A,KU                ; 1e4b 00
                LR   A,$1                ; 1e4c 41
                LR   A,KU                ; 1e4d 00
                LISU 3                   ; 1e4e 63
                LR   A,KU                ; 1e4f 00
                DS   $6                  ; 1e50 36
                LR   A,KU                ; 1e51 00
                POP                      ; 1e52 1c
A1e53:          LR   A,IS                ; 1e53 0a
                PK                       ; 1e54 0c
                LR   Q,DC                ; 1e55 0e
                LR   J,W                 ; 1e56 1e
                LI   $22                 ; 1e57 20 22
                DS   $2                  ; 1e59 32
                DS   $4                  ; 1e5a 34
                AI   $36                 ; 1e5b 24 36
                LR   A,$4                ; 1e5d 44
                LR   A,$8                ; 1e5e 48
A1e5f:          NOP                      ; 1e5f 2b
                LR   A,KU                ; 1e60 00
                DS   $1                  ; 1e61 31
                LNK                      ; 1e62 19
                SL   1                   ; 1e63 13
                SL   1                   ; 1e64 13
                NI   $0b                 ; 1e65 21 0b
                DCI  $e627               ; 1e67 2a e6 27
                LR   IS,A                ; 1e6a 0b
                db   $2f                 
                LR   IS,A                ; 1e6c 0b
                OUT  $fb                 ; 1e6d 27 fb
                COM                      ; 1e6f 18
                AI   $1c                 ; 1e70 24 1c
                OI   $16                 ; 1e72 22 16
                NS   (IS)+               ; 1e74 fd
                SR   4                   ; 1e75 14
                LR   A,KU                ; 1e76 00
                NI   $07                 ; 1e77 21 07
                LR   H,DC                ; 1e79 11
                NOP                      ; 1e7a 2b
                INC                      ; 1e7b 1f
                NI   $00                 ; 1e7c 21 00
                COM                      ; 1e7e 18
                AI   $1c                 ; 1e7f 24 1c
                DS   $2                  ; 1e81 32
                LM                       ; 1e82 16
                ASD  (IS)+               ; 1e83 dd
                SL   4                   ; 1e84 15
                LR   IS,A                ; 1e85 0b
                LR   KL,A                ; 1e86 05
                LR   A,KU                ; 1e87 00
                NOP                      ; 1e88 2b
                LR   IS,A                ; 1e89 0b
                DS   $3                  ; 1e8a 33
                LR   QL,A                ; 1e8b 07
A1e8c:          XI   $06                 ; 1e8c 23 06
                LR   A,KU                ; 1e8e 00
                LR   W,J                 ; 1e8f 1d
                LR   H,DC                ; 1e90 11
                DS   $1                  ; 1e91 31
                LR   QL,A                ; 1e92 07
                SL   1                   ; 1e93 13
                LR   P,K                 ; 1e94 09
                NI   $2a                 ; 1e95 21 2a
                XS   (IS)-               ; 1e97 ee
                INC                      ; 1e98 1f
                LR   IS,A                ; 1e99 0b
                JMP  $112b               ; 1e9a 29 11 2b
                INC                      ; 1e9d 1f
                NS   (IS)                ; 1e9e fc
                COM                      ; 1e9f 18
                DS   $6                  ; 1ea0 36
                POP                      ; 1ea1 1c
                PK                       ; 1ea2 0c
                LM                       ; 1ea3 16
                NS   (IS)+               ; 1ea4 fd
                DS   $1                  ; 1ea5 31
                SL   1                   ; 1ea6 13
                JMP  $250b               ; 1ea7 29 25 0b
                LR   QL,A                ; 1eaa 07
                LR   IS,A                ; 1eab 0b
                NS   (IS)+               ; 1eac fd
                COM                      ; 1ead 18
                DS   $6                  ; 1eae 36
                POP                      ; 1eaf 1c
                LI   $33                 ; 1eb0 20 33
                LR   A,KU                ; 1eb2 00
                INC                      ; 1eb3 1f
                LR   H,DC                ; 1eb4 11
                LR   KL,A                ; 1eb5 05
                NS   $2                  ; 1eb6 f2
                DS   $1                  ; 1eb7 31
                SL   1                   ; 1eb8 13
                NI   $07                 ; 1eb9 21 07
                NS   (IS)                ; 1ebb fc
                IN   $f7                 ; 1ebc 26 f7
                NI   $07                 ; 1ebe 21 07
                LR   H,DC                ; 1ec0 11
                NOP                      ; 1ec1 2b
                INC                      ; 1ec2 1f
                NS   $4                  ; 1ec3 f4
                JMP  $1115               ; 1ec4 29 11 15
                LR   IS,A                ; 1ec7 0b
                NS   $a                  ; 1ec8 fa
                EI                       ; 1ec9 1b
                OUT  $11                 ; 1eca 27 11
                NI   $21                 ; 1ecc 21 21
                LR   IS,A                ; 1ece 0b
                NI   $2d                 ; 1ecf 21 2d
                LR   A,QL                ; 1ed1 03
                LR   KL,A                ; 1ed2 05
                NS   $9                  ; 1ed3 f9
                NI   $01                 ; 1ed4 21 01
                EI                       ; 1ed6 1b
                NOP                      ; 1ed7 2b
                NI   $fd                 ; 1ed8 21 fd
                CI   $09                 ; 1eda 25 09
                LR   A,KL                ; 1edc 01
                DS   $1                  ; 1edd 31
                LR   IS,A                ; 1ede 0b
                NS   $b                  ; 1edf fb
                DS   $1                  ; 1ee0 31
                LR   IS,A                ; 1ee1 0b
                NOP                      ; 1ee2 2b
                LR   QL,A                ; 1ee3 07
                NI   $fd                 ; 1ee4 21 fd
A1ee6:          LR   K,P                 ; 1ee6 08
                LR   H,DC                ; 1ee7 11
                NI   $21                 ; 1ee8 21 21
                LR   IS,A                ; 1eea 0b
                LR   QL,A                ; 1eeb 07
                NI   $2e                 ; 1eec 21 2e
                NS   (IS)                ; 1eee fc
A1eef:          LR   A,IS                ; 1eef 0a
                LR   IS,A                ; 1ef0 0b
                DS   $3                  ; 1ef1 33
                CI   $0b                 ; 1ef2 25 0b
                NOP                      ; 1ef4 2b
                NI   $0b                 ; 1ef5 21 0b
                NI   $2e                 ; 1ef7 21 2e
                NS   (IS)                ; 1ef9 fc
A1efa:          LR   Q,DC                ; 1efa 0e
                SL   1                   ; 1efb 13
                db   $2f                 
                LR   IS,A                ; 1efd 0b
                LR   P,K                 ; 1efe 09
                NI   $25                 ; 1eff 21 25
                LR   IS,A                ; 1f01 0b
                NOP                      ; 1f02 2b
                INC                      ; 1f03 1f
                LR   A,KL                ; 1f04 01
                NOP                      ; 1f05 2b
                EI                       ; 1f06 1b
                LR   KU,A                ; 1f07 04
                LR   A,KU                ; 1f08 00
A1f09:          LR   QU,A                ; 1f09 06
                JMP  $111f               ; 1f0a 29 11 1f
                LR   IS,A                ; 1f0d 0b
                LR   A,KU                ; 1f0e 00
                LR   A,KU                ; 1f0f 00
                LR   QU,A                ; 1f10 06
                NI   $01                 ; 1f11 21 01
                EI                       ; 1f13 1b
                NOP                      ; 1f14 2b
                NI   $00                 ; 1f15 21 00
                LR   QU,A                ; 1f17 06
                CI   $09                 ; 1f18 25 09
                LR   A,KL                ; 1f1a 01
                DS   $1                  ; 1f1b 31
                LR   IS,A                ; 1f1c 0b
                LR   A,KU                ; 1f1d 00
                LR   QU,A                ; 1f1e 06
                SR   4                   ; 1f1f 14
                LR   A,KU                ; 1f20 00
                NI   $13                 ; 1f21 21 13
                OUT  $1f                 ; 1f23 27 1f
                LR   QU,A                ; 1f25 06
                NI   $11                 ; 1f26 21 11
                OUT  $0b                 ; 1f28 27 0b
                NI   $00                 ; 1f2a 21 00
                LR   QU,A                ; 1f2c 06
                CI   $09                 ; 1f2d 25 09
                SL   1                   ; 1f2f 13
                LR   W,J                 ; 1f30 1d
                LR   A,KL                ; 1f31 01
                LR   QL,A                ; 1f32 07
A1f33:          SR   1                   ; 1f33 12
                LR   H,DC                ; 1f34 11
                NI   $07                 ; 1f35 21 07
                LR   H,DC                ; 1f37 11
                NOP                      ; 1f38 2b
                INC                      ; 1f39 1f
                NS   (IS)                ; 1f3a fc
                LNK                      ; 1f3b 19
                LR   A,KL                ; 1f3c 01
                EI                       ; 1f3d 1b
                LNK                      ; 1f3e 19
                XS   $7                  ; 1f3f e7
                LR   H,DC                ; 1f40 11
                NI   $21                 ; 1f41 21 21
                LR   IS,A                ; 1f43 0b
                LR   QL,A                ; 1f44 07
                NI   $d0                 ; 1f45 21 d0
A1f47:          LR   KU,A                ; 1f47 04
                LNK                      ; 1f48 19
                LR   P0,Q                ; 1f49 0d
                SL   1                   ; 1f4a 13
                NOP                      ; 1f4b 2b
                LR   KU,A                ; 1f4c 04
A1f4d:          SR   1                   ; 1f4d 12
                LR   A,KU                ; 1f4e 00
                AS   $b                  ; 1f4f cb
                NI   $07                 ; 1f50 21 07
                LR   H,DC                ; 1f52 11
                NOP                      ; 1f53 2b
                INC                      ; 1f54 1f
                NS   $6                  ; 1f55 f6
                LR   A,KL                ; 1f56 01
                NI   $00                 ; 1f57 21 00
                db   $2d                 
                LR   H,DC                ; 1f5a 11
                NOP                      ; 1f5b 2b
                SL   4                   ; 1f5c 15
                LR   P,K                 ; 1f5d 09
                LR   A,QL                ; 1f5e 03
                CI   $07                 ; 1f5f 25 07
                LR   KU,A                ; 1f61 04
A1f62:          LR   P,K                 ; 1f62 09
                DS   $3                  ; 1f63 33
                LNK                      ; 1f64 19
                LR   IS,A                ; 1f65 0b
                LR   H,DC                ; 1f66 11
                LR   QL,A                ; 1f67 07
                LR   A,KU                ; 1f68 00
                LR   P0,Q                ; 1f69 0d
                LR   H,DC                ; 1f6a 11
                db   $2f                 
                LR   IS,A                ; 1f6c 0b
A1f6d:          LR   KU,A                ; 1f6d 04
                DS   $6                  ; 1f6e 36
                LR   P,K                 ; 1f6f 09
                LR   H,DC                ; 1f70 11
                LR   A,KL                ; 1f71 01
                NOP                      ; 1f72 2b
A1f73:          LR   QU,A                ; 1f73 06
                DS   $5                  ; 1f74 35
                DS   $1                  ; 1f75 31
                LR   A,KL                ; 1f76 01
                LR   P,K                 ; 1f77 09
                DS   $1                  ; 1f78 31
                LR   A,QL                ; 1f79 03
                NI   $08                 ; 1f7a 21 08
                LR   A,$4                ; 1f7c 44
                LR   A,KU                ; 1f7d 00
                DS   $1                  ; 1f7e 31
                SL   1                   ; 1f7f 13
                JMP  $012b               ; 1f80 29 01 2b
                EI                       ; 1f83 1b
                LR   A,KU                ; 1f84 00
A1f85:          LR   P,K                 ; 1f85 09
                LR   A,$3                ; 1f86 43
                NOP                      ; 1f87 2b
                SL   1                   ; 1f88 13
                LR   A,KU                ; 1f89 00
                CI   $11                 ; 1f8a 25 11
                LR   P,K                 ; 1f8c 09
                LR   H,DC                ; 1f8d 11
                INC                      ; 1f8e 1f
A1f8f:          LR   IS,A                ; 1f8f 0b
                DS   $6                  ; 1f90 36
                DS   $7                  ; 1f91 37
                LR   A,$6                ; 1f92 46
                LR   A,$7                ; 1f93 47
                LR   $6,A                ; 1f94 56
A1f95:          LR   $7,A                ; 1f95 57
                LR   KL,A                ; 1f96 05
                LR   A,QU                ; 1f97 02
                LR   KU,A                ; 1f98 04
A1f99:          LR   DC,H                ; 1f99 10
                SL   4                   ; 1f9a 15
                LR   KL,A                ; 1f9b 05
                LI   $01                 ; 1f9c 20 01
                LR   A,KU                ; 1f9e 00
A1f9f:          LR   QL,A                ; 1f9f 07
                LR   A,$4                ; 1fa0 44
                DS   $1                  ; 1fa1 31
                SL   1                   ; 1fa2 13
                NI   $07                 ; 1fa3 21 07
                NS   (IS)+               ; 1fa5 fd
                AI   $26                 ; 1fa6 24 26
A1fa8:          LR   A,KL                ; 1fa8 01
                LR   A,KU                ; 1fa9 00
                LR   QL,A                ; 1faa 07
                LR   A,KL                ; 1fab 01
                LR   QU,A                ; 1fac 06
                LR   K,P                 ; 1fad 08
                LR   A,IS                ; 1fae 0a
                LR   Q,DC                ; 1faf 0e
                LR   A,KL                ; 1fb0 01
                AI   $06                 ; 1fb1 24 06
                COM                      ; 1fb3 18
                LR   QU,A                ; 1fb4 06
                LR   J,W                 ; 1fb5 1e
A1fb6:          LI   $01                 ; 1fb6 20 01
                ST                       ; 1fb8 17
                SL   4                   ; 1fb9 15
                SR   1                   ; 1fba 12
                DS   $0                  ; 1fbb 30
                ST                       ; 1fbc 17
                DS   $0                  ; 1fbd 30
                SR   1                   ; 1fbe 12
                DS   $0                  ; 1fbf 30
                SR   4                   ; 1fc0 14
                SL   4                   ; 1fc1 15
                ST                       ; 1fc2 17
                SL   4                   ; 1fc3 15
                LR   DC,Q                ; 1fc4 0f
                LISU 0                   ; 1fc5 60
                ST                       ; 1fc6 17
                LR   K,P                 ; 1fc7 08
                SR   1                   ; 1fc8 12
                AI   $17                 ; 1fc9 24 17
                SR   1                   ; 1fcb 12
                LR   DC,Q                ; 1fcc 0f
                LR   K,P                 ; 1fcd 08
                SR   1                   ; 1fce 12
                AI   $17                 ; 1fcf 24 17
                SR   1                   ; 1fd1 12
                LR   DC,Q                ; 1fd2 0f
                LR   DC,H                ; 1fd3 10
                LR   DC,H                ; 1fd4 10
                LR   DC,H                ; 1fd5 10
                BF   $0,A1fdf            ; 1fd6 90 08
                LR   DC,H                ; 1fd8 10
                LR   K,P                 ; 1fd9 08
                BF   $0,A1fe3            ; 1fda 90 08
                BF   $1,A1fe5            ; 1fdc 91 08
                SL   1                   ; 1fde 13
A1fdf:          LR   DC,H                ; 1fdf 10
                SR   4                   ; 1fe0 14
                LR   DC,H                ; 1fe1 10
                SL   4                   ; 1fe2 15
A1fe3:          LR   DC,H                ; 1fe3 10
                SR   4                   ; 1fe4 14
A1fe5:          LR   DC,H                ; 1fe5 10
                ST                       ; 1fe6 17
                LR   K,P                 ; 1fe7 08
                COM                      ; 1fe8 18
                LR   K,P                 ; 1fe9 08
                ST                       ; 1fea 17
                LR   K,P                 ; 1feb 08
                COM                      ; 1fec 18
                LR   K,P                 ; 1fed 08
                ST                       ; 1fee 17
                LR   K,P                 ; 1fef 08
                COM                      ; 1ff0 18
                LR   K,P                 ; 1ff1 08
                ST                       ; 1ff2 17
                LR   K,P                 ; 1ff3 08
                SR   1                   ; 1ff4 12
                ST                       ; 1ff5 17
                LR   DC,Q                ; 1ff6 0f
                LR   K,P                 ; 1ff7 08
                SR   1                   ; 1ff8 12
                LR   K,P                 ; 1ff9 08
                ST                       ; 1ffa 17
                SL   4                   ; 1ffb 15
                LR   DC,Q                ; 1ffc 0f
                SL   4                   ; 1ffd 15
                LISU 0                   ; 1ffe 60
                LISU 0                   ; 1fff 60
