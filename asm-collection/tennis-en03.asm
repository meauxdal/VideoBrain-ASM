;Tennis - EN03

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/29/2010

org $1000

				db   $aa,$55			;cart signature
				db   $01				;background color
				db   $00,$00,$00,$00,$07,$0b,$2b,$2b,$01,$21,$00,$00,$00,$00,$00	;name - TENNIS

START:          DCI  $0f8b               ; 1012 2a 0f 8b
                XDC                      ; 1015 2c
                DCI  $1613               ; 1016 2a 16 13
                LI   $10                 ; 1019 20 10
                LR   $7,A                ; 101b 57
                PI   A1272               ; 101c 28 12 72
                DCI  $0f9b               ; 101f 2a 0f 9b
                LIS  $0                  ; 1022 70
                ST                       ; 1023 17
                ST                       ; 1024 17
                ST                       ; 1025 17
A1026:          DI                       ; 1026 1a
                LR   J,W                 ; 1027 1e
                DCI  $0c00               ; 1028 2a 0c 00
                LIS  $8                  ; 102b 78
                LR   $a,A                ; 102c 5a
A102d:          LIS  $7                  ; 102d 77
                ST                       ; 102e 17
                LIS  $0                  ; 102f 70
                ST                       ; 1030 17
                LIS  $2                  ; 1031 72
                ST                       ; 1032 17
                LI   $80                 ; 1033 20 80
                ST                       ; 1035 17
                DS   $a                  ; 1036 3a
                BF   $4,A102d            ; 1037 94 f5
                PI   $45db               ; 1039 28 45 db
                PI   $41c8               ; 103c 28 41 c8
                DCI  A15cb               ; 103f 2a 15 cb
                LI   $20                 ; 1042 20 20
                LISU 2                   ; 1044 62
                LISL 4                   ; 1045 6c
                LR   (IS),A              ; 1046 5c
                PI   $4205               ; 1047 28 42 05
                LI   $40                 ; 104a 20 40
                DCI  $0fdf               ; 104c 2a 0f df
                ST                       ; 104f 17
                LISL 4                   ; 1050 6c
                LIS  $c                  ; 1051 7c
                LR   (IS),A              ; 1052 5c
                DCI  A15eb               ; 1053 2a 15 eb
                PI   $4205               ; 1056 28 42 05
                LI   $36                 ; 1059 20 36
                DCI  $0fdf               ; 105b 2a 0f df
                ST                       ; 105e 17
                LI   $ff                 ; 105f 20 ff
                LR   $7,A                ; 1061 57
                LIS  $0                  ; 1062 70
                LR   $5,A                ; 1063 55
                LR   $6,A                ; 1064 56
A1065:          LIS  $0                  ; 1065 70
                DCI  $0fe2               ; 1066 2a 0f e2
                ST                       ; 1069 17
                PI   A14b6               ; 106a 28 14 b6
                LIS  $a                  ; 106d 7a
                LR   $1,A                ; 106e 51
                LR   A,$8                ; 106f 48
                INC                      ; 1070 1f
                LR   $8,A                ; 1071 58
                DCI  $245e               ; 1072 2a 24 5e
                CI   $40                 ; 1075 25 40
                BT   4,A109d             ; 1077 84 25
A1079:          CM                       ; 1079 8d
                BT   4,A1081             ; 107a 84 06
                DS   $1                  ; 107c 31
                BF   $4,A1079            ; 107d 94 fb
                BF   $0,A1065            ; 107f 90 e5
A1081:          PI   $40d9               ; 1081 28 40 d9
                PI   $412d               ; 1084 28 41 2d
                DCI  $0f9b               ; 1087 2a 0f 9b
                LR   A,$7                ; 108a 47
                INC                      ; 108b 1f
                LR   $7,A                ; 108c 57
                CI   $02                 ; 108d 25 02
                BT   4,START             ; 108f 84 82
                ADC                      ; 1091 8e
                LR   A,$8                ; 1092 48
                ST                       ; 1093 17
                DCI  $0f9e               ; 1094 2a 0f 9e
                LR   A,$7                ; 1097 47
                ADC                      ; 1098 8e
                LR   A,$1                ; 1099 41
                ST                       ; 109a 17
                BF   $0,A1065            ; 109b 90 c9
A109d:          LR   A,$7                ; 109d 47
                INC                      ; 109e 1f
                LR   $7,A                ; 109f 57
                LIS  $0                  ; 10a0 70
                LR   $1,A                ; 10a1 51
                LR   $2,A                ; 10a2 52
                LIS  $2                  ; 10a3 72
                LR   $4,A                ; 10a4 54
A10a5:          DS   $4                  ; 10a5 34
                DS   $7                  ; 10a6 37
                BF   $1,A10c2            ; 10a7 91 1a
                LR   A,$7                ; 10a9 47
                DCI  $0f9e               ; 10aa 2a 0f 9e
                ADC                      ; 10ad 8e
                LM                       ; 10ae 16
                LR   $5,A                ; 10af 55
                DCI  A1eeb               ; 10b0 2a 1e eb
                LR   A,$4                ; 10b3 44
                ADC                      ; 10b4 8e
                LM                       ; 10b5 16
                LR   $6,A                ; 10b6 56
A10b7:          DS   $5                  ; 10b7 35
                BT   4,A10a5             ; 10b8 84 ec
                LR   A,$1                ; 10ba 41
                AS   $6                  ; 10bb c6
                LR   $1,A                ; 10bc 51
                LR   A,$2                ; 10bd 42
                LNK                      ; 10be 19
                LR   $2,A                ; 10bf 52
                BF   $0,A10b7            ; 10c0 90 f6
A10c2:          LISU 3                   ; 10c2 63
                LISL 7                   ; 10c3 6f
                LIS  $0                  ; 10c4 70
A10c5:          LR   (IS)-,A             ; 10c5 5e
                BR7  A10c5               ; 10c6 8f fe
                LISU 4                   ; 10c8 64
A10c9:          LR   (IS)-,A             ; 10c9 5e
                BR7  A10c9               ; 10ca 8f fe
                LISU 3                   ; 10cc 63
                LISL 2                   ; 10cd 6a
                LR   A,$1                ; 10ce 41
                LR   (IS),A              ; 10cf 5c
                CI   $5f                 ; 10d0 25 5f
                BT   2,A10d7             ; 10d2 82 04
                JMP  START               ; 10d4 29 10 12
A10d7:          LI   $ff                 ; 10d7 20 ff
                DCI  $08f5               ; 10d9 2a 08 f5
                ST                       ; 10dc 17
                LIS  $0                  ; 10dd 70
                OUTS 0                   ; 10de b0
                OUTS 1                   ; 10df b1
                DCI  $0fdd               ; 10e0 2a 0f dd
                ST                       ; 10e3 17
                ST                       ; 10e4 17
                DCI  $0fda               ; 10e5 2a 0f da
                ST                       ; 10e8 17
                LI   $11                 ; 10e9 20 11
                OUTS 12                  ; 10eb bc
                LI   $ff                 ; 10ec 20 ff
                OUTS 13                  ; 10ee bd
                LI   $ff                 ; 10ef 20 ff
                DCI  $08f0               ; 10f1 2a 08 f0
                ST                       ; 10f4 17
                LIS  $1                  ; 10f5 71
                OUTS 14                  ; 10f6 be
                LI   $4c                 ; 10f7 20 4c
                DCI  $0fea               ; 10f9 2a 0f ea
                ST                       ; 10fc 17
                DCI  $08f7               ; 10fd 2a 08 f7
                ST                       ; 1100 17
                EI                       ; 1101 1b
                SR   1                   ; 1102 12
                LR   J,W                 ; 1103 1e
                DCI  $0f60               ; 1104 2a 0f 60
                LI   $2a                 ; 1107 20 2a
                LR   $1,A                ; 1109 51
                LIS  $0                  ; 110a 70
A110b:          ST                       ; 110b 17
                DS   $1                  ; 110c 31
                BF   $4,A110b            ; 110d 94 fd
                DCI  $0fa5               ; 110f 2a 0f a5
                LI   $4b                 ; 1112 20 4b
                ST                       ; 1114 17
                ST                       ; 1115 17
                ST                       ; 1116 17
                ST                       ; 1117 17
                DCI  $0d0c               ; 1118 2a 0d 0c
                XDC                      ; 111b 2c
                DCI  A1b4a               ; 111c 2a 1b 4a
                LISU 2                   ; 111f 62
                LISL 0                   ; 1120 68
                LIS  $1                  ; 1121 71
                LR   (IS)+,A             ; 1122 5d
                LR   (IS)+,A             ; 1123 5d
                LIS  $0                  ; 1124 70
                LR   (IS),A              ; 1125 5c
                PI   $4686               ; 1126 28 46 86
                DCI  $0d0d               ; 1129 2a 0d 0d
                XDC                      ; 112c 2c
                DCI  A1b49               ; 112d 2a 1b 49
                LIS  $0                  ; 1130 70
                LR   (IS),A              ; 1131 5c
                PI   $4686               ; 1132 28 46 86
                DCI  $0f0c               ; 1135 2a 0f 0c
                XDC                      ; 1138 2c
                DCI  A1d49               ; 1139 2a 1d 49
                LIS  $0                  ; 113c 70
                LISL 0                   ; 113d 68
                LR   (IS)+,A             ; 113e 5d
                LR   (IS)+,A             ; 113f 5d
                LI   $54                 ; 1140 20 54
                LR   (IS),A              ; 1142 5c
                PI   $4686               ; 1143 28 46 86
                DCI  $0cc0               ; 1146 2a 0c c0
                XDC                      ; 1149 2c
                DCI  A1e4b               ; 114a 2a 1e 4b
                LI   $20                 ; 114d 20 20
                LR   $7,A                ; 114f 57
                PI   A1272               ; 1150 28 12 72
                LI   $80                 ; 1153 20 80
                DCI  $0fa9               ; 1155 2a 0f a9
                ST                       ; 1158 17
                LI   $10                 ; 1159 20 10
                LR   $7,A                ; 115b 57
                LISU 4                   ; 115c 64
                LISL 7                   ; 115d 6f
                LIS  $0                  ; 115e 70
A115f:          LR   (IS)-,A             ; 115f 5e
                BR7  A115f               ; 1160 8f fe
                JMP  A1303               ; 1162 29 13 03
A1165:          LISL 5                   ; 1165 6d
                LIS  $1                  ; 1166 71
                NS   (IS)                ; 1167 fc
                DCI  A1e9f               ; 1168 2a 1e 9f
                BF   $4,A1179            ; 116b 94 0d
                DCI  A1e95               ; 116d 2a 1e 95
                LISL 2                   ; 1170 6a
                LI   $20                 ; 1171 20 20
                NS   (IS)                ; 1173 fc
                BT   4,A1179             ; 1174 84 04
                DCI  A1e85               ; 1176 2a 1e 85
A1179:          LR   H,DC                ; 1179 11
A117a:          LR   DC,H                ; 117a 10
                LM                       ; 117b 16
                CI   $ff                 ; 117c 25 ff
                BF   $4,A1183            ; 117e 94 04
                JMP  A1736               ; 1180 29 17 36
A1183:          LR   QU,A                ; 1183 06
                LM                       ; 1184 16
                LR   QL,A                ; 1185 07
                LM                       ; 1186 16
                LR   $0,A                ; 1187 50
                LR   H,DC                ; 1188 11
                PI   A12d5               ; 1189 28 12 d5
A118c:          LR   DC,Q                ; 118c 0f
                LM                       ; 118d 16
                LR   $4,A                ; 118e 54
                LR   Q,DC                ; 118f 0e
                PI   A1297               ; 1190 28 12 97
                XS   $4                  ; 1193 e4
                LR   DC,Q                ; 1194 0f
                LM                       ; 1195 16
                LR   Q,DC                ; 1196 0e
                BF   $1,A11c2            ; 1197 91 2a
A1199:          LIS  $0                  ; 1199 70
                XS   $4                  ; 119a e4
                BT   1,A118c             ; 119b 81 f0
                XDC                      ; 119d 2c
                LI   $fc                 ; 119e 20 fc
                ADC                      ; 11a0 8e
A11a1:          LR   A,$1                ; 11a1 41
                ST                       ; 11a2 17
                LM                       ; 11a3 16
                LR   A,$2                ; 11a4 42
                ST                       ; 11a5 17
                LR   A,$0                ; 11a6 40
                CI   $15                 ; 11a7 25 15
                BF   $4,A117a            ; 11a9 94 d0
                LISU 3                   ; 11ab 63
                LISL 6                   ; 11ac 6e
                LIS  $1                  ; 11ad 71
                NS   (IS)                ; 11ae fc
                LIS  $0                  ; 11af 70
                LR   (IS),A              ; 11b0 5c
                LISU 3                   ; 11b1 63
                BF   $4,A117a            ; 11b2 94 c7
                LISL 4                   ; 11b4 6c
                LIS  $0                  ; 11b5 70
                XS   (IS)                ; 11b6 ec
                BT   1,A11bb             ; 11b7 81 03
                LIS  $1                  ; 11b9 71
                LR   (IS),A              ; 11ba 5c
A11bb:          DCI  $0c80               ; 11bb 2a 0c 80
                LIS  $0                  ; 11be 70
                LR   $0,A                ; 11bf 50
                BF   $0,A11a1            ; 11c0 90 e0
A11c2:          CI   $04                 ; 11c2 25 04
                BT   4,A11fa             ; 11c4 84 35
                CI   $00                 ; 11c6 25 00
                BF   $4,A11cd            ; 11c8 94 04
                JMP  A1a05               ; 11ca 29 1a 05
A11cd:          CI   $01                 ; 11cd 25 01
                BF   $4,A11d4            ; 11cf 94 04
                JMP  A19cb               ; 11d1 29 19 cb
A11d4:          CI   $02                 ; 11d4 25 02
                BF   $4,A11db            ; 11d6 94 04
                JMP  A1a94               ; 11d8 29 1a 94
A11db:          CI   $03                 ; 11db 25 03
                BF   $4,A11e2            ; 11dd 94 04
                JMP  A1925               ; 11df 29 19 25
A11e2:          CI   $05                 ; 11e2 25 05
                BF   $4,A11e9            ; 11e4 94 04
                JMP  A18a7               ; 11e6 29 18 a7
A11e9:          CI   $06                 ; 11e9 25 06
                BF   $4,A11f0            ; 11eb 94 04
                JMP  A19f9               ; 11ed 29 19 f9
A11f0:          CI   $07                 ; 11f0 25 07
                BF   $4,A11f7            ; 11f2 94 04
                JMP  A19c4               ; 11f4 29 19 c4
A11f7:          JMP  A1b05               ; 11f7 29 1b 05
A11fa:          PI   A1623               ; 11fa 28 16 23
                BF   $0,A1199            ; 11fd 90 9b
                LR   $3,A                ; 11ff 53
                LR   A,IS                ; 1200 0a
                LISU 4                   ; 1201 64
                LISL 4                   ; 1202 6c
                LR   (IS)+,A             ; 1203 5d
                LR   A,QU                ; 1204 02
                LR   (IS)+,A             ; 1205 5d
                LR   A,QL                ; 1206 03
                LR   (IS)+,A             ; 1207 5d
                LR   A,$9                ; 1208 49
                LR   (IS)+,A             ; 1209 5d
                XDC                      ; 120a 2c
                LR   Q,DC                ; 120b 0e
                DCI  $0fac               ; 120c 2a 0f ac
                LISU 2                   ; 120f 62
                LISL 0                   ; 1210 68
                LR   A,(IS)+             ; 1211 4d
                ST                       ; 1212 17
                LR   A,(IS)+             ; 1213 4d
                ST                       ; 1214 17
                LR   A,(IS)+             ; 1215 4d
                ST                       ; 1216 17
                LR   A,(IS)+             ; 1217 4d
                ST                       ; 1218 17
                LR   A,QU                ; 1219 02
                ST                       ; 121a 17
                LR   A,QL                ; 121b 03
                ST                       ; 121c 17
                XDC                      ; 121d 2c
                LR   Q,DC                ; 121e 0e
                XDC                      ; 121f 2c
                LR   A,KU                ; 1220 00
                ST                       ; 1221 17
                LR   A,KL                ; 1222 01
                ST                       ; 1223 17
                LR   A,$a                ; 1224 4a
                ST                       ; 1225 17
                LR   A,$b                ; 1226 4b
                ST                       ; 1227 17
                LR   J,W                 ; 1228 1e
                LR   A,$9                ; 1229 49
                ST                       ; 122a 17
                LR   K,P                 ; 122b 08
                LR   A,KU                ; 122c 00
                ST                       ; 122d 17
                LR   A,KL                ; 122e 01
                ST                       ; 122f 17
                LR   A,QU                ; 1230 02
                ST                       ; 1231 17
                LR   A,QL                ; 1232 03
                ST                       ; 1233 17
                PI   $424d               ; 1234 28 42 4d
                DCI  $0fac               ; 1237 2a 0f ac
                LISU 2                   ; 123a 62
                LISL 0                   ; 123b 68
                LM                       ; 123c 16
                LR   (IS)+,A             ; 123d 5d
                LM                       ; 123e 16
                LR   (IS)+,A             ; 123f 5d
                LM                       ; 1240 16
                LR   (IS)+,A             ; 1241 5d
                LM                       ; 1242 16
                LR   (IS)+,A             ; 1243 5d
                LM                       ; 1244 16
                LR   QU,A                ; 1245 06
                LM                       ; 1246 16
                LR   QL,A                ; 1247 07
                XDC                      ; 1248 2c
                LR   DC,Q                ; 1249 0f
                XDC                      ; 124a 2c
                LIS  $2                  ; 124b 72
                ADC                      ; 124c 8e
                LM                       ; 124d 16
                LR   $a,A                ; 124e 5a
                LM                       ; 124f 16
                LR   $b,A                ; 1250 5b
                LM                       ; 1251 16
                LR   $9,A                ; 1252 59
                LR   W,J                 ; 1253 1d
                LM                       ; 1254 16
                LR   KU,A                ; 1255 04
                LM                       ; 1256 16
                LR   KL,A                ; 1257 05
                LR   P,K                 ; 1258 09
                LM                       ; 1259 16
                LR   QU,A                ; 125a 06
                LM                       ; 125b 16
                LR   QL,A                ; 125c 07
                DCI  $0fb2               ; 125d 2a 0f b2
                LM                       ; 1260 16
                LR   KU,A                ; 1261 04
                LM                       ; 1262 16
                LR   KL,A                ; 1263 05
                LR   DC,Q                ; 1264 0f
                LISU 4                   ; 1265 64
                LISL 7                   ; 1266 6f
                LR   A,(IS)-             ; 1267 4e
                LR   $9,A                ; 1268 59
                LR   A,(IS)-             ; 1269 4e
                LR   QL,A                ; 126a 07
                LR   A,(IS)-             ; 126b 4e
                LR   QU,A                ; 126c 06
                LR   A,(IS)-             ; 126d 4e
                LR   IS,A                ; 126e 0b
                LR   A,$3                ; 126f 43
                EI                       ; 1270 1b
                POP                      ; 1271 1c
