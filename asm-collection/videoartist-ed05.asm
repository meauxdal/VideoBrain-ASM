;Video Artist - ED05

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/25/2010

org $1000

				db   $aa,$55			;cart signature
				db   $04				;background color
				db   $00,$2f,$01,$1f,$0b,$13,$00,$11,$09,$07,$01,$21,$07,$00,$00	;name - VIDEO ARTIST

START:
                LIS  $0                  ; 1012 70
                OUTS 0                   ; 1013 b0
                OUTS 1                   ; 1014 b1
                LISU 2                   ; 1015 62
                LISL 6                   ; 1016 6e
                DCI  $0fe1               ; 1017 2a 0f e1
                LI   $aa                 ; 101a 20 aa
                XM                       ; 101c 8c
                BT   4,A1028             ; 101d 84 0a
                LIS  $0                  ; 101f 70
                XS   (IS)                ; 1020 ec
                BF   $1,A1028            ; 1021 91 06
                LI   $81                 ; 1023 20 81
                LR   (IS)-,A             ; 1025 5e
                LIS  $2                  ; 1026 72
                LR   (IS),A              ; 1027 5c
A1028:          PI   $22db               ; 1028 28 22 db
                DCI  $0f30               ; 102b 2a 0f 30
                LIS  $e                  ; 102e 7e
                LR   $0,A                ; 102f 50
                LIS  $0                  ; 1030 70
A1031:          ST                       ; 1031 17
                DS   $0                  ; 1032 30
                BF   $4,A1031            ; 1033 94 fd
                PI   $41d5               ; 1035 28 41 d5
                LISU 2                   ; 1038 62
                LISL 4                   ; 1039 6c
                LI   $60                 ; 103a 20 60
                LR   (IS),A              ; 103c 5c
                DCI  A1538               ; 103d 2a 15 38
                PI   $4205               ; 1040 28 42 05
                DCI  $0fe2               ; 1043 2a 0f e2
                LIS  $1                  ; 1046 71
                ST                       ; 1047 17
                DCI  $0878               ; 1048 2a 08 78
                LI   $88                 ; 104b 20 88
                ST                       ; 104d 17
A104e:          PI   $43d6               ; 104e 28 43 d6
                BT   4,A104e             ; 1051 84 fc
                BF   $1,A104e            ; 1053 91 fa
                LR   A,$8                ; 1055 48
                CI   $20                 ; 1056 25 20
                BF   $4,A106d            ; 1058 94 14
                DCI  $0f35               ; 105a 2a 0f 35
                LIS  $1                  ; 105d 71
                ST                       ; 105e 17
                ST                       ; 105f 17
                ST                       ; 1060 17
                DCI  $0fdb               ; 1061 2a 0f db
                LIS  $0                  ; 1064 70
                ST                       ; 1065 17
                LISU 2                   ; 1066 62
                LISL 5                   ; 1067 6d
                LR   A,(IS)              ; 1068 4c
                ST                       ; 1069 17
                LIS  $0                  ; 106a 70
                BF   $0,A1087            ; 106b 90 1b
A106d:          CI   $24                 ; 106d 25 24
                BF   $4,A1074            ; 106f 94 04
                LIS  $0                  ; 1071 70
                BF   $0,A1087            ; 1072 90 14
A1074:          CI   $34                 ; 1074 25 34
                BF   $4,A107b            ; 1076 94 04
                LIS  $1                  ; 1078 71
                BF   $0,A1087            ; 1079 90 0d
A107b:          CI   $32                 ; 107b 25 32
                BF   $4,A1082            ; 107d 94 04
                LIS  $2                  ; 107f 72
                BF   $0,A1087            ; 1080 90 06
A1082:          CI   $22                 ; 1082 25 22
                BF   $4,A104e            ; 1084 94 c9
                LIS  $3                  ; 1086 73
A1087:          DCI  $0f34               ; 1087 2a 0f 34
                ST                       ; 108a 17
                DCI  $0c20               ; 108b 2a 0c 20
                PI   A15a5               ; 108e 28 15 a5
                DCI  A10fc               ; 1091 2a 10 fc
                XDC                      ; 1094 2c
                DCI  $0ffa               ; 1095 2a 0f fa
                LIS  $4                  ; 1098 74
                LR   (IS),A              ; 1099 5c
                PI   $43cd               ; 109a 28 43 cd
                PI   $41c8               ; 109d 28 41 c8
                DCI  A1100               ; 10a0 2a 11 00
                XDC                      ; 10a3 2c
                DCI  $0ffb               ; 10a4 2a 0f fb
                LIS  $5                  ; 10a7 75
                LR   (IS),A              ; 10a8 5c
                PI   $43cd               ; 10a9 28 43 cd
                DCI  A1175               ; 10ac 2a 11 75
                XDC                      ; 10af 2c
                DCI  $0f43               ; 10b0 2a 0f 43
                LI   $30                 ; 10b3 20 30
                LR   (IS),A              ; 10b5 5c
                PI   $43cd               ; 10b6 28 43 cd
                PI   $41c8               ; 10b9 28 41 c8
                DCI  $0fea               ; 10bc 2a 0f ea
                LI   $65                 ; 10bf 20 65
                ST                       ; 10c1 17
                DCI  $08f7               ; 10c2 2a 08 f7
                ST                       ; 10c5 17
                DCI  $0f20               ; 10c6 2a 0f 20
                LIS  $4                  ; 10c9 74
                LR   $0,A                ; 10ca 50
                DCI  A16fc               ; 10cb 2a 16 fc
                XDC                      ; 10ce 2c
                DCI  $0f20               ; 10cf 2a 0f 20
                LISU 2                   ; 10d2 62
A10d3:          LISL 4                   ; 10d3 6c
                LIS  $1                  ; 10d4 71
                SL   4                   ; 10d5 15
                LR   (IS),A              ; 10d6 5c
                PI   $43cd               ; 10d7 28 43 cd
                DCI  $0f30               ; 10da 2a 0f 30
                LIS  $0                  ; 10dd 70
                ST                       ; 10de 17
                ST                       ; 10df 17
                ST                       ; 10e0 17
                ST                       ; 10e1 17
                DCI  $0f34               ; 10e2 2a 0f 34
                LM                       ; 10e5 16
                LR   $7,A                ; 10e6 57
A10e7:          PI   A13bd               ; 10e7 28 13 bd
                DS   $7                  ; 10ea 37
                BT   1,A10e7             ; 10eb 81 fb
                DCI  $08f5               ; 10ed 2a 08 f5
                LI   $10                 ; 10f0 20 10
                ST                       ; 10f2 17
                DCI  $0fe9               ; 10f3 2a 0f e9
                ST                       ; 10f6 17
A10f7:          PI   A11a5               ; 10f7 28 11 a5
                BF   $0,A10f7            ; 10fa 90 fc
A10fc:          LR   DC,H                ; 10fc 10
                LR   A,KU                ; 10fd 00
                LR   H,DC                ; 10fe 11
                LR   KL,A                ; 10ff 05
A1100:          LR   A,KL                ; 1100 01
                LR   DC,Q                ; 1101 0f
                LR   A,$3                ; 1102 43
                LR   DC,Q                ; 1103 0f
                LR   A,$3                ; 1104 43
                LI   $50                 ; 1105 20 50
                db   $80,$b0
;                BT   0,-80               ; 1107 80 b0
                XS   $0                  ; 1109 e0
                LR   DC,H                ; 110a 10
                LR   A,$0                ; 110b 40
                LIS  $0                  ; 110c 70
                INS  0                   ; 110d a0
                ASD  $0                  ; 110e d0
                LR   A,KU                ; 110f 00
                DS   $0                  ; 1110 30
                LISU 0                   ; 1111 60
                BF   $0,A10d3            ; 1112 90 c0
                NS   $0                  ; 1114 f0
                XDC                      ; 1115 2c
                LR   A,(IS)              ; 1116 4c
                LISL 4                   ; 1117 6c
                XM                       ; 1118 8c
                INS  12                  ; 1119 ac
                AS   (IS)+               ; 111a cd
                XS   (IS)+               ; 111b ed
                db   $2d                 
                db   $2d                 
                XS   (IS)+               ; 111e ed
                AS   (IS)-               ; 111f ce
                INS  14                  ; 1120 ae
                ADC                      ; 1121 8e
                LISL 6                   ; 1122 6e
                LR   A,(IS)-             ; 1123 4e
                db   $2e                 
                LR   A,$2                ; 1125 42
                LR   A,$2                ; 1126 42
                LR   A,$2                ; 1127 42
