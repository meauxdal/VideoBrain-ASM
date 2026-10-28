;Pinball - EN02

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/29/2010

org $1000

				db   $aa,$55			;cart signature
				db   $01				;background color
				db   $00,$00,$00,$00,$25,$01,$2b,$2d,$11,$27,$27,$00,$00,$00,$00	;name - PINBALL

START:          DI                       ; 1012 1a         
                LR   J,W                 ; 1013 1e
                PI   $45db               ; 1014 28 45 db
                PI   $41c8               ; 1017 28 41 c8
                DCI  A144a               ; 101a 2a 14 4a
                LI   $20                 ; 101d 20 20
                LISU 2                   ; 101f 62
A1020:          LISL 4                   ; 1020 6c
                LR   (IS),A              ; 1021 5c
                PI   $4205               ; 1022 28 42 05
                LI   $40                 ; 1025 20 40
                DCI  $0fdf               ; 1027 2a 0f df
                ST                       ; 102a 17
                LISL 4                   ; 102b 6c
                LIS  $c                  ; 102c 7c
                LR   (IS),A              ; 102d 5c
                DCI  A146a               ; 102e 2a 14 6a
                PI   $4205               ; 1031 28 42 05
                LI   $36                 ; 1034 20 36
                DCI  $0fdf               ; 1036 2a 0f df
                ST                       ; 1039 17
                LI   $ff                 ; 103a 20 ff
                LR   $7,A                ; 103c 57
                LIS  $0                  ; 103d 70
                LR   $5,A                ; 103e 55
                LR   $6,A                ; 103f 56
A1040:          LIS  $0                  ; 1040 70
                DCI  $0fe2               ; 1041 2a 0f e2
                ST                       ; 1044 17
                PI   A1369               ; 1045 28 13 69
                LIS  $a                  ; 1048 7a
                LR   $1,A                ; 1049 51
                LR   A,$8                ; 104a 48
                INC                      ; 104b 1f
                LR   $8,A                ; 104c 58
                DCI  $245e               ; 104d 2a 24 5e
                CI   $40                 ; 1050 25 40
                BT   4,A1073             ; 1052 84 20
A1054:          CM                       ; 1054 8d
                BT   4,A105c             ; 1055 84 06
                DS   $1                  ; 1057 31
                BF   $4,A1054            ; 1058 94 fb
                BF   $0,A1040            ; 105a 90 e5
A105c:          PI   $40d9               ; 105c 28 40 d9
                PI   $412d               ; 105f 28 41 2d
                LR   A,$7                ; 1062 47
                INC                      ; 1063 1f
                LR   $7,A                ; 1064 57
                CI   $02                 ; 1065 25 02
                BT   4,A1076             ; 1067 84 0e
                ADC                      ; 1069 8e
                DCI  $0f98               ; 106a 2a 0f 98
                LR   A,$7                ; 106d 47
                ADC                      ; 106e 8e
                LR   A,$1                ; 106f 41
                ST                       ; 1070 17
                BF   $0,A1040            ; 1071 90 ce
A1073:          LR   A,$7                ; 1073 47
                INC                      ; 1074 1f
                LR   $7,A                ; 1075 57
A1076:          LIS  $0                  ; 1076 70
                LR   $1,A                ; 1077 51
                LR   $2,A                ; 1078 52
                LIS  $3                  ; 1079 73
                LR   $4,A                ; 107a 54
A107b:          DS   $4                  ; 107b 34
                DS   $7                  ; 107c 37
                BF   $1,A1098            ; 107d 91 1a
                LR   A,$7                ; 107f 47
                DCI  $0f98               ; 1080 2a 0f 98
                ADC                      ; 1083 8e
                LM                       ; 1084 16
                LR   $5,A                ; 1085 55
                DCI  A17f5               ; 1086 2a 17 f5
                LR   A,$4                ; 1089 44
                ADC                      ; 108a 8e
                LM                       ; 108b 16
                LR   $6,A                ; 108c 56
A108d:          DS   $5                  ; 108d 35
                BT   4,A107b             ; 108e 84 ec
                LR   A,$1                ; 1090 41
                AS   $6                  ; 1091 c6
                LR   $1,A                ; 1092 51
                LR   A,$2                ; 1093 42
                LNK                      ; 1094 19
                LR   $2,A                ; 1095 52
                BF   $0,A108d            ; 1096 90 f6
A1098:          LISU 3                   ; 1098 63
                LISL 2                   ; 1099 6a
                LIS  $6                  ; 109a 76
                LR   (IS),A              ; 109b 5c
                DS   $1                  ; 109c 31
                BF   $1,A1040            ; 109d 91 a2
                LR   A,$1                ; 109f 41
                LISL 4                   ; 10a0 6c
                LR   (IS)-,A             ; 10a1 5e
                LIS  $7                  ; 10a2 77
                LR   (IS)+,A             ; 10a3 5d
                LIS  $0                  ; 10a4 70
                OUTS 0                   ; 10a5 b0
                OUTS 1                   ; 10a6 b1
                DCI  $0fdd               ; 10a7 2a 0f dd
                ST                       ; 10aa 17
                ST                       ; 10ab 17
                DCI  $0fda               ; 10ac 2a 0f da
                ST                       ; 10af 17
                LI   $11                 ; 10b0 20 11
                OUTS 12                  ; 10b2 bc
                LI   $a1                 ; 10b3 20 a1
                OUTS 13                  ; 10b5 bd
                LI   $ff                 ; 10b6 20 ff
                DCI  $08f0               ; 10b8 2a 08 f0
                ST                       ; 10bb 17
                LIS  $1                  ; 10bc 71
                OUTS 14                  ; 10bd be
                LI   $4c                 ; 10be 20 4c
                DCI  $0fea               ; 10c0 2a 0f ea
                ST                       ; 10c3 17
                DCI  $08f7               ; 10c4 2a 08 f7
                ST                       ; 10c7 17
                EI                       ; 10c8 1b
                LR   J,W                 ; 10c9 1e
                LIS  $2                  ; 10ca 72
                LR   $2,A                ; 10cb 52
                DCI  $0c50               ; 10cc 2a 0c 50
A10cf:          LI   $9c                 ; 10cf 20 9c
                LR   $1,A                ; 10d1 51
                LIS  $0                  ; 10d2 70
A10d3:          ST                       ; 10d3 17
                DS   $1                  ; 10d4 31
                BF   $4,A10d3            ; 10d5 94 fd
                DS   $2                  ; 10d7 32
                BF   $4,A10cf            ; 10d8 94 f6
                DCI  $0d11               ; 10da 2a 0d 11
                LI   $ff                 ; 10dd 20 ff
                ST                       ; 10df 17
                DCI  $0f3f               ; 10e0 2a 0f 3f
                XDC                      ; 10e3 2c
                LIS  $a                  ; 10e4 7a
                LR   $1,A                ; 10e5 51
                DCI  $1440               ; 10e6 2a 14 40
A10e9:          LM                       ; 10e9 16
                LR   Q,DC                ; 10ea 0e
                DCI  $2010               ; 10eb 2a 20 10
                ADC                      ; 10ee 8e
                SL   1                   ; 10ef 13
                ADC                      ; 10f0 8e
                ADC                      ; 10f1 8e
                ADC                      ; 10f2 8e
                LIS  $7                  ; 10f3 77
                LR   $7,A                ; 10f4 57
                PI   A113d               ; 10f5 28 11 3d
                DS   $1                  ; 10f8 31
                LR   DC,Q                ; 10f9 0f
                BF   $4,A10e9            ; 10fa 94 ee
                DCI  $0c5c               ; 10fc 2a 0c 5c
                XDC                      ; 10ff 2c
                DCI  A16ec               ; 1100 2a 16 ec
                LISU 2                   ; 1103 62
                LISL 0                   ; 1104 68
                LIS  $0                  ; 1105 70
                LR   (IS)+,A             ; 1106 5d
                LR   (IS)+,A             ; 1107 5d
                LI   $28                 ; 1108 20 28
                LR   (IS),A              ; 110a 5c
                PI   $4686               ; 110b 28 46 86
                DCI  $0c84               ; 110e 2a 0c 84
                XDC                      ; 1111 2c
                DCI  A16df               ; 1112 2a 16 df
                LISL 0                   ; 1115 68
                LIS  $1                  ; 1116 71
                LR   (IS)+,A             ; 1117 5d
                LR   (IS)+,A             ; 1118 5d
                LIS  $7                  ; 1119 77
                LR   (IS),A              ; 111a 5c
                PI   $4686               ; 111b 28 46 86
                DCI  $0c85               ; 111e 2a 0c 85
                XDC                      ; 1121 2c
                DCI  A16de               ; 1122 2a 16 de
                LIS  $7                  ; 1125 77
                LR   (IS),A              ; 1126 5c
                PI   $4686               ; 1127 28 46 86
                DCI  $0ce8               ; 112a 2a 0c e8
                XDC                      ; 112d 2c
                DCI  A17c1               ; 112e 2a 17 c1
                LI   $24                 ; 1131 20 24
                LR   $7,A                ; 1133 57
                PI   A113d               ; 1134 28 11 3d
                LI   $10                 ; 1137 20 10
                LR   $7,A                ; 1139 57
                JMP  A1298               ; 113a 29 12 98