A1272:          LR   K,P                 ; 1272 08
A1273:          LM                       ; 1273 16
                XDC                      ; 1274 2c
                ST                       ; 1275 17
                XDC                      ; 1276 2c
                DS   $7                  ; 1277 37
                BF   $4,A1273            ; 1278 94 fa
                PK                       ; 127a 0c
A127b:          LR   K,P                 ; 127b 08
                LISU 5                   ; 127c 65
                LISL 7                   ; 127d 6f
                DCI  $0c80               ; 127e 2a 0c 80
                LI   $10                 ; 1281 20 10
                LR   $0,A                ; 1283 50
                LIS  $2                  ; 1284 72
                LR   $2,A                ; 1285 52
A1286:          LM                       ; 1286 16
                LR   $1,A                ; 1287 51
                LM                       ; 1288 16
                COM                      ; 1289 18
                INC                      ; 128a 1f
                AS   $1                  ; 128b c1
                COM                      ; 128c 18
                LR   (IS)+,A             ; 128d 5d
                BR7  A1291               ; 128e 8f 02
                LISU 6                   ; 1290 66
A1291:          LR   A,$2                ; 1291 42
                ADC                      ; 1292 8e
                DS   $0                  ; 1293 30
                BF   $4,A1286            ; 1294 94 f1
                PK                       ; 1296 0c
A1297:          LR   K,P                 ; 1297 08
                DCI  $0c80               ; 1298 2a 0c 80
                LR   A,$4                ; 129b 44
                SL   1                   ; 129c 13
                SL   1                   ; 129d 13
                ADC                      ; 129e 8e
                LM                       ; 129f 16
                COM                      ; 12a0 18
                AS   $1                  ; 12a1 c1
                BF   $1,A12a5            ; 12a2 91 02
                COM                      ; 12a4 18
A12a5:          LR   $8,A                ; 12a5 58
                LR   A,$5                ; 12a6 45
                AM                       ; 12a7 88
                AS   $8                  ; 12a8 c8
                BF   $2,A12bb            ; 12a9 92 11
                LM                       ; 12ab 16
                COM                      ; 12ac 18
                AS   $2                  ; 12ad c2
                BF   $1,A12b1            ; 12ae 91 02
                COM                      ; 12b0 18
A12b1:          LR   $8,A                ; 12b1 58
                LM                       ; 12b2 16
                AS   $6                  ; 12b3 c6
                AS   $8                  ; 12b4 c8
                BF   $2,A12bb            ; 12b5 92 05
                LI   $80                 ; 12b7 20 80
                BF   $0,A12bc            ; 12b9 90 02
A12bb:          LIS  $0                  ; 12bb 70
A12bc:          PK                       ; 12bc 0c
A12bd:          LR   K,P                 ; 12bd 08
                XDC                      ; 12be 2c
                LR   DC,H                ; 12bf 10
                LI   $fe                 ; 12c0 20 fe
                ADC                      ; 12c2 8e
                LR   H,DC                ; 12c3 11
                CM                       ; 12c4 8d
                CM                       ; 12c5 8d
                XDC                      ; 12c6 2c
A12c7:          LIS  $7                  ; 12c7 77
                LR   $2,A                ; 12c8 52
                LIS  $2                  ; 12c9 72
                LR   $7,A                ; 12ca 57
A12cb:          LM                       ; 12cb 16
                XDC                      ; 12cc 2c
                ST                       ; 12cd 17
                LR   A,$7                ; 12ce 47
                ADC                      ; 12cf 8e
                XDC                      ; 12d0 2c
                DS   $2                  ; 12d1 32
                BF   $4,A12cb            ; 12d2 94 f8
                PK                       ; 12d4 0c
A12d5:          LR   K,P                 ; 12d5 08
                DCI  $0c80               ; 12d6 2a 0c 80
                LR   A,$0                ; 12d9 40
                SL   1                   ; 12da 13
                SL   1                   ; 12db 13
                ADC                      ; 12dc 8e
                XDC                      ; 12dd 2c
                DCI  $0ce0               ; 12de 2a 0c e0
                SR   1                   ; 12e1 12
                ADC                      ; 12e2 8e
                LM                       ; 12e3 16
                XDC                      ; 12e4 2c
                AM                       ; 12e5 88
                LR   $1,A                ; 12e6 51
                LM                       ; 12e7 16
                LR   $5,A                ; 12e8 55
                LM                       ; 12e9 16
                LR   $7,A                ; 12ea 57
                LM                       ; 12eb 16
                LR   $6,A                ; 12ec 56
                XDC                      ; 12ed 2c
                LR   A,$7                ; 12ee 47
                AM                       ; 12ef 88
                LR   $2,A                ; 12f0 52
                PK                       ; 12f1 0c
A12f2:          LI   $1e                 ; 12f2 20 1e
                LR   $7,A                ; 12f4 57
                LIS  $8                  ; 12f5 78
                LR   $8,A                ; 12f6 58
A12f7:          PI   A148f               ; 12f7 28 14 8f
                LR   A,$8                ; 12fa 48
                XI   $10                 ; 12fb 23 10
                LR   $8,A                ; 12fd 58
                DS   $7                  ; 12fe 37
                BF   $4,A12f7            ; 12ff 94 f7
                LIS  $6                  ; 1301 76
                LR   $7,A                ; 1302 57
A1303:          LISU 3                   ; 1303 63
                LISL 5                   ; 1304 6d
                LIS  $0                  ; 1305 70
                LR   $0,A                ; 1306 50
                DCI  A1de5               ; 1307 2a 1d e5
A130a:          PI   A142c               ; 130a 28 14 2c
                LR   A,$0                ; 130d 40
                INC                      ; 130e 1f
                LR   $0,A                ; 130f 50
                DS   $7                  ; 1310 37
                BF   $4,A130a            ; 1311 94 f8
                DCI  $1dc5               ; 1313 2a 1d c5
                LR   H,DC                ; 1316 11
                LI   $60                 ; 1317 20 60
                LR   $5,A                ; 1319 55
                DCI  A1dd9               ; 131a 2a 1d d9
                LR   W,J                 ; 131d 1d
                BT   1,A132a             ; 131e 81 0b
                DCI  A1dc9               ; 1320 2a 1d c9
                LR   H,DC                ; 1323 11
                LI   $5a                 ; 1324 20 5a
                LR   $5,A                ; 1326 55
                DCI  A1dd5               ; 1327 2a 1d d5
A132a:          LR   $8,A                ; 132a 58
                LIS  $5                  ; 132b 75
                LR   $0,A                ; 132c 50
                PI   A1468               ; 132d 28 14 68
                DCI  A1db9               ; 1330 2a 1d b9
                LR   W,J                 ; 1333 1d
                BT   1,A1339             ; 1334 81 04
                DCI  $1dbd               ; 1336 2a 1d bd
A1339:          LIS  $6                  ; 1339 76
                LR   $0,A                ; 133a 50
                PI   A1468               ; 133b 28 14 68
                DCI  $0fa1               ; 133e 2a 0f a1
                LR   A,$a                ; 1341 4a
                ST                       ; 1342 17
                LR   A,$b                ; 1343 4b
                ST                       ; 1344 17
                DCI  $0cac               ; 1345 2a 0c ac
                LR   A,$5                ; 1348 45
                ST                       ; 1349 17
                DCI  $0ca8               ; 134a 2a 0c a8
                ST                       ; 134d 17
                DCI  $0ca4               ; 134e 2a 0c a4
                ST                       ; 1351 17
                LI   $80                 ; 1352 20 80
                NS   (IS)                ; 1354 fc
                AI   $03                 ; 1355 24 03
                LR   (IS),A              ; 1357 5c
                DCI  $0d0a               ; 1358 2a 0d 0a
                LIS  $0                  ; 135b 70
                ST                       ; 135c 17
                ST                       ; 135d 17
                DCI  $0cd4               ; 135e 2a 0c d4
                XDC                      ; 1361 2c
                DCI  A1e5f               ; 1362 2a 1e 5f
                LIS  $4                  ; 1365 74
                LR   $7,A                ; 1366 57
                PI   A1272               ; 1367 28 12 72
                LISL 3                   ; 136a 6b
                LIS  $3                  ; 136b 73
                LR   (IS)+,A             ; 136c 5d
                LIS  $1                  ; 136d 71
                LR   (IS),A              ; 136e 5c
                LISL 1                   ; 136f 69
                LIS  $4                  ; 1370 74
                LR   (IS)+,A             ; 1371 5d
                LIS  $8                  ; 1372 78
                LR   $1,A                ; 1373 51
                DCI  $0ce2               ; 1374 2a 0c e2
                LIS  $0                  ; 1377 70
A1378:          ST                       ; 1378 17
                DS   $1                  ; 1379 31
                BF   $4,A1378            ; 137a 94 fd
                LR   W,J                 ; 137c 1d
                LIS  $0                  ; 137d 70
                BT   1,A1381             ; 137e 81 02
                LIS  $1                  ; 1380 71
A1381:          LR   $1,A                ; 1381 51
                LISU 3                   ; 1382 63
                LISL 2                   ; 1383 6a
                LI   $20                 ; 1384 20 20
                NS   (IS)                ; 1386 fc
                LIS  $0                  ; 1387 70
                BT   4,A138b             ; 1388 84 02
                LIS  $2                  ; 138a 72
A138b:          AS   $1                  ; 138b c1
                LR   $1,A                ; 138c 51
                DCI  $0fa9               ; 138d 2a 0f a9
                LM                       ; 1390 16
                XI   $80                 ; 1391 23 80
                DCI  $0fa9               ; 1393 2a 0f a9
                ST                       ; 1396 17
                LIS  $0                  ; 1397 70
                BT   1,A139b             ; 1398 81 02
                LIS  $4                  ; 139a 74
A139b:          AS   $1                  ; 139b c1
                DCI  A13ec               ; 139c 2a 13 ec
                SL   1                   ; 139f 13
                SL   1                   ; 13a0 13
                SL   1                   ; 13a1 13
                ADC                      ; 13a2 8e
                LM                       ; 13a3 16
                XDC                      ; 13a4 2c
                DCI  $0c94               ; 13a5 2a 0c 94
                ST                       ; 13a8 17
                CM                       ; 13a9 8d
                XDC                      ; 13aa 2c
                LM                       ; 13ab 16
                XDC                      ; 13ac 2c
                ST                       ; 13ad 17
                XDC                      ; 13ae 2c
                LM                       ; 13af 16
                XDC                      ; 13b0 2c
                DCI  $0cea               ; 13b1 2a 0c ea
                ST                       ; 13b4 17
                XDC                      ; 13b5 2c
                LM                       ; 13b6 16
                XDC                      ; 13b7 2c
                ST                       ; 13b8 17
                XDC                      ; 13b9 2c
                LM                       ; 13ba 16
                XDC                      ; 13bb 2c
                DCI  $0c8c               ; 13bc 2a 0c 8c
                ST                       ; 13bf 17
                CM                       ; 13c0 8d
                XDC                      ; 13c1 2c
                LM                       ; 13c2 16
                XDC                      ; 13c3 2c
                ST                       ; 13c4 17
                XDC                      ; 13c5 2c
                LM                       ; 13c6 16
                XDC                      ; 13c7 2c
                DCI  $0c90               ; 13c8 2a 0c 90
A13cb:          ST                       ; 13cb 17
                CM                       ; 13cc 8d
                XDC                      ; 13cd 2c
                LM                       ; 13ce 16
                XDC                      ; 13cf 2c
                ST                       ; 13d0 17
                LIS  $0                  ; 13d1 70
                LR   $1,A                ; 13d2 51
A13d3:          LIS  $2                  ; 13d3 72
                NS   (IS)                ; 13d4 fc
                BT   4,A13d9             ; 13d5 84 03
                LIS  $4                  ; 13d7 74
                LR   $1,A                ; 13d8 51
A13d9:          LIS  $1                  ; 13d9 71
                NS   (IS)                ; 13da fc
                BT   4,A13df             ; 13db 84 03
                AS   $1                  ; 13dd c1
                LR   $1,A                ; 13de 51
A13df:          LR   A,$1                ; 13df 41
                CI   $00                 ; 13e0 25 00
                BF   $4,A13e5            ; 13e2 94 02
                LIS  $2                  ; 13e4 72
A13e5:          DCI  $08f5               ; 13e5 2a 08 f5
                ST                       ; 13e8 17
                JMP  A14fb               ; 13e9 29 14 fb
A13ec:          DS   $a                  ; 13ec 3a
                ASD  $0                  ; 13ed d0
                db   $ff                 
                NS   (IS)                ; 13ef fc
                AS   $8                  ; 13f0 c8
                LR   $0,A                ; 13f1 50
                AS   $8                  ; 13f2 c8
                AS   $8                  ; 13f3 c8
                BT   4,A1445             ; 13f4 84 50
                LR   A,KL                ; 13f6 01
                LR   KU,A                ; 13f7 04
                AS   $8                  ; 13f8 c8
                LR   $0,A                ; 13f9 50
                AS   $8                  ; 13fa c8
                AS   $8                  ; 13fb c8
                DS   $a                  ; 13fc 3a
                ASD  $0                  ; 13fd d0
                db   $ff                 
                NS   (IS)                ; 13ff fc
                DS   $8                  ; 1400 38
                LR   $0,A                ; 1401 50
                BT   4,A13cb             ; 1402 84 c8
                BT   4,A1455             ; 1404 84 50
                LR   A,KL                ; 1406 01
                LR   KU,A                ; 1407 04
                DS   $8                  ; 1408 38
                LR   $0,A                ; 1409 50
                BT   4,A13d3             ; 140a 84 c8
                DS   $a                  ; 140c 3a
                LR   $0,A                ; 140d 50
                db   $ff                 
                LR   KU,A                ; 140f 04
                AS   $8                  ; 1410 c8
                LR   $0,A                ; 1411 50
                AS   $8                  ; 1412 c8
                AS   $8                  ; 1413 c8
                BT   4,A13e5             ; 1414 84 d0
                LR   A,KL                ; 1416 01
                NS   (IS)                ; 1417 fc
                AS   $8                  ; 1418 c8
                LR   $0,A                ; 1419 50
                AS   $8                  ; 141a c8
                AS   $8                  ; 141b c8
                DS   $a                  ; 141c 3a
                LR   $0,A                ; 141d 50
                db   $ff                 
                LR   KU,A                ; 141f 04
                DS   $8                  ; 1420 38
                AS   $8                  ; 1421 c8
                BT   4,A1473             ; 1422 84 50
;                BT   4,-48               ; 1424 84 d0
				db   $84,$d0
                LR   A,KL                ; 1426 01
                NS   (IS)                ; 1427 fc
                DS   $8                  ; 1428 38
                AS   $8                  ; 1429 c8
                BT   4,A147b             ; 142a 84 50