A1128:          LR   A,$2                ; 1128 42
                LR   A,$2                ; 1129 42
                LR   A,$2                ; 112a 42
                LR   A,$2                ; 112b 42
                LR   A,$2                ; 112c 42
                LR   A,$2                ; 112d 42
                LR   A,$2                ; 112e 42
                LR   A,$2                ; 112f 42
                LR   A,$2                ; 1130 42
                LR   A,$2                ; 1131 42
                LR   A,$2                ; 1132 42
                LR   A,$2                ; 1133 42
                LR   A,$2                ; 1134 42
                COM                      ; 1135 18
                COM                      ; 1136 18
                COM                      ; 1137 18
                COM                      ; 1138 18
                COM                      ; 1139 18
                COM                      ; 113a 18
                COM                      ; 113b 18
                COM                      ; 113c 18
                COM                      ; 113d 18
                COM                      ; 113e 18
                COM                      ; 113f 18
                COM                      ; 1140 18
                COM                      ; 1141 18
                COM                      ; 1142 18
A1143:          COM                      ; 1143 18
                COM                      ; 1144 18
                DS   (IS)                ; 1145 3c
                DS   (IS)                ; 1146 3c
                DS   (IS)                ; 1147 3c
                DS   (IS)                ; 1148 3c
                XDC                      ; 1149 2c
                XDC                      ; 114a 2c
                XDC                      ; 114b 2c
                XDC                      ; 114c 2c
                POP                      ; 114d 1c
                POP                      ; 114e 1c
                POP                      ; 114f 1c
                POP                      ; 1150 1c
                PK                       ; 1151 0c
                PK                       ; 1152 0c
                PK                       ; 1153 0c
                PK                       ; 1154 0c
                DCI  $2a2a               ; 1155 2a 2a 2a
                DCI  $5a5a               ; 1158 2a 5a 5a
                LR   $a,A                ; 115b 5a
                LR   $a,A                ; 115c 5a
                NM                       ; 115d 8a
                NM                       ; 115e 8a
                NM                       ; 115f 8a
                NM                       ; 1160 8a
                OUTS 10                  ; 1161 ba
                OUTS 10                  ; 1162 ba
                OUTS 10                  ; 1163 ba
                OUTS 10                  ; 1164 ba
                PK                       ; 1165 0c
                LR   K,P                 ; 1166 08
                LR   KU,A                ; 1167 04
                LR   A,KU                ; 1168 00
                LR   P0,Q                ; 1169 0d
                LR   P,K                 ; 116a 09
                LR   KL,A                ; 116b 05
                LR   A,KL                ; 116c 01
                LR   Q,DC                ; 116d 0e
                LR   A,IS                ; 116e 0a
                LR   QU,A                ; 116f 06
                LR   A,QU                ; 1170 02
                LR   DC,Q                ; 1171 0f
                LR   IS,A                ; 1172 0b
                LR   QL,A                ; 1173 07
                LR   A,QL                ; 1174 03
A1175:          LI   $50                 ; 1175 20 50
                BT   0,A1128             ; 1177 80 b0
                XS   $0                  ; 1179 e0
                LR   DC,H                ; 117a 10
                LR   A,$0                ; 117b 40
                LIS  $0                  ; 117c 70
                INS  0                   ; 117d a0
                ASD  $0                  ; 117e d0
                LR   A,KU                ; 117f 00
                DS   $0                  ; 1180 30
                LISU 0                   ; 1181 60
                BF   $0,A1143            ; 1182 90 c0
                NS   $0                  ; 1184 f0
                XDC                      ; 1185 2c
                LR   A,(IS)              ; 1186 4c
                LISL 4                   ; 1187 6c
                XM                       ; 1188 8c
                INS  12                  ; 1189 ac
                AS   (IS)+               ; 118a cd
                XS   (IS)+               ; 118b ed
                db   $2d                 
                db   $2d                 
                XS   (IS)+               ; 118e ed
                AS   (IS)-               ; 118f ce
                INS  14                  ; 1190 ae
                ADC                      ; 1191 8e
                LISL 6                   ; 1192 6e
                LR   A,(IS)-             ; 1193 4e
                db   $2e                 
                COM                      ; 1195 18
                COM                      ; 1196 18
                COM                      ; 1197 18
                COM                      ; 1198 18
                COM                      ; 1199 18
                COM                      ; 119a 18
                COM                      ; 119b 18
                COM                      ; 119c 18
                COM                      ; 119d 18
                COM                      ; 119e 18
                COM                      ; 119f 18
                COM                      ; 11a0 18
                COM                      ; 11a1 18
                COM                      ; 11a2 18
                COM                      ; 11a3 18
                COM                      ; 11a4 18
A11a5:          LR   K,P                 ; 11a5 08
                PI   $40a9               ; 11a6 28 40 a9
                LIS  $0                  ; 11a9 70
                LR   $7,A                ; 11aa 57
A11ab:          PI   $41c8               ; 11ab 28 41 c8
                DCI  $0f3d               ; 11ae 2a 0f 3d
                LIS  $0                  ; 11b1 70
                XM                       ; 11b2 8c
                BT   4,A11bb             ; 11b3 84 07
                LIS  $0                  ; 11b5 70
                LR   $3,A                ; 11b6 53
                LR   $4,A                ; 11b7 54
                JMP  A1259               ; 11b8 29 12 59
A11bb:          DCI  $0f35               ; 11bb 2a 0f 35
                LIS  $0                  ; 11be 70
                XM                       ; 11bf 8c
                BT   4,A11fb             ; 11c0 84 3a
                DCI  $0f3e               ; 11c2 2a 0f 3e
                LR   Q,DC                ; 11c5 0e
                LI   $ff                 ; 11c6 20 ff
                AM                       ; 11c8 88
                LR   DC,Q                ; 11c9 0f
                ST                       ; 11ca 17
                BT   1,A11f2             ; 11cb 81 26
                DCI  $0fdc               ; 11cd 2a 0f dc
                LIS  $3                  ; 11d0 73
                NM                       ; 11d1 8a
                DCI  A16f8               ; 11d2 2a 16 f8
                ADC                      ; 11d5 8e
                LM                       ; 11d6 16
                LR   DC,Q                ; 11d7 0f
                ST                       ; 11d8 17
                PI   $4795               ; 11d9 28 47 95
                DCI  $0fdc               ; 11dc 2a 0f dc
                LM                       ; 11df 16
                LR   $3,A                ; 11e0 53
                PI   $4795               ; 11e1 28 47 95
                DCI  $0fdc               ; 11e4 2a 0f dc
                LM                       ; 11e7 16
                LR   $4,A                ; 11e8 54
                DCI  $0f73               ; 11e9 2a 0f 73
                LR   A,$3                ; 11ec 43
                ST                       ; 11ed 17
                LR   A,$4                ; 11ee 44
                ST                       ; 11ef 17
                BF   $0,A1213            ; 11f0 90 22
A11f2:          DCI  $0f73               ; 11f2 2a 0f 73
                LM                       ; 11f5 16
                LR   $3,A                ; 11f6 53
                LM                       ; 11f7 16
                LR   $4,A                ; 11f8 54
                BF   $0,A1213            ; 11f9 90 19
A11fb:          DCI  A141c               ; 11fb 2a 14 1c
                LR   A,$7                ; 11fe 47
                SL   1                   ; 11ff 13
                ADC                      ; 1200 8e
                LM                       ; 1201 16
                LR   $a,A                ; 1202 5a
                PI   A170c               ; 1203 28 17 0c
                LR   $3,A                ; 1206 53
                DCI  A141c               ; 1207 2a 14 1c
                LR   A,$7                ; 120a 47
                SL   1                   ; 120b 13
                INC                      ; 120c 1f
                ADC                      ; 120d 8e
                LM                       ; 120e 16
                LR   $a,A                ; 120f 5a
                PI   A170c               ; 1210 28 17 0c
A1213:          LR   $0,A                ; 1213 50
                PI   $13fc               ; 1214 28 13 fc
                LR   $4,A                ; 1217 54
                LR   A,$3                ; 1218 43
                LR   $0,A                ; 1219 50
                PI   $13fc               ; 121a 28 13 fc
                LR   $3,A                ; 121d 53
                PI   $41c8               ; 121e 28 41 c8
                LIS  $0                  ; 1221 70
                XS   $3                  ; 1222 e3
                BF   $4,A1236            ; 1223 94 12
                XS   $4                  ; 1225 e4
                BT   1,A122a             ; 1226 81 03
                COM                      ; 1228 18
                INC                      ; 1229 1f
A122a:          CI   $02                 ; 122a 25 02
                BF   $4,A1259            ; 122c 94 2c
