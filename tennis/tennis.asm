; Tennis adaptation for stock VideoBrain hardware.
; Retail disassembly by Sean Riddle, January 29, 2010.
; Patent transcription by e5frog, May 2012.
; Sources: seanriddle.com/videobrain.html; US4232374.

        processor f8
        ifnconst PATENT_COURT
PATENT_COURT = 2
        endif
        org $1000

                db $aa,$55 ; 1000
                db $01 ; 1002
                db $00,$00,$00,$00,$07,$0b,$2b,$2b,$01,$21,$00,$00,$00,$00,$00 ; 1003
START:          DCI  $0f8b ; 1012
                XDC ; 1015
                DCI  $1613 ; 1016
                LI   $10 ; 1019
                LR   $7,A ; 101b
                PI   A1272 ; 101c
                DCI  $0f9b ; 101f
                LIS  $0 ; 1022
                ST ; 1023
                ST ; 1024
                ST ; 1025
A1026:          DI ; 1026
                LR   J,W ; 1027
                DCI  $0c00 ; 1028
                LIS  $8 ; 102b
                LR   $a,A ; 102c
A102d:          LIS  $7 ; 102d
                ST ; 102e
                LIS  $0 ; 102f
                ST ; 1030
                LIS  $2 ; 1031
                ST ; 1032
                LI   $80 ; 1033
                ST ; 1035
                DS   $a ; 1036
                BF   $4,A102d ; 1037
                PI   $45db ; 1039
                PI   $41c8 ; 103c
                DCI  A15cb ; 103f
                LI   $20 ; 1042
                LISU 2 ; 1044
                LISL 4 ; 1045
                LR   12,A ; 1046
                PI   $4205 ; 1047
                LI   $40 ; 104a
                DCI  $0fdf ; 104c
                ST ; 104f
                LISL 4 ; 1050
                LIS  $c ; 1051
                LR   12,A ; 1052
                DCI  A15eb ; 1053
                PI   $4205 ; 1056
                LI   $36 ; 1059
                DCI  $0fdf ; 105b
                ST ; 105e
                LI   $ff ; 105f
                LR   $7,A ; 1061
                LIS  $0 ; 1062
                LR   $5,A ; 1063
                LR   $6,A ; 1064
A1065:          LIS  $0 ; 1065
                DCI  $0fe2 ; 1066
                ST ; 1069
                PI   A14b6 ; 106a
                LIS  $a ; 106d
                LR   $1,A ; 106e
                LR   A,$8 ; 106f
                INC ; 1070
                LR   $8,A ; 1071
                DCI  $245e ; 1072
                CI   $40 ; 1075
                BT   4,A109d ; 1077
A1079:          CM ; 1079
                BT   4,A1081 ; 107a
                DS   $1 ; 107c
                BF   $4,A1079 ; 107d
                BF   $0,A1065 ; 107f
A1081:          PI   $40d9 ; 1081
                PI   $412d ; 1084
                DCI  $0f9b ; 1087
                LR   A,$7 ; 108a
                INC ; 108b
                LR   $7,A ; 108c
                CI   $02 ; 108d
                BT   4,START ; 108f
                ADC ; 1091
                LR   A,$8 ; 1092
                ST ; 1093
                DCI  $0f9e ; 1094
                LR   A,$7 ; 1097
                ADC ; 1098
                LR   A,$1 ; 1099
                ST ; 109a
                BF   $0,A1065 ; 109b
A109d:          LR   A,$7 ; 109d
                INC ; 109e
                LR   $7,A ; 109f
                LIS  $0 ; 10a0
                LR   $1,A ; 10a1
                LR   $2,A ; 10a2
                LIS  $2 ; 10a3
                LR   $4,A ; 10a4
A10a5:          DS   $4 ; 10a5
                DS   $7 ; 10a6
                BF   $1,A10c2 ; 10a7
                LR   A,$7 ; 10a9
                DCI  $0f9e ; 10aa
                ADC ; 10ad
                LM ; 10ae
                LR   $5,A ; 10af
                DCI  A1eeb ; 10b0
                LR   A,$4 ; 10b3
                ADC ; 10b4
                LM ; 10b5
                LR   $6,A ; 10b6
A10b7:          DS   $5 ; 10b7
                BT   4,A10a5 ; 10b8
                LR   A,$1 ; 10ba
                AS   $6 ; 10bb
                LR   $1,A ; 10bc
                LR   A,$2 ; 10bd
                LNK ; 10be
                LR   $2,A ; 10bf
                BF   $0,A10b7 ; 10c0
A10c2:          LISU 3 ; 10c2
                LISL 7 ; 10c3
                LIS  $0 ; 10c4
A10c5:          LR   14,A ; 10c5
                BR7  A10c5 ; 10c6
                LISU 4 ; 10c8
A10c9:          LR   14,A ; 10c9
                BR7  A10c9 ; 10ca
                LISU 3 ; 10cc
                LISL 2 ; 10cd
                LR   A,$1 ; 10ce
                LR   12,A ; 10cf
                CI   $5f ; 10d0
                BT   2,A10d7 ; 10d2
                JMP  START ; 10d4
A10d7:          LI   $ff ; 10d7
                DCI  $08f5 ; 10d9
                ST ; 10dc
                LIS  $0 ; 10dd
                OUTS 0 ; 10de
                OUTS 1 ; 10df
                DCI  $0fdd ; 10e0
                ST ; 10e3
                ST ; 10e4
                DCI  $0fda ; 10e5
                ST ; 10e8
                LI   $11 ; 10e9
                OUTS 12 ; 10eb
                LI   $ff ; 10ec
                OUTS 13 ; 10ee
                LI   $ff ; 10ef
                DCI  $08f0 ; 10f1
                ST ; 10f4
                LIS  $1 ; 10f5
                OUTS 14 ; 10f6
                LI   $4c ; 10f7
                DCI  $0fea ; 10f9
                ST ; 10fc
                DCI  $08f7 ; 10fd
                ST ; 1100
                EI ; 1101
                SR   1 ; 1102
                LR   J,W ; 1103
                DCI  $0f60 ; 1104
                LI   $2a ; 1107
                LR   $1,A ; 1109
                LIS  $0 ; 110a
A110b:          ST ; 110b
                DS   $1 ; 110c
                BF   $4,A110b ; 110d
                DCI  $0fa5 ; 110f
                LI   $4b ; 1112
                ST ; 1114
                ST ; 1115
                ST ; 1116
                ST ; 1117
                DCI  $0d0c ; 1118
                XDC ; 111b
                DCI  A1b4a ; 111c
                LISU 2 ; 111f
                LISL 0 ; 1120
                LIS  $1 ; 1121
                LR   13,A ; 1122
                LR   13,A ; 1123
                LIS  $0 ; 1124
                LR   12,A ; 1125
                PI   $4686 ; 1126
                DCI  $0d0d ; 1129
                XDC ; 112c
                DCI  A1b49 ; 112d
                LIS  $0 ; 1130
                LR   12,A ; 1131
                PI   $4686 ; 1132
                DCI  $0f0c ; 1135
                XDC ; 1138
                DCI  A1d49 ; 1139
                LIS  $0 ; 113c
                LISL 0 ; 113d
                LR   13,A ; 113e
                LR   13,A ; 113f
                LI   $54 ; 1140
                LR   12,A ; 1142
                PI   $4686 ; 1143
                DCI  $0cc0 ; 1146
                XDC ; 1149
                DCI  A1e4b ; 114a
                LI   $20 ; 114d
                LR   $7,A ; 114f
                PI   A1272 ; 1150
                LI   $80 ; 1153
                DCI  $0fa9 ; 1155
                ST ; 1158
                LI   $10 ; 1159
                LR   $7,A ; 115b
                LISU 4 ; 115c
                LISL 7 ; 115d
                LIS  $0 ; 115e
A115f:          LR   14,A ; 115f
                BR7  A115f ; 1160
                JMP  A1303 ; 1162
A1165:          LISL 5 ; 1165
                LIS  $1 ; 1166
                NS   12 ; 1167
                DCI  A1e9f ; 1168
                BF   $4,A1179 ; 116b
                DCI  A1e95 ; 116d
                LISL 2 ; 1170
                LI   $20 ; 1171
                NS   12 ; 1173
                BT   4,A1179 ; 1174
                DCI  A1e85 ; 1176
A1179:          LR   H,DC ; 1179
A117a:          LR   DC,H ; 117a
                LM ; 117b
                CI   $ff ; 117c
                BF   $4,A1183 ; 117e
                JMP  A1736 ; 1180
A1183:          LR   QU,A ; 1183
                LM ; 1184
                LR   QL,A ; 1185
                LM ; 1186
                LR   $0,A ; 1187
                LR   H,DC ; 1188
                PI   A12d5 ; 1189
A118c:          LR   DC,Q ; 118c
                LM ; 118d
                LR   $4,A ; 118e
                LR   Q,DC ; 118f
                PI   A1297 ; 1190
                XS   $4 ; 1193
                LR   DC,Q ; 1194
                LM ; 1195
                LR   Q,DC ; 1196
                BF   $1,A11c2 ; 1197
A1199:          LIS  $0 ; 1199
                XS   $4 ; 119a
                BT   1,A118c ; 119b
                XDC ; 119d
                LI   $fc ; 119e
                ADC ; 11a0
A11a1:          LR   A,$1 ; 11a1
                ST ; 11a2
                LM ; 11a3
                LR   A,$2 ; 11a4
                ST ; 11a5
                LR   A,$0 ; 11a6
                CI   $15 ; 11a7
                BF   $4,A117a ; 11a9
                LISU 3 ; 11ab
                LISL 6 ; 11ac
                LIS  $1 ; 11ad
                NS   12 ; 11ae
                LIS  $0 ; 11af
                LR   12,A ; 11b0
                LISU 3 ; 11b1
                BF   $4,A117a ; 11b2
                LISL 4 ; 11b4
                LIS  $0 ; 11b5
                XS   12 ; 11b6
                BT   1,A11bb ; 11b7
                LIS  $1 ; 11b9
                LR   12,A ; 11ba
A11bb:          DCI  $0c80 ; 11bb
                LIS  $0 ; 11be
                LR   $0,A ; 11bf
                BF   $0,A11a1 ; 11c0
A11c2:          CI   $04 ; 11c2
                BT   4,A11fa ; 11c4
                CI   $00 ; 11c6
                BF   $4,A11cd ; 11c8
                JMP  A1a05 ; 11ca
A11cd:          CI   $01 ; 11cd
                BF   $4,A11d4 ; 11cf
                JMP  A19cb ; 11d1
A11d4:          CI   $02 ; 11d4
                BF   $4,A11db ; 11d6
                JMP  A1a94 ; 11d8
A11db:          CI   $03 ; 11db
                BF   $4,A11e2 ; 11dd
                JMP  A1925 ; 11df
A11e2:          CI   $05 ; 11e2
                BF   $4,A11e9 ; 11e4
                JMP  A18a7 ; 11e6
A11e9:          CI   $06 ; 11e9
                BF   $4,A11f0 ; 11eb
                JMP  A19f9 ; 11ed
A11f0:          CI   $07 ; 11f0
                BF   $4,A11f7 ; 11f2
                JMP  A19c4 ; 11f4