A142c:          LR   K,P                 ; 142c 08
                XDC                      ; 142d 2c
                DCI  $0c40               ; 142e 2a 0c 40
                LR   A,$0                ; 1431 40
                ADC                      ; 1432 8e
                XDC                      ; 1433 2c
                LM                       ; 1434 16
                XDC                      ; 1435 2c
                ST                       ; 1436 17
                LR   $1,A                ; 1437 51
                LI   $2f                 ; 1438 20 2f
                ADC                      ; 143a 8e
                LR   A,$1                ; 143b 41
                ST                       ; 143c 17
                SR   1                   ; 143d 12
                LR   $1,A                ; 143e 51
                DCI  $0820               ; 143f 2a 08 20
                LR   A,$0                ; 1442 40
                ADC                      ; 1443 8e
                XDC                      ; 1444 2c
A1445:          LM                       ; 1445 16
                XDC                      ; 1446 2c
                ST                       ; 1447 17
                SL   1                   ; 1448 13
                SL   1                   ; 1449 13
                LR   $2,A                ; 144a 52
                DCI  $0c80               ; 144b 2a 0c 80
                LR   A,$0                ; 144e 40
                SL   1                   ; 144f 13
                SL   1                   ; 1450 13
                ADC                      ; 1451 8e
                LIS  $2                  ; 1452 72
                LR   $4,A                ; 1453 54
A1454:          XDC                      ; 1454 2c
A1455:          LM                       ; 1455 16
                XDC                      ; 1456 2c
                ST                       ; 1457 17
                LR   A,$2                ; 1458 42
                ST                       ; 1459 17
                LR   A,$1                ; 145a 41
                LR   $2,A                ; 145b 52
                DS   $4                  ; 145c 34
                BF   $4,A1454            ; 145d 94 f6
                XDC                      ; 145f 2c
                LM                       ; 1460 16
                LR   QU,A                ; 1461 06
                LM                       ; 1462 16
                LR   QL,A                ; 1463 07
                XDC                      ; 1464 2c
                LR   DC,Q                ; 1465 0f
                BF   $0,A1469            ; 1466 90 02
A1468:          LR   K,P                 ; 1468 08
A1469:          DI                       ; 1469 1a
                PI   $40a9               ; 146a 28 40 a9
                DI                       ; 146d 1a
                LM                       ; 146e 16
                LR   QU,A                ; 146f 06
                LM                       ; 1470 16
                LR   QL,A                ; 1471 07
                LM                       ; 1472 16
A1473:          LR   KU,A                ; 1473 04
                LM                       ; 1474 16
                LR   KL,A                ; 1475 05
                DCI  $0c20               ; 1476 2a 0c 20
                LR   A,$0                ; 1479 40
                ADC                      ; 147a 8e
A147b:          LR   A,QL                ; 147b 03
                ST                       ; 147c 17
                LIS  $f                  ; 147d 7f
                ADC                      ; 147e 8e
                LR   A,QU                ; 147f 02
                ST                       ; 1480 17
                LI   $1f                 ; 1481 20 1f
                ADC                      ; 1483 8e
                LR   A,KL                ; 1484 01
                ST                       ; 1485 17
                LIS  $f                  ; 1486 7f
                ADC                      ; 1487 8e
                LR   A,KU                ; 1488 00
                ST                       ; 1489 17
                XDC                      ; 148a 2c
                PI   $40bc               ; 148b 28 40 bc
                PK                       ; 148e 0c
A148f:          LR   K,P                 ; 148f 08
                LIS  $7                  ; 1490 77
                LR   $6,A                ; 1491 56
                LI   $30                 ; 1492 20 30
A1494:          DCI  $08fb               ; 1494 2a 08 fb
                CM                       ; 1497 8d
                BF   $4,A1494            ; 1498 94 fb
A149a:          DCI  $08fb               ; 149a 2a 08 fb
                LM                       ; 149d 16
                AS   $8                  ; 149e c8
                CI   $c0                 ; 149f 25 c0
                BT   2,A14a4             ; 14a1 82 02
                PK                       ; 14a3 0c
A14a4:          DCI  $08fb               ; 14a4 2a 08 fb
                CM                       ; 14a7 8d
                BF   $2,A14a4            ; 14a8 92 fb
                LI   $10                 ; 14aa 20 10
                OUTS 1                   ; 14ac b1
                LR   A,$6                ; 14ad 46
                XI   $07                 ; 14ae 23 07
                LR   $6,A                ; 14b0 56
                OUTS 0                   ; 14b1 b0
                LIS  $0                  ; 14b2 70
                OUTS 1                   ; 14b3 b1
                BF   $0,A149a            ; 14b4 90 e5
A14b6:          LR   K,P                 ; 14b6 08
                PI   $40a9               ; 14b7 28 40 a9
A14ba:          LR   A,$5                ; 14ba 45
                INC                      ; 14bb 1f
                INC                      ; 14bc 1f
                INC                      ; 14bd 1f
                LR   $5,A                ; 14be 55
                DCI  A1ea0               ; 14bf 2a 1e a0
                ADC                      ; 14c2 8e
                LIS  $0                  ; 14c3 70
                XM                       ; 14c4 8c
                BF   $1,A14f7            ; 14c5 91 31
                LISU 4                   ; 14c7 64
                LISL 3                   ; 14c8 6b
                LR   (IS)+,A             ; 14c9 5d
                LM                       ; 14ca 16
                LR   (IS)+,A             ; 14cb 5d
                LM                       ; 14cc 16
                LISU 2                   ; 14cd 62
                LISL 4                   ; 14ce 6c
                LR   (IS),A              ; 14cf 5c
                LIS  $0                  ; 14d0 70
                OUTS 0                   ; 14d1 b0
                OUTS 1                   ; 14d2 b1
                DCI  $0fdd               ; 14d3 2a 0f dd
                ST                       ; 14d6 17
                ST                       ; 14d7 17
                PI   $46d6               ; 14d8 28 46 d6
                PI   $43d6               ; 14db 28 43 d6
                LR   J,W                 ; 14de 1e
                DCI  $0f8a               ; 14df 2a 0f 8a
                LM                       ; 14e2 16
                INC                      ; 14e3 1f
                NI   $0f                 ; 14e4 21 0f
                DCI  $0f8a               ; 14e6 2a 0f 8a
                ST                       ; 14e9 17
                DCI  $08f5               ; 14ea 2a 08 f5
                ST                       ; 14ed 17
                LR   W,J                 ; 14ee 1d
                BF   $1,A14ba            ; 14ef 91 ca
                BT   4,A14ba             ; 14f1 84 c8
                PI   $40bc               ; 14f3 28 40 bc
                PK                       ; 14f6 0c
A14f7:          LR   A,$6                ; 14f7 46
                LR   $5,A                ; 14f8 55
                BF   $0,A14ba            ; 14f9 90 c0
A14fb:          PI   A127b               ; 14fb 28 12 7b
                LI   $10                 ; 14fe 20 10
                LR   $5,A                ; 1500 55
                DCI  $0880               ; 1501 2a 08 80
A1504:          LISU 5                   ; 1504 65
                LISL 7                   ; 1505 6f
                LIS  $2                  ; 1506 72
                LR   $2,A                ; 1507 52
                LI   $ff                 ; 1508 20 ff
                LR   $7,A                ; 150a 57
A150b:          LR   A,$7                ; 150b 47
                AS   (IS)+               ; 150c cd
                BT   2,A152b             ; 150d 82 1d
A150f:          BR7  A150b               ; 150f 8f fb
                LISU 6                   ; 1511 66
                DS   $2                  ; 1512 32
                BF   $4,A150b            ; 1513 94 f7
                LR   A,$4                ; 1515 44
                LR   IS,A                ; 1516 0b
                LIS  $0                  ; 1517 70
                LR   (IS),A              ; 1518 5c
                LR   A,IS                ; 1519 0a
                BR7  A1520               ; 151a 8f 05
                AI   $d1                 ; 151c 24 d1
                BF   $0,A1522            ; 151e 90 03
A1520:          AI   $d9                 ; 1520 24 d9
A1522:          ST                       ; 1522 17
                DS   $5                  ; 1523 35
                BF   $4,A1504            ; 1524 94 df
                PI   A127b               ; 1526 28 12 7b
                BF   $0,A1533            ; 1529 90 09
A152b:          LR   A,(IS)-             ; 152b 4e
                LR   A,IS                ; 152c 0a
                LR   $4,A                ; 152d 54
                LR   A,(IS)+             ; 152e 4d
                COM                      ; 152f 18
                LR   $7,A                ; 1530 57
                BF   $0,A150f            ; 1531 90 dd
A1533:          LI   $a4                 ; 1533 20 a4
A1535:          DCI  $08fb               ; 1535 2a 08 fb
                CM                       ; 1538 8d
                BF   $4,A1535            ; 1539 94 fb
                DCI  $0fa3               ; 153b 2a 0f a3
                LM                       ; 153e 16
                LR   $a,A                ; 153f 5a
                LM                       ; 1540 16
                LR   $b,A                ; 1541 5b
                LR   DC,H                ; 1542 10
                LIS  $0                  ; 1543 70
                LR   $0,A                ; 1544 50
                PI   A1468               ; 1545 28 14 68
                DCI  $0fa1               ; 1548 2a 0f a1
                LM                       ; 154b 16
                LR   $a,A                ; 154c 5a
                LM                       ; 154d 16
                LR   $b,A                ; 154e 5b
                LR   DC,H                ; 154f 10
                LIS  $b                  ; 1550 7b
                LR   $0,A                ; 1551 50
                LIS  $3                  ; 1552 73
                LR   $1,A                ; 1553 51
A1554:          LR   DC,H                ; 1554 10
                PI   A1468               ; 1555 28 14 68
                DS   $0                  ; 1558 30
                DS   $1                  ; 1559 31
                BF   $4,A1554            ; 155a 94 f9
                DCI  $0860               ; 155c 2a 08 60
                XDC                      ; 155f 2c
                DCI  $0880               ; 1560 2a 08 80
                LI   $10                 ; 1563 20 10
                LR   $1,A                ; 1565 51
A1566:          LM                       ; 1566 16
                NI   $0f                 ; 1567 21 0f
                LR   H,DC                ; 1569 11
                SL   1                   ; 156a 13
                SL   1                   ; 156b 13
                DCI  $0c82               ; 156c 2a 0c 82
                ADC                      ; 156f 8e
                LM                       ; 1570 16
                LR   $2,A                ; 1571 52
                LM                       ; 1572 16
                COM                      ; 1573 18
                INC                      ; 1574 1f
                AS   $2                  ; 1575 c2
                XDC                      ; 1576 2c
                ST                       ; 1577 17
                XDC                      ; 1578 2c
                LR   DC,H                ; 1579 10
                DS   $1                  ; 157a 31
                BF   $4,A1566            ; 157b 94 ea
                LISU 5                   ; 157d 65
                LISL 7                   ; 157e 6f
                DCI  $0840               ; 157f 2a 08 40
                LI   $10                 ; 1582 20 10
                LR   $0,A                ; 1584 50
A1585:          LR   A,(IS)+             ; 1585 4d
                COM                      ; 1586 18
                ST                       ; 1587 17
                BR7  A158b               ; 1588 8f 02
                LISU 6                   ; 158a 66
A158b:          DS   $0                  ; 158b 30
                BF   $4,A1585            ; 158c 94 f8
                DCI  $0850               ; 158e 2a 08 50
                XDC                      ; 1591 2c
                DCI  $0860               ; 1592 2a 08 60
                LI   $10                 ; 1595 20 10
                LR   $7,A                ; 1597 57
                PI   A1272               ; 1598 28 12 72
                DCI  $0870               ; 159b 2a 08 70
                XDC                      ; 159e 2c
                DCI  $0880               ; 159f 2a 08 80
                LI   $10                 ; 15a2 20 10
                LR   $7,A                ; 15a4 57
                PI   A1272               ; 15a5 28 12 72
                DCI  $0ffa               ; 15a8 2a 0f fa
                XDC                      ; 15ab 2c
                DCI  A15b9               ; 15ac 2a 15 b9
                LIS  $6                  ; 15af 76
                LR   $7,A                ; 15b0 57
                PI   A1272               ; 15b1 28 12 72
                LISU 3                   ; 15b4 63
                LISL 4                   ; 15b5 6c
                JMP  A1165               ; 15b6 29 11 65
A15b9:          LR   DC,H                ; 15b9 10
                LR   A,KL                ; 15ba 01
                PK                       ; 15bb 0c
                LI   $0c                 ; 15bc 20 0c
                LI   $0c                 ; 15be 20 0c
                LR   $0,A                ; 15c0 50
A15c1:          DS   $6                  ; 15c1 36
                AI   $34                 ; 15c2 24 34
                DS   $2                  ; 15c4 32
                OI   $20                 ; 15c5 22 20
                LR   J,W                 ; 15c7 1e
                LR   Q,DC                ; 15c8 0e
                PK                       ; 15c9 0c
                LR   A,IS                ; 15ca 0a
A15cb:          SL   4                   ; 15cb 15
                LR   IS,A                ; 15cc 0b
                LR   KL,A                ; 15cd 05
                LR   A,KU                ; 15ce 00
                EI                       ; 15cf 1b
                LR   H,DC                ; 15d0 11
                JMP  $0b00               ; 15d1 29 0b 00
                SR   4                   ; 15d4 14
                LR   A,KU                ; 15d5 00
                LR   A,KU                ; 15d6 00
                LR   A,KU                ; 15d7 00
                LR   A,KU                ; 15d8 00
                LR   A,KU                ; 15d9 00
                LR   A,KU                ; 15da 00
                DS   $6                  ; 15db 36
                LR   A,KU                ; 15dc 00
                LR   QL,A                ; 15dd 07
                SL   1                   ; 15de 13
                LR   A,KU                ; 15df 00
                LR   A,IS                ; 15e0 0a
                LI   $00                 ; 15e1 20 00
                LR   A,KU                ; 15e3 00
                LR   A,KU                ; 15e4 00
                LR   A,KU                ; 15e5 00
                LR   A,KU                ; 15e6 00
                LR   A,KU                ; 15e7 00
                LR   A,KU                ; 15e8 00
                LR   A,KU                ; 15e9 00
                LR   A,KU                ; 15ea 00
A15eb:          SL   4                   ; 15eb 15
                LR   IS,A                ; 15ec 0b
                LR   KL,A                ; 15ed 05
                LR   A,KU                ; 15ee 00
                LR   P,K                 ; 15ef 09
                LR   A,QL                ; 15f0 03
                NOP                      ; 15f1 2b
                DI                       ; 15f2 1a
                NI   $07                 ; 15f3 21 07
                SL   1                   ; 15f5 13
                CI   $07                 ; 15f6 25 07
                LR   IS,A                ; 15f8 0b
                LR   H,DC                ; 15f9 11
                JMP  $0014               ; 15fa 29 00 14
                LR   A,KU                ; 15fd 00
                AI   $00                 ; 15fe 24 00
                LR   P0,Q                ; 1600 0d
                SL   1                   ; 1601 13
                NOP                      ; 1602 2b
                LR   KU,A                ; 1603 04
                LR   A,KU                ; 1604 00
                LR   A,KU                ; 1605 00
                LR   A,KU                ; 1606 00
                LR   A,KU                ; 1607 00
                LR   A,KU                ; 1608 00
                LR   A,KU                ; 1609 00
                POP                      ; 160a 1c
                LR   A,KU                ; 160b 00
                LR   A,KU                ; 160c 00
                LR   A,KU                ; 160d 00
                LR   A,KU                ; 160e 00
                EI                       ; 160f 1b
                LR   H,DC                ; 1610 11
                JMP  $0b07               ; 1611 29 0b 07
                LR   IS,A                ; 1614 0b
                NOP                      ; 1615 2b
                NOP                      ; 1616 2b
                LR   A,KL                ; 1617 01
                NI   $00                 ; 1618 21 00
                LR   H,DC                ; 161a 11
                NOP                      ; 161b 2b
                LR   KL,A                ; 161c 05
                SL   1                   ; 161d 13
                NOP                      ; 161e 2b
                LR   IS,A                ; 161f 0b
                DS   $5                  ; 1620 35
                LR   A,KU                ; 1621 00
                LR   A,KU                ; 1622 00
A1623:          LR   K,P                 ; 1623 08
                PI   $40a9               ; 1624 28 40 a9
                LISU 5                   ; 1627 65
                LISL 0                   ; 1628 68
                LR   A,$9                ; 1629 49
                LR   (IS)+,A             ; 162a 5d
                DCI  $0c80               ; 162b 2a 0c 80
                LR   A,$1                ; 162e 41
                LR   $7,A                ; 162f 57
                LR   A,$0                ; 1630 40
                SL   1                   ; 1631 13
                SL   1                   ; 1632 13
                ADC                      ; 1633 8e
                LM                       ; 1634 16
                LR   $1,A                ; 1635 51
                LR   (IS),A              ; 1636 5c
                CM                       ; 1637 8d
                LM                       ; 1638 16
                LR   $9,A                ; 1639 59
                PI   A1297               ; 163a 28 12 97
                XS   $4                  ; 163d e4
                BT   1,A165f             ; 163e 81 20
                LR   A,$7                ; 1640 47
                LR   $1,A                ; 1641 51
                LR   A,$9                ; 1642 49
                COM                      ; 1643 18
                INC                      ; 1644 1f
                AS   $2                  ; 1645 c2
                LIS  $6                  ; 1646 76
                BT   2,A164b             ; 1647 82 03
                LI   $fa                 ; 1649 20 fa
