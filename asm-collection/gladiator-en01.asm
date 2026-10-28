;Gladiator - EN01

;disassembled by Sean Riddle - www.seanriddle.com/videobrain.html
;1/25/2010

org $1000

				db   $aa,$55			;cart signature
				db   $01				;background color
				db   $00,$00,$00,$1b,$27,$11,$1f,$01,$11,$07,$13,$09,$00,$00,$00	;name - GLADIATOR

START:
                DCI  $0f85               ; 1012 2a 0f 85
                XDC                      ; 1015 2c
                DCI  A1d60               ; 1016 2a 1d 60
                LI   $10                 ; 1019 20 10
                LR   $7,A                ; 101b 57
                PI   A11a5               ; 101c 28 11 a5
A101f:          DCI  $0f98               ; 101f 2a 0f 98
                LIS  $0                  ; 1022 70
                ST                       ; 1023 17
                ST                       ; 1024 17
                ST                       ; 1025 17
                DI                       ; 1026 1a
                LR   J,W                 ; 1027 1e
                PI   $45db               ; 1028 28 45 db
                PI   $41c8               ; 102b 28 41 c8
                DCI  A1d70               ; 102e 2a 1d 70
                LI   $30                 ; 1031 20 30
                LISU 2                   ; 1033 62
                LISL 4                   ; 1034 6c
                LR   (IS),A              ; 1035 5c
                PI   $4205               ; 1036 28 42 05
                LI   $50                 ; 1039 20 50
                DCI  $0fdf               ; 103b 2a 0f df
                ST                       ; 103e 17
                LISL 4                   ; 103f 6c
                LIS  $c                  ; 1040 7c
                LR   (IS),A              ; 1041 5c
                DCI  A1da0               ; 1042 2a 1d a0
                PI   $4205               ; 1045 28 42 05
                LI   $46                 ; 1048 20 46
                DCI  $0fdf               ; 104a 2a 0f df
                ST                       ; 104d 17
                LI   $ff                 ; 104e 20 ff
                LR   $7,A                ; 1050 57
                LIS  $0                  ; 1051 70
                LR   $5,A                ; 1052 55
                LR   $6,A                ; 1053 56
A1054:          LIS  $0                  ; 1054 70
                DCI  $0fe2               ; 1055 2a 0f e2
                ST                       ; 1058 17
                PI   A18b3               ; 1059 28 18 b3
                LIS  $a                  ; 105c 7a
                LR   $1,A                ; 105d 51
                LR   A,$8                ; 105e 48
                INC                      ; 105f 1f
                LR   $8,A                ; 1060 58
                DCI  $245e               ; 1061 2a 24 5e
                CI   $40                 ; 1064 25 40
                BT   4,A108c             ; 1066 84 25
A1068:          CM                       ; 1068 8d
                BT   4,A1070             ; 1069 84 06
                DS   $1                  ; 106b 31
                BF   $4,A1068            ; 106c 94 fb
                BF   $0,A1054            ; 106e 90 e5
A1070:          PI   $40d9               ; 1070 28 40 d9
                PI   $412d               ; 1073 28 41 2d
                DCI  $0f98               ; 1076 2a 0f 98
                LR   A,$7                ; 1079 47
                INC                      ; 107a 1f
                LR   $7,A                ; 107b 57
                CI   $03                 ; 107c 25 03
                BT   4,A108f             ; 107e 84 10
                ADC                      ; 1080 8e
                LR   A,$8                ; 1081 48
                ST                       ; 1082 17
                DCI  $0f9c               ; 1083 2a 0f 9c
                LR   A,$7                ; 1086 47
                ADC                      ; 1087 8e
                LR   A,$1                ; 1088 41
                ST                       ; 1089 17
                BF   $0,A1054            ; 108a 90 c9
A108c:          LR   A,$7                ; 108c 47
                INC                      ; 108d 1f
                LR   $7,A                ; 108e 57
A108f:          LIS  $0                  ; 108f 70
                LR   $1,A                ; 1090 51
                LR   $2,A                ; 1091 52
                LIS  $3                  ; 1092 73
                LR   $4,A                ; 1093 54
A1094:          DS   $4                  ; 1094 34
                DS   $7                  ; 1095 37
                BF   $1,A10b1            ; 1096 91 1a
                LR   A,$7                ; 1098 47
                DCI  $0f9c               ; 1099 2a 0f 9c
                ADC                      ; 109c 8e
                LM                       ; 109d 16
                LR   $5,A                ; 109e 55
                DCI  A1d5d               ; 109f 2a 1d 5d
                LR   A,$4                ; 10a2 44
                ADC                      ; 10a3 8e
                LM                       ; 10a4 16
                LR   $6,A                ; 10a5 56
A10a6:          DS   $5                  ; 10a6 35
                BT   4,A1094             ; 10a7 84 ec
                LR   A,$1                ; 10a9 41
                AS   $6                  ; 10aa c6
                LR   $1,A                ; 10ab 51
                LR   A,$2                ; 10ac 42
                LNK                      ; 10ad 19
                LR   $2,A                ; 10ae 52
                BF   $0,A10a6            ; 10af 90 f6
A10b1:          LR   A,$2                ; 10b1 42
                SL   1                   ; 10b2 13
                LR   $2,A                ; 10b3 52
                LR   A,$1                ; 10b4 41
                SR   4                   ; 10b5 14
                SR   1                   ; 10b6 12
                SR   1                   ; 10b7 12
                SR   1                   ; 10b8 12
                XS   $2                  ; 10b9 e2
                LR   $2,A                ; 10ba 52
                CI   $03                 ; 10bb 25 03
                BF   $4,A10c2            ; 10bd 94 04
                JMP  A194e               ; 10bf 29 19 4e
A10c2:          BT   2,A10c7             ; 10c2 82 04
                JMP  A101f               ; 10c4 29 10 1f
A10c7:          LISU 3                   ; 10c7 63
                LISL 4                   ; 10c8 6c
                LR   (IS)+,A             ; 10c9 5d
                LR   A,$1                ; 10ca 41
                LR   (IS)-,A             ; 10cb 5e
A10cc:          LIS  $0                  ; 10cc 70
                OUTS 0                   ; 10cd b0
                OUTS 1                   ; 10ce b1
                DCI  $0fdd               ; 10cf 2a 0f dd
                ST                       ; 10d2 17
                ST                       ; 10d3 17
                DCI  $0fda               ; 10d4 2a 0f da
                ST                       ; 10d7 17
                LI   $11                 ; 10d8 20 11
                OUTS 12                  ; 10da bc
                LI   $ae                 ; 10db 20 ae
                OUTS 13                  ; 10dd bd
                LI   $ff                 ; 10de 20 ff
                DCI  $08f0               ; 10e0 2a 08 f0
                ST                       ; 10e3 17
                LIS  $1                  ; 10e4 71
                OUTS 14                  ; 10e5 be
                LI   $4c                 ; 10e6 20 4c
                DCI  $0fea               ; 10e8 2a 0f ea
                ST                       ; 10eb 17
                DCI  $08f7               ; 10ec 2a 08 f7
                ST                       ; 10ef 17
                EI                       ; 10f0 1b
                LR   J,W                 ; 10f1 1e
                PI   $22db               ; 10f2 28 22 db
                LIS  $0                  ; 10f5 70
                DCI  $0f96               ; 10f6 2a 0f 96
                ST                       ; 10f9 17
                ST                       ; 10fa 17
                DCI  $0f3f               ; 10fb 2a 0f 3f
                XDC                      ; 10fe 2c
                LIS  $a                  ; 10ff 7a
                LR   $1,A                ; 1100 51
                DCI  A1d46               ; 1101 2a 1d 46
A1104:          LM                       ; 1104 16
                LR   Q,DC                ; 1105 0e
                DCI  $2010               ; 1106 2a 20 10
                ADC                      ; 1109 8e
                SL   1                   ; 110a 13
                ADC                      ; 110b 8e
                ADC                      ; 110c 8e
                ADC                      ; 110d 8e
                LIS  $7                  ; 110e 77
                LR   $7,A                ; 110f 57
                PI   A11a5               ; 1110 28 11 a5
                DS   $1                  ; 1113 31
                LR   DC,Q                ; 1114 0f
                BF   $4,A1104            ; 1115 94 ee
                DCI  $0dda               ; 1117 2a 0d da
                LI   $98                 ; 111a 20 98
                LR   $1,A                ; 111c 51
                LIS  $0                  ; 111d 70
A111e:          ST                       ; 111e 17
                DS   $1                  ; 111f 31
                BF   $4,A111e            ; 1120 94 fd
                LI   $24                 ; 1122 20 24
                LR   $0,A                ; 1124 50
                LIS  $0                  ; 1125 70
                DCI  $0db6               ; 1126 2a 0d b6
A1129:          ST                       ; 1129 17
                DS   $0                  ; 112a 30
                BF   $4,A1129            ; 112b 94 fd
                DCI  $08f5               ; 112d 2a 08 f5
                ST                       ; 1130 17
                LR   A,(IS)              ; 1131 4c
                DCI  A113a               ; 1132 2a 11 3a
                ADC                      ; 1135 8e
                ADC                      ; 1136 8e
                ADC                      ; 1137 8e
                LR   Q,DC                ; 1138 0e
                LR   P0,Q                ; 1139 0d
A113a:          JMP  A1143               ; 113a 29 11 43
                JMP  A164f               ; 113d 29 16 4f
                JMP  A1411               ; 1140 29 14 11
A1143:          DCI  $0c6d               ; 1143 2a 0c 6d
                XDC                      ; 1146 2c
                DCI  A1bb2               ; 1147 2a 1b b2
                LISU 2                   ; 114a 62
                LISL 0                   ; 114b 68
                LIS  $1                  ; 114c 71
                LR   (IS)+,A             ; 114d 5d
                LR   (IS)+,A             ; 114e 5d
                LI   $16                 ; 114f 20 16
                LR   (IS),A              ; 1151 5c
                PI   $4686               ; 1152 28 46 86
                DCI  $0c6c               ; 1155 2a 0c 6c
                XDC                      ; 1158 2c
                DCI  A1bb3               ; 1159 2a 1b b3
                LI   $16                 ; 115c 20 16
                LR   (IS),A              ; 115e 5c
                PI   $4686               ; 115f 28 46 86
                DCI  $0d38               ; 1162 2a 0d 38
                XDC                      ; 1165 2c
                DCI  A1bde               ; 1166 2a 1b de
                LISL 0                   ; 1169 68
                LIS  $0                  ; 116a 70
                LR   (IS)+,A             ; 116b 5d
                LR   (IS)+,A             ; 116c 5d
                LI   $26                 ; 116d 20 26
                LR   (IS),A              ; 116f 5c
                PI   $4686               ; 1170 28 46 86
                DCI  $0ce8               ; 1173 2a 0c e8
                XDC                      ; 1176 2c
                DCI  A1c05               ; 1177 2a 1c 05
                LI   $50                 ; 117a 20 50
                LR   (IS),A              ; 117c 5c
                PI   $4686               ; 117d 28 46 86
                DCI  $0c98               ; 1180 2a 0c 98
                XDC                      ; 1183 2c
                DCI  A1c05               ; 1184 2a 1c 05
                LI   $50                 ; 1187 20 50
                LR   $7,A                ; 1189 57
                PI   A11a5               ; 118a 28 11 a5
                DCI  $0e72               ; 118d 2a 0e 72
                XDC                      ; 1190 2c
                DCI  A1bde               ; 1191 2a 1b de
                LI   $26                 ; 1194 20 26
                LR   $7,A                ; 1196 57
                PI   A11a5               ; 1197 28 11 a5
                LI   $10                 ; 119a 20 10
                LR   $7,A                ; 119c 57
                LIS  $0                  ; 119d 70
                DCI  $08f5               ; 119e 2a 08 f5
                ST                       ; 11a1 17
                JMP  A16a0               ; 11a2 29 16 a0
A11a5:          LR   K,P                 ; 11a5 08
A11a6:          LM                       ; 11a6 16
                XDC                      ; 11a7 2c
                ST                       ; 11a8 17
                XDC                      ; 11a9 2c
                DS   $7                  ; 11aa 37
                BF   $4,A11a6            ; 11ab 94 fa
                PK                       ; 11ad 0c
                
                LR   $3,A                ; 11ae 53
                LR   A,IS                ; 11af 0a
                LISU 4                   ; 11b0 64
                LISL 0                   ; 11b1 68
                LR   (IS)+,A             ; 11b2 5d
                LR   A,QU                ; 11b3 02
                LR   (IS)+,A             ; 11b4 5d
                LR   A,QL                ; 11b5 03
                LR   (IS)+,A             ; 11b6 5d
                LR   A,$9                ; 11b7 49
                LR   (IS)+,A             ; 11b8 5d
                XDC                      ; 11b9 2c
                LR   Q,DC                ; 11ba 0e
                DCI  $0fb0               ; 11bb 2a 0f b0
                LISU 2                   ; 11be 62
                LISL 0                   ; 11bf 68
                LR   A,(IS)+             ; 11c0 4d
                ST                       ; 11c1 17
                LR   A,(IS)+             ; 11c2 4d
                ST                       ; 11c3 17
                LR   A,(IS)+             ; 11c4 4d
                ST                       ; 11c5 17
                LR   A,(IS)+             ; 11c6 4d
                ST                       ; 11c7 17
                LR   A,QU                ; 11c8 02
                ST                       ; 11c9 17
                LR   A,QL                ; 11ca 03
                ST                       ; 11cb 17
                XDC                      ; 11cc 2c
                LR   Q,DC                ; 11cd 0e
                XDC                      ; 11ce 2c
                LR   A,KU                ; 11cf 00
                ST                       ; 11d0 17
                LR   A,KL                ; 11d1 01
                ST                       ; 11d2 17
                LR   A,$a                ; 11d3 4a
                ST                       ; 11d4 17
                LR   A,$b                ; 11d5 4b
                ST                       ; 11d6 17
                LR   J,W                 ; 11d7 1e
                LR   A,$9                ; 11d8 49
                ST                       ; 11d9 17
                LR   K,P                 ; 11da 08
                LR   A,KU                ; 11db 00
                ST                       ; 11dc 17
                LR   A,KL                ; 11dd 01
                ST                       ; 11de 17
                LR   A,QU                ; 11df 02
                ST                       ; 11e0 17
                LR   A,QL                ; 11e1 03
                ST                       ; 11e2 17
                PI   $424d               ; 11e3 28 42 4d
                LISU 3                   ; 11e6 63
                LISL 4                   ; 11e7 6c
                LIS  $2                  ; 11e8 72
                XS   (IS)                ; 11e9 ec
                BF   $4,A1209            ; 11ea 94 1e
                DCI  $0e9d               ; 11ec 2a 0e 9d
                LM                       ; 11ef 16
                AI   $0a                 ; 11f0 24 0a
                DCI  $0e9d               ; 11f2 2a 0e 9d
                ST                       ; 11f5 17
                DCI  $0800               ; 11f6 2a 08 00
                ST                       ; 11f9 17
                ST                       ; 11fa 17
                DCI  $0805               ; 11fb 2a 08 05
                ST                       ; 11fe 17
                ST                       ; 11ff 17
                DCI  $0809               ; 1200 2a 08 09
                ST                       ; 1203 17
                ST                       ; 1204 17
                DCI  $080f               ; 1205 2a 08 0f
                ST                       ; 1208 17
A1209:          DCI  $0fb0               ; 1209 2a 0f b0
                LISU 2                   ; 120c 62
                LISL 0                   ; 120d 68
                LM                       ; 120e 16
                LR   (IS)+,A             ; 120f 5d
                LM                       ; 1210 16
                LR   (IS)+,A             ; 1211 5d
                LM                       ; 1212 16
                LR   (IS)+,A             ; 1213 5d
                LM                       ; 1214 16
                LR   (IS)+,A             ; 1215 5d
                LM                       ; 1216 16
                LR   QU,A                ; 1217 06
                LM                       ; 1218 16
                LR   QL,A                ; 1219 07
                XDC                      ; 121a 2c
                LR   DC,Q                ; 121b 0f
                XDC                      ; 121c 2c
                LIS  $2                  ; 121d 72
                ADC                      ; 121e 8e
                LM                       ; 121f 16
                LR   $a,A                ; 1220 5a
                LM                       ; 1221 16
                LR   $b,A                ; 1222 5b
                LM                       ; 1223 16
                LR   $9,A                ; 1224 59
                LR   W,J                 ; 1225 1d
                LM                       ; 1226 16
                LR   KU,A                ; 1227 04
                LM                       ; 1228 16
                LR   KL,A                ; 1229 05
                LR   P,K                 ; 122a 09
                LM                       ; 122b 16
                LR   QU,A                ; 122c 06
                LM                       ; 122d 16
                LR   QL,A                ; 122e 07
                DCI  $0fb6               ; 122f 2a 0f b6
                LM                       ; 1232 16
                LR   KU,A                ; 1233 04
                LM                       ; 1234 16
                LR   KL,A                ; 1235 05
                LR   DC,Q                ; 1236 0f
                LISU 4                   ; 1237 64
                LISL 3                   ; 1238 6b
                LR   A,(IS)-             ; 1239 4e
                LR   $9,A                ; 123a 59
                LR   A,(IS)-             ; 123b 4e
                LR   QL,A                ; 123c 07
                LR   A,(IS)-             ; 123d 4e
                LR   QU,A                ; 123e 06
                LR   A,(IS)-             ; 123f 4e
                LR   IS,A                ; 1240 0b
                LR   A,$3                ; 1241 43
                EI                       ; 1242 1b
                POP                      ; 1243 1c
