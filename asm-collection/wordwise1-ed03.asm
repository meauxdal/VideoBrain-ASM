;Word Wise 1 - ED03

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/25/2010

org $1000

				db   $aa,$55			;cart signature
				db   $04				;background color
				db   $00,$00
WORDWISETEXT:	db   $0d,$13,$09,$1f,$0d,$01,$21,$0b,$00,$24,$00,$00,$00	;name - WORDWISE 1

START:
                DCI  A1689               ; 1012 2a 16 89
                XDC                      ; 1015 2c
                DCI  $0ffa               ; 1016 2a 0f fa
                LISU 2                   ; 1019 62
                LISL 0                   ; 101a 68
                LIS  $6                  ; 101b 76
                LR   (IS),A              ; 101c 5c
                PI   $43cd               ; 101d 28 43 cd
                DCI  $0cce               ; 1020 2a 0c ce
                LIS  $2                  ; 1023 72
                LR   $1,A                ; 1024 51
A1025:          LI   $46                 ; 1025 20 46
                LR   $0,A                ; 1027 50
                LIS  $0                  ; 1028 70
A1029:          ST                       ; 1029 17
                DS   $0                  ; 102a 30
                BF   $4,A1029            ; 102b 94 fd
                DCI  $0f6e               ; 102d 2a 0f 6e
                DS   $1                  ; 1030 31
                BF   $4,A1025            ; 1031 94 f3
                LI   $ff                 ; 1033 20 ff
                DCI  $0f8d               ; 1035 2a 0f 8d
                ST                       ; 1038 17
                ST                       ; 1039 17
                PI   $40d0               ; 103a 28 40 d0
                PI   $4762               ; 103d 28 47 62
                DCI  A16b3               ; 1040 2a 16 b3
                XDC                      ; 1043 2c
                DCI  $0820               ; 1044 2a 08 20
                LIS  $c                  ; 1047 7c
                LR   (IS),A              ; 1048 5c
                PI   $43cd               ; 1049 28 43 cd
                DCI  $0840               ; 104c 2a 08 40
                LIS  $c                  ; 104f 7c
                LR   (IS),A              ; 1050 5c
                PI   $43cd               ; 1051 28 43 cd
                DCI  $0850               ; 1054 2a 08 50
                LIS  $c                  ; 1057 7c
                LR   (IS),A              ; 1058 5c
                PI   $43cd               ; 1059 28 43 cd
                DCI  $0870               ; 105c 2a 08 70
                LI   $10                 ; 105f 20 10
                LR   (IS),A              ; 1061 5c
                PI   $43cd               ; 1062 28 43 cd
                JMP  A1150               ; 1065 29 11 50
A1068:          DCI  $0f8e               ; 1068 2a 0f 8e
                LM                       ; 106b 16
                INC                      ; 106c 1f
                CI   $08                 ; 106d 25 08
                BF   $4,A1072            ; 106f 94 02
                LIS  $0                  ; 1071 70
A1072:          DCI  $0f8e               ; 1072 2a 0f 8e
                ST                       ; 1075 17
                DCI  A1604               ; 1076 2a 16 04
                ADC                      ; 1079 8e
                ADC                      ; 107a 8e
                LM                       ; 107b 16
                LR   $6,A                ; 107c 56
                LR   $5,A                ; 107d 55
                DS   $5                  ; 107e 35
                LM                       ; 107f 16
                DCI  $0c00               ; 1080 2a 0c 00
                ADC                      ; 1083 8e
                LR   Q,DC                ; 1084 0e
                DCI  $0cce               ; 1085 2a 0c ce
                ADC                      ; 1088 8e
                ADC                      ; 1089 8e
                ADC                      ; 108a 8e
                ADC                      ; 108b 8e
                ADC                      ; 108c 8e
                ADC                      ; 108d 8e
                ADC                      ; 108e 8e
A108f:          LR   H,DC                ; 108f 11
                XDC                      ; 1090 2c
                LR   DC,Q                ; 1091 0f
                LIS  $0                  ; 1092 70
                XM                       ; 1093 8c
                LR   Q,DC                ; 1094 0e
                BF   $1,A109b            ; 1095 91 05
                CI   $3a                 ; 1097 25 3a
                BF   $4,A109d            ; 1099 94 03
A109b:          LI   $00                 ; 109b 20 00
A109d:          DCI  $2010               ; 109d 2a 20 10
                ADC                      ; 10a0 8e
                ADC                      ; 10a1 8e
                ADC                      ; 10a2 8e
                ADC                      ; 10a3 8e
                ADC                      ; 10a4 8e
                ADC                      ; 10a5 8e
                ADC                      ; 10a6 8e
                LIS  $7                  ; 10a7 77
                LR   $2,A                ; 10a8 52
A10a9:          LM                       ; 10a9 16
                XDC                      ; 10aa 2c
                ST                       ; 10ab 17
                LR   A,$5                ; 10ac 45
                ADC                      ; 10ad 8e
                XDC                      ; 10ae 2c
                DS   $2                  ; 10af 32
                BF   $4,A10a9            ; 10b0 94 f8
                LR   DC,H                ; 10b2 10
                CM                       ; 10b3 8d
                DS   $6                  ; 10b4 36
                BF   $4,A108f            ; 10b5 94 d9
                DCI  $0f6e               ; 10b7 2a 0f 6e
                LM                       ; 10ba 16
                LR   $7,A                ; 10bb 57
                JMP  A15cd               ; 10bc 29 15 cd
A10bf:          LR   K,P                 ; 10bf 08
                LIS  $c                  ; 10c0 7c
                LR   $1,A                ; 10c1 51
                DCI  $0870               ; 10c2 2a 08 70
                XDC                      ; 10c5 2c
                DCI  $0870               ; 10c6 2a 08 70
A10c9:          LM                       ; 10c9 16
                NI   $7f                 ; 10ca 21 7f
                XDC                      ; 10cc 2c
                ST                       ; 10cd 17
                DS   $1                  ; 10ce 31
                BF   $4,A10c9            ; 10cf 94 f9
                PK                       ; 10d1 0c
                
A10d2:          DCI  $08f5               ; 10d2 2a 08 f5
                LIS  $0                  ; 10d5 70
                ST                       ; 10d6 17
                LI   $fe                 ; 10d7 20 fe
                LR   $4,A                ; 10d9 54
A10da:          DS   $4                  ; 10da 34
                PI   A12c4               ; 10db 28 12 c4
                LR   A,$2                ; 10de 42
                COM                      ; 10df 18
                AI   $07                 ; 10e0 24 07
                BT   4,A1119             ; 10e2 84 36
                LR   $2,A                ; 10e4 52
                LR   $3,A                ; 10e5 53
                DCI  $0c10               ; 10e6 2a 0c 10
                XDC                      ; 10e9 2c
                DCI  A166a               ; 10ea 2a 16 6a
A10ed:          LM                       ; 10ed 16
                XDC                      ; 10ee 2c
                ST                       ; 10ef 17
                LIS  $f                  ; 10f0 7f
                ADC                      ; 10f1 8e
                XDC                      ; 10f2 2c
                DS   $2                  ; 10f3 32
                BF   $4,A10ed            ; 10f4 94 f8
                LR   A,$3                ; 10f6 43
                LR   $2,A                ; 10f7 52
A10f8:          PI   A11a3               ; 10f8 28 11 a3
                BT   1,A1126             ; 10fb 81 2a
                LR   A,$8                ; 10fd 48
                CI   $22                 ; 10fe 25 22
                BF   $4,A10f8            ; 1100 94 f7
                LR   A,$4                ; 1102 44
                COM                      ; 1103 18
                LR   $1,A                ; 1104 51
                DCI  $0f8f               ; 1105 2a 0f 8f
                LR   Q,DC                ; 1108 0e
                PI   A137d               ; 1109 28 13 7d
                BF   $2,A1119            ; 110c 92 0c
                DCI  $0f6e               ; 110e 2a 0f 6e
                LIS  $6                  ; 1111 76
                ST                       ; 1112 17
                PI   A1566               ; 1113 28 15 66
                JMP  A1068               ; 1116 29 10 68
