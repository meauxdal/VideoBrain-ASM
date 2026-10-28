;Music Teacher 1 - ED01

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/25/2010

org $1000

				db   $aa,$55			;cart signature
				db   $04				;background color
				db   $29,$03,$21,$01,$31,$00,$07,$0b,$11,$31,$19,$0b,$09,$00,$24	;name - MUSIC TEACHER 1

START:
                LISU 7                   ; 1012 67
                LISL 4                   ; 1013 6c
                LI   $1f                 ; 1014 20 1f
                LR   (IS),A              ; 1016 5c
A1017:          LIS  $0                  ; 1017 70
                LR   $5,A                ; 1018 55
                LR   $6,A                ; 1019 56
                DCI  $0fea               ; 101a 2a 0f ea
                LI   $64                 ; 101d 20 64
                ST                       ; 101f 17
                DCI  $0fe5               ; 1020 2a 0f e5
                LI   $f9                 ; 1023 20 f9
                ST                       ; 1025 17
                DCI  $0fe8               ; 1026 2a 0f e8
                LI   $e0                 ; 1029 20 e0
                ST                       ; 102b 17
                PI   $45db               ; 102c 28 45 db
                DCI  $0877               ; 102f 2a 08 77
                LI   $ff                 ; 1032 20 ff
                ST                       ; 1034 17
                DCI  $08f5               ; 1035 2a 08 f5
                LI   $04                 ; 1038 20 04
                ST                       ; 103a 17
                LISU 2                   ; 103b 62
                LISL 4                   ; 103c 6c
                DCI  $0fdf               ; 103d 2a 0f df
                LI   $10                 ; 1040 20 10
                ST                       ; 1042 17
                LI   $10                 ; 1043 20 10
                LR   (IS),A              ; 1045 5c
                DCI  A15e7               ; 1046 2a 15 e7
                PI   $4205               ; 1049 28 42 05
                XDC                      ; 104c 2c
                DCI  $0fdf               ; 104d 2a 0f df
                LI   $30                 ; 1050 20 30
                ST                       ; 1052 17
                LI   $20                 ; 1053 20 20
                LR   (IS),A              ; 1055 5c
                XDC                      ; 1056 2c
                PI   $4205               ; 1057 28 42 05
                DCI  $0fe2               ; 105a 2a 0f e2
                LIS  $1                  ; 105d 71
                ST                       ; 105e 17
                DCI  $0fc2               ; 105f 2a 0f c2
                LI   $e0                 ; 1062 20 e0
                ST                       ; 1064 17
                PI   A14c8               ; 1065 28 14 c8
                LR   A,$8                ; 1068 48
                CI   $12                 ; 1069 25 12
                BF   $4,A106f            ; 106b 94 03
                BF   $0,A107b            ; 106d 90 0d
A106f:          CI   $1a                 ; 106f 25 1a
                BF   $4,A1076            ; 1071 94 04
                JMP  A1193               ; 1073 29 11 93
A1076:          PI   $2468               ; 1076 28 24 68
                BF   $0,A1017            ; 1079 90 9d
A107b:          DCI  $08f5               ; 107b 2a 08 f5
                LIS  $0                  ; 107e 70
                ST                       ; 107f 17
                DCI  $0fe2               ; 1080 2a 0f e2
                ST                       ; 1083 17
                LR   $3,A                ; 1084 53
                LR   $4,A                ; 1085 54
                LR   $2,A                ; 1086 52
                LIS  $1                  ; 1087 71
                LR   $5,A                ; 1088 55
A1089:          LISU 5                   ; 1089 65
                LISL 4                   ; 108a 6c
                DCI  $0f01               ; 108b 2a 0f 01
                LR   Q,DC                ; 108e 0e
                LR   A,QU                ; 108f 02
                LR   (IS)-,A             ; 1090 5e
                LR   A,QL                ; 1091 03
                LR   (IS),A              ; 1092 5c
A1093:          PI   $41c8               ; 1093 28 41 c8
                PI   A13d9               ; 1096 28 13 d9
                PI   A12f0               ; 1099 28 12 f0
A109c:          PI   A14c8               ; 109c 28 14 c8
                LIS  $0                  ; 109f 70
                LR   $4,A                ; 10a0 54
A10a1:          PI   A1563               ; 10a1 28 15 63
                BF   $1,A109c            ; 10a4 91 f7
                BT   4,A10c0             ; 10a6 84 19
                LR   A,$8                ; 10a8 48
                CI   $20                 ; 10a9 25 20
                BF   $4,A10b0            ; 10ab 94 04
                JMP  A116b               ; 10ad 29 11 6b
A10b0:          CI   $1d                 ; 10b0 25 1d
                BF   $4,A10b8            ; 10b2 94 05
                LIS  $0                  ; 10b4 70
                LR   $5,A                ; 10b5 55
                BF   $0,A109c            ; 10b6 90 e5
A10b8:          CI   $12                 ; 10b8 25 12
                BF   $4,A109c            ; 10ba 94 e1
                LIS  $1                  ; 10bc 71
                LR   $5,A                ; 10bd 55
                BF   $0,A109c            ; 10be 90 dd
A10c0:          DCI  A1616               ; 10c0 2a 16 16
                LR   A,$8                ; 10c3 48
                ADC                      ; 10c4 8e
                LM                       ; 10c5 16
                LR   $8,A                ; 10c6 58
                XI   $00                 ; 10c7 23 00
                BT   1,A10ce             ; 10c9 81 04
                JMP  A1237               ; 10cb 29 12 37
A10ce:          LI   $ff                 ; 10ce 20 ff
                XS   $2                  ; 10d0 e2
                BF   $4,A10d6            ; 10d1 94 04
                PI   A1500               ; 10d3 28 15 00
A10d6:          LIS  $6                  ; 10d6 76
                XS   $1                  ; 10d7 e1
                BF   $4,A10e1            ; 10d8 94 08
                LR   A,$8                ; 10da 48
                LR   $7,A                ; 10db 57
                PI   A13d9               ; 10dc 28 13 d9
                LR   A,$7                ; 10df 47
                LR   $8,A                ; 10e0 58
A10e1:          LR   A,$1                ; 10e1 41
                INC                      ; 10e2 1f
                LR   $1,A                ; 10e3 51
                PI   A1255               ; 10e4 28 12 55
                BF   $1,A10ec            ; 10e7 91 04
                JMP  A109c               ; 10e9 29 10 9c
A10ec:          PI   A1341               ; 10ec 28 13 41
                PI   A146c               ; 10ef 28 14 6c
                LR   A,$0                ; 10f2 40
                SL   4                   ; 10f3 15
                XS   $2                  ; 10f4 e2
                LR   $2,A                ; 10f5 52
                LIS  $0                  ; 10f6 70
                LR   $4,A                ; 10f7 54
                PI   $46d6               ; 10f8 28 46 d6
                LIS  $4                  ; 10fb 74
                LR   $7,A                ; 10fc 57
A10fd:          PI   A157e               ; 10fd 28 15 7e
                COM                      ; 1100 18
                BT   4,A110f             ; 1101 84 0d
                PI   A14a1               ; 1103 28 14 a1
                DS   $4                  ; 1106 34
                BF   $4,A10fd            ; 1107 94 f5
A1109:          PI   A157e               ; 1109 28 15 7e
                COM                      ; 110c 18
                BF   $4,A1109            ; 110d 94 fb
A110f:          DI                       ; 110f 1a
                LR   J,W                 ; 1110 1e
                LR   $7,A                ; 1111 57
                PI   A14bc               ; 1112 28 14 bc
A1115:          DS   $7                  ; 1115 37
                PI   A157e               ; 1116 28 15 7e
                BT   1,A111d             ; 1119 81 03
                BF   $0,A112f            ; 111b 90 13
A111d:          LIS  $0                  ; 111d 70
                XS   $4                  ; 111e e4
                BF   $1,A1127            ; 111f 91 07
                BT   4,A112a             ; 1121 84 08
                AI   $e6                 ; 1123 24 e6
                BF   $1,A112a            ; 1125 91 04
