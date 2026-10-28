; Videobrain Demonstration Cart
org $1000

                INS  10                  ; 1000 aa
                LR   $5,A                ; 1001 55
                LR   KU,A                ; 1002 04
                LR   A,KU                ; 1003 00
                INC                      ; 1004 1f
                LR   IS,A                ; 1005 0b
                JMP  A132b               ; 1006 29 13 2b
                NI   $07                 ; 1009 21 07
                LR   P,K                 ; 100b 09
                LR   H,DC                ; 100c 11
                LR   QL,A                ; 100d 07
                LR   A,KL                ; 100e 01
                SL   1                   ; 100f 13
                NOP                      ; 1010 2b
                LR   A,KU                ; 1011 00
                DCI  $0fe6               ; 1012 2a 0f e6
                LI   $10                 ; 1015 20 10
                ST                       ; 1017 17
                LI   $42                 ; 1018 20 42
                ST                       ; 101a 17
                LI   $2e                 ; 101b 20 2e
                LR   $1,A                ; 101d 51
                DCI  $0c00               ; 101e 2a 0c 00
                LIS  $0                  ; 1021 70
A1022:          ST                       ; 1022 17
                DS   $1                  ; 1023 31
                BF   $4,A1022            ; 1024 94 fd
                DCI  $0c1e               ; 1026 2a 0c 1e
                LI   $64                 ; 1029 20 64
                ST                       ; 102b 17
                NOP                      ; 102c 2b
                NOP                      ; 102d 2b
                NOP                      ; 102e 2b
                NOP                      ; 102f 2b
                NOP                      ; 1030 2b
                LI   $ff                 ; 1031 20 ff
                DCI  $0c00               ; 1033 2a 0c 00
                ST                       ; 1036 17
                DCI  A1a96               ; 1037 2a 1a 96
                LR   Q,DC                ; 103a 0e
                DCI  $0c01               ; 103b 2a 0c 01
                LR   A,QU                ; 103e 02
                ST                       ; 103f 17
                LR   A,QL                ; 1040 03
                ST                       ; 1041 17
                PI   $40d0               ; 1042 28 40 d0
A1045:          PI   $45db               ; 1045 28 45 db
                DCI  $0878               ; 1048 2a 08 78
                LI   $88                 ; 104b 20 88
                ST                       ; 104d 17
                DCI  $08f7               ; 104e 2a 08 f7
                LI   $64                 ; 1051 20 64
                ST                       ; 1053 17
                DCI  $0fea               ; 1054 2a 0f ea
                ST                       ; 1057 17
A1058:          DCI  $0c00               ; 1058 2a 0c 00
                LM                       ; 105b 16
                INC                      ; 105c 1f
                DCI  $0c00               ; 105d 2a 0c 00
                ST                       ; 1060 17
                CI   $16                 ; 1061 25 16
                BF   $4,A1068            ; 1063 94 04
                JMP  $4000               ; 1065 29 40 00
A1068:          LR   $0,A                ; 1068 50
                LIS  $b                  ; 1069 7b
                LR   $1,A                ; 106a 51
                LR   A,$0                ; 106b 40
                DCI  A19a3               ; 106c 2a 19 a3
A106f:          ADC                      ; 106f 8e
                DS   $1                  ; 1070 31
                BF   $4,A106f            ; 1071 94 fd
                LM                       ; 1073 16
                LR   H,DC                ; 1074 11
                LR   (IS),A              ; 1075 5c
                DCI  $0c01               ; 1076 2a 0c 01
                LM                       ; 1079 16
                LR   QU,A                ; 107a 06
                LM                       ; 107b 16
                LR   QL,A                ; 107c 07
                LR   DC,Q                ; 107d 0f
                XDC                      ; 107e 2c
                DCI  $0f3f               ; 107f 2a 0f 3f
                PI   A15c5               ; 1082 28 15 c5
                LR   Q,DC                ; 1085 0e
                DCI  $0c01               ; 1086 2a 0c 01
                LR   A,QU                ; 1089 02
                ST                       ; 108a 17
                LR   A,QL                ; 108b 03
                ST                       ; 108c 17
                LR   DC,H                ; 108d 10
                LM                       ; 108e 16
                LR   H,DC                ; 108f 11
                XDC                      ; 1090 2c
                DCI  $08f5               ; 1091 2a 08 f5
                ST                       ; 1094 17
                LIS  $7                  ; 1095 77
                LR   $1,A                ; 1096 51
                LR   $2,A                ; 1097 52
                DCI  $0fba               ; 1098 2a 0f ba
                PI   A10a0               ; 109b 28 10 a0
                BF   $0,A10b3            ; 109e 90 14
A10a0:          LR   Q,DC                ; 10a0 0e
                LI   $0f                 ; 10a1 20 0f
                NM                       ; 10a3 8a
                LR   DC,Q                ; 10a4 0f
                ST                       ; 10a5 17
                XDC                      ; 10a6 2c
                LM                       ; 10a7 16
                NI   $f0                 ; 10a8 21 f0
                XDC                      ; 10aa 2c
                LR   DC,Q                ; 10ab 0f
                OM                       ; 10ac 8b
                LR   DC,Q                ; 10ad 0f
                ST                       ; 10ae 17
                DS   $1                  ; 10af 31
                BF   $4,A10a0            ; 10b0 94 ef
                POP                      ; 10b2 1c
A10b3:          LR   DC,H                ; 10b3 10
                XDC                      ; 10b4 2c
                DCI  $0820               ; 10b5 2a 08 20
A10b8:          XDC                      ; 10b8 2c
                LM                       ; 10b9 16
                XDC                      ; 10ba 2c
                SL   4                   ; 10bb 15
                LR   $0,A                ; 10bc 50
                LR   H,DC                ; 10bd 11
                LM                       ; 10be 16
                XS   $0                  ; 10bf e0
                LR   DC,H                ; 10c0 10
                ST                       ; 10c1 17
                DS   $2                  ; 10c2 32
                BF   $4,A10b8            ; 10c3 94 f4
                XDC                      ; 10c5 2c
                LM                       ; 10c6 16
                LR   $3,A                ; 10c7 53
A10c8:          LIS  $0                  ; 10c8 70
                XM                       ; 10c9 8c
                DCI  $0c04               ; 10ca 2a 0c 04
                BT   1,A10e6             ; 10cd 81 18
                COM                      ; 10cf 18
                ST                       ; 10d0 17
                CI   $0c                 ; 10d1 25 0c
                BF   $4,A10e1            ; 10d3 94 0d
                PI   A160e               ; 10d5 28 16 0e
                DCI  $0870               ; 10d8 2a 08 70
                LIS  $0                  ; 10db 70
                ST                       ; 10dc 17
                INC                      ; 10dd 1f
                ST                       ; 10de 17
                INC                      ; 10df 1f
                ST                       ; 10e0 17
A10e1:          LI   $ff                 ; 10e1 20 ff
                LR   $3,A                ; 10e3 53
                BF   $0,A10e7            ; 10e4 90 02
A10e6:          ST                       ; 10e6 17
A10e7:          PI   A1107               ; 10e7 28 11 07
                LIS  $0                  ; 10ea 70
                XS   $3                  ; 10eb e3
                BF   $1,A10f6            ; 10ec 91 09
A10ee:          PI   $43d6               ; 10ee 28 43 d6
                BF   $1,A10ee            ; 10f1 91 fc
                DS   $3                  ; 10f3 33
                BF   $4,A10ee            ; 10f4 94 f9
A10f6:          DCI  $0c04               ; 10f6 2a 0c 04
                LM                       ; 10f9 16
                LR   $7,A                ; 10fa 57
                JMP  A170e               ; 10fb 29 17 0e
A10fe:          PI   A131c               ; 10fe 28 13 1c
                PI   $41d5               ; 1101 28 41 d5
                JMP  A1058               ; 1104 29 10 58
A1107:          LR   K,P                 ; 1107 08
                PI   $40a9               ; 1108 28 40 a9
                LISL 4                   ; 110b 6c
                LI   $70                 ; 110c 20 70
                LR   (IS),A              ; 110e 5c
                DCI  $0f3f               ; 110f 2a 0f 3f
                PI   $4205               ; 1112 28 42 05
                PI   $40bc               ; 1115 28 40 bc
                PK                       ; 1118 0c
                DCI  $0d12               ; 1119 2a 0d 12
                LIS  $9                  ; 111c 79
                LR   $1,A                ; 111d 51
                PI   A1147               ; 111e 28 11 47
                LIS  $7                  ; 1121 77
                LR   $1,A                ; 1122 51
                PI   A1147               ; 1123 28 11 47
                LIS  $5                  ; 1126 75
                LR   $1,A                ; 1127 51
                PI   A1147               ; 1128 28 11 47
A112b:          LIS  $1                  ; 112b 71
                LR   $3,A                ; 112c 53
                DCI  $0c04               ; 112d 2a 0c 04
                LIS  $0                  ; 1130 70
                ST                       ; 1131 17
                DCI  $0c1e               ; 1132 2a 0c 1e
                LI   $64                 ; 1135 20 64
                ST                       ; 1137 17
                LIS  $2                  ; 1138 72
                LR   $1,A                ; 1139 51
A113a:          LIS  $0                  ; 113a 70
                LR   $5,A                ; 113b 55
                LIS  $6                  ; 113c 76
                LR   $6,A                ; 113d 56
                PI   A161d               ; 113e 28 16 1d
                DS   $1                  ; 1141 31
                BF   $4,A113a            ; 1142 94 f7
                JMP  A1058               ; 1144 29 10 58
A1147:          LR   A,$1                ; 1147 41
                COM                      ; 1148 18
                INC                      ; 1149 1f
                AI   $10                 ; 114a 24 10
                LR   $3,A                ; 114c 53
                LIS  $7                  ; 114d 77
                LR   $0,A                ; 114e 50
A114f:          LR   A,$1                ; 114f 41
                LR   $2,A                ; 1150 52
                LI   $ff                 ; 1151 20 ff
A1153:          ST                       ; 1153 17
                DS   $2                  ; 1154 32
                BF   $4,A1153            ; 1155 94 fd
                LR   A,$3                ; 1157 43
                ADC                      ; 1158 8e
                DS   $0                  ; 1159 30
                BF   $4,A114f            ; 115a 94 f4
                POP                      ; 115c 1c
                LI   $10                 ; 115d 20 10
                LR   $6,A                ; 115f 56
                LI   $4b                 ; 1160 20 4b
                LR   $5,A                ; 1162 55
                PI   A161d               ; 1163 28 16 1d
                NOP                      ; 1166 2b
                NOP                      ; 1167 2b
                NOP                      ; 1168 2b
                JMP  A10fe               ; 1169 29 10 fe
                DCI  $0e10               ; 116c 2a 0e 10
                XDC                      ; 116f 2c
                DCI  $0ecf               ; 1170 2a 0e cf
                LIS  $7                  ; 1173 77
                LR   $1,A                ; 1174 51
A1175:          XDC                      ; 1175 2c
                LIS  $9                  ; 1176 79
                LR   (IS),A              ; 1177 5c
                PI   $43cd               ; 1178 28 43 cd
                XDC                      ; 117b 2c
                LIS  $7                  ; 117c 77
                ADC                      ; 117d 8e
                DS   $1                  ; 117e 31
                BF   $4,A1175            ; 117f 94 f5
                PI   A11b7               ; 1181 28 11 b7
                PI   A11e6               ; 1184 28 11 e6
                DCI  $08f7               ; 1187 2a 08 f7
                LI   $65                 ; 118a 20 65
                ST                       ; 118c 17
                DCI  $0fea               ; 118d 2a 0f ea
                ST                       ; 1190 17
                LISU 3                   ; 1191 63
                LISL 0                   ; 1192 68
                LI   $ff                 ; 1193 20 ff
                LR   (IS)+,A             ; 1195 5d
                LI   $f0                 ; 1196 20 f0
                LR   (IS)+,A             ; 1198 5d
                LIS  $0                  ; 1199 70
                LR   (IS)+,A             ; 119a 5d
                LR   (IS)+,A             ; 119b 5d
                LR   (IS)+,A             ; 119c 5d
                LR   (IS)+,A             ; 119d 5d
                LI   $0f                 ; 119e 20 0f
                LR   (IS)+,A             ; 11a0 5d
                LI   $ff                 ; 11a1 20 ff
                LR   (IS)+,A             ; 11a3 5d
                LISU 4                   ; 11a4 64
                LISL 0                   ; 11a5 68
                LIS  $0                  ; 11a6 70
                LR   (IS)+,A             ; 11a7 5d
                LR   (IS)+,A             ; 11a8 5d
                LR   (IS)+,A             ; 11a9 5d
                LR   (IS)+,A             ; 11aa 5d
                PI   A1201               ; 11ab 28 12 01
                PI   $43d6               ; 11ae 28 43 d6
                PI   A131c               ; 11b1 28 13 1c
                JMP  A1045               ; 11b4 29 10 45
A11b7:          LR   K,P                 ; 11b7 08
                PI   $40a9               ; 11b8 28 40 a9
                LI   $ff                 ; 11bb 20 ff
                LR   $3,A                ; 11bd 53
                DCI  $0c30               ; 11be 2a 0c 30
                LIS  $2                  ; 11c1 72
                LR   $4,A                ; 11c2 54
                LIS  $6                  ; 11c3 76
A11c4:          LR   $0,A                ; 11c4 50
A11c5:          LIS  $a                  ; 11c5 7a
                LR   $1,A                ; 11c6 51
A11c7:          LIS  $4                  ; 11c7 74
                LR   $2,A                ; 11c8 52
A11c9:          LR   A,$3                ; 11c9 43
                ST                       ; 11ca 17
                COM                      ; 11cb 18
                ST                       ; 11cc 17
                DS   $2                  ; 11cd 32
                BF   $4,A11c9            ; 11ce 94 fa
                DS   $1                  ; 11d0 31
                BF   $4,A11c7            ; 11d1 94 f5
                LR   A,$3                ; 11d3 43
                COM                      ; 11d4 18
                LR   $3,A                ; 11d5 53
                DS   $0                  ; 11d6 30
                BF   $4,A11c5            ; 11d7 94 ed
                DS   $4                  ; 11d9 34
                BT   4,A11e2             ; 11da 84 07
                DCI  $0f10               ; 11dc 2a 0f 10
                LIS  $2                  ; 11df 72
                BF   $0,A11c4            ; 11e0 90 e3
A11e2:          PI   $40bc               ; 11e2 28 40 bc
                PK                       ; 11e5 0c
A11e6:          LR   K,P                 ; 11e6 08
                PI   $40a9               ; 11e7 28 40 a9
                LIS  $0                  ; 11ea 70
                LR   $1,A                ; 11eb 51
                LIS  $3                  ; 11ec 73
                LR   $2,A                ; 11ed 52
                DCI  A1869               ; 11ee 2a 18 69
                LR   H,DC                ; 11f1 11
                DCI  A185a               ; 11f2 2a 18 5a
                PI   A16c8               ; 11f5 28 16 c8
                DCI  $08f5               ; 11f8 2a 08 f5
                LIS  $0                  ; 11fb 70
                ST                       ; 11fc 17
                PI   $40bc               ; 11fd 28 40 bc
                PK                       ; 1200 0c
A1201:          LISU 3                   ; 1201 63
                LIS  $1                  ; 1202 71
                LR   $4,A                ; 1203 54
                XDC                      ; 1204 2c
                DCI  $0f0f               ; 1205 2a 0f 0f
                LM                       ; 1208 16
                XDC                      ; 1209 2c
                LR   $7,A                ; 120a 57
                LR   A,$b                ; 120b 4b
                SR   4                   ; 120c 14
                AI   $ff                 ; 120d 24 ff
                LR   A,$7                ; 120f 47
                BT   4,A1213             ; 1210 84 02
                COM                      ; 1212 18
A1213:          LR   $7,A                ; 1213 57
                NS   $7                  ; 1214 f7
                LISL 7                   ; 1215 6f
                BT   4,A1219             ; 1216 84 02
                LISL 0                   ; 1218 68
A1219:          LIS  $3                  ; 1219 73
                LR   $1,A                ; 121a 51
A121b:          LR   K,P                 ; 121b 08
                LIS  $7                  ; 121c 77
                LR   $2,A                ; 121d 52
                DCI  A1875               ; 121e 2a 18 75
                LR   A,$1                ; 1221 41
                SL   1                   ; 1222 13
                ADC                      ; 1223 8e
                LM                       ; 1224 16
                LR   QU,A                ; 1225 06
                LM                       ; 1226 16
                LR   QL,A                ; 1227 07
                LR   A,$7                ; 1228 47
                NS   $7                  ; 1229 f7
                BT   4,A1238             ; 122a 84 0d
                LR   A,(IS)+             ; 122c 4d
                BF   $0,A1231            ; 122d 90 03
A122f:          LR   A,$3                ; 122f 43
                SL   1                   ; 1230 13
A1231:          LR   $3,A                ; 1231 53
                NI   $80                 ; 1232 21 80
                BT   4,A126e             ; 1234 84 39
                BF   $0,A1241            ; 1236 90 0a
A1238:          LR   A,(IS)-             ; 1238 4e
                BF   $0,A123d            ; 1239 90 03
A123b:          LR   A,$3                ; 123b 43
                SR   1                   ; 123c 12
A123d:          LIS  $1                  ; 123d 71
                NS   $3                  ; 123e f3
                BT   4,A126e             ; 123f 84 2e