A11f7:          JMP  A1b05 ; 11f7
A11fa:          PI   A1623 ; 11fa
                BF   $0,A1199 ; 11fd
                LR   $3,A ; 11ff
                LR   A,IS ; 1200
                LISU 4 ; 1201
                LISL 4 ; 1202
                LR   13,A ; 1203
                LR   A,QU ; 1204
                LR   13,A ; 1205
                LR   A,QL ; 1206
                LR   13,A ; 1207
                LR   A,$9 ; 1208
                LR   13,A ; 1209
                XDC ; 120a
                LR   Q,DC ; 120b
                DCI  $0fac ; 120c
                LISU 2 ; 120f
                LISL 0 ; 1210
                LR   A,13 ; 1211
                ST ; 1212
                LR   A,13 ; 1213
                ST ; 1214
                LR   A,13 ; 1215
                ST ; 1216
                LR   A,13 ; 1217
                ST ; 1218
                LR   A,QU ; 1219
                ST ; 121a
                LR   A,QL ; 121b
                ST ; 121c
                XDC ; 121d
                LR   Q,DC ; 121e
                XDC ; 121f
                LR   A,KU ; 1220
                ST ; 1221
                LR   A,KL ; 1222
                ST ; 1223
                LR   A,$a ; 1224
                ST ; 1225
                LR   A,$b ; 1226
                ST ; 1227
                LR   J,W ; 1228
                LR   A,$9 ; 1229
                ST ; 122a
                LR   K,P ; 122b
                LR   A,KU ; 122c
                ST ; 122d
                LR   A,KL ; 122e
                ST ; 122f
                LR   A,QU ; 1230
                ST ; 1231
                LR   A,QL ; 1232
                ST ; 1233
                PI   $424d ; 1234
                DCI  $0fac ; 1237
                LISU 2 ; 123a
                LISL 0 ; 123b
                LM ; 123c
                LR   13,A ; 123d
                LM ; 123e
                LR   13,A ; 123f
                LM ; 1240
                LR   13,A ; 1241
                LM ; 1242
                LR   13,A ; 1243
                LM ; 1244
                LR   QU,A ; 1245
                LM ; 1246
                LR   QL,A ; 1247
                XDC ; 1248
                LR   DC,Q ; 1249
                XDC ; 124a
                LIS  $2 ; 124b
                ADC ; 124c
                LM ; 124d
                LR   $a,A ; 124e
                LM ; 124f
                LR   $b,A ; 1250
                LM ; 1251
                LR   $9,A ; 1252
                LR   W,J ; 1253
                LM ; 1254
                LR   KU,A ; 1255
                LM ; 1256
                LR   KL,A ; 1257
                LR   P,K ; 1258
                LM ; 1259
                LR   QU,A ; 125a
                LM ; 125b
                LR   QL,A ; 125c
                DCI  $0fb2 ; 125d
                LM ; 1260
                LR   KU,A ; 1261
                LM ; 1262
                LR   KL,A ; 1263
                LR   DC,Q ; 1264
                LISU 4 ; 1265
                LISL 7 ; 1266
                LR   A,14 ; 1267
                LR   $9,A ; 1268
                LR   A,14 ; 1269
                LR   QL,A ; 126a
                LR   A,14 ; 126b
                LR   QU,A ; 126c
                LR   A,14 ; 126d
                LR   IS,A ; 126e
                LR   A,$3 ; 126f
                EI ; 1270
                POP ; 1271
A1272:          LR   K,P ; 1272
A1273:          LM ; 1273
                XDC ; 1274
                ST ; 1275
                XDC ; 1276
                DS   $7 ; 1277
                BF   $4,A1273 ; 1278
                PK ; 127a
A127b:          LR   K,P ; 127b
                LISU 5 ; 127c
                LISL 7 ; 127d
                DCI  $0c80 ; 127e
                LI   $10 ; 1281
                LR   $0,A ; 1283
                LIS  $2 ; 1284
                LR   $2,A ; 1285
A1286:          LM ; 1286
                LR   $1,A ; 1287
                LM ; 1288
                COM ; 1289
                INC ; 128a
                AS   $1 ; 128b
                COM ; 128c
                LR   13,A ; 128d
                BR7  A1291 ; 128e
                LISU 6 ; 1290
A1291:          LR   A,$2 ; 1291
                ADC ; 1292
                DS   $0 ; 1293
                BF   $4,A1286 ; 1294
                PK ; 1296
A1297:          LR   K,P ; 1297
                DCI  $0c80 ; 1298
                LR   A,$4 ; 129b
                SL   1 ; 129c
                SL   1 ; 129d
                ADC ; 129e
                LM ; 129f
                COM ; 12a0
                AS   $1 ; 12a1
                BF   $1,A12a5 ; 12a2
                COM ; 12a4
A12a5:          LR   $8,A ; 12a5
                LR   A,$5 ; 12a6
                AM ; 12a7
                AS   $8 ; 12a8
                BF   $2,A12bb ; 12a9
                LM ; 12ab
                COM ; 12ac
                AS   $2 ; 12ad
                BF   $1,A12b1 ; 12ae
                COM ; 12b0
A12b1:          LR   $8,A ; 12b1
                LM ; 12b2
                AS   $6 ; 12b3
                AS   $8 ; 12b4
                BF   $2,A12bb ; 12b5
                LI   $80 ; 12b7
                BF   $0,A12bc ; 12b9
A12bb:          LIS  $0 ; 12bb
A12bc:          PK ; 12bc
A12bd:          LR   K,P ; 12bd
                XDC ; 12be
                LR   DC,H ; 12bf
                LI   $fe ; 12c0
                ADC ; 12c2
                LR   H,DC ; 12c3
                CM ; 12c4
                CM ; 12c5
                XDC ; 12c6
A12c7:          LIS  $7 ; 12c7
                LR   $2,A ; 12c8
                LIS  $2 ; 12c9
                LR   $7,A ; 12ca
A12cb:          LM ; 12cb
                XDC ; 12cc
                ST ; 12cd
                LR   A,$7 ; 12ce
                ADC ; 12cf
                XDC ; 12d0
                DS   $2 ; 12d1
                BF   $4,A12cb ; 12d2
                PK ; 12d4
A12d5:          LR   K,P ; 12d5
                DCI  $0c80 ; 12d6
                LR   A,$0 ; 12d9
                SL   1 ; 12da
                SL   1 ; 12db
                ADC ; 12dc
                XDC ; 12dd
                DCI  $0ce0 ; 12de
                SR   1 ; 12e1
                ADC ; 12e2
                LM ; 12e3
                XDC ; 12e4
                AM ; 12e5
                LR   $1,A ; 12e6
                LM ; 12e7
                LR   $5,A ; 12e8
                LM ; 12e9
                LR   $7,A ; 12ea
                LM ; 12eb
                LR   $6,A ; 12ec
                XDC ; 12ed
                LR   A,$7 ; 12ee
                AM ; 12ef
                LR   $2,A ; 12f0
                PK ; 12f1
A12f2:          LI   $1e ; 12f2
                LR   $7,A ; 12f4
                LIS  $8 ; 12f5
                LR   $8,A ; 12f6
A12f7:          PI   A148f ; 12f7
                LR   A,$8 ; 12fa
                XI   $10 ; 12fb
                LR   $8,A ; 12fd
                DS   $7 ; 12fe
                BF   $4,A12f7 ; 12ff
                LIS  $6 ; 1301
                LR   $7,A ; 1302
A1303:          LISU 3 ; 1303
                LISL 5 ; 1304
                LIS  $0 ; 1305
                LR   $0,A ; 1306
                DCI  A1de5 ; 1307
A130a:          PI   A142c ; 130a
                LR   A,$0 ; 130d
                INC ; 130e
                LR   $0,A ; 130f
                DS   $7 ; 1310
                BF   $4,A130a ; 1311
                DCI  $1dc5 ; 1313
                LR   H,DC ; 1316
                LI   $60 ; 1317
                LR   $5,A ; 1319
                DCI  A1dd9 ; 131a
                LR   W,J ; 131d
                BT   1,A132a ; 131e
                DCI  A1dc9 ; 1320
                LR   H,DC ; 1323
                LI   $5a ; 1324
                LR   $5,A ; 1326
                DCI  A1dd5 ; 1327
A132a:          LR   $8,A ; 132a
                LIS  $5 ; 132b
                LR   $0,A ; 132c
                PI   A1468 ; 132d
                DCI  A1db9 ; 1330
                LR   W,J ; 1333
                BT   1,A1339 ; 1334
                DCI  $1dbd ; 1336
A1339:          LIS  $6 ; 1339
                LR   $0,A ; 133a
                PI   A1468 ; 133b
                DCI  $0fa1 ; 133e
                LR   A,$a ; 1341
                ST ; 1342
                LR   A,$b ; 1343
                ST ; 1344
                DCI  $0cac ; 1345
                LR   A,$5 ; 1348
                ST ; 1349
                DCI  $0ca8 ; 134a
                ST ; 134d
                DCI  $0ca4 ; 134e
                ST ; 1351
                LI   $80 ; 1352
                NS   12 ; 1354
                AI   $03 ; 1355
                LR   12,A ; 1357
                DCI  $0d0a ; 1358
                LIS  $0 ; 135b
                ST ; 135c
                ST ; 135d
                DCI  $0cd4 ; 135e
                XDC ; 1361
                DCI  A1e5f ; 1362
                LIS  $4 ; 1365
                LR   $7,A ; 1366
                PI   A1272 ; 1367
                LISL 3 ; 136a
                LIS  $3 ; 136b
                LR   13,A ; 136c
                LIS  $1 ; 136d
                LR   12,A ; 136e
                LISL 1 ; 136f
                LIS  $4 ; 1370
                LR   13,A ; 1371
                LIS  $8 ; 1372
                LR   $1,A ; 1373
                DCI  $0ce2 ; 1374
                LIS  $0 ; 1377
A1378:          ST ; 1378
                DS   $1 ; 1379
                BF   $4,A1378 ; 137a
                LR   W,J ; 137c
                LIS  $0 ; 137d
                BT   1,A1381 ; 137e
                LIS  $1 ; 1380
A1381:          LR   $1,A ; 1381
                LISU 3 ; 1382
                LISL 2 ; 1383
                LI   $20 ; 1384
                NS   12 ; 1386
                LIS  $0 ; 1387
                BT   4,A138b ; 1388
                LIS  $2 ; 138a
A138b:          AS   $1 ; 138b
                LR   $1,A ; 138c
                DCI  $0fa9 ; 138d
                LM ; 1390
                XI   $80 ; 1391
                DCI  $0fa9 ; 1393
                ST ; 1396
                LIS  $0 ; 1397
                BT   1,A139b ; 1398
                LIS  $4 ; 139a
A139b:          AS   $1 ; 139b
                DCI  A13ec ; 139c
                SL   1 ; 139f
                SL   1 ; 13a0
                SL   1 ; 13a1
                ADC ; 13a2
                LM ; 13a3
                XDC ; 13a4
                DCI  $0c94 ; 13a5
                ST ; 13a8
                CM ; 13a9
                XDC ; 13aa
                LM ; 13ab
                XDC ; 13ac
                ST ; 13ad
                XDC ; 13ae
                LM ; 13af
                XDC ; 13b0
                DCI  $0cea ; 13b1
                ST ; 13b4
                XDC ; 13b5
                LM ; 13b6
                XDC ; 13b7
                ST ; 13b8
                XDC ; 13b9
                LM ; 13ba
                XDC ; 13bb
                DCI  $0c8c ; 13bc
                ST ; 13bf
                CM ; 13c0
                XDC ; 13c1
                LM ; 13c2
                XDC ; 13c3
                ST ; 13c4
                XDC ; 13c5
                LM ; 13c6
                XDC ; 13c7
                DCI  $0c90 ; 13c8
A13cb:          ST ; 13cb
                CM ; 13cc
                XDC ; 13cd
                LM ; 13ce
                XDC ; 13cf
                ST ; 13d0
                LIS  $0 ; 13d1
                LR   $1,A ; 13d2
A13d3:          LIS  $2 ; 13d3
                NS   12 ; 13d4
                BT   4,A13d9 ; 13d5
                LIS  $4 ; 13d7
                LR   $1,A ; 13d8
A13d9:          LIS  $1 ; 13d9
                NS   12 ; 13da
                BT   4,A13df ; 13db
                AS   $1 ; 13dd
                LR   $1,A ; 13de
A13df:          LR   A,$1 ; 13df
                CI   $00 ; 13e0
                BF   $4,A13e5 ; 13e2
                LIS  $2 ; 13e4
A13e5:          DCI  $08f5 ; 13e5
                ST ; 13e8
                JMP  A14fb ; 13e9