A1127:          LR   A,$7                ; 1127 47
                AS   $4                  ; 1128 c4
                LR   $4,A                ; 1129 54
A112a:          PI   A1500               ; 112a 28 15 00
                BF   $0,A1149            ; 112d 90 1b
A112f:          LI   $19                 ; 112f 20 19
                AS   $7                  ; 1131 c7
                BT   1,A1115             ; 1132 81 e2
                PI   A1500               ; 1134 28 15 00
A1137:          DS   $7                  ; 1137 37
                PI   A157e               ; 1138 28 15 7e
                BT   1,A1144             ; 113b 81 08
                LIS  $0                  ; 113d 70
                XS   $7                  ; 113e e7
                BF   $4,A1137            ; 113f 94 f7
                JMP  A109c               ; 1141 29 10 9c
A1144:          LI   $ff                 ; 1144 20 ff
                LR   $2,A                ; 1146 52
                LR   A,$7                ; 1147 47
                LR   $4,A                ; 1148 54
A1149:          LIS  $0                  ; 1149 70
                LR   $7,A                ; 114a 57
                JMP  A10a1               ; 114b 29 10 a1
A114e:          LIS  $1                  ; 114e 71
                LR   $6,A                ; 114f 56
                XDC                      ; 1150 2c
                LI   $15                 ; 1151 20 15
A1153:          ST                       ; 1153 17
                LIS  $2                  ; 1154 72
                NS   $5                  ; 1155 f5
                BT   4,A115b             ; 1156 84 04
                JMP  A11f0               ; 1158 29 11 f0
A115b:          JMP  A109c               ; 115b 29 10 9c
A115e:          LIS  $0                  ; 115e 70
                LR   $6,A                ; 115f 56
                XDC                      ; 1160 2c
                BF   $0,A1153            ; 1161 90 f1
A1163:          LI   $80                 ; 1163 20 80
                LR   $6,A                ; 1165 56
                XDC                      ; 1166 2c
                LI   $11                 ; 1167 20 11
                BF   $0,A1153            ; 1169 90 e9
A116b:          DCI  $0f00               ; 116b 2a 0f 00
                LI   $9b                 ; 116e 20 9b
                LR   $8,A                ; 1170 58
                LIS  $0                  ; 1171 70
A1172:          ST                       ; 1172 17
                DS   $8                  ; 1173 38
                BF   $4,A1172            ; 1174 94 fd
                LIS  $1                  ; 1176 71
                LR   $5,A                ; 1177 55
                JMP  A1089               ; 1178 29 10 89
A117b:          PI   A13d9               ; 117b 28 13 d9
                DCI  $0f00               ; 117e 2a 0f 00
                LM                       ; 1181 16
                LR   $3,A                ; 1182 53
A1183:          PI   A1279               ; 1183 28 12 79
                PI   A1530               ; 1186 28 15 30
                LIS  $0                  ; 1189 70
                XS   $3                  ; 118a e3
                BF   $4,A1190            ; 118b 94 04
                JMP  A1093               ; 118d 29 10 93
A1190:          DS   $3                  ; 1190 33
                BF   $0,A1183            ; 1191 90 f1
A1193:          LIS  $0                  ; 1193 70
                LR   $5,A                ; 1194 55
                LR   $6,A                ; 1195 56
                LR   $1,A                ; 1196 51
                DCI  $08f5               ; 1197 2a 08 f5
                ST                       ; 119a 17
                PI   A13d9               ; 119b 28 13 d9
                PI   A12f0               ; 119e 28 12 f0
                PI   A14c8               ; 11a1 28 14 c8
                LR   A,$8                ; 11a4 48
                CI   $11                 ; 11a5 25 11
                BT   4,A11eb             ; 11a7 84 43
                CI   $10                 ; 11a9 25 10
                BT   4,A11ba             ; 11ab 84 0e
                PI   $45db               ; 11ad 28 45 db
                PI   $2468               ; 11b0 28 24 68
                DCI  $0fe2               ; 11b3 2a 0f e2
                LIS  $1                  ; 11b6 71
                ST                       ; 11b7 17
                BF   $0,A1193            ; 11b8 90 da
A11ba:          DCI  A1744               ; 11ba 2a 17 44
                LR   A,$5                ; 11bd 45
                OI   $80                 ; 11be 22 80
                LR   $5,A                ; 11c0 55
A11c1:          LM                       ; 11c1 16
                LR   $3,A                ; 11c2 53
A11c3:          PI   A1279               ; 11c3 28 12 79
                PI   A1530               ; 11c6 28 15 30
                DS   $3                  ; 11c9 33
                LIS  $2                  ; 11ca 72
                NS   $5                  ; 11cb f5
                BT   4,A11d4             ; 11cc 84 07
                LR   A,$5                ; 11ce 45
                OI   $04                 ; 11cf 22 04
                LR   $5,A                ; 11d1 55
                BF   $0,A11f0            ; 11d2 90 1d
A11d4:          XS   $3                  ; 11d4 e3
                BF   $4,A11c3            ; 11d5 94 ed
                LR   A,$5                ; 11d7 45
                OI   $02                 ; 11d8 22 02
                LR   $5,A                ; 11da 55
                DCI  $0fe2               ; 11db 2a 0f e2
                LIS  $0                  ; 11de 70
                ST                       ; 11df 17
                PI   A13d9               ; 11e0 28 13 d9
                PI   A12f0               ; 11e3 28 12 f0
                LI   $80                 ; 11e6 20 80
                NS   $5                  ; 11e8 f5
                BF   $4,A11ba            ; 11e9 94 d0
A11eb:          DCI  A1711               ; 11eb 2a 17 11
                BF   $0,A11c1            ; 11ee 90 d2
A11f0:          PI   A14c8               ; 11f0 28 14 c8
                DCI  A1616               ; 11f3 2a 16 16
                LR   A,$8                ; 11f6 48
                ADC                      ; 11f7 8e
                LM                       ; 11f8 16
                LR   $8,A                ; 11f9 58
                XI   $00                 ; 11fa 23 00
                BT   1,A1201             ; 11fc 81 04
A11fe:          JMP  A11f0               ; 11fe 29 11 f0
A1201:          PI   A1255               ; 1201 28 12 55
                BT   1,A11fe             ; 1204 81 f9
                PI   A1341               ; 1206 28 13 41
                LR   A,$0                ; 1209 40
                SL   4                   ; 120a 15
                XS   $2                  ; 120b e2
                LISU 7                   ; 120c 67
                LISL 3                   ; 120d 6b
                XS   (IS)                ; 120e ec
                BF   $4,A11f0            ; 120f 94 e0
                PI   A146c               ; 1211 28 14 6c
                PI   $46d6               ; 1214 28 46 d6
                LIS  $4                  ; 1217 74
                LR   $7,A                ; 1218 57
A1219:          PI   A14a1               ; 1219 28 14 a1
                PI   A157e               ; 121c 28 15 7e
                LR   A,$4                ; 121f 44
                INC                      ; 1220 1f
                LR   $4,A                ; 1221 54
                BF   $4,A1219            ; 1222 94 f6
                DI                       ; 1224 1a
                LR   J,W                 ; 1225 1e
                PI   A14bc               ; 1226 28 14 bc
                PI   A1530               ; 1229 28 15 30
                LI   $fb                 ; 122c 20 fb
                NS   $5                  ; 122e f5
                LR   $5,A                ; 122f 55
                LIS  $0                  ; 1230 70
                XS   $3                  ; 1231 e3
                BF   $4,A11c3            ; 1232 94 90
                JMP  A1193               ; 1234 29 11 93
A1237:          DCI  $08f5               ; 1237 2a 08 f5
                XDC                      ; 123a 2c
                DCI  A1246               ; 123b 2a 12 46
                LIS  $f                  ; 123e 7f
                NS   $8                  ; 123f f8
                LR   $8,A                ; 1240 58
                SL   1                   ; 1241 13
                AS   $8                  ; 1242 c8
                ADC                      ; 1243 8e
                LR   Q,DC                ; 1244 0e
                LR   P0,Q                ; 1245 0d