A1241:          DCI  A187d               ; 1241 2a 18 7d
                LR   A,$2                ; 1244 42
                ADC                      ; 1245 8e
                LM                       ; 1246 16
                LR   DC,Q                ; 1247 0f
                ADC                      ; 1248 8e
                LR   A,$4                ; 1249 44
                NS   $4                  ; 124a f4
                BF   $1,A125d            ; 124b 91 11
                LIS  $4                  ; 124d 74
                LR   $5,A                ; 124e 55
                LI   $20                 ; 124f 20 20
                ADC                      ; 1251 8e
                XDC                      ; 1252 2c
                DCI  A188d               ; 1253 2a 18 8d
                BT   4,A1265             ; 1256 84 0e
                DCI  A1888               ; 1258 2a 18 88
                BF   $0,A1265            ; 125b 90 09
A125d:          LIS  $2                  ; 125d 72
                LR   $5,A                ; 125e 55
                LIS  $8                  ; 125f 78
                ADC                      ; 1260 8e
                XDC                      ; 1261 2c
                DCI  A1885               ; 1262 2a 18 85
A1265:          LM                       ; 1265 16
                XDC                      ; 1266 2c
                ST                       ; 1267 17
                LIS  $7                  ; 1268 77
                ADC                      ; 1269 8e
                XDC                      ; 126a 2c
                DS   $5                  ; 126b 35
                BT   1,A1265             ; 126c 81 f8
A126e:          DS   $2                  ; 126e 32
                BF   $1,A1277            ; 126f 91 07
                LR   A,$7                ; 1271 47
                NS   $7                  ; 1272 f7
                BT   4,A123b             ; 1273 84 c7
                BF   $0,A122f            ; 1275 90 b9
A1277:          DS   $1                  ; 1277 31
                BT   1,A121b             ; 1278 81 a2
                LR   A,$4                ; 127a 44
                NS   $4                  ; 127b f4
                BF   $1,A128a            ; 127c 91 0d
                DS   $4                  ; 127e 34
                BT   1,A1219             ; 127f 81 99
                LISU 4                   ; 1281 64
                LR   A,$7                ; 1282 47
                NS   $7                  ; 1283 f7
                LISL 3                   ; 1284 6b
                BT   4,A1219             ; 1285 84 93
                LISL 0                   ; 1287 68
                BF   $0,A1219            ; 1288 90 90
A128a:          PK                       ; 128a 0c
                PI   $40d0               ; 128b 28 40 d0
                DCI  $08f7               ; 128e 2a 08 f7
                LIS  $0                  ; 1291 70
                ST                       ; 1292 17
                DCI  $0fe2               ; 1293 2a 0f e2
                ST                       ; 1296 17
                DCI  $0fc2               ; 1297 2a 0f c2
                ST                       ; 129a 17
                PI   $41c8               ; 129b 28 41 c8
                DCI  $2661               ; 129e 2a 26 61
                XDC                      ; 12a1 2c
                DCI  $800                ; 12a2 2a 08 00
                LIS  $5                  ; 12a5 75
                LR   $8,A                ; 12a6 58
A12a7:          LIS  $f                  ; 12a7 7f
                LR   (IS),A              ; 12a8 5c
                XDC                      ; 12a9 2c
                LM                       ; 12aa 16
                XDC                      ; 12ab 2c
A12ac:          ST                       ; 12ac 17
                DS   (IS)                ; 12ad 3c
                BT   1,A12ac             ; 12ae 81 fd
                DS   $8                  ; 12b0 38
                BF   $4,A12a7            ; 12b1 94 f5
                LI   $10                 ; 12b3 20 10
                LR   (IS),A              ; 12b5 5c
                PI   $43cd               ; 12b6 28 43 cd
                DCI  $0870               ; 12b9 2a 08 70
                LIS  $f                  ; 12bc 7f
                LR   $8,A                ; 12bd 58
A12be:          LR   A,$8                ; 12be 48
                ST                       ; 12bf 17
                DS   $8                  ; 12c0 38
                BT   1,A12be             ; 12c1 81 fc
                LIS  $8                  ; 12c3 78
                LR   $8,A                ; 12c4 58
                DCI  $0828               ; 12c5 2a 08 28
A12c8:          LR   H,DC                ; 12c8 11
                LI   $60                 ; 12c9 20 60
                XM                       ; 12cb 8c
                LR   DC,H                ; 12cc 10
                ST                       ; 12cd 17
                DS   $8                  ; 12ce 38
                BF   $4,A12c8            ; 12cf 94 f8
                DCI  $2676               ; 12d1 2a 26 76
                XDC                      ; 12d4 2c
                DCI  $0ffa               ; 12d5 2a 0f fa
                LIS  $6                  ; 12d8 76
                LR   (IS),A              ; 12d9 5c
                PI   $43cd               ; 12da 28 43 cd
                DCI  $0fea               ; 12dd 2a 0f ea
                LI   $64                 ; 12e0 20 64
                ST                       ; 12e2 17
                DCI  $08f7               ; 12e3 2a 08 f7
                ST                       ; 12e6 17
                PI   $43d6               ; 12e7 28 43 d6
                JMP  A1045               ; 12ea 29 10 45
                LIS  $0                  ; 12ed 70
                LR   $2,A                ; 12ee 52
                LIS  $7                  ; 12ef 77
                LR   $1,A                ; 12f0 51
                LI   $3d                 ; 12f1 20 3d
                LR   $3,A                ; 12f3 53
                LI   $15                 ; 12f4 20 15
                LR   $7,A                ; 12f6 57
                DS   $3                  ; 12f7 33
                BT   4,A12fd             ; 12f8 84 04
                JMP  A170e               ; 12fa 29 17 0e
A12fd:          DS   $1                  ; 12fd 31
                BT   4,A1319             ; 12fe 84 1a
                LR   A,$2                ; 1300 42
                INC                      ; 1301 1f
                LR   $2,A                ; 1302 52
                DCI  A1754               ; 1303 2a 17 54
                ADC                      ; 1306 8e
                LM                       ; 1307 16
                DCI  $0f6a               ; 1308 2a 0f 6a
                ST                       ; 130b 17
                DCI  $0c04               ; 130c 2a 0c 04
                LI   $16                 ; 130f 20 16
                COM                      ; 1311 18
                ST                       ; 1312 17
                DCI  $0c04               ; 1313 2a 0c 04
                JMP  A10c8               ; 1316 29 10 c8
A1319:          JMP  A1045               ; 1319 29 10 45
A131c:          DCI  $0f3f               ; 131c 2a 0f 3f
                LI   $70                 ; 131f 20 70
A1321:          LR   $0,A                ; 1321 50
                LIS  $0                  ; 1322 70
A1323:          ST                       ; 1323 17
                DS   $0                  ; 1324 30
                BF   $4,A1323            ; 1325 94 fd
                POP                      ; 1327 1c
A1328:          LIS  $8                  ; 1328 78
                LR   $4,A                ; 1329 54
                LISL 4                   ; 132a 6c
A132b:          LI   $13                 ; 132b 20 13
                LR   (IS),A              ; 132d 5c
                PI   $43d6               ; 132e 28 43 d6
                LIS  $0                  ; 1331 70
                XS   $8                  ; 1332 e8
                BT   1,A1382             ; 1333 81 4e
                NOP                      ; 1335 2b
                NOP                      ; 1336 2b
                LIS  $6                  ; 1337 76
                LR   $3,A                ; 1338 53
                DCI  $0fba               ; 1339 2a 0f ba
                XDC                      ; 133c 2c
                DCI  $0c17               ; 133d 2a 0c 17
A1340:          XDC                      ; 1340 2c
                LM                       ; 1341 16
                SR   4                   ; 1342 14
                SL   4                   ; 1343 15
                XDC                      ; 1344 2c
                ST                       ; 1345 17
                DS   $3                  ; 1346 33
                BF   $4,A1340            ; 1347 94 f8
                XDC                      ; 1349 2c
                LM                       ; 134a 16
                SR   4                   ; 134b 14
                SL   4                   ; 134c 15
                DCI  $0c16               ; 134d 2a 0c 16
                ST                       ; 1350 17
                LIS  $7                  ; 1351 77
                LR   $1,A                ; 1352 51
                DCI  $0c16               ; 1353 2a 0c 16
                XDC                      ; 1356 2c
                DCI  $0fba               ; 1357 2a 0f ba
                PI   A10a0               ; 135a 28 10 a0
                DCI  $0c05               ; 135d 2a 0c 05
                LR   H,DC                ; 1360 11
                LIS  $2                  ; 1361 72
                AM                       ; 1362 88
                CI   $04                 ; 1363 25 04
                BF   $4,A1367            ; 1365 94 01
A1367:          LIS  $2                  ; 1367 72
                LR   $6,A                ; 1368 56
                LR   DC,H                ; 1369 10
                ST                       ; 136a 17
                LI   $7b                 ; 136b 20 7b
                LR   $5,A                ; 136d 55
                PI   A161d               ; 136e 28 16 1d
                DCI  $0c04               ; 1371 2a 0c 04
                LI   $11                 ; 1374 20 11
                ST                       ; 1376 17
                DS   $4                  ; 1377 34
                BT   4,A1382             ; 1378 84 09
                LR   A,$4                ; 137a 44
                DCI  $08f5               ; 137b 2a 08 f5
                ST                       ; 137e 17
                JMP  A10e1               ; 137f 29 10 e1
A1382:          JMP  A1ff5               ; 1382 29 1f f5
                DCI  A1831               ; 1385 2a 18 31
                LIS  $0                  ; 1388 70
                LR   $1,A                ; 1389 51
                LIS  $4                  ; 138a 74
                LR   $2,A                ; 138b 52
                XDC                      ; 138c 2c
                DCI  A1843               ; 138d 2a 18 43
                LR   H,DC                ; 1390 11
                XDC                      ; 1391 2c
                PI   A16c8               ; 1392 28 16 c8
                DCI  $0d01               ; 1395 2a 0d 01
                XDC                      ; 1398 2c
                DCI  A175c               ; 1399 2a 17 5c
                LISU 2                   ; 139c 62
                LISL 0                   ; 139d 68
                LIS  $1                  ; 139e 71
                LR   (IS)+,A             ; 139f 5d
                LR   (IS)+,A             ; 13a0 5d
                LI   $27                 ; 13a1 20 27
                LR   (IS),A              ; 13a3 5c
; RES1 $4686 copies bit-reversed bitmap bytes. Both
; calls here use R16 = R17 = 1, so source and destination advance by
; two bytes per iteration; R18 = $27 bytes per call.
                PI   $4686               ; 13a4 28 46 86
                DCI  $0d00               ; 13a7 2a 0d 00
                XDC                      ; 13aa 2c
                DCI  A175d               ; 13ab 2a 17 5d
                LI   $27                 ; 13ae 20 27
                LR   (IS),A              ; 13b0 5c
                PI   $4686               ; 13b1 28 46 86
                DCI  $08f7               ; 13b4 2a 08 f7
                LI   $44                 ; 13b7 20 44
                ST                       ; 13b9 17
                DCI  $08f5               ; 13ba 2a 08 f5
                LIS  $1                  ; 13bd 71
                ST                       ; 13be 17
                DCI  $0870               ; 13bf 2a 08 70
                LIS  $0                  ; 13c2 70
                ST                       ; 13c3 17
                LI   $2c                 ; 13c4 20 2c
                LR   $0,A                ; 13c6 50
A13c7:          PI   A142a               ; 13c7 28 14 2a
                DS   $0                  ; 13ca 30
                BF   $4,A13c7            ; 13cb 94 fb
                DCI  $0871               ; 13cd 2a 08 71
                LIS  $1                  ; 13d0 71
                ST                       ; 13d1 17
                LI   $40                 ; 13d2 20 40
                LR   $0,A                ; 13d4 50
A13d5:          PI   A142a               ; 13d5 28 14 2a
                DS   $0                  ; 13d8 30
                BF   $4,A13d5            ; 13d9 94 fb
                LI   $17                 ; 13db 20 17
                LR   $7,A                ; 13dd 57
                LIS  $8                  ; 13de 78
                LR   $8,A                ; 13df 58
                LIS  $0                  ; 13e0 70
                LR   $5,A                ; 13e1 55
A13e2:          DCI  $08fb               ; 13e2 2a 08 fb
                LM                       ; 13e5 16
                CI   $b8                 ; 13e6 25 b8
                BT   2,A13ed             ; 13e8 82 04
                JMP  A170e               ; 13ea 29 17 0e
A13ed:          AS   $8                  ; 13ed c8
A13ee:          DCI  $08fb               ; 13ee 2a 08 fb
                CM                       ; 13f1 8d
                BF   $4,A13ee            ; 13f2 94 fb
                LI   $10                 ; 13f4 20 10
                OUTS 1                   ; 13f6 b1
                LR   A,$5                ; 13f7 45
                XI   $07                 ; 13f8 23 07
                LR   $5,A                ; 13fa 55
                OUTS 0                   ; 13fb b0
                LIS  $0                  ; 13fc 70
                OUTS 1                   ; 13fd b1
                BF   $0,A13e2            ; 13fe 90 e3
                LI   $20                 ; 1400 20 20
                LR   $0,A                ; 1402 50
A1403:          PI   A1446               ; 1403 28 14 46
                DS   $0                  ; 1406 30
                BF   $4,A1403            ; 1407 94 fb
                DCI  $0870               ; 1409 2a 08 70
                LI   $80                 ; 140c 20 80
                ST                       ; 140e 17
                INC                      ; 140f 1f
                ST                       ; 1410 17
                LIS  $2                  ; 1411 72
                ST                       ; 1412 17
                INC                      ; 1413 1f
                ST                       ; 1414 17
                LI   $20                 ; 1415 20 20
                LR   $0,A                ; 1417 50
A1418:          PI   A145b               ; 1418 28 14 5b
A141b:          DS   $0                  ; 141b 30
                BF   $4,A1418            ; 141c 94 fb
                LI   $50                 ; 141e 20 50
                LR   $0,A                ; 1420 50
A1421:          PI   A144c               ; 1421 28 14 4c
                DS   $0                  ; 1424 30
                BF   $4,A1421            ; 1425 94 fb
                JMP  A1045               ; 1427 29 10 45
A142a:          LR   K,P                 ; 142a 08
                PI   $40a9               ; 142b 28 40 a9
                DCI  $0840               ; 142e 2a 08 40
                LR   H,DC                ; 1431 11
                LM                       ; 1432 16
                AI   $01                 ; 1433 24 01
                LR   DC,H                ; 1435 10
                ST                       ; 1436 17
                LR   H,DC                ; 1437 11
                LM                       ; 1438 16
                AI   $02                 ; 1439 24 02
                LR   DC,H                ; 143b 10
                ST                       ; 143c 17
A143d:          LIS  $2                  ; 143d 72
                LR   $7,A                ; 143e 57
                JMP  A170e               ; 143f 29 17 0e
                PI   $40bc               ; 1442 28 40 bc
                PK                       ; 1445 0c
A1446:          LR   K,P                 ; 1446 08
                PI   $40a9               ; 1447 28 40 a9
                BF   $0,A143d            ; 144a 90 f2
A144c:          LR   K,P                 ; 144c 08
                PI   $40a9               ; 144d 28 40 a9
                DCI  $0843               ; 1450 2a 08 43
                LR   H,DC                ; 1453 11
                LM                       ; 1454 16
                AI   $fe                 ; 1455 24 fe
                LR   DC,H                ; 1457 10
                ST                       ; 1458 17
                BF   $0,A145f            ; 1459 90 05
A145b:          LR   K,P                 ; 145b 08
                PI   $40a9               ; 145c 28 40 a9
A145f:          DCI  $0842               ; 145f 2a 08 42
                LR   H,DC                ; 1462 11
                LM                       ; 1463 16
                AI   $ff                 ; 1464 24 ff
                LR   DC,H                ; 1466 10
                ST                       ; 1467 17
                BF   $0,A143d            ; 1468 90 d4
                LIS  $3                  ; 146a 73
                LR   $2,A                ; 146b 52
                DCI  $0c1e               ; 146c 2a 0c 1e
                LI   $64                 ; 146f 20 64
                ST                       ; 1471 17
A1472:          LIS  $3                  ; 1472 73
                LR   $3,A                ; 1473 53
                LIS  $0                  ; 1474 70
                LR   $1,A                ; 1475 51
                LR   $4,A                ; 1476 54
A1477:          DCI  $0873               ; 1477 2a 08 73
                LI   $83                 ; 147a 20 83
                ST                       ; 147c 17
                INC                      ; 147d 1f
                ST                       ; 147e 17
A147f:          DCI  $0871               ; 147f 2a 08 71
                LIS  $1                  ; 1482 71
                ST                       ; 1483 17
                DCI  $08f5               ; 1484 2a 08 f5
                LIS  $5                  ; 1487 75
                ST                       ; 1488 17
                PI   $43d6               ; 1489 28 43 d6
                LIS  $0                  ; 148c 70
                XS   $8                  ; 148d e8
                BT   1,A149c             ; 148e 81 0d
                DS   $3                  ; 1490 33
                BT   4,A1495             ; 1491 84 03
                BF   $0,A147f            ; 1493 90 eb
A1495:          JMP  A1fe0               ; 1495 29 1f e0
                BT   4,A141b             ; 1498 84 82
                BF   $0,A14b4            ; 149a 90 19