A13ec:          db $3a ; 13ec
                db $d0 ; 13ed
                db $ff ; 13ee
                db $fc ; 13ef
                db $c8 ; 13f0
                db $50 ; 13f1
                db $c8 ; 13f2
                db $c8 ; 13f3
                db $84,$50 ; 13f4
                db $01 ; 13f6
                db $04 ; 13f7
                db $c8 ; 13f8
                db $50 ; 13f9
                db $c8 ; 13fa
                db $c8 ; 13fb
                db $3a ; 13fc
                db $d0 ; 13fd
                db $ff ; 13fe
                db $fc ; 13ff
                db $38 ; 1400
                db $50 ; 1401
                db $84,$c8 ; 1402
                db $84,$50 ; 1404
                db $01 ; 1406
                db $04 ; 1407
                db $38 ; 1408
                db $50 ; 1409
                db $84,$c8 ; 140a
                db $3a ; 140c
                db $50 ; 140d
                db $ff ; 140e
                db $04 ; 140f
                db $c8 ; 1410
                db $50 ; 1411
                db $c8 ; 1412
                db $c8 ; 1413
                db $84,$d0 ; 1414
                db $01 ; 1416
                db $fc ; 1417
                db $c8 ; 1418
                db $50 ; 1419
                db $c8 ; 141a
                db $c8 ; 141b
                db $3a ; 141c
                db $50 ; 141d
                db $ff ; 141e
                db $04 ; 141f
                db $38 ; 1420
                db $c8 ; 1421
                db $84,$50 ; 1422
                db $84,$d0 ; 1424
                db $01 ; 1426
                db $fc ; 1427
                db $38 ; 1428
                db $c8 ; 1429
                db $84,$50 ; 142a
A142c:          LR   K,P ; 142c
                XDC ; 142d
                DCI  $0c40 ; 142e
                LR   A,$0 ; 1431
                ADC ; 1432
                XDC ; 1433
                LM ; 1434
                XDC ; 1435
                ST ; 1436
                LR   $1,A ; 1437
                LI   $2f ; 1438
                ADC ; 143a
                LR   A,$1 ; 143b
                ST ; 143c
                SR   1 ; 143d
                LR   $1,A ; 143e
                DCI  $0820 ; 143f
                LR   A,$0 ; 1442
                ADC ; 1443
                XDC ; 1444
A1445:          LM ; 1445
                XDC ; 1446
                ST ; 1447
                SL   1 ; 1448
                SL   1 ; 1449
                LR   $2,A ; 144a
                DCI  $0c80 ; 144b
                LR   A,$0 ; 144e
                SL   1 ; 144f
                SL   1 ; 1450
                ADC ; 1451
                LIS  $2 ; 1452
                LR   $4,A ; 1453
A1454:          XDC ; 1454
A1455:          LM ; 1455
                XDC ; 1456
                ST ; 1457
                LR   A,$2 ; 1458
                ST ; 1459
                LR   A,$1 ; 145a
                LR   $2,A ; 145b
                DS   $4 ; 145c
                BF   $4,A1454 ; 145d
                XDC ; 145f
                LM ; 1460
                LR   QU,A ; 1461
                LM ; 1462
                LR   QL,A ; 1463
                XDC ; 1464
                LR   DC,Q ; 1465
                BF   $0,A1469 ; 1466
A1468:          LR   K,P ; 1468
A1469:          DI ; 1469
                PI   $40a9 ; 146a
                DI ; 146d
                LM ; 146e
                LR   QU,A ; 146f
                LM ; 1470
                LR   QL,A ; 1471
                LM ; 1472
A1473:          LR   KU,A ; 1473
                LM ; 1474
                LR   KL,A ; 1475
                DCI  $0c20 ; 1476
                LR   A,$0 ; 1479
                ADC ; 147a
A147b:          LR   A,QL ; 147b
                ST ; 147c
                LIS  $f ; 147d
                ADC ; 147e
                LR   A,QU ; 147f
                ST ; 1480
                LI   $1f ; 1481
                ADC ; 1483
                LR   A,KL ; 1484
                ST ; 1485
                LIS  $f ; 1486
                ADC ; 1487
                LR   A,KU ; 1488
                ST ; 1489
                XDC ; 148a
                PI   $40bc ; 148b
                PK ; 148e
A148f:          LR   K,P ; 148f
                LIS  $7 ; 1490
                LR   $6,A ; 1491
                LI   $30 ; 1492
A1494:          DCI  $08fb ; 1494
                CM ; 1497
                BF   $4,A1494 ; 1498
A149a:          DCI  $08fb ; 149a
                LM ; 149d
                AS   $8 ; 149e
                CI   $c0 ; 149f
                BT   2,A14a4 ; 14a1
                PK ; 14a3
A14a4:          DCI  $08fb ; 14a4
                CM ; 14a7
                BF   $2,A14a4 ; 14a8
                LI   $10 ; 14aa
                OUTS 1 ; 14ac
                LR   A,$6 ; 14ad
                XI   $07 ; 14ae
                LR   $6,A ; 14b0
                OUTS 0 ; 14b1
                LIS  $0 ; 14b2
                OUTS 1 ; 14b3
                BF   $0,A149a ; 14b4
A14b6:          LR   K,P ; 14b6
                PI   $40a9 ; 14b7
A14ba:          LR   A,$5 ; 14ba
                INC ; 14bb
                INC ; 14bc
                INC ; 14bd
                LR   $5,A ; 14be
                DCI  A1ea0 ; 14bf
                ADC ; 14c2
                LIS  $0 ; 14c3
                XM ; 14c4
                BF   $1,A14f7 ; 14c5
                LISU 4 ; 14c7
                LISL 3 ; 14c8
                LR   13,A ; 14c9
                LM ; 14ca
                LR   13,A ; 14cb
                LM ; 14cc
                LISU 2 ; 14cd
                LISL 4 ; 14ce
                LR   12,A ; 14cf
                LIS  $0 ; 14d0
                OUTS 0 ; 14d1
                OUTS 1 ; 14d2
                DCI  $0fdd ; 14d3
                ST ; 14d6
                ST ; 14d7
                PI   $46d6 ; 14d8
                PI   $43d6 ; 14db
                LR   J,W ; 14de
                DCI  $0f8a ; 14df
                LM ; 14e2
                INC ; 14e3
                NI   $0f ; 14e4
                DCI  $0f8a ; 14e6
                ST ; 14e9
                DCI  $08f5 ; 14ea
                ST ; 14ed
                LR   W,J ; 14ee
                BF   $1,A14ba ; 14ef
                BT   4,A14ba ; 14f1
                PI   $40bc ; 14f3
                PK ; 14f6
A14f7:          LR   A,$6 ; 14f7
                LR   $5,A ; 14f8
                BF   $0,A14ba ; 14f9
A14fb:          PI   A127b ; 14fb
                LI   $10 ; 14fe
                LR   $5,A ; 1500
                DCI  $0880 ; 1501
A1504:          LISU 5 ; 1504
                LISL 7 ; 1505
                LIS  $2 ; 1506
                LR   $2,A ; 1507
                LI   $ff ; 1508
                LR   $7,A ; 150a
A150b:          LR   A,$7 ; 150b
                AS   13 ; 150c
                BT   2,A152b ; 150d
A150f:          BR7  A150b ; 150f
                LISU 6 ; 1511
                DS   $2 ; 1512
                BF   $4,A150b ; 1513
                LR   A,$4 ; 1515
                LR   IS,A ; 1516
                LIS  $0 ; 1517
                LR   12,A ; 1518
                LR   A,IS ; 1519
                BR7  A1520 ; 151a
                AI   $d1 ; 151c
                BF   $0,A1522 ; 151e
A1520:          AI   $d9 ; 1520
A1522:          ST ; 1522
                DS   $5 ; 1523
                BF   $4,A1504 ; 1524
                PI   A127b ; 1526
                BF   $0,A1533 ; 1529
A152b:          LR   A,14 ; 152b
                LR   A,IS ; 152c
                LR   $4,A ; 152d
                LR   A,13 ; 152e
                COM ; 152f
                LR   $7,A ; 1530
                BF   $0,A150f ; 1531
A1533:          LI   $a4 ; 1533
A1535:          DCI  $08fb ; 1535
                CM ; 1538
                BF   $4,A1535 ; 1539
                DCI  $0fa3 ; 153b
                LM ; 153e
                LR   $a,A ; 153f
                LM ; 1540
                LR   $b,A ; 1541
                LR   DC,H ; 1542
                LIS  $0 ; 1543
                LR   $0,A ; 1544
                PI   A1468 ; 1545
                DCI  $0fa1 ; 1548
                LM ; 154b
                LR   $a,A ; 154c
                LM ; 154d
                LR   $b,A ; 154e
                LR   DC,H ; 154f
                LIS  $b ; 1550
                LR   $0,A ; 1551
                LIS  $3 ; 1552
                LR   $1,A ; 1553
A1554:          LR   DC,H ; 1554
                PI   A1468 ; 1555
                DS   $0 ; 1558
                DS   $1 ; 1559
                BF   $4,A1554 ; 155a
                DCI  $0860 ; 155c
                XDC ; 155f
                DCI  $0880 ; 1560
                LI   $10 ; 1563
                LR   $1,A ; 1565
A1566:          LM ; 1566
                NI   $0f ; 1567
                LR   H,DC ; 1569
                SL   1 ; 156a
                SL   1 ; 156b
                DCI  $0c82 ; 156c
                ADC ; 156f
                LM ; 1570
                LR   $2,A ; 1571
                LM ; 1572
                COM ; 1573
                INC ; 1574
                AS   $2 ; 1575
                XDC ; 1576
                ST ; 1577
                XDC ; 1578
                LR   DC,H ; 1579
                DS   $1 ; 157a
                BF   $4,A1566 ; 157b
                LISU 5 ; 157d
                LISL 7 ; 157e
                DCI  $0840 ; 157f
                LI   $10 ; 1582
                LR   $0,A ; 1584
A1585:          LR   A,13 ; 1585
                COM ; 1586
                ST ; 1587
                BR7  A158b ; 1588
                LISU 6 ; 158a
A158b:          DS   $0 ; 158b
                BF   $4,A1585 ; 158c
                DCI  $0850 ; 158e
                XDC ; 1591
                DCI  $0860 ; 1592
                LI   $10 ; 1595
                LR   $7,A ; 1597
                PI   A1272 ; 1598
                DCI  $0870 ; 159b
                XDC ; 159e
                DCI  $0880 ; 159f
                LI   $10 ; 15a2
                LR   $7,A ; 15a4
                PI   A1272 ; 15a5
                DCI  $0ffa ; 15a8
                XDC ; 15ab
                DCI  A15b9 ; 15ac
                LIS  $6 ; 15af
                LR   $7,A ; 15b0
                PI   A1272 ; 15b1
                LISU 3 ; 15b4
                LISL 4 ; 15b5
                JMP  A1165 ; 15b6
A15b9:          db $10 ; 15b9
                db $01 ; 15ba
                db $0c ; 15bb
                db $20,$0c ; 15bc
                db $20,$0c ; 15be
                db $50 ; 15c0
A15c1:          db $36 ; 15c1
                db $24,$34 ; 15c2
                db $32 ; 15c4
                db $22,$20 ; 15c5
                db $1e ; 15c7
                db $0e ; 15c8
                db $0c ; 15c9
                db $0a ; 15ca
A15cb:          db $15 ; 15cb
                db $0b ; 15cc
                db $05 ; 15cd
                db $00 ; 15ce
                db $1b ; 15cf
                db $11 ; 15d0
                db $29,$0b,$00 ; 15d1
                db $14 ; 15d4
                db $00 ; 15d5
                db $00 ; 15d6
                db $00 ; 15d7
                db $00 ; 15d8
                db $00 ; 15d9
                db $00 ; 15da
                db $36 ; 15db
                db $00 ; 15dc
                db $07 ; 15dd
                db $13 ; 15de
                db $00 ; 15df
                db $0a ; 15e0
                db $20,$00 ; 15e1
                db $00 ; 15e3
                db $00 ; 15e4
                db $00 ; 15e5
                db $00 ; 15e6
                db $00 ; 15e7
                db $00 ; 15e8
                db $00 ; 15e9
                db $00 ; 15ea
