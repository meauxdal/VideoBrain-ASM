;cart VB-1000 Money Minder - 4K $1000-$1fff
;looks like it has 1K of RAM from $3c00-3fff

Reset: equ $0000

org $1000

				db   $AA,$55				;cart signature
				db   $02					;title screen color
				db   $00,$29,$13,$2b,$0b,$05,$00,$29,$11,$2b,$11,$1b,$0b,$09,$00	;cart name " MONEY MANAGER "

                LIS  $0                  ; 1012 70
                DCI  $3d25               ; 1013 2a 3d 25	;cart RAM
                ST                       ; 1016 17
                PI   $41c8               ; 1017 28 41 c8	;res1 ROM
                DCI  $3d24               ; 101a 2a 3d 24	;cart RAM
                LM                       ; 101d 16
                CI   $3f                 ; 101e 25 3f
                BT   4,A1069             ; 1020 84 48
                LI   $30                 ; 1022 20 30
                LR   $0,A                ; 1024 50
                DCI  $3d41               ; 1025 2a 3d 41
A1028:          XDC                      ; 1028 2c
                DCI  A1cd4               ; 1029 2a 1c d4
                LR   H,DC                ; 102c 11
A102d:          LR   DC,H                ; 102d 10
                LM                       ; 102e 16
                LR   QU,A                ; 102f 06
                LM                       ; 1030 16
                LR   QL,A                ; 1031 07
                LR   H,DC                ; 1032 11
                LR   DC,Q                ; 1033 0f
                LIS  $b                  ; 1034 7b
                LR   $1,A                ; 1035 51
A1036:          LM                       ; 1036 16
                XDC                      ; 1037 2c
                ST                       ; 1038 17
                XDC                      ; 1039 2c
                DS   $1                  ; 103a 31
                BT   4,A1041             ; 103b 84 05
                CI   $ff                 ; 103d 25 ff
                BF   $4,A1036            ; 103f 94 f6
A1041:          DS   $0                  ; 1041 30
                BT   4,A1066             ; 1042 84 23
                XDC                      ; 1044 2c
                LR   A,$1                ; 1045 41
                ADC                      ; 1046 8e
                XDC                      ; 1047 2c
                LI   $10                 ; 1048 20 10
                NS   $0                  ; 104a f0
                BF   $4,A102d            ; 104b 94 e1
                LR   A,$a                ; 104d 4a
                LR   $1,A                ; 104e 51
                LR   A,$b                ; 104f 4b
                LR   $2,A                ; 1050 52
                XDC                      ; 1051 2c
                LR   H,DC                ; 1052 11
                LR   A,$b                ; 1053 4b
                LR   $4,A                ; 1054 54
                LR   A,$a                ; 1055 4a
                LR   $3,A                ; 1056 53
                PI   $41c8               ; 1057 28 41 c8
                LR   A,$3                ; 105a 43
                LR   $a,A                ; 105b 5a
                LR   A,$4                ; 105c 44
                LR   $b,A                ; 105d 5b
                LR   DC,H                ; 105e 10
                XDC                      ; 105f 2c
                LR   A,$2                ; 1060 42
                LR   $b,A                ; 1061 5b
                LR   A,$1                ; 1062 41
                LR   $a,A                ; 1063 5a
                BF   $0,A102d            ; 1064 90 c8
                
A1066:          PI   $41c8               ; 1066 28 41 c8
A1069:          DCI  $0fb9               ; 1069 2a 0f b9
                LI   $8e                 ; 106c 20 8e
                ST                       ; 106e 17
                DCI  $0fc2               ; 106f 2a 0f c2
                LI   $10                 ; 1072 20 10
                ST                       ; 1074 17
                DCI  $0fea               ; 1075 2a 0f ea
                LI   $44                 ; 1078 20 44
                ST                       ; 107a 17
                DCI  $3d26               ; 107b 2a 3d 26
                LM                       ; 107e 16
                CI   $3f                 ; 107f 25 3f
                BT   4,A10ae             ; 1081 84 2c
                LISU 2                   ; 1083 62
                LISL 4                   ; 1084 6c
                LI   $00                 ; 1085 20 00
                DCI  $0fe9               ; 1087 2a 0f e9
                ST                       ; 108a 17
                JMP  A141c               ; 108b 29 14 1c
                
                db   $ff                 
                db   $df                 
                db   $df                 
                db   $df                 
                db   $df                 
                AS   $3                  ; 1093 c3
                db   $ff                 
                db   $ff                 
                ASD  $b                  ; 1096 db
                ASD  $b                  ; 1097 db
                ASD  $b                  ; 1098 db
                ASD  $b                  ; 1099 db
                AS   $3                  ; 109a c3
                db   $ff                 
                db   $ff                 
A109d:          NS   $7                  ; 109d f7
                AS   $1                  ; 109e c1
                ASD  $7                  ; 109f d7
                AS   $1                  ; 10a0 c1
                NS   $5                  ; 10a1 f5
                AS   $1                  ; 10a2 c1
                NS   $7                  ; 10a3 f7
A10a4:          DS   $5                  ; 10a4 35
                XI   $33                 ; 10a5 23 33
                DS   $1                  ; 10a7 31
                NI   $1f                 ; 10a8 21 1f
                LR   W,J                 ; 10aa 1d
                LR   P0,Q                ; 10ab 0d
                LR   IS,A                ; 10ac 0b
                LR   P,K                 ; 10ad 09
A10ae:          LI   $3c                 ; 10ae 20 3c
                LR   $0,A                ; 10b0 50
A10b1:          PI   $41c8               ; 10b1 28 41 c8
                DS   $0                  ; 10b4 30
                BF   $4,A10b1            ; 10b5 94 fb
                PI   $41d5               ; 10b7 28 41 d5
                LISU 2                   ; 10ba 62
                LISL 4                   ; 10bb 6c

                LIS  $f                  ; 10bc 7f
                LR   (IS),A              ; 10bd 5c
                DCI  A1003               ; 10be 2a 10 03
                PI   $4205               ; 10c1 28 42 05
                PI   A18b4               ; 10c4 28 18 b4
                LI   $0b                 ; 10c7 20 0b
                LR   $4,A                ; 10c9 54
                PI   A1916               ; 10ca 28 19 16
                BF   $0,A10e5            ; 10cd 90 17
                
A10cf:          LI   $28                 ; 10cf 20 28
                LR   $4,A                ; 10d1 54
                PI   A1916               ; 10d2 28 19 16
                LIS  $4                  ; 10d5 74
                LR   $0,A                ; 10d6 50
                DCI  $0d0f               ; 10d7 2a 0d 0f
A10da:          LI   $70                 ; 10da 20 70
                LR   $1,A                ; 10dc 51
                LIS  $0                  ; 10dd 70
A10de:          ST                       ; 10de 17
                DS   $1                  ; 10df 31
                BF   $4,A10de            ; 10e0 94 fd
                DS   $0                  ; 10e2 30
                BF   $4,A10da            ; 10e3 94 f6
A10e5:          DCI  $0fc2               ; 10e5 2a 0f c2
                LI   $10                 ; 10e8 20 10
                ST                       ; 10ea 17
                LIS  $0                  ; 10eb 70
                LISU 4                   ; 10ec 64
                LISL 5                   ; 10ed 6d
A10ee:          LR   (IS)-,A             ; 10ee 5e
                BR7  A10ee               ; 10ef 8f fe
                LR   $5,A                ; 10f1 55
                LR   $7,A                ; 10f2 57
                LISU 3                   ; 10f3 63
                LISL 3                   ; 10f4 6b
A10f5:          LR   (IS)-,A             ; 10f5 5e
                BR7  A10f5               ; 10f6 8f fe
                DCI  $3d25               ; 10f8 2a 3d 25
                LIS  $0                  ; 10fb 70
                AM                       ; 10fc 88
                LR   $8,A                ; 10fd 58
                BT   4,A1107             ; 10fe 84 08
                LIS  $0                  ; 1100 70
                DCI  $3d25               ; 1101 2a 3d 25
                ST                       ; 1104 17
A1105:          BF   $0,A1114            ; 1105 90 0e

A1107:          LI   $02                 ; 1107 20 02
A1109:          DCI  $0fe9               ; 1109 2a 0f e9
                ST                       ; 110c 17
                DCI  $08f5               ; 110d 2a 08 f5
                ST                       ; 1110 17
                PI   A1844               ; 1111 28 18 44
A1114:          DCI  A1cce               ; 1114 2a 1c ce
                LIS  $6                  ; 1117 76
                LR   $0,A                ; 1118 50
                PI   A1900               ; 1119 28 19 00
                BT   4,A1164             ; 111c 84 47
                LR   A,$7                ; 111e 47
                SL   1                   ; 111f 13
                BF   $4,A1157            ; 1120 94 36
                AS   $5                  ; 1122 c5
                BF   $4,A1157            ; 1123 94 33
                LI   $00                 ; 1125 20 00
                DCI  $0fe9               ; 1127 2a 0f e9
                ST                       ; 112a 17
A112b:          DCI  $08f5               ; 112b 2a 08 f5
                ST                       ; 112e 17
                DCI  $0fc2               ; 112f 2a 0f c2
                LI   $f0                 ; 1132 20 f0
                ST                       ; 1134 17
                LI   $28                 ; 1135 20 28
                LR   $4,A                ; 1137 54
                PI   A1916               ; 1138 28 19 16
                PI   $41c8               ; 113b 28 41 c8
                LISU 2                   ; 113e 62
                LISL 4                   ; 113f 6c
                LR   A,$0                ; 1140 40
                SL   1                   ; 1141 13
                DCI  A114b               ; 1142 2a 11 4b
                ADC                      ; 1145 8e
                LM                       ; 1146 16
                LR   QU,A                ; 1147 06
                LM                       ; 1148 16
                LR   QL,A                ; 1149 07
                LR   P0,Q                ; 114a 0d
A114b:          SR   4                   ; 114b 14
                LR   A,$b                ; 114c 4b
                SL   4                   ; 114d 15
                IN   $16                 ; 114e 26 16
                LR   $b,A                ; 1150 5b
                LM                       ; 1151 16
                db   $2f                 
                SL   4                   ; 1153 15
                OUTS 7                   ; 1154 b7
                SR   4                   ; 1155 14
                POP                      ; 1156 1c
                
A1157:          DCI  A1e54               ; 1157 2a 1e 54
A115a:          PI   A1800               ; 115a 28 18 00
                BF   $0,A11b4            ; 115d 90 56
                
A115f:          DCI  A27ea               ; 115f 2a 27 ea
                BF   $0,A115a            ; 1162 90 f7
                
A1164:          LR   A,$8                ; 1164 48
                CI   $0f                 ; 1165 25 0f
                BF   $4,A116c            ; 1167 94 04
                JMP  A10cf               ; 1169 29 10 cf
                
A116c:          LISU 4                   ; 116c 64
                DCI  A10a4               ; 116d 2a 10 a4
                LIS  $a                  ; 1170 7a
                LR   $0,A                ; 1171 50
                PI   A1900               ; 1172 28 19 00
                BF   $4,A118b            ; 1175 94 15
                LR   A,$8                ; 1177 48
                CI   $11                 ; 1178 25 11
                BT   4,A117f             ; 117a 84 04
                JMP  A11b7               ; 117c 29 11 b7
                
A117f:          LISL 0                   ; 117f 68
                LISU 4                   ; 1180 64
                LI   $f0                 ; 1181 20 f0
                XS   (IS)                ; 1183 ec
                LR   (IS),A              ; 1184 5c
                LIS  $0                  ; 1185 70
                AS   $7                  ; 1186 c7
                BF   $4,A1157            ; 1187 94 cf
                BF   $0,A11b1            ; 1189 90 27
                
A118b:          LR   A,$5                ; 118b 45
                CI   $08                 ; 118c 25 08
                BF   $1,A115f            ; 118e 91 d0
                INC                      ; 1190 1f
                LR   $5,A                ; 1191 55
                LIS  $0                  ; 1192 70
                AS   $7                  ; 1193 c7
                BF   $4,A1157            ; 1194 94 c2
                LI   $0b                 ; 1196 20 0b
                LR   $4,A                ; 1198 54
                PI   A1916               ; 1199 28 19 16
                LISU 4                   ; 119c 64
                LISL 0                   ; 119d 68
                LR   A,(IS)              ; 119e 4c
                LR   $2,A                ; 119f 52
                LIS  $4                  ; 11a0 74
                LR   $1,A                ; 11a1 51
A11a2:          LISL 4                   ; 11a2 6c
                PI   A27c6               ; 11a3 28 27 c6
                DS   $1                  ; 11a6 31
                BF   $4,A11a2            ; 11a7 94 fa
                LISL 4                   ; 11a9 6c
                LR   A,(IS)              ; 11aa 4c
                AS   $0                  ; 11ab c0
                LR   (IS),A              ; 11ac 5c
                LISL 0                   ; 11ad 68
                LR   A,$2                ; 11ae 42
                AS   (IS)                ; 11af cc
                LR   (IS),A              ; 11b0 5c
A11b1:          PI   A1996               ; 11b1 28 19 96
A11b4:          JMP  A1107               ; 11b4 29 11 07

A11b7:          DCI  A1c9e               ; 11b7 2a 1c 9e
                LI   $30                 ; 11ba 20 30
                LR   $0,A                ; 11bc 50
                PI   A1900               ; 11bd 28 19 00
                BT   4,A115f             ; 11c0 84 9e
                LI   $19                 ; 11c2 20 19
                LR   $4,A                ; 11c4 54
                PI   A1916               ; 11c5 28 19 16
                LIS  $4                  ; 11c8 74
                LR   $7,A                ; 11c9 57
                LR   A,$0                ; 11ca 40
                CI   $28                 ; 11cb 25 28
                BT   4,A11e0             ; 11cd 84 12
                BF   $1,A11e0            ; 11cf 91 10
                DS   $7                  ; 11d1 37
                CI   $1e                 ; 11d2 25 1e
                BT   4,A11e0             ; 11d4 84 0b
                BF   $1,A11e0            ; 11d6 91 09
                DS   $7                  ; 11d8 37
                CI   $08                 ; 11d9 25 08
                BT   4,A11e0             ; 11db 84 04
                BF   $1,A11e0            ; 11dd 91 02
                DS   $7                  ; 11df 37
A11e0:          LISU 5                   ; 11e0 65
                LISL 6                   ; 11e1 6e
                LR   A,$0                ; 11e2 40
                LR   (IS),A              ; 11e3 5c
                LR   A,$5                ; 11e4 45
                NS   $5                  ; 11e5 f5
                BT   4,A11eb             ; 11e6 84 04
                JMP  A126e               ; 11e8 29 12 6e
                
A11eb:          LI   $19                 ; 11eb 20 19
                LR   $4,A                ; 11ed 54
                PI   A1916               ; 11ee 28 19 16
                LR   A,$7                ; 11f1 47
                DCI  A1fd8               ; 11f2 2a 1f d8
                ADC                      ; 11f5 8e
                LM                       ; 11f6 16
                DCI  $0fe9               ; 11f7 2a 0f e9
                ST                       ; 11fa 17
                DCI  $08f5               ; 11fb 2a 08 f5
                ST                       ; 11fe 17
                LI   $50                 ; 11ff 20 50
                DCI  $0fdf               ; 1201 2a 0f df
                ST                       ; 1204 17
                LISU 5                   ; 1205 65
                LISL 6                   ; 1206 6e
                LR   A,(IS)              ; 1207 4c
                DCI  $3c02               ; 1208 2a 3c 02
                ADC                      ; 120b 8e
                ADC                      ; 120c 8e
                ADC                      ; 120d 8e
                ADC                      ; 120e 8e
                LIS  $4                  ; 120f 74
                LR   $0,A                ; 1210 50
                LISU 3                   ; 1211 63
                LISL 0                   ; 1212 68
A1213:          LM                       ; 1213 16
                LR   (IS)+,A             ; 1214 5d
                DS   $0                  ; 1215 30
                BF   $4,A1213            ; 1216 94 fc
                PI   A1775               ; 1218 28 17 75
                PI   A1996               ; 121b 28 19 96
                LISU 5                   ; 121e 65
                LISL 6                   ; 121f 6e
                LI   $08                 ; 1220 20 08
                COM                      ; 1222 18
                INC                      ; 1223 1f
                AS   (IS)                ; 1224 cc
                BF   $1,A1258            ; 1225 91 32
                BT   4,A122f             ; 1227 84 07
                CI   $16                 ; 1229 25 16
                BT   4,A1258             ; 122b 84 2c
                BF   $1,A1258            ; 122d 91 2a