A164b:          AS   $9                  ; 164b c9
                LR   $2,A                ; 164c 52
                PI   A1297               ; 164d 28 12 97
                XS   $4                  ; 1650 e4
                COM                      ; 1651 18
                BF   $1,A165f            ; 1652 91 0c
                LR   A,$9                ; 1654 49
                LR   $2,A                ; 1655 52
                PI   A1297               ; 1656 28 12 97
                XS   $4                  ; 1659 e4
                COM                      ; 165a 18
                BF   $1,A165f            ; 165b 91 03
                LR   A,(IS)              ; 165d 4c
                LR   $1,A                ; 165e 51
A165f:          LR   J,W                 ; 165f 1e
                PI   $40bc               ; 1660 28 40 bc
                LISL 0                   ; 1663 68
                LR   A,(IS)              ; 1664 4c
                LR   $9,A                ; 1665 59
                LISU 3                   ; 1666 63
                PK                       ; 1667 0c
A1668:          LR   K,P                 ; 1668 08
                DCI  A15c1               ; 1669 2a 15 c1
                LR   A,$1                ; 166c 41
                ADC                      ; 166d 8e
                LM                       ; 166e 16
                DCI  $2010               ; 166f 2a 20 10
                ADC                      ; 1672 8e
                SL   1                   ; 1673 13
                ADC                      ; 1674 8e
                ADC                      ; 1675 8e
                ADC                      ; 1676 8e
                PK                       ; 1677 0c
A1678:          PI   $40d0               ; 1678 28 40 d0
                PI   A18f1               ; 167b 28 18 f1
                PI   $45db               ; 167e 28 45 db
                LIS  $4                  ; 1681 74
                DCI  $08f5               ; 1682 2a 08 f5
                ST                       ; 1685 17
                LI   $64                 ; 1686 20 64
                DCI  $0fea               ; 1688 2a 0f ea
                ST                       ; 168b 17
                DCI  $08f7               ; 168c 2a 08 f7
                ST                       ; 168f 17
                DCI  $15f7               ; 1690 2a 15 f7
                LI   $1c                 ; 1693 20 1c
                LISU 2                   ; 1695 62
                LISL 4                   ; 1696 6c
                LR   (IS),A              ; 1697 5c
                PI   $4205               ; 1698 28 42 05
                PI   $41c8               ; 169b 28 41 c8
                LISU 4                   ; 169e 64
                LISL 2                   ; 169f 6a
                LR   A,(IS)+             ; 16a0 4d
                LR   $1,A                ; 16a1 51
                LR   A,(IS)+             ; 16a2 4d
                LR   $2,A                ; 16a3 52
                COM                      ; 16a4 18
                INC                      ; 16a5 1f
                AS   $1                  ; 16a6 c1
                DCI  $0fdf               ; 16a7 2a 0f df
                LIS  $7                  ; 16aa 77
                ST                       ; 16ab 17
                LR   A,$1                ; 16ac 41
                LR   $4,A                ; 16ad 54
                LR   A,$2                ; 16ae 42
                LR   $5,A                ; 16af 55
                LI   $18                 ; 16b0 20 18
                LR   $6,A                ; 16b2 56
                LI   $34                 ; 16b3 20 34
                BF   $1,A16c0            ; 16b5 91 0a
                LR   A,$2                ; 16b7 42
                LR   $4,A                ; 16b8 54
                LR   A,$1                ; 16b9 41
                LR   $5,A                ; 16ba 55
                LI   $2a                 ; 16bb 20 2a
                LR   $6,A                ; 16bd 56
                LI   $24                 ; 16be 20 24
A16c0:          LR   $8,A                ; 16c0 58
                PI   $40d9               ; 16c1 28 40 d9
                DCI  $0ca3               ; 16c4 2a 0c a3
                XDC                      ; 16c7 2c
                PI   A1716               ; 16c8 28 17 16
                DCI  $0c9f               ; 16cb 2a 0c 9f
                XDC                      ; 16ce 2c
                LR   A,$5                ; 16cf 45
                LR   $4,A                ; 16d0 54
                PI   A1716               ; 16d1 28 17 16
                DCI  $0fdf               ; 16d4 2a 0f df
                LI   $1d                 ; 16d7 20 1d
                ST                       ; 16d9 17
                DCI  $0f9b               ; 16da 2a 0f 9b
                LIS  $3                  ; 16dd 73
                LISL 4                   ; 16de 6c
                LR   (IS),A              ; 16df 5c
                PI   $4205               ; 16e0 28 42 05
                DCI  $0fdf               ; 16e3 2a 0f df
                LI   $30                 ; 16e6 20 30
                ST                       ; 16e8 17
                DCI  $0f8b               ; 16e9 2a 0f 8b
                LI   $10                 ; 16ec 20 10
                LISL 4                   ; 16ee 6c
                LR   (IS),A              ; 16ef 5c
                PI   $4205               ; 16f0 28 42 05
                LR   A,$6                ; 16f3 46
                LR   $5,A                ; 16f4 55
A16f5:          LIS  $0                  ; 16f5 70
                DCI  $0fe2               ; 16f6 2a 0f e2
                ST                       ; 16f9 17
                PI   A14b6               ; 16fa 28 14 b6
                LR   A,$8                ; 16fd 48
                CI   $3f                 ; 16fe 25 3f
                BT   4,A1709             ; 1700 84 08
                CI   $43                 ; 1702 25 43
                BF   $4,A16f5            ; 1704 94 f0
                JMP  A1026               ; 1706 29 10 26
A1709:          LISU 3                   ; 1709 63
                LISL 2                   ; 170a 6a
                LR   A,(IS)              ; 170b 4c
                LR   $1,A                ; 170c 51
                JMP  A10c2               ; 170d 29 10 c2
A1710:          LR   K,P                 ; 1710 08
                LIS  $7                  ; 1711 77
                LR   (IS),A              ; 1712 5c
                JMP  $40fb               ; 1713 29 40 fb
A1716:          LR   K,P                 ; 1716 08
                PI   $40a9               ; 1717 28 40 a9
                LR   A,$4                ; 171a 44
                SR   4                   ; 171b 14
                LR   $1,A                ; 171c 51
                PI   A1668               ; 171d 28 16 68
                PI   A1710               ; 1720 28 17 10
                XDC                      ; 1723 2c
                LI   $91                 ; 1724 20 91
                ADC                      ; 1726 8e
                XDC                      ; 1727 2c
                LR   A,$4                ; 1728 44
                NI   $0f                 ; 1729 21 0f
                LR   $1,A                ; 172b 51
                PI   A1668               ; 172c 28 16 68
                PI   A1710               ; 172f 28 17 10
                PI   $40bc               ; 1732 28 40 bc
                PK                       ; 1735 0c
A1736:          LISU 3                   ; 1736 63
                LISL 5                   ; 1737 6d
                LIS  $1                  ; 1738 71
                NS   (IS)                ; 1739 fc
                BF   $4,A1762            ; 173a 94 27
                LIS  $2                  ; 173c 72
                NS   (IS)                ; 173d fc
                BT   4,A1795             ; 173e 84 56
                LIS  $0                  ; 1740 70
                OUTS 1                   ; 1741 b1
                INS  1                   ; 1742 a1
                LR   $5,A                ; 1743 55
                LR   W,J                 ; 1744 1d
                LIS  $1                  ; 1745 71
                BT   1,A1749             ; 1746 81 02
                LIS  $2                  ; 1748 72
A1749:          NS   $5                  ; 1749 f5
                BT   4,A1760             ; 174a 84 15
                LI   $80                 ; 174c 20 80
                NS   (IS)                ; 174e fc
                LR   (IS),A              ; 174f 5c
                LISL 2                   ; 1750 6a
                LIS  $1                  ; 1751 71
                NS   (IS)                ; 1752 fc
                LIS  $2                  ; 1753 72
                BT   4,A1757             ; 1754 84 02
                LIS  $3                  ; 1756 73
A1757:          LR   W,J                 ; 1757 1d
                BF   $1,A175c            ; 1758 91 03
                COM                      ; 175a 18
                INC                      ; 175b 1f
A175c:          DCI  $0d0a               ; 175c 2a 0d 0a
                ST                       ; 175f 17
A1760:          BF   $0,A17dc            ; 1760 90 7b
A1762:          LISL 1                   ; 1762 69
                DS   (IS)                ; 1763 3c
                BT   1,A17d9             ; 1764 81 74
                DCI  $0c25               ; 1766 2a 0c 25
                LM                       ; 1769 16
                SR   1                   ; 176a 12
                SR   1                   ; 176b 12
                LR   $8,A                ; 176c 58
                PI   A148f               ; 176d 28 14 8f
                LIS  $4                  ; 1770 74
                LR   (IS),A              ; 1771 5c
                LIS  $4                  ; 1772 74
                LISL 5                   ; 1773 6d
                XS   (IS)                ; 1774 ec
                LR   (IS),A              ; 1775 5c
                LIS  $4                  ; 1776 74
                LR   W,J                 ; 1777 1d
                BT   1,A1785             ; 1778 81 0c
                DCI  A1dd5               ; 177a 2a 1d d5
                NS   (IS)                ; 177d fc
                BF   $4,A1783            ; 177e 94 04
                DCI  A1ddd               ; 1780 2a 1d dd
A1783:          BF   $0,A178e            ; 1783 90 0a
A1785:          NS   (IS)                ; 1785 fc
                DCI  A1dd9               ; 1786 2a 1d d9
                BF   $4,A178e            ; 1789 94 04
                DCI  A1de1               ; 178b 2a 1d e1
A178e:          LIS  $5                  ; 178e 75
                LR   $0,A                ; 178f 50
                PI   A1468               ; 1790 28 14 68
                BF   $0,A17d9            ; 1793 90 45
A1795:          LISL 2                   ; 1795 6a
                LIS  $4                  ; 1796 74
                NS   (IS)                ; 1797 fc
                BT   4,A17bd             ; 1798 84 24
                DCI  $0d0a               ; 179a 2a 0d 0a
                LIS  $0                  ; 179d 70
                XM                       ; 179e 8c
                BT   1,A17a3             ; 179f 81 03
                COM                      ; 17a1 18
                INC                      ; 17a2 1f
A17a3:          LR   $1,A                ; 17a3 51
                LIS  $0                  ; 17a4 70
A17a5:          AI   $14                 ; 17a5 24 14
                DS   $1                  ; 17a7 31
                BF   $4,A17a5            ; 17a8 94 fc
                LISU 3                   ; 17aa 63
                LISL 7                   ; 17ab 6f
                AS   (IS)                ; 17ac cc
                LR   (IS),A              ; 17ad 5c
                LISU 3                   ; 17ae 63
                BF   $2,A17bd            ; 17af 92 0d
                LISU 7                   ; 17b1 67
                LISL 6                   ; 17b2 6e
                LR   A,(IS)              ; 17b3 4c
                DCI  $0d0b               ; 17b4 2a 0d 0b
                AM                       ; 17b7 88
                DCI  $0d0b               ; 17b8 2a 0d 0b
                ST                       ; 17bb 17
                LISU 3                   ; 17bc 63
A17bd:          LISL 0                   ; 17bd 68
                LIS  $0                  ; 17be 70
                XS   (IS)                ; 17bf ec
                BT   4,A17dc             ; 17c0 84 1b
                DS   (IS)                ; 17c2 3c
                BF   $4,A17dc            ; 17c3 94 18
                LIS  $4                  ; 17c5 74
                LR   $0,A                ; 17c6 50
A17c7:          DCI  A1db1               ; 17c7 2a 1d b1
                PI   A1468               ; 17ca 28 14 68
                DCI  A1da9               ; 17cd 2a 1d a9
                DS   $0                  ; 17d0 30
                PI   A1468               ; 17d1 28 14 68
                DS   $0                  ; 17d4 30
                BF   $4,A17c7            ; 17d5 94 f1
                BF   $0,A17dc            ; 17d7 90 04
A17d9:          JMP  A14fb               ; 17d9 29 14 fb
A17dc:          LIS  $4                  ; 17dc 74
                LR   $5,A                ; 17dd 55
                DCI  $0ce3               ; 17de 2a 0c e3
                LIS  $0                  ; 17e1 70
A17e2:          ST                       ; 17e2 17
                CM                       ; 17e3 8d
                DS   $5                  ; 17e4 35
                BF   $4,A17e2            ; 17e5 94 fc
                PI   A18f1               ; 17e7 28 18 f1
A17ea:          LISU 2                   ; 17ea 62
                LISL 4                   ; 17eb 6c
                DS   (IS)                ; 17ec 3c
                LIS  $3                  ; 17ed 73
                NS   (IS)                ; 17ee fc
                LISU 3                   ; 17ef 63
                LR   $5,A                ; 17f0 55
                LISL 2                   ; 17f1 6a
                LI   $20                 ; 17f2 20 20
                NS   (IS)                ; 17f4 fc
                BF   $4,A17fa            ; 17f5 94 04
                LIS  $1                  ; 17f7 71
                NS   $5                  ; 17f8 f5
                LR   $5,A                ; 17f9 55
A17fa:          LR   A,$5                ; 17fa 45
                SL   1                   ; 17fb 13
                LR   $a,A                ; 17fc 5a
                INC                      ; 17fd 1f
                LR   $4,A                ; 17fe 54
                PI   A1eed               ; 17ff 28 1e ed
                LISU 3                   ; 1802 63
                DCI  $0fa5               ; 1803 2a 0f a5
                LR   $8,A                ; 1806 58
                LR   A,$5                ; 1807 45
                ADC                      ; 1808 8e
                LR   H,DC                ; 1809 11
                LR   A,$8                ; 180a 48
                LR   $2,A                ; 180b 52
                BF   $0,A182e            ; 180c 90 21
                LI   $f8                 ; 180e 20 f8
                AM                       ; 1810 88
                CI   $42                 ; 1811 25 42
                BT   2,A181a             ; 1813 82 06
                LR   DC,H                ; 1815 10
                ST                       ; 1816 17
A1817:          LR   $2,A                ; 1817 52
                BF   $0,A182e            ; 1818 90 15
A181a:          AI   $08                 ; 181a 24 08
                BF   $0,A1817            ; 181c 90 fa
                LIS  $8                  ; 181e 78
                AM                       ; 181f 88
                CI   $8d                 ; 1820 25 8d
                BF   $2,A182a            ; 1822 92 07
                LR   DC,H                ; 1824 10
                ST                       ; 1825 17
A1826:          AI   $4b                 ; 1826 24 4b
                BF   $0,A1817            ; 1828 90 ee
A182a:          AI   $f8                 ; 182a 24 f8
                BF   $0,A1826            ; 182c 90 f9
A182e:          DCI  $0c86               ; 182e 2a 0c 86
                LR   A,$5                ; 1831 45
                SL   1                   ; 1832 13
                SL   1                   ; 1833 13
                ADC                      ; 1834 8e
                LM                       ; 1835 16
                COM                      ; 1836 18
                INC                      ; 1837 1f
                AS   $2                  ; 1838 c2
                LR   $1,A                ; 1839 51
                DCI  $0ce3               ; 183a 2a 0c e3
                LR   A,$5                ; 183d 45
                SL   1                   ; 183e 13
                ADC                      ; 183f 8e
                LR   A,$1                ; 1840 41
                ST                       ; 1841 17
                DCI  $0faa               ; 1842 2a 0f aa
                LI   $ff                 ; 1845 20 ff
                AM                       ; 1847 88
                DCI  $0faa               ; 1848 2a 0f aa
                ST                       ; 184b 17
                BT   4,A1858             ; 184c 84 0b
                DCI  $0faa               ; 184e 2a 0f aa
                LIS  $1                  ; 1851 71
                NM                       ; 1852 8a
                LISU 3                   ; 1853 63
                BT   4,A17ea             ; 1854 84 95
                BF   $0,A18a1            ; 1856 90 4a
A1858:          DCI  $0faa               ; 1858 2a 0f aa
                LIS  $b                  ; 185b 7b
                ST                       ; 185c 17
                LISU 3                   ; 185d 63
                LISL 5                   ; 185e 6d
                LIS  $2                  ; 185f 72
                NS   (IS)                ; 1860 fc
                BF   $4,A18a1            ; 1861 94 3f
                LISL 2                   ; 1863 6a
                LI   $40                 ; 1864 20 40
                NS   (IS)                ; 1866 fc
                BT   4,A18a1             ; 1867 84 39
                LI   $20                 ; 1869 20 20
                NS   (IS)                ; 186b fc
                BF   $4,A18a1            ; 186c 94 34
                LR   A,$4                ; 186e 44
                LR   $a,A                ; 186f 5a
                PI   A1eed               ; 1870 28 1e ed
                LR   $2,A                ; 1873 52
                PI   A190b               ; 1874 28 19 0b
                LISU 3                   ; 1877 63
                LISL 2                   ; 1878 6a
                LR   A,$5                ; 1879 45
                NI   $01                 ; 187a 21 01
                LIS  $8                  ; 187c 78
                BT   4,A1881             ; 187d 84 03
                LI   $10                 ; 187f 20 10