A122e:          LR   A,$4                ; 122e 44
                LR   $0,A                ; 122f 50
                PI   A159c               ; 1230 28 15 9c
                LR   $4,A                ; 1233 54
                BF   $0,A1259            ; 1234 90 24
A1236:          BT   1,A123a             ; 1236 81 03
                COM                      ; 1238 18
                INC                      ; 1239 1f
A123a:          SR   1                   ; 123a 12
                BT   4,A1259             ; 123b 84 1d
                LIS  $0                  ; 123d 70
                XS   $4                  ; 123e e4
                BF   $4,A1249            ; 123f 94 09
                LR   A,$3                ; 1241 43
                LR   $0,A                ; 1242 50
                PI   A159c               ; 1243 28 15 9c
                LR   $3,A                ; 1246 53
                BF   $0,A1259            ; 1247 90 11
A1249:          CI   $02                 ; 1249 25 02
                BF   $4,A1255            ; 124b 94 09
A124d:          LR   A,$3                ; 124d 43
                LR   $0,A                ; 124e 50
                PI   A159c               ; 124f 28 15 9c
                LR   $3,A                ; 1252 53
                BF   $0,A122e            ; 1253 90 da
A1255:          CI   $fe                 ; 1255 25 fe
                BT   4,A124d             ; 1257 84 f5
A1259:          DCI  $0f37               ; 1259 2a 0f 37
                LIS  $0                  ; 125c 70
                XM                       ; 125d 8c
                BT   4,A1269             ; 125e 84 0a
                LIS  $0                  ; 1260 70
                XS   $7                  ; 1261 e7
                BF   $4,A1269            ; 1262 94 06
                PI   A1630               ; 1264 28 16 30
                BF   $0,A1279            ; 1267 90 11
A1269:          DCI  $0f34               ; 1269 2a 0f 34
                LM                       ; 126c 16
                DCI  A1598               ; 126d 2a 15 98
                ADC                      ; 1270 8e
                LM                       ; 1271 16
                LR   $0,A                ; 1272 50
A1273:          PI   $41c8               ; 1273 28 41 c8
                DS   $0                  ; 1276 30
                BF   $4,A1273            ; 1277 94 fb
A1279:          LIS  $0                  ; 1279 70
                XS   $3                  ; 127a e3
                BT   4,A12f6             ; 127b 84 7a
                DCI  $0f20               ; 127d 2a 0f 20
                LR   A,$7                ; 1280 47
                SL   1                   ; 1281 13
                AS   $7                  ; 1282 c7
                ADC                      ; 1283 8e
                LM                       ; 1284 16
                LR   $1,A                ; 1285 51
                LISU 2                   ; 1286 62
                LISL 0                   ; 1287 68
                LIS  $0                  ; 1288 70
                LR   (IS)+,A             ; 1289 5d
                LM                       ; 128a 16
                LR   (IS)+,A             ; 128b 5d
                LM                       ; 128c 16
                LR   (IS),A              ; 128d 5c
                LIS  $0                  ; 128e 70
                XS   $3                  ; 128f e3
                BF   $1,A12af            ; 1290 91 1e
A1292:          PI   $27d3               ; 1292 28 27 d3
                LIS  $7                  ; 1295 77
                XS   $1                  ; 1296 e1
                BF   $4,A12e1            ; 1297 94 49
                LISL 2                   ; 1299 6a
                XS   (IS)                ; 129a ec
                BT   4,A12e1             ; 129b 84 45
                DCI  $0f36               ; 129d 2a 0f 36
                LIS  $0                  ; 12a0 70
                XM                       ; 12a1 8c
                BT   4,A12ab             ; 12a2 84 08
                LR   A,(IS)-             ; 12a4 4e
                LR   (IS)+,A             ; 12a5 5d
                LIS  $0                  ; 12a6 70
                LR   (IS),A              ; 12a7 5c
                LR   $1,A                ; 12a8 51
                BF   $0,A12e1            ; 12a9 90 37
A12ab:          LIS  $0                  ; 12ab 70
                LR   $3,A                ; 12ac 53
                BF   $0,A12f6            ; 12ad 90 48
A12af:          PI   $27c6               ; 12af 28 27 c6
                LIS  $0                  ; 12b2 70
                XS   $1                  ; 12b3 e1
                BF   $4,A12c7            ; 12b4 94 12
                LISL 0                   ; 12b6 68
                XS   (IS)                ; 12b7 ec
                BT   4,A12c7             ; 12b8 84 0e
                DCI  $0f36               ; 12ba 2a 0f 36
                LIS  $0                  ; 12bd 70
                XM                       ; 12be 8c
                BT   4,A12ab             ; 12bf 84 eb
                LIS  $7                  ; 12c1 77
                LR   $1,A                ; 12c2 51
                LR   A,(IS)+             ; 12c3 4d
                LR   (IS)-,A             ; 12c4 5e
                LIS  $0                  ; 12c5 70
                LR   (IS),A              ; 12c6 5c
A12c7:          LR   A,$3                ; 12c7 43
                CI   $fe                 ; 12c8 25 fe
                BF   $4,A12d1            ; 12ca 94 06
                INC                      ; 12cc 1f
                LR   $3,A                ; 12cd 53
                LISL 2                   ; 12ce 6a
                BF   $0,A12af            ; 12cf 90 df
A12d1:          LISL 0                   ; 12d1 68
                LIS  $0                  ; 12d2 70
                XS   (IS)                ; 12d3 ec
                BT   4,A12f6             ; 12d4 84 21
                LISL 1                   ; 12d6 69
                LR   A,(IS)+             ; 12d7 4d
                LR   (IS),A              ; 12d8 5c
                LISL 0                   ; 12d9 68
                LR   A,(IS)+             ; 12da 4d
                LR   (IS)-,A             ; 12db 5e
                LIS  $0                  ; 12dc 70
                LR   (IS),A              ; 12dd 5c
                DS   $1                  ; 12de 31
                BF   $0,A12f6            ; 12df 90 16
A12e1:          LR   A,$3                ; 12e1 43
                SR   1                   ; 12e2 12
                BT   4,A12e9             ; 12e3 84 05
                LR   $3,A                ; 12e5 53
                LISL 2                   ; 12e6 6a
                BF   $0,A1292            ; 12e7 90 aa
A12e9:          LISL 1                   ; 12e9 69
                LIS  $0                  ; 12ea 70
                XS   (IS)                ; 12eb ec
                BF   $4,A12f6            ; 12ec 94 09
                LISL 2                   ; 12ee 6a
                LR   A,(IS)-             ; 12ef 4e
                LR   (IS)+,A             ; 12f0 5d
                LIS  $0                  ; 12f1 70
                LR   (IS)-,A             ; 12f2 5e
                LIS  $1                  ; 12f3 71
                AS   $1                  ; 12f4 c1
                LR   $1,A                ; 12f5 51
A12f6:          LIS  $0                  ; 12f6 70
                XS   $4                  ; 12f7 e4
                BT   4,A131e             ; 12f8 84 25
                DCI  $0f2c               ; 12fa 2a 0f 2c
                LR   A,$7                ; 12fd 47
                ADC                      ; 12fe 8e
                LR   A,$4                ; 12ff 44
                AM                       ; 1300 88
                DCI  $0f36               ; 1301 2a 0f 36
                BT   1,A130e             ; 1304 81 09
                LIS  $0                  ; 1306 70
                XM                       ; 1307 8c
                BT   4,A1319             ; 1308 84 10
                LI   $5f                 ; 130a 20 5f
                BF   $0,A131d            ; 130c 90 10
A130e:          CI   $5f                 ; 130e 25 5f
                BT   2,A131d             ; 1310 82 0c
                LIS  $0                  ; 1312 70
                XM                       ; 1313 8c
                BT   4,A1319             ; 1314 84 04
                LIS  $0                  ; 1316 70
                BF   $0,A131d            ; 1317 90 05
A1319:          LIS  $0                  ; 1319 70
                LR   $4,A                ; 131a 54
                BF   $0,A131e            ; 131b 90 02
A131d:          LR   $2,A                ; 131d 52
A131e:          LR   A,$4                ; 131e 44
                SL   1                   ; 131f 13
                XS   $3                  ; 1320 e3
                BT   4,A1350             ; 1321 84 2e
                DCI  $0f39               ; 1323 2a 0f 39
                LR   A,$7                ; 1326 47
                ADC                      ; 1327 8e
                LIS  $0                  ; 1328 70
                XM                       ; 1329 8c
                BT   4,A132f             ; 132a 84 04
                PI   A13bd               ; 132c 28 13 bd
