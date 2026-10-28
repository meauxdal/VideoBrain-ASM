;Word Wise 2 - ED04

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/25/2010

org $1000

				db   $aa,$55			;cart signature
				db   $04				;background color
				db   $00,$00,$0d,$13,$09,$1f,$0d,$01,$21,$0b,$00,$34,$00,$00,$00	;name - WORDWISE 2

START:
                DCI  A17a1               ; 1012 2a 17 a1
                XDC                      ; 1015 2c
                DCI  $0ffa               ; 1016 2a 0f fa
                LISU 2                   ; 1019 62
                LISL 0                   ; 101a 68
                LIS  $6                  ; 101b 76
                LR   $2,A                ; 101c 52
                LR   (IS),A              ; 101d 5c
                PI   $43cd               ; 101e 28 43 cd
                LI   $24                 ; 1021 20 24
                LR   $1,A                ; 1023 51
                DCI  $0f60               ; 1024 2a 0f 60
                LIS  $0                  ; 1027 70
A1028:          ST                       ; 1028 17
                DS   $1                  ; 1029 31
                BF   $4,A1028            ; 102a 94 fd
                DCI  $0c60               ; 102c 2a 0c 60
A102f:          ST                       ; 102f 17
                DS   $2                  ; 1030 32
                BF   $4,A102f            ; 1031 94 fd
                PI   $4762               ; 1033 28 47 62
                DCI  $0f6a               ; 1036 2a 0f 6a
                ST                       ; 1039 17
                DCI  A17c5               ; 103a 2a 17 c5
                XDC                      ; 103d 2c
                DCI  $0820               ; 103e 2a 08 20
                LIS  $a                  ; 1041 7a
                LR   (IS),A              ; 1042 5c
                PI   $43cd               ; 1043 28 43 cd
                DCI  $0840               ; 1046 2a 08 40
                LIS  $a                  ; 1049 7a
                LR   (IS),A              ; 104a 5c
                PI   $43cd               ; 104b 28 43 cd
                DCI  $0850               ; 104e 2a 08 50
                LIS  $a                  ; 1051 7a
                LR   (IS),A              ; 1052 5c
                PI   $43cd               ; 1053 28 43 cd
                DCI  $0870               ; 1056 2a 08 70
                LIS  $a                  ; 1059 7a
                LR   (IS),A              ; 105a 5c
                PI   $43cd               ; 105b 28 43 cd
                JMP  A1236               ; 105e 29 12 36
A1061:          DCI  $0f6a               ; 1061 2a 0f 6a
                LM                       ; 1064 16
                INC                      ; 1065 1f
                CI   $08                 ; 1066 25 08
                BF   $4,A106b            ; 1068 94 02
                LIS  $0                  ; 106a 70
A106b:          DCI  $0f6a               ; 106b 2a 0f 6a
                ST                       ; 106e 17
                DCI  A169f               ; 106f 2a 16 9f
                ADC                      ; 1072 8e
                ADC                      ; 1073 8e
                LM                       ; 1074 16
                LR   $6,A                ; 1075 56
                LR   $5,A                ; 1076 55
                DS   $5                  ; 1077 35
                LM                       ; 1078 16
                DCI  $0c00               ; 1079 2a 0c 00
                ADC                      ; 107c 8e
                LR   Q,DC                ; 107d 0e
                DCI  $0c66               ; 107e 2a 0c 66
                ADC                      ; 1081 8e
                ADC                      ; 1082 8e
                ADC                      ; 1083 8e
                ADC                      ; 1084 8e
                ADC                      ; 1085 8e
                ADC                      ; 1086 8e
                ADC                      ; 1087 8e
A1088:          LR   H,DC                ; 1088 11
                XDC                      ; 1089 2c
                LR   DC,Q                ; 108a 0f
                LIS  $0                  ; 108b 70
                XM                       ; 108c 8c
                LR   Q,DC                ; 108d 0e
                BF   $1,A1094            ; 108e 91 05
                CI   $3a                 ; 1090 25 3a
                BF   $4,A1095            ; 1092 94 02
A1094:          LIS  $0                  ; 1094 70
A1095:          DCI  $2010               ; 1095 2a 20 10
                ADC                      ; 1098 8e
                ADC                      ; 1099 8e
                ADC                      ; 109a 8e
                ADC                      ; 109b 8e
                ADC                      ; 109c 8e
                ADC                      ; 109d 8e
                ADC                      ; 109e 8e
                LIS  $7                  ; 109f 77
                LR   $2,A                ; 10a0 52
A10a1:          LM                       ; 10a1 16
                XDC                      ; 10a2 2c
                ST                       ; 10a3 17
                LR   A,$5                ; 10a4 45
                ADC                      ; 10a5 8e
                XDC                      ; 10a6 2c
                DS   $2                  ; 10a7 32
                BF   $4,A10a1            ; 10a8 94 f8
                LR   DC,H                ; 10aa 10
                CM                       ; 10ab 8d
                DS   $6                  ; 10ac 36
                BF   $4,A1088            ; 10ad 94 da
                DCI  $0f60               ; 10af 2a 0f 60
                LM                       ; 10b2 16
                LR   $7,A                ; 10b3 57
                JMP  A166b               ; 10b4 29 16 6b
A10b7:          DCI  $0c00               ; 10b7 2a 0c 00
                LI   $60                 ; 10ba 20 60
A10bc:          LR   $5,A                ; 10bc 55
                LI   $ff                 ; 10bd 20 ff
A10bf:          ST                       ; 10bf 17
                DS   $5                  ; 10c0 35
                BF   $4,A10bf            ; 10c1 94 fd
                POP                      ; 10c3 1c
A10c4:          DCI  $0c00               ; 10c4 2a 0c 00
                BF   $0,A10cc            ; 10c7 90 04
A10c9:          DCI  $0f30               ; 10c9 2a 0f 30
A10cc:          LI   $30                 ; 10cc 20 30
                BF   $0,A10bc            ; 10ce 90 ed
                DCI  $08f5               ; 10d0 2a 08 f5
                LIS  $3                  ; 10d3 73
                ST                       ; 10d4 17
                PI   A10c4               ; 10d5 28 10 c4
                DCI  $0f7e               ; 10d8 2a 0f 7e
                LIS  $6                  ; 10db 76
                ST                       ; 10dc 17
                DCI  $0f61               ; 10dd 2a 0f 61
                LIS  $0                  ; 10e0 70
                ST                       ; 10e1 17
                DCI  $0f7f               ; 10e2 2a 0f 7f
                LIS  $0                  ; 10e5 70
                ST                       ; 10e6 17
                DCI  $0f61               ; 10e7 2a 0f 61
                LM                       ; 10ea 16
                CI   $31                 ; 10eb 25 31
                BT   4,A1157             ; 10ed 84 69
                DCI  $0f30               ; 10ef 2a 0f 30
                ADC                      ; 10f2 8e
A10f3:          LIS  $0                  ; 10f3 70
                XM                       ; 10f4 8c
                BF   $1,A10fd            ; 10f5 91 07
                CI   $43                 ; 10f7 25 43
                BT   4,A1157             ; 10f9 84 5d
                BF   $0,A10f3            ; 10fb 90 f7
A10fd:          ADC                      ; 10fd 8e
                COM                      ; 10fe 18
                LR   $4,A                ; 10ff 54
                LR   $0,A                ; 1100 50
                LR   Q,DC                ; 1101 0e
                INC                      ; 1102 1f
                DCI  $0f61               ; 1103 2a 0f 61
                LR   H,DC                ; 1106 11
                AM                       ; 1107 88
                LR   DC,H                ; 1108 10
                ST                       ; 1109 17
                LIS  $0                  ; 110a 70
                XS   $4                  ; 110b e4
                BT   4,A114a             ; 110c 84 3d
                LR   A,QL                ; 110e 03
                DCI  $0f7c               ; 110f 2a 0f 7c
                ST                       ; 1112 17
                LR   DC,Q                ; 1113 0f