A149c:          DCI  $0f66               ; 149c 2a 0f 66
                LIS  $0                  ; 149f 70
                XS   $4                  ; 14a0 e4
                BF   $4,A14b4            ; 14a1 94 12
                LR   A,$1                ; 14a3 41
                INC                      ; 14a4 1f
                ADC                      ; 14a5 8e
                LR   $1,A                ; 14a6 51
                LR   A,$8                ; 14a7 48
                INC                      ; 14a8 1f
                ST                       ; 14a9 17
                PI   A1107               ; 14aa 28 11 07
                LR   A,$1                ; 14ad 41
                CI   $03                 ; 14ae 25 03
                BT   4,A14b4             ; 14b0 84 03
                BF   $0,A147f            ; 14b2 90 cc
A14b4:          DCI  $0871               ; 14b4 2a 08 71
                LI   $81                 ; 14b7 20 81
                ST                       ; 14b9 17
                LIS  $3                  ; 14ba 73
                LR   $3,A                ; 14bb 53
                DCI  $190c               ; 14bc 2a 19 0c
                XDC                      ; 14bf 2c
                DCI  $0f67               ; 14c0 2a 0f 67
A14c3:          LM                       ; 14c3 16
                XDC                      ; 14c4 2c
                CM                       ; 14c5 8d
                BF   $4,A14e0            ; 14c6 94 19
                XDC                      ; 14c8 2c
                DS   $3                  ; 14c9 33
                BF   $4,A14c3            ; 14ca 94 f8
                DCI  $0874               ; 14cc 2a 08 74
                LIS  $4                  ; 14cf 74
                ST                       ; 14d0 17
                DCI  $08f5               ; 14d1 2a 08 f5
                LIS  $4                  ; 14d4 74
                ST                       ; 14d5 17
                LIS  $9                  ; 14d6 79
                LR   $6,A                ; 14d7 56
                LI   $33                 ; 14d8 20 33
                LR   $5,A                ; 14da 55
                PI   A161d               ; 14db 28 16 1d
                BF   $0,A1544            ; 14de 90 65
A14e0:          DCI  $0873               ; 14e0 2a 08 73
                LIS  $3                  ; 14e3 73
                ST                       ; 14e4 17
                DCI  $08f5               ; 14e5 2a 08 f5
                LIS  $3                  ; 14e8 73
                ST                       ; 14e9 17
                LIS  $2                  ; 14ea 72
                LR   $6,A                ; 14eb 56
                LI   $78                 ; 14ec 20 78
                LR   $5,A                ; 14ee 55
                PI   A161d               ; 14ef 28 16 1d
                DS   $2                  ; 14f2 32
                BF   $4,A1508            ; 14f3 94 14
                DCI  $08f5               ; 14f5 2a 08 f5
                LIS  $2                  ; 14f8 72
                ST                       ; 14f9 17
                DCI  $0873               ; 14fa 2a 08 73
                LI   $83                 ; 14fd 20 83
                ST                       ; 14ff 17
                LM                       ; 1500 16
                LIS  $5                  ; 1501 75
                ST                       ; 1502 17
                PI   $43d6               ; 1503 28 43 d6
                BF   $0,A1544            ; 1506 90 3d
A1508:          DCI  $0f67               ; 1508 2a 0f 67
                LI   $35                 ; 150b 20 35
                ST                       ; 150d 17
                LIS  $0                  ; 150e 70
                ST                       ; 150f 17
                ST                       ; 1510 17
                PI   A1107               ; 1511 28 11 07
                LIS  $0                  ; 1514 70
                XS   $4                  ; 1515 e4
                BF   $4,A1530            ; 1516 94 19
                JMP  A1472               ; 1518 29 14 72
A151b:          LIS  $3                  ; 151b 73
                LR   (IS),A              ; 151c 5c
                DCI  A190f               ; 151d 2a 19 0f
                XDC                      ; 1520 2c
                DCI  $0f67               ; 1521 2a 0f 67
                PI   $43cd               ; 1524 28 43 cd
                LIS  $2                  ; 1527 72
                LR   $2,A                ; 1528 52
                LIS  $1                  ; 1529 71
                LR   $4,A                ; 152a 54
                PI   A1107               ; 152b 28 11 07
                BF   $0,A14b4            ; 152e 90 85
A1530:          DCI  $190c               ; 1530 2a 19 0c
                XDC                      ; 1533 2c
                DCI  $0f67               ; 1534 2a 0f 67
                LIS  $3                  ; 1537 73
                LR   (IS),A              ; 1538 5c
                PI   $43cd               ; 1539 28 43 cd
                PI   A1107               ; 153c 28 11 07
                LIS  $3                  ; 153f 73
                LR   $1,A                ; 1540 51
                JMP  A1477               ; 1541 29 14 77
A1544:          JMP  A1045               ; 1544 29 10 45
                DCI  $0c06               ; 1547 2a 0c 06
                LIS  $0                  ; 154a 70
                CM                       ; 154b 8d
                BF   $4,A1565            ; 154c 94 18
                DCI  $1912               ; 154e 2a 19 12
A1551:          XDC                      ; 1551 2c
                LI   $10                 ; 1552 20 10
                LR   (IS),A              ; 1554 5c
                DCI  $0f6f               ; 1555 2a 0f 6f
                PI   $43cd               ; 1558 28 43 cd
                DCI  $0c04               ; 155b 2a 0c 04
                LIS  $0                  ; 155e 70
                ST                       ; 155f 17
                LIS  $1                  ; 1560 71
                LR   $3,A                ; 1561 53
                JMP  A10e7               ; 1562 29 10 e7
A1565:          DCI  $0c06               ; 1565 2a 0c 06
                BF   $0,A1551            ; 1568 90 e8
                LIS  $0                  ; 156a 70
                LIS  $0                  ; 156b 70
                LR   $4,A                ; 156c 54
                LIS  $3                  ; 156d 73
A156e:          LR   $2,A                ; 156e 52
A156f:          PI   $43d6               ; 156f 28 43 d6
                LIS  $0                  ; 1572 70
                XS   $8                  ; 1573 e8
                BT   4,A156f             ; 1574 84 fa
                BT   1,A158e             ; 1576 81 17
                DS   $2                  ; 1578 32
                BF   $4,A156f            ; 1579 94 f5
A157b:          DCI  $0f6f               ; 157b 2a 0f 6f
                XDC                      ; 157e 2c
                DCI  $0c06               ; 157f 2a 0c 06
                LI   $10                 ; 1582 20 10
                LR   (IS),A              ; 1584 5c
                PI   $43cd               ; 1585 28 43 cd
                JMP  A10fe               ; 1588 29 10 fe
                LIS  $0                  ; 158b 70
                BF   $0,A156e            ; 158c 90 e1
A158e:          CI   $47                 ; 158e 25 47
                BT   4,A159b             ; 1590 84 0a
                CI   $3f                 ; 1592 25 3f
                BF   $4,A1597            ; 1594 94 02
                LIS  $0                  ; 1596 70
A1597:          CI   $3a                 ; 1597 25 3a
                BF   $2,A156f            ; 1599 92 d5
A159b:          LR   $1,A                ; 159b 51
                DCI  $0f6f               ; 159c 2a 0f 6f
                LR   A,$4                ; 159f 44
                ADC                      ; 15a0 8e
                INC                      ; 15a1 1f
                CI   $11                 ; 15a2 25 11
                BT   4,A157b             ; 15a4 84 d6
                LR   $4,A                ; 15a6 54
                LR   A,$1                ; 15a7 41
                CI   $47                 ; 15a8 25 47
                BF   $4,A15b8            ; 15aa 94 0d
                LIS  $0                  ; 15ac 70
                DS   $4                  ; 15ad 34
                DS   $4                  ; 15ae 34
                BT   1,A15b4             ; 15af 81 04
                LR   $4,A                ; 15b1 54
                BF   $0,A15b9            ; 15b2 90 06
A15b4:          LI   $ff                 ; 15b4 20 ff
                ADC                      ; 15b6 8e
                LIS  $0                  ; 15b7 70
A15b8:          ST                       ; 15b8 17
A15b9:          DCI  $0c04               ; 15b9 2a 0c 04
                LI   $ed                 ; 15bc 20 ed
                ST                       ; 15be 17
                DCI  $0c04               ; 15bf 2a 0c 04
                JMP  A10c8               ; 15c2 29 10 c8
A15c5:          XDC                      ; 15c5 2c
A15c6:          LIS  $0                  ; 15c6 70
                XM                       ; 15c7 8c
                XDC                      ; 15c8 2c
                BF   $1,A15d1            ; 15c9 91 07
                ST                       ; 15cb 17
A15cc:          DS   (IS)                ; 15cc 3c
                XDC                      ; 15cd 2c
                BF   $4,A15c6            ; 15ce 94 f7
                POP                      ; 15d0 1c
A15d1:          COM                      ; 15d1 18
                LR   $0,A                ; 15d2 50
                LI   $00                 ; 15d3 20 00
A15d5:          ST                       ; 15d5 17
                DS   $0                  ; 15d6 30
                BF   $4,A15d5            ; 15d7 94 fd
                BF   $0,A15cc            ; 15d9 90 f2
                DCI  A1896               ; 15db 2a 18 96
                LIS  $0                  ; 15de 70
                LR   $1,A                ; 15df 51
                LI   $10                 ; 15e0 20 10
                LR   $2,A                ; 15e2 52
                DCI  A18cc               ; 15e3 2a 18 cc
                LR   H,DC                ; 15e6 11
                DCI  A1896               ; 15e7 2a 18 96
                PI   A16c8               ; 15ea 28 16 c8
                DCI  $08f5               ; 15ed 2a 08 f5
                LIS  $0                  ; 15f0 70
                ST                       ; 15f1 17
                LIS  $b                  ; 15f2 7b
                LR   $6,A                ; 15f3 56
                LI   $0f                 ; 15f4 20 0f
                LR   $5,A                ; 15f6 55
                LIS  $0                  ; 15f7 70
                LR   $3,A                ; 15f8 53
                PI   A161d               ; 15f9 28 16 1d
                JMP  A1045               ; 15fc 29 10 45
                LIS  $7                  ; 15ff 77
                LR   $1,A                ; 1600 51
                DCI  $0870               ; 1601 2a 08 70
A1604:          LR   Q,DC                ; 1604 0e
                LM                       ; 1605 16
                NI   $7f                 ; 1606 21 7f
                LR   DC,Q                ; 1608 0f
                ST                       ; 1609 17
                DS   $1                  ; 160a 31
                BF   $4,A1604            ; 160b 94 f8
                POP                      ; 160d 1c
A160e:          LIS  $7                  ; 160e 77
                LR   $1,A                ; 160f 51
                DCI  $0870               ; 1610 2a 08 70
A1613:          LR   Q,DC                ; 1613 0e
                LM                       ; 1614 16
                XI   $80                 ; 1615 23 80
                LR   DC,Q                ; 1617 0f
                ST                       ; 1618 17
                DS   $1                  ; 1619 31
                BF   $4,A1613            ; 161a 94 f8
                POP                      ; 161c 1c
A161d:          LR   K,P                 ; 161d 08
                PI   $40a9               ; 161e 28 40 a9
A1621:          LR   A,$5                ; 1621 45
                INC                      ; 1622 1f
                INC                      ; 1623 1f
                INC                      ; 1624 1f
                LR   $5,A                ; 1625 55
                DCI  A191f               ; 1626 2a 19 1f
                ADC                      ; 1629 8e
                LIS  $0                  ; 162a 70
                XM                       ; 162b 8c
                BF   $1,A1665            ; 162c 91 38
                DS   $6                  ; 162e 36
                BT   4,A1665             ; 162f 84 35
                LISU 4                   ; 1631 64
                LISL 3                   ; 1632 6b
                LR   (IS)+,A             ; 1633 5d
                LM                       ; 1634 16
                LR   (IS)+,A             ; 1635 5d
                LM                       ; 1636 16
                LISU 2                   ; 1637 62
                LISL 4                   ; 1638 6c
                LR   (IS),A              ; 1639 5c
                LIS  $0                  ; 163a 70
                OUTS 0                   ; 163b b0
                OUTS 1                   ; 163c b1
                DCI  $0fdd               ; 163d 2a 0f dd
                ST                       ; 1640 17
                ST                       ; 1641 17
                DCI  $0c04               ; 1642 2a 0c 04
                LM                       ; 1645 16
                CI   $05                 ; 1646 25 05
                BF   $4,A164c            ; 1648 94 03
                BF   $0,A165d            ; 164a 90 12
A164c:          CI   $13                 ; 164c 25 13
                BF   $4,A165d            ; 164e 94 0e
                DCI  $0876               ; 1650 2a 08 76
                LR   A,$3                ; 1653 43
                ADC                      ; 1654 8e
                LR   H,DC                ; 1655 11
                INC                      ; 1656 1f
                LR   $3,A                ; 1657 53
                LM                       ; 1658 16
                NI   $7f                 ; 1659 21 7f
                LR   DC,H                ; 165b 10
                ST                       ; 165c 17
A165d:          PI   $46d6               ; 165d 28 46 d6
                PI   $43d6               ; 1660 28 43 d6
                BF   $0,A1621            ; 1663 90 bd
A1665:          DI                       ; 1665 1a
                LIS  $0                  ; 1666 70
                OUTS 14                  ; 1667 be
                DCI  $0c1e               ; 1668 2a 0c 1e
                LM                       ; 166b 16
                DCI  $0fea               ; 166c 2a 0f ea
                ST                       ; 166f 17
                DCI  $08f7               ; 1670 2a 08 f7
                ST                       ; 1673 17
                PI   $40bc               ; 1674 28 40 bc
                PK                       ; 1677 0c
                LI   $44                 ; 1678 20 44
                DCI  $0c1e               ; 167a 2a 0c 1e
                ST                       ; 167d 17
                DCI  $0fea               ; 167e 2a 0f ea
                ST                       ; 1681 17
                PI   $43d6               ; 1682 28 43 d6
                LIS  $3                  ; 1685 73
                LR   $0,A                ; 1686 50
                DCI  $1853               ; 1687 2a 18 53
                LM                       ; 168a 16
                XDC                      ; 168b 2c
                DCI  $0fb8               ; 168c 2a 0f b8
A168f:          ST                       ; 168f 17
                LIS  $8                  ; 1690 78
                ADC                      ; 1691 8e
                XDC                      ; 1692 2c
                LM                       ; 1693 16
                XDC                      ; 1694 2c
                DS   $0                  ; 1695 30
                BF   $4,A168f            ; 1696 94 f8
                DCI  A1856               ; 1698 2a 18 56
                LR   H,DC                ; 169b 11
                LIS  $1                  ; 169c 71
                LR   $2,A                ; 169d 52
                LIS  $7                  ; 169e 77
                LR   $1,A                ; 169f 51
                PI   A1708               ; 16a0 28 17 08
                LIS  $5                  ; 16a3 75
                LR   $7,A                ; 16a4 57
                JMP  A170e               ; 16a5 29 17 0e
                LI   $66                 ; 16a8 20 66
                LR   $1,A                ; 16aa 51
                DCI  $0847               ; 16ab 2a 08 47
                LM                       ; 16ae 16
                AI   $01                 ; 16af 24 01
                DCI  $0847               ; 16b1 2a 08 47
                ST                       ; 16b4 17
                LIS  $3                  ; 16b5 73
                LR   $6,A                ; 16b6 56
                LI   $2d                 ; 16b7 20 2d
                LR   $5,A                ; 16b9 55
                PI   A161d               ; 16ba 28 16 1d
                DS   $1                  ; 16bd 31
                BT   4,A16c5             ; 16be 84 06
                LIS  $6                  ; 16c0 76
                LR   $7,A                ; 16c1 57
                JMP  A170e               ; 16c2 29 17 0e
A16c5:          JMP  A1045               ; 16c5 29 10 45
A16c8:          LR   K,P                 ; 16c8 08
                PI   $40a9               ; 16c9 28 40 a9
                XDC                      ; 16cc 2c
                DCI  $0ffa               ; 16cd 2a 0f fa
                LISU 2                   ; 16d0 62
                LISL 0                   ; 16d1 68
                LIS  $6                  ; 16d2 76
                LR   (IS),A              ; 16d3 5c
                PI   $43cd               ; 16d4 28 43 cd
                PI   $4762               ; 16d7 28 47 62
A16da:          LR   DC,H                ; 16da 10
                XDC                      ; 16db 2c
                DCI  $0820               ; 16dc 2a 08 20
                LR   A,$1                ; 16df 41
                ADC                      ; 16e0 8e
                LR   A,$2                ; 16e1 42
                LR   (IS),A              ; 16e2 5c
                PI   $43cd               ; 16e3 28 43 cd
                DCI  $0840               ; 16e6 2a 08 40
                LR   A,$1                ; 16e9 41
                ADC                      ; 16ea 8e
                LR   A,$2                ; 16eb 42
                LR   (IS),A              ; 16ec 5c
                PI   $43cd               ; 16ed 28 43 cd
                DCI  $0850               ; 16f0 2a 08 50
                LR   A,$1                ; 16f3 41
                ADC                      ; 16f4 8e
                LR   A,$2                ; 16f5 42
                LR   (IS),A              ; 16f6 5c
                PI   $43cd               ; 16f7 28 43 cd
                DCI  $0870               ; 16fa 2a 08 70
                LR   A,$1                ; 16fd 41
                ADC                      ; 16fe 8e
                LR   A,$2                ; 16ff 42
                LR   (IS),A              ; 1700 5c
                PI   $43cd               ; 1701 28 43 cd
                PI   $40bc               ; 1704 28 40 bc
                PK                       ; 1707 0c