A113d:          LR   K,P                 ; 113d 08
A113e:          LM                       ; 113e 16
                XDC                      ; 113f 2c
                ST                       ; 1140 17
                XDC                      ; 1141 2c
                DS   $7                  ; 1142 37
                BF   $4,A113e            ; 1143 94 fa
                PK                       ; 1145 0c
A1146:          DCI  $0d8a               ; 1146 2a 0d 8a
                LIS  $0                  ; 1149 70
                XM                       ; 114a 8c
                DCI  A1747               ; 114b 2a 17 47
                BF   $4,A1153            ; 114e 94 04
                DCI  A174e               ; 1150 2a 17 4e
A1153:          LR   H,DC                ; 1153 11
A1154:          LR   DC,H                ; 1154 10
                LM                       ; 1155 16
                CI   $ff                 ; 1156 25 ff
                BF   $4,A115d            ; 1158 94 04
                JMP  A1529               ; 115a 29 15 29
A115d:          LR   QU,A                ; 115d 06
                LM                       ; 115e 16
                LR   QL,A                ; 115f 07
                LM                       ; 1160 16
                LR   $0,A                ; 1161 50
                LR   H,DC                ; 1162 11
                PI   A126d               ; 1163 28 12 6d
A1166:          LR   DC,Q                ; 1166 0f
                LM                       ; 1167 16
                LR   $4,A                ; 1168 54
                LR   Q,DC                ; 1169 0e
                PI   A1230               ; 116a 28 12 30
                XS   $4                  ; 116d e4
                LR   DC,Q                ; 116e 0f
                LM                       ; 116f 16
                LR   Q,DC                ; 1170 0e
                BF   $1,A1182            ; 1171 91 10
A1173:          LIS  $0                  ; 1173 70
                XS   $4                  ; 1174 e4
                BT   1,A1166             ; 1175 81 f0
                XDC                      ; 1177 2c
                LI   $fc                 ; 1178 20 fc
                ADC                      ; 117a 8e
                LR   A,$1                ; 117b 41
                ST                       ; 117c 17
                LM                       ; 117d 16
                LR   A,$2                ; 117e 42
                ST                       ; 117f 17
                BF   $0,A1154            ; 1180 90 d3
A1182:          CI   $03                 ; 1182 25 03
                BT   4,A1198             ; 1184 84 13
                CI   $04                 ; 1186 25 04
                BT   4,A119b             ; 1188 84 12
                CI   $01                 ; 118a 25 01
                BT   4,A119e             ; 118c 84 11
                DCI  A169a               ; 118e 2a 16 9a
                ADC                      ; 1191 8e
                ADC                      ; 1192 8e
                LM                       ; 1193 16
                LR   QU,A                ; 1194 06
                LM                       ; 1195 16
                LR   QL,A                ; 1196 07
                LR   P0,Q                ; 1197 0d
A1198:          JMP  A14dd               ; 1198 29 14 dd
A119b:          JMP  A150a               ; 119b 29 15 0a
A119e:          JMP  A1610               ; 119e 29 16 10
                LR   $3,A                ; 11a1 53
                LR   A,IS                ; 11a2 0a
                LISU 4                   ; 11a3 64
                LISL 0                   ; 11a4 68
                LR   (IS)+,A             ; 11a5 5d
                LR   A,QU                ; 11a6 02
                LR   (IS)+,A             ; 11a7 5d
                LR   A,QL                ; 11a8 03
                LR   (IS)+,A             ; 11a9 5d
                LR   A,$9                ; 11aa 49
                LR   (IS)+,A             ; 11ab 5d
                XDC                      ; 11ac 2c
                LR   Q,DC                ; 11ad 0e
                DCI  $0fb0               ; 11ae 2a 0f b0
                LISU 2                   ; 11b1 62
                LISL 0                   ; 11b2 68
                LR   A,(IS)+             ; 11b3 4d
                ST                       ; 11b4 17
                LR   A,(IS)+             ; 11b5 4d
                ST                       ; 11b6 17
                LR   A,(IS)+             ; 11b7 4d
                ST                       ; 11b8 17
                LR   A,(IS)+             ; 11b9 4d
                ST                       ; 11ba 17
                LR   A,QU                ; 11bb 02
                ST                       ; 11bc 17
                LR   A,QL                ; 11bd 03
                ST                       ; 11be 17
                XDC                      ; 11bf 2c
                LR   Q,DC                ; 11c0 0e
                XDC                      ; 11c1 2c
                LR   A,KU                ; 11c2 00
                ST                       ; 11c3 17
                LR   A,KL                ; 11c4 01
                ST                       ; 11c5 17
                LR   A,$a                ; 11c6 4a
                ST                       ; 11c7 17
                LR   A,$b                ; 11c8 4b
                ST                       ; 11c9 17
                LR   J,W                 ; 11ca 1e
                LR   A,$9                ; 11cb 49
                ST                       ; 11cc 17
                LR   K,P                 ; 11cd 08
                LR   A,KU                ; 11ce 00
                ST                       ; 11cf 17
                LR   A,KL                ; 11d0 01
                ST                       ; 11d1 17
                LR   A,QU                ; 11d2 02
                ST                       ; 11d3 17
                LR   A,QL                ; 11d4 03
                ST                       ; 11d5 17
                PI   $424d               ; 11d6 28 42 4d
                DCI  $0fb0               ; 11d9 2a 0f b0
                LISU 2                   ; 11dc 62
                LISL 0                   ; 11dd 68
                LM                       ; 11de 16
                LR   (IS)+,A             ; 11df 5d
                LM                       ; 11e0 16
                LR   (IS)+,A             ; 11e1 5d
                LM                       ; 11e2 16
                LR   (IS)+,A             ; 11e3 5d
                LM                       ; 11e4 16
                LR   (IS)+,A             ; 11e5 5d
                LM                       ; 11e6 16
                LR   QU,A                ; 11e7 06
                LM                       ; 11e8 16
                LR   QL,A                ; 11e9 07
                XDC                      ; 11ea 2c
                LR   DC,Q                ; 11eb 0f
                XDC                      ; 11ec 2c
                LIS  $2                  ; 11ed 72
                ADC                      ; 11ee 8e
                LM                       ; 11ef 16
                LR   $a,A                ; 11f0 5a
                LM                       ; 11f1 16
                LR   $b,A                ; 11f2 5b
                LM                       ; 11f3 16
                LR   $9,A                ; 11f4 59
                LR   W,J                 ; 11f5 1d
                LM                       ; 11f6 16
                LR   KU,A                ; 11f7 04
                LM                       ; 11f8 16
                LR   KL,A                ; 11f9 05
                LR   P,K                 ; 11fa 09
                LM                       ; 11fb 16
                LR   QU,A                ; 11fc 06
                LM                       ; 11fd 16
                LR   QL,A                ; 11fe 07
                DCI  $0fb6               ; 11ff 2a 0f b6
                LM                       ; 1202 16
                LR   KU,A                ; 1203 04
                LM                       ; 1204 16
                LR   KL,A                ; 1205 05
                LR   DC,Q                ; 1206 0f
                LISU 4                   ; 1207 64
                LISL 3                   ; 1208 6b
                LR   A,(IS)-             ; 1209 4e
                LR   $9,A                ; 120a 59
                LR   A,(IS)-             ; 120b 4e
                LR   QL,A                ; 120c 07
                LR   A,(IS)-             ; 120d 4e
                LR   QU,A                ; 120e 06
                LR   A,(IS)-             ; 120f 4e
                LR   IS,A                ; 1210 0b
                LR   A,$3                ; 1211 43
                EI                       ; 1212 1b
                POP                      ; 1213 1c