A1246:          JMP  A109c               ; 1246 29 10 9c
                JMP  A114e               ; 1249 29 11 4e
                JMP  A117b               ; 124c 29 11 7b
                JMP  A1163               ; 124f 29 11 63
                JMP  A115e               ; 1252 29 11 5e
A1255:          DCI  $163b               ; 1255 2a 16 3b
                LI   $f7                 ; 1258 20 f7
                NS   $5                  ; 125a f5
                LR   $5,A                ; 125b 55
                LIS  $0                  ; 125c 70
                XS   $6                  ; 125d e6
                BT   4,A1267             ; 125e 84 08
                BT   1,A1265             ; 1260 81 04
                LIS  $c                  ; 1262 7c
                BF   $0,A1267            ; 1263 90 03
A1265:          LI   $f4                 ; 1265 20 f4
A1267:          AS   $8                  ; 1267 c8
                LR   $8,A                ; 1268 58
                ADC                      ; 1269 8e
                BT   1,A126e             ; 126a 81 03
                DS   $1                  ; 126c 31
A126d:          POP                      ; 126d 1c
A126e:          LIS  $3                  ; 126e 73
                LR   $0,A                ; 126f 50
A1270:          LI   $f4                 ; 1270 20 f4
                AS   $8                  ; 1272 c8
                LR   $8,A                ; 1273 58
                BF   $1,A126d            ; 1274 91 f8
                DS   $0                  ; 1276 30
                BF   $0,A1270            ; 1277 90 f8
A1279:          LR   K,P                 ; 1279 08
                PI   $40a9               ; 127a 28 40 a9
                LIS  $0                  ; 127d 70
                XS   $3                  ; 127e e3
                BT   4,A12ec             ; 127f 84 6c
                LIS  $6                  ; 1281 76
                XS   $1                  ; 1282 e1
                BF   $4,A128e            ; 1283 94 0a
                PI   A1528               ; 1285 28 15 28
                PI   A13d9               ; 1288 28 13 d9
                PI   A1530               ; 128b 28 15 30
A128e:          LM                       ; 128e 16
                LR   $8,A                ; 128f 58
                LISU 7                   ; 1290 67
                LISL 3                   ; 1291 6b
                LR   (IS),A              ; 1292 5c
                LM                       ; 1293 16
                LR   $4,A                ; 1294 54
                PI   A1528               ; 1295 28 15 28
                LI   $ff                 ; 1298 20 ff
                XS   $8                  ; 129a e8
                BF   $4,A12a2            ; 129b 94 06
                PI   A1538               ; 129d 28 15 38
                BF   $0,A12df            ; 12a0 90 3e
A12a2:          LR   A,$1                ; 12a2 41
                INC                      ; 12a3 1f
                LR   $1,A                ; 12a4 51
                DCI  $163b               ; 12a5 2a 16 3b
                LIS  $f                  ; 12a8 7f
                NS   $8                  ; 12a9 f8
                COM                      ; 12aa 18
                INC                      ; 12ab 1f
                AI   $0b                 ; 12ac 24 0b
                ADC                      ; 12ae 8e
                LR   A,$8                ; 12af 48
                SR   4                   ; 12b0 14
                LR   $0,A                ; 12b1 50
A12b2:          CI   $03                 ; 12b2 25 03
                BT   4,A12bd             ; 12b4 84 08
                INC                      ; 12b6 1f
                LR   $8,A                ; 12b7 58
                LIS  $c                  ; 12b8 7c
                ADC                      ; 12b9 8e
                LR   A,$8                ; 12ba 48
                BF   $0,A12b2            ; 12bb 90 f6
A12bd:          PI   A1341               ; 12bd 28 13 41
                LIS  $4                  ; 12c0 74
                LR   $7,A                ; 12c1 57
                LIS  $2                  ; 12c2 72
                NS   $5                  ; 12c3 f5
                BF   $4,A12ec            ; 12c4 94 27
                PI   A146c               ; 12c6 28 14 6c
                PI   $46d6               ; 12c9 28 46 d6
A12cc:          PI   A14a1               ; 12cc 28 14 a1
                PI   $41c8               ; 12cf 28 41 c8
                LR   A,$4                ; 12d2 44
                INC                      ; 12d3 1f
                LR   $4,A                ; 12d4 54
                BT   4,A12e7             ; 12d5 84 11
                CI   $fb                 ; 12d7 25 fb
                BF   $4,A12cc            ; 12d9 94 f2
                DI                       ; 12db 1a
                LR   J,W                 ; 12dc 1e
                BF   $0,A12cc            ; 12dd 90 ee
A12df:          PI   $41c8               ; 12df 28 41 c8
                LR   A,$4                ; 12e2 44
                INC                      ; 12e3 1f
                LR   $4,A                ; 12e4 54
                BF   $4,A12df            ; 12e5 94 f9
A12e7:          DI                       ; 12e7 1a
                LR   J,W                 ; 12e8 1e
                PI   A14bc               ; 12e9 28 14 bc
A12ec:          PI   $40bc               ; 12ec 28 40 bc
                PK                       ; 12ef 0c
                
A12f0:          LR   K,P                 ; 12f0 08
                PI   $40a9               ; 12f1 28 40 a9
                DCI  A15a6               ; 12f4 2a 15 a6
                XDC                      ; 12f7 2c
                DCI  $0ffa               ; 12f8 2a 0f fa
                LIS  $4                  ; 12fb 74
                LISU 2                   ; 12fc 62
                LISL 0                   ; 12fd 68
                LR   (IS),A              ; 12fe 5c
                PI   $43cd               ; 12ff 28 43 cd
                PI   A157e               ; 1302 28 15 7e
                DCI  $0874               ; 1305 2a 08 74
                LI   $ff                 ; 1308 20 ff
                ST                       ; 130a 17
                DCI  $0878               ; 130b 2a 08 78
                ST                       ; 130e 17
                LIS  $5                  ; 130f 75
                LR   (IS),A              ; 1310 5c
                DCI  A15aa               ; 1311 2a 15 aa
                XDC                      ; 1314 2c
                DCI  $0ffb               ; 1315 2a 0f fb
                PI   $43cd               ; 1318 28 43 cd
                LI   $10                 ; 131b 20 10
                LR   (IS),A              ; 131d 5c
                DCI  $0fb1               ; 131e 2a 0f b1
                PI   $43cd               ; 1321 28 43 cd
                XDC                      ; 1324 2c
                LIS  $8                  ; 1325 78
                ADC                      ; 1326 8e
                LR   (IS),A              ; 1327 5c
                XDC                      ; 1328 2c
                PI   $43cd               ; 1329 28 43 cd
                DCI  $0fe2               ; 132c 2a 0f e2
                LIS  $0                  ; 132f 70
                XM                       ; 1330 8c
                DCI  $0877               ; 1331 2a 08 77
                BF   $4,A133b            ; 1334 94 06
                LI   $f8                 ; 1336 20 f8
                ST                       ; 1338 17
                BF   $0,A133d            ; 1339 90 03
A133b:          LIS  $7                  ; 133b 77
                ST                       ; 133c 17
A133d:          PI   $40bc               ; 133d 28 40 bc
                PK                       ; 1340 0c
                
A1341:          LR   K,P                 ; 1341 08
                PI   $40a9               ; 1342 28 40 a9
                LM                       ; 1345 16
                LR   $8,A                ; 1346 58
                PI   A1591               ; 1347 28 15 91
                LI   $c7                 ; 134a 20 c7
                NS   $5                  ; 134c f5
                LR   $5,A                ; 134d 55
                LR   A,$8                ; 134e 48
                NI   $c0                 ; 134f 21 c0
                BT   4,A1372             ; 1351 84 20
                BF   $1,A1377            ; 1353 91 23
                DCI  A16a9               ; 1355 2a 16 a9