A1881:          NS   (IS)                ; 1881 fc
                LIS  $1                  ; 1882 71
                BT   4,A1886             ; 1883 84 02
                LIS  $2                  ; 1885 72
A1886:          LR   $1,A                ; 1886 51
                LR   A,$2                ; 1887 42
                CI   $78                 ; 1888 25 78
                BF   $2,A1897            ; 188a 92 0c
                LR   A,$1                ; 188c 41
                COM                      ; 188d 18
                INC                      ; 188e 1f
                LR   $1,A                ; 188f 51
                LR   A,$2                ; 1890 42
                CI   $50                 ; 1891 25 50
                BT   2,A1897             ; 1893 82 03
                LIS  $0                  ; 1895 70
                LR   $1,A                ; 1896 51
A1897:          DCI  $0ce2               ; 1897 2a 0c e2
                LR   A,$5                ; 189a 45
                SL   1                   ; 189b 13
                ADC                      ; 189c 8e
                LR   A,$1                ; 189d 41
                ST                       ; 189e 17
                BF   $0,A18a4            ; 189f 90 04
A18a1:          PI   A190b               ; 18a1 28 19 0b
A18a4:          JMP  A14fb               ; 18a4 29 14 fb
A18a7:          PI   A1623               ; 18a7 28 16 23
                BT   1,A18bb             ; 18aa 81 10
                DCI  $0c94               ; 18ac 2a 0c 94
                LI   $d8                 ; 18af 20 d8
                ST                       ; 18b1 17
                LISU 3                   ; 18b2 63
                LISL 5                   ; 18b3 6d
                LI   $82                 ; 18b4 20 82
                NS   (IS)                ; 18b6 fc
                LR   (IS),A              ; 18b7 5c
A18b8:          JMP  A1736               ; 18b8 29 17 36
A18bb:          DCI  $0cea               ; 18bb 2a 0c ea
                LM                       ; 18be 16
                COM                      ; 18bf 18
                INC                      ; 18c0 1f
                DCI  $0cea               ; 18c1 2a 0c ea
                ST                       ; 18c4 17
                DCI  $0c96               ; 18c5 2a 0c 96
                LM                       ; 18c8 16
                LR   $1,A                ; 18c9 51
                DCI  A1da5               ; 18ca 2a 1d a5
                LR   Q,DC                ; 18cd 0e
                LI   $29                 ; 18ce 20 29
                LR   W,J                 ; 18d0 1d
                BT   1,A18d9             ; 18d1 81 07
                DCI  A1da1               ; 18d3 2a 1d a1
                LR   Q,DC                ; 18d6 0e
                LI   $94                 ; 18d7 20 94
A18d9:          DCI  $0cd4               ; 18d9 2a 0c d4
                ST                       ; 18dc 17
                DCI  $0c80               ; 18dd 2a 0c 80
                ST                       ; 18e0 17
                LR   A,$1                ; 18e1 41
                CM                       ; 18e2 8d
                ST                       ; 18e3 17
                DCI  $0cd6               ; 18e4 2a 0c d6
                ST                       ; 18e7 17
                DCI  $0fa3               ; 18e8 2a 0f a3
                LR   A,QU                ; 18eb 02
                ST                       ; 18ec 17
                LR   A,QL                ; 18ed 03
                ST                       ; 18ee 17
                BF   $0,A18b8            ; 18ef 90 c8
A18f1:          LR   K,P                 ; 18f1 08
                DCI  $0fab               ; 18f2 2a 0f ab
                LM                       ; 18f5 16
                XI   $80                 ; 18f6 23 80
                DCI  $0fab               ; 18f8 2a 0f ab
                ST                       ; 18fb 17
                LI   $32                 ; 18fc 20 32
                BT   1,A1902             ; 18fe 81 03
                LI   $22                 ; 1900 20 22
A1902:          DCI  $08fb               ; 1902 2a 08 fb
                CM                       ; 1905 8d
                BF   $4,A1902            ; 1906 94 fb
                LIS  $0                  ; 1908 70
                OUTS 14                  ; 1909 be
                PK                       ; 190a 0c
A190b:          LR   K,P                 ; 190b 08
                DCI  $0fea               ; 190c 2a 0f ea
                LI   $f0                 ; 190f 20 f0
                NM                       ; 1911 8a
                OI   $0c                 ; 1912 22 0c
                DCI  $0fea               ; 1914 2a 0f ea
                ST                       ; 1917 17
                DCI  $08f7               ; 1918 2a 08 f7
                ST                       ; 191b 17
                LIS  $1                  ; 191c 71
                OUTS 14                  ; 191d be
                LIS  $0                  ; 191e 70
                DCI  $0fdd               ; 191f 2a 0f dd
                ST                       ; 1922 17
                ST                       ; 1923 17
                PK                       ; 1924 0c
A1925:          PI   A1297               ; 1925 28 12 97
                XS   $4                  ; 1928 e4
                BF   $1,A192e            ; 1929 91 04
                JMP  A117a               ; 192b 29 11 7a
A192e:          PI   A1623               ; 192e 28 16 23
                DCI  $0d0a               ; 1931 2a 0d 0a
                BT   1,A1946             ; 1934 81 11
                CM                       ; 1936 8d
                LM                       ; 1937 16
                COM                      ; 1938 18
                INC                      ; 1939 1f
                DCI  $0d0b               ; 193a 2a 0d 0b
                ST                       ; 193d 17
                LIS  $8                  ; 193e 78
                LR   $8,A                ; 193f 58
A1940:          PI   A148f               ; 1940 28 14 8f
                JMP  A117a               ; 1943 29 11 7a
A1946:          DCI  $0d0a               ; 1946 2a 0d 0a
                LISU 4                   ; 1949 64
                LISL 3                   ; 194a 6b
                LIS  $0                  ; 194b 70
                XM                       ; 194c 8c
                DCI  $0f62               ; 194d 2a 0f 62
                LR   A,(IS)-             ; 1950 4e
                BT   1,A1957             ; 1951 81 05
                LR   A,(IS)+             ; 1953 4d
                DCI  $0f77               ; 1954 2a 0f 77
A1957:          LR   $4,A                ; 1957 54
                LR   H,DC                ; 1958 11
                LR   A,(IS)-             ; 1959 4e
                LR   A,(IS)-             ; 195a 4e
                LR   A,IS                ; 195b 0a
                LR   $6,A                ; 195c 56
                LI   $67                 ; 195d 20 67
                ASD  (IS)                ; 195f dc
                LR   (IS),A              ; 1960 5c
                CI   $04                 ; 1961 25 04
                BT   4,A197b             ; 1963 84 17
                LIS  $0                  ; 1965 70
                LR   $5,A                ; 1966 55
A1967:          LR   A,(IS)+             ; 1967 4d
                LR   $1,A                ; 1968 51
                PI   A1668               ; 1969 28 16 68
                PI   A12bd               ; 196c 28 12 bd
                LR   A,(IS)+             ; 196f 4d
                LR   A,(IS)+             ; 1970 4d
                LR   $1,A                ; 1971 51
                PI   A1668               ; 1972 28 16 68
                PI   A12bd               ; 1975 28 12 bd
                JMP  A12f2               ; 1978 29 12 f2
A197b:          LIS  $1                  ; 197b 71
                LR   $5,A                ; 197c 55
                LIS  $0                  ; 197d 70
                LR   (IS)+,A             ; 197e 5d
                LR   A,(IS)+             ; 197f 4d
                LI   $67                 ; 1980 20 67
                ASD  (IS)                ; 1982 dc
                LR   (IS),A              ; 1983 5c
                CI   $07                 ; 1984 25 07
                BF   $4,A198b            ; 1986 94 04
                JMP  A1678               ; 1988 29 16 78
A198b:          CI   $06                 ; 198b 25 06
                BF   $4,A1997            ; 198d 94 09
                LR   A,$4                ; 198f 44
                CI   $04                 ; 1990 25 04
                BF   $2,A1997            ; 1992 92 04
                JMP  A1678               ; 1994 29 16 78
A1997:          LISL 0                   ; 1997 68
                LIS  $0                  ; 1998 70
                LR   (IS)+,A             ; 1999 5d
                LR   (IS),A              ; 199a 5c
                DCI  $0f62               ; 199b 2a 0f 62
                XDC                      ; 199e 2c
                DCI  $218a               ; 199f 2a 21 8a
                PI   A19c0               ; 19a2 28 19 c0
                DCI  $0f77               ; 19a5 2a 0f 77
                XDC                      ; 19a8 2c
                DCI  $218a               ; 19a9 2a 21 8a
                PI   A19c0               ; 19ac 28 19 c0
                LISU 3                   ; 19af 63
                LISL 5                   ; 19b0 6d
                LI   $80                 ; 19b1 20 80
                XS   (IS)                ; 19b3 ec
                LR   (IS),A              ; 19b4 5c
                LR   J,W                 ; 19b5 1e
                LR   A,$6                ; 19b6 46
                LR   IS,A                ; 19b7 0b
                LI   $80                 ; 19b8 20 80
                DCI  $0fa9               ; 19ba 2a 0f a9
                ST                       ; 19bd 17
                BF   $0,A1967            ; 19be 90 a8
A19c0:          LR   K,P                 ; 19c0 08
                JMP  A12c7               ; 19c1 29 12 c7
A19c4:          PI   A1623               ; 19c4 28 16 23
                BF   $1,A19f6            ; 19c7 91 2e
                BF   $0,A19d4            ; 19c9 90 0a
A19cb:          PI   A1623               ; 19cb 28 16 23
                BF   $1,A1a00            ; 19ce 91 31
                LR   A,$7                ; 19d0 47
                LR   $1,A                ; 19d1 51
                LR   A,$4                ; 19d2 44
                LR   $0,A                ; 19d3 50
A19d4:          DCI  $0d0a               ; 19d4 2a 0d 0a
                LIS  $0                  ; 19d7 70
                XM                       ; 19d8 8c
                BF   $1,A19eb            ; 19d9 91 11
                DCI  A1db5               ; 19db 2a 1d b5
                LI   $10                 ; 19de 20 10
                LISL 2                   ; 19e0 6a
                NS   (IS)                ; 19e1 fc
                LIS  $0                  ; 19e2 70
                BT   4,A19e6             ; 19e3 84 02
                LIS  $2                  ; 19e5 72
A19e6:          LISU 3                   ; 19e6 63
                LISL 1                   ; 19e7 69
                LR   (IS),A              ; 19e8 5c
                BF   $0,A1a22            ; 19e9 90 38
A19eb:          DCI  $0c80               ; 19eb 2a 0c 80
                LI   $e8                 ; 19ee 20 e8
                ST                       ; 19f0 17
                LISU 3                   ; 19f1 63
                LISL 6                   ; 19f2 6e
                LIS  $1                  ; 19f3 71
                LR   (IS),A              ; 19f4 5c
                LISU 3                   ; 19f5 63
A19f6:          JMP  A1199               ; 19f6 29 11 99
A19f9:          PI   A1623               ; 19f9 28 16 23
                BT   1,A1a0e             ; 19fc 81 11
                BF   $0,A19f6            ; 19fe 90 f7
A1a00:          BF   $0,A19eb            ; 1a00 90 ea
                JMP  A117a               ; 1a02 29 11 7a
A1a05:          PI   A1623               ; 1a05 28 16 23
                BF   $1,A1a00            ; 1a08 91 f7
                LR   A,$7                ; 1a0a 47
                LR   $1,A                ; 1a0b 51
                LR   A,$4                ; 1a0c 44
                LR   $0,A                ; 1a0d 50
A1a0e:          DCI  $0d0a               ; 1a0e 2a 0d 0a
                LIS  $0                  ; 1a11 70
                XM                       ; 1a12 8c
                BT   1,A19eb             ; 1a13 81 d7
                LISL 2                   ; 1a15 6a
                LIS  $8                  ; 1a16 78
                NS   (IS)                ; 1a17 fc
                LIS  $0                  ; 1a18 70
                BT   4,A1a1c             ; 1a19 84 02
                LIS  $2                  ; 1a1b 72
A1a1c:          LISU 3                   ; 1a1c 63
                LISL 1                   ; 1a1d 69
                LR   (IS),A              ; 1a1e 5c
                DCI  A1dad               ; 1a1f 2a 1d ad
A1a22:          PI   A1468               ; 1a22 28 14 68
                LISL 0                   ; 1a25 68
                LIS  $8                  ; 1a26 78
                LR   (IS),A              ; 1a27 5c
                DCI  $0c82               ; 1a28 2a 0c 82
                LR   A,$0                ; 1a2b 40
                SL   1                   ; 1a2c 13
                SL   1                   ; 1a2d 13
                ADC                      ; 1a2e 8e
                LM                       ; 1a2f 16
                AI   $14                 ; 1a30 24 14
                COM                      ; 1a32 18
                INC                      ; 1a33 1f
                DCI  $0cd6               ; 1a34 2a 0c d6
                AM                       ; 1a37 88
                BT   1,A1a3c             ; 1a38 81 03
                COM                      ; 1a3a 18
                INC                      ; 1a3b 1f
A1a3c:          SR   1                   ; 1a3c 12
                SR   1                   ; 1a3d 12
                SR   1                   ; 1a3e 12
                SL   1                   ; 1a3f 13
                DCI  A1a7c               ; 1a40 2a 1a 7c
                LISL 3                   ; 1a43 6b
                DS   (IS)                ; 1a44 3c
                BT   1,A1a4a             ; 1a45 81 04
                DCI  A1a88               ; 1a47 2a 1a 88
A1a4a:          ADC                      ; 1a4a 8e
                LM                       ; 1a4b 16
                LR   $1,A                ; 1a4c 51
                LM                       ; 1a4d 16
                LR   $2,A                ; 1a4e 52
                LISL 2                   ; 1a4f 6a
                LIS  $1                  ; 1a50 71
                NS   (IS)                ; 1a51 fc
                LR   A,$1                ; 1a52 41
                BT   4,A1a56             ; 1a53 84 02
                INC                      ; 1a55 1f
A1a56:          LISU 3                   ; 1a56 63
                LISL 1                   ; 1a57 69
                AS   (IS)                ; 1a58 cc
                LR   $1,A                ; 1a59 51
                DCI  $0d0a               ; 1a5a 2a 0d 0a
                LIS  $0                  ; 1a5d 70
                XM                       ; 1a5e 8c
                LR   A,$1                ; 1a5f 41
                BF   $1,A1a64            ; 1a60 91 03
                COM                      ; 1a62 18
                INC                      ; 1a63 1f
A1a64:          DCI  $0d0a               ; 1a64 2a 0d 0a
                ST                       ; 1a67 17
                LR   A,$2                ; 1a68 42
                ST                       ; 1a69 17
                LISU 7                   ; 1a6a 67
                LISL 6                   ; 1a6b 6e
                LIS  $0                  ; 1a6c 70
                XS   $2                  ; 1a6d e2
                LI   $ff                 ; 1a6e 20 ff
                BF   $1,A1a73            ; 1a70 91 02
                LIS  $1                  ; 1a72 71
A1a73:          LR   (IS),A              ; 1a73 5c
                LIS  $f                  ; 1a74 7f
                LR   $8,A                ; 1a75 58
                PI   A148f               ; 1a76 28 14 8f
                JMP  A14fb               ; 1a79 29 14 fb
A1a7c:          LR   KU,A                ; 1a7c 04
                LR   K,P                 ; 1a7d 08
                LR   KU,A                ; 1a7e 04
                LR   KU,A                ; 1a7f 04
                LR   KU,A                ; 1a80 04
                LR   A,KU                ; 1a81 00
                LR   KU,A                ; 1a82 04
                NS   (IS)                ; 1a83 fc
                LR   KU,A                ; 1a84 04
                NS   $8                  ; 1a85 f8
                LR   KU,A                ; 1a86 04
                NS   $8                  ; 1a87 f8
A1a88:          LR   KL,A                ; 1a88 05
                LR   A,IS                ; 1a89 0a
                LR   KL,A                ; 1a8a 05
                LR   KL,A                ; 1a8b 05
                LR   KL,A                ; 1a8c 05
                LR   A,KU                ; 1a8d 00
                LR   KL,A                ; 1a8e 05
                NS   $a                  ; 1a8f fa
                LR   KL,A                ; 1a90 05
                NS   $6                  ; 1a91 f6
                LR   KL,A                ; 1a92 05
                NS   $6                  ; 1a93 f6
A1a94:          LISL 2                   ; 1a94 6a
                LIS  $2                  ; 1a95 72
                NS   (IS)                ; 1a96 fc
                BT   4,A1aad             ; 1a97 84 15
                LISL 4                   ; 1a99 6c
                DS   (IS)                ; 1a9a 3c
                BF   $1,A1aad            ; 1a9b 91 11
                DCI  $0d0a               ; 1a9d 2a 0d 0a
                LM                       ; 1aa0 16
                COM                      ; 1aa1 18
                INC                      ; 1aa2 1f
                DCI  $0d0a               ; 1aa3 2a 0d 0a
                ST                       ; 1aa6 17
                LI   $18                 ; 1aa7 20 18
                LR   $8,A                ; 1aa9 58
                JMP  A1940               ; 1aaa 29 19 40