A1214:          LR   K,P                 ; 1214 08
                LISU 5                   ; 1215 65
                LISL 7                   ; 1216 6f
                DCI  $0ca8               ; 1217 2a 0c a8
                LI   $10                 ; 121a 20 10
                LR   $0,A                ; 121c 50
                LIS  $2                  ; 121d 72
                LR   $2,A                ; 121e 52
A121f:          LM                       ; 121f 16
                LR   $1,A                ; 1220 51
                LM                       ; 1221 16
                COM                      ; 1222 18
                INC                      ; 1223 1f
                AS   $1                  ; 1224 c1
                COM                      ; 1225 18
                LR   (IS)+,A             ; 1226 5d
                BR7  A122a               ; 1227 8f 02
                LISU 6                   ; 1229 66
A122a:          LR   A,$2                ; 122a 42
                ADC                      ; 122b 8e
                DS   $0                  ; 122c 30
                BF   $4,A121f            ; 122d 94 f1
                PK                       ; 122f 0c
A1230:          LR   K,P                 ; 1230 08
                DCI  $0ca8               ; 1231 2a 0c a8
                LR   A,$4                ; 1234 44
                SL   1                   ; 1235 13
                SL   1                   ; 1236 13
                ADC                      ; 1237 8e
                LM                       ; 1238 16
                COM                      ; 1239 18
                AS   $1                  ; 123a c1
                BF   $1,A123e            ; 123b 91 02
                COM                      ; 123d 18
A123e:          LR   $8,A                ; 123e 58
                LR   A,$5                ; 123f 45
                AM                       ; 1240 88
                AS   $8                  ; 1241 c8
                BF   $2,A1254            ; 1242 92 11
                LM                       ; 1244 16
                COM                      ; 1245 18
                AS   $2                  ; 1246 c2
                BF   $1,A124a            ; 1247 91 02
                COM                      ; 1249 18
A124a:          LR   $8,A                ; 124a 58
                LM                       ; 124b 16
                AS   $6                  ; 124c c6
                AS   $8                  ; 124d c8
                BF   $2,A1254            ; 124e 92 05
                LI   $80                 ; 1250 20 80
                BF   $0,A1255            ; 1252 90 02
A1254:          LIS  $0                  ; 1254 70
A1255:          PK                       ; 1255 0c
A1256:          LR   K,P                 ; 1256 08
                XDC                      ; 1257 2c
                LR   DC,H                ; 1258 10
                LI   $ff                 ; 1259 20 ff
                ADC                      ; 125b 8e
                LR   H,DC                ; 125c 11
                CM                       ; 125d 8d
                XDC                      ; 125e 2c
                LIS  $7                  ; 125f 77
                LR   $2,A                ; 1260 52
                LIS  $f                  ; 1261 7f
                LR   $7,A                ; 1262 57
A1263:          LM                       ; 1263 16
                XDC                      ; 1264 2c
                ST                       ; 1265 17
                LR   A,$7                ; 1266 47
                ADC                      ; 1267 8e
                XDC                      ; 1268 2c
                DS   $2                  ; 1269 32
                BF   $4,A1263            ; 126a 94 f8
                PK                       ; 126c 0c
A126d:          LR   K,P                 ; 126d 08
                DCI  $0ca8               ; 126e 2a 0c a8
                LR   A,$0                ; 1271 40
                SL   1                   ; 1272 13
                SL   1                   ; 1273 13
                ADC                      ; 1274 8e
                XDC                      ; 1275 2c
                DCI  $0d0c               ; 1276 2a 0d 0c
                SR   1                   ; 1279 12
                ADC                      ; 127a 8e
                LM                       ; 127b 16
                XDC                      ; 127c 2c
                AM                       ; 127d 88
                LR   $1,A                ; 127e 51
                LM                       ; 127f 16
                LR   $5,A                ; 1280 55
                LM                       ; 1281 16
                LR   $7,A                ; 1282 57
                LM                       ; 1283 16
                LR   $6,A                ; 1284 56
                XDC                      ; 1285 2c
                LR   A,$7                ; 1286 47
                AM                       ; 1287 88
                LR   $2,A                ; 1288 52
                PK                       ; 1289 0c
                LIS  $2                  ; 128a 72
                LR   $8,A                ; 128b 58
A128c:          PI   A1342               ; 128c 28 13 42
                LR   A,$8                ; 128f 48
                INC                      ; 1290 1f
                LR   $8,A                ; 1291 58
                CI   $30                 ; 1292 25 30
                BF   $4,A128c            ; 1294 94 f7
                LIS  $4                  ; 1296 74
                LR   $7,A                ; 1297 57
A1298:          DCI  $0d0c               ; 1298 2a 0d 0c
                LISU 3                   ; 129b 63
                LISL 4                   ; 129c 6c
                LIS  $4                  ; 129d 74
                NS   (IS)                ; 129e fc
                LIS  $2                  ; 129f 72
                BT   4,A12a3             ; 12a0 84 02
                LIS  $3                  ; 12a2 73
A12a3:          ST                       ; 12a3 17
                LIS  $0                  ; 12a4 70
                ST                       ; 12a5 17
                LIS  $1                  ; 12a6 71
                ST                       ; 12a7 17
                ST                       ; 12a8 17
                DCI  $0d8a               ; 12a9 2a 0d 8a
                LIS  $0                  ; 12ac 70
                ST                       ; 12ad 17
                DCI  $0d11               ; 12ae 2a 0d 11
                LM                       ; 12b1 16
                INC                      ; 12b2 1f
                DCI  $0d11               ; 12b3 2a 0d 11
                ST                       ; 12b6 17
                COM                      ; 12b7 18
                INC                      ; 12b8 1f
                LR   $6,A                ; 12b9 56
                LR   A,(IS)-             ; 12ba 4e
                NI   $03                 ; 12bb 21 03
                AS   $6                  ; 12bd c6
                LR   J,W                 ; 12be 1e
                LR   A,(IS)              ; 12bf 4c
                INC                      ; 12c0 1f
                LR   W,J                 ; 12c1 1d
                BT   2,A12e4             ; 12c2 82 21
                LIS  $0                  ; 12c4 70
                DCI  $0d11               ; 12c5 2a 0d 11
                ST                       ; 12c8 17
                LISL 2                   ; 12c9 6a
                DS   (IS)+               ; 12ca 3d
                BF   $4,A12d0            ; 12cb 94 04
                JMP  A15fc               ; 12cd 29 15 fc
A12d0:          DCI  $082f               ; 12d0 2a 08 2f
                LM                       ; 12d3 16
                AI   $ff                 ; 12d4 24 ff
                CI   $c0                 ; 12d6 25 c0
                DCI  $082f               ; 12d8 2a 08 2f
                BF   $4,A12e2            ; 12db 94 06
                LI   $e8                 ; 12dd 20 e8
                DCI  $0ce4               ; 12df 2a 0c e4
A12e2:          ST                       ; 12e2 17
                LIS  $0                  ; 12e3 70
A12e4:          LR   (IS)+,A             ; 12e4 5d
                DCI  $08f5               ; 12e5 2a 08 f5
                ST                       ; 12e8 17
                DCI  $08f2               ; 12e9 2a 08 f2
                LIS  $0                  ; 12ec 70
                ST                       ; 12ed 17
                LR   $0,A                ; 12ee 50
                DCI  A1755               ; 12ef 2a 17 55
A12f2:          PI   A12fe               ; 12f2 28 12 fe
                LR   A,$0                ; 12f5 40
                INC                      ; 12f6 1f
                LR   $0,A                ; 12f7 50
                DS   $7                  ; 12f8 37
                BF   $4,A12f2            ; 12f9 94 f8
                JMP  A139d               ; 12fb 29 13 9d