A15eb:          db $15 ; 15eb
                db $0b ; 15ec
                db $05 ; 15ed
                db $00 ; 15ee
                db $09 ; 15ef
                db $03 ; 15f0
                db $2b ; 15f1
                db $1a ; 15f2
                db $21,$07 ; 15f3
                db $13 ; 15f5
                db $25,$07 ; 15f6
                db $0b ; 15f8
                db $11 ; 15f9
                db $29,$00,$14 ; 15fa
                db $00 ; 15fd
                db $24,$00 ; 15fe
                db $0d ; 1600
                db $13 ; 1601
                db $2b ; 1602
                db $04 ; 1603
                db $00 ; 1604
                db $00 ; 1605
                db $00 ; 1606
                db $00 ; 1607
                db $00 ; 1608
                db $00 ; 1609
                db $1c ; 160a
                db $00 ; 160b
                db $00 ; 160c
                db $00 ; 160d
                db $00 ; 160e
                db $1b ; 160f
                db $11 ; 1610
                db $29,$0b,$07 ; 1611
                db $0b ; 1614
                db $2b ; 1615
                db $2b ; 1616
                db $01 ; 1617
                db $21,$00 ; 1618
                db $11 ; 161a
                db $2b ; 161b
                db $05 ; 161c
                db $13 ; 161d
                db $2b ; 161e
                db $0b ; 161f
                db $35 ; 1620
                db $00 ; 1621
                db $00 ; 1622
A1623:          LR   K,P ; 1623
                PI   $40a9 ; 1624
                LISU 5 ; 1627
                LISL 0 ; 1628
                LR   A,$9 ; 1629
                LR   13,A ; 162a
                DCI  $0c80 ; 162b
                LR   A,$1 ; 162e
                LR   $7,A ; 162f
                LR   A,$0 ; 1630
                SL   1 ; 1631
                SL   1 ; 1632
                ADC ; 1633
                LM ; 1634
                LR   $1,A ; 1635
                LR   12,A ; 1636
                CM ; 1637
                LM ; 1638
                LR   $9,A ; 1639
                PI   A1297 ; 163a
                XS   $4 ; 163d
                BT   1,A165f ; 163e
                LR   A,$7 ; 1640
                LR   $1,A ; 1641
                LR   A,$9 ; 1642
                COM ; 1643
                INC ; 1644
                AS   $2 ; 1645
                LIS  $6 ; 1646
                BT   2,A164b ; 1647
                LI   $fa ; 1649
A164b:          AS   $9 ; 164b
                LR   $2,A ; 164c
                PI   A1297 ; 164d
                XS   $4 ; 1650
                COM ; 1651
                BF   $1,A165f ; 1652
                LR   A,$9 ; 1654
                LR   $2,A ; 1655
                PI   A1297 ; 1656
                XS   $4 ; 1659
                COM ; 165a
                BF   $1,A165f ; 165b
                LR   A,12 ; 165d
                LR   $1,A ; 165e
A165f:          LR   J,W ; 165f
                PI   $40bc ; 1660
                LISL 0 ; 1663
                LR   A,12 ; 1664
                LR   $9,A ; 1665
                LISU 3 ; 1666
                PK ; 1667
A1668:          LR   K,P ; 1668
                DCI  A15c1 ; 1669
                LR   A,$1 ; 166c
                ADC ; 166d
                LM ; 166e
                DCI  $2010 ; 166f
                ADC ; 1672
                SL   1 ; 1673
                ADC ; 1674
                ADC ; 1675
                ADC ; 1676
                PK ; 1677
A1678:          PI   $40d0 ; 1678
                PI   A18f1 ; 167b
                PI   $45db ; 167e
                LIS  $4 ; 1681
                DCI  $08f5 ; 1682
                ST ; 1685
                LI   $64 ; 1686
                DCI  $0fea ; 1688
                ST ; 168b
                DCI  $08f7 ; 168c
                ST ; 168f
                DCI  $15f7 ; 1690
                LI   $1c ; 1693
                LISU 2 ; 1695
                LISL 4 ; 1696
                LR   12,A ; 1697
                PI   $4205 ; 1698
                PI   $41c8 ; 169b
                LISU 4 ; 169e
                LISL 2 ; 169f
                LR   A,13 ; 16a0
                LR   $1,A ; 16a1
                LR   A,13 ; 16a2
                LR   $2,A ; 16a3
                COM ; 16a4
                INC ; 16a5
                AS   $1 ; 16a6
                DCI  $0fdf ; 16a7
                LIS  $7 ; 16aa
                ST ; 16ab
                LR   A,$1 ; 16ac
                LR   $4,A ; 16ad
                LR   A,$2 ; 16ae
                LR   $5,A ; 16af
                LI   $18 ; 16b0
                LR   $6,A ; 16b2
                LI   $34 ; 16b3
                BF   $1,A16c0 ; 16b5
                LR   A,$2 ; 16b7
                LR   $4,A ; 16b8
                LR   A,$1 ; 16b9
                LR   $5,A ; 16ba
                LI   $2a ; 16bb
                LR   $6,A ; 16bd
                LI   $24 ; 16be
A16c0:          LR   $8,A ; 16c0
                PI   $40d9 ; 16c1
                DCI  $0ca3 ; 16c4
                XDC ; 16c7
                PI   A1716 ; 16c8
                DCI  $0c9f ; 16cb
                XDC ; 16ce
                LR   A,$5 ; 16cf
                LR   $4,A ; 16d0
                PI   A1716 ; 16d1
                DCI  $0fdf ; 16d4
                LI   $1d ; 16d7
                ST ; 16d9
                DCI  $0f9b ; 16da
                LIS  $3 ; 16dd
                LISL 4 ; 16de
                LR   12,A ; 16df
                PI   $4205 ; 16e0
                DCI  $0fdf ; 16e3
                LI   $30 ; 16e6
                ST ; 16e8
                DCI  $0f8b ; 16e9
                LI   $10 ; 16ec
                LISL 4 ; 16ee
                LR   12,A ; 16ef
                PI   $4205 ; 16f0
                LR   A,$6 ; 16f3
                LR   $5,A ; 16f4
A16f5:          LIS  $0 ; 16f5
                DCI  $0fe2 ; 16f6
                ST ; 16f9
                PI   A14b6 ; 16fa
                LR   A,$8 ; 16fd
                CI   $3f ; 16fe
                BT   4,A1709 ; 1700
                CI   $43 ; 1702
                BF   $4,A16f5 ; 1704
                JMP  A1026 ; 1706
A1709:          LISU 3 ; 1709
                LISL 2 ; 170a
                LR   A,12 ; 170b
                LR   $1,A ; 170c
                JMP  A10c2 ; 170d
A1710:          LR   K,P ; 1710
                LIS  $7 ; 1711
                LR   12,A ; 1712
                JMP  $40fb ; 1713
A1716:          LR   K,P ; 1716
                PI   $40a9 ; 1717
                LR   A,$4 ; 171a
                SR   4 ; 171b
                LR   $1,A ; 171c
                PI   A1668 ; 171d
                PI   A1710 ; 1720
                XDC ; 1723
                LI   $91 ; 1724
                ADC ; 1726
                XDC ; 1727
                LR   A,$4 ; 1728
                NI   $0f ; 1729
                LR   $1,A ; 172b
                PI   A1668 ; 172c
                PI   A1710 ; 172f
                PI   $40bc ; 1732
                PK ; 1735
A1736:          LISU 3 ; 1736
                LISL 5 ; 1737
                LIS  $1 ; 1738
                NS   12 ; 1739
                BF   $4,A1762 ; 173a
                LIS  $2 ; 173c
                NS   12 ; 173d
                BT   4,A1795 ; 173e
                LIS  $0 ; 1740
                OUTS 1 ; 1741
                INS  1 ; 1742
                LR   $5,A ; 1743
                LR   W,J ; 1744
                LIS  $1 ; 1745
                BT   1,A1749 ; 1746
                LIS  $2 ; 1748
A1749:          NS   $5 ; 1749
                BT   4,A1760 ; 174a
                LI   $80 ; 174c
                NS   12 ; 174e
                LR   12,A ; 174f
                LISL 2 ; 1750
                LIS  $1 ; 1751
                NS   12 ; 1752
                LIS  $2 ; 1753
                BT   4,A1757 ; 1754
                LIS  $3 ; 1756
A1757:          LR   W,J ; 1757
                BF   $1,A175c ; 1758
                COM ; 175a
                INC ; 175b
A175c:          DCI  $0d0a ; 175c
                ST ; 175f
A1760:          BF   $0,A17dc ; 1760
A1762:          LISL 1 ; 1762
                DS   12 ; 1763
                BT   1,A17d9 ; 1764
                DCI  $0c25 ; 1766
                LM ; 1769
                SR   1 ; 176a
                SR   1 ; 176b
                LR   $8,A ; 176c
                PI   A148f ; 176d
                LIS  $4 ; 1770
                LR   12,A ; 1771
                LIS  $4 ; 1772
                LISL 5 ; 1773
                XS   12 ; 1774
                LR   12,A ; 1775
                LIS  $4 ; 1776
                LR   W,J ; 1777
                BT   1,A1785 ; 1778
                DCI  A1dd5 ; 177a
                NS   12 ; 177d
                BF   $4,A1783 ; 177e
                DCI  A1ddd ; 1780
A1783:          BF   $0,A178e ; 1783
A1785:          NS   12 ; 1785
                DCI  A1dd9 ; 1786
                BF   $4,A178e ; 1789
                DCI  A1de1 ; 178b
A178e:          LIS  $5 ; 178e
                LR   $0,A ; 178f
                PI   A1468 ; 1790
                BF   $0,A17d9 ; 1793
A1795:          LISL 2 ; 1795
                LIS  $4 ; 1796
                NS   12 ; 1797
                BT   4,A17bd ; 1798
                DCI  $0d0a ; 179a
                LIS  $0 ; 179d
                XM ; 179e
                BT   1,A17a3 ; 179f
                COM ; 17a1
                INC ; 17a2
A17a3:          LR   $1,A ; 17a3
                LIS  $0 ; 17a4
A17a5:          AI   $14 ; 17a5
                DS   $1 ; 17a7
                BF   $4,A17a5 ; 17a8
                LISU 3 ; 17aa
                LISL 7 ; 17ab
                AS   12 ; 17ac
                LR   12,A ; 17ad
                LISU 3 ; 17ae
                BF   $2,A17bd ; 17af
                LISU 7 ; 17b1
                LISL 6 ; 17b2
                LR   A,12 ; 17b3
                DCI  $0d0b ; 17b4
                AM ; 17b7
                DCI  $0d0b ; 17b8
                ST ; 17bb
                LISU 3 ; 17bc
A17bd:          LISL 0 ; 17bd
                LIS  $0 ; 17be
                XS   12 ; 17bf
                BT   4,A17dc ; 17c0
                DS   12 ; 17c2
                BF   $4,A17dc ; 17c3
                LIS  $4 ; 17c5
                LR   $0,A ; 17c6
A17c7:          DCI  A1db1 ; 17c7
                PI   A1468 ; 17ca
                DCI  A1da9 ; 17cd
                DS   $0 ; 17d0
                PI   A1468 ; 17d1
                DS   $0 ; 17d4
                BF   $4,A17c7 ; 17d5
                BF   $0,A17dc ; 17d7
A17d9:          JMP  A14fb ; 17d9
A17dc:          LIS  $4 ; 17dc
                LR   $5,A ; 17dd
                DCI  $0ce3 ; 17de
                LIS  $0 ; 17e1
A17e2:          ST ; 17e2
                CM ; 17e3
                DS   $5 ; 17e4
                BF   $4,A17e2 ; 17e5
                PI   A18f1 ; 17e7
A17ea:          LISU 2 ; 17ea
                LISL 4 ; 17eb
                DS   12 ; 17ec
                LIS  $3 ; 17ed
                NS   12 ; 17ee
                LISU 3 ; 17ef
                LR   $5,A ; 17f0
                LISL 2 ; 17f1
                LI   $20 ; 17f2
                NS   12 ; 17f4
                BF   $4,A17fa ; 17f5
                LIS  $1 ; 17f7
                NS   $5 ; 17f8
                LR   $5,A ; 17f9
A17fa:          LR   A,$5 ; 17fa
                SL   1 ; 17fb
                LR   $a,A ; 17fc
                INC ; 17fd
                LR   $4,A ; 17fe
                PI   A1eed ; 17ff
                LISU 3 ; 1802
                DCI  $0fa5 ; 1803
                LR   $8,A ; 1806
                LR   A,$5 ; 1807
                ADC ; 1808
                LR   H,DC ; 1809
                LR   A,$8 ; 180a
                LR   $2,A ; 180b
                BF   $0,A182e ; 180c
                LI   $f8 ; 180e
                AM ; 1810
                CI   $42 ; 1811
                BT   2,A181a ; 1813
                LR   DC,H ; 1815
                ST ; 1816