A1aad:          DCI  $0d0a               ; 1aad 2a 0d 0a
                LIS  $0                  ; 1ab0 70
                XM                       ; 1ab1 8c
                DCI  $0fc8               ; 1ab2 2a 0f c8
                LR   A,$a                ; 1ab5 4a
                ST                       ; 1ab6 17
                LR   A,$b                ; 1ab7 4b
                ST                       ; 1ab8 17
                LR   A,QU                ; 1ab9 02
                ST                       ; 1aba 17
                LR   A,QL                ; 1abb 03
                ST                       ; 1abc 17
                DCI  A1dc9               ; 1abd 2a 1d c9
                LR   H,DC                ; 1ac0 11
                DCI  $1dbd               ; 1ac1 2a 1d bd
                LI   $5a                 ; 1ac4 20 5a
                BT   1,A1ad1             ; 1ac6 81 0a
                DCI  $1dc5               ; 1ac8 2a 1d c5
                LR   H,DC                ; 1acb 11
                DCI  A1db9               ; 1acc 2a 1d b9
                LI   $60                 ; 1acf 20 60
A1ad1:          LR   Q,DC                ; 1ad1 0e
                DCI  $0cac               ; 1ad2 2a 0c ac
                ST                       ; 1ad5 17
                DCI  $0ca8               ; 1ad6 2a 0c a8
                ST                       ; 1ad9 17
                DCI  $0ca4               ; 1ada 2a 0c a4
                ST                       ; 1add 17
                LR   DC,Q                ; 1ade 0f
                LIS  $6                  ; 1adf 76
                LR   $0,A                ; 1ae0 50
                PI   A1468               ; 1ae1 28 14 68
                XDC                      ; 1ae4 2c
                LI   $15                 ; 1ae5 20 15
                LR   $0,A                ; 1ae7 50
                DCI  $0fa1               ; 1ae8 2a 0f a1
                LR   A,$a                ; 1aeb 4a
                ST                       ; 1aec 17
                LR   A,$b                ; 1aed 4b
                ST                       ; 1aee 17
                DCI  $0d0a               ; 1aef 2a 0d 0a
                LM                       ; 1af2 16
                COM                      ; 1af3 18
                PI   A1b10               ; 1af4 28 1b 10
                DCI  $0fc8               ; 1af7 2a 0f c8
                LM                       ; 1afa 16
                LR   $a,A                ; 1afb 5a
                LM                       ; 1afc 16
                LR   $b,A                ; 1afd 5b
                LM                       ; 1afe 16
                LR   QU,A                ; 1aff 06
                LM                       ; 1b00 16
                LR   QL,A                ; 1b01 07
                JMP  A19eb               ; 1b02 29 19 eb
A1b05:          DCI  $0d0a               ; 1b05 2a 0d 0a
                LIS  $0                  ; 1b08 70
                XM                       ; 1b09 8c
                PI   A1b10               ; 1b0a 28 1b 10
                JMP  A1199               ; 1b0d 29 11 99
A1b10:          LR   K,P                 ; 1b10 08
                BT   1,A1b27             ; 1b11 81 15
                LI   $3d                 ; 1b13 20 3d
                DCI  $0c20               ; 1b15 2a 0c 20
                CM                       ; 1b18 8d
                BT   4,A1b3c             ; 1b19 84 22
                LI   $1d                 ; 1b1b 20 1d
                DCI  $0fa3               ; 1b1d 2a 0f a3
                ST                       ; 1b20 17
                LI   $a5                 ; 1b21 20 a5
                ST                       ; 1b23 17
                LIS  $4                  ; 1b24 74
                BF   $0,A1b3a            ; 1b25 90 14
A1b27:          LI   $43                 ; 1b27 20 43
                DCI  $0c20               ; 1b29 2a 0c 20
                CM                       ; 1b2c 8d
                BT   4,A1b3c             ; 1b2d 84 0e
                LI   $1d                 ; 1b2f 20 1d
                DCI  $0fa3               ; 1b31 2a 0f a3
                ST                       ; 1b34 17
                LI   $a1                 ; 1b35 20 a1
                ST                       ; 1b37 17
                LI   $fc                 ; 1b38 20 fc
A1b3a:          AS   $1                  ; 1b3a c1
                LR   $1,A                ; 1b3b 51
A1b3c:          PK                       ; 1b3c 0c
                LISU 0                   ; 1b3d 60
                NS   $0                  ; 1b3e f0
                NS   $0                  ; 1b3f f0
                NS   $0                  ; 1b40 f0
                NS   $0                  ; 1b41 f0
                LISU 0                   ; 1b42 60
                LR   QU,A                ; 1b43 06
                LR   DC,Q                ; 1b44 0f
                LR   DC,Q                ; 1b45 0f
                LR   DC,Q                ; 1b46 0f
                LR   DC,Q                ; 1b47 0f
                LR   QU,A                ; 1b48 06
A1b49:          LR   A,KU                ; 1b49 00
A1b4a:          PK                       ; 1b4a 0c
                LR   A,KU                ; 1b4b 00
                POP                      ; 1b4c 1c
                LR   A,KU                ; 1b4d 00
                POP                      ; 1b4e 1c
                LR   A,KU                ; 1b4f 00
                POP                      ; 1b50 1c
                LR   A,KU                ; 1b51 00
                POP                      ; 1b52 1c
                LR   A,KU                ; 1b53 00
                COM                      ; 1b54 18
                LR   A,KU                ; 1b55 00
                DS   $8                  ; 1b56 38
                LR   A,KU                ; 1b57 00
                LIS  $e                  ; 1b58 7e
                LR   A,KU                ; 1b59 00
                NS   (IS)-               ; 1b5a fe
                LR   A,KU                ; 1b5b 00
                NS   (IS)-               ; 1b5c fe
                LR   A,KU                ; 1b5d 00
                OUTS 10                  ; 1b5e ba
                LR   A,KU                ; 1b5f 00
                OUTS 10                  ; 1b60 ba
                LR   A,KU                ; 1b61 00
                OUTS 10                  ; 1b62 ba
                LR   A,KU                ; 1b63 00
                OUTS 10                  ; 1b64 ba
                LR   DC,H                ; 1b65 10
                OUTS 10                  ; 1b66 ba
                PI   $ba28               ; 1b67 28 ba 28
                DS   $8                  ; 1b6a 38
                db   $2f                 
                OUTS 10                  ; 1b6c ba
                PI   $3828               ; 1b6d 28 38 28
                DS   $8                  ; 1b70 38
                LR   DC,H                ; 1b71 10
                PI   $0028               ; 1b72 28 00 28
                LR   A,KU                ; 1b75 00
                PI   $0028               ; 1b76 28 00 28
                LR   A,KU                ; 1b79 00
                PI   $0028               ; 1b7a 28 00 28
                LR   A,KU                ; 1b7d 00
                PI   $0028               ; 1b7e 28 00 28
                LR   A,KU                ; 1b81 00
                PI   $0028               ; 1b82 28 00 28
                LR   A,KU                ; 1b85 00
                LISL 4                   ; 1b86 6c
                LR   A,KU                ; 1b87 00
                LISL 4                   ; 1b88 6c
                LR   A,KU                ; 1b89 00
                POP                      ; 1b8a 1c
                LR   A,KU                ; 1b8b 00
                COM                      ; 1b8c 18
                LR   A,KU                ; 1b8d 00
                LR   J,W                 ; 1b8e 1e
                LR   A,KU                ; 1b8f 00
                POP                      ; 1b90 1c
                LR   A,KU                ; 1b91 00
                POP                      ; 1b92 1c
                LR   A,KU                ; 1b93 00
                COM                      ; 1b94 18
                LR   A,KU                ; 1b95 00
                LIS  $c                  ; 1b96 7c
                LR   A,KU                ; 1b97 00
                LIS  $e                  ; 1b98 7e
                LR   A,KU                ; 1b99 00
                NS   (IS)-               ; 1b9a fe
                LR   A,KU                ; 1b9b 00
                NS   $a                  ; 1b9c fa
                LR   A,KU                ; 1b9d 00
                OUTS 10                  ; 1b9e ba
                LR   A,KU                ; 1b9f 00
                OUTS 10                  ; 1ba0 ba
                LR   A,KU                ; 1ba1 00
                OUTS 10                  ; 1ba2 ba
                LR   A,KU                ; 1ba3 00
                OUTS 10                  ; 1ba4 ba
                DS   $8                  ; 1ba5 38
                OUTS 10                  ; 1ba6 ba
                DS   $8                  ; 1ba7 38
                OUTS 10                  ; 1ba8 ba
                db   $3f                 
                OUTS 10                  ; 1baa ba
                DS   $8                  ; 1bab 38
                OUTS 10                  ; 1bac ba
                DS   $8                  ; 1bad 38
                DS   $8                  ; 1bae 38
                DS   $8                  ; 1baf 38
                DS   $8                  ; 1bb0 38
                LR   A,KU                ; 1bb1 00
                PI   $0028               ; 1bb2 28 00 28
                LR   A,KU                ; 1bb5 00
                PI   $0028               ; 1bb6 28 00 28
                LR   A,KU                ; 1bb9 00
                PI   $0028               ; 1bba 28 00 28
                LR   A,KU                ; 1bbd 00
                PI   $0028               ; 1bbe 28 00 28
                LR   A,KU                ; 1bc1 00
                PI   $0028               ; 1bc2 28 00 28
                LR   A,KU                ; 1bc5 00
                LISL 4                   ; 1bc6 6c
                LR   A,KU                ; 1bc7 00
                LISL 4                   ; 1bc8 6c
                PK                       ; 1bc9 0c
                XS   $0                  ; 1bca e0
                POP                      ; 1bcb 1c
                INS  0                   ; 1bcc a0
                POP                      ; 1bcd 1c
                INS  0                   ; 1bce a0
                POP                      ; 1bcf 1c
                INS  0                   ; 1bd0 a0
                POP                      ; 1bd1 1c
                XS   $0                  ; 1bd2 e0
                COM                      ; 1bd3 18
                LR   A,$0                ; 1bd4 40
                DS   $8                  ; 1bd5 38
                LR   A,$0                ; 1bd6 40
                LIS  $c                  ; 1bd7 7c
                LR   A,$0                ; 1bd8 40
                db   $ff                 
                AS   $0                  ; 1bda c0
                db   $ff                 
                LR   A,KU                ; 1bdc 00
                OUTS 8                   ; 1bdd b8
                LR   A,KU                ; 1bde 00
                OUTS 8                   ; 1bdf b8
                LR   A,KU                ; 1be0 00
                OUTS 8                   ; 1be1 b8
                LR   A,KU                ; 1be2 00
                OUTS 8                   ; 1be3 b8
                LR   A,KU                ; 1be4 00
                OUTS 8                   ; 1be5 b8
                LR   A,KU                ; 1be6 00
                OUTS 8                   ; 1be7 b8
                LR   A,KU                ; 1be8 00
                OUTS 8                   ; 1be9 b8
                LR   A,KU                ; 1bea 00
                OUTS 8                   ; 1beb b8
                LR   A,KU                ; 1bec 00
                DS   (IS)-               ; 1bed 3e
                LR   A,KU                ; 1bee 00
                DS   (IS)-               ; 1bef 3e
                LR   A,KU                ; 1bf0 00
                OI   $00                 ; 1bf1 22 00
                OI   $00                 ; 1bf3 22 00
                OI   $00                 ; 1bf5 22 00
                OI   $00                 ; 1bf7 22 00
                OI   $00                 ; 1bf9 22 00
                OI   $00                 ; 1bfb 22 00
                OI   $00                 ; 1bfd 22 00
                XS   $2                  ; 1bff e2
                LR   A,KU                ; 1c00 00
                XS   $2                  ; 1c01 e2
                LR   A,KU                ; 1c02 00
                BT   2,0                 ; 1c03 82 00
                BT   3,0                 ; 1c05 83 00
                LR   A,QL                ; 1c07 03
                LR   A,KU                ; 1c08 00
                POP                      ; 1c09 1c
                XS   $0                  ; 1c0a e0
                COM                      ; 1c0b 18
                XS   $0                  ; 1c0c e0
                LR   J,W                 ; 1c0d 1e
                XS   $0                  ; 1c0e e0
                POP                      ; 1c0f 1c
                XS   $0                  ; 1c10 e0
                POP                      ; 1c11 1c
                LR   A,$0                ; 1c12 40
                COM                      ; 1c13 18
                LR   A,$0                ; 1c14 40
                LIS  $c                  ; 1c15 7c
                LR   A,$0                ; 1c16 40
                LIS  $e                  ; 1c17 7e
                LR   A,KU                ; 1c18 00
                db   $ff                 
                AS   $0                  ; 1c1a c0
                NS   $a                  ; 1c1b fa
                LR   A,KU                ; 1c1c 00
                OUTS 8                   ; 1c1d b8
                LR   A,KU                ; 1c1e 00
                OUTS 8                   ; 1c1f b8
                LR   A,KU                ; 1c20 00
                OUTS 8                   ; 1c21 b8
                LR   A,KU                ; 1c22 00
                OUTS 8                   ; 1c23 b8
                LR   A,KU                ; 1c24 00
                OUTS 8                   ; 1c25 b8
                LR   A,KU                ; 1c26 00
                OUTS 8                   ; 1c27 b8
                LR   A,KU                ; 1c28 00
                OUTS 8                   ; 1c29 b8
                LR   A,KU                ; 1c2a 00
                OUTS 14                  ; 1c2b be
                LR   A,KU                ; 1c2c 00
                DS   (IS)-               ; 1c2d 3e
                LR   A,KU                ; 1c2e 00
                DS   (IS)-               ; 1c2f 3e
                LR   A,KU                ; 1c30 00
                OI   $00                 ; 1c31 22 00
                OI   $00                 ; 1c33 22 00
                OI   $00                 ; 1c35 22 00
                OI   $00                 ; 1c37 22 00
                OI   $00                 ; 1c39 22 00
                OI   $00                 ; 1c3b 22 00
                XS   $2                  ; 1c3d e2
                LR   A,KU                ; 1c3e 00
                XS   $2                  ; 1c3f e2
                LR   A,KU                ; 1c40 00
                BT   2,0                 ; 1c41 82 00
                BT   2,0                 ; 1c43 82 00
                LR   A,QL                ; 1c45 03
                LR   A,KU                ; 1c46 00
                LR   A,QL                ; 1c47 03
                LR   A,KU                ; 1c48 00
                LR   Q,DC                ; 1c49 0e
                LR   A,KU                ; 1c4a 00
                LR   Q,DC                ; 1c4b 0e
                LR   A,KU                ; 1c4c 00
                LR   Q,DC                ; 1c4d 0e
                LR   A,KU                ; 1c4e 00
                LR   Q,DC                ; 1c4f 0e
                LR   A,KU                ; 1c50 00
                LR   Q,DC                ; 1c51 0e
                LR   A,KU                ; 1c52 00
                LR   QU,A                ; 1c53 06
                LR   A,KU                ; 1c54 00
                LR   QL,A                ; 1c55 07
                LR   A,KU                ; 1c56 00
                LR   DC,Q                ; 1c57 0f
                AS   $0                  ; 1c58 c0
                LR   DC,Q                ; 1c59 0f
                AS   $0                  ; 1c5a c0
                INC                      ; 1c5b 1f
                LR   A,$0                ; 1c5c 40
                DS   $7                  ; 1c5d 37
                LR   A,$0                ; 1c5e 40
                XS   $7                  ; 1c5f e7
                LR   A,$0                ; 1c60 40
                LR   QL,A                ; 1c61 07
                AS   $0                  ; 1c62 c0
                LR   QL,A                ; 1c63 07
                LR   A,KU                ; 1c64 00
                LR   QL,A                ; 1c65 07
                LR   A,KU                ; 1c66 00
                LR   QL,A                ; 1c67 07
                LR   A,KU                ; 1c68 00
                LR   QL,A                ; 1c69 07
                LR   A,KU                ; 1c6a 00
                LR   QL,A                ; 1c6b 07
                LR   A,KU                ; 1c6c 00
                LR   QL,A                ; 1c6d 07
                LR   A,KU                ; 1c6e 00
                LR   QL,A                ; 1c6f 07
                LR   A,KU                ; 1c70 00
                LR   KL,A                ; 1c71 05
                LR   A,KU                ; 1c72 00
                LR   KL,A                ; 1c73 05
                LR   A,KU                ; 1c74 00
                LR   KL,A                ; 1c75 05
                LR   A,KU                ; 1c76 00
                LR   KL,A                ; 1c77 05
                LR   A,KU                ; 1c78 00
                LR   KL,A                ; 1c79 05
                LR   A,KU                ; 1c7a 00
                LR   KL,A                ; 1c7b 05
                LR   A,KU                ; 1c7c 00
                LR   KL,A                ; 1c7d 05
                LR   A,KU                ; 1c7e 00
                LR   KL,A                ; 1c7f 05
                LR   A,KU                ; 1c80 00
                LR   KL,A                ; 1c81 05
                LR   A,KU                ; 1c82 00
                LR   KL,A                ; 1c83 05
                LR   A,KU                ; 1c84 00
                LR   DC,Q                ; 1c85 0f
                LR   A,KU                ; 1c86 00
                LR   DC,Q                ; 1c87 0f
                LR   A,KU                ; 1c88 00
                LR   Q,DC                ; 1c89 0e
                LR   A,KU                ; 1c8a 00
                LR   Q,DC                ; 1c8b 0e
                LR   A,KU                ; 1c8c 00
                LR   Q,DC                ; 1c8d 0e
                LR   A,KU                ; 1c8e 00
                LR   Q,DC                ; 1c8f 0e
                LR   A,KU                ; 1c90 00
                LR   Q,DC                ; 1c91 0e
                LR   A,KU                ; 1c92 00
                LR   QU,A                ; 1c93 06
                LR   A,KU                ; 1c94 00
                LR   DC,Q                ; 1c95 0f
                AS   $0                  ; 1c96 c0
                LR   DC,Q                ; 1c97 0f
                AS   $0                  ; 1c98 c0
                LR   DC,Q                ; 1c99 0f
                AS   $0                  ; 1c9a c0
                ST                       ; 1c9b 17
                LR   A,$0                ; 1c9c 40
                NS   $7                  ; 1c9d f7
                LR   A,$0                ; 1c9e 40
                OUT  $c0                 ; 1c9f 27 c0
                LR   QL,A                ; 1ca1 07
                AS   $0                  ; 1ca2 c0
                LR   QL,A                ; 1ca3 07
                LR   A,KU                ; 1ca4 00
                LR   QL,A                ; 1ca5 07
                LR   A,KU                ; 1ca6 00
                LR   QL,A                ; 1ca7 07
                LR   A,KU                ; 1ca8 00
                LR   QL,A                ; 1ca9 07
                LR   A,KU                ; 1caa 00
                LR   QL,A                ; 1cab 07
                LR   A,KU                ; 1cac 00
                LR   QL,A                ; 1cad 07
                LR   A,KU                ; 1cae 00
                LR   QL,A                ; 1caf 07
                LR   A,KU                ; 1cb0 00
                LR   KL,A                ; 1cb1 05
                LR   A,KU                ; 1cb2 00
                LR   KL,A                ; 1cb3 05
                LR   A,KU                ; 1cb4 00
                LR   KL,A                ; 1cb5 05
                LR   A,KU                ; 1cb6 00
                LR   KL,A                ; 1cb7 05
                LR   A,KU                ; 1cb8 00
                LR   KL,A                ; 1cb9 05
                LR   A,KU                ; 1cba 00
                LR   KL,A                ; 1cbb 05
                LR   A,KU                ; 1cbc 00
                LR   KL,A                ; 1cbd 05
                LR   A,KU                ; 1cbe 00
                LR   KL,A                ; 1cbf 05
                LR   A,KU                ; 1cc0 00
                LR   KL,A                ; 1cc1 05
                LR   A,KU                ; 1cc2 00
                LR   KL,A                ; 1cc3 05
                LR   A,KU                ; 1cc4 00
                LR   DC,Q                ; 1cc5 0f
                LR   A,KU                ; 1cc6 00
                LR   DC,Q                ; 1cc7 0f
                LR   A,KU                ; 1cc8 00
                LR   Q,DC                ; 1cc9 0e
                LR   A,KU                ; 1cca 00
                LR   Q,DC                ; 1ccb 0e
                LR   A,KU                ; 1ccc 00
                LR   Q,DC                ; 1ccd 0e
                LR   A,KU                ; 1cce 00
                LR   Q,DC                ; 1ccf 0e
                LR   A,KU                ; 1cd0 00
                LR   Q,DC                ; 1cd1 0e
                LR   A,KU                ; 1cd2 00
                LR   QU,A                ; 1cd3 06
                LR   A,KU                ; 1cd4 00
                LR   QL,A                ; 1cd5 07
                LR   A,KU                ; 1cd6 00
                LR   DC,Q                ; 1cd7 0f
                BT   0,A1ce8             ; 1cd8 80 0f
                AS   $0                  ; 1cda c0
                INC                      ; 1cdb 1f
                AS   $0                  ; 1cdc c0
                DS   $7                  ; 1cdd 37
                LR   A,$0                ; 1cde 40
                XS   $7                  ; 1cdf e7
                LR   A,$0                ; 1ce0 40
                LR   QL,A                ; 1ce1 07
                LR   A,$0                ; 1ce2 40
                LR   QL,A                ; 1ce3 07
                LR   A,$0                ; 1ce4 40
                LR   QL,A                ; 1ce5 07
                LR   A,$0                ; 1ce6 40
                LR   QL,A                ; 1ce7 07