A1244:          LIS  $1                  ; 1244 71
                XS   (IS)                ; 1245 ec
                DCI  A1d50               ; 1246 2a 1d 50
                BF   $4,A124e            ; 1249 94 04
                DCI  A1f50               ; 124b 2a 1f 50
A124e:          LIS  $2                  ; 124e 72
                XS   (IS)                ; 124f ec
                BF   $4,A1255            ; 1250 94 04
                DCI  A1fed               ; 1252 2a 1f ed
A1255:          LR   H,DC                ; 1255 11
A1256:          LR   DC,H                ; 1256 10
                LM                       ; 1257 16
                CI   $ff                 ; 1258 25 ff
                BF   $4,A125f            ; 125a 94 04
                JMP  A18e7               ; 125c 29 18 e7
A125f:          LR   QU,A                ; 125f 06
                LM                       ; 1260 16
                LR   QL,A                ; 1261 07
                LM                       ; 1262 16
                LR   $0,A                ; 1263 50
                LR   H,DC                ; 1264 11
                PI   A1632               ; 1265 28 16 32
A1268:          LR   DC,Q                ; 1268 0f
                LM                       ; 1269 16
                LR   $4,A                ; 126a 54
                LR   Q,DC                ; 126b 0e
                PI   A145b               ; 126c 28 14 5b
                XS   $4                  ; 126f e4
                LR   DC,Q                ; 1270 0f
                LM                       ; 1271 16
                LR   Q,DC                ; 1272 0e
                BF   $1,A1284            ; 1273 91 10
A1275:          LIS  $0                  ; 1275 70
                XS   $4                  ; 1276 e4
                BT   1,A1268             ; 1277 81 f0
A1279:          XDC                      ; 1279 2c
                LI   $fc                 ; 127a 20 fc
                ADC                      ; 127c 8e
                LR   A,$1                ; 127d 41
                ST                       ; 127e 17
                LM                       ; 127f 16
                LR   A,$2                ; 1280 42
                ST                       ; 1281 17
                BF   $0,A1256            ; 1282 90 d3
A1284:          CI   $06                 ; 1284 25 06
                BT   4,A1292             ; 1286 84 0b
                DCI  A1b62               ; 1288 2a 1b 62
                ADC                      ; 128b 8e
                ADC                      ; 128c 8e
                LM                       ; 128d 16
                LR   QU,A                ; 128e 06
                LM                       ; 128f 16
                LR   QL,A                ; 1290 07
                LR   P0,Q                ; 1291 0d
A1292:          LR   A,$1                ; 1292 41
                LR   $7,A                ; 1293 57
                DCI  $0d5e               ; 1294 2a 0d 5e
                LR   A,$0                ; 1297 40
                SL   1                   ; 1298 13
                SL   1                   ; 1299 13
                ADC                      ; 129a 8e
                LM                       ; 129b 16
                LR   $1,A                ; 129c 51
                CM                       ; 129d 8d
                LM                       ; 129e 16
                LR   $9,A                ; 129f 59
                PI   A145b               ; 12a0 28 14 5b
                XS   $4                  ; 12a3 e4
                BT   1,A12b4             ; 12a4 81 0f
                LR   A,$7                ; 12a6 47
                LR   $1,A                ; 12a7 51
                LR   A,$9                ; 12a8 49
                LR   $2,A                ; 12a9 52
                PI   A145b               ; 12aa 28 14 5b
                XS   $4                  ; 12ad e4
                BT   1,A12b4             ; 12ae 81 05
                LR   J,W                 ; 12b0 1e
                JMP  A1256               ; 12b1 29 12 56
A12b4:          LR   J,W                 ; 12b4 1e
                BF   $0,A1275            ; 12b5 90 bf
                PI   A12bd               ; 12b7 28 12 bd
                JMP  A1256               ; 12ba 29 12 56
A12bd:          LR   K,P                 ; 12bd 08
                DCI  $0db6               ; 12be 2a 0d b6
                LR   A,$0                ; 12c1 40
                SL   1                   ; 12c2 13
                ADC                      ; 12c3 8e
                LM                       ; 12c4 16
                LR   $1,A                ; 12c5 51
                LM                       ; 12c6 16
                LR   $2,A                ; 12c7 52
                LI   $fe                 ; 12c8 20 fe
                ADC                      ; 12ca 8e
                LR   A,$2                ; 12cb 42
                ST                       ; 12cc 17
                LR   A,$1                ; 12cd 41
                ST                       ; 12ce 17
                PK                       ; 12cf 0c
                
                LIS  $0                  ; 12d0 70
                LR   $0,A                ; 12d1 50
                PI   A13c4               ; 12d2 28 13 c4
                DCI  A12dc               ; 12d5 2a 12 dc
                LR   Q,DC                ; 12d8 0e
                PI   $4795               ; 12d9 28 47 95
A12dc:          SL   4                   ; 12dc 15
                LR   J,W                 ; 12dd 1e
                LISL 5                   ; 12de 6d
                LIS  $8                  ; 12df 78
                NS   (IS)-               ; 12e0 fe
                LI   $fe                 ; 12e1 20 fe
                BT   4,A12e6             ; 12e3 84 02
                SL   1                   ; 12e5 13
A12e6:          DCI  A1bb2               ; 12e6 2a 1b b2
                LR   W,J                 ; 12e9 1d
                BF   $1,A12f1            ; 12ea 91 06
                DCI  $0c6c               ; 12ec 2a 0c 6c
                COM                      ; 12ef 18
                INC                      ; 12f0 1f
A12f1:          XDC                      ; 12f1 2c
                DCI  $0dba               ; 12f2 2a 0d ba
                ST                       ; 12f5 17
                LIS  $0                  ; 12f6 70
                ST                       ; 12f7 17
                XDC                      ; 12f8 2c
                LIS  $2                  ; 12f9 72
                XS   (IS)                ; 12fa ec
                BF   $4,A1300            ; 12fb 94 04
                DCI  A1f71               ; 12fd 2a 1f 71
A1300:          LIS  $2                  ; 1300 72
                LR   $0,A                ; 1301 50
                PI   A1780               ; 1302 28 17 80
                PI   A17cb               ; 1305 28 17 cb
                PI   A1883               ; 1308 28 18 83
                JMP  A18e7               ; 130b 29 18 e7
                LR   A,$0                ; 130e 40
                BF   $0,A1318            ; 130f 90 08
A1311:          LIS  $2                  ; 1311 72
                BF   $0,A1318            ; 1312 90 05
                LIS  $3                  ; 1314 73
                BF   $0,A1318            ; 1315 90 02
                LIS  $4                  ; 1317 74
A1318:          LR   $0,A                ; 1318 50
                PI   A17cb               ; 1319 28 17 cb
                LR   A,$0                ; 131c 40
                DCI  $0f9d               ; 131d 2a 0f 9d
                ADC                      ; 1320 8e
                LIS  $1                  ; 1321 71
                ST                       ; 1322 17
                LIS  $0                  ; 1323 70
                LR   $0,A                ; 1324 50
                JMP  A13ef               ; 1325 29 13 ef
A1328:          LIS  $f                  ; 1328 7f
                LR   $8,A                ; 1329 58
A132a:          PI   A1880               ; 132a 28 18 80
                DS   $8                  ; 132d 38
                BF   $4,A132a            ; 132e 94 fb
                JMP  A169e               ; 1330 29 16 9e
A1333:          PI   $40d0               ; 1333 28 40 d0
                PI   A1a98               ; 1336 28 1a 98
                PI   $45db               ; 1339 28 45 db
                LIS  $4                  ; 133c 74
                DCI  $08f5               ; 133d 2a 08 f5
                ST                       ; 1340 17
                LI   $64                 ; 1341 20 64
                DCI  $0fea               ; 1343 2a 0f ea
                ST                       ; 1346 17
                DCI  $08f7               ; 1347 2a 08 f7
                ST                       ; 134a 17
                DCI  A1dee               ; 134b 2a 1d ee
                LI   $1b                 ; 134e 20 1b
                LISU 2                   ; 1350 62
                LISL 4                   ; 1351 6c
                LR   (IS),A              ; 1352 5c
                PI   $4205               ; 1353 28 42 05
                PI   $41c8               ; 1356 28 41 c8
                DCI  $0f96               ; 1359 2a 0f 96
                LM                       ; 135c 16
                LR   $1,A                ; 135d 51
                LM                       ; 135e 16
                LR   $2,A                ; 135f 52
                COM                      ; 1360 18
                INC                      ; 1361 1f
                AS   $1                  ; 1362 c1
                DCI  $0fdf               ; 1363 2a 0f df
                LI   $09                 ; 1366 20 09
                ST                       ; 1368 17
                LR   A,$1                ; 1369 41
                LR   $4,A                ; 136a 54
                LI   $34                 ; 136b 20 34
                BF   $1,A1373            ; 136d 91 05
                LR   A,$2                ; 136f 42
                LR   $4,A                ; 1370 54
                LI   $24                 ; 1371 20 24
A1373:          LR   $8,A                ; 1373 58
                PI   $40d9               ; 1374 28 40 d9
                DCI  $0ca4               ; 1377 2a 0c a4
                XDC                      ; 137a 2c
                DCI  $0f3f               ; 137b 2a 0f 3f
                LR   A,$4                ; 137e 44
                ADC                      ; 137f 8e
                LIS  $7                  ; 1380 77
                LR   (IS),A              ; 1381 5c
                PI   A13c0               ; 1382 28 13 c0
                DCI  $0fdf               ; 1385 2a 0f df
                LI   $1c                 ; 1388 20 1c
                ST                       ; 138a 17
                DCI  $0f98               ; 138b 2a 0f 98
                LIS  $3                  ; 138e 73
                LISL 4                   ; 138f 6c
                LR   (IS),A              ; 1390 5c
                PI   $4205               ; 1391 28 42 05
                DCI  $0fdf               ; 1394 2a 0f df
                LI   $30                 ; 1397 20 30
                ST                       ; 1399 17
                DCI  $0f85               ; 139a 2a 0f 85
                LI   $10                 ; 139d 20 10
                LISL 4                   ; 139f 6c
                LR   (IS),A              ; 13a0 5c
                PI   $4205               ; 13a1 28 42 05
                LIS  $0                  ; 13a4 70
                LR   $5,A                ; 13a5 55
                LR   $6,A                ; 13a6 56
A13a7:          LIS  $0                  ; 13a7 70
                DCI  $0fe2               ; 13a8 2a 0f e2
                ST                       ; 13ab 17
                PI   A18b3               ; 13ac 28 18 b3
                LR   A,$8                ; 13af 48
                CI   $3f                 ; 13b0 25 3f
                BT   4,A13bb             ; 13b2 84 08
                CI   $43                 ; 13b4 25 43
                BF   $4,A13a7            ; 13b6 94 f0
                JMP  A101f               ; 13b8 29 10 1f
A13bb:          LISU 3                   ; 13bb 63
                LISL 4                   ; 13bc 6c
                JMP  A10cc               ; 13bd 29 10 cc
A13c0:          LR   K,P                 ; 13c0 08
                JMP  $40fb               ; 13c1 29 40 fb
A13c4:          LR   K,P                 ; 13c4 08
                LR   A,$0                ; 13c5 40
                CI   $02                 ; 13c6 25 02
                LI   $e8                 ; 13c8 20 e8
                BF   $4,A13d8            ; 13ca 94 0d
                LR   A,$2                ; 13cc 42
                CI   $89                 ; 13cd 25 89
                BF   $2,A13d6            ; 13cf 92 06
                LR   A,$1                ; 13d1 41
                CI   $5e                 ; 13d2 25 5e
                BT   4,A13ec             ; 13d4 84 17
A13d6:          LI   $d8                 ; 13d6 20 d8
A13d8:          LR   $7,A                ; 13d8 57
                DCI  $0d5e               ; 13d9 2a 0d 5e
                LR   A,$0                ; 13dc 40
                SL   1                   ; 13dd 13
                SL   1                   ; 13de 13
                ADC                      ; 13df 8e
                LR   A,$7                ; 13e0 47
                ST                       ; 13e1 17
                DCI  $0db6               ; 13e2 2a 0d b6
                LR   A,$0                ; 13e5 40
                SL   1                   ; 13e6 13
                ADC                      ; 13e7 8e
                LIS  $0                  ; 13e8 70
                ST                       ; 13e9 17
                ST                       ; 13ea 17
                PK                       ; 13eb 0c
                
A13ec:          JMP  A1279               ; 13ec 29 12 79
A13ef:          PI   A13c4               ; 13ef 28 13 c4
                JMP  A1256               ; 13f2 29 12 56
A13f5:          LR   K,P                 ; 13f5 08
                LISU 5                   ; 13f6 65
                LISL 7                   ; 13f7 6f
                DCI  $0d5e               ; 13f8 2a 0d 5e
                LI   $10                 ; 13fb 20 10
                LR   $0,A                ; 13fd 50
                LIS  $2                  ; 13fe 72
                LR   $2,A                ; 13ff 52
A1400:          LM                       ; 1400 16
                LR   $1,A                ; 1401 51
                LM                       ; 1402 16
                COM                      ; 1403 18
                INC                      ; 1404 1f
                AS   $1                  ; 1405 c1
                COM                      ; 1406 18
                LR   (IS)+,A             ; 1407 5d
                BR7  A140b               ; 1408 8f 02
                LISU 6                   ; 140a 66
A140b:          LR   A,$2                ; 140b 42
                ADC                      ; 140c 8e
                DS   $0                  ; 140d 30
                BF   $4,A1400            ; 140e 94 f1
                PK                       ; 1410 0c
                
A1411:          DCI  $0c98               ; 1411 2a 0c 98
                XDC                      ; 1414 2c
                DCI  A1cf6               ; 1415 2a 1c f6
                LI   $50                 ; 1418 20 50
                LR   $7,A                ; 141a 57
                PI   A11a5               ; 141b 28 11 a5
                DCI  $0caa               ; 141e 2a 0c aa
                LI   $94                 ; 1421 20 94
                ST                       ; 1423 17
                LI   $13                 ; 1424 20 13
                LR   $0,A                ; 1426 50
                ADC                      ; 1427 8e
                LI   $95                 ; 1428 20 95
                ST                       ; 142a 17
                LR   $1,A                ; 142b 51
                LR   A,$0                ; 142c 40
                ADC                      ; 142d 8e
                LR   A,$1                ; 142e 41
                ST                       ; 142f 17
                LR   A,$0                ; 1430 40
                ADC                      ; 1431 8e
                LR   A,$1                ; 1432 41
                ST                       ; 1433 17
                LI   $10                 ; 1434 20 10
                LR   $7,A                ; 1436 57
                JMP  A16a0               ; 1437 29 16 a0
A143a:          LR   K,P                 ; 143a 08
                DCI  $0f9d               ; 143b 2a 0f 9d
                LR   A,$0                ; 143e 40
                ADC                      ; 143f 8e
                LIS  $0                  ; 1440 70
                XM                       ; 1441 8c
                BF   $4,A145a            ; 1442 94 17
                DCI  $0f9e               ; 1444 2a 0f 9e
                LIS  $0                  ; 1447 70
                XM                       ; 1448 8c
                BF   $4,A1457            ; 1449 94 0d
                DCI  $0fa2               ; 144b 2a 0f a2
                LIS  $0                  ; 144e 70
                XM                       ; 144f 8c
                LIS  $3                  ; 1450 73
                BT   4,A1454             ; 1451 84 02
                LIS  $4                  ; 1453 74
A1454:          XS   $0                  ; 1454 e0
                BT   4,A145a             ; 1455 84 04
A1457:          JMP  A1256               ; 1457 29 12 56
A145a:          PK                       ; 145a 0c

A145b:          LR   K,P                 ; 145b 08
                DCI  $0d5e               ; 145c 2a 0d 5e
                LR   A,$4                ; 145f 44
                SL   1                   ; 1460 13
                SL   1                   ; 1461 13
                ADC                      ; 1462 8e
                LM                       ; 1463 16
                COM                      ; 1464 18
                AS   $1                  ; 1465 c1
                BF   $1,A1469            ; 1466 91 02
                COM                      ; 1468 18
A1469:          LR   $8,A                ; 1469 58
                LR   A,$5                ; 146a 45
                AM                       ; 146b 88
                AS   $8                  ; 146c c8
                BF   $2,A147f            ; 146d 92 11
                LM                       ; 146f 16
                COM                      ; 1470 18
                AS   $2                  ; 1471 c2
                BF   $1,A1475            ; 1472 91 02
                COM                      ; 1474 18