A122f:          DCI  $3cc2               ; 122f 2a 3c c2
                ADC                      ; 1232 8e
                ADC                      ; 1233 8e
                ADC                      ; 1234 8e
                ADC                      ; 1235 8e
                LISU 3                   ; 1236 63
                LISL 0                   ; 1237 68
                LIS  $4                  ; 1238 74
                LR   $0,A                ; 1239 50
A123a:          LM                       ; 123a 16
                LR   (IS)+,A             ; 123b 5d
                DS   $0                  ; 123c 30
                BF   $4,A123a            ; 123d 94 fc
                PI   A18cf               ; 123f 28 18 cf
                PI   A1775               ; 1242 28 17 75
                PI   A1996               ; 1245 28 19 96
                DCI  $0fdf               ; 1248 2a 0f df
                LI   $50                 ; 124b 20 50
                ST                       ; 124d 17
                DCI  A1ee8               ; 124e 2a 1e e8
                LIS  $3                  ; 1251 73
                LISU 2                   ; 1252 62
                LISL 4                   ; 1253 6c
                LR   (IS),A              ; 1254 5c
                PI   $4205               ; 1255 28 42 05
A1258:          PI   A18cf               ; 1258 28 18 cf
                LIS  $5                  ; 125b 75
                LR   (IS),A              ; 125c 5c
                DCI  $1e2a               ; 125d 2a 1e 2a
                PI   $4205               ; 1260 28 42 05
                LISU 5                   ; 1263 65
                LISL 6                   ; 1264 6e
                PI   A1956               ; 1265 28 19 56
                PI   A1987               ; 1268 28 19 87
                JMP  A10cf               ; 126b 29 10 cf
                
A126e:          LI   $06                 ; 126e 20 06
                DCI  $0fe9               ; 1270 2a 0f e9
                ST                       ; 1273 17
                DCI  $08f5               ; 1274 2a 08 f5
                ST                       ; 1277 17
                PI   A18cf               ; 1278 28 18 cf
                LIS  $5                  ; 127b 75
                LR   (IS),A              ; 127c 5c
                DCI  A1e25               ; 127d 2a 1e 25
                PI   $4205               ; 1280 28 42 05
                LISU 5                   ; 1283 65
                LISL 6                   ; 1284 6e
                PI   A1956               ; 1285 28 19 56
                DCI  $3d27               ; 1288 2a 3d 27
                LISU 4                   ; 128b 64
                LISL 0                   ; 128c 68
                LIS  $5                  ; 128d 75
                LR   $0,A                ; 128e 50
A128f:          LR   A,(IS)+             ; 128f 4d
                ST                       ; 1290 17
                DS   $0                  ; 1291 30
                BF   $4,A128f            ; 1292 94 fc
                DCI  $3d27               ; 1294 2a 3d 27
                PI   A1708               ; 1297 28 17 08
A129a:          PI   A1844               ; 129a 28 18 44
                LR   A,$8                ; 129d 48
                CI   $3f                 ; 129e 25 3f
                BF   $4,A12a5            ; 12a0 94 04
                JMP  A133c               ; 12a2 29 13 3c
                
A12a5:          CI   $0f                 ; 12a5 25 0f
                BF   $4,A12ac            ; 12a7 94 04
                JMP  A10cf               ; 12a9 29 10 cf
                
A12ac:          LR   A,$7                ; 12ac 47
                SR   4                   ; 12ad 14
                BT   4,A12b8             ; 12ae 84 09
                DCI  A1e4a               ; 12b0 2a 1e 4a
                PI   A1800               ; 12b3 28 18 00
                BF   $0,A129a            ; 12b6 90 e3
                
A12b8:          LR   A,$8                ; 12b8 48
                CI   $40                 ; 12b9 25 40
                BF   $4,A12e8            ; 12bb 94 2c
                LI   $02                 ; 12bd 20 02
                DCI  $0fe9               ; 12bf 2a 0f e9
                ST                       ; 12c2 17
                DCI  $08f5               ; 12c3 2a 08 f5
                ST                       ; 12c6 17
                DCI  $3c02               ; 12c7 2a 3c 02
                LISU 5                   ; 12ca 65
                LISL 6                   ; 12cb 6e
                LR   A,(IS)              ; 12cc 4c
                ADC                      ; 12cd 8e
                ADC                      ; 12ce 8e
                ADC                      ; 12cf 8e
                ADC                      ; 12d0 8e
                LISU 3                   ; 12d1 63
                LISL 0                   ; 12d2 68
                LIS  $4                  ; 12d3 74
                LR   $0,A                ; 12d4 50
A12d5:          LR   A,(IS)+             ; 12d5 4d
                ST                       ; 12d6 17
                DS   $0                  ; 12d7 30
                BF   $4,A12d5            ; 12d8 94 fc
                PI   A18cf               ; 12da 28 18 cf
                LIS  $d                  ; 12dd 7d
                LR   (IS),A              ; 12de 5c

                DCI  $1e34               ; 12df 2a 1e 34
                PI   $4205               ; 12e2 28 42 05
                JMP  A10ae               ; 12e5 29 10 ae
                
A12e8:          DCI  A1c9e               ; 12e8 2a 1c 9e
                LI   $30                 ; 12eb 20 30
                LR   $0,A                ; 12ed 50
                PI   A1900               ; 12ee 28 19 00
                BF   $4,A12fb            ; 12f1 94 09
                DCI  A27ea               ; 12f3 2a 27 ea
                PI   A1800               ; 12f6 28 18 00
                BF   $0,A129a            ; 12f9 90 a0
                
A12fb:          LR   A,$7                ; 12fb 47
                SL   4                   ; 12fc 15
                AI   $04                 ; 12fd 24 04
                LR   $7,A                ; 12ff 57
                LISU 5                   ; 1300 65
                LISL 7                   ; 1301 6f
                LR   A,$0                ; 1302 40
                LR   (IS)-,A             ; 1303 5e
                CI   $28                 ; 1304 25 28
                BT   4,A1319             ; 1306 84 12
                BF   $1,A1319            ; 1308 91 10
                DS   $7                  ; 130a 37
                CI   $1e                 ; 130b 25 1e
                BT   4,A1319             ; 130d 84 0b
                BF   $1,A1319            ; 130f 91 09
                DS   $7                  ; 1311 37
                CI   $08                 ; 1312 25 08
                BT   4,A1319             ; 1314 84 04
                BF   $1,A1319            ; 1316 91 02
                DS   $7                  ; 1318 37
A1319:          LI   $19                 ; 1319 20 19
                LR   $4,A                ; 131b 54
                PI   A1916               ; 131c 28 19 16
                LI   $04                 ; 131f 20 04
                DCI  $0fe9               ; 1321 2a 0f e9
                ST                       ; 1324 17
                DCI  $08f5               ; 1325 2a 08 f5
                ST                       ; 1328 17
                PI   A18cf               ; 1329 28 18 cf
                LIS  $5                  ; 132c 75
                LR   (IS),A              ; 132d 5c
                DCI  $1e2f               ; 132e 2a 1e 2f
                PI   $4205               ; 1331 28 42 05
                LISU 5                   ; 1334 65
                LISL 7                   ; 1335 6f
                PI   A1956               ; 1336 28 19 56
                JMP  A129a               ; 1339 29 12 9a
                
A133c:          LR   A,$7                ; 133c 47
                SR   4                   ; 133d 14
                BF   $4,A138d            ; 133e 94 4e
                LR   A,$7                ; 1340 47
                CI   $02                 ; 1341 25 02
                BF   $4,A1384            ; 1343 94 40
                LI   $06                 ; 1345 20 06
                DCI  $0fe9               ; 1347 2a 0f e9
                ST                       ; 134a 17
                DCI  $08f5               ; 134b 2a 08 f5
                ST                       ; 134e 17
                LISU 5                   ; 134f 65
                LISL 6                   ; 1350 6e
                LI   $08                 ; 1351 20 08
                COM                      ; 1353 18
                INC                      ; 1354 1f
                AS   (IS)                ; 1355 cc
                BF   $1,A1384            ; 1356 91 2d
                DCI  $3cc2               ; 1358 2a 3c c2
                ADC                      ; 135b 8e
                ADC                      ; 135c 8e
                ADC                      ; 135d 8e
                ADC                      ; 135e 8e
                LR   H,DC                ; 135f 11
                LISU 4                   ; 1360 64
                LISL 0                   ; 1361 68
                LIS  $4                  ; 1362 74
                LR   $0,A                ; 1363 50
A1364:          LM                       ; 1364 16
                LR   (IS)+,A             ; 1365 5d
                DS   $0                  ; 1366 30
                BF   $4,A1364            ; 1367 94 fc
                PI   A26ac               ; 1369 28 26 ac
                LISU 3                   ; 136c 63
                LISL 0                   ; 136d 68
                LIS  $4                  ; 136e 74
                LR   $0,A                ; 136f 50
                LR   DC,H                ; 1370 10
A1371:          LR   A,(IS)+             ; 1371 4d
                ST                       ; 1372 17
                DS   $0                  ; 1373 30
                BF   $4,A1371            ; 1374 94 fc
                PI   A18cf               ; 1376 28 18 cf
                DCI  A1e41               ; 1379 2a 1e 41
                LIS  $9                  ; 137c 79
                LR   (IS),A              ; 137d 5c
                PI   $4205               ; 137e 28 42 05
                JMP  A10ae               ; 1381 29 10 ae
                
A1384:          DCI  A1e54               ; 1384 2a 1e 54
                PI   A1800               ; 1387 28 18 00
                JMP  A129a               ; 138a 29 12 9a
                
A138d:          LISU 5                   ; 138d 65
                LISL 6                   ; 138e 6e
                LR   A,(IS)+             ; 138f 4d
                XS   (IS)                ; 1390 ec
                BF   $4,A139c            ; 1391 94 0a
                DCI  A1e54               ; 1393 2a 1e 54
                PI   A1800               ; 1396 28 18 00
                JMP  A10cf               ; 1399 29 10 cf
                
A139c:          LISL 3                   ; 139c 6b
A139d:          LISU 3                   ; 139d 63
                LR   A,(IS)              ; 139e 4c
                LISU 4                   ; 139f 64
                LR   (IS)-,A             ; 13a0 5e
                BR7  A139d               ; 13a1 8f fb
                LISU 5                   ; 13a3 65
                LISL 6                   ; 13a4 6e
                LR   A,(IS)              ; 13a5 4c
                DCI  $3c02               ; 13a6 2a 3c 02
                ADC                      ; 13a9 8e
                ADC                      ; 13aa 8e
                ADC                      ; 13ab 8e
                ADC                      ; 13ac 8e
                LR   H,DC                ; 13ad 11
                LISU 3                   ; 13ae 63
                LISL 0                   ; 13af 68
                LIS  $4                  ; 13b0 74
                LR   $0,A                ; 13b1 50
A13b2:          LM                       ; 13b2 16
                LR   (IS)+,A             ; 13b3 5d
                DS   $0                  ; 13b4 30
                BF   $4,A13b2            ; 13b5 94 fc
                LI   $10                 ; 13b7 20 10
                NS   $7                  ; 13b9 f7
                BF   $4,A13c1            ; 13ba 94 06
                PI   A26ac               ; 13bc 28 26 ac
                BF   $0,A13c4            ; 13bf 90 04
                
A13c1:          PI   A26c0               ; 13c1 28 26 c0
A13c4:          LISU 3                   ; 13c4 63
                LISL 0                   ; 13c5 68
                LIS  $4                  ; 13c6 74
                LR   $0,A                ; 13c7 50
                LR   DC,H                ; 13c8 10
A13c9:          LR   A,(IS)+             ; 13c9 4d
                ST                       ; 13ca 17
                DS   $0                  ; 13cb 30
                BF   $4,A13c9            ; 13cc 94 fc
                LISL 0                   ; 13ce 68
                LIS  $0                  ; 13cf 70
                AS   (IS)                ; 13d0 cc
                BT   1,A13d9             ; 13d1 81 07
                DCI  A1e68               ; 13d3 2a 1e 68
                PI   A1800               ; 13d6 28 18 00
A13d9:          LISU 5                   ; 13d9 65
                LISL 7                   ; 13da 6f
                LR   A,(IS)              ; 13db 4c
                DCI  $3c02               ; 13dc 2a 3c 02
                ADC                      ; 13df 8e
                ADC                      ; 13e0 8e
                ADC                      ; 13e1 8e
                ADC                      ; 13e2 8e
                LR   H,DC                ; 13e3 11
                LISU 3                   ; 13e4 63
                LISL 0                   ; 13e5 68
                LIS  $4                  ; 13e6 74
                LR   $0,A                ; 13e7 50
A13e8:          LM                       ; 13e8 16
                LR   (IS)+,A             ; 13e9 5d
                DS   $0                  ; 13ea 30
                BF   $4,A13e8            ; 13eb 94 fc
                LIS  $1                  ; 13ed 71
                NS   $7                  ; 13ee f7
                BF   $4,A13f6            ; 13ef 94 06
                PI   A26c0               ; 13f1 28 26 c0
                BF   $0,A13f9            ; 13f4 90 04
                
A13f6:          PI   A26ac               ; 13f6 28 26 ac
A13f9:          LISU 3                   ; 13f9 63
                LISL 0                   ; 13fa 68
                LIS  $4                  ; 13fb 74
                LR   $0,A                ; 13fc 50
                LR   DC,H                ; 13fd 10
A13fe:          LR   A,(IS)+             ; 13fe 4d
                ST                       ; 13ff 17
                DS   $0                  ; 1400 30
                BF   $4,A13fe            ; 1401 94 fc
                LISL 0                   ; 1403 68
                LIS  $0                  ; 1404 70
                AS   (IS)                ; 1405 cc
                BT   1,A140e             ; 1406 81 07
                DCI  A1e5e               ; 1408 2a 1e 5e
                PI   A1800               ; 140b 28 18 00
A140e:          PI   A18cf               ; 140e 28 18 cf
                DCI  A1e45               ; 1411 2a 1e 45
                LIS  $5                  ; 1414 75
                LR   (IS),A              ; 1415 5c
                PI   $4205               ; 1416 28 42 05
                JMP  A10ae               ; 1419 29 10 ae
                
A141c:          LI   $20                 ; 141c 20 20
                DCI  $0fdf               ; 141e 2a 0f df
                ST                       ; 1421 17
                LI   $0f                 ; 1422 20 0f
                LR   (IS),A              ; 1424 5c
                DCI  A1da8               ; 1425 2a 1d a8
                PI   $4205               ; 1428 28 42 05
                DCI  $3c02               ; 142b 2a 3c 02
                LIS  $4                  ; 142e 74
                LR   $1,A                ; 142f 51
A1430:          LI   $30                 ; 1430 20 30
                AI   $16                 ; 1432 24 16
                LR   $0,A                ; 1434 50
                LIS  $0                  ; 1435 70
A1436:          ST                       ; 1436 17
                DS   $0                  ; 1437 30
                BF   $4,A1436            ; 1438 94 fd
                LR   Q,DC                ; 143a 0e
                PI   $41c8               ; 143b 28 41 c8
                LR   DC,Q                ; 143e 0f
                DS   $1                  ; 143f 31
                BF   $4,A1430            ; 1440 94 ef
                DCI  $3d26               ; 1442 2a 3d 26
                LI   $3f                 ; 1445 20 3f
                ST                       ; 1447 17
                JMP  A10ae               ; 1448 29 10 ae
                
                DCI  $0fdf               ; 144b 2a 0f df
                LI   $40                 ; 144e 20 40
                ST                       ; 1450 17
                DCI  A1d34               ; 1451 2a 1d 34
                LIS  $e                  ; 1454 7e
                LR   (IS),A              ; 1455 5c
                PI   $4205               ; 1456 28 42 05
                DCI  $0fdf               ; 1459 2a 0f df
                LI   $50                 ; 145c 20 50
                ST                       ; 145e 17
                DCI  A1d42               ; 145f 2a 1d 42
                LIS  $4                  ; 1462 74
                LR   (IS),A              ; 1463 5c
                PI   $4205               ; 1464 28 42 05
                LIS  $0                  ; 1467 70
                LR   $5,A                ; 1468 55
A1469:          PI   A1844               ; 1469 28 18 44
                DCI  $1cc6               ; 146c 2a 1c c6
                LIS  $8                  ; 146f 78
                LR   $0,A                ; 1470 50
                PI   A1900               ; 1471 28 19 00
                BT   4,A147e             ; 1474 84 09