A1ce8:          LR   A,$0                ; 1ce8 40
                LR   QL,A                ; 1ce9 07
                LR   A,$0                ; 1cea 40
                LR   QL,A                ; 1ceb 07
                LR   A,$0                ; 1cec 40
                INC                      ; 1ced 1f
                LR   A,$0                ; 1cee 40
                INC                      ; 1cef 1f
                LR   A,$0                ; 1cf0 40
                SR   1                   ; 1cf1 12
                LR   A,KU                ; 1cf2 00
                SR   1                   ; 1cf3 12
                LR   A,KU                ; 1cf4 00
                SR   1                   ; 1cf5 12
                LR   A,KU                ; 1cf6 00
                SR   1                   ; 1cf7 12
                LR   A,KU                ; 1cf8 00
                SR   1                   ; 1cf9 12
                LR   A,KU                ; 1cfa 00
                SR   1                   ; 1cfb 12
                LR   A,KU                ; 1cfc 00
                SR   1                   ; 1cfd 12
                LR   A,KU                ; 1cfe 00
                SL   1                   ; 1cff 13
                AS   $0                  ; 1d00 c0
                SL   1                   ; 1d01 13
                AS   $0                  ; 1d02 c0
                LR   DC,H                ; 1d03 10
                LR   A,$0                ; 1d04 40
                DS   $0                  ; 1d05 30
                LR   A,$0                ; 1d06 40
                DS   $0                  ; 1d07 30
                LR   A,KU                ; 1d08 00
                LR   Q,DC                ; 1d09 0e
                LR   A,KU                ; 1d0a 00
                LR   Q,DC                ; 1d0b 0e
                LR   A,KU                ; 1d0c 00
                LR   Q,DC                ; 1d0d 0e
                LR   A,KU                ; 1d0e 00
                LR   Q,DC                ; 1d0f 0e
                LR   A,KU                ; 1d10 00
                LR   Q,DC                ; 1d11 0e
                LR   A,KU                ; 1d12 00
                LR   QU,A                ; 1d13 06
                LR   A,KU                ; 1d14 00
                LR   DC,Q                ; 1d15 0f
                BT   0,A1d26             ; 1d16 80 0f
                AS   $0                  ; 1d18 c0
                INC                      ; 1d19 1f
                AS   $0                  ; 1d1a c0
                ST                       ; 1d1b 17
                LR   A,$0                ; 1d1c 40
                NS   $7                  ; 1d1d f7
                LR   A,$0                ; 1d1e 40
                OUT  $40                 ; 1d1f 27 40
                LR   QL,A                ; 1d21 07
                LR   A,$0                ; 1d22 40
                LR   QL,A                ; 1d23 07
                LR   A,$0                ; 1d24 40
                LR   QL,A                ; 1d25 07
A1d26:          LR   A,$0                ; 1d26 40
                LR   QL,A                ; 1d27 07
                LR   A,$0                ; 1d28 40
                LR   QL,A                ; 1d29 07
                LR   A,$0                ; 1d2a 40
                INC                      ; 1d2b 1f
                LR   A,$0                ; 1d2c 40
                INC                      ; 1d2d 1f
                LR   A,$0                ; 1d2e 40
                INC                      ; 1d2f 1f
                LR   A,$0                ; 1d30 40
                SR   1                   ; 1d31 12
                LR   A,KU                ; 1d32 00
                SR   1                   ; 1d33 12
                LR   A,KU                ; 1d34 00
                SR   1                   ; 1d35 12
                LR   A,KU                ; 1d36 00
                SR   1                   ; 1d37 12
                LR   A,KU                ; 1d38 00
                SR   1                   ; 1d39 12
                LR   A,KU                ; 1d3a 00
                SR   1                   ; 1d3b 12
                LR   A,KU                ; 1d3c 00
                SL   1                   ; 1d3d 13
                AS   $0                  ; 1d3e c0
                SL   1                   ; 1d3f 13
                AS   $0                  ; 1d40 c0
                LR   DC,H                ; 1d41 10
                LR   A,$0                ; 1d42 40
                LR   DC,H                ; 1d43 10
                LR   A,$0                ; 1d44 40
                DS   $0                  ; 1d45 30
                LR   A,KU                ; 1d46 00
                DS   $0                  ; 1d47 30
                LR   A,KU                ; 1d48 00
A1d49:          AS   $0                  ; 1d49 c0
                AS   $0                  ; 1d4a c0
                AS   $0                  ; 1d4b c0
                AS   $0                  ; 1d4c c0
                AS   $0                  ; 1d4d c0
                AS   $0                  ; 1d4e c0
                AS   $0                  ; 1d4f c0
                AS   $0                  ; 1d50 c0
                AS   $0                  ; 1d51 c0
                AS   $0                  ; 1d52 c0
                AS   $0                  ; 1d53 c0
                AS   $0                  ; 1d54 c0
                AS   $0                  ; 1d55 c0
                AS   $0                  ; 1d56 c0
                AS   $0                  ; 1d57 c0
                AS   $0                  ; 1d58 c0
                AS   $0                  ; 1d59 c0
                AS   $0                  ; 1d5a c0
                AS   $0                  ; 1d5b c0
                AS   $0                  ; 1d5c c0
                AS   $0                  ; 1d5d c0
                AS   $0                  ; 1d5e c0
                AS   $0                  ; 1d5f c0
                AS   $0                  ; 1d60 c0
                AS   $0                  ; 1d61 c0
                AS   $0                  ; 1d62 c0
                AS   $0                  ; 1d63 c0
                AS   $0                  ; 1d64 c0
                AS   $0                  ; 1d65 c0
                AS   $0                  ; 1d66 c0
                AS   $0                  ; 1d67 c0
                AS   $0                  ; 1d68 c0
                AS   $0                  ; 1d69 c0
                AS   $0                  ; 1d6a c0
                AS   $0                  ; 1d6b c0
                AS   $0                  ; 1d6c c0
                AS   $0                  ; 1d6d c0
                AS   $0                  ; 1d6e c0
                AS   $0                  ; 1d6f c0
                AS   $0                  ; 1d70 c0
                AS   $0                  ; 1d71 c0
                AS   $0                  ; 1d72 c0
                AS   $0                  ; 1d73 c0
                AS   $0                  ; 1d74 c0
                AS   $0                  ; 1d75 c0
                AS   $0                  ; 1d76 c0
                AS   $0                  ; 1d77 c0
                AS   $0                  ; 1d78 c0
                AS   $0                  ; 1d79 c0
                AS   $0                  ; 1d7a c0
                AS   $0                  ; 1d7b c0
                AS   $0                  ; 1d7c c0
                AS   $0                  ; 1d7d c0
                AS   $0                  ; 1d7e c0
                AS   $0                  ; 1d7f c0
                AS   $0                  ; 1d80 c0
                AS   $0                  ; 1d81 c0
                AS   $0                  ; 1d82 c0
                AS   $0                  ; 1d83 c0
                AS   $0                  ; 1d84 c0
                DS   $8                  ; 1d85 38
                DS   $8                  ; 1d86 38
                NS   (IS)-               ; 1d87 fe
                DS   $8                  ; 1d88 38
                PI   $7838               ; 1d89 28 78 38
                COM                      ; 1d8c 18
                DS   $8                  ; 1d8d 38
                COM                      ; 1d8e 18
                LIS  $e                  ; 1d8f 7e
                LIS  $e                  ; 1d90 7e
                DS   $8                  ; 1d91 38
                DS   $8                  ; 1d92 38
                NS   (IS)-               ; 1d93 fe
                DS   $8                  ; 1d94 38
                DS   $8                  ; 1d95 38
                LIS  $8                  ; 1d96 78
                DS   $8                  ; 1d97 38
                DS   $8                  ; 1d98 38
                DS   $8                  ; 1d99 38
                COM                      ; 1d9a 18
                LIS  $e                  ; 1d9b 7e
                LIS  $e                  ; 1d9c 7e
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
A1da1:          NS   $b                  ; 1da1 fb
                LR   A,$3                ; 1da2 43
                NS   $b                  ; 1da3 fb
                LR   A,$3                ; 1da4 43
A1da5:          NS   $b                  ; 1da5 fb
                DS   (IS)+               ; 1da6 3d
                NS   $b                  ; 1da7 fb
                DS   (IS)+               ; 1da8 3d
A1da9:          NS   $b                  ; 1da9 fb
                LR   A,$9                ; 1daa 49
                NS   $b                  ; 1dab fb
                AMD                      ; 1dac 89
A1dad:          NS   $b                  ; 1dad fb
                AS   $9                  ; 1dae c9
                NS   (IS)                ; 1daf fc
                LR   P,K                 ; 1db0 09
A1db1:          XS   (IS)+               ; 1db1 ed
                PK                       ; 1db2 0c
                XS   (IS)+               ; 1db3 ed
                LR   A,(IS)              ; 1db4 4c
A1db5:          XS   (IS)+               ; 1db5 ed
                XM                       ; 1db6 8c
                XS   (IS)+               ; 1db7 ed
                AS   (IS)                ; 1db8 cc
A1db9:          LR   (IS)+,A             ; 1db9 5d
                BT   5,A1e18             ; 1dba 85 5d
                BF   $1,A1e0c            ; 1dbc 91 4f
                LR   A,$8                ; 1dbe 48
                db   $4f                 
A1dc0:          LR   $4,A                ; 1dc0 54
                NS   (IS)+               ; 1dc1 fd
A1dc2:          BF   $d,A1dc0            ; 1dc2 9d fd
                BF   $d,A1dc2            ; 1dc4 9d fd
                LR   A,$9                ; 1dc6 49
                NS   (IS)+               ; 1dc7 fd
                LR   A,$9                ; 1dc8 49
A1dc9:          db   $ef                 
                PK                       ; 1dca 0c
                db   $ef                 
                PK                       ; 1dcc 0c
A1dcd:          db   $ef                 
                LISU 0                   ; 1dce 60
                db   $ef                 
                LISU 0                   ; 1dd0 60
                db   $ef                 
                LIS  $5                  ; 1dd2 75
                db   $ef                 
                LIS  $5                  ; 1dd4 75
A1dd5:          XS   (IS)-               ; 1dd5 ee
                PK                       ; 1dd6 0c
                XS   (IS)-               ; 1dd7 ee
                LR   A,(IS)              ; 1dd8 4c
A1dd9:          NS   (IS)                ; 1dd9 fc
                LR   A,$9                ; 1dda 49
                NS   (IS)                ; 1ddb fc
                AMD                      ; 1ddc 89
A1ddd:          XS   (IS)-               ; 1ddd ee
                XM                       ; 1dde 8c
                XS   (IS)-               ; 1ddf ee
                AS   (IS)                ; 1de0 cc
A1de1:          NS   (IS)                ; 1de1 fc
                AS   $9                  ; 1de2 c9
                NS   (IS)+               ; 1de3 fd
                LR   P,K                 ; 1de4 09
A1de5:          LR   QU,A                ; 1de5 06
                LR   A,$1                ; 1de6 41
                XS   $8                  ; 1de7 e8
                db   $a2                 
                LR   W,J                 ; 1de9 1d
                INS  5                   ; 1dea a5
                LI   $42                 ; 1deb 20 42
                DI                       ; 1ded 1a
                NM                       ; 1dee 8a
                LR   W,J                 ; 1def 1d
                INS  9                   ; 1df0 a9
                LI   $42                 ; 1df1 20 42
                db   $a2                 
                NM                       ; 1df4 8a
                LR   W,J                 ; 1df5 1d
                OUTS 1                   ; 1df6 b1
                LI   $42                 ; 1df7 20 42
                AS   $8                  ; 1df9 c8
                LR   $2,A                ; 1dfa 52
                LR   W,J                 ; 1dfb 1d
                INS  9                   ; 1dfc a9
                LI   $42                 ; 1dfd 20 42
                AS   $8                  ; 1dff c8
                AS   $a                  ; 1e00 ca
                LR   W,J                 ; 1e01 1d
                OUTS 1                   ; 1e02 b1
                LI   $42                 ; 1e03 20 42
                DS   $a                  ; 1e05 3a
                ASD  $2                  ; 1e06 d2
                LR   W,J                 ; 1e07 1d
                ASD  $9                  ; 1e08 d9
                PK                       ; 1e09 0c
                AS   $5                  ; 1e0a c5
                LISU 0                   ; 1e0b 60