A132f:          LIS  $0                  ; 132f 70
                XS   $4                  ; 1330 e4
                BT   4,A133e             ; 1331 84 0c
                DCI  $0f2c               ; 1333 2a 0f 2c
                LR   A,$7                ; 1336 47
                ADC                      ; 1337 8e
                LR   A,$2                ; 1338 42
                ST                       ; 1339 17
                LIS  $0                  ; 133a 70
                XS   $3                  ; 133b e3
                BT   4,A134d             ; 133c 84 10
A133e:          DCI  $0f20               ; 133e 2a 0f 20
                LR   A,$7                ; 1341 47
                SL   1                   ; 1342 13
                AS   $7                  ; 1343 c7
                ADC                      ; 1344 8e
                LR   A,$1                ; 1345 41
                ST                       ; 1346 17
                LISU 2                   ; 1347 62
                LISL 1                   ; 1348 69
                LR   A,(IS)+             ; 1349 4d
                ST                       ; 134a 17
                LR   A,(IS)              ; 134b 4c
                ST                       ; 134c 17
A134d:          PI   A13bd               ; 134d 28 13 bd
A1350:          LIS  $0                  ; 1350 70
                OUTS 1                   ; 1351 b1
                DCI  A1424               ; 1352 2a 14 24
                LR   A,$7                ; 1355 47
                ADC                      ; 1356 8e
                INS  1                   ; 1357 a1
                NM                       ; 1358 8a
                DCI  $0f30               ; 1359 2a 0f 30
                LR   A,$7                ; 135c 47
                ADC                      ; 135d 8e
                LIS  $0                  ; 135e 70
                BF   $4,A13a9            ; 135f 94 49
                ST                       ; 1361 17
A1362:          LR   A,$7                ; 1362 47
                INC                      ; 1363 1f
                DCI  $0f34               ; 1364 2a 0f 34
                CM                       ; 1367 8d
                BT   2,A136b             ; 1368 82 02
                LIS  $0                  ; 136a 70
A136b:          LR   $7,A                ; 136b 57
                PI   $4361               ; 136c 28 43 61
                BF   $4,A1381            ; 136f 94 11
                LIS  $0                  ; 1371 70
                XS   $8                  ; 1372 e8
                DCI  $0fe3               ; 1373 2a 0f e3
                BT   4,A1397             ; 1376 84 20
                LR   Q,DC                ; 1378 0e
                XM                       ; 1379 8c
                BF   $4,A1394            ; 137a 94 19
                LR   DC,Q                ; 137c 0f
                LIS  $1                  ; 137d 71
                ST                       ; 137e 17
                LISL 4                   ; 137f 6c
                LR   (IS),A              ; 1380 5c
A1381:          PI   $41c8               ; 1381 28 41 c8
                LR   A,$8                ; 1384 48
                SL   1                   ; 1385 13
                LR   $8,A                ; 1386 58
                DS   $8                  ; 1387 38
                DCI  A1428               ; 1388 2a 14 28
                LIS  $9                  ; 138b 79
                LR   (IS),A              ; 138c 5c
                LR   A,$8                ; 138d 48
A138e:          CM                       ; 138e 8d
                BT   4,A139a             ; 138f 84 0a
                DS   (IS)                ; 1391 3c
                BF   $4,A138e            ; 1392 94 fb
A1394:          JMP  A11ab               ; 1394 29 11 ab
A1397:          ST                       ; 1397 17
                BF   $0,A1394            ; 1398 90 fb
A139a:          DCI  A1431               ; 139a 2a 14 31
                DS   (IS)                ; 139d 3c
                LR   A,(IS)              ; 139e 4c
                SL   1                   ; 139f 13
                ADC                      ; 13a0 8e
                LM                       ; 13a1 16
                LR   QU,A                ; 13a2 06
                LM                       ; 13a3 16
                LR   QL,A                ; 13a4 07
                LR   P0,Q                ; 13a5 0d
                JMP  A11ab               ; 13a6 29 11 ab
A13a9:          LR   Q,DC                ; 13a9 0e
                XM                       ; 13aa 8c
                BF   $4,A1362            ; 13ab 94 b6
                LIS  $1                  ; 13ad 71
                LR   DC,Q                ; 13ae 0f
                ST                       ; 13af 17
                DCI  $0f39               ; 13b0 2a 0f 39
                LR   A,$7                ; 13b3 47
                ADC                      ; 13b4 8e
                LR   Q,DC                ; 13b5 0e
                LIS  $1                  ; 13b6 71
                XM                       ; 13b7 8c
                LR   DC,Q                ; 13b8 0f
                ST                       ; 13b9 17
                JMP  A11ab               ; 13ba 29 11 ab
A13bd:          LR   K,P                 ; 13bd 08
                LISU 3                   ; 13be 63
                LISL 0                   ; 13bf 68
                DCI  $0f20               ; 13c0 2a 0f 20
                LR   A,$7                ; 13c3 47
                SL   1                   ; 13c4 13
                AS   $7                  ; 13c5 c7
                ADC                      ; 13c6 8e
                LM                       ; 13c7 16
                LR   (IS)+,A             ; 13c8 5d
                LM                       ; 13c9 16
                LR   (IS)+,A             ; 13ca 5d
                LM                       ; 13cb 16
                LR   (IS)+,A             ; 13cc 5d
                DCI  $0f2c               ; 13cd 2a 0f 2c
                LR   A,$7                ; 13d0 47
                ADC                      ; 13d1 8e
                LM                       ; 13d2 16
                LR   (IS),A              ; 13d3 5c
                LISL 0                   ; 13d4 68
                DCI  A13f4               ; 13d5 2a 13 f4
                LIS  $e                  ; 13d8 7e
                NS   (IS)                ; 13d9 fc
                ADC                      ; 13da 8e
                LM                       ; 13db 16
                LR   QU,A                ; 13dc 06
                LM                       ; 13dd 16
                LR   QL,A                ; 13de 07
                LR   DC,Q                ; 13df 0f
                LIS  $1                  ; 13e0 71
                NS   (IS)                ; 13e1 fc
                ADC                      ; 13e2 8e
                LISL 3                   ; 13e3 6b
                LR   A,(IS)              ; 13e4 4c
                ADC                      ; 13e5 8e
                ADC                      ; 13e6 8e
                LISL 1                   ; 13e7 69
                LIS  $1                  ; 13e8 71
                LR   $8,A                ; 13e9 58
A13ea:          LR   A,(IS)              ; 13ea 4c
                LR   Q,DC                ; 13eb 0e
                XM                       ; 13ec 8c
                LR   DC,Q                ; 13ed 0f
                ST                       ; 13ee 17
                LM                       ; 13ef 16
                DS   $8                  ; 13f0 38
                BF   $4,A13ea            ; 13f1 94 f8
                PK                       ; 13f3 0c
                
A13f4:          LR   Q,DC                ; 13f4 0e
                LISU 0                   ; 13f5 60
                LR   P0,Q                ; 13f6 0d
                INS  0                   ; 13f7 a0
                PK                       ; 13f8 0c
                
                XS   $0                  ; 13f9 e0
                PK                       ; 13fa 0c
                
                LI   $08                 ; 13fb 20 08
                LR   A,$0                ; 13fd 40
                CI   $28                 ; 13fe 25 28
                BF   $2,A1406            ; 1400 92 05
                LI   $fe                 ; 1402 20 fe
                BF   $0,A141b            ; 1404 90 16
A1406:          CI   $50                 ; 1406 25 50
                BF   $2,A140e            ; 1408 92 05
                LI   $ff                 ; 140a 20 ff
                BF   $0,A141b            ; 140c 90 0e
A140e:          CI   $78                 ; 140e 25 78
                BF   $2,A1415            ; 1410 92 04
                LIS  $0                  ; 1412 70
                BF   $0,A141b            ; 1413 90 07
A1415:          CI   $a0                 ; 1415 25 a0
                LIS  $1                  ; 1417 71
                BT   2,A141b             ; 1418 82 02
                INC                      ; 141a 1f
A141b:          PK                       ; 141b 0c

A141c:          LR   A,KL                ; 141c 01
                LR   A,KU                ; 141d 00
                LR   A,QL                ; 141e 03
                LR   A,QU                ; 141f 02
                LR   KL,A                ; 1420 05
                LR   KU,A                ; 1421 04
                LR   QL,A                ; 1422 07
                LR   QU,A                ; 1423 06
A1424:          LR   A,KL                ; 1424 01
                LR   A,QU                ; 1425 02
                LR   KU,A                ; 1426 04
                LR   K,P                 ; 1427 08
A1428:          LR   P0,Q                ; 1428 0d
                JMP  $1d2f               ; 1429 29 1d 2f
                DS   (IS)+               ; 142c 3d
                DS   $1                  ; 142d 31
                DS   $3                  ; 142e 33
                OUT  $19                 ; 142f 27 19