A1119:          LR   A,$4                ; 1119 44
                CI   $f6                 ; 111a 25 f6
                BT   4,A1123             ; 111c 84 06
                LIS  $8                  ; 111e 78
                LR   $7,A                ; 111f 57
                JMP  A15cd               ; 1120 29 15 cd
A1123:          JMP  A131e               ; 1123 29 13 1e
A1126:          DCI  A17e5               ; 1126 2a 17 e5
                XDC                      ; 1129 2c
                DCI  $0c10               ; 112a 2a 0c 10
                AI   $ff                 ; 112d 24 ff
                SL   4                   ; 112f 15
                ADC                      ; 1130 8e
                LIS  $1                  ; 1131 71
                LR   (IS),A              ; 1132 5c
                PI   A1309               ; 1133 28 13 09
                LIS  $e                  ; 1136 7e
                DCI  $0f6e               ; 1137 2a 0f 6e
                ST                       ; 113a 17
                JMP  A1444               ; 113b 29 14 44
                DS   $3                  ; 113e 33
                BF   $4,A10f8            ; 113f 94 b8
                BF   $0,A10da            ; 1141 90 98
A1143:          DCI  $0c00               ; 1143 2a 0c 00
                LI   $60                 ; 1146 20 60
                LR   $1,A                ; 1148 51
A1149:          LI   $ff                 ; 1149 20 ff
A114b:          ST                       ; 114b 17
                DS   $1                  ; 114c 31
                BF   $4,A114b            ; 114d 94 fd
                POP                      ; 114f 1c
A1150:          PI   A1143               ; 1150 28 11 43
                DCI  $0fea               ; 1153 2a 0f ea
                LI   $64                 ; 1156 20 64
                ST                       ; 1158 17
                DCI  WORDWISETEXT        ; 1159 2a 10 05
                XDC                      ; 115c 2c
                LIS  $a                  ; 115d 7a
                LR   (IS),A              ; 115e 5c
                DCI  $0c00               ; 115f 2a 0c 00
                PI   $43cd               ; 1162 28 43 cd
                DCI  A16e7               ; 1165 2a 16 e7
                XDC                      ; 1168 2c
                DCI  $0c10               ; 1169 2a 0c 10
                LI   $2d                 ; 116c 20 2d
                LR   (IS),A              ; 116e 5c
                PI   A1309               ; 116f 28 13 09
A1172:          PI   A11a3               ; 1172 28 11 a3
                CI   $03                 ; 1175 25 03
                BF   $2,A1172            ; 1177 92 fa
                DCI  $0f71               ; 1179 2a 0f 71
                ST                       ; 117c 17
                SL   4                   ; 117d 15
                SR   1                   ; 117e 12
                AI   $2c                 ; 117f 24 2c
                ST                       ; 1181 17
                PI   A1143               ; 1182 28 11 43
                DCI  A17a0               ; 1185 2a 17 a0
                XDC                      ; 1188 2c
                DCI  $0c13               ; 1189 2a 0c 13
                LI   $22                 ; 118c 20 22
                LR   (IS),A              ; 118e 5c
                PI   A1309               ; 118f 28 13 09
A1192:          PI   A11a3               ; 1192 28 11 a3
                CI   $04                 ; 1195 25 04
                BF   $2,A1192            ; 1197 92 fa
                NI   $7f                 ; 1199 21 7f
                INC                      ; 119b 1f
                DCI  $0f76               ; 119c 2a 0f 76
                ST                       ; 119f 17
                JMP  A131e               ; 11a0 29 13 1e
A11a3:          LR   K,P                 ; 11a3 08
                PI   $40a9               ; 11a4 28 40 a9
                LIS  $0                  ; 11a7 70
                LR   $0,A                ; 11a8 50
                LIS  $3                  ; 11a9 73
                DCI  $0f6e               ; 11aa 2a 0f 6e
                ST                       ; 11ad 17
A11ae:          DCI  $0fa1               ; 11ae 2a 0f a1
                LM                       ; 11b1 16
                INC                      ; 11b2 1f
                DCI  $0fa1               ; 11b3 2a 0f a1
                ST                       ; 11b6 17
                PI   $4361               ; 11b7 28 43 61
                DCI  $0f74               ; 11ba 2a 0f 74
                LIS  $0                  ; 11bd 70
                XS   $8                  ; 11be e8
                BF   $1,A11ae            ; 11bf 91 ee
                CM                       ; 11c1 8d
                BT   4,A11d9             ; 11c2 84 16
                DCI  $0f74               ; 11c4 2a 0f 74
                ST                       ; 11c7 17
                DCI  A166a               ; 11c8 2a 16 6a
                LIS  $5                  ; 11cb 75
                LR   $1,A                ; 11cc 51
                LR   A,$8                ; 11cd 48
                SL   1                   ; 11ce 13
A11cf:          CM                       ; 11cf 8d
                BT   4,A11e1             ; 11d0 84 10
                DS   $1                  ; 11d2 31
                BF   $4,A11cf            ; 11d3 94 fb
                CI   $44                 ; 11d5 25 44
                BT   4,A11e8             ; 11d7 84 10
A11d9:          DS   $0                  ; 11d9 30
                BT   4,A11e8             ; 11da 84 0d
                LIS  $0                  ; 11dc 70
                LR   $7,A                ; 11dd 57
                JMP  A15cd               ; 11de 29 15 cd
A11e1:          LR   A,$1                ; 11e1 41
                COM                      ; 11e2 18
                AI   $07                 ; 11e3 24 07
                LR   $1,A                ; 11e5 51
                BF   $0,A11eb            ; 11e6 90 04
A11e8:          LI   $81                 ; 11e8 20 81
                LR   $1,A                ; 11ea 51
A11eb:          PI   $40bc               ; 11eb 28 40 bc
                LIS  $0                  ; 11ee 70
                XS   $1                  ; 11ef e1
                PK                       ; 11f0 0c
                
                LIS  $0                  ; 11f1 70
                DCI  $0f8e               ; 11f2 2a 0f 8e
                CM                       ; 11f5 8d
                BT   4,A11fd             ; 11f6 84 06
A11f8:          LIS  $0                  ; 11f8 70
                LR   $7,A                ; 11f9 57
                JMP  A15cd               ; 11fa 29 15 cd
A11fd:          DCI  $0f8d               ; 11fd 2a 0f 8d
                LM                       ; 1200 16
                INC                      ; 1201 1f
                CI   $0d                 ; 1202 25 0d
                BT   4,A11f8             ; 1204 84 f3
                DCI  $0f8d               ; 1206 2a 0f 8d
                ST                       ; 1209 17
                DCI  A17d8               ; 120a 2a 17 d8
                ADC                      ; 120d 8e
                LM                       ; 120e 16
                LR   $8,A                ; 120f 58
                LIS  $0                  ; 1210 70
                LR   $7,A                ; 1211 57
                JMP  A15aa               ; 1212 29 15 aa
                PI   $4361               ; 1215 28 43 61
                LIS  $0                  ; 1218 70
                XS   $8                  ; 1219 e8
                BF   $1,A122b            ; 121a 91 10
                LR   $1,A                ; 121c 51
                DCI  A1673               ; 121d 2a 16 73
                LIS  $9                  ; 1220 79
                LR   $2,A                ; 1221 52
                LR   A,$1                ; 1222 41
A1223:          CM                       ; 1223 8d
                BT   4,A123f             ; 1224 84 1a
                DS   $2                  ; 1226 32
                BF   $4,A1223            ; 1227 94 fb
                BF   $0,A1261            ; 1229 90 37
A122b:          DCI  $0f6e               ; 122b 2a 0f 6e
                LIS  $4                  ; 122e 74
                ST                       ; 122f 17
                JMP  A1068               ; 1230 29 10 68