A1476:          DCI  A27ea               ; 1476 2a 27 ea
                PI   A1800               ; 1479 28 18 00
                BF   $0,A1469            ; 147c 90 ec
                
A147e:          LR   A,$8                ; 147e 48
                CI   $3f                 ; 147f 25 3f
                BF   $4,A1487            ; 1481 94 05
                LIS  $0                  ; 1483 70
                LR   $8,A                ; 1484 58
                BF   $0,A1493            ; 1485 90 0d
                
A1487:          CI   $40                 ; 1487 25 40
                BT   4,A1476             ; 1489 84 ec
                CI   $3d                 ; 148b 25 3d
                BT   4,A14bb             ; 148d 84 2d
                CI   $3e                 ; 148f 25 3e
                BT   4,A1476             ; 1491 84 e4
A1493:          LI   $0b                 ; 1493 20 0b
                LR   $4,A                ; 1495 54
                PI   A1916               ; 1496 28 19 16
                DCI  $3d32               ; 1499 2a 3d 32
                LR   A,$5                ; 149c 45
                ADC                      ; 149d 8e
                LR   A,$8                ; 149e 48
                ST                       ; 149f 17
                LR   A,$5                ; 14a0 45
                INC                      ; 14a1 1f
                CI   $0b                 ; 14a2 25 0b
                BF   $1,A1476            ; 14a4 91 d1
                LR   $5,A                ; 14a6 55
                COM                      ; 14a7 18
                INC                      ; 14a8 1f
                AI   $5f                 ; 14a9 24 5f
                DCI  $0fdf               ; 14ab 2a 0f df
                ST                       ; 14ae 17
                LISU 2                   ; 14af 62
                LISL 4                   ; 14b0 6c
                LR   A,$5                ; 14b1 45
                LR   (IS),A              ; 14b2 5c
                DCI  $3d32               ; 14b3 2a 3d 32
                PI   $4205               ; 14b6 28 42 05
                BF   $0,A1469            ; 14b9 90 af
                
A14bb:          LI   $28                 ; 14bb 20 28
                LR   $4,A                ; 14bd 54
                PI   A1916               ; 14be 28 19 16
                PI   A18cf               ; 14c1 28 18 cf
                LIS  $4                  ; 14c4 74
                LR   (IS),A              ; 14c5 5c
                DCI  $1d46               ; 14c6 2a 1d 46
                PI   $4205               ; 14c9 28 42 05
A14cc:          PI   A1844               ; 14cc 28 18 44
                LR   A,$8                ; 14cf 48
                CI   $0f                 ; 14d0 25 0f
                BF   $4,A14d7            ; 14d2 94 04
A14d4:          JMP  A10cf               ; 14d4 29 10 cf

A14d7:          DCI  A1c9e               ; 14d7 2a 1c 9e
                LI   $30                 ; 14da 20 30
                LR   $0,A                ; 14dc 50
                PI   A1900               ; 14dd 28 19 00
                BF   $4,A14ea            ; 14e0 94 09
                DCI  A27ea               ; 14e2 2a 27 ea
                PI   A1800               ; 14e5 28 18 00
                BF   $0,A14cc            ; 14e8 90 e3
                
A14ea:          LI   $19                 ; 14ea 20 19
                LR   $4,A                ; 14ec 54
                PI   A1916               ; 14ed 28 19 16
                LISU 5                   ; 14f0 65
                LISL 6                   ; 14f1 6e
                LR   A,$0                ; 14f2 40
                LR   (IS),A              ; 14f3 5c
                PI   A1956               ; 14f4 28 19 56
                PI   A1684               ; 14f7 28 16 84
                BT   4,A14d4             ; 14fa 84 d9
                DCI  $3d24               ; 14fc 2a 3d 24
                LI   $3f                 ; 14ff 20 3f
                ST                       ; 1501 17
                LR   A,$5                ; 1502 45
                LR   $0,A                ; 1503 50
                DCI  $3d32               ; 1504 2a 3d 32
                XDC                      ; 1507 2c
                LIS  $b                  ; 1508 7b
                LR   $1,A                ; 1509 51
                DCI  $3d41               ; 150a 2a 3d 41
                LISU 5                   ; 150d 65
                LISL 6                   ; 150e 6e
                LR   A,(IS)              ; 150f 4c
A1510:          ADC                      ; 1510 8e
                DS   $1                  ; 1511 31
                BF   $4,A1510            ; 1512 94 fd
A1514:          XDC                      ; 1514 2c
                LM                       ; 1515 16
                XDC                      ; 1516 2c
                ST                       ; 1517 17
                DS   $0                  ; 1518 30
                BF   $4,A1514            ; 1519 94 fa
                LR   A,$5                ; 151b 45
                CI   $0b                 ; 151c 25 0b
                BT   4,A1523             ; 151e 84 04
                LI   $ff                 ; 1520 20 ff
                ST                       ; 1522 17
A1523:          JMP  A140e               ; 1523 29 14 0e

                DCI  $0fdf               ; 1526 2a 0f df
                LIS  $0                  ; 1529 70
                ST                       ; 152a 17
                DCI  $1d4a               ; 152b 2a 1d 4a
                LI   $5e                 ; 152e 20 5e
                LR   (IS),A              ; 1530 5c
                PI   $4205               ; 1531 28 42 05
                PI   A1684               ; 1534 28 16 84
                BT   4,A154c             ; 1537 84 14
                DCI  $0c04               ; 1539 2a 0c 04
                LIS  $1                  ; 153c 71
                ST                       ; 153d 17
                LI   $18                 ; 153e 20 18
                ST                       ; 1540 17
                PI   A1a91               ; 1541 28 1a 91
                BF   $1,A154f            ; 1544 91 0a
A1546:          DCI  A1e72               ; 1546 2a 1e 72
                PI   A1800               ; 1549 28 18 00
A154c:          JMP  A10ae               ; 154c 29 10 ae

A154f:          PI   $41c8               ; 154f 28 41 c8
                LI   $1e                 ; 1552 20 1e
                LR   $0,A                ; 1554 50
                DCI  $3d41               ; 1555 2a 3d 41
                XDC                      ; 1558 2c
                DCI  $3c02               ; 1559 2a 3c 02
                PI   A16a0               ; 155c 28 16 a0
                PI   $41c8               ; 155f 28 41 c8
                LI   $16                 ; 1562 20 16
                LR   $0,A                ; 1564 50
                LI   $30                 ; 1565 20 30
                DCI  $3d41               ; 1567 2a 3d 41
                ADC                      ; 156a 8e
                ADC                      ; 156b 8e
                ADC                      ; 156c 8e
                ADC                      ; 156d 8e
                XDC                      ; 156e 2c
                DCI  $3cc2               ; 156f 2a 3c c2
                PI   A16a0               ; 1572 28 16 a0
                PI   $41c8               ; 1575 28 41 c8
                LISU 2                   ; 1578 62
                LISL 4                   ; 1579 6c
                LI   $12                 ; 157a 20 12
                SL   1                   ; 157c 13
                SL   1                   ; 157d 13
                LR   (IS),A              ; 157e 5c
                LI   $1e                 ; 157f 20 1e
                DCI  $3d41               ; 1581 2a 3d 41
                ADC                      ; 1584 8e
                ADC                      ; 1585 8e
                ADC                      ; 1586 8e
                ADC                      ; 1587 8e
                XDC                      ; 1588 2c
                DCI  $3c02               ; 1589 2a 3c 02
                ADC                      ; 158c 8e
                ADC                      ; 158d 8e
                ADC                      ; 158e 8e
                ADC                      ; 158f 8e
                PI   $43cd               ; 1590 28 43 cd
                DCI  $3d26               ; 1593 2a 3d 26
                LI   $3f                 ; 1596 20 3f
                ST                       ; 1598 17
                DCI  $0c04               ; 1599 2a 0c 04
                LIS  $2                  ; 159c 72
                ST                       ; 159d 17
                LI   $10                 ; 159e 20 10
                ST                       ; 15a0 17
                PI   A1a91               ; 15a1 28 1a 91
                BT   2,A1546             ; 15a4 82 a1
                BT   1,A1546             ; 15a6 81 9f
                DCI  A1e7c               ; 15a8 2a 1e 7c
                PI   A1800               ; 15ab 28 18 00
                DCI  $3d24               ; 15ae 2a 3d 24
                LI   $3f                 ; 15b1 20 3f
                ST                       ; 15b3 17
                JMP  A10ae               ; 15b4 29 10 ae
                
                PI   $41d5               ; 15b7 28 41 d5
                DCI  $0fdf               ; 15ba 2a 0f df
                LI   $10                 ; 15bd 20 10
                ST                       ; 15bf 17
                LIS  $3                  ; 15c0 73
                LR   $5,A                ; 15c1 55
A15c2:          DCI  A1fe0               ; 15c2 2a 1f e0
                LR   A,$5                ; 15c5 45
                SL   1                   ; 15c6 13
                SL   1                   ; 15c7 13
                AS   $5                  ; 15c8 c5
                ADC                      ; 15c9 8e
                LISU 2                   ; 15ca 62
                LISL 4                   ; 15cb 6c
                LIS  $3                  ; 15cc 73
                LR   (IS),A              ; 15cd 5c
                PI   $4205               ; 15ce 28 42 05
                LM                       ; 15d1 16
                XDC                      ; 15d2 2c
                DCI  $3c02               ; 15d3 2a 3c 02
                ADC                      ; 15d6 8e
                ADC                      ; 15d7 8e
                ADC                      ; 15d8 8e
                ADC                      ; 15d9 8e
                XDC                      ; 15da 2c
                LM                       ; 15db 16
                LR   $0,A                ; 15dc 50
                XDC                      ; 15dd 2c
                PI   A16e3               ; 15de 28 16 e3
                LR   A,$5                ; 15e1 45
                CI   $03                 ; 15e2 25 03
                BF   $4,A15f1            ; 15e4 94 0c
                DCI  $3d27               ; 15e6 2a 3d 27
                LISU 3                   ; 15e9 63
                LISL 3                   ; 15ea 6b
A15eb:          LR   A,(IS)-             ; 15eb 4e
                ST                       ; 15ec 17
                BR7  A15eb               ; 15ed 8f fd
                BF   $0,A1626            ; 15ef 90 36
                
A15f1:          CI   $02                 ; 15f1 25 02
                BF   $4,A1626            ; 15f3 94 32
                LISU 3                   ; 15f5 63
                LISL 3                   ; 15f6 6b
                LIS  $4                  ; 15f7 74
                LR   $8,A                ; 15f8 58
                PI   A27b7               ; 15f9 28 27 b7
                LISU 4                   ; 15fc 64
                LISL 3                   ; 15fd 6b
                DCI  $3d27               ; 15fe 2a 3d 27
A1601:          LM                       ; 1601 16
                LR   (IS)-,A             ; 1602 5e
                BR7  A1601               ; 1603 8f fd
                PI   A26ac               ; 1605 28 26 ac
                DCI  $3d27               ; 1608 2a 3d 27
                LISU 3                   ; 160b 63
                LISL 0                   ; 160c 68
                LIS  $4                  ; 160d 74
                LR   $0,A                ; 160e 50
A160f:          LR   A,(IS)+             ; 160f 4d
                ST                       ; 1610 17
                DS   $0                  ; 1611 30
                BF   $4,A160f            ; 1612 94 fc
                LISU 2                   ; 1614 62
                LISL 4                   ; 1615 6c
                DCI  A1fdd               ; 1616 2a 1f dd
                LIS  $3                  ; 1619 73
                LR   (IS),A              ; 161a 5c
                PI   $4205               ; 161b 28 42 05
                DCI  $3d27               ; 161e 2a 3d 27
                LIS  $1                  ; 1621 71
                LR   $0,A                ; 1622 50
                PI   A16e3               ; 1623 28 16 e3
A1626:          DS   $5                  ; 1626 35
                BT   1,A15c2             ; 1627 81 9a
                PI   A1987               ; 1629 28 19 87
                JMP  A10ae               ; 162c 29 10 ae
                
                LI   $10                 ; 162f 20 10
                LR   (IS),A              ; 1631 5c
                DCI  $0fdf               ; 1632 2a 0f df
                LI   $20                 ; 1635 20 20
                ST                       ; 1637 17
                DCI  A1db7               ; 1638 2a 1d b7
                PI   $4205               ; 163b 28 42 05
                LI   $1e                 ; 163e 20 1e
                SL   1                   ; 1640 13
                SL   1                   ; 1641 13
                LR   (IS),A              ; 1642 5c
                LIS  $0                  ; 1643 70
                DCI  $3c02               ; 1644 2a 3c 02
A1647:          ST                       ; 1647 17
                DS   (IS)                ; 1648 3c
                BF   $4,A1647            ; 1649 94 fd
                LI   $16                 ; 164b 20 16
                SL   1                   ; 164d 13
                SL   1                   ; 164e 13
                LR   (IS),A              ; 164f 5c
                LIS  $0                  ; 1650 70
                DCI  $3cc2               ; 1651 2a 3c c2
A1654:          ST                       ; 1654 17
                DS   (IS)                ; 1655 3c
                BF   $4,A1654            ; 1656 94 fd
                JMP  A10ae               ; 1658 29 10 ae
                
                DCI  $0fdf               ; 165b 2a 0f df
                LIS  $0                  ; 165e 70
                ST                       ; 165f 17
                DCI  A1dc7               ; 1660 2a 1d c7
                LI   $5e                 ; 1663 20 5e
                LR   (IS),A              ; 1665 5c
                PI   $4205               ; 1666 28 42 05
                PI   A1684               ; 1669 28 16 84
                BT   4,A1681             ; 166c 84 14
                DCI  $3c02               ; 166e 2a 3c 02
                PI   A1a29               ; 1671 28 1a 29
                BF   $1,A167b            ; 1674 91 06
                DCI  A1e86               ; 1676 2a 1e 86
                BF   $0,A167e            ; 1679 90 04
                
A167b:          DCI  A1e90               ; 167b 2a 1e 90
A167e:          PI   A1800               ; 167e 28 18 00
A1681:          JMP  A10ae               ; 1681 29 10 ae

A1684:          LR   K,P                 ; 1684 08
                PI   $40a9               ; 1685 28 40 a9
A1688:          PI   A1844               ; 1688 28 18 44
                LR   A,$8                ; 168b 48
                CI   $0f                 ; 168c 25 0f
                BT   4,A169d             ; 168e 84 0e
                CI   $3f                 ; 1690 25 3f
                BT   4,A169c             ; 1692 84 09
                DCI  A1e4a               ; 1694 2a 1e 4a
                PI   A1800               ; 1697 28 18 00
                BF   $0,A1688            ; 169a 90 ed
                
A169c:          NS   $8                  ; 169c f8
A169d:          JMP  A1ac0               ; 169d 29 1a c0

A16a0:          LR   K,P                 ; 16a0 08
                PI   $40a9               ; 16a1 28 40 a9
                LR   Q,DC                ; 16a4 0e
                XDC                      ; 16a5 2c
                LR   H,DC                ; 16a6 11
A16a7:          LIS  $4                  ; 16a7 74
                LR   $1,A                ; 16a8 51
                LISU 3                   ; 16a9 63
                LISL 0                   ; 16aa 68
                LR   DC,Q                ; 16ab 0f
A16ac:          LM                       ; 16ac 16
                LR   (IS)+,A             ; 16ad 5d
                DS   $1                  ; 16ae 31
                BF   $4,A16ac            ; 16af 94 fc
                LR   DC,H                ; 16b1 10
                LIS  $4                  ; 16b2 74
                LR   $1,A                ; 16b3 51
                LISU 4                   ; 16b4 64
                LISL 0                   ; 16b5 68
A16b6:          LM                       ; 16b6 16
                LR   (IS)+,A             ; 16b7 5d
                DS   $1                  ; 16b8 31
                BF   $4,A16b6            ; 16b9 94 fc
                LR   H,DC                ; 16bb 11
                PI   A26ac               ; 16bc 28 26 ac
                LISU 3                   ; 16bf 63
                LISL 0                   ; 16c0 68
                LR   DC,Q                ; 16c1 0f
                LIS  $4                  ; 16c2 74
                LR   $1,A                ; 16c3 51