A1475:          LR   $8,A                ; 1475 58
                LM                       ; 1476 16
                AS   $6                  ; 1477 c6
                AS   $8                  ; 1478 c8
                BF   $2,A147f            ; 1479 92 05
                LI   $80                 ; 147b 20 80
                BF   $0,A1480            ; 147d 90 02
A147f:          LIS  $0                  ; 147f 70
A1480:          PK                       ; 1480 0c

A1481:          LISL 6                   ; 1481 6e
                LI   $80                 ; 1482 20 80
                XS   (IS)                ; 1484 ec
                LR   (IS)-,A             ; 1485 5e
                BT   1,A14c3             ; 1486 81 3c
                LIS  $1                  ; 1488 71
                LR   $a,A                ; 1489 5a
                PI   A1a98               ; 148a 28 1a 98
                PI   $21ad               ; 148d 28 21 ad
                LISU 3                   ; 1490 63
                LISL 5                   ; 1491 6d
                LR   $2,A                ; 1492 52
                DCI  $0dda               ; 1493 2a 0d da
                XDC                      ; 1496 2c
                LIS  $0                  ; 1497 70
                LR   $4,A                ; 1498 54
                LI   $10                 ; 1499 20 10
                NS   (IS)-               ; 149b fe
                LIS  $2                  ; 149c 72
                BT   4,A14a0             ; 149d 84 02
                LIS  $3                  ; 149f 73
A14a0:          LR   $5,A                ; 14a0 55
                PI   A1525               ; 14a1 28 15 25
                LIS  $0                  ; 14a4 70
                LR   $a,A                ; 14a5 5a
                PI   $21ad               ; 14a6 28 21 ad
                LISU 3                   ; 14a9 63
                LISL 5                   ; 14aa 6d
                LR   $2,A                ; 14ab 52
                PI   A1aab               ; 14ac 28 1a ab
                DCI  $0dda               ; 14af 2a 0d da
                XDC                      ; 14b2 2c
                LI   $10                 ; 14b3 20 10
                NS   (IS)                ; 14b5 fc
                LI   $fe                 ; 14b6 20 fe
                BT   4,A14bc             ; 14b8 84 03
                LI   $fd                 ; 14ba 20 fd
A14bc:          LR   $5,A                ; 14bc 55
                PI   A1575               ; 14bd 28 15 75
                JMP  A1244               ; 14c0 29 12 44
A14c3:          LIS  $8                  ; 14c3 78
                NS   (IS)                ; 14c4 fc
                LR   J,W                 ; 14c5 1e
                BT   4,A14d7             ; 14c6 84 10
                DCI  $0d6a               ; 14c8 2a 0d 6a
                LM                       ; 14cb 16
                DCI  $0d6e               ; 14cc 2a 0d 6e
                CM                       ; 14cf 8d
                LI   $c8                 ; 14d0 20 c8
                BF   $2,A14d5            ; 14d2 92 02
                LIS  $0                  ; 14d4 70
A14d5:          BF   $0,A14e1            ; 14d5 90 0b
A14d7:          LIS  $3                  ; 14d7 73
                LR   $a,A                ; 14d8 5a
                PI   A1a98               ; 14d9 28 1a 98
                PI   $21ad               ; 14dc 28 21 ad
                LISU 3                   ; 14df 63
                LISL 5                   ; 14e0 6d
A14e1:          LR   $2,A                ; 14e1 52
                DCI  $0e26               ; 14e2 2a 0e 26
                XDC                      ; 14e5 2c
                LIS  $2                  ; 14e6 72
                LR   $4,A                ; 14e7 54
                LI   $20                 ; 14e8 20 20
                NS   (IS)                ; 14ea fc
                LIS  $2                  ; 14eb 72
                BT   4,A14ef             ; 14ec 84 02
                LIS  $3                  ; 14ee 73
A14ef:          LR   $5,A                ; 14ef 55
                PI   A1525               ; 14f0 28 15 25
                LIS  $8                  ; 14f3 78
                NS   (IS)                ; 14f4 fc
                BT   4,A1506             ; 14f5 84 10
                DCI  $0d6c               ; 14f7 2a 0d 6c
                LM                       ; 14fa 16
                DCI  $0d70               ; 14fb 2a 0d 70
                CM                       ; 14fe 8d
                LI   $c8                 ; 14ff 20 c8
                BF   $2,A1504            ; 1501 92 02
                LIS  $0                  ; 1503 70
A1504:          BF   $0,A150d            ; 1504 90 08
A1506:          LIS  $2                  ; 1506 72
                LR   $a,A                ; 1507 5a
                PI   $21ad               ; 1508 28 21 ad
                LISU 3                   ; 150b 63
                LISL 5                   ; 150c 6d
A150d:          LR   $2,A                ; 150d 52
                PI   A1aab               ; 150e 28 1a ab
                DCI  $0e26               ; 1511 2a 0e 26
                XDC                      ; 1514 2c
                LI   $20                 ; 1515 20 20
                NS   (IS)                ; 1517 fc
                LI   $fe                 ; 1518 20 fe
                BT   4,A151e             ; 151a 84 03
                LI   $fd                 ; 151c 20 fd
A151e:          LR   $5,A                ; 151e 55
                PI   A1575               ; 151f 28 15 75
                JMP  A1244               ; 1522 29 12 44
A1525:          LR   K,P                 ; 1525 08
                PI   $40a9               ; 1526 28 40 a9
                LR   A,$2                ; 1529 42
                CI   $b4                 ; 152a 25 b4
                DCI  $0e72               ; 152c 2a 0e 72
                LIS  $0                  ; 152f 70
                LR   $6,A                ; 1530 56
                LR   $1,A                ; 1531 51
                LR   A,$5                ; 1532 45
                BF   $2,A154f            ; 1533 92 1b
                LR   A,$2                ; 1535 42
                CI   $14                 ; 1536 25 14
                DCI  $0d38               ; 1538 2a 0d 38
                LIS  $5                  ; 153b 75
                LR   $6,A                ; 153c 56
                LIS  $1                  ; 153d 71
                LR   $1,A                ; 153e 51
                LR   A,$5                ; 153f 45
                LR   J,W                 ; 1540 1e
                COM                      ; 1541 18
                INC                      ; 1542 1f
                LR   W,J                 ; 1543 1d
                BT   2,A154f             ; 1544 82 0a
                DCI  $0dbc               ; 1546 2a 0d bc
                LR   A,$4                ; 1549 44
                ADC                      ; 154a 8e
                LIS  $0                  ; 154b 70
                ST                       ; 154c 17
                BF   $0,A156f            ; 154d 90 21
A154f:          LR   $7,A                ; 154f 57
                LI   $26                 ; 1550 20 26
                LR   $2,A                ; 1552 52
                XDC                      ; 1553 2c
                LR   A,$1                ; 1554 41
                ADC                      ; 1555 8e
                XDC                      ; 1556 2c
                PI   A1628               ; 1557 28 16 28
                LR   A,$4                ; 155a 44
                DCI  $0dbc               ; 155b 2a 0d bc
                ADC                      ; 155e 8e
                LR   A,$7                ; 155f 47
                ST                       ; 1560 17
                DCI  $0c65               ; 1561 2a 0c 65
                LR   A,$4                ; 1564 44
                ADC                      ; 1565 8e
                LR   A,$6                ; 1566 46
                ST                       ; 1567 17
                DCI  $0c69               ; 1568 2a 0c 69
                LR   A,$4                ; 156b 44
                ADC                      ; 156c 8e
                LR   A,$1                ; 156d 41
                ST                       ; 156e 17
A156f:          PI   $40bc               ; 156f 28 40 bc
                LISU 3                   ; 1572 63
                LISL 5                   ; 1573 6d
                PK                       ; 1574 0c
                
A1575:          LR   K,P                 ; 1575 08
                PI   $40a9               ; 1576 28 40 a9
                LR   A,$2                ; 1579 42
                SR   4                   ; 157a 14
                DCI  A1c55               ; 157b 2a 1c 55
                ADC                      ; 157e 8e
                LIS  $0                  ; 157f 70
                XM                       ; 1580 8c
                LR   $7,A                ; 1581 57
                DCI  $0dbd               ; 1582 2a 0d bd
                LR   A,$4                ; 1585 44
                ADC                      ; 1586 8e
                LR   A,$5                ; 1587 45
                BT   4,A1594             ; 1588 84 0b
                LR   J,W                 ; 158a 1e
                COM                      ; 158b 18
                INC                      ; 158c 1f
                LR   W,J                 ; 158d 1d
                BF   $1,A1594            ; 158e 91 05
                LIS  $0                  ; 1590 70
                ST                       ; 1591 17
                BF   $0,A159a            ; 1592 90 07
A1594:          ST                       ; 1594 17
                LR   A,$7                ; 1595 47
                SL   1                   ; 1596 13
                SR   1                   ; 1597 12
                INC                      ; 1598 1f
                LR   $7,A                ; 1599 57
A159a:          DCI  $0c65               ; 159a 2a 0c 65
                LR   A,$4                ; 159d 44
                ADC                      ; 159e 8e
                DS   $7                  ; 159f 37
                LM                       ; 15a0 16
                AS   $7                  ; 15a1 c7
                ST                       ; 15a2 17
                LR   $7,A                ; 15a3 57
                DCI  $0c69               ; 15a4 2a 0c 69
                LR   A,$4                ; 15a7 44
                ADC                      ; 15a8 8e
                LM                       ; 15a9 16
                LR   $1,A                ; 15aa 51
                LR   A,$7                ; 15ab 47
                DCI  $0c98               ; 15ac 2a 0c 98
                SL   4                   ; 15af 15
                SR   1                   ; 15b0 12
                ADC                      ; 15b1 8e
                ADC                      ; 15b2 8e
                LI   $10                 ; 15b3 20 10
                LR   $2,A                ; 15b5 52
                XDC                      ; 15b6 2c
                LIS  $1                  ; 15b7 71
                XS   $1                  ; 15b8 e1
                ADC                      ; 15b9 8e
                LIS  $3                  ; 15ba 73
                LR   $5,A                ; 15bb 55
                LIS  $0                  ; 15bc 70
A15bd:          ST                       ; 15bd 17
                CM                       ; 15be 8d
                DS   $5                  ; 15bf 35
                BF   $4,A15bd            ; 15c0 94 fc
                XDC                      ; 15c2 2c
                PI   A1628               ; 15c3 28 16 28
                XDC                      ; 15c6 2c
                LI   $13                 ; 15c7 20 13
                LR   $5,A                ; 15c9 55
                LIS  $0                  ; 15ca 70
A15cb:          ST                       ; 15cb 17
                CM                       ; 15cc 8d
                DS   $5                  ; 15cd 35
                BF   $4,A15cb            ; 15ce 94 fc
                LISU 3                   ; 15d0 63
                LISL 5                   ; 15d1 6d
                LIS  $2                  ; 15d2 72
                NS   (IS)-               ; 15d3 fe
                BT   4,A15e8             ; 15d4 84 13
                DCI  $0e9e               ; 15d6 2a 0e 9e
                LM                       ; 15d9 16
                XS   $4                  ; 15da e4
                BF   $4,A15e8            ; 15db 94 0c
                DCI  A1ce3               ; 15dd 2a 1c e3
                LR   A,$7                ; 15e0 47
                ADC                      ; 15e1 8e
                ADC                      ; 15e2 8e
                LM                       ; 15e3 16
                DCI  $0db7               ; 15e4 2a 0d b7
                ST                       ; 15e7 17
A15e8:          PI   $40bc               ; 15e8 28 40 bc
                LISU 3                   ; 15eb 63
                LISL 4                   ; 15ec 6c
                PK                       ; 15ed 0c
                
A15ee:          PI   $4795               ; 15ee 28 47 95
                LR   $7,A                ; 15f1 57
                LISL 5                   ; 15f2 6d
                LI   $40                 ; 15f3 20 40
                NS   (IS)-               ; 15f5 fe
                BF   $4,A1625            ; 15f6 94 2e
                LIS  $1                  ; 15f8 71
                XS   (IS)                ; 15f9 ec
                BT   4,A1625             ; 15fa 84 2a
                DCI  $0d66               ; 15fc 2a 0d 66
                LM                       ; 15ff 16
                CI   $d8                 ; 1600 25 d8
                BF   $4,A1625            ; 1602 94 22
                LR   A,$7                ; 1604 47
                CI   $02                 ; 1605 25 02
                BF   $2,A1625            ; 1607 92 1d
                DCI  $1c88               ; 1609 2a 1c 88
                LIS  $2                  ; 160c 72
                XS   (IS)                ; 160d ec
                BF   $4,A1613            ; 160e 94 04
                DCI  A1f99               ; 1610 2a 1f 99
A1613:          LIS  $2                  ; 1613 72
                LR   $0,A                ; 1614 50
                PI   A174b               ; 1615 28 17 4b
                DCI  $0d66               ; 1618 2a 0d 66
                LI   $5e                 ; 161b 20 5e
                ST                       ; 161d 17
                DCI  $0dba               ; 161e 2a 0d ba
                LIS  $0                  ; 1621 70
                ST                       ; 1622 17
                LIS  $2                  ; 1623 72
                ST                       ; 1624 17
A1625:          JMP  A17da               ; 1625 29 17 da
A1628:          LR   K,P                 ; 1628 08
A1629:          LM                       ; 1629 16
                XDC                      ; 162a 2c
                ST                       ; 162b 17
                CM                       ; 162c 8d
                XDC                      ; 162d 2c
                DS   $2                  ; 162e 32
                BF   $4,A1629            ; 162f 94 f9
                PK                       ; 1631 0c
                
A1632:          LR   K,P                 ; 1632 08
                DCI  $0d5e               ; 1633 2a 0d 5e
                LR   A,$0                ; 1636 40
                SL   1                   ; 1637 13
                SL   1                   ; 1638 13
                ADC                      ; 1639 8e
                XDC                      ; 163a 2c
                DCI  $0db6               ; 163b 2a 0d b6
                SR   1                   ; 163e 12
                ADC                      ; 163f 8e
                LM                       ; 1640 16
                XDC                      ; 1641 2c
                AM                       ; 1642 88
                LR   $1,A                ; 1643 51
                LM                       ; 1644 16
                LR   $5,A                ; 1645 55
                LM                       ; 1646 16
                LR   $7,A                ; 1647 57
                LM                       ; 1648 16
                LR   $6,A                ; 1649 56
                XDC                      ; 164a 2c
                LR   A,$7                ; 164b 47
                AM                       ; 164c 88
                LR   $2,A                ; 164d 52
                PK                       ; 164e 0c
                
A164f:          DCI  $0d38               ; 164f 2a 0d 38
                XDC                      ; 1652 2c
                DCI  $1e09               ; 1653 2a 1e 09
                LISU 2                   ; 1656 62
                LISL 0                   ; 1657 68
                LIS  $0                  ; 1658 70
                LR   (IS)+,A             ; 1659 5d
                LR   (IS)+,A             ; 165a 5d
                LI   $26                 ; 165b 20 26
                LR   (IS),A              ; 165d 5c
                PI   $4686               ; 165e 28 46 86
                DCI  $0ce8               ; 1661 2a 0c e8
                XDC                      ; 1664 2c
                DCI  A1e2f               ; 1665 2a 1e 2f
                LI   $50                 ; 1668 20 50
                LR   (IS),A              ; 166a 5c
                PI   $4686               ; 166b 28 46 86
                DCI  $0c98               ; 166e 2a 0c 98
                XDC                      ; 1671 2c
                DCI  A1e2f               ; 1672 2a 1e 2f
                LI   $50                 ; 1675 20 50
                LR   $7,A                ; 1677 57
                PI   A11a5               ; 1678 28 11 a5
                DCI  $0e72               ; 167b 2a 0e 72
                XDC                      ; 167e 2c
                DCI  $1e09               ; 167f 2a 1e 09
                LI   $26                 ; 1682 20 26
                LR   $7,A                ; 1684 57
                PI   A11a5               ; 1685 28 11 a5
                LI   $10                 ; 1688 20 10
                LR   $7,A                ; 168a 57
                PI   A11a5               ; 168b 28 11 a5
                LI   $10                 ; 168e 20 10
                LR   $7,A                ; 1690 57
                DCI  $0fa2               ; 1691 2a 0f a2
                LIS  $1                  ; 1694 71
                ST                       ; 1695 17
                LI   $12                 ; 1696 20 12
                DCI  $08f5               ; 1698 2a 08 f5
                ST                       ; 169b 17
                BF   $0,A16a0            ; 169c 90 03
A169e:          LIS  $d                  ; 169e 7d
                LR   $7,A                ; 169f 57
A16a0:          LISU 3                   ; 16a0 63
                LISL 4                   ; 16a1 6c
                LIS  $1                  ; 16a2 71
                XS   (IS)                ; 16a3 ec
                DCI  A1c7c               ; 16a4 2a 1c 7c
                BF   $4,A16ac            ; 16a7 94 04
                DCI  A1e8a               ; 16a9 2a 1e 8a