A1358:          LI   $30                 ; 1358 20 30
                NS   $8                  ; 135a f8
                XS   $5                  ; 135b e5
                LR   $5,A                ; 135c 55
                LIS  $f                  ; 135d 7f
                NS   $8                  ; 135e f8
                LR   $2,A                ; 135f 52
                LIS  $4                  ; 1360 74
                NS   $5                  ; 1361 f5
                BT   4,A1368             ; 1362 84 05
                PI   $40bc               ; 1364 28 40 bc
                PK                       ; 1367 0c
                
A1368:          LISU 5                   ; 1368 65
                LISL 5                   ; 1369 6d
                LI   $10                 ; 136a 20 10
                LR   (IS),A              ; 136c 5c
                PI   A1434               ; 136d 28 14 34
                BF   $0,A1388            ; 1370 90 17
A1372:          DCI  A169b               ; 1372 2a 16 9b
                BF   $0,A1358            ; 1375 90 e2
A1377:          SL   1                   ; 1377 13
                BF   $1,A137f            ; 1378 91 06
                DCI  A16b9               ; 137a 2a 16 b9
                BF   $0,A1358            ; 137d 90 da
A137f:          DCI  A16c5               ; 137f 2a 16 c5
                LR   A,$5                ; 1382 45
                OI   $08                 ; 1383 22 08
                LR   $5,A                ; 1385 55
                BF   $0,A1358            ; 1386 90 d1
A1388:          DCI  $0c00               ; 1388 2a 0c 00
                LR   A,$0                ; 138b 40
                COM                      ; 138c 18
                INC                      ; 138d 1f
                AI   $03                 ; 138e 24 03
                LR   $8,A                ; 1390 58
                BT   4,A13a2             ; 1391 84 10
A1393:          LI   $54                 ; 1393 20 54
                ADC                      ; 1395 8e
                ADC                      ; 1396 8e
                DS   $8                  ; 1397 38
                BT   4,A13a2             ; 1398 84 09
                LIS  $1                  ; 139a 71
                XS   $8                  ; 139b e8
                BF   $4,A1393            ; 139c 94 f6
                LIS  $c                  ; 139e 7c
                ADC                      ; 139f 8e
                BF   $0,A1393            ; 13a0 90 f2
A13a2:          LR   A,$2                ; 13a2 42
                COM                      ; 13a3 18
                INC                      ; 13a4 1f
                AI   $0b                 ; 13a5 24 0b
                LR   $8,A                ; 13a7 58
                PI   A1427               ; 13a8 28 14 27
                PI   A1427               ; 13ab 28 14 27
                PI   A1427               ; 13ae 28 14 27
                BT   4,A13bd             ; 13b1 84 0b
                LI   $18                 ; 13b3 20 18
                ADC                      ; 13b5 8e
                DS   $8                  ; 13b6 38
                PI   A1427               ; 13b7 28 14 27
                PI   A1427               ; 13ba 28 14 27
A13bd:          PI   A14e8               ; 13bd 28 14 e8
                LIS  $8                  ; 13c0 78
                NS   $5                  ; 13c1 f5
                BT   4,A13c7             ; 13c2 84 04
                LI   $d0                 ; 13c4 20 d0
                ADC                      ; 13c6 8e
A13c7:          XDC                      ; 13c7 2c
                LIS  $8                  ; 13c8 78
                LR   $8,A                ; 13c9 58
                DCI  $0f9f               ; 13ca 2a 0f 9f
A13cd:          PI   A14ee               ; 13cd 28 14 ee
                LIS  $a                  ; 13d0 7a
                ADC                      ; 13d1 8e
                XDC                      ; 13d2 2c
                BF   $4,A13cd            ; 13d3 94 f9
                PI   $40bc               ; 13d5 28 40 bc
                PK                       ; 13d8 0c
                
A13d9:          LR   K,P                 ; 13d9 08
                PI   $40a9               ; 13da 28 40 a9
                DCI  $0c00               ; 13dd 2a 0c 00
                LIS  $3                  ; 13e0 73
                LR   $8,A                ; 13e1 58
A13e2:          LIS  $0                  ; 13e2 70
                LR   $b,A                ; 13e3 5b
A13e4:          ST                       ; 13e4 17
                DS   $b                  ; 13e5 3b
                BF   $4,A13e4            ; 13e6 94 fd
                LR   Q,DC                ; 13e8 0e
                PI   $41c8               ; 13e9 28 41 c8
                LR   DC,Q                ; 13ec 0f
                DS   $8                  ; 13ed 38
                BF   $4,A13e2            ; 13ee 94 f3
                DCI  $0c60               ; 13f0 2a 0c 60
A13f3:          LIS  $5                  ; 13f3 75
                LR   $1,A                ; 13f4 51
A13f5:          LIS  $c                  ; 13f5 7c
                LR   $0,A                ; 13f6 50
                LI   $ff                 ; 13f7 20 ff
A13f9:          ST                       ; 13f9 17
                DS   $0                  ; 13fa 30
                BF   $4,A13f9            ; 13fb 94 fd
                DS   $1                  ; 13fd 31
                BT   4,A1405             ; 13fe 84 06
                LI   $24                 ; 1400 20 24
                ADC                      ; 1402 8e
                BF   $0,A13f5            ; 1403 90 f1
A1405:          LIS  $1                  ; 1405 71
                XS   $8                  ; 1406 e8
                BF   $4,A1415            ; 1407 94 0d
                LR   $1,A                ; 1409 51
                LI   $81                 ; 140a 20 81
                NS   $6                  ; 140c f6
                BF   $1,A141b            ; 140d 91 0d
                BF   $4,A1423            ; 140f 94 13
A1411:          PI   $40bc               ; 1411 28 40 bc
                PK                       ; 1414 0c
                
A1415:          DCI  $0d8c               ; 1415 2a 0d 8c
                LR   $8,A                ; 1418 58
                BF   $0,A13f3            ; 1419 90 d9
A141b:          LI   $11                 ; 141b 20 11
A141d:          DCI  $08f5               ; 141d 2a 08 f5
                ST                       ; 1420 17
                BF   $0,A1411            ; 1421 90 ef
A1423:          LI   $15                 ; 1423 20 15
                BF   $0,A141d            ; 1425 90 f7
A1427:          BT   4,A1431             ; 1427 84 09
                DS   $8                  ; 1429 38
                BT   4,A1431             ; 142a 84 06
                LI   $18                 ; 142c 20 18
                ADC                      ; 142e 8e
                DS   $8                  ; 142f 38
                POP                      ; 1430 1c
A1431:          JMP  A13bd               ; 1431 29 13 bd
A1434:          LR   K,P                 ; 1434 08
                PI   $40a9               ; 1435 28 40 a9
                XDC                      ; 1438 2c
                DCI  $0f9f               ; 1439 2a 0f 9f
                LR   Q,DC                ; 143c 0e
                LI   $10                 ; 143d 20 10
                LR   $8,A                ; 143f 58
                LIS  $0                  ; 1440 70
A1441:          ST                       ; 1441 17
                DS   $8                  ; 1442 38
                BF   $4,A1441            ; 1443 94 fd
                LR   DC,Q                ; 1445 0f
                PI   $43cd               ; 1446 28 43 cd
                LR   DC,Q                ; 1449 0f
                LI   $30                 ; 144a 20 30
                NS   $5                  ; 144c f5
                BT   4,A1468             ; 144d 84 1a
                SL   1                   ; 144f 13
                SL   1                   ; 1450 13
                BF   $1,A1455            ; 1451 91 03
                LM                       ; 1453 16
                LM                       ; 1454 16
A1455:          LI   $80                 ; 1455 20 80
                OM                       ; 1457 8b
                LR   $8,A                ; 1458 58
                LI   $ff                 ; 1459 20 ff
                ADC                      ; 145b 8e
                LR   A,$8                ; 145c 48
                ST                       ; 145d 17
                LM                       ; 145e 16
                LI   $c0                 ; 145f 20 c0
                OM                       ; 1461 8b
                LR   $8,A                ; 1462 58
                LI   $ff                 ; 1463 20 ff
                ADC                      ; 1465 8e
                LR   A,$8                ; 1466 48
                ST                       ; 1467 17