A1431:          SR   4                   ; 1431 14
                LR   A,$3                ; 1432 43
                SR   4                   ; 1433 14
                LR   A,$8                ; 1434 48
                SR   4                   ; 1435 14
                BT   1,A144b             ; 1436 81 14
                BF   $e,A144d            ; 1438 9e 14
                LIS  $c                  ; 143a 7c
                SR   4                   ; 143b 14
                LR   (IS)+,A             ; 143c 5d
                SR   4                   ; 143d 14
                LIS  $7                  ; 143e 77
                SR   4                   ; 143f 14
                LR   $8,A                ; 1440 58
                SR   4                   ; 1441 14
                OUTS 10                  ; 1442 ba
                DCI  $0f3d               ; 1443 2a 0f 3d
                BF   $0,A144b            ; 1446 90 04
                DCI  $0f36               ; 1448 2a 0f 36
A144b:          LR   Q,DC                ; 144b 0e
                LIS  $1                  ; 144c 71
A144d:          XM                       ; 144d 8c
                LR   DC,Q                ; 144e 0f
                ST                       ; 144f 17
A1450:          JMP  A11ab               ; 1450 29 11 ab
                DCI  $0fe2               ; 1453 2a 0f e2
                BF   $0,A144b            ; 1456 90 f4
                DCI  $0f37               ; 1458 2a 0f 37
                BF   $0,A144b            ; 145b 90 ef
                DCI  $0fe9               ; 145d 2a 0f e9
A1460:          LR   Q,DC                ; 1460 0e
                LIS  $1                  ; 1461 71
                AM                       ; 1462 88
                LR   DC,Q                ; 1463 0f
                ST                       ; 1464 17
                DCI  $0f38               ; 1465 2a 0f 38
                LM                       ; 1468 16
                DCI  $08f2               ; 1469 2a 08 f2
                ST                       ; 146c 17
                DCI  $0fe9               ; 146d 2a 0f e9
                LM                       ; 1470 16
                DCI  $08f5               ; 1471 2a 08 f5
                ST                       ; 1474 17
                BF   $0,A1450            ; 1475 90 da
                DCI  $0f38               ; 1477 2a 0f 38
                BF   $0,A1460            ; 147a 90 e5
                PI   A15a5               ; 147c 28 15 a5
                BF   $0,A1450            ; 147f 90 d0
                DCI  $0f34               ; 1481 2a 0f 34
                LM                       ; 1484 16
                LR   $5,A                ; 1485 55
A1486:          PI   A14d2               ; 1486 28 14 d2
                PI   A14e4               ; 1489 28 14 e4
                LI   $30                 ; 148c 20 30
                LR   $6,A                ; 148e 56
A148f:          LR   DC,Q                ; 148f 0f
                LM                       ; 1490 16
                COM                      ; 1491 18
                LR   DC,Q                ; 1492 0f
                ST                       ; 1493 17
                LR   Q,DC                ; 1494 0e
                DS   $6                  ; 1495 36
                BF   $4,A148f            ; 1496 94 f8
                DS   $5                  ; 1498 35
                BT   1,A1486             ; 1499 81 ec
                JMP  A1450               ; 149b 29 14 50
                DCI  $0f34               ; 149e 2a 0f 34
                LM                       ; 14a1 16
                LR   $5,A                ; 14a2 55
A14a3:          PI   A14d2               ; 14a3 28 14 d2
                PI   A14e4               ; 14a6 28 14 e4
                LR   A,$0                ; 14a9 40
                DCI  $0f53               ; 14aa 2a 0f 53
                ADC                      ; 14ad 8e
                LR   Q,DC                ; 14ae 0e
                LI   $20                 ; 14af 20 20
                AM                       ; 14b1 88
                LR   DC,Q                ; 14b2 0f
                ST                       ; 14b3 17
                DS   $5                  ; 14b4 35
                BT   1,A14a3             ; 14b5 81 ed
                JMP  A1450               ; 14b7 29 14 50
A14ba:          LIS  $1                  ; 14ba 71
                LR   $0,A                ; 14bb 50
                LIS  $f                  ; 14bc 7f
                LR   $5,A                ; 14bd 55
                DCI  $0f43               ; 14be 2a 0f 43
A14c1:          LR   Q,DC                ; 14c1 0e
                LM                       ; 14c2 16
                INC                      ; 14c3 1f
                INC                      ; 14c4 1f
                LR   DC,Q                ; 14c5 0f
                ST                       ; 14c6 17
                DS   $5                  ; 14c7 35
                BT   1,A14c1             ; 14c8 81 f8
A14ca:          PI   $41c8               ; 14ca 28 41 c8
                DS   $0                  ; 14cd 30
                BF   $4,A14ca            ; 14ce 94 fb
                BF   $0,A14ba            ; 14d0 90 e9
A14d2:          LR   K,P                 ; 14d2 08
                DCI  $0f20               ; 14d3 2a 0f 20
                LR   A,$5                ; 14d6 45
                SL   1                   ; 14d7 13
                AS   $5                  ; 14d8 c5
                ADC                      ; 14d9 8e
                LM                       ; 14da 16
                LR   $1,A                ; 14db 51
                DCI  $0f2c               ; 14dc 2a 0f 2c
                LR   A,$5                ; 14df 45
                ADC                      ; 14e0 8e
                LM                       ; 14e1 16
                LR   $2,A                ; 14e2 52
                PK                       ; 14e3 0c
                
A14e4:          LR   K,P                 ; 14e4 08
                LIS  $0                  ; 14e5 70
                LR   $0,A                ; 14e6 50
A14e7:          LR   A,$2                ; 14e7 42
                AI   $e8                 ; 14e8 24 e8
                LR   $2,A                ; 14ea 52
                BF   $1,A14f2            ; 14eb 91 06
                LR   A,$0                ; 14ed 40
                INC                      ; 14ee 1f
                LR   $0,A                ; 14ef 50
                BF   $0,A14e7            ; 14f0 90 f6
A14f2:          LIS  $6                  ; 14f2 76
                NS   $1                  ; 14f3 f1
                SL   1                   ; 14f4 13
                AS   $0                  ; 14f5 c0
                LR   $0,A                ; 14f6 50
                DCI  A1508               ; 14f7 2a 15 08
                SL   1                   ; 14fa 13
                ADC                      ; 14fb 8e
                LM                       ; 14fc 16
                LR   QU,A                ; 14fd 06
                LM                       ; 14fe 16
                LR   QL,A                ; 14ff 07
                DCI  A1528               ; 1500 2a 15 28
                LR   A,$0                ; 1503 40
                ADC                      ; 1504 8e
                LM                       ; 1505 16
                LR   $0,A                ; 1506 50
                PK                       ; 1507 0c
                
A1508:          LR   Q,DC                ; 1508 0e
                LISU 0                   ; 1509 60
                LR   Q,DC                ; 150a 0e
                BF   $0,A151a            ; 150b 90 0e
                AS   $0                  ; 150d c0
                LR   Q,DC                ; 150e 0e
                NS   $0                  ; 150f f0
                LR   P0,Q                ; 1510 0d
                INS  0                   ; 1511 a0
                LR   P0,Q                ; 1512 0d
                ASD  $0                  ; 1513 d0
                LR   Q,DC                ; 1514 0e
                LR   A,KU                ; 1515 00
                LR   Q,DC                ; 1516 0e
                DS   $0                  ; 1517 30
                PK                       ; 1518 0c
                
                XS   $0                  ; 1519 e0
A151a:          LR   P0,Q                ; 151a 0d
                LR   DC,H                ; 151b 10
                LR   P0,Q                ; 151c 0d
                LR   A,$0                ; 151d 40
                LR   P0,Q                ; 151e 0d
                LIS  $0                  ; 151f 70
                PK                       ; 1520 0c
                
                LI   $0c                 ; 1521 20 0c
                LR   $0,A                ; 1523 50
                PK                       ; 1524 0c
                
                BT   0,A1532             ; 1525 80 0c
                OUTS 0                   ; 1527 b0
A1528:          PK                       ; 1528 0c

                LR   P0,Q                ; 1529 0d
                LR   Q,DC                ; 152a 0e
                LR   DC,Q                ; 152b 0f
                LR   K,P                 ; 152c 08
                LR   P,K                 ; 152d 09
                LR   A,IS                ; 152e 0a
                LR   IS,A                ; 152f 0b
                LR   KU,A                ; 1530 04
                LR   KL,A                ; 1531 05
A1532:          LR   QU,A                ; 1532 06
                LR   QL,A                ; 1533 07
                LR   A,KU                ; 1534 00
                LR   A,KL                ; 1535 01
                LR   A,QU                ; 1536 02
                LR   A,QL                ; 1537 03