A16c4:          LR   A,(IS)+             ; 16c4 4d
                ST                       ; 16c5 17
                DS   $1                  ; 16c6 31
                BF   $4,A16c4            ; 16c7 94 fc
                LR   Q,DC                ; 16c9 0e
                LIS  $f                  ; 16ca 7f
                NS   $0                  ; 16cb f0
                BF   $4,A16dd            ; 16cc 94 10
                LISU 3                   ; 16ce 63
                LISL 0                   ; 16cf 68
                LR   A,$a                ; 16d0 4a
                LR   (IS)+,A             ; 16d1 5d
                LR   A,$b                ; 16d2 4b
                LR   (IS),A              ; 16d3 5c
                PI   $41c8               ; 16d4 28 41 c8
                LISU 3                   ; 16d7 63
                LISL 0                   ; 16d8 68
                LR   A,(IS)+             ; 16d9 4d
                LR   $a,A                ; 16da 5a
                LR   A,(IS)              ; 16db 4c
                LR   $b,A                ; 16dc 5b
A16dd:          DS   $0                  ; 16dd 30
                BF   $4,A16a7            ; 16de 94 c8
                JMP  A17f9               ; 16e0 29 17 f9
                
A16e3:          LR   K,P                 ; 16e3 08
; Also present in Expander I BIOS at $06E0-$06FB (28 bytes)
                PI   $40a9               ; 16e4 28 40 a9
                LISU 3                   ; 16e7 63
                LISL 3                   ; 16e8 6b
                LIS  $0                  ; 16e9 70
A16ea:          LR   (IS)-,A             ; 16ea 5e
                BR7  A16ea               ; 16eb 8f fe
                LR   H,DC                ; 16ed 11
A16ee:          LISU 4                   ; 16ee 64
                LISL 0                   ; 16ef 68
                LIS  $4                  ; 16f0 74
                LR   $1,A                ; 16f1 51
                LR   DC,H                ; 16f2 10
A16f3:          LM                       ; 16f3 16
                LR   (IS)+,A             ; 16f4 5d
                DS   $1                  ; 16f5 31
                BF   $4,A16f3            ; 16f6 94 fc
                LR   H,DC                ; 16f8 11
                PI   A26ac               ; 16f9 28 26 ac
                DS   $0                  ; 16fc 30
                BF   $4,A16ee            ; 16fd 94 f0
                PI   A1775               ; 16ff 28 17 75
                PI   $4122               ; 1702 28 41 22
                JMP  A19a3               ; 1705 29 19 a3
                
; Also present in Expander I BIOS at $0704-$076D (106 bytes)
A1708:          LR   K,P                 ; 1708 08
                PI   $40a9               ; 1709 28 40 a9
                LISU 3                   ; 170c 63
                LISL 0                   ; 170d 68
                LIS  $9                  ; 170e 79
                LR   $0,A                ; 170f 50
                LIS  $0                  ; 1710 70
                LR   $3,A                ; 1711 53
A1712:          LR   (IS)+,A             ; 1712 5d
                BR7  A1712               ; 1713 8f fe
                LISL 3                   ; 1715 6b
                LM                       ; 1716 16
                LR   $2,A                ; 1717 52
                NI   $0f                 ; 1718 21 0f
                LR   (IS),A              ; 171a 5c
                BT   4,A173b             ; 171b 84 1f
                DS   $3                  ; 171d 33
A171e:          LISL 3                   ; 171e 6b
                LIS  $1                  ; 171f 71
                XS   $0                  ; 1720 e0
                BT   4,A1764             ; 1721 84 42
                PI   A27c6               ; 1723 28 27 c6
                LISL 3                   ; 1726 6b
A1727:          LISU 3                   ; 1727 63
                LR   A,(IS)              ; 1728 4c
                LISU 4                   ; 1729 64
                LR   (IS)-,A             ; 172a 5e
                BR7  A1727               ; 172b 8f fb
                LISU 4                   ; 172d 64
                LISL 3                   ; 172e 6b
                PI   A27c6               ; 172f 28 27 c6
                LISL 3                   ; 1732 6b
                PI   A27c6               ; 1733 28 27 c6
                XDC                      ; 1736 2c
                PI   A26ac               ; 1737 28 26 ac
                XDC                      ; 173a 2c
A173b:          DS   $0                  ; 173b 30
                BT   4,A1764             ; 173c 84 27
                BF   $1,A1764            ; 173e 91 25
                LIS  $1                  ; 1740 71
                NS   $0                  ; 1741 f0
                BF   $4,A1749            ; 1742 94 06
                LM                       ; 1744 16
                LR   $1,A                ; 1745 51
                SR   4                   ; 1746 14
                BF   $0,A174b            ; 1747 90 03
                
A1749:          LIS  $f                  ; 1749 7f
                NS   $1                  ; 174a f1
A174b:          BF   $4,A1753            ; 174b 94 07
                LR   A,$3                ; 174d 43
                NS   $3                  ; 174e f3
                BT   4,A173b             ; 174f 84 eb
                BF   $0,A171e            ; 1751 90 cc
                
A1753:          DS   $3                  ; 1753 33
                LISU 3                   ; 1754 63
                LISL 3                   ; 1755 6b
                AS   (IS)                ; 1756 cc
                BF   $2,A1761            ; 1757 92 09
A1759:          LR   (IS)-,A             ; 1759 5e
                LR   A,(IS)              ; 175a 4c
                LNK                      ; 175b 19
                LR   (IS),A              ; 175c 5c
                BF   $2,A171e            ; 175d 92 c0
                BR7  A1759               ; 175f 8f f9
A1761:          LR   (IS),A              ; 1761 5c
                BF   $0,A171e            ; 1762 90 bb
                
A1764:          LIS  $0                  ; 1764 70
                XS   $2                  ; 1765 e2
                BT   1,A1772             ; 1766 81 0b
                LR   A,$8                ; 1768 48
                LR   $0,A                ; 1769 50
                LIS  $4                  ; 176a 74
                LR   $8,A                ; 176b 58
                LISL 3                   ; 176c 6b
                PI   A27b7               ; 176d 28 27 b7
                LR   A,$0                ; 1770 40
                LR   $8,A                ; 1771 58
A1772:          JMP  A17f9               ; 1772 29 17 f9

; Also present in Expander I BIOS at $0772-$07FC through $17FF
; (139 bytes including three zeros at the end)
A1775:          LR   K,P                 ; 1775 08
                PI   $40a9               ; 1776 28 40 a9
                PI   $41c8               ; 1779 28 41 c8
                LISL 3                   ; 177c 6b
A177d:          LISU 3                   ; 177d 63
                LR   A,(IS)              ; 177e 4c
                LISU 5                   ; 177f 65
                LR   (IS)-,A             ; 1780 5e
                BR7  A177d               ; 1781 8f fb
                LI   $1f                 ; 1783 20 1f
                LR   $0,A                ; 1785 50
                LISU 4                   ; 1786 64
                LISL 4                   ; 1787 6c
                LIS  $0                  ; 1788 70
A1789:          LR   (IS)-,A             ; 1789 5e
                BR7  A1789               ; 178a 8f fe
                LR   $1,A                ; 178c 51
                LISU 5                   ; 178d 65
                LISL 0                   ; 178e 68
                LR   A,(IS)              ; 178f 4c
                NS   (IS)                ; 1790 fc
                BT   1,A17a0             ; 1791 81 0e
                LI   $f0                 ; 1793 20 f0
                LR   $1,A                ; 1795 51
                LR   A,$8                ; 1796 48
                LR   $2,A                ; 1797 52
                LISL 3                   ; 1798 6b
                LIS  $4                  ; 1799 74
                LR   $8,A                ; 179a 58
                PI   A27b7               ; 179b 28 27 b7
                LR   A,$2                ; 179e 42
                LR   $8,A                ; 179f 58
A17a0:          LISL 3                   ; 17a0 6b
                LISU 5                   ; 17a1 65
                PI   A27c6               ; 17a2 28 27 c6
                LISL 0                   ; 17a5 68
                LI   $80                 ; 17a6 20 80
                NS   (IS)                ; 17a8 fc
                BF   $4,A17b0            ; 17a9 94 06
                DS   $0                  ; 17ab 30
                BF   $4,A17a0            ; 17ac 94 f3
                BF   $0,A17f6            ; 17ae 90 47
                
A17b0:          LISL 3                   ; 17b0 6b
                LISU 5                   ; 17b1 65
                PI   A27c6               ; 17b2 28 27 c6
                LIS  $0                  ; 17b5 70
                LNK                      ; 17b6 19
                LR   $2,A                ; 17b7 52
                LISU 4                   ; 17b8 64
                LISL 4                   ; 17b9 6c
                PI   A27c6               ; 17ba 28 27 c6
                LISL 4                   ; 17bd 6c
                LR   A,(IS)              ; 17be 4c
                AS   $2                  ; 17bf c2
                LR   (IS),A              ; 17c0 5c
                DS   $0                  ; 17c1 30
                BT   4,A17e5             ; 17c2 84 22
                LIS  $8                  ; 17c4 78
                NS   $0                  ; 17c5 f0
                BT   4,A17cb             ; 17c6 84 04
                PI   $41c8               ; 17c8 28 41 c8
A17cb:          LISL 4                   ; 17cb 6c
                LISU 4                   ; 17cc 64
A17cd:          LIS  $f                  ; 17cd 7f
                NS   (IS)                ; 17ce fc
                CI   $04                 ; 17cf 25 04
                BT   1,A17d5             ; 17d1 81 03
                AI   $03                 ; 17d3 24 03
A17d5:          LR   $2,A                ; 17d5 52
                LR   A,(IS)              ; 17d6 4c
                SR   4                   ; 17d7 14
                CI   $04                 ; 17d8 25 04
                BT   1,A17de             ; 17da 81 03
                AI   $03                 ; 17dc 24 03
A17de:          SL   4                   ; 17de 15
                AS   $2                  ; 17df c2
                LR   (IS)-,A             ; 17e0 5e
                BR7  A17cd               ; 17e1 8f eb
                BF   $0,A17b0            ; 17e3 90 cc
                
A17e5:          LISL 0                   ; 17e5 68
                LI   $f0                 ; 17e6 20 f0
                NS   (IS)                ; 17e8 fc
                BT   4,A17f3             ; 17e9 84 09
                LI   $99                 ; 17eb 20 99
                LISL 4                   ; 17ed 6c
A17ee:          LR   (IS)-,A             ; 17ee 5e
                BR7  A17ee               ; 17ef 8f fe
                BF   $0,A17f6            ; 17f1 90 04
                
A17f3:          LR   A,$1                ; 17f3 41
                AS   (IS)                ; 17f4 cc
                LR   (IS),A              ; 17f5 5c
A17f6:          PI   $41c8               ; 17f6 28 41 c8
A17f9:          PI   $40bc               ; 17f9 28 40 bc
                PK                       ; 17fc 0c
                
                LR   A,KU                ; 17fd 00
                LR   A,KU                ; 17fe 00
                LR   A,KU                ; 17ff 00
A1800:          LR   K,P                 ; 1800 08
                PI   $40a9               ; 1801 28 40 a9
                LR   Q,DC                ; 1804 0e
                LI   $64                 ; 1805 20 64
                LR   $4,A                ; 1807 54
                PI   A1916               ; 1808 28 19 16
                DCI  $0fdf               ; 180b 2a 0f df
                LM                       ; 180e 16
                LR   $0,A                ; 180f 50
                LI   $63                 ; 1810 20 63
                DCI  $0fdf               ; 1812 2a 0f df
                ST                       ; 1815 17
                LI   $1f                 ; 1816 20 1f
                DCI  $0fc0               ; 1818 2a 0f c0
                LR   H,DC                ; 181b 11
                NM                       ; 181c 8a
                LR   DC,H                ; 181d 10
                ST                       ; 181e 17
                LISU 2                   ; 181f 62
                LISL 4                   ; 1820 6c
                LR   DC,Q                ; 1821 0f
                LIS  $a                  ; 1822 7a
                LR   (IS),A              ; 1823 5c
                PI   $4205               ; 1824 28 42 05
                LI   $6c                 ; 1827 20 6c
                LR   (IS),A              ; 1829 5c
A182a:          PI   $41c8               ; 182a 28 41 c8
                LISL 4                   ; 182d 6c
                DS   (IS)                ; 182e 3c
                BF   $4,A182a            ; 182f 94 fa
                DCI  $0ecf               ; 1831 2a 0e cf
                LI   $70                 ; 1834 20 70
                LR   (IS),A              ; 1836 5c
                LIS  $0                  ; 1837 70
A1838:          ST                       ; 1838 17
                DS   (IS)                ; 1839 3c
                BF   $4,A1838            ; 183a 94 fd
                LR   A,$0                ; 183c 40
                DCI  $0fdf               ; 183d 2a 0f df
                ST                       ; 1840 17
                JMP  A17f9               ; 1841 29 17 f9
                
A1844:          LR   K,P                 ; 1844 08
                PI   $40a9               ; 1845 28 40 a9
A1848:          PI   A1862               ; 1848 28 18 62
                BT   4,A1848             ; 184b 84 fc
                BF   $1,A1848            ; 184d 91 fa
                DCI  $0fe2               ; 184f 2a 0f e2
                LI   $fe                 ; 1852 20 fe
                NM                       ; 1854 8a
                DCI  $0fe2               ; 1855 2a 0f e2
                ST                       ; 1858 17
                LI   $8e                 ; 1859 20 8e
                DCI  $0fb9               ; 185b 2a 0f b9
                ST                       ; 185e 17
                JMP  A17f9               ; 185f 29 17 f9
                
A1862:          LR   K,P                 ; 1862 08
                PI   $40a9               ; 1863 28 40 a9
A1866:          PI   $4361               ; 1866 28 43 61
                BF   $4,A187d            ; 1869 94 13
                LIS  $0                  ; 186b 70
                XS   $8                  ; 186c e8
                DCI  $0fe3               ; 186d 2a 0f e3
                BT   4,A1898             ; 1870 84 27
                LIS  $0                  ; 1872 70
                XM                       ; 1873 8c
                BF   $4,A1899            ; 1874 94 24
                DCI  $0fe3               ; 1876 2a 0f e3
                LIS  $1                  ; 1879 71
                ST                       ; 187a 17
                LISL 4                   ; 187b 6c
                LR   (IS),A              ; 187c 5c
A187d:          PI   $41c8               ; 187d 28 41 c8
                LISL 4                   ; 1880 6c
                DS   (IS)                ; 1881 3c
                BF   $4,A1866            ; 1882 94 e3
                LIS  $0                  ; 1884 70
                XS   $8                  ; 1885 e8
                LR   J,W                 ; 1886 1e
                DCI  $0fe2               ; 1887 2a 0f e2
                CI   $1e                 ; 188a 25 1e
                BT   4,A189d             ; 188c 84 10
                SL   1                   ; 188e 13
                LR   $8,A                ; 188f 58
                LIS  $0                  ; 1890 70
                XM                       ; 1891 8c
                BF   $4,A1895            ; 1892 94 02
                DS   $8                  ; 1894 38
A1895:          JMP  A17f9               ; 1895 29 17 f9

A1898:          ST                       ; 1898 17
A1899:          LIS  $0                  ; 1899 70
                LR   $8,A                ; 189a 58
                BF   $0,A187d            ; 189b 90 e1
                
A189d:          DCI  $0fe2               ; 189d 2a 0f e2
                LIS  $1                  ; 18a0 71
                XM                       ; 18a1 8c
                DCI  $0fe2               ; 18a2 2a 0f e2
                ST                       ; 18a5 17
                LI   $8e                 ; 18a6 20 8e
                BT   4,A18ac             ; 18a8 84 03
                LI   $95                 ; 18aa 20 95
A18ac:          DCI  $0fb9               ; 18ac 2a 0f b9
                ST                       ; 18af 17
                LIS  $1                  ; 18b0 71
                LR   (IS),A              ; 18b1 5c
                BF   $0,A1899            ; 18b2 90 e6
                
A18b4:          LR   K,P                 ; 18b4 08
                LI   $07                 ; 18b5 20 07
                LR   $1,A                ; 18b7 51
                DCI  $0c9f               ; 18b8 2a 0c 9f
                XDC                      ; 18bb 2c
                DCI  A109d               ; 18bc 2a 10 9d
A18bf:          LI   $0f                 ; 18bf 20 0f
                LR   $0,A                ; 18c1 50
                LM                       ; 18c2 16
                XDC                      ; 18c3 2c
A18c4:          ST                       ; 18c4 17
                DS   $0                  ; 18c5 30
                BF   $4,A18c4            ; 18c6 94 fd
                LIS  $0                  ; 18c8 70
                ST                       ; 18c9 17
                XDC                      ; 18ca 2c
                DS   $1                  ; 18cb 31
                BF   $4,A18bf            ; 18cc 94 f2
                PK                       ; 18ce 0c
                