A1817:          LR   $2,A ; 1817
                BF   $0,A182e ; 1818
A181a:          AI   $08 ; 181a
                BF   $0,A1817 ; 181c
                LIS  $8 ; 181e
                AM ; 181f
                CI   $8d ; 1820
                BF   $2,A182a ; 1822
                LR   DC,H ; 1824
                ST ; 1825
A1826:          AI   $4b ; 1826
                BF   $0,A1817 ; 1828
A182a:          AI   $f8 ; 182a
                BF   $0,A1826 ; 182c
A182e:          DCI  $0c86 ; 182e
                LR   A,$5 ; 1831
                SL   1 ; 1832
                SL   1 ; 1833
                ADC ; 1834
                LM ; 1835
                COM ; 1836
                INC ; 1837
                AS   $2 ; 1838
                LR   $1,A ; 1839
                DCI  $0ce3 ; 183a
                LR   A,$5 ; 183d
                SL   1 ; 183e
                ADC ; 183f
                LR   A,$1 ; 1840
                ST ; 1841
                DCI  $0faa ; 1842
                LI   $ff ; 1845
                AM ; 1847
                DCI  $0faa ; 1848
                ST ; 184b
                BT   4,A1858 ; 184c
                DCI  $0faa ; 184e
                LIS  $1 ; 1851
                NM ; 1852
                LISU 3 ; 1853
                BT   4,A17ea ; 1854
                BF   $0,A18a1 ; 1856
A1858:          DCI  $0faa ; 1858
                LIS  $b ; 185b
                ST ; 185c
                LISU 3 ; 185d
                LISL 5 ; 185e
                LIS  $2 ; 185f
                NS   12 ; 1860
                BF   $4,A18a1 ; 1861
                LISL 2 ; 1863
                LI   $40 ; 1864
                NS   12 ; 1866
                BT   4,A18a1 ; 1867
                LI   $20 ; 1869
                NS   12 ; 186b
                BF   $4,A18a1 ; 186c
                LR   A,$4 ; 186e
                LR   $a,A ; 186f
                PI   A1eed ; 1870
                LR   $2,A ; 1873
                PI   A190b ; 1874
                LISU 3 ; 1877
                LISL 2 ; 1878
                LR   A,$5 ; 1879
                NI   $01 ; 187a
                LIS  $8 ; 187c
                BT   4,A1881 ; 187d
                LI   $10 ; 187f
A1881:          NS   12 ; 1881
                LIS  $1 ; 1882
                BT   4,A1886 ; 1883
                LIS  $2 ; 1885
A1886:          LR   $1,A ; 1886
                LR   A,$2 ; 1887
                CI   $78 ; 1888
                BF   $2,A1897 ; 188a
                LR   A,$1 ; 188c
                COM ; 188d
                INC ; 188e
                LR   $1,A ; 188f
                LR   A,$2 ; 1890
                CI   $50 ; 1891
                BT   2,A1897 ; 1893
                LIS  $0 ; 1895
                LR   $1,A ; 1896
A1897:          DCI  $0ce2 ; 1897
                LR   A,$5 ; 189a
                SL   1 ; 189b
                ADC ; 189c
                LR   A,$1 ; 189d
                ST ; 189e
                BF   $0,A18a4 ; 189f
A18a1:          PI   A190b ; 18a1
A18a4:          JMP  A14fb ; 18a4
A18a7:          PI   A1623 ; 18a7
                BT   1,A18bb ; 18aa
                DCI  $0c94 ; 18ac
                LI   $d8 ; 18af
                ST ; 18b1
                LISU 3 ; 18b2
                LISL 5 ; 18b3
                LI   $82 ; 18b4
                NS   12 ; 18b6
                LR   12,A ; 18b7
A18b8:          JMP  A1736 ; 18b8
A18bb:          DCI  $0cea ; 18bb
                LM ; 18be
                COM ; 18bf
                INC ; 18c0
                DCI  $0cea ; 18c1
                ST ; 18c4
                DCI  $0c96 ; 18c5
                LM ; 18c8
                LR   $1,A ; 18c9
                DCI  A1da5 ; 18ca
                LR   Q,DC ; 18cd
                LI   $29 ; 18ce
                LR   W,J ; 18d0
                BT   1,A18d9 ; 18d1
                DCI  A1da1 ; 18d3
                LR   Q,DC ; 18d6
                LI   $94 ; 18d7
A18d9:          DCI  $0cd4 ; 18d9
                ST ; 18dc
                DCI  $0c80 ; 18dd
                ST ; 18e0
                LR   A,$1 ; 18e1
                CM ; 18e2
                ST ; 18e3
                DCI  $0cd6 ; 18e4
                ST ; 18e7
                DCI  $0fa3 ; 18e8
                LR   A,QU ; 18eb
                ST ; 18ec
                LR   A,QL ; 18ed
                ST ; 18ee
                BF   $0,A18b8 ; 18ef
A18f1:          LR   K,P ; 18f1
                DCI  $0fab ; 18f2
                LM ; 18f5
                XI   $80 ; 18f6
                DCI  $0fab ; 18f8
                ST ; 18fb
                LI   $32 ; 18fc
                BT   1,A1902 ; 18fe
                LI   $22 ; 1900
A1902:          DCI  $08fb ; 1902
                CM ; 1905
                BF   $4,A1902 ; 1906
                LIS  $0 ; 1908
                OUTS 14 ; 1909
                PK ; 190a
A190b:          LR   K,P ; 190b
                DCI  $0fea ; 190c
                LI   $f0 ; 190f
                NM ; 1911
                OI   $0c ; 1912
                DCI  $0fea ; 1914
                ST ; 1917
                DCI  $08f7 ; 1918
                ST ; 191b
                LIS  $1 ; 191c
                OUTS 14 ; 191d
                LIS  $0 ; 191e
                DCI  $0fdd ; 191f
                ST ; 1922
                ST ; 1923
                PK ; 1924
A1925:          PI   A1297 ; 1925
                XS   $4 ; 1928
                BF   $1,A192e ; 1929
                JMP  A117a ; 192b
A192e:          PI   A1623 ; 192e
                DCI  $0d0a ; 1931
                BT   1,A1946 ; 1934
                CM ; 1936
                LM ; 1937
                COM ; 1938
                INC ; 1939
                DCI  $0d0b ; 193a
                ST ; 193d
                LIS  $8 ; 193e
                LR   $8,A ; 193f
A1940:          PI   A148f ; 1940
                JMP  A117a ; 1943
A1946:          DCI  $0d0a ; 1946
                LISU 4 ; 1949
                LISL 3 ; 194a
                LIS  $0 ; 194b
                XM ; 194c
                DCI  $0f62 ; 194d
                LR   A,14 ; 1950
                BT   1,A1957 ; 1951
                LR   A,13 ; 1953
                DCI  $0f77 ; 1954
A1957:          LR   $4,A ; 1957
                LR   H,DC ; 1958
                LR   A,14 ; 1959
                LR   A,14 ; 195a
                LR   A,IS ; 195b
                LR   $6,A ; 195c
                LI   $67 ; 195d
                ASD  12 ; 195f
                LR   12,A ; 1960
                CI   $04 ; 1961
                BT   4,A197b ; 1963
                LIS  $0 ; 1965
                LR   $5,A ; 1966
A1967:          LR   A,13 ; 1967
                LR   $1,A ; 1968
                PI   A1668 ; 1969
                PI   A12bd ; 196c
                LR   A,13 ; 196f
                LR   A,13 ; 1970
                LR   $1,A ; 1971
                PI   A1668 ; 1972
                PI   A12bd ; 1975
                JMP  A12f2 ; 1978
A197b:          LIS  $1 ; 197b
                LR   $5,A ; 197c
                LIS  $0 ; 197d
                LR   13,A ; 197e
                LR   A,13 ; 197f
                LI   $67 ; 1980
                ASD  12 ; 1982
                LR   12,A ; 1983
                CI   $07 ; 1984
                BF   $4,A198b ; 1986
                JMP  A1678 ; 1988
A198b:          CI   $06 ; 198b
                BF   $4,A1997 ; 198d
                LR   A,$4 ; 198f
                CI   $04 ; 1990
                BF   $2,A1997 ; 1992
                JMP  A1678 ; 1994
A1997:          LISL 0 ; 1997
                LIS  $0 ; 1998
                LR   13,A ; 1999
                LR   12,A ; 199a
                DCI  $0f62 ; 199b
                XDC ; 199e
                DCI  $218a ; 199f
                PI   A19c0 ; 19a2
                DCI  $0f77 ; 19a5
                XDC ; 19a8
                DCI  $218a ; 19a9
                PI   A19c0 ; 19ac
                LISU 3 ; 19af
                LISL 5 ; 19b0
                LI   $80 ; 19b1
                XS   12 ; 19b3
                LR   12,A ; 19b4
                LR   J,W ; 19b5
                LR   A,$6 ; 19b6
                LR   IS,A ; 19b7
                LI   $80 ; 19b8
                DCI  $0fa9 ; 19ba
                ST ; 19bd
                BF   $0,A1967 ; 19be
A19c0:          LR   K,P ; 19c0
                JMP  A12c7 ; 19c1
A19c4:          PI   A1623 ; 19c4
                BF   $1,A19f6 ; 19c7
                BF   $0,A19d4 ; 19c9
A19cb:          PI   A1623 ; 19cb
                BF   $1,A1a00 ; 19ce
                LR   A,$7 ; 19d0
                LR   $1,A ; 19d1
                LR   A,$4 ; 19d2
                LR   $0,A ; 19d3
A19d4:          DCI  $0d0a ; 19d4
                LIS  $0 ; 19d7
                XM ; 19d8
                BF   $1,A19eb ; 19d9
                DCI  A1db5 ; 19db
                LI   $10 ; 19de
                LISL 2 ; 19e0
                NS   12 ; 19e1
                LIS  $0 ; 19e2
                BT   4,A19e6 ; 19e3
                LIS  $2 ; 19e5
A19e6:          LISU 3 ; 19e6
                LISL 1 ; 19e7
                LR   12,A ; 19e8
                BF   $0,A1a22 ; 19e9
A19eb:          DCI  $0c80 ; 19eb
                LI   $e8 ; 19ee
                ST ; 19f0
                LISU 3 ; 19f1
                LISL 6 ; 19f2
                LIS  $1 ; 19f3
                LR   12,A ; 19f4
                LISU 3 ; 19f5
A19f6:          JMP  A1199 ; 19f6
A19f9:          PI   A1623 ; 19f9
                BT   1,A1a0e ; 19fc
                BF   $0,A19f6 ; 19fe
A1a00:          BF   $0,A19eb ; 1a00
                JMP  A117a ; 1a02
A1a05:          PI   A1623 ; 1a05
                BF   $1,A1a00 ; 1a08
                LR   A,$7 ; 1a0a
                LR   $1,A ; 1a0b
                LR   A,$4 ; 1a0c
                LR   $0,A ; 1a0d
A1a0e:          DCI  $0d0a ; 1a0e
                LIS  $0 ; 1a11
                XM ; 1a12
                BT   1,A19eb ; 1a13
                LISL 2 ; 1a15
                LIS  $8 ; 1a16
                NS   12 ; 1a17
                LIS  $0 ; 1a18
                BT   4,A1a1c ; 1a19
                LIS  $2 ; 1a1b
A1a1c:          LISU 3 ; 1a1c
                LISL 1 ; 1a1d
                LR   12,A ; 1a1e
                DCI  A1dad ; 1a1f
A1a22:          PI   A1468 ; 1a22
                LISL 0 ; 1a25
                LIS  $8 ; 1a26
                LR   12,A ; 1a27
                DCI  $0c82 ; 1a28
                LR   A,$0 ; 1a2b
                SL   1 ; 1a2c
                SL   1 ; 1a2d
                ADC ; 1a2e
                LM ; 1a2f
                AI   $14 ; 1a30
                COM ; 1a32
                INC ; 1a33
                DCI  $0cd6 ; 1a34
                AM ; 1a37
                BT   1,A1a3c ; 1a38
                COM ; 1a3a
                INC ; 1a3b