A1708:          LR   K,P                 ; 1708 08
                PI   $40a9               ; 1709 28 40 a9
                BF   $0,A16da            ; 170c 90 cd
A170e:          LI   $f8                 ; 170e 20 f8
A1710:          DCI  $08fb               ; 1710 2a 08 fb
                CM                       ; 1713 8d
                BF   $4,A1710            ; 1714 94 fb
                PI   $424d               ; 1716 28 42 4d
                LISL 0                   ; 1719 68
                LR   A,$7                ; 171a 47
                DCI  A1725               ; 171b 2a 17 25
                ADC                      ; 171e 8e
                ADC                      ; 171f 8e
                LM                       ; 1720 16
                LR   QU,A                ; 1721 06
                LM                       ; 1722 16
                LR   QL,A                ; 1723 07
                LR   P0,Q                ; 1724 0d
A1725:          LR   DC,H                ; 1725 10
                NS   (IS)-               ; 1726 fe
                SL   1                   ; 1727 13
                BT   5,A173d             ; 1728 85 14
                LR   A,$2                ; 172a 42
                LR   H,DC                ; 172b 11
                LNK                      ; 172c 19
                ST                       ; 172d 17
                LR   Q,DC                ; 172e 0e
                LM                       ; 172f 16
                INS  8                   ; 1730 a8
                LM                       ; 1731 16
                INS  11                  ; 1732 ab
                LM                       ; 1733 16
                LIS  $8                  ; 1734 78
                LR   DC,H                ; 1735 10
                ASD  $5                  ; 1736 d5
                SR   1                   ; 1737 12
                XS   (IS)+               ; 1738 ed
                SR   1                   ; 1739 12
                OM                       ; 173a 8b
                LR   H,DC                ; 173b 11
                LISL 4                   ; 173c 6c
A173d:          SR   4                   ; 173d 14
                LISL 2                   ; 173e 6a
                SR   4                   ; 173f 14
                LIS  $f                  ; 1740 7f
                SL   4                   ; 1741 15
                LISL 2                   ; 1742 6a
                SL   4                   ; 1743 15
                LR   A,$7                ; 1744 47
                INC                      ; 1745 1f
                NS   $0                  ; 1746 f0
                SL   1                   ; 1747 13
                DCI  A156f               ; 1748 2a 15 6f
                SL   4                   ; 174b 15
                ASD  $b                  ; 174c db
                LR   H,DC                ; 174d 11
                LR   (IS)+,A             ; 174e 5d
                SR   1                   ; 174f 12
                NS   $7                  ; 1750 f7
                SR   1                   ; 1751 12
                NS   $1                  ; 1752 f1
                SR   4                   ; 1753 14
A1754:          LR   A,KU                ; 1754 00
                DS   $2                  ; 1755 32
                OI   $20                 ; 1756 22 20
                LR   J,W                 ; 1758 1e
                LR   Q,DC                ; 1759 0e
                PK                       ; 175a 0c
                LR   A,IS                ; 175b 0a
A175c:          POP                      ; 175c 1c
A175d:          LR   A,KU                ; 175d 00
                DS   (IS)-               ; 175e 3e
                LR   A,KU                ; 175f 00
                DS   (IS)-               ; 1760 3e
                LR   A,KU                ; 1761 00
                DS   (IS)                ; 1762 3c
                LR   KU,A                ; 1763 04
                db   $3f                 
                LR   KU,A                ; 1765 04
                DS   (IS)-               ; 1766 3e
                LR   KU,A                ; 1767 04
                DS   (IS)-               ; 1768 3e
                LR   KU,A                ; 1769 04
                LR   J,W                 ; 176a 1e
                LR   KU,A                ; 176b 04
                POP                      ; 176c 1c
                LR   KU,A                ; 176d 04
                LIS  $f                  ; 176e 7f
                NS   (IS)-               ; 176f fe
                db   $ff                 
                NS   (IS)-               ; 1771 fe
                NS   $7                  ; 1772 f7
                LR   KU,A                ; 1773 04
                AS   $1                  ; 1774 c1
                LR   KU,A                ; 1775 04
                XS   $3                  ; 1776 e3
                LR   KU,A                ; 1777 04
                NS   $7                  ; 1778 f7
                LR   KU,A                ; 1779 04
                XS   $b                  ; 177a eb
                LR   KU,A                ; 177b 04
                db   $ff                 
                LR   KU,A                ; 177d 04
                db   $ff                 
                LR   KU,A                ; 177f 04
                db   $ff                 
                LR   A,KU                ; 1781 00
                NS   $7                  ; 1782 f7
                LR   A,KU                ; 1783 00
                AS   $1                  ; 1784 c1
                LR   A,KU                ; 1785 00
                NS   $7                  ; 1786 f7
                LR   A,KU                ; 1787 00
                OUTS 15                  ; 1788 bf
                LR   A,KU                ; 1789 00
                OUTS 15                  ; 178a bf
                LR   A,KU                ; 178b 00
                db   $3f                 
                LR   A,KU                ; 178d 00
                DS   (IS)-               ; 178e 3e
                LR   A,KU                ; 178f 00
                DS   $6                  ; 1790 36
                LR   A,KU                ; 1791 00
                DS   $6                  ; 1792 36
                LR   A,KU                ; 1793 00
                DS   $6                  ; 1794 36
                LR   A,KU                ; 1795 00
                DS   $6                  ; 1796 36
                LR   A,KU                ; 1797 00
                DS   $6                  ; 1798 36
                LR   A,KU                ; 1799 00
                DS   $6                  ; 179a 36
                LR   A,KU                ; 179b 00
                NS   $6                  ; 179c f6
                LR   A,KU                ; 179d 00
                NS   $6                  ; 179e f6
                LR   A,KU                ; 179f 00
                NS   $6                  ; 17a0 f6
                LR   A,KU                ; 17a1 00
                BT   6,0                 ; 17a2 86 00
                BT   6,0                 ; 17a4 86 00
                BT   6,0                 ; 17a6 86 00
                LR   QL,A                ; 17a8 07
                LR   A,KU                ; 17a9 00
                LR   QL,A                ; 17aa 07
                LR   A,KU                ; 17ab 00
                INC                      ; 17ac 1f
                LR   A,KU                ; 17ad 00
                db   $3f                 
                BT   1,A182f             ; 17af 81 7f
                AS   $2                  ; 17b1 c2
                OUTS 1                   ; 17b2 b1
                INS  1                   ; 17b3 a1
                LISU 0                   ; 17b4 60
                AS   $1                  ; 17b5 c1
                XS   $a                  ; 17b6 ea
                XS   $1                  ; 17b7 e1
                AI   $81                 ; 17b8 24 81
                XS   (IS)-               ; 17ba ee
                XS   $1                  ; 17bb e1
                LISL 6                   ; 17bc 6e
                AS   $1                  ; 17bd c1
                XS   $4                  ; 17be e4
                db   $ff                 
                DS   $1                  ; 17c0 31
                db   $ff                 
                db   $ff                 
                db   $ff                 
                LIS  $f                  ; 17c4 7f
                db   $ff                 
                OUTS 15                  ; 17c6 bf
                db   $ff                 
                LIS  $f                  ; 17c8 7f
                db   $ff                 
                INC                      ; 17ca 1f
                db   $ff                 
                INC                      ; 17cc 1f
                db   $ff                 
                LNK                      ; 17ce 19
A17cf:          db   $b3                 
                LNK                      ; 17d0 19
                db   $b3                 
                LNK                      ; 17d2 19
A17d3:          db   $b3                 
                DS   $0                  ; 17d4 30
                AS   $3                  ; 17d5 c3
                DS   $0                  ; 17d6 30
                AS   $0                  ; 17d7 c0
                LR   A,QU                ; 17d8 02
                LIS  $f                  ; 17d9 7f
                LR   A,QU                ; 17da 02
                LR   A,KL                ; 17db 01
                BT   0,A17de             ; 17dc 80 01
A17de:          AS   $0                  ; 17de c0
                LR   A,KL                ; 17df 01
                NS   $0                  ; 17e0 f0
                LR   A,QL                ; 17e1 03
                AS   $0                  ; 17e2 c0
                LR   QL,A                ; 17e3 07
                BT   0,A17ec             ; 17e4 80 07
                NS   $0                  ; 17e6 f0
                db   $3f                 
                NS   $9                  ; 17e8 f9
                db   $3f                 
                db   $ff                 
                db   $3f                 
A17ec:          NS   $9                  ; 17ec f9
                LR   DC,Q                ; 17ed 0f
                NS   $0                  ; 17ee f0
                LR   DC,Q                ; 17ef 0f
                XS   $0                  ; 17f0 e0
                LR   QL,A                ; 17f1 07
                XS   $0                  ; 17f2 e0
                LISU 7                   ; 17f3 67
                XS   (IS)                ; 17f4 ec
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                LIS  $f                  ; 17fb 7f
                db   $ff                 
                LIS  $f                  ; 17fd 7f
                db   $ff                 
                db   $3f                 
                NS   (IS)-               ; 1800 fe
                db   $3f                 
                NS   (IS)-               ; 1802 fe
                INC                      ; 1803 1f
                NS   (IS)                ; 1804 fc
                SL   4                   ; 1805 15
                LR   $4,A                ; 1806 54
                LR   A,KU                ; 1807 00
                LR   DC,H                ; 1808 10
                LR   A,KU                ; 1809 00
                PI   $0044               ; 180a 28 00 44
                LR   A,KU                ; 180d 00
                LR   A,$4                ; 180e 44
                LR   A,KU                ; 180f 00
                LR   A,$4                ; 1810 44
                LR   A,KU                ; 1811 00
                LR   A,$8                ; 1812 48
                LR   A,KU                ; 1813 00
                LR   $0,A                ; 1814 50
                LR   A,KU                ; 1815 00
                LISU 0                   ; 1816 60
                LR   A,KU                ; 1817 00
                LR   A,$0                ; 1818 40
                LR   A,KU                ; 1819 00
                AS   $0                  ; 181a c0
                LR   A,KL                ; 181b 01
                LR   A,$0                ; 181c 40
                LR   A,QU                ; 181d 02
                LR   A,$0                ; 181e 40
                LR   KU,A                ; 181f 04
                XS   $0                  ; 1820 e0
                LR   P,K                 ; 1821 09
                LR   $0,A                ; 1822 50
                LR   A,IS                ; 1823 0a
                LR   A,$8                ; 1824 48
                LR   K,P                 ; 1825 08
                LR   A,$4                ; 1826 44
                LR   K,P                 ; 1827 08
                LR   A,$4                ; 1828 44
                LR   KU,A                ; 1829 04
                LR   A,$4                ; 182a 44
                LR   A,QU                ; 182b 02
                LR   A,$8                ; 182c 48
                LR   A,KL                ; 182d 01
A182e:          NS   $0                  ; 182e f0
A182f:          LR   A,KU                ; 182f 00
                LR   A,$0                ; 1830 40
A1831:          LR   KU,A                ; 1831 04
                LR   A,KL                ; 1832 01
A1833:          COM                      ; 1833 18
                DS   $7                  ; 1834 37
                COM                      ; 1835 18
                DS   $7                  ; 1836 37
                LR   (IS),A              ; 1837 5c
                ASD  $8                  ; 1838 d8
                LR   A,KU                ; 1839 00
                INS  12                  ; 183a ac
                DS   $7                  ; 183b 37
                BF   $7,A186a            ; 183c 97 2d
                ASD  $7                  ; 183e d7
                OUT  $03                 ; 183f 27 03
                OUT  $16                 ; 1841 27 16
A1843:          LR   A,$2                ; 1843 42
                LR   A,$1                ; 1844 41
                LR   A,$2                ; 1845 42
                LR   A,$2                ; 1846 42
                LR   DC,H                ; 1847 10
                XS   $0                  ; 1848 e0
                LIS  $c                  ; 1849 7c
                AS   $8                  ; 184a c8
                LIS  $8                  ; 184b 78
                BT   1,A18c5             ; 184c 81 78
                BT   0,A17cf             ; 184e 80 80
                BT   1,A17d3             ; 1850 81 82
                BT   3,A182e             ; 1852 83 db
                ST                       ; 1854 17
                LM                       ; 1855 16
A1856:          LR   A,QU                ; 1856 02
                AI   $c0                 ; 1857 24 c0
                LR   QL,A                ; 1859 07
A185a:          LR   A,QL                ; 185a 03
                LR   A,KL                ; 185b 01
                COM                      ; 185c 18
                LISU 0                   ; 185d 60
                COM                      ; 185e 18
                LISU 0                   ; 185f 60
                DS   $0                  ; 1860 30
                LR   DC,H                ; 1861 10
                LR   DC,H                ; 1862 10
                XM                       ; 1863 8c
                BR7  A1833               ; 1864 8f ce
                DS   (IS)                ; 1866 3c
                SR   4                   ; 1867 14
                LR   QL,A                ; 1868 07
A1869:          LR   K,P                 ; 1869 08
A186a:          LR   K,P                 ; 186a 08
                LR   P,K                 ; 186b 09
                LR   P0,Q                ; 186c 0d
                LR   P0,Q                ; 186d 0d
                LR   A,IS                ; 186e 0a
                NOP                      ; 186f 2b
                db   $a3                 
                ASD  $4                  ; 1871 d4
                LR   A,KU                ; 1872 00
                LR   A,KL                ; 1873 01
                LR   A,QU                ; 1874 02
A1875:          LR   DC,Q                ; 1875 0f
                LR   DC,H                ; 1876 10
                LR   P0,Q                ; 1877 0d
                LIS  $0                  ; 1878 70
A1879:          PK                       ; 1879 0c
                ASD  $0                  ; 187a d0
                PK                       ; 187b 0c
                DS   $0                  ; 187c 30
A187d:          LR   $6,A                ; 187d 56
                LR   $4,A                ; 187e 54
                LR   $2,A                ; 187f 52
A1880:          LR   $0,A                ; 1880 50
                LR   QL,A                ; 1881 07
                LR   KL,A                ; 1882 05
                LR   A,QL                ; 1883 03
                LR   A,KL                ; 1884 01
A1885:          LIS  $e                  ; 1885 7e
                DS   (IS)                ; 1886 3c
                DS   (IS)                ; 1887 3c
A1888:          LIS  $e                  ; 1888 7e
                LIS  $e                  ; 1889 7e
A188a:          LIS  $e                  ; 188a 7e
                LIS  $e                  ; 188b 7e
                LIS  $e                  ; 188c 7e
A188d:          LIS  $e                  ; 188d 7e
                LR   A,$2                ; 188e 42
                LR   A,KU                ; 188f 00
                LR   A,$2                ; 1890 42
                LIS  $e                  ; 1891 7e
                PK                       ; 1892 0c
                LR   QU,A                ; 1893 06
                LR   A,QL                ; 1894 03
                LR   A,KL                ; 1895 01
A1896:          LR   DC,H                ; 1896 10
                LR   A,KL                ; 1897 01
                COM                      ; 1898 18
                BF   $c,A18b2            ; 1899 9c 18
                BF   $c,A18a3            ; 189b 9c 07
                LR   A,KU                ; 189d 00
                LR   A,KU                ; 189e 00
                LR   A,KU                ; 189f 00
                LR   A,KU                ; 18a0 00
                LR   A,KU                ; 18a1 00
                LR   A,KU                ; 18a2 00
A18a3:          LR   A,KU                ; 18a3 00
                LR   A,KU                ; 18a4 00
                LR   A,KU                ; 18a5 00
                LR   A,KU                ; 18a6 00
                LR   A,KU                ; 18a7 00
                LR   A,KU                ; 18a8 00
                LR   A,KU                ; 18a9 00
                LR   A,KU                ; 18aa 00
                LR   A,KU                ; 18ab 00
                DS   $8                  ; 18ac 38
                INS  0                   ; 18ad a0
                INS  0                   ; 18ae a0
                INS  0                   ; 18af a0
                INS  0                   ; 18b0 a0
                INS  0                   ; 18b1 a0
A18b2:          INS  0                   ; 18b2 a0
                INS  0                   ; 18b3 a0
                INS  0                   ; 18b4 a0
                INS  0                   ; 18b5 a0
                INS  0                   ; 18b6 a0
                INS  0                   ; 18b7 a0
                INS  0                   ; 18b8 a0
                INS  0                   ; 18b9 a0
                INS  0                   ; 18ba a0
                INS  0                   ; 18bb a0
                SL   4                   ; 18bc 15
                LR   A,KL                ; 18bd 01
                LR   A,KL                ; 18be 01
                LR   A,KL                ; 18bf 01
                LR   A,KL                ; 18c0 01
                LR   A,KL                ; 18c1 01
                LR   KU,A                ; 18c2 04
                LR   KU,A                ; 18c3 04
                LR   KU,A                ; 18c4 04
A18c5:          LR   KU,A                ; 18c5 04
                LR   KU,A                ; 18c6 04
                LR   KU,A                ; 18c7 04
                LR   KU,A                ; 18c8 04
                LR   KU,A                ; 18c9 04
                LR   KU,A                ; 18ca 04
                LR   KU,A                ; 18cb 04