A18cf:          LR   K,P                 ; 18cf 08
                PI   $40a9               ; 18d0 28 40 a9
                PI   $41c8               ; 18d3 28 41 c8
                LISU 2                   ; 18d6 62
                LISL 4                   ; 18d7 6c
                DCI  $0d7f               ; 18d8 2a 0d 7f
                XDC                      ; 18db 2c
                DCI  $0d0f               ; 18dc 2a 0d 0f
                LIS  $3                  ; 18df 73
                LR   $1,A                ; 18e0 51
A18e1:          LI   $70                 ; 18e1 20 70
                LR   (IS),A              ; 18e3 5c
                PI   $43cd               ; 18e4 28 43 cd
                DS   $1                  ; 18e7 31
                BF   $4,A18e1            ; 18e8 94 f8
                LI   $70                 ; 18ea 20 70
                LR   $1,A                ; 18ec 51
                LIS  $0                  ; 18ed 70
A18ee:          ST                       ; 18ee 17
                DS   $1                  ; 18ef 31
                BF   $4,A18ee            ; 18f0 94 fd
                LI   $50                 ; 18f2 20 50
                DCI  $0fdf               ; 18f4 2a 0f df
                ST                       ; 18f7 17
                PI   $41c8               ; 18f8 28 41 c8
                LISU 2                   ; 18fb 62
                LISL 4                   ; 18fc 6c
                JMP  A17f9               ; 18fd 29 17 f9
                
A1900:          LR   K,P                 ; 1900 08
                LR   A,$0                ; 1901 40
                COM                      ; 1902 18
                INC                      ; 1903 1f
                LR   $1,A                ; 1904 51
                LIS  $0                  ; 1905 70
                LR   $0,A                ; 1906 50
A1907:          LR   A,$8                ; 1907 48
                CM                       ; 1908 8d
                BT   4,A1913             ; 1909 84 09
                LR   A,$0                ; 190b 40
                INC                      ; 190c 1f
                LR   $0,A                ; 190d 50
                AS   $1                  ; 190e c1
                BF   $1,A1907            ; 190f 91 f7
                BF   $0,A1915            ; 1911 90 03
                
A1913:          LIS  $0                  ; 1913 70
                INC                      ; 1914 1f
A1915:          PK                       ; 1915 0c

A1916:          LR   K,P                 ; 1916 08
                PI   $40a9               ; 1917 28 40 a9
                LISL 4                   ; 191a 6c
                DCI  $3d2c               ; 191b 2a 3d 2c
                LISU 4                   ; 191e 64
A191f:          LR   A,(IS)-             ; 191f 4e
                ST                       ; 1920 17
                BR7  A191f               ; 1921 8f fd
                LR   A,$0                ; 1923 40
                ST                       ; 1924 17
                LISL 4                   ; 1925 6c
                LR   A,$4                ; 1926 44
                LR   (IS)-,A             ; 1927 5e
                LIS  $3                  ; 1928 73
                LR   (IS),A              ; 1929 5c
                PI   $46d6               ; 192a 28 46 d6
                LIS  $a                  ; 192d 7a
                LR   $4,A                ; 192e 54
A192f:          PI   $41c8               ; 192f 28 41 c8
                DS   $4                  ; 1932 34
                BF   $4,A192f            ; 1933 94 fb
                DI                       ; 1935 1a
                LR   J,W                 ; 1936 1e
                LIS  $0                  ; 1937 70
                OUT  $0e                 ; 1938 27 0e
                LIS  $8                  ; 193a 78
                COM                      ; 193b 18
                DCI  $0fea               ; 193c 2a 0f ea
                NM                       ; 193f 8a
                DCI  $0fea               ; 1940 2a 0f ea
                ST                       ; 1943 17
                DCI  $08f7               ; 1944 2a 08 f7
                ST                       ; 1947 17
                DCI  $3d2c               ; 1948 2a 3d 2c
                LISL 4                   ; 194b 6c
                LISU 4                   ; 194c 64
A194d:          LM                       ; 194d 16
                LR   (IS)-,A             ; 194e 5e
                BR7  A194d               ; 194f 8f fd
                LM                       ; 1951 16
                LR   $0,A                ; 1952 50
                JMP  A17f9               ; 1953 29 17 f9
                
A1956:          LR   K,P                 ; 1956 08
                PI   $40a9               ; 1957 28 40 a9
                LIS  $b                  ; 195a 7b
                LR   $0,A                ; 195b 50
                LR   A,(IS)              ; 195c 4c
                DCI  $3d41               ; 195d 2a 3d 41
A1960:          ADC                      ; 1960 8e
                DS   $0                  ; 1961 30
                BF   $4,A1960            ; 1962 94 fd
                LR   Q,DC                ; 1964 0e
                LI   $ff                 ; 1965 20 ff
                LR   $8,A                ; 1967 58
                LIS  $b                  ; 1968 7b
                LR   $0,A                ; 1969 50
                PI   A1900               ; 196a 28 19 00
                LR   A,$0                ; 196d 40
                COM                      ; 196e 18
                AI   $0c                 ; 196f 24 0c
                BT   4,A197c             ; 1971 84 0a
                BF   $1,A197c            ; 1973 91 08
                LR   $1,A                ; 1975 51
A1976:          PI   $412d               ; 1976 28 41 2d
                DS   $1                  ; 1979 31
                BF   $4,A1976            ; 197a 94 fb
A197c:          LISU 2                   ; 197c 62
                LISL 4                   ; 197d 6c
                LR   A,$0                ; 197e 40
                LR   (IS),A              ; 197f 5c
                LR   DC,Q                ; 1980 0f
                PI   $4205               ; 1981 28 42 05
                JMP  A17f6               ; 1984 29 17 f6
                
A1987:          LR   K,P                 ; 1987 08
                PI   $40a9               ; 1988 28 40 a9
                PI   A1844               ; 198b 28 18 44
                LR   A,$8                ; 198e 48
                DCI  $3d25               ; 198f 2a 3d 25
                ST                       ; 1992 17
                JMP  A17f9               ; 1993 29 17 f9
                
A1996:          LR   K,P                 ; 1996 08
                PI   $40a9               ; 1997 28 40 a9
                PI   $41c8               ; 199a 28 41 c8
                DCI  $0fdf               ; 199d 2a 0f df
                LI   $52                 ; 19a0 20 52
                ST                       ; 19a2 17
A19a3:          LISU 4                   ; 19a3 64
                LISL 0                   ; 19a4 68
                LIS  $9                  ; 19a5 79
                LR   $0,A                ; 19a6 50
A19a7:          LR   A,(IS)+             ; 19a7 4d
                SL   4                   ; 19a8 15
                BF   $4,A19b5            ; 19a9 94 0b
                DS   $0                  ; 19ab 30
                BT   4,A19b5             ; 19ac 84 08
                LR   A,(IS)              ; 19ae 4c
                SR   4                   ; 19af 14
                BF   $4,A19b5            ; 19b0 94 04
                DS   $0                  ; 19b2 30
                BF   $4,A19a7            ; 19b3 94 f3
A19b5:          LR   A,$0                ; 19b5 40
                INC                      ; 19b6 1f
                CI   $04                 ; 19b7 25 04
                BF   $1,A19c0            ; 19b9 91 06
                LIS  $3                  ; 19bb 73
                LR   $0,A                ; 19bc 50
                INC                      ; 19bd 1f
                BF   $0,A19c9            ; 19be 90 0a
                
A19c0:          CI   $06                 ; 19c0 25 06
                BT   1,A19c9             ; 19c2 81 06
                INC                      ; 19c4 1f
                CI   $0a                 ; 19c5 25 0a
                BF   $1,A19d3            ; 19c7 91 0b
A19c9:          COM                      ; 19c9 18
                AI   $0d                 ; 19ca 24 0d
                LR   $1,A                ; 19cc 51
A19cd:          PI   $412d               ; 19cd 28 41 2d
                DS   $1                  ; 19d0 31
                BF   $4,A19cd            ; 19d1 94 fb
A19d3:          LI   $28                 ; 19d3 20 28
                LR   $8,A                ; 19d5 58
                PI   $40d9               ; 19d6 28 40 d9
                PI   $412d               ; 19d9 28 41 2d
                LISU 4                   ; 19dc 64
                LISL 0                   ; 19dd 68
                LR   A,(IS)              ; 19de 4c
                SR   4                   ; 19df 14
                BT   4,A19e4             ; 19e0 84 03
                LI   $1c                 ; 19e2 20 1c
A19e4:          LR   $8,A                ; 19e4 58
                PI   $40d9               ; 19e5 28 40 d9
                PI   $412d               ; 19e8 28 41 2d
A19eb:          LR   A,$0                ; 19eb 40
                AI   $ff                 ; 19ec 24 ff
                SR   1                   ; 19ee 12
                COM                      ; 19ef 18
                INC                      ; 19f0 1f
                AI   $24                 ; 19f1 24 24
                LR   IS,A                ; 19f3 0b
                LIS  $1                  ; 19f4 71
                NS   $0                  ; 19f5 f0
                BT   4,A19fc             ; 19f6 84 05
                LR   A,(IS)              ; 19f8 4c
                SL   4                   ; 19f9 15
                BF   $0,A19fd            ; 19fa 90 02
                
A19fc:          LR   A,(IS)              ; 19fc 4c
A19fd:          SR   4                   ; 19fd 14
                LR   $8,A                ; 19fe 58
                PI   $4105               ; 19ff 28 41 05
                PI   $412d               ; 1a02 28 41 2d
                LR   A,$0                ; 1a05 40
                CI   $03                 ; 1a06 25 03
                BT   4,A1a1a             ; 1a08 84 11
                BT   1,A1a23             ; 1a0a 81 18
                CI   $06                 ; 1a0c 25 06
                BT   4,A1a16             ; 1a0e 84 07
                BT   1,A1a23             ; 1a10 81 12
                CI   $09                 ; 1a12 25 09
                BF   $4,A1a23            ; 1a14 94 0e
A1a16:          LI   $2c                 ; 1a16 20 2c
                BF   $0,A1a1c            ; 1a18 90 03
                
A1a1a:          LI   $12                 ; 1a1a 20 12
A1a1c:          LR   $8,A                ; 1a1c 58
                PI   $40d9               ; 1a1d 28 40 d9
                PI   $412d               ; 1a20 28 41 2d
A1a23:          DS   $0                  ; 1a23 30
                BF   $4,A19eb            ; 1a24 94 c6
                JMP  A17f6               ; 1a26 29 17 f6
                
A1a29:          LR   K,P                 ; 1a29 08
                PI   $40a9               ; 1a2a 28 40 a9
                PI   $41c8               ; 1a2d 28 41 c8
                LISU 3                   ; 1a30 63
A1a31:          LISL 0                   ; 1a31 68
                LIS  $3                  ; 1a32 73
                LR   (IS)+,A             ; 1a33 5d
                LR   (IS),A              ; 1a34 5c
                DCI  $0c00               ; 1a35 2a 0c 00
                LIS  $2                  ; 1a38 72
                LISU 4                   ; 1a39 64
                LISL 7                   ; 1a3a 6f
                LR   (IS),A              ; 1a3b 5c
                ST                       ; 1a3c 17
                LIS  $1                  ; 1a3d 71
                ST                       ; 1a3e 17
                ST                       ; 1a3f 17
                LI   $6e                 ; 1a40 20 6e
                ST                       ; 1a42 17
A1a43:          DCI  $3c00               ; 1a43 2a 3c 00
                LR   H,DC                ; 1a46 11
                LIS  $1                  ; 1a47 71
                ST                       ; 1a48 17
                LI   $18                 ; 1a49 20 18
                ST                       ; 1a4b 17
                PI   A1ac5               ; 1a4c 28 1a c5
                BT   2,A1a8f             ; 1a4f 82 3f
                LISU 3                   ; 1a51 63
                BF   $4,A1a57            ; 1a52 94 04
                LISL 1                   ; 1a54 69
                LIS  $0                  ; 1a55 70
                LR   (IS),A              ; 1a56 5c
A1a57:          LISL 0                   ; 1a57 68
                DCI  $0c03               ; 1a58 2a 0c 03
                LI   $14                 ; 1a5b 20 14
                ST                       ; 1a5d 17
                DS   (IS)                ; 1a5e 3c
                BF   $4,A1a43            ; 1a5f 94 e3
                LIS  $3                  ; 1a61 73
                LR   (IS)+,A             ; 1a62 5d
                LR   A,(IS)              ; 1a63 4c
                NS   (IS)                ; 1a64 fc
                BF   $4,A1a8f            ; 1a65 94 29
                LIS  $3                  ; 1a67 73
                LR   (IS),A              ; 1a68 5c
A1a69:          DCI  $3d3f               ; 1a69 2a 3d 3f
                LR   H,DC                ; 1a6c 11
                LI   $02                 ; 1a6d 20 02
                ST                       ; 1a6f 17
                LI   $10                 ; 1a70 20 10
                ST                       ; 1a72 17
                PI   A1ac5               ; 1a73 28 1a c5
                BT   2,A1a8f             ; 1a76 82 18
                LISU 3                   ; 1a78 63
                BF   $4,A1a7e            ; 1a79 94 04
                LISL 1                   ; 1a7b 69
                LIS  $0                  ; 1a7c 70
                LR   (IS),A              ; 1a7d 5c
A1a7e:          LISL 0                   ; 1a7e 68
                DS   (IS)                ; 1a7f 3c
                BF   $4,A1a69            ; 1a80 94 e8
                DCI  $3d2c               ; 1a82 2a 3d 2c
                LIS  $0                  ; 1a85 70
                LR   H,DC                ; 1a86 11
                ST                       ; 1a87 17
                ST                       ; 1a88 17
                PI   A1ac5               ; 1a89 28 1a c5
                LISU 3                   ; 1a8c 63
                LISL 1                   ; 1a8d 69
                DS   (IS)                ; 1a8e 3c
A1a8f:          BF   $0,A1ac0            ; 1a8f 90 30

A1a91:          LR   K,P                 ; 1a91 08
                PI   $40a9               ; 1a92 28 40 a9
                PI   $41c8               ; 1a95 28 41 c8
                LISU 3                   ; 1a98 63
                LISL 0                   ; 1a99 68
                LIS  $3                  ; 1a9a 73
                LR   (IS)+,A             ; 1a9b 5d
                LR   (IS),A              ; 1a9c 5c
                DCI  $0c00               ; 1a9d 2a 0c 00
                LIS  $1                  ; 1aa0 71
                ST                       ; 1aa1 17
                LIS  $1                  ; 1aa2 71
                ST                       ; 1aa3 17
                ST                       ; 1aa4 17
                ST                       ; 1aa5 17
A1aa6:          DCI  $3d3f               ; 1aa6 2a 3d 3f
                LR   H,DC                ; 1aa9 11
                PI   A1af4               ; 1aaa 28 1a f4
                BT   2,A1ac0             ; 1aad 82 12
                LISU 3                   ; 1aaf 63
                BF   $4,A1aba            ; 1ab0 94 09
                DCI  $0c03               ; 1ab2 2a 0c 03
                LIS  $3                  ; 1ab5 73
                ST                       ; 1ab6 17
                LISL 1                   ; 1ab7 69
                LIS  $0                  ; 1ab8 70
                LR   (IS),A              ; 1ab9 5c
A1aba:          LISL 0                   ; 1aba 68
                DS   (IS)                ; 1abb 3c
                BF   $4,A1aa6            ; 1abc 94 e9
                LISL 1                   ; 1abe 69
                DS   (IS)                ; 1abf 3c
A1ac0:          LR   J,W                 ; 1ac0 1e
                PI   $40bc               ; 1ac1 28 40 bc
                PK                       ; 1ac4 0c
                
A1ac5:          LR   K,P                 ; 1ac5 08
                PI   $40a9               ; 1ac6 28 40 a9
                LR   DC,H                ; 1ac9 10
                PI   A1b40               ; 1aca 28 1b 40
                LR   A,$5                ; 1acd 45
                ST                       ; 1ace 17
                LR   A,$6                ; 1acf 46
                ST                       ; 1ad0 17
                PI   A1c89               ; 1ad1 28 1c 89
                PI   A1c27               ; 1ad4 28 1c 27
                BT   2,A1af2             ; 1ad7 82 1a
                PI   A1b87               ; 1ad9 28 1b 87
                LM                       ; 1adc 16
                LR   $0,A                ; 1add 50
                LIS  $4                  ; 1ade 74
                AM                       ; 1adf 88
                LR   $1,A                ; 1ae0 51
                LR   A,$0                ; 1ae1 40
                LNK                      ; 1ae2 19
                LR   $0,A                ; 1ae3 50
                LR   DC,H                ; 1ae4 10
                PI   A1b95               ; 1ae5 28 1b 95
                PI   A1c27               ; 1ae8 28 1c 27
                BT   2,A1af2             ; 1aeb 82 06
                PI   A1c68               ; 1aed 28 1c 68
                LIS  $0                  ; 1af0 70
                AS   $5                  ; 1af1 c5