A1538:          DS   $1                  ; 1538 31
                LNK                      ; 1539 19
                SL   1                   ; 153a 13
                SL   1                   ; 153b 13
                NI   $0b                 ; 153c 21 0b
                LR   A,KU                ; 153e 00
                LR   A,KU                ; 153f 00
                LR   A,KU                ; 1540 00
                LR   A,KU                ; 1541 00
                LR   A,KU                ; 1542 00
                LR   A,KU                ; 1543 00
                LR   A,KU                ; 1544 00
                SL   4                   ; 1545 15
                LR   IS,A                ; 1546 0b
                LR   KL,A                ; 1547 05
                INC                      ; 1548 1f
                LR   IS,A                ; 1549 0b
                NI   $01                 ; 154a 21 01
                EI                       ; 154c 1b
                NOP                      ; 154d 2b
                LR   A,KU                ; 154e 00
                AI   $00                 ; 154f 24 00
                LR   A,KU                ; 1551 00
                LR   A,KU                ; 1552 00
                LR   A,KU                ; 1553 00
                LR   A,KU                ; 1554 00
                LR   A,KU                ; 1555 00
                AI   $00                 ; 1556 24 00
                INC                      ; 1558 1f
                LR   IS,A                ; 1559 0b
                NI   $01                 ; 155a 21 01
                EI                       ; 155c 1b
                NOP                      ; 155d 2b
                LR   A,KU                ; 155e 00
                DS   $4                  ; 155f 34
                LR   A,KU                ; 1560 00
                LR   A,KU                ; 1561 00
                LR   A,KU                ; 1562 00
                LR   A,KU                ; 1563 00
                LR   A,KU                ; 1564 00
                LR   A,KU                ; 1565 00
                DS   $4                  ; 1566 34
                LR   A,KU                ; 1567 00
                INC                      ; 1568 1f
                LR   IS,A                ; 1569 0b
                NI   $01                 ; 156a 21 01
                EI                       ; 156c 1b
                NOP                      ; 156d 2b
                LR   A,KU                ; 156e 00
                DS   $2                  ; 156f 32
                LR   A,KU                ; 1570 00
                LR   A,KU                ; 1571 00
                LR   A,KU                ; 1572 00
                LR   A,KU                ; 1573 00
                LR   A,KU                ; 1574 00
                LR   A,KU                ; 1575 00
                DS   $2                  ; 1576 32
                LR   A,KU                ; 1577 00
                INC                      ; 1578 1f
                LR   IS,A                ; 1579 0b
                NI   $01                 ; 157a 21 01
                EI                       ; 157c 1b
                NOP                      ; 157d 2b
                LR   A,KU                ; 157e 00
                OI   $00                 ; 157f 22 00
                LR   A,KU                ; 1581 00
                LR   A,KU                ; 1582 00
                LR   A,KU                ; 1583 00
                LR   A,KU                ; 1584 00
                LR   A,KU                ; 1585 00
                OI   $00                 ; 1586 22 00
                db   $2d                 
                LR   P,K                 ; 1589 09
                LR   H,DC                ; 158a 11
                LR   A,KL                ; 158b 01
                NOP                      ; 158c 2b
                LR   A,KU                ; 158d 00
                INC                      ; 158e 1f
                LR   IS,A                ; 158f 0b
                NI   $01                 ; 1590 21 01
                EI                       ; 1592 1b
                NOP                      ; 1593 2b
                LR   A,KU                ; 1594 00
                LR   A,KU                ; 1595 00
                LI   $00                 ; 1596 20 00
A1598:          PK                       ; 1598 0c

                LR   QU,A                ; 1599 06
                LR   KU,A                ; 159a 04
                LR   A,QL                ; 159b 03
A159c:          LR   K,P                 ; 159c 08
                LI   $80                 ; 159d 20 80
                NS   $0                  ; 159f f0
                LR   $8,A                ; 15a0 58
                LR   A,$0                ; 15a1 40
                SR   1                   ; 15a2 12
                XS   $8                  ; 15a3 e8
                PK                       ; 15a4 0c
                
A15a5:          LR   K,P                 ; 15a5 08
                PI   $40a9               ; 15a6 28 40 a9
                PI   A16c9               ; 15a9 28 16 c9
                DCI  $0c20               ; 15ac 2a 0c 20
A15af:          LIS  $0                  ; 15af 70
                ST                       ; 15b0 17
                LR   H,DC                ; 15b1 11
                LIS  $f                  ; 15b2 7f
                XS   $a                  ; 15b3 ea
                BF   $4,A15af            ; 15b4 94 fa
                LI   $20                 ; 15b6 20 20
                XS   $b                  ; 15b8 eb
                BF   $4,A15af            ; 15b9 94 f5
                PI   A16e6               ; 15bb 28 16 e6
                JMP  $41cc               ; 15be 29 41 cc
A15c1:          LR   K,P                 ; 15c1 08
                DCI  A15d8               ; 15c2 2a 15 d8
                LIS  $f                  ; 15c5 7f
                NS   $8                  ; 15c6 f8
                ADC                      ; 15c7 8e
                LM                       ; 15c8 16
                SL   4                   ; 15c9 15
                LISU 5                   ; 15ca 65
                LISL 0                   ; 15cb 68
                LR   (IS),A              ; 15cc 5c
                DCI  A15d8               ; 15cd 2a 15 d8
                LR   A,$8                ; 15d0 48
                SR   4                   ; 15d1 14
                ADC                      ; 15d2 8e
                LM                       ; 15d3 16
                XS   (IS)                ; 15d4 ec
                LR   (IS),A              ; 15d5 5c
                LR   $8,A                ; 15d6 58
                PK                       ; 15d7 0c
                
A15d8:          LR   A,KU                ; 15d8 00
                LR   K,P                 ; 15d9 08
                LR   KU,A                ; 15da 04
                PK                       ; 15db 0c
                
                LR   A,QU                ; 15dc 02
                LR   A,IS                ; 15dd 0a
                LR   QU,A                ; 15de 06
                LR   Q,DC                ; 15df 0e
                LR   A,KL                ; 15e0 01
                LR   P,K                 ; 15e1 09
                LR   KL,A                ; 15e2 05
                LR   P0,Q                ; 15e3 0d
                LR   A,QL                ; 15e4 03
                LR   IS,A                ; 15e5 0b
                LR   QL,A                ; 15e6 07
                LR   DC,Q                ; 15e7 0f
                LR   $0,A                ; 15e8 50
                LR   A,IS                ; 15e9 0a
                LISU 3                   ; 15ea 63
                LISL 0                   ; 15eb 68
                LR   (IS)+,A             ; 15ec 5d
                LR   A,$a                ; 15ed 4a
                LR   (IS)+,A             ; 15ee 5d
                LR   A,$b                ; 15ef 4b
                LR   (IS)+,A             ; 15f0 5d
                LR   A,$9                ; 15f1 49
                LR   (IS)+,A             ; 15f2 5d
                LR   A,QU                ; 15f3 02
                LR   (IS)+,A             ; 15f4 5d
                LR   A,QL                ; 15f5 03
                LR   (IS)+,A             ; 15f6 5d
                LR   Q,DC                ; 15f7 0e
                XDC                      ; 15f8 2c
                LR   H,DC                ; 15f9 11
                DCI  $0f3f               ; 15fa 2a 0f 3f
                LR   A,$a                ; 15fd 4a
                ST                       ; 15fe 17
                LR   A,$b                ; 15ff 4b
                ST                       ; 1600 17
                LR   A,KU                ; 1601 00
                ST                       ; 1602 17
                LR   A,KL                ; 1603 01
                ST                       ; 1604 17
                LR   K,P                 ; 1605 08
                LR   J,W                 ; 1606 1e
                PI   $40a9               ; 1607 28 40 a9
                PI   $424d               ; 160a 28 42 4d
                PI   $40bc               ; 160d 28 40 bc
                LR   P,K                 ; 1610 09
                DCI  $0f3f               ; 1611 2a 0f 3f
                LM                       ; 1614 16
                LR   $a,A                ; 1615 5a
                LM                       ; 1616 16
                LR   $b,A                ; 1617 5b
                LM                       ; 1618 16
                LR   KU,A                ; 1619 04
                LM                       ; 161a 16
                LR   KL,A                ; 161b 05
                LR   DC,H                ; 161c 10
                XDC                      ; 161d 2c
                LR   DC,Q                ; 161e 0f
                LISU 3                   ; 161f 63
                LISL 5                   ; 1620 6d
                LR   A,(IS)-             ; 1621 4e
                LR   QL,A                ; 1622 07
                LR   A,(IS)-             ; 1623 4e
                LR   QU,A                ; 1624 06
                LR   A,(IS)-             ; 1625 4e
                LR   $9,A                ; 1626 59
                LR   A,(IS)-             ; 1627 4e
                LR   $b,A                ; 1628 5b
                LR   A,(IS)-             ; 1629 4e
                LR   $a,A                ; 162a 5a
                LR   A,(IS)              ; 162b 4c
                LR   IS,A                ; 162c 0b
                LR   A,$0                ; 162d 40
                EI                       ; 162e 1b
                POP                      ; 162f 1c