A12fe:          LR   K,P                 ; 12fe 08
                XDC                      ; 12ff 2c
                DCI  $0c40               ; 1300 2a 0c 40
                LR   A,$0                ; 1303 40
                ADC                      ; 1304 8e
                XDC                      ; 1305 2c
                LM                       ; 1306 16
                XDC                      ; 1307 2c
                ST                       ; 1308 17
                SR   1                   ; 1309 12
                LR   $1,A                ; 130a 51
                DCI  $0820               ; 130b 2a 08 20
                LR   A,$0                ; 130e 40
                ADC                      ; 130f 8e
                XDC                      ; 1310 2c
                LM                       ; 1311 16
                XDC                      ; 1312 2c
                ST                       ; 1313 17
                SL   1                   ; 1314 13
                SL   1                   ; 1315 13
                LR   $2,A                ; 1316 52
                DCI  $0ca8               ; 1317 2a 0c a8
                LR   A,$0                ; 131a 40
                SL   1                   ; 131b 13
                SL   1                   ; 131c 13
                ADC                      ; 131d 8e
                LIS  $2                  ; 131e 72
                LR   $4,A                ; 131f 54
A1320:          XDC                      ; 1320 2c
                LM                       ; 1321 16
                XDC                      ; 1322 2c
                ST                       ; 1323 17
                LR   A,$2                ; 1324 42
                ST                       ; 1325 17
                LR   A,$1                ; 1326 41
                LR   $2,A                ; 1327 52
                DS   $4                  ; 1328 34
                BF   $4,A1320            ; 1329 94 f6
                XDC                      ; 132b 2c
                LM                       ; 132c 16
                LR   QU,A                ; 132d 06
                LM                       ; 132e 16
                LR   QL,A                ; 132f 07
                XDC                      ; 1330 2c
                BF   $0,A1335            ; 1331 90 03
                LR   K,P                 ; 1333 08
                LR   Q,DC                ; 1334 0e
A1335:          DCI  $0c20               ; 1335 2a 0c 20
                LR   A,$0                ; 1338 40
                ADC                      ; 1339 8e
                LR   A,QL                ; 133a 03
                ST                       ; 133b 17
                LIS  $f                  ; 133c 7f
                ADC                      ; 133d 8e
                LR   A,QU                ; 133e 02
                ST                       ; 133f 17
                XDC                      ; 1340 2c
                PK                       ; 1341 0c
A1342:          LR   K,P                 ; 1342 08
                LIS  $7                  ; 1343 77
                LR   $6,A                ; 1344 56
                LI   $20                 ; 1345 20 20
A1347:          DCI  $08fb               ; 1347 2a 08 fb
                CM                       ; 134a 8d
                BF   $4,A1347            ; 134b 94 fb
A134d:          DCI  $08fb               ; 134d 2a 08 fb
                LM                       ; 1350 16
                AS   $8                  ; 1351 c8
                CI   $c0                 ; 1352 25 c0
                BT   2,A1357             ; 1354 82 02
                PK                       ; 1356 0c
A1357:          DCI  $08fb               ; 1357 2a 08 fb
                CM                       ; 135a 8d
                BF   $2,A1357            ; 135b 92 fb
                LI   $10                 ; 135d 20 10
                OUTS 1                   ; 135f b1
                LR   A,$6                ; 1360 46
                XI   $07                 ; 1361 23 07
                LR   $6,A                ; 1363 56
                OUTS 0                   ; 1364 b0
                LIS  $0                  ; 1365 70
                OUTS 1                   ; 1366 b1
                BF   $0,A134d            ; 1367 90 e5
A1369:          LR   K,P                 ; 1369 08
                PI   $40a9               ; 136a 28 40 a9
A136d:          LR   A,$5                ; 136d 45
                INC                      ; 136e 1f
                INC                      ; 136f 1f
                INC                      ; 1370 1f
                LR   $5,A                ; 1371 55
                DCI  A17e2               ; 1372 2a 17 e2
                ADC                      ; 1375 8e
                LIS  $0                  ; 1376 70
                XM                       ; 1377 8c
                BF   $1,A1399            ; 1378 91 20
                LISU 4                   ; 137a 64
                LISL 3                   ; 137b 6b
                LR   (IS)+,A             ; 137c 5d
                LM                       ; 137d 16
                LR   (IS)+,A             ; 137e 5d
                LM                       ; 137f 16
                LISU 2                   ; 1380 62
                LISL 4                   ; 1381 6c
                LR   (IS),A              ; 1382 5c
                LIS  $0                  ; 1383 70
                OUTS 0                   ; 1384 b0
                OUTS 1                   ; 1385 b1
                DCI  $0fdd               ; 1386 2a 0f dd
                ST                       ; 1389 17
                ST                       ; 138a 17
                PI   $46d6               ; 138b 28 46 d6
                PI   $43d6               ; 138e 28 43 d6
                BF   $1,A136d            ; 1391 91 db
                BT   4,A136d             ; 1393 84 d9
                PI   $40bc               ; 1395 28 40 bc
                PK                       ; 1398 0c
A1399:          LR   A,$6                ; 1399 46
                LR   $5,A                ; 139a 55
                BF   $0,A136d            ; 139b 90 d1
A139d:          PI   A1214               ; 139d 28 12 14
                LI   $10                 ; 13a0 20 10
                LR   $5,A                ; 13a2 55
                DCI  $0880               ; 13a3 2a 08 80
A13a6:          LISU 5                   ; 13a6 65
                LISL 7                   ; 13a7 6f
                LIS  $2                  ; 13a8 72
                LR   $2,A                ; 13a9 52
                LI   $ff                 ; 13aa 20 ff
                LR   $7,A                ; 13ac 57
A13ad:          LR   A,$7                ; 13ad 47
                AS   (IS)+               ; 13ae cd
                BT   2,A13cd             ; 13af 82 1d
A13b1:          BR7  A13ad               ; 13b1 8f fb
                LISU 6                   ; 13b3 66
                DS   $2                  ; 13b4 32
                BF   $4,A13ad            ; 13b5 94 f7
                LR   A,$4                ; 13b7 44
                LR   IS,A                ; 13b8 0b
                LIS  $0                  ; 13b9 70
                LR   (IS),A              ; 13ba 5c
                LR   A,IS                ; 13bb 0a
                BR7  A13c2               ; 13bc 8f 05
                AI   $d1                 ; 13be 24 d1
                BF   $0,A13c4            ; 13c0 90 03
A13c2:          AI   $d9                 ; 13c2 24 d9
A13c4:          ST                       ; 13c4 17
                DS   $5                  ; 13c5 35
                BF   $4,A13a6            ; 13c6 94 df
                PI   A1214               ; 13c8 28 12 14
                BF   $0,A13d5            ; 13cb 90 09
A13cd:          LR   A,(IS)-             ; 13cd 4e
                LR   A,IS                ; 13ce 0a
                LR   $4,A                ; 13cf 54
                LR   A,(IS)+             ; 13d0 4d
                COM                      ; 13d1 18
                LR   $7,A                ; 13d2 57
                BF   $0,A13b1            ; 13d3 90 dd
A13d5:          LI   $c8                 ; 13d5 20 c8
A13d7:          DCI  $08fb               ; 13d7 2a 08 fb
                CM                       ; 13da 8d
                BF   $4,A13d7            ; 13db 94 fb
                DCI  $0860               ; 13dd 2a 08 60
                XDC                      ; 13e0 2c
                DCI  $0880               ; 13e1 2a 08 80
                LI   $10                 ; 13e4 20 10
                LR   $1,A                ; 13e6 51
A13e7:          LM                       ; 13e7 16
                NI   $0f                 ; 13e8 21 0f
                LR   H,DC                ; 13ea 11
                SL   1                   ; 13eb 13
                SL   1                   ; 13ec 13
                DCI  $0caa               ; 13ed 2a 0c aa
                ADC                      ; 13f0 8e
                LM                       ; 13f1 16
                LR   $2,A                ; 13f2 52
                LM                       ; 13f3 16
                COM                      ; 13f4 18
                INC                      ; 13f5 1f
                AS   $2                  ; 13f6 c2
                XDC                      ; 13f7 2c
                ST                       ; 13f8 17
                XDC                      ; 13f9 2c
                LR   DC,H                ; 13fa 10
                DS   $1                  ; 13fb 31
                BF   $4,A13e7            ; 13fc 94 ea
                LISU 5                   ; 13fe 65
                LISL 7                   ; 13ff 6f
                DCI  $0840               ; 1400 2a 08 40
                LI   $10                 ; 1403 20 10
                LR   $0,A                ; 1405 50
A1406:          LR   A,(IS)+             ; 1406 4d
                COM                      ; 1407 18
                ST                       ; 1408 17
                BR7  A140c               ; 1409 8f 02
                LISU 6                   ; 140b 66