A1a3c:          SR   1 ; 1a3c
                SR   1 ; 1a3d
                SR   1 ; 1a3e
                SL   1 ; 1a3f
                DCI  A1a7c ; 1a40
                LISL 3 ; 1a43
                DS   12 ; 1a44
                BT   1,A1a4a ; 1a45
                DCI  A1a88 ; 1a47
A1a4a:          ADC ; 1a4a
                LM ; 1a4b
                LR   $1,A ; 1a4c
                LM ; 1a4d
                LR   $2,A ; 1a4e
                LISL 2 ; 1a4f
                LIS  $1 ; 1a50
                NS   12 ; 1a51
                LR   A,$1 ; 1a52
                BT   4,A1a56 ; 1a53
                INC ; 1a55
A1a56:          LISU 3 ; 1a56
                LISL 1 ; 1a57
                AS   12 ; 1a58
                LR   $1,A ; 1a59
                DCI  $0d0a ; 1a5a
                LIS  $0 ; 1a5d
                XM ; 1a5e
                LR   A,$1 ; 1a5f
                BF   $1,A1a64 ; 1a60
                COM ; 1a62
                INC ; 1a63
A1a64:          DCI  $0d0a ; 1a64
                ST ; 1a67
                LR   A,$2 ; 1a68
                ST ; 1a69
                LISU 7 ; 1a6a
                LISL 6 ; 1a6b
                LIS  $0 ; 1a6c
                XS   $2 ; 1a6d
                LI   $ff ; 1a6e
                BF   $1,A1a73 ; 1a70
                LIS  $1 ; 1a72
A1a73:          LR   12,A ; 1a73
                LIS  $f ; 1a74
                LR   $8,A ; 1a75
                PI   A148f ; 1a76
                JMP  A14fb ; 1a79
A1a7c:          LR   KU,A ; 1a7c
                LR   K,P ; 1a7d
                LR   KU,A ; 1a7e
                LR   KU,A ; 1a7f
                LR   KU,A ; 1a80
                LR   A,KU ; 1a81
                LR   KU,A ; 1a82
                NS   12 ; 1a83
                LR   KU,A ; 1a84
                NS   $8 ; 1a85
                LR   KU,A ; 1a86
                NS   $8 ; 1a87
A1a88:          LR   KL,A ; 1a88
                LR   A,IS ; 1a89
                LR   KL,A ; 1a8a
                LR   KL,A ; 1a8b
                LR   KL,A ; 1a8c
                LR   A,KU ; 1a8d
                LR   KL,A ; 1a8e
                NS   $a ; 1a8f
                LR   KL,A ; 1a90
                NS   $6 ; 1a91
                LR   KL,A ; 1a92
                NS   $6 ; 1a93
A1a94:          LISL 2 ; 1a94
                LIS  $2 ; 1a95
                NS   12 ; 1a96
                BT   4,A1aad ; 1a97
                LISL 4 ; 1a99
                DS   12 ; 1a9a
                BF   $1,A1aad ; 1a9b
                DCI  $0d0a ; 1a9d
                LM ; 1aa0
                COM ; 1aa1
                INC ; 1aa2
                DCI  $0d0a ; 1aa3
                ST ; 1aa6
                LI   $18 ; 1aa7
                LR   $8,A ; 1aa9
                JMP  A1940 ; 1aaa
A1aad:          DCI  $0d0a ; 1aad
                LIS  $0 ; 1ab0
                XM ; 1ab1
                DCI  $0fc8 ; 1ab2
                LR   A,$a ; 1ab5
                ST ; 1ab6
                LR   A,$b ; 1ab7
                ST ; 1ab8
                LR   A,QU ; 1ab9
                ST ; 1aba
                LR   A,QL ; 1abb
                ST ; 1abc
                DCI  A1dc9 ; 1abd
                LR   H,DC ; 1ac0
                DCI  $1dbd ; 1ac1
                LI   $5a ; 1ac4
                BT   1,A1ad1 ; 1ac6
                DCI  $1dc5 ; 1ac8
                LR   H,DC ; 1acb
                DCI  A1db9 ; 1acc
                LI   $60 ; 1acf
A1ad1:          LR   Q,DC ; 1ad1
                DCI  $0cac ; 1ad2
                ST ; 1ad5
                DCI  $0ca8 ; 1ad6
                ST ; 1ad9
                DCI  $0ca4 ; 1ada
                ST ; 1add
                LR   DC,Q ; 1ade
                LIS  $6 ; 1adf
                LR   $0,A ; 1ae0
                PI   A1468 ; 1ae1
                XDC ; 1ae4
                LI   $15 ; 1ae5
                LR   $0,A ; 1ae7
                DCI  $0fa1 ; 1ae8
                LR   A,$a ; 1aeb
                ST ; 1aec
                LR   A,$b ; 1aed
                ST ; 1aee
                DCI  $0d0a ; 1aef
                LM ; 1af2
                COM ; 1af3
                PI   A1b10 ; 1af4
                DCI  $0fc8 ; 1af7
                LM ; 1afa
                LR   $a,A ; 1afb
                LM ; 1afc
                LR   $b,A ; 1afd
                LM ; 1afe
                LR   QU,A ; 1aff
                LM ; 1b00
                LR   QL,A ; 1b01
                JMP  A19eb ; 1b02
A1b05:          DCI  $0d0a ; 1b05
                LIS  $0 ; 1b08
                XM ; 1b09
                PI   A1b10 ; 1b0a
                JMP  A1199 ; 1b0d
A1b10:          LR   K,P ; 1b10
                BT   1,A1b27 ; 1b11
                LI   $3d ; 1b13
                DCI  $0c20 ; 1b15
                CM ; 1b18
                BT   4,A1b3c ; 1b19
                LI   $1d ; 1b1b
                DCI  $0fa3 ; 1b1d
                ST ; 1b20
                LI   $a5 ; 1b21
                ST ; 1b23
                LIS  $4 ; 1b24
                BF   $0,A1b3a ; 1b25
A1b27:          LI   $43 ; 1b27
                DCI  $0c20 ; 1b29
                CM ; 1b2c
                BT   4,A1b3c ; 1b2d
                LI   $1d ; 1b2f
                DCI  $0fa3 ; 1b31
                ST ; 1b34
                LI   $a1 ; 1b35
                ST ; 1b37
                LI   $fc ; 1b38
A1b3a:          AS   $1 ; 1b3a
                LR   $1,A ; 1b3b
A1b3c:          PK ; 1b3c
                db $60 ; 1b3d
                db $f0 ; 1b3e
                db $f0 ; 1b3f
                db $f0 ; 1b40
                db $f0 ; 1b41
                db $60 ; 1b42
                db $06 ; 1b43
                db $0f ; 1b44
                db $0f ; 1b45
                db $0f ; 1b46
                db $0f ; 1b47
                db $06 ; 1b48