A1af2:          BF   $0,A1ac0            ; 1af2 90 cd

A1af4:          LR   K,P                 ; 1af4 08
                PI   $40a9               ; 1af5 28 40 a9
                LISU 4                   ; 1af8 64
                LISL 7                   ; 1af9 6f
                LIS  $2                  ; 1afa 72
                LR   (IS),A              ; 1afb 5c
                PI   A1c89               ; 1afc 28 1c 89
                PI   A1c27               ; 1aff 28 1c 27
                BT   2,A1b3d             ; 1b02 82 3a
                LISU 4                   ; 1b04 64
                LISL 7                   ; 1b05 6f
                LIS  $1                  ; 1b06 71
                LR   (IS),A              ; 1b07 5c
                DCI  $0c03               ; 1b08 2a 0c 03
                LIS  $3                  ; 1b0b 73
                CM                       ; 1b0c 8d
                BF   $4,A1b14            ; 1b0d 94 06
                PI   A1c68               ; 1b0f 28 1c 68
                BF   $0,A1b3d            ; 1b12 90 2a
                
A1b14:          DCI  $0c04               ; 1b14 2a 0c 04
                LM                       ; 1b17 16
                LR   $0,A                ; 1b18 50
                LIS  $3                  ; 1b19 73
                AM                       ; 1b1a 88
                LR   $1,A                ; 1b1b 51
                LR   A,$0                ; 1b1c 40
                LNK                      ; 1b1d 19
                LR   $0,A                ; 1b1e 50
                PI   A1b87               ; 1b1f 28 1b 87
                PI   A1b8e               ; 1b22 28 1b 8e
                PI   A1c27               ; 1b25 28 1c 27
                BT   2,A1b3d             ; 1b28 82 14
                PI   A1c68               ; 1b2a 28 1c 68
                LIS  $0                  ; 1b2d 70
                XS   $5                  ; 1b2e e5
                BF   $4,A1b3d            ; 1b2f 94 0d
                PI   A1b87               ; 1b31 28 1b 87
                PI   A1b40               ; 1b34 28 1b 40
                LM                       ; 1b37 16
                XS   $5                  ; 1b38 e5
                BF   $4,A1b3d            ; 1b39 94 03
                LM                       ; 1b3b 16
                XS   $6                  ; 1b3c e6
A1b3d:          JMP  A1ac0               ; 1b3d 29 1a c0

A1b40:          LR   K,P                 ; 1b40 08
                PI   $40a9               ; 1b41 28 40 a9
                LIS  $0                  ; 1b44 70
                LR   $5,A                ; 1b45 55
                LR   $6,A                ; 1b46 56
                LR   Q,DC                ; 1b47 0e
                LM                       ; 1b48 16
                LR   $0,A                ; 1b49 50
                LIS  $2                  ; 1b4a 72
                AM                       ; 1b4b 88
                LR   $1,A                ; 1b4c 51
                LR   A,$0                ; 1b4d 40
                LNK                      ; 1b4e 19
                LR   $0,A                ; 1b4f 50
A1b50:          LI   $1f                 ; 1b50 20 1f
                NS   $1                  ; 1b52 f1
                BF   $4,A1b60            ; 1b53 94 0c
                LR   A,$a                ; 1b55 4a
                LR   $2,A                ; 1b56 52
                LR   A,$b                ; 1b57 4b
                LR   $3,A                ; 1b58 53
                PI   $41c8               ; 1b59 28 41 c8
                LR   A,$2                ; 1b5c 42
                LR   $a,A                ; 1b5d 5a
                LR   A,$3                ; 1b5e 43
                LR   $b,A                ; 1b5f 5b
A1b60:          LR   DC,Q                ; 1b60 0f
                DS   $1                  ; 1b61 31
                BT   2,A1b67             ; 1b62 82 04
                DS   $0                  ; 1b64 30
                BF   $2,A1b6f            ; 1b65 92 09
A1b67:          LM                       ; 1b67 16
                LR   Q,DC                ; 1b68 0e
                LR   $4,A                ; 1b69 54
                PI   A1b72               ; 1b6a 28 1b 72
                BF   $0,A1b50            ; 1b6d 90 e2
                
A1b6f:          JMP  A17f9               ; 1b6f 29 17 f9

A1b72:          LR   A,$4                ; 1b72 44
                XS   $6                  ; 1b73 e6
                LR   $7,A                ; 1b74 57
                SR   4                   ; 1b75 14
                XS   $7                  ; 1b76 e7
                LR   $7,A                ; 1b77 57
                SL   4                   ; 1b78 15
                XS   $5                  ; 1b79 e5
                LR   $6,A                ; 1b7a 56
                LR   A,$7                ; 1b7b 47
                SR   1                   ; 1b7c 12
                SR   1                   ; 1b7d 12
                SR   1                   ; 1b7e 12
                XS   $6                  ; 1b7f e6
                LR   $6,A                ; 1b80 56
                LR   A,$7                ; 1b81 47
                SL   4                   ; 1b82 15
                SL   1                   ; 1b83 13
                XS   $7                  ; 1b84 e7
                LR   $5,A                ; 1b85 55
                POP                      ; 1b86 1c
                
A1b87:          LR   K,P                 ; 1b87 08
                LR   A,$7                ; 1b88 47
                LR   $a,A                ; 1b89 5a
                LR   A,$8                ; 1b8a 48
                LR   $b,A                ; 1b8b 5b
                LR   DC,H                ; 1b8c 10
                PK                       ; 1b8d 0c
                
A1b8e:          LR   K,P                 ; 1b8e 08
                PI   A1b95               ; 1b8f 28 1b 95
                LIS  $8                  ; 1b92 78
                LR   $3,A                ; 1b93 53
                PK                       ; 1b94 0c
                
A1b95:          LR   Q,DC                ; 1b95 0e
                LI   $1b                 ; 1b96 20 1b
                OUTS 12                  ; 1b98 bc
                LI   $b7                 ; 1b99 20 b7
                OUTS 13                  ; 1b9b bd
                LIS  $0                  ; 1b9c 70
                LR   $3,A                ; 1b9d 53
                LIS  $1                  ; 1b9e 71
                OUTS 14                  ; 1b9f be
                POP                      ; 1ba0 1c
                
                LR   $6,A                ; 1ba1 56
                LR   A,$9                ; 1ba2 49
                LR   $4,A                ; 1ba3 54
                LR   J,W                 ; 1ba4 1e
                LIS  $0                  ; 1ba5 70
                OUTS 1                   ; 1ba6 b1
                INS  1                   ; 1ba7 a1
                CI   $20                 ; 1ba8 25 20
                BT   4,A1bad             ; 1baa 84 02
                DS   $5                  ; 1bac 35
A1bad:          LR   W,J                 ; 1bad 1d
                LR   A,$4                ; 1bae 44
                LR   $9,A                ; 1baf 59
                LIS  $1                  ; 1bb0 71
                LR   $0,A                ; 1bb1 50
                LR   $1,A                ; 1bb2 51
                DI                       ; 1bb3 1a
                LR   J,W                 ; 1bb4 1e
                LR   A,$6                ; 1bb5 46
                POP                      ; 1bb6 1c
                
                LR   $6,A                ; 1bb7 56
                LR   A,IS                ; 1bb8 0a
                LISU 4                   ; 1bb9 64
                LISL 0                   ; 1bba 68
                LR   (IS)+,A             ; 1bbb 5d
                LR   A,$9                ; 1bbc 49
                LR   (IS)+,A             ; 1bbd 5d
                LR   J,W                 ; 1bbe 1e
                LR   A,$a                ; 1bbf 4a
                LR   (IS)+,A             ; 1bc0 5d
                LR   A,$b                ; 1bc1 4b
                LR   (IS)+,A             ; 1bc2 5d
                LR   H,DC                ; 1bc3 11
                LR   A,$a                ; 1bc4 4a
                LR   (IS)+,A             ; 1bc5 5d
                LR   A,$b                ; 1bc6 4b
                LR   (IS)+,A             ; 1bc7 5d
                LIS  $0                  ; 1bc8 70
                LR   $2,A                ; 1bc9 52
                OUTS 1                   ; 1bca b1
                NOP                      ; 1bcb 2b
                NOP                      ; 1bcc 2b
                NOP                      ; 1bcd 2b
                INS  1                   ; 1bce a1
                NI   $20                 ; 1bcf 21 20
                BT   4,A1bd9             ; 1bd1 84 07
                DS   $5                  ; 1bd3 35
A1bd4:          LIS  $0                  ; 1bd4 70
                LR   $0,A                ; 1bd5 50
                LR   $1,A                ; 1bd6 51
                BF   $0,A1c14            ; 1bd7 90 3c
                
A1bd9:          LISL 7                   ; 1bd9 6f
                LIS  $1                  ; 1bda 71
                XS   (IS)                ; 1bdb ec
                BT   4,A1bf8             ; 1bdc 84 1b
                DS   $3                  ; 1bde 33
                BT   1,A1bed             ; 1bdf 81 0d
                DS   $1                  ; 1be1 31
                BT   2,A1be7             ; 1be2 82 04
                DS   $0                  ; 1be4 30
                BF   $2,A1bd4            ; 1be5 92 ee
A1be7:          LR   DC,Q                ; 1be7 0f
                LM                       ; 1be8 16
                LR   $4,A                ; 1be9 54
                LR   Q,DC                ; 1bea 0e
                LIS  $7                  ; 1beb 77
                LR   $3,A                ; 1bec 53
A1bed:          LR   A,$4                ; 1bed 44
                SR   1                   ; 1bee 12
                SR   1                   ; 1bef 12
                NI   $20                 ; 1bf0 21 20
                OUTS 1                   ; 1bf2 b1
                LR   A,$4                ; 1bf3 44
                SL   1                   ; 1bf4 13
                LR   $4,A                ; 1bf5 54
                BF   $0,A1c14            ; 1bf6 90 1d
                
A1bf8:          LR   A,$4                ; 1bf8 44
                SL   1                   ; 1bf9 13
                LR   $4,A                ; 1bfa 54
                INS  1                   ; 1bfb a1
                SR   4                   ; 1bfc 14
                SR   1                   ; 1bfd 12
                SR   1                   ; 1bfe 12
                NI   $01                 ; 1bff 21 01
                AS   $4                  ; 1c01 c4
                LR   $4,A                ; 1c02 54
                DS   $3                  ; 1c03 33
                BF   $4,A1c14            ; 1c04 94 0f
                LR   DC,Q                ; 1c06 0f
                LR   A,$4                ; 1c07 44
                ST                       ; 1c08 17
                LIS  $0                  ; 1c09 70
                LR   $4,A                ; 1c0a 54
                LR   Q,DC                ; 1c0b 0e
                DS   $1                  ; 1c0c 31
                BT   2,A1c12             ; 1c0d 82 04
                DS   $0                  ; 1c0f 30
                BF   $2,A1bd4            ; 1c10 92 c3
A1c12:          LIS  $8                  ; 1c12 78
                LR   $3,A                ; 1c13 53
A1c14:          LISU 4                   ; 1c14 64
                LISL 5                   ; 1c15 6d
                LR   A,(IS)-             ; 1c16 4e
                LR   $b,A                ; 1c17 5b
                LR   A,(IS)-             ; 1c18 4e
                LR   $a,A                ; 1c19 5a
                LR   DC,H                ; 1c1a 10
                LR   A,(IS)-             ; 1c1b 4e
                LR   $b,A                ; 1c1c 5b
                LR   A,(IS)-             ; 1c1d 4e
                LR   $a,A                ; 1c1e 5a
                LR   W,J                 ; 1c1f 1d
                LR   A,(IS)-             ; 1c20 4e
                LR   $9,A                ; 1c21 59
                LR   A,(IS)              ; 1c22 4c
                LR   IS,A                ; 1c23 0b
                LR   A,$6                ; 1c24 46
                EI                       ; 1c25 1b
                POP                      ; 1c26 1c
                
A1c27:          LR   K,P                 ; 1c27 08
                EI                       ; 1c28 1b
                LR   J,W                 ; 1c29 1e
                PI   $40a9               ; 1c2a 28 40 a9
                LISU 3                   ; 1c2d 63
                LISL 2                   ; 1c2e 6a
                LIS  $0                  ; 1c2f 70
                LR   (IS),A              ; 1c30 5c
A1c31:          LI   $07                 ; 1c31 20 07
                LR   $2,A                ; 1c33 52
A1c34:          PI   $41c8               ; 1c34 28 41 c8
                DS   $2                  ; 1c37 32
                BF   $1,A1c43            ; 1c38 91 0a
                BF   $4,A1c34            ; 1c3a 94 f9
                LISU 3                   ; 1c3c 63
                LISL 2                   ; 1c3d 6a
                DS   (IS)                ; 1c3e 3c
                BF   $4,A1c31            ; 1c3f 94 f1
                BF   $0,A1c5a            ; 1c41 90 18
                
A1c43:          LIS  $f                  ; 1c43 7f
                LR   $2,A                ; 1c44 52
A1c45:          LIS  $0                  ; 1c45 70
                AS   $5                  ; 1c46 c5
                BF   $4,A1c5a            ; 1c47 94 12
                AS   $0                  ; 1c49 c0
                AS   $3                  ; 1c4a c3
                BF   $4,A1c50            ; 1c4b 94 04
                AS   $1                  ; 1c4d c1
                BT   4,A1c62             ; 1c4e 84 13
A1c50:          PI   $41c8               ; 1c50 28 41 c8
                DS   $2                  ; 1c53 32
                BT   4,A1c65             ; 1c54 84 10
                BF   $1,A1c43            ; 1c56 91 ec
                BT   1,A1c45             ; 1c58 81 ec
A1c5a:          DI                       ; 1c5a 1a
                LI   $60                 ; 1c5b 20 60
                OUTS 1                   ; 1c5d b1
                LIS  $0                  ; 1c5e 70
A1c5f:          INC                      ; 1c5f 1f
                BF   $2,A1c5f            ; 1c60 92 fe
A1c62:          JMP  A1c83               ; 1c62 29 1c 83

A1c65:          COM                      ; 1c65 18
                BF   $0,A1c62            ; 1c66 90 fb
                
A1c68:          LR   K,P                 ; 1c68 08
                PI   $40a9               ; 1c69 28 40 a9
                LI   $1b                 ; 1c6c 20 1b
                OUTS 12                  ; 1c6e bc
                LI   $a1                 ; 1c6f 20 a1
                OUTS 13                  ; 1c71 bd
                LIS  $a                  ; 1c72 7a
                LR   $0,A                ; 1c73 50
                LR   $1,A                ; 1c74 51
                EI                       ; 1c75 1b
                LR   J,W                 ; 1c76 1e
                LIS  $1                  ; 1c77 71
                OUTS 14                  ; 1c78 be
A1c79:          PI   $41c8               ; 1c79 28 41 c8
                DS   $0                  ; 1c7c 30
                BF   $4,A1c79            ; 1c7d 94 fb
                DS   $1                  ; 1c7f 31
                BF   $4,A1c79            ; 1c80 94 f8
                SR   1                   ; 1c82 12
A1c83:          DI                       ; 1c83 1a
                LIS  $0                  ; 1c84 70
                OUTS 14                  ; 1c85 be
                JMP  A1ac0               ; 1c86 29 1a c0
                
A1c89:          LR   K,P                 ; 1c89 08
                LR   A,$a                ; 1c8a 4a
                LR   $7,A                ; 1c8b 57
                LR   A,$b                ; 1c8c 4b
                LR   $8,A                ; 1c8d 58
                LIS  $0                  ; 1c8e 70
                LR   $5,A                ; 1c8f 55
                LR   $0,A                ; 1c90 50
                LIS  $4                  ; 1c91 74
                LR   $1,A                ; 1c92 51
                DCI  $0c00               ; 1c93 2a 0c 00
                PI   A1b95               ; 1c96 28 1b 95
                LI   $40                 ; 1c99 20 40
                OUTS 1                   ; 1c9b b1
                EI                       ; 1c9c 1b
                PK                       ; 1c9d 0c
                