A1630:          LR   K,P                 ; 1630 08
                PI   $40a9               ; 1631 28 40 a9
                PI   A16c9               ; 1634 28 16 c9
                DCI  $0c21               ; 1637 2a 0c 21
                LR   H,DC                ; 163a 11
                DCI  $0e60               ; 163b 2a 0e 60
                LR   Q,DC                ; 163e 0e
                LIS  $2                  ; 163f 72
                LR   $6,A                ; 1640 56
A1641:          LI   $60                 ; 1641 20 60
                LR   $5,A                ; 1643 55
A1644:          LM                       ; 1644 16
                LR   $8,A                ; 1645 58
                PI   A15c1               ; 1646 28 15 c1
                LR   DC,H                ; 1649 10
                OM                       ; 164a 8b
                LR   $8,A                ; 164b 58
                LR   DC,H                ; 164c 10
                ST                       ; 164d 17
                LI   $fe                 ; 164e 20 fe
                ADC                      ; 1650 8e
                LR   H,DC                ; 1651 11
                PI   A15c1               ; 1652 28 15 c1
                LR   DC,Q                ; 1655 0f
                ST                       ; 1656 17
                LR   Q,DC                ; 1657 0e
                LM                       ; 1658 16
                LR   $8,A                ; 1659 58
                PI   A15c1               ; 165a 28 15 c1
                LR   DC,H                ; 165d 10
                OM                       ; 165e 8b
                LR   $8,A                ; 165f 58
                LR   DC,H                ; 1660 10
                ST                       ; 1661 17
                LIS  $2                  ; 1662 72
                ADC                      ; 1663 8e
                LR   H,DC                ; 1664 11
                PI   A15c1               ; 1665 28 15 c1
                LR   DC,Q                ; 1668 0f
                ST                       ; 1669 17
                LR   Q,DC                ; 166a 0e
                DS   $5                  ; 166b 35
                BF   $4,A1644            ; 166c 94 d7
                DS   $6                  ; 166e 36
                BT   4,A167b             ; 166f 84 0b
                DCI  $0ce1               ; 1671 2a 0c e1
                LR   H,DC                ; 1674 11
                DCI  $0da0               ; 1675 2a 0d a0
                LR   Q,DC                ; 1678 0e
                BF   $0,A1641            ; 1679 90 c7
A167b:          DCI  $0f1e               ; 167b 2a 0f 1e
                XDC                      ; 167e 2c
                DCI  $0e60               ; 167f 2a 0e 60
                PI   A16ad               ; 1682 28 16 ad
                DCI  $0e5e               ; 1685 2a 0e 5e
                XDC                      ; 1688 2c
                DCI  $0da0               ; 1689 2a 0d a0
                PI   A16ad               ; 168c 28 16 ad
                DCI  $0d9e               ; 168f 2a 0d 9e
                XDC                      ; 1692 2c
                DCI  $0ce0               ; 1693 2a 0c e0
                PI   A16ad               ; 1696 28 16 ad
                DCI  $0cde               ; 1699 2a 0c de
                XDC                      ; 169c 2c
                DCI  $0c20               ; 169d 2a 0c 20
                PI   A16ad               ; 16a0 28 16 ad
                PI   A16e6               ; 16a3 28 16 e6
                PI   $41c8               ; 16a6 28 41 c8
                PI   $40bc               ; 16a9 28 40 bc
                PK                       ; 16ac 0c
                
A16ad:          LR   K,P                 ; 16ad 08
                LI   $30                 ; 16ae 20 30
                LR   $6,A                ; 16b0 56
A16b1:          LIS  $2                  ; 16b1 72
                LR   $5,A                ; 16b2 55
A16b3:          LR   Q,DC                ; 16b3 0e
                LM                       ; 16b4 16
                XDC                      ; 16b5 2c
                LR   H,DC                ; 16b6 11
                OM                       ; 16b7 8b
                LR   DC,H                ; 16b8 10
                ST                       ; 16b9 17
                XDC                      ; 16ba 2c
                LR   DC,Q                ; 16bb 0f
                ST                       ; 16bc 17
                DS   $5                  ; 16bd 35
                BF   $4,A16b3            ; 16be 94 f4
                XDC                      ; 16c0 2c
                LI   $fc                 ; 16c1 20 fc
                ADC                      ; 16c3 8e
                XDC                      ; 16c4 2c
                DS   $6                  ; 16c5 36
                BF   $4,A16b1            ; 16c6 94 ea
                PK                       ; 16c8 0c
                
A16c9:          LI   $15                 ; 16c9 20 15
                OUTS 12                  ; 16cb bc
                LI   $e8                 ; 16cc 20 e8
                OUTS 13                  ; 16ce bd
                DCI  $08f0               ; 16cf 2a 08 f0
                LI   $f5                 ; 16d2 20 f5
                ST                       ; 16d4 17
                DCI  $0fea               ; 16d5 2a 0f ea
                LR   Q,DC                ; 16d8 0e
                LIS  $8                  ; 16d9 78
                OM                       ; 16da 8b
                LR   DC,Q                ; 16db 0f
                ST                       ; 16dc 17
                DCI  $08f7               ; 16dd 2a 08 f7
                ST                       ; 16e0 17
                LIS  $1                  ; 16e1 71
                OUTS 14                  ; 16e2 be
                EI                       ; 16e3 1b
                LR   J,W                 ; 16e4 1e
                POP                      ; 16e5 1c
A16e6:          DI                       ; 16e6 1a
                LR   J,W                 ; 16e7 1e
                DCI  $0fea               ; 16e8 2a 0f ea
                LR   Q,DC                ; 16eb 0e
                LIS  $8                  ; 16ec 78
                COM                      ; 16ed 18
                NM                       ; 16ee 8a
                LR   DC,Q                ; 16ef 0f
                ST                       ; 16f0 17
                DCI  $08f7               ; 16f1 2a 08 f7
                ST                       ; 16f4 17
                LIS  $0                  ; 16f5 70
                OUTS 14                  ; 16f6 be
                POP                      ; 16f7 1c
A16f8:          LI   $1c                 ; 16f8 20 1c
                COM                      ; 16fa 18
                SR   4                   ; 16fb 14
A16fc:          LR   A,KU                ; 16fc 00
                LR   K,P                 ; 16fd 08
                LR   A,KU                ; 16fe 00
                LR   QL,A                ; 16ff 07
                LR   A,KL                ; 1700 01
                LR   A,KU                ; 1701 00
                LR   A,KU                ; 1702 00
                LR   K,P                 ; 1703 08
                LR   A,KU                ; 1704 00
                LR   QL,A                ; 1705 07
                LR   A,KL                ; 1706 01
                LR   A,KU                ; 1707 00
                LR   A,KU                ; 1708 00
                LR   A,KU                ; 1709 00
                db   $5f                 
                db   $5f                 
A170c:          LR   K,P                 ; 170c 08
                PI   $40a9               ; 170d 28 40 a9
                LR   A,$a                ; 1710 4a
                LISU 2                   ; 1711 62
                LISL 0                   ; 1712 68
                LR   (IS)+,A             ; 1713 5d
                LIS  $1                  ; 1714 71
A1715:          DS   $a                  ; 1715 3a
                BF   $1,A171b            ; 1716 91 04
                SL   1                   ; 1718 13
                BF   $0,A1715            ; 1719 90 fb
A171b:          OUTS 0                   ; 171b b0
                LIS  $8                  ; 171c 78
                SL   4                   ; 171d 15
                DCI  $0fde               ; 171e 2a 0f de
                LR   H,DC                ; 1721 11
                DI                       ; 1722 1a
                OM                       ; 1723 8b
                LR   DC,H                ; 1724 10
                ST                       ; 1725 17
                LR   $8,A                ; 1726 58
                DCI  $08fb               ; 1727 2a 08 fb
                LR   Q,DC                ; 172a 0e
                LM                       ; 172b 16
                LR   (IS),A              ; 172c 5c