A1b49:          db $00 ; 1b49
A1b4a:          db $0c ; 1b4a
                db $00 ; 1b4b
                db $1c ; 1b4c
                db $00 ; 1b4d
                db $1c ; 1b4e
                db $00 ; 1b4f
                db $1c ; 1b50
                db $00 ; 1b51
                db $1c ; 1b52
                db $00 ; 1b53
                db $18 ; 1b54
                db $00 ; 1b55
                db $38 ; 1b56
                db $00 ; 1b57
                db $7e ; 1b58
                db $00 ; 1b59
                db $fe ; 1b5a
                db $00 ; 1b5b
                db $fe ; 1b5c
                db $00 ; 1b5d
                db $ba ; 1b5e
                db $00 ; 1b5f
                db $ba ; 1b60
                db $00 ; 1b61
                db $ba ; 1b62
                db $00 ; 1b63
                db $ba ; 1b64
                db $10 ; 1b65
                db $ba ; 1b66
                db $28,$ba,$28 ; 1b67
                db $38 ; 1b6a
                db $2f ; 1b6b
                db $ba ; 1b6c
                db $28,$38,$28 ; 1b6d
                db $38 ; 1b70
                db $10 ; 1b71
                db $28,$00,$28 ; 1b72
                db $00 ; 1b75
                db $28,$00,$28 ; 1b76
                db $00 ; 1b79
                db $28,$00,$28 ; 1b7a
                db $00 ; 1b7d
                db $28,$00,$28 ; 1b7e
                db $00 ; 1b81
                db $28,$00,$28 ; 1b82
                db $00 ; 1b85
                db $6c ; 1b86
                db $00 ; 1b87
                db $6c ; 1b88
                db $00 ; 1b89
                db $1c ; 1b8a
                db $00 ; 1b8b
                db $18 ; 1b8c
                db $00 ; 1b8d
                db $1e ; 1b8e
                db $00 ; 1b8f
                db $1c ; 1b90
                db $00 ; 1b91
                db $1c ; 1b92
                db $00 ; 1b93
                db $18 ; 1b94
                db $00 ; 1b95
                db $7c ; 1b96
                db $00 ; 1b97
                db $7e ; 1b98
                db $00 ; 1b99
                db $fe ; 1b9a
                db $00 ; 1b9b
                db $fa ; 1b9c
                db $00 ; 1b9d
                db $ba ; 1b9e
                db $00 ; 1b9f
                db $ba ; 1ba0
                db $00 ; 1ba1
                db $ba ; 1ba2
                db $00 ; 1ba3
                db $ba ; 1ba4
                db $38 ; 1ba5
                db $ba ; 1ba6
                db $38 ; 1ba7
                db $ba ; 1ba8
                db $3f ; 1ba9
                db $ba ; 1baa
                db $38 ; 1bab
                db $ba ; 1bac
                db $38 ; 1bad
                db $38 ; 1bae
                db $38 ; 1baf
                db $38 ; 1bb0
                db $00 ; 1bb1
                db $28,$00,$28 ; 1bb2
                db $00 ; 1bb5
                db $28,$00,$28 ; 1bb6
                db $00 ; 1bb9
                db $28,$00,$28 ; 1bba
                db $00 ; 1bbd
                db $28,$00,$28 ; 1bbe
                db $00 ; 1bc1
                db $28,$00,$28 ; 1bc2
                db $00 ; 1bc5
                db $6c ; 1bc6
                db $00 ; 1bc7
                db $6c ; 1bc8
                db $0c ; 1bc9
                db $e0 ; 1bca
                db $1c ; 1bcb
                db $a0 ; 1bcc
                db $1c ; 1bcd
                db $a0 ; 1bce
                db $1c ; 1bcf
                db $a0 ; 1bd0
                db $1c ; 1bd1
                db $e0 ; 1bd2
                db $18 ; 1bd3
                db $40 ; 1bd4
                db $38 ; 1bd5
                db $40 ; 1bd6
                db $7c ; 1bd7
                db $40 ; 1bd8
                db $ff ; 1bd9
                db $c0 ; 1bda
                db $ff ; 1bdb
                db $00 ; 1bdc
                db $b8 ; 1bdd
                db $00 ; 1bde
                db $b8 ; 1bdf
                db $00 ; 1be0
                db $b8 ; 1be1
                db $00 ; 1be2
                db $b8 ; 1be3
                db $00 ; 1be4
                db $b8 ; 1be5
                db $00 ; 1be6
                db $b8 ; 1be7
                db $00 ; 1be8
                db $b8 ; 1be9
                db $00 ; 1bea
                db $b8 ; 1beb
                db $00 ; 1bec
                db $3e ; 1bed
                db $00 ; 1bee
                db $3e ; 1bef
                db $00 ; 1bf0
                db $22,$00 ; 1bf1
                db $22,$00 ; 1bf3
                db $22,$00 ; 1bf5
                db $22,$00 ; 1bf7
                db $22,$00 ; 1bf9
                db $22,$00 ; 1bfb
                db $22,$00 ; 1bfd
                db $e2 ; 1bff
                db $00 ; 1c00
                db $e2 ; 1c01
                db $00 ; 1c02
                db $82,$00 ; 1c03
                db $83,$00 ; 1c05
                db $03 ; 1c07
                db $00 ; 1c08
                db $1c ; 1c09
                db $e0 ; 1c0a
                db $18 ; 1c0b
                db $e0 ; 1c0c
                db $1e ; 1c0d
                db $e0 ; 1c0e
                db $1c ; 1c0f
                db $e0 ; 1c10
                db $1c ; 1c11
                db $40 ; 1c12
                db $18 ; 1c13
                db $40 ; 1c14
                db $7c ; 1c15
                db $40 ; 1c16
                db $7e ; 1c17
                db $00 ; 1c18
                db $ff ; 1c19
                db $c0 ; 1c1a
                db $fa ; 1c1b
                db $00 ; 1c1c
                db $b8 ; 1c1d
                db $00 ; 1c1e
                db $b8 ; 1c1f
                db $00 ; 1c20
                db $b8 ; 1c21
                db $00 ; 1c22
                db $b8 ; 1c23
                db $00 ; 1c24
                db $b8 ; 1c25
                db $00 ; 1c26
                db $b8 ; 1c27
                db $00 ; 1c28
                db $b8 ; 1c29
                db $00 ; 1c2a
                db $be ; 1c2b
                db $00 ; 1c2c
                db $3e ; 1c2d
                db $00 ; 1c2e
                db $3e ; 1c2f
                db $00 ; 1c30
                db $22,$00 ; 1c31
                db $22,$00 ; 1c33
                db $22,$00 ; 1c35
                db $22,$00 ; 1c37
                db $22,$00 ; 1c39
                db $22,$00 ; 1c3b
                db $e2 ; 1c3d
                db $00 ; 1c3e
                db $e2 ; 1c3f
                db $00 ; 1c40
                db $82,$00 ; 1c41
                db $82,$00 ; 1c43
                db $03 ; 1c45
                db $00 ; 1c46
                db $03 ; 1c47
                db $00 ; 1c48
                db $0e ; 1c49
                db $00 ; 1c4a
                db $0e ; 1c4b
                db $00 ; 1c4c
                db $0e ; 1c4d
                db $00 ; 1c4e
                db $0e ; 1c4f
                db $00 ; 1c50
                db $0e ; 1c51
                db $00 ; 1c52
                db $06 ; 1c53
                db $00 ; 1c54
                db $07 ; 1c55
                db $00 ; 1c56
                db $0f ; 1c57
                db $c0 ; 1c58
                db $0f ; 1c59
                db $c0 ; 1c5a
                db $1f ; 1c5b
                db $40 ; 1c5c
                db $37 ; 1c5d
                db $40 ; 1c5e
                db $e7 ; 1c5f
                db $40 ; 1c60
                db $07 ; 1c61
                db $c0 ; 1c62
                db $07 ; 1c63
                db $00 ; 1c64
                db $07 ; 1c65
                db $00 ; 1c66
                db $07 ; 1c67
                db $00 ; 1c68
                db $07 ; 1c69
                db $00 ; 1c6a
                db $07 ; 1c6b
                db $00 ; 1c6c
                db $07 ; 1c6d
                db $00 ; 1c6e
                db $07 ; 1c6f
                db $00 ; 1c70
                db $05 ; 1c71
                db $00 ; 1c72
                db $05 ; 1c73
                db $00 ; 1c74
                db $05 ; 1c75
                db $00 ; 1c76
                db $05 ; 1c77
                db $00 ; 1c78
                db $05 ; 1c79
                db $00 ; 1c7a
                db $05 ; 1c7b
                db $00 ; 1c7c
                db $05 ; 1c7d
                db $00 ; 1c7e
                db $05 ; 1c7f
                db $00 ; 1c80
                db $05 ; 1c81
                db $00 ; 1c82
                db $05 ; 1c83
                db $00 ; 1c84
                db $0f ; 1c85
                db $00 ; 1c86
                db $0f ; 1c87
                db $00 ; 1c88
                db $0e ; 1c89
                db $00 ; 1c8a
                db $0e ; 1c8b
                db $00 ; 1c8c
                db $0e ; 1c8d
                db $00 ; 1c8e
                db $0e ; 1c8f
                db $00 ; 1c90
                db $0e ; 1c91
                db $00 ; 1c92
                db $06 ; 1c93
                db $00 ; 1c94
                db $0f ; 1c95
                db $c0 ; 1c96
                db $0f ; 1c97
                db $c0 ; 1c98
                db $0f ; 1c99
                db $c0 ; 1c9a
                db $17 ; 1c9b
                db $40 ; 1c9c
                db $f7 ; 1c9d
                db $40 ; 1c9e
                db $27,$c0 ; 1c9f
                db $07 ; 1ca1
                db $c0 ; 1ca2
                db $07 ; 1ca3
                db $00 ; 1ca4
                db $07 ; 1ca5
                db $00 ; 1ca6
                db $07 ; 1ca7
                db $00 ; 1ca8
                db $07 ; 1ca9
                db $00 ; 1caa
                db $07 ; 1cab
                db $00 ; 1cac
                db $07 ; 1cad
                db $00 ; 1cae
                db $07 ; 1caf
                db $00 ; 1cb0
                db $05 ; 1cb1
                db $00 ; 1cb2
                db $05 ; 1cb3
                db $00 ; 1cb4
                db $05 ; 1cb5
                db $00 ; 1cb6
                db $05 ; 1cb7
                db $00 ; 1cb8
                db $05 ; 1cb9
                db $00 ; 1cba
                db $05 ; 1cbb
                db $00 ; 1cbc
                db $05 ; 1cbd
                db $00 ; 1cbe
                db $05 ; 1cbf
                db $00 ; 1cc0
                db $05 ; 1cc1
                db $00 ; 1cc2
                db $05 ; 1cc3
                db $00 ; 1cc4
                db $0f ; 1cc5
                db $00 ; 1cc6
                db $0f ; 1cc7
                db $00 ; 1cc8
                db $0e ; 1cc9
                db $00 ; 1cca
                db $0e ; 1ccb
                db $00 ; 1ccc
                db $0e ; 1ccd
                db $00 ; 1cce
                db $0e ; 1ccf
                db $00 ; 1cd0
                db $0e ; 1cd1
                db $00 ; 1cd2
                db $06 ; 1cd3
                db $00 ; 1cd4
                db $07 ; 1cd5
                db $00 ; 1cd6
                db $0f ; 1cd7
                db $80,$0f ; 1cd8
                db $c0 ; 1cda
                db $1f ; 1cdb
                db $c0 ; 1cdc
                db $37 ; 1cdd
                db $40 ; 1cde
                db $e7 ; 1cdf
                db $40 ; 1ce0
                db $07 ; 1ce1
                db $40 ; 1ce2
                db $07 ; 1ce3
                db $40 ; 1ce4
                db $07 ; 1ce5
                db $40 ; 1ce6
                db $07 ; 1ce7
A1ce8:          db $40 ; 1ce8
                db $07 ; 1ce9
                db $40 ; 1cea
                db $07 ; 1ceb
                db $40 ; 1cec
                db $1f ; 1ced
                db $40 ; 1cee
                db $1f ; 1cef
                db $40 ; 1cf0
                db $12 ; 1cf1
                db $00 ; 1cf2
                db $12 ; 1cf3
                db $00 ; 1cf4
                db $12 ; 1cf5
                db $00 ; 1cf6
                db $12 ; 1cf7
                db $00 ; 1cf8
                db $12 ; 1cf9
                db $00 ; 1cfa
                db $12 ; 1cfb
                db $00 ; 1cfc
                db $12 ; 1cfd
                db $00 ; 1cfe
                db $13 ; 1cff
                db $c0 ; 1d00
                db $13 ; 1d01
                db $c0 ; 1d02
                db $10 ; 1d03
                db $40 ; 1d04
                db $30 ; 1d05
                db $40 ; 1d06
                db $30 ; 1d07
                db $00 ; 1d08
                db $0e ; 1d09
                db $00 ; 1d0a
                db $0e ; 1d0b
                db $00 ; 1d0c
                db $0e ; 1d0d
                db $00 ; 1d0e
                db $0e ; 1d0f
                db $00 ; 1d10
                db $0e ; 1d11
                db $00 ; 1d12
                db $06 ; 1d13
                db $00 ; 1d14
                db $0f ; 1d15
                db $80,$0f ; 1d16
                db $c0 ; 1d18
                db $1f ; 1d19
                db $c0 ; 1d1a
                db $17 ; 1d1b
                db $40 ; 1d1c
                db $f7 ; 1d1d
                db $40 ; 1d1e
                db $27,$40 ; 1d1f
                db $07 ; 1d21
                db $40 ; 1d22
                db $07 ; 1d23
                db $40 ; 1d24
                db $07 ; 1d25
A1d26:          db $40 ; 1d26
                db $07 ; 1d27
                db $40 ; 1d28
                db $07 ; 1d29
                db $40 ; 1d2a
                db $1f ; 1d2b
                db $40 ; 1d2c
                db $1f ; 1d2d
                db $40 ; 1d2e
                db $1f ; 1d2f
                db $40 ; 1d30
                db $12 ; 1d31
                db $00 ; 1d32
                db $12 ; 1d33
                db $00 ; 1d34
                db $12 ; 1d35
                db $00 ; 1d36
                db $12 ; 1d37
                db $00 ; 1d38
                db $12 ; 1d39
                db $00 ; 1d3a
                db $12 ; 1d3b
                db $00 ; 1d3c
                db $13 ; 1d3d
                db $c0 ; 1d3e
                db $13 ; 1d3f
                db $c0 ; 1d40
                db $10 ; 1d41
                db $40 ; 1d42
                db $10 ; 1d43
                db $40 ; 1d44
                db $30 ; 1d45
                db $00 ; 1d46
                db $30 ; 1d47
                db $00 ; 1d48
A1d49:          db $c0 ; 1d49
                db $c0 ; 1d4a
                db $c0 ; 1d4b
                db $c0 ; 1d4c
                db $c0 ; 1d4d
                db $c0 ; 1d4e
                db $c0 ; 1d4f
                db $c0 ; 1d50
                db $c0 ; 1d51
                db $c0 ; 1d52
                db $c0 ; 1d53
                db $c0 ; 1d54
                db $c0 ; 1d55
                db $c0 ; 1d56
                db $c0 ; 1d57
                db $c0 ; 1d58
                db $c0 ; 1d59
                db $c0 ; 1d5a
                db $c0 ; 1d5b
                db $c0 ; 1d5c
                db $c0 ; 1d5d
                db $c0 ; 1d5e
                db $c0 ; 1d5f
                db $c0 ; 1d60
                db $c0 ; 1d61
                db $c0 ; 1d62
                db $c0 ; 1d63
                db $c0 ; 1d64
                db $c0 ; 1d65
                db $c0 ; 1d66
                db $c0 ; 1d67
                db $c0 ; 1d68
                db $c0 ; 1d69
                db $c0 ; 1d6a
                db $c0 ; 1d6b
                db $c0 ; 1d6c
                db $c0 ; 1d6d
                db $c0 ; 1d6e
                db $c0 ; 1d6f
                db $c0 ; 1d70
                db $c0 ; 1d71
                db $c0 ; 1d72
                db $c0 ; 1d73
                db $c0 ; 1d74
                db $c0 ; 1d75
                db $c0 ; 1d76
                db $c0 ; 1d77
                db $c0 ; 1d78
                db $c0 ; 1d79
                db $c0 ; 1d7a
                db $c0 ; 1d7b
                db $c0 ; 1d7c
                db $c0 ; 1d7d
                db $c0 ; 1d7e
                db $c0 ; 1d7f
                db $c0 ; 1d80
                db $c0 ; 1d81
                db $c0 ; 1d82
                db $c0 ; 1d83
                db $c0 ; 1d84
                db $38 ; 1d85
                db $38 ; 1d86
                db $fe ; 1d87
                db $38 ; 1d88
                db $28,$78,$38 ; 1d89
                db $18 ; 1d8c
                db $38 ; 1d8d
                db $18 ; 1d8e
                db $7e ; 1d8f
                db $7e ; 1d90
                db $38 ; 1d91
                db $38 ; 1d92
                db $fe ; 1d93
                db $38 ; 1d94
                db $38 ; 1d95
                db $78 ; 1d96
                db $38 ; 1d97
                db $38 ; 1d98
                db $38 ; 1d99
                db $18 ; 1d9a
                db $7e ; 1d9b
                db $7e ; 1d9c
                db $ff ; 1d9d
                db $ff ; 1d9e
                db $ff ; 1d9f
                db $ff ; 1da0