A18cc:          LR   A,$2                ; 18cc 42
                LR   A,(IS)-             ; 18cd 4e
                LR   A,(IS)-             ; 18ce 4e
                LR   A,(IS)-             ; 18cf 4e
                LR   A,(IS)-             ; 18d0 4e
                LR   A,(IS)-             ; 18d1 4e
                LR   A,$1                ; 18d2 41
                LR   A,$1                ; 18d3 41
                LR   A,$1                ; 18d4 41
                LR   A,$1                ; 18d5 41
                LR   A,$1                ; 18d6 41
                LR   A,$1                ; 18d7 41
                LR   A,$1                ; 18d8 41
                LR   A,$1                ; 18d9 41
                LR   A,$1                ; 18da 41
                LR   A,$1                ; 18db 41
                LM                       ; 18dc 16
                db   $2d                 
                db   $2d                 
                db   $2d                 
                db   $2d                 
                db   $2d                 
                DS   $0                  ; 18e2 30
                DS   $a                  ; 18e3 3a
                LR   A,$4                ; 18e4 44
                LR   A,(IS)-             ; 18e5 4e
                LR   $8,A                ; 18e6 58
                LISU 2                   ; 18e7 62
                LISL 4                   ; 18e8 6c
                LIS  $8                  ; 18e9 78
                BT   2,A1879             ; 18ea 82 8e
                LIS  $0                  ; 18ec 70
                LISU 0                   ; 18ed 60
                LIS  $0                  ; 18ee 70
                BT   0,A1880             ; 18ef 80 90
                INS  0                   ; 18f1 a0
                LISL 6                   ; 18f2 6e
                LIS  $e                  ; 18f3 7e
                ADC                      ; 18f4 8e
                INS  8                   ; 18f5 a8
                BF   $f,A188d            ; 18f6 9f 96
                ADC                      ; 18f8 8e
                BF   $f,A1888            ; 18f9 9f 8e
                INS  8                   ; 18fb a8
                LR   A,KU                ; 18fc 00
                LR   A,KL                ; 18fd 01
                LR   A,QU                ; 18fe 02
                LR   A,QL                ; 18ff 03
                LR   KU,A                ; 1900 04
                LR   KL,A                ; 1901 05
                BT   6,A188a             ; 1902 86 87
                AM                       ; 1904 88
                AMD                      ; 1905 89
                NM                       ; 1906 8a
                OM                       ; 1907 8b
                XM                       ; 1908 8c
                CM                       ; 1909 8d
                ADC                      ; 190a 8e
                BR7  A1930               ; 190b 8f 24
                OI   $22                 ; 190d 22 22
A190f:          AI   $34                 ; 190f 24 34
                OI   $00                 ; 1911 22 00
                COM                      ; 1913 18
                LR   KL,A                ; 1914 05
                SL   1                   ; 1915 13
                LR   A,QL                ; 1916 03
                LR   P,K                 ; 1917 09
                LR   A,KU                ; 1918 00
                JMP  $0b21               ; 1919 29 0b 21
                NI   $11                 ; 191c 21 11
                EI                       ; 191e 1b
A191f:          LR   IS,A                ; 191f 0b
                LM                       ; 1920 16
                LR   A,KU                ; 1921 00
                LR   A,QL                ; 1922 03
                LR   DC,H                ; 1923 10
                LR   DC,Q                ; 1924 0f
                LR   IS,A                ; 1925 0b
                LR   P0,Q                ; 1926 0d
                SL   4                   ; 1927 15
                LR   A,QL                ; 1928 03
                LR   DC,H                ; 1929 10
                LR   QU,A                ; 192a 06
                LR   A,QL                ; 192b 03
                LR   DC,Q                ; 192c 0f
                LR   DC,Q                ; 192d 0f
                LR   IS,A                ; 192e 0b
                LR   P0,Q                ; 192f 0d
A1930:          DS   $4                  ; 1930 34
                LR   IS,A                ; 1931 0b
                LR   P0,Q                ; 1932 0d
                AI   $03                 ; 1933 24 03
                LR   DC,H                ; 1935 10
                AI   $03                 ; 1936 24 03
                SR   4                   ; 1938 14
                AI   $03                 ; 1939 24 03
                EI                       ; 193b 1b
                AI   $03                 ; 193c 24 03
                COM                      ; 193e 18
                PK                       ; 193f 0c
                LR   A,QL                ; 1940 03
                SL   4                   ; 1941 15
                PK                       ; 1942 0c
                LR   A,QL                ; 1943 03
                SR   4                   ; 1944 14
                PK                       ; 1945 0c
                LR   A,QL                ; 1946 03
                COM                      ; 1947 18
                COM                      ; 1948 18
A1949:          LR   A,QL                ; 1949 03
                SR   4                   ; 194a 14
                PK                       ; 194b 0c
                LR   A,QL                ; 194c 03
                EI                       ; 194d 1b
                AI   $03                 ; 194e 24 03
                XS   $8                  ; 1950 e8
                LR   A,QL                ; 1951 03
                LR   A,KU                ; 1952 00
                AM                       ; 1953 88
A1954:          LR   A,KL                ; 1954 01
                LR   A,QL                ; 1955 03
                LR   J,W                 ; 1956 1e
                SR   1                   ; 1957 12
                LR   A,QL                ; 1958 03
                LR   J,W                 ; 1959 1e
                PK                       ; 195a 0c
                LR   A,QL                ; 195b 03
                ST                       ; 195c 17
                COM                      ; 195d 18
                LR   A,QL                ; 195e 03
A195f:          ST                       ; 195f 17
                COM                      ; 1960 18
                LR   A,QL                ; 1961 03
                SR   1                   ; 1962 12
                COM                      ; 1963 18
                LR   A,QL                ; 1964 03
                SR   4                   ; 1965 14
                PK                       ; 1966 0c
                LR   A,QL                ; 1967 03
                ST                       ; 1968 17
A1969:          PK                       ; 1969 0c
                LR   A,QL                ; 196a 03
                LR   DC,Q                ; 196b 0f
                LI   $03                 ; 196c 20 03
                LR   H,DC                ; 196e 11
                COM                      ; 196f 18
                LR   IS,A                ; 1970 0b
                LR   P0,Q                ; 1971 0d
                COM                      ; 1972 18
                LR   A,QL                ; 1973 03
A1974:          LR   H,DC                ; 1974 11
                COM                      ; 1975 18
A1976:          LR   A,QL                ; 1976 03
                SR   1                   ; 1977 12
                COM                      ; 1978 18
                LR   IS,A                ; 1979 0b
                LR   P0,Q                ; 197a 0d
                COM                      ; 197b 18
                LR   A,QL                ; 197c 03
                SR   1                   ; 197d 12
                COM                      ; 197e 18
                LR   A,QL                ; 197f 03
                SR   4                   ; 1980 14
                COM                      ; 1981 18
                LR   A,QL                ; 1982 03
                LR   H,DC                ; 1983 11
                AI   $03                 ; 1984 24 03
                SR   4                   ; 1986 14
                LR   A,IS                ; 1987 0a
                LR   IS,A                ; 1988 0b
                LM                       ; 1989 16
                DS   $0                  ; 198a 30
                LR   A,QL                ; 198b 03
                SR   4                   ; 198c 14
                LR   A,IS                ; 198d 0a
                LR   A,QL                ; 198e 03
                LR   H,DC                ; 198f 11
                LR   A,IS                ; 1990 0a
                LR   A,QL                ; 1991 03
                SR   1                   ; 1992 12
                LR   A,$8                ; 1993 48
                LR   IS,A                ; 1994 0b
                PK                       ; 1995 0c
                LR   A,$8                ; 1996 48
                LR   IS,A                ; 1997 0b
                PK                       ; 1998 0c
                LR   A,$8                ; 1999 48
                LR   A,QL                ; 199a 03
                AI   $80                 ; 199b 24 80
                LR   A,QL                ; 199d 03
                LR   K,P                 ; 199e 08
                LR   A,KL                ; 199f 01
                LR   A,QL                ; 19a0 03
                COM                      ; 19a1 18
                LR   A,KL                ; 19a2 01
A19a3:          LISL 1                   ; 19a3 69
                LR   KU,A                ; 19a4 04
                LI   $40                 ; 19a5 20 40
                LISU 0                   ; 19a7 60
A19a8:          BT   0,A1949             ; 19a8 80 a0
                AS   $0                  ; 19aa c0
                XS   $0                  ; 19ab e0
                LR   QU,A                ; 19ac 06
                db   $ef                 
                DS   (IS)+               ; 19ae 3d
                LR   KU,A                ; 19af 04
                XS   $0                  ; 19b0 e0
                XS   $0                  ; 19b1 e0
                LR   A,KU                ; 19b2 00
                db   $80
                db   $80
                LR   A,KU                ; 19b5 00
                LR   A,KU                ; 19b6 00
                LR   A,QU                ; 19b7 02
                SL   1                   ; 19b8 13
                CI   $04                 ; 19b9 25 04
                XS   $0                  ; 19bb e0
                XS   $0                  ; 19bc e0
                XS   $0                  ; 19bd e0
                XS   $0                  ; 19be e0
                BT   0,0                 ; 19bf 80 00
                LR   A,KU                ; 19c1 00
A19c2:          LR   A,QU                ; 19c2 02
                LR   A,KU                ; 19c3 00
                db   $4f                 
                LR   KU,A                ; 19c5 04
                XS   $0                  ; 19c6 e0
                BT   0,A19a8             ; 19c7 80 e0
                AS   $0                  ; 19c9 c0
                AS   $0                  ; 19ca c0
                AS   $0                  ; 19cb c0
                LR   A,KU                ; 19cc 00
                LR   A,QL                ; 19cd 03
                NS   $3                  ; 19ce f3
                DS   $6                  ; 19cf 36
                LR   KU,A                ; 19d0 04
                XS   $0                  ; 19d1 e0
                XS   $0                  ; 19d2 e0
                BT   0,A1954             ; 19d3 80 80
                LI   $00                 ; 19d5 20 00
                LR   A,KU                ; 19d7 00
A19d8:          LR   A,QU                ; 19d8 02
                LR   A,KU                ; 19d9 00
                LR   A,$9                ; 19da 49
                XS   $0                  ; 19db e0
                XS   $0                  ; 19dc e0
                XS   $0                  ; 19dd e0
                BT   0,A195f             ; 19de 80 80
                BT   0,A1a21             ; 19e0 80 40
                LR   A,$0                ; 19e2 40
A19e3:          LR   A,QU                ; 19e3 02
                LR   A,KU                ; 19e4 00
                LR   A,$7                ; 19e5 47
                LR   A,QL                ; 19e6 03
                LR   A,$0                ; 19e7 40
                BT   0,A1969             ; 19e8 80 80
                BT   0,A1a0b             ; 19ea 80 20
                LI   $00                 ; 19ec 20 00
                LR   A,QU                ; 19ee 02
                LR   A,KU                ; 19ef 00
                LR   A,$9                ; 19f0 49
                LR   KU,A                ; 19f1 04
                XS   $0                  ; 19f2 e0
                BT   0,A1974             ; 19f3 80 80
                BT   0,A1976             ; 19f5 80 80
                BT   0,0                 ; 19f7 80 00
                LR   A,QU                ; 19f9 02
                NS   $8                  ; 19fa f8
                db   $2e                 
                LR   QL,A                ; 19fc 07
                LR   KU,A                ; 19fd 04
                BT   0,A1a1f             ; 19fe 80 20
                LR   A,$0                ; 1a00 40
                LISU 0                   ; 1a01 60
                AS   $0                  ; 1a02 c0
                INS  0                   ; 1a03 a0
                LR   A,QU                ; 1a04 02
A1a05:          NS   (IS)                ; 1a05 fc
                IN   $01                 ; 1a06 26 01
                LR   A,KU                ; 1a08 00
                LR   KU,A                ; 1a09 04
                LR   KU,A                ; 1a0a 04
A1a0b:          LR   A,KU                ; 1a0b 00
                LR   A,KU                ; 1a0c 00
                LR   A,KU                ; 1a0d 00
                BT   4,A1a11             ; 1a0e 84 02
                LR   IS,A                ; 1a10 0b
A1a11:          db   $3f                 
                LR   A,KL                ; 1a12 01
                XS   $0                  ; 1a13 e0
                XS   $0                  ; 1a14 e0
                XS   $0                  ; 1a15 e0
                XS   $0                  ; 1a16 e0
                XS   $0                  ; 1a17 e0
                XS   $0                  ; 1a18 e0
                XS   $0                  ; 1a19 e0
                LR   A,QU                ; 1a1a 02
                LR   A,KL                ; 1a1b 01
                db   $5f                 
                LR   A,QU                ; 1a1d 02
                LR   KU,A                ; 1a1e 04
A1a1f:          LISU 0                   ; 1a1f 60
                LISU 0                   ; 1a20 60
A1a21:          LISU 0                   ; 1a21 60
                AS   $0                  ; 1a22 c0
                AS   $0                  ; 1a23 c0
                AS   $0                  ; 1a24 c0
                LR   A,QU                ; 1a25 02
                LR   A,KU                ; 1a26 00
                IN   $05                 ; 1a27 26 05
                XS   $4                  ; 1a29 e4
                XS   $0                  ; 1a2a e0
                BT   0,0                 ; 1a2b 80 00
                LR   A,KU                ; 1a2d 00
                LR   A,KU                ; 1a2e 00
                LR   A,KU                ; 1a2f 00
A1a30:          LR   A,QU                ; 1a30 02
                LR   A,KU                ; 1a31 00
                DS   $4                  ; 1a32 34
                LR   A,KU                ; 1a33 00
                XS   $0                  ; 1a34 e0
                XS   $0                  ; 1a35 e0
                XS   $0                  ; 1a36 e0
                LR   A,$0                ; 1a37 40
                LR   A,$0                ; 1a38 40
                LR   A,$0                ; 1a39 40
                XS   $0                  ; 1a3a e0
                LR   A,QU                ; 1a3b 02
                NS   $1                  ; 1a3c f1
                DS   $5                  ; 1a3d 35
                LR   KL,A                ; 1a3e 05
                XS   $0                  ; 1a3f e0
                XS   $0                  ; 1a40 e0
                BT   0,A19c2             ; 1a41 80 80
                LR   A,KU                ; 1a43 00
                LR   A,KU                ; 1a44 00
                LR   A,KU                ; 1a45 00
                LR   A,QU                ; 1a46 02
                LR   A,KU                ; 1a47 00
                LNK                      ; 1a48 19
                LR   KU,A                ; 1a49 04
                XS   $0                  ; 1a4a e0
                XS   $0                  ; 1a4b e0
                XS   $0                  ; 1a4c e0
                LR   A,KU                ; 1a4d 00
                LR   A,KU                ; 1a4e 00
                LR   A,KU                ; 1a4f 00
                LR   A,KU                ; 1a50 00
                LR   A,QU                ; 1a51 02
                NS   $6                  ; 1a52 f6
                LR   A,$0                ; 1a53 40
                LR   KL,A                ; 1a54 05
                LR   KU,A                ; 1a55 04
                LR   KU,A                ; 1a56 04
                BT   0,A19d8             ; 1a57 80 80
                AS   $0                  ; 1a59 c0
                LR   A,KU                ; 1a5a 00
                LR   A,KU                ; 1a5b 00
                LR   A,KL                ; 1a5c 01
                LR   A,IS                ; 1a5d 0a
                LR   A,(IS)-             ; 1a5e 4e
                LR   KL,A                ; 1a5f 05
                LR   KU,A                ; 1a60 04
                LR   KU,A                ; 1a61 04
                BT   0,A19e3             ; 1a62 80 80
                BT   0,A1a05             ; 1a64 80 a0
                LR   A,KU                ; 1a66 00
                LR   A,QU                ; 1a67 02
                LR   A,KU                ; 1a68 00
                PI   $0044               ; 1a69 28 00 44
                LR   A,$4                ; 1a6c 44
                LR   A,$0                ; 1a6d 40
                LR   A,$0                ; 1a6e 40
                LR   A,$0                ; 1a6f 40
                LR   A,$0                ; 1a70 40
                XS   $0                  ; 1a71 e0
                LR   A,QU                ; 1a72 02
                NS   $0                  ; 1a73 f0
                XDC                      ; 1a74 2c
                LR   QU,A                ; 1a75 06
                LR   KU,A                ; 1a76 04
                LR   KU,A                ; 1a77 04
                LR   KU,A                ; 1a78 04
                LR   A,KU                ; 1a79 00
                LR   A,KU                ; 1a7a 00
                LR   A,KU                ; 1a7b 00
                LR   A,KU                ; 1a7c 00
                LR   A,QU                ; 1a7d 02
                LR   A,KU                ; 1a7e 00
                LR   $0,A                ; 1a7f 50
                LR   A,QL                ; 1a80 03
                AI   $24                 ; 1a81 24 24
                XS   $4                  ; 1a83 e4
                XS   $0                  ; 1a84 e0
                XS   $0                  ; 1a85 e0
                XS   $0                  ; 1a86 e0
                LR   A,KU                ; 1a87 00
                LR   A,QU                ; 1a88 02
                LR   A,KU                ; 1a89 00
                LR   A,(IS)+             ; 1a8a 4d
                LR   A,KU                ; 1a8b 00
                LI   $40                 ; 1a8c 20 40
                LISU 0                   ; 1a8e 60
                BT   0,A1a30             ; 1a8f 80 a0
                AS   $0                  ; 1a91 c0
                XS   $0                  ; 1a92 e0
                LR   A,QU                ; 1a93 02
                XS   $b                  ; 1a94 eb
                XS   $b                  ; 1a95 eb