A1233:          DCI  $0f74               ; 1233 2a 0f 74
                LR   A,$1                ; 1236 41
                CM                       ; 1237 8d
                BT   4,A122b             ; 1238 84 f2
                DCI  $0f74               ; 123a 2a 0f 74
                ST                       ; 123d 17
                POP                      ; 123e 1c
A123f:          PI   A1233               ; 123f 28 12 33
                LR   A,$2                ; 1242 42
                DCI  $0bff               ; 1243 2a 0b ff
                ADC                      ; 1246 8e
                LR   H,DC                ; 1247 11
                LM                       ; 1248 16
                DCI  $0fa2               ; 1249 2a 0f a2
                LR   Q,DC                ; 124c 0e
                ST                       ; 124d 17
                DCI  $0c09               ; 124e 2a 0c 09
                LM                       ; 1251 16
                LR   DC,H                ; 1252 10
                ST                       ; 1253 17
                LR   DC,Q                ; 1254 0f
                LM                       ; 1255 16
                DCI  $0c09               ; 1256 2a 0c 09
                ST                       ; 1259 17
                LIS  $a                  ; 125a 7a
                LR   $8,A                ; 125b 58
                LIS  $4                  ; 125c 74
                LR   $7,A                ; 125d 57
                JMP  A15aa               ; 125e 29 15 aa
A1261:          PI   A1233               ; 1261 28 12 33
                LR   A,$1                ; 1264 41
                CI   $22                 ; 1265 25 22
                BT   4,A12b5             ; 1267 84 4d
                CI   $24                 ; 1269 25 24
                BT   4,A127d             ; 126b 84 11
                CI   $20                 ; 126d 25 20
                BT   4,A129e             ; 126f 84 2e
                CI   $21                 ; 1271 25 21
                BF   $4,A122b            ; 1273 94 b7
                LIS  $2                  ; 1275 72
                DCI  $0f6e               ; 1276 2a 0f 6e
                ST                       ; 1279 17
                JMP  A1068               ; 127a 29 10 68
A127d:          DCI  $0842               ; 127d 2a 08 42
                LR   H,DC                ; 1280 11
                LM                       ; 1281 16
                DCI  $0f72               ; 1282 2a 0f 72
                CM                       ; 1285 8d
                BT   4,A1295             ; 1286 84 0e
                AI   $f8                 ; 1288 24 f8
                LR   DC,H                ; 128a 10
                ST                       ; 128b 17
                DCI  $0f75               ; 128c 2a 0f 75
                LR   Q,DC                ; 128f 0e
                LM                       ; 1290 16
                AI   $ff                 ; 1291 24 ff
                LR   DC,Q                ; 1293 0f
                ST                       ; 1294 17
A1295:          LIS  $4                  ; 1295 74
                DCI  $0f6e               ; 1296 2a 0f 6e
                ST                       ; 1299 17
                LR   $8,A                ; 129a 58
                JMP  A15aa               ; 129b 29 15 aa
A129e:          DCI  $0842               ; 129e 2a 08 42
                LR   H,DC                ; 12a1 11
                LM                       ; 12a2 16
                CI   $5c                 ; 12a3 25 5c
                BT   4,A1295             ; 12a5 84 ef
                AI   $08                 ; 12a7 24 08
                LR   DC,H                ; 12a9 10
                ST                       ; 12aa 17
                DCI  $0f75               ; 12ab 2a 0f 75
                LR   Q,DC                ; 12ae 0e
                LM                       ; 12af 16
                INC                      ; 12b0 1f
                LR   DC,Q                ; 12b1 0f
                ST                       ; 12b2 17
                BF   $0,A1295            ; 12b3 90 e1
A12b5:          LIS  $3                  ; 12b5 73
                LR   $3,A                ; 12b6 53
                LI   $ff                 ; 12b7 20 ff
                LR   $1,A                ; 12b9 51
                DCI  $0f8f               ; 12ba 2a 0f 8f
                LR   Q,DC                ; 12bd 0e
                PI   A137d               ; 12be 28 13 7d
                JMP  A1481               ; 12c1 29 14 81
A12c4:          LR   K,P                 ; 12c4 08
                PI   $40a9               ; 12c5 28 40 a9
                PI   A1143               ; 12c8 28 11 43
                DCI  $17c2               ; 12cb 2a 17 c2
                XDC                      ; 12ce 2c
                DCI  $0c00               ; 12cf 2a 0c 00
                LIS  $a                  ; 12d2 7a
                LR   (IS),A              ; 12d3 5c
                PI   $43cd               ; 12d4 28 43 cd
                DCI  $0c13               ; 12d7 2a 0c 13
                XDC                      ; 12da 2c
                DCI  $0c60               ; 12db 2a 0c 60
                LIS  $6                  ; 12de 76
                LR   $2,A                ; 12df 52
                LI   $6d                 ; 12e0 20 6d
                LR   $1,A                ; 12e2 51
A12e3:          LR   A,$4                ; 12e3 44
A12e4:          DS   $1                  ; 12e4 31
                BT   4,A12ec             ; 12e5 84 06
                CM                       ; 12e7 8d
                BT   4,A12f0             ; 12e8 84 07
                BF   $0,A12e4            ; 12ea 90 f9
A12ec:          PI   $40bc               ; 12ec 28 40 bc
                PK                       ; 12ef 0c
                
A12f0:          DS   $2                  ; 12f0 32
                BT   4,A1305             ; 12f1 84 13
                ADC                      ; 12f3 8e
                XDC                      ; 12f4 2c
                COM                      ; 12f5 18
                LR   (IS),A              ; 12f6 5c
                AI   $ef                 ; 12f7 24 ef
                COM                      ; 12f9 18
                LR   $3,A                ; 12fa 53
                PI   $43cd               ; 12fb 28 43 cd
                LR   A,$3                ; 12fe 43
                ADC                      ; 12ff 8e
                XDC                      ; 1300 2c
                LIS  $1                  ; 1301 71
                ADC                      ; 1302 8e
                BF   $0,A12e3            ; 1303 90 df
A1305:          LIS  $1                  ; 1305 71
                LR   $2,A                ; 1306 52
                BF   $0,A12ec            ; 1307 90 e4
A1309:          XDC                      ; 1309 2c
                LIS  $0                  ; 130a 70
                XM                       ; 130b 8c
                XDC                      ; 130c 2c
                BF   $1,A1314            ; 130d 91 06
                ST                       ; 130f 17
A1310:          DS   (IS)                ; 1310 3c
                BF   $4,A1309            ; 1311 94 f7
                POP                      ; 1313 1c
A1314:          COM                      ; 1314 18
                LR   $0,A                ; 1315 50
                LI   $3a                 ; 1316 20 3a
A1318:          ST                       ; 1318 17
                DS   $0                  ; 1319 30
                BF   $4,A1318            ; 131a 94 fd
                BF   $0,A1310            ; 131c 90 f3
A131e:          DCI  $0fa1               ; 131e 2a 0f a1
                LM                       ; 1321 16
                DCI  $0fdb               ; 1322 2a 0f db
                ST                       ; 1325 17
                SR   4                   ; 1326 14
                ST                       ; 1327 17
                DCI  $08f5               ; 1328 2a 08 f5
                LIS  $0                  ; 132b 70
                ST                       ; 132c 17
                DCI  $0f88               ; 132d 2a 0f 88
                LM                       ; 1330 16
                INC                      ; 1331 1f
                DCI  $0f76               ; 1332 2a 0f 76
                CM                       ; 1335 8d
                BF   $4,A1339            ; 1336 94 02
                LIS  $1                  ; 1338 71