A16ac:          LIS  $2                  ; 16ac 72
                XS   (IS)                ; 16ad ec
                BF   $4,A16b3            ; 16ae 94 04
                DCI  A1f8d               ; 16b0 2a 1f 8d
A16b3:          LIS  $0                  ; 16b3 70
                LR   $0,A                ; 16b4 50
A16b5:          PI   A174b               ; 16b5 28 17 4b
                LR   A,$0                ; 16b8 40
                INC                      ; 16b9 1f
                LR   $0,A                ; 16ba 50
                DS   $7                  ; 16bb 37
                BF   $4,A16b5            ; 16bc 94 f8
                DCI  $0d9e               ; 16be 2a 0d 9e
                XDC                      ; 16c1 2c
                DCI  $1c64               ; 16c2 2a 1c 64
                LI   $18                 ; 16c5 20 18
                LR   $7,A                ; 16c7 57
                PI   A11a5               ; 16c8 28 11 a5
                LIS  $1                  ; 16cb 71
                XS   (IS)                ; 16cc ec
                BF   $4,A171a            ; 16cd 94 4c
                DCI  $0fa2               ; 16cf 2a 0f a2
                LM                       ; 16d2 16
                XI   $01                 ; 16d3 23 01
                DCI  $0fa2               ; 16d5 2a 0f a2
                ST                       ; 16d8 17
                LIS  $1                  ; 16d9 71
                LR   $4,A                ; 16da 54
                LR   $1,A                ; 16db 51
                LR   $3,A                ; 16dc 53
                LI   $c1                 ; 16dd 20 c1
                LR   $2,A                ; 16df 52
                LIS  $0                  ; 16e0 70
                LR   $5,A                ; 16e1 55
                BT   4,A16f7             ; 16e2 84 14
                DCI  $1eea               ; 16e4 2a 1e ea
                LIS  $2                  ; 16e7 72
                LR   $0,A                ; 16e8 50
                PI   A174b               ; 16e9 28 17 4b
                LI   $ff                 ; 16ec 20 ff
                LR   $5,A                ; 16ee 55
                LR   $1,A                ; 16ef 51
                LI   $c1                 ; 16f0 20 c1
                LR   $3,A                ; 16f2 53
                LIS  $1                  ; 16f3 71
                LR   $2,A                ; 16f4 52
                LIS  $0                  ; 16f5 70
                LR   $4,A                ; 16f6 54
A16f7:          DCI  $0f9f               ; 16f7 2a 0f 9f
                ST                       ; 16fa 17
                LR   A,$4                ; 16fb 44
                ST                       ; 16fc 17
                LR   A,$5                ; 16fd 45
                ST                       ; 16fe 17
                DCI  $082b               ; 16ff 2a 08 2b
                LR   A,$2                ; 1702 42
                ST                       ; 1703 17
                LR   A,$3                ; 1704 43
                ST                       ; 1705 17
                LI   $40                 ; 1706 20 40
                LISL 5                   ; 1708 6d
                NS   (IS)-               ; 1709 fe
                LR   A,$1                ; 170a 41
                BT   4,A1714             ; 170b 84 08
                DCI  $0d66               ; 170d 2a 0d 66
                LI   $d8                 ; 1710 20 d8
                ST                       ; 1712 17
                LIS  $0                  ; 1713 70
A1714:          DCI  $0dba               ; 1714 2a 0d ba
                ST                       ; 1717 17
                LIS  $0                  ; 1718 70
                ST                       ; 1719 17
A171a:          LIS  $0                  ; 171a 70
                DCI  $0c65               ; 171b 2a 0c 65
                ST                       ; 171e 17
                ST                       ; 171f 17
                LIS  $5                  ; 1720 75
                ST                       ; 1721 17
                ST                       ; 1722 17
                PI   $40d0               ; 1723 28 40 d0
                DCI  $0dda               ; 1726 2a 0d da
                XDC                      ; 1729 2c
                DCI  $0e72               ; 172a 2a 0e 72
                LI   $26                 ; 172d 20 26
                LR   $2,A                ; 172f 52
                PI   A1628               ; 1730 28 16 28
                DCI  $0e27               ; 1733 2a 0e 27
                XDC                      ; 1736 2c
                DCI  $0d38               ; 1737 2a 0d 38
                LI   $26                 ; 173a 20 26
                LR   $2,A                ; 173c 52
                PI   A1628               ; 173d 28 16 28
                DCI  $0c69               ; 1740 2a 0c 69
                LIS  $0                  ; 1743 70
                ST                       ; 1744 17
                ST                       ; 1745 17
                INC                      ; 1746 1f
                ST                       ; 1747 17
                JMP  A18e7               ; 1748 29 18 e7
A174b:          LR   K,P                 ; 174b 08
                XDC                      ; 174c 2c
                DCI  $0c40               ; 174d 2a 0c 40
                LR   A,$0                ; 1750 40
                ADC                      ; 1751 8e
                XDC                      ; 1752 2c
                LM                       ; 1753 16
                XDC                      ; 1754 2c
                ST                       ; 1755 17
                SR   1                   ; 1756 12
                LR   $1,A                ; 1757 51
                DCI  $0820               ; 1758 2a 08 20
                LR   A,$0                ; 175b 40
                ADC                      ; 175c 8e
                XDC                      ; 175d 2c
                LM                       ; 175e 16
                XDC                      ; 175f 2c
                ST                       ; 1760 17
                SL   1                   ; 1761 13
                SL   1                   ; 1762 13
                LR   $2,A                ; 1763 52
                DCI  $0d5e               ; 1764 2a 0d 5e
                LR   A,$0                ; 1767 40
                SL   1                   ; 1768 13
                SL   1                   ; 1769 13
                ADC                      ; 176a 8e
                LIS  $2                  ; 176b 72
                LR   $4,A                ; 176c 54
A176d:          XDC                      ; 176d 2c
                LM                       ; 176e 16
                XDC                      ; 176f 2c
                ST                       ; 1770 17
                LR   A,$2                ; 1771 42
                ST                       ; 1772 17
                LR   A,$1                ; 1773 41
                LR   $2,A                ; 1774 52
                DS   $4                  ; 1775 34
                BF   $4,A176d            ; 1776 94 f6
                XDC                      ; 1778 2c
                LM                       ; 1779 16
                LR   QU,A                ; 177a 06
                LM                       ; 177b 16
                LR   QL,A                ; 177c 07
                XDC                      ; 177d 2c
                BF   $0,A1782            ; 177e 90 03
A1780:          LR   K,P                 ; 1780 08
                LR   Q,DC                ; 1781 0e
A1782:          DCI  $0c20               ; 1782 2a 0c 20
                LR   A,$0                ; 1785 40
                ADC                      ; 1786 8e
                LR   A,QL                ; 1787 03
                ST                       ; 1788 17
                LIS  $f                  ; 1789 7f
                ADC                      ; 178a 8e
                LR   A,QU                ; 178b 02
                ST                       ; 178c 17
                XDC                      ; 178d 2c
                PK                       ; 178e 0c
                
                DCI  $0d5e               ; 178f 2a 0d 5e
                LM                       ; 1792 16
                CI   $e8                 ; 1793 25 e8
                BT   4,A179a             ; 1795 84 04
                JMP  A179d               ; 1797 29 17 9d
A179a:          JMP  A1256               ; 179a 29 12 56
A179d:          LISL 5                   ; 179d 6d
                LIS  $1                  ; 179e 71
                NS   (IS)-               ; 179f fe
                BF   $4,A17ac            ; 17a0 94 0b
A17a2:          LIS  $1                  ; 17a2 71
                XS   (IS)                ; 17a3 ec
                BF   $4,A17a9            ; 17a4 94 04
                JMP  A1328               ; 17a6 29 13 28
A17a9:          JMP  A13ef               ; 17a9 29 13 ef
A17ac:          LISU 3                   ; 17ac 63
                LISL 0                   ; 17ad 68
                DS   (IS)                ; 17ae 3c
                LISU 3                   ; 17af 63
                LISL 4                   ; 17b0 6c
                BT   4,A17a2             ; 17b1 84 f0
                DCI  $0d5e               ; 17b3 2a 0d 5e
                LM                       ; 17b6 16
                LR   $1,A                ; 17b7 51
                PI   A145b               ; 17b8 28 14 5b
                XS   $4                  ; 17bb e4
                DCI  $0db6               ; 17bc 2a 0d b6
                BT   1,A17c2             ; 17bf 81 02
                CM                       ; 17c1 8d
A17c2:          LR   Q,DC                ; 17c2 0e
                LM                       ; 17c3 16
                COM                      ; 17c4 18
                INC                      ; 17c5 1f
                LR   DC,Q                ; 17c6 0f
                ST                       ; 17c7 17
                JMP  A1256               ; 17c8 29 12 56
A17cb:          LR   K,P                 ; 17cb 08
                DCI  $0c30               ; 17cc 2a 0c 30
                LR   A,$0                ; 17cf 40
                ADC                      ; 17d0 8e
                LR   Q,DC                ; 17d1 0e
                LM                       ; 17d2 16
                NI   $1f                 ; 17d3 21 1f
                XI   $80                 ; 17d5 23 80
                LR   DC,Q                ; 17d7 0f
                ST                       ; 17d8 17
                PK                       ; 17d9 0c
                
A17da:          DCI  $0d5e               ; 17da 2a 0d 5e
                LM                       ; 17dd 16
                CI   $e8                 ; 17de 25 e8
                BF   $4,A1817            ; 17e0 94 36
                DCI  $0e9a               ; 17e2 2a 0e 9a
                LM                       ; 17e5 16
                XI   $80                 ; 17e6 23 80
                DCI  $0e9a               ; 17e8 2a 0e 9a
                ST                       ; 17eb 17
                BT   1,A17fa             ; 17ec 81 0d
                LIS  $0                  ; 17ee 70
                OUTS 1                   ; 17ef b1
                INS  1                   ; 17f0 a1
                NI   $01                 ; 17f1 21 01
                BT   4,A17fa             ; 17f3 84 06
                PI   A19c0               ; 17f5 28 19 c0
                BF   $0,A1817            ; 17f8 90 1e
A17fa:          LISL 5                   ; 17fa 6d
                LIS  $8                  ; 17fb 78
                NS   (IS)-               ; 17fc fe
                BT   4,A180d             ; 17fd 84 0f
                PI   $4795               ; 17ff 28 47 95
                CI   $10                 ; 1802 25 10
                BF   $2,A1817            ; 1804 92 12
                DCI  $0c68               ; 1806 2a 0c 68
                LIS  $7                  ; 1809 77
                ST                       ; 180a 17
                BF   $0,A1814            ; 180b 90 08
A180d:          LIS  $0                  ; 180d 70
                OUTS 1                   ; 180e b1
                INS  1                   ; 180f a1
                NI   $02                 ; 1810 21 02
                BT   4,A1817             ; 1812 84 04
A1814:          PI   A1a7d               ; 1814 28 1a 7d
A1817:          JMP  A1481               ; 1817 29 14 81
                PI   A143a               ; 181a 28 14 3a
                BF   $0,A1823            ; 181d 90 05
                LI   $ff                 ; 181f 20 ff
                BF   $0,A1824            ; 1821 90 02
A1823:          LIS  $0                  ; 1823 70
A1824:          DCI  $0e9b               ; 1824 2a 0e 9b
                ST                       ; 1827 17
                LIS  $4                  ; 1828 74
                LR   $1,A                ; 1829 51
                DCI  $0f96               ; 182a 2a 0f 96
                LR   H,DC                ; 182d 11
                LIS  $d                  ; 182e 7d
                LR   $8,A                ; 182f 58
                BF   $0,A184a            ; 1830 90 19
                PI   A143a               ; 1832 28 14 3a
                BF   $0,A183b            ; 1835 90 05
                LI   $ff                 ; 1837 20 ff
                BF   $0,A183c            ; 1839 90 02
A183b:          LIS  $0                  ; 183b 70
A183c:          DCI  $0e9b               ; 183c 2a 0e 9b
                ST                       ; 183f 17
                LIS  $3                  ; 1840 73
                LR   $1,A                ; 1841 51
                DCI  $0f97               ; 1842 2a 0f 97
                LR   H,DC                ; 1845 11
                LIS  $e                  ; 1846 7e
                LR   $8,A                ; 1847 58
                BF   $0,A184a            ; 1848 90 01
A184a:          DCI  $0c30               ; 184a 2a 0c 30
                LM                       ; 184d 16
                NI   $1f                 ; 184e 21 1f
                DCI  $0c30               ; 1850 2a 0c 30
                ST                       ; 1853 17
                LR   A,$1                ; 1854 41
                LR   $0,A                ; 1855 50
                PI   A17cb               ; 1856 28 17 cb
                LR   DC,H                ; 1859 10
                LM                       ; 185a 16
                AI   $07                 ; 185b 24 07
                LR   $6,A                ; 185d 56
                LR   DC,H                ; 185e 10
                ST                       ; 185f 17
                DCI  $ef3f               ; 1860 2a ef 3f
                ADC                      ; 1863 8e
                LR   A,$8                ; 1864 48
                LR   $0,A                ; 1865 50
                PI   A1780               ; 1866 28 17 80
                PI   A1abf               ; 1869 28 1a bf
                LR   A,$6                ; 186c 46
                CI   $3f                 ; 186d 25 3f
                BT   4,A1874             ; 186f 84 04
                JMP  A169e               ; 1871 29 16 9e
A1874:          JMP  A1333               ; 1874 29 13 33
A1877:          LR   K,P                 ; 1877 08
                LI   $f7                 ; 1878 20 f7
                LR   $7,A                ; 187a 57
                LI   $30                 ; 187b 20 30
                LR   $8,A                ; 187d 58
                BF   $0,A1888            ; 187e 90 09
A1880:          LR   K,P                 ; 1880 08
                BF   $0,A1886            ; 1881 90 04
A1883:          LR   K,P                 ; 1883 08
                LIS  $8                  ; 1884 78
                LR   $8,A                ; 1885 58
A1886:          LIS  $7                  ; 1886 77
                LR   $7,A                ; 1887 57
A1888:          LI   $30                 ; 1888 20 30
A188a:          DCI  $08fb               ; 188a 2a 08 fb
                CM                       ; 188d 8d
                BF   $4,A188a            ; 188e 94 fb
A1890:          DCI  $08fb               ; 1890 2a 08 fb
                LR   H,DC                ; 1893 11
                LM                       ; 1894 16
                AS   $8                  ; 1895 c8
                CI   $d0                 ; 1896 25 d0
                BT   2,A189b             ; 1898 82 02
A189a:          PK                       ; 189a 0c

A189b:          LR   DC,H                ; 189b 10
                CM                       ; 189c 8d
                BF   $2,A189b            ; 189d 92 fd
                LI   $10                 ; 189f 20 10
                OUTS 1                   ; 18a1 b1
                LR   A,$7                ; 18a2 47
                XI   $07                 ; 18a3 23 07
                LR   $7,A                ; 18a5 57
                OUTS 0                   ; 18a6 b0
                LIS  $0                  ; 18a7 70
                OUTS 1                   ; 18a8 b1
                BT   1,A1890             ; 18a9 81 e6
                DS   $8                  ; 18ab 38
                BT   4,A189a             ; 18ac 84 ed
                LR   DC,H                ; 18ae 10
                LM                       ; 18af 16
                AS   $8                  ; 18b0 c8
                BF   $0,A189b            ; 18b1 90 e9
A18b3:          LR   K,P                 ; 18b3 08
                PI   $40a9               ; 18b4 28 40 a9
A18b7:          LR   A,$5                ; 18b7 45
                INC                      ; 18b8 1f
                INC                      ; 18b9 1f
                INC                      ; 18ba 1f
                LR   $5,A                ; 18bb 55
                DCI  A1dc9               ; 18bc 2a 1d c9
                ADC                      ; 18bf 8e
                LIS  $0                  ; 18c0 70
                XM                       ; 18c1 8c
                BF   $1,A18e3            ; 18c2 91 20
                LISU 4                   ; 18c4 64
                LISL 3                   ; 18c5 6b
                LR   (IS)+,A             ; 18c6 5d
                LM                       ; 18c7 16
                LR   (IS)+,A             ; 18c8 5d
                LM                       ; 18c9 16
                LISU 2                   ; 18ca 62
                LISL 4                   ; 18cb 6c
                LR   (IS),A              ; 18cc 5c
                LIS  $0                  ; 18cd 70
                OUTS 0                   ; 18ce b0
                OUTS 1                   ; 18cf b1
                DCI  $0fdd               ; 18d0 2a 0f dd
                ST                       ; 18d3 17
                ST                       ; 18d4 17
                PI   $46d6               ; 18d5 28 46 d6
                PI   $43d6               ; 18d8 28 43 d6
                BF   $1,A18b7            ; 18db 91 db
                BT   4,A18b7             ; 18dd 84 d9
                PI   $40bc               ; 18df 28 40 bc
                PK                       ; 18e2 0c
                
A18e3:          LR   A,$6                ; 18e3 46
                LR   $5,A                ; 18e4 55
                BF   $0,A18b7            ; 18e5 90 d1