A1114:          LM                       ; 1114 16
                LR   $2,A                ; 1115 52
                PI   $4795               ; 1116 28 47 95
A1119:          LR   $5,A                ; 1119 55
                LR   A,$4                ; 111a 44
                COM                      ; 111b 18
                INC                      ; 111c 1f
                AS   $5                  ; 111d c5
                BT   2,A1122             ; 111e 82 03
                BF   $0,A1126            ; 1120 90 05
A1122:          LR   A,$5                ; 1122 45
                SR   1                   ; 1123 12
                BF   $0,A1119            ; 1124 90 f4
A1126:          DCI  $0c30               ; 1126 2a 0c 30
                LR   Q,DC                ; 1129 0e
                DCI  $0f7c               ; 112a 2a 0f 7c
                LM                       ; 112d 16
                AI   $d0                 ; 112e 24 d0
                LR   QL,A                ; 1130 07
                LR   A,$5                ; 1131 45
                LR   DC,Q                ; 1132 0f
                ADC                      ; 1133 8e
                LR   H,DC                ; 1134 11
                LI   $ff                 ; 1135 20 ff
                CM                       ; 1137 8d
                BF   $4,A115a            ; 1138 94 21
A113a:          LR   DC,H                ; 113a 10
                LR   A,$2                ; 113b 42
                ST                       ; 113c 17
                LR   $8,A                ; 113d 58
                DCI  $0f7f               ; 113e 2a 0f 7f
                LM                       ; 1141 16
                INC                      ; 1142 1f
                DCI  $0f7f               ; 1143 2a 0f 7f
                ST                       ; 1146 17
                DS   $0                  ; 1147 30
                BF   $4,A114d            ; 1148 94 04
A114a:          LIS  $1                  ; 114a 71
                BF   $0,A114e            ; 114b 90 02
A114d:          LIS  $9                  ; 114d 79
A114e:          DCI  $0f60               ; 114e 2a 0f 60
                ST                       ; 1151 17
                LIS  $0                  ; 1152 70
                LR   $7,A                ; 1153 57
                JMP  A1373               ; 1154 29 13 73
A1157:          JMP  A1181               ; 1157 29 11 81
A115a:          LIS  $0                  ; 115a 70
                XS   $5                  ; 115b e5
                BF   $4,A1122            ; 115c 94 c5
                LR   DC,Q                ; 115e 0f
                LR   A,$4                ; 115f 44
                LR   $1,A                ; 1160 51
                DS   $1                  ; 1161 31
A1162:          LR   A,$1                ; 1162 41
                ADC                      ; 1163 8e
                LR   H,DC                ; 1164 11
                LM                       ; 1165 16
                CI   $ff                 ; 1166 25 ff
                BT   4,A113a             ; 1168 84 d1
                DS   $1                  ; 116a 31
                LR   DC,Q                ; 116b 0f
                BT   1,A1162             ; 116c 81 f5
                BF   $0,A113a            ; 116e 90 cb
                DCI  $0f30               ; 1170 2a 0f 30
                LR   Q,DC                ; 1173 0e
                DCI  $0f7c               ; 1174 2a 0f 7c
                LM                       ; 1177 16
                LR   QL,A                ; 1178 07
                DCI  $0f7f               ; 1179 2a 0f 7f
                LM                       ; 117c 16
                LR   DC,Q                ; 117d 0f
                ADC                      ; 117e 8e
                BF   $0,A1114            ; 117f 90 94
A1181:          DCI  $0f61               ; 1181 2a 0f 61
                LIS  $0                  ; 1184 70
                ST                       ; 1185 17
                PI   A1226               ; 1186 28 12 26
                DCI  $0f7d               ; 1189 2a 0f 7d
                LIS  $6                  ; 118c 76
                ST                       ; 118d 17
                PI   A1355               ; 118e 28 13 55
                PI   A15f8               ; 1191 28 15 f8
                JMP  A1494               ; 1194 29 14 94
                LIS  $0                  ; 1197 70
                XS   $1                  ; 1198 e1
                BF   $1,A11ae            ; 1199 91 14
                BT   4,A11ae             ; 119b 84 12
                CI   $43                 ; 119d 25 43
                BT   4,A11b3             ; 119f 84 13
A11a1:          PI   A11c7               ; 11a1 28 11 c7
                DCI  $0f64               ; 11a4 2a 0f 64
                LIS  $1                  ; 11a7 71
                CM                       ; 11a8 8d
                BF   $4,A11ae            ; 11a9 94 04
                LIS  $4                  ; 11ab 74
                BF   $0,A11af            ; 11ac 90 02
A11ae:          LIS  $3                  ; 11ae 73
A11af:          LR   $7,A                ; 11af 57
                JMP  A166b               ; 11b0 29 16 6b
A11b3:          DCI  $0f63               ; 11b3 2a 0f 63
                LIS  $1                  ; 11b6 71
                CM                       ; 11b7 8d
                BF   $4,A11bc            ; 11b8 94 03
                BF   $0,A11a1            ; 11ba 90 e6
A11bc:          LI   $ff                 ; 11bc 20 ff
                LR   $1,A                ; 11be 51
                LIS  $5                  ; 11bf 75
                LR   $3,A                ; 11c0 53
                PI   A15a4               ; 11c1 28 15 a4
                JMP  A1393               ; 11c4 29 13 93
A11c7:          LR   K,P                 ; 11c7 08
                PI   $40a9               ; 11c8 28 40 a9
                DCI  $0f61               ; 11cb 2a 0f 61
                LM                       ; 11ce 16
                DCI  $0f2f               ; 11cf 2a 0f 2f
                ADC                      ; 11d2 8e
                LR   A,$1                ; 11d3 41
                CI   $3f                 ; 11d4 25 3f
                BT   4,A11e5             ; 11d6 84 0e
                CM                       ; 11d8 8d
                BF   $4,A11e9            ; 11d9 94 0f
                LIS  $1                  ; 11db 71
                LR   $3,A                ; 11dc 53
                LR   $1,A                ; 11dd 51
                PI   A15a4               ; 11de 28 15 a4
A11e1:          PI   $40bc               ; 11e1 28 40 bc
                PK                       ; 11e4 0c
                
A11e5:          LIS  $0                  ; 11e5 70
                XM                       ; 11e6 8c
                BF   $1,A11e1            ; 11e7 91 f9
A11e9:          LIS  $f                  ; 11e9 7f
                LR   $8,A                ; 11ea 58
                LIS  $8                  ; 11eb 78
A11ec:          DCI  $0f60               ; 11ec 2a 0f 60
                ST                       ; 11ef 17
                LIS  $0                  ; 11f0 70
                LR   $7,A                ; 11f1 57
A11f2:          JMP  A1373               ; 11f2 29 13 73
                DS   $8                  ; 11f5 38
                BF   $4,A11f2            ; 11f6 94 fb
                BF   $0,A11e1            ; 11f8 90 e8
                LIS  $0                  ; 11fa 70
                DCI  $0f6a               ; 11fb 2a 0f 6a
                CM                       ; 11fe 8d
                BT   4,A1205             ; 11ff 84 05
                LR   $7,A                ; 1201 57
                JMP  A166b               ; 1202 29 16 6b
A1205:          DS   $1                  ; 1205 31
                BF   $4,A120b            ; 1206 94 04
                JMP  A144a               ; 1208 29 14 4a
A120b:          LR   A,$1                ; 120b 41
                DCI  A17fa               ; 120c 2a 17 fa
                ADC                      ; 120f 8e
                LM                       ; 1210 16
                LR   $8,A                ; 1211 58
                LIS  $c                  ; 1212 7c
                BF   $0,A11ec            ; 1213 90 d8