A1339:          DCI  $0f88               ; 1339 2a 0f 88
                ST                       ; 133c 17
                LIS  $0                  ; 133d 70
                DCI  $0fa5               ; 133e 2a 0f a5
                ST                       ; 1341 17
                LIS  $2                  ; 1342 72
                DCI  $0f71               ; 1343 2a 0f 71
                AM                       ; 1346 88
                XDC                      ; 1347 2c
                DCI  $0f75               ; 1348 2a 0f 75
                ST                       ; 134b 17
                XDC                      ; 134c 2c
                LM                       ; 134d 16
                DCI  $0842               ; 134e 2a 08 42
                ST                       ; 1351 17
                LIS  $8                  ; 1352 78
                LR   $1,A                ; 1353 51
                DCI  $0f97               ; 1354 2a 0f 97
                LIS  $0                  ; 1357 70
A1358:          ST                       ; 1358 17
                DS   $1                  ; 1359 31
                BF   $4,A1358            ; 135a 94 fd
                DCI  $0c60               ; 135c 2a 0c 60
                LI   $6e                 ; 135f 20 6e
                LR   $1,A                ; 1361 51
                LI   $ff                 ; 1362 20 ff
A1364:          ST                       ; 1364 17
                DS   $1                  ; 1365 31
                BF   $4,A1364            ; 1366 94 fd
                PI   A1566               ; 1368 28 15 66
A136b:          PI   A11a3               ; 136b 28 11 a3
                BT   1,A136b             ; 136e 81 fc
                LR   A,$8                ; 1370 48
                CI   $22                 ; 1371 25 22
                BF   $4,A136b            ; 1373 94 f7
                PI   A10bf               ; 1375 28 10 bf
                LIS  $5                  ; 1378 75
                LR   $7,A                ; 1379 57
                JMP  A15cd               ; 137a 29 15 cd
A137d:          LR   K,P                 ; 137d 08
                LIS  $1                  ; 137e 71
                LR   $2,A                ; 137f 52
                LIS  $2                  ; 1380 72
                LR   $5,A                ; 1381 55
                DCI  $0f88               ; 1382 2a 0f 88
                LM                       ; 1385 16
                AI   $ff                 ; 1386 24 ff
                LR   DC,Q                ; 1388 0f
                SL   1                   ; 1389 13
                ADC                      ; 138a 8e
                LR   H,DC                ; 138b 11
                DCI  A167d               ; 138c 2a 16 7d
                LIS  $0                  ; 138f 70
                XS   $1                  ; 1390 e1
                BT   1,A1398             ; 1391 81 06
                DCI  $0f9f               ; 1393 2a 0f 9f
                BF   $0,A139c            ; 1396 90 05
A1398:          AI   $fd                 ; 1398 24 fd
                SL   1                   ; 139a 13
                ADC                      ; 139b 8e
A139c:          COM                      ; 139c 18
                LR   J,W                 ; 139d 1e
A139e:          LM                       ; 139e 16
                LR   W,J                 ; 139f 1d
                LNK                      ; 13a0 19
                LR   J,W                 ; 13a1 1e
                AI   $66                 ; 13a2 24 66
                XDC                      ; 13a4 2c
                LR   DC,H                ; 13a5 10
                AMD                      ; 13a6 89
                LR   DC,H                ; 13a7 10
                ST                       ; 13a8 17
                LR   H,DC                ; 13a9 11
                XDC                      ; 13aa 2c
                BF   $2,A13ae            ; 13ab 92 02
                LR   J,W                 ; 13ad 1e
A13ae:          DS   $5                  ; 13ae 35
                BF   $4,A139e            ; 13af 94 ee
                LR   W,J                 ; 13b1 1d
                BT   2,A13b9             ; 13b2 82 06
                DS   $3                  ; 13b4 33
                BF   $4,A137d            ; 13b5 94 c7
                BF   $0,A13c6            ; 13b7 90 0e
A13b9:          LR   DC,H                ; 13b9 10
                LI   $fe                 ; 13ba 20 fe
                ADC                      ; 13bc 8e
                LI   $99                 ; 13bd 20 99
                ST                       ; 13bf 17
                ST                       ; 13c0 17
                DCI  $08f5               ; 13c1 2a 08 f5
                LIS  $5                  ; 13c4 75
                ST                       ; 13c5 17
A13c6:          DCI  $0c0c               ; 13c6 2a 0c 0c
                XDC                      ; 13c9 2c
                LI   $fe                 ; 13ca 20 fe
                LR   DC,H                ; 13cc 10
                ADC                      ; 13cd 8e
                LIS  $2                  ; 13ce 72
                LR   $1,A                ; 13cf 51
                PI   A14bb               ; 13d0 28 14 bb
                LR   W,J                 ; 13d3 1d
                PK                       ; 13d4 0c
                
                DCI  $0c19               ; 13d5 2a 0c 19
                LI   $47                 ; 13d8 20 47
                LR   $1,A                ; 13da 51
                PI   A1149               ; 13db 28 11 49
                DCI  $0c00               ; 13de 2a 0c 00
                LIS  $a                  ; 13e1 7a
                XDC                      ; 13e2 2c
                LR   $7,A                ; 13e3 57
A13e4:          PI   $4795               ; 13e4 28 47 95
                CI   $4d                 ; 13e7 25 4d
                BF   $2,A13e4            ; 13e9 92 fa
                DCI  A1614               ; 13eb 2a 16 14
                ADC                      ; 13ee 8e
                LM                       ; 13ef 16
                XDC                      ; 13f0 2c
                ST                       ; 13f1 17
                XDC                      ; 13f2 2c
                DS   $7                  ; 13f3 37
                BF   $4,A13e4            ; 13f4 94 ef
                DCI  $08f5               ; 13f6 2a 08 f5
                LIS  $6                  ; 13f9 76
                ST                       ; 13fa 17
                DCI  $0f6e               ; 13fb 2a 0f 6e
                LIS  $9                  ; 13fe 79
                ST                       ; 13ff 17
                LIS  $0                  ; 1400 70
                LR   $7,A                ; 1401 57
                JMP  A15cd               ; 1402 29 15 cd
                LIS  $a                  ; 1405 7a
                DCI  $0f6e               ; 1406 2a 0f 6e
                ST                       ; 1409 17
                LIS  $0                  ; 140a 70
                LR   $7,A                ; 140b 57
                DCI  $0f75               ; 140c 2a 0f 75
                LM                       ; 140f 16
                COM                      ; 1410 18
                LR   $3,A                ; 1411 53
                DCI  $0c60               ; 1412 2a 0c 60
                LI   $6e                 ; 1415 20 6e
                LR   $1,A                ; 1417 51
                LIS  $5                  ; 1418 75
                LR   $2,A                ; 1419 52
                LR   A,$3                ; 141a 43
A141b:          CM                       ; 141b 8d
                BF   $4,A1421            ; 141c 94 04
                DS   $2                  ; 141e 32
                BT   4,A1427             ; 141f 84 07
A1421:          DS   $1                  ; 1421 31
                BF   $4,A141b            ; 1422 94 f8
                JMP  A15cd               ; 1424 29 15 cd
A1427:          DCI  A17cc               ; 1427 2a 17 cc
                XDC                      ; 142a 2c
                DCI  $0c53               ; 142b 2a 0c 53
                LIS  $c                  ; 142e 7c
                LR   (IS),A              ; 142f 5c
                PI   A1309               ; 1430 28 13 09
                DCI  $0c50               ; 1433 2a 0c 50
                XDC                      ; 1436 2c
                DCI  $0f75               ; 1437 2a 0f 75
                LIS  $1                  ; 143a 71
                LR   $1,A                ; 143b 51
                PI   A14bb               ; 143c 28 14 bb
                DCI  $0f6e               ; 143f 2a 0f 6e
                LIS  $4                  ; 1442 74
                ST                       ; 1443 17
A1444:          LIS  $f                  ; 1444 7f
                LR   $8,A                ; 1445 58
                LIS  $b                  ; 1446 7b
                LR   $7,A                ; 1447 57
                DS   $8                  ; 1448 38
                BT   4,A144e             ; 1449 84 04
                JMP  A15aa               ; 144b 29 15 aa