A18e7:          PI   A13f5               ; 18e7 28 13 f5
                LI   $10                 ; 18ea 20 10
                LR   $5,A                ; 18ec 55
                DCI  $0880               ; 18ed 2a 08 80
A18f0:          LISU 5                   ; 18f0 65
                LISL 7                   ; 18f1 6f
                LIS  $2                  ; 18f2 72
                LR   $2,A                ; 18f3 52
                LI   $ff                 ; 18f4 20 ff
                LR   $7,A                ; 18f6 57
A18f7:          LR   A,$7                ; 18f7 47
                AS   (IS)+               ; 18f8 cd
                BT   2,A1918             ; 18f9 82 1e
A18fb:          BR7  A18f7               ; 18fb 8f fb
                LISU 6                   ; 18fd 66
                DS   $2                  ; 18fe 32
                BF   $4,A18f7            ; 18ff 94 f7
                LR   A,$4                ; 1901 44
                LR   IS,A                ; 1902 0b
                LIS  $0                  ; 1903 70
                LR   (IS),A              ; 1904 5c
                LR   A,IS                ; 1905 0a
                BR7  A190c               ; 1906 8f 05
                AI   $d1                 ; 1908 24 d1
                BF   $0,A190e            ; 190a 90 03
A190c:          AI   $d9                 ; 190c 24 d9
A190e:          ST                       ; 190e 17
                DS   $5                  ; 190f 35
                BF   $4,A18f0            ; 1910 94 df
                PI   A13f5               ; 1912 28 13 f5
                JMP  A1afd               ; 1915 29 1a fd
A1918:          LR   A,(IS)-             ; 1918 4e
                LR   A,IS                ; 1919 0a
                LR   $4,A                ; 191a 54
                LR   A,(IS)+             ; 191b 4d
                COM                      ; 191c 18
                LR   $7,A                ; 191d 57
                BF   $0,A18fb            ; 191e 90 dc
                LIS  $2                  ; 1920 72
                BF   $0,A1927            ; 1921 90 05
                LIS  $3                  ; 1923 73
                BF   $0,A1927            ; 1924 90 02
                LIS  $4                  ; 1926 74
A1927:          LR   $1,A                ; 1927 51
                LIS  $2                  ; 1928 72
                LR   $2,A                ; 1929 52
                LR   A,$1                ; 192a 41
A192b:          DCI  $0f9d               ; 192b 2a 0f 9d
                ADC                      ; 192e 8e
                LIS  $0                  ; 192f 70
                XM                       ; 1930 8c
                BF   $4,A1939            ; 1931 94 07
                LR   A,$0                ; 1933 40
                DS   $2                  ; 1934 32
                BF   $4,A192b            ; 1935 94 f5
                BF   $0,A194b            ; 1937 90 13
A1939:          LR   A,$0                ; 1939 40
                XS   $1                  ; 193a e1
                LR   $1,A                ; 193b 51
                DCI  $0dba               ; 193c 2a 0d ba
                LIS  $0                  ; 193f 70
                XM                       ; 1940 8c
                LIS  $1                  ; 1941 71
                BT   1,A1945             ; 1942 81 02
                LIS  $6                  ; 1944 76
A1945:          XS   $1                  ; 1945 e1
                BT   4,A194b             ; 1946 84 04
                JMP  A1328               ; 1948 29 13 28
A194b:          JMP  A1256               ; 194b 29 12 56
A194e:          PI   $41d5               ; 194e 28 41 d5
                PI   $41c8               ; 1951 28 41 c8
                DCI  $1dac               ; 1954 2a 1d ac
                LISU 2                   ; 1957 62
                LISL 4                   ; 1958 6c
                LI   $20                 ; 1959 20 20
                LR   (IS),A              ; 195b 5c
                PI   $4205               ; 195c 28 42 05
                DCI  A1da0               ; 195f 2a 1d a0
                LIS  $c                  ; 1962 7c
                LR   (IS),A              ; 1963 5c
                PI   $4205               ; 1964 28 42 05
                LI   $10                 ; 1967 20 10
                DCI  $0fdf               ; 1969 2a 0f df
                ST                       ; 196c 17
                LIS  $0                  ; 196d 70
                LR   $1,A                ; 196e 51
                LIS  $0                  ; 196f 70
                DCI  $0fe2               ; 1970 2a 0f e2
                ST                       ; 1973 17
                LR   $5,A                ; 1974 55
                LR   $6,A                ; 1975 56
A1976:          PI   A18b3               ; 1976 28 18 b3
                DCI  $0f85               ; 1979 2a 0f 85
                LR   A,$1                ; 197c 41
                ADC                      ; 197d 8e
                INC                      ; 197e 1f
                LR   $1,A                ; 197f 51
                CI   $11                 ; 1980 25 11
                BF   $4,A198e            ; 1982 94 0b
A1984:          LIS  $f                  ; 1984 7f
                LR   $1,A                ; 1985 51
                LIS  $0                  ; 1986 70
A1987:          ST                       ; 1987 17
                DS   $1                  ; 1988 31
                BF   $4,A1987            ; 1989 94 fd
                JMP  A101f               ; 198b 29 10 1f
A198e:          LR   A,$8                ; 198e 48
                CI   $40                 ; 198f 25 40
                BT   4,A1984             ; 1991 84 f2
                CI   $3f                 ; 1993 25 3f
                BF   $4,A199b            ; 1995 94 05
                LIS  $0                  ; 1997 70
                LR   $8,A                ; 1998 58
                BF   $0,A19ae            ; 1999 90 14
A199b:          CI   $47                 ; 199b 25 47
                BF   $4,A19ae            ; 199d 94 10
                LI   $12                 ; 199f 20 12
                LR   $8,A                ; 19a1 58
                DS   $1                  ; 19a2 31
                BT   4,A1976             ; 19a3 84 d2
                PI   $4122               ; 19a5 28 41 22
                DS   $1                  ; 19a8 31
                PI   $40d9               ; 19a9 28 40 d9
                BF   $0,A1976            ; 19ac 90 c9
A19ae:          LIS  $0                  ; 19ae 70
                XS   $8                  ; 19af e8
                CI   $3a                 ; 19b0 25 3a
                BT   6,A19b7             ; 19b2 86 04
                DS   $1                  ; 19b4 31
                BF   $0,A1976            ; 19b5 90 c0
A19b7:          ST                       ; 19b7 17
                PI   $40d9               ; 19b8 28 40 d9
                PI   $412d               ; 19bb 28 41 2d
                BF   $0,A1976            ; 19be 90 b7
A19c0:          LR   K,P                 ; 19c0 08
                PI   $40a9               ; 19c1 28 40 a9
                DCI  $0d6a               ; 19c4 2a 0d 6a
                LR   H,DC                ; 19c7 11
                DCI  $0c66               ; 19c8 2a 0c 66
                LM                       ; 19cb 16
                LR   $2,A                ; 19cc 52
                LIS  $b                  ; 19cd 7b
                LR   $4,A                ; 19ce 54
                LIS  $0                  ; 19cf 70
                LR   $7,A                ; 19d0 57
                DCI  $082b               ; 19d1 2a 08 2b
                LR   Q,DC                ; 19d4 0e
                LIS  $0                  ; 19d5 70
                LR   $6,A                ; 19d6 56
A19d7:          LISU 3                   ; 19d7 63
                LISL 0                   ; 19d8 68
                LIS  $3                  ; 19d9 73
                LR   (IS),A              ; 19da 5c
                LISU 3                   ; 19db 63
                LISL 4                   ; 19dc 6c
                LIS  $2                  ; 19dd 72
                XS   (IS)                ; 19de ec
                BT   4,A1a16             ; 19df 84 36
                LR   DC,Q                ; 19e1 0f
                LIS  $0                  ; 19e2 70
                XM                       ; 19e3 8c
                BF   $1,A19f9            ; 19e4 91 14
                LR   A,$7                ; 19e6 47
                ADC                      ; 19e7 8e
                LIS  $0                  ; 19e8 70
                XM                       ; 19e9 8c
                BT   1,A19ef             ; 19ea 81 04
                JMP  A1a77               ; 19ec 29 1a 77
A19ef:          LIS  $1                  ; 19ef 71
                XS   (IS)+               ; 19f0 ed
                BF   $4,A19f6            ; 19f1 94 04
                JMP  A1a77               ; 19f3 29 1a 77
A19f6:          JMP  A169e               ; 19f6 29 16 9e
A19f9:          NI   $1f                 ; 19f9 21 1f
                LR   $1,A                ; 19fb 51
                DS   $1                  ; 19fc 31
                LR   DC,Q                ; 19fd 0f
                LM                       ; 19fe 16
                BF   $4,A1a11            ; 19ff 94 11
                LI   $61                 ; 1a01 20 61
                LR   DC,Q                ; 1a03 0f
                ST                       ; 1a04 17
                DCI  $0d5e               ; 1a05 2a 0d 5e
                LR   A,$4                ; 1a08 44
                SL   1                   ; 1a09 13
                SL   1                   ; 1a0a 13
                ADC                      ; 1a0b 8e
                LI   $e8                 ; 1a0c 20 e8
                ST                       ; 1a0e 17
                BF   $0,A1a16            ; 1a0f 90 06
A1a11:          NI   $e0                 ; 1a11 21 e0
                XS   $1                  ; 1a13 e1
                LR   DC,Q                ; 1a14 0f
                ST                       ; 1a15 17
A1a16:          LR   A,$2                ; 1a16 42
                DCI  $1ce2               ; 1a17 2a 1c e2
                SL   1                   ; 1a1a 13
                ADC                      ; 1a1b 8e
                LIS  $0                  ; 1a1c 70
                XM                       ; 1a1d 8c
                LR   $5,A                ; 1a1e 55
                LR   J,W                 ; 1a1f 1e
                XDC                      ; 1a20 2c
                LISL 5                   ; 1a21 6d
                LIS  $4                  ; 1a22 74
                NS   (IS)-               ; 1a23 fe
                LR   A,$5                ; 1a24 45
                BT   4,A1a28             ; 1a25 84 02
                SL   1                   ; 1a27 13
A1a28:          DCI  $0db6               ; 1a28 2a 0d b6
                ST                       ; 1a2b 17
                XDC                      ; 1a2c 2c
                LM                       ; 1a2d 16
                BT   4,A1a31             ; 1a2e 84 02
                SL   1                   ; 1a30 13
A1a31:          XDC                      ; 1a31 2c
                ST                       ; 1a32 17
                DCI  $0e9e               ; 1a33 2a 0e 9e
                LR   A,$6                ; 1a36 46
                ST                       ; 1a37 17
                DCI  $0fa0               ; 1a38 2a 0f a0
                LIS  $0                  ; 1a3b 70
                ST                       ; 1a3c 17
                ST                       ; 1a3d 17
                DCI  $0d5e               ; 1a3e 2a 0d 5e
                XDC                      ; 1a41 2c
                LR   DC,H                ; 1a42 10
                LIS  $d                  ; 1a43 7d
                LR   W,J                 ; 1a44 1d
                BT   1,A1a49             ; 1a45 81 03
                COM                      ; 1a47 18
                INC                      ; 1a48 1f
A1a49:          AM                       ; 1a49 88
                CM                       ; 1a4a 8d
                XDC                      ; 1a4b 2c
                ST                       ; 1a4c 17
                CM                       ; 1a4d 8d
                XDC                      ; 1a4e 2c
                LI   $f8                 ; 1a4f 20 f8
                AM                       ; 1a51 88
                XDC                      ; 1a52 2c
                ST                       ; 1a53 17
                LIS  $2                  ; 1a54 72
                XS   (IS)                ; 1a55 ec
                BF   $4,A1a5d            ; 1a56 94 06
                PI   A1877               ; 1a58 28 18 77
                BF   $0,A1a6f            ; 1a5b 90 13
A1a5d:          PI   A1883               ; 1a5d 28 18 83
                LIS  $1                  ; 1a60 71
                XS   (IS)                ; 1a61 ec
                DCI  $9e80               ; 1a62 2a 9e 80
                BT   4,A1a72             ; 1a65 84 0c
                DCI  $9b8c               ; 1a67 2a 9b 8c
                LR   A,$2                ; 1a6a 42
                CI   $04                 ; 1a6b 25 04
                BT   2,A1a72             ; 1a6d 82 04
A1a6f:          DCI  $9b90               ; 1a6f 2a 9b 90
A1a72:          LIS  $0                  ; 1a72 70
                LR   $0,A                ; 1a73 50
                PI   A1780               ; 1a74 28 17 80
A1a77:          PI   $40bc               ; 1a77 28 40 bc
                LISU 3                   ; 1a7a 63
                LISL 4                   ; 1a7b 6c
                PK                       ; 1a7c 0c
                
A1a7d:          LR   K,P                 ; 1a7d 08
                PI   $40a9               ; 1a7e 28 40 a9
                DCI  $0d6e               ; 1a81 2a 0d 6e
                LR   H,DC                ; 1a84 11
                DCI  $0c68               ; 1a85 2a 0c 68
                LM                       ; 1a88 16
                LR   $2,A                ; 1a89 52
                LI   $fe                 ; 1a8a 20 fe
                LR   $7,A                ; 1a8c 57
                LIS  $c                  ; 1a8d 7c
                LR   $4,A                ; 1a8e 54
                DCI  $082c               ; 1a8f 2a 08 2c
                LR   Q,DC                ; 1a92 0e
                LIS  $2                  ; 1a93 72
                LR   $6,A                ; 1a94 56
                JMP  A19d7               ; 1a95 29 19 d7
A1a98:          LR   K,P                 ; 1a98 08
                LR   A,$a                ; 1a99 4a
                CI   $03                 ; 1a9a 25 03
                LI   $24                 ; 1a9c 20 24
                BF   $4,A1aa2            ; 1a9e 94 03
                LI   $34                 ; 1aa0 20 34
A1aa2:          DCI  $08fb               ; 1aa2 2a 08 fb
                CM                       ; 1aa5 8d
                BF   $4,A1aa2            ; 1aa6 94 fb
                LIS  $0                  ; 1aa8 70
                OUTS 14                  ; 1aa9 be
                PK                       ; 1aaa 0c
                
A1aab:          LR   K,P                 ; 1aab 08
                LI   $4c                 ; 1aac 20 4c
                DCI  $0fea               ; 1aae 2a 0f ea
                ST                       ; 1ab1 17
                DCI  $08f7               ; 1ab2 2a 08 f7
                ST                       ; 1ab5 17
                LIS  $1                  ; 1ab6 71
                OUTS 14                  ; 1ab7 be
                LIS  $0                  ; 1ab8 70
                DCI  $0fdd               ; 1ab9 2a 0f dd
                ST                       ; 1abc 17
                ST                       ; 1abd 17
                PK                       ; 1abe 0c
                
A1abf:          LR   K,P                 ; 1abf 08
                PI   $40a9               ; 1ac0 28 40 a9
                LISU 3                   ; 1ac3 63
                LISL 4                   ; 1ac4 6c
                LIS  $2                  ; 1ac5 72
                XS   (IS)                ; 1ac6 ec
                LI   $78                 ; 1ac7 20 78
                BF   $4,A1acd            ; 1ac9 94 03
                LI   $28                 ; 1acb 20 28
A1acd:          LR   $5,A                ; 1acd 55
A1ace:          DS   $5                  ; 1ace 35
                BT   4,A1af7             ; 1acf 84 27
                LR   A,$5                ; 1ad1 45
                SL   4                   ; 1ad2 15
                SL   1                   ; 1ad3 13
                SL   1                   ; 1ad4 13
                BF   $4,A1af2            ; 1ad5 94 1c
                DCI  $0e9b               ; 1ad7 2a 0e 9b
                LIS  $0                  ; 1ada 70
                XM                       ; 1adb 8c
                LR   $2,A                ; 1adc 52
                BT   1,A1aeb             ; 1add 81 0d
                DCI  $0c40               ; 1adf 2a 0c 40
                LR   A,$1                ; 1ae2 41
                ADC                      ; 1ae3 8e
                LR   H,DC                ; 1ae4 11
                LM                       ; 1ae5 16
                AS   $2                  ; 1ae6 c2
                LR   DC,H                ; 1ae7 10
                ST                       ; 1ae8 17
                BF   $0,A1af2            ; 1ae9 90 08
A1aeb:          DCI  $0c30               ; 1aeb 2a 0c 30
                LR   A,$1                ; 1aee 41
                ADC                      ; 1aef 8e
                LR   H,DC                ; 1af0 11
                LM                       ; 1af1 16
A1af2:          PI   A1883               ; 1af2 28 18 83
                BF   $0,A1ace            ; 1af5 90 d8
A1af7:          PI   $40bc               ; 1af7 28 40 bc
                LISU 3                   ; 1afa 63
                LISL 4                   ; 1afb 6c
                PK                       ; 1afc 0c
                