A1a96:          LNK                      ; 1a96 19
                LR   IS,A                ; 1a97 0b
                OUT  $27                 ; 1a98 27 27
                SL   1                   ; 1a9a 13
                LR   KU,A                ; 1a9b 04
                LR   A,KU                ; 1a9c 00
                LR   A,KL                ; 1a9d 01
                DS   $9                  ; 1a9e 39
                JMP  $f92f               ; 1a9f 29 f9 2f
                LR   A,KL                ; 1aa2 01
                INC                      ; 1aa3 1f
                LR   IS,A                ; 1aa4 0b
                SL   1                   ; 1aa5 13
                LR   A,KU                ; 1aa6 00
                db   $2d                 
                LR   P,K                 ; 1aa8 09
                LR   H,DC                ; 1aa9 11
                LR   A,KL                ; 1aaa 01
                NOP                      ; 1aab 2b
                LR   KU,A                ; 1aac 04
                LR   A,KU                ; 1aad 00
                LR   QL,A                ; 1aae 07
                LNK                      ; 1aaf 19
                LR   IS,A                ; 1ab0 0b
                LR   W,J                 ; 1ab1 1d
                LR   H,DC                ; 1ab2 11
                JMP  $0127               ; 1ab3 29 01 27
                LR   KL,A                ; 1ab6 05
                LR   A,KU                ; 1ab7 00
                DS   $1                  ; 1ab8 31
                SL   1                   ; 1ab9 13
                JMP  $2503               ; 1aba 29 25 03
                LR   QL,A                ; 1abd 07
                LR   IS,A                ; 1abe 0b
                LR   P,K                 ; 1abf 09
                NS   (IS)-               ; 1ac0 fe
                LR   KL,A                ; 1ac1 05
                SL   1                   ; 1ac2 13
                LR   A,QL                ; 1ac3 03
                LR   A,KU                ; 1ac4 00
                DS   $1                  ; 1ac5 31
                LR   H,DC                ; 1ac6 11
                NOP                      ; 1ac7 2b
                LR   A,KU                ; 1ac8 00
                LR   P,K                 ; 1ac9 09
                LR   A,QL                ; 1aca 03
                NOP                      ; 1acb 2b
                LR   A,KU                ; 1acc 00
                LR   A,KL                ; 1acd 01
                NOP                      ; 1ace 2b
                NS   (IS)+               ; 1acf fd
                CI   $27                 ; 1ad0 25 27
                LR   H,DC                ; 1ad2 11
                LR   A,KL                ; 1ad3 01
                NOP                      ; 1ad4 2b
                LR   A,KU                ; 1ad5 00
                LR   IS,A                ; 1ad6 0b
                NOP                      ; 1ad7 2b
                EI                       ; 1ad8 1b
                OUT  $01                 ; 1ad9 27 01
                NI   $19                 ; 1adb 21 19
                LR   KU,A                ; 1add 04
                NS   (IS)+               ; 1ade fd
                CI   $03                 ; 1adf 25 03
                NI   $19                 ; 1ae1 21 19
                LR   A,KU                ; 1ae3 00
                LR   H,DC                ; 1ae4 11
                NOP                      ; 1ae5 2b
                LR   KL,A                ; 1ae6 05
                LR   A,KU                ; 1ae7 00
                SL   4                   ; 1ae8 15
                LR   IS,A                ; 1ae9 0b
                LR   KL,A                ; 1aea 05
                LR   A,KU                ; 1aeb 00
                LR   QL,A                ; 1aec 07
                SL   1                   ; 1aed 13
                LR   A,KU                ; 1aee 00
                OUT  $0b                 ; 1aef 27 0b
                LR   H,DC                ; 1af1 11
                LR   P,K                 ; 1af2 09
                NOP                      ; 1af3 2b
                LR   A,KU                ; 1af4 00
                LR   P0,Q                ; 1af5 0d
                LNK                      ; 1af6 19
                LR   H,DC                ; 1af7 11
                LR   QL,A                ; 1af8 07
                LR   A,KU                ; 1af9 00
                LR   A,KL                ; 1afa 01
                LR   A,KU                ; 1afb 00
                INC                      ; 1afc 1f
                SL   1                   ; 1afd 13
                SR   1                   ; 1afe 12
                LR   A,KL                ; 1aff 01
                LR   A,KU                ; 1b00 00
                DS   $1                  ; 1b01 31
                LR   H,DC                ; 1b02 11
                NOP                      ; 1b03 2b
                LR   A,KU                ; 1b04 00
                SL   1                   ; 1b05 13
                CI   $0b                 ; 1b06 25 0b
                NOP                      ; 1b08 2b
                LR   A,KU                ; 1b09 00
                LR   KL,A                ; 1b0a 05
                SL   1                   ; 1b0b 13
                LR   A,QL                ; 1b0c 03
                LR   P,K                 ; 1b0d 09
                LR   A,KU                ; 1b0e 00
                LR   IS,A                ; 1b0f 0b
                LR   KL,A                ; 1b10 05
                LR   IS,A                ; 1b11 0b
                NI   $00                 ; 1b12 21 00
                LR   QL,A                ; 1b14 07
                SL   1                   ; 1b15 13
                LR   A,KU                ; 1b16 00
                JMP  $0321               ; 1b17 29 03 21
                LR   A,KL                ; 1b1a 01
                DS   $1                  ; 1b1b 31
                LR   KU,A                ; 1b1c 04
                XS   (IS)+               ; 1b1d ed
                LR   P,K                 ; 1b1e 09
                LR   IS,A                ; 1b1f 0b
                LR   H,DC                ; 1b20 11
                INC                      ; 1b21 1f
                LR   A,KU                ; 1b22 00
                JMP  $0321               ; 1b23 29 03 21
                LR   A,KL                ; 1b26 01
                DS   $1                  ; 1b27 31
                LR   A,KU                ; 1b28 00
                LR   H,DC                ; 1b29 11
                NI   $fc                 ; 1b2a 21 fc
                LR   KL,A                ; 1b2c 05
                SL   1                   ; 1b2d 13
                LR   A,QL                ; 1b2e 03
                LR   A,KU                ; 1b2f 00
                SL   1                   ; 1b30 13
                LR   P,K                 ; 1b31 09
                LR   A,KU                ; 1b32 00
                LR   A,KL                ; 1b33 01
                LR   A,KU                ; 1b34 00
                CI   $27                 ; 1b35 25 27
                LR   H,DC                ; 1b37 11
                LR   KL,A                ; 1b38 05
                LR   A,KU                ; 1b39 00
                LR   A,KL                ; 1b3a 01
                LR   QL,A                ; 1b3b 07
                LR   A,KU                ; 1b3c 00
                LR   A,KL                ; 1b3d 01
                LR   A,KU                ; 1b3e 00
                DS   $1                  ; 1b3f 31
                LR   H,DC                ; 1b40 11
                NOP                      ; 1b41 2b
                LR   A,KU                ; 1b42 00
                JMP  $0327               ; 1b43 29 03 27
                LR   QL,A                ; 1b46 07
                LR   A,KL                ; 1b47 01
                CI   $27                 ; 1b48 25 27
                LR   KL,A                ; 1b4a 05
                NS   (IS)+               ; 1b4b fd
                LR   KL,A                ; 1b4c 05
                SL   1                   ; 1b4d 13
                LR   A,QL                ; 1b4e 03
                LR   P,K                 ; 1b4f 09
                LR   A,KU                ; 1b50 00
                LR   QL,A                ; 1b51 07
                LR   H,DC                ; 1b52 11
                OUT  $0b                 ; 1b53 27 0b
                NOP                      ; 1b55 2b
                LR   QL,A                ; 1b56 07
                NI   $fb                 ; 1b57 21 fb
                LR   A,KL                ; 1b59 01
                NOP                      ; 1b5a 2b
                LR   A,KU                ; 1b5b 00
                JMP  A1107               ; 1b5c 29 11 07
                LNK                      ; 1b5f 19
                ASD  $6                  ; 1b60 d6
                SL   4                   ; 1b61 15
                LR   IS,A                ; 1b62 0b
                LR   KL,A                ; 1b63 05
                LR   A,KU                ; 1b64 00
                LR   A,KL                ; 1b65 01
                NOP                      ; 1b66 2b
                LR   A,KU                ; 1b67 00
                LR   H,DC                ; 1b68 11
                NOP                      ; 1b69 2b
                NI   $0d                 ; 1b6a 21 0d
                LR   IS,A                ; 1b6c 0b
                LR   P,K                 ; 1b6d 09
                NS   $b                  ; 1b6e fb
                LR   A,KL                ; 1b6f 01
                NOP                      ; 1b70 2b
                LR   A,KU                ; 1b71 00
                AI   $34                 ; 1b72 24 34
                LR   A,KU                ; 1b74 00
                NI   $0b                 ; 1b75 21 0b
                DS   $1                  ; 1b77 31
                SL   1                   ; 1b78 13
                NOP                      ; 1b79 2b
                INC                      ; 1b7a 1f
                NI   $fc                 ; 1b7b 21 fc
                NS   (IS)+               ; 1b7d fd
                DS   $4                  ; 1b7e 34
                OI   $08                 ; 1b7f 22 08
                LR   J,W                 ; 1b81 1e
                db   $2e                 
                DS   $5                  ; 1b83 35
                NS   $7                  ; 1b84 f7
                LR   QL,A                ; 1b85 07
                LR   P,K                 ; 1b86 09
                LR   KL,A                ; 1b87 05
                LR   A,KU                ; 1b88 00
                LR   H,DC                ; 1b89 11
                EI                       ; 1b8a 1b
                LR   H,DC                ; 1b8b 11
                LR   A,KL                ; 1b8c 01
                NOP                      ; 1b8d 2b
                LR   KU,A                ; 1b8e 04
                NS   $a                  ; 1b8f fa
                NI   $29                 ; 1b90 21 29
                LR   H,DC                ; 1b92 11
                LR   P,K                 ; 1b93 09
                LR   QL,A                ; 1b94 07
                LR   A,KU                ; 1b95 00
                LR   QL,A                ; 1b96 07
                LNK                      ; 1b97 19
                LR   A,KL                ; 1b98 01
                NOP                      ; 1b99 2b
                SL   4                   ; 1b9a 15
                LR   A,KL                ; 1b9b 01
                NOP                      ; 1b9c 2b
                EI                       ; 1b9d 1b
                LR   KU,A                ; 1b9e 04
                LR   A,KU                ; 1b9f 00
                NOP                      ; 1ba0 2b
                SL   1                   ; 1ba1 13
                db   $2d                 
                SL   1                   ; 1ba3 13
                INC                      ; 1ba4 1f
                LR   KL,A                ; 1ba5 05
                DS   $9                  ; 1ba6 39
                NI   $00                 ; 1ba7 21 00
                CI   $0b                 ; 1ba9 25 0b
                LR   P,K                 ; 1bab 09
                LR   W,J                 ; 1bac 1d
                LR   IS,A                ; 1bad 0b
                DS   $1                  ; 1bae 31
                LR   QL,A                ; 1baf 07
                LR   A,KL                ; 1bb0 01
                LR   A,KU                ; 1bb1 00
                DS   $1                  ; 1bb2 31
                LR   H,DC                ; 1bb3 11
                NOP                      ; 1bb4 2b
                LR   A,KU                ; 1bb5 00
                SL   4                   ; 1bb6 15
                LR   IS,A                ; 1bb7 0b
                LR   KL,A                ; 1bb8 05
                LR   A,KU                ; 1bb9 00
                LR   A,QL                ; 1bba 03
                CI   $fb                 ; 1bbb 25 fb
                LR   KL,A                ; 1bbd 05
                SL   1                   ; 1bbe 13
                LR   A,QL                ; 1bbf 03
                LR   P,K                 ; 1bc0 09
                LR   A,KU                ; 1bc1 00
                NI   $15                 ; 1bc2 21 15
                LR   A,KL                ; 1bc4 01
                OUT  $27                 ; 1bc5 27 27
                NI   $00                 ; 1bc7 21 00
                LR   A,KL                ; 1bc9 01
                NOP                      ; 1bca 2b
                NS   (IS)+               ; 1bcb fd
                NS   (IS)+               ; 1bcc fd
                JMP  $0321               ; 1bcd 29 03 21
                LR   A,KL                ; 1bd0 01
                DS   $1                  ; 1bd1 31
                NS   $6                  ; 1bd2 f6
                NS   (IS)+               ; 1bd3 fd
                JMP  A1107               ; 1bd4 29 11 07
                LNK                      ; 1bd7 19
                NS   $3                  ; 1bd8 f3
                LR   QL,A                ; 1bd9 07
                SL   1                   ; 1bda 13
                LR   A,QL                ; 1bdb 03
                DS   $1                  ; 1bdc 31
                LNK                      ; 1bdd 19
                LR   QL,A                ; 1bde 07
                LR   KL,A                ; 1bdf 05
                CI   $01                 ; 1be0 25 01
                NOP                      ; 1be2 2b
                EI                       ; 1be3 1b
                XS   $5                  ; 1be4 e5
                NS   (IS)-               ; 1be5 fe
                LR   A,KL                ; 1be6 01
                LR   A,KU                ; 1be7 00
                DS   $1                  ; 1be8 31
                LR   H,DC                ; 1be9 11
                NOP                      ; 1bea 2b
                LR   A,KU                ; 1beb 00
                JMP  $111b               ; 1bec 29 11 1b
                NOP                      ; 1bef 2b
                LR   A,KL                ; 1bf0 01
                LR   W,J                 ; 1bf1 1d
                LR   KL,A                ; 1bf2 05
                NS   (IS)                ; 1bf3 fc
                NS   (IS)+               ; 1bf4 fd
                LR   KL,A                ; 1bf5 05
                SL   1                   ; 1bf6 13
                LR   A,QL                ; 1bf7 03
                LR   P,K                 ; 1bf8 09
                LR   A,KU                ; 1bf9 00
                CI   $13                 ; 1bfa 25 13
                LR   P0,Q                ; 1bfc 0d
                LR   IS,A                ; 1bfd 0b
                LR   P,K                 ; 1bfe 09
                NI   $00                 ; 1bff 21 00
                LR   A,KL                ; 1c01 01
                NOP                      ; 1c02 2b
                JMP  A1107               ; 1c03 29 11 07
                LNK                      ; 1c06 19
                NS   $3                  ; 1c07 f3
                JMP  $0321               ; 1c08 29 03 21
                LR   A,KL                ; 1c0b 01
                DS   $1                  ; 1c0c 31
                NS   $4                  ; 1c0d f4
                LR   QL,A                ; 1c0e 07
                SL   1                   ; 1c0f 13
                LR   A,QL                ; 1c10 03
                DS   $1                  ; 1c11 31
                LNK                      ; 1c12 19
                LR   QL,A                ; 1c13 07
                LR   KL,A                ; 1c14 05
                CI   $01                 ; 1c15 25 01
                NOP                      ; 1c17 2b
                EI                       ; 1c18 1b
                NS   $a                  ; 1c19 fa
                DS   $1                  ; 1c1a 31
                SL   1                   ; 1c1b 13
                JMP  $2503               ; 1c1c 29 25 03
                LR   QL,A                ; 1c1f 07
                LR   IS,A                ; 1c20 0b
                LR   P,K                 ; 1c21 09
                NS   $5                  ; 1c22 f5
                CI   $09                 ; 1c23 25 09
                SL   1                   ; 1c25 13
                EI                       ; 1c26 1b
                LR   P,K                 ; 1c27 09
                LR   H,DC                ; 1c28 11
                JMP  $2901               ; 1c29 29 29 01
                NOP                      ; 1c2c 2b
                EI                       ; 1c2d 1b
                NS   (IS)                ; 1c2e fc
                OUT  $0b                 ; 1c2f 27 0b
                LR   H,DC                ; 1c31 11
                LR   P,K                 ; 1c32 09
                NOP                      ; 1c33 2b
                LR   A,KU                ; 1c34 00
                LR   QL,A                ; 1c35 07
                SL   1                   ; 1c36 13
                NS   $7                  ; 1c37 f7