A140c:          DS   $0                  ; 140c 30
                BF   $4,A1406            ; 140d 94 f8
                DCI  $0850               ; 140f 2a 08 50
                XDC                      ; 1412 2c
                DCI  $0860               ; 1413 2a 08 60
                LI   $10                 ; 1416 20 10
                LR   $7,A                ; 1418 57
                PI   A113d               ; 1419 28 11 3d
                DCI  $0870               ; 141c 2a 08 70
                XDC                      ; 141f 2c
                DCI  $0880               ; 1420 2a 08 80
                LI   $10                 ; 1423 20 10
                LR   $7,A                ; 1425 57
                PI   A113d               ; 1426 28 11 3d
                DCI  $0ffa               ; 1429 2a 0f fa
                XDC                      ; 142c 2c
                DCI  A143a               ; 142d 2a 14 3a
                LIS  $6                  ; 1430 76
                LR   $7,A                ; 1431 57
                PI   A113d               ; 1432 28 11 3d
                LISU 3                   ; 1435 63
                LISL 4                   ; 1436 6c
                JMP  A1146               ; 1437 29 11 46
A143a:          LR   DC,H                ; 143a 10
                LR   A,KL                ; 143b 01
                PK                       ; 143c 0c
                LI   $0c                 ; 143d 20 0c
                LI   $36                 ; 143f 20 36
                AI   $34                 ; 1441 24 34
                DS   $2                  ; 1443 32
                OI   $20                 ; 1444 22 20
                LR   J,W                 ; 1446 1e
                LR   Q,DC                ; 1447 0e
                PK                       ; 1448 0c
                LR   A,IS                ; 1449 0a
A144a:          SL   4                   ; 144a 15
                LR   IS,A                ; 144b 0b
                LR   KL,A                ; 144c 05
                LR   A,KU                ; 144d 00
                EI                       ; 144e 1b
                LR   H,DC                ; 144f 11
                JMP  $0b00               ; 1450 29 0b 00
                SR   4                   ; 1453 14
                LR   A,KU                ; 1454 00
                LR   A,KU                ; 1455 00
                LR   A,KU                ; 1456 00
                LR   A,KU                ; 1457 00
                LR   A,KU                ; 1458 00
                LR   A,KU                ; 1459 00
                AI   $00                 ; 145a 24 00
                LR   QL,A                ; 145c 07
                SL   1                   ; 145d 13
                LR   A,KU                ; 145e 00
                DS   $2                  ; 145f 32
                DS   $4                  ; 1460 34
                LR   A,KU                ; 1461 00
                LR   A,KU                ; 1462 00
                LR   A,KU                ; 1463 00
                LR   A,KU                ; 1464 00
                LR   A,KU                ; 1465 00
                LR   A,KU                ; 1466 00
                LR   A,KU                ; 1467 00
                LR   A,KU                ; 1468 00
                LR   A,KU                ; 1469 00
A146a:          SL   4                   ; 146a 15
                LR   IS,A                ; 146b 0b
                LR   KL,A                ; 146c 05
                LR   A,KU                ; 146d 00
                LR   P,K                 ; 146e 09
                LR   A,QL                ; 146f 03
                NOP                      ; 1470 2b
                DI                       ; 1471 1a
                NI   $07                 ; 1472 21 07
                SL   1                   ; 1474 13
                CI   $08                 ; 1475 25 08
                PI   $40a9               ; 1477 28 40 a9
                DCI  $0ca8               ; 147a 2a 0c a8
                LR   A,$0                ; 147d 40
                SL   1                   ; 147e 13
                SL   1                   ; 147f 13
                ADC                      ; 1480 8e
                LM                       ; 1481 16
                LR   $1,A                ; 1482 51
                PI   A1230               ; 1483 28 12 30
                XS   $4                  ; 1486 e4
                LR   J,W                 ; 1487 1e
                DCI  $0d0c               ; 1488 2a 0d 0c
                LR   A,$0                ; 148b 40
                SL   1                   ; 148c 13
                ADC                      ; 148d 8e
                LIS  $1                  ; 148e 71
                LR   W,J                 ; 148f 1d
                BT   1,A1495             ; 1490 81 04
                LI   $ff                 ; 1492 20 ff
                CM                       ; 1494 8d
A1495:          LR   Q,DC                ; 1495 0e
                LR   $6,A                ; 1496 56
                LM                       ; 1497 16
                COM                      ; 1498 18
                INC                      ; 1499 1f
                LR   DC,Q                ; 149a 0f
                ST                       ; 149b 17
                LI   $10                 ; 149c 20 10
                NS   (IS)                ; 149e fc
                BT   4,A14b1             ; 149f 84 11
                DCI  $0fdb               ; 14a1 2a 0f db
                LIS  $0                  ; 14a4 70
                XM                       ; 14a5 8c
                BT   1,A14b1             ; 14a6 81 0a
                LR   DC,Q                ; 14a8 0f
                LR   A,$6                ; 14a9 46
                ADC                      ; 14aa 8e
                LR   Q,DC                ; 14ab 0e
                LM                       ; 14ac 16
                COM                      ; 14ad 18
                INC                      ; 14ae 1f
                LR   DC,Q                ; 14af 0f
                ST                       ; 14b0 17
A14b1:          PI   $40bc               ; 14b1 28 40 bc
                PK                       ; 14b4 0c
                LIS  $0                  ; 14b5 70
                OUTS 1                   ; 14b6 b1
                INS  1                   ; 14b7 a1
                NI   $01                 ; 14b8 21 01
                BT   4,A14c7             ; 14ba 84 0c
A14bc:          DCI  $0d0d               ; 14bc 2a 0d 0d
                LIS  $0                  ; 14bf 70
                ST                       ; 14c0 17
                DCI  $0caa               ; 14c1 2a 0c aa
                LI   $c2                 ; 14c4 20 c2
                ST                       ; 14c6 17
A14c7:          DCI  $0d0c               ; 14c7 2a 0d 0c
                LIS  $0                  ; 14ca 70
                ST                       ; 14cb 17
                BF   $0,A14da            ; 14cc 90 0d
                LIS  $0                  ; 14ce 70
                OUTS 1                   ; 14cf b1
                INS  1                   ; 14d0 a1
                NI   $02                 ; 14d1 21 02
                BT   4,A14c7             ; 14d3 84 f3
                BF   $0,A14bc            ; 14d5 90 e6
                PI   $1476               ; 14d7 28 14 76
A14da:          JMP  A1154               ; 14da 29 11 54
A14dd:          LIS  $0                  ; 14dd 70
                OUTS 1                   ; 14de b1
                INS  1                   ; 14df a1
                NI   $01                 ; 14e0 21 01
                BT   4,A1507             ; 14e2 84 24
                DCI  $170c               ; 14e4 2a 17 0c
                XDC                      ; 14e7 2c
                LIS  $3                  ; 14e8 73
A14e9:          DCI  $0d0c               ; 14e9 2a 0d 0c
                ST                       ; 14ec 17
                DCI  $0caa               ; 14ed 2a 0c aa
                LM                       ; 14f0 16
                AI   $38                 ; 14f1 24 38
                SR   1                   ; 14f3 12
                INC                      ; 14f4 1f
                COM                      ; 14f5 18
                INC                      ; 14f6 1f
                DCI  $0d0d               ; 14f7 2a 0d 0d
                ST                       ; 14fa 17
                XDC                      ; 14fb 2c
                PI   A12fe               ; 14fc 28 12 fe
                LIS  $f                  ; 14ff 7f
                LR   $8,A                ; 1500 58
                PI   A1342               ; 1501 28 13 42
                JMP  A1529               ; 1504 29 15 29
A1507:          JMP  A1173               ; 1507 29 11 73
A150a:          LIS  $0                  ; 150a 70
                OUTS 1                   ; 150b b1
                INS  1                   ; 150c a1
                NI   $02                 ; 150d 21 02
                BT   4,A1507             ; 150f 84 f7
                DCI  A1712               ; 1511 2a 17 12
                XDC                      ; 1514 2c
                LI   $fd                 ; 1515 20 fd
                BF   $0,A14e9            ; 1517 90 d1
                PI   $1476               ; 1519 28 14 76
                DCI  $0c31               ; 151c 2a 0c 31
                LM                       ; 151f 16
                AI   $40                 ; 1520 24 40
                DCI  $0c31               ; 1522 2a 0c 31
                ST                       ; 1525 17
                JMP  A1154               ; 1526 29 11 54