A1afd:          LI   $c0                 ; 1afd 20 c0
A1aff:          DCI  $08fb               ; 1aff 2a 08 fb
                CM                       ; 1b02 8d
                BF   $4,A1aff            ; 1b03 94 fb
                DCI  $0860               ; 1b05 2a 08 60
                XDC                      ; 1b08 2c
                DCI  $0880               ; 1b09 2a 08 80
                LI   $10                 ; 1b0c 20 10
                LR   $1,A                ; 1b0e 51
A1b0f:          LM                       ; 1b0f 16
                NI   $0f                 ; 1b10 21 0f
                LR   H,DC                ; 1b12 11
                SL   1                   ; 1b13 13
                SL   1                   ; 1b14 13
                DCI  $0d60               ; 1b15 2a 0d 60
                ADC                      ; 1b18 8e
                LM                       ; 1b19 16
                LR   $2,A                ; 1b1a 52
                LM                       ; 1b1b 16
                COM                      ; 1b1c 18
                INC                      ; 1b1d 1f
                AS   $2                  ; 1b1e c2
                XDC                      ; 1b1f 2c
                ST                       ; 1b20 17
                XDC                      ; 1b21 2c
                LR   DC,H                ; 1b22 10
                DS   $1                  ; 1b23 31
                BF   $4,A1b0f            ; 1b24 94 ea
                LISU 5                   ; 1b26 65
                LISL 7                   ; 1b27 6f
                DCI  $0840               ; 1b28 2a 08 40
                LI   $10                 ; 1b2b 20 10
                LR   $0,A                ; 1b2d 50
A1b2e:          LR   A,(IS)+             ; 1b2e 4d
                COM                      ; 1b2f 18
                ST                       ; 1b30 17
                BR7  A1b34               ; 1b31 8f 02
                LISU 6                   ; 1b33 66
A1b34:          DS   $0                  ; 1b34 30
                BF   $4,A1b2e            ; 1b35 94 f8
                DCI  $0850               ; 1b37 2a 08 50
                XDC                      ; 1b3a 2c
                DCI  $0860               ; 1b3b 2a 08 60
                LI   $10                 ; 1b3e 20 10
                LR   $7,A                ; 1b40 57
                PI   A11a5               ; 1b41 28 11 a5
                DCI  $0870               ; 1b44 2a 08 70
                XDC                      ; 1b47 2c
                DCI  $0880               ; 1b48 2a 08 80
                LI   $10                 ; 1b4b 20 10
                LR   $7,A                ; 1b4d 57
                PI   A11a5               ; 1b4e 28 11 a5
                DCI  $0ffa               ; 1b51 2a 0f fa
                XDC                      ; 1b54 2c
                DCI  $1cdc               ; 1b55 2a 1c dc
                LIS  $6                  ; 1b58 76
                LR   $7,A                ; 1b59 57
                PI   A11a5               ; 1b5a 28 11 a5
                LISU 3                   ; 1b5d 63
                LISL 4                   ; 1b5e 6c
                JMP  A15ee               ; 1b5f 29 15 ee
A1b62:          COM                      ; 1b62 18
                DS   $b                  ; 1b63 3b
                COM                      ; 1b64 18
                XI   $12                 ; 1b65 23 12
                ASD  $0                  ; 1b67 d0
                SL   1                   ; 1b68 13
                db   $ef                 
                SR   1                   ; 1b6a 12
                LR   $6,A                ; 1b6b 56
                SR   1                   ; 1b6c 12
                OUTS 7                   ; 1b6d b7
                SR   1                   ; 1b6e 12
;                BF   $2,24               ; 1b6f 92 18
				db   $92,$18
                DS   $7                  ; 1b71 37
                COM                      ; 1b72 18
                INC                      ; 1b73 1f
                ST                       ; 1b74 17
                BF   $d,A1b89            ; 1b75 9d 13
                LR   Q,DC                ; 1b77 0e
                COM                      ; 1b78 18
                DS   $2                  ; 1b79 32
                SL   1                   ; 1b7a 13
                PI   A1311               ; 1b7b 28 13 11
                SL   1                   ; 1b7e 13
                SR   4                   ; 1b7f 14
                SL   1                   ; 1b80 13
                ST                       ; 1b81 17
                COM                      ; 1b82 18
                DI                       ; 1b83 1a
                LNK                      ; 1b84 19
                LI   $19                 ; 1b85 20 19
A1b87:          XI   $19                 ; 1b87 23 19
A1b89:          IN   $17                 ; 1b89 26 17
                BR7  A1b8e               ; 1b8b 8f 02
                LIS  $f                  ; 1b8d 7f
A1b8e:          LR   A,QU                ; 1b8e 02
                LR   A,KU                ; 1b8f 00
                LR   A,$0                ; 1b90 40
                NS   (IS)-               ; 1b91 fe
                LR   A,$0                ; 1b92 40
                LR   A,KU                ; 1b93 00
                LIS  $f                  ; 1b94 7f
                LR   (IS)+,A             ; 1b95 5d
                POP                      ; 1b96 1c
                POP                      ; 1b97 1c
                POP                      ; 1b98 1c
                POP                      ; 1b99 1c
                POP                      ; 1b9a 1c
                POP                      ; 1b9b 1c
                POP                      ; 1b9c 1c
                POP                      ; 1b9d 1c
                POP                      ; 1b9e 1c
                POP                      ; 1b9f 1c
                POP                      ; 1ba0 1c
                POP                      ; 1ba1 1c
                POP                      ; 1ba2 1c
                POP                      ; 1ba3 1c
                POP                      ; 1ba4 1c
                POP                      ; 1ba5 1c
                POP                      ; 1ba6 1c
                POP                      ; 1ba7 1c
                POP                      ; 1ba8 1c
                POP                      ; 1ba9 1c
                POP                      ; 1baa 1c
                POP                      ; 1bab 1c
                POP                      ; 1bac 1c
                POP                      ; 1bad 1c
                POP                      ; 1bae 1c
                DS   (IS)-               ; 1baf 3e
                DS   (IS)-               ; 1bb0 3e
                LIS  $f                  ; 1bb1 7f
A1bb2:          INC                      ; 1bb2 1f
A1bb3:          LR   A,KU                ; 1bb3 00
                db   $3f                 
                BT   1,A1c35             ; 1bb5 81 7f
                AS   $2                  ; 1bb7 c2
                OUTS 1                   ; 1bb8 b1
                INS  1                   ; 1bb9 a1
                LISU 0                   ; 1bba 60
                AS   $1                  ; 1bbb c1
                XS   $a                  ; 1bbc ea
                XS   $1                  ; 1bbd e1
                AI   $81                 ; 1bbe 24 81
                XS   (IS)-               ; 1bc0 ee
                XS   $1                  ; 1bc1 e1
                LISL 6                   ; 1bc2 6e
                AS   $1                  ; 1bc3 c1
                XS   $4                  ; 1bc4 e4
                db   $ff                 
                DS   $1                  ; 1bc6 31
                db   $ff                 
                db   $ff                 
                db   $ff                 
                LIS  $f                  ; 1bca 7f
                db   $ff                 
                OUTS 15                  ; 1bcc bf
                db   $ff                 
                LIS  $f                  ; 1bce 7f
                db   $ff                 
                INC                      ; 1bd0 1f
                db   $ff                 
                INC                      ; 1bd2 1f
                db   $ff                 
                LNK                      ; 1bd4 19
                db   $b3                 
                LNK                      ; 1bd6 19
                db   $b3                 
                LNK                      ; 1bd8 19
                db   $b3                 
                DS   $0                  ; 1bda 30
                AS   $3                  ; 1bdb c3
                DS   $0                  ; 1bdc 30
                AS   $0                  ; 1bdd c0
A1bde:          POP                      ; 1bde 1c
                DS   (IS)-               ; 1bdf 3e
                DS   (IS)-               ; 1be0 3e
                DS   (IS)                ; 1be1 3c
                db   $3f                 
                DS   (IS)-               ; 1be3 3e
                DS   (IS)-               ; 1be4 3e
                LR   J,W                 ; 1be5 1e
A1be6:          POP                      ; 1be6 1c
                LIS  $f                  ; 1be7 7f
                db   $ff                 
                NS   $7                  ; 1be9 f7
                AS   $1                  ; 1bea c1
                XS   $3                  ; 1beb e3
                NS   $7                  ; 1bec f7
                XS   $b                  ; 1bed eb
                db   $ff                 
                db   $ff                 
                db   $ff                 
                NS   $7                  ; 1bf1 f7
                AS   $1                  ; 1bf2 c1
                NS   $7                  ; 1bf3 f7
                OUTS 15                  ; 1bf4 bf
                OUTS 15                  ; 1bf5 bf
                db   $3f                 
                DS   (IS)-               ; 1bf7 3e
                DS   $6                  ; 1bf8 36
                DS   $6                  ; 1bf9 36
                DS   $6                  ; 1bfa 36
                DS   $6                  ; 1bfb 36
                DS   $6                  ; 1bfc 36
                NS   $6                  ; 1bfd f6
                NS   $6                  ; 1bfe f6
                NS   $6                  ; 1bff f6
                BT   6,A1b87             ; 1c00 86 86
                BT   6,A1c0a             ; 1c02 86 07
                LR   QL,A                ; 1c04 07
A1c05:          LR   A,$0                ; 1c05 40
                LI   $1c                 ; 1c06 20 1c
                PK                       ; 1c08 0c
                
                POP                      ; 1c09 1c
A1c0a:          DS   $2                  ; 1c0a 32
                XS   $1                  ; 1c0b e1
                AS   $0                  ; 1c0c c0
A1c0d:          LR   A,KU                ; 1c0d 00
                LR   A,KU                ; 1c0e 00
                LR   A,KU                ; 1c0f 00
                LR   A,KU                ; 1c10 00
                LR   A,KU                ; 1c11 00
                LR   A,KU                ; 1c12 00
                LR   A,KU                ; 1c13 00
                LR   A,KU                ; 1c14 00
                LR   DC,H                ; 1c15 10
                LR   DC,H                ; 1c16 10
                LR   DC,H                ; 1c17 10
                LR   K,P                 ; 1c18 08
                LR   K,P                 ; 1c19 08
                LR   Q,DC                ; 1c1a 0e
                NS   $6                  ; 1c1b f6
                NS   (IS)-               ; 1c1c fe
                LR   KU,A                ; 1c1d 04
                LR   A,QU                ; 1c1e 02
                LR   A,QU                ; 1c1f 02
                LR   A,QU                ; 1c20 02
                LR   A,KL                ; 1c21 01
                LR   A,KL                ; 1c22 01
                LR   A,KL                ; 1c23 01
                LR   A,KU                ; 1c24 00
                LR   KU,A                ; 1c25 04
                LR   KU,A                ; 1c26 04
                LR   KU,A                ; 1c27 04
                LR   KU,A                ; 1c28 04
                LR   KU,A                ; 1c29 04
                LR   KU,A                ; 1c2a 04
                NS   (IS)-               ; 1c2b fe
                NS   (IS)-               ; 1c2c fe
                LR   KU,A                ; 1c2d 04
                LR   KU,A                ; 1c2e 04
                LR   KU,A                ; 1c2f 04
                LR   KU,A                ; 1c30 04
                LR   KU,A                ; 1c31 04
                LR   KU,A                ; 1c32 04
                LR   KU,A                ; 1c33 04
                LR   A,KU                ; 1c34 00
A1c35:          LR   A,KU                ; 1c35 00
                LR   A,KL                ; 1c36 01
                LR   A,KL                ; 1c37 01
                LR   A,KL                ; 1c38 01
A1c39:          LR   A,QU                ; 1c39 02
                LR   A,QU                ; 1c3a 02
                LR   A,QU                ; 1c3b 02
                BT   4,A1c39             ; 1c3c 84 fc
                LIS  $6                  ; 1c3e 76
                LR   Q,DC                ; 1c3f 0e
                LR   K,P                 ; 1c40 08
                LR   K,P                 ; 1c41 08
                LR   DC,H                ; 1c42 10
                LR   DC,H                ; 1c43 10
                LR   DC,H                ; 1c44 10
                LR   A,KU                ; 1c45 00
                LR   A,KU                ; 1c46 00
                LR   A,KU                ; 1c47 00
                LR   A,KU                ; 1c48 00
                LR   A,KU                ; 1c49 00
                LR   A,KU                ; 1c4a 00
                LR   A,KU                ; 1c4b 00
                BT   0,A1c0d             ; 1c4c 80 c0
                LISU 1                   ; 1c4e 61
A1c4f:          DS   $2                  ; 1c4f 32
                POP                      ; 1c50 1c
                PK                       ; 1c51 0c
                
                POP                      ; 1c52 1c
                LI   $40                 ; 1c53 20 40
A1c55:          LR   A,KU                ; 1c55 00
                LR   A,KU                ; 1c56 00
                LR   A,KU                ; 1c57 00
                LR   A,KL                ; 1c58 01
A1c59:          LR   A,KL                ; 1c59 01
                LR   A,QU                ; 1c5a 02
                LR   A,QU                ; 1c5b 02
                LR   A,QL                ; 1c5c 03
                LR   A,QL                ; 1c5d 03
                LR   KU,A                ; 1c5e 04
                LR   KU,A                ; 1c5f 04
                LR   KL,A                ; 1c60 05
                BT   4,A1be6             ; 1c61 84 84
                BT   4,A1cc0             ; 1c63 84 5c
                LR   A,$8                ; 1c65 48
                INS  8                   ; 1c66 a8
                LR   $4,A                ; 1c67 54
                LR   (IS),A              ; 1c68 5c
                DS   (IS)                ; 1c69 3c
                INS  4                   ; 1c6a a4
                XDC                      ; 1c6b 2c
                LR   (IS),A              ; 1c6c 5c
                LR   A,$6                ; 1c6d 46
                INS  0                   ; 1c6e a0
                DS   $2                  ; 1c6f 32
                LR   (IS),A              ; 1c70 5c
                DS   (IS)                ; 1c71 3c
                BF   $2,A1cab            ; 1c72 92 38
                LR   (IS),A              ; 1c74 5c
                LR   A,$8                ; 1c75 48
                BF   $0,A1cdb            ; 1c76 90 64
                LR   (IS),A              ; 1c78 5c
                LR   A,$0                ; 1c79 40
                BF   $0,A1cc7            ; 1c7a 90 4c
A1c7c:          LR   KU,A                ; 1c7c 04
                LR   A,KL                ; 1c7d 01
                XS   $8                  ; 1c7e e8
                LISU 0                   ; 1c7f 60
                BF   $b,A1c0d            ; 1c80 9b 8c
                LR   J,W                 ; 1c82 1e
                LR   A,$1                ; 1c83 41
                INS  6                   ; 1c84 a6
                LISU 2                   ; 1c85 62
                NS   $b                  ; 1c86 fb
                BF   $4,A1c9e            ; 1c87 94 16
                LR   A,QU                ; 1c89 02
                ASD  $8                  ; 1c8a d8
                LR   A,$0                ; 1c8b 40
                ASD  $b                  ; 1c8c db
                db   $b2                 
                IN   $42                 ; 1c8e 26 42
                DS   $5                  ; 1c90 35
                db   $a2                 
                AS   (IS)+               ; 1c92 cd
                ASD  $a                  ; 1c93 da
                IN   $02                 ; 1c94 26 02
                XM                       ; 1c96 8c
                db   $a2                 
                LR   A,(IS)-             ; 1c98 4e
                IN   $1e                 ; 1c99 26 1e
                LR   A,$1                ; 1c9b 41
                LM                       ; 1c9c 16
                LISU 2                   ; 1c9d 62
A1c9e:          NS   $b                  ; 1c9e fb
;                BF   $4,30               ; 1c9f 94 1e
				db   $94,$1e
                LR   A,$1                ; 1ca1 41
                INS  6                   ; 1ca2 a6
                XS   $0                  ; 1ca3 e0
                NS   $b                  ; 1ca4 fb
                BF   $4,A1cc4            ; 1ca5 94 1e
                AS   $7                  ; 1ca7 c7
                db   $2e                 
                DS   (IS)-               ; 1ca9 3e
                NS   $b                  ; 1caa fb
A1cab:          BF   $4,A1cca            ; 1cab 94 1e
                AS   $7                  ; 1cad c7
                ADC                      ; 1cae 8e
                DS   (IS)-               ; 1caf 3e
                NS   $b                  ; 1cb0 fb
                BF   $4,A1cd0            ; 1cb1 94 1e
                LR   A,$1                ; 1cb3 41
                LIS  $0                  ; 1cb4 70
                INS  0                   ; 1cb5 a0
                NS   $b                  ; 1cb6 fb
                BF   $4,A1cd6            ; 1cb7 94 1e
                LR   A,$1                ; 1cb9 41
                LR   A,(IS)              ; 1cba 4c
                INS  0                   ; 1cbb a0
                NS   $b                  ; 1cbc fb
                BF   $4,A1cc2            ; 1cbd 94 04
                AS   $7                  ; 1cbf c7
A1cc0:          db   $2e                 
                LR   $0,A                ; 1cc1 50
A1cc2:          BF   $b,A1c4f            ; 1cc2 9b 8c
A1cc4:          LR   KU,A                ; 1cc4 04
                AS   $7                  ; 1cc5 c7
                ADC                      ; 1cc6 8e