A1c9e:          LR   A,KL                ; 1c9e 01
                LR   QL,A                ; 1c9f 07
                LR   KL,A                ; 1ca0 05
                LR   A,QL                ; 1ca1 03
                LR   K,P                 ; 1ca2 08
                LR   QU,A                ; 1ca3 06
                LR   KU,A                ; 1ca4 04
                LR   A,QU                ; 1ca5 02
                EI                       ; 1ca6 1b
                ST                       ; 1ca7 17
                LNK                      ; 1ca8 19
                DI                       ; 1ca9 1a
                OUT  $1e                 ; 1caa 27 1e
                DS   $7                  ; 1cac 37
                SL   4                   ; 1cad 15
                DS   $8                  ; 1cae 38
                COM                      ; 1caf 18
                POP                      ; 1cb0 1c
                
                LM                       ; 1cb1 16
                PI   A2022               ; 1cb2 28 20 22
                LR   Q,DC                ; 1cb5 0e
                PK                       ; 1cb6 0c
                
                LR   A,IS                ; 1cb7 0a
                AI   $34                 ; 1cb8 24 34
                DS   $2                  ; 1cba 32
                DS   $6                  ; 1cbb 36
                db   $2f                 
                db   $2d                 
                JMP  $392b               ; 1cbe 29 39 2b
                
                DS   $0                  ; 1cc1 30
                db   $2e                 
                XDC                      ; 1cc3 2c
                DCI  $3a45               ; 1cc4 2a 3a 45
                LR   A,$7                ; 1cc7 47
                LR   A,$3                ; 1cc8 43
                LR   A,$1                ; 1cc9 41
                LR   A,$8                ; 1cca 48
                LR   A,$6                ; 1ccb 46
                LR   A,$4                ; 1ccc 44
                LR   A,$2                ; 1ccd 42
A1cce:          DS   (IS)-               ; 1cce 3e
                IN   $25                 ; 1ccf 26 25
                SR   4                   ; 1cd1 14
                SL   1                   ; 1cd2 13
                SR   1                   ; 1cd3 12
                
A1cd4:          LR   J,W                 ; 1cd4 1e
                OUTS 4                   ; 1cd5 b4
                LR   J,W                 ; 1cd6 1e
                BF   $a,A1cf6            ; 1cd7 9a 1e
                INS  1                   ; 1cd9 a1
                LR   J,W                 ; 1cda 1e
                INS  10                  ; 1cdb aa
                LR   J,W                 ; 1cdc 1e
                AS   $0                  ; 1cdd c0
                LR   J,W                 ; 1cde 1e
                AS   $4                  ; 1cdf c4
                LR   J,W                 ; 1ce0 1e
                AS   $8                  ; 1ce1 c8
                LR   J,W                 ; 1ce2 1e
                AS   (IS)                ; 1ce3 cc
                LR   J,W                 ; 1ce4 1e
                ASD  $0                  ; 1ce5 d0
                LR   J,W                 ; 1ce6 1e
                ASD  $5                  ; 1ce7 d5
                LR   J,W                 ; 1ce8 1e
                db   $df                 
                LR   J,W                 ; 1cea 1e
                XS   $8                  ; 1ceb e8
                LR   J,W                 ; 1cec 1e
                XS   (IS)-               ; 1ced ee
                LR   J,W                 ; 1cee 1e
                NS   $3                  ; 1cef f3
                LR   J,W                 ; 1cf0 1e
                NS   (IS)                ; 1cf1 fc
                INC                      ; 1cf2 1f
                LR   QL,A                ; 1cf3 07
                INC                      ; 1cf4 1f
                db   $2d                 
A1cf6:          INC                      ; 1cf6 1f
                LR   DC,Q                ; 1cf7 0f
                INC                      ; 1cf8 1f
                EI                       ; 1cf9 1b
                INC                      ; 1cfa 1f
                XI   $1f                 ; 1cfb 23 1f
                DS   $9                  ; 1cfd 39
                INC                      ; 1cfe 1f
                LR   A,$0                ; 1cff 40
                INC                      ; 1d00 1f
                LR   A,(IS)              ; 1d01 4c
                INC                      ; 1d02 1f
                LR   $7,A                ; 1d03 57
                INC                      ; 1d04 1f
                LR   $b,A                ; 1d05 5b
                INC                      ; 1d06 1f
                db   $5f                 
                INC                      ; 1d08 1f
                LISU 3                   ; 1d09 63
                INC                      ; 1d0a 1f
                LISU 7                   ; 1d0b 67
                INC                      ; 1d0c 1f
                LISL 3                   ; 1d0d 6b
                INC                      ; 1d0e 1f
                LISL 7                   ; 1d0f 6f
                INC                      ; 1d10 1f
                LIS  $3                  ; 1d11 73
                INC                      ; 1d12 1f

A1d13:          LIS  $7                  ; 1d13 77
                INC                      ; 1d14 1f
                LIS  $c                  ; 1d15 7c
                INC                      ; 1d16 1f
                BT   2,A1d37             ; 1d17 82 1f
                ADC                      ; 1d19 8e
                INC                      ; 1d1a 1f
                BF   $3,A1d3b            ; 1d1b 93 1f
                BF   $7,A1d3d            ; 1d1d 97 1f
                BF   $b,A1d3f            ; 1d1f 9b 1f
                BF   $f,A1d41            ; 1d21 9f 1f
                db   $a3                 
                INC                      ; 1d24 1f
                INS  7                   ; 1d25 a7
                INC                      ; 1d26 1f
                OUTS 0                   ; 1d27 b0
                INC                      ; 1d28 1f
                OUTS 5                   ; 1d29 b5
                INC                      ; 1d2a 1f
                OUTS 13                  ; 1d2b bd
                INC                      ; 1d2c 1f
                AS   $8                  ; 1d2d c8
                INC                      ; 1d2e 1f
                AS   (IS)                ; 1d2f cc
                INC                      ; 1d30 1f
                ASD  $0                  ; 1d31 d0
                INC                      ; 1d32 1f
                ASD  $4                  ; 1d33 d4
A1d34:          LR   A,KU                ; 1d34 00
                LR   A,KU                ; 1d35 00
                LR   P,K                 ; 1d36 09
A1d37:          LR   IS,A                ; 1d37 0b
                INC                      ; 1d38 1f
                LR   IS,A                ; 1d39 0b
                LR   W,J                 ; 1d3a 1d
A1d3b:          LR   A,KL                ; 1d3b 01
                NOP                      ; 1d3c 2b
A1d3d:          LR   IS,A                ; 1d3d 0b
                LR   A,KU                ; 1d3e 00
A1d3f:          SL   4                   ; 1d3f 15
                LR   IS,A                ; 1d40 0b
A1d41:          LR   KL,A                ; 1d41 05
A1d42:          NOP                      ; 1d42 2b
                LR   IS,A                ; 1d43 0b
                LR   P0,Q                ; 1d44 0d
                DCI  $1327               ; 1d45 2a 13 27
                INC                      ; 1d48 1f
                DCI  A2713               ; 1d49 2a 27 13
                LR   H,DC                ; 1d4c 11
                INC                      ; 1d4d 1f
                LR   A,KU                ; 1d4e 00
                NI   $03                 ; 1d4f 21 03
                JMP  $2911               ; 1d51 29 29 11
                
                LR   P,K                 ; 1d54 09
                LR   KL,A                ; 1d55 05
                DCI  Reset               ; 1d56 2a 00 00
                LR   A,KU                ; 1d59 00
                LR   A,KU                ; 1d5a 00
                LR   A,KL                ; 1d5b 01
                NOP                      ; 1d5c 2b
                NI   $0b                 ; 1d5d 21 0b
                LR   P,K                 ; 1d5f 09
                LR   QL,A                ; 1d60 07
                LR   A,KU                ; 1d61 00
                LR   A,KU                ; 1d62 00
                LR   A,KU                ; 1d63 00
                LR   A,KU                ; 1d64 00
                LR   A,KU                ; 1d65 00
                LR   A,KU                ; 1d66 00
                LR   A,KU                ; 1d67 00
                LR   A,KU                ; 1d68 00
                LR   A,KU                ; 1d69 00
                LR   A,KU                ; 1d6a 00
                LR   A,KU                ; 1d6b 00
                LR   A,KU                ; 1d6c 00
                NI   $03                 ; 1d6d 21 03
                JMP  $2911               ; 1d6f 29 29 11
                
                LR   P,K                 ; 1d72 09
                LR   KL,A                ; 1d73 05
                LR   A,KU                ; 1d74 00
                LR   QL,A                ; 1d75 07
                LR   H,DC                ; 1d76 11
                CI   $0b                 ; 1d77 25 0b
                LR   A,KU                ; 1d79 00
                LR   A,KU                ; 1d7a 00
                LR   P,K                 ; 1d7b 09
                LR   IS,A                ; 1d7c 0b
                LR   P0,Q                ; 1d7d 0d
                LR   A,KL                ; 1d7e 01
                NOP                      ; 1d7f 2b
                INC                      ; 1d80 1f
                LR   A,KU                ; 1d81 00
                LR   H,DC                ; 1d82 11
                NOP                      ; 1d83 2b
                INC                      ; 1d84 1f
                LR   A,KU                ; 1d85 00
                LR   A,KU                ; 1d86 00
                LR   A,KU                ; 1d87 00
                LR   A,KU                ; 1d88 00
                LR   A,KU                ; 1d89 00
                LR   A,KU                ; 1d8a 00
                LR   A,KU                ; 1d8b 00
                LR   A,KU                ; 1d8c 00
                NI   $0b                 ; 1d8d 21 0b
                LR   QL,A                ; 1d8f 07
                LR   A,KU                ; 1d90 00
                SL   1                   ; 1d91 13
                NOP                      ; 1d92 2b
                LR   A,KU                ; 1d93 00
                CI   $27                 ; 1d94 25 27
                LR   H,DC                ; 1d96 11
                LR   KL,A                ; 1d97 05
                LR   A,KU                ; 1d98 00
                LR   A,KU                ; 1d99 00
                LR   A,KU                ; 1d9a 00
                SL   4                   ; 1d9b 15
                LR   IS,A                ; 1d9c 0b
                LR   KL,A                ; 1d9d 05
                LR   A,KU                ; 1d9e 00
                LR   IS,A                ; 1d9f 0b
                NOP                      ; 1da0 2b
                LR   QL,A                ; 1da1 07
                LR   IS,A                ; 1da2 0b
                LR   P,K                 ; 1da3 09
                DI                       ; 1da4 1a
                DS   $1                  ; 1da5 31
                OUT  $09                 ; 1da6 27 09
A1da8:          DS   $1                  ; 1da8 31
                OUT  $0b                 ; 1da9 27 0b
                LR   H,DC                ; 1dab 11
                LR   P,K                 ; 1dac 09
                LR   A,KU                ; 1dad 00
                LR   QL,A                ; 1dae 07
                SL   1                   ; 1daf 13
                LR   QL,A                ; 1db0 07
                LR   H,DC                ; 1db1 11
                OUT  $00                 ; 1db2 27 00
                LR   H,DC                ; 1db4 11
                DS   $1                  ; 1db5 31
                DS   $1                  ; 1db6 31
A1db7:          NOP                      ; 1db7 2b
                LR   IS,A                ; 1db8 0b
                LR   P0,Q                ; 1db9 0d
                LR   A,KU                ; 1dba 00
                CI   $0b                 ; 1dbb 25 0b
                LR   P,K                 ; 1dbd 09
                LR   A,KL                ; 1dbe 01
                SL   1                   ; 1dbf 13
                INC                      ; 1dc0 1f
                LR   A,KU                ; 1dc1 00
                LR   IS,A                ; 1dc2 0b
                NOP                      ; 1dc3 2b
                LR   QL,A                ; 1dc4 07
                LR   P,K                 ; 1dc5 09
                LR   KL,A                ; 1dc6 05
A1dc7:          NI   $07                 ; 1dc7 21 07
                SL   1                   ; 1dc9 13
                LR   P,K                 ; 1dca 09
                LR   IS,A                ; 1dcb 0b
                LR   A,KU                ; 1dcc 00
                NI   $03                 ; 1dcd 21 03
                JMP  $2911               ; 1dcf 29 29 11
                
                LR   P,K                 ; 1dd2 09
                LR   KL,A                ; 1dd3 05
                DCI  Reset               ; 1dd4 2a 00 00
                LR   A,KU                ; 1dd7 00
                LR   A,KL                ; 1dd8 01
                NOP                      ; 1dd9 2b
                NI   $0b                 ; 1dda 21 0b
                LR   P,K                 ; 1ddc 09
                LR   QL,A                ; 1ddd 07
                LR   A,KU                ; 1dde 00
                LR   A,KU                ; 1ddf 00
                LR   A,KU                ; 1de0 00
                LR   A,KU                ; 1de1 00
                LR   A,KU                ; 1de2 00
                LR   A,KU                ; 1de3 00
                LR   A,KU                ; 1de4 00
                LR   A,KU                ; 1de5 00
                LR   A,KU                ; 1de6 00
                LR   A,KU                ; 1de7 00
                LR   A,KU                ; 1de8 00
                LR   A,KU                ; 1de9 00
                NI   $31                 ; 1dea 21 31
                LR   P,K                 ; 1dec 09
                LR   H,DC                ; 1ded 11
                LR   QL,A                ; 1dee 07
                DS   $1                  ; 1def 31
                LNK                      ; 1df0 19
                LR   A,KU                ; 1df1 00
                LR   QL,A                ; 1df2 07
                LR   H,DC                ; 1df3 11
                CI   $0b                 ; 1df4 25 0b
                LR   A,KU                ; 1df6 00
                LR   A,KU                ; 1df7 00
                LR   P,K                 ; 1df8 09
                LR   IS,A                ; 1df9 0b
                LR   P0,Q                ; 1dfa 0d
                LR   A,KL                ; 1dfb 01
                NOP                      ; 1dfc 2b
                INC                      ; 1dfd 1f
                LR   A,KU                ; 1dfe 00
                LR   H,DC                ; 1dff 11
                NOP                      ; 1e00 2b
                INC                      ; 1e01 1f
                LR   A,KU                ; 1e02 00
                LR   A,KU                ; 1e03 00
                LR   A,KU                ; 1e04 00
                LR   A,KU                ; 1e05 00
                LR   A,KU                ; 1e06 00
                LR   A,KU                ; 1e07 00
                LR   A,KU                ; 1e08 00
                LR   A,KU                ; 1e09 00
                NI   $0b                 ; 1e0a 21 0b
                LR   QL,A                ; 1e0c 07
                LR   A,KU                ; 1e0d 00
                SL   1                   ; 1e0e 13
                NOP                      ; 1e0f 2b
                LR   A,KU                ; 1e10 00
                LR   P,K                 ; 1e11 09
                LR   IS,A                ; 1e12 0b
                DS   $1                  ; 1e13 31
                SL   1                   ; 1e14 13
                LR   P,K                 ; 1e15 09
                INC                      ; 1e16 1f
                LR   A,KU                ; 1e17 00
                SL   4                   ; 1e18 15
                LR   IS,A                ; 1e19 0b
                LR   KL,A                ; 1e1a 05
                LR   A,KU                ; 1e1b 00
                LR   IS,A                ; 1e1c 0b
                NOP                      ; 1e1d 2b
                LR   QL,A                ; 1e1e 07
                LR   IS,A                ; 1e1f 0b
                LR   P,K                 ; 1e20 09
                DI                       ; 1e21 1a
                DS   $1                  ; 1e22 31
                OUT  $09                 ; 1e23 27 09
A1e25:          LR   W,J                 ; 1e25 1d
                SL   1                   ; 1e26 13
                LR   P,K                 ; 1e27 09
                LR   A,KU                ; 1e28 00
                DCI  A1d13               ; 1e29 2a 1d 13
                LR   P,K                 ; 1e2c 09
                DCI  $001d               ; 1e2d 2a 00 1d
                LR   P,K                 ; 1e30 09
                SL   1                   ; 1e31 13
                JMP  $2a2d               ; 1e32 29 2a 2d
                
                LR   H,DC                ; 1e35 11
                OUT  $11                 ; 1e36 27 11
                NOP                      ; 1e38 2b
                DS   $1                  ; 1e39 31
                LR   IS,A                ; 1e3a 0b
                LR   A,KU                ; 1e3b 00
                LR   IS,A                ; 1e3c 0b
                NOP                      ; 1e3d 2b
                LR   QL,A                ; 1e3e 07
                LR   IS,A                ; 1e3f 0b
                LR   P,K                 ; 1e40 09
A1e41:          LR   QL,A                ; 1e41 07
                LR   H,DC                ; 1e42 11
                DS   $3                  ; 1e43 33
                LR   A,KU                ; 1e44 00