A1215:          DCI  $0f67               ; 1215 2a 0f 67
                LR   A,$8                ; 1218 48
                CM                       ; 1219 8d
                BT   4,A1221             ; 121a 84 06
                DCI  $0f67               ; 121c 2a 0f 67
                ST                       ; 121f 17
A1220:          POP                      ; 1220 1c
A1221:          LI   $80                 ; 1221 20 80
                LR   $8,A                ; 1223 58
                BF   $0,A1220            ; 1224 90 fb
A1226:          DCI  $0f68               ; 1226 2a 0f 68
                LM                       ; 1229 16
                INC                      ; 122a 1f
                LR   $0,A                ; 122b 50
                DCI  $0c30               ; 122c 2a 0c 30
                LI   $12                 ; 122f 20 12
A1231:          ST                       ; 1231 17
                DS   $0                  ; 1232 30
                BF   $4,A1231            ; 1233 94 fd
                POP                      ; 1235 1c
A1236:          DCI  A16ef               ; 1236 2a 16 ef
                XDC                      ; 1239 2c
                LI   $3c                 ; 123a 20 3c
                LR   (IS),A              ; 123c 5c
                DCI  $0c00               ; 123d 2a 0c 00
                PI   A1340               ; 1240 28 13 40
                DCI  $0f69               ; 1243 2a 0f 69
                LIS  $2                  ; 1246 72
                ST                       ; 1247 17
                DCI  $0f78               ; 1248 2a 0f 78
                LI   $20                 ; 124b 20 20
                ST                       ; 124d 17
A124e:          PI   A1302               ; 124e 28 13 02
                BF   $1,A124e            ; 1251 91 fc
                BT   4,A124e             ; 1253 84 fa
                CI   $04                 ; 1255 25 04
                BF   $2,A124e            ; 1257 92 f6
                CI   $01                 ; 1259 25 01
                BT   4,A1274             ; 125b 84 18
                CI   $02                 ; 125d 25 02
                BT   4,A12d9             ; 125f 84 79
                CI   $03                 ; 1261 25 03
                BT   4,A12c5             ; 1263 84 61
                DCI  $0f78               ; 1265 2a 0f 78
                LI   $50                 ; 1268 20 50
                ST                       ; 126a 17
                DCI  $0f68               ; 126b 2a 0f 68
                LI   $2d                 ; 126e 20 2d
                ST                       ; 1270 17
                JMP  A1393               ; 1271 29 13 93
A1274:          LIS  $0                  ; 1274 70
                LR   $3,A                ; 1275 53
                DCI  $0c00               ; 1276 2a 0c 00
                LIS  $3                  ; 1279 73
                LR   $1,A                ; 127a 51
A127b:          LIS  $2                  ; 127b 72
                LR   $0,A                ; 127c 50
                LIS  $a                  ; 127d 7a
A127e:          LR   (IS),A              ; 127e 5c
                XDC                      ; 127f 2c
                LR   A,$3                ; 1280 43
                DCI  A172b               ; 1281 2a 17 2b
                ADC                      ; 1284 8e
                XDC                      ; 1285 2c
                PI   $43cd               ; 1286 28 43 cd
                LIS  $6                  ; 1289 76
                DS   $0                  ; 128a 30
                BF   $4,A127e            ; 128b 94 f2
                LR   A,$3                ; 128d 43
                AI   $0a                 ; 128e 24 0a
                LR   $3,A                ; 1290 53
                DS   $1                  ; 1291 31
                BF   $4,A127b            ; 1292 94 e8
A1294:          LI   $2f                 ; 1294 20 2f
A1296:          DCI  $0f68               ; 1296 2a 0f 68
                ST                       ; 1299 17
                DCI  $0f7e               ; 129a 2a 0f 7e
                LIS  $6                  ; 129d 76
                ST                       ; 129e 17
                DCI  $0fea               ; 129f 2a 0f ea
                LI   $44                 ; 12a2 20 44
                ST                       ; 12a4 17
                LIS  $1                  ; 12a5 71
                DCI  $0f63               ; 12a6 2a 0f 63
                ST                       ; 12a9 17
                DCI  $0c00               ; 12aa 2a 0c 00
                XDC                      ; 12ad 2c
                LI   $30                 ; 12ae 20 30
                LR   (IS),A              ; 12b0 5c
                DCI  $0f30               ; 12b1 2a 0f 30
                PI   $43cd               ; 12b4 28 43 cd
                LIS  $5                  ; 12b7 75
                DCI  $0f60               ; 12b8 2a 0f 60
                ST                       ; 12bb 17
                LIS  $0                  ; 12bc 70
                LR   $7,A                ; 12bd 57
                DCI  $08f5               ; 12be 2a 08 f5
                ST                       ; 12c1 17
                JMP  A166b               ; 12c2 29 16 6b
A12c5:          PI   A10b7               ; 12c5 28 10 b7
                DCI  A1773               ; 12c8 2a 17 73
                XDC                      ; 12cb 2c
                DCI  $0c00               ; 12cc 2a 0c 00
                LI   $2d                 ; 12cf 20 2d
                LR   (IS),A              ; 12d1 5c
                PI   $43cd               ; 12d2 28 43 cd
                LI   $2c                 ; 12d5 20 2c
                BF   $0,A1296            ; 12d7 90 be
A12d9:          LI   $1e                 ; 12d9 20 1e
                LR   $2,A                ; 12db 52
                DCI  $0c00               ; 12dc 2a 0c 00
                XDC                      ; 12df 2c
A12e0:          LIS  $0                  ; 12e0 70
A12e1:          LR   $0,A                ; 12e1 50
                DCI  A172b               ; 12e2 2a 17 2b
                ADC                      ; 12e5 8e
                LIS  $3                  ; 12e6 73
                LR   $1,A                ; 12e7 51
A12e8:          LM                       ; 12e8 16
                XDC                      ; 12e9 2c
                ST                       ; 12ea 17
                XDC                      ; 12eb 2c
                LIS  $9                  ; 12ec 79
                ADC                      ; 12ed 8e
                DS   $2                  ; 12ee 32
                BT   4,A12f8             ; 12ef 84 08
                DS   $1                  ; 12f1 31
                BF   $4,A12e8            ; 12f2 94 f5
                LR   A,$0                ; 12f4 40
                INC                      ; 12f5 1f
                BF   $0,A12e1            ; 12f6 90 ea
A12f8:          LR   A,$0                ; 12f8 40
                CI   $09                 ; 12f9 25 09
                BF   $4,A1294            ; 12fb 94 98
                LI   $12                 ; 12fd 20 12
                LR   $2,A                ; 12ff 52
                BF   $0,A12e0            ; 1300 90 df
A1302:          LR   K,P                 ; 1302 08
                PI   $40a9               ; 1303 28 40 a9
                LIS  $0                  ; 1306 70
                LR   $0,A                ; 1307 50
                LIS  $7                  ; 1308 77
                DCI  $0f60               ; 1309 2a 0f 60
                ST                       ; 130c 17
A130d:          PI   $4361               ; 130d 28 43 61
                LIS  $4                  ; 1310 74
                LR   $2,A                ; 1311 52
                LIS  $0                  ; 1312 70
                XS   $8                  ; 1313 e8
                BF   $1,A130d            ; 1314 91 f8
                PI   A1215               ; 1316 28 12 15
                LIS  $0                  ; 1319 70
                XS   $8                  ; 131a e8
                BF   $1,A132f            ; 131b 91 13
                DCI  A17ed               ; 131d 2a 17 ed
A1320:          CM                       ; 1320 8d
                BT   4,A133a             ; 1321 84 18
                DS   $2                  ; 1323 32
                BF   $4,A1320            ; 1324 94 fb
                CI   $22                 ; 1326 25 22
                BT   4,A132c             ; 1328 84 03
                BF   $0,A132f            ; 132a 90 04
A132c:          LIS  $0                  ; 132c 70
                BF   $0,A1339            ; 132d 90 0b