A1468:          PI   $40bc               ; 1468 28 40 bc
                PK                       ; 146b 0c
                
A146c:          LR   K,P                 ; 146c 08
                PI   $40a9               ; 146d 28 40 a9
                DCI  $0f9f               ; 1470 2a 0f 9f
                XDC                      ; 1473 2c
                DCI  A16d5               ; 1474 2a 16 d5
                LR   A,$2                ; 1477 42
                SL   1                   ; 1478 13
                SL   1                   ; 1479 13
                AS   $2                  ; 147a c2
                ADC                      ; 147b 8e
                LIS  $5                  ; 147c 75
                LR   $8,A                ; 147d 58
A147e:          LM                       ; 147e 16
                XDC                      ; 147f 2c
                ST                       ; 1480 17
                LIS  $0                  ; 1481 70
                ST                       ; 1482 17
                XDC                      ; 1483 2c
                DS   $8                  ; 1484 38
                BF   $4,A147e            ; 1485 94 f8
                DCI  $0ec4               ; 1487 2a 0e c4
                PI   A14e8               ; 148a 28 14 e8
                XDC                      ; 148d 2c
                DCI  $0f9f               ; 148e 2a 0f 9f
                LIS  $5                  ; 1491 75
                LR   $8,A                ; 1492 58
A1493:          PI   A14ee               ; 1493 28 14 ee
                BF   $4,A149c            ; 1496 94 05
                PI   $40bc               ; 1498 28 40 bc
                PK                       ; 149b 0c
                
A149c:          LIS  $a                  ; 149c 7a
                ADC                      ; 149d 8e
                XDC                      ; 149e 2c
                BF   $0,A1493            ; 149f 90 f3
A14a1:          LR   K,P                 ; 14a1 08
                DS   $7                  ; 14a2 37
                BF   $4,A14bb            ; 14a3 94 17
                DCI  $0826               ; 14a5 2a 08 26
                LR   Q,DC                ; 14a8 0e
                LIS  $f                  ; 14a9 7f
                NM                       ; 14aa 8a
                XI   $0a                 ; 14ab 23 0a
                BT   4,A14bb             ; 14ad 84 0d
                LR   DC,Q                ; 14af 0f
                LM                       ; 14b0 16
                INC                      ; 14b1 1f
                LR   DC,Q                ; 14b2 0f
                ST                       ; 14b3 17
                DCI  $0874               ; 14b4 2a 08 74
                LIS  $6                  ; 14b7 76
                ST                       ; 14b8 17
                LIS  $4                  ; 14b9 74
                LR   $7,A                ; 14ba 57
A14bb:          PK                       ; 14bb 0c

A14bc:          DCI  $0826               ; 14bc 2a 08 26
                LIS  $0                  ; 14bf 70
                ST                       ; 14c0 17
                DCI  $0874               ; 14c1 2a 08 74
                LI   $ff                 ; 14c4 20 ff
                ST                       ; 14c6 17
                POP                      ; 14c7 1c
A14c8:          LR   K,P                 ; 14c8 08
                PI   $40a9               ; 14c9 28 40 a9
A14cc:          PI   $4361               ; 14cc 28 43 61
                LIS  $0                  ; 14cf 70
                XS   $8                  ; 14d0 e8
                BT   4,A14d8             ; 14d1 84 06
                PI   $41c8               ; 14d3 28 41 c8
                BF   $0,A14cc            ; 14d6 90 f5
A14d8:          PI   $41c8               ; 14d8 28 41 c8
                PI   $4361               ; 14db 28 43 61
                LIS  $0                  ; 14de 70
                XS   $8                  ; 14df e8
                BT   4,A14d8             ; 14e0 84 f7
                BF   $1,A14d8            ; 14e2 91 f5
                PI   $40bc               ; 14e4 28 40 bc
                PK                       ; 14e7 0c
                
A14e8:          LR   A,$1                ; 14e8 41
                AI   $ff                 ; 14e9 24 ff
                SL   1                   ; 14eb 13
                ADC                      ; 14ec 8e
                POP                      ; 14ed 1c
A14ee:          LM                       ; 14ee 16
                XDC                      ; 14ef 2c
                OM                       ; 14f0 8b
                LR   QU,A                ; 14f1 06
                XDC                      ; 14f2 2c
                LM                       ; 14f3 16
                XDC                      ; 14f4 2c
                OM                       ; 14f5 8b
                LR   QL,A                ; 14f6 07
                LI   $fe                 ; 14f7 20 fe
                ADC                      ; 14f9 8e
                LR   A,QU                ; 14fa 02
                ST                       ; 14fb 17
                LR   A,QL                ; 14fc 03
                ST                       ; 14fd 17
                DS   $8                  ; 14fe 38
                POP                      ; 14ff 1c
A1500:          LIS  $1                  ; 1500 71
                NS   $5                  ; 1501 f5
                BT   4,A150e             ; 1502 84 0b
                DCI  $0f00               ; 1504 2a 0f 00
                LR   Q,DC                ; 1507 0e
                LI   $4f                 ; 1508 20 4f
                XM                       ; 150a 8c
                BF   $4,A150f            ; 150b 94 03
                LR   $5,A                ; 150d 55
A150e:          POP                      ; 150e 1c
A150f:          LR   DC,Q                ; 150f 0f
                LM                       ; 1510 16
                INC                      ; 1511 1f
                LR   DC,Q                ; 1512 0f
                ST                       ; 1513 17
                LR   $3,A                ; 1514 53
                LISU 5                   ; 1515 65
                LISL 3                   ; 1516 6b
                LR   A,(IS)+             ; 1517 4d
                LR   QL,A                ; 1518 07
                LR   A,(IS)              ; 1519 4c
                LR   QU,A                ; 151a 06
                LR   DC,Q                ; 151b 0f
                LR   A,$2                ; 151c 42
                ST                       ; 151d 17
                LR   A,$4                ; 151e 44
                ST                       ; 151f 17
                LR   Q,DC                ; 1520 0e
                LISU 5                   ; 1521 65
                LISL 4                   ; 1522 6c
                LR   A,QU                ; 1523 02
                LR   (IS)-,A             ; 1524 5e
                LR   A,QL                ; 1525 03
                LR   (IS),A              ; 1526 5c
                POP                      ; 1527 1c
A1528:          LISU 7                   ; 1528 67
                LISL 1                   ; 1529 69
                LR   Q,DC                ; 152a 0e
                LR   A,QU                ; 152b 02
                LR   (IS)+,A             ; 152c 5d
                LR   A,QL                ; 152d 03
                LR   (IS),A              ; 152e 5c
                POP                      ; 152f 1c
A1530:          LISU 7                   ; 1530 67
                LISL 2                   ; 1531 6a
                LR   A,(IS)-             ; 1532 4e
                LR   QL,A                ; 1533 07
                LR   A,(IS)              ; 1534 4c
                LR   QU,A                ; 1535 06
                LR   DC,Q                ; 1536 0f
                POP                      ; 1537 1c
A1538:          LR   K,P                 ; 1538 08
                PI   $40a9               ; 1539 28 40 a9
                LIS  $6                  ; 153c 76
                XS   $1                  ; 153d e1
                BF   $4,A1543            ; 153e 94 04
                PI   A13d9               ; 1540 28 13 d9
A1543:          LR   A,$1                ; 1543 41
A1544:          INC                      ; 1544 1f
                LR   $1,A                ; 1545 51
                LISU 5                   ; 1546 65
                LISL 5                   ; 1547 6d
                DCI  A1639               ; 1548 2a 16 39
                LIS  $1                  ; 154b 71
                LR   (IS),A              ; 154c 5c
                PI   A1434               ; 154d 28 14 34
                DCI  $0c9c               ; 1550 2a 0c 9c
                PI   A14e8               ; 1553 28 14 e8
                XDC                      ; 1556 2c
                LIS  $2                  ; 1557 72
                LR   $8,A                ; 1558 58
                DCI  $0f9f               ; 1559 2a 0f 9f
                PI   A14ee               ; 155c 28 14 ee
                PI   $40bc               ; 155f 28 40 bc
                PK                       ; 1562 0c
                