; Demo text advertises creating programs in VIDEO BASIC ($1C5B).
; The following sample at $1C76 includes WHILE TX LE 96, DO SHOW TANK,
; ENDWHILE and ENDPROGRAM. Text alone does not establish an interpreter.
                DS   $1                  ; 1c38 31
                LR   P,K                 ; 1c39 09
                LR   IS,A                ; 1c3a 0b
                LR   H,DC                ; 1c3b 11
                LR   QL,A                ; 1c3c 07
                LR   IS,A                ; 1c3d 0b
                LR   A,KU                ; 1c3e 00
                LR   KL,A                ; 1c3f 05
                SL   1                   ; 1c40 13
                LR   A,QL                ; 1c41 03
                LR   P,K                 ; 1c42 09
                LR   A,KU                ; 1c43 00
                SL   1                   ; 1c44 13
                LR   P0,Q                ; 1c45 0d
                NOP                      ; 1c46 2b
                LR   A,KU                ; 1c47 00
                DS   $1                  ; 1c48 31
                SL   1                   ; 1c49 13
                JMP  $2503               ; 1c4a 29 25 03
                LR   QL,A                ; 1c4d 07
                LR   IS,A                ; 1c4e 0b
                LR   P,K                 ; 1c4f 09
                LR   A,KU                ; 1c50 00
                CI   $09                 ; 1c51 25 09
                SL   1                   ; 1c53 13
                EI                       ; 1c54 1b
                LR   P,K                 ; 1c55 09
                LR   H,DC                ; 1c56 11
                JMP  $012b               ; 1c57 29 01 2b
                LR   A,KU                ; 1c5a 00
                db   $2f                 
                LR   A,KL                ; 1c5c 01
                INC                      ; 1c5d 1f
                LR   IS,A                ; 1c5e 0b
                SL   1                   ; 1c5f 13
                LR   A,KU                ; 1c60 00
                db   $2d                 
                LR   H,DC                ; 1c62 11
                NI   $01                 ; 1c63 21 01
                DS   $1                  ; 1c65 31
                NS   (IS)+               ; 1c66 fd
                NS   (IS)+               ; 1c67 fd
                EI                       ; 1c68 1b
                LR   H,DC                ; 1c69 11
                JMP  $0b21               ; 1c6a 29 0b 21
                NS   $6                  ; 1c6d f6
                NS   (IS)+               ; 1c6e fd
                EI                       ; 1c6f 1b
                LR   P,K                 ; 1c70 09
                LR   H,DC                ; 1c71 11
                CI   $19                 ; 1c72 25 19
                NI   $f7                 ; 1c74 21 f7
                LR   A,QL                ; 1c76 03
                NI   $0b                 ; 1c77 21 0b
                LR   P,K                 ; 1c79 09
                LR   A,KU                ; 1c7a 00
                CI   $09                 ; 1c7b 25 09
                SL   1                   ; 1c7d 13
                EI                       ; 1c7e 1b
                LR   P,K                 ; 1c7f 09
                LR   H,DC                ; 1c80 11
                JMP  $2901               ; 1c81 29 29 01
                NOP                      ; 1c84 2b
                EI                       ; 1c85 1b
                LR   P0,Q                ; 1c86 0d
                LNK                      ; 1c87 19
                LR   A,KL                ; 1c88 01
                OUT  $0b                 ; 1c89 27 0b
                LR   A,KU                ; 1c8b 00
                LR   QL,A                ; 1c8c 07
                DS   $3                  ; 1c8d 33
                LR   A,KU                ; 1c8e 00
                OUT  $0b                 ; 1c8f 27 0b
                LR   A,KU                ; 1c91 00
                LR   A,IS                ; 1c92 0a
                LR   J,W                 ; 1c93 1e
                NS   (IS)+               ; 1c94 fd
                INC                      ; 1c95 1f
                SL   1                   ; 1c96 13
                LR   A,KU                ; 1c97 00
                NI   $19                 ; 1c98 21 19
                SL   1                   ; 1c9a 13
                LR   P0,Q                ; 1c9b 0d
                LR   A,KU                ; 1c9c 00
                LR   QL,A                ; 1c9d 07
                LR   H,DC                ; 1c9e 11
                NOP                      ; 1c9f 2b
                SL   4                   ; 1ca0 15
                NS   $b                  ; 1ca1 fb
                NS   (IS)+               ; 1ca2 fd
                LR   QL,A                ; 1ca3 07
                DS   $3                  ; 1ca4 33
                db   $2e                 
                LR   QL,A                ; 1ca6 07
                DS   $3                  ; 1ca7 33
                DS   $0                  ; 1ca8 30
                AI   $f8                 ; 1ca9 24 f8
                LR   IS,A                ; 1cab 0b
                NOP                      ; 1cac 2b
                INC                      ; 1cad 1f
                LR   P0,Q                ; 1cae 0d
                LNK                      ; 1caf 19
                LR   A,KL                ; 1cb0 01
                OUT  $0b                 ; 1cb1 27 0b
                NS   $7                  ; 1cb3 f7
                LR   IS,A                ; 1cb4 0b
                NOP                      ; 1cb5 2b
                INC                      ; 1cb6 1f
                CI   $09                 ; 1cb7 25 09
                SL   1                   ; 1cb9 13
                EI                       ; 1cba 1b
                LR   P,K                 ; 1cbb 09
                LR   H,DC                ; 1cbc 11
                JMP  $f903               ; 1cbd 29 f9 03
                NI   $0b                 ; 1cc0 21 0b
                LR   P,K                 ; 1cc2 09
                LR   A,KU                ; 1cc3 00
                CI   $09                 ; 1cc4 25 09
                SL   1                   ; 1cc6 13
                EI                       ; 1cc7 1b
                LR   P,K                 ; 1cc8 09
                LR   H,DC                ; 1cc9 11
                JMP  $2901               ; 1cca 29 29 01
                NOP                      ; 1ccd 2b
                EI                       ; 1cce 1b
                LR   KL,A                ; 1ccf 05
                LR   IS,A                ; 1cd0 0b
                LR   H,DC                ; 1cd1 11
                LR   P,K                 ; 1cd2 09
                DCI  $f40e               ; 1cd3 2a f4 0e
                LR   Q,DC                ; 1cd6 0e
                NS   $1                  ; 1cd7 f1
                LR   Q,DC                ; 1cd8 0e
                LR   J,W                 ; 1cd9 1e
                NS   $1                  ; 1cda f1
                LR   Q,DC                ; 1cdb 0e
                LI   $ed                 ; 1cdc 20 ed
                AI   $36                 ; 1cde 24 36
                NS   (IS)+               ; 1ce0 fd
                DS   $4                  ; 1ce1 34
                DS   $6                  ; 1ce2 36
                NS   (IS)+               ; 1ce3 fd
                DS   $2                  ; 1ce4 32
                DS   $6                  ; 1ce5 36
                NS   $9                  ; 1ce6 f9
                LR   A,KL                ; 1ce7 01
                NOP                      ; 1ce8 2b
                DS   $1                  ; 1ce9 31
                SL   1                   ; 1cea 13
                JMP  $0b07               ; 1ceb 29 0b 07
                LR   P,K                 ; 1cee 09
                LR   KL,A                ; 1cef 05
                LR   A,KU                ; 1cf0 00
                LR   QL,A                ; 1cf1 07
                SL   1                   ; 1cf2 13
                NS   $5                  ; 1cf3 f5
                db   $2d                 
                LR   IS,A                ; 1cf5 0b
                LR   H,DC                ; 1cf6 11
                LR   QL,A                ; 1cf7 07
                LR   A,KU                ; 1cf8 00
                JMP  $0bf6               ; 1cf9 29 0b f6
                LR   H,DC                ; 1cfc 11
                LR   QL,A                ; 1cfd 07
                LR   A,KU                ; 1cfe 00
                DS   $1                  ; 1cff 31
                LNK                      ; 1d00 19
                LR   IS,A                ; 1d01 0b
                DS   $1                  ; 1d02 31
                SL   4                   ; 1d03 15
                LR   IS,A                ; 1d04 0b
                LR   P,K                 ; 1d05 09
                NI   $04                 ; 1d06 21 04
                AS   $b                  ; 1d08 cb
                LR   KL,A                ; 1d09 05
                SL   1                   ; 1d0a 13
                LR   A,QL                ; 1d0b 03
                LR   P,K                 ; 1d0c 09
                LR   A,KU                ; 1d0d 00
                JMP  $132f               ; 1d0e 29 13 2f
                LR   IS,A                ; 1d11 0b
                LR   KU,A                ; 1d12 04
                LR   A,KL                ; 1d13 01
                LR   A,KU                ; 1d14 00
                LR   H,DC                ; 1d15 11
                OUT  $21                 ; 1d16 27 21
                SL   1                   ; 1d18 13
                LR   A,KU                ; 1d19 00
                CI   $27                 ; 1d1a 25 27
                LR   H,DC                ; 1d1c 11
                LR   KL,A                ; 1d1d 05
                NS   $a                  ; 1d1e fa
                db   $2d                 
                OUT  $11                 ; 1d20 27 11
                DS   $1                  ; 1d22 31
                SL   4                   ; 1d23 15
                ST                       ; 1d24 17
                LR   H,DC                ; 1d25 11
                DS   $1                  ; 1d26 31
                SL   4                   ; 1d27 15
                NS   $8                  ; 1d28 f8
                CI   $01                 ; 1d29 25 01
                NOP                      ; 1d2b 2b
                db   $2d                 
                LR   H,DC                ; 1d2d 11
                OUT  $27                 ; 1d2e 27 27
                NS   $6                  ; 1d30 f6
                EI                       ; 1d31 1b
                OUT  $11                 ; 1d32 27 11
                INC                      ; 1d34 1f
                LR   A,KL                ; 1d35 01
                LR   H,DC                ; 1d36 11
                LR   QL,A                ; 1d37 07
                SL   1                   ; 1d38 13
                LR   P,K                 ; 1d39 09
                NS   $8                  ; 1d3a f8
                COM                      ; 1d3b 18
                LR   P0,Q                ; 1d3c 0d
                LR   H,DC                ; 1d3d 11
                LR   QL,A                ; 1d3e 07
                DS   $1                  ; 1d3f 31
                LNK                      ; 1d40 19
                LR   A,KU                ; 1d41 00
                SL   1                   ; 1d42 13
                LR   A,QL                ; 1d43 03
                LR   QL,A                ; 1d44 07
                LR   A,KU                ; 1d45 00
                LR   W,J                 ; 1d46 1d
                SL   1                   ; 1d47 13
                LR   P,K                 ; 1d48 09
                NS   (IS)+               ; 1d49 fd
                NS   (IS)+               ; 1d4a fd
                OUT  $01                 ; 1d4b 27 01
                SL   1                   ; 1d4d 13
                NOP                      ; 1d4e 2b
                NI   $16                 ; 1d4f 21 16
                NS   $7                  ; 1d51 f7
                LNK                      ; 1d52 19
                SL   1                   ; 1d53 13
                JMP  $0b00               ; 1d54 29 0b 00
                JMP  A112b               ; 1d57 29 11 2b
                LR   H,DC                ; 1d5a 11
                EI                       ; 1d5b 1b
                LR   IS,A                ; 1d5c 0b
                JMP  $0b2b               ; 1d5d 29 0b 2b
                LR   QL,A                ; 1d60 07
                DCI  $fd01               ; 1d61 2a fd 01
                LR   A,KU                ; 1d64 00
                DS   $1                  ; 1d65 31
                LR   H,DC                ; 1d66 11
                NOP                      ; 1d67 2b
                LR   A,KU                ; 1d68 00
                LNK                      ; 1d69 19
                LR   IS,A                ; 1d6a 0b
                OUT  $25                 ; 1d6b 27 25
                LR   A,KU                ; 1d6d 00
                LR   KL,A                ; 1d6e 05
                SL   1                   ; 1d6f 13
                LR   A,QL                ; 1d70 03
                db   $2d                 
                LR   H,DC                ; 1d72 11
                OUT  $11                 ; 1d73 27 11
                NOP                      ; 1d75 2b
                DS   $1                  ; 1d76 31
                LR   IS,A                ; 1d77 0b
                LR   A,KU                ; 1d78 00
                LR   KL,A                ; 1d79 05
                SL   1                   ; 1d7a 13
                LR   A,QL                ; 1d7b 03
                LR   P,K                 ; 1d7c 09
                NS   $b                  ; 1d7d fb
                DS   $1                  ; 1d7e 31
                LNK                      ; 1d7f 19
                LR   IS,A                ; 1d80 0b
                DS   $1                  ; 1d81 31
                SL   4                   ; 1d82 15
                db   $2d                 
                SL   1                   ; 1d84 13
                SL   1                   ; 1d85 13
                SL   4                   ; 1d86 15
                SR   1                   ; 1d87 12
                NS   $8                  ; 1d88 f8
; Demo text: SOON I CAN KEEP YOUR KITCHEN INVENTORY!
; An advertised future capability, not evidence that a cartridge shipped.
                NI   $13                 ; 1d89 21 13
                SL   1                   ; 1d8b 13
                NOP                      ; 1d8c 2b
                LR   A,KU                ; 1d8d 00
                LR   A,KL                ; 1d8e 01
                LR   A,KU                ; 1d8f 00
                DS   $1                  ; 1d90 31
                LR   H,DC                ; 1d91 11
                NOP                      ; 1d92 2b
                LR   A,KU                ; 1d93 00
                SL   4                   ; 1d94 15
                LR   IS,A                ; 1d95 0b
                LR   IS,A                ; 1d96 0b
                CI   $00                 ; 1d97 25 00
                LR   KL,A                ; 1d99 05
                SL   1                   ; 1d9a 13
                LR   A,QL                ; 1d9b 03
                LR   P,K                 ; 1d9c 09
                LR   A,KU                ; 1d9d 00
                SL   4                   ; 1d9e 15
                LR   A,KL                ; 1d9f 01
                LR   QL,A                ; 1da0 07
                DS   $1                  ; 1da1 31
                LNK                      ; 1da2 19
                LR   IS,A                ; 1da3 0b
                NOP                      ; 1da4 2b
                NS   $b                  ; 1da5 fb
                LR   A,KL                ; 1da6 01
                NOP                      ; 1da7 2b
                db   $2f                 
                LR   IS,A                ; 1da9 0b
                NOP                      ; 1daa 2b
                LR   QL,A                ; 1dab 07
                SL   1                   ; 1dac 13
                LR   P,K                 ; 1dad 09
                LR   KL,A                ; 1dae 05
                LR   KU,A                ; 1daf 04
                NS   $9                  ; 1db0 f9
                LR   W,J                 ; 1db1 1d
                SL   1                   ; 1db2 13
                LR   A,QL                ; 1db3 03
                LR   P,K                 ; 1db4 09
                LR   A,KU                ; 1db5 00
                LR   W,J                 ; 1db6 1d
                LR   A,QL                ; 1db7 03
                NOP                      ; 1db8 2b
                DS   $1                  ; 1db9 31
                LR   QL,A                ; 1dba 07
                LR   A,KL                ; 1dbb 01
                SL   1                   ; 1dbc 13
                NOP                      ; 1dbd 2b
                NI   $fd                 ; 1dbe 21 fd
                db   $2d                 
                LR   A,QL                ; 1dc1 03
                LR   A,KL                ; 1dc2 01
                OUT  $07                 ; 1dc3 27 07
                LR   A,KU                ; 1dc5 00
                LR   A,KL                ; 1dc6 01
                NOP                      ; 1dc7 2b
                DCI  $f807               ; 1dc8 2a f8 07
                LR   IS,A                ; 1dcb 0b
                DS   $3                  ; 1dcc 33
                LR   QL,A                ; 1dcd 07
                LR   A,KU                ; 1dce 00
                LR   IS,A                ; 1dcf 0b
                INC                      ; 1dd0 1f
                LR   A,KL                ; 1dd1 01
                LR   QL,A                ; 1dd2 07
                LR   A,KL                ; 1dd3 01
                NOP                      ; 1dd4 2b
                EI                       ; 1dd5 1b
                NS   $b                  ; 1dd6 fb
                NS   $b                  ; 1dd7 fb
                EI                       ; 1dd8 1b
                SL   1                   ; 1dd9 13
                LR   A,KU                ; 1dda 00
                LR   H,DC                ; 1ddb 11
                LNK                      ; 1ddc 19
                LR   IS,A                ; 1ddd 0b
                LR   H,DC                ; 1dde 11
                INC                      ; 1ddf 1f
                NS   $b                  ; 1de0 fb
                LR   QL,A                ; 1de1 07
                LR   KL,A                ; 1de2 05
                CI   $0b                 ; 1de3 25 0b
                LR   A,KU                ; 1de5 00
                LR   H,DC                ; 1de6 11
                LR   A,KU                ; 1de7 00
                JMP  $0b21               ; 1de8 29 0b 21
                NI   $11                 ; 1deb 21 11
                EI                       ; 1ded 1b
                LR   IS,A                ; 1dee 0b
                ASD  (IS)+               ; 1def dd