A132f:          DS   $0                  ; 132f 30
                BT   4,A1337             ; 1330 84 06
                LIS  $0                  ; 1332 70
                LR   $7,A                ; 1333 57
                JMP  A166b               ; 1334 29 16 6b
A1337:          LI   $80                 ; 1337 20 80
A1339:          LR   $2,A                ; 1339 52
A133a:          PI   $40bc               ; 133a 28 40 bc
                LIS  $0                  ; 133d 70
                XS   $2                  ; 133e e2
                PK                       ; 133f 0c
                
A1340:          XDC                      ; 1340 2c
A1341:          LIS  $0                  ; 1341 70
                XM                       ; 1342 8c
                XDC                      ; 1343 2c
                BF   $1,A134c            ; 1344 91 07
                ST                       ; 1346 17
A1347:          DS   (IS)                ; 1347 3c
                XDC                      ; 1348 2c
                BF   $4,A1341            ; 1349 94 f7
                POP                      ; 134b 1c
A134c:          COM                      ; 134c 18
                LR   $0,A                ; 134d 50
                LIS  $0                  ; 134e 70
A134f:          ST                       ; 134f 17
                DS   $0                  ; 1350 30
                BF   $4,A134f            ; 1351 94 fd
                BF   $0,A1347            ; 1353 90 f3
A1355:          LIS  $a                  ; 1355 7a
                LR   $1,A                ; 1356 51
                DCI  $0870               ; 1357 2a 08 70
A135a:          LR   Q,DC                ; 135a 0e
                LM                       ; 135b 16
                NI   $7f                 ; 135c 21 7f
                LR   DC,Q                ; 135e 0f
                ST                       ; 135f 17
                DS   $1                  ; 1360 31
                BF   $4,A135a            ; 1361 94 f8
                POP                      ; 1363 1c
A1364:          LIS  $4                  ; 1364 74
                LR   $1,A                ; 1365 51
                DCI  $0876               ; 1366 2a 08 76
A1369:          LR   Q,DC                ; 1369 0e
                LM                       ; 136a 16
                XI   $80                 ; 136b 23 80
                LR   DC,Q                ; 136d 0f
                ST                       ; 136e 17
                DS   $1                  ; 136f 31
                BF   $4,A1369            ; 1370 94 f8
                POP                      ; 1372 1c
A1373:          LIS  $0                  ; 1373 70
                LR   $5,A                ; 1374 55
A1375:          DCI  $08fb               ; 1375 2a 08 fb
                LM                       ; 1378 16
                CI   $b8                 ; 1379 25 b8
                BT   2,A1380             ; 137b 82 04
                JMP  A166b               ; 137d 29 16 6b
A1380:          AS   $8                  ; 1380 c8
A1381:          DCI  $08fb               ; 1381 2a 08 fb
                CM                       ; 1384 8d
                BF   $4,A1381            ; 1385 94 fb
                LI   $10                 ; 1387 20 10
                OUTS 1                   ; 1389 b1
                LR   A,$5                ; 138a 45
                XI   $07                 ; 138b 23 07
                LR   $5,A                ; 138d 55
                OUTS 0                   ; 138e b0
                LIS  $0                  ; 138f 70
                OUTS 1                   ; 1390 b1
                BF   $0,A1375            ; 1391 90 e3
A1393:          DCI  $0f76               ; 1393 2a 0f 76
                LIS  $0                  ; 1396 70
                ST                       ; 1397 17
                DCI  $0f63               ; 1398 2a 0f 63
                LIS  $1                  ; 139b 71
                CM                       ; 139c 8d
                BF   $4,A13c1            ; 139d 94 23
                PI   A10b7               ; 139f 28 10 b7
                PI   A1364               ; 13a2 28 13 64
                DCI  $0c60               ; 13a5 2a 0c 60
                XDC                      ; 13a8 2c
                LIS  $2                  ; 13a9 72
                LR   (IS),A              ; 13aa 5c
                DCI  $0c44               ; 13ab 2a 0c 44
                PI   $43cd               ; 13ae 28 43 cd
                XDC                      ; 13b1 2c
                DCI  A176f               ; 13b2 2a 17 6f
                XDC                      ; 13b5 2c
                LIS  $4                  ; 13b6 74
                LR   (IS),A              ; 13b7 5c
                PI   $43cd               ; 13b8 28 43 cd
                PI   A1302               ; 13bb 28 13 02
                JMP  $4000               ; 13be 29 40 00
A13c1:          LR   H,DC                ; 13c1 11
                LM                       ; 13c2 16
                CI   $01                 ; 13c3 25 01
                BT   4,A13f2             ; 13c5 84 2c
                LIS  $2                  ; 13c7 72
                LR   DC,H                ; 13c8 10
                ST                       ; 13c9 17
                BT   3,A13f5             ; 13ca 83 2a
                DCI  $08f5               ; 13cc 2a 08 f5
                LIS  $5                  ; 13cf 75
                ST                       ; 13d0 17
                DCI  $0f30               ; 13d1 2a 0f 30
                LR   Q,DC                ; 13d4 0e
                LI   $30                 ; 13d5 20 30
                LR   (IS),A              ; 13d7 5c
                LR   $1,A                ; 13d8 51
                LI   $43                 ; 13d9 20 43
A13db:          CM                       ; 13db 8d
                BT   4,A13e3             ; 13dc 84 06
                DS   $1                  ; 13de 31
                BF   $4,A13db            ; 13df 94 fb
                BF   $0,A13e7            ; 13e1 90 05
A13e3:          LI   $ff                 ; 13e3 20 ff
                ADC                      ; 13e5 8e
                ST                       ; 13e6 17
A13e7:          LR   DC,Q                ; 13e7 0f
                XDC                      ; 13e8 2c
                DCI  $0c00               ; 13e9 2a 0c 00
                PI   $43cd               ; 13ec 28 43 cd
                PI   A1302               ; 13ef 28 13 02
A13f2:          PI   A1364               ; 13f2 28 13 64
A13f5:          DCI  $08f5               ; 13f5 2a 08 f5
                LIS  $2                  ; 13f8 72
                ST                       ; 13f9 17
                PI   A10b7               ; 13fa 28 10 b7
                PI   A1559               ; 13fd 28 15 59
                DCI  $0c60               ; 1400 2a 0c 60
                LIS  $0                  ; 1403 70
                ST                       ; 1404 17
                ST                       ; 1405 17
                ST                       ; 1406 17
                ST                       ; 1407 17
                DCI  $0f69               ; 1408 2a 0f 69
                LR   H,DC                ; 140b 11
                LM                       ; 140c 16
                XI   $03                 ; 140d 23 03
                LR   DC,H                ; 140f 10
                ST                       ; 1410 17
                DCI  $0c00               ; 1411 2a 0c 00
                XDC                      ; 1414 2c
                SR   1                   ; 1415 12
                BF   $4,A1421            ; 1416 94 0a
                DCI  A174d               ; 1418 2a 17 4d
                XDC                      ; 141b 2c
                LI   $30                 ; 141c 20 30
                ADC                      ; 141e 8e
                BF   $0,A1425            ; 141f 90 05
A1421:          DCI  A1749               ; 1421 2a 17 49
                XDC                      ; 1424 2c
A1425:          LIS  $4                  ; 1425 74
                LR   (IS),A              ; 1426 5c
                PI   $43cd               ; 1427 28 43 cd
                XDC                      ; 142a 2c
                DCI  $0f64               ; 142b 2a 0f 64
                LIS  $1                  ; 142e 71
                CM                       ; 142f 8d
                BT   4,A143d             ; 1430 84 0c
                DCI  A175b               ; 1432 2a 17 5b
                XDC                      ; 1435 2c
                LIS  $a                  ; 1436 7a
                LR   (IS),A              ; 1437 5c
                PI   $43cd               ; 1438 28 43 cd
                BF   $0,A144a            ; 143b 90 0e