A1563:          DCI  $0fe2               ; 1563 2a 0f e2
                LR   A,$8                ; 1566 48
                CI   $1e                 ; 1567 25 1e
                BF   $4,A157b            ; 1569 94 11
                LR   Q,DC                ; 156b 0e
                LIS  $1                  ; 156c 71
                XM                       ; 156d 8c
                LR   DC,Q                ; 156e 0f
                ST                       ; 156f 17
                DCI  $0877               ; 1570 2a 08 77
                LR   Q,DC                ; 1573 0e
                LM                       ; 1574 16
                COM                      ; 1575 18
                LR   DC,Q                ; 1576 0f
                ST                       ; 1577 17
                LIS  $0                  ; 1578 70
                COM                      ; 1579 18
                POP                      ; 157a 1c
A157b:          LIS  $0                  ; 157b 70
                XM                       ; 157c 8c
                POP                      ; 157d 1c
A157e:          LR   K,P                 ; 157e 08
                PI   $40a9               ; 157f 28 40 a9
                PI   $41c8               ; 1582 28 41 c8
                PI   $4361               ; 1585 28 43 61
                PI   $40bc               ; 1588 28 40 bc
                LIS  $0                  ; 158b 70
                XS   $8                  ; 158c e8
                BF   $4,A1590            ; 158d 94 02
                COM                      ; 158f 18
A1590:          PK                       ; 1590 0c

A1591:          LISU 4                   ; 1591 64
                LISL 4                   ; 1592 6c
                LI   $2f                 ; 1593 20 2f
                ADC                      ; 1595 8e
                LIS  $0                  ; 1596 70
                XM                       ; 1597 8c
                BF   $1,A159f            ; 1598 91 06
                LR   (IS)-,A             ; 159a 5e
                LI   $83                 ; 159b 20 83
                LR   (IS),A              ; 159d 5c
                POP                      ; 159e 1c
A159f:          SL   1                   ; 159f 13
                SR   1                   ; 15a0 12
                LR   (IS)-,A             ; 15a1 5e
                LI   $8b                 ; 15a2 20 8b
                LR   (IS),A              ; 15a4 5c
                POP                      ; 15a5 1c
A15a6:          LR   K,P                 ; 15a6 08
                LR   A,KU                ; 15a7 00
                SL   4                   ; 15a8 15
                INS  15                  ; 15a9 af
A15aa:          LR   A,KL                ; 15aa 01
                LR   DC,Q                ; 15ab 0f
                OUTS 1                   ; 15ac b1
                LR   DC,Q                ; 15ad 0f
                OUTS 1                   ; 15ae b1
                INS  11                  ; 15af ab
                LR   A,KU                ; 15b0 00
                ASD  $5                  ; 15b1 d5
                LISL 0                   ; 15b2 68
                AS   $4                  ; 15b3 c4
                db   $ef                 
                NS   $6                  ; 15b5 f6
                LR   A,KU                ; 15b6 00
                BF   $7,A1544            ; 15b7 97 8c
                LR   $7,A                ; 15b9 57
                LR   A,(IS)+             ; 15ba 4d
                XS   (IS)-               ; 15bb ee
                DS   $7                  ; 15bc 37
                DS   $7                  ; 15bd 37
                XS   $0                  ; 15be e0
                LR   A,QU                ; 15bf 02
                PK                       ; 15c0 0c
                LR   A,QU                ; 15c1 02
                PK                       ; 15c2 0c
                PK                       ; 15c3 0c
                LR   A,KL                ; 15c4 01
                LR   A,KU                ; 15c5 00
                LR   A,KL                ; 15c6 01
                SL   4                   ; 15c7 15
                LR   J,W                 ; 15c8 1e
                LR   P0,Q                ; 15c9 0d
                LR   W,J                 ; 15ca 1d
                LR   KL,A                ; 15cb 05
                LR   QL,A                ; 15cc 07
                LR   A,KL                ; 15cd 01
                LR   K,P                 ; 15ce 08
                LR   J,W                 ; 15cf 1e
                db   $2e                 
                LR   J,W                 ; 15d1 1e
                db   $2e                 
                DS   $2                  ; 15d3 32
                LR   J,W                 ; 15d4 1e
                JMP  $932f               ; 15d5 29 93 2f
                LISL 0                   ; 15d8 68
                AS   $a                  ; 15d9 ca
                INS  10                  ; 15da aa
                AS   (IS)-               ; 15db ce
                CI   $62                 ; 15dc 25 62
                AS   $a                  ; 15de ca
                LR   A,KU                ; 15df 00
                LR   A,QU                ; 15e0 02
                LR   KL,A                ; 15e1 05
A15e2:          LR   KU,A                ; 15e2 04
                LR   QU,A                ; 15e3 06
                LR   A,KL                ; 15e4 01
                LR   A,QL                ; 15e5 03
                LR   QL,A                ; 15e6 07
A15e7:          DS   $1                  ; 15e7 31
                LNK                      ; 15e8 19
                SL   1                   ; 15e9 13
                SL   1                   ; 15ea 13
                NI   $0b                 ; 15eb 21 0b
                LR   A,KU                ; 15ed 00
                LR   A,KU                ; 15ee 00
                LR   A,KU                ; 15ef 00
                LR   A,KU                ; 15f0 00
                LR   A,KU                ; 15f1 00
                LR   A,KU                ; 15f2 00
                LR   A,KU                ; 15f3 00
                SL   4                   ; 15f4 15
                LR   IS,A                ; 15f5 0b
                LR   KL,A                ; 15f6 05
                CI   $27                 ; 15f7 25 27
                LR   H,DC                ; 15f9 11
A15fa:          LR   KL,A                ; 15fa 05
                DI                       ; 15fb 1a
                LR   P,K                 ; 15fc 09
                LR   IS,A                ; 15fd 0b
                DS   $1                  ; 15fe 31
                SL   1                   ; 15ff 13
                LR   P,K                 ; 1600 09
                INC                      ; 1601 1f
                LR   A,KU                ; 1602 00
                LR   A,KU                ; 1603 00
                LR   A,KU                ; 1604 00
                AI   $00                 ; 1605 24 00
                OUT  $0b                 ; 1607 27 0b
                LR   H,DC                ; 1609 11
                LR   P,K                 ; 160a 09
                NOP                      ; 160b 2b
                LR   A,KU                ; 160c 00
                LR   H,DC                ; 160d 11
                LR   A,KU                ; 160e 00
                NI   $13                 ; 160f 21 13
                NOP                      ; 1611 2b
                EI                       ; 1612 1b
A1613:          LR   A,KU                ; 1613 00
                LR   A,KU                ; 1614 00
                DS   $4                  ; 1615 34
A1616:          LR   A,KU                ; 1616 00
                LR   P0,Q                ; 1617 0d
                LR   DC,Q                ; 1618 0f
                LR   H,DC                ; 1619 11
                NS   $2                  ; 161a f2
                SR   4                   ; 161b 14
                LM                       ; 161c 16
                NS   $0                  ; 161d f0
                NS   $0                  ; 161e f0
                COM                      ; 161f 18
                NS   $0                  ; 1620 f0
                PK                       ; 1621 0c
                LR   Q,DC                ; 1622 0e
                LR   DC,H                ; 1623 10
                SR   1                   ; 1624 12
                SL   1                   ; 1625 13
                SL   4                   ; 1626 15
                ST                       ; 1627 17
                NS   $3                  ; 1628 f3
                LR   A,IS                ; 1629 0a
                LR   IS,A                ; 162a 0b
                LNK                      ; 162b 19
                EI                       ; 162c 1b
                LR   W,J                 ; 162d 1d
                NS   $1                  ; 162e f1
                LI   $22                 ; 162f 20 22
                XI   $09                 ; 1631 23 09
                NS   $0                  ; 1633 f0
                NS   $0                  ; 1634 f0
                DI                       ; 1635 1a
                NS   $4                  ; 1636 f4
                POP                      ; 1637 1c
                LR   J,W                 ; 1638 1e