A144e:          DCI  $0f6e               ; 144e 2a 0f 6e
                LM                       ; 1451 16
                LR   $7,A                ; 1452 57
                JMP  A15cd               ; 1453 29 15 cd
A1456:          LR   K,P                 ; 1456 08
                LISU 4                   ; 1457 64
                LISL 0                   ; 1458 68
                DS   (IS)                ; 1459 3c
                BF   $4,A148d            ; 145a 94 32
                LI   $78                 ; 145c 20 78
                LR   (IS),A              ; 145e 5c
                DCI  $0fa7               ; 145f 2a 0f a7
                LIS  $0                  ; 1462 70
                XM                       ; 1463 8c
                BT   4,A148d             ; 1464 84 28
                DCI  $0f89               ; 1466 2a 0f 89
                LM                       ; 1469 16
                AI   $66                 ; 146a 24 66
                DCI  $0f9f               ; 146c 2a 0f 9f
                LR   H,DC                ; 146f 11
                AMD                      ; 1470 89
                LR   DC,H                ; 1471 10
                ST                       ; 1472 17
                LR   J,W                 ; 1473 1e
                DCI  $0c0e               ; 1474 2a 0c 0e
                XDC                      ; 1477 2c
                LR   DC,H                ; 1478 10
                LIS  $1                  ; 1479 71
                LR   $1,A                ; 147a 51
                PI   A14bb               ; 147b 28 14 bb
                LR   W,J                 ; 147e 1d
                BF   $4,A148d            ; 147f 94 0d
A1481:          DCI  $0f9f               ; 1481 2a 0f 9f
                LIS  $0                  ; 1484 70
                ST                       ; 1485 17
                DCI  $0fa7               ; 1486 2a 0f a7
                ST                       ; 1489 17
                JMP  A10d2               ; 148a 29 10 d2
A148d:          PK                       ; 148d 0c

A148e:          LR   K,P                 ; 148e 08
                PI   $40a9               ; 148f 28 40 a9
                DCI  $0f9f               ; 1492 2a 0f 9f
                LI   $99                 ; 1495 20 99
                ST                       ; 1497 17
                DCI  $0f89               ; 1498 2a 0f 89
                ST                       ; 149b 17
                DCI  $0fa7               ; 149c 2a 0f a7
                ST                       ; 149f 17
                PI   $40bc               ; 14a0 28 40 bc
                PK                       ; 14a3 0c
                
                PI   A10bf               ; 14a4 28 10 bf
                PI   A148e               ; 14a7 28 14 8e
                DCI  $0c17               ; 14aa 2a 0c 17
                XDC                      ; 14ad 2c
                DCI  $0f88               ; 14ae 2a 0f 88
                LIS  $1                  ; 14b1 71
                LR   $1,A                ; 14b2 51
                PI   A14bb               ; 14b3 28 14 bb
                LIS  $4                  ; 14b6 74
                LR   $7,A                ; 14b7 57
                JMP  A15cd               ; 14b8 29 15 cd
A14bb:          LM                       ; 14bb 16
                XDC                      ; 14bc 2c
                LR   $2,A                ; 14bd 52
                SR   4                   ; 14be 14
                LR   H,DC                ; 14bf 11
                DCI  A1669               ; 14c0 2a 16 69
                ADC                      ; 14c3 8e
                LM                       ; 14c4 16
                LR   DC,H                ; 14c5 10
                ST                       ; 14c6 17
                LR   A,$2                ; 14c7 42
                SL   4                   ; 14c8 15
                SR   4                   ; 14c9 14
                LR   H,DC                ; 14ca 11
                DCI  A1669               ; 14cb 2a 16 69
                ADC                      ; 14ce 8e
                LM                       ; 14cf 16
                LR   DC,H                ; 14d0 10
                ST                       ; 14d1 17
                LI   $fc                 ; 14d2 20 fc
                ADC                      ; 14d4 8e
                XDC                      ; 14d5 2c
                DS   $1                  ; 14d6 31
                BF   $4,A14bb            ; 14d7 94 e3
                POP                      ; 14d9 1c
                DCI  $0c60               ; 14da 2a 0c 60
                XDC                      ; 14dd 2c
                DCI  $0fa5               ; 14de 2a 0f a5
                LM                       ; 14e1 16
                DCI  $0f75               ; 14e2 2a 0f 75
                AM                       ; 14e5 88
                CI   $6e                 ; 14e6 25 6e
                BF   $2,A155c            ; 14e8 92 73
                DCI  $0fa5               ; 14ea 2a 0f a5
                LM                       ; 14ed 16
                XDC                      ; 14ee 2c
                ADC                      ; 14ef 8e
                XDC                      ; 14f0 2c
                DCI  $0f75               ; 14f1 2a 0f 75
                LM                       ; 14f4 16
                LR   (IS),A              ; 14f5 5c
                LR   $2,A                ; 14f6 52
                DCI  $0c00               ; 14f7 2a 0c 00
                XDC                      ; 14fa 2c
                PI   $43cd               ; 14fb 28 43 cd
                LR   A,$2                ; 14fe 42
                COM                      ; 14ff 18
                ST                       ; 1500 17
                DCI  $0fa5               ; 1501 2a 0f a5
                LR   A,$2                ; 1504 42
                INC                      ; 1505 1f
                AM                       ; 1506 88
                DCI  $0fa5               ; 1507 2a 0f a5
                ST                       ; 150a 17
                DCI  $0f97               ; 150b 2a 0f 97
                LR   Q,DC                ; 150e 0e
                LR   A,$2                ; 150f 42
                LR   $1,A                ; 1510 51
                LIS  $1                  ; 1511 71
                LR   $3,A                ; 1512 53
                PI   A137d               ; 1513 28 13 7d
                DCI  $0c30               ; 1516 2a 0c 30
                LI   $10                 ; 1519 20 10
                LR   $1,A                ; 151b 51
                LI   $ff                 ; 151c 20 ff
A151e:          ST                       ; 151e 17
                DS   $1                  ; 151f 31
                BF   $4,A151e            ; 1520 94 fd
                DCI  $0fa8               ; 1522 2a 0f a8
                ST                       ; 1525 17
A1526:          DCI  $0fa8               ; 1526 2a 0f a8
                LM                       ; 1529 16
                INC                      ; 152a 1f
                DCI  $0fa8               ; 152b 2a 0f a8
                ST                       ; 152e 17
                DCI  $0f75               ; 152f 2a 0f 75
                CM                       ; 1532 8d
                BT   4,A155c             ; 1533 84 28
                DCI  $0c00               ; 1535 2a 0c 00
                ADC                      ; 1538 8e
                LR   $1,A                ; 1539 51
                LM                       ; 153a 16
                LR   $2,A                ; 153b 52
                DCI  $0c30               ; 153c 2a 0c 30
                LR   A,$1                ; 153f 41
                ADC                      ; 1540 8e
                LR   A,$2                ; 1541 42
                ST                       ; 1542 17
                SR   1                   ; 1543 12
                INC                      ; 1544 1f
                LR   $8,A                ; 1545 58
                LIS  $7                  ; 1546 77
                DCI  $0f6e               ; 1547 2a 0f 6e
                ST                       ; 154a 17
                LIS  $0                  ; 154b 70
                LR   $7,A                ; 154c 57
                JMP  A15aa               ; 154d 29 15 aa
                DCI  $0f8e               ; 1550 2a 0f 8e
                LIS  $4                  ; 1553 74
                CM                       ; 1554 8d
                BT   4,A1526             ; 1555 84 d0
                LIS  $0                  ; 1557 70
                LR   $7,A                ; 1558 57
                JMP  A15cd               ; 1559 29 15 cd
A155c:          LIS  $4                  ; 155c 74
                DCI  $0f6e               ; 155d 2a 0f 6e
                ST                       ; 1560 17
                LIS  $0                  ; 1561 70
                LR   $7,A                ; 1562 57
                JMP  A15cd               ; 1563 29 15 cd