A1da1:          db $fb ; 1da1
                db $43 ; 1da2
                db $fb ; 1da3
                db $43 ; 1da4
A1da5:          db $fb ; 1da5
                db $3d ; 1da6
                db $fb ; 1da7
                db $3d ; 1da8
A1da9:          db $fb ; 1da9
                db $49 ; 1daa
                db $fb ; 1dab
                db $89 ; 1dac
A1dad:          db $fb ; 1dad
                db $c9 ; 1dae
                db $fc ; 1daf
                db $09 ; 1db0
A1db1:          db $ed ; 1db1
                db $0c ; 1db2
                db $ed ; 1db3
                db $4c ; 1db4
A1db5:          db $ed ; 1db5
                db $8c ; 1db6
                db $ed ; 1db7
                db $cc ; 1db8
A1db9:          db $5d ; 1db9
                db $85,$5d ; 1dba
                db $91,$4f ; 1dbc
                db $48 ; 1dbe
                db $4f ; 1dbf
A1dc0:          db $54 ; 1dc0
                db $fd ; 1dc1
A1dc2:          db $9d,$fd ; 1dc2
                db $9d,$fd ; 1dc4
                db $49 ; 1dc6
                db $fd ; 1dc7
                db $49 ; 1dc8
A1dc9:          db $ef ; 1dc9
                db $0c ; 1dca
                db $ef ; 1dcb
                db $0c ; 1dcc
A1dcd:          db $ef ; 1dcd
                db $60 ; 1dce
                db $ef ; 1dcf
                db $60 ; 1dd0
                db $ef ; 1dd1
                db $75 ; 1dd2
                db $ef ; 1dd3
                db $75 ; 1dd4
A1dd5:          db $ee ; 1dd5
                db $0c ; 1dd6
                db $ee ; 1dd7
                db $4c ; 1dd8
A1dd9:          db $fc ; 1dd9
                db $49 ; 1dda
                db $fc ; 1ddb
                db $89 ; 1ddc
A1ddd:          db $ee ; 1ddd
                db $8c ; 1dde
                db $ee ; 1ddf
                db $cc ; 1de0
A1de1:          db $fc ; 1de1
                db $c9 ; 1de2
                db $fd ; 1de3
                db $09 ; 1de4
A1de5:          db $06 ; 1de5
                db $41 ; 1de6
                db $e8 ; 1de7
                db $a2 ; 1de8
                db $1d ; 1de9
                db $a5 ; 1dea
                db $20,$42 ; 1deb
                db $1a ; 1ded
                db $8a ; 1dee
                db $1d ; 1def
                db $a9 ; 1df0
                db $20,$42 ; 1df1
                db $a2 ; 1df3
                db $8a ; 1df4
                db $1d ; 1df5
                db $b1 ; 1df6
                db $20,$42 ; 1df7
                db $c8 ; 1df9
                db $52 ; 1dfa
                db $1d ; 1dfb
                db $a9 ; 1dfc
                db $20,$42 ; 1dfd
                db $c8 ; 1dff
                db $ca ; 1e00
                db $1d ; 1e01
                db $b1 ; 1e02
                db $20,$42 ; 1e03
                db $3a ; 1e05
                db $d2 ; 1e06
                db $1d ; 1e07
                db $d9 ; 1e08
                db $0c ; 1e09
                db $c5 ; 1e0a
                db $60 ; 1e0b
A1e0c:          db $2a,$1d,$b9 ; 1e0c
CourtUpper:
        ; Patent object 6: x=1, y=50. Retail stores centers, not origins.
        if PATENT_COURT = 2
        db $04,$d7,$5d,$34,$1d,$c1
        else
        if PATENT_COURT = 1
        db $04,$d7,$5d,$38,$1d,$c1
        else
        db $04,$d7,$60,$32,$1d,$c1
        endif
        endif
CourtLower:
        ; Patent object 7: x=1, y=234.
        if PATENT_COURT = 2
        db $04,$d7,$5d,$ec,$1d,$c1
        else
        db $04,$d7,$60,$e9,$1d,$c1
        endif
CourtNet:
        ; Patent objects 3-5: x=93, y=54/114/174, height=60 each.
        if PATENT_COURT = 2
        db $3c,$41,$61,$54,$1d,$c5
        db $3c,$41,$61,$90,$1d,$c5
        db $3c,$41,$61,$cc,$1d,$c5
        else
        db $3c,$41,$60,$52,$1d,$c5
        db $3c,$41,$60,$8e,$1d,$c5
        db $3b,$41,$60,$c9,$1d,$c5
        endif
                db $07 ; 1e2d
                db $43 ; 1e2e
                db $30 ; 1e2f
                db $2a,$1d,$cd ; 1e30
                db $07 ; 1e33
                db $43 ; 1e34
                db $90,$2a ; 1e35
                db $1d ; 1e37
                db $d1 ; 1e38
                db $01 ; 1e39
                db $01 ; 1e3a
                db $e8 ; 1e3b
                db $52 ; 1e3c
                db $1e ; 1e3d
                db $1e ; 1e3e
                db $01 ; 1e3f
                db $01 ; 1e40
                db $e8 ; 1e41
                db $62 ; 1e42
                db $1e ; 1e43
                db $1e ; 1e44
                db $20,$02 ; 1e45
                db $84,$52 ; 1e47
                db $1d ; 1e49
                db $d5 ; 1e4a
A1e4b:          db $5c ; 1e4b
                db $48 ; 1e4c
        ; Retain retail edge handling; shift the ball's Y region by two lines.
        ; TODO: match the patent's asymmetric upper/lower bounce clamps.
        if PATENT_COURT = 2
                db $8f ; 1e4d
        else
                db $8d ; 1e4d
        endif
                db $55 ; 1e4e
                db $2c ; 1e4f
                db $0c ; 1e50
                db $82,$48 ; 1e51
                db $8e ; 1e53
                db $0e ; 1e54
                db $82,$48 ; 1e55
                db $5d ; 1e57
                db $01 ; 1e58
                db $82,$60 ; 1e59
                db $5e ; 1e5b
                db $22,$8a ; 1e5c
                db $38 ; 1e5e
A1e5f:          db $e8 ; 1e5f
A1e60:          db $04 ; 1e60
                db $a2 ; 1e61
                db $03 ; 1e62
                db $4f ; 1e63
                db $01 ; 1e64
                db $82,$60 ; 1e65
                db $6a ; 1e67
                db $01 ; 1e68
                db $82,$60 ; 1e69
                db $01 ; 1e6b
                db $00 ; 1e6c
                db $02 ; 1e6d
                db $01 ; 1e6e
                db $03 ; 1e6f
                db $00 ; 1e70
                db $04 ; 1e71
                db $01 ; 1e72
                db $13 ; 1e73
                db $02 ; 1e74
                db $16 ; 1e75
                db $08 ; 1e76
                db $17 ; 1e77
                db $08 ; 1e78
                db $90,$03 ; 1e79
                db $15 ; 1e7b
                db $06 ; 1e7c
A1e7d:
                db $91,$04 ; 1e7d
                db $15 ; 1e7f
                db $07 ; 1e80
                db $92,$04 ; 1e81
                db $94,$05 ; 1e83
A1e85:          db $1e ; 1e85
A1e86:          db $6b ; 1e86
                db $15 ; 1e87
                db $1e ; 1e88
A1e89:          db $7b ; 1e89
                db $01 ; 1e8a
                db $1e ; 1e8b
                db $7f ; 1e8c
                db $02 ; 1e8d
                db $1e ; 1e8e
                db $7b ; 1e8f
                db $03 ; 1e90
                db $1e ; 1e91
                db $7f ; 1e92
                db $04 ; 1e93
                db $ff ; 1e94
A1e95:          db $1e ; 1e95
                db $6b ; 1e96
                db $15 ; 1e97
                db $1e ; 1e98
                db $7b ; 1e99
A1e9a:          db $01 ; 1e9a
                db $1e ; 1e9b
                db $7f ; 1e9c
                db $02 ; 1e9d
A1e9e:          db $ff ; 1e9e
A1e9f:          db $1e ; 1e9f
A1ea0:          db $83,$05 ; 1ea0
                db $ff ; 1ea2
                db $03 ; 1ea3
                db $40 ; 1ea4
                db $10 ; 1ea5
A1ea6:          db $03 ; 1ea6
                db $38 ; 1ea7
                db $10 ; 1ea8
                db $03 ; 1ea9
                db $30 ; 1eaa
                db $10 ; 1eab
                db $03 ; 1eac
                db $38 ; 1ead
                db $10 ; 1eae
                db $03 ; 1eaf
                db $40 ; 1eb0
                db $12 ; 1eb1
                db $03 ; 1eb2
                db $38 ; 1eb3
                db $08 ; 1eb4
                db $03 ; 1eb5
                db $30 ; 1eb6
                db $28,$ff,$ff ; 1eb7
A1eba:          db $ff ; 1eba
                db $03 ; 1ebb
                db $40 ; 1ebc
                db $10 ; 1ebd
                db $03 ; 1ebe
                db $30 ; 1ebf
                db $10 ; 1ec0
                db $03 ; 1ec1
                db $20,$20 ; 1ec2
                db $03 ; 1ec4
                db $30 ; 1ec5
A1ec6:          db $10 ; 1ec6
                db $03 ; 1ec7
                db $18 ; 1ec8
                db $28,$ff,$ff ; 1ec9
                db $ff ; 1ecc
                db $03 ; 1ecd
                db $10 ; 1ece
                db $10 ; 1ecf
                db $03 ; 1ed0
                db $13 ; 1ed1
                db $10 ; 1ed2
                db $03 ; 1ed3
                db $18 ; 1ed4
                db $10 ; 1ed5
                db $03 ; 1ed6
                db $20,$10 ; 1ed7
                db $03 ; 1ed9
                db $18 ; 1eda
                db $10 ; 1edb
                db $03 ; 1edc
                db $13 ; 1edd
                db $10 ; 1ede
                db $03 ; 1edf
                db $10 ; 1ee0
                db $20,$03 ; 1ee1
                db $13 ; 1ee3
                db $10 ; 1ee4
                db $03 ; 1ee5
                db $10 ; 1ee6
                db $20,$ff ; 1ee7
                db $ff ; 1ee9
                db $ff ; 1eea
A1eeb:          db $0a ; 1eeb
                db $01 ; 1eec
                include "stock-input.asm"
                db $00 ; 1fcc
                db $00 ; 1fcd
                db $00 ; 1fce
                db $00 ; 1fcf
                db $00 ; 1fd0
                db $00 ; 1fd1
                db $00 ; 1fd2
                db $00 ; 1fd3
                db $00 ; 1fd4
                db $00 ; 1fd5
                db $00 ; 1fd6
                db $00 ; 1fd7
                db $00 ; 1fd8
                db $00 ; 1fd9
                db $00 ; 1fda
                db $00 ; 1fdb
                db $00 ; 1fdc
                db $00 ; 1fdd
                db $00 ; 1fde
                db $00 ; 1fdf
                db $00 ; 1fe0
                db $00 ; 1fe1
                db $00 ; 1fe2
                db $00 ; 1fe3
                db $00 ; 1fe4
                db $00 ; 1fe5
                db $00 ; 1fe6
                db $00 ; 1fe7
                db $00 ; 1fe8
                db $00 ; 1fe9
                db $00 ; 1fea
                db $00 ; 1feb
                db $00 ; 1fec
                db $00 ; 1fed
                db $00 ; 1fee
                db $00 ; 1fef
                db $00 ; 1ff0
                db $00 ; 1ff1
                db $00 ; 1ff2
                db $00 ; 1ff3
                db $00 ; 1ff4
                db $00 ; 1ff5
                db $00 ; 1ff6
                db $00 ; 1ff7
                db $00 ; 1ff8
                db $00 ; 1ff9
                db $00 ; 1ffa
                db $00 ; 1ffb
                db $00 ; 1ffc
                db $00 ; 1ffd
                db $00 ; 1ffe
                db $00 ; 1fff