A1639:          INC                      ; 1639 1f
                NI   $0b                 ; 163a 21 0b
                DI                       ; 163c 1a
                LR   A,$9                ; 163d 49
                LISL 0                   ; 163e 68
                LR   QL,A                ; 163f 07
                LM                       ; 1640 16
                LR   A,$5                ; 1641 45
                LR   KU,A                ; 1642 04
                SL   1                   ; 1643 13
                LR   A,$2                ; 1644 42
                LISU 1                   ; 1645 61
                LR   A,KU                ; 1646 00
                LR   A,$b                ; 1647 4b
                LISL 2                   ; 1648 6a
                LR   P,K                 ; 1649 09
                COM                      ; 164a 18
                LR   A,$7                ; 164b 47
                LISU 6                   ; 164c 66
                LR   KL,A                ; 164d 05
                LR   A,$4                ; 164e 44
                LISU 3                   ; 164f 63
                BT   2,A15e2             ; 1650 82 91
                LR   A,$0                ; 1652 40
                LR   IS,A                ; 1653 0b
                DI                       ; 1654 1a
                LR   A,$9                ; 1655 49
                LISL 0                   ; 1656 68
A1657:          LR   QL,A                ; 1657 07
                LM                       ; 1658 16
                LR   A,$5                ; 1659 45
                LR   KU,A                ; 165a 04
                SL   1                   ; 165b 13
                LR   A,$2                ; 165c 42
                LISU 1                   ; 165d 61
                LR   A,KU                ; 165e 00
                LR   A,$b                ; 165f 4b
                LISL 2                   ; 1660 6a
                LR   P,K                 ; 1661 09
                COM                      ; 1662 18
                LR   A,$7                ; 1663 47
                LISU 6                   ; 1664 66
                BT   5,A16aa             ; 1665 85 44
                LISU 3                   ; 1667 63
                BT   2,A15fa             ; 1668 82 91
                AS   $0                  ; 166a c0
                LR   K,P                 ; 166b 08
                AM                       ; 166c 88
                LR   P,K                 ; 166d 09
                AMD                      ; 166e 89
                LR   A,IS                ; 166f 0a
                NM                       ; 1670 8a
A1671:          OM                       ; 1671 8b
A1672:          PK                       ; 1672 0c
A1673:          XM                       ; 1673 8c
                CM                       ; 1674 8d
                LR   Q,DC                ; 1675 0e
                LR   DC,Q                ; 1676 0f
                LR   DC,H                ; 1677 10
                LR   H,DC                ; 1678 11
                SR   1                   ; 1679 12
                SL   1                   ; 167a 13
                SR   4                   ; 167b 14
                BF   $5,A1613            ; 167c 95 96
                COM                      ; 167e 18
                BF   $9,A169b            ; 167f 99 1b
                BF   $c,A16a0            ; 1681 9c 1e
                LI   $22                 ; 1683 20 22
                AI   $26                 ; 1685 24 26
                PI   $aa2d               ; 1687 28 aa 2d
                DS   $0                  ; 168a 30
                db   $b2                 
                OUTS 5                   ; 168c b5
                DS   $9                  ; 168d 39
                DS   (IS)                ; 168e 3c
                LR   A,$0                ; 168f 40
                AS   $3                  ; 1690 c3
A1691:          AS   $7                  ; 1691 c7
                AS   (IS)                ; 1692 cc
                ASD  $0                  ; 1693 d0
                LR   $5,A                ; 1694 55
                LR   $a,A                ; 1695 5a
A1696:          db   $df                 
                LISU 5                   ; 1697 65
                XS   $b                  ; 1698 eb
                NS   $1                  ; 1699 f1
                NS   $9                  ; 169a f9
A169b:          LR   A,KU                ; 169b 00
                LR   A,KU                ; 169c 00
                INC                      ; 169d 1f
                LR   A,KU                ; 169e 00
                LR   H,DC                ; 169f 11
A16a0:          LR   A,KU                ; 16a0 00
                INC                      ; 16a1 1f
                LR   A,KU                ; 16a2 00
                db   $3f                 
                BT   0,0                 ; 16a4 80 00
                LR   A,KU                ; 16a6 00
                LR   A,KU                ; 16a7 00
                LR   A,KU                ; 16a8 00
A16a9:          LR   A,KU                ; 16a9 00
A16aa:          LR   A,KU                ; 16aa 00
                INC                      ; 16ab 1f
A16ac:          LR   A,KU                ; 16ac 00
                db   $3f                 
                BT   0,A16ce             ; 16ae 80 1f
                LR   A,KU                ; 16b0 00
                LR   A,KU                ; 16b1 00
                LR   A,KU                ; 16b2 00
                LR   A,KU                ; 16b3 00
                LR   A,KU                ; 16b4 00
                LR   A,KU                ; 16b5 00
                LR   A,KU                ; 16b6 00
                LR   A,KU                ; 16b7 00
                LR   A,KU                ; 16b8 00
A16b9:          db   $3f                 
                BT   0,A16da             ; 16ba 80 1f
                LR   A,KU                ; 16bc 00
                LR   H,DC                ; 16bd 11
A16be:          LR   A,KU                ; 16be 00
                INC                      ; 16bf 1f
                LR   A,KU                ; 16c0 00
                LR   A,KU                ; 16c1 00
                LR   A,KU                ; 16c2 00
A16c3:          LR   A,KU                ; 16c3 00
                LR   A,KU                ; 16c4 00
A16c5:          LR   A,KU                ; 16c5 00
                LR   A,KU                ; 16c6 00
                LR   A,KU                ; 16c7 00
                LR   A,KU                ; 16c8 00
A16c9:          db   $3f                 
                BT   0,0                 ; 16ca 80 00
                LR   A,KU                ; 16cc 00
                LR   A,KU                ; 16cd 00
A16ce:          LR   A,KU                ; 16ce 00
                INC                      ; 16cf 1f
                LR   A,KU                ; 16d0 00
                db   $3f                 
;                BT   0,31                ; 16d2 80 1f
				db   $80,$1f
                LR   A,KU                ; 16d4 00
A16d5:          NS   $0                  ; 16d5 f0
                BT   0,A1657             ; 16d6 80 80
A16d8:          BT   0,A16c9             ; 16d8 80 f0
A16da:          XS   $4                  ; 16da e4
A16db:          BF   $4,A1673            ; 16db 94 97
A16dd:          BF   $7,A16be            ; 16dd 97 e0
                XS   $0                  ; 16df e0
A16e0:          BF   $0,A1671            ; 16e0 90 90
                BF   $0,A16c3            ; 16e2 90 e0
                NS   $4                  ; 16e4 f4
                BT   4,A16dd             ; 16e5 84 f7
A16e7:          BT   7,A16d8             ; 16e7 87 f0
                NS   $0                  ; 16e9 f0
                BT   0,A16db             ; 16ea 80 f0
A16ec:          BT   0,A16dd             ; 16ec 80 f0
                NS   $0                  ; 16ee f0
                BT   0,A16e0             ; 16ef 80 f0
                BT   0,A1672             ; 16f1 80 80
                NS   $4                  ; 16f3 f4
A16f4:          BT   4,A16ac             ; 16f4 84 b7
A16f6:          BF   $7,A16e7            ; 16f6 97 f0
                NS   $0                  ; 16f8 f0
                BT   0,A16aa             ; 16f9 80 b0
                BF   $0,A16ec            ; 16fb 90 f0
                NS   $4                  ; 16fd f4
A16fe:          BF   $4,A16f6            ; 16fe 94 f7
A1700:          BF   $7,A1691            ; 1700 97 90
                NS   $0                  ; 1702 f0
                BF   $0,A16f4            ; 1703 90 f0
                BF   $0,A1696            ; 1705 90 90
                XS   $4                  ; 1707 e4
                BF   $4,A1700            ; 1708 94 f7