A1566:          LR   K,P                 ; 1566 08
                PI   $40a9               ; 1567 28 40 a9
                PI   A1143               ; 156a 28 11 43
                DCI  $0f76               ; 156d 2a 0f 76
                LM                       ; 1570 16
                AI   $ff                 ; 1571 24 ff
                LR   $8,A                ; 1573 58
                LR   $4,A                ; 1574 54
                DCI  $0c2d               ; 1575 2a 0c 2d
                XDC                      ; 1578 2c
                DCI  $0f8f               ; 1579 2a 0f 8f
A157c:          LIS  $2                  ; 157c 72
                LR   $1,A                ; 157d 51
                PI   A14bb               ; 157e 28 14 bb
                XDC                      ; 1581 2c
                LI   $14                 ; 1582 20 14
                ADC                      ; 1584 8e
                XDC                      ; 1585 2c
                DS   $4                  ; 1586 34
                BF   $4,A157c            ; 1587 94 f4
                DCI  A1712               ; 1589 2a 17 12
                XDC                      ; 158c 2c
                DCI  $0c00               ; 158d 2a 0c 00
                LIS  $e                  ; 1590 7e
                LR   (IS),A              ; 1591 5c
                PI   A1309               ; 1592 28 13 09
                DCI  $0c22               ; 1595 2a 0c 22
                XDC                      ; 1598 2c
                DCI  A166a               ; 1599 2a 16 6a
A159c:          LM                       ; 159c 16
                XDC                      ; 159d 2c
                ST                       ; 159e 17
                LI   $0f                 ; 159f 20 0f
                ADC                      ; 15a1 8e
                XDC                      ; 15a2 2c
                DS   $8                  ; 15a3 38
                BF   $4,A159c            ; 15a4 94 f7
                PI   $40bc               ; 15a6 28 40 bc
                PK                       ; 15a9 0c
                
A15aa:          LIS  $0                  ; 15aa 70
                LR   $5,A                ; 15ab 55
A15ac:          DCI  $08fb               ; 15ac 2a 08 fb
                LM                       ; 15af 16
                AS   $8                  ; 15b0 c8
                COM                      ; 15b1 18
                LR   $1,A                ; 15b2 51
A15b3:          DCI  $08fb               ; 15b3 2a 08 fb
                LM                       ; 15b6 16
                CI   $e8                 ; 15b7 25 e8
                BT   2,A15be             ; 15b9 82 04
                JMP  A15cd               ; 15bb 29 15 cd
A15be:          AS   $1                  ; 15be c1
                BF   $4,A15b3            ; 15bf 94 f3
                LI   $10                 ; 15c1 20 10
                OUTS 1                   ; 15c3 b1
                LR   A,$5                ; 15c4 45
                XI   $07                 ; 15c5 23 07
                LR   $5,A                ; 15c7 55
                OUTS 0                   ; 15c8 b0
                LIS  $0                  ; 15c9 70
                OUTS 1                   ; 15ca b1
                BF   $0,A15ac            ; 15cb 90 e0
A15cd:          PI   A1456               ; 15cd 28 14 56
                LI   $f8                 ; 15d0 20 f8
A15d2:          DCI  $08fb               ; 15d2 2a 08 fb
                CM                       ; 15d5 8d
                BF   $4,A15d2            ; 15d6 94 fb
                JMP  A17e6               ; 15d8 29 17 e6
A15db:          LR   A,$7                ; 15db 47
                DCI  A15e6               ; 15dc 2a 15 e6
                ADC                      ; 15df 8e
                ADC                      ; 15e0 8e
                LM                       ; 15e1 16
                LR   QU,A                ; 15e2 06
                LM                       ; 15e3 16
                LR   QL,A                ; 15e4 07
                LR   P0,Q                ; 15e5 0d
A15e6:          LR   DC,H                ; 15e6 10
                LISL 0                   ; 15e7 68
                LR   H,DC                ; 15e8 11
                LR   $0,A                ; 15e9 50
                SR   4                   ; 15ea 14
                LR   KL,A                ; 15eb 05
                LR   H,DC                ; 15ec 11
                INS  14                  ; 15ed ae
                SR   1                   ; 15ee 12
                SL   4                   ; 15ef 15
                SL   1                   ; 15f0 13
                ASD  $5                  ; 15f1 d5
                LR   H,DC                ; 15f2 11
                NS   $1                  ; 15f3 f1
                SL   4                   ; 15f4 15
                LR   $0,A                ; 15f5 50
                LR   DC,H                ; 15f6 10
                ASD  $a                  ; 15f7 da
                SR   4                   ; 15f8 14
                INS  4                   ; 15f9 a4
                SR   4                   ; 15fa 14
                ASD  $a                  ; 15fb da
                SR   4                   ; 15fc 14
                LR   A,$6                ; 15fd 46
                SL   1                   ; 15fe 13
                LR   J,W                 ; 15ff 1e
                LR   DC,H                ; 1600 10
                ASD  $2                  ; 1601 d2
                LR   H,DC                ; 1602 11
                DS   (IS)-               ; 1603 3e
A1604:          LR   A,IS                ; 1604 0a
                LR   A,KU                ; 1605 00
                LR   KU,A                ; 1606 04
                LR   A,IS                ; 1607 0a
                LR   A,QU                ; 1608 02
                LR   Q,DC                ; 1609 0e
                LR   DC,H                ; 160a 10
                LR   DC,H                ; 160b 10
                LR   DC,H                ; 160c 10
                LI   $10                 ; 160d 20 10
                DS   $0                  ; 160f 30
                LR   DC,H                ; 1610 10
                LR   A,$0                ; 1611 40
                LR   DC,H                ; 1612 10
                LR   $0,A                ; 1613 50
A1614:          LR   IS,A                ; 1614 0b
                LR   IS,A                ; 1615 0b
                LR   IS,A                ; 1616 0b
                LR   IS,A                ; 1617 0b
                LR   IS,A                ; 1618 0b
                LR   IS,A                ; 1619 0b
                LR   IS,A                ; 161a 0b
                LR   H,DC                ; 161b 11
                LR   H,DC                ; 161c 11
                LR   H,DC                ; 161d 11
                LR   H,DC                ; 161e 11
                LR   H,DC                ; 161f 11
                LR   H,DC                ; 1620 11
                SL   1                   ; 1621 13
                SL   1                   ; 1622 13
                SL   1                   ; 1623 13
                SL   1                   ; 1624 13
                SL   1                   ; 1625 13
                LR   A,KL                ; 1626 01
                LR   A,KL                ; 1627 01
                LR   A,KL                ; 1628 01
                LR   A,KL                ; 1629 01
                LR   P,K                 ; 162a 09
                LR   P,K                 ; 162b 09
                LR   P,K                 ; 162c 09
                LR   P,K                 ; 162d 09
                NI   $21                 ; 162e 21 21
                NI   $21                 ; 1630 21 21
                db   $2d                 
                db   $2d                 
                db   $2d                 
                LR   W,J                 ; 1635 1d
                LR   W,J                 ; 1636 1d
                LR   W,J                 ; 1637 1d
                LNK                      ; 1638 19
                LNK                      ; 1639 19
                LNK                      ; 163a 19
                OUT  $27                 ; 163b 27 27
                OUT  $29                 ; 163d 27 29
                JMP  $292b               ; 163f 29 29 2b
                NOP                      ; 1642 2b
                NOP                      ; 1643 2b
                CI   $25                 ; 1644 25 25
                CI   $07                 ; 1646 25 07
                LR   QL,A                ; 1648 07
                LR   QL,A                ; 1649 07
