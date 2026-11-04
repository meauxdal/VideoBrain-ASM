; Retained retail field interrupt wrapper, including BIOS display transfer.
PatentStockInterrupt:
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
        ifconst PATENT_FIELD_SERVICE
                PI   PatentFieldService
        else
                PI   $424d ; 1234
        endif
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