A1cc7:          LR   $0,A                ; 1cc7 50
                BF   $b,A1c59            ; 1cc8 9b 90
A1cca:          LR   QL,A                ; 1cca 07
                LR   A,KL                ; 1ccb 01
                LR   $0,A                ; 1ccc 50
                LR   A,$b                ; 1ccd 4b
                LR   DC,Q                ; 1cce 0f
                db   $3f                 
A1cd0:          LR   QL,A                ; 1cd0 07
                LR   A,KL                ; 1cd1 01
                LISL 5                   ; 1cd2 6d
                LR   A,$b                ; 1cd3 4b
                LR   DC,Q                ; 1cd4 0f
                db   $3f                 
A1cd6:          LR   J,W                 ; 1cd6 1e
                LR   A,$1                ; 1cd7 41
                LM                       ; 1cd8 16
                XS   $0                  ; 1cd9 e0
                NS   $b                  ; 1cda fb
A1cdb:          BF   $4,A1cec            ; 1cdb 94 10
                LR   A,KL                ; 1cdd 01
                PK                       ; 1cde 0c
                
                LI   $0c                 ; 1cdf 20 0c
                LI   $03                 ; 1ce1 20 03
A1ce3:          NS   $a                  ; 1ce3 fa
                LR   A,QL                ; 1ce4 03
                NS   (IS)-               ; 1ce5 fe
                LR   A,QL                ; 1ce6 03
                LR   A,KU                ; 1ce7 00
                LR   A,QL                ; 1ce8 03
                LR   A,QU                ; 1ce9 02
                LR   A,QL                ; 1cea 03
                LR   QU,A                ; 1ceb 06
A1cec:          NS   (IS)+               ; 1cec fd
                NS   $a                  ; 1ced fa
                NS   (IS)+               ; 1cee fd
                NS   (IS)-               ; 1cef fe
                NS   (IS)+               ; 1cf0 fd
                LR   A,KU                ; 1cf1 00
                NS   (IS)+               ; 1cf2 fd
                LR   A,QU                ; 1cf3 02
                NS   (IS)+               ; 1cf4 fd
                LR   QU,A                ; 1cf5 06
A1cf6:          LR   P,K                 ; 1cf6 09
                LR   P,K                 ; 1cf7 09
                LR   A,IS                ; 1cf8 0a
                LR   P,K                 ; 1cf9 09
                LR   A,KL                ; 1cfa 01
                LR   P,K                 ; 1cfb 09
                LR   DC,Q                ; 1cfc 0f
                LR   P,K                 ; 1cfd 09
                LR   A,QU                ; 1cfe 02
                LR   A,QU                ; 1cff 02
                LR   A,QL                ; 1d00 03
                LR   A,KU                ; 1d01 00
                LR   KU,A                ; 1d02 04
                LR   A,KL                ; 1d03 01
                LR   KL,A                ; 1d04 05
                LR   P,K                 ; 1d05 09
                LR   QU,A                ; 1d06 06
                LR   P,K                 ; 1d07 09
                BF   $0,A1d12            ; 1d08 90 09
                LR   A,KU                ; 1d0a 00
                LR   A,KU                ; 1d0b 00
                LR   KU,A                ; 1d0c 04
                LR   KU,A                ; 1d0d 04
                LR   P,K                 ; 1d0e 09
                LR   QU,A                ; 1d0f 06
                LR   A,IS                ; 1d10 0a
                LR   QU,A                ; 1d11 06
A1d12:          LR   A,KL                ; 1d12 01
                LR   QU,A                ; 1d13 06
                LR   A,QU                ; 1d14 02
                LR   QL,A                ; 1d15 07
                LR   DC,Q                ; 1d16 0f
                LR   QU,A                ; 1d17 06
                LR   KL,A                ; 1d18 05
                LR   QU,A                ; 1d19 06
                LR   QU,A                ; 1d1a 06
                LR   QU,A                ; 1d1b 06
                BF   $1,A1d23            ; 1d1c 91 06
                LR   A,KU                ; 1d1e 00
                LR   A,KL                ; 1d1f 01
                LR   A,QL                ; 1d20 03
                LR   KU,A                ; 1d21 04
                LR   P,K                 ; 1d22 09
A1d23:          LR   QU,A                ; 1d23 06
                LR   A,IS                ; 1d24 0a
                LR   QU,A                ; 1d25 06
                LR   A,KL                ; 1d26 01
                LR   QU,A                ; 1d27 06
                LR   A,QU                ; 1d28 02
                LR   K,P                 ; 1d29 08
                LR   DC,Q                ; 1d2a 0f
                LR   QU,A                ; 1d2b 06
                LR   KL,A                ; 1d2c 05
                LR   QU,A                ; 1d2d 06
                LR   QU,A                ; 1d2e 06
                LR   QU,A                ; 1d2f 06
                BF   $1,A1d37            ; 1d30 91 06
                LR   A,KU                ; 1d32 00
                LR   A,QU                ; 1d33 02
                LR   A,QL                ; 1d34 03
                LR   QL,A                ; 1d35 07
                LR   KU,A                ; 1d36 04
A1d37:          LR   K,P                 ; 1d37 08
                LR   P,K                 ; 1d38 09
                LR   KL,A                ; 1d39 05
                LR   A,IS                ; 1d3a 0a
                LR   KL,A                ; 1d3b 05
                LR   A,KL                ; 1d3c 01
                LR   KL,A                ; 1d3d 05
                LR   DC,Q                ; 1d3e 0f
                LR   KL,A                ; 1d3f 05
                LR   KL,A                ; 1d40 05
                LR   KL,A                ; 1d41 05
                LR   QU,A                ; 1d42 06
                LR   KL,A                ; 1d43 05
;                BF   $2,3                ; 1d44 92 03
				db   $92,$03
A1d46:          DS   $6                  ; 1d46 36
                AI   $34                 ; 1d47 24 34
                DS   $2                  ; 1d49 32
                OI   $20                 ; 1d4a 22 20
                LR   J,W                 ; 1d4c 1e
                LR   Q,DC                ; 1d4d 0e
                PK                       ; 1d4e 0c
                
                LR   A,IS                ; 1d4f 0a
A1d50:          POP                      ; 1d50 1c
                NS   $6                  ; 1d51 f6
                LR   A,KU                ; 1d52 00
                LR   W,J                 ; 1d53 1d
                LR   A,IS                ; 1d54 0a
                LR   A,QL                ; 1d55 03
                LR   W,J                 ; 1d56 1d
                LR   J,W                 ; 1d57 1e
                LR   KU,A                ; 1d58 04
                LR   W,J                 ; 1d59 1d
                DS   $2                  ; 1d5a 32
                LR   A,QU                ; 1d5b 02
                db   $ff                 
A1d5d:          LISU 4                   ; 1d5d 64
                LR   A,IS                ; 1d5e 0a
                LR   A,KL                ; 1d5f 01
A1d60:          EI                       ; 1d60 1b
                SL   1                   ; 1d61 13
                LR   A,KU                ; 1d62 00
                LR   A,KU                ; 1d63 00
                EI                       ; 1d64 1b
                OUT  $11                 ; 1d65 27 11
                INC                      ; 1d67 1f
                LR   A,KL                ; 1d68 01
                LR   H,DC                ; 1d69 11
                LR   QL,A                ; 1d6a 07
                SL   1                   ; 1d6b 13
                LR   P,K                 ; 1d6c 09
                NI   $04                 ; 1d6d 21 04
                LR   A,KU                ; 1d6f 00
A1d70:          NI   $0b                 ; 1d70 21 0b
                OUT  $0b                 ; 1d72 27 0b
                DS   $1                  ; 1d74 31
                LR   QL,A                ; 1d75 07
                LR   A,KU                ; 1d76 00
                LR   H,DC                ; 1d77 11
                LR   A,KU                ; 1d78 00
                EI                       ; 1d79 1b
                LR   H,DC                ; 1d7a 11
                JMP  $0b00               ; 1d7b 29 0b 00
                db   $2d                 
                LR   KL,A                ; 1d7f 05
                LR   QL,A                ; 1d80 07
                LR   KL,A                ; 1d81 05
                CI   $01                 ; 1d82 25 01
                NOP                      ; 1d84 2b
                EI                       ; 1d85 1b
                LR   A,KU                ; 1d86 00
                LR   H,DC                ; 1d87 11
                LR   A,KU                ; 1d88 00
                NOP                      ; 1d89 2b
                LR   A,QL                ; 1d8a 03
                JMP  $2d0b               ; 1d8b 29 2d 0b
                LR   P,K                 ; 1d8e 09
                LR   A,KU                ; 1d8f 00
                db   $2d                 
                LR   IS,A                ; 1d91 0b
                LR   QL,A                ; 1d92 07
                LR   P0,Q                ; 1d93 0d
                LR   IS,A                ; 1d94 0b
                LR   IS,A                ; 1d95 0b
                NOP                      ; 1d96 2b
                LR   A,KU                ; 1d97 00
                DS   $6                  ; 1d98 36
                LR   A,KU                ; 1d99 00
                POP                      ; 1d9a 1c
                LR   A,KU                ; 1d9b 00
                DS   $2                  ; 1d9c 32
                PK                       ; 1d9d 0c
                
                OI   $00                 ; 1d9e 22 00
A1da0:          SL   4                   ; 1da0 15
                LR   IS,A                ; 1da1 0b
                LR   KL,A                ; 1da2 05
                LR   A,KU                ; 1da3 00
                LR   P,K                 ; 1da4 09
                LR   A,QL                ; 1da5 03
                NOP                      ; 1da6 2b
                DI                       ; 1da7 1a
                NI   $07                 ; 1da8 21 07
                SL   1                   ; 1daa 13
                CI   $07                 ; 1dab 25 07
                LR   KL,A                ; 1dad 05
                CI   $0b                 ; 1dae 25 0b
                LR   A,KU                ; 1db0 00
                LR   A,KL                ; 1db1 01
                NOP                      ; 1db2 2b
                LR   A,KU                ; 1db3 00
                JMP  $0b21               ; 1db4 29 0b 21
                NI   $11                 ; 1db7 21 11
                EI                       ; 1db9 1b
                LR   IS,A                ; 1dba 0b
                LR   A,KU                ; 1dbb 00
                SR   1                   ; 1dbc 12
                SR   1                   ; 1dbd 12
                SR   1                   ; 1dbe 12
                SR   1                   ; 1dbf 12
                SR   1                   ; 1dc0 12
                SR   1                   ; 1dc1 12
                SR   1                   ; 1dc2 12
                SR   1                   ; 1dc3 12
                SR   1                   ; 1dc4 12
                SR   1                   ; 1dc5 12
                SR   1                   ; 1dc6 12
                SR   1                   ; 1dc7 12
                SR   1                   ; 1dc8 12
A1dc9:          SR   1                   ; 1dc9 12
                SR   1                   ; 1dca 12
                SR   1                   ; 1dcb 12
                LR   A,QL                ; 1dcc 03
                LISU 0                   ; 1dcd 60
;                BT   0,3                 ; 1dce 80 03
				db   $80,$03
                LR   A,$0                ; 1dd0 40
;                BT   0,3                 ; 1dd1 80 03
				db   $80,$03
                DS   $0                  ; 1dd3 30
;                BT   0,11                ; 1dd4 80 0b
				db   $80,$0b
                SR   1                   ; 1dd6 12
                LR   DC,H                ; 1dd7 10
                LR   IS,A                ; 1dd8 0b
                SL   1                   ; 1dd9 13
                INS  0                   ; 1dda a0
                LR   A,QL                ; 1ddb 03
                LISU 0                   ; 1ddc 60
                SR   4                   ; 1ddd 14
                LR   A,QL                ; 1dde 03
                BT   0,A1df4             ; 1ddf 80 14
                LR   A,QL                ; 1de1 03
                LISU 0                   ; 1de2 60
                SR   4                   ; 1de3 14
                LR   A,QL                ; 1de4 03
                BT   0,A1dfa             ; 1de5 80 14
                LR   A,QL                ; 1de7 03
                LISU 0                   ; 1de8 60
                SR   4                   ; 1de9 14
                LR   A,QL                ; 1dea 03
                BT   0,A1e00             ; 1deb 80 14
                db   $ff                 
A1dee:          CI   $27                 ; 1dee 25 27
                LR   H,DC                ; 1df0 11
                LR   KL,A                ; 1df1 05
                LR   IS,A                ; 1df2 0b
                LR   P,K                 ; 1df3 09
A1df4:          LR   A,KU                ; 1df4 00
                SR   4                   ; 1df5 14
                LR   A,KU                ; 1df6 00
                AI   $00                 ; 1df7 24 00
                LR   P0,Q                ; 1df9 0d
A1dfa:          SL   1                   ; 1dfa 13
                NOP                      ; 1dfb 2b
                LR   KU,A                ; 1dfc 04
                LR   A,KU                ; 1dfd 00
                LR   A,IS                ; 1dfe 0a
                LR   A,KU                ; 1dff 00
A1e00:          LR   QL,A                ; 1e00 07
                SL   1                   ; 1e01 13
                LR   A,KU                ; 1e02 00
                DS   $6                  ; 1e03 36
                LR   A,KU                ; 1e04 00
                EI                       ; 1e05 1b
                LR   H,DC                ; 1e06 11
                JMP  $0b0e               ; 1e07 29 0b 0e
                INC                      ; 1e0a 1f
                LR   W,J                 ; 1e0b 1d
                EI                       ; 1e0c 1b
                LR   J,W                 ; 1e0d 1e
                DI                       ; 1e0e 1a
                INC                      ; 1e0f 1f
                LR   J,W                 ; 1e10 1e
                LR   Q,DC                ; 1e11 0e
                db   $3f                 
                LIS  $f                  ; 1e13 7f
                LIS  $b                  ; 1e14 7b
                LIS  $5                  ; 1e15 75
                LIS  $5                  ; 1e16 75
                LIS  $b                  ; 1e17 7b
                LIS  $5                  ; 1e18 75
                LIS  $5                  ; 1e19 75
                LIS  $b                  ; 1e1a 7b
                LIS  $f                  ; 1e1b 7f
                LIS  $f                  ; 1e1c 7f
                db   $3f                 
                db   $5f                 
                LR   $0,A                ; 1e1f 50
                LR   $3,A                ; 1e20 53
                DS   $3                  ; 1e21 33
                DS   $3                  ; 1e22 33
                DS   $3                  ; 1e23 33
                DS   $7                  ; 1e24 37
                DS   $7                  ; 1e25 37
                DS   $7                  ; 1e26 37
                DS   $7                  ; 1e27 37
A1e28:          DS   $4                  ; 1e28 34
                DS   $4                  ; 1e29 34
                DS   $0                  ; 1e2a 30
                DS   $0                  ; 1e2b 30
                DS   $0                  ; 1e2c 30
                DS   $0                  ; 1e2d 30
                DS   $8                  ; 1e2e 38
A1e2f:          LR   A,$0                ; 1e2f 40
                LR   A,$0                ; 1e30 40
                LISU 0                   ; 1e31 60
                LISU 0                   ; 1e32 60
                LISU 0                   ; 1e33 60
                LISU 0                   ; 1e34 60
                XS   $0                  ; 1e35 e0
                XS   $0                  ; 1e36 e0
                XS   $0                  ; 1e37 e0
                BT   0,0                 ; 1e38 80 00
A1e3a:          LR   A,KU                ; 1e3a 00
                LR   A,KU                ; 1e3b 00
                LR   A,KU                ; 1e3c 00
                LR   A,KU                ; 1e3d 00
                LR   A,KU                ; 1e3e 00
                LR   A,KU                ; 1e3f 00
                LR   KU,A                ; 1e40 04
                PK                       ; 1e41 0c
                
                POP                      ; 1e42 1c
                DS   $8                  ; 1e43 38
                LIS  $8                  ; 1e44 78
                NS   $0                  ; 1e45 f0
                XS   $0                  ; 1e46 e0
                AS   $0                  ; 1e47 c0
                BT   0,0                 ; 1e48 80 00
                LR   A,KU                ; 1e4a 00
                LR   A,KU                ; 1e4b 00
                LR   A,KU                ; 1e4c 00
                LR   A,KU                ; 1e4d 00
                LR   A,KU                ; 1e4e 00
                LR   A,KU                ; 1e4f 00
                LR   A,KU                ; 1e50 00
                LR   A,KU                ; 1e51 00
                LR   A,KU                ; 1e52 00
                LR   A,KU                ; 1e53 00
                LR   A,KU                ; 1e54 00
                NS   (IS)                ; 1e55 fc
                NS   (IS)                ; 1e56 fc
                NS   $8                  ; 1e57 f8
                LR   A,KU                ; 1e58 00
                LR   A,KU                ; 1e59 00
                LR   A,KU                ; 1e5a 00
                LR   A,KU                ; 1e5b 00
                LR   A,KU                ; 1e5c 00
                LR   A,KU                ; 1e5d 00
                LR   A,KU                ; 1e5e 00
                LR   A,KU                ; 1e5f 00
                LR   A,KU                ; 1e60 00
                LR   A,KU                ; 1e61 00
                LR   A,KU                ; 1e62 00
                LR   A,KU                ; 1e63 00
                LR   A,KU                ; 1e64 00
                LR   A,KU                ; 1e65 00
                LR   A,KU                ; 1e66 00
                BT   0,A1e28             ; 1e67 80 c0
                XS   $0                  ; 1e69 e0
                XS   $0                  ; 1e6a e0
                LIS  $0                  ; 1e6b 70
                DS   $8                  ; 1e6c 38
                COM                      ; 1e6d 18
                LR   A,KU                ; 1e6e 00
                LR   A,KU                ; 1e6f 00
                LR   A,KU                ; 1e70 00
                LR   A,KU                ; 1e71 00
                LR   A,KU                ; 1e72 00
                LR   A,KU                ; 1e73 00
                LR   A,KU                ; 1e74 00
                LR   A,KU                ; 1e75 00
                LR   A,KU                ; 1e76 00