;                BF   $7,-32              ; 170a 97 e0
                db   $97,$e0
                XS   $0                  ; 170c e0
                BF   $0,A16fe            ; 170d 90 f0
;                BF   $0,-32              ; 170f 90 e0
                db   $90,$e0
A1711:          LNK                      ; 1711 19
                LI   $f1                 ; 1712 20 f1
                LI   $f1                 ; 1714 20 f1
                OI   $e2                 ; 1716 22 e2
                LI   $e2                 ; 1718 20 e2
                CI   $e2                 ; 171a 25 e2
                AI   $c4                 ; 171c 24 c4
                LI   $f1                 ; 171e 20 f1
                LI   $f1                 ; 1720 20 f1
                OI   $e2                 ; 1722 22 e2
                LI   $e2                 ; 1724 20 e2
                OUT  $e2                 ; 1726 27 e2
                CI   $c4                 ; 1728 25 c4
                LI   $f1                 ; 172a 20 f1
                LI   $f1                 ; 172c 20 f1
                DS   $0                  ; 172e 30
                XS   $2                  ; 172f e2
                JMP  $e225               ; 1730 29 e2 25
                XS   $2                  ; 1733 e2
                AI   $e2                 ; 1734 24 e2
                OI   $c4                 ; 1736 22 c4
                DCI  $f12a               ; 1738 2a f1 2a
                NS   $1                  ; 173b f1
                JMP  $e225               ; 173c 29 e2 25
                XS   $2                  ; 173f e2
                OUT  $e2                 ; 1740 27 e2
                CI   $c4                 ; 1742 25 c4
A1744:          EI                       ; 1744 1b
                LI   $d8                 ; 1745 20 d8
                LI   $d8                 ; 1747 20 d8
                LI   $e2                 ; 1749 20 e2
                OI   $f6                 ; 174b 22 f6
                AI   $d8                 ; 174d 24 d8
                AI   $e2                 ; 174f 24 e2
                OI   $f6                 ; 1751 22 f6
                AI   $e2                 ; 1753 24 e2
                CI   $f6                 ; 1755 25 f6
                OUT  $b0                 ; 1757 27 b0
                DS   $0                  ; 1759 30
                NS   $3                  ; 175a f3
                DS   $0                  ; 175b 30
                NS   $3                  ; 175c f3
                DS   $0                  ; 175d 30
                NS   $3                  ; 175e f3
                OUT  $f3                 ; 175f 27 f3
                OUT  $f3                 ; 1761 27 f3
                OUT  $f3                 ; 1763 27 f3
                AI   $f3                 ; 1765 24 f3
                AI   $f3                 ; 1767 24 f3
                AI   $f3                 ; 1769 24 f3
                LI   $f3                 ; 176b 20 f3
                LI   $f3                 ; 176d 20 f3
                LI   $f3                 ; 176f 20 f3
                OUT  $e2                 ; 1771 27 e2
                CI   $f6                 ; 1773 25 f6
                AI   $e2                 ; 1775 24 e2
                OI   $f6                 ; 1777 22 f6
                LI   $b0                 ; 1779 20 b0
                LR   A,KU                ; 177b 00
                LR   DC,H                ; 177c 10
                LR   A,KU                ; 177d 00
                PI   $0044               ; 177e 28 00 44
                LR   A,KU                ; 1781 00
                LR   A,$4                ; 1782 44
                LR   A,KU                ; 1783 00
                LR   A,$4                ; 1784 44
                LR   A,KU                ; 1785 00
                LR   A,$8                ; 1786 48
                LR   A,KU                ; 1787 00
                LR   $0,A                ; 1788 50
                LR   A,KU                ; 1789 00
                LISU 0                   ; 178a 60
                LR   A,KU                ; 178b 00
                LR   A,$0                ; 178c 40
                LR   A,KU                ; 178d 00
                AS   $0                  ; 178e c0
                LR   A,KL                ; 178f 01
                LR   A,$0                ; 1790 40
                LR   A,KU                ; 1791 00
                LR   DC,H                ; 1792 10
                LR   A,KU                ; 1793 00
                PI   $0044               ; 1794 28 00 44
                LR   A,KU                ; 1797 00
                LR   A,$4                ; 1798 44
                LR   A,KU                ; 1799 00
                LR   A,$4                ; 179a 44
                LR   A,KU                ; 179b 00
                LR   A,$8                ; 179c 48
                LR   A,KU                ; 179d 00
                LR   $0,A                ; 179e 50
                LR   A,KU                ; 179f 00
                LISU 0                   ; 17a0 60
                LR   A,KU                ; 17a1 00
                LR   A,$0                ; 17a2 40
                LR   A,KU                ; 17a3 00
                AS   $0                  ; 17a4 c0
                LR   A,KL                ; 17a5 01
                LR   A,$0                ; 17a6 40
                LR   A,KU                ; 17a7 00
                LR   DC,H                ; 17a8 10
                LR   A,KU                ; 17a9 00
                PI   $0010               ; 17aa 28 00 10
                LR   A,KU                ; 17ad 00
                PI   $0044               ; 17ae 28 00 44
                LR   A,KU                ; 17b1 00
                LR   A,$4                ; 17b2 44
                LR   A,KU                ; 17b3 00
                LR   A,$4                ; 17b4 44
                LR   A,KU                ; 17b5 00
                LR   A,$8                ; 17b6 48
                LR   A,KU                ; 17b7 00
                LR   $0,A                ; 17b8 50
                LR   A,KU                ; 17b9 00
                LISU 0                   ; 17ba 60
                LR   A,KU                ; 17bb 00
                LR   A,$0                ; 17bc 40
                LR   A,KU                ; 17bd 00
                AS   $0                  ; 17be c0
                LR   A,KL                ; 17bf 01
                LR   A,$0                ; 17c0 40
                LR   A,QU                ; 17c1 02
                LR   A,$0                ; 17c2 40
                LR   KU,A                ; 17c3 04
                XS   $0                  ; 17c4 e0
                LR   P,K                 ; 17c5 09
                LR   $0,A                ; 17c6 50
                LR   A,IS                ; 17c7 0a
                LR   A,$8                ; 17c8 48
                LR   K,P                 ; 17c9 08
                LR   A,$4                ; 17ca 44
                LR   K,P                 ; 17cb 08
                LR   A,$4                ; 17cc 44
                LR   KU,A                ; 17cd 04
                LR   A,$4                ; 17ce 44
                LR   A,QU                ; 17cf 02
                LR   A,$8                ; 17d0 48
                LR   A,KL                ; 17d1 01
                NS   $0                  ; 17d2 f0
                LR   A,KU                ; 17d3 00
                LR   A,$0                ; 17d4 40
                LR   A,KL                ; 17d5 01
                BT   0,A17d9             ; 17d6 80 02
                LR   A,$0                ; 17d8 40
A17d9:          LR   KU,A                ; 17d9 04
                AI   $08                 ; 17da 24 08
                LR   DC,H                ; 17dc 10
                LR   K,P                 ; 17dd 08
                LR   DC,H                ; 17de 10
                LR   A,KU                ; 17df 00
                LR   DC,H                ; 17e0 10
                LR   A,KU                ; 17e1 00
                AI   $00                 ; 17e2 24 00
                LR   A,$0                ; 17e4 40
                LR   A,KU                ; 17e5 00
                BT   0,A17e8             ; 17e6 80 01
A17e8:          LR   A,KU                ; 17e8 00
                LR   A,QU                ; 17e9 02
                LR   A,KU                ; 17ea 00
                LR   KU,A                ; 17eb 04
                LR   A,KU                ; 17ec 00
                LR   K,P                 ; 17ed 08
                LR   A,KU                ; 17ee 00
                NS   (IS)-               ; 17ef fe
                LR   DC,H                ; 17f0 10
                LR   DC,H                ; 17f1 10
                LR   DC,H                ; 17f2 10
                LR   DC,H                ; 17f3 10
                LR   DC,H                ; 17f4 10
                LR   DC,H                ; 17f5 10
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