A172d:          LR   DC,Q                ; 172d 0f
                CM                       ; 172e 8d
                BT   4,A172d             ; 172f 84 fd
                LR   A,$8                ; 1731 48
                OUTS 1                   ; 1732 b1
                LR   A,(IS)              ; 1733 4c
                INC                      ; 1734 1f
                LR   (IS),A              ; 1735 5c
                JMP  $21d5               ; 1736 29 21 d5
                LR   A,KU                ; 1739 00
                LR   A,KU                ; 173a 00
                LR   A,KU                ; 173b 00
                LR   A,KU                ; 173c 00
                LR   A,KU                ; 173d 00
                LR   A,KU                ; 173e 00
                LR   A,KU                ; 173f 00
                LR   A,KU                ; 1740 00
                LR   A,KU                ; 1741 00
                LR   A,KU                ; 1742 00
                LR   A,KU                ; 1743 00
                LR   A,KU                ; 1744 00
                LR   A,KU                ; 1745 00
                LR   A,KU                ; 1746 00
                LR   A,KU                ; 1747 00
                LR   A,KU                ; 1748 00
                LR   A,KU                ; 1749 00
                LR   A,KU                ; 174a 00
                LR   A,KU                ; 174b 00
                LR   A,KU                ; 174c 00
                LR   A,KU                ; 174d 00
                LR   A,KU                ; 174e 00
                LR   A,KU                ; 174f 00
                LR   A,KU                ; 1750 00
                LR   A,KU                ; 1751 00
                LR   A,KU                ; 1752 00
                LR   A,KU                ; 1753 00
                LR   A,KU                ; 1754 00
                LR   A,KU                ; 1755 00
                LR   A,KU                ; 1756 00
                LR   A,KU                ; 1757 00
                LR   A,KU                ; 1758 00
                LR   A,KU                ; 1759 00
                LR   A,KU                ; 175a 00
                LR   A,KU                ; 175b 00
                LR   A,KU                ; 175c 00
                LR   A,KU                ; 175d 00
                LR   A,KU                ; 175e 00
                LR   A,KU                ; 175f 00
                LR   A,KU                ; 1760 00
                LR   A,KU                ; 1761 00
                LR   A,KU                ; 1762 00
                LR   A,KU                ; 1763 00
                LR   A,KU                ; 1764 00
                LR   A,KU                ; 1765 00
                LR   A,KU                ; 1766 00
                LR   A,KU                ; 1767 00
                LR   A,KU                ; 1768 00
                LR   A,KU                ; 1769 00
                LR   A,KU                ; 176a 00
                LR   A,KU                ; 176b 00
                LR   A,KU                ; 176c 00
                LR   A,KU                ; 176d 00
                LR   A,KU                ; 176e 00
                LR   A,KU                ; 176f 00
                LR   A,KU                ; 1770 00
                LR   A,KU                ; 1771 00
                LR   A,KU                ; 1772 00
                LR   A,KU                ; 1773 00
                LR   A,KU                ; 1774 00
                LR   A,KU                ; 1775 00
                LR   A,KU                ; 1776 00
                LR   A,KU                ; 1777 00
                LR   A,KU                ; 1778 00
                LR   A,KU                ; 1779 00
                LR   A,KU                ; 177a 00
                LR   A,KU                ; 177b 00
                LR   A,KU                ; 177c 00
                LR   A,KU                ; 177d 00
                LR   A,KU                ; 177e 00
                LR   A,KU                ; 177f 00
                LR   A,KU                ; 1780 00
                LR   A,KU                ; 1781 00
                LR   A,KU                ; 1782 00
                LR   A,KU                ; 1783 00
                LR   A,KU                ; 1784 00
                LR   A,KU                ; 1785 00
                LR   A,KU                ; 1786 00
                LR   A,KU                ; 1787 00
                LR   A,KU                ; 1788 00
                LR   A,KU                ; 1789 00
                LR   A,KU                ; 178a 00
                LR   A,KU                ; 178b 00
                LR   A,KU                ; 178c 00
                LR   A,KU                ; 178d 00
                LR   A,KU                ; 178e 00
                LR   A,KU                ; 178f 00
                LR   A,KU                ; 1790 00
                LR   A,KU                ; 1791 00
                LR   A,KU                ; 1792 00
                LR   A,KU                ; 1793 00
                LR   A,KU                ; 1794 00
                LR   A,KU                ; 1795 00
                LR   A,KU                ; 1796 00
                LR   A,KU                ; 1797 00
                LR   A,KU                ; 1798 00
                LR   A,KU                ; 1799 00
                LR   A,KU                ; 179a 00
                LR   A,KU                ; 179b 00
                LR   A,KU                ; 179c 00
                LR   A,KU                ; 179d 00
                LR   A,KU                ; 179e 00
                LR   A,KU                ; 179f 00
                LR   A,KU                ; 17a0 00
                LR   A,KU                ; 17a1 00
                LR   A,KU                ; 17a2 00
                LR   A,KU                ; 17a3 00
                LR   A,KU                ; 17a4 00
                LR   A,KU                ; 17a5 00
                LR   A,KU                ; 17a6 00
                LR   A,KU                ; 17a7 00
                LR   A,KU                ; 17a8 00
                LR   A,KU                ; 17a9 00
                LR   A,KU                ; 17aa 00
                LR   A,KU                ; 17ab 00
                LR   A,KU                ; 17ac 00
                LR   A,KU                ; 17ad 00
                LR   A,KU                ; 17ae 00
                LR   A,KU                ; 17af 00
                LR   A,KU                ; 17b0 00
                LR   A,KU                ; 17b1 00
                LR   A,KU                ; 17b2 00
                LR   A,KU                ; 17b3 00
                LR   A,KU                ; 17b4 00
                LR   A,KU                ; 17b5 00
                LR   A,KU                ; 17b6 00
                LR   A,KU                ; 17b7 00
                LR   A,KU                ; 17b8 00
                LR   A,KU                ; 17b9 00
                LR   A,KU                ; 17ba 00
                LR   A,KU                ; 17bb 00
                LR   A,KU                ; 17bc 00
                LR   A,KU                ; 17bd 00
                LR   A,KU                ; 17be 00
                LR   A,KU                ; 17bf 00
                LR   A,KU                ; 17c0 00
                LR   A,KU                ; 17c1 00
                LR   A,KU                ; 17c2 00
                LR   A,KU                ; 17c3 00
                LR   A,KU                ; 17c4 00
                LR   A,KU                ; 17c5 00
                LR   A,KU                ; 17c6 00
                LR   A,KU                ; 17c7 00
                LR   A,KU                ; 17c8 00
                LR   A,KU                ; 17c9 00
                LR   A,KU                ; 17ca 00
                LR   A,KU                ; 17cb 00
                LR   A,KU                ; 17cc 00
                LR   A,KU                ; 17cd 00
                LR   A,KU                ; 17ce 00
                LR   A,KU                ; 17cf 00
                LR   A,KU                ; 17d0 00
                LR   A,KU                ; 17d1 00
                LR   A,KU                ; 17d2 00
                LR   A,KU                ; 17d3 00
                LR   A,KU                ; 17d4 00
                LR   A,KU                ; 17d5 00
                LR   A,KU                ; 17d6 00
                LR   A,KU                ; 17d7 00
                LR   A,KU                ; 17d8 00
                LR   A,KU                ; 17d9 00
                LR   A,KU                ; 17da 00
                LR   A,KU                ; 17db 00
                LR   A,KU                ; 17dc 00
                LR   A,KU                ; 17dd 00
                LR   A,KU                ; 17de 00
                LR   A,KU                ; 17df 00
                LR   A,KU                ; 17e0 00
                LR   A,KU                ; 17e1 00
                LR   A,KU                ; 17e2 00
                LR   A,KU                ; 17e3 00
                LR   A,KU                ; 17e4 00
                LR   A,KU                ; 17e5 00
                LR   A,KU                ; 17e6 00
                LR   A,KU                ; 17e7 00
                LIS  $0                  ; 17e8 70
                LIS  $3                  ; 17e9 73
                LR   DC,Q                ; 17ea 0f
                LIS  $a                  ; 17eb 7a
                LIS  $3                  ; 17ec 73
                LR   DC,Q                ; 17ed 0f
                LISL 0                   ; 17ee 68
                db   $ff                 
                OUTS 11                  ; 17f0 bb
                NS   $b                  ; 17f1 fb
                LISU 7                   ; 17f2 67
                db   $2d                 
                LIS  $8                  ; 17f4 78
                LISU 3                   ; 17f5 63
                db   $2d                 
                LIS  $8                  ; 17f7 78
                LR   DC,H                ; 17f8 10
                LR   K,P                 ; 17f9 08
                COM                      ; 17fa 18
                LR   A,KU                ; 17fb 00
                PI   $0808               ; 17fc 28 08 08
                db   $20