A164a:          LR   A,QL                ; 164a 03
                LR   A,QL                ; 164b 03
                LR   A,QL                ; 164c 03
                LR   P0,Q                ; 164d 0d
                LR   P0,Q                ; 164e 0d
                LR   P0,Q                ; 164f 0d
                DS   $1                  ; 1650 31
                DS   $1                  ; 1651 31
                INC                      ; 1652 1f
                INC                      ; 1653 1f
                EI                       ; 1654 1b
                EI                       ; 1655 1b
                ST                       ; 1656 17
                ST                       ; 1657 17
                SL   4                   ; 1658 15
                SL   4                   ; 1659 15
                LR   DC,Q                ; 165a 0f
                LR   DC,Q                ; 165b 0f
                db   $2f                 
                db   $2f                 
                LR   KL,A                ; 165e 05
                LR   KL,A                ; 165f 05
                DS   $3                  ; 1660 33
                XI   $08                 ; 1661 23 08
A1663:          LR   K,P                 ; 1663 08
                POP                      ; 1664 1c
                POP                      ; 1665 1c
                DS   (IS)-               ; 1666 3e
A1667:          DS   (IS)-               ; 1667 3e
                LIS  $f                  ; 1668 7f
A1669:          DS   $6                  ; 1669 36
A166a:          AI   $34                 ; 166a 24 34
                DS   $2                  ; 166c 32
                OI   $20                 ; 166d 22 20
                LR   J,W                 ; 166f 1e
                LR   Q,DC                ; 1670 0e
                PK                       ; 1671 0c
                
                LR   A,IS                ; 1672 0a
A1673:          LR   KL,A                ; 1673 05
                LR   QU,A                ; 1674 06
                LR   QL,A                ; 1675 07
                LR   DC,Q                ; 1676 0f
                LR   DC,H                ; 1677 10
                LR   H,DC                ; 1678 11
                LNK                      ; 1679 19
                DI                       ; 167a 1a
                SR   1                   ; 167b 12
                EI                       ; 167c 1b
A167d:          BT   0,0                 ; 167d 80 00
                LISU 0                   ; 167f 60
                LR   A,KL                ; 1680 01
                LI   $03                 ; 1681 20 03
                LISU 0                   ; 1683 60
                LR   KL,A                ; 1684 05
                BT   0,A168e             ; 1685 80 08
                BT   0,A169a             ; 1687 80 12
A1689:          PK                       ; 1689 0c

                LR   A,KL                ; 168a 01
                LM                       ; 168b 16
                BR7  A16a3               ; 168c 8f 16
A168e:          BR7  A16af               ; 168e 8f 20
                AS   (IS)-               ; 1690 ce
                LISU 2                   ; 1691 62
                DS   (IS)-               ; 1692 3e
                INS  14                  ; 1693 ae
                LR   J,W                 ; 1694 1e
                ADC                      ; 1695 8e
                NS   (IS)-               ; 1696 fe
                LIS  $c                  ; 1697 7c
                LISU 0                   ; 1698 60
                SR   4                   ; 1699 14
A169a:          DS   $0                  ; 169a 30
                ST                       ; 169b 17
                LR   A,(IS)              ; 169c 4c
                LM                       ; 169d 16
                XS   (IS)+               ; 169e ed
                db   $2d                 
                AS   (IS)-               ; 16a0 ce
                LISL 6                   ; 16a1 6e
                INS  14                  ; 16a2 ae
A16a3:          ST                       ; 16a3 17
                ST                       ; 16a4 17
                LR   P0,Q                ; 16a5 0d
                LR   P0,Q                ; 16a6 0d
                LR   QL,A                ; 16a7 07
                LR   QL,A                ; 16a8 07
                LR   QL,A                ; 16a9 07
                LR   QL,A                ; 16aa 07
                LR   QL,A                ; 16ab 07
                LR   QL,A                ; 16ac 07
A16ad:          LR   QL,A                ; 16ad 07
                LR   QL,A                ; 16ae 07
A16af:          LR   QL,A                ; 16af 07
                LR   QL,A                ; 16b0 07
                LR   QL,A                ; 16b1 07
                LR   QL,A                ; 16b2 07
A16b3:          LR   P,K                 ; 16b3 09
                LR   A,$a                ; 16b4 4a
                LR   A,KL                ; 16b5 01
                LR   $0,A                ; 16b6 50
A16b7:          LR   $0,A                ; 16b7 50
                LR   $0,A                ; 16b8 50
                LR   $0,A                ; 16b9 50
                LR   $0,A                ; 16ba 50
                LR   KL,A                ; 16bb 05
A16bc:          LR   KU,A                ; 16bc 04
                LR   KU,A                ; 16bd 04
                LR   A,QU                ; 16be 02
                AI   $24                 ; 16bf 24 24
                DS   $4                  ; 16c1 34
                AI   $24                 ; 16c2 24 24
                AI   $24                 ; 16c4 24 24
                AI   $50                 ; 16c6 24 50
                LR   $0,A                ; 16c8 50
                BT   0,A164a             ; 16c9 80 80
                PI   $3a70               ; 16cb 28 3a 70
                BT   2,A1663             ; 16ce 82 94
                INS  6                   ; 16d0 a6
A16d1:          OUTS 8                   ; 16d1 b8
                LR   A,(IS)              ; 16d2 4c
                AS   $a                  ; 16d3 ca
                ASD  (IS)                ; 16d4 dc
                AS   $a                  ; 16d5 ca
A16d6:          ASD  (IS)                ; 16d6 dc
                BT   0,A16d9             ; 16d7 80 01
A16d9:          LR   A,QL                ; 16d9 03
                LR   KU,A                ; 16da 04
                LR   KL,A                ; 16db 05
                LR   QU,A                ; 16dc 06
                LR   QL,A                ; 16dd 07
                BT   2,A1667             ; 16de 82 88
                AMD                      ; 16e0 89
                NM                       ; 16e1 8a
                OM                       ; 16e2 8b
                XM                       ; 16e3 8c
                CM                       ; 16e4 8d
                ADC                      ; 16e5 8e
                db   $ff                 
A16e7:          NI   $15                 ; 16e7 21 15
                LR   A,KL                ; 16e9 01
                OUT  $27                 ; 16ea 27 27
                DS   $a                  ; 16ec 3a
                NS   $9                  ; 16ed f9
                DS   $a                  ; 16ee 3a
                SL   4                   ; 16ef 15
                LR   IS,A                ; 16f0 0b
                LR   KL,A                ; 16f1 05
                db   $ef                 
A16f3:          LR   H,DC                ; 16f3 11
                JMP  $1107               ; 16f4 29 11 07
A16f7:          LR   IS,A                ; 16f7 0b
                LR   A,QL                ; 16f8 03
                LR   P,K                 ; 16f9 09
                DS   $a                  ; 16fa 3a
                NS   $9                  ; 16fb f9
                DS   $a                  ; 16fc 3a
                AI   $25                 ; 16fd 24 25
                LR   P,K                 ; 16ff 09
                SL   1                   ; 1700 13
                DS   $a                  ; 1701 3a
                NS   $5                  ; 1702 f5
                DS   $a                  ; 1703 3a
A1704:          DS   $4                  ; 1704 34
                NI   $03                 ; 1705 21 03
                CI   $0b                 ; 1707 25 0b
                LR   P,K                 ; 1709 09
A170a:          NI   $07                 ; 170a 21 07
                LR   H,DC                ; 170c 11
                LR   P,K                 ; 170d 09
                DS   $a                  ; 170e 3a
A170f:          NS   $b                  ; 170f fb
                DS   $a                  ; 1710 3a
                DS   $2                  ; 1711 32
A1712:          db   $ef                 
                CI   $27                 ; 1713 25 27
                LR   H,DC                ; 1715 11
                LR   KL,A                ; 1716 05
A1717:          LR   IS,A                ; 1717 0b
                LR   P,K                 ; 1718 09