A143d:          DCI  A1751               ; 143d 2a 17 51
                XDC                      ; 1440 2c
                LIS  $5                  ; 1441 75
                LR   (IS),A              ; 1442 5c
                LR   $1,A                ; 1443 51
                PI   A1340               ; 1444 28 13 40
                LIS  $c                  ; 1447 7c
                BF   $0,A144e            ; 1448 90 05
A144a:          PI   A10c9               ; 144a 28 10 c9
                LIS  $b                  ; 144d 7b
A144e:          DCI  $0f60               ; 144e 2a 0f 60
                ST                       ; 1451 17
                LIS  $0                  ; 1452 70
                LR   $7,A                ; 1453 57
                JMP  A166b               ; 1454 29 16 6b
A1457:          PI   A1302               ; 1457 28 13 02
                BT   4,A145e             ; 145a 84 03
                BF   $0,A1457            ; 145c 90 fa
A145e:          PI   A10b7               ; 145e 28 10 b7
                DCI  $0f7d               ; 1461 2a 0f 7d
                LIS  $3                  ; 1464 73
                ST                       ; 1465 17
                AI   $ff                 ; 1466 24 ff
                ST                       ; 1468 17
                DCI  $0f61               ; 1469 2a 0f 61
                LIS  $0                  ; 146c 70
                ST                       ; 146d 17
                DCI  $0f64               ; 146e 2a 0f 64
                LIS  $1                  ; 1471 71
                CM                       ; 1472 8d
                BF   $4,A1478            ; 1473 94 04
                JMP  $4000               ; 1475 29 40 00
A1478:          PI   A1226               ; 1478 28 12 26
                DCI  $1761               ; 147b 2a 17 61
                LIS  $f                  ; 147e 7f
                LR   (IS),A              ; 147f 5c
                XDC                      ; 1480 2c
                DCI  $0c00               ; 1481 2a 0c 00
                PI   A1340               ; 1484 28 13 40
                LIS  $2                  ; 1487 72
                DCI  $0f69               ; 1488 2a 0f 69
                CM                       ; 148b 8d
                LIS  $4                  ; 148c 74
                BT   4,A1490             ; 148d 84 02
                LIS  $1                  ; 148f 71
A1490:          DCI  $08f5               ; 1490 2a 08 f5
                ST                       ; 1493 17
A1494:          PI   $4361               ; 1494 28 43 61
                PI   A1215               ; 1497 28 12 15
                LIS  $0                  ; 149a 70
                XS   $8                  ; 149b e8
                LR   $1,A                ; 149c 51
                BF   $1,A14e1            ; 149d 91 43
                BT   4,A14e1             ; 149f 84 41
                SL   1                   ; 14a1 13
                AI   $ff                 ; 14a2 24 ff
                LR   $1,A                ; 14a4 51
                CI   $3b                 ; 14a5 25 3b
                BT   4,A14e1             ; 14a7 84 39
                CI   $3d                 ; 14a9 25 3d
                BT   4,A14e1             ; 14ab 84 35
                CI   $41                 ; 14ad 25 41
                BT   4,A14e1             ; 14af 84 31
                CI   $45                 ; 14b1 25 45
                BT   4,A14e1             ; 14b3 84 2d
                LIS  $a                  ; 14b5 7a
                LR   $7,A                ; 14b6 57
                JMP  A1373               ; 14b7 29 13 73
A14ba:          DCI  $0f61               ; 14ba 2a 0f 61
                LR   H,DC                ; 14bd 11
                LM                       ; 14be 16
                DCI  $0f68               ; 14bf 2a 0f 68
                CM                       ; 14c2 8d
                LR   J,W                 ; 14c3 1e
                INC                      ; 14c4 1f
                LR   DC,H                ; 14c5 10
                ST                       ; 14c6 17
                DCI  $0c2f               ; 14c7 2a 0c 2f
                ADC                      ; 14ca 8e
                LR   A,$1                ; 14cb 41
                CI   $43                 ; 14cc 25 43
                BT   4,A1523             ; 14ce 84 54
                CI   $47                 ; 14d0 25 47
                BT   4,A14ec             ; 14d2 84 19
                LR   W,J                 ; 14d4 1d
                BF   $2,A1507            ; 14d5 92 31
                CI   $3f                 ; 14d7 25 3f
                BT   4,A14de             ; 14d9 84 04
                ST                       ; 14db 17
                BF   $0,A14e1            ; 14dc 90 04
A14de:          LI   $ff                 ; 14de 20 ff
                ST                       ; 14e0 17
A14e1:          DCI  $0f7d               ; 14e1 2a 0f 7d
                LM                       ; 14e4 16
A14e5:          DCI  $0f60               ; 14e5 2a 0f 60
                ST                       ; 14e8 17
                JMP  A1061               ; 14e9 29 10 61
A14ec:          LI   $ff                 ; 14ec 20 ff
                ADC                      ; 14ee 8e
                LR   Q,DC                ; 14ef 0e
                DCI  $0f61               ; 14f0 2a 0f 61
                LI   $fe                 ; 14f3 20 fe
                AM                       ; 14f5 88
                BF   $1,A1504            ; 14f6 91 0d
                LR   $5,A                ; 14f8 55
                LR   DC,Q                ; 14f9 0f
                LI   $12                 ; 14fa 20 12
                ST                       ; 14fc 17
                LR   A,$5                ; 14fd 45
A14fe:          DCI  $0f61               ; 14fe 2a 0f 61
                ST                       ; 1501 17
                BF   $0,A14e1            ; 1502 90 de
A1504:          LIS  $0                  ; 1504 70
                BF   $0,A14fe            ; 1505 90 f8
A1507:          LIS  $0                  ; 1507 70
                DCI  $0f63               ; 1508 2a 0f 63
                CM                       ; 150b 8d
                BF   $4,A1519            ; 150c 94 0c
A150e:          DCI  $0f61               ; 150e 2a 0f 61
                LR   Q,DC                ; 1511 0e
                LI   $ff                 ; 1512 20 ff
                AM                       ; 1514 88
                LR   DC,Q                ; 1515 0f
                ST                       ; 1516 17
                BF   $0,A14e1            ; 1517 90 c9
A1519:          LIS  $0                  ; 1519 70
                DCI  $0f61               ; 151a 2a 0f 61
                ST                       ; 151d 17
                PI   A1226               ; 151e 28 12 26
                BF   $0,A14ba            ; 1521 90 98
A1523:          LR   H,DC                ; 1523 11
                DCI  $0f7d               ; 1524 2a 0f 7d
                LIS  $6                  ; 1527 76
                CM                       ; 1528 8d
                BT   4,A150e             ; 1529 84 e4
                LR   DC,H                ; 152b 10
                LI   $ff                 ; 152c 20 ff
                ST                       ; 152e 17
                DCI  $0f61               ; 152f 2a 0f 61
                LM                       ; 1532 16
                LR   $0,A                ; 1533 50
                LIS  $0                  ; 1534 70
                LR   $2,A                ; 1535 52
                DCI  $0f30               ; 1536 2a 0f 30
                XDC                      ; 1539 2c
                DCI  $0c30               ; 153a 2a 0c 30
A153d:          LIS  $0                  ; 153d 70
                XM                       ; 153e 8c
                XDC                      ; 153f 2c
                BT   1,A1548             ; 1540 81 07
                LR   A,$2                ; 1542 42
                COM                      ; 1543 18
                ST                       ; 1544 17
                LIS  $0                  ; 1545 70
                BF   $0,A154b            ; 1546 90 04
A1548:          ST                       ; 1548 17
                LR   A,$2                ; 1549 42
                INC                      ; 154a 1f
A154b:          LR   $2,A                ; 154b 52
                XDC                      ; 154c 2c
                DS   $0                  ; 154d 30
                BF   $4,A153d            ; 154e 94 ee
                XDC                      ; 1550 2c
                LR   A,$1                ; 1551 41
                ST                       ; 1552 17
                DCI  $0f7e               ; 1553 2a 0f 7e
                LM                       ; 1556 16
                BF   $0,A14e5            ; 1557 90 8d