A1e0c:          DCI  A1db9               ; 1e0c 2a 1d b9
                LR   KU,A                ; 1e0f 04
                ASD  $7                  ; 1e10 d7
                LISU 0                   ; 1e11 60
                DS   $2                  ; 1e12 32
                LR   W,J                 ; 1e13 1d
                AS   $1                  ; 1e14 c1
                LR   KU,A                ; 1e15 04
                ASD  $7                  ; 1e16 d7
                LISU 0                   ; 1e17 60
A1e18:          XS   $9                  ; 1e18 e9
                LR   W,J                 ; 1e19 1d
                AS   $1                  ; 1e1a c1
                DS   (IS)                ; 1e1b 3c
                LR   A,$1                ; 1e1c 41
                LISU 0                   ; 1e1d 60
                LR   $2,A                ; 1e1e 52
                LR   W,J                 ; 1e1f 1d
                AS   $5                  ; 1e20 c5
                DS   (IS)                ; 1e21 3c
                LR   A,$1                ; 1e22 41
                LISU 0                   ; 1e23 60
                ADC                      ; 1e24 8e
                LR   W,J                 ; 1e25 1d
                AS   $5                  ; 1e26 c5
                DS   $b                  ; 1e27 3b
                LR   A,$1                ; 1e28 41
                LISU 0                   ; 1e29 60
                AS   $9                  ; 1e2a c9
                LR   W,J                 ; 1e2b 1d
                AS   $5                  ; 1e2c c5
                LR   QL,A                ; 1e2d 07
                LR   A,$3                ; 1e2e 43
                DS   $0                  ; 1e2f 30
                DCI  A1dcd               ; 1e30 2a 1d cd
                LR   QL,A                ; 1e33 07
                LR   A,$3                ; 1e34 43
                BF   $0,A1e60            ; 1e35 90 2a
                LR   W,J                 ; 1e37 1d
                ASD  $1                  ; 1e38 d1
                LR   A,KL                ; 1e39 01
                LR   A,KL                ; 1e3a 01
                XS   $8                  ; 1e3b e8
                LR   $2,A                ; 1e3c 52
                LR   J,W                 ; 1e3d 1e
                LR   J,W                 ; 1e3e 1e
                LR   A,KL                ; 1e3f 01
                LR   A,KL                ; 1e40 01
                XS   $8                  ; 1e41 e8
                LISU 2                   ; 1e42 62
                LR   J,W                 ; 1e43 1e
                LR   J,W                 ; 1e44 1e
                LI   $02                 ; 1e45 20 02
                BT   4,A1e9a             ; 1e47 84 52
                LR   W,J                 ; 1e49 1d
                ASD  $5                  ; 1e4a d5
A1e4b:          LR   (IS),A              ; 1e4b 5c
                LR   A,$8                ; 1e4c 48
                CM                       ; 1e4d 8d
                LR   $5,A                ; 1e4e 55
                XDC                      ; 1e4f 2c
                PK                       ; 1e50 0c
                BT   2,A1e9a             ; 1e51 82 48
                ADC                      ; 1e53 8e
                LR   Q,DC                ; 1e54 0e
                BT   2,A1e9e             ; 1e55 82 48
                LR   (IS)+,A             ; 1e57 5d
                LR   A,KL                ; 1e58 01
                BT   2,A1eba             ; 1e59 82 60
                LR   (IS)-,A             ; 1e5b 5e
                OI   $8a                 ; 1e5c 22 8a
                DS   $8                  ; 1e5e 38
A1e5f:          XS   $8                  ; 1e5f e8
A1e60:          LR   KU,A                ; 1e60 04
                db   $a2                 
                LR   A,QL                ; 1e62 03
                db   $4f                 
                LR   A,KL                ; 1e64 01
                BT   2,A1ec6             ; 1e65 82 60
                LISL 2                   ; 1e67 6a
                LR   A,KL                ; 1e68 01
;                BT   2,96                ; 1e69 82 60
				db   $82,$60
                LR   A,KL                ; 1e6b 01
                LR   A,KU                ; 1e6c 00
                LR   A,QU                ; 1e6d 02
                LR   A,KL                ; 1e6e 01
                LR   A,QL                ; 1e6f 03
                LR   A,KU                ; 1e70 00
                LR   KU,A                ; 1e71 04
                LR   A,KL                ; 1e72 01
                SL   1                   ; 1e73 13
                LR   A,QU                ; 1e74 02
                LM                       ; 1e75 16
                LR   K,P                 ; 1e76 08
                ST                       ; 1e77 17
                LR   K,P                 ; 1e78 08
                BF   $0,A1e7d            ; 1e79 90 03
                SL   4                   ; 1e7b 15
                LR   QU,A                ; 1e7c 06
A1e7d:
;          BF   $1,4                ; 1e7d 91 04
				db   $91,$04
                SL   4                   ; 1e7f 15
                LR   QL,A                ; 1e80 07
                BF   $2,A1e86            ; 1e81 92 04
                BF   $4,A1e89            ; 1e83 94 05
A1e85:          LR   J,W                 ; 1e85 1e
A1e86:          LISL 3                   ; 1e86 6b
                SL   4                   ; 1e87 15
                LR   J,W                 ; 1e88 1e
A1e89:          LIS  $b                  ; 1e89 7b
                LR   A,KL                ; 1e8a 01
                LR   J,W                 ; 1e8b 1e
                LIS  $f                  ; 1e8c 7f
                LR   A,QU                ; 1e8d 02
                LR   J,W                 ; 1e8e 1e
                LIS  $b                  ; 1e8f 7b
                LR   A,QL                ; 1e90 03
                LR   J,W                 ; 1e91 1e
                LIS  $f                  ; 1e92 7f
                LR   KU,A                ; 1e93 04
                db   $ff                 
A1e95:          LR   J,W                 ; 1e95 1e
                LISL 3                   ; 1e96 6b
                SL   4                   ; 1e97 15
                LR   J,W                 ; 1e98 1e
                LIS  $b                  ; 1e99 7b
A1e9a:          LR   A,KL                ; 1e9a 01
                LR   J,W                 ; 1e9b 1e
                LIS  $f                  ; 1e9c 7f
                LR   A,QU                ; 1e9d 02
A1e9e:          db   $ff                 
A1e9f:          LR   J,W                 ; 1e9f 1e
A1ea0:          BT   3,A1ea6             ; 1ea0 83 05
                db   $ff                 
                LR   A,QL                ; 1ea3 03
                LR   A,$0                ; 1ea4 40
                LR   DC,H                ; 1ea5 10
A1ea6:          LR   A,QL                ; 1ea6 03
                DS   $8                  ; 1ea7 38
                LR   DC,H                ; 1ea8 10
                LR   A,QL                ; 1ea9 03
                DS   $0                  ; 1eaa 30
                LR   DC,H                ; 1eab 10
                LR   A,QL                ; 1eac 03
                DS   $8                  ; 1ead 38
                LR   DC,H                ; 1eae 10
                LR   A,QL                ; 1eaf 03
                LR   A,$0                ; 1eb0 40
                SR   1                   ; 1eb1 12
                LR   A,QL                ; 1eb2 03
                DS   $8                  ; 1eb3 38
                LR   K,P                 ; 1eb4 08
                LR   A,QL                ; 1eb5 03
                DS   $0                  ; 1eb6 30
                PI   $ffff               ; 1eb7 28 ff ff
A1eba:          db   $ff                 
                LR   A,QL                ; 1ebb 03
                LR   A,$0                ; 1ebc 40
                LR   DC,H                ; 1ebd 10
                LR   A,QL                ; 1ebe 03
                DS   $0                  ; 1ebf 30
                LR   DC,H                ; 1ec0 10
                LR   A,QL                ; 1ec1 03
                LI   $20                 ; 1ec2 20 20
                LR   A,QL                ; 1ec4 03
                DS   $0                  ; 1ec5 30
A1ec6:          LR   DC,H                ; 1ec6 10
                LR   A,QL                ; 1ec7 03
                COM                      ; 1ec8 18
                PI   $ffff               ; 1ec9 28 ff ff
                db   $ff                 
                LR   A,QL                ; 1ecd 03
                LR   DC,H                ; 1ece 10
                LR   DC,H                ; 1ecf 10
                LR   A,QL                ; 1ed0 03
                SL   1                   ; 1ed1 13
                LR   DC,H                ; 1ed2 10
                LR   A,QL                ; 1ed3 03
                COM                      ; 1ed4 18
                LR   DC,H                ; 1ed5 10
                LR   A,QL                ; 1ed6 03
                LI   $10                 ; 1ed7 20 10
                LR   A,QL                ; 1ed9 03
                COM                      ; 1eda 18
                LR   DC,H                ; 1edb 10
                LR   A,QL                ; 1edc 03
                SL   1                   ; 1edd 13
                LR   DC,H                ; 1ede 10
                LR   A,QL                ; 1edf 03
                LR   DC,H                ; 1ee0 10
                LI   $03                 ; 1ee1 20 03
                SL   1                   ; 1ee3 13
                LR   DC,H                ; 1ee4 10
                LR   A,QL                ; 1ee5 03
                LR   DC,H                ; 1ee6 10
                LI   $ff                 ; 1ee7 20 ff
                db   $ff                 
                db   $ff                 
A1eeb:          LR   A,IS                ; 1eeb 0a
                LR   A,KL                ; 1eec 01
A1eed:          LR   K,P                 ; 1eed 08
                PI   $40a9               ; 1eee 28 40 a9
                LR   A,$a                ; 1ef1 4a
                LISU 2                   ; 1ef2 62
                LISL 0                   ; 1ef3 68
                LR   (IS)+,A             ; 1ef4 5d
                LIS  $1                  ; 1ef5 71
A1ef6:          DS   $a                  ; 1ef6 3a
                BF   $1,A1efc            ; 1ef7 91 04
                SL   1                   ; 1ef9 13
                BF   $0,A1ef6            ; 1efa 90 fb
A1efc:          OUTS 0                   ; 1efc b0
                LIS  $8                  ; 1efd 78
                SL   4                   ; 1efe 15
                DCI  $0fde               ; 1eff 2a 0f de
                LR   H,DC                ; 1f02 11
                DI                       ; 1f03 1a
                OM                       ; 1f04 8b
                LR   DC,H                ; 1f05 10
                ST                       ; 1f06 17
                LR   $8,A                ; 1f07 58
                DCI  $08fb               ; 1f08 2a 08 fb
                LR   Q,DC                ; 1f0b 0e
                LM                       ; 1f0c 16
                LR   (IS),A              ; 1f0d 5c
A1f0e:          LR   DC,Q                ; 1f0e 0f
                CM                       ; 1f0f 8d
                BT   4,A1f0e             ; 1f10 84 fd
                LR   A,$8                ; 1f12 48
                OUTS 1                   ; 1f13 b1
                LIS  $2                  ; 1f14 72
                DCI  $0fea               ; 1f15 2a 0f ea
                OM                       ; 1f18 8b
                NI   $f7                 ; 1f19 21 f7
                DCI  $08f7               ; 1f1b 2a 08 f7
                ST                       ; 1f1e 17
                DCI  $0fea               ; 1f1f 2a 0f ea
                ST                       ; 1f22 17
                LR   W,J                 ; 1f23 1d
                LIS  $d                  ; 1f24 7d
                AS   (IS)                ; 1f25 cc
A1f26:          LR   DC,Q                ; 1f26 0f
                CM                       ; 1f27 8d
                BF   $2,A1f26            ; 1f28 92 fd
                LR   DC,H                ; 1f2a 10
                DI                       ; 1f2b 1a
                LM                       ; 1f2c 16
                NI   $7f                 ; 1f2d 21 7f
                OUTS 1                   ; 1f2f b1
                LR   DC,H                ; 1f30 10
                ST                       ; 1f31 17
                LR   W,J                 ; 1f32 1d
                LIS  $0                  ; 1f33 70
                LR   QU,A                ; 1f34 06
                LR   QL,A                ; 1f35 07
                LR   $a,A                ; 1f36 5a
                LI   $e4                 ; 1f37 20 e4
                LR   $b,A                ; 1f39 5b
                LR   A,(IS)              ; 1f3a 4c
                COM                      ; 1f3b 18
                DCI  $08f9               ; 1f3c 2a 08 f9
                AM                       ; 1f3f 88
                LR   (IS),A              ; 1f40 5c
                CI   $0a                 ; 1f41 25 0a
                BF   $2,A1f75            ; 1f43 92 31
A1f45:          PI   $22cd               ; 1f45 28 22 cd
                DS   (IS)                ; 1f48 3c
                BF   $4,A1f45            ; 1f49 94 fb
                DCI  $08f8               ; 1f4b 2a 08 f8
                LM                       ; 1f4e 16
                LR   $b,A                ; 1f4f 5b
                PI   $22cd               ; 1f50 28 22 cd
                LI   $26                 ; 1f53 20 26
                LR   $b,A                ; 1f55 5b
                PI   $22bf               ; 1f56 28 22 bf
                LR   A,QU                ; 1f59 02
                LR   (IS)+,A             ; 1f5a 5d
                LR   A,QL                ; 1f5b 03
                LR   (IS)-,A             ; 1f5c 5e
                LR   A,(IS)-             ; 1f5d 4e
                LR   A,(IS)+             ; 1f5e 4d
                SL   1                   ; 1f5f 13
                SL   1                   ; 1f60 13
                DCI  $0c00               ; 1f61 2a 0c 00
                ADC                      ; 1f64 8e
                LM                       ; 1f65 16
                LR   $a,A                ; 1f66 5a
                LM                       ; 1f67 16
                LR   $b,A                ; 1f68 5b
                PI   $22bf               ; 1f69 28 22 bf
                BF   $2,A1f77            ; 1f6c 92 0a
                LI   $fe                 ; 1f6e 20 fe
                ADC                      ; 1f70 8e
                LR   A,(IS)+             ; 1f71 4d
                ST                       ; 1f72 17
                LR   A,(IS)-             ; 1f73 4e
                ST                       ; 1f74 17
A1f75:          BF   $0,A1fb8            ; 1f75 90 42
A1f77:          LR   A,(IS)+             ; 1f77 4d
                LR   QU,A                ; 1f78 06
                LR   A,(IS)-             ; 1f79 4e
                LR   QL,A                ; 1f7a 07
                LM                       ; 1f7b 16
                LR   $a,A                ; 1f7c 5a
                LM                       ; 1f7d 16
                LR   $b,A                ; 1f7e 5b
                PI   $22bf               ; 1f7f 28 22 bf
                BT   2,A1f8e             ; 1f82 82 0b
                LI   $fe                 ; 1f84 20 fe
                ADC                      ; 1f86 8e
                LR   A,(IS)+             ; 1f87 4d
                ST                       ; 1f88 17
                LR   A,(IS)-             ; 1f89 4e
                ST                       ; 1f8a 17
                LIS  $0                  ; 1f8b 70
                BF   $0,A1fba            ; 1f8c 90 2d
A1f8e:          LR   A,QU                ; 1f8e 02
                LR   (IS)+,A             ; 1f8f 5d
                LR   A,QL                ; 1f90 03
                LR   (IS)-,A             ; 1f91 5e
                LI   $fc                 ; 1f92 20 fc
                ADC                      ; 1f94 8e
                LM                       ; 1f95 16
                LR   QU,A                ; 1f96 06
                LM                       ; 1f97 16
                LR   QL,A                ; 1f98 07
                PI   $22cd               ; 1f99 28 22 cd
                LIS  $3                  ; 1f9c 73
                LISL 0                   ; 1f9d 68
                LR   (IS)+,A             ; 1f9e 5d
                LIS  $0                  ; 1f9f 70
                LR   QU,A                ; 1fa0 06
                LR   QL,A                ; 1fa1 07
                LR   $a,A                ; 1fa2 5a
                LR   A,(IS)              ; 1fa3 4c
                SL   4                   ; 1fa4 15
                LR   (IS)+,A             ; 1fa5 5d
                LR   A,(IS)-             ; 1fa6 4e
                SR   4                   ; 1fa7 14
                XS   (IS)-               ; 1fa8 ee
                SR   1                   ; 1fa9 12
                LR   $b,A                ; 1faa 5b
A1fab:          PI   $22cd               ; 1fab 28 22 cd
                DS   (IS)                ; 1fae 3c
                BF   $4,A1fab            ; 1faf 94 fb
                LR   A,QL                ; 1fb1 03
                AI   $46                 ; 1fb2 24 46
                CI   $d6                 ; 1fb4 25 d6
                BT   2,A1fba             ; 1fb6 82 03
A1fb8:          LI   $d6                 ; 1fb8 20 d6
A1fba:          LR   (IS),A              ; 1fba 5c
                LIS  $2                  ; 1fbb 72
                DCI  $0fea               ; 1fbc 2a 0f ea
                LR   H,DC                ; 1fbf 11
                XM                       ; 1fc0 8c
                LR   DC,H                ; 1fc1 10
                ST                       ; 1fc2 17
                DCI  $08f7               ; 1fc3 2a 08 f7
                ST                       ; 1fc6 17
                PI   $40bc               ; 1fc7 28 40 bc
                LR   A,(IS)-             ; 1fca 4e
                PK                       ; 1fcb 0c
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