A1719:          NS   $b                  ; 1719 fb
                DS   $a                  ; 171a 3a
                NI   $31                 ; 171b 21 31
                SL   1                   ; 171d 13
                LR   P,K                 ; 171e 09
                LR   IS,A                ; 171f 0b
                LR   DC,H                ; 1720 10
                LIS  $c                  ; 1721 7c
                LIS  $c                  ; 1722 7c
                PI   $fc3c               ; 1723 28 fc 3c
                LIS  $e                  ; 1726 7e
                LIS  $c                  ; 1727 7c
                LIS  $c                  ; 1728 7c
                DS   $0                  ; 1729 30
                BT   2,A16ad             ; 172a 82 82
                LR   A,$8                ; 172c 48
                BT   0,A176e             ; 172d 80 40
                LR   A,QU                ; 172f 02
                BT   2,A16b3             ; 1730 82 82
                LR   DC,H                ; 1732 10
                LR   A,QU                ; 1733 02
                LR   A,QU                ; 1734 02
                AM                       ; 1735 88
                BT   0,A16b7             ; 1736 80 80
                LR   KU,A                ; 1738 04
                BT   2,A16bc             ; 1739 82 82
                LR   DC,H                ; 173b 10
                LIS  $c                  ; 173c 7c
                POP                      ; 173d 1c
                NS   (IS)-               ; 173e fe
                NS   (IS)                ; 173f fc
                NS   (IS)                ; 1740 fc
                LR   K,P                 ; 1741 08
                LIS  $c                  ; 1742 7c
                LIS  $e                  ; 1743 7e
                LR   DC,H                ; 1744 10
                BT   0,A1748             ; 1745 80 02
                LR   K,P                 ; 1747 08
A1748:          LR   KU,A                ; 1748 04
                BT   4,A175a             ; 1749 84 10
                BT   2,A174e             ; 174b 82 02
                LR   DC,H                ; 174d 10
A174e:          BT   0,A16d1             ; 174e 80 82
                LR   K,P                 ; 1750 08
                BT   4,A16d6             ; 1751 84 84
                LR   DC,H                ; 1753 10
                BT   2,A1759             ; 1754 82 04
                LIS  $c                  ; 1756 7c
                NS   (IS)-               ; 1757 fe
                LIS  $c                  ; 1758 7c
A1759:          LR   K,P                 ; 1759 08
A175a:          LIS  $c                  ; 175a 7c
                LIS  $c                  ; 175b 7c
                LR   DC,H                ; 175c 10
                LIS  $c                  ; 175d 7c
                LIS  $8                  ; 175e 78
                LR   A,KU                ; 175f 00
                NS   (IS)-               ; 1760 fe
A1761:          LIS  $c                  ; 1761 7c
                BT   2,A1761             ; 1762 82 fe
                LR   DC,H                ; 1764 10
                LR   DC,H                ; 1765 10
                AS   $5                  ; 1766 c5
A1767:          BT   0,A1778             ; 1767 80 10
                LR   DC,H                ; 1769 10
                INS  10                  ; 176a aa
                BT   0,A177c             ; 176b 80 10
                LR   DC,H                ; 176d 10
A176e:          BF   $2,A1767            ; 176e 92 f8
                LR   DC,H                ; 1770 10
                LR   DC,H                ; 1771 10
                BT   2,A16f3             ; 1772 82 80
                LR   DC,H                ; 1774 10
                LR   DC,H                ; 1775 10
                BT   2,A16f7             ; 1776 82 80
A1778:          LR   DC,H                ; 1778 10
A1779:          LIS  $c                  ; 1779 7c
                BT   2,A1779             ; 177a 82 fe
A177c:          LIS  $c                  ; 177c 7c
                LIS  $c                  ; 177d 7c
                NS   (IS)-               ; 177e fe
                NS   (IS)                ; 177f fc
                NS   (IS)-               ; 1780 fe
                BT   2,A1704             ; 1781 82 82
                db   $82,$82,$80,$80
                BT   0,A170a             ; 1787 80 82
                BT   2,A170a             ; 1789 82 80
                LIS  $c                  ; 178b 7c
                BT   0,A170f             ; 178c 80 82
                NS   (IS)                ; 178e fc
                NS   $8                  ; 178f f8
                LR   A,QU                ; 1790 02
;                BT   0,-126              ; 1791 80 82
				db   $80,$82
                AM                       ; 1793 88
                BT   0,A1717             ; 1794 80 82
                BT   2,A1719             ; 1796 82 82
                BT   4,A1719             ; 1798 84 80
                LIS  $c                  ; 179a 7c
                LIS  $c                  ; 179b 7c
A179c:          NS   (IS)-               ; 179c fe
                BT   2,A179c             ; 179d 82 fe
                LR   A,KU                ; 179f 00
A17a0:          SR   4                   ; 17a0 14
                DS   $a                  ; 17a1 3a
                SL   1                   ; 17a2 13
                LR   W,J                 ; 17a3 1d
                DS   $a                  ; 17a4 3a
                CI   $27                 ; 17a5 25 27
                LR   H,DC                ; 17a7 11
                LR   KL,A                ; 17a8 05
                LR   IS,A                ; 17a9 0b
                LR   P,K                 ; 17aa 09
                NI   $fb                 ; 17ab 21 fb
                CI   $09                 ; 17ad 25 09
                LR   IS,A                ; 17af 0b
                NI   $21                 ; 17b0 21 21
                DS   $a                  ; 17b2 3a
                SL   4                   ; 17b3 15
                LR   IS,A                ; 17b4 0b
                LR   KL,A                ; 17b5 05
                DS   $a                  ; 17b6 3a
                NS   $9                  ; 17b7 f9
                AI   $2c                 ; 17b8 24 2c
                DS   $4                  ; 17ba 34
                XDC                      ; 17bb 2c
                DS   $2                  ; 17bc 32
                DS   $a                  ; 17bd 3a
                SL   1                   ; 17be 13
                LR   P,K                 ; 17bf 09
                DS   $a                  ; 17c0 3a
                OI   $31                 ; 17c1 22 31
                LNK                      ; 17c3 19
                LR   H,DC                ; 17c4 11
                OUT  $27                 ; 17c5 27 27
                LR   IS,A                ; 17c7 0b
                NOP                      ; 17c8 2b
                EI                       ; 17c9 1b
                LR   IS,A                ; 17ca 0b
                LR   KU,A                ; 17cb 04
A17cc:          OUT  $0b                 ; 17cc 27 0b
                LR   QL,A                ; 17ce 07
                LR   QL,A                ; 17cf 07
                LR   IS,A                ; 17d0 0b
                LR   P,K                 ; 17d1 09
                DS   $a                  ; 17d2 3a
                OUT  $01                 ; 17d3 27 01
                JMP  $0107               ; 17d5 29 01 07
A17d8:          PK                       ; 17d8 0c

                LR   K,P                 ; 17d9 08
                LR   QU,A                ; 17da 06
                LR   KL,A                ; 17db 05
                LR   KL,A                ; 17dc 05
                LR   KL,A                ; 17dd 05
                LR   QU,A                ; 17de 06
                LR   QU,A                ; 17df 06
                LR   QU,A                ; 17e0 06
                LR   K,P                 ; 17e1 08
                LR   QU,A                ; 17e2 06
                LR   K,P                 ; 17e3 08
                PK                       ; 17e4 0c
                
A17e5:          db   $ef                 
A17e6:          PI   $424d               ; 17e6 28 42 4d
                LISL 0                   ; 17e9 68
                JMP  A15db               ; 17ea 29 15 db
                LR   A,KU                ; 17ed 00
                LR   A,KU                ; 17ee 00
                LR   A,KU                ; 17ef 00
                LR   A,KU                ; 17f0 00
                LR   A,KU                ; 17f1 00
                LR   A,KU                ; 17f2 00
                LR   A,KU                ; 17f3 00
                LR   A,KU                ; 17f4 00
                LR   A,KU                ; 17f5 00
                LR   A,KU                ; 17f6 00
                LR   A,KU                ; 17f7 00
                LR   A,KU                ; 17f8 00
                LR   A,KU                ; 17f9 00
                LR   A,KU                ; 17fa 00
                LR   A,KU                ; 17fb 00
                LR   A,KU                ; 17fc 00
                LR   A,KU                ; 17fd 00
                LR   A,KU                ; 17fe 00
                LR   A,KU                ; 17ff 00