A1559:          LR   K,P                 ; 1559 08
                PI   $40a9               ; 155a 28 40 a9
                LIS  $2                  ; 155d 72
                LR   $8,A                ; 155e 58
                LR   $4,A                ; 155f 54
                LR   $1,A                ; 1560 51
                DCI  A1749               ; 1561 2a 17 49
                XDC                      ; 1564 2c
                LIS  $8                  ; 1565 78
                LR   (IS),A              ; 1566 5c
                DCI  $0c10               ; 1567 2a 0c 10
                PI   A1340               ; 156a 28 13 40
                DCI  $0c15               ; 156d 2a 0c 15
A1570:          XDC                      ; 1570 2c
                LIS  $5                  ; 1571 75
                LR   (IS),A              ; 1572 5c
                DCI  $1756               ; 1573 2a 17 56
                XDC                      ; 1576 2c
                PI   $43cd               ; 1577 28 43 cd
                LI   $2b                 ; 157a 20 2b
                ADC                      ; 157c 8e
                DS   $1                  ; 157d 31
                BF   $4,A1570            ; 157e 94 f1
                DCI  A1767               ; 1580 2a 17 67
                XDC                      ; 1583 2c
                LIS  $8                  ; 1584 78
                LR   (IS),A              ; 1585 5c
                DCI  $0c50               ; 1586 2a 0c 50
                PI   $43cd               ; 1589 28 43 cd
                DCI  $0c1e               ; 158c 2a 0c 1e
                XDC                      ; 158f 2c
                DCI  $0f6e               ; 1590 2a 0f 6e
A1593:          LIS  $2                  ; 1593 72
                LR   $5,A                ; 1594 55
                PI   A164c               ; 1595 28 16 4c
                XDC                      ; 1598 2c
                LI   $34                 ; 1599 20 34
                ADC                      ; 159b 8e
                XDC                      ; 159c 2c
                DS   $4                  ; 159d 34
                BF   $4,A1593            ; 159e 94 f4
                PI   $40bc               ; 15a0 28 40 bc
                PK                       ; 15a3 0c
                
A15a4:          LR   K,P                 ; 15a4 08
A15a5:          LIS  $1                  ; 15a5 71
                LR   $2,A                ; 15a6 52
                LIS  $2                  ; 15a7 72
                LR   $5,A                ; 15a8 55
                DCI  $0f69               ; 15a9 2a 0f 69
                LM                       ; 15ac 16
                AI   $ff                 ; 15ad 24 ff
                DCI  $0f6e               ; 15af 2a 0f 6e
                SL   1                   ; 15b2 13
                ADC                      ; 15b3 8e
                LR   H,DC                ; 15b4 11
                DCI  $0f78               ; 15b5 2a 0f 78
                LIS  $0                  ; 15b8 70
                XS   $1                  ; 15b9 e1
                BT   1,A15bf             ; 15ba 81 04
                DCI  $0f73               ; 15bc 2a 0f 73
A15bf:          COM                      ; 15bf 18
                LR   J,W                 ; 15c0 1e
A15c1:          LM                       ; 15c1 16
                LR   W,J                 ; 15c2 1d
                LNK                      ; 15c3 19
                LR   J,W                 ; 15c4 1e
                AI   $66                 ; 15c5 24 66
                XDC                      ; 15c7 2c
                LR   DC,H                ; 15c8 10
                AMD                      ; 15c9 89
                LR   DC,H                ; 15ca 10
                ST                       ; 15cb 17
                LR   H,DC                ; 15cc 11
                XDC                      ; 15cd 2c
                BF   $2,A15d1            ; 15ce 92 02
                LR   J,W                 ; 15d0 1e
A15d1:          DS   $5                  ; 15d1 35
                BF   $4,A15c1            ; 15d2 94 ee
                LR   W,J                 ; 15d4 1d
                BT   2,A15dc             ; 15d5 82 06
                DS   $3                  ; 15d7 33
                BF   $4,A15a5            ; 15d8 94 cc
                BF   $0,A15e9            ; 15da 90 0e
A15dc:          LR   DC,H                ; 15dc 10
                LI   $fe                 ; 15dd 20 fe
                ADC                      ; 15df 8e
                LI   $99                 ; 15e0 20 99
                ST                       ; 15e2 17
                ST                       ; 15e3 17
                DCI  $0f64               ; 15e4 2a 0f 64
                LIS  $1                  ; 15e7 71
                ST                       ; 15e8 17
A15e9:          DCI  $0c62               ; 15e9 2a 0c 62
                XDC                      ; 15ec 2c
                LI   $fe                 ; 15ed 20 fe
                LR   DC,H                ; 15ef 10
                ADC                      ; 15f0 8e
                LIS  $2                  ; 15f1 72
                LR   $5,A                ; 15f2 55
                PI   A164c               ; 15f3 28 16 4c
                LR   W,J                 ; 15f6 1d
                PK                       ; 15f7 0c
                
A15f8:          DCI  $0f63               ; 15f8 2a 0f 63
                LIS  $1                  ; 15fb 71
                CM                       ; 15fc 8d
                BF   $4,A1603            ; 15fd 94 05
                LI   $60                 ; 15ff 20 60
                BF   $0,A1605            ; 1601 90 03
A1603:          LI   $99                 ; 1603 20 99
A1605:          DCI  $0f73               ; 1605 2a 0f 73
                ST                       ; 1608 17
                LI   $99                 ; 1609 20 99
                DCI  $0f75               ; 160b 2a 0f 75
                ST                       ; 160e 17
                ST                       ; 160f 17
                POP                      ; 1610 1c
A1611:          LR   K,P                 ; 1611 08
                LISU 4                   ; 1612 64
                LISL 0                   ; 1613 68
                DS   (IS)                ; 1614 3c
                BF   $4,A164b            ; 1615 94 35
                LI   $3c                 ; 1617 20 3c
                LR   (IS),A              ; 1619 5c
                DCI  $0f76               ; 161a 2a 0f 76
                LIS  $0                  ; 161d 70
                XM                       ; 161e 8c
                BT   4,A164b             ; 161f 84 2b
                DCI  $0f75               ; 1621 2a 0f 75
                LM                       ; 1624 16
                AI   $66                 ; 1625 24 66
                DCI  $0f73               ; 1627 2a 0f 73
                LR   H,DC                ; 162a 11
                AMD                      ; 162b 89
                LR   DC,H                ; 162c 10
                ST                       ; 162d 17
                LR   J,W                 ; 162e 1e
                DCI  $0c64               ; 162f 2a 0c 64
                XDC                      ; 1632 2c
                LR   DC,H                ; 1633 10
                LIS  $1                  ; 1634 71
                LR   $5,A                ; 1635 55
                PI   A164c               ; 1636 28 16 4c
                LR   W,J                 ; 1639 1d
                BF   $4,A164b            ; 163a 94 10
                DCI  $0f73               ; 163c 2a 0f 73
                LIS  $0                  ; 163f 70
                ST                       ; 1640 17
                DCI  $0f76               ; 1641 2a 0f 76
                LIS  $0                  ; 1644 70
                ST                       ; 1645 17
A1646:          LIS  $4                  ; 1646 74
                LR   $7,A                ; 1647 57
                JMP  A166e               ; 1648 29 16 6e
A164b:          PK                       ; 164b 0c

A164c:          LM                       ; 164c 16
                XDC                      ; 164d 2c
                LR   $2,A                ; 164e 52
                SR   4                   ; 164f 14
                LR   H,DC                ; 1650 11
                DCI  A17f1               ; 1651 2a 17 f1
                ADC                      ; 1654 8e