; Demo text: (LIKE-HELLO BOB). This is a typing example; it does not
; establish a programmer credit.
                COM                      ; 1df0 18
                OUT  $01                 ; 1df1 27 01
                SL   4                   ; 1df3 15
                LR   IS,A                ; 1df4 0b
                POP                      ; 1df5 1c
                LNK                      ; 1df6 19
                LR   IS,A                ; 1df7 0b
                OUT  $27                 ; 1df8 27 27
                SL   1                   ; 1dfa 13
                LR   A,KU                ; 1dfb 00
                db   $2d                 
                SL   1                   ; 1dfd 13
                db   $2d                 
                LM                       ; 1dff 16
                NS   $9                  ; 1e00 f9
                AI   $34                 ; 1e01 24 34
                LR   A,KU                ; 1e03 00
                NI   $0b                 ; 1e04 21 0b
                DS   $1                  ; 1e06 31
                SL   1                   ; 1e07 13
                NOP                      ; 1e08 2b
                INC                      ; 1e09 1f
                NI   $1d                 ; 1e0a 21 1d
                SL   1                   ; 1e0c 13
                LR   A,QL                ; 1e0d 03
                LR   P,K                 ; 1e0e 09
                LR   A,KU                ; 1e0f 00
                LR   W,J                 ; 1e10 1d
                LR   A,QL                ; 1e11 03
                NOP                      ; 1e12 2b
                DS   $1                  ; 1e13 31
                LR   QL,A                ; 1e14 07
                LR   A,KL                ; 1e15 01
                SL   1                   ; 1e16 13
                NOP                      ; 1e17 2b
                NI   $fd                 ; 1e18 21 fd
                db   $2d                 
                LR   A,QL                ; 1e1b 03
                LR   A,KL                ; 1e1c 01
                OUT  $07                 ; 1e1d 27 07
                LR   A,KU                ; 1e1f 00
                LR   A,KL                ; 1e20 01
                NOP                      ; 1e21 2b
                DCI  $f807               ; 1e22 2a f8 07
                LR   IS,A                ; 1e25 0b
                DS   $3                  ; 1e26 33
                LR   QL,A                ; 1e27 07
                LR   A,KU                ; 1e28 00
                LR   IS,A                ; 1e29 0b
                INC                      ; 1e2a 1f
                LR   A,KL                ; 1e2b 01
                LR   QL,A                ; 1e2c 07
                LR   A,KL                ; 1e2d 01
                NOP                      ; 1e2e 2b
                EI                       ; 1e2f 1b
                NS   $b                  ; 1e30 fb
                DS   $1                  ; 1e31 31
                LR   H,DC                ; 1e32 11
                OUT  $0b                 ; 1e33 27 0b
                NOP                      ; 1e35 2b
                INC                      ; 1e36 1f
                LR   H,DC                ; 1e37 11
                LR   P,K                 ; 1e38 09
                LR   A,KU                ; 1e39 00
                DS   $1                  ; 1e3a 31
                OUT  $13                 ; 1e3b 27 13
                DS   $1                  ; 1e3d 31
                SL   4                   ; 1e3e 15
                NS   (IS)+               ; 1e3f fd
                NS   $9                  ; 1e40 f9
                NI   $03                 ; 1e41 21 03
                NOP                      ; 1e43 2b
                NS   $5                  ; 1e44 f5
                DS   $2                  ; 1e45 32
                AI   $00                 ; 1e46 24 00
                INC                      ; 1e48 1f
                LR   IS,A                ; 1e49 0b
                DS   $1                  ; 1e4a 31
                LR   A,KU                ; 1e4b 00
                AI   $0a                 ; 1e4c 24 0a
                LR   A,IS                ; 1e4e 0a
                LR   A,IS                ; 1e4f 0a
                NS   $9                  ; 1e50 f9
                DS   $4                  ; 1e51 34
                DS   $2                  ; 1e52 32
                DCI  $200a               ; 1e53 2a 20 0a
                DCI  $2034               ; 1e56 2a 20 34
                NS   (IS)+               ; 1e59 fd
                LR   W,J                 ; 1e5a 1d
                SL   1                   ; 1e5b 13
                LR   A,QL                ; 1e5c 03
                LR   P,K                 ; 1e5d 09
                LR   A,KU                ; 1e5e 00
                LR   W,J                 ; 1e5f 1d
                LR   A,QL                ; 1e60 03
                NOP                      ; 1e61 2b
                DS   $1                  ; 1e62 31
                LR   QL,A                ; 1e63 07
                LR   A,KL                ; 1e64 01
                SL   1                   ; 1e65 13
                NOP                      ; 1e66 2b
                NI   $fd                 ; 1e67 21 fd
                db   $2d                 
                LR   A,QL                ; 1e6a 03
                LR   A,KL                ; 1e6b 01
                OUT  $07                 ; 1e6c 27 07
                LR   A,KU                ; 1e6e 00
                LR   A,KL                ; 1e6f 01
                NOP                      ; 1e70 2b
                DCI  $f807               ; 1e71 2a f8 07
                LR   IS,A                ; 1e74 0b
                DS   $3                  ; 1e75 33
                LR   QL,A                ; 1e76 07
                LR   A,KU                ; 1e77 00
                LR   IS,A                ; 1e78 0b
                INC                      ; 1e79 1f
                LR   A,KL                ; 1e7a 01
                LR   QL,A                ; 1e7b 07
                LR   A,KL                ; 1e7c 01
                NOP                      ; 1e7d 2b
                EI                       ; 1e7e 1b
                NS   $b                  ; 1e7f fb
                DS   $1                  ; 1e80 31
                LR   H,DC                ; 1e81 11
                OUT  $0b                 ; 1e82 27 0b
                NOP                      ; 1e84 2b
                INC                      ; 1e85 1f
                LR   H,DC                ; 1e86 11
                LR   P,K                 ; 1e87 09
                LR   A,KU                ; 1e88 00
                DS   $1                  ; 1e89 31
                OUT  $13                 ; 1e8a 27 13
                DS   $1                  ; 1e8c 31
                SL   4                   ; 1e8d 15
                NS   (IS)+               ; 1e8e fd
                DS   $1                  ; 1e8f 31
                SL   1                   ; 1e90 13
                OUT  $13                 ; 1e91 27 13
                LR   P,K                 ; 1e93 09
                LR   A,KU                ; 1e94 00
                db   $2d                 
                LR   H,DC                ; 1e96 11
                LR   P,K                 ; 1e97 09
                NI   $00                 ; 1e98 21 00
                LR   W,J                 ; 1e9a 1d
                SL   1                   ; 1e9b 13
                LR   A,QL                ; 1e9c 03
                LR   P,K                 ; 1e9d 09
                LR   A,KU                ; 1e9e 00
                LR   W,J                 ; 1e9f 1d
                LR   A,QL                ; 1ea0 03
                NOP                      ; 1ea1 2b
                DS   $1                  ; 1ea2 31
                LR   QL,A                ; 1ea3 07
                LR   A,KL                ; 1ea4 01
                SL   1                   ; 1ea5 13
                NOP                      ; 1ea6 2b
                NI   $fd                 ; 1ea7 21 fd
                db   $2d                 
                LR   A,QL                ; 1eaa 03
                LR   A,KL                ; 1eab 01
                OUT  $07                 ; 1eac 27 07
                LR   A,KU                ; 1eae 00
                LR   A,KL                ; 1eaf 01
                NOP                      ; 1eb0 2b
                DCI  $f807               ; 1eb1 2a f8 07
                LR   IS,A                ; 1eb4 0b
                DS   $3                  ; 1eb5 33
                LR   QL,A                ; 1eb6 07
                LR   A,KU                ; 1eb7 00
                LR   IS,A                ; 1eb8 0b
                INC                      ; 1eb9 1f
                LR   A,KL                ; 1eba 01
                LR   QL,A                ; 1ebb 07
                LR   A,KL                ; 1ebc 01
                NOP                      ; 1ebd 2b
                EI                       ; 1ebe 1b
                NS   $b                  ; 1ebf fb
                DS   $1                  ; 1ec0 31
                LR   H,DC                ; 1ec1 11
                OUT  $0b                 ; 1ec2 27 0b
                NOP                      ; 1ec4 2b
                INC                      ; 1ec5 1f
                LR   H,DC                ; 1ec6 11
                LR   P,K                 ; 1ec7 09
                LR   A,KU                ; 1ec8 00
                DS   $1                  ; 1ec9 31
                OUT  $13                 ; 1eca 27 13
                DS   $1                  ; 1ecc 31
                SL   4                   ; 1ecd 15
                NS   (IS)+               ; 1ece fd
                DS   $1                  ; 1ecf 31
                SL   1                   ; 1ed0 13
                OUT  $13                 ; 1ed1 27 13
                LR   P,K                 ; 1ed3 09
                LR   A,KU                ; 1ed4 00
                db   $2d                 
                LR   H,DC                ; 1ed6 11
                LR   P,K                 ; 1ed7 09
                NI   $f9                 ; 1ed8 21 f9
                JMP  $0b21               ; 1eda 29 0b 21
                NI   $11                 ; 1edd 21 11
                EI                       ; 1edf 1b
                LR   IS,A                ; 1ee0 0b
                LR   A,KU                ; 1ee1 00
                LR   H,DC                ; 1ee2 11
                OUT  $11                 ; 1ee3 27 11
                LR   P,K                 ; 1ee5 09
                JMP  $fc29               ; 1ee6 29 fc 29
                LR   IS,A                ; 1ee9 0b
                NI   $21                 ; 1eea 21 21
                LR   H,DC                ; 1eec 11
                EI                       ; 1eed 1b
                LR   IS,A                ; 1eee 0b
                LR   A,KU                ; 1eef 00
                LR   H,DC                ; 1ef0 11
                OUT  $11                 ; 1ef1 27 11
                LR   P,K                 ; 1ef3 09
                JMP  $fcbd               ; 1ef4 29 fc bd
                LR   P,K                 ; 1ef7 09
                LR   IS,A                ; 1ef8 0b
                DS   $1                  ; 1ef9 31
                SL   1                   ; 1efa 13
                EI                       ; 1efb 1b
                NOP                      ; 1efc 2b
                LR   A,KL                ; 1efd 01
                XI   $0b                 ; 1efe 23 0b
                NS   (IS)+               ; 1f00 fd
                NS   (IS)+               ; 1f01 fd
                LR   QL,A                ; 1f02 07
                LNK                      ; 1f03 19
                LR   A,KL                ; 1f04 01
                NI   $00                 ; 1f05 21 00
                JMP  $0b21               ; 1f07 29 0b 21
                NI   $11                 ; 1f0a 21 11
                EI                       ; 1f0c 1b
                LR   IS,A                ; 1f0d 0b
                DS   $5                  ; 1f0e 35
                LR   A,KU                ; 1f0f 00
                NI   $13                 ; 1f10 21 13
                SL   1                   ; 1f12 13
                NOP                      ; 1f13 2b
                LR   A,KU                ; 1f14 00
                LR   A,KL                ; 1f15 01
                LR   A,KU                ; 1f16 00
                DS   $1                  ; 1f17 31
                LR   H,DC                ; 1f18 11
                NOP                      ; 1f19 2b
                LR   A,KU                ; 1f1a 00
                CI   $27                 ; 1f1b 25 27
                LR   A,QL                ; 1f1d 03
                EI                       ; 1f1e 1b
                LR   A,KL                ; 1f1f 01
                NOP                      ; 1f20 2b
                LR   A,KU                ; 1f21 00
                JMP  $1309               ; 1f22 29 13 09
                LR   IS,A                ; 1f25 0b
                LR   A,KU                ; 1f26 00
                CI   $09                 ; 1f27 25 09
                SL   1                   ; 1f29 13
                EI                       ; 1f2a 1b
                LR   P,K                 ; 1f2b 09
                LR   H,DC                ; 1f2c 11
                JMP  $2100               ; 1f2d 29 21 00
                LR   KL,A                ; 1f30 05
                SL   1                   ; 1f31 13
                LR   A,QL                ; 1f32 03
                DS   $9                  ; 1f33 39
                OUT  $27                 ; 1f34 27 27
                LR   A,KU                ; 1f36 00
                OUT  $01                 ; 1f37 27 01
                SL   4                   ; 1f39 15
                LR   IS,A                ; 1f3a 0b
                LR   P0,Q                ; 1f3b 0d
                LNK                      ; 1f3c 19
                LR   H,DC                ; 1f3d 11
                LR   QL,A                ; 1f3e 07
                LR   A,KU                ; 1f3f 00
                INC                      ; 1f40 1f
                SL   1                   ; 1f41 13
                LR   A,KU                ; 1f42 00
                LR   KL,A                ; 1f43 05
                SL   1                   ; 1f44 13
                LR   A,QL                ; 1f45 03
                LR   A,KU                ; 1f46 00
                OUT  $01                 ; 1f47 27 01
                SL   4                   ; 1f49 15
                LR   IS,A                ; 1f4a 0b
                LR   A,KU                ; 1f4b 00
                LR   QL,A                ; 1f4c 07
                LNK                      ; 1f4d 19
                LR   IS,A                ; 1f4e 0b
                LR   A,KU                ; 1f4f 00
                JMP  A1321               ; 1f50 29 13 21
                LR   QL,A                ; 1f53 07
                DS   $5                  ; 1f54 35
                NS   $9                  ; 1f55 f9
                JMP  $0500               ; 1f56 29 05 00
                LR   QL,A                ; 1f59 07
                LR   IS,A                ; 1f5a 0b
                LR   H,DC                ; 1f5b 11
                DS   $1                  ; 1f5c 31
                LNK                      ; 1f5d 19
                LR   A,KL                ; 1f5e 01
                NOP                      ; 1f5f 2b
                EI                       ; 1f60 1b
                DS   $5                  ; 1f61 35
                NS   $b                  ; 1f62 fb
                JMP  $0500               ; 1f63 29 05 00
                EI                       ; 1f66 1b
                LR   H,DC                ; 1f67 11
                JMP  $0b21               ; 1f68 29 0b 21
                DS   $5                  ; 1f6b 35
                NS   $8                  ; 1f6c f8
                LNK                      ; 1f6d 19
                SL   1                   ; 1f6e 13
                JMP  $0b00               ; 1f6f 29 0b 00
                JMP  A112b               ; 1f72 29 11 2b
                LR   H,DC                ; 1f75 11
                EI                       ; 1f76 1b
                LR   IS,A                ; 1f77 0b
                JMP  $0b2b               ; 1f78 29 0b 2b
                LR   QL,A                ; 1f7b 07
                DS   $5                  ; 1f7c 35
                JMP  $0500               ; 1f7d 29 05 00
                EI                       ; 1f80 1b
                SL   1                   ; 1f81 13
                SL   1                   ; 1f82 13
                INC                      ; 1f83 1f
                LR   A,KU                ; 1f84 00
                OUT  $13                 ; 1f85 27 13
                SL   1                   ; 1f87 13
                SL   4                   ; 1f88 15
                NI   $35                 ; 1f89 21 35
                LR   QL,A                ; 1f8b 07
                LNK                      ; 1f8c 19
                LR   A,KL                ; 1f8d 01
                NI   $00                 ; 1f8e 21 00
                LR   A,KL                ; 1f90 01
                NI   $00                 ; 1f91 21 00
                SL   1                   ; 1f93 13
                NOP                      ; 1f94 2b
                OUT  $05                 ; 1f95 27 05
                LR   A,KU                ; 1f97 00
                LR   QL,A                ; 1f98 07
                LNK                      ; 1f99 19
                LR   IS,A                ; 1f9a 0b
                db   $2d                 
                LR   IS,A                ; 1f9c 0b
                EI                       ; 1f9d 1b
                LR   A,KL                ; 1f9e 01
                NOP                      ; 1f9f 2b
                NOP                      ; 1fa0 2b
                LR   A,KL                ; 1fa1 01
                NOP                      ; 1fa2 2b
                EI                       ; 1fa3 1b
                NS   $8                  ; 1fa4 f8
                LR   A,KL                ; 1fa5 01
                LR   W,J                 ; 1fa6 1d
                LR   A,KU                ; 1fa7 00
                LR   KL,A                ; 1fa8 05
                SL   1                   ; 1fa9 13
                LR   A,QL                ; 1faa 03
                LR   A,KU                ; 1fab 00
                LR   P0,Q                ; 1fac 0d
                LR   H,DC                ; 1fad 11
                NOP                      ; 1fae 2b
                LR   QL,A                ; 1faf 07
                LR   A,KU                ; 1fb0 00
                LR   QL,A                ; 1fb1 07
                SL   1                   ; 1fb2 13
                NS   (IS)+               ; 1fb3 fd
                NI   $0b                 ; 1fb4 21 0b
                LR   IS,A                ; 1fb6 0b
                LR   A,KU                ; 1fb7 00
                JMP  $1309               ; 1fb8 29 13 09
                LR   IS,A                ; 1fbb 0b
                XDC                      ; 1fbc 2c
                NS   $8                  ; 1fbd f8
                CI   $27                 ; 1fbe 25 27
                LR   IS,A                ; 1fc0 0b
                LR   H,DC                ; 1fc1 11
                NI   $0b                 ; 1fc2 21 0b
                LR   A,KU                ; 1fc4 00
                LR   H,DC                ; 1fc5 11
                NI   $15                 ; 1fc6 21 15
                NS   $9                  ; 1fc8 f9
                LR   QL,A                ; 1fc9 07
                LNK                      ; 1fca 19
                LR   IS,A                ; 1fcb 0b
                LR   A,KU                ; 1fcc 00
                NI   $11                 ; 1fcd 21 11
                OUT  $0b                 ; 1fcf 27 0b
                NI   $25                 ; 1fd1 21 25
                LR   IS,A                ; 1fd3 0b
                LR   P,K                 ; 1fd4 09
                NI   $13                 ; 1fd5 21 13
                NOP                      ; 1fd7 2b
                LR   P,K                 ; 1fd8 09
                LR   A,KU                ; 1fd9 00
                LR   QL,A                ; 1fda 07
                LR   A,KU                ; 1fdb 00
                LR   A,KU                ; 1fdc 00
                LR   A,KU                ; 1fdd 00
                LR   A,KU                ; 1fde 00
                LR   DC,Q                ; 1fdf 0f
A1fe0:          LR   A,$1                ; 1fe0 41
                CI   $00                 ; 1fe1 25 00
                BT   4,A1fe8             ; 1fe3 84 04
                JMP  A14b4               ; 1fe5 29 14 b4
A1fe8:          JMP  A151b               ; 1fe8 29 15 1b
A1feb:          JMP  A10fe               ; 1feb 29 10 fe
                OUTS 4                   ; 1fee b4
                JMP  $7552               ; 1fef 29 75 52
                JMP  A1328               ; 1ff2 29 13 28
A1ff5:          DS   $2                  ; 1ff5 32
                BT   4,A1feb             ; 1ff6 84 f4
                LIS  $0                  ; 1ff8 70
                XS   $8                  ; 1ff9 e8
                BT   1,A1feb             ; 1ffa 81 f0
                JMP  A1328               ; 1ffc 29 13 28
                LR   A,KU                ; 1fff 00