;                BT   0,-128              ; 1e77 80 80
				db   $80,$80
                BT   0,A1e3a             ; 1e79 80 c0
                XS   $0                  ; 1e7b e0
                XS   $0                  ; 1e7c e0
                LIS  $0                  ; 1e7d 70
                DS   $8                  ; 1e7e 38
                COM                      ; 1e7f 18
                COM                      ; 1e80 18
                DS   (IS)                ; 1e81 3c
                LIS  $e                  ; 1e82 7e
                LIS  $e                  ; 1e83 7e
                DS   (IS)                ; 1e84 3c
                COM                      ; 1e85 18
                db   $ff                 
;                BT   1,-127              ; 1e87 81 81
				db   $81,$81
                db   $ff                 
A1e8a:          LR   QU,A                ; 1e8a 06
                LR   A,KL                ; 1e8b 01
                XS   $8                  ; 1e8c e8
                LISU 0                   ; 1e8d 60
                ASD  (IS)-               ; 1e8e de
                BT   0,A1eb6             ; 1e8f 80 26
                LR   A,KL                ; 1e91 01
                LI   $50                 ; 1e92 20 50
                db   $2e                 
                LIS  $2                  ; 1e95 72
                IN   $01                 ; 1e96 26 01
                DS   (IS)                ; 1e98 3c
                OUTS 0                   ; 1e99 b0
                AS   (IS)-               ; 1e9a ce
                LIS  $2                  ; 1e9b 72
                IN   $02                 ; 1e9c 26 02
                db   $2e                 
                db   $a2                 
                AS   (IS)+               ; 1ea0 cd
                ASD  $a                  ; 1ea1 da
                IN   $02                 ; 1ea2 26 02
                XM                       ; 1ea4 8c
                db   $a2                 
                db   $2e                 
                IN   $26                 ; 1ea7 26 26
                LR   A,KL                ; 1ea9 01
                INS  4                   ; 1eaa a4
                LR   $0,A                ; 1eab 50
                AS   (IS)+               ; 1eac cd
                DS   $8                  ; 1ead 38
                LR   A,$0                ; 1eae 40
                LR   A,$1                ; 1eaf 41
                LI   $d0                 ; 1eb0 20 d0
                LR   $0,A                ; 1eb2 50
                LR   A,KU                ; 1eb3 00
                LR   A,$0                ; 1eb4 40
                LR   A,$1                ; 1eb5 41
A1eb6:          LI   $90                 ; 1eb6 20 90
                LR   $0,A                ; 1eb8 50
                LR   A,KU                ; 1eb9 00
                LR   A,$0                ; 1eba 40
                LR   A,$1                ; 1ebb 41
                INS  4                   ; 1ebc a4
                BF   $0,A1f0e            ; 1ebd 90 50
                LR   A,KU                ; 1ebf 00
                LR   A,$0                ; 1ec0 40
                LR   A,$1                ; 1ec1 41
                INS  4                   ; 1ec2 a4
                ASD  $0                  ; 1ec3 d0
                LR   $0,A                ; 1ec4 50
                LR   A,KU                ; 1ec5 00
                LR   A,QL                ; 1ec6 03
                BF   $0,A1f28            ; 1ec7 90 60
                NS   $1                  ; 1ec9 f1
                LR   J,W                 ; 1eca 1e
                BT   7,A1ecf             ; 1ecb 87 03
                AS   $1                  ; 1ecd c1
                XS   $0                  ; 1ece e0
A1ecf:          LR   A,$0                ; 1ecf 40
                LR   J,W                 ; 1ed0 1e
                BT   0,A1ed5             ; 1ed1 80 03
                AS   $1                  ; 1ed3 c1
                ASD  $8                  ; 1ed4 d8
A1ed5:          LR   A,$0                ; 1ed5 40
                LR   J,W                 ; 1ed6 1e
                BT   0,A1edf             ; 1ed7 80 07
                LR   A,KL                ; 1ed9 01
                DS   $0                  ; 1eda 30
                PI   $0f3f               ; 1edb 28 0f 3f
                LR   QL,A                ; 1ede 07
A1edf:          LR   A,KL                ; 1edf 01
                BT   0,A1f09             ; 1ee0 80 28
                LR   DC,Q                ; 1ee2 0f
                db   $3f                 
                LR   A,QL                ; 1ee4 03
                BF   $0,A1f46            ; 1ee5 90 60
                DS   $2                  ; 1ee7 32
                LR   J,W                 ; 1ee8 1e
                BT   6,A1f10             ; 1ee9 86 26
                LR   A,KL                ; 1eeb 01
;                BT   0,-80               ; 1eec 80 b0
				db   $80,$b0
                db   $2d                 
                DS   $8                  ; 1eef 38
                LR   A,KL                ; 1ef0 01
                LR   A,KU                ; 1ef1 00
                LR   A,QU                ; 1ef2 02
                LR   P0,Q                ; 1ef3 0d
                LR   A,QL                ; 1ef4 03
                LR   Q,DC                ; 1ef5 0e
A1ef6:          LR   KU,A                ; 1ef6 04
                LR   DC,Q                ; 1ef7 0f
                LR   KL,A                ; 1ef8 05
                LR   A,KL                ; 1ef9 01
                LR   QU,A                ; 1efa 06
                LR   P,K                 ; 1efb 09
                LR   QL,A                ; 1efc 07
                LR   P,K                 ; 1efd 09
                LR   K,P                 ; 1efe 08
                LR   P,K                 ; 1eff 09
                LR   P,K                 ; 1f00 09
                LR   P,K                 ; 1f01 09
                LR   A,IS                ; 1f02 0a
                LR   P,K                 ; 1f03 09
                LR   DC,Q                ; 1f04 0f
                LR   P,K                 ; 1f05 09
                BF   $4,A1f1b            ; 1f06 94 14
                LR   A,KU                ; 1f08 00
A1f09:          LR   A,IS                ; 1f09 0a
                LR   A,KL                ; 1f0a 01
                LR   IS,A                ; 1f0b 0b
                LR   A,QL                ; 1f0c 03
                SR   1                   ; 1f0d 12
A1f0e:          LR   KU,A                ; 1f0e 04
                SL   1                   ; 1f0f 13
A1f10:          LR   KL,A                ; 1f10 05
                LR   DC,H                ; 1f11 10
                LR   QU,A                ; 1f12 06
                LR   IS,A                ; 1f13 0b
                LR   QL,A                ; 1f14 07
                LR   IS,A                ; 1f15 0b
                LR   K,P                 ; 1f16 08
                LR   DC,H                ; 1f17 10
                LR   P,K                 ; 1f18 09
                LR   DC,H                ; 1f19 10
                LR   A,IS                ; 1f1a 0a
A1f1b:          LR   QU,A                ; 1f1b 06
                LR   DC,Q                ; 1f1c 0f
                LR   QU,A                ; 1f1d 06
                BF   $3,A1f25            ; 1f1e 93 06
                LR   A,KU                ; 1f20 00
                LR   A,IS                ; 1f21 0a
                LR   A,KL                ; 1f22 01
                LR   QU,A                ; 1f23 06
                LR   A,QU                ; 1f24 02
A1f25:          LR   H,DC                ; 1f25 11
                LR   KU,A                ; 1f26 04
                SL   1                   ; 1f27 13
A1f28:          LR   KL,A                ; 1f28 05
                LR   DC,H                ; 1f29 10
                LR   QU,A                ; 1f2a 06
                LR   QU,A                ; 1f2b 06
                LR   QL,A                ; 1f2c 07
                LR   QU,A                ; 1f2d 06
                LR   K,P                 ; 1f2e 08
                LR   DC,H                ; 1f2f 10
                LR   P,K                 ; 1f30 09
                LR   DC,H                ; 1f31 10
                LR   A,IS                ; 1f32 0a
                LR   QU,A                ; 1f33 06
                LR   DC,Q                ; 1f34 0f
                LR   QU,A                ; 1f35 06
                BF   $3,A1f3d            ; 1f36 93 06
                LR   A,KU                ; 1f38 00
                LR   A,IS                ; 1f39 0a
                LR   A,KL                ; 1f3a 01
                LR   IS,A                ; 1f3b 0b
                LR   A,QU                ; 1f3c 02
A1f3d:          LR   H,DC                ; 1f3d 11
                LR   A,QL                ; 1f3e 03
                SR   1                   ; 1f3f 12
                LR   KL,A                ; 1f40 05
                LR   QU,A                ; 1f41 06
                LR   QU,A                ; 1f42 06
                LR   IS,A                ; 1f43 0b
                LR   QL,A                ; 1f44 07
                LR   IS,A                ; 1f45 0b
A1f46:          LR   K,P                 ; 1f46 08
                LR   QU,A                ; 1f47 06
                LR   P,K                 ; 1f48 09
A1f49:          LR   QU,A                ; 1f49 06
                LR   A,IS                ; 1f4a 0a
                LR   QU,A                ; 1f4b 06
                LR   DC,Q                ; 1f4c 0f
                LR   QU,A                ; 1f4d 06
;                BF   $3,6                ; 1f4e 93 06
				db   $93,$06
A1f50:          LR   J,W                 ; 1f50 1e
                NS   $0                  ; 1f51 f0
                LR   A,KU                ; 1f52 00
                INC                      ; 1f53 1f
                LI   $03                 ; 1f54 20 03
                INC                      ; 1f56 1f
                DS   $8                  ; 1f57 38
                LR   KU,A                ; 1f58 04
                INC                      ; 1f59 1f
                LR   K,P                 ; 1f5a 08
                LR   A,QU                ; 1f5b 02
                db   $ff                 
                LR   A,KL                ; 1f5d 01
                BT   0,A1f62             ; 1f5e 80 03
                AS   $0                  ; 1f60 c0
                INC                      ; 1f61 1f
A1f62:          NS   $8                  ; 1f62 f8
                db   $ff                 
                db   $ff                 
                INS  10                  ; 1f65 aa
                LR   $5,A                ; 1f66 55
                db   $ff                 
                db   $ff                 
                INC                      ; 1f69 1f
                NS   $8                  ; 1f6a f8
                LR   A,QL                ; 1f6b 03
                AS   $0                  ; 1f6c c0
                LR   A,KL                ; 1f6d 01
                BT   0,0                 ; 1f6e 80 00
                LR   A,KU                ; 1f70 00
A1f71:          LR   A,KL                ; 1f71 01
                BT   0,A1ef6             ; 1f72 80 83
                AS   $1                  ; 1f74 c1
                LR   A,$7                ; 1f75 47
                XS   $2                  ; 1f76 e2
                db   $2f                 
                NS   $4                  ; 1f78 f4
                INC                      ; 1f79 1f
                NS   $8                  ; 1f7a f8
                LIS  $5                  ; 1f7b 75
                INS  14                  ; 1f7c ae
                db   $df                 
                NS   $b                  ; 1f7e fb
                LIS  $5                  ; 1f7f 75
                INS  14                  ; 1f80 ae
                INC                      ; 1f81 1f
                NS   $8                  ; 1f82 f8
                db   $2f                 
                NS   $4                  ; 1f84 f4
                LR   A,$7                ; 1f85 47
                XS   $2                  ; 1f86 e2
                BT   3,A1f49             ; 1f87 83 c1
                LR   A,KL                ; 1f89 01
                BT   0,0                 ; 1f8a 80 00
                LR   A,KU                ; 1f8c 00
A1f8d:          LR   A,QU                ; 1f8d 02
                LR   A,KL                ; 1f8e 01
                XS   $8                  ; 1f8f e8
                LISU 0                   ; 1f90 60
                BF   $0,0                ; 1f91 90 00
                PI   $0148               ; 1f93 28 01 48
                AS   $4                  ; 1f96 c4
                ASD  $0                  ; 1f97 d0
                LR   A,KU                ; 1f98 00
A1f99:          LR   Q,DC                ; 1f99 0e
                LR   A,$2                ; 1f9a 42
                ASD  $8                  ; 1f9b d8
                LR   A,$0                ; 1f9c 40
                db   $df                 
                LIS  $1                  ; 1f9e 71
                LR   A,IS                ; 1f9f 0a
                LR   A,$2                ; 1fa0 42
                LM                       ; 1fa1 16
                XM                       ; 1fa2 8c
                db   $5f                 
                LR   (IS)+,A             ; 1fa4 5d
                LR   A,IS                ; 1fa5 0a
                LR   A,$2                ; 1fa6 42
                db   $a2                 
                XM                       ; 1fa8 8c
                OUTS 15                  ; 1fa9 bf
                LR   (IS)+,A             ; 1faa 5d
                PK                       ; 1fab 0c
                
                LR   KU,A                ; 1fac 04
                BF   $4,A1ffa            ; 1fad 94 4c
                OUTS 0                   ; 1faf b0
                LR   A,KU                ; 1fb0 00
                DS   $0                  ; 1fb1 30
                LR   A,$1                ; 1fb2 41
                DCI  $8c30               ; 1fb3 2a 8c 30
                LR   A,KU                ; 1fb6 00
                LR   P,K                 ; 1fb7 09
                LR   A,KL                ; 1fb8 01
                AS   $8                  ; 1fb9 c8
                DS   $5                  ; 1fba 35
                LR   DC,H                ; 1fbb 10
                LR   A,KU                ; 1fbc 00
                LR   P,K                 ; 1fbd 09
                LR   A,KL                ; 1fbe 01
                AS   $8                  ; 1fbf c8
                XS   $0                  ; 1fc0 e0
                LR   DC,H                ; 1fc1 10
                LR   A,KU                ; 1fc2 00
                PI   $016c               ; 1fc3 28 01 6c
                LR   $8,A                ; 1fc6 58
                LIS  $0                  ; 1fc7 70
                LR   A,KU                ; 1fc8 00
                PK                       ; 1fc9 0c
                
                LR   A,$4                ; 1fca 44
                OI   $cc                 ; 1fcb 22 cc
                ASD  $0                  ; 1fcd d0
                LR   A,KU                ; 1fce 00
                LR   A,QU                ; 1fcf 02
                LR   A,KL                ; 1fd0 01
                AS   $8                  ; 1fd1 c8
                LISU 0                   ; 1fd2 60
                LR   DC,H                ; 1fd3 10
                LR   A,KU                ; 1fd4 00
                LR   A,QU                ; 1fd5 02
                LR   A,KL                ; 1fd6 01
                AS   $8                  ; 1fd7 c8
                BT   0,A1fe9             ; 1fd8 80 10
                LR   A,KU                ; 1fda 00
                LR   QL,A                ; 1fdb 07
                LR   A,KL                ; 1fdc 01
                DS   $0                  ; 1fdd 30
                XDC                      ; 1fde 2c
                LR   DC,Q                ; 1fdf 0f
                db   $3f                 
                LR   QL,A                ; 1fe1 07
                LR   A,KL                ; 1fe2 01
;                BT   0,44                ; 1fe3 80 2c
				db   $80,$2c
                LR   DC,Q                ; 1fe5 0f
                db   $3f                 
                DS   $0                  ; 1fe7 30
                LR   A,$1                ; 1fe8 41
A1fe9:          XM                       ; 1fe9 8c
                AM                       ; 1fea 88
                OUTS 0                   ; 1feb b0
                LR   A,KU                ; 1fec 00
A1fed:          PK                       ; 1fed 0c

                BF   $8,0                ; 1fee 98 00
                PK                       ; 1ff0 0c
                
                INS  12                  ; 1ff1 ac
                LR   A,QL                ; 1ff2 03
                PK                       ; 1ff3 0c
                
                AS   $0                  ; 1ff4 c0
                LR   KU,A                ; 1ff5 04
                PK                       ; 1ff6 0c
                
                ASD  $4                  ; 1ff7 d4
                LR   A,QU                ; 1ff8 02
                db   $ff                 
A1ffa:          LR   A,KU                ; 1ffa 00
                LR   A,KU                ; 1ffb 00
                LR   A,KU                ; 1ffc 00
                LR   A,KU                ; 1ffd 00
                LR   A,KU                ; 1ffe 00
                LR   A,KU                ; 1fff 00