A1655:          LM                       ; 1655 16
                LR   DC,H                ; 1656 10
                ST                       ; 1657 17
                LR   A,$2                ; 1658 42
A1659:          SL   4                   ; 1659 15
                SR   4                   ; 165a 14
                LR   H,DC                ; 165b 11
                DCI  A17f1               ; 165c 2a 17 f1
                ADC                      ; 165f 8e
                LM                       ; 1660 16
                LR   DC,H                ; 1661 10
                ST                       ; 1662 17
A1663:          LI   $fc                 ; 1663 20 fc
                ADC                      ; 1665 8e
A1666:          XDC                      ; 1666 2c
                DS   $5                  ; 1667 35
A1668:          BF   $4,A164c            ; 1668 94 e3
                POP                      ; 166a 1c
A166b:          PI   A1611               ; 166b 28 16 11
A166e:          LI   $f8                 ; 166e 20 f8
A1670:          DCI  $08fb               ; 1670 2a 08 fb
                CM                       ; 1673 8d
                BF   $4,A1670            ; 1674 94 fb
                PI   $424d               ; 1676 28 42 4d
                LISL 0                   ; 1679 68
                LR   A,$7                ; 167a 47
                DCI  A1685               ; 167b 2a 16 85
                ADC                      ; 167e 8e
                ADC                      ; 167f 8e
                LM                       ; 1680 16
                LR   QU,A                ; 1681 06
                LM                       ; 1682 16
                LR   QL,A                ; 1683 07
                LR   P0,Q                ; 1684 0d
A1685:          LR   DC,H                ; 1685 10
                LISU 1                   ; 1686 61
                LR   DC,H                ; 1687 10
                XS   $2                  ; 1688 e2
                LR   DC,H                ; 1689 10
                ASD  $0                  ; 168a d0
                SR   4                   ; 168b 14
                BF   $4,A16a0            ; 168c 94 13
                BF   $3,A16a0            ; 168e 93 11
                BT   1,A16a2             ; 1690 81 11
                BF   $7,A16a6            ; 1692 97 13
                LR   P0,Q                ; 1694 0d
                LR   H,DC                ; 1695 11
                NS   $5                  ; 1696 f5
                LR   H,DC                ; 1697 11
                LIS  $0                  ; 1698 70
                SR   4                   ; 1699 14
                OUTS 10                  ; 169a ba
                SR   4                   ; 169b 14
                LR   $7,A                ; 169c 57
                LR   H,DC                ; 169d 11
                NS   $a                  ; 169e fa
A169f:          LR   DC,H                ; 169f 10
A16a0:          LR   A,KU                ; 16a0 00
                LR   DC,H                ; 16a1 10
A16a2:          LR   DC,H                ; 16a2 10
                LR   DC,H                ; 16a3 10
                LI   $10                 ; 16a4 20 10
A16a6:          DS   $0                  ; 16a6 30
                LR   DC,H                ; 16a7 10
                LR   A,$0                ; 16a8 40
                LR   DC,H                ; 16a9 10
                LR   $0,A                ; 16aa 50
                LR   KU,A                ; 16ab 04
                LISU 0                   ; 16ac 60
                LR   A,QU                ; 16ad 02
                LISU 4                   ; 16ae 64
                NS   (IS)-               ; 16af fe
A16b0:          LIS  $c                  ; 16b0 7c
                BT   2,A16b0             ; 16b1 82 fe
                LR   DC,H                ; 16b3 10
                LR   DC,H                ; 16b4 10
                AS   $5                  ; 16b5 c5
A16b6:          BT   0,A16c7             ; 16b6 80 10
                LR   DC,H                ; 16b8 10
                INS  10                  ; 16b9 aa
                BT   0,A16cb             ; 16ba 80 10
                LR   DC,H                ; 16bc 10
                BF   $2,A16b6            ; 16bd 92 f8
                LR   DC,H                ; 16bf 10
                LR   DC,H                ; 16c0 10
;                BT   2,-128              ; 16c1 82 80
				db   $82,$80
                LR   DC,H                ; 16c3 10
                LR   DC,H                ; 16c4 10
                BT   2,A1646             ; 16c5 82 80
A16c7:          LR   DC,H                ; 16c7 10
A16c8:          LIS  $c                  ; 16c8 7c
                BT   2,A16c8             ; 16c9 82 fe
A16cb:          LIS  $c                  ; 16cb 7c
                LIS  $c                  ; 16cc 7c
                NS   (IS)-               ; 16cd fe
                NS   (IS)                ; 16ce fc
                NS   (IS)-               ; 16cf fe
;                BT   2,-126              ; 16d0 82 82
				db   $82,$82
                BT   2,A1655             ; 16d2 82 82
                BT   0,A1655             ; 16d4 80 80
                BT   0,A1659             ; 16d6 80 82
                BT   2,A1659             ; 16d8 82 80
                LIS  $c                  ; 16da 7c
;                BT   0,-126              ; 16db 80 82
				db   $80,$82
                NS   (IS)                ; 16dd fc
                NS   $8                  ; 16de f8
                LR   A,QU                ; 16df 02
                BT   0,A1663             ; 16e0 80 82
                AM                       ; 16e2 88
                BT   0,A1666             ; 16e3 80 82
                BT   2,A1668             ; 16e5 82 82
                BT   4,A1668             ; 16e7 84 80
                LIS  $c                  ; 16e9 7c
                LIS  $c                  ; 16ea 7c
A16eb:          NS   (IS)-               ; 16eb fe
                BT   2,A16eb             ; 16ec 82 fe
                LR   A,KU                ; 16ee 00
A16ef:          DS   $1                  ; 16ef 31
                LNK                      ; 16f0 19
                SL   1                   ; 16f1 13
                SL   1                   ; 16f2 13
                NI   $0b                 ; 16f3 21 0b
                NS   $8                  ; 16f5 f8
                SL   4                   ; 16f6 15
                LR   IS,A                ; 16f7 0b
                LR   KL,A                ; 16f8 05
                SL   4                   ; 16f9 15
                LR   IS,A                ; 16fa 0b
                LR   KL,A                ; 16fb 05
                LR   A,KU                ; 16fc 00
                OUT  $0b                 ; 16fd 27 0b
                LR   H,DC                ; 16ff 11
                LR   P,K                 ; 1700 09
                NOP                      ; 1701 2b
                NS   $a                  ; 1702 fa
                AI   $fe                 ; 1703 24 fe
                NI   $25                 ; 1705 21 25
                LR   IS,A                ; 1707 0b
                LR   IS,A                ; 1708 0b
                INC                      ; 1709 1f
                LR   A,KU                ; 170a 00
                LR   DC,Q                ; 170b 0f
                LR   A,QL                ; 170c 03
                LR   A,KL                ; 170d 01
                XI   $fb                 ; 170e 23 fb
                DS   $2                  ; 1710 32
                XS   (IS)-               ; 1711 ee
                NI   $15                 ; 1712 21 15
                LR   A,KL                ; 1714 01
                OUT  $27                 ; 1715 27 27
                LR   A,KU                ; 1717 00
                LR   QL,A                ; 1718 07
                LR   P,K                 ; 1719 09
                LR   H,DC                ; 171a 11
                LR   A,KL                ; 171b 01
                NOP                      ; 171c 2b
                LR   IS,A                ; 171d 0b
                LR   P,K                 ; 171e 09
                LR   A,KU                ; 171f 00
                DS   $4                  ; 1720 34
                NS   (IS)-               ; 1721 fe
                DS   $1                  ; 1722 31
                LR   KL,A                ; 1723 05
                CI   $19                 ; 1724 25 19
                LR   IS,A                ; 1726 0b
                LR   P,K                 ; 1727 09
                NS   $7                  ; 1728 f7
                OI   $00                 ; 1729 22 00