A1529:          DCI  A1761               ; 1529 2a 17 61
                LIS  $0                  ; 152c 70
                OUTS 1                   ; 152d b1
                INS  1                   ; 152e a1
                LR   $5,A                ; 152f 55
                NI   $01                 ; 1530 21 01
                BT   4,A153b             ; 1532 84 08
                DCI  $0d8a               ; 1534 2a 0d 8a
                ST                       ; 1537 17
                DCI  A17b5               ; 1538 2a 17 b5
A153b:          LIS  $2                  ; 153b 72
                LR   $0,A                ; 153c 50
                PI   A12fe               ; 153d 28 12 fe
A1540:          DCI  A1767               ; 1540 2a 17 67
                LIS  $2                  ; 1543 72
                NS   $5                  ; 1544 f5
                BT   4,A154a             ; 1545 84 04
                DCI  $17bb               ; 1547 2a 17 bb
A154a:          LIS  $3                  ; 154a 73
                LR   $0,A                ; 154b 50
                PI   A12fe               ; 154c 28 12 fe
                DCI  $0d8a               ; 154f 2a 0d 8a
                LIS  $0                  ; 1552 70
                XM                       ; 1553 8c
                BT   4,A1576             ; 1554 84 21
                DCI  $0d10               ; 1556 2a 0d 10
                LIS  $4                  ; 1559 74
                NS   (IS)                ; 155a fc
                LI   $f4                 ; 155b 20 f4
                BT   4,A1561             ; 155d 84 03
                LI   $f0                 ; 155f 20 f0
A1561:          AM                       ; 1561 88
                DCI  $0d10               ; 1562 2a 0d 10
                ST                       ; 1565 17
                BT   2,A1576             ; 1566 82 0f
                DCI  $0d0d               ; 1568 2a 0d 0d
                LIS  $2                  ; 156b 72
                AM                       ; 156c 88
                CI   $08                 ; 156d 25 08
                BT   2,A1572             ; 156f 82 02
                LIS  $8                  ; 1571 78
A1572:          DCI  $0d0d               ; 1572 2a 0d 0d
                ST                       ; 1575 17
A1576:          PI   $4795               ; 1576 28 47 95
                JMP  A139d               ; 1579 29 13 9d
                LIS  $1                  ; 157c 71
                BF   $0,A1583            ; 157d 90 05
                LIS  $2                  ; 157f 72
                BF   $0,A1583            ; 1580 90 02
                LIS  $3                  ; 1582 73
A1583:          LR   $7,A                ; 1583 57
                PI   $1476               ; 1584 28 14 76
                PI   A15d2               ; 1587 28 15 d2
                DCI  $0d11               ; 158a 2a 0d 11
                LM                       ; 158d 16
                LR   $1,A                ; 158e 51
                DCI  $0d1c               ; 158f 2a 0d 1c
                SL   1                   ; 1592 13
                SL   1                   ; 1593 13
                ADC                      ; 1594 8e
                LR   H,DC                ; 1595 11
                DCI  $0d12               ; 1596 2a 0d 12
                SR   1                   ; 1599 12
                ADC                      ; 159a 8e
                LR   Q,DC                ; 159b 0e
                LR   A,$7                ; 159c 47
                AI   $66                 ; 159d 24 66
                AMD                      ; 159f 89
                LR   DC,Q                ; 15a0 0f
                ST                       ; 15a1 17
                BF   $2,A15ab            ; 15a2 92 08
                LR   Q,DC                ; 15a4 0e
                LI   $67                 ; 15a5 20 67
                AMD                      ; 15a7 89
                LR   DC,Q                ; 15a8 0f
                ST                       ; 15a9 17
                LR   DC,Q                ; 15aa 0f
A15ab:          LI   $ff                 ; 15ab 20 ff
                ADC                      ; 15ad 8e
                LR   Q,DC                ; 15ae 0e
                LM                       ; 15af 16
                NI   $0f                 ; 15b0 21 0f
                LR   $1,A                ; 15b2 51
                PI   A15f1               ; 15b3 28 15 f1
                PI   A1256               ; 15b6 28 12 56
                LR   DC,Q                ; 15b9 0f
                LM                       ; 15ba 16
                SR   4                   ; 15bb 14
                LR   Q,DC                ; 15bc 0e
                LR   $1,A                ; 15bd 51
                PI   A15f1               ; 15be 28 15 f1
                PI   A1256               ; 15c1 28 12 56
                LR   DC,Q                ; 15c4 0f
                LM                       ; 15c5 16
                NI   $0f                 ; 15c6 21 0f
                LR   $1,A                ; 15c8 51
                PI   A15f1               ; 15c9 28 15 f1
                PI   A1256               ; 15cc 28 12 56
                JMP  A1529               ; 15cf 29 15 29
A15d2:          LR   K,P                 ; 15d2 08
                PI   $40a9               ; 15d3 28 40 a9
                PI   $4501               ; 15d6 28 45 01
                DCI  $0d8b               ; 15d9 2a 0d 8b
                LM                       ; 15dc 16
                AI   $01                 ; 15dd 24 01
                DCI  $0d8b               ; 15df 2a 0d 8b
                ST                       ; 15e2 17
                DCI  $08f2               ; 15e3 2a 08 f2
                ST                       ; 15e6 17
                LR   A,$4                ; 15e7 44
                SL   1                   ; 15e8 13
                LR   $8,A                ; 15e9 58
                PI   A1342               ; 15ea 28 13 42
                PI   $40bc               ; 15ed 28 40 bc
                PK                       ; 15f0 0c
A15f1:          LR   K,P                 ; 15f1 08
                DCI  $0f3f               ; 15f2 2a 0f 3f
                LR   A,$1                ; 15f5 41
                ADC                      ; 15f6 8e
                SL   1                   ; 15f7 13
                ADC                      ; 15f8 8e
                ADC                      ; 15f9 8e
                ADC                      ; 15fa 8e
                PK                       ; 15fb 0c
A15fc:          LIS  $0                  ; 15fc 70
                LR   $5,A                ; 15fd 55
                LR   $6,A                ; 15fe 56
                DI                       ; 15ff 1a
                PI   A1369               ; 1600 28 13 69
                LR   A,$8                ; 1603 48
                CI   $3f                 ; 1604 25 3f
                BF   $4,A15fc            ; 1606 94 f5
                LISU 3                   ; 1608 63
                LISL 4                   ; 1609 6c
                LR   A,(IS)              ; 160a 4c
                INC                      ; 160b 1f
                LR   $1,A                ; 160c 51
                JMP  A1098               ; 160d 29 10 98
A1610:          DCI  $0d0c               ; 1610 2a 0d 0c
                LIS  $0                  ; 1613 70
                ST                       ; 1614 17
                JMP  A1173               ; 1615 29 11 73
                DCI  $0d0c               ; 1618 2a 0d 0c
                LM                       ; 161b 16
                COM                      ; 161c 18
                INC                      ; 161d 1f
                DCI  $0d0c               ; 161e 2a 0d 0c
                ST                       ; 1621 17
                JMP  A1154               ; 1622 29 11 54
                PI   $1476               ; 1625 28 14 76
                LIS  $8                  ; 1628 78
                NS   (IS)                ; 1629 fc
                BT   4,A1674             ; 162a 84 49
                LI   $18                 ; 162c 20 18
                LR   $8,A                ; 162e 58
A162f:          PI   A1342               ; 162f 28 13 42
                LR   A,$8                ; 1632 48
                SL   1                   ; 1633 13
                LR   $8,A                ; 1634 58
                PI   A1342               ; 1635 28 13 42
                LR   A,$8                ; 1638 48
                SR   1                   ; 1639 12
                LR   $8,A                ; 163a 58
                DS   $8                  ; 163b 38
                BF   $4,A162f            ; 163c 94 f2
                DCI  $0fdb               ; 163e 2a 0f db
                LIS  $7                  ; 1641 77
                NM                       ; 1642 8a
                DCI  A167a               ; 1643 2a 16 7a
                SL   1                   ; 1646 13
                SL   1                   ; 1647 13
                ADC                      ; 1648 8e
                LM                       ; 1649 16
                LR   $1,A                ; 164a 51
                LM                       ; 164b 16
                LR   $2,A                ; 164c 52
                LM                       ; 164d 16
                LR   $4,A                ; 164e 54
                LR   $5,A                ; 164f 55
                DCI  $0ca8               ; 1650 2a 0c a8
                XDC                      ; 1653 2c
                DCI  $0cac               ; 1654 2a 0c ac
                LM                       ; 1657 16
                AS   $1                  ; 1658 c1
                XDC                      ; 1659 2c
                ST                       ; 165a 17
                CM                       ; 165b 8d
                XDC                      ; 165c 2c
                CM                       ; 165d 8d
                LM                       ; 165e 16
                AS   $2                  ; 165f c2
                XDC                      ; 1660 2c
                ST                       ; 1661 17
                DCI  $0d0c               ; 1662 2a 0d 0c
                LIS  $4                  ; 1665 74
                NS   (IS)                ; 1666 fc
                LR   A,$4                ; 1667 44
                BT   4,A166b             ; 1668 84 02
                INC                      ; 166a 1f