A1e45:          LR   IS,A                ; 1e45 0b
                NOP                      ; 1e46 2b
                LR   QL,A                ; 1e47 07
                LR   IS,A                ; 1e48 0b
                LR   P,K                 ; 1e49 09
A1e4a:          DS   $1                  ; 1e4a 31
                OUT  $09                 ; 1e4b 27 09
                DI                       ; 1e4d 1a
                LR   IS,A                ; 1e4e 0b
                NOP                      ; 1e4f 2b
                LR   QL,A                ; 1e50 07
                LR   IS,A                ; 1e51 0b
                LR   P,K                 ; 1e52 09
                LR   KU,A                ; 1e53 04
A1e54:          LR   A,KL                ; 1e54 01
                OUT  $27                 ; 1e55 27 27
                LR   A,KU                ; 1e57 00
                LR   IS,A                ; 1e58 0b
                NOP                      ; 1e59 2b
                LR   QL,A                ; 1e5a 07
                LR   P,K                 ; 1e5b 09
                LR   KL,A                ; 1e5c 05
                LR   KU,A                ; 1e5d 04
A1e5e:          POP                      ; 1e5e 1c

                LR   A,KU                ; 1e5f 00
                LR   W,J                 ; 1e60 1d
                LR   P,K                 ; 1e61 09
                SL   1                   ; 1e62 13
                JMP  $0011               ; 1e63 29 00 11
                
                DS   $1                  ; 1e66 31
                DS   $1                  ; 1e67 31
A1e68:          POP                      ; 1e68 1c

                LR   A,KU                ; 1e69 00
                LR   W,J                 ; 1e6a 1d
                SL   1                   ; 1e6b 13
                LR   P,K                 ; 1e6c 09
                LR   A,KU                ; 1e6d 00
                LR   H,DC                ; 1e6e 11
                DS   $1                  ; 1e6f 31
                DS   $1                  ; 1e70 31
                LR   A,KU                ; 1e71 00
A1e72:          LR   P,K                 ; 1e72 09
                LR   IS,A                ; 1e73 0b
                LR   H,DC                ; 1e74 11
                INC                      ; 1e75 1f
                LR   A,KU                ; 1e76 00
                LR   IS,A                ; 1e77 0b
                LR   P,K                 ; 1e78 09
                LR   P,K                 ; 1e79 09
                SL   1                   ; 1e7a 13
                LR   P,K                 ; 1e7b 09
A1e7c:          LR   QL,A                ; 1e7c 07
                LR   H,DC                ; 1e7d 11
                CI   $0b                 ; 1e7e 25 0b
                LR   A,KU                ; 1e80 00
                OUT  $13                 ; 1e81 27 13
                LR   H,DC                ; 1e83 11
                INC                      ; 1e84 1f
                LR   A,KU                ; 1e85 00
A1e86:          LR   P0,Q                ; 1e86 0d
                LR   P,K                 ; 1e87 09
                LR   A,KL                ; 1e88 01
                LR   QL,A                ; 1e89 07
                LR   IS,A                ; 1e8a 0b
                LR   A,KU                ; 1e8b 00
                LR   IS,A                ; 1e8c 0b
                LR   P,K                 ; 1e8d 09
                LR   P,K                 ; 1e8e 09
                LR   A,KU                ; 1e8f 00
A1e90:          LR   QL,A                ; 1e90 07
                LR   H,DC                ; 1e91 11
                CI   $0b                 ; 1e92 25 0b
                LR   A,KU                ; 1e94 00
                NI   $07                 ; 1e95 21 07
                SL   1                   ; 1e97 13
                LR   P,K                 ; 1e98 09
                LR   IS,A                ; 1e99 0b
                NI   $11                 ; 1e9a 21 11
                OUT  $11                 ; 1e9c 27 11
                LR   P,K                 ; 1e9e 09
                LR   KL,A                ; 1e9f 05
                db   $ff                 
                LR   A,KL                ; 1ea1 01
                NOP                      ; 1ea2 2b
                LR   QL,A                ; 1ea3 07
                LR   IS,A                ; 1ea4 0b
                LR   P,K                 ; 1ea5 09
                LR   IS,A                ; 1ea6 0b
                NI   $07                 ; 1ea7 21 07
                db   $ff                 
                INC                      ; 1eaa 1f
                LR   A,KL                ; 1eab 01
                db   $2f                 
                LR   A,KL                ; 1ead 01
                INC                      ; 1eae 1f
                LR   IS,A                ; 1eaf 0b
                NOP                      ; 1eb0 2b
                INC                      ; 1eb1 1f
                NI   $ff                 ; 1eb2 21 ff
                JMP  $0121               ; 1eb4 29 01 21
                
                DS   $1                  ; 1eb7 31
                LR   A,KU                ; 1eb8 00
                LR   A,KL                ; 1eb9 01
                NOP                      ; 1eba 2b
                DS   $1                  ; 1ebb 31
                SL   1                   ; 1ebc 13
                JMP  $0bff               ; 1ebd 29 0b ff
                
                LR   A,KL                ; 1ec0 01
                NOP                      ; 1ec1 2b
                AI   $ff                 ; 1ec2 24 ff
                LR   A,KL                ; 1ec4 01
                NOP                      ; 1ec5 2b
                DS   $4                  ; 1ec6 34
                db   $ff                 
                LR   A,KL                ; 1ec8 01
                NOP                      ; 1ec9 2b
                DS   $2                  ; 1eca 32
                db   $ff                 
                LR   A,KL                ; 1ecc 01
                NOP                      ; 1ecd 2b
                OI   $ff                 ; 1ece 22 ff
                LR   W,J                 ; 1ed0 1d
                SL   1                   ; 1ed1 13
                SL   1                   ; 1ed2 13
                INC                      ; 1ed3 1f
                db   $ff                 
                LNK                      ; 1ed5 19
                SL   1                   ; 1ed6 13
                LR   A,QL                ; 1ed7 03
                NI   $0b                 ; 1ed8 21 0b
                LNK                      ; 1eda 19
                SL   1                   ; 1edb 13
                OUT  $1f                 ; 1edc 27 1f
                db   $ff                 
                DS   $1                  ; 1edf 31
                OUT  $13                 ; 1ee0 27 13
                LR   QL,A                ; 1ee2 07
                LNK                      ; 1ee3 19
                LR   A,KL                ; 1ee4 01
                NOP                      ; 1ee5 2b
                EI                       ; 1ee6 1b
                db   $ff                 
A1ee8:          LR   QL,A                ; 1ee8 07
                LR   H,DC                ; 1ee9 11
                DS   $3                  ; 1eea 33
                LR   IS,A                ; 1eeb 0b
                NI   $ff                 ; 1eec 21 ff
                LR   H,DC                ; 1eee 11
                LR   A,QL                ; 1eef 03
                LR   QL,A                ; 1ef0 07
                SL   1                   ; 1ef1 13
                db   $ff                 
                JMP  $0121               ; 1ef3 29 01 21
                
                DS   $1                  ; 1ef6 31
                LR   A,KU                ; 1ef7 00
                LR   IS,A                ; 1ef8 0b
                DS   $3                  ; 1ef9 33
                CI   $ff                 ; 1efa 25 ff
                LR   P,K                 ; 1efc 09
                LR   IS,A                ; 1efd 0b
                DS   $1                  ; 1efe 31
                LR   P,K                 ; 1eff 09
                LR   IS,A                ; 1f00 0b
                LR   H,DC                ; 1f01 11
                LR   QL,A                ; 1f02 07
                LR   A,KL                ; 1f03 01
                SL   1                   ; 1f04 13
                NOP                      ; 1f05 2b
                db   $ff                 
                LNK                      ; 1f07 19
                SL   1                   ; 1f08 13
                LR   A,QL                ; 1f09 03
                NI   $01                 ; 1f0a 21 01
                NOP                      ; 1f0c 2b
                EI                       ; 1f0d 1b
                db   $ff                 
                LR   A,KL                ; 1f0f 01
                NOP                      ; 1f10 2b
                LR   QL,A                ; 1f11 07
                LR   A,KU                ; 1f12 00
                LR   IS,A                ; 1f13 0b
                DS   $3                  ; 1f14 33
                CI   $0b                 ; 1f15 25 0b
                NOP                      ; 1f17 2b
                NI   $0b                 ; 1f18 21 0b
                db   $ff                 
                JMP  $0b1f               ; 1f1b 29 0b 1f
                
                LR   A,KL                ; 1f1e 01
                DS   $1                  ; 1f1f 31
                LR   H,DC                ; 1f20 11
                OUT  $ff                 ; 1f21 27 ff
                INC                      ; 1f23 1f
                SL   1                   ; 1f24 13
                NOP                      ; 1f25 2b
                LR   H,DC                ; 1f26 11
                LR   QL,A                ; 1f27 07
                LR   A,KL                ; 1f28 01
                SL   1                   ; 1f29 13
                NOP                      ; 1f2a 2b
                NI   $ff                 ; 1f2b 21 ff
                JMP  $0121               ; 1f2d 29 01 21
                
                DS   $1                  ; 1f30 31
                LR   A,KU                ; 1f31 00
                INC                      ; 1f32 1f
                LR   IS,A                ; 1f33 0b
                INC                      ; 1f34 1f
                LR   A,QL                ; 1f35 03
                DS   $1                  ; 1f36 31
                LR   QL,A                ; 1f37 07
                db   $ff                 
                OUT  $13                 ; 1f39 27 13
                NI   $21                 ; 1f3b 21 21
                LR   IS,A                ; 1f3d 0b
                NI   $ff                 ; 1f3e 21 ff
                LR   A,KL                ; 1f40 01
                NOP                      ; 1f41 2b
                db   $2f                 
                LR   IS,A                ; 1f43 0b
                NI   $07                 ; 1f44 21 07
                JMP  $0b2b               ; 1f46 29 0b 2b
                
                LR   QL,A                ; 1f49 07
                NI   $ff                 ; 1f4a 21 ff
                LR   IS,A                ; 1f4c 0b
                INC                      ; 1f4d 1f
                LR   A,QL                ; 1f4e 03
                DS   $1                  ; 1f4f 31
                LR   H,DC                ; 1f50 11
                LR   QL,A                ; 1f51 07
                LR   A,KL                ; 1f52 01
                SL   1                   ; 1f53 13
                NOP                      ; 1f54 2b
                db   $ff                 
                db   $ff                 
                LR   IS,A                ; 1f57 0b
                DS   $3                  ; 1f58 33
                AI   $ff                 ; 1f59 24 ff
                LR   IS,A                ; 1f5b 0b
                DS   $3                  ; 1f5c 33
                DS   $4                  ; 1f5d 34
                db   $ff                 
                LR   IS,A                ; 1f5f 0b
                DS   $3                  ; 1f60 33
                DS   $2                  ; 1f61 32
                db   $ff                 
                LR   IS,A                ; 1f63 0b
                DS   $3                  ; 1f64 33
                OI   $ff                 ; 1f65 22 ff
                LR   IS,A                ; 1f67 0b
                DS   $3                  ; 1f68 33
                LI   $ff                 ; 1f69 20 ff
                LR   IS,A                ; 1f6b 0b
                DS   $3                  ; 1f6c 33
                LR   J,W                 ; 1f6d 1e
                db   $ff                 
                LR   IS,A                ; 1f6f 0b
                DS   $3                  ; 1f70 33
                LR   Q,DC                ; 1f71 0e
                db   $ff                 
                JMP  A1a31               ; 1f73 29 1a 31
                
                db   $ff                 
                db   $2f                 
                LR   A,KL                ; 1f78 01
                NI   $11                 ; 1f79 21 11
                db   $ff                 
                db   $2d                 
                LR   A,KL                ; 1f7d 01
                OUT  $27                 ; 1f7e 27 27
                NI   $ff                 ; 1f80 21 ff
                JMP  $0121               ; 1f82 29 01 21
                
                DS   $1                  ; 1f85 31
                LR   A,KU                ; 1f86 00
                DS   $1                  ; 1f87 31
                LR   P,K                 ; 1f88 09
                LR   IS,A                ; 1f89 0b
                INC                      ; 1f8a 1f
                LR   A,KL                ; 1f8b 01
                LR   QL,A                ; 1f8c 07
                db   $ff                 
                LR   H,DC                ; 1f8e 11
                JMP  $0b33               ; 1f8f 29 0b 33
                
                db   $ff                 
                DS   $1                  ; 1f93 31
                LR   P,K                 ; 1f94 09
                AI   $ff                 ; 1f95 24 ff
                DS   $1                  ; 1f97 31
                LR   P,K                 ; 1f98 09
                DS   $4                  ; 1f99 34
                db   $ff                 
                DS   $1                  ; 1f9b 31
                LR   P,K                 ; 1f9c 09
                DS   $2                  ; 1f9d 32
                db   $ff                 
                DS   $1                  ; 1f9f 31
                LR   P,K                 ; 1fa0 09
                OI   $ff                 ; 1fa1 22 ff
                DS   $1                  ; 1fa3 31
                LR   P,K                 ; 1fa4 09
                LI   $ff                 ; 1fa5 20 ff
                DS   $1                  ; 1fa7 31
A1fa8:          LNK                      ; 1fa8 19
                LR   IS,A                ; 1fa9 0b
A1faa:          DS   $1                  ; 1faa 31
                SL   4                   ; 1fab 15
A1fac:          LR   A,KL                ; 1fac 01
                NOP                      ; 1fad 2b
                EI                       ; 1fae 1b
                db   $ff                 
                DS   $1                  ; 1fb0 31
                LR   H,DC                ; 1fb1 11
                NI   $19                 ; 1fb2 21 19
                db   $ff                 
                NI   $11                 ; 1fb5 21 11
                db   $2f                 
                LR   A,KL                ; 1fb8 01
                NOP                      ; 1fb9 2b
                EI                       ; 1fba 1b
                NI   $ff                 ; 1fbb 21 ff
                JMP  $0121               ; 1fbd 29 01 21
                
                DS   $1                  ; 1fc0 31
                LR   A,KU                ; 1fc1 00
                LR   H,DC                ; 1fc2 11
                NI   $21                 ; 1fc3 21 21
                LR   IS,A                ; 1fc5 0b
                LR   QL,A                ; 1fc6 07
                db   $ff                 
                LR   H,DC                ; 1fc8 11
                NI   $24                 ; 1fc9 21 24
                db   $ff                 
                LR   H,DC                ; 1fcc 11
                NI   $34                 ; 1fcd 21 34
                db   $ff                 
                LR   H,DC                ; 1fd0 11
                NI   $32                 ; 1fd1 21 32
A1fd3:          db   $ff                 
                LR   H,DC                ; 1fd4 11
                NI   $22                 ; 1fd5 21 22
A1fd7:          db   $ff                 
A1fd8:          LR   A,KU                ; 1fd8 00
                LR   KU,A                ; 1fd9 04
A1fda:          LR   QL,A                ; 1fda 07
                LR   KL,A                ; 1fdb 05
                LR   A,QU                ; 1fdc 02
A1fdd:          NOP                      ; 1fdd 2b
                LR   IS,A                ; 1fde 0b
A1fdf:          LR   QL,A                ; 1fdf 07
A1fe0:          SL   1                   ; 1fe0 13
                LR   P0,Q                ; 1fe1 0d
A1fe2:          LR   IS,A                ; 1fe2 0b
                LR   J,W                 ; 1fe3 1e
                LR   A,IS                ; 1fe4 0a
                SL   1                   ; 1fe5 13
                LR   P0,Q                ; 1fe6 0d
                NOP                      ; 1fe7 2b
A1fe8:          PI   $0813               ; 1fe8 28 08 13
A1feb:          LR   A,QL                ; 1feb 03
                LR   QL,A                ; 1fec 07
                LR   K,P                 ; 1fed 08
A1fee:          LM                       ; 1fee 16
                LR   A,KL                ; 1fef 01
                NOP                      ; 1ff0 2b
                LR   A,KU                ; 1ff1 00
                LR   A,KU                ; 1ff2 00
                LR   K,P                 ; 1ff3 08
                LR   A,KU                ; 1ff4 00
                LR   A,KU                ; 1ff5 00
                LR   A,KU                ; 1ff6 00
                LR   A,KU                ; 1ff7 00
                AS   $8                  ; 1ff8 c8
                PI   $40bc               ; 1ff9 28 40 bc
                PK                       ; 1ffc 0c
                
A1ffd:          LR   A,KU                ; 1ffd 00
                LR   A,KU                ; 1ffe 00
                LR   A,KU                ; 1fff 00