A172b:          LR   IS,A                ; 172b 0b
                LR   A,KL                ; 172c 01
                LR   P,K                 ; 172d 09
                LR   A,QL                ; 172e 03
                LR   QL,A                ; 172f 07
                LR   KL,A                ; 1730 05
                LR   DC,Q                ; 1731 0f
                CI   $0d                 ; 1732 25 0d
                SL   1                   ; 1734 13
                INC                      ; 1735 1f
                SL   4                   ; 1736 15
                LR   W,J                 ; 1737 1d
                ST                       ; 1738 17
                EI                       ; 1739 1b
                LNK                      ; 173a 19
                LR   H,DC                ; 173b 11
                DS   $7                  ; 173c 37
                NI   $27                 ; 173d 21 27
                DS   $1                  ; 173f 31
                DS   $9                  ; 1740 39
                db   $2f                 
                JMP  $2d2b               ; 1742 29 2d 2b
                XI   $39                 ; 1745 23 39
                DS   $3                  ; 1747 33
                db   $2d                 
A1749:          db   $2d                 
                OUT  $03                 ; 174a 27 03
                LR   IS,A                ; 174c 0b
A174d:          ASD  $3                  ; 174d d3
                LR   P,K                 ; 174e 09
                LR   IS,A                ; 174f 0b
                INC                      ; 1750 1f
A1751:          LR   A,KU                ; 1751 00
                LR   P0,Q                ; 1752 0d
                LR   A,KL                ; 1753 01
                NOP                      ; 1754 2b
                NI   $21                 ; 1755 21 21
                DS   $1                  ; 1757 31
                SL   1                   ; 1758 13
                LR   P,K                 ; 1759 09
                LR   IS,A                ; 175a 0b
A175b:          LR   A,KU                ; 175b 00
                LR   QL,A                ; 175c 07
                LR   IS,A                ; 175d 0b
                LR   H,DC                ; 175e 11
                JMP  $0007               ; 175f 29 00 07
                LR   KL,A                ; 1762 05
                CI   $0b                 ; 1763 25 0b
                DS   $7                  ; 1765 37
                NS   (IS)+               ; 1766 fd
A1767:          SL   4                   ; 1767 15
                LR   IS,A                ; 1768 0b
                LR   KL,A                ; 1769 05
                LR   A,KU                ; 176a 00
                NOP                      ; 176b 2b
                LR   IS,A                ; 176c 0b
                DS   $3                  ; 176d 33
                LR   QL,A                ; 176e 07
A176f:          LR   A,KU                ; 176f 00
                LR   P0,Q                ; 1770 0d
A1771:          CI   $29                 ; 1771 25 29
A1773:          LR   QL,A                ; 1773 07
                LNK                      ; 1774 19
                LR   IS,A                ; 1775 0b
                NS   (IS)                ; 1776 fc
                LR   DC,Q                ; 1777 0f
                LR   A,QL                ; 1778 03
                LR   A,KL                ; 1779 01
                DS   $1                  ; 177a 31
                SL   4                   ; 177b 15
                NS   $a                  ; 177c fa
                db   $2d                 
                LR   P,K                 ; 177e 09
                SL   1                   ; 177f 13
                LR   P0,Q                ; 1780 0d
                NOP                      ; 1781 2b
                NS   $a                  ; 1782 fa
                LR   W,J                 ; 1783 1d
A1784:          SL   1                   ; 1784 13
                DS   $3                  ; 1785 33
                NS   (IS)                ; 1786 fc
                ST                       ; 1787 17
                LR   A,QL                ; 1788 03
                JMP  $250b               ; 1789 29 25 0b
                INC                      ; 178c 1f
                NS   $9                  ; 178d f9
                SL   1                   ; 178e 13
                db   $2f                 
                LR   IS,A                ; 1790 0b
                LR   P,K                 ; 1791 09
                NS   $b                  ; 1792 fb
                LR   QL,A                ; 1793 07
                LNK                      ; 1794 19
                LR   IS,A                ; 1795 0b
                NS   (IS)                ; 1796 fc
                OUT  $11                 ; 1797 27 11
                XI   $05                 ; 1799 23 05
                NS   $b                  ; 179b fb
                INC                      ; 179c 1f
                SL   1                   ; 179d 13
                EI                       ; 179e 1b
                NI   $fb                 ; 179f 21 fb
A17a1:          LR   A,IS                ; 17a1 0a
                LR   A,KL                ; 17a2 01
                ST                       ; 17a3 17
                INS  7                   ; 17a4 a7
                ST                       ; 17a5 17
                INS  7                   ; 17a6 a7
                LISU 6                   ; 17a7 66
                ASD  $6                  ; 17a8 d6
                LR   A,$6                ; 17a9 46
                OUTS 6                   ; 17aa b6
                IN   $96                 ; 17ab 26 96
                AS   $b                  ; 17ad cb
                INS  15                  ; 17ae af
                LR   QU,A                ; 17af 06
                OI   $ec                 ; 17b0 22 ec
                XDC                      ; 17b2 2c
                AS   (IS)+               ; 17b3 cd
                CM                       ; 17b4 8d
                ADC                      ; 17b5 8e
                INS  14                  ; 17b6 ae
                DS   $6                  ; 17b7 36
                BF   $6,A17e8            ; 17b8 96 2f
                BR7  A17c2               ; 17ba 8f 07
                LR   QL,A                ; 17bc 07
                LR   QL,A                ; 17bd 07
                LR   QL,A                ; 17be 07
                LR   QL,A                ; 17bf 07
                LR   QL,A                ; 17c0 07
                LR   QL,A                ; 17c1 07
A17c2:          LR   QL,A                ; 17c2 07
                LR   QL,A                ; 17c3 07
                LR   QL,A                ; 17c4 07
A17c5:          LR   $0,A                ; 17c5 50
                LR   $0,A                ; 17c6 50
                LR   $0,A                ; 17c7 50
                LR   $0,A                ; 17c8 50
                LR   $0,A                ; 17c9 50
                LR   $0,A                ; 17ca 50
                LR   A,$5                ; 17cb 45
                LR   A,$4                ; 17cc 44
                LR   A,$4                ; 17cd 44
                LR   A,$2                ; 17ce 42
                AI   $24                 ; 17cf 24 24
                AI   $24                 ; 17d1 24 24
                AI   $24                 ; 17d3 24 24
                AI   $24                 ; 17d5 24 24
                LR   $4,A                ; 17d7 54
                LR   $4,A                ; 17d8 54
                LR   A,(IS)              ; 17d9 4c
                LIS  $0                  ; 17da 70
;                BF   $4,94               ; 17db 94 5e
				db   $94,$5e
                BT   2,A1784             ; 17dd 82 a6
                AS   $a                  ; 17df ca
                ASD  (IS)                ; 17e0 dc
                AS   $a                  ; 17e1 ca
                ASD  (IS)                ; 17e2 dc
                LR   A,KU                ; 17e3 00
                LR   A,KL                ; 17e4 01
                LR   A,QU                ; 17e5 02
                LR   A,QL                ; 17e6 03
                LR   KU,A                ; 17e7 04
A17e8:          LR   KL,A                ; 17e8 05
                BT   6,A1771             ; 17e9 86 87
                AM                       ; 17eb 88
                AMD                      ; 17ec 89
A17ed:          LR   H,DC                ; 17ed 11
                LNK                      ; 17ee 19
                DI                       ; 17ef 1a
                SR   1                   ; 17f0 12
A17f1:          DS   $6                  ; 17f1 36
                AI   $34                 ; 17f2 24 34
                DS   $2                  ; 17f4 32
                OI   $20                 ; 17f5 22 20
                LR   J,W                 ; 17f7 1e
                LR   Q,DC                ; 17f8 0e
                PK                       ; 17f9 0c
                
A17fa:          LR   A,IS                ; 17fa 0a
                XI   $19                 ; 17fb 23 19
                LR   W,J                 ; 17fd 1d
                SL   4                   ; 17fe 15
                LR   A,KU                ; 17ff 00