A166b:          ST                       ; 166b 17
                LR   A,$5                ; 166c 45
                BT   4,A1670             ; 166d 84 02
                SL   1                   ; 166f 13
A1670:          ST                       ; 1670 17
                JMP  A1529               ; 1671 29 15 29
A1674:          PI   A15d2               ; 1674 28 15 d2
                JMP  A1154               ; 1677 29 11 54
A167a:          LR   P,K                 ; 167a 09
                LR   A,KU                ; 167b 00
A167c:          LR   A,QU                ; 167c 02
                LR   A,KU                ; 167d 00
A167e:          LR   P,K                 ; 167e 09
                LR   DC,Q                ; 167f 0f
A1680:          LR   A,QU                ; 1680 02
                LR   A,QU                ; 1681 02
A1682:          LR   A,KU                ; 1682 00
                LR   DC,Q                ; 1683 0f
A1684:          LR   A,QU                ; 1684 02
                LR   A,QU                ; 1685 02
A1686:          NS   $7                  ; 1686 f7
                LR   DC,Q                ; 1687 0f
A1688:          NS   (IS)-               ; 1688 fe
                NS   (IS)-               ; 1689 fe
A168a:          NS   $7                  ; 168a f7
                LR   A,KU                ; 168b 00
                NS   (IS)-               ; 168c fe
                LR   A,KU                ; 168d 00
                NS   $7                  ; 168e f7
                NS   $1                  ; 168f f1
                NS   (IS)-               ; 1690 fe
                NS   (IS)-               ; 1691 fe
                LR   A,KU                ; 1692 00
                NS   $1                  ; 1693 f1
                NS   (IS)-               ; 1694 fe
                NS   (IS)-               ; 1695 fe
                LR   P,K                 ; 1696 09
                NS   $1                  ; 1697 f1
                LR   A,QU                ; 1698 02
                NS   (IS)-               ; 1699 fe
A169a:          LM                       ; 169a 16
                COM                      ; 169b 18
                LM                       ; 169c 16
                LR   DC,H                ; 169d 10
                SR   1                   ; 169e 12
                NM                       ; 169f 8a
                SR   4                   ; 16a0 14
                ASD  (IS)+               ; 16a1 dd
                SL   4                   ; 16a2 15
                LR   A,IS                ; 16a3 0a
                LM                       ; 16a4 16
                CI   $15                 ; 16a5 25 15
                LIS  $c                  ; 16a7 7c
                SL   4                   ; 16a8 15
                LIS  $f                  ; 16a9 7f
                SL   4                   ; 16aa 15
                BT   2,A16c0             ; 16ab 82 14
                ASD  $7                  ; 16ad d7
                SL   4                   ; 16ae 15
                LNK                      ; 16af 19
                SR   4                   ; 16b0 14
                OUTS 5                   ; 16b1 b5
                SR   4                   ; 16b2 14
                AS   (IS)-               ; 16b3 ce
                COM                      ; 16b4 18
                DS   (IS)                ; 16b5 3c
                LIS  $e                  ; 16b6 7e
                LIS  $e                  ; 16b7 7e
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                LIS  $e                  ; 16be 7e
                LIS  $e                  ; 16bf 7e
A16c0:          DS   (IS)                ; 16c0 3c
                COM                      ; 16c1 18
                INS  10                  ; 16c2 aa
                LR   $5,A                ; 16c3 55
                INS  10                  ; 16c4 aa
                LR   $5,A                ; 16c5 55
                INS  10                  ; 16c6 aa
                LR   $5,A                ; 16c7 55
                INS  10                  ; 16c8 aa
                LR   $5,A                ; 16c9 55
                INS  10                  ; 16ca aa
                LR   $5,A                ; 16cb 55
                INS  10                  ; 16cc aa
                LR   $5,A                ; 16cd 55
                INS  10                  ; 16ce aa
                LR   $5,A                ; 16cf 55
                INS  10                  ; 16d0 aa
                LR   $5,A                ; 16d1 55
                INS  10                  ; 16d2 aa
                LR   $5,A                ; 16d3 55
                INS  10                  ; 16d4 aa
                LR   $5,A                ; 16d5 55
                INS  10                  ; 16d6 aa
                LR   $5,A                ; 16d7 55
                INS  10                  ; 16d8 aa
                LR   $5,A                ; 16d9 55
                INS  10                  ; 16da aa
                LR   $5,A                ; 16db 55
                INS  10                  ; 16dc aa
                LR   $5,A                ; 16dd 55
A16de:          db   $ff                 
A16df:          db   $ff                 
                db   $ff                 
                db   $ff                 
                LR   A,KU                ; 16e2 00
                INC                      ; 16e3 1f
                LR   A,KU                ; 16e4 00
                LR   DC,Q                ; 16e5 0f
                LR   A,KU                ; 16e6 00
                LR   QL,A                ; 16e7 07
                LR   A,KU                ; 16e8 00
                LR   A,QL                ; 16e9 03
                LR   A,KU                ; 16ea 00
                LR   A,KL                ; 16eb 01
A16ec:          NS   $8                  ; 16ec f8
                NS   $0                  ; 16ed f0
                NS   $0                  ; 16ee f0
                XS   $0                  ; 16ef e0
                XS   $0                  ; 16f0 e0
                XS   $0                  ; 16f1 e0
                AS   $0                  ; 16f2 c0
                AS   $0                  ; 16f3 c0
                AS   $0                  ; 16f4 c0
;                BT   0,-128              ; 16f5 80 80
				db   $80,$80
;                BT   0,-128              ; 16f7 80 80
				db   $80,$80
                BT   0,A167a             ; 16f9 80 80
                BT   0,A167c             ; 16fb 80 80
                BT   0,A167e             ; 16fd 80 80
                BT   0,A1680             ; 16ff 80 80
                BT   0,A1682             ; 1701 80 80
                BT   0,A1684             ; 1703 80 80
                BT   0,A1686             ; 1705 80 80
                BT   0,A1688             ; 1707 80 80
                BT   0,A168a             ; 1709 80 80
                BT   0,A171a             ; 170b 80 0e
                LR   A,$1                ; 170d 41
                LR   $4,A                ; 170e 54
                OUTS 12                  ; 170f bc
                NS   $6                  ; 1710 f6
                OUTS 4                   ; 1711 b4
A1712:          LR   Q,DC                ; 1712 0e
                LR   A,$1                ; 1713 41
                LISL 6                   ; 1714 6e
                OUTS 12                  ; 1715 bc
                NS   $6                  ; 1716 f6
                OUTS 4                   ; 1717 b4
                LR   A,KL                ; 1718 01
                LR   KL,A                ; 1719 05
A171a:          COM                      ; 171a 18
                LR   A,KL                ; 171b 01
                LM                       ; 171c 16
                LR   A,QL                ; 171d 03
                ST                       ; 171e 17
                LR   KU,A                ; 171f 04
                LR   A,QU                ; 1720 02
                LR   IS,A                ; 1721 0b
                LR   A,QL                ; 1722 03
                PK                       ; 1723 0c
                LR   KU,A                ; 1724 04
                LR   QU,A                ; 1725 06
                LR   KL,A                ; 1726 05
                LR   QU,A                ; 1727 06
                LR   QU,A                ; 1728 06
                LR   QU,A                ; 1729 06
                LR   QL,A                ; 172a 07
                LR   QU,A                ; 172b 06
                LR   K,P                 ; 172c 08
                LR   QU,A                ; 172d 06
A172e:          LR   P,K                 ; 172e 09
                LR   QU,A                ; 172f 06
                LR   A,IS                ; 1730 0a
                LR   QL,A                ; 1731 07
                LR   IS,A                ; 1732 0b
                LR   QL,A                ; 1733 07
A1734:          PK                       ; 1734 0c
A1735:          LR   K,P                 ; 1735 08
                LR   P0,Q                ; 1736 0d
                LR   K,P                 ; 1737 08
                SR   1                   ; 1738 12
                LR   A,KL                ; 1739 01
                SL   1                   ; 173a 13
                LR   A,KL                ; 173b 01
                SL   4                   ; 173c 15
                LR   A,QU                ; 173d 02
                BF   $0,A1748            ; 173e 90 09
                LR   A,KU                ; 1740 00
                LR   KL,A                ; 1741 05
                BF   $4,A174d            ; 1742 94 0a
                BF   $1,0                ; 1744 91 00
                db   $ff                 
A1747:          ST                       ; 1747 17
A1748:          COM                      ; 1748 18
                LR   A,KU                ; 1749 00
                ST                       ; 174a 17
                LR   A,$0                ; 174b 40
                LR   A,KL                ; 174c 01
A174d:          db   $ff                 
A174e:          ST                       ; 174e 17
                LR   A,$4                ; 174f 44
                LR   A,KU                ; 1750 00
                ST                       ; 1751 17
A1752:          LR   A,$0                ; 1752 40
                LR   A,KL                ; 1753 01
                db   $ff                 
A1755:          LR   Q,DC                ; 1755 0e
                LR   A,$1                ; 1756 41
                LISU 0                   ; 1757 60
A1758:          LR   A,$8                ; 1758 48
                NS   $6                  ; 1759 f6
                OUTS 4                   ; 175a b4
                LR   Q,DC                ; 175b 0e
                LR   A,$1                ; 175c 41
                LR   $5,A                ; 175d 55
A175e:          BT   0,A1735             ; 175e 80 d6
                AS   $2                  ; 1760 c2
A1761:          LI   $41                 ; 1761 20 41
                LR   A,$4                ; 1763 44
                ASD  $8                  ; 1764 d8
                INS  12                  ; 1765 ac
                LR   (IS),A              ; 1766 5c
A1767:          LI   $41                 ; 1767 20 41
                LIS  $6                  ; 1769 76
                ASD  $8                  ; 176a d8
                OUTS 6                   ; 176b b6
                XS   (IS)                ; 176c ec
                LR   Q,DC                ; 176d 0e
                LR   A,$2                ; 176e 42
                IN   $a0                 ; 176f 26 a0
                BF   $6,A1734            ; 1771 96 c2
                LR   Q,DC                ; 1773 0e
                LR   A,$2                ; 1774 42
                DS   $0                  ; 1775 30
                OUTS 0                   ; 1776 b0
                OUTS 6                   ; 1777 b6
                AS   $2                  ; 1778 c2
                LR   Q,DC                ; 1779 0e
                LR   A,$2                ; 177a 42
                LR   A,$0                ; 177b 40
                AS   $0                  ; 177c c0
                ASD  $6                  ; 177d d6
                AS   $2                  ; 177e c2
                LR   Q,DC                ; 177f 0e
                LR   A,$2                ; 1780 42
                LIS  $a                  ; 1781 7a
                AS   $0                  ; 1782 c0
                ASD  $6                  ; 1783 d6
                AS   $2                  ; 1784 c2
                LR   Q,DC                ; 1785 0e
                LR   A,$2                ; 1786 42
                NM                       ; 1787 8a
                OUTS 0                   ; 1788 b0
                OUTS 6                   ; 1789 b6
                AS   $2                  ; 178a c2
                LR   Q,DC                ; 178b 0e
                LR   A,$2                ; 178c 42
                BF   $4,A172e            ; 178d 94 a0
                BF   $6,A1752            ; 178f 96 c2
                LR   Q,DC                ; 1791 0e
                LR   A,$1                ; 1792 41
                DS   $a                  ; 1793 3a
                LIS  $4                  ; 1794 74
                BF   $6,A1758            ; 1795 96 c2
                LR   Q,DC                ; 1797 0e
                LR   A,$1                ; 1798 41
;                BT   0,116               ; 1799 80 74
				db   $80,$74
                BF   $6,A175e            ; 179b 96 c2
                LR   Q,DC                ; 179d 0e
                LR   A,$1                ; 179e 41
                OI   $60                 ; 179f 22 60
                LR   $6,A                ; 17a1 56
                AS   $2                  ; 17a2 c2
                LR   Q,DC                ; 17a3 0e
A17a4:          LR   A,$1                ; 17a4 41
;                BF   $8,A1806            ; 17a5 98 60
				db   $98,$60
                LR   $6,A                ; 17a7 56
                AS   $2                  ; 17a8 c2
                LR   QL,A                ; 17a9 07
                LR   $0,A                ; 17aa 50
                LISU 0                   ; 17ab 60
                PI   $ed1a               ; 17ac 28 ed 1a
                LR   Q,DC                ; 17af 0e
                AS   $4                  ; 17b0 c4
                LISU 0                   ; 17b1 60
                DS   $8                  ; 17b2 38
                NS   $6                  ; 17b3 f6
                OUTS 4                   ; 17b4 b4
A17b5:          LR   QL,A                ; 17b5 07
                LR   A,$2                ; 17b6 42
                LR   $0,A                ; 17b7 50
                AS   (IS)                ; 17b8 cc
                INS  12                  ; 17b9 ac
                BT   4,A17c2             ; 17ba 84 07
                LR   A,$2                ; 17bc 42
                LISL 2                   ; 17bd 6a
                AS   (IS)                ; 17be cc
                OUTS 6                   ; 17bf b6
                ASD  (IS)-               ; 17c0 de
A17c1:          LR   (IS)+,A             ; 17c1 5d
A17c2:          LR   A,$5                ; 17c2 45
                INS  8                   ; 17c3 a8
                LISU 0                   ; 17c4 60
                LISU 0                   ; 17c5 60
                DS   $0                  ; 17c6 30
                LR   A,$8                ; 17c7 48
                LR   Q,DC                ; 17c8 0e
                COM                      ; 17c9 18
                LR   KU,A                ; 17ca 04
                OUTS 0                   ; 17cb b0
                LR   QL,A                ; 17cc 07
                INS  8                   ; 17cd a8
                LR   KU,A                ; 17ce 04
                OUTS 0                   ; 17cf b0
                LR   QL,A                ; 17d0 07
                LISU 0                   ; 17d1 60
                LR   DC,H                ; 17d2 10
                LIS  $e                  ; 17d3 7e
                POP                      ; 17d4 1c
                LISU 0                   ; 17d5 60
                LR   $0,A                ; 17d6 50
                NS   $8                  ; 17d7 f8
                LR   A,KL                ; 17d8 01
A17d9:          LR   $0,A                ; 17d9 50
                LR   QL,A                ; 17da 07
                XS   $8                  ; 17db e8
                SR   4                   ; 17dc 14
                LISL 2                   ; 17dd 6a
                LR   QL,A                ; 17de 07
                XS   $8                  ; 17df e8
                SR   4                   ; 17e0 14
                LISU 0                   ; 17e1 60
A17e2:          LR   KU,A                ; 17e2 04
                XS   $8                  ; 17e3 e8
                SR   4                   ; 17e4 14
                LR   A,QL                ; 17e5 03
                LR   A,$0                ; 17e6 40
                LR   DC,H                ; 17e7 10
                LR   A,QL                ; 17e8 03
                DS   $0                  ; 17e9 30
                LI   $03                 ; 17ea 20 03
                PI   $2003               ; 17ec 28 20 03
                DS   $0                  ; 17ef 30
                LI   $03                 ; 17f0 20 03
                DS   $8                  ; 17f2 38
                SR   1                   ; 17f3 12
                db   $ff                 
A17f5:          LISU 4                   ; 17f5 64
                LR   A,IS                ; 17f6 0a
                LR   A,KL                ; 17f7 01
                LR   A,KU                ; 17f8 00
                LR   A,KU                ; 17f9 00
                LR   A,KU                ; 17fa 00
                LR   A,KU                ; 17fb 00
                LR   A,KU                ; 17fc 00
                LR   A,KU                ; 17fd 00
                LR   A,KU                ; 17fe 00
                LR   A,KU                ; 17ff 00
